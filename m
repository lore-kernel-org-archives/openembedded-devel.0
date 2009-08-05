Received: from [81.169.146.182] (helo=mo-p05-ob.rzone.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hns@computer.org>) id 1MYjUA-0006bj-3q
	for openembedded-devel@openembedded.org; Wed, 05 Aug 2009 18:37:06 +0200
X-RZG-AUTH: :JGIXVUS7cutRB/49FwqZ7WcKdUCnXG6JabOfSXKWrat5gtPvz+aM
X-RZG-CLASS-ID: mo05
Received: from [192.168.2.104] (p57AE399C.dip.t-dialin.net [87.174.57.156])
	by post.strato.de (mrclete mo49) (RZmta 20.2)
	with ESMTP id Y0417dl75Fqfsj for <openembedded-devel@openembedded.org>; 
	Wed, 5 Aug 2009 18:21:26 +0200 (MEST)
Message-Id: <0D694026-B867-4633-8150-C733802AF215@computer.org>
From: "Dr. H. Nikolaus Schaller" <hns@computer.org>
To: openembedded-devel@openembedded.org
In-Reply-To: <357403ef0908050906k3b4d0f8m61a52142ed88a3b7@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Wed, 5 Aug 2009 18:21:26 +0200
References: <357403ef0908050906k3b4d0f8m61a52142ed88a3b7@mail.gmail.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: IO Error in Acer n30
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
X-List-Received-Date: Wed, 05 Aug 2009 16:37:06 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

It is quite a while that we had made an Angstrom based SD-Card for the  
Acer N30 (http://www.handheld-linux.com/wiki.php?page=Acer%20n30%20with%20Letux 
) but I remember that the SD-driver of Linux was much more critical  
with SD cards than WinCE or any other device. I.e. only some variants  
(even from single Manufacturer) did work well.

Nikolaus

Am 05.08.2009 um 18:06 schrieb Denis Klykvin:

> Greetings!
>
> Can someone help me with little problem?
>
> I try to run OE in my Acer n30. After unsucsessfull loading it into
> internal flash, i try to run OE from SD-card.

Internal Flash did not work for us as well.

> # fdisk -l /dev/sdb
>
> Disk /dev/sdb: 1995 MB, 1995440128 bytes
> 39 heads, 38 sectors/track, 2629 cylinders
> Units = cylinders of 1482 * 512 = 758784 bytes
> Disk identifier: 0x00000000
>
>   Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1               1         277      205238    b  W95 FAT32
> /dev/sdb2             278        2629     1742832   83  Linux

Looks ok.

>
> After build "bitbake helloworld-image" i have in deploy directory:
>
> Angstrom-helloworld-image-glibc-ipk-2009.X-test-20090805- 
> acern30.rootfs.tar
> Angstrom-helloworld-image-glibc-ipk-2009.X-test-20090805- 
> acern30.rootfs.jffs2
> zImage-2.6.14-r0-acern30.bin
>
> I unpack Angstrom...tar into /dev/sdb2 , and put zImage into fat  
> partition.
>
> So, in far partition I have:
> boot.exe (which kill windows and run linux)

We had used "autorun.exe" - I don't know the differences.

> zImage ( zImage-2.6.14-r0-acern30.bin )
> default.txt (sent parameters to kernel, if i'm not mistake)

Looks good.

>
> in default.txt kernel got:
> "console=tty verbose root=0xfe02 rootdelay=5 rw noinitrd"

We have used ar.txt (with autorun.exe)

# N30
set MTYPE 656
# N35
#set MTYPE 927

set KERNEL "2577\zImage"
set INITRD "2577\initrd.gz"
set RAMADDR 0x30000000
#set CMDLINE "console=tty0 console=ttySAC0,115200n8 verbose root=/dev/ 
ram0 rw keepinitrd ramdisk_size=16384 init=/linuxrc"
# rdinit=/sbin/bootchoice"
set CMDLINE "console=tty0 console=ttySAC0,115200n8 verbose root=0xfe02  
rootdelay=0 rw noinitrd init=/sbin/init"

bootlinux


>
> When I run boot.exe, it restarts to linux, trying to boot, and show
> something like:
> mmcblk0:<3>mmcblk0: error 2 transferring data
> end_request: I/O error, dev mmcblk0, sector 0
> Buffer I/O error on device mmcblk0, logical block 0
> mmcblk0: error 2 transferring data
> end_request: I/O error, dev mmcblk0, sector 0
> Buffer I/O error on device mmcblk0, logical block 0
> unable to read partition table
>
> But in card-reader SD-card works fine.
> What i must do? Try to compile another kernel?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



