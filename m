Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QZr0R-0004rI-4Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 23:00:07 +0200
Received: (qmail invoked by alias); 23 Jun 2011 20:56:31 -0000
Received: from p5B0A330D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.51.13]
	by mail.gmx.net (mp015) with SMTP; 23 Jun 2011 22:56:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19aWfRhqo1aRW6wcyNnyafwLmEP5AnT1zG3eBL37E
	8tWF4pOzTgbv4K
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 22:58:06 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106202316.47662.schnitzeltony@gmx.de>
	<4DFFCE1D.1070507@mentor.com> <4E010DC1.1090600@mentor.com>
In-Reply-To: <4E010DC1.1090600@mentor.com>
MIME-Version: 1.0
Message-Id: <201106232258.06911.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: udev 171 caching working propely?
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
X-List-Received-Date: Thu, 23 Jun 2011 21:00:07 -0000
X-Groupsio-MsgNum: 32813
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ej6AOP2xNef8Zcx"

--Boundary-00=_ej6AOP2xNef8Zcx
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday, June 21, 2011 11:31:45 PM Tom Rini wrote:
> On 06/20/2011 03:47 PM, Tom Rini wrote:
> > On 06/20/2011 02:16 PM, Andreas Mueller wrote:
> >> Dear OE-folks,
> >> 
> >> Working with lastest classic oe master and angstrom it seems udev
> >> caching is not
> >> 
> >> working as expected. On *every* boot I get:
> >>> Remounting root file system...
> >>> Caching udev devnodes
> >>> Populating dev cachemv: can't rename '/dev/shm/uname': No such file or
> >>> directory
> >> 
> >> I don't know why this change came in but there was a change of storage
> >> location in Tom's commit few days ago [1]. To me it seems that
> >> 
> >> 1. The files created by udev (init) get lost at remount so udev-cache
> >> (cache) is unable to find
> >> 2. Since this error occures not only at first boot the recipe's
> >> pkg_postinst_udev_append() seems never being executed. To check I added
> >> a simple echo 'foo text'
> >> in this function but 'foo text' is not found in log of first boot.
> >> 
> >> Suggestions welcome
> > 
> > Did udev change behaviors at some point then?  I've been using an older
> > udev and didn't run into that problem.  I changed from /tmp to /dev/shm
> > since we don't know that /tmp is writable at that point so we were
> > instead getting errors there.  I wonder if we should just switch to
> > re-creating the contents for that step?
> 
> I've gone with this change and some quick testing on a board.
Hi Tom,

thanks for taking care and sorry for late response - yesterday I had one of 
these nightmares at the job...

Now I tested the patch for two machines and sorry I am afraid to waste your time 
again:

First machine is overo with linux-omap-psp-2.6.32 and a hub connected to the OTG 
connector. The kernel detects USB devices at a very early boot state long before 
udev starts (see end of file 'overo' attached). udev caching seems to work 
without errors.

Second machine is tx28 with linux-2.6.38.5 (freescale imx28 based - I will send 
patches when stable). This shows different behaviours on first and all further 
boots (see udev-*boot attached). Problem is that after second boot nothing 
connected to USB is detected / working. By deleting /etc/udev/saved.* and 
rebooting all USB devices work fine and log looks similar as first boot.

Before I merged your patch I know the USB devices were working properly on tx28. 
Don't misunderstand me: I think before your patch cache was never read. Now you 
fixed this and it seems reading the cache does not work (on my half cooked 
machine only?).

I will have further investigations on this...

Andreas

--Boundary-00=_ej6AOP2xNef8Zcx
Content-Type: text/plain;
  charset="utf-8";
  name="overo"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="overo"

usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
i2c_omap i2c_omap.1: bus 1 rev3.12 at 2600 kHz
twl4030: PIH (irq 7) chaining IRQs 368..375
twl4030: power (irq 373) chaining IRQs 376..383
twl4030: gpio (irq 368) chaining IRQs 384..401
regulator: VUSB1V5: 1500 mV normal standby
regulator: VUSB1V8: 1800 mV normal standby
regulator: VUSB3V1: 3100 mV normal standby
twl4030_usb twl4030_usb: Initialized TWL4030 USB module
regulator: VMMC1: 1850 <--> 3150 mV normal standby
regulator: VDAC: 1800 mV normal standby
regulator: VPLL2: 1800 mV normal standby
i2c_omap i2c_omap.3: bus 3 rev3.12 at 400 kHz
Bluetooth: Core ver 2.15
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
cfg80211: Using static regulatory domain info
cfg80211: Regulatory domain: 00
    (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
    (2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
    (2457000 KHz - 2482000 KHz @ 20000 KHz), (600 mBi, 2000 mBm)
    (2474000 KHz - 2494000 KHz @ 20000 KHz), (600 mBi, 2000 mBm)
    (5170000 KHz - 5250000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
    (5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
cfg80211: Calling CRDA to update world regulatory domain
Switching to clocksource 32k_counter
musb_hdrc: version 6.0, musb-dma, host, debug=3D0
musb_hdrc: USB Host mode controller at fa0ab000 using DMA, IRQ 92
musb_hdrc musb_hdrc: MUSB HDRC host driver
musb_hdrc musb_hdrc: new USB bus registered, assigned bus number 1
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: MUSB HDRC host driver
usb usb1: Manufacturer: Linux 2.6.32 musb-hcd
usb usb1: SerialNumber: musb_hdrc
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
omap-iommu omap-iommu.0: isp registered
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
JFFS2 version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red Hat, Inc.
msgmni has been set to 471
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
OMAP DSS rev 2.0
OMAP DISPC rev 3.0
OMAP VENC rev 2
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
serial8250.0: ttyS0 at MMIO 0x4806a000 (irq =3D 72) is a ST16654
serial8250.1: ttyS1 at MMIO 0x4806c000 (irq =3D 73) is a ST16654
serial8250.2: ttyS2 at MMIO 0x49020000 (irq =3D 74) is a ST16654
console [ttyS2] enabled
usb 1-1: new high speed USB device using musb_hdrc and address 2
brd: module loaded
loop: module loaded
omap2-nand driver initializing
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB 1,8V =
16-bit)
cmdlinepart partition parsing not available
Creating 5 MTD partitions on "omap2-nand":
0x000000000000-0x000000080000 : "xloader"
0x000000080000-0x000000240000 : "uboot"
0x000000240000-0x000000280000 : "uboot environment"
0x000000280000-0x000000680000 : "linux"
0x000000680000-0x000010000000 : "rootfs"
smsc911x: Driver version 2008-10-21.
smsc911x-mdio: probed
eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=3D0:01, irq=3D-1)
net eth0: MAC Address: 00:15:c9:28:c2:59
smsc911x: Driver version 2008-10-21.
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 2
ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: OMAP-EHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.32 ehci_hcd
usb usb2: SerialNumber: ehci-omap.0
usb 1-1: New USB device found, idVendor=3D0409, idProduct=3D005a
usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 4 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
udc: OMAP UDC driver, version: 4 October 2004 (iso) (dma)
mice: PS/2 mouse device common for all mice
twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
twl_rtc twl_rtc: Power up reset detected.
i2c /dev entries driver
Linux video capture interface: v2.00
omap-iommu omap-iommu.0: isp: version 1.1
OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
Bluetooth: HCI UART driver ver 2.2
Bluetooth: HCI H4 protocol initialized
Bluetooth: HCI BCSP protocol initialized
Bluetooth: HCILL protocol initialized
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.21.
usbcore: registered new interface driver snd-usb-audio
usb 1-1.2: new low speed USB device using musb_hdrc and address 3
No device for DAI omap-mcbsp-dai-0
No device for DAI omap-mcbsp-dai-1
No device for DAI omap-mcbsp-dai-2
No device for DAI omap-mcbsp-dai-3
No device for DAI omap-mcbsp-dai-4
overo SoC init
asoc: twl4030 <-> omap-mcbsp-dai-0 mapping ok
ALSA device list:
  #0: overo (twl4030)
oprofile: using arm/armv7
TCP cubic registered
NET: Registered protocol family 17
NET: Registered protocol family 15
Bluetooth: L2CAP ver 2.14
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO (Voice Link) ver 0.6
Bluetooth: SCO socket layer initialized
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
ThumbEE CPU extension supported.
Power Management for TI OMAP3.
Switched to new clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz
IVA2 clocking rate: 360 MHz
SmartReflex driver initialized
usb 1-1.2: New USB device found, idVendor=3D046d, idProduct=3Dc03e
usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 1-1.2: Product: USB-PS/2 Optical Mouse
usb 1-1.2: Manufacturer: Logitech
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 1
fbcvt: 1280x1024@60: CVT Name - 1.310M4-R
input: Logitech USB-PS/2 Optical Mouse as /devices/platform/musb_hdrc/usb1/=
1-1/1-1.2/1-1.2:1.0/input/input0
generic-usb 0003:046D:C03E.0001: input: USB HID v1.10 Mouse [Logitech USB-P=
S/2 Optical Mouse] on usb-musb_hdrc-1.2/input0
Console: switching to colour frame buffer device 160x64
regulator_init_complete: incomplete constraints, leaving VDVI on
regulator_init_complete: incomplete constraints, leaving VDAC on
twl_rtc twl_rtc: setting system clock to 2000-01-01 00:00:11 UTC (946684811=
)
omap_vout omap_vout: probed for an unknown device
Waiting for root device /dev/mmcblk0p2...
usb 1-1.4: new low speed USB device using musb_hdrc and address 4
usb 1-1.4: New USB device found, idVendor=3D046a, idProduct=3D0021
usb 1-1.4: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
input: HID 046a:0021 as /devices/platform/musb_hdrc/usb1/1-1/1-1.4/1-1.4:1.=
0/input/input1
generic-usb 0003:046A:0021.0002: input: USB HID v1.11 Keyboard [HID 046a:00=
21] on usb-musb_hdrc-1.4/input0
input: HID 046a:0021 as /devices/platform/musb_hdrc/usb1/1-1/1-1.4/1-1.4:1.=
1/input/input2
generic-usb 0003:046A:0021.0003: input: USB HID v1.11 Device [HID 046a:0021=
] on usb-musb_hdrc-1.4/input1
mmc0: host does not support reading read-only switch. assuming write-enable=
.
mmc0: new high speed SDHC card at address 1234
mmcblk0: mmc0:1234 SA04G 3.68 GiB=20
 mmcblk0: p1 p2
mmc1: new SDIO card at address 0001
kjournald starting.  Commit interval 5 seconds
EXT3-fs (mmcblk0p2): warning: maximal mount count reached, running e2fsck i=
s recommended
EXT3-fs (mmcblk0p2): using internal journal
EXT3-fs (mmcblk0p2): recovery complete
EXT3-fs (mmcblk0p2): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) on device 179:2.
devtmpfs: mounted
Freeing init memory: 164K
INIT: version 2.86 booting
Please wait: booting...
NET: Registered protocol family 10
Starting udev
Root filesystem already rw, not remounting
Caching udev devnodes
Populating dev cache
ALSA: Restoring mixer settings...


--Boundary-00=_ej6AOP2xNef8Zcx
Content-Type: text/plain;
  charset="UTF-8";
  name="udev-2nd-boot"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="udev-2nd-boot"

Starting udev
udevd[558]: error: runtime directory '/run/udev' not writable, for now falling back to '/dev/.udev'
<30>udevd[559]: starting version 171
Root filesystem already rw, not remounting
Caching udev devnodes
Populating dev cache
Configuring network interfaces... eth0: Freescale FEC PHY driver [SMSC LAN8710/LAN8720] (mii_bus:phy_addr=1:00, irq=-1)
eth0      no wireless extensions.


--Boundary-00=_ej6AOP2xNef8Zcx
Content-Type: text/plain;
  charset="UTF-8";
  name="udev-1st-boot"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="udev-1st-boot"

usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
...
Waiting for root device /dev/mmcblk0p3...
mmc0: host does not support reading read-only switch. assuming write-enable.
mmc0: new SD card at address 88f7
mmcblk0: mmc0:88f7 SU01G 942 MiB 
 mmcblk0: p1 p2 p3
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (mmcblk0p3): using internal journal
EXT3-fs (mmcblk0p3): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) on device 179:3.
devtmpfs: mounted
Freeing init memory: 420K
INIT: version 2.86 booting
Please wait: booting...
Starting udev
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci_hcd: block sizes: qh 60 qtd 96 itd 160 sitd 96
mxc-ehci mxc-ehci.0: initializing i.MX USB Controller
otg_get_transceiver: mxc-ehci.0 msm_hsusb
mxs-usbphy mxs-usbphy.0: starting host
mxc-ehci mxc-ehci.0: Freescale On-Chip EHCI Host Controller
drivers/usb/core/inode.c: creating file 'devices'
drivers/usb/core/inode.c: creating file '001'
...
... lots of drivers usb / hub ... messages
...
generic-usb 0003:046A:0021.0003: input: USB HID v1.11 Device [HID 046a:0021] on usb-mxc-ehci.1-1.4/input1
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
Root filesystem already rw, not remounting
Caching udev devnodes
Populating dev cache
Configuring update-modules.
...



--Boundary-00=_ej6AOP2xNef8Zcx--
