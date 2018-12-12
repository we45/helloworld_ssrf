#!/bin/bash
sudo yum -y update
sudo yum-config-manager --enable epel
sudo yum -y install git python-pip supervisor
sudo curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
sudo mkdir /app
cd /app/
sudo cp -r /tmp/helloworld /app/
sudo chmod +x /app/helloworld/app.py
sudo ln -s /usr/local/bin/pip /bin/pip
sudo pip install -r /app/helloworld/requirements.txt
sleep 10
sudo nohup python /app/helloworld/app.py &
echo "Python Service is running now"
sudo ps ax | grep app.py
