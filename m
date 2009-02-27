Received: from [85.37.16.8] (helo=smtpout30.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1Ld12k-0003zd-F1
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 12:38:21 +0100
Received: from FBCMFE02B14.fbc.local ([192.168.30.160]) by
	smtpout30.attiva.biz with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Feb 2009 12:34:51 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B14.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Feb 2009 12:34:50 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: Lista Openembedded <openembedded-devel@openembedded.org>
Date: Fri, 27 Feb 2009 12:37:32 +0100
Message-Id: <1235734652.7210.12.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 27 Feb 2009 11:34:51.0061 (UTC)
	FILETIME=[67020E50:01C998CF]
Subject: Bootloader problems
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
X-List-Received-Date: Fri, 27 Feb 2009 11:38:56 -0000
X-List-Received-Date: Fri, 27 Feb 2009 11:38:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,
I have problems in generating a bootable device (CF)
During the setup the CF is connected to the host via an USB adapter.

These are the steps I do:

# fdisk /dev/sdb
   create a linux partition /dev/sdb1 and activate it

# mkfs.ext3 /dev/sdb1

# mount -t ext3 /dev/sdb1 /media/disk

# cd /media/disk
# tar
-xvf /home/paolo/oe/stuff/build/gpe-image/deploy/glibc/images/i586-generic/gpe-image-i586-generic.tar

and the filesystem is correctly on the CF

# cd boot
# mkdir grub
# cd grub
# < copy of grub files>
# grub ...

the menu.lst contains

title		OpenEmbedded Linux (hda1)
root		(hd0,0)
kernel		/boot/bzImage-2.6.21 root=/dev/hda1 ro
quiet


The system boots, but when the filesystem is created, the kernel crashes
with the message:

VFS: Cannot open root device "(hd0,0)" or unknown-block(0,0)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: unable to mount root fs or
unknown-block(0,0)

but I don't understand what I have to do...

Thanks in advance
Paolo




