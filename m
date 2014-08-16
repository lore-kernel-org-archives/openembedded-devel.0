Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BF117705E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 13:17:50 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 312F233426
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 15:17:50 +0200 (CEST)
Message-ID: <53EF59FE.7040709@pseudoterminal.org>
Date: Sat, 16 Aug 2014 15:17:50 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Is core-image-x11 broken?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Aug 2014 13:17:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have experienced very strange issues with core-image-x11 .
Until recently, the image worked fine. I could boot with it, and got a 
fullscreen matchbox-terminal on screen.

I did a fresh build from scratch, with yesterday's master state of poky. 
core-image-x11 didn't boot.
It turns out that sysvinit wasn't on the image! So I added it 
explicitely by using IMAGE_INSTALL_append .
This helped, but now I see this:

/etc/init.d/rcS: line 17: mount: command not found
/etc/rcS.d/S00psplash.sh: line 10: /proc/cmdline: No such file or directory
/etc/rcS.d/S00psplash.sh: line 21: mount: command not found
INIT: Entering runlevel: 5
cat: /proc/cmdline: No such file or directory
cat: /proc/cmdline: No such file or directory
Starting Xserver
[    3.442068] random: nonblocking pool is initialized
/etc/X11/xserver-common: line 36: grep: command not found
/etc/X11/xserver-common: line 37: awk: command not found
/etc/X11/xserver-common: line 38: awk: command not found
/etc/X11/xserver-common: line 39: awk: command not found
/etc/X11/functions: line 10: /proc/cpuinfo: No such file or directory
/etc/rc5.d/S01xserver-nodm: line 31: which: command not found
Starting system message bus: /etc/rc5.d/S02dbus-1: line 63: 
start-stop-daemon: command not found
dbus.
/etc/rc5.d/S10dropbear: line 32: /proc/mounts: No such file or directory
Starting Dropbear SSH server: Generating key, this may take a while...
Public key portion is:
ssh-rsa 
AAAAB3NzaC1yc2EAAAADAQABAAABAQC9JkKHluBboO77TPybTGN/cBcwDmFWvcCcRPhauXT4af3ycFt+eRwv2md3n6PNDAXHlZioH0uCSQBPoZSJoOnXn06BgU3BuhWlN/HgVDE3G8OKHhcB87Z7lodKhhSKIoupolYcQGtTXC+rOt84hqxreHln6Pw5R8ZNYbg6zBcesVs4v3zR+DcaBcOmt4XjQkmDDRvQgp1WfOWHAzuXJVNyE27yTLYuIOj0Fe1HhD)
Fingerprint: md5 90:68:ab:32:67:63:37:8b:3f:08:fc:72:1a:f2:0e:42
/etc/rc5.d/S10dropbear: line 84: start-stop-daemon: command not found
/etc/rc5.d/S99stop-bootlogd: line 64: start-stop-daemon: command not found
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"


#Why are all these files missing? None of this happens with 
core-image-base .

