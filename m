Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1I6jQR-0000U6-NK
	for openembedded-devel@openembedded.org; Fri, 06 Jul 2007 10:44:27 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B015D02FF for openembedded-devel@openembedded.org;
	Fri, 6 Jul 2007 10:38:08 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 6 Jul 2007 11:39:08 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHAEFALJAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <f56jc5$ueq$2@sea.gmane.org>
Importance: Normal
Subject: OE weekly changelog for 20070630-20070706.txt
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
X-List-Received-Date: Fri, 06 Jul 2007 08:44:28 -0000
X-Groupsio-MsgNum: 2360
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0084_01C7BFC2.43C43040"

------=_NextPart_000_0084_01C7BFC2.43C43040
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

As Koen's mailserver has an issue here is the weekly changelog for OE

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com



------=_NextPart_000_0084_01C7BFC2.43C43040
Content-Type: text/plain;
	name="OE-Changelog-20070630-20070706.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="OE-Changelog-20070630-20070706.txt"

Joaquim:
    atk: added 1.19.3 - close #2567

Laibsch@openembedded.org:
    gtkmm: add cairomm to DEPENDS
    esmart: fix packaging.  Closes 2573.

McGregor:
    u-boot 1.1.6: fix Sarge patchset
    u-boot 1.1.6: added Sarge-AT91 support

Patrik:
    sharprom-compatible: use sanity and changed DISTRO_VERSION so builds do=
es not break on 2.4-crapix kernels - close #2581
    modutils(-cross): depend on bison-native - closes #2583

cbrake@openembedded.org:
    compulab-pxa270_2.6.16: update md5 as compulab changed their download f=
ile

coredump2@openembedded.org:
    angstrom-2007.1.conf: Update PREFERRED_VERSION_libgnomeui to 2.18.1, wo=
rking around a compile problem with 2.16.1
    gnome: Update libbonoboui to 2.18.0 to avoid a compile error with 2.14.=
0
    alsa: Do not run postinst on the build host
    usb-gadget-mode: Add support for host-mode
    imlib2: Fix .debug QA error

florian@openembedded.org:
    linux-x86: Update i486 configuration (sound, networking) to run in VMWa=
re.
    xoo-vm: fix packaging
    meta-sdk: Some more directory layout related fixes.
    meta-sdk-gpe: Update to support new sdk arch names and splitted package=
 directories.
    meta-sdk: Update to support new sdk arch names and splitted package dir=
ectories.
    sdk.bbclass: Add function to create sdk pacakge indices.
    0xffff-native: Depend on libusb, license change to GPLv3.
    linux-x86: Add deploying of kernel image again.
    sane-srcdates.inc: Update gpesyncd srcdate to become compatible with la=
test libraries. Fixes #2491
    linux-x86: bump PR
    linux-x86: Enable wireless for i486, unbreaks madwifi build.
    0xFFFF: It depends on libusb...

freyther@openembedded.org:
    packages/orinoco/spectrum-fw.bb: Building depends on unzip, make sure i=
t is built

gfellerpatrik@gmx.net:
    sanity: also check for bison, closes #2580

hrw@openembedded.org:
    feed-browser: mark selected architecture in list of archs, also show en=
tered package name
    feed-browser: in package details sort by version, then by arch
    feed-browser: search when arch is selected and no package name provided
    feed-browser: list of architectures from database instead of static lis=
t
    linux-rp: update locomokyeb_suspendkey patch to fix build for collie
    feed-browser: simplified URLs (no 'action' var anymore), simplified cod=
e a bit
    feed-browser: use read_vars_from_get to handle HTTP GET params
    feed-browser: updated copyrights
    feed-browser: updated copyrights
    feed-browser: exit if database cannot be found or created
    feed-browser: include architecture selector
    sanity: if OE is used by root user (userid 0) then raise error (from Po=
ky)
    qemu-native: added zlib-native to DEPENDS - close #2561
    task-opie-all: added missing PACKAGES - should close #2572
    linux-rp: switch to Thomas patches
    linux-rp: switch to Thomas patches
    linux-rp 2.6.21: adapted collie patches to apply - close #2592
    linux: make Sarge-AT91 use u-boot-mkimage-gta01-native instead of uboot=
 (which is not building)
    linux: added Sarge-AT91 support (based on original submission kernel)
    sarge-at91: use u-boot 1.1.6 and linux 2.6.21
    sarge-at91: renamed to not conflict with overrides
    sarge_at91: added AT91RM9200 board from Black Mesa East project
    tosa: added wifi to MACHINE_FEATURES

koen@openembedded.org:
    php: depend on virtual/iconv
    htcwallaby: remove comment that makes bitbake barf
    angstrom: add FEED_ARCH for compulab-pxa270
    angstrom: add support for htcwallaby and htctornado
    kazehakase: add cvs version
    motorola ezx phones: add an include that sets the basic stuff, remove k=
illswitch from a1200, e680 because the machines need different defconfigs
    angstrom legacy: fix include
    apt: update to 0.7.2, fix debug packaging
    curl: update to 7.16.2
    angstrom-console-image: install task-base-extended
    qtopia-core: fix packaging
    qmake-base.bbclass: don't strip binaries, that breaks debug builds, let=
 OE take care of it
    0xffff: update to 0.2
    bitbake: update recipe to 1.8.6
    webkit: alter do_install
    webkit: update webkit.pri and webkit.pro
    sanity.conf: require bitbake 1.8.5, the two month wait is over
    proj4: stage native tools
    gtkmm: fix SRC_URI
    lyx: also rdepend on python-textutils
    angstrom: readd big mount due to udev init scripts=20
    tetex: adjust packaging a bit

lenehan@openembedded.org:
    perl 5.8.8: A few host paths were being included in the perl for the ta=
rget.
    perl/perl-native 5.8.8: Fix up asm/page.h include issue. Perl was inclu=
ding

marek.vasut@gmail.com:
    qte 2.3.10: Support uclibc+eabi configuration.
    linux-hackndev-2.6: Updated defconfig for palmld.

mwester@openembedded.org:
    /boot/kexec: Added tftp method to fetch kernel to boot, added notes on
    task-slugos: add wireless-tools to the base firmware image
    SlugOS init files: fixed network boot code for dsmg600 and added delay =
to ifup
    SlugOS kernel: bump svn version to bring in fix for broken kexec patch
    SlugOS: bump kernel up to svn 888 to pick up kexec patches, add kexec-t=
ools

pfalcon@openembedded.org:
    task-opie: Add dependency on opie-taskbar-images, 240x320 version until=
 ways
    opie-taskbar: Bump PR.
    opie-taskbar-images: Don't package images to machine-dependent file, in=
stead
    opie-taskbar-images: Fix PR.
    opie-taskbar: Split machine (actutally, resolution) dependent files to =
another package.
    kernel.bbclass: Oh ok, we need both DEPENDS and RDEPENDS.
    kernel.bbclass: DEPEND on bluez-dtl1-workaround, not just RDEPEND.
    opie-alarm: Fix paths in apm script per latest refactors.
    bluez-utils: There're 2 02dtl1_cs.sh files, remove one.
    task-base: Mark few more machine-dependent packages.
    bluez-dtl1-workaround: PACKAGE_ARCH =3D "all"
    udev-hostap-cs-vcc-workaround: PACKAGE_ARCH =3D "all"
    udev: Stop questionable device-specific hacks from contaminating PACKAG=
E_ARCH.
    bluez: Stop 02dtl1_cs.sh the nasty hack from breaking everyone's BT con=
nection.
    glib-2.0 2.12.12: Package clearly -dev (if not stray files) away from $=
{PN}.
    opie-networksettings: Install libs to $libdir.
    libopietooth1: Install to $libdir.
    opie-init: Remove hacky and stale overrides for opie init script.
    opie-init: Fix packaging.
    opie-taskbar: Add missing patch.
    opie-multikey: Fix hardcoded rpath.
    palmtop.bbclass: Update for FHS-compatible layout.
    opie-ttf-support 1.1: Bump PR for classes changes.
    opie-taskbar: Get rid of build-time configuration, do it runtime instea=
d.
    opie-alarm, opie-qcop, opie-qss, opie-quicklauncher: Install to $bindir=
.
    opie-init: Update for FHS-compatible OPIE install.
    preferred-opie-versions-1.2.3-pre.inc: Bump SRCDATE to 20070703.
    bitbake.conf: Set palmtopdir =3D "${libdir}/opie".
    opie.bbclass: Install binaries to $bindir.
    opie-taskbar: Install to $libdir/$bindir.
    libqtaux2: Install to $libdir.
    libopie2: Install to $libdir.
    libqpe-opie: Use $libdir.
    qte-mt 2.3.10: Use $libdir for installation.
    preferred-opie-versions-1.2.3-pre.inc: Bump SRCDATE to 20070702.
    wl500g.conf: Add MACHINE_FEATURES.
    bitbake.conf: Switch OPIE prefix to /usr.
    opie-networksettings cvs: Drop patch merged upstream.
    opie-oxygen: Elaborate DESCRIPTION.
    qte-mt 2.3.10: Fix packaging.
    opie-ttf-support 1.1: Do not use hardcoded OPIEDIR and friends.
    opie-irdaapplet cvs: Drop patch merged upstream.
    libopie2 cvs: Drop patch merged upstream.
    opie-init: Do not hardcode OPIEDIR and friends, substitute ${palmtopdir=
} build value.
    opie-console: Install one of missing images.
    opie.bbclass: Bother to expand palmtopdir.
    libqpe-opie: Fix packaging.
    opie-qcop: Do not mess with debughandlers, they are for user control.
    linux-handhelds-2.6: Drop 2.6.21-hh6, add 2.6.21-hh10.=20
    linux-handhelds-2.6: Add defconfig for h1910, defconfigman r307.
    h1910.conf: Has only 16MB flash.
    eteng500, rx1950: Add bare configs for two more hh.org ports.
    rx3000.conf: Drop PREFERRED_VERSION for kernel from machine config.
    linux-handhelds-2.6: Add defconfigs for eteng500, rx1950, rx3000 machin=
es.
    linux-handhelds-2.6: Fix defconfig for h3800.
    udev 092, 097, 100: Stop booting semi-configured system in case of rand=
om miniscule errors.
    udev: Stop booting semi-configured system in case of random miniscule e=
rrors.

polyonymous@openembedded.org:
    gtkhtml-3.6: fix cross-compile badness and close bug #2528
    qt4: change x86 qt arch into i386 as per bug #2593
    qemu-native: add picking up gcc-3.4.6 to gcc selection code
    pidgin: let it add correct rpath and close bug #2543
    libtool-{cross,native} 1.5.10: rework rpath stripping to make it contro=
llable
    uicmoc-native 2.3.10: an attempt to fix build against recent kernel, bu=
g #2564

rpurdie@openembedded.org:
    bitbake.conf: Add simplified FETCHCMD defitions for new versions of bit=
bake
    linux-rp: Add missing patch

rwhitby@nslu2-linux.org:
    arm-kernel-shim: Updated the FSG-3 configuration to allow the bootloade=
r cmdline to pass through.
    ixp4xx-kernel: Removed obsolete kernel versions
    slugos-image: Create .tar.gz rootfs too, for machines which don't have =
enough room in flash for a rootfs but do have a hard disk
    ixp4xx-kernel: Added the defconfig to version 2.6.18, so that changes i=
n the svn repo do not affect it.
    apex: Updated defconfig for 1.5.8
    task-slugos: Added madwifi drivers and tools
    apex: updated to 1.5.8
    ixp4xx-kernel: Added 2.6.22 defconfig, untested, and not selected by de=
fault
    ixp4xx-kernel: Updated to 2.6.21.5 for stable version

svolpe@openembedded.org:
    perl-5.8.8: Fix syntax error (unterminated quoted string)

woglinde2@openembedded.org:
    There are some definition missing in uclibc which prevents

xora@openembedded.org:
    aircrack-ng_1.0-svn.bb : renamed to differentiate from aircrack-ng HEAD=
 also
    aircrack-ng_0.7.bb : dropped in place of the later alternatives
    aircrack_svn.bb : forgotten patch
    aircrack-ng_0.9.1.bb : version bump + fixups of .bb file
    aircrack-ng_svn.bb : add svn of aircrack that will become 1.0
    mplayer_0.0+1.0rc1.bb : akita and palm can use pxa enhancements
    prism-firmware.bb : remove if around secondary firmware download as we =
always



Bugs fixed:
bug_id resolution	 short_desc
2555 FIXED	 patch to make kernel driver for Sharp CE-RH2 working
2427 WORKSFORME	 Bitbake Error On first run
1570 WORKSFORME	 ncurses-native-5.4-r8 OE install fails to place libncurses=
.so.5 correctly
1672 DUPLICATE	 binary locale generation fail on amd64 when compiling glibc
2128 FIXED	 libc-headers_2.6.15.99 build fail
2413 INVALID	 Klimt wont compile
2436 FIXED	 QtEmbedded2 uClibc-EABI build doesn't configure.
2491 FIXED	 gpesyncd build failure (blocks angstrom-x11-image)
2528 FIXED	 CROSS COMPILE Badness: gtkhtml-3.6 fails do_compile
2543 FIXED	 no icq in pidgin
2544 FIXED	 Updating gtkmm
2546 FIXED	 perl-native does not build on newer distros
2557 WONTFIX	 PalmLD: new kernel defconfig
2561 FIXED	 qemu links with zlib
2567 FIXED	 Patch to generate atk version 1.19.3
2573 FIXED	 Fix for esmart QA errors
2575 FIXED	 final perl package has a lot of files poiting erroneously to wo=
rkdir insted of real bindir
2576 FIXED	 Add iwmmxt support to mplayer for palmld
2577 FIXED	 Added iwmmxt support to mplayer for akita
2578 INVALID	 compilation problem in .bb file.
2581 FIXED	 unable to build virtual/kernel =3D> patch
2583 FIXED	 modutils-cross_2.4.27.bb; added missing debendency bison-native
2585 FIXED	 No sound output - SL-C750
2592 FIXED	 linux-rp_2.6.21.bb has the wrong Collie patches
2593 FIXED	 Qt4-x11 broken for generic x86 target
2594 FIXED	 palmld defconfig
2597 FIXED	 gsteamer instead of gstreamer in gstreamer--feed.conf
2608 DUPLICATE	 asterisk 1.4 bb files
2572 FIXED	 meta-opie is broken since task-opie-16mb.bb


Bugs opened:
bug_id resolution	 short_desc
2601 	 RRECOMMENDS overrides do not work
2579 	 alignment faults in uclibc + EABI
2580 	 bison added to sanity.bbclass
2582 	 sd-card is not correctly recognized by kernel
2584 	 qtopia-core 4.2.0 packaging needs work
2587 	 Recipe for xf86-video-amd
2588 	 xmonobut doesn't affect mouse click on angstrom
2589 	 qemu-native sigsegvs on amd64 while generating glibc locales
2590 	 e17 : suspend doesn't work
2591 	 patches needed to compile qemu-native on ppc
2595 	 meta bug for simpad
2596 	 angstrom simpad: gpe touchscreen calibration restarts without reason
2598 	 angstrom simpad gpe: metabug suspend with power button does not work
2599 	 simpad angstrom gpe: keylaunch does not start because of not defined=
 keysyms
2600 	 simpad angstrom gpe: simpad.xmodmap keysym is wrong
2602 	 zaurus c1000 akita touchscreen broken
2603 	 angstrom-e-image broken for i86
2604 	 angstrom-x11-image broken for x86
2605 	 mkfontdir-1.0.3 uses the wrong URL
2606 	 Source for db3 archive seems to not be avalible any more.
2607 	 tetex package fails to configure

In total 21 bugs have been created and 29 bugs were closed.

------=_NextPart_000_0084_01C7BFC2.43C43040--
