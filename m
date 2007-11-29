Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IxglX-0007gr-PB
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 11:37:07 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lATAY0nk018057 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 11:34:01 +0100
Message-ID: <474E9599.4070705@student.utwente.nl>
Date: Thu, 29 Nov 2007 11:34:01 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog 20071122 - 20071129
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2007 10:37:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

coredump2@openembedded.org:
    zaurusd: Add gpe-conf to DEPENDS and RDEPENDS to pull in 'bl',
closing bug #3131
    webcam-server: Add dependency to jpeg, closing bug #3366
    zaurus-updater: Always treat MTD_PART_SIZE as HEX when comparing
sizes, thanks to ZeroChaos for debugging

florian@openembedded.org:
    libx11-native: Add 1.1.1 - courtesy by Arne Zellentin
    sane-srcrevs.inc: Update some G(PE)^2 related versions and tmut
    libtinymail_svn: Update version number
    tmut_svn: Update
    checksums.ini: Remove some G(PE)^2 bits to work around a stupid
package "update".
    contact: New svn recipe for new G(PE)^2 contact application.
    libabenabler2: Major update to make it usable.
    libabenabler2: Add svn recipe
    ptim: Add 1.0 ptim release set of components.
    libiac: Add patch to work around i18n build breakage.
    libcalenabler2: Add svn recipe
    libical: Fix linking bug
    libical: New recipe: iCal (RFC 2445) C library

hrw@openembedded.org:
    zaurus-updater: use value from /proc/mtd to get rootfs size
    zaurus-updater: remove logs - added by mistake
    gettext: Disable java since it finds any native gcj and breaks cross
compiled builds (from Poky)
    zaurus-updater: dropped spitz one as unified works on spitz (tested
by Rolf Leggewie)

jeremy_laine@openembedded.org:
    linux-2.6.23: fix mpc8313e-rdb LEDs patch (didn't apply cleanly)
    linux-2.6.23: add NAND flash driver for mpc8323e-rdb, fix NOR mapping
    mpc8313e-rdb: use u-boot 1.3.0 instead of git
    u-boot: add version 1.3.0
    linux-2.6.23: update mpc8313e-rdb defconfig based on mpc8323e-rdb
    insane.bbclass: add package_qa_get_machine_dict() entries for
linux-uclibc / i*86
    uclibc-0.9.29: add configuration for qemux86 machine
    hostap-daemon_0.6.0.bb: package version 0.6.0 of hostap-daemon
    angstrom.inc: add FEED_ARCH for mpc8313e-rdb and mpc8323e-rdb machines

koen@openembedded.org:
    xserver-xorg: fix debug packaging
    linux-efika 2.6.20.20: re-enable modules that were in 2.6.19+git,
but not in 2.6.20.20
    xserver-kdrive-common: add missing break in the switch statement
    xserver-kdrive-common: use Xfbdev on gta02 for now
    fic-gta02: ship Xfbdev as well
    zaurus-updater: fix flashing from case sensitive filesystems
    zaurus-updater: fix a typo from the last commit
    zaurus-updater: have consistent error messages
    xserver-kdrive-common: use Xglamo for gta02, remove some of the
bogus Xserver checks
    task-openmoko: use xserver specified by machine instead of
hardcoding it
    fic-gta0*: add XSERVER
    libdaemon: add 0.12
    openmoko-dialer2: depend on libjana, closes #3357
    busybox: Enable support for -t & -n options for read command in
angstrom configs.
    mpfr: add 2.3.0
    angstrom 2--7 lockdown file: fix typo spotted by XorA

likewise@openembedded.org:
    linux-2.6.23: Fixup of mpc8313e-rdb-leds.patch.
    linux-2.6.23: Added LEDs patch (only) for mpc8313e-rdb. Needs testing.
    inotify-tools: Add version 3.12 from sourceforge.
    gcc: Add pr34130.patch for missing versions.
    gcc-4.2.[12]: Applied pr34130.patch, from 4.1.2.
    gcc-4.1.[01]: Applied pr34130.patch, from 4.1.2.

mickeyl@openembedded.org:
    meta-toolchain: properly fix .pc files to point to the toolchain
directory. closes #3426

mwester@openembedded.org:
    gcc(-cross): bump PR so that OE picks up the fixed gcc and gcc-cross
packages.
    ixp4xx-kernel: defconfig for 2.6.21.6 - add many crypt modules, add
requested cdc
    busybox: SlugOS defconfig - add nohup, add timeout option to shell's
read command.
    slugos-packages: add cryptsetup

olvaffe@gmail.com:
    xserver-kdrive_1.3.0.0.bb : fix x86 breakage with glamo patch

pH5@openembedded.org:
    neod: set platform to htc for htcuniversal to enable power/aux keys

pfalcon@openembedded.org:
    gpe-login 0.90: Lock screen on suspend, not on resume.
    zaurus-2.6.inc: Make it work for the case when there's no jffs2 in
IMAGE_FSTYPES.
    gpe-login 0.90: Die, die, die gpe-xcalibrate.sh!
    keylaunch 2.0.10: Apply patch to unbreak key event capture.
    keylaunch-conf: Fix permissions on keylaunchrc.
    keylaunch-conf: Never-ever use "Pressed" events in public configs.
    keylaunch-conf: Describe keylaunchrc format.
    keylaunch 2.0.10: Separate a keylaunch, a generic X key binding utility,
    initramfs-uniboot & modules: These all are machine-independent scripts.
    klibc-utils-fstype: Create a separate recipe for klibc's fstype.
    initramfs-module-bootmenu: Switch from using buggy mount
- --guess-fstype to buggy klibc's fstype.
    linux-handhelds-2.6: Factor out kernel filename to a variable, for
easy global change.
    linux-handhelds-2.6: Fix another typo in HaRET startup script.
    klibc 1.1.1: Fix multimachine build.
    linux-rp: Depends on bc during buildtime for collie.
    bitbake.conf: Reformat and alphabetize ASSUME_PROVIDED list.
    initramfs-module-bootmenu: Interactive boot location selection for
initramfs-uniboot.
    initramfs-uniboot & modules: Bump PRs for latest changes.
    initramfs-module-loopboot: Allow to use absolute path for loop file
location.
    initrdscripts: module-initfs: Be silent on loading non-existent module.
    dropbear 0.49: Beautify init script output.
    initrdscripts: We obviously first do rootdelay, and only then create
device nodes.
    initrdscripts: Finish renaming for ordered module load.
    initrdscripts: Separate fs kernel module loading to separate plugin.
    initrdscripts: Initial value for ROOT_DEV is null.
    initrdscripts: Introduce boot order support for universal initramfs
modules.
    busybox-static 1.2.1: Enable support for -t & -n options for read
command.

rpurdie@openembedded.org:
    binutils: Add patch to work with recent makedevs versions (#3342)

rwhitby@nslu2-linux.org:
    apex-nslu2: No need to byteswap the little-endian kernel on loading.
 Remove unused alternatives for cmdline - these recipes are for nslu2 only.
    ixp4xx.inc: Set default machine essentials to include the ixp4xx
ethernet firmware
    slugos.inc: Set default cmdline_root for nslu2
    linux-ixp4xx: Migration from ixp4xx-kernel.  Intended to follow
recent OE kernel recipe conventions.  Default kernel for slugos distro
and ixp4xx machines.  ixp4xx-kernel will be removed later once this is
well tested.
    slugos.inc: Move slugos to the same toolchain as OABI Angstrom
2007.1, and bump version to 4.7
    linux.inc: Added support for processor endianness
    apex-nslu2: Move the defconfig to a generic files dir so you can
build this package for the ixp4xx machines.
    slugos.conf: Add missing provider specification
    slugos-image: Deprecate support for dsmg600 and nas100d images -
users need to inherit them in local.conf if they want them.
    nslu2-image.bbclass: Remove the need for the temporary subdirectory
by grabbing files from their original locations directly.  Allow usage
of this class in ixp4xx machines, not just nslu2.

slapin@openembedded.org:
    Linux for palms: repository change

thebohemian@gmx.net:
    hildon-libs: add libmatchbox to dependencies - close #3291

woglinde2@openembedded.org:
    liboil: fix bug 3090
    cacao-cldc: fix RDEPENDS for libltdl
    midpath-pulseaudio: new sound backend for midpath
    midpath: cosmetic buildfixes
    midpath-cldc: rproviding virtual/cldc-api-1.1
    cacao-cldc: fix path to cldc1.1.jar

xjqian@openembedded.org:
    binutils-cross-2.18: --disable-werror to prevent aborting compile
with bleeding edge (4.3.x) gcc.
    mpfr-(native)_svn: upstream switch from cvs to svn. add native_svn.
    gcc_4.1.2: revert enabling fortran.
    mpfr: unify, remove obsolete directory in 2.3.0 staging.
    gcc-(cross)-package.inc: selective fortran packaging.
    gsl: bump to new stable 1.10 version.
    gcc-package-cross.inc: link gfortran to g77
    disapproval of revision 'bc1afd499eafe3cff3eb38a3d5766aaa0a823536'
    mpfr: add (native)_2.3.0, unify, closes #3339
    gcc-(cross)_4.1.2: enable gfortran and gfortran packaging
    octave: add buidable stable 2.1.73 and testing 2.9.17
    fftw: add RPROVIDES libfftw3

xora@openembedded.org:
    sane-srcrevs.inc : increment gsmd and dialer2 in unison
    uboot-openmoko_svn.bb : add glamo ram initialisation patch so stop
    task-openmoko.bb : add openmoko-messages2 to the images


Bugs fixed:
bug_id resolution	 short_desc
239 FIXED	 mtd-snapshot-20050715 no longer exists
1061 WONTFIX	 opie-mediaplayer2 will not play ogg/vorbis files on
3.5.4.1 rc4 on cl-3000
1397 WONTFIX	 3.5.4.2 rc 2
1538 FIXED	 allow Opie-PIN to accept input via cursor keys
2483 FIXED	 Perl 5.8.8 (r20) does not build (slugosbe)
2571 FIXED	 scripts under /etc/zaurus/hinge-$orientation.d/ run twice
2780 DUPLICATE	 mysql-4.1.18-r2-do_compile
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
3038 FIXED	 octave-2.9.14-r0-do_configure
3090 FIXED	 liboil-0.3.11-r0-do_compile
3231 FIXED	 matchbox misbehaviour in 2.6.23 angstrom x11-image builds
3291 FIXED	 hildon-libs needs libmatchbox in dependency
3342 FIXED	 binutils 2.17.50.0.5 fails to build due makeinfo version problem
3352 FIXED	 xserver-kdrive-1.3.0.0-r20-do_compile
3353 FIXED	 gettext fails to build
3354 WORKSFORME	 dropbear-0.49-r1-do_install
3355 INVALID	 glibc-2.5-r8-do_package
3357 FIXED	 openmoko-dialer2-0.1.0+svnr3481-r5-do_configure
3359 FIXED	 libdaemon-0.11 segfaults with avahi-daemon on arm/xscale pxa270
3364 INVALID	 mpfr-native-2.3.0-r1-do_populate_staging
3366 FIXED	 webcam-server needs jpeg to build
3370 FIXED	 Security issues with gpe-login --autolock.
3375 FIXED	 meta-toolchain does not fix pkgconfig data files path properly
3378 INVALID	 gmp-native-4.2.1-r2 fails to compile
3379 INVALID	 gmp-native-4.2.1-r2-do_compile
3380 INVALID	 gettext-native-0.14.1-r6-do_configure
3381 INVALID	 qemu-native-0.9.0+cvs20070613-r5-do_compile
3382 INVALID	 curl-native-7.16.4-r0-do_configure
1496 WONTFIX	 Opie screen lock security issues in OZ

Bugs opened:
bug_id resolution	 short_desc
3363 	 Build fails on gcc-cross_4.1.2 - errors with gfortran
3376 	 DEPENDS and RDEPENDS
3356 	 U-Boot utils (mkimage) git recipes
3358 	 dtc native and sdk git versions
3360 	 bbclass to create maemo scratchboc compatible binaries
3361 	 gcc-cross-4.1.2-r11-do_compile
3362 	 linux-rp-2.6.21-r11-do_compile
3365 	 HAL 0.5.9: SIGSEGV when building without USE_PCI_IDS
3367 	 package binutils-cross-2.18 fails to compile
3368 	 python 2.5 is not build with ctypes on arm
3369 	 meta-toolchain uses ipkg-list-fields but it's not in
ipkg-utils-native
3371 	 openrdate recipe
3372 	 remove xcb depends from libx11
3373 	 fix firefox 2.0.0.3 building
3374 	 Package spectrum-fw mishandles firmware download during build
3377 	 contacts-0.7-r1-do_compile
3383 	 zlib: package's debian name should be zlib1g
3384 	 add libtool 1.5.6-6osso recipe
3385 	 sourcepkg.bbclass: fails to handle packages with no external sources
3386 	 xf86-video-ati-6.6.193-r1-do_configure
3387 	 kismet preferred version
3388 	 Meta-Bug: Angstrom 2007 preferred version update
3389 	 linux-efika-2.6.20.20-r1-do_configure
3390 	 zaurusd does not discriminate between lid was opened and
headphones removed
3391 	 libmad-0.15.1b-r0-do_configure
3392 	 gtk+-2.10.14-r7-do_compile

In total 26 bugs have been created and 29 bugs were closed.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHTpWZMkyGM64RGpERAnCjAJ9sdyqEIUZwi8iVoMkapQfEA1xrpQCfZGeS
ym1Yi+6Vm0Ce0wOWHxJGypE=
=isL3
-----END PGP SIGNATURE-----


