Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1I4ZQf-0007UB-M9
	for openembedded-devel@openembedded.org; Sat, 30 Jun 2007 11:39:45 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5U9Z0Lr003314 for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2007 11:35:00 +0200
Message-ID: <468623C0.3080204@dominion.kabel.utwente.nl>
Date: Sat, 30 Jun 2007 11:34:56 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.1
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OE 'weekly' changelogs
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
X-List-Received-Date: Sat, 30 Jun 2007 09:39:46 -0000
Content-Type: multipart/mixed; boundary="------------080605030808000207090607"

--------------080605030808000207090607
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I continue to fail to send this 'weekly', so here are two changelogs to compensate.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGhiPAMkyGM64RGpERAorBAJ4wx7NmAteObwPXr8KbyIWkaRrSnQCeMBgK
DrfBoLwdKt6GalzCW+5mzJw=
=chNb
-----END PGP SIGNATURE-----
Generated on 20075621
Laibsch@openembedded.org:
    angstrom.conf: prefer version 2.3.4 of freetype
    freetype: update to 2.3.4.  Closes 2218.
    classpath: some more fixes to packaging, etc and clean-up
    classpath: fix compilation failure of classpath-gtk_cvs.  Closes 2519.
    classpath: unify the gtk_cvs version and leave a note on how to compile it.
    classpath: add virtual/java-native to DEPENDS
    jikes: make jikes-native PROVIDE virtual/javac-native
    minimo: declare missing dependency on zip-native.
    unionfs: update SRC.  Fixes unfetchable source.
    jards: add to OE
    kanjipad: add gtk+ to depends
    uim: fix packaging
    jamvm: upgrade to version 1.4.5.  Partly closes 2296.
    classpath: unb0rk classpath-minimal-native.  Partly fixes 2296.
    qt-x11-free: Put those debug files into their proper place
    icewm: update to version 1.2.30
    wrt-imagetools: Fix do_fetch by taking svn snapshot until OE can handle SVN by itself.  Fixes 1735.
    uim: move debug files into proper package
    fix a couple of LICENSE entries
    libopensync: set default pref to -1 for svn version which seems not to build.  
    qemu: apply patch from bug 2157
    uim: fix S in native package
    anthy: improve packaging, some reordering of fields to clean up
    udev: disable parallel compilation
    checksums.ini: correct entries and update URI for three tomoe tar files
    tomoe: hardwire mirror for Japanese sourceforge
    MAINTAINERS: add tomoe to my entry.

Stefan:
    packages/memedit: Add memedit 0.7 a readline based tool like devmem2 but more convient

cbrake@openembedded.org:
    uclibc-0.9.29: add compulab-pxa270 machine config
    busybox: enable CONFIG_SWITCH_ROOT in busybox config

coredump2@openembedded.org:
    xchat: Update to 2.6.8
    gaim: Fix icon for pidgin
    fluxbox: Fix .debug QA error
    xchat: Fix QA error over .debug directry in /usr/lib/xchat/
    mtn2cl: Show total bugs created vs. total bugs fixed over 7 days
    gspcav1: Add the required video modules to RRECOMMENDS
    linux-rp-2.6.20: Add V4L support to defconfig-spitz and defconfig-akita to enable (beside other stuff) USB webcams

ifaistos@openembedded.org:
    packages/tasks/task-boot.bb : Task boot should honour MACHINE_EXTRA and DISTRO_EXTRA
    conf/machine/i586-generic.conf: Add MACHINE_EXTRA_RRCOMENTS="kernel-modules" as this is a
    conf/machine/i686-generic.conf: Add MACHINE_EXTRA_RRCOMENTS="kernel-modules" as this is a 
    packages/libpcap/libpcap_0.9.6.bb : Add libpcap 0.9.6

justinp@openembedded.org:
    efl, e: update for better packaging

koen@openembedded.org:
    evas.inc: add directfb back to DEPENDS, it turned out to be a problem in libpng
    evas.inc: don't depend on directfb
    irssi: def pref -1 for svn
    pidgin: update to 2.0.2 
    evas: inherit lib_package
    evas-x11: also stage x11-16 header 
    evas-x11: enable x11-16 engine
    uclibc 0.9.29: add generic config for arm (where 'generic', read 'armv4t')
    angstrom: fix OABI package archs
    zaurus 2.4 kernels: add COMPATIBLE_HOST = "arm.*-linux"
    xorg-lib: move ruutf8 patch to libx11
    spandsp: update to 0.0.4pre3 
    gpsd: disable python stuff:
    libpcap: add misssing file
    libtheora: add 1.0 alpha7
    gcc-cross-sdk: re-introduce SRC_URI hack which seems to be needed on at least my (32bit) debian system
    meta-toolchain: inherot rootfs_ipk for the index methods 
    task-sdk: fix depends
    gpe-login 0.90: rdepend on a theme
    libgnomeui: update to 2.18.1
    libgnome: update to 2.18
    flumotion: add more python depends, flumotion-admin and flumtion-worker work now
    distutils-base: package even more debug files
    flumotion: more depends, enough to get the config gui on the screen 
    flumotion: even more python depends
    zope: install python files in /usr/lib/python2.4 instead of /usr/lib/python
    flumition: add more rdepends
    flumotion: hack packaging
    python-gst: add missing dependency on gst-plugins-base
    flumotion: add 0.4.1 from poky
    2.6.20: update at91 defconfig
    libmatchbox 1.9: apply BGR fixes from poky
    angstrom: lock at91sam9263ek to 2.6.20 for now
    linux 2.6.20: raise the default pref for at91
    a780-kernel, e680-kernel: remove needless indirection
    LAB-kernel: set compatible machine to h2200
    linux-h1940: set compatible machine
    gpe-session-scripts: turn on cursor hiding based on the touchscreen machine feature 
    contrib/mtn2cl: print a list of new bugs as well
    contrib/mtn2cl: use a temp dir so we catch all authors and don't litter $PWD
    e17: add expedite, an evas benchmark
    e.bbclass: fix typo
    gtk+: fix RRECOMMENDS
    matchbox-desktop-2: add matchbox-desktop-2 
    busybox: add 1.6.0
    xtscal: recommend a font
    angstrom: split up task-angstrom-x11 in to multiple recipes to stop bitbake 1.8 from building unneeded packages
    angstrom: add feedarch for at91sam9263ek
    linux 2.6.22rc1: fix version
    matchbox-panel-2: enable startupmonitor applet
    linux 2.6.2x: unify and add deploy for u-boot machines
    parted: add 1.8.7
    ipkg-utils: add patch from poky to include more fields in the ipkg metadata, most notably the OE: field

lenehan@openembedded.org:
    iproute2 2.6.20: Add the 2.6.20 bb file. It seems when I added 2.6.20 I
    iproute2: Use update-alternatives. Note that this moves the ip command from
    perl 5.8.8: Don't set LD_LIBRARY_PATH when running miniperl. This was being
    perl 5.8.8: Directly patch the files that need patching instead of having a
    perl 5.8.8: Fix the regexp for removing /usr/local paths - it was eating the

mickeyl@openembedded.org:
    fic-gta0x configurations: update and add note
    initscripts: add seperate inittab for FIC GTA01 (ttySAC multiplexing...)
    add sidplay-base, a spartanic console sidplayer based on libsidplay 1.x (from OpenMoko)
    s3c2410-utils: remove fixed date versions, keep svn versions
    openocd[-native] update recipe, add link-static patch, put into deploy directory (from openmoko)
    add libid3, (yet) another library for reading out id3 tags
    libftdi: update doxygen configure patch
    python 2.4.4 fix debug package name to python-core-dbg
    libftdi[-native] 0.8 update to 0.9 (from OpenMoko)
    add python-fam, bindings for the file alteration monitor. closes #2466
    python 2.4.4 ship manpage. (finally) closes #2282
    add python-simplejson. closes #2460
    add python-setuptools. closes #2459
    python 2.4.4 properly ship debug information in appropriate packages
    add rage, the Enlightenment Media Center
    python-2.4.4: update manifest, update manifest generator, close #2487
    python-pygtk: explictly specify gtk version we depend on
    elitaire is back in EFL directory
    move older efl stuff to nonworking
    esound: remove unused directory
    e17 applications: catch up with EFL overhaul
    sane-srcdates.inc: add new entries for EFL and E17 packages
    massive E revamp. all shiny and new. no more binconfig madness, no longer
    classes: update efl1 and e for E revamp
    directfb update:
    esound 0.2.36 clean up, add no-docs patch
    mpg123+mpg321: rreplace and rconflict (with) each other
    direcfb 1.0.0 add patch to fix include files for depending programs
    add mpg123, a console based mpg audio player
    add synaesthesia, a psychedelic audio player (from openmoko)
    etk 0.1.0.003 packaging and staging bugfixes
    mkfontdir-*: beautify and add dependencies to mkfontscale
    gpsd: ship python-pygps package, including python bindings to gpsd
    add fbgrab-viewer-native
    bump etk_20060418 to etk_0.1.0.003
    expedite_cvs.bb: add metadata
    libxosd: refresh use-sane-default-font patch
    oe/libxosd: add patch making libxosd using 'fixed' as default font --
    add gtkterm, a lightweight gtk-based terminal emulator
    vte 0.11.15 increase packaging granularity
    add libxosd, a library for a TV-like on-screen display w/ X11
    distutils-base.bbclass:
    python-dbus: upgrade from 0.71 to 0.8.1

pH5@openembedded.org:
    mplayer: enable pxa27x overlay support for magician and universal
    linux-handhelds-2.6: add 2.6.21-hh8
    libxosd: QA issue: package libxosd-dbg before libxosd-examples,
    python-pygtk-2.10.3: package -dev first, fix -dbg packaging
    python-pygobject-2.12.2: package -dev first
    linux-handhelds: disable HWTIMER in magician defconfig
    gnome-cups-manager: package icons, too
    magician: add a few modules in case they are not compiled in
    magician: use 2.6.21-hh8
    openmoko-libs: add libxosd dependency

pfalcon@openembedded.org:
    angstrom-2007.1.conf: Update linux-handhelds-2.6 to 2.6.21-hh9.
    linux-handhelds-2.6: Add 2.6.21-hh9. 
    htcuniversal.conf: Update for transition to ts-adc-debounce driver.
    linux-handhelds-2.6: Update defconfigs:
    linux-hackndev-2.6 svn: SVN trunk is now 2.6.21-hnd1.
    linux-handhelds-2.6 2.6.21: Enable mtdram module, useful for mounting jffs2 images.
    angstrom-2007.1.conf: Set linux-handhelds-2.6 version for all related machines to 2.6.21-hh8
    linux-handhelds-2.6: Update defconfigs for 2.6.21-hh8 (defconfigman r291).
    gpe-shield 0.9: Down with cryptic error messages.
    udev: Cut down default /dev tmpfs size from 10Mb to 2Mb, to preclude DoS.
    udev: Cut down default /dev tmpfs size from 10Mb to 2Mb, to preclude DoS.
    initscripts 1.0: ramdisk: Don't bother to screw up randomly found mtdram partition.
    gpe-todo svn: SCM unpinned packages are always DEFAULT_PREFERENCE = "-1".
    xkbd-layout-ru 0.1.1: Nice Russian layout for xkbd.
    angstrom-2007.1.conf: Set kernel version for PocketPC's:
    libgpevtype 0.50: Add dependency on libtododb.
    busybox-static 1.2.1: Re-aad override dir prioperly with files.
    libmimedir: Fix packaging.

polyonymous@openembedded.org:
    packages/xorg-lib/: move ruutf8.patch and close bug #2541
    libx11: added patch to alias locale ru_RU.utf8, closing #2526
    packages/simh: added a The Computer History Simulation Project package.
    flumotion: add python-misc rdepend for ihooks and close bug #2509
    konqueror-embedded 20070212: adjust dont-use-kde-config.patch to not use kde-config ;-)
    conf/checksums.ini: checksums for intltool-0.35.5
    intltool: and while we're at it, here goes 0.35.5 with defpref of -1
    intltool: cut the versioning in SRC_URI and close #2494
    pidgin: make ssl-* plugins depend on ssl plugin and close bug #2480.
    konqueror-embedded: don't use kde-config while configuring.

rpurdie@openembedded.org:
    glibc-intermediate: Unset PACKAGES_DYNAMIC (from Poky)
    meta-sdk: Update to use new sdk PACKAGE_ARCH (from Poky)
    task-sdk-base: Fix libgcc name
    gcc-cross-sdk 4.1.2: Cleanup (from poky)
    gcc-cross-initial_3.3.3: Set empty PACKAGES (from poky)
    gcc-package-cross: Remove bogus PACKAGES_DYNAMIC
    sdk.bbclass: Remove unneeded PACKAGES, use DISTRO in SDK_NAME, set PACKAGE_ARCH to something which doesn't conflict with normal packages (from Poky)

sirfred@openembedded.org:
    tremor 20041119 : Correct staging QA issues
    gstreamer 0.10: Deleted obsoleted packages
    gstreamer 0.10 : Fixed QA staging issues
    gpe-snes: Added new package 0.2
    xserver-kdrive-imageon : New version 1.2.0
    xserver-kdrive-imageon X11R7.1-1.1.0 : Fixes a bug in randr coordinates 
    xserver-kdrive-imageon X11R7.1-1.1.0 : XV Port changes, cleanups

slapinid@gmail.com:
    gpe-announce 0.13: Fix for libsoundgen 0.5.



Bugs fixed:
bug_id resolution	 short_desc
2539 FIXED	 Wrong place for patch
2378 FIXED	 Bitbake 1.8 does not fetch machine specific uClibc.conf
571 FIXED	 build of konqueror-embedded fails due to bad directory name
776 FIXED	 libqpe-opie fails to compile with EABI support
867 WONTFIX	 [patch] build minimal pmount/pumount from updatd pmount 0.9.9
922 WORKSFORME	 konqueror-embedded doesn't compile if unsermake is installed
1081 LATER	 sdl-image-1.0 build failed [angstrom-2006.9;tosa]
1107 FIXED	 gcc-cross-kernel fails to compile
1153 WONTFIX	 Jornada7xx - toolchain failed -  cannot compute suffix of object files
1178 FIXED	 librsvg-2.11.1-r0 mozilla plugin depends on host include
1363 FIXED	 konqueror-embedded_20030705 fails in configure stage (no qte library found)
1480 FIXED	 Help to make a gnash recipe
1581 FIXED	 distutils-base.bbclass include .debug files in main package
1735 FIXED	 package wrt-imagetools-native-1.0 missing sources (openwrt has changed from cvs to svn)
1914 FIXED	 qt4-x11-free upgrade
1981 INVALID	 gtk-doc-native fails sanity test
2145 FIXED	 do_install fails for libopensync
2157 FIXED	 qemu fails to compile with gcc 4.x
2282 FIXED	 python_2.4.4 packaging QA issue
2323 FIXED	 angstrom collie: suspend support
2324 WORKSFORME	 gtk-webcore/osb-jscore_svn.bb build error
2438 FIXED	 angstrom 20070604 ipkg update fails on gstreamer feed
2459 FIXED	 Bitbake build for python-setuptools
2460 FIXED	 Bitbake build for python-simplejson
2466 FIXED	 Bitbake build for python-fam
2475 FIXED	 gpe-announce build failure
2480 FIXED	 gaim-protocol-msn lacking SSL
2485 FIXED	 angstrom-x11-image doesn't build due to libgpevtype package
2486 FIXED	 udev-0.92 build error
2487 FIXED	 Problems with python-2.4.4 manifest
2492 DUPLICATE	 cups-1.2.10-r0
2494 FIXED	 intltool build fails due to PV naming difference
2496 DUPLICATE	 pidgin missing gstreamer >= 0.10.12
2499 FIXED	 Mplayers pxa driver fails to work on Spitz
2502 FIXED	 Angstrom: please make no cursor as default in gpe
2509 FIXED	 flumotion is missing ihooks module
2518 FIXED	 update packages/classpath/classpath-minimal-native_0.93.bb
2519 FIXED	 update packages/classpath/classpath-gtk_cvs.bb
2521 FIXED	 update packages/classpath/classpath-gtk_0.93.bb
2527 FIXED	 Ucslugc does not compile and must be fixed to compile with uclibc0.9.29
2530 FIXED	 libpcap_0.9.6 missing shared.patch
2534 FIXED	 Hackndev project move to 2.6.21
2541 FIXED	 diet-x11 build fails
1785 WONTFIX	 ERROR: QA Issue: non dev package contains .so: qte-mt
2218 FIXED	 Please update freetype2 version
748 INVALID	 Suspend broken on Simpad


Bugs opened:
bug_id resolution	 short_desc
2501 	 svn fetcher does not support https/authentication
2514 	 bitbake seems to forgot to build some dependencies at times
2488 	 Bitbake build for lcdproc
2489 	 Add init script for fam
2490 	 Add files to .debug package for modutils
2491 	 gpesyncd build failure (blocks angstrom-x11-image)
2493 	 Subversion reports error when writing to repository (slugosbe)
2497 	 meta-bug: Wifi
2498 	 can't run horizon due to faulty ~ path
2500 	 Can't build xserver-kdrive_git.bb
2503 	 angstrom collie: no mmc modules autoloading
2504 	 angstrom collie: altboot misses altboot-2.6.cfg file
2505 	 netbase has files that are already provided by iana-etc
2506 	 dropbear and ipv6: broken connection termination
2507 	 building for angstrom-2007.1 tries to build glibc 2.3.2
2508 	 Minor discrepancy between keymap on Angstrom Spitz and original Sharp Distro
2510 	 tetex fails do_compile
2511 	 uicmoc4-native fails do_compile after recent update to version 4.3.0
2512 	 base-files has simpad-specific files
2513 	 angstrom collie: can not start GPE
2515 	 RFE: kernel 2.6 on collie: ext3 support
2516 	 Collie 2.6: bulk writing to SD gets stuck
2517 	 update packages/classpath/classpath.inc
2520 	 angstrom collie: console blank is not reversible
2522 	 classpath could be upgraded to 0.95
2523 	 OE needs a native java package
2524 	 rrdtool fails to build with newer compilers
2528 	 CROSS COMPILE Badness: gtkhtml-3.6 fails do_compile
2529 	 Angstrom insists on using en-gb locale
2532 	 Create .bb file for libsigc++ 2.0.17 package
2535 	 PalmLD defconfig for 2.6.21
2536 	 update packages/cacao/cacao-fpu.inc
2537 	 update packages/cacao/cacao-native_svn.bb
2538 	 update packages/cacao/cacao_svn.bb
2540 	 Asterisk 1.4.x recipe
2542 	 Allow glibc to build with i686
2543 	 no icq in pidgin
2495 	 akita backlight off after suspend.

In total 38 bugs have been created and 46 bugs were closed.
Generated on 20072630

Laibsch@openembedded.org:
    esmart: fix packaging.  Closes 2573.

Stanislav:
    linux-rp-2.6.20: update sharpsl-rc patch to fix IRQ issues (bug 2555)

Stepan:
    palmld.conf: Elaborate and update per current state.

cbrake@openembedded.org:
    uclibc: fix string comparison ops in do_configure script.
    linux-jlime-current.bb: fix SRC uri (remove ';') so it parses with bb 1.8
    mono: add mono_cv_uscore to arm-linux site file

coredump2@openembedded.org:
    xfdesktop: Fix .debug QA error
    xfce4-panel; Fix .debug QA error
    alsa: Fix asound.state for c7x0 as suggested in oebug 2569, courtesy of Francesco Marchetti-Stasi
    altboot: Add SVNR66, fixing mounts of partitions w/o UUID in 05-boot-HDD. Thanks goes to summatusmentis for nailing down this error
    fbreader: Enable large icons for SL-Cxx00 devices & add first version of zaurus-VGA.patch, fixing font sizes
    Remove hentges meta-data as syncing svn with mtn is too much work (and the overlay works perfectly anyway)

gfellerpatrik@gmx.net:
    sanity: also check for bison, closes #2580

hrw@openembedded.org:
    pimlico: tasks updated to 0.9, dropped old versions
    task-base: use prism-firmware instead of older ways of support for Prism2/3 cards (based on Poky work)
    prism3-support: dropped in favour of prism-firmware
    prism3-firmware: dropped in favour of prism-firmware
    prism-firmware: added support of loading 1.8.4 firmware for Prism2/3 CF cards on insert (from Poky)
    pcmciautils: added patch (from git) to not use MODALIAS in rules as it is deprecated since udev 080 (sync with Poky)

justinp@openembedded.org:
    revert inadvertent defconfig commit
    linux-rp-2.6.21: add sharpsl-rc patch

koen@openembedded.org:
    angstrom: readd big mount due to udev init scripts 
    tetex: adjust packaging a bit
    proj: fix packaging
    angstrom: prefer cairo 1.4.10 for the double free fix, remove the big mount since the initscripts got fixed
    cairo: bump git to 1.5.1, add 1.4.10 and remove some stale versions
    geos: also inherit binconfig
    geos: add 3.0.0rc4
    gdal: add staging
    librsvg: fix postinst, remove stale versions. Closes #1926
    bluez-utils 3.12: package hid2hci
    qemuarm: fix PACKAGE_EXTRA_ARCHS
    iptables: update to 1.3.8
    angstrom-gateway-image: add image with samba/swat/dnsmasq/iptables/ssh 
    angstrom-minimal-image: don't install translations (from poky)
    tasks: update to 0.8
    dates: update to 0.4.3
    lyx 1.50rc1: RDEPEND on python-shell
    psplash: add compass logo for angstrom 
    bluez 3.12: enable hid2hci
    bluez-hcidump: add 1.37, that actually builds against a recent bluez-libs
    bluez-gnome: add 0.9
    bluez: add 3.12
    osb-nrcore: package icons as well
    midori: add version 0.0.2 of yet another gtk-webcore based web browser
    librsvg 2.16.1: fix packaging
    gpsbabel: add usb support and update to 1.3.3
    libpcap: fix shared.patch and add a comment about it inside the recipe
    linux-ezx: readd accidentally delete bootlogo
    esound: bump PE

kristoffer@openembedded.org:
    packages/linux/linux-jlime-current.bb : Addition of development kernel build
    packages/keymaps/files/jornada6xx/keymap-uk.map: Minor changes to uk keymap

mwester@openembedded.org:
    madwifi-ng: update to newer upstream release to support 2.6.21 kernel.

pH5@openembedded.org:
    sphyrna: package python scripts
    avahi: add 0.6.20
    libdaemon: add 0.11

pfalcon@openembedded.org:
    udev 092, 097, 100: Stop booting semi-configured system in case of random miniscule errors.
    udev: Stop booting semi-configured system in case of random miniscule errors.
    linux-hackndev-2.6 svn: SVN trunk is now 2.6.21-hnd2.
    htcwallaby.conf: Bare config for HTC Walalby (very first XDA) machine.
    rootfs_ipk.bbclass: Do not hardcode ipkg RDEPENDency.
    initscripts 1.0: mountall.sh: Don't swallow crucial errors.
    opie-image-16mb: Make it actually fit 16mb.
    initscripts 1.0: mountall.sh: Drop dependency on util-linux-mount.
    task-opie-16mb, opie-image-16mb: Add task and image recipes for small OPIE image.
    task-opie: Continue split up for bitbake 1.8 friendliness.
    task-opie: Formatting fix.
    task-opie: Start to split up subtasks to separate recipes.

polyonymous@openembedded.org:
    sysvinit: fix build for those passing DISTRO via environment

ronan@aimao.org:
    agg: add antigrain 2.5, closes #1464

rpurdie@openembedded.org:
    linux-rp-2.6.21: Add missing files (from poky)
    linux-rp-2.6.21: Add (from poky)
    linux-rp-2.6.20: Update defconfigs (from poky)
    linux-rp.inc: Use ?= instead of extra variables as overrides
    linux-rp-2.6.17: Tweak qemuarm/qemux86 defconfigs (use wacom tablet), make linux-rp.inc sh complient, fix whitespace (from poky)

rwhitby@nslu2-linux.org:
    apex: Updated defconfig for 1.5.8
    task-slugos: Added madwifi drivers and tools
    apex: updated to 1.5.8
    ixp4xx-kernel: Added 2.6.22 defconfig, untested, and not selected by default
    ixp4xx-kernel: Updated to 2.6.21.5 for stable version
    slugos-init: Another spot to support rootfs mtd partition naming.
    slugos-init: Updated turnup, sysconf and reflash scripts to handle the root partition being named 'rootfs' instead of the vendor firmware naming.
    ixp4xx-kernel: Updated 2.6.21.1 to include dsmg600 auto-power-on hack support

xora@openembedded.org:
    aircrack-ng_1.0-svn.bb : renamed to differentiate from aircrack-ng HEAD also
    aircrack-ng_0.7.bb : dropped in place of the later alternatives
    aircrack_svn.bb : forgotten patch
    aircrack-ng_0.9.1.bb : version bump + fixups of .bb file
    aircrack-ng_svn.bb : add svn of aircrack that will become 1.0
    mplayer_0.0+1.0rc1.bb : akita and palm can use pxa enhancements
    prism-firmware.bb : remove if around secondary firmware download as we always
    minimo_cvs.bb : keymap fix for #2326, ssr patch from familiar, and moved
    xserver-common_1.16.bb : move Mode_switch to mod5 as per #2326 this combined



Bugs fixed:
bug_id resolution	 short_desc
2533 FIXED	 PalmLD new machine config
1464 FIXED	 New recipe - AGG 2.5  [ antigrain geometry ]
1674 INVALID	 Missing .la file for bz2 library
1926 FIXED	 Problem to render SVG files with gtk+/gtkmm
2071 DUPLICATE	 gpsd build failure
2484 FIXED	 rootfs_ipk: Do not hardcode dependency on ipkg
2507 WORKSFORME	 building for angstrom-2007.1 tries to build glibc 2.3.2
2534 FIXED	 Hackndev project move to 2.6.21
2551 FIXED	 diet-x11 build failure due to filespath missing patch
2556 DUPLICATE	 PalmLD: new machine file (based on hx4700 which should be correct)
2558 FIXED	 fluxbox does not start in angstrom
2559 WORKSFORME	 PATH doesn't contain /sbin and /usr/sbin for root
2569 FIXED	 Sound disabled in default installation
2573 FIXED	 Fix for esmart QA errors
2576 FIXED	 Add iwmmxt support to mplayer for palmld
2577 FIXED	 Added iwmmxt support to mplayer for akita
2578 INVALID	 compilation problem in .bb file.


Bugs opened:
bug_id resolution	 short_desc
2560 	 fetcher allows to run more conflicting parallel fetches
2552 	 Zaurus C3000 drains battery on stand-by
2553 	 fix native coreutils build failure
2554 	 broken cross build environment / fix ncurses build
2557 	 PalmLD: new kernel defconfig
2561 	 qemu links with zlib
2562 	 X server crash on poodle
2563 	 GPE pointer does not accurately track stylus on Zaurus SL-6000
2564 	 bitbake opie-image fails to build
2565 	 segmentation fault on hx4700_acx load
2566 	 Build of ecore-native 0.9.9.038 fails with missing Evas_Engine_Software_X11.h
2567 	 Patch to generate atk version 1.19.3
2568 	 Angstrom logo looks bad on 320x320 screen (psplash)
2570 	 invalid platform packages in repository for gpe-login-locale-cs
2571 	 scripts under /etc/zaurus/hinge-$orientation.d/ run twice
2572 	 meta-opie is broken since task-opie-16mb.bb
2574 	 all dpkg scripts are poiting erroneously to perl native in workdir instead of /usr/bin/perl
2575 	 final perl package has a lot of files poiting erroneously to workdir insted of real bindir
2579 	 alignment faults in uclibc + EABI
2580 	 bison added to sanity.bbclass

In total 20 bugs have been created and 17 bugs were closed.

--------------080605030808000207090607--
