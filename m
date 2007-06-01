Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hu3kW-0000Mh-SY
	for openembedded-devel@openembedded.org; Fri, 01 Jun 2007 11:48:49 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l519krLr025053 for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Jun 2007 11:46:54 +0200
Message-ID: <465FEB10.5080101@dominion.kabel.utwente.nl>
Date: Fri, 01 Jun 2007 11:46:56 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OpenEmbedded ChangeLog for 200705
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
X-List-Received-Date: Fri, 01 Jun 2007 09:48:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Here's the changelog for may 2007, made with contrib/mtn2cl.sh (blame thunderbird for the
line wrapping):

Laibsch@openembedded.org:
    nabi: Fix SRC_URI
    nabi: initial commit.  Untested.
    libhangul: initial release. untested.
    nunome: fix non-working nunome on spitz/Angstrom
    gnuchess: initial commit of the gnuchess engine.  Partly fixes 429.
    ntp: fix issue with INITSCRIPT_NAME
    bitbake.conf: Remove the dangerous suggestion to change SOURCEFORGE_MIRROR
    mISDN: initial "early and often"-release.  Partly closes bug 240.
    ntp: unify.  Add iana-etc to RRECOMMENDS.
    iana-etc: add to OE.  Closes bug 1750.
    mpeg2dec: fix a compilation error (${S} var) and packaging.
    lirc-modules: enable cvs version until other versions compile again
    gtk-engines: remove hard-coded paths.  Closes 2364.
    lirc: remove default_pref=-1 from cvs version until other versions compile (cf. bug
2375 and 2284)
    classpath: update to version 0.1x
    opie-tinykate: fix packaging
    elfutils: upgrade to version 127
    glibmm and gtkmm: fix incorrect dependencies.  Fixes bug 1923.
    scummvm: introduce SOURCEFORGE_MIRROR variable.  some minor clean-up.
    mpeg2dec: set it to provide and rprovide libmpeg2 (just to be safe, bug 375)
    classpath: revert seemingly erroneous manipulations of SRC_URI in classpath.inc
    classpath: make disable-automake-checks apply to CVS version of classpath-gtk
    intltool: unify
    hal: unify
    gtkhtml: unify
    gpe-what: unify
    gpe-timesheet: unify
    MAINTAINERS: update my entry
    classpath: update from Andrew Paulsen. partly closes 2296.
    MAINTAINERS: update my entry
    removal.txt: add gtkmm 2.4.8 for removal. See bug 1184 for further info.
    xorg-lib: drop unused errordb-keysymdb-path-fix.patch
    libmpeg2: drop from OE.
    MAINTAINERS: update Rick Farina's entry, partly closes bug 2356.
    MAINTAINERS: update my entry
    nano: upgrade to version 2.0.6.  Closes 2343.
    gdb: unify
    gdb-cross: unify
    lirc: package debug files.  Bump PR.
    lirc: disable DRIVER_collie = "sa1100" temporarily until it works reliably
    wlan-ng-utils: fix packaging issues
    wlan-ng-utils: package up debug files.  Fixes QA compilation error.
    wlan-ng-utils: put ${S} back in.  It is indeed needed after all ;-)
    wlan-ng-utils: unify
    zten: add zten for the first time.
    checksums.ini: Replace faulty checksums for unismall.
    bitbake.inc: correct spelling mistake
    ecj: add native package.  Partly closes 2296.
    gmailfs: update to 0.7.3.  Closes 2256.
    povray: Clean up.  Bump PR.  Partly closes 2234.
    gpe-timesheet: drop all versions prior to 0.3.
    ntpbm: clean up.  Bump PR.  Partly closes 2234.
    mb-desktop-xine: clean up.  Bump PR.  Partly closes 2234.
    fltk: clean up. Bump PR. Partly closes 2234.
    gphoto2: clean up. Bump PR. Partly closes 2234.
    links: clean up.  Bump PR. partly closes 2234.
    entice: clean up.  Bump PR. Partly fixes 2234.
    gpe-ownerinfo: unify

antti.andreimann@mail.ee:
    mesa: fix build on FC6, closes #2363

bero@arklinux.org:
    perl-native: Patch perl's makedepend.SH to work with gcc 4.2. Shouldn't be

cbrake@openembedded.org:
    compulab-pxa270 machine: add --no-cleanmarkers as we are using NAND

coredump2@openembedded.org:
    keylaunch: the h/w hotkeys and LCD softkeys are now in the F20+ range (there was a
damn good reason for changing them back in the days, but I forgot why heh )
    keylaunch: Fix RDEPENDS to display-brightness for selected machines, closing bug #2110
    xserver-common: Import a set of patches from the .oz354x branch, fixing keymapping on
akita, spitz and c7x0.
    keylaunch: Swap Calendar and Address buttons to launch the correct application whe
pressed.
    Fix license
    Add The Hentges ROM 2.x ( based on Ansgtrom ) to OE. Very early state.
    zaurusd: Disable handling of alsa state files
    alsa-state: Add c7x0, cxx00 and tosa state files, borrowed from zaurusd
    task-base.bb: Add sysvinit-pidof to the default of DISTRO_INIT_MANAGER
    angstrom-2007.1.conf: Remove duplicate entries from DISTRO_EXTRA_RDEPENDS
    altboot: Fix SRC_URI of SVNR48. Thanks to Bernardo who spotted the problem.
    altboot: Add SVNR48, completing Flash, HDD and CF booting on spitz.
    altboot: Add SVNR44 which unb0rks reboot/shutdown for all Z and adds an advanced
bootscript with multi-partition support for SL-C3x00. Not perfect yet but useable,
feedback welcome
    altboot: Unb0rk do_install and SVN path of all altboot .bb's. You'll probably have to
rm -rf your sources/altboot directory due to a bug in the SVN fetcher.
    linux: linux-rp: Make compiling a custom kernel w/ changed CMDLINE and defconfig a bit
easier.

crofton@openembedded.org:
    u-boot.inc : Correct args to install to work with OE install-native.
    libtool-cross_1.5.22.bb : Comment out experimental, unfinished patch.
    libtool-{cross,native}_1.5.22 : Add changes from Poky to 1.5.22.
    libtool : Add bb files for libtool-1.5.22. DEFAULT_PREFERENCE set to -1

dirk@openembedded.org:
    ethtool: version 5 added
    syslinux: 3.36 added, also install extlinux
    valgrind: 3.2.3 added

florian@openembedded.org:
    pcmciautils: Update patch to fix install breakage.
    keylaunch: Update patch
    connect: Work around broken OE install-sh.
    gpe-session-scripts-phone: Work around broken OE instal-sh.
    gnome-desktop: Work around documentation build failure by skipping it.
    prismstumbler: Add wireless header patch for 0.7.3+0.7.4pre1
    libgpevtype: fix dependency
    htcuniversal.conf: Load the acx module.
    osb-nrcit:  Update to build latest svn trunk.
    osb-nrcore:  Update to build latest svn trunk.
    osb-jscore: Update to build latest svn trunk.
    gpe-bluetooth: Add svn version.

freyther@openembedded.org:
    packages/lftp/lftp: Delete the custom iconv.m4 in favor of the staged one fixing the
uclibc build
    packages/libtool/libtool-cross_1.5.10.bb: Disable --rpath on compiling!
    packages/{abiword,gtk}: Do not depend on glibc gconv when compiling for uclibc
    packages/libiconv: Battle libiconv to not use a rpath (and fix the uclibc build)
    classes/seppuku.bbclass: Merge with the one used at openmoko's autobuilder
    packages/libmrss: Update to mrss 0.17.2
    pakages/avahi: Do not RRECOMMEND libnss-mdns when building on uclibc
    packages/strace: Apply patch from uclibc buildroot to fix compilation uclibc angstrom
    packages/bluez/bluez-utils: angstrom uclibc fixlet. Make custom ppoll not clash with
sys/poll.h
    packages/pciutils/pcituils-2.2.4: Fix configure for gnueabiuclibc builds
    packages/uclubc: Enable C99 math to get isnan needed for perl on ansgtrom
    conf/checksums.ini: Add my icu sums
    packages/gperf: Add GNU perfect hash generator. This is needed for WebKit
    packages/{qmake,uicmoc}: Update qmake and uic/moc from Qt4.1.2 to 4.2.3

hrw@openembedded.org:
    linux-h6300-omap1: add COMPATIBLE_MACHINE
    linux-tornado-omap2: add COMPATIBLE_MACHINE
    libxml-parser-perl-native: fix RDEPENDS (from Poky)
    linux-mtx*: added COMPATIBLE_MACHINE
    xrandr: fix uclibc build (from Poky)
    task-base: really add task-base-extended, fixed it's code
    task-base: add PROVIDES = PACKAGES (requested by Rod Whitby)
    task-base: add task-base-extended which adds wifi/bt for pcmcia/pci/usbhost devices
    linux 2.6.21: kb9202 use u-boot so switch to uImage
    linux 2.6.21: added kb9202 support
    kb9202: initial configuration for KwikByte KB9202 devboard
    slugos: set PREFERRED_PROVIDERS for libiconv/libintl/libc
    oplinux-packages: reindented to get parsed - use 4 spaces not tabs
    rt2570-k2wrlz: added 1.6.0 version - close #2357
    powertop: update to 1.2
    liburi-perl: added 1.35 (needed by exo, only native one tested)
    xfce: drop empty libxfce* dirs
    xfce.bbclass: update for 4.4.1
    XFCE: update 4.2.x to 4.4.1
    checksums.ini: remove gaim patches fetched from cvsweb
    checksums.ini: remove xfce m4 macros fetched from svnweb
    minimo: add EABI patches for 0.016 (from Poky)
    linux 2.6.20: drop Simpad and Progear support
    image.bbclass: remove *all* IPKG list files
    libglade: set '-lz' in LDFLAGS instead of CFLAGS - close #1774
    settings-daemon: merge changes from Poky (proper PV, dependencies)
    xf86-video-siliconmotion: added 1.5.1
    xf86-input-mouse: added 1.2.1
    xf86-input-keyboard: added 1.2.0
    xf86-input-evdev: added 1.1.5
    xrdb: added 1.0.3
    xrandr: added 1.2.0
    xdm: added 1.1.4
    mkfontdir: added 1.0.3
    libxv: added 1.0.3
    libxt: added 1.0.5
    libxrandr: added 1.2.1
    libxinerama: added 1.0.2
    libxi: added 1.1.0
    libxfont: added 1.2.8
    libxaw: added 1.0.3

ifaistos@openembedded.org:
    conf/machine/sequoia.conf: Sequoia board is using AMCC's ppc440EPx cpu with an FP unit
and
    conf/machine/epia.conf : Add GLIBC_ADDONS = "nptl" and GLIBC_EXTRA_OECONF =
"--with-tls" to
    packages/linux/linux-x86-2.6.20/defconfig : remove old config of linux-x86 kernel
    packages/linux/linux-x86_2.6.20.bb : Set kernel configs for i486, i586 and i686 kernels
    packages/linux/linux-dht-walnut: Remove old dht-walnut kernels
    packages/linux/linux-dht-walnut_2.6.20.bb: Build kernel using gcc 4.x
    packages/linux/linux-sequoia-2.6.21 : Add Denx 2.6.21.git kernel for the Sequoia dev board
    packages/uboot/u-boot_git.bb : Add sequoia dev board uboot release tag
    conf/machine/i686-generic.conf: Add a machine for a generic i686
    conf/machine/i586-generic.conf: Add a machine for a generic i586
    conf/machine/sequoia.conf : Set PREFERRED_VERSION for u-boot to "git" and use the same
tag
    conf/machine/magicbox.conf: Add licence
    conf/machine/dht-walnut.conf : Set MACHINE_TASK_PROVIDER  to task-base
    classes/icecc.bbclass : Make sure that PARALLEL_MAKE is set to null if the package is
not to use the icecc scheduler.
    packages/meta/oplinux-packages.bb : Fix "identation error" when used with bitbake 1.8
(thanks to zecke for the info)
    packages/meta/oplinux-packages.bb: fix some tab/spaces issues that made bitbake 1.8
complain when processing the package
    packages/meta/oplinux-packages.bb :Initial commit of meta package containing all the
packages which build for OPLinux nad OPLinux
    packages/linux/linux-dht-walnut_2.6.20.b: Add TARGET_VENDOR to the
    packages/linux/linux-magicbox_2.6.19.2.bb: Add TARGET_VENDOR to the
    conf/checksums.ini : Fix boost-asio checksums
    packages/aiostress/aiostress_0.0.bb: Change URI as the file has disappeared from the
Suse ftp
    packages/images/minimal-image.bb : Add a minimal-image that contains only the
nessesary progs to boot
    packages/clish/clish_0.7.1.bb: Add new package clish
    packages/madwifi/madwifi-ng_r.inc: set magicbox's arch to ppc so madwifi-ng compiles
    packages/linux/linux-magicbox_2.6.19.2.bb: Remove some comments, bump PR
    conf/distro/include/oplinux.inc:Add the mirrors to oplinux and oplinux-uclibc
    classes/oplinux-mirrors.bbclass: Add mirrors for OPLinux distro
    packages/uclibc/uclibc-cvs/magicbox/uClibc.config:Add full Math99 support
    conf/distro/oplinux.conf : Make oplinux distro provide all availiable types of images
    packages/linux/linux-magicbox_2.6.19.2.bb: Add kernel 2.6.19.2 for Magicbox
    conf/machine/magicbox.conf: Clean up the image generation parameters , inherit
magicbox-image.bbclass in order to
    classes/magicbox-image.bbclass: Add a class that handles the generation of flash
images for Magicbox
    packages/uclibc/uclibc-cvs/magicbox: Add uclibc config for Magicbox
    packages/initscripts/initscripts_1.0.bb:Add mountall.sh script for oplinux-uclibc
    conf/machine/magicbox.conf: Make sure squashfs-lzma image builds for big endian arch
    conf/bitbake.conf:make default values for jffs2, squashfs and squashfs-lzma generated
images architecture neutral
    packages/gcc/gcc_4.1.1.bb: Do not apply ppc soft-float patches when building with uclibc
    conf/machine/magicbox.conf : make sure jffs2 and squashfs images generated are for big
endian machines
    packages/linux/linux-magicbox_2.6.18.6.bb : Add squashfs-lzma support to the kernel

justinp@openembedded.org:
    efl, e17: update to latest versions, entrance has been heavily patched and seems to
have some issues so I left the old version as the default
    angstrom-e-image: switch to task-base-extended

koen@openembedded.org:
    curl: turn on tls support
    libfakey: tweaks
    gcc-cross-sdk: add 4.2.0
    gcc: remove stale 4.2.0 snapshot
    gcc-cross: add 4.2.0
    gcc: add 4.2.0 with some refreshed patches, untested
    glibc-initial: add 2.6
    glibc: add 2.6
    uclibc 0.9.28: replace avr32 config with an actual avr32 config....
    uclibc 0.9.28: add quick & dirty avr32 config
    at32stk1000.conf, atngw100.conf: add skeleton machine descriptions for the atmel avr32
boards
    siteinfo.bbclass: add rudimentary avr32 support
    uclibc 0.9.28: rearrange patches, add avr32 one
    binutils 2.17: add avr32 patches
    gcc-cross-initial: add 4.1.2
    glibc-package.bbclass: replace os.path.join with base_path_join to make OE use the
locales from WORKDIR instead of /usr, closes #1821
    webkit: fix typo
    webkit: add more depends
    openmoko-session: sync a bit with openmoko svn
    webkit: fix packaging
    icu: depend on icu-native, thanks XorA
    webkit: add install and packaging, still needs do_stage()
    db1200: remove PACKAGE_ARCHS
    webkit: unbreak qmake usage a bit
    angstrom: bump xrandr to 1.2.x
    mplayer 1.0rc1: sync with svn version for pxa optimizations
    empathy: sync with poky
    WebKit: add WIP recipe to build the webkit-gdk port
    icu: fix build
    mediatomb: update to 0.9.1
    xserver-kdrive: add patch to speed up pixbuf compositing on some 16bit displays
    ipkg-utils-native: bump PR since some patches have changed
    uclibc: fix strongarm configs
    angstrom-console-image: use task-base-extended
    uclibc: fix strongarm defconfigs and add some more
    angstrom: distinguish between uclibc and glibc images
    llvm-native: update to 2.0
    empathy: update to 0.5
    pointercal: remove hh.org kernel ports since they are too unstable
    linux 2.6.21: add EABI magic
    xserver-kdrive-xomap: update to oss31 (from poky)
    bluez: update libs and utils to 3.11
    xserver-kdrive-common: fix typo
    scummvm: add 0.9.1 with default_preference = -1 since the sh3 patch has been dropped
    scummvm: catch up with libmpeg2 removal
    guinness.conf: PREFERRED_PROVIDER_xserver = "xserver-kdrive"
    xorg-xserver-common: substitute drmfix.patch with a more robust sed statement
    xserver-xorg: update mesa dep to 6.5.2
    xserver-kdrive: merge 1.3.0.0 from poky
    xserver-xorg 1.2.0: remove broken patch
    xorg-xserver-common.inc: granulate packaging some more, closes #2360
    gdb: fix RRECOMMENDS
    composite-pixbug: add test app for pixbug performance
    telepathy: update empathy to 0.4, update tmc to 4.22
    ipod: add compatible machine
    linux-uml: add compatible machine
    angstrom: move everything to 2.6.20 kernel headers
    bluez-gnome: add 0.7 release
    bluez-gnome: fix DEPENDS
    python-pygtk2 2.10.3: fix debug packaging
    pycairo: fix packaging
    seppuku.bbclass: replace all examples with OE examples
    documentation.conf: remove openmoko crap, this is OE
    pimlico tasks: update to 0.5
    seppuku.bbclass: start removing openmoko crap
    icu: stage files
    linux-ezx 2.6.21: update to r2011:
    ipkg: apply speedups patches to ipkg-native as well
    libx11-native: somehow the makekeys patch got lost, readded it
     libx11-native_1.1.1.bb: remove bogus file
    icu: more granular packaging:
    icu: add some sed to remove non-crosscomile friendly invocations
    icu: add icu-native and a broken icu
    libx11: add a new -native and stop removing xlib.h
    mono: fix require statements
    mipsel-linux site: add some more entries (from #2234)
    nokia 800: fix defconfig
    linux-nokia800: update defconfig for nokia800
    xserver-kdrive-xomap: merge from poky
    xcalibrateext: provice compatibility with old cvs version
    xserver-kdrive-common: merge n800 support from poky
    linux-gta01: update defconfig for 2.6.21.1
    angstrom-x11-image: install openmoko-dialer for devices with 'phone' machine feature
    fic-gta01: add 'phone' machine feature
    gpe-bluetooth svn: lower default pref
    xserver-kdrive-common: fix DPI for fic-gta01
    tslib: fix RRECOMMENDS
    tslib: ship pointercal files for angstrom
    angstrom: prefer pango 1.16.4
    pointercal: merge from poky, add some more from
http://linuxtogo.org/gowiki/AngstromPointercals
    binutils-cross-sdk: add 2.17.50.0.5
    sdk.bbclass: also package debug files
    insane.bbclass: fix sdk builds
    gcc4-build-sdk: fix USE_NLS
    gcc-cross-sdk 4.1.2: remove obsolete patch
    evince, pimlico: bump PR for latest icon-cache change
    uclibc: enable c99 math for ep93xx
    uclibc: bump PR for zecke's change to the config
    gtk-icon-cache.bbclass: postinst scripts need hicolor-icon-theme (bunch of directories
+ 1 small textfile), so add it to RDEPENDS
    hicolor-icon-theme: set package arch to all
    evince: checkin missing patch
    evince: update to 0.9.0, from poky
    gnome-doc-utils: update to 0.10.3
    babl: fix up packaging
    gegl: fix depends
    avahi: merge r1686 from poky:
    task-base: merge r1692 from poky:
    libidl: merge r1698 from poky:
    babl: fix PV
    babl: add svn version
    libtool, autotools.bbclass: merge fixes for 1.5.10 from poky
    bluez-utils: enhance 3.10.1, move some stuff from include
    gimp 2.3.10: fix packaging, closes #2313
    install-native: inherit native
    uclibc 0.9.29: turn on SUSV3 stuff on angsgrom to build perl
    gettext: fix building against uclibc
    angstrom-uclibc: turn on NLS for glibc
    bluez 3.10.1: ~lart linebreaks
    bluez-utils 3.10.1: move hciattach to main package till hcid can handle that functionality
    gdb: only RRECOMMEND glibc stuff when building for glibc, the check isn't optimal
    task-openmoko: remove unused lmsensors
    bluez-utils 3.10.1: configure and package according to upstream guidelines
    bluez-utils: groundwork for 0.3.10 recipe - DO NOT USE FOR PRODUCTION
    	bluez-libs: update to 0.3.10
    uclibc 0.9.29: add fic-gta01, poodle and (now really) ep93xx configs
    uclibc 0.9.29: fix FILESPATH, add ep93xx config
    linux-xxs1500: add COMPATIBLE_MACHINE
    linux-colinux: add COMPATIBLE_MACHINE
    linux-geode*: add COMPATIBLE_MACHINE
    disapproval of revision '2f7cdf8eacd78e273744583cd918480d48f69dc8'
    bluez-gnome: fix 0.6 and add _cvs version with loads of improvements
    powertop: add 1.0
    avahi: update to 0.6.19
    uclibc 0.9.29: add config for collie
    uclibc 0.9.29: add config for efika
    uclibc 0.9.29: add configs for c7x0, h2200, h3900, h4000, h5000
    tinylogin: make it build against uclibc 0.9.29
    module-init-tools: fix build against uclibc
    sane-srcdates: bump gconf-dbus
    gcc 4.1.2: update uclibc locale patch to work with uclibc 0.9.29
    angstrom: prefer uclibc 0.9.29
    uclibc 0.9.29: add configs for a780, akita, spitz and hx4700
    uclibc 0.9.29: drop bogus config
    uclibc: add recipe for 0.9.29
    uclibc.inc: Fix QA issues and prepare for 0.9.29
    insane.bbclass: add support for ARM EABI/uclibc
    disapproval of revision '04e66b01ee822895efeb76e94c17d1f6605e0f83'
    checksums.ini: fis.c is fetched from svn, so don't checksum it
    angstrom-console-image: only ship psplash-zap if psplash has been included
    angstrom-x11-image: don't overwrite EXTRA_INSTALL
    bitbake.conf: set patch resolver to 'noop' to get the old abort-on-error back
    bitbake: update svn to 1.9.0 and release to 1.8.2
    xfdesktop/: drop
    xfce: drop some more obsolete dirs
    xfwm: drop obsolete dirs
    xfce: drop some more deprecated dirs
    distcc: merge with Poky
    firefox 2.0.0.3: apply extra EABI patches
    mozilla: remove patches for the topdir
    mozilla: add EABI patches from poky (not applied yet, just for reference)
    pidgin: fix rrecommends
    pidgin: add first stab at a 2.0.0 recipes
    nokia tablets: build open source flasher for images
    0xFFFF: add native and cross versions of the GPL flasher for nokia internet tablets
    libvocenabler: fix cross-compile badness with linphone
    libgemwidget: make it work with a recent gtk.
    angstrom: stop locking down gstreamer versions
    angstrom-console-image: make it parse
    angstrom-console-image: add psplash-zap to kill the bootsplash after booting
    linux-magicbox: add COMPATIBLE_MACHINE
    fuse: (hopefully) fix all remaining issues
    sshfs-fuse: package all files, closes #2047
    fuse: update to 2.6.5 and make packaging more granular
    python-fuse: fix packaging and depends, spotted by Junqian Gordon Xu
    fuse 2.6.3: fix packaging
    openssl: fix FILES, spotted by Junqian Gordon Xu
    ep93xx-kernel: fix do_deploy
    libxcb: fix FILES, spotted by Junqian Gordon Xu
    fuse 2.5.3: fix FILES for libfuse
    bcm2035tool: takes BDADDR as a commandline argument. Patch from Jan Herman
    angstrom-x11-image: add task-base-wifi
    gtk+: add 2.10.12
    acpid: add an extra install -d to avoid things like this:
    angstrom: add armv5teb, prefer a perl that works for armv5teb, update gtk+
    prismstumbler: add missing patch
    gpe-autostarter: add missing patch
    tracker: add file to DEPENDS (for magic.h)
    insane.bbclass: repair last commit
    insane.bbclass: on check for references to WORKDIR in RPATH, instead of WORKDIR and
STAGING
    chrpath: add cross version
    glib.inc: make printf disable opt-in
    linux-ezx 2.6.21: Sync with openezx svn
    ixp4xxbe: the gcc patch is in, so no need for this workaround anymore
    linux-ezx 2.6.21: update to r1996, fixes some oopses
    gcc 4.1.2: fix 800-arm-bigendian.patch
    cairo-git: update PV
    gpe-dm: add 0.51, doesn't need procps anymore
    glib-2.0: add 2.12.12, a bugfix release
    ixp4xxbe: add -D__ARMEB__ to target cc arch
    linux-ezx 2.6.21: update patches to r1995, gives you working ts, keys and some
powermanagement
    glibc: also add strlen patch to glibc-2.4 dir
    glibc 2.5: fix the strlen() issues on big endian EABI, thanks to Lennert for tracking
down the culprit
    xtscal: reinstate tr toupper filter so everything works again.
    xtscal: Sharp seems to use Dogname instead of DOGNAME for newer models
    linux-gta01: update to moko10

lenehan@openembedded.org:
    libxml-parser-perl-native: Remove uneeded entries:
    clamav: Add 0.90.3, remove 0.88.7.
    cpan-base.bbclass: Update the perl depenedencies:
    perl 5.8.8: Fixes for uclibc and libxml-parser-perl.
    sdl-perl 1.20.3: Fix the build of sdl-perl
    perl 5.8.8: Bump PR on modules to force the -native versions to be rebuilt
    perl-native 5.8.8: Fix an issues with the perl makedepend script not
    perl 5.8.8: Patch MakeMaker in perl-native to check for PERL_INC in the
    perl/perl-native 5.8.8: Change the installation directories used for
    uclibc 0.9.29: Move the angstrom configuration to the global configuration.
    perl: Add some more modules which I've been using locally incase someone
    perl: Bump PR on modules that include shared libraries since these may have
    perl 5.8.8: Fix the CFLAGS being used for perl modules. Instead of replacing
    grep 2.5.1: Fix for uclibc. Grep uses __mempcpy which glibc provides but
    bluez-utils 3.9: Fix for uclibc. Termios speed above 115k are not supported,
    blueprobe 0.18: Fix for uclibc. Termios speed above 115k are not supported,
    site: Update the site files to handle glibc having sys_siglist while uclibc
    sudo 1.6.8p12: Redo the long long autoconf macros using what is in the
    clamav 0.90.2: Fix build for uclibc by testing for libintl and linking
    uclibc 0.9.29: Add machine configuration for the sh4 based titan board.
    havp 0.86: Add new version. This version is compatile with the clamav 0.9x
    clamav: Add 0.90.2 version, remove older versions plus a number of other
    basefiles, initscripts: make /var non-volatile, as discussed on the mailinglist
    perl modules: Bump PR since the directories they install into have changed
    perl/perl-native 5.8.8: Remove -DEFAULT_PREFERENCE = "-1" for version 5.8.8.
    perl 5.8.8: Allow debian.bbclass to mess with perl-lib's naming. This will
    perl 5.8.8: Bump PR due to the perl-native change which will fix failing
    perl-native 5.8.8: Fix for cross-compile badness in the perl build. The
    perl: Add the .debug directories that to FILES_${PN}-dbg in the
    perl-native 5.8.8: Apply the patch from perl to stop the .packlist files
    perl/perl-native 5.8.8: Move the creation of the hostperl link in staging
    perl: Extract common functionality from cpan and cpan_build classes into a
    net-snmp 5.1.2: Fix for do_configure hanging when using bitbake
    perl modules: Bump PR on cpan modules effected by the recent
    cpan.bbclass: Stop the cpan modules which ask you to confirm the
    cpan.bbclass: Building cpan modules needs to depend on both perl and
    perl 5.8.8: Fix to tell bitbake about the perl module packages. I'd left out
    perl 5.8.8: Allow perl to build when using an external toolchain.

likewise@openembedded.org:
    lighttpd: Respect --with(out)-pcre, do not depend on libpcre presence.
    ipkg-utils: Fix config into ./config in ipkg.py
    sqlite3: Added 3.3.17.
    libcap: Add missing syscall.patch. Thanks v8jlene for spotting.
    lighttpd: Added 1.4.15, for those clueless about cherokee.
    libcap: Fix uclibc support.
    vsftpd: Fix dependencies. Fix uclibc support.
    uclibc: Add uclibc-initial-0.9.29 so that toolchain bootstrap from recent kernel
headers works.
    alsa-utils-1.0.13: Disable NLS for uclibc, workaround, needs more TLC.
    watchdog: Cleaned up .bb. Corrected description.
    uclibc-0.9.29: Revert untested patch, must test first.
    uclibc-0.9.29: Fix inproper shift in mmap (uClibc bugid 1303).
    uclibc: 0.9.29/angstrom/uClibc.distro needs UCLIBC_SUSV3_LEGACY=y for perl
    hdparm: Fix building against uclibc.
    linux-efika: Enabled power management; standby mode now works.
    helloworld-image: an truly minimal image with static helloworld
    helloworld: New! A statically compiled hello world.
    linux-efika: Add kernel from GIT tree. Supports deep sleep.
    helloworld: helloworld is easy, fixing my own commits is not.
    helloworld: fix broken commit.
    disapproval of revision '1d3cbf1f69da57387c0d0eb4329fc5054a9ccec0'
    angstrom-minimal-image: revert broken commit.
    helloworld: package plus image for truly minimal user space, a statically linked hello
world executable.
    uclibc: Use only uClibc.{distro,machine} for 0.9.29. Do not need require these for
<0.9.29. This fixes uclibc-initial-0.9.28 builds.
    uclibc: Fix .config for (old) uclibc-0.9.28
    upstart: Finer grained packaging. Fix license. New package, needs testing.
    upstart: New package. Event driven system init alternative, 0.3.8.
    linux-efika: Add kernel 2.6.20.11 with CFS scheduler.
    db: Use rm -rf instead of rmdir (which broke re-installation).
    glibc: Remove armeb strlen workaround. We now have the GCC PR16350 patch, take 3 in GCC.
    watchdog: Added 5.3.1.

mwester@openembedded.org:
    Unslung: glibc.bb and unslung.conf - make Unslung build with bitbake 1.8

ospite@studenti.unina.it:
    linux-exx 2.6.21: For now the code for serial console is disabled in compress.c

pH5@openembedded.org:
    u-boot-mkimage-gta01-native: split_by_variant.sh script was moved
    libxcb: package libxcb-xinerama, again spotted by xjqian

pfalcon@openembedded.org:
    ipkg-utils: Support reading both "control" and "./control" from tar archives.
    ipkg-utils-native: Revert previously applied patch regarding "control" vs
    linux-handhelds-2.6: Add 2.6.21-hh5. Changes since -hh4:
    libsdl-qpe 1.2.9: Fix build issue after recent kernel headers and gcc upgrades.
    linux-handhelds-2.6 2.6.21-hh2: Update to 2.6.21-hh4.
    linux-handhelds-2.6: Actually add defconfig for h2200 and htcblueangel,
    linux-handhelds-2.6: Update defconfigs from defconfigman r258
    linux-handhelds-2.6: Update defconfigs, from defconfigman r230.
    linux-handhelds-2.6: Add 2.6.21-hh2, with defconfigman-generated configs per RFC.
    htcuniversal.conf: Remove explicit handling of RTC modules, now done by task-base.
    task-base: RRECOMMENDS_task-base-kernel26: Add RTC kernel modules.
    h4000.conf, hx4700.conf, rx3000.conf: Ship kernel-module-acx for devices with ACX WiFi.
    rx3000.conf: Ship BT and WiFi firmware.
    linux-handhelds-2.6: Drop obsolete recipes.
    linux-handhelds-2.6 cvs: CVS HEAD is 2.6.21-hh2 now.
    linux-handhelds-2.6: CVS HEAD is 2.6.21 now, 2.6.20 is in branch.
    devshell.bbclass, patch.bbclass: Error on any non-zero rc from TERMCMD*.
    devshell.bbclass, patch.bbclass: Check exit code of TERMCMD* commands to see if they
were found at all.
    ipkg 0.99.163: Apply patches to optimize internal algorithms.
    palmtx.conf: Never RDEPENDS for kernel modules.
    opie-init: Handle qss startup properly and diagnostably.
    opie-todo cvs: Fix unbreak-logging.patch
    libqpe-opie cvs: Unbreak logging.
    opie-init: Actually daemonize qss.
    opie-init: Start qss daemon.
    task-opie: Add opie-qss, an OPIE sound server, essential component.
    opie-taskbar cvs: Don't bother to start qss from C++ code.
    opie-todo cvs: Unbreak system-wide logging.
    preferred-opie-versions-1.2.3-pre: Bump CVS version to 20070428.
    linux-handhelds-2.6: Add defconfig for h5000.

philippe@openembedded.org:
    gpe-mininet: added new svn build recipe

polyonymous@klever.net:
    evas: fix build against recent kernel-headers, closes #2216
    prismstumbler: fix build against motif and recent linux-linux-headers, closes #2177
    gpe-autostarter: fix compilation with recent linux-linux-headers, closes #2176
    qte 2.3.10: Fix lack of PAGE_* in latest linux-headers properly: use getpagesize()
    qte, qte-mt 2.3.10: Fix build with recent kernel headers.
    opie-networksettings cvs: Fix compilation with latest linux-headers.

polyonymous@openembedded.org:
    xqt2: install into proper location. Closes #2100
    tree: a new .bb for tree recursive lister
    billiardz: restored the missing gcc4 patch, thanks to Marek Vasut from bug #2051.
    pidgin: added zero-length extra_depends to do_split_packages call to avoid adding
semirandom dependency by the totally broken code.
    pidgin: repackaged for sane interdependencies handling. Closes #2305
    opie-multikey: Let it load ru.keymap even with utf8 locale set by converting comments
into utf-safe encoding.
    opie-reader: fix copying of unicode text blocks, since upstream isn't likely to
incorporate this one-liner patch anytime soon.
    gcc: Make gcc build on amd64 by having it forget target configure cache when
configuring for build machine. Closes bug #1951
    opie-init: spawn ssh-agent separately. Closes #1729
    m4: removed -1 preference from 1.4.8, closes bug #837
    classes/insane.bbclass: quote filenames to avoid problems with funny characters.
Closes bug #2227
    prismstumbler: added missing dependency on libxpm
    apmd: prevent build from interferring with host kernel headers. Closes #1257
    classes/qpf.bbclass: removed set -e from postinst/prerm scripts so that it doesn't
fail on sourcing in /etc/profile. Closes #2388
    git: it turns out that git also relies on a decent sed.
    postgresql: added 8.2.4
    libopieobex0: install missing picture
    directfb: fixed to build on recent kernels wrt PAGE_SIZE definition
    opie-irdaapplet: added patch to take operator precedence into account.
    libxfce4util: added xfce4-dev-tools as a dependency and expanded list of headers being
staged.
    xfce4-dev-tools: added package, because libxfce4util needs it.
    xdm: added missing dependency on libxaw
    lirc: added cvs packages using the date, mentioned in bug 1952
    conf/checksums.ini: added checksums for subversion 1.4.3 tarball
    m4: add 1.4.8 with DEFAULT_PREFERENCE of -1, see bug #837
    subversion: added 1.4.3 version with DEFAULT_PREFERENCE of -1.
    neon: force gnutls support as per bug #2280
    gnutls: stage pkgconfig stuff
    subversion: added a patch to detect neon and enable dav protocol handler
    neon: stage pkgconfig stuff
    git: minor fixes to make git work on the device. Closes #2226 and #2240
    base-files: only set TERM in profile if it's not set to allow more or less comfortable
ssh. Closes #805
    packages/psplash: added psplash-zap package with initscript to quit psplash before
going for login prompt on console image.
    psplash: adjust the rotation angle in the initscript according to the machine being
used. Should fix #2149
    sword: gcc visibility fixes, closes #2196
    kdepimpi: fix the QMutexLocker build fix

rpurdie@openembedded.org:
    ipkg-utils: Merge in tweaked version of patches from #1504 (from Paul Sokolovsky) to
massively speedup ipkg-make-index
    clucene: Move to nonworking. its cvs doesn't exist any more
    native.bbclass: Unset CONFIG_SITE since we shouldn't be using site files for native builds

rwhitby@nslu2-linux.org:
    ixp4xx-kernel: Updated to 2.6.21.1
    ixp4xx-kernel: reinstated 2.6.21 - apologies to all affected by my previous mistake
    ftpd-topfield: Updated to 0.7.3
    arm-kernel-shim: Updated to version 1.4
    ixp4xx-kernel: Dropped support for 2.6.21, we're sticking to 2.6.20 stable and 2.6.22
development
    sysconf: Remove /linuxrc and spurious debug messages

sirfred@openembedded.org:
    gst-ffmpeg 0.10.2 : Add armv5te optimizations
    gst-plugins : Global changes for all the gst-plugins
    gst-plugins-bad 0.10.3: Fix crosscompilation issue
    gst-plugins-ugly 0.10.5 : Fix crosscompilation issues
    freetype 2.3.3 : Replace autotools_stage_includes with
    matchbox-theme-sato: New recipe for svn
    gtk-sato-engine: New recipe for svn
    gst-plugins-ugly: Add version 0.10.5
    gst-plugins-base: Add version 0.10.12
    gstreamer 0.10.12: Remove default_preference as gstreamer 0.8 is no
    gst-plugins-good 0.10.5: Be coherent with --with-check option in
    gstreamer: Add version 0.10.12

thommy@tabao.de:
    wgt634u: add machine, part of #2334
    mono: update to 1.2.4

wolfson@openembedded.org:
    MAINTAINERS : fix indenting

xjqian@gmail.com:
    sshfs-fuse: update to 1.7

xora@openembedded.org:
    evince_0.9.0.bb : on my kde system trying to run scrollkeeper just hangs
    kismet_2007-01-R1b.bb : disable gpsmap as per bug #2178 and discussion with
    packages/kismet/* : remove old versions
    aircrack-ng_0.9.bb : new edition from Zero_Chaos
    minimo_cvs.bb : update to 0.2+SRCDATE taken from poky, added PE = "1" as
    firefox_1.0.7.bb : add patch from
    packages/mozilla/* : removing old broken detritous

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGX+sQMkyGM64RGpERAkf9AJ0RGElzmGFT1NcMHCpxIVvUPygspACfc56S
ceQNBQbE/5SUqB5jTFYGQa0=
=nOei
-----END PGP SIGNATURE-----


