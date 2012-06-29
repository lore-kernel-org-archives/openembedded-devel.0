Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1Ska0C-0004Qo-Hx
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 14:08:44 +0200
Received: from [10.175.196.243] (217.208.84.65) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 4FD624AF0068EA8E for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 13:55:06 +0200
Message-ID: <4FED9799.4010600@emagii.com>
Date: Fri, 29 Jun 2012 13:55:05 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Trouble mounting a JFFS2 fs.
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
X-List-Received-Date: Fri, 29 Jun 2012 12:08:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: Quoted-Printable

Getting lots of strange error messages when trying to mount a JFFS2 file=20
system
built from OE classic 2011.03

It is built using:
EXTRA_IMAGECMD_jffs2 =3D "--little-endian --eraseblock=3D0x20000=20
--pagesize=3D0x800 -n"

and programmed into the flash using u-boot "nand write".
The machine is an AT91SAM9N12 configured to use S/W ECC for U-Boot and=20
kernel.
I have tried H/W ECC before with less success.

There is one bad block in the rootfs are and there is a CRC error on the=20
initial check,
but the JFFS2 file system seems to mount, and the init routines start
to execute, but I have a feeling that the file system is mounted readonly
at that stage, even though the command line says "rw".

When NFS mounting the image using the SAM9N12EK I do not have any problem=
s.

Any clues?

BR
Ulf Samuelsson

Relevant parts of the bootlog are: (full bootlog below)

atmel_nand atmel_nand: Using dma0chan0 for DMA transfers.
ONFI flash detected
ONFI param page 0 valid
NAND device: Manufacturer ID: 0xad, Chip ID: 0xa1 (Hynix H27S1G8F2BFR-BC)
Scanning device for bad blocks
Bad eraseblock 82 at 0x000000a40000
...
jffs2_scan_dirent_node(): Node CRC failed on node at 0x00274194: Read=20
0x681bfdff, calculated 0x681bfddf
...
VFS: Mounted root (jffs2 filesystem) on device 31:1.
devtmpfs: mounted
Freeing init memory: 132K
INIT: version 2.86 booting
Please wait: booting...
Starting udev
Remounting root file system...
Caching udev devnodes
Populating dev cache
logger: mount: mount point /proc/bus/usb does not exist
ALSA: Restoring mixer settings...
/usr/sbin/alsactl: load_state:1625: No soundcards found...
Configuring update-modules.
Configuring ppp.
Configuring ppp-dialin.
Configuring e2fsprogs.
/usr/bin/update-alternatives: line 193: sed: Text file busy
//usr/lib/opkg/info/e2fsprogs.postinst: line 2: update-alternatives:=20
Text file busy


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FULL BOOT LOG

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.39 (ulf@grond) (gcc version 4.5.3 20110311=20
(prerelease) (GCC) ) #1 Fri Jun 29 13:10:12 CEST 2012
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: AT91SAM9N12EK2
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 399 MHz, master 133 MHz, main 16.000 MHz
Built 1 zonelists in Zone order, mobility grouping on. Total pages: 16256
Kernel command line: mem=3D64M console=3DttyS0,115200 root=3D/dev/mtdbloc=
k1 rw=20
rootfstype=3Djffs2
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB =3D 64MB total
Memory: 61120k/61120k available, 4416k reserved, 0K highmem
Virtual kernel memory layout:
vector : 0xffff0000 - 0xffff1000 ( 4 kB)
fixmap : 0xfff00000 - 0xfffe0000 ( 896 kB)
DMA : 0xff000000 - 0xffe00000 ( 14 MB)
vmalloc : 0xc4800000 - 0xfee00000 ( 934 MB)
lowmem : 0xc0000000 - 0xc4000000 ( 64 MB)
modules : 0xbf000000 - 0xc0000000 ( 16 MB)
.init : 0xc0008000 - 0xc0029000 ( 132 kB)
.text : 0xc0029000 - 0xc0370000 (3356 kB)
.data : 0xc0370000 - 0xc0392320 ( 137 kB)
NR_IRQS:192
AT91: 128 gpio irqs in 4 banks
Console: colour dummy device 80x30
console [ttyS0] enabled
Calibrating delay loop... 199.06 BogoMIPS (lpj=3D995328)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
devtmpfs: initialized
NET: Registered protocol family 16
AT91: Power Management (with slow clock mode)
AT91: Starting after user reset
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
at_hdmac at_hdmac.0: Atmel AHB DMA Controller ( cpy slave ), 8 channels
Bluetooth: Core ver 2.16
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
Switching to clocksource tcb_clksrc
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
JFFS2 version 2.2. (NAND) (SUMMARY) =EF=BF=BD=C2=A9 2001-2006 Red Hat, In=
c.
msgmni has been set to 119
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
brd: module loaded
loop: module loaded
ssc ssc.0: Atmel SSC device at 0xc4870000 (irq 28)
atmel_nand atmel_nand: Using dma0chan0 for DMA transfers.
ONFI flash detected
ONFI param page 0 valid
NAND device: Manufacturer ID: 0xad, Chip ID: 0xa1 (Hynix H27S1G8F2BFR-BC)
Scanning device for bad blocks
Bad eraseblock 82 at 0x000000a40000
Creating 2 MTD partitions on "atmel_nand":
0x000000000000-0x000000400000 : "Boot"
0x000000400000-0x000008000000 : "RootFS"
atmel_spi atmel_spi.0: Using dma0chan1 (tx) and dma0chan2 (rx) for DMA=20
transfers
atmel_spi atmel_spi.0: Atmel SPI Controller at 0xf0000000 (irq 13)
enc28j60 spi0.0: enc28j60 Ethernet driver 1.01 loaded
enc28j60 spi0.0: enc28j60 chip not found
enc28j60: probe of spi0.0 failed with error -5
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 22, io mem 0x00500000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver libusual
mousedev: PS/2 mouse device common for all mice
input: gpio-keys as /devices/platform/gpio-keys/input/input0
at91_rtc at91_rtc: rtc core: registered at91_rtc as rtc0
AT91 Real Time Clock driver.
Bluetooth: Generic Bluetooth SDIO driver ver 0.1
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
lib80211: common routines for IEEE802.11 drivers
Registering the dns_resolver key type
at91_rtc at91_rtc: setting system clock to 2007-01-01 00:09:49 UTC=20
(1167610189)
atmel_mci atmel_mci.0: Using dma0chan3 for DMA transfers
atmel_mci atmel_mci.0: Atmel MCI controller at 0xf0008000 irq 12, 1 slots
usb 1-1: new full speed USB device number 2 using at91_ohci
jffs2_scan_dirent_node(): Node CRC failed on node at 0x00274194: Read=20
0x681bfdff, calculated 0x681bfddf
scsi0 : usb-storage 1-1:1.0
scsi 0:0:0:0: Direct-Access USB2.0 FlashDisk 0.00 PQ: 0 ANSI: 2
sd 0:0:0:0: [sda] 2007039 512-byte logical blocks: (1.02 GB/979 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Assuming drive cache: write through
sd 0:0:0:0: [sda] Assuming drive cache: write through
sda: detected capacity change from 0 to 1027603968
sda: sda1
sd 0:0:0:0: [sda] Assuming drive cache: write through
sd 0:0:0:0: [sda] Attached SCSI removable disk
VFS: Mounted root (jffs2 filesystem) on device 31:1.
devtmpfs: mounted
Freeing init memory: 132K
INIT: version 2.86 booting
Please wait: booting...
Starting udev
Remounting root file system...
Caching udev devnodes
Populating dev cache
logger: mount: mount point /proc/bus/usb does not exist
ALSA: Restoring mixer settings...
/usr/sbin/alsactl: load_state:1625: No soundcards found...
Configuring update-modules.
Configuring ppp.
Configuring ppp-dialin.
Configuring e2fsprogs.
/usr/bin/update-alternatives: line 193: sed: Text file busy
//usr/lib/opkg/info/e2fsprogs.postinst: line 2: update-alternatives:=20
Text file busy
Configuring dbus.
Configuring compat-wireless.
Configuring bluez4.
Configuring wpa-supplicant.
Configuring angstrom-libc-fixup-hack.
Configuring libnss-mdns.
Configuring avahi-daemon.
Configuring avahi-autoipd.
Collected errors:
* pkg_run_script: package "e2fsprogs" postinst script returned status 2.
* opkg_configure: e2fsprogs.postinst returned 2.
* pkg_run_script: package "dbus" postinst script returned status 255.
* opkg_configure: dbus.postinst returned 255.
* pkg_run_script: package "compat-wireless" postinst script returned=20
status 255.
* opkg_configure: compat-wireless.postinst returned 255.
* pkg_run_script: package "bluez4" postinst script returned status 255.
* opkg_configure: bluez4.postinst returned 255.
* pkg_run_script: package "wpa-supplicant" postinst script returned=20
status 255.
* opkg_configure: wpa-supplicant.postinst returned 255.
* pkg_run_script: package "angstrom-libc-fixup-hack" postinst script=20
returned status 255.
* opkg_configure: angstrom-libc-fixup-hack.postinst returned 255.
* pkg_run_script: package "libnss-mdns" postinst script returned status 2=
55.
* opkg_configure: libnss-mdns.postinst returned 255.
* pkg_run_script: package "avahi-daemon" postinst script returned status=20
255.
* opkg_configure: avahi-daemon.postinst returned 255.
* pkg_run_script: package "avahi-autoipd" postinst script returned=20
status 255.
* opkg_configure: avahi-autoipd.postinst returned 255.
/etc/rcS.d/S40configure: line 25: rm: Text file busy
/etc/init.d/rc: line 172: /etc/rcS.d/S41networking: Text file busy
/etc/init.d/rc: line 172: /etc/rcS.d/S43portmap: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 23: grep: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 23: chmod: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 23: chown: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 37: /sbin/sysctl: Text=20
file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 57: rm: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 57: ln: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 69:=20
/etc/init.d/hwclock.sh: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 79: date: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 79: cat: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 79: awk: Text file busy
/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 79: expr: Text file busy
sh: 1: unknown operand
/etc/init.d/rc: line 172: /etc/rcS.d/S97blueprobe: Text file busy
INIT: Entering runlevel: 5
INIT: cannot execute "/etc/init.d/rc"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "S" respawning too fast: disabled for 5 minutes
INIT: no more processes left in this runlevel
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "S" respawning too fast: disabled for 5 minutes
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "S" respawning too fast: disabled for 5 minutes



