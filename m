Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1OlLNM-0006EE-9J
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 14:34:46 +0200
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id o7HBxXvu009031
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 04:59:41 -0700 (PDT)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o7HC1hL06841
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 14:01:43 +0200 (MEST)
Message-ID: <4C6A7A24.5070104@atmel.com>
Date: Tue, 17 Aug 2010 14:01:40 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.11) Gecko/20100711 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=Phc7=BkAepqfLvekUwU+BMsOoXzFVHsE1JyDm@mail.gmail.com>
In-Reply-To: <AANLkTi=Phc7=BkAepqfLvekUwU+BMsOoXzFVHsE1JyDm@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by sjogate2.atmel.com id
	o7HBxXvu009031
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: loading jffs2 image on arm926ek board
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
X-List-Received-Date: Tue, 17 Aug 2010 12:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 17/08/2010 11:38, rani rajaram :
> Hello,
>=20
>=20
> I have used openembedded   to build rfs image with x libraries for arm9=
26ek
> board.

We need more information here:
- where did you store your jffs2 image in NAND flash (which address)?
- what is your NAND flash partitioning?



> After loading the image i got following error:
>=20
> bootm 0x20000000
> ## Booting image at 20000000 ...
>    Image Name:   Linux-2.6.32.9
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1392284 Bytes =3D  1.3 MB
>    Load Address: 20008000
>    Entry Point:  20008000
>    Verifying Checksum ... OK
> OK
>=20
> Starting kernel ...
>=20
> Uncompressing
> Linux..................................................................=
........................
> done, booting the kernel.
> Linux version 2.6.32.9 (root@Nakshatra) (gcc version 4.2.2) #14 Fri Apr=
 9
> 16:01:58 NPT 2010
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
> CPU: VIVT data cache, VIVT instruction cache
> Machine: Atmel AT91SAM9261-EK
> Ignoring unrecognised tag 0x54410008
> Memory policy: ECC disabled, Data cache writeback
> Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32=
512
> Kernel command line: mem=3D128M console=3DttyS0,115200 rootfstype=3Djff=
s2
> root=3D/dev/mtdblock0 rw init=3D/bin/sh

It seems that you are using mtd0 as rootfs: did you flashed your jffs2
at address 0 of NAND?

> PID hash table entries: 512 (order: -1, 2048 bytes)
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Memory: 128MB =3D 128MB total
> Memory: 126932KB available (2520K code, 184K data, 124K init, 0K highme=
m)
> Hierarchical RCU implementation.
> NR_IRQS:192
> AT91: 96 gpio irqs in 3 banks
> Console: colour dummy device 80x30
> console [ttyS0] enabled
> Calibrating delay loop... 99.12 BogoMIPS (lpj=3D495616)
> Mount-cache hash table entries: 512
> CPU: Testing write buffer coherency: ok
> NET: Registered protocol family 16
> bio: create slab <bio-0> at 0
> SCSI subsystem initialized
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> Switching to clocksource pit
> NET: Registered protocol family 2
> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> TCP established hash table entries: 4096 (order: 3, 32768 bytes)
> TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> TCP: Hash tables configured (established 4096 bind 4096)
> TCP reno registered
> NET: Registered protocol family 1
> NetWinder Floating Point Emulator V0.97 (double precision)
> JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
> msgmni has been set to 248
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> io scheduler noop registered
> io scheduler anticipatory registered (default)
> atmel_lcdfb atmel_lcdfb.0: backlight control is not available
> atmel_lcdfb atmel_lcdfb.0: 600KiB frame buffer at 27900000 (mapped at
> ffc00000)
> Console: switching to colour frame buffer device 80x30
> atmel_lcdfb atmel_lcdfb.0: fb0: Atmel LCDC at 0x00600000 (mapped at
> c885a000), irq 21
> atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
> atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq =3D 6) is a ATMEL_SERIAL
> atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq =3D 7) is a ATMEL_SERIAL
> atmel_usart.3: ttyS3 at MMIO 0xfffb8000 (irq =3D 8) is a ATMEL_SERIAL
> brd: module loaded
> NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB=
 3,3V
> 8-bit)
> AT91 NAND: 8-bit, Software ECC
> Scanning device for bad blocks
> Bad eraseblock 56 at 0x000000700000
> Bad eraseblock 1909 at 0x00000eea0000
> Creating 2 MTD partitions on "atmel_nand":
> 0x000000000000-0x000008000000 : "Partition 1"
> 0x000008000000-0x000010000000 : "Partition 2"
> atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
> dm9000 Ethernet Driver, V1.31
> dm9000 dm9000.0: read wrong id 0x342a0028
> dm9000 dm9000.0: read wrong id 0x2b2a0000
> dm9000 dm9000.0: read wrong id 0x2b2a0028
> dm9000 dm9000.0: read wrong id 0x342a0028
> dm9000 dm9000.0: read wrong id 0x2b2a0028
> dm9000 dm9000.0: read wrong id 0x2b2a2928
> dm9000 dm9000.0: read wrong id 0x2b2a0028
> dm9000 dm9000.0: read wrong id 0x2b002928
> dm9000 dm9000.0: wrong id: 0x2b002928
> dm9000 dm9000.0: not found (-19).
> usbmon: debugfs is not available
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> at91_ohci at91_ohci: AT91 OHCI
> at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
> at91_ohci at91_ohci: irq 20, io mem 0x00500000
> usb usb1: configuration #1 chosen from 1 choice
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 2 ports detected
> usbcore: registered new interface driver cdc_acm
> cdc_acm: v0.26:USB Abstract Control Model driver for USB modems and ISD=
N
> adapters
> Initializing USB Mass Storage driver...
> usbcore: registered new interface driver usb-storage
> USB Mass Storage support registered.
> udc: at91_udc version 3 May 2006
> mice: PS/2 mouse device common for all mice
> ads7846 spi0.2: touchscreen, irq 29
> input: ADS7843 Touchscreen as
> /devices/platform/atmel_spi.0/spi0.2/input/input0
> i2c /dev entries driver
> TCP cubic registered
> NET: Registered protocol family 17
> usb 1-1: new full speed USB device using at91_ohci and address 2
> usb 1-1: configuration #1 chosen from 1 choice
> scsi0 : SCSI emulation for USB Mass Storage devices
> VFS: Mounted root (jffs2 filesystem) on device 31:0.
> Freeing init memory: 124K
> Kernel panic - not syncing: Attempted to kill init!
> Backtrace:
> [<c002b40c>] (dump_backtrace+0x0/0x10c) from [<c002b54c>]
> (dump_stack+0x18/0x1c)
>  r6:00000004 r5:c7815c40 r4:c02b9d8c
> [<c002b534>] (dump_stack+0x0/0x1c) from [<c003e43c>] (panic+0x4c/0x134)
> [<c003e3f0>] (panic+0x0/0x134) from [<c0041278>] (do_exit+0x64/0x5b0)
>  r3:c02a56b4 r2:c7815d60 r1:c7819d20 r0:c0266378
> [<c0041214>] (do_exit+0x0/0x5b0) from [<c0041854>] (do_group_exit+0x90/=
0xc4)
> [<c00417c4>] (do_group_exit+0x0/0xc4) from [<c004b0f4>]
> (get_signal_to_deliver+0x2e0/0x318)
>  r4:00000004
> [<c004ae14>] (get_signal_to_deliver+0x0/0x318) from [<c002a104>]
> (do_notify_resume+0x60/0x578)
> [<c002a0a4>] (do_notify_resume+0x0/0x578) from [<c0027ea8>]
> (work_pending+0x1c/0x20)

It seems that there is no JFFS2 on mtd0

Bye,
--=20
Nicolas Ferre



