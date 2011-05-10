Received: from exch01.praxiseng.com ([71.16.158.232])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dpsmith@praxiseng.com>) id 1QJr2O-0007ER-DH
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 19:48:00 +0200
Received: from exch02.praxislan01.com ([192.168.200.77]) by
	exch01.praxiseng.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 10 May 2011 13:44:08 -0400
Received: from exch02.praxislan01.com ([127.0.0.1]) by exch02 ([127.0.0.1])
	with mapi id 14.01.0270.001; Tue, 10 May 2011 13:44:08 -0400
From: "Daniel P. Smith" <dpsmith@praxiseng.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Puzzled over Angstrom generated kernel on a new board
Thread-Index: AcwPOdq8iN+rJmT4TLOg4+SvaqByOg==
Date: Tue, 10 May 2011 17:44:05 +0000
Message-ID: <25BE6376FCDB1A44A12A866DA493676252871F@exch02>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.201.28]
MIME-Version: 1.0
X-OriginalArrivalTime: 10 May 2011 17:44:08.0549 (UTC)
	FILETIME=[DD31E950:01CC0F39]
Subject: Puzzled over Angstrom generated kernel on a new board
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
X-List-Received-Date: Tue, 10 May 2011 17:48:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey all,

I am working on getting OE running on the Gateworks' Laguna platform which =
uses the Cavium Networks Econa CNS3xxx (ARM11 MPcore) processor. The Gatewo=
rks' BSP for the Laguna is provided as a patch set to OpenWRT. I have creat=
ed a kernel recipe that includes all the provided patches. The resulting ke=
rnel uImage from bitbake faults(interrupt raised or just freezes) right aft=
er decompression starts. What is puzzling is that I able to build a working=
 kernel by manually running the build using the internal OE toolchain (note=
 that local make and mkimage was used though). I am curious if anyone may h=
ave a hint why the bitbake generated uImage faults.

Below is the serial output from a session that just froze.

U-Boot 2008.10-mpcore-svn119 (Aug  3 2010 - 13:23:17)

CPU: Cavium Networks CNS3000
ID Code: 410fb024 (Part number: 0xB02, Revision number: 4)
CPU ID: 900
I2C:   ready
DRAM:  128 MB
Flash: 16 MB
Gateworks Corporation Copyright 2010
Model Number: GW2388-SP212-A
Manufacturer Date: 01-21-2002
Serial #: 259328
Net:   eth0, eth1, eth2
Hit any key to stop autoboot:  0
Laguna > printenv
bootargs=3Dconsole=3DttyS0,115200 root=3D/dev/mtdblock3 rootfstype=3Dsquash=
fs,jffs2 noinitrd init=3D/etc/preinit
bootcmd=3Dbootm 0x10060000
baudrate=3D115200
netmask=3D255.255.0.0
tftp_bsize=3D512
udp_frag_size=3D512
ethaddr=3D00:D0:12:4B:ED:24
eth1addr=3D00:D0:12:4B:ED:25
eth2addr=3D00:D0:12:4B:ED:26
ethact=3Deth0
bootdelay=3D5
ipaddr=3D172.16.20.1
serverip=3D172.16.20.101
stdin=3Dserial
stdout=3Dserial
stderr=3Dserial

Environment size: 384/131068 bytes=20
Laguna > tftpboot 0x800000 /laguna/uImage-laguna.bin
Using eth0 device
TFTP from server 172.16.20.101; our IP address is 172.16.20.1
Filename '/laguna/uImage-laguna.bin'.
Load address: 0x800000
Loading: T T ##############################################################=
###
         #################################################################
         #################################################################
         #################################################################
         ###################################################
done
Bytes transferred =3D 1589252 (184004 hex)
Laguna > bootm 0x800000
## Booting kernel from Legacy Image at 00800000 ...
   Image Name:   Angstrom/2.6.31.14/laguna
   Created:      2011-05-05  15:32:55 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1589188 Bytes =3D  1.5 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Liu


Here is how I ran the manual kernel build, this was ran in the kernel work =
directory of my OE build.

  $ export TOOLCHAIN=3D/home/viscous/project/oe/build-laguna/tmp/sysroots/i=
686-linux/usr/armv6
  $ export PATH=3D$TOOLCHAIN/bin:$PATH
  $ export CCFLAGS=3D"-march=3Darmv6k -mtune=3Dmpcore -mfpu=3Dvfp -mfloat-a=
bi=3Dsoftfp -funit-at-a-time"
  $ make clean
  $ make CROSS_COMPILE=3D"arm-angstrom-linux-gnueabi-" ARCH=3D"arm" KBUILD_=
HAVE_NLS=3Dno CONFIG_SHELL=3D"/bin/bash" CC=3D"arm-angstrom-linux-gnueabi-g=
cc" "uImage"

Here is the machine configuration,

include/tune-cns3xxx.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TARGET_CC_ARCH =3D "-march=3Darmv6k -mtune=3Dmpcore -mfpu=3Dvfp -mfloat-abi=
=3Dsoftfp -funit-at-a-time"
TARGET_CC_KERNEL_ARCH =3D "-march=3Darmv6k -mtune=3Dmpcore -mfpu=3Dvfp -mfl=
oat-abi=3Dsoftfp -funit-at-a-time"
FEED_ARCH =3D "armv6"
BASE_PACKAGE_ARCH =3D "armv6"
PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te armv6"

laguna.conf
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#@TYPE: Machine
#@NAME: Laguna
#@DESCRIPTION: The Gateworks Laguna GW2388 Router Board.
TARGET_ARCH =3D "arm"

PREFERRED_PROVIDER_virtual/kernel =3D "linux-cns3xxx"
PREFERRED_VERSION_linux-cns3xxx ?=3D "2.6.31.14"

MACHINE_FEATURES =3D "kernel26 uboot pci ext2 wifi usbhost usbgadget"
SERIAL_CONSOLE =3D "-L 115200 ttyS0"

CPU_FEATURES +=3D "vfp"

require conf/machine/include/tune-cns3xxx.inc

KERNEL_IMAGETYPE =3D "uImage"


V/r,
Daniel P. Smith



