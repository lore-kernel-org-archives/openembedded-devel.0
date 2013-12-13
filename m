Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3728B610D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:47:55 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VrU1v-0003ps-FC for openembedded-devel@lists.openembedded.org;
	Fri, 13 Dec 2013 15:47:51 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:47:51 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:47:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Dec 2013 15:47:47 +0100
Message-ID: <l8f6lu$n23$1@ger.gmane.org>
References: <CAMGfQQrvsr6_d8fx+8KcrVhXLiPWPOXy_+ojWNwoRiz5DQ_XSw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <CAMGfQQrvsr6_d8fx+8KcrVhXLiPWPOXy_+ojWNwoRiz5DQ_XSw@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: yocto@yoctoproject.org
Subject: Re: Compiling the kernel source from Angstrom distribution & building an OS console-image.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2013 14:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

vishal gupta schreef op 13-12-13 15:05:
> Hi, I'm having this issue, I'm not able to build an  OS console-image.
> 
> When the command "MACHINE=beagleboard bitbake console-image" is run, i
> got the error as follows:
> 
> " Log data follows: | DEBUG: Executing shell function do_compileconfigs |
> Multiple configs found, building those first | NOTE: make -j2 oldconfig |
> scripts/kconfig/conf -o arch/arm/Kconfig | .config:341:warning: override:
> reassigning to symbol OABI_COMPAT | .config:3041:warning: override:
> reassigning to symbol IKCONFIG | .config:3042:warning: override:
> reassigning to symbol IKCONFIG_PROC | .config:3057:warning: override:
> reassigning to symbol DEVTMPFS | .config:3058:warning: override:
> reassigning to symbol DEVTMPFS_MOUNT | * | * Restart config... | * | * |
> * Character devices | * | Virtual terminal (VT) [Y/n/?] y |   Enable
> character translations in console (CONSOLE_TRANSLATIONS) [Y/n/?] y |
> Support for console on virtual terminal (VT_CONSOLE) [Y/n/?] y |
> Support for binding and unbinding console drivers (VT_HW_CONSOLE_BINDING)
> [Y/n/?] y | /dev/kmem virtual device support (DEVKMEM) [Y/n/?] y |
> Non-standard serial port support (SERIAL_NONSTANDARD) [N/y/?] n | Unix98
> PTY support (UNIX98_PTYS) [Y/n/?] (NEW)   Support multiple instances of
> devpts (DEVPTS_MULTIPLE_INSTANCES) [N/y/?] n | Legacy (BSD) PTY support
> (LEGACY_PTYS) [N/y/?] n | Hardware Random Number Generator Core support
> (HW_RANDOM) [Y/n/m/?] y |   Timer IOMEM HW Random Number Generator
> support (HW_RANDOM_TIMERIOMEM) [N/m/y/?] n | Siemens R3964 line
> discipline (R3964) [N/m/y/?] n | RAW driver (/dev/raw/rawN) (RAW_DRIVER)
> [N/m/y/?] n | * | * Partition Types | * | Advanced partition selection
> (PARTITION_ADVANCED) [Y/n/?] y |   Acorn partition support
> (ACORN_PARTITION) [N/y/?] n |   Alpha OSF partition support
> (OSF_PARTITION) [N/y/?] n |   Amiga partition table support
> (AMIGA_PARTITION) [N/y/?] n |   Atari partition table support
> (ATARI_PARTITION) [N/y/?] n |   Macintosh partition map support
> (MAC_PARTITION) [Y/n/?] y |   PC BIOS (MSDOS partition tables) support
> (MSDOS_PARTITION) [Y/n/?] y |     BSD disklabel (FreeBSD partition
> tables) support (BSD_DISKLABEL) [Y/n/?] y |     Minix subpartition
> support (MINIX_SUBPARTITION) [Y/n/?] y |     Solaris (x86) partition
> table support (SOLARIS_X86_PARTITION) [Y/n/?] y |     Unixware slices
> support (UNIXWARE_DISKLABEL) [N/y/?] (NEW)   Windows Logical Disk Manager
> (Dynamic Disk) support (LDM_PARTITION) [Y/n/?] y |     Windows LDM extra
> logging (LDM_DEBUG) [Y/n/?] y |   SGI partition support (SGI_PARTITION)
> [N/y/?] n |   Ultrix partition table support (ULTRIX_PARTITION) [N/y/?]
> n |   Sun partition tables support (SUN_PARTITION) [N/y/?] n |   Karma
> Partition support (KARMA_PARTITION) [N/y/?] n |   EFI GUID Partition
> support (EFI_PARTITION) [Y/n/?] y |   SYSV68 partition table support
> (SYSV68_PARTITION) [N/y/?] n | * | * OCF Configuration | * | OCF (Open
> Cryptograhic Framework) (OCF_OCF) [N/m/y/?] (NEW) # | # configuration
> written to .config | # | NOTE: make -j2 oldconfig | scripts/kconfig/conf
> -o arch/arm/Kconfig | # | # configuration written to .config | # | NOTE:
> make -j2 uImage CC=arm-angstrom-linux-gnueabi-gcc -mno-thumb-interwork
> -marm 
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
LD=arm-angstrom-linux-gnueabi-ld
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
| scripts/kconfig/conf -s arch/arm/Kconfig
> |   CHK     include/linux/version.h |   SYMLINK include/asm ->
> include/asm-arm | make[1]: `include/asm-arm/mach-types.h' is up to date. 
> |   CHK     include/linux/utsrelease.h |   CALL
> scripts/checksyscalls.sh | <stdin>:1523:2: warning: #warning syscall
> recvmmsg not implemented [-Wcpp] |   CHK     include/linux/compile.h |
> GZIP    kernel/config_data.gz |   IKCFG   kernel/config_data.h |   CC
> kernel/configs.o |   LD      kernel/built-in.o |   LOGO
> drivers/video/logo/logo_linux_clut224.c |   CC
> drivers/video/logo/logo_linux_clut224.o |   LD
> drivers/video/logo/built-in.o |   LD      drivers/video/built-in.o |   LD
> drivers/built-in.o |   LD      vmlinux.o |   MODPOST vmlinux.o |   GEN
> .version |   CHK     include/linux/compile.h |   UPD
> include/linux/compile.h |   CC      init/version.o |   LD
> init/built-in.o |   LD      .tmp_vmlinux1 |   KSYM    .tmp_kallsyms1.S |
> AS      .tmp_kallsyms1.o |   LD      .tmp_vmlinux2 |   KSYM
> .tmp_kallsyms2.S |   AS      .tmp_kallsyms2.o |   LD      vmlinux |
> SYSMAP  System.map |   SYSMAP  .tmp_System.map |   OBJCOPY
> arch/arm/boot/Image |   Kernel: arch/arm/boot/Image is ready |   GZIP
> arch/arm/boot/compressed/piggy.gz |   AS
> arch/arm/boot/compressed/piggy.o |   LD
> arch/arm/boot/compressed/vmlinux |   OBJCOPY arch/arm/boot/zImage |
> Kernel: arch/arm/boot/zImage is ready |   UIMAGE  arch/arm/boot/uImage |
> Image Name:   Linux-2.6.32 | Created:      Fri Dec 13 16:13:18 2013 |
> Image Type:   ARM Linux Kernel Image (uncompressed) | Data Size:
> 3134344 Bytes = 3060.88 kB = 2.99 MB | Load Address: 80008000 | Entry
> Point:  80008000 |   Image arch/arm/boot/uImage is ready | NOTE: make -j2
> -j2 modules CC=arm-angstrom-linux-gnueabi-gcc -mno-thumb-interwork -marm 
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
LD=arm-angstrom-linux-gnueabi-ld
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
|   CHK     include/linux/version.h
> |   SYMLINK include/asm -> include/asm-arm | make[1]:
> `include/asm-arm/mach-types.h' is up to date. |   CHK
> include/linux/utsrelease.h |   CALL    scripts/checksyscalls.sh |
> <stdin>:1523:2: warning: #warning syscall recvmmsg not implemented
> [-Wcpp] |   Building modules, stage 2. |   MODPOST 699 modules | NOTE:
> make -j2 DEPMOD=echo 
> INSTALL_MOD_PATH=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image
>
> 
modules_install
> | Warning: you may need to install module-init-tools | See
> http://www.codemonkey.org.uk/docs/post-halloween-2.6.txt
> 
> 
> ///////There is a big list of install module-init-tools which i have 
> deleted as log is big/////////////
> 
> 
> |   DEPMOD  2.6.32 | NOTE: make -j2 -C 
> /home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel
>
> 
CC=arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
LD=arm-angstrom-linux-gnueabi-ld
> --sysroot=/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beagleboard
>
> 
clean
> | make: Entering directory 
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
|   CLEAN   arch/arm/boot/compressed
> |   CLEAN   arch/arm/boot |   CLEAN 
> /home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel
>
> 
|   CLEAN   arch/arm/kernel
> | 
> /home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel/crypto/ocf/ep80579/Makefile:75:
>
> 
ICP_ROOT is undefined. Please set the path to EP80579 release package
> directory "-> setenv ICP_ROOT <path>" |   CLEAN   firmware |   CLEAN
> drivers/char |   CLEAN   drivers/md |   CLEAN   init |   CLEAN   kernel |
> CLEAN   lib |   CLEAN   drivers/video/logo |   CLEAN   usr |   CLEAN
> include/asm-arm/mach-types.h vmlinux System.map | make: Leaving
> directory 
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
| make: Entering directory
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
|   HOSTCC  scripts/basic/fixdep
> |   HOSTCC  scripts/basic/docproc |   HOSTCC  scripts/basic/hash |
> HOSTCC  scripts/kconfig/conf.o | scripts/kconfig/conf.c: In function
> 'conf_sym': | scripts/kconfig/conf.c:159:6: warning: variable 'type' set
> but not used [-Wunused-but-set-variable] | scripts/kconfig/conf.c: In
> function 'conf_choice': | scripts/kconfig/conf.c:231:6: warning: variable
> 'type' set but not used [-Wunused-but-set-variable] |
> scripts/kconfig/conf.c:307:9: warning: ignoring return value of 'fgets', 
> declared with attribute warn_unused_result [-Wunused-result] |
> scripts/kconfig/conf.c: In function 'conf_askvalue': |
> scripts/kconfig/conf.c:105:8: warning: ignoring return value of 'fgets', 
> declared with attribute warn_unused_result [-Wunused-result] |   HOSTCC
> scripts/kconfig/kxgettext.o |   SHIPPED scripts/kconfig/lex.zconf.c |
> HOSTCC  scripts/kconfig/zconf.tab.o |   HOSTLD  scripts/kconfig/conf |
> scripts/kconfig/conf -s arch/arm/Kconfig | make: Leaving directory 
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
| make: Entering directory
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
|   CLEAN   scripts/basic
> |   CLEAN   scripts/genksyms |   CLEAN   scripts/kconfig |   CLEAN
> scripts/mod |   CLEAN   scripts | make: Leaving directory 
> `/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/image/usr/src/kernel'
>
> 
|
> 
> * cp: cannot stat `include/generated/bounds.h': No such file or
> directory| ERROR: Function failed: do_compileconfigs (see 
> /home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/temp/log.do_compileconfigs.22554
>
> 
for further information)ERROR: Task 635
> (/home/vishal/oe-nad/setup-scripts/sources/meta-ti/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>
> 
<http://linux-omap-psp_2.6.32.bb>, do_compileconfigs) failed with exit code
> '1'* NOTE: Tasks Summary: Attempted 3197 tasks of which 3182 didn't need
> to be rerun and 1 failed. No currently running tasks (3168 of 3276)
> 
> Summary: 1 task failed: 
> /home/vishal/oe-nad/setup-scripts/sources/meta-ti/recipes-kernel/linux/ 
> linux-omap-psp_2.6.32.bb, do_compileconfigs Summary: There was 1 WARNING
> message shown. Summary: There was 1 ERROR message shown, returning a
> non-zero exit code. "
> 
> Please point me towards the solution as i am not getting much data for
> the ERROR: Function failed: do_compileconfigs specific to my build over
> net. Or It will be helpful if anyone comments on the error.

Remove your local changes so it will build the default *correct* kernel
instead of the above one.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSqx4TMkyGM64RGpERAn5RAJ9EAbVDwXeLTout6bYuTwWfaVLmdgCfXaOi
1clUMnGDMoxLjINU9cf0y9s=
=id96
-----END PGP SIGNATURE-----


