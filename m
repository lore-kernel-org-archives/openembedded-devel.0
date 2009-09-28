Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1MsNiv-0000kr-BK
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 23:25:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id 0806F10B0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 23:25:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9pNOqd930wtF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 23:25:21 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id 6C2C410C56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 23:25:21 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Sep 2009 23:24:47 +0200
Message-Id: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Mon, 28 Sep 2009 21:25:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi everybody,

Currently the Xilinx Open Source Linux is running on our PICSY designed
platform (based on Virtex 4 FX20 FPGA for smart camera). ELDK is used as
cross compiler. Now we are going to change it with OpenEmbedded to be
more flexible with the ramdisk or root filesystem and also take benefit
of existing recipes in OE (for example openCV and ACE). 
To be in the safe corner and proceed step be step, the first try was
only to create new ramdisk with OE and again use the Xilinx Open Source
Linux but with new generated ramdisk by OE. In the first try these
settings are used in the local.conf:

MACHINE = "xilinx-ml403"
DISTRO = "angstrom-2008.1"

This step with the "bibake helloworld-image" was successful. Afterwards,
in the second step the "bitbake console-image" is tested. Unfortunately
we got stuck in this step and is not system hangs on in init step. For
your information the Kernel version we used is 1.6.29-rc5. You could see
log of system in boot up in following:


----------------------------------------------------------------------------------------------------------------------

zImage starting: loaded at 0x00400000 (sp: 0x00be7eb0)
Allocating 0x2f9a19 bytes for kernel ...
gunzipping (0x00000000 <- 0x0040d000:0x00564427)...done 0x2dde20 bytes
Attached initrd image at 0x00565000-0x00be6d1d
initrd head: 0x1f8b0808

Linux/PowerPC load: console=ttyUL0 root=/dev/ram rw init=/bin/init
Finalizing device tree... flat tree at 0xbf4300
Using Xilinx Virtex machine description
Linux version 2.6.29-rc5 (akzare@orest) (gcc version 4.2.2) #63 PREEMPT
Thu Sep 24 20:17:09 CEST 2009
Found initrd at 0xc0565000:0xc0be6d1d
Zone PFN ranges:
  DMA      0x00000000 -> 0x000075ff
  Normal   0x000075ff -> 0x000075ff
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x000075ff
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
29971
Kernel command line: console=ttyUL0 root=/dev/ram rw init=/bin/init
Xilinx intc at 0x81800000 mapped to 0xfdfff000
PID hash table entries: 512 (order: 9, 2048 bytes)
clocksource: timebase mult[d55555] shift[22] registered
Console: colour dummy device 80x25
console [ttyUL0] enabled
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 109876k/120828k available (2784k kernel code, 10808k reserved,
128k data, 110k bss, 148k init)
Calibrating delay loop... 598.01 BogoMIPS (lpj=1196032)
Mount-cache hash table entries: 512
net_namespace: 880 bytes
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
NET: Registered protocol family 1
checking if image is initramfs...it isn't (no cpio magic); looks like an
initrd
Freeing initrd memory: 6663k freed
msgmni has been set to 227
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
84000000.serial: ttyUL0 at MMIO 0x84000003 (irq = 16) is a uartlite
brd: module loaded
loop: module loaded
nbd: registered device at major 43
Device Tree Probing 'ethernet'
xilinx_lltemac 81c00000.ethernet: MAC address is now  2: 0: 0: 0: 0: 0
xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
XLlTemac: Dma base address: phy: 0x84600100, virt: 0xc8018100
XLlTemac: buffer descriptor size: 32768 (0x8000)
XLlTemac: Allocating DMA descriptors with kmalloc<6>XLlTemac:
(buffer_descriptor_init) phy: 0x6c80000, virt: 0xc6c80000, size: 0x8000
XTemac: No PHY detected.  Assuming a PHY at address 0
eth0 (): not using net_device_ops yet
eth0: Dropping NETIF_F_SG since no checksum feature.
xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at 0x81C00000
mapped to 0xC8012000, irq=17
Linux video capture interface: v2.00
TCP cubic registered
NET: Registered protocol family 17
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing unused kernel memory: 148k init
Failed to execute /bin/init.  Attempting defaults...
INIT: version 2.86 booting
Starting udev and populating dev cache
Remounting root file system...
WARNING: Couldn't open directory /lib/modules/2.6.29-rc5: No such file
or directory
FATAL: Could not open /lib/modules/2.6.29-rc5/modules.dep.temp for
writing: No such file or directory
root: mount: mount point /proc/bus/usb does not exist
Configuring network interfaces... eth0: XLlTemac: Options: 0x3fa
eth0: XLlTemac: allocating interrupt 19 for dma mode tx.
eth0: XLlTemac: allocating interrupt 18 for dma mode rx.
eth0: XLlTemac: We renegotiated the speed to: 100
eth0: XLlTemac: speed set to 100Mb/s
eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 254
udhcpc (v1.13.2) started
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
Sending discover...
Sending discover...
Sending discover...
run-parts: /etc/udhcpc.d/99avahi-autoipd exited with code 1
No lease, failing
done.
Starting portmap daemon: portmap.
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.rp_filter = 1
hwclock: can't open '/dev/misc/rtc': No such file or directory
Fri Sep 25 17:43:00 UTC 2009
hwclock: can't open '/dev/misc/rtc': No such file or directory
Configuring avahi-daemon
 System startup links for /etc/init.d/avahi-daemon already exist.
Configuring libnss-mdns
Configuring ppp-dialin
Configuring avahi-autoipd
Configuring angstrom-libc-fixup-hack
Configuring dbus
 System startup links for /etc/init.d/dbus-1 already exist.
Configuring ppp
INIT: Entering runlevel: 5
Creating Dropbear SSH server RSA host key.
Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
Generating key, this may take a while...
Public key portion is:
ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAAAgwC5CKkPhMsuidec4TYxjnSBcQk57SZBiIXbVPkt5SvXVv008piyVuaYFnowJVqa8WkYtdr80lSmHNfquU0PmlHHzaiXZJbjETtj7LRFKYbrjrD+LpcypqyzyMLM+r9F/Ngm31Xj6Ms45K21MZgksB3plafgD855LwLNnKnBF5V/1kJj root@xilinx-ml403
Fingerprint: md5 43:57:34:3b:13:e7:5d:bb:76:21:29:8b:c1:56:5d:a7
Starting Dropbear SSH server: modprobe: FATAL: Could not
load /lib/modules/2.6.29-rc5/modules.dep: No such file or directory

modprobe: FATAL: Could not load /lib/modules/2.6.29-rc5/modules.dep: No
such file or directory

dropbear.
Starting system message bus: dbus.
Starting syslogd/klogd: done
 * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
[ ok ]
INIT: Id "S" respawning too fast: disabled for 5 minutes
.
.
.
----------------------------------------------------------------------------------------------------------------------

Considering the log, I have checked the /lib/modules/ directory in my OE
and it seems the version is "oe/tmp/rootfs/lib/modules/2.6.24-rc3" and I
guess maybe the problem is the mismatch between the version of Linux
kernel from Xilinx and OE. IF it is the reason, what should be the
solution? 

On the other hand, it seems the generated ramdisk is not fit into our
desire. Total DDR memory of our system is 128M and this generated
ramdsik occupied nearly 25M. Maybe it is because of using
"angstrom-2008.1". In our system we don't need X11 or ... Now, the
question is how could I remove all unnecessary staff from ramdisk to
make it smaller? Or is there any other solution better than
angstrom-2008.1?

I've started to read usermanual of OE, but still I have not found out a
solution for this problem. Is there any idea how could I proceed to have
a running OE Linux on our Virtex 4 platform from scratch with
consideration of all tricky ways not to face with such pitfall again?

I would be grateful to receive promptly your solution through
compilation and installation of OE on hardcore Power PC 405 inside
Virtex 4.

Thanks in advance.

Regards
Ali   



