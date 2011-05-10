Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJrLF-00082n-QE for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 20:07:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJrIb-0004oc-Hg for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 20:04:45 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 20:04:45 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 20:04:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 20:04:32 +0200
Message-ID: <iqbung$ak0$1@dough.gmane.org>
References: <25BE6376FCDB1A44A12A866DA493676252871F@exch02>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <25BE6376FCDB1A44A12A866DA493676252871F@exch02>
X-Enigmail-Version: 1.0.1
Subject: Re: Puzzled over Angstrom generated kernel on a new board
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
X-List-Received-Date: Tue, 10 May 2011 18:07:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 19:44, Daniel P. Smith wrote:
> Hey all,
> 
> I am working on getting OE running on the Gateworks' Laguna platform which uses the Cavium Networks Econa CNS3xxx (ARM11 MPcore) processor. The Gateworks' BSP for the Laguna is provided as a patch set to OpenWRT. I have created a kernel recipe that includes all the provided patches. The resulting kernel uImage from bitbake faults(interrupt raised or just freezes) right after decompression starts. What is puzzling is that I able to build a working kernel by manually running the build using the internal OE toolchain (note that local make and mkimage was used though). I am curious if anyone may have a hint why the bitbake generated uImage faults.
> 
> Below is the serial output from a session that just froze.
> 
> U-Boot 2008.10-mpcore-svn119 (Aug  3 2010 - 13:23:17)
> 
> CPU: Cavium Networks CNS3000
> ID Code: 410fb024 (Part number: 0xB02, Revision number: 4)
> CPU ID: 900
> I2C:   ready
> DRAM:  128 MB
> Flash: 16 MB
> Gateworks Corporation Copyright 2010
> Model Number: GW2388-SP212-A
> Manufacturer Date: 01-21-2002
> Serial #: 259328
> Net:   eth0, eth1, eth2
> Hit any key to stop autoboot:  0
> Laguna > printenv
> bootargs=console=ttyS0,115200 root=/dev/mtdblock3 rootfstype=squashfs,jffs2 noinitrd init=/etc/preinit
> bootcmd=bootm 0x10060000
> baudrate=115200
> netmask=255.255.0.0
> tftp_bsize=512
> udp_frag_size=512
> ethaddr=00:D0:12:4B:ED:24
> eth1addr=00:D0:12:4B:ED:25
> eth2addr=00:D0:12:4B:ED:26
> ethact=eth0
> bootdelay=5
> ipaddr=172.16.20.1
> serverip=172.16.20.101
> stdin=serial
> stdout=serial
> stderr=serial
> 
> Environment size: 384/131068 bytes 
> Laguna > tftpboot 0x800000 /laguna/uImage-laguna.bin
> Using eth0 device
> TFTP from server 172.16.20.101; our IP address is 172.16.20.1
> Filename '/laguna/uImage-laguna.bin'.
> Load address: 0x800000
> Loading: T T #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          ###################################################
> done
> Bytes transferred = 1589252 (184004 hex)
> Laguna > bootm 0x800000
> ## Booting kernel from Legacy Image at 00800000 ...
>    Image Name:   Angstrom/2.6.31.14/laguna
>    Created:      2011-05-05  15:32:55 UTC
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1589188 Bytes =  1.5 MB
>    Load Address: 20008000
>    Entry Point:  20008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> Uncompressing Liu
> 
> 
> Here is how I ran the manual kernel build, this was ran in the kernel work directory of my OE build.
> 
>   $ export TOOLCHAIN=/home/viscous/project/oe/build-laguna/tmp/sysroots/i686-linux/usr/armv6
>   $ export PATH=$TOOLCHAIN/bin:$PATH
>   $ export CCFLAGS="-march=armv6k -mtune=mpcore -mfpu=vfp -mfloat-abi=softfp -funit-at-a-time"
>   $ make clean
>   $ make CROSS_COMPILE="arm-angstrom-linux-gnueabi-" ARCH="arm" KBUILD_HAVE_NLS=no CONFIG_SHELL="/bin/bash" CC="arm-angstrom-linux-gnueabi-gcc" "uImage"
> 
> Here is the machine configuration,
> 
> include/tune-cns3xxx.inc
> ========================
> TARGET_CC_ARCH = "-march=armv6k -mtune=mpcore -mfpu=vfp -mfloat-abi=softfp -funit-at-a-time"
> TARGET_CC_KERNEL_ARCH = "-march=armv6k -mtune=mpcore -mfpu=vfp -mfloat-abi=softfp -funit-at-a-time"
> FEED_ARCH = "armv6"
> BASE_PACKAGE_ARCH = "armv6"
> PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
> 
> laguna.conf
> ========================
> #@TYPE: Machine
> #@NAME: Laguna
> #@DESCRIPTION: The Gateworks Laguna GW2388 Router Board.
> TARGET_ARCH = "arm"
> 
> PREFERRED_PROVIDER_virtual/kernel = "linux-cns3xxx"
> PREFERRED_VERSION_linux-cns3xxx ?= "2.6.31.14"
> 
> MACHINE_FEATURES = "kernel26 uboot pci ext2 wifi usbhost usbgadget"
> SERIAL_CONSOLE = "-L 115200 ttyS0"
> 
> CPU_FEATURES += "vfp"
> 
> require conf/machine/include/tune-cns3xxx.inc
> 
> KERNEL_IMAGETYPE = "uImage"

Try defining

UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

You probably need to change the values to match your hw, though
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyX4vMkyGM64RGpERArZFAKCEpMvnOuYBFkW49K4Y4ojj1MgMrQCgrH27
C8Xz3mKlNlPTFgDhFQhgFiA=
=hBMV
-----END PGP SIGNATURE-----



