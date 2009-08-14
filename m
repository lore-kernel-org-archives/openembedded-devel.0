Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mbyug-00008K-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 17:41:54 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0027E65E for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 17:25:14 +0200
Message-ID: <4A8581D9.9010205@atmel.com>
Date: Fri, 14 Aug 2009 17:25:13 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8516BF.9080405@atmel.com> <h63h7v$8pk$1@ger.gmane.org>
In-Reply-To: <h63h7v$8pk$1@ger.gmane.org>
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Fri, 14 Aug 2009 15:41:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

Koen Kooi skrev:
> On 14-08-09 09:48, Ulf Samuelsson wrote:
>> I have tried opie-image which boots properly and I get a screen
>>
>> x11-gpe-image does not start properly.
>> Only a black screen.
>=20
> My crystal ball is broken, without some log files or output we can't
> help you
>=20
>=20
There is really no output

gpe_dm is started and then nothing happens.


I can use mplayer to play a video, but
I do not get the X-Environment.
opie-image uses the same kernel settings and this boots OK
with the right environment.

Anyone got a working ARM926EJ-S jffs2 image I can test on?


> *** AT91Bootstrap-2.13-rc1
> AT45DB642D detected
> Valid image found
> From: [0x00008400] To:        [0x23F00000] Size:      [0x00040000]
> ........SUCCESS
> Start:        [0x23F00000]

U-Boot 2009.08-rc2 (Aug 13 2009 - 08:57:38)

DRAM:  64 MB
NAND:  256 MiB
DataFlash:AT45DB642
Nb pages:   8192
Page Size:   1056
Size=3D 8650752 bytes
Logical address: 0xC0000000
Area 0: C0000000 to C00041FF (RO) Bootstrap
Area 1: C0004200 to C00083FF      Environment
Area 2: C0008400 to C0041FFF (RO) U-Boot
Area 3: C0084000 to C0293FFF      Kernel
Area 4: C0294000 to C083FFFF      FS
Net:   macb0
macb0: Starting autonegotiation...
macb0: Autonegotiation complete
macb0: link up, 100Mbps full-duplex (lpa: 0xc5e1)
Hit any key to stop autoboot:  0
Saving Environment to dataflash...
## Booting kernel from Legacy Image at 21000000 ...
   Image Name:   Angstrom/2.6.30.2/at91sam9263dfc
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2072200 Bytes =3D  2 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing
Linux....................................................................=
..................................................................
done, booting the kernel.
[    0.000000] Linux version 2.6.30.2 (ulf@grond) (gcc version 4.3.3
(GCC) ) #1 PREEMPT Fri Aug 14 00:23:38 CEST 2009
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ),
cr=3D00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Atmel AT91SAM9263-EK
[    0.000000] Ignoring unrecognised tag 0x54410008
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] Clocks: CPU 199 MHz, master 99 MHz, main 16.367 MHz
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 16256
[    0.000000] Kernel command line: root=3D/dev/mtdblock1 rootfstype=3Djf=
fs2
ip=3D10.175.196.18:10.175.196.247:10.175.196.1:255.255.255.0
console=3DttyS0,115200,mem=3D64M
[    0.000000] NR_IRQS:192
[    0.000000] AT91: 160 gpio irqs in 5 banks
[    0.000000] PID hash table entries: 256 (order: 8, 1024 bytes)
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [ttyS0] enabled
[    0.080000] Dentry cache hash table entries: 8192 (order: 3, 32768
bytes)
[    0.090000] Inode-cache hash table entries: 4096 (order: 2, 16384 byte=
s)
[    0.100000] Memory: 64MB =3D 64MB total
[    0.110000] Memory: 60372KB available (3744K code, 492K data, 136K
init, 0K highmem)
[    0.120000] Calibrating delay loop... 99.53 BogoMIPS (lpj=3D497664)
[    0.310000] Security Framework initialized
[    0.310000] Mount-cache hash table entries: 512
[    0.320000] CPU: Testing write buffer coherency: ok
[    0.340000] net_namespace: 764 bytes
[    0.350000] NET: Registered protocol family 16
[    0.380000] AT91: Power Management
[    0.390000] AT91: Starting after user reset
[    0.450000] bio: create slab <bio-0> at 0
[    0.460000] SCSI subsystem initialized
[    0.470000] usbcore: registered new interface driver usbfs
[    0.470000] usbcore: registered new interface driver hub
[    0.480000] usbcore: registered new device driver usb
[    0.510000] NET: Registered protocol family 2
[    0.510000] IP route cache hash table entries: 1024 (order: 0, 4096
bytes)
[    0.520000] TCP established hash table entries: 2048 (order: 2, 16384
bytes)
[    0.530000] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    0.530000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.540000] TCP reno registered
[    0.550000] NET: Registered protocol family 1
[    0.560000] JFFS2 version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red =
Hat,
Inc.
[    0.570000] msgmni has been set to 118
[    0.590000] alg: No test for stdrng (krng)
[    0.590000] io scheduler noop registered
[    0.600000] io scheduler cfq registered (default)
[    0.610000] atmel_lcdfb atmel_lcdfb.0: 150KiB frame buffer at
239c0000 (mapped at ffc00000)
[    0.700000] Console: switching to colour frame buffer device 30x40
[    0.710000] atmel_lcdfb atmel_lcdfb.0: fb0: Atmel LCDC at 0x00700000
(mapped at c48d6000), irq 26
[    0.900000] atmel_usart.0: ttyS0 at MMIO 0xfeffee00 (irq =3D 1) is a
ATMEL_SERIAL
[    0.900000] atmel_usart.1: ttyS1 at MMIO 0xfff8c000 (irq =3D 7) is a
ATMEL_SERIAL
[    0.940000] loop: module loaded
[    0.950000] Driver 'sd' needs updating - please use bus_type methods
[    0.960000] MACB_mii_bus: probed
[    0.970000] eth0: Atmel MACB at 0xfffbc000 irq 21 (04:25:fe:ed:00:18)
[    0.970000] eth0: attached PHY driver [Davicom DM9161A]
(mii_bus:phy_addr=3Dffffffff:00, irq=3D-1)
[    1.000000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xda
(Samsung NAND 256MiB 3,3V 8-bit)
[    1.010000] AT91 NAND: 8-bit, Software ECC
[    1.020000] Scanning device for bad blocks
[    1.100000] Creating 3 MTD partitions on "atmel_nand":
[    1.110000] 0x000000000000-0x000000400000 : "Bootstrap"
[    1.120000] 0x000000400000-0x000008000000 : "Root File System"
[    1.130000] 0x000008000000-0x000010000000 : "Data"
[    1.140000] atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffa4000
(irq 14)
[    1.150000] mtd_dataflash spi0.0: AT45DB642x (8448 KBytes) pagesize
1056 bytes (OTP)
[    1.170000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.180000] at91_ohci at91_ohci: AT91 OHCI
[    1.190000] at91_ohci at91_ohci: new USB bus registered, assigned bus
number 1
[    1.190000] at91_ohci at91_ohci: irq 29, io mem 0x00a00000
[    1.260000] usb usb1: configuration #1 chosen from 1 choice
[    1.270000] hub 1-0:1.0: USB hub found
[    1.270000] hub 1-0:1.0: 2 ports detected
[    1.280000] Initializing USB Mass Storage driver...
[    1.290000] usbcore: registered new interface driver usb-storage
[    1.290000] USB Mass Storage support registered.
[    1.300000] mice: PS/2 mouse device common for all mice
[    1.310000] input: gpio-keys as /devices/platform/gpio-keys/input/inpu=
t0
[    1.320000] ads7846 spi0.3: touchscreen, irq 31
[    1.320000] input: ADS784x Touchscreen as
/devices/platform/atmel_spi.0/spi0.3/input/input1
[    1.340000] rtc-at91sam9 at91_rtt.0: rtc core: registered at91_rtt as
rtc0
[    1.350000] IRQ 1/rtc0: IRQF_DISABLED is not guaranteed on shared IRQs
[    1.350000] i2c /dev entries driver
[    1.360000] at24 0-0050: 65536 byte 24c512 EEPROM (writable)
[    1.370000] i2c-gpio i2c-gpio: using pins 68 (SDA) and 69 (SCL)
[    1.380000] AT91SAM9 Watchdog: sorry, watchdog is disabled
[    1.380000] at91_wdt: probe of at91_wdt failed with error -5
[    1.390000] cpuidle: using governor ladder
[    1.390000] cpuidle: using governor menu
[    1.400000] Registered led device: ds1
[    1.410000] Registered led device: ds2
[    1.410000] Registered led device: ds3
[    1.450000] usbcore: registered new interface driver usbhid
[    1.450000] usbhid: v2.6:USB HID core driver
[    1.460000] Advanced Linux Sound Architecture Driver Version 1.0.20.
[    1.470000] AC97C regs =3D FFFA0000
[    1.470000] AC97C irq  =3D 18
[    1.480000] at91-ac97: codec write timeout
<4>at91-ac97: codec write timeout
<4>at91-ac97: codec write timeout
<4>at91-ac97: codec write timeout
<6>ALSA device list:
[    1.530000]   #0: Atmel AC97 Controller at 0xfffa0000, irq 18
[    1.540000] TCP cubic registered
[    1.540000] NET: Registered protocol family 17
[    1.540000] RPC: Registered udp transport module.
[    1.550000] RPC: Registered tcp transport module.
[    1.560000] rtc-at91sam9 at91_rtt.0: setting system clock to
2009-08-14 00:40:40 UTC (1250210440)
[    1.650000] usb 1-1: new full speed USB device using at91_ohci and
address 2
[    1.830000] usb 1-1: configuration #1 chosen from 1 choice
[    1.840000] scsi0 : SCSI emulation for USB Mass Storage devices
[    3.090000] IP-Config: Complete:
[    3.090000]      device=3Deth0, addr=3D10.175.196.18, mask=3D255.255.2=
55.0,
gw=3D10.175.196.1,
[    3.100000]      host=3D10.175.196.18, domain=3D, nis-domain=3D(none),
[    3.100000]      bootserver=3D10.175.196.247,
rootserver=3D10.175.196.247, rootpath=3D
[   13.450000] eth0: link up (100/Full)
[   13.450000] VFS: Mounted root (jffs2 filesystem) on device 31:1.
[   13.460000] Freeing init memory: 136K
[   13.470000] scsi 0:0:0:0: Direct-Access     Kingston DataTraveler 2.0
1.00 PQ: 0 ANSI: 2
[   13.570000] sd 0:0:0:0: [sda] 31309760 512-byte hardware sectors:
(16.0 GB/14.9 GiB)
[   13.580000] sd 0:0:0:0: [sda] Write Protect is off
[   13.580000] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   13.620000] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   13.630000]  sda: sda1
[   13.650000] sd 0:0:0:0: [sda] Attached SCSI removable disk
INIT: version 2.86 booting
Please wait: booting...
Starting udev[   20.340000] udev: starting version 141

Remounting root file system...
[   28.600000] udc: at91_udc version 3 May 2006
[   28.700000] g_serial gadget: Gadget Serial v2.4
[   28.730000] g_serial gadget: g_serial ready
[   29.140000] Bluetooth: Core ver 2.15
[   29.170000] NET: Registered protocol family 31
[   29.170000] Bluetooth: HCI device and connection manager initialized
[   29.180000] Bluetooth: HCI socket layer initialized
[   29.570000] Bluetooth: L2CAP ver 2.13
[   29.570000] Bluetooth: L2CAP socket layer initialized
[   29.710000] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[   31.020000] NET: Registered protocol family 10
[   31.340000] Bluetooth: RFCOMM socket layer initialized
[   31.340000] Bluetooth: RFCOMM TTY layer initialized
[   31.350000] Bluetooth: RFCOMM ver 1.11
ALSA: Restoring mixer settings...
Configuring network interfaces... [   34.450000] eth0: link down
[   35.250000] ADDRCONF(NETDEV_UP): eth0: link is not ready
eth0      no wireless extensions.

udhcpc (v1.13.2) started
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
Sending discover...
[   37.450000] eth0: link up (100/Full)
[   37.450000] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending discover...
Sending select for 10.175.196.237...
Lease of 10.175.196.237 obtained, lease time 86400
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
adding dns 10.175.196.1
done.
Starting portmap daemon: portmap.
net.ipv4.conf.default.rp_filter =3D 1
net.ipv4.conf.all.rp_filter =3D 1
INIT: Entering runlevel: 5
Starting system message bus: dbus.
Starting Hardware abstraction layer hald
Starting Connection Manager
Starting Dropbear SSH server: dropbear.
Starting music player daemon: mpdlog: problem opening log file
"/var/lib/mpd/mpd.log" (config line 33) for writing
Aborted
=2E
Starting Samba: smbd nmbd.
Starting syslogd/klogd: done
* starting FTP Server: vsftpd... done.
 * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
[ ok ]
Running ntpdate to synchronize clock.
Starting GPE display manager: gpe-dm

.-------.
|       |                  .-.
|   |   |-----.-----.-----.| |   .----..-----.-----.
|       |     | __  |  ---'| '--.|  .-'|     |     |
|   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
'---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                -'  |
                '---'

The Angstrom Distribution at91sam9263dfc ttyS0

Angstrom 2009.X-test-20090813 at91sam9263dfc ttyS0

at91sam9263dfc login: root
root@at91sam9263dfc:~#
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson



