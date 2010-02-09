Received: from smtp-out108.alice.it ([85.37.17.108])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nettc-00023a-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:29:11 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out108.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Feb 2010 18:25:32 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Feb 2010 18:25:30 +0100
Received: from [192.168.1.116] ([79.21.48.56]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Feb 2010 18:25:29 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 09 Feb 2010 18:25:22 +0100
Message-Id: <1265736322.3731.23.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 09 Feb 2010 17:25:30.0121 (UTC)
	FILETIME=[E09B1790:01CAA9AC]
X-SA-Exim-Connect-IP: 85.37.17.108
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: oe's GDB 7.0 doesn't load symbols for me(csl does)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2010 17:29:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
Here's my setup:

htcdream.conf
shr.conf
org.openembedded.dev branch at afc0667965549d0ac1cc5cd93a30c2aa8e47dc28
bitbake gdb-cross

I did the following:
the following 3 devices are implicated:
*1 build laptop
*1 desktop
*1 htcdream
The htcdream is connected to the desktop which is on the same network
than the laptop.

Openssh(not dropbear) is runing on the htcdream.
 
So I do that on the target:
gdbserver 127.0.0.1:8022 Xorg

And that on the desktop:
iptables -t nat -A PREROUTING -p tcp --dport 22 -i wlan0 -j DNAT --to
192.168.0.202:22

And that on the laptop:
# sshfs root@desktop:/ /mnt/NFS
# source
~/oetmp/deploy/addons/arm-oe-linux-gnueabi-shr-htcdream-devshell
# ./arm-oe-linux-gnueabi-gdb
[OE::arm-oe-linux-gnueabi-shr-htcdream]:~$ arm-oe-linux-gnueabi-gdb
GNU gdb (GDB) 7.0
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying"
and "show warranty" for details.
This GDB was configured as "--host=i686-linux
--target=arm-oe-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) set sysroot /mnt/NFS
(gdb) file /mnt/NFS/usr/bin/Xorg 
Reading symbols from /mnt/NFS/usr/bin/Xorg...Reading symbols
from /mnt/NFS/usr/bin/.debug/Xorg...done.
(no debugging symbols found)...done.


And on my desktop with codesourcey:

# sshfs root@desktop:/mnt/embedded_rootfs
# cd .../arm-2009q3/bin
# ./arm-none-linux-gnueabi-gdb
GNU gdb (Sourcery G++ Lite 2009q3-67) 6.8.50.20090630-cvs
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying"
and "show warranty" for details.
This GDB was configured as "--host=i686-pc-linux-gnu
--target=arm-none-linux-gnueabi".
For bug reporting instructions, please see:
<https://support.codesourcery.com/GNUToolchain/>.
(gdb) set sysroot /mnt/embedded_rootfs/
(gdb) file /mnt/embedded_rootfs/usr/bin/Xorg 
Reading symbols from /mnt/embedded_rootfs/usr/bin/Xorg...Reading symbols
from /mnt/embedded_rootfs/usr/bin/.debug/Xorg...done.
done.

Note that codesourcey corrupt the frames but not the oe gdb
so oe's gdb is usable...in assembly...

Denis.






