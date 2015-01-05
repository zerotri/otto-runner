#!/bin/bash
#Helper script to start RaspiFastCamD

#We would like to write this to /var/run, but this need root privileges...
pid_file=/tmp/raspifastcamd.pid

if [ -e $pid_file ]; then
	echo "Error: The pid file $pid_file exists, looks like raspifastcamd is already running."
	echo "If this is not the case delete the file."
	exit 1
fi

output_file=${1-/home/pi/gif_temp/tmp_%04d.gif}

echo "Output will be written to $output_file"

#This will make pictures of 200x200px feel free to change.
/home/pi/fastcmd/raspifastcamd -w 640 -h 480 -e gif -o $output_file &
pid=$!

echo "Pid of raspifastcamd is $pid"

echo $pid > $pid_file

exit 0
