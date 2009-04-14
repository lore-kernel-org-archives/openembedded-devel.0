Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1LtiEN-0005VF-35
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 15:00:23 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1637266yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=5HambF7pY3STHZeR3ABF/2oJMquoKb+N0KUV3+VvNJk=;
	b=RgmFskWrUMfSZGfU8xxaoNMaWsR7r4qbBE5Q+VQydvXLa5W6XvHtO9zdJYf040DwCZ
	oIyC3dEoERE48dnGnOMKT/1NzhSqZXVm8AsdVnN5i7xDjvu0Y2BHrLsI5e1RJqfCQTZb
	D7tEaUUkqeOFolbgv5Mf+Mrqn4bQJwjUIO3FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=OVh0mMadDK38e0eFh0/qr1Kl2cqEvNwvnsPI3HIX991s9BaxtvmDMi7kyHLX26P2G7
	UyjGm0YyIzLn0oNGoJKUX16rTM5eExRE5FNyZXLJqbLFYgLDZvxq5PqdeQJFJOJWDRUj
	vFt3/NbhwxeFb1eofRhhjE7AvQBpJG8Twt2es=
MIME-Version: 1.0
Received: by 10.231.17.74 with SMTP id r10mr1805691iba.13.1239713733873; Tue, 
	14 Apr 2009 05:55:33 -0700 (PDT)
Date: Tue, 14 Apr 2009 14:55:33 +0200
Message-ID: <ade1bdc0904140555w37f51e9m1a81f951bd68cc8a@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.156
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: 2.6.28 pm kernel for beagleboard: "Turning off lcd and digit"
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
X-List-Received-Date: Tue, 14 Apr 2009 13:00:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I did several reboot and I powered off the at least one minute.
u-boot splash screen always appear.
then I have a re-sync
720p appear in pm kernel modified to add hd720 format.
when X starts I have so many errors and the lcd becomes black

linux-omap-pm-2.6.28-pm3+gitrfe30e75b8c0b91b259fcea781b859e594ba21ae9-r7

set bootargs 'console=3DttyS2,115200n8 root=3D/dev/mmcblk0p2 rootwait rw
init=3D/init omapfb.video_mode=3Dhd720 omapfb.debug=3Dy
omap-dss.def_disp=3Dlcd omap-dss.debug=3Dy'

Uncompressing Linux........................................................=
...........................................................................=
.........................................
done, booting the kernel.
Linux version 2.6.28-omap1 (recalcati@recalcati-laptop) (gcc version
4.3.1 (GCC) ) #5 Tue Apr 14 14:24:50 CEST 2009
CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=3D10c5387f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3 Beagle Board
Memory policy: ECC disabled, Data cache writeback
OMAP3430 ES3.0
SRAM: Mapped pa 0x40200000 to va 0xd7000000 size: 0x100000
Reserving 15728640 bytes SDRAM for VRAM
Built 1 zonelists in Zone order, mobility grouping on. =C2=A0Total pages: 3=
2512
Kernel command line: console=3DttyS2,115200n8 root=3D/dev/mmcblk0p2
rootwait rw init=3D/init omapfb.video_mode=3Dhd720 omapfb.debug=3Dy
omap-dss.def_disp=3Dlcd omap-dss.debug=3Dy
Test message for linux-pm
Clocking rate (Crystal/DPLL/ARM core): 26.0/332/500 MHz
Reprogramming SDRC
GPMC revision 5.0
IRQ: Found an INTC at 0xd8200000 (revision 4.0) with 96 interrupts
Total of 96 interrupts on 1 active controller
OMAP34xx GPIO hardware version 2.5
PID hash table entries: 512 (order: 9, 2048 bytes)
OMAP clockevent source: GPTIMER12 at 32768 Hz
Console: colour dummy device 80x30
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 128MB =3D 128MB total
Memory: 108784KB available (4956K code, 445K data, 200K init)
Calibrating delay loop... 497.82 BogoMIPS (lpj=3D1941504)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 736 bytes
regulator: core version 0.5
NET: Registered protocol family 16
Found NAND on CS0
Registering NAND on CS0
OMAP DMA hardware revision 4.0
USB: No board-specific platform config found
OMAP DSS rev 2.0
OMAP DISPC rev 3.0
OMAP VENC rev 2
OMAP DSI rev 1.0
omap-dss DISPLAY: default display lcd not found
i2c_omap i2c_omap.1: bus 1 rev3.12 at 2600 kHz
twl4030: PIH (irq 7) chaining IRQs 368..375
twl4030: power (irq 373) chaining IRQs 376..383
twl4030: gpio (irq 368) chaining IRQs 384..401
i2c_omap i2c_omap.3: bus 3 rev3.12 at 400 kHz
SCSI subsystem initialized
twl4030_usb twl4030_usb: Initialized TWL4030 USB module
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
musb_hdrc: version 6.0, musb-dma, otg (peripheral+host), debug=3D0
musb_hdrc: USB OTG mode controller at d80ab000 using DMA, IRQ 92
regulator: VMMC1: 1850 <--> 3150 mV normal standby
regulator: VDAC: 1800 mV normal standby
regulator: VUSB1V5: 1500 mV normal standby
regulator: VUSB1V8: 1800 mV normal standby
regulator: VUSB3V1: 3100 mV normal standby
regulator: VSIM: 1800 <--> 3000 mV normal standby
Bluetooth: Core ver 2.13
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
cfg80211: Using static regulatory domain info
cfg80211: Regulatory domain: US
=C2=A0 =C2=A0 =C2=A0 =C2=A0(start_freq - end_freq @ bandwidth), (max_antenn=
a_gain, max_eirp)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mB=
i, 2700 mBm)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(5170000 KHz - 5190000 KHz @ 40000 KHz), (600 mB=
i, 2300 mBm)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(5190000 KHz - 5210000 KHz @ 40000 KHz), (600 mB=
i, 2300 mBm)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(5210000 KHz - 5230000 KHz @ 40000 KHz), (600 mB=
i, 2300 mBm)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(5230000 KHz - 5330000 KHz @ 40000 KHz), (600 mB=
i, 2300 mBm)
=C2=A0 =C2=A0 =C2=A0 =C2=A0(5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mB=
i, 3000 mBm)
cfg80211: Calling CRDA for country: US
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
NET: Registered protocol family 1
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
JFFS2 version 2.2. (NAND) (SUMMARY) =C2=A0=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD 2001-2006 Red Hat, Inc.
msgmni has been set to 212
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver4 ports, IRQ sharing enabled
serial8250.0: ttyS0 at MMIO 0x4806a000 (irq =3D 72) is a ST16654
serial8250.0: ttyS1 at MMIO 0x4806c000 (irq =3D 73) is a ST16654
serial8250.0: ttyS2 at MMIO 0x49020000 (irq =3D 74) is a ST16654
console [ttyS2] enabled
brd: module loaded
loop: module loaded
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver rndis_host
usbcore: registered new interface driver zd1211rw
usbcore: registered new interface driver rndis_wlan
usbcore: registered new interface driver zd1201
usbcore: registered new interface driver usb8xxx
usbcore: registered new interface driver rtl8187
usbcore: registered new interface driver rt2500usb
usbcore: registered new interface driver rt73usb
usbcore: registered new interface driver p54usb
i2c /dev entries driver
input: triton2-pwrbutton as /class/input/input0
triton2 power button driver initialized
Driver 'sd' needs updating - please use bus_type methods
Driver 'sr' needs updating - please use bus_type methods
omap2-nand driver initializing
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB
1,8V 16-bit)
cmdlinepart partition parsing not available
Creating 5 MTD partitions on "omap2-nand":
0x00000000-0x00080000 : "X-Loader"
0x00080000-0x00260000 : "U-Boot"
0x00260000-0x00280000 : "U-Boot Env"
0x00280000-0x00680000 : "Kernel"
0x00680000-0x10000000 : "File System"
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 1
ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
g_ether gadget: using random self ethernet address
g_ether gadget: using random host ethernet address
usb0: MAC 42:7b:0d:a0:78:fd
usb0: HOST MAC 3e:d4:60:7d:aa:c8
g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
g_ether gadget: g_ether ready
musb_hdrc musb_hdrc: MUSB HDRC host driver
musb_hdrc musb_hdrc: new USB bus registered, assigned bus number 2
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
mice: PS/2 mouse device common for all mice
input: gpio-keys as /class/input/input1
twl4030_rtc twl4030_rtc: rtc core: registered twl4030_rtc as rtc0
twl4030_rtc twl4030_rtc: Power up reset detected.
twl4030_rtc twl4030_rtc: Enabling TWL4030-RTC.
OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
Bluetooth: HCI USB driver ver 2.10
usbcore: registered new interface driver hci_usb
Bluetooth: Broadcom Blutonium firmware driver ver 1.2
usbcore: registered new interface driver bcm203x
Bluetooth: Digianswer Bluetooth USB driver ver 0.10
usbcore: registered new interface driver bpa10x
Bluetooth: Generic Bluetooth SDIO driver ver 0.1
cpuidle: using governor ladder
cpuidle: using governor menu
mmci-omap-hs mmci-omap-hs.0: Failed to get debounce clock
Registered led device: beagleboard::usr0
Registered led device: beagleboard::usr1
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.18rc3.
usbcore: registered new interface driver snd-usb-audio
ASoC version 0.13.2
OMAP3 Beagle SoC init
TWL4030 Audio Codec init
asoc: twl4030 <-> omap-mcbsp-dai-(link_id) mapping ok
ALSA device list:
=C2=A0#0: omap3beagle (twl4030)
oprofile: using arm/armv7
TCP cubic registered
NET: Registered protocol family 17
NET: Registered protocol family 15
Bridge firewalling registered
Ebtables v2.0 registered
Bluetooth: L2CAP ver 2.11
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO (Voice Link) ver 0.6
Bluetooth: SCO socket layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM ver 1.10
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.=
com>
ThumbEE CPU extension supported.
Power Management for TI OMAP3.
pm_dbg_init()
SmartReflex driver initialized
Disabling unused clock "sr2_fck"
Disabling unused clock "sr1_fck"
Disabling unused clock "mcbsp_fck"
Disabling unused clock "mcbsp_fck"
Disabling unused clock "mcbsp_fck"
Disabling unused clock "mcbsp_ick"
Disabling unused clock "mcbsp_ick"
Disabling unused clock "mcbsp_ick"
Disabling unused clock "gpt2_ick"
Disabling unused clock "gpt3_ick"
Disabling unused clock "gpt4_ick"
Disabling unused clock "gpt5_ick"
Disabling unused clock "gpt6_ick"
Disabling unused clock "gpt7_ick"
Disabling unused clock "gpt8_ick"
Disabling unused clock "gpt9_ick"
Disabling unused clock "wdt3_ick"
Disabling unused clock "wdt3_fck"
Disabling unused clock "gpio2_dbck"
Disabling unused clock "gpio3_dbck"
Disabling unused clock "gpio4_dbck"
Disabling unused clock "gpio5_dbck"
Disabling unused clock "gpio6_dbck"
Disabling unused clock "gpt9_fck"
Disabling unused clock "gpt8_fck"
Disabling unused clock "gpt7_fck"
Disabling unused clock "gpt6_fck"
Disabling unused clock "gpt5_fck"
Disabling unused clock "gpt4_fck"
Disabling unused clock "gpt3_fck"
Disabling unused clock "gpt2_fck"
Disabling unused clock "gpt1_ick"
Disabling unused clock "wdt1_ick"
Disabling unused clock "wdt2_ick"
Disabling unused clock "wdt2_fck"
Disabling unused clock "gpio1_dbck"
Disabling unused clock "gpt1_fck"
Disabling unused clock "cam_ick"
Disabling unused clock "cam_mclk"
Disabling unused clock "des1_ick"
Disabling unused clock "sha11_ick"
Disabling unused clock "rng_ick"
Disabling unused clock "aes1_ick"
Disabling unused clock "ssi_ick"
Disabling unused clock "mailboxes_ick"
Disabling unused clock "mcbsp_ick"
Disabling unused clock "mcbsp_ick"
Disabling unused clock "gpt10_ick"
Disabling unused clock "gpt11_ick"
Disabling unused clock "i2c_ick"
Disabling unused clock "mcspi_ick"
Disabling unused clock "mcspi_ick"
Disabling unused clock "mcspi_ick"
Disabling unused clock "mcspi_ick"
Disabling unused clock "hdq_ick"
Disabling unused clock "mspro_ick"
Disabling unused clock "des2_ick"
Disabling unused clock "sha12_ick"
Disabling unused clock "aes2_ick"
Disabling unused clock "icr_ick"
Disabling unused clock "pka_ick"
Disabling unused clock "ssi_ssr_fck"
Disabling unused clock "hdq_fck"
Disabling unused clock "mcspi_fck"
Disabling unused clock "mcspi_fck"
Disabling unused clock "mcspi_fck"
Disabling unused clock "mcspi_fck"
Disabling unused clock "mcbsp_fck"
Disabling unused clock "mcbsp_fck"
Disabling unused clock "i2c_fck"
Disabling unused clock "mspro_fck"
Disabling unused clock "gpt11_fck"
Disabling unused clock "gpt10_fck"
Disabling unused clock "sad2d_ick"
Disabling unused clock "dpll4_m6x2_ck"
Disabling unused clock "dpll3_m3x2_ck"
Disabling unused clock "sys_clkout1"
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 1
Console: switching to colour frame buffer device 160x45
usb 2-1: new high speed USB device using musb_hdrc and address 2
twl4030_rtc twl4030_rtc: setting system clock to 2000-01-01 00:00:00
UTC (946684800)
Waiting for root device /dev/mmcblk0p2...
mmc0: new high speed SDHC card at address 0001
mmcblk0: mmc0:0001 =C2=A03.75 GiB
mmcblk0: p1 p2
kjournald starting. =C2=A0Commit interval 5 seconds
EXT3-fs warning: maximal mount count reached, running e2fsck is recommended
usb 2-1: configuration #1 chosen from 1 choice
hub 2-1:1.0: USB hub found
hub 2-1:1.0: 4 ports detected
EXT3 FS on mmcblk0p2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem).
Freeing init memory: 200K
Failed to execute /init. =C2=A0Attempting defaults...
INIT: version 2.86 booting
usb 2-1.1: new low speed USB device using musb_hdrc and address 3
usb 2-1.1: device v04f2 p0116 is not supported
usb 2-1.1: configuration #1 chosen from 1 choice
input: CHICONY USB Keyboard as /class/input/input2
generic-usb 0003:04F2:0116.0001: input: USB HID v1.10 Keyboard
[CHICONY USB Keyboard] on usb-musb_hdrc-1.1/input0
usb 2-1.2: new high speed USB device using musb_hdrc and address 4
Starting udevusb 2-1.2: device v05ac p1402 is not supported
usb 2-1.2: configuration #1 chosen from 1 choice
tar: dev/usbdev2.5_ep00: time stamp 2000-01-01 00:00:06 is 4.456054728
s in the future
tar: dev/usbdev2.5_ep81: time stamp 2000-01-01 00:00:06 is 4.453826944
s in the future
tar: dev/usbdev2.4_ep00: time stamp 2000-01-01 00:00:06 is 4.453552286
s in the future
tar: dev/initctl: time stamp 2000-01-01 00:00:06 is 4.453338663 s in the fu=
ture
tar: dev/vcsa2: time stamp 2000-01-01 00:00:05 is 3.452972452 s in the futu=
re
tar: dev/vcsa: time stamp 2000-01-01 00:00:05 is 3.452758829 s in the futur=
e
tar: dev/vcs2: time stamp 2000-01-01 00:00:05 is 3.452606241 s in the futur=
e
tar: dev/vcs: time stamp 2000-01-01 00:00:05 is 3.452453653 s in the future
tar: dev/usbmon2: time stamp 2000-01-01 00:00:05 is 3.452148477 s in the fu=
ture
tar: dev/usbmon1: time stamp 2000-01-01 00:00:05 is 3.451995889 s in the fu=
ture
tar: dev/usbmon0: time stamp 2000-01-01 00:00:05 is 3.451812784 s in the fu=
ture
tar: dev/usbdev2.3_ep81: time stamp 2000-01-01 00:00:05 is 3.451660196
s in the future
tar: dev/usbdev2.3_ep00: time stamp 2000-01-01 00:00:05 is 3.45147709
s in the future
tar: dev/usbdev2.2_ep81: time stamp 2000-01-01 00:00:05 is 3.451324502
s in the future
tar: dev/usbdev2.2_ep00: time stamp 2000-01-01 00:00:05 is 3.451141397
s in the future
tar: dev/usbdev2.1_ep81: time stamp 2000-01-01 00:00:05 is 3.450988809
s in the future
tar: dev/usbdev2.1_ep00: time stamp 2000-01-01 00:00:05 is 3.450805704
s in the future
tar: dev/usbdev1.1_ep81: time stamp 2000-01-01 00:00:05 is 3.450653116
s in the future
tar: dev/usbdev1.1_ep00: time stamp 2000-01-01 00:00:05 is 3.450500528
s in the future
tar: dev/ttyS3: time stamp 2000-01-01 00:00:05 is 3.447174111 s in the futu=
re
tar: dev/ttyS2: time stamp 2000-01-01 00:00:05 is 3.446929971 s in the futu=
re
tar: dev/ttyS1: time stamp 2000-01-01 00:00:05 is 3.446716348 s in the futu=
re
tar: dev/ttyS0: time stamp 2000-01-01 00:00:05 is 3.44656376 s in the futur=
e
tar: dev/ttyGS0: time stamp 2000-01-01 00:00:05 is 3.446380654 s in the fut=
ure
tar: dev/tty9: time stamp 2000-01-01 00:00:05 is 3.446044961 s in the futur=
e
tar: dev/tty8: time stamp 2000-01-01 00:00:05 is 3.445861856 s in the futur=
e
tar: dev/tty7: time stamp 2000-01-01 00:00:05 is 3.445709268 s in the futur=
e
tar: dev/tty63: time stamp 2000-01-01 00:00:05 is 3.44555668 s in the futur=
e
tar: dev/tty62: time stamp 2000-01-01 00:00:05 is 3.445404092 s in the futu=
re
tar: dev/tty61: time stamp 2000-01-01 00:00:05 is 3.445251504 s in the futu=
re
tar: dev/tty60: time stamp 2000-01-01 00:00:05 is 3.445007363 s in the futu=
re
tar: dev/tty6: time stamp 2000-01-01 00:00:05 is 3.444854776 s in the futur=
e
tar: dev/tty59: time stamp 2000-01-01 00:00:05 is 3.44467167 s in the futur=
e
tar: dev/tty58: time stamp 2000-01-01 00:00:05 is 3.444519082 s in the futu=
re
tar: dev/tty57: time stamp 2000-01-01 00:00:05 is 3.444366494 s in the futu=
re
tar: dev/tty56: time stamp 2000-01-01 00:00:05 is 3.444213906 s in the futu=
re
tar: dev/tty55: time stamp 2000-01-01 00:00:05 is 3.444061319 s in the futu=
re
tar: dev/tty54: time stamp 2000-01-01 00:00:05 is 3.443908731 s in the futu=
re
tar: dev/tty53: time stamp 2000-01-01 00:00:05 is 3.443725625 s in the futu=
re
tar: dev/tty52: time stamp 2000-01-01 00:00:05 is 3.443023721 s in the futu=
re
tar: dev/tty51: time stamp 2000-01-01 00:00:05 is 3.442810098 s in the futu=
re
tar: dev/tty50: time stamp 2000-01-01 00:00:05 is 3.442626992 s in the futu=
re
tar: dev/tty5: time stamp 2000-01-01 00:00:05 is 3.442474405 s in the futur=
e
tar: dev/tty49: time stamp 2000-01-01 00:00:05 is 3.442291299 s in the futu=
re
tar: dev/tty48: time stamp 2000-01-01 00:00:05 is 3.442138711 s in the futu=
re
tar: dev/tty47: time stamp 2000-01-01 00:00:05 is 3.441986123 s in the futu=
re
tar: dev/tty46: time stamp 2000-01-01 00:00:05 is 3.441833535 s in the futu=
re
tar: dev/tty45: time stamp 2000-01-01 00:00:05 is 3.441680948 s in the futu=
re
tar: dev/tty44: time stamp 2000-01-01 00:00:05 is 3.441497842 s in the futu=
re
tar: dev/tty43: time stamp 2000-01-01 00:00:05 is 3.441345254 s in the futu=
re
tar: dev/tty42: time stamp 2000-01-01 00:00:05 is 3.441162149 s in the futu=
re
tar: dev/tty41: time stamp 2000-01-01 00:00:05 is 3.441009561 s in the futu=
re
tar: dev/tty40: time stamp 2000-01-01 00:00:05 is 3.440856973 s in the futu=
re
tar: dev/tty4: time stamp 2000-01-01 00:00:05 is 3.096435571 s in the futur=
e
tar: dev/tty39: time stamp 2000-01-01 00:00:05 is 3.096252466 s in the futu=
re
tar: dev/tty38: time stamp 2000-01-01 00:00:05 is 3.096038842 s in the futu=
re
tar: dev/tty37: time stamp 2000-01-01 00:00:05 is 3.095886255 s in the futu=
re
tar: dev/tty36: time stamp 2000-01-01 00:00:05 is 3.095672632 s in the futu=
re
tar: dev/tty35: time stamp 2000-01-01 00:00:05 is 3.095520044 s in the futu=
re
tar: dev/tty34: time stamp 2000-01-01 00:00:05 is 3.09506228 s in the futur=
e
tar: dev/tty33: time stamp 2000-01-01 00:00:05 is 3.094848657 s in the futu=
re
tar: dev/tty32: time stamp 2000-01-01 00:00:05 is 3.094696069 s in the futu=
re
tar: dev/tty31: time stamp 2000-01-01 00:00:05 is 3.094512964 s in the futu=
re
tar: dev/tty30: time stamp 2000-01-01 00:00:05 is 3.094360376 s in the futu=
re
tar: dev/tty3: time stamp 2000-01-01 00:00:05 is 3.094207788 s in the futur=
e
tar: dev/tty29: time stamp 2000-01-01 00:00:05 is 3.0940552 s in the future
tar: dev/tty28: time stamp 2000-01-01 00:00:05 is 3.093841577 s in the futu=
re
tar: dev/tty27: time stamp 2000-01-01 00:00:05 is 3.093688989 s in the futu=
re
tar: dev/tty26: time stamp 2000-01-01 00:00:05 is 3.093536401 s in the futu=
re
tar: dev/tty25: time stamp 2000-01-01 00:00:05 is 3.093383814 s in the futu=
re
tar: dev/tty24: time stamp 2000-01-01 00:00:05 is 3.093231226 s in the futu=
re
tar: dev/tty23: time stamp 2000-01-01 00:00:05 is 3.093078638 s in the futu=
re
tar: dev/tty22: time stamp 2000-01-01 00:00:05 is 3.092895532 s in the futu=
re
tar: dev/tty21: time stamp 2000-01-01 00:00:05 is 3.092742945 s in the futu=
re
tar: dev/tty20: time stamp 2000-01-01 00:00:05 is 3.092590357 s in the futu=
re
tar: dev/tty2: time stamp 2000-01-01 00:00:05 is 3.092437769 s in the futur=
e
tar: dev/tty19: time stamp 2000-01-01 00:00:05 is 3.092254663 s in the futu=
re
tar: dev/tty18: time stamp 2000-01-01 00:00:05 is 3.092102076 s in the futu=
re
tar: dev/tty17: time stamp 2000-01-01 00:00:05 is 3.091949488 s in the futu=
re
tar: dev/tty16: time stamp 2000-01-01 00:00:05 is 3.091735865 s in the futu=
re
tar: dev/tty15: time stamp 2000-01-01 00:00:05 is 3.091583277 s in the futu=
re
tar: dev/tty14: time stamp 2000-01-01 00:00:05 is 3.091400171 s in the futu=
re
tar: dev/tty13: time stamp 2000-01-01 00:00:05 is 3.091247584 s in the futu=
re
tar: dev/tty12: time stamp 2000-01-01 00:00:05 is 3.091094996 s in the futu=
re
tar: dev/tty11: time stamp 2000-01-01 00:00:05 is 3.09091189 s in the futur=
e
tar: dev/tty10: time stamp 2000-01-01 00:00:05 is 3.090759302 s in the futu=
re
tar: dev/tty1: time stamp 2000-01-01 00:00:05 is 3.090576197 s in the futur=
e
tar: dev/tty0: time stamp 2000-01-01 00:00:05 is 3.090454127 s in the futur=
e
tar: dev/tty: time stamp 2000-01-01 00:00:05 is 3.090271021 s in the future
tar: dev/ptmx: time stamp 2000-01-01 00:00:05 is 3.090118433 s in the futur=
e
tar: dev/console: time stamp 2000-01-01 00:00:05 is 3.089721705 s in the fu=
ture
tar: dev/mixer: time stamp 2000-01-01 00:00:05 is 3.089355494 s in the futu=
re
tar: dev/dsp: time stamp 2000-01-01 00:00:05 is 3.089141871 s in the future
tar: dev/snd/timer: time stamp 2000-01-01 00:00:05 is 3.08865359 s in the f=
uture
tar: dev/snd/pcmC0D0p: time stamp 2000-01-01 00:00:05 is 3.088470484 s
in the future
tar: dev/snd/pcmC0D0c: time stamp 2000-01-01 00:00:05 is 3.08789065 s
in the future
tar: dev/snd/controlC0: time stamp 2000-01-01 00:00:05 is 3.087707544
s in the future
tar: dev/snd: time stamp 2000-01-01 00:00:05 is 3.087554956 s in the future
tar: dev/audio: time stamp 2000-01-01 00:00:05 is 3.087402368 s in the futu=
re
tar: dev/rtc0: time stamp 2000-01-01 00:00:05 is 3.086730982 s in the futur=
e
tar: dev/udev_network_queue: time stamp 2000-01-01 00:00:06 is
4.086273218 s in the future
tar: dev/mtd4ro: time stamp 2000-01-01 00:00:05 is 3.086059595 s in the fut=
ure
tar: dev/mtd4: time seth0: register 'asix' at usb-musb_hdrc-1.2, ASIX
AX88772 USB 2.0 Ethernet, 00:1f:f3:fc:11:38
tamp 2000-01-01 00:00:05 is 3.08587649 s in the future
tar: dev/mtd3ro: time stamp 2000-01-01 00:00:05 is 2.742340111 s in the fut=
ure
tar: dev/mtd3: time stamp 2000-01-01 00:00:05 is 2.742095971 s in the futur=
e
tar: dev/mtd2ro: time stamp 2000-01-01 00:00:05 is 2.741943383 s in the fut=
ure
tar: dev/mtd2: time stamp 2000-01-01 00:00:05 is 2.741760277 s in the futur=
e
tar: dev/mtd1ro: time stamp 2000-01-01 00:00:05 is 2.741607689 s in the fut=
ure
tar: dev/mtd1: time stamp 2000-01-01 00:00:05 is 2.741455101 s in the futur=
e
tar: dev/mtd0ro: time stamp 2000-01-01 00:00:05 is 2.741302514 s in the fut=
ure
tar: dev/mtd0: time stamp 2000-01-01 00:00:05 is 2.741088891 s in the futur=
e
tar: dev/watchdog: time stamp 2000-01-01 00:00:05 is 2.740936303 s in the f=
uture
tar: dev/ubi_ctrl: time stamp 2000-01-01 00:00:05 is 2.740783715 s in the f=
uture
tar: dev/psaux: time stamp 2000-01-01 00:00:05 is 2.740631127 s in the
futurusb 2-1.3: new low speed USB device using musb_hdrc and address 5
e
tar: dev/network_throughput: time stamp 2000-01-01 00:00:05 is
2.740478539 s in the future
tar: dev/network_latency: time stamp 2000-01-01 00:00:05 is
2.740295434 s in the future
tar: dev/cpu_dma_latency: time stamp 2000-01-01 00:00:05 is
2.740142846 s in the future
tar: dev/zero: time stamp 2000-01-01 00:00:05 is 2.739807152 s in the futur=
e
tar: dev/urandom: time stamp 2000-01-01 00:00:05 is 2.739624047 s in the fu=
ture
tar: dev/random: time stamp 2000-01-01 00:00:05 is 2.739440941 s in the fut=
ure
tar: dev/null: time stamp 2000-01-01 00:00:05 is 2.739196801 s in the futur=
e
tar: dev/mem: time stamp 2000-01-01 00:00:05 is 2.738739037 s in the future
tar: dev/kmsg: time stamp 2000-01-01 00:00:05 is 2.738403344 s in the futur=
e
tar: dev/kmem: time stamp 2000-01-01 00:00:05 is 2.738067651 s in the futur=
e
tar: dev/full: time stamp 2000-01-01 00:00:05 is 2.737792992 s in the futur=
e
tar: dev/input/event3: time stamp 2000-01-01 00:00:06 is 3.737548852 s
in the future
tar: dev/input/mouse0: time stamp 2000-01-01 00:00:06 is 3.737365746 s
in the future
tar: dev/input/uinput: time stamp 2000-01-01 00:00:05 is 2.737213158 s
in the future
tar: dev/input/event2: time stamp 2000-01-01 00:00:05 is 2.736999535 s
in the future
tar: dev/input/mice: time stamp 2000-01-01 00:00:05 is 2.736846948 s
in the future
tar: dev/input/usb 2-1.3: device v04d9 p1133 is not supported
event1: time stamp 2000-01-01 00usb 2-1.3: configuration #1 chosen from 1 c=
hoice
:00:05 is 2.736602806 s in the future
tar: dev/input/event0: time stamp 2000-01-01 00:00:05 is 2.736419701 s
in the future
tar: dev/input: time stamp 2000-01-input: HID 04d9:1133 as /class/input/inp=
ut3
01 00:00:06 is 3.73629763 s in the future
tar: dev/i2c-3: time stamp 2000-01-01 00:00:04 is 1.736145042 s in the futu=
re
tar: dev/i2c-1: time stamp 2000-01-01 00:00:04 is 1.735992454 s in the futu=
re
tar: dev/fb2: time stamp 2000-01-01 00:00:04 is 1.735656761 s in the future
tar: dev/fb1: time stamp 2000-01-01 00:00:04 is 1.735351585 s in the future
tar: dev/fb0: time stamp 2000-01-01 00:00:04 is 1.734832787 s in the future
tar: dev/null.old: time stamp 2000-01-01 00:00:04 is 1.734466576 s in the f=
uture
tar: dev/mtdblock3: time stamp 2000-01-01 00:00:04 is 1.734100365 s in
the future
tar: dev/mtgeneric-usb 0003:04D9:1133.0002: input: USB HID v1.10 Mouse
[HID 04d9:1133] on usb-musb_hdrc-1.3/input0
dblock4: time stamp 2000-01-01 00:00:04 is 1.733917259 s in the future
tar: dev/mmcblk0p2: time stamp 2000-01-01 00:00:04 is 1.733612084 s in
the future
tar: dev/mmcblk0p1: time stamp 2000-01-01 00:00:04 is 1.732879662 s in
the future
tar: dev/mtdblock1: time stamp 2000-01-01 00:00:04 is 1.732574486 s in
the future
tar: dev/ram9: time stamp 2000-01-01 00:00:03 is 0.732391381 s in the futur=
e
tar: dev/ram8: time stamp 2000-01-01 00:00:03 is 0.732208275 s in the futur=
e
tar: dev/ram7: time stamp 2000-01-01 00:00:03 is 0.732055687 s in the futur=
e
tar: dev/ram6: time stamp 2000-01-01 00:00:03 is 0.731903099 s in the futur=
e
tar: dev/mtdblock2: time stamp 2000-01-01 00:00:03 is 0.731750512 s in
the future
tar: dev/ram4: time stamp 2000-01-01 00:00:03 is 0.731567406 s in the futur=
e
tar: dev/ram5: time stamp 2000-01-01 00:00:03 is 0.731323265 s in the futur=
e
tar: dev/ram3: time stamp 2000-01-01 00:00:03 is 0.73114016 s in the future
tar: dev/mtdblock0: time stamp 2000-01-01 00:00:03 is 0.350524932 s in
the future
tar: dev/ram2: time stamp 2000-01-01 00:00:03 is 0.350250273 s in the futur=
e
tar: dev/ram15: time stamp 2000-01-01 00:00:03 is 0.350067168 s in the futu=
re
tar: dev/bus/usb/001/001: time stamp 2000-01-01 00:00:05 is
2.346649199 s in the future
tar: dev/bus/usb/001: time stamp 2000-01-01 00:00:05 is 2.346435576 s
in the future
tar: dev/bus/usb/002/005: time stamp 2000-01-01 00:00:06 is
3.346221953 s in the future
tar: dev/bus/usb/002/003: time stamp 2000-01-01 00:00:05 is
2.345916776 s in the future
tar: dev/bus/usb/002/002: time stamp 2000-01-01 00:00:05 is
2.345733671 s in the future
tar: dev/bus/usb/002/001: time stamp 2000-01-01 00:00:05 is
2.345550566 s in the future
tar: dev/bus/usb/002: time stamp 2000-01-01 00:00:06 is 3.345306425 s
in the future
tar: dev/bus/usb: time stamp 2000-01-01 00:00:05 is 2.345184355 s in the fu=
ture
tar: dev/.udev/names/input\x2fevent3/\x2fclass\x2finput\x2finput3\x2fevent3=
:
time stamp 2000-01-01 00:00:06 is 3.343383818 s in the future
tar: dev/.udev/names/input\x2fevent3: time stamp 2000-01-01 00:00:06
is 3.343139677 s in the future
tar: dev/.udev/names/input\x2fmouse0/\x2fclass\x2finput\x2finput3\x2fmouse0=
:
time stamp 2000-01-01 00:00:06 is 3.342926054 s in the future
tar: dev/.udev/names/input\x2fmouse0: time stamp 2000-01-01 00:00:06
is 3.342742948 s in the future
tar: dev/.udev/names/usbdev2.5_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev2.5_=
ep00:
time stamp 2000-01-01 00:00:06 is 3.342498808 s in the future
tar: dev/.udev/names/usbdev2.5_ep00: time stamp 2000-01-01 00:00:06 is
3.342315702 s in the future
tar: dev/.udev/names/usbdev2.5_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev2.5_=
ep81:
time stamp 2000-01-01 00:00:06 is 3.342102079 s in the future
tar: dev/.udev/names/usbdev2.5_ep81: time stamp 2000-01-01 00:00:06 is
3.341949491 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f005/\x2fclass\x2fusb_device\x2fus=
bdev2.5:
time stamp 2000-01-01 00:00:06 is 3.341735868 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f005/\x2fdevices\x2fplatform\x2fmu=
sb_hdrc\x2fusb2\x2f2-1\x2f2-1.3:
time stamp 2000-01-01 00:00:06 is 3.341522245 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f005: time stamp 2000-01-01
00:00:06 is 3.341369657 s in the future
tar: dev/.udev/names/usbdev2.4_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev2.4_=
ep00:
time stamp 2000-01-01 00:00:06 is 3.341156034 s in the future
tar: dev/.udev/names/usbdev2.4_ep00: time stamp 2000-01-01 00:00:06 is
3.340972929 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f004/\x2fclass\x2fusb_device\x2fus=
bdev2.4:
time stamp 2000-01-01 00:00:06 is 3.340759306 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f004/\x2fdevices\x2fplatform\x2fmu=
sb_hdrc\x2fusb2\x2f2-1\x2f2-1.2:
time stamp 2000-01-01 00:00:05 is 2.340545683 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f004: time stamp 2000-01-01
00:00:06 is 3.340362577 s in the future
tar: dev/.udev/names/vcsa2/\x2fclass\x2fvc\x2fvcsa2: time stamp
2000-01-01 00:00:05 is 2.340087919 s in the future
tar: dev/.udev/names/vcsa2: time stamp 2000-01-01 00:00:05 is
2.339935331 s in the future
tar: dev/.udev/names/vcsa/\x2fclass\x2fvc\x2fvcsa: time stamp
2000-01-01 00:00:05 is 2.339721708 s in the future
tar: dev/.udev/names/vcsa: time stamp 2000-01-01 00:00:05 is
2.339538603 s in the future
tar: dev/.udev/names/vcs2/\x2fclass\x2fvc\x2fvcs2: time stamp
2000-01-01 00:00:05 is 2.33932498 s in the future
tar: dev/.udev/names/vcs2: time stamp 2000-01-01 00:00:05 is
2.339172392 s in the future
tar: dev/.udev/names/vcs/\x2fclass\x2fvc\x2fvcs: time stamp 2000-01-01
00:00:05 is 2.338958769 s in the future
tar: dev/.udev/names/vcs: time stamp 2000-01-01 00:00:05 is
2.338806181 s in the future
tar: dev/.udev/names/usbmon2/\x2fclass\x2fusbmon\x2fusbmon2: time
stamp 2000-01-01 00:00:05 is 2.338623076 s in the future
tar: dev/.udev/names/usbmon2: time stamp 2000-01-01 00:00:05 is
1.993652383 s in the future
tar: dev/.udev/names/usbmon1/\x2fclass\x2fusbmon\x2fusbmon1: time
stamp 2000-01-01 00:00:05 is 1.99331669 s in the future
tar: dev/.udev/names/usbmon1: time stamp 2000-01-01 00:00:05 is
1.993133585 s in the future
tar: dev/.udev/names/usbmon0/\x2fclass\x2fusbmon\x2fusbmon0: time
stamp 2000-01-01 00:00:05 is 1.992919962 s in the future
tar: dev/.udev/names/usbmon0: time stamp 2000-01-01 00:00:05 is
1.992767374 s in the future
tar: dev/.udev/names/usbdev2.4_ep82/\x2fclass\x2fusb_endpoint\x2fusbdev2.4_=
ep82:
time stamp 2000-01-01 00:00:05 is 1.992553751 s in the future
tar: dev/.udev/names/usbdev2.4_ep82: time stamp 2000-01-01 00:00:05 is
1.992370645 s in the future
tar: dev/.udev/names/usbdev2.4_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev2.4_=
ep81:
time stamp 2000-01-01 00:00:05 is 1.992126505 s in the future
tar: dev/.udev/names/usbdev2.4_ep81: time stamp 2000-01-01 00:00:05 is
1.991973917 s in the future
tar: dev/.udev/names/usbdev2.4_ep03/\x2fclass\x2fusb_endpoint\x2fusbdev2.4_=
ep03:
time stamp 2000-01-01 00:00:05 is 1.991760294 s in the future
tar: dev/.udev/names/usbdev2.4_ep03: time stamp 2000-01-01 00:00:05 is
1.991607706 s in the future
tar: dev/.udev/names/usbdev2.3_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev2.3_=
ep81:
time stamp 2000-01-01 00:00:05 is 1.991241495 s in the future
tar: dev/.udev/names/usbdev2.3_ep81: time stamp 2000-01-01 00:00:05 is
1.991027872 s in the future
tar: dev/.udev/names/usbdev2.3_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev2.3_=
ep00:
time stamp 2000-01-01 00:00:05 is 1.990814249 s in the future
tar: dev/.udev/names/usbdev2.3_ep00: time stamp 2000-01-01 00:00:05 is
1.990631143 s in the future
tar: dev/.udev/names/usbdev2.2_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev2.2_=
ep81:
time stamp 2000-01-01 00:00:05 is 1.990387003 s in the future
tar: dev/.udev/names/usbdev2.2_ep81: time stamp 2000-01-01 00:00:05 is
1.990234415 s in the future
tar: dev/.udev/names/usbdev2.2_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev2.2_=
ep00:
time stamp 2000-01-01 00:00:05 is 1.990020792 s in the future
tar: dev/.udev/names/usbdev2.2_ep00: time stamp 2000-01-01 00:00:05 is
1.989868204 s in the future
tar: dev/.udev/names/usbdev2.1_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev2.1_=
ep81:
time stamp 2000-01-01 00:00:05 is 1.989654581 s in the future
tar: dev/.udev/names/usbdev2.1_ep81: time stamp 2000-01-01 00:00:05 is
1.989501993 s in the future
tar: dev/.udev/names/usbdev2.1_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev2.1_=
ep00:
time stamp 2000-01-01 00:00:05 is 1.98928837 s in the future
tar: dev/.udev/names/usbdev2.1_ep00: time stamp 2000-01-01 00:00:05 is
1.989135782 s in the future
tar: dev/.udev/names/usbdev1.1_ep81/\x2fclass\x2fusb_endpoint\x2fusbdev1.1_=
ep81:
time stamp 2000-01-01 00:00:05 is 1.988922159 s in the future
tar: dev/.udev/names/usbdev1.1_ep81: time stamp 2000-01-01 00:00:05 is
1.988769571 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f003/\x2fdevices\x2fplatform\x2fmu=
sb_hdrc\x2fusb2\x2f2-1\x2f2-1.1:
time stamp 2000-01-01 00:00:05 is 1.98852543 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f003/\x2fclass\x2fusb_device\x2fus=
bdev2.3:
time stamp 2000-01-01 00:00:05 is 1.988311807 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f003: time stamp 2000-01-01
00:00:05 is 1.988128702 s in the future
tar: dev/.udev/names/usbdev1.1_ep00/\x2fclass\x2fusb_endpoint\x2fusbdev1.1_=
ep00:
time stamp 2000-01-01 00:00:05 is 1.987915079 s in the future
tar: dev/.udev/names/usbdev1.1_ep00: time stamp 2000-01-01 00:00:05 is
1.987701456 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f002/\x2fdevices\x2fplatform\x2fmu=
sb_hdrc\x2fusb2\x2f2-1:
time stamp 2000-01-01 00:00:05 is 1.987457315 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f002/\x2fclass\x2fusb_device\x2fus=
bdev2.2:
time stamp 2000-01-01 00:00:05 is 1.987243692 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f002: time stamp 2000-01-01
00:00:05 is 1.64239504 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f001/\x2fdevices\x2fplatform\x2fmu=
sb_hdrc\x2fusb2:
time stamp 2000-01-01 00:00:05 is 1.642120382 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f001/\x2fclass\x2fusb_device\x2fus=
bdev2.1:
time stamp 2000-01-01 00:00:05 is 1.641906759 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f002\x2f001: time stamp 2000-01-01
00:00:05 is 1.641723654 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f001\x2f001/\x2fdevices\x2fplatform\x2feh=
ci-omap.0\x2fusb1:
time stamp 2000-01-01 00:00:05 is 1.641510031 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f001\x2f001/\x2fclass\x2fusb_device\x2fus=
bdev1.1:
time stamp 2000-01-01 00:00:05 is 1.641296408 s in the future
tar: dev/.udev/names/bus\x2fusb\x2f001\x2f001: time stamp 2000-01-01
00:00:05 is 1.64114382 s in the future
tar: dev/.udev/names/ttyS3/\x2fclass\x2ftty\x2fttyS3: time stamp
2000-01-01 00:00:05 is 1.640930197 s in the future
tar: dev/.udev/names/ttyS3: time stamp 2000-01-01 00:00:05 is
1.640777609 s in the future
tar: dev/.udev/names/ttyS2/\x2fclass\x2ftty\x2fttyS2: time stamp
2000-01-01 00:00:05 is 1.640594503 s in the future
tar: dev/.udev/names/ttyS2: time stamp 2000-01-01 00:00:05 is
1.640441916 s in the future
tar: dev/.udev/names/ttyS1/\x2fclass\x2ftty\x2fttyS1: time stamp
2000-01-01 00:00:05 is 1.640197775 s in the future
tar: dev/.udev/names/ttyS1: time stamp 2000-01-01 00:00:05 is
1.640045187 s in the future
tar: dev/.udev/names/ttyS0/\x2fclass\x2ftty\x2fttyS0: time stamp
2000-01-01 00:00:05 is 1.639831564 s in the future
tar: dev/.udev/names/ttyS0: time stamp 2000-01-01 00:00:05 is
1.639678976 s in the future
tar: dev/.udev/names/ttyGS0/\x2fclass\x2ftty\x2fttyGS0: time stamp
2000-01-01 00:00:05 is 1.639465353 s in the future
tar: dev/.udev/names/ttyGS0: time stamp 2000-01-01 00:00:05 is
1.639312765 s in the future
tar: dev/.udev/names/tty9/\x2fclass\x2ftty\x2ftty9: time stamp
2000-01-01 00:00:05 is 1.639038107 s in the future
tar: dev/.udev/names/tty9: time stamp 2000-01-01 00:00:05 is
1.638855002 s in the future
tar: dev/.udev/names/tty8/\x2fclass\x2ftty\x2ftty8: time stamp
2000-01-01 00:00:05 is 1.638641379 s in the future
tar: dev/.udev/names/tty8: time stamp 2000-01-01 00:00:05 is
1.638488791 s in the future
tar: dev/.udev/names/tty7/\x2fclass\x2ftty\x2ftty7: time stamp
2000-01-01 00:00:05 is 1.638305685 s in the future
tar: dev/.udev/names/tty7: time stamp 2000-01-01 00:00:05 is
1.638153098 s in the future
tar: dev/.udev/names/tty63/\x2fclass\x2ftty\x2ftty63: time stamp
2000-01-01 00:00:05 is 1.637939475 s in the future
tar: dev/.udev/names/tty63: time stamp 2000-01-01 00:00:05 is
1.637786887 s in the future
tar: dev/.udev/names/tty62/\x2fclass\x2ftty\x2ftty62: time stamp
2000-01-01 00:00:05 is 1.637603781 s in the future
tar: dev/.udev/names/tty62: time stamp 2000-01-01 00:00:05 is
1.637451193 s in the future
tar: dev/.udev/names/tty61/\x2fclass\x2ftty\x2ftty61: time stamp
2000-01-01 00:00:05 is 1.63723757 s in the future
tar: dev/.udev/names/tty61: time stamp 2000-01-01 00:00:05 is
1.637084983 s in the future
tar: dev/.udev/names/tty60/\x2fclass\x2ftty\x2ftty60: time stamp
2000-01-01 00:00:05 is 1.636810324 s in the future
tar: dev/.udev/names/tty60: time stamp 2000-01-01 00:00:05 is
1.636657736 s in the future
tar: dev/.udev/names/tty6/\x2fclass\x2ftty\x2ftty6: time stamp
2000-01-01 00:00:05 is 1.636474631 s in the future
tar: dev/.udev/names/tty6: time stamp 2000-01-01 00:00:05 is
1.636322043 s in the future
tar: dev/.udev/names/tty59/\x2fclass\x2ftty\x2ftty59: time stamp
2000-01-01 00:00:05 is 1.63610842 s in the future
tar: dev/.udev/names/tty59: time stamp 2000-01-01 00:00:05 is
1.635955832 s in the future
tar: dev/.udev/names/tty58/\x2fclass\x2ftty\x2ftty58: time stamp
2000-01-01 00:00:05 is 1.291076685 s in the future
tar: dev/.udev/names/tty58: time stamp 2000-01-01 00:00:05 is
1.29089358 s in the future
tar: dev/.udev/names/tty57/\x2fclass\x2ftty\x2ftty57: time stamp
2000-01-01 00:00:05 is 1.290588404 s in the future
tar: dev/.udev/names/tty57: time stamp 2000-01-01 00:00:05 is
1.290435816 s in the future
tar: dev/.udev/names/tty56/\x2fclass\x2ftty\x2ftty56: time stamp
2000-01-01 00:00:05 is 1.290222193 s in the future
tar: dev/.udev/names/tty56: time stamp 2000-01-01 00:00:05 is
1.290069605 s in the future
tar: dev/.udev/names/tty55/\x2fclass\x2ftty\x2ftty55: time stamp
2000-01-01 00:00:05 is 1.289855982 s in the future
tar: dev/.udev/names/tty55: time stamp 2000-01-01 00:00:05 is
1.289703394 s in the future
tar: dev/.udev/names/tty54/\x2fclass\x2ftty\x2ftty54: time stamp
2000-01-01 00:00:05 is 1.289520289 s in the future
tar: dev/.udev/names/tty54: time stamp 2000-01-01 00:00:05 is
1.289367701 s in the future
tar: dev/.udev/names/tty53/\x2fclass\x2ftty\x2ftty53: time stamp
2000-01-01 00:00:05 is 1.289154078 s in the future
tar: dev/.udev/names/tty53: time stamp 2000-01-01 00:00:05 is
1.28900149 s in the future
tar: dev/.udev/names/tty52/\x2fclass\x2ftty\x2ftty52: time stamp
2000-01-01 00:00:05 is 1.288787867 s in the future
tar: dev/.udev/names/tty52: time stamp 2000-01-01 00:00:05 is
1.288635279 s in the future
tar: dev/.udev/names/tty51/\x2fclass\x2ftty\x2ftty51: time stamp
2000-01-01 00:00:05 is 1.288391138 s in the future
tar: dev/.udev/names/tty51: time stamp 2000-01-01 00:00:05 is
1.28823855 s in the future
tar: dev/.udev/names/tty50/\x2fclass\x2ftty\x2ftty50: time stamp
2000-01-01 00:00:05 is 1.288055445 s in the future
tar: dev/.udev/names/tty50: time stamp 2000-01-01 00:00:05 is
1.287902857 s in the future
tar: dev/.udev/names/tty5/\x2fclass\x2ftty\x2ftty5: time stamp
2000-01-01 00:00:05 is 1.287719752 s in the future
tar: dev/.udev/names/tty5: time stamp 2000-01-01 00:00:05 is
1.287567164 s in the future
tar: dev/.udev/names/tty49/\x2fclass\x2ftty\x2ftty49: time stamp
2000-01-01 00:00:05 is 1.287353541 s in the future
tar: dev/.udev/names/tty49: time stamp 2000-01-01 00:00:05 is
1.287200953 s in the future
tar: dev/.udev/names/tty48/\x2fclass\x2ftty\x2ftty48: time stamp
2000-01-01 00:00:05 is 1.286926295 s in the future
tar: dev/.udev/names/tty48: time stamp 2000-01-01 00:00:05 is
1.286743189 s in the future
tar: dev/.udev/names/tty47/\x2fclass\x2ftty\x2ftty47: time stamp
2000-01-01 00:00:05 is 1.286529566 s in the future
tar: dev/.udev/names/tty47: time stamp 2000-01-01 00:00:05 is
1.286376978 s in the future
tar: dev/.udev/names/tty46/\x2fclass\x2ftty\x2ftty46: time stamp
2000-01-01 00:00:05 is 1.286193873 s in the future
tar: dev/.udev/names/tty46: time stamp 2000-01-01 00:00:05 is
1.286041285 s in the future
tar: dev/.udev/names/tty45/\x2fclass\x2ftty\x2ftty45: time stamp
2000-01-01 00:00:05 is 1.285827662 s in the future
tar: dev/.udev/names/tty45: time stamp 2000-01-01 00:00:05 is
1.285675074 s in the future
tar: dev/.udev/names/tty44/\x2fclass\x2ftty\x2ftty44: time stamp
2000-01-01 00:00:05 is 1.285430933 s in the future
tar: dev/.udev/names/tty44: time stamp 2000-01-01 00:00:05 is
1.285278346 s in the future
tar: dev/.udev/names/tty43/\x2fclass\x2ftty\x2ftty43: time stamp
2000-01-01 00:00:05 is 1.28509524 s in the future
tar: dev/.udev/names/tty43: time stamp 2000-01-01 00:00:05 is
1.284942652 s in the future
tar: dev/.udev/names/tty42/\x2fclass\x2ftty\x2ftty42: time stamp
2000-01-01 00:00:05 is 1.284729029 s in the future
tar: dev/.udev/names/tty42: time stamp 2000-01-01 00:00:05 is
1.284576441 s in the future
tar: dev/.udev/names/tty41/\x2fclass\x2ftty\x2ftty41: time stamp
2000-01-01 00:00:05 is 1.284393336 s in the future
tar: dev/.udev/names/tty41: time stamp 2000-01-01 00:00:05 is
1.284240748 s in the future
tar: dev/.udev/names/tty40/\x2fclass\x2ftty\x2ftty40: time stamp
2000-01-01 00:00:05 is 0.939758339 s in the future
tar: dev/.udev/names/tty40: time stamp 2000-01-01 00:00:05 is
0.939544716 s in the future
tar: dev/.udev/names/tty4/\x2fclass\x2ftty\x2ftty4: time stamp
2000-01-01 00:00:05 is 0.939331093 s in the future
tar: dev/.udev/names/tty4: time stamp 2000-01-01 00:00:05 is
0.939178505 s in the future
tar: dev/.udev/names/tty39/\x2fclass\x2ftty\x2ftty39: time stamp
2000-01-01 00:00:05 is 0.938842812 s in the future
tar: dev/.udev/names/tty39: time stamp 2000-01-01 00:00:05 is
0.938659706 s in the future
tar: dev/.udev/names/tty38/\x2fclass\x2ftty\x2ftty38: time stamp
2000-01-01 00:00:05 is 0.938446083 s in the future
tar: dev/.udev/names/tty38: time stamp 2000-01-01 00:00:05 is
0.938293496 s in the future
tar: dev/.udev/names/tty37/\x2fclass\x2ftty\x2ftty37: time stamp
2000-01-01 00:00:05 is 0.938079872 s in the future
tar: dev/.udev/names/tty37: time stamp 2000-01-01 00:00:05 is
0.937927285 s in the future
tar: dev/.udev/names/tty36/\x2fclass\x2ftty\x2ftty36: time stamp
2000-01-01 00:00:05 is 0.937713662 s in the future
tar: dev/.udev/names/tty36: time stamp 2000-01-01 00:00:05 is
0.937561074 s in the future
tar: dev/.udev/names/tty35/\x2fclass\x2ftty\x2ftty35: time stamp
2000-01-01 00:00:05 is 0.937316933 s in the future
tar: dev/.udev/names/tty35: time stamp 2000-01-01 00:00:05 is
0.937164345 s in the future
tar: dev/.udev/names/tty34/\x2fclass\x2ftty\x2ftty34: time stamp
2000-01-01 00:00:05 is 0.936950722 s in the future
tar: dev/.udev/names/tty34: time stamp 2000-01-01 00:00:05 is
0.936798134 s in the future
tar: dev/.udev/names/tty33/\x2fclass\x2ftty\x2ftty33: time stamp
2000-01-01 00:00:05 is 0.936615029 s in the future
tar: dev/.udev/names/tty33: time stamp 2000-01-01 00:00:05 is
0.936462441 s in the future
tar: dev/.udev/names/tty32/\x2fclass\x2ftty\x2ftty32: time stamp
2000-01-01 00:00:05 is 0.9362183 s in the future
tar: dev/.udev/names/tty32: time stamp 2000-01-01 00:00:05 is
0.936065712 s in the future
tar: dev/.udev/names/tty31/\x2fclass\x2ftty\x2ftty31: time stamp
2000-01-01 00:00:05 is 0.935882607 s in the future
tar: dev/.udev/names/tty31: time stamp 2000-01-01 00:00:05 is
0.935730019 s in the future
tar: dev/.udev/names/tty30/\x2fclass\x2ftty\x2ftty30: time stamp
2000-01-01 00:00:05 is 0.935516396 s in the future
tar: dev/.udev/names/tty30: time stamp 2000-01-01 00:00:05 is
0.935363808 s in the future
tar: dev/.udev/names/tty3/\x2fclass\x2ftty\x2ftty3: time stamp
2000-01-01 00:00:05 is 0.935119667 s in the future
tar: dev/.udev/names/tty3: time stamp 2000-01-01 00:00:05 is
0.934936562 s in the future
tar: dev/.udev/names/tty29/\x2fclass\x2ftty\x2ftty29: time stamp
2000-01-01 00:00:05 is 0.934753457 s in the future
tar: dev/.udev/names/tty29: time stamp 2000-01-01 00:00:05 is
0.934600869 s in the future
tar: dev/.udev/names/tty28/\x2fclass\x2ftty\x2ftty28: time stamp
2000-01-01 00:00:05 is 0.93432621 s in the future
tar: dev/.udev/names/tty28: time stamp 2000-01-01 00:00:05 is
0.934173623 s in the future
tar: dev/.udev/names/tty27/\x2fclass\x2ftty\x2ftty27: time stamp
2000-01-01 00:00:05 is 0.93396 s in the future
tar: dev/.udev/names/tty27: time stamp 2000-01-01 00:00:05 is
0.933807412 s in the future
tar: dev/.udev/names/tty26/\x2fclass\x2ftty\x2ftty26: time stamp
2000-01-01 00:00:05 is 0.933624306 s in the future
tar: dev/.udev/names/tty26: time stamp 2000-01-01 00:00:05 is
0.933471718 s in the future
tar: dev/.udev/names/tty25/\x2fclass\x2ftty\x2ftty25: time stamp
2000-01-01 00:00:05 is 0.933258095 s in the future
tar: dev/.udev/names/tty25: time stamp 2000-01-01 00:00:05 is
0.933105507 s in the future
tar: dev/.udev/names/tty24/\x2fclass\x2ftty\x2ftty24: time stamp
2000-01-01 00:00:05 is 0.932891884 s in the future
tar: dev/.udev/names/tty24: time stamp 2000-01-01 00:00:05 is
0.932739296 s in the future
tar: dev/.udev/names/tty23/\x2fclass\x2ftty\x2ftty23: time stamp
2000-01-01 00:00:05 is 0.588562037 s in the future
tar: dev/.udev/names/tty23: time stamp 2000-01-01 00:00:05 is
0.588378932 s in the future
tar: dev/.udev/names/tty22/\x2fclass\x2ftty\x2ftty22: time stamp
2000-01-01 00:00:05 is 0.588104273 s in the future
tar: dev/.udev/names/tty22: time stamp 2000-01-01 00:00:05 is
0.587951685 s in the future
tar: dev/.udev/names/tty21/\x2fclass\x2ftty\x2ftty21: time stamp
2000-01-01 00:00:05 is 0.587768579 s in the future
tar: dev/.udev/names/tty21: time stamp 2000-01-01 00:00:05 is
0.587615991 s in the future
tar: dev/.udev/names/tty20/\x2fclass\x2ftty\x2ftty20: time stamp
2000-01-01 00:00:05 is 0.587310816 s in the future
tar: dev/.udev/names/tty20: time stamp 2000-01-01 00:00:05 is
0.587158228 s in the future
tar: dev/.udev/names/tty2/\x2fclass\x2ftty\x2ftty2: time stamp
2000-01-01 00:00:05 is 0.586914087 s in the future
tar: dev/.udev/names/tty2: time stamp 2000-01-01 00:00:05 is
0.586761499 s in the future
tar: dev/.udev/names/tty19/\x2fclass\x2ftty\x2ftty19: time stamp
2000-01-01 00:00:05 is 0.586547876 s in the future
tar: dev/.udev/names/tty19: time stamp 2000-01-01 00:00:05 is
0.586395289 s in the future
tar: dev/.udev/names/tty18/\x2fclass\x2ftty\x2ftty18: time stamp
2000-01-01 00:00:05 is 0.586212183 s in the future
tar: dev/.udev/names/tty18: time stamp 2000-01-01 00:00:05 is
0.586029078 s in the future
tar: dev/.udev/names/tty17/\x2fclass\x2ftty\x2ftty17: time stamp
2000-01-01 00:00:05 is 0.585815455 s in the future
tar: dev/.udev/names/tty17: time stamp 2000-01-01 00:00:05 is
0.585662867 s in the future
tar: dev/.udev/names/tty16/\x2fclass\x2ftty\x2ftty16: time stamp
2000-01-01 00:00:05 is 0.585449244 s in the future
tar: dev/.udev/names/tty16: time stamp 2000-01-01 00:00:05 is
0.585296656 s in the future
tar: dev/.udev/names/tty15/\x2fclass\x2ftty\x2ftty15: time stamp
2000-01-01 00:00:05 is 0.585083033 s in the future
tar: dev/.udev/names/tty15: time stamp 2000-01-01 00:00:05 is
0.584930445 s in the future
tar: dev/.udev/names/tty14/\x2fclass\x2ftty\x2ftty14: time stamp
2000-01-01 00:00:05 is 0.58474734 s in the future
tar: dev/.udev/names/tty14: time stamp 2000-01-01 00:00:05 is
0.584594752 s in the future
tar: dev/.udev/names/tty13/\x2fclass\x2ftty\x2ftty13: time stamp
2000-01-01 00:00:05 is 0.584381129 s in the future
tar: dev/.udev/names/tty13: time stamp 2000-01-01 00:00:05 is
0.584228541 s in the future
tar: dev/.udev/names/tty12/\x2fclass\x2ftty\x2ftty12: time stamp
2000-01-01 00:00:05 is 0.584045436 s in the future
tar: dev/.udev/names/tty12: time stamp 2000-01-01 00:00:05 is
0.583892848 s in the future
tar: dev/.udev/names/tty11/\x2fclass\x2ftty\x2ftty11: time stamp
2000-01-01 00:00:05 is 0.583587672 s in the future
tar: dev/.udev/names/tty11: time stamp 2000-01-01 00:00:05 is
0.583435084 s in the future
tar: dev/.udev/names/tty10/\x2fclass\x2ftty\x2ftty10: time stamp
2000-01-01 00:00:05 is 0.583221461 s in the future
tar: dev/.udev/names/tty10: time stamp 2000-01-01 00:00:05 is
0.583038356 s in the future
tar: dev/.udev/names/tty1/\x2fclass\x2ftty\x2ftty1: time stamp
2000-01-01 00:00:05 is 0.58285525 s in the future
tar: dev/.udev/names/tty1: time stamp 2000-01-01 00:00:05 is
0.582702662 s in the future
tar: dev/.udev/names/tty0/\x2fclass\x2ftty\x2ftty0: time stamp
2000-01-01 00:00:05 is 0.582519557 s in the future
tar: dev/.udev/names/tty0: time stamp 2000-01-01 00:00:05 is
0.582366969 s in the future
tar: dev/.udev/names/tty/\x2fclass\x2ftty\x2ftty: time stamp
2000-01-01 00:00:05 is 0.582122828 s in the future
tar: dev/.udev/names/tty: time stamp 2000-01-01 00:00:05 is
0.581970241 s in the future
tar: dev/.udev/names/ptmx/\x2fclass\x2ftty\x2fptmx: time stamp
2000-01-01 00:00:05 is 0.581787135 s in the future
tar: dev/.udev/names/ptmx: time stamp 2000-01-01 00:00:05 is
0.237396262 s in the future
tar: dev/.udev/names/console/\x2fclass\x2ftty\x2fconsole: time stamp
2000-01-01 00:00:05 is 0.237152121 s in the future
tar: dev/.udev/names/console: time stamp 2000-01-01 00:00:05 is
0.236969016 s in the future
tar: dev/.udev/names/snd\x2ftimer/\x2fclass\x2fsound\x2ftimer: time
stamp 2000-01-01 00:00:05 is 0.236724874 s in the future
tar: dev/.udev/names/snd\x2ftimer: time stamp 2000-01-01 00:00:05 is
0.236572286 s in the future
tar: dev/.udev/names/snd\x2fpcmC0D0p/\x2fclass\x2fsound\x2fpcmC0D0p:
time stamp 2000-01-01 00:00:05 is 0.236358663 s in the future
tar: dev/.udev/names/snd\x2fpcmC0D0p: time stamp 2000-01-01 00:00:05
is 0.236206076 s in the future
tar: dev/.udev/names/snd\x2fpcmC0D0c/\x2fclass\x2fsound\x2fpcmC0D0c:
time stamp 2000-01-01 00:00:05 is 0.235961935 s in the future
tar: dev/.udev/names/snd\x2fpcmC0D0c: time stamp 2000-01-01 00:00:05
is 0.235809347 s in the future
tar: dev/.udev/names/mixer/\x2fclass\x2fsound\x2fmixer: time stamp
2000-01-01 00:00:05 is 0.235351583 s in the future
tar: dev/.udev/names/mixer: time stamp 2000-01-01 00:00:05 is
0.235168478 s in the future
tar: dev/.udev/names/dsp/\x2fclass\x2fsound\x2fdsp: time stamp
2000-01-01 00:00:05 is 0.234954855 s in the future
tar: dev/.udev/names/dsp: time stamp 2000-01-01 00:00:05 is
0.234771749 s in the future
tar: dev/.udev/names/snd\x2fcontrolC0/\x2fclass\x2fsound\x2fcontrolC0:
time stamp 2000-01-01 00:00:05 is 0.234558126 s in the future
tar: dev/.udev/names/snd\x2fcontrolC0: time stamp 2000-01-01 00:00:05
is 0.234405539 s in the future
tar: dev/.udev/names/audio/\x2fclass\x2fsound\x2faudio: time stamp
2000-01-01 00:00:05 is 0.234161398 s in the future
tar: dev/.udev/names/audio: time stamp 2000-01-01 00:00:05 is
0.23400881 s in the future
tar: dev/.udev/names/rtc0/\x2fclass\x2frtc\x2frtc0: time stamp
2000-01-01 00:00:05 is 0.233795187 s in the future
tar: dev/.udev/names/rtc0: time stamp 2000-01-01 00:00:05 is
0.233642599 s in the future
tar: dev/.udev/names/rtc/\x2fclass\x2frtc\x2frtc0: time stamp
2000-01-01 00:00:05 is 0.233459494 s in the future
tar: dev/.udev/names/rtc: time stamp 2000-01-01 00:00:05 is
0.233306906 s in the future
tar: dev/.udev/names/mtd4ro/\x2fclass\x2fmtd\x2fmtd4ro: time stamp
2000-01-01 00:00:05 is 0.233093283 s in the future
tar: dev/.udev/names/mtd4ro: time stamp 2000-01-01 00:00:05 is
0.232940695 s in the future
tar: dev/.udev/names/mtd4/\x2fclass\x2fmtd\x2fmtd4: time stamp
2000-01-01 00:00:05 is 0.23275759 s in the future
tar: dev/.udev/names/mtd4: time stamp 2000-01-01 00:00:05 is
0.232605002 s in the future
tar: dev/.udev/names/mtd3ro/\x2fclass\x2fmtd\x2fmtd3ro: time stamp
2000-01-01 00:00:05 is 0.232360861 s in the future
tar: dev/.udev/names/mtd3ro: time stamp 2000-01-01 00:00:05 is
0.232208273 s in the future
tar: dev/.udev/names/mtd3/\x2fclass\x2fmtd\x2fmtd3: time stamp
2000-01-01 00:00:05 is 0.232025168 s in the future
tar: dev/.udev/names/mtd3: time stamp 2000-01-01 00:00:05 is
0.231842062 s in the future
tar: dev/.udev/names/mtd2ro/\x2fclass\x2fmtd\x2fmtd2ro: time stamp
2000-01-01 00:00:05 is 0.231597922 s in the future
tar: dev/.udev/names/mtd2ro: time stamp 2000-01-01 00:00:05 is
0.231414816 s in the future
tar: dev/.udev/names/mtd2/\x2fclass\x2fmtd\x2fmtd2: time stamp
2000-01-01 00:00:05 is 0.231201193 s in the future
tar: dev/.udev/names/mtd2: time stamp 2000-01-01 00:00:05 is
0.231048605 s in the future
tar: dev/.udev/names/mtd1ro/\x2fclass\x2fmtd\x2fmtd1ro: time stamp
2000-01-01 00:00:05 is 0.230834982 s in the future
tar: dev/.udev/names/mtd1ro: time stamp 2000-01-01 00:00:05 is
0.230682394 s in the future
tar: dev/.udev/names/mtd1/\x2fclass\x2fmtd\x2fmtd1: time stamp
2000-01-01 00:00:05 is 0.230499289 s in the future
tar: dev/.udev/names/mtd1: time stamp 2000-01-01 00:00:05 is
0.230346701 s in the future
tar: dev/.udev/names: time stamp 2000-01-01 00:00:06 is 0.873504671 s
in the future
tar: dev/.udev/db/\x2fclass\x2finput\x2finput3\x2fevent3: time stamp
2000-01-01 00:00:06 is 0.873107943 s in the future
tar: dev/.udev/db/\x2fclass\x2finput\x2finput3\x2fmouse0: time stamp
2000-01-01 00:00:06 is 0.872772249 s in the future
tar: dev/.udev/db: time stamp 2000-01-01 00:00:06 is 0.859924347 s in the f=
uture
tar: dev/.udev/uevent_seqnum: time stamp 2000-01-01 00:00:06 is
0.859649689 s in the future
tar: dev/.udev/failed: time stamp 2000-01-01 00:00:06 is 0.857849152 s
in the future
tar: dev/.udev: udevd version 124 started
time stamp 2000-01-01 00:00:06 is 0.857696564 s in the future
tar: dev: time stamp 2000-01-01 00:00:06 is 0.857513459 s in the future

Remounting root file system...
SR1: VDD autocomp is not active
uncorrectable error : <3>uncorrectable error : <3>end_request: I/O
error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
uncorrectable error : <3>end_request: I/O error, dev mtdblock0, sector 8
Buffer I/O error on device mtdblock0, logical block 1
uncorrectable error : <3>end_request: I/O error, dev mtdblock0, sector 16
Buffer I/O error on device mtdblock0, logical block 2
end_request: I/O error, dev mtdblock0, sector 24
Buffer I/O error on device mtdblock0, logical block 3
uncorrectable error : <3>uncorrectable error : <3>end_request: I/O
error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
SR1: VDD autocomp is not active
Unknown HZ value! (90) Assume 100.
ALSA: Restoring mixer settings...
Configuring network interfaces... eth0: link up, 100Mbps, full-duplex,
lpa 0x45E1
eth0 =C2=A0 =C2=A0 =C2=A0no wireless extensions.

udhcpc (v1.13.2) started
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Sending discover...
Sending select for 192.168.1.112...
Lease of 192.168.1.112 obtained, lease time 43200
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
adding dns 192.168.1.254
done.
Starting portmap daemon: portmap.
Unknown HZ value! (91) Assume 100.
net.ipv4.conf.default.rp_filter =3D 1
net.ipv4.conf.all.rp_filter =3D 1
Tue Apr 14 12:53:00 BST 2009
INIT: Entering runlevel: 5
Configuring leds:
=C2=A0beagleboard::usr0: heartbeat
=C2=A0beagleboard::usr1: mmc0
Starting Dropbear SSH server: dropbear.
Starting advanced power management daemon: No APM support in kernel
(failed.)
Starting system message bus: dbus.
Starting Hardware abstraction layer hald
Starting syslogd/klogd: done
* Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
[ ok ]
Starting Connection Manager
/etc/init.d/rc: line 168: /etc/rc5.d/S30ntpdate: Permission denied
Starting GPE display manager: gpe-dm

.-------.
| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.-.
| =C2=A0 | =C2=A0 |-----.-----.-----.| | =C2=A0 .----..-----.-----.
| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 | __ =C2=A0| =C2=A0---'| '--.| =C2=
=A0.-'| =C2=A0 =C2=A0 | =C2=A0 =C2=A0 |
| =C2=A0 | =C2=A0 | =C2=A0| =C2=A0| =C2=A0 =C2=A0 |--- =C2=A0|| =C2=A0--'| =
=C2=A0| =C2=A0| =C2=A0' =C2=A0| | | |
'---'---'--'--'--. =C2=A0|-----''----''--' =C2=A0'-----'-'-'-'
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-' =C2=A0|
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'---'

The Angstrom Distribution beagleboard ttyS2

Angstrom 2009.X-test-20090331 beagleboard ttyS2

beagleboard login: SR1: VDD autocomp is not active
omap-dss DISPC error: dispc irq error status 100e6
omap-dss DISPC error: dispc irq error status 00e2
SR2: VDD autocomp is not active
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 00e2
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 00e2
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
SR1: VDD autocomp is not active

.-------.
| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.-.
| =C2=A0 | =C2=A0 |-----.-----.-----.| | =C2=A0 .----..-----.-----.
| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 | __ =C2=A0| =C2=A0---'| '--.| =C2=
=A0.-'| =C2=A0 =C2=A0 | =C2=A0 =C2=A0 |
| =C2=A0 | =C2=A0 | =C2=A0| =C2=A0| =C2=A0 =C2=A0 |--- =C2=A0|| =C2=A0--'| =
=C2=A0| =C2=A0| =C2=A0' =C2=A0| | | |
'---'---'--'--'--. =C2=A0|-----''----''--' =C2=A0'-----'-'-'-'
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-' =C2=A0|
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'---'

The Angstrom Distribution beagleboard ttyS2

Angstrom 2009.X-test-20090331 beagleboard ttyS2

beagleboard login: root
root@beagleboard:~# cat /sys/
/sys/block/ =C2=A0 =C2=A0 /sys/class/ =C2=A0 =C2=A0 /sys/devices/ =C2=A0 /s=
ys/fs/ =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/module/
/sys/bus/ =C2=A0 =C2=A0 =C2=A0 /sys/dev/ =C2=A0 =C2=A0 =C2=A0 /sys/firmware=
/ =C2=A0/sys/kernel/ =C2=A0 =C2=A0/sys/power/
root@beagleboard:~# cat /sys/devices/
/sys/devices/platform/ =C2=A0/sys/devices/system/
root@beagleboard:~# cat /sys/devices/platform/
/sys/devices/platform/ehci-omap.0/ =C2=A0 =C2=A0 /sys/devices/platform/omap=
-mcbsp.5/
/sys/devices/platform/gpio-keys/ =C2=A0 =C2=A0 =C2=A0 /sys/devices/platform=
/omap2-nand/
/sys/devices/platform/i2c_omap.1/ =C2=A0 =C2=A0 =C2=A0/sys/devices/platform=
/omap34xx_temp/
/sys/devices/platform/i2c_omap.3/ =C2=A0 =C2=A0 =C2=A0/sys/devices/platform=
/omap_wdt/
/sys/devices/platform/leds-gpio/ =C2=A0 =C2=A0 =C2=A0 /sys/devices/platform=
/omapfb/
/sys/devices/platform/mmci-omap-hs.0/ =C2=A0/sys/devices/platform/power/
/sys/devices/platform/musb_hdrc/ =C2=A0 =C2=A0 =C2=A0 /sys/devices/platform=
/regulatory.0/
/sys/devices/platform/omap-dss/ =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/pla=
tform/serial8250.0/
/sys/devices/platform/omap-mcbsp.1/ =C2=A0 =C2=A0/sys/devices/platform/seri=
al8250/
/sys/devices/platform/omap-mcbsp.2/ =C2=A0 =C2=A0/sys/devices/platform/soc-=
audio/
/sys/devices/platform/omap-mcbsp.3/ =C2=A0 =C2=A0/sys/devices/platform/ueve=
nt
/sys/devices/platform/omap-mcbsp.4/
root@beagleboard:~# cat /sys/devices/platform/omapfb/
/sys/devices/platform/omapfb/bus/
/sys/devices/platform/omapfb/displays
/sys/devices/platform/omapfb/driver/
/sys/devices/platform/omapfb/framebuffers
/sys/devices/platform/omapfb/graphics:fb0/
/sys/devices/platform/omapfb/graphics:fb1/
/sys/devices/platform/omapfb/graphics:fb2/
/sys/devices/platform/omapfb/managers
/sys/devices/platform/omapfb/modalias
/sys/devices/platform/omapfb/overlays
/sys/devices/platform/omapfb/power/
/sys/devices/platform/omapfb/subsystem/
/sys/devices/platform/omapfb/uevent
root@beagleboard:~# cat /sys/devices/platform/omapfb/displays
dvi e:1 u:1 t:0 h:1280/220/110/40 v:720/20/5/5 p:74250
tv e:0 u:-1 t:0 h:720/0/0/0 v:574/0/0/0 p:0
root@beagleboard:~# cat /sys/devices/platform/omapfb/graphics\:fb0/
/sys/devices/platform/omapfb/graphics:fb0/bits_per_pixel
/sys/devices/platform/omapfb/graphics:fb0/blank
/sys/devices/platform/omapfb/graphics:fb0/console
/sys/devices/platform/omapfb/graphics:fb0/cursor
/sys/devices/platform/omapfb/graphics:fb0/dev
/sys/devices/platform/omapfb/graphics:fb0/device/
/sys/devices/platform/omapfb/graphics:fb0/mode
/sys/devices/platform/omapfb/graphics:fb0/modes
/sys/devices/platform/omapfb/graphics:fb0/name
/sys/devices/platform/omapfb/graphics:fb0/pan
/sys/devices/platform/omapfb/graphics:fb0/power/
/sys/devices/platform/omapfb/graphics:fb0/rotate
/sys/devices/platform/omapfb/graphics:fb0/state
/sys/devices/platform/omapfb/graphics:fb0/stride
/sys/devices/platform/omapfb/graphics:fb0/subsystem/
/sys/devices/platform/omapfb/graphics:fb0/uevent
/sys/devices/platform/omapfb/graphics:fb0/virtual_size
root@beagleboard:~# cat /sys/devices/platform/omapfb/graphics\:fb0/modes
U:1280x720p-60
root@beagleboard:~#


