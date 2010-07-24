Received: from bay0-omc4-s8.bay0.hotmail.com ([65.54.190.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OcgbR-0004x7-73
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 17:25:33 +0200
Received: from BAY127-W10 ([65.54.190.199]) by bay0-omc4-s8.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Sat, 24 Jul 2010 08:25:13 -0700
Message-ID: <BAY127-W10E6C2CDE8C1012D38BAE0D8A40@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Sat, 24 Jul 2010 21:25:13 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Jul 2010 15:25:13.0506 (UTC)
	FILETIME=[6953C820:01CB2B44]
X-SA-Exim-Connect-IP: 65.54.190.210
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Kerniel issue on DM6446
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
X-List-Received-Date: Sat, 24 Jul 2010 15:25:33 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable





Till now I was using a kernel on Dm6446 which was  cross compiled by ELDK a=
nd rootfile system is  OpenEmbedded generated . Now when I write Openembedd=
ed generated kernel to NAND flash it is not working and the log messages an=
d u-boot environment are shown below=2C Where might be the problem.? Proble=
m with ELDK compiled kernel was that it was not configured to be run OProfi=
le.=20

Saleh

U-Boot 2009.06-rc2 (Jul 05 2010 - 13:55:35)                                =
    =20
                                                                           =
    =20
I2C:   ready                                                               =
    =20
DRAM:  256 MB                                                              =
    =20
NAND:  256 MiB                                                             =
    =20
In:    serial                                                              =
    =20
Out:   serial                                                              =
    =20
Err:   serial                                                              =
    =20
ARM Clock: 297MHz                                                          =
    =20
DDR Clock: 162MHz                                                          =
    =20
Read from EEPROM @ 0x50 failed                                             =
    =20
Ethernet PHY: GENERIC @ 0x1f                                               =
    =20
Hit any key to stop autoboot:  0                                           =
    =20
U-Boot > printenv                                                          =
    =20
bootdelay=3D3                                                              =
      =20
baudrate=3D115200                                                          =
      =20
ethaddr=3D00:1c:c6:0a:12:65                                                =
      =20
setboot=3Dsetenv bootargs $(bootargs) video=3Ddm64xxfb:output=3D$(videostd)=
          =20
loadaddr=3D0x80700000                                                      =
      =20
filesize=3D18D880                                                          =
      =20
fileaddr=3D80700000                                                        =
      =20
gatewayip=3D172.16.0.10                                                    =
      =20
netmask=3D255.255.240.0                                                    =
      =20
ipaddr=3D172.16.0.90                                                       =
      =20
bootcmd=3Dnboot 0x80000000 0 0x120000=3Bbootm                              =
        =20
bootfile=3D/OC/uImage_ossie                                                =
      =20
serverip=3D172.16.2.89                                                     =
      =20
booargs=3Dmem=3D120M noinitrd console=3DttyS0=2C115200n8 root=3D/dev/mt-   =
              =20
dblock2 rootfstype=3Djffs2                                                 =
      =20
bootargs=3Dmem=3D120M noinitrd console=3DttyS0=2C115200n8 root=3D/dev/mt-  =
              =20
dblock2 rootfstype=3Djffs2                                                 =
      =20
stdin=3Dserial                                                             =
      =20
stdout=3Dserial                                                            =
      =20
stderr=3Dserial                                                            =
      =20
videostd=3Dntsc                                                            =
      =20
ver=3DU-Boot 2009.06-rc2 (Jul 05 2010 - 13:55:35)                          =
      =20
                                                                           =
    =20
Environment size: 610/16380 bytes                                          =
    =20
U-Boot > boot                                                              =
    =20
                                                                           =
    =20
Loading from NAND 256MiB 1=2C8V 8-bit=2C offset 0x120000                   =
        =20
   Image Name:   Angstrom/2.6.31+2.6.32-rc2-r34+g                          =
    =20
   Image Type:   ARM Linux Kernel Image (uncompressed)                     =
    =20
   Data Size:    1888880 Bytes =3D  1.8 MB                                 =
      =20
   Load Address: 80008000                                                  =
    =20
   Entry Point:  80008000                                                  =
    =20
## Booting kernel from Legacy Image at 80000000 ...                        =
    =20
   Image Name:   Angstrom/2.6.31+2.6.32-rc2-r34+g                          =
    =20
   Image Type:   ARM Linux Kernel Image (uncompressed)                     =
    =20
   Data Size:    1888880 Bytes =3D  1.8 MB                                 =
      =20
   Load Address: 80008000                                                  =
    =20
   Entry Point:  80008000                                                  =
    =20
   Verifying Checksum ... OK                                               =
    =20
   Loading Kernel Image ... OK                                             =
    =20
OK                                                                         =
    =20
                                                                           =
    =20
Starting kernel ...                                                        =
    =20
                                                                           =
    =20
Uncompressing Linux........................................................=
.....
Linux version 2.6.32-rc2-davinci1 (Saleh@localhost.localdomain) (gcc versio=
n 4.0
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ)=2C cr=3D00053177          =
        =20
CPU: VIVT data cache=2C VIVT instruction cache                             =
      =20
Machine: DaVinci DM644x EVM                                                =
    =20
Memory policy: ECC disabled=2C Data cache writeback                        =
      =20
DaVinci dm6446a variant 0x1                                                =
    =20
Built 1 zonelists in Zone order=2C mobility grouping on.  Total pages: 3048=
0     =20
Kernel command line: mem=3D120M noinitrd console=3DttyS0=2C115200n8 root=3D=
/dev/mt-    =20
dblock2 rootfstype=3Djffs2                                                 =
      =20
PID hash table entries: 512 (order: -1=2C 2048 bytes)                      =
      =20
Dentry cache hash table entries: 16384 (order: 4=2C 65536 bytes)           =
      =20
Inode-cache hash table entries: 8192 (order: 3=2C 32768 bytes)             =
      =20
Memory: 120MB =3D 120MB total                                              =
      =20
Memory: 117588KB available (3540K code=2C 320K data=2C 128K init=2C 0K high=
mem)      =20
SLUB: Genslabs=3D11=2C HWalign=3D32=2C Order=3D0-3=2C MinObjects=3D0=2C CPU=
s=3D1=2C Nodes=3D1        =20
Hierarchical RCU implementation.                                           =
    =20
NR_IRQS:245                                                                =
    =20
Console: colour dummy device 80x30                                         =
    =20
Calibrating delay loop... 147.86 BogoMIPS (lpj=3D739328)                   =
      =20
Mount-cache hash table entries: 512                                        =
    =20
CPU: Testing write buffer coherency: ok                                    =
    =20
devtmpfs: initialized                                                      =
    =20
DaVinci: 71 gpio irqs                                                      =
    =20
NET: Registered protocol family 16                                         =
    =20
bio: create slab <bio-0> at 0                                              =
    =20
SCSI subsystem initialized                                                 =
    =20
usbcore: registered new interface driver usbfs                             =
    =20
usbcore: registered new interface driver hub                               =
    =20
usbcore: registered new device driver usb                                  =
    =20
pcf857x: probe of 1-0038 failed with error -121                            =
    =20
pcf857x: probe of 1-0039 failed with error -121                            =
    =20
pcf857x: probe of 1-003a failed with error -121                            =
    =20
vpss vpss: dm644x_vpss vpss probed                                         =
    =20
vpss vpss: dm644x_vpss vpss probe success                                  =
    =20
ch0 default output "COMPOSITE"=2C mode "NTSC"                              =
      =20
VPBE Encoder Initialized                                                   =
    =20
LogicPD encoder initialized                                                =
    =20
Switching to clocksource timer0_1                                          =
    =20
musb_hdrc: version 6.0=2C cppi-dma=2C host=2C debug=3D0                    =
            =20
NET: Registered protocol family 2                                          =
    =20
IP route cache hash table entries: 1024 (order: 0=2C 4096 bytes)           =
      =20
TCP established hash table entries: 4096 (order: 3=2C 32768 bytes)         =
      =20
TCP bind hash table entries: 4096 (order: 2=2C 16384 bytes)                =
      =20
TCP: Hash tables configured (established 4096 bind 4096)                   =
    =20
TCP reno registered                                                        =
    =20
NET: Registered protocol family 1                                          =
    =20
RPC: Registered udp transport module.                                      =
    =20
RPC: Registered tcp transport module.                                      =
    =20
RPC: Registered tcp NFSv4.1 backchannel transport module.                  =
    =20
msgmni has been set to 229                                                 =
    =20
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)       =
    =20
io scheduler noop registered                                               =
    =20
io scheduler anticipatory registered (default)                             =
    =20
davincifb davincifb: dm_osd0_fb: 720x480x16@0=2C0 with framebuffer size 675=
KB    =20
davincifb davincifb: dm_vid0_fb: 0x0x16@0=2C0 with framebuffer size 1020KB =
      =20
davincifb davincifb: dm_osd1_fb: 720x480x4@0=2C0 with framebuffer size 675K=
B     =20
davincifb davincifb: dm_vid1_fb: 0x0x16@0=2C0 with framebuffer size 1020KB =
      =20
davincifb davincifb.0: dm_osd0_fb: Failed to obtain ownership of OSD window=
.   =20
Serial: 8250/16550 driver=2C 3 ports=2C IRQ sharing disabled               =
        =20
serial8250.0: ttyS0 at MMIO 0x1c20000 (irq =3D 40) is a 16550A             =
      =20
console [ttyS0] enabled                                                    =
    =20
serial8250 serial8250.0: unable to register port at index 1 (IO0 MEM1c20400=
 IRQ2
serial8250 serial8250.0: unable to register port at index 2 (IO0 MEM1c20800=
 IRQ2
brd: module loaded                                                         =
    =20
at24 1-0050: 32768 byte 24c256 EEPROM (writable)                           =
    =20
Uniform Multi-Platform E-IDE driver                                        =
    =20
ide-gd driver 1.18                                                         =
    =20
    ide0: MMIO-DMA                                                         =
    =20
ide0: no devices on the port                                               =
    =20
ide0 at 0xfec661f0-0xfec661f7=2C0xfec663f6 on irq 22                       =
      =20
console [netcon0] enabled                                                  =
    =20
netconsole: network logging started                                        =
    =20
Initializing USB Mass Storage driver...                                    =
    =20
usbcore: registered new interface driver usb-storage                       =
    =20
USB Mass Storage support registered.                                       =
    =20
usbcore: registered new interface driver usbtest                           =
    =20
i2c /dev entries driver                                                    =
    =20
Linux video capture interface: v2.00                                       =
    =20
vpfe_init                                                                  =
    =20
vpfe-capture: vpss clock vpss_master enabled                               =
    =20
vpfe-capture: vpss clock vpss_slave enabled                                =
    =20
vpfe-capture vpfe-capture: v4l2 device registered                          =
    =20
vpfe-capture vpfe-capture: video device registered                         =
    =20
tvp514x 1-005d: tvp514x 1-005d decoder driver registered !!                =
    =20
vpfe-capture vpfe-capture: v4l2 sub device tvp514x registered              =
    =20
vpfe_register_ccdc_device: DM6446 CCDC                                     =
    =20
DM6446 CCDC is registered with vpfe.                                       =
    =20
Trying to register davinci display video device.                           =
    =20
layer=3Dc61c0c00=2Clayer->video_dev=3Dc61c0d70                             =
          =20
Trying to register davinci display video device.                           =
    =20
layer=3Dc61c0e00=2Clayer->video_dev=3Dc61c0f70                             =
          =20
davinci_init:DaVinci V4L2 Display Driver V1.0 loaded                       =
    =20
watchdog watchdog: heartbeat 60 sec                                        =
    =20
davinci_mmc davinci_mmc.0: Using DMA=2C 4-bit mode                         =
      =20
usbcore: registered new interface driver usbhid                            =
    =20
usbhid: v2.6:USB HID core driver                                           =
    =20
Advanced Linux Sound Architecture Driver Version 1.0.21.                   =
    =20
No device for DAI tlv320aic3x                                              =
    =20
No device for DAI davinci-i2s                                              =
    =20
asoc: tlv320aic3x <-> davinci-i2s mapping ok                               =
    =20
ALSA device list:                                                          =
    =20
  #0: DaVinci EVM (tlv320aic3x)                                            =
    =20
TCP cubic registered                                                       =
    =20
NET: Registered protocol family 17                                         =
    =20
Clocks: disable unused uart1                                               =
    =20
Clocks: disable unused uart2                                               =
    =20
Clocks: disable unused emac                                                =
    =20
Clocks: disable unused spi                                                 =
    =20
Clocks: disable unused usb                                                 =
    =20
Clocks: disable unused vlynq                                               =
    =20
Clocks: disable unused pwm0                                                =
    =20
Clocks: disable unused pwm1                                                =
    =20
Clocks: disable unused pwm2                                                =
    =20
Clocks: disable unused timer1                                              =
    =20
davinci_emac_probe: using random MAC addr: 3a:50:b1:c7:c2:8f               =
    =20
emac-mii: probed                                                           =
    =20
Root-NFS: No NFS server available=2C giving up.                            =
      =20
VFS: Unable to mount root fs via NFS=2C trying floppy.                     =
      =20
VFS: Cannot open root device "mt-" or unknown-block(2=2C0)                 =
      =20
Please append a correct "root=3D" boot option=3B here are the available par=
titions:=20
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(2=
=2C0) =20
Backtrace:                                                                 =
    =20
[<c002c7b0>] (dump_backtrace+0x0/0x10c) from [<c02c5680>] (dump_stack+0x18/=
0x1c)
 r7:00008000 r6:c6012000 r5:c0024850 r4:c6025f60                           =
    =20
[<c02c5668>] (dump_stack+0x0/0x1c) from [<c02c56c8>] (panic+0x44/0x128)    =
    =20
[<c02c5684>] (panic+0x0/0x128) from [<c0009000>] (mount_block_root+0x1e4/0x=
22c)=20
 r3:00000001 r2:c6024000 r1:c6025f60 r0:c03466cd                           =
    =20
[<c0008e1c>] (mount_block_root+0x0/0x22c) from [<c000910c>] (mount_root+0xc=
4/0x)
[<c0009048>] (mount_root+0x0/0xfc) from [<c00092b0>] (prepare_namespace+0x1=
6c/0)
 r5:c0024808 r4:c03c3cb8                                                   =
    =20
[<c0009144>] (prepare_namespace+0x0/0x1dc) from [<c00084b0>] (kernel_init+0=
xe0/)
 r5:c0023a04 r4:c03c3a98                                                   =
    =20
[<c00083d0>] (kernel_init+0x0/0x114) from [<c00414dc>] (do_exit+0x0/0x664) =
    =20
 r5:00000000 r4:00000000                                                   =
    =20

 		 	   		 =20
Hotmail: Free=2C trusted and rich email service. Get it now. 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

