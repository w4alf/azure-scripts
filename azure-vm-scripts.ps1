#create my vm Ubuntu
az vm create \
  --resource-group VM_Bravo_Cluster \
  --location westus \
  --name SampleVM \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys \
  --verbose
  
  # secure shell - public IP
  ssh azureuser@40.78.26.XXX
  
  #list images that are  in locations westus
  az vm image list --location westus --output table
  
  #list vm sizes for eastus
  az vm list-sizes --location eastus --output table
  
  
  	#list vm resize options
	az vm list-vm-resize-options \
     --resource-group VM_Bravo_Cluster \
    --name SampleVM \
    --output table
  
  #resize to 2cores and 8gb mem
  az vm resize \
    --resource-group [sandbox resource group name] \
    --name SampleVM \
    --size Standard_D2s_v3
  
  #show admin username
  az vm show \
    --resource-group [sandbox resource group name] \
    --name SampleVM \
    --query "osProfile.adminUsername"
  
  #start virtual machine
  az vm start \
    --name SampleVM \
    --resource-group VM_Bravo_Cluster
	
	ssh azureuser@40.78.26.XXX
	
	#won't work port 80 not open
	curl -m 10 40.78.26.XXX
	
	#opens port 80
	az vm open-port \
    --port 80 \
    --resource-group VM_Bravo_Cluster \
    --name SampleVM
	

	
	
	
	
