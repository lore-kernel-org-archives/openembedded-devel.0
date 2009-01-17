Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LOJpj-0004rv-65
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jan 2009 23:40:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B03951422AAD;
	Sat, 17 Jan 2009 23:25:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPrPNaaTtsqS; Sat, 17 Jan 2009 23:25:46 +0100 (CET)
Received: from zaurus.utx.cz (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 062101416BA5;
	Sat, 17 Jan 2009 23:25:45 +0100 (CET)
Date: Sat, 17 Jan 2009 23:33:09 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090117233309.192da673@zaurus.utx.cz>
In-Reply-To: <200901162008.03815.jay4mail@gmail.com>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
	<1232121627.4988.2795.camel@hammer.suse.cz>
	<200901162008.03815.jay4mail@gmail.com>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.14.2; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Sat, 17 Jan 2009 22:40:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Fri, 16 Jan 2009 20:08:03 +0300 Yuri Bushmelev wrote:

> > Kernel 2.4 used a trick - user space utility called writerominfo
> > read some of these values and sent them to kernel.
> 
> Stanislav, can you please explain this a bit more?
> 
If you look at Sharp system, you will find /sbin/writerominfo. I didn't
find source code for it, but I guess that it reads NAND config data and
initializes /proc/deviceinfo entries (and it performs some magic
with /.sys).

This utility is called early in the boot process. updater.sh
flashing utility uses it as well.

Other utilities used by update.sh:
nandlogical: source available
verchg: probably changes NAND section version info in NAND
nandcp: probably copies data to NAND
bcut: probably trivial file cutter
eraseall: probably MTD partition eraser

Note: current OE update.sh does not flash correct checksum after
flashing the kernel

Here is a rough and incomplete attempt to map PROM and NAND based on a
SL-6000 map somewhere on OESF (attached as PNG), my experimenting
with SL-C3200 and trying to understand, what one can see in the NAND
diagnostic.

One importand note: Linux kernel does not yet support all settings done
by the bootloader. For example LCD phase settings is done by bootloader
and not touched by Linux. Possible alternative bootloader may need to
set it as well.


PROM and NAND memory map on Sharp Zaurus SL-C3200

(it is known to be different from all other models including SL-C3100)

PROM

8 MiB PROM Read only memory for production models, NOR flash for
pre-production models.

 PROM BOOTLOADER "ROM"
 address 0x00000000, size 0x00140000
 contents: Bootloader.

 PROM MTD0 "Filesystem" "ROM DATA"
 address 0x00140000, size 0x006b0000
 contents: EN-JP dictionary database.

NAND
128MiB NAND flash, erase size 0x00020000

 NAND MTD1 "smf" "BOOT"
 address 0x00000000, size 0x00700000

  address 0x00000000, size 0x00040000 MAINTE

0x48000 0x4000 VERBLOCK
0x70000 0x4000 MVRBLOCK

  address 0x00040000, size 0x00040000 NAND bootloader

Values from SL-6000:
0x00040000 AdjValue
0020020     ffff    ffff    ffff    ffff    ffff    ffff    5554    4843
0020040     80ec    3d87    70dc    3dbc    ffee    ffff    fff0    ffff
0020060     ffff    ffff    ffff    ffff    4850    4441    0000    0000
0x00044000 BootFlag ff
0x00048000 Version *
names of MTD sections
positions of sections
checksums
0x0004c000 Clock 0000000     0425    1971    82b1    4660
0x00050000 ROMount ff
0x00054000 RWMount ff
0x00058000 RSV_58
0x0005c000 RSV_5C
0x00060000 PartitionInfo1 *
0x00064000 PartitionInfo2 *
0x00068000 Model *
0x0006c000 RSV_6C
0x00070000 MVersion *
 master version
 checksums of mtd sections
0x00074000 RSV_74
0x00078000 RSV_78
* verified
0x000e0000 DATA   standard kernel

Values from param_version:
0x00000000 Mainte "MAINTE" "MAINTE.BIN"
1. 00000000-00040000
0x00040000 Parameter Area
0x0007c000 NAND Diag "DIAG" "NANDDIAG.BIN"
2. 00080000-000e0000
0x000e0000 Zimage 2 "KERNEL2" "ZIMAGE.BIN+INITRD.BIN"
3. 00220000-0035c000
4. 00360000-00680000
0x00220000 Zimage 1 "KERNEL1" "ZIMAGE.BIN+INITRD.GZ"
5. 000e0000-0021c000
6. 07000000-03100000 (i. e. FSRO)
0x00360000 Initrd 2 "FLSYS2" "INITFS.BIN"
7. 03200000-08000000 (i. e. FSRW)
0x00700000 "ROFLSYS?" "PARAMINF.BI"
8. 00060000-0006c000
NAND MTD2 RO JFFS2 file system "root" "FSRO"
address 0x00700000, size 0x02b00000

NAND MTD3 RW JFFS2 file system "home" "FSRW"
address 0x03200000, size 0x04e00000

--
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


