Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1ILgLJ-00087C-TT
	for openembedded-devel@openembedded.org; Thu, 16 Aug 2007 16:28:59 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7GESK1R010190 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2007 16:28:20 +0200
Message-ID: <46C45F0B.9060003@dominion.kabel.utwente.nl>
Date: Thu, 16 Aug 2007 16:28:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog
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
X-List-Received-Date: Thu, 16 Aug 2007 14:28:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stefan:
    add openmoko-today2-folders, make openmoko-today2 depend on those

cbrake@openembedded.org:
    compulab-pxa270: add correct recipe file for v2.6.22
    conf/local.conf.sample: update comments with all the image formats
    compulab-pxa270: drop 2.6.20 kernel now that we have 2.6.22
    compulab-pxa270.conf: make default kernel 2.6.22

crofton@openembedded.org:
    omap2430sdp : Add support for the omap2430sdp board.
    linux-omap2 : Add kernel support for the omap2430sdp board.
    u-boot-omap2430sdp : Add u-boot support for omap2430sdp. Delete when support movies
into upstream.
    linux-omap1 : Fix git source line.
    davinci-dvevm.conf : Add machine file for the TI Davinci EVM board.
    linux-davinci : Add support for build TI Davinci processor kernels. Currently
    linux-omap1 : Move compatible machine from generic include file to specific
    linux-omap1_2.6.22 : A support for linux-omap1 version 2.6.22
    linux-omap : Convert bb file to use linux-omap from linux-omap1.
    linux-omap : Move linux-omap1 to linux-omap. linux-omap should work for

florian@openembedded.org:
    sms: add 1.1
    gloox: Add 0.8.9
    bluez-utils: Fix breakage of bluetooth on htcuniversal by re-adding essential patch.
    task-gpe-base: Add libgpewidget-bin
    htcuniversal.conf: more specific modules
    task-gpe-pim: fix RDEPENDS
    fbreader: Use Zaurus patches for htcuniversal too, update patch to fix link problem.
    ffmpeg: Update svn recipe to stage some missing headers.
    vlc-gpe: Fix linking issues
    preferred-gpe-versions-2.8: Prefer minimix 0.9 over broken 0.8
    minimix: add 0.9
    sqlite3: Add 3.4.1
    libsettings: Add 0.3
    tinymail: License is LGPL, not GPL
    preferred-gpe-versions-2.8.inc: Use latest libmimedir release.

hrw@openembedded.org:
    disapproval of revision '87f4964e99b725f1fc7dfcdb6feb62a3b3b0cd12'

ifaistos@openembedded.org:
    packages/asterisk/asterisk_1.4.10.bb : Varius fixes to get asterisk 1.4.x to build on all

koen@openembedded.org:
    adzs-bf538f-ezlite: rename from adsp-bf538-ezkit
    adsp-bf538-ezkit: add machine file
    pkgconfig: make 0.22 the default
    xpext, xsp: xextensions -> libxext
    bluez-gnome: recommend gnome-icon-theme
    angstrom: more armv6 machines
    angstrom-2008: fix thinko
    angstrom: armv6 tweaks
    0xffff: create dirs before trying to put files in them
    nokia77-init: sync with poky
    linux-nokia800: fix patches
    linux-nokia800: define RPSRC
    linux-nokia: remove 770, update 800 from poky, all nokia internet tables use
linux-nokia800_2.6.18-osso40 now
    nokia770: use linux-nokia800
    compulab-pxa270: base on linux.inc to get a fixed configure and deploy
    linux-davinci: fix PV so packages can be upgraded at runtime
    davince-dvevm: set UBOOTMACHINE
    linux-davince: catch up with machine rename
    davinci-evm: rename it so overrides work properly
    patchutils: update to 0.2.31
    ohm: fix depends and packaging
    bluez: update to 3.14
    ohm: add from poky
    gsmd: remove SRCREV
    seppuku: remove extra '?' that confuses bugzilla
    linux-jlime-current: set bogus COMPATIBLE machine so the maintainer adds a proper one
    preferred xorg versions: fix xserver version
    gtk+: work around rrecommends bug
    seppuku: misc fixes
    seppuku: quick fix for Noprovider not having isRuntime anymore (use Norprovider for that)
    binutils-cross: fix typo
    binutils cross 2.17.x: make use of binutils-cross.inc
    gcc: add initial cross 4.2.1
    uclibc: add blackfin configs
    site/arm-common: add unaligned access for gstreamer
    angstrom: add FEED_ARCH for blackfin
    linux-linux-headers: add 2.6.22
    uclibc svn: fixes
    midori, openmoko-feedreader2: catch up with webkit rename
    webkit: rename to webkit-gtk
    angstrom 2007.1: add more feedarchs
    triton: fix package-extra-archs
    rb500: remove PACKAGE_ARCHS
    mtx3: fix package-extra-archs
    logicpd-pxa270: fix package-extra-archs
    lite5200: remove bogus target-prefix
    h1940: arm920t can't do armv5
    gumstix: add PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te "
    amsdelta: update to recent OE standards
    netbase: bump PR
    gpe-login: fix RPROVIDES and SRC_URI_OVERRIDES_PACKAGE_ARCH "
    insane: complete blackfin support
    asterisk: make 1.4.10 build on arm and fix packaging
    midori: add 0.0.4 (now based on webkit instead of gtk-webcore)
    libgsmd: SRC_URI_OVERRIDES_PACKAGE_ARCH
    netbase: SRC_URI_OVERRIDES_PACKAGE_ARCH
    base-files: add SRC_URI_OVERRIDES_PACKAGE_ARCH = "1" to fix packaging
    basefiles: add /dev/shm in fstabs
    bluez-gnome: add 0.13
    xserver-kdrive-common: fix typo that prevented the files ending up in the packages
    openmoko-terminal2: add rconflicts and rreplaces
    abiword-plugins-2.5.1: fixes
    angstrom-x11-base-depends: bump PR
    xserver-kdrive-common: bump PR to get some bogus local changes out of the angstrom feeds
    abiword-plugins: add 2.5.1
    poppler: fix 0.5.9 with backports from cvs and make packaging more granular
    evince 0.9.2: enable djvu
    djvulibre: fix configure a bit and stage files
    djvulibre: add 3.5.19
    fluxbox: fix typo
    fluxbox: style fixes, unbreak versioning, unbreak packaging, etc, etc
    neod: inherit gconf
    task-boot: add DEPENDS = "virtual/kernel"

lenehan@openembedded.org:
    ethtool 6: Add version 6, the latest release of ethtool.
    sudo 1.6.8p12: Fix build to work with the newer autotools versions.
    libnet 1.1.2.1: Fix build errors that appeared when building with the

likewise@openembedded.org:
    perl-5.8.8: Have make override any environment TOPDIR variable.

mickeyl@openembedded.org:
    task-python-everything: update
    moin: update to 1.5.8
    python-webpy: update to 0.21
    python-urwid: update to 0.9.8.1
    python-tlslite: update to 0.3.8
    python-sqlobject: update to 0.9.1
    python-pysqlite: remove. this is now included in the python distribution
    python-gst: update to 0.10.8
    python-pyiw: update to 0.3.3
    move python-m2crypto to nonworking, it needs to catch up w/ swig
    python-imdbpy: fix debug packaging and SRC_URI
    python-imdbpy: update to 3.1
    move python-egenix-mx-base to nonworking, source is no longer available
    python-imaging: update to 1.1.6
    python-formencode: update to 0.4+svn
    sword: inherit lib_package
    swig[-native]: remove 1.3.29
    python-spyro: update to 0.9.22
    python-spydi: update to 0.9.7
    python-sip: update to 4.7
    python-pyqt: promote qt4 to being the default, rename other packages accordingly
    python-scons[-native]: udpate to 0.97
    python-scapy: update to 1.1.1
    remove pyserial 2.0
    python-pyvisa: update to 1.1
    python-pytest: update to 0.6.0
    python-pyweather: update to 0.7.0
    python-pyro: update to 3.7
    python-pyreverse: update to 0.5.2
    python-pygtk[2]: change naming, python-pygtk is now 2.x, update to 2.10.4
    python-pylint: update to 0.13.2
    python-pylinda: add HOMEPAGE
    python-pygame: remove 1.6
    python-pyflakes: update to 0.2.1
    python-pygoogle: add HOMEPAGE
    python-soappy: update to 0.11.6
    python-pyraf: update to 1.4
    python-numarray: fix packaging debug files
    python-pyfits: update to 1.1
    python-pycairo: update to 1.4.0
    python-pyephem: update to 3.7.2a
    python-pycodes: update to 1.2
    python-pychecker: update to 0.8.17
    python-mad: update to 0.6
    python-lxml: update to 1.3.3
    python-libgmail: remove 0.0.7, update to 0.1.6
    python-logilab: change package name, update to 0.9.3
    python-itools: update to 0.16.5
    python-irclib: update to 0.4.6
    python-inotify: update to 0.1.0
    python[-native] 2.5.1: fix typo in optimization patch
    python-gnosis: update to 1.2.2
    python-gammu: set BROKEN
    gammu 1.10.0: inherit pkgconfig
    avahi: add TODO
    python-pycurl: update to 7.16.4 to match curl
    curl[-native]: update to 7.16.4
    linux-gta01: add logo
    curl: remove versions that no longer build w/ current autotools
    python[-native] 2.5.1: add patch to compile everything in optimized bytecode.
    generate-manifest-2.5.py: add sqlite3 package that's now in the python mainstram
distribution
    major python upgrade: add python[-native] 2.5.1, rename python-2.4 package
    python packages: unify PR
    python-crypto: change package name, update to 2.0.1
    python-constraint: update to 1.1
    distutils-base.bbclass: fix typo in debug package
    python-pybluez: update to 0.10
    distutils-base.bbclass: prefer most recent python version for packaging
    contrib/python: add generate-manifest script for Python 2.5, rename the one for 2.4
    initscripts/bootmisc.sh: fix upsidedown logic w/ hwclock.sh
    linux-gta01: disable kernel logo completely (for now)
    openmoko-image: create /etc/timestamp during image construction to give a reasonably
sane default time setting
    initscripts: first steps towards working together with RTC
    pulseaudio: fix wrong home path for user pulse, use OE_LT_RPATH_ALLOW since pulse
doesn't find its plugins without
    base-files mount /dev/shm as tmpfs, hence enabling posix shared memory
    openmoko-session2: fix typo
    musicpd: update to 0.12.1
    pulseaudio: set postinst to correct package
    xserver-kdrive-common: enable overriding individual files
    disapproval of revision '14b0e60c903b363f1a9e66d94b672fa4698fa706'
    Xserver: remove -br from the common options and add it for most devices
    openmoko2: we no longer use hsetroot but use the all shiny new -root-ppm command line
option for kdrive (thanks to
    openmoko-session2: add more rdepends
    add hsetroot, yet another X wallpaper utility
    add xsetroot utility
    add xbitmaps
    openmoko-session2: start neod, but set PowerManagement = NONE as default
    openmoko2: remove home applet, neod will do this when you press AUX
    neod: add gconf dependency

mwester@openembedded.org:
    openssh 4.6p1: /var/run is volatile; removed this from the packages to avoid
    Bump PR
    zleds: announce via beeper when rc3.d scripts are completed (ssh login is ready).
    fakeroot: upgrade to 1.7.1 version, fixes odd caching anomolies on some
    ncurses: fix oebug 2554 - added STAGING_LIBDIR_NATIVE, and set

pH5@openembedded.org:
    avahi: add 0.6.21
    package_{deb,ipk}.bbclass: change ALLOW_EMPTY check
    libgsmd: package gsmd plugins separately and have an empty
    btscanner: fix hardcoded paths in configuration file
    xserver-kdrive-common: add magician dpi to Xserver script
    xserver-kdrive-common: end of line whitespace cleanup of Xserver script

polyonymous@openembedded.org:
    libxrandr 1.2.1: added missing libxext dependency
    opie-bluetoothapplet cvs: removed obsolete patch. Upstream as of march.

raj.khem@gmail.com:
    binutils-cross.inc: enable installation of libbfd

rpurdie@openembedded.org:
    base.bbclass: Remove showdata task. its broken and bitbake -e should be used instead
(which works),
    sanity.bbclass: Sync with Poky for umask check
    sanity.bbclass: Remove git and bison, we build them if needed
    seppuku.bbclass: Avoid recursion problem (#2722)
    base.bbclass: Optimise the SRC_URI_OVERRIDES_PACKAGE_ARCH code so localpath is only
called if its possible there are machine override matches. Also document some code hiding
bugs for post 1.8.8 removal
    meta-maemo: Split into a tasks package and remove uneeded immediate expansions
    package.bbclass: Improve dependency chain handling function to differentiate when
multiple -dev or -dbg packages are generated and when a single one is generated (from poky)
    package.bbclass: Fix a typo and remove broken code (from poky)
    package.bbclass: Remove wildcards from the RDEPENDS field, unbreaking certain
dependency chainhandling in both ipkg and dpkg (from poky)
    package.bbclass: Only set the do_package dependency when we have packages to generate
(PACKAGES != ) removing needless dependencies (from poky)
    base.bbclass: Fix SRC_URI_OVERRIDES_PACKAGE_ARCH whilst trying not to cause too much
of a performance hit
    binutils-cvs: Make it build
    binutils-cvs: Update to work better with recent binutils cvs and use the common .inc file
    binutils.inc: CCACHE variable already includes the space (two spaces upsets binutils
configure (from poky)

rwhitby@nslu2-linux.org:
    slugos: Bumped version to 4.6, replaced dropbear with openssh, remove some
non-essential stuff from the boot rootfs
    openssh: Added 4.6p1, with default preference = -1 until it gets some testing.
    sysconf: Removed the erroneous conffiles line
    nslu2-image: Added support for building 16MB images
    slugimage: Updated to latest version that supports 16MB flash chips

woglinde2@openembedded.org:
    cacaoh-cldc-native: fixing dependency of virtual/cldc-api-1.1
    midpath: fixing provide virtual/cldc-api-1.1
    midapth: fix compile error
    midpath_svn: fix ecj and fast command
    fastjar-native: newer upstream-version of fastjar

xora@openembedded.org:
    gsm/libgsmd_svn.bb : remove patches that have been superceded upstream
    sylpheed/claws-mail.inc : remove the autoconf hacks.
    glibc-intermediate_2.3.2+cvs20040726.bb : PACKAGES_DYNAMIC = "" because



Bugs fixed:
bug_id resolution	 short_desc
1861 FIXED	 Rebuild all SRCDATE = now packages
1872 FIXED	 Substituting PR if SRCDATE = now
2560 FIXED	 fetcher allows to run more conflicting parallel fetches
2601 FIXED	 RRECOMMENDS overrides do not work
2671 FIXED	 Bitbake 1.8 tries to build glibc-intermediate-2.3.2+cvs20040726 for no
apparent reason.
2697 FIXED	 Bitbake doesn't seem to retry access after lock
2771 FIXED	 dependencies for multiple packages on command line not honored
2773 FIXED	 bitbake 1.8 svn: KeyError: type object 'C' has no attribute '_append__mutable__'
2747 FIXED	 failme-1.0-r0-do_configure
1626 FIXED	 do_showdata task show data of the packages that are not required
1991 WORKSFORME	 librsvg-2.16.0 build fails: QA Issue: non debug package contains .debug
directory
2077 FIXED	 linux-omap1 builds notbootable image
2113 WORKSFORME	 Abiword 2.5.1 installs with missing dependencies
2217 WORKSFORME	 gpe-contacts installs with missing dependencies
2507 DUPLICATE	 building for angstrom-2007.1 tries to build glibc 2.3.2
2554 FIXED	 broken cross build environment / fix ncurses build
2712 INVALID	 does fakeroot  work?
2719 FIXED	 lsof_4.78.bb compile fails with missing selinux/selinux.h
2722 FIXED	 Seppuku.bbclass triggers recursion error
2727 FIXED	 New parse error
2728 FIXED	 fluxbox package should depend on libstdc++6
2731 WONTFIX	 efl does not build
2733 INVALID	 libpcap-0.9.6-r1-do_configure
2734 INVALID	 libnet-1.0.2a-r1-do_configure
2735 FIXED	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xd369e4c>>
2736 DUPLICATE	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xcd8d28c>>
2737 INVALID	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xd3ced4c>>
2738 FIXED	 u-boot-1.2.0-r2-do_deploy
2739 FIXED	 linux-omap1-2.6.20-omap1-r0-do_deploy
2740 INVALID	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xca1c3ec>>
2741 INVALID	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xd13daec>>
2743 INVALID	 noprovider for <bound method NoProvider.getItem of <bb.event.NoProvider
instance at 0xcc9c20c>>
2744 FIXED	 synergy-1.3.1-r0-do_configure
2745 INVALID	 gtk+-2.10.14-r3-do_install
2748 INVALID	 librsvg fails to build
2749 FIXED	 patchutils-0.2.30-r0-do_configure
2750 WORKSFORME	 qt4-x11-free-4.3.0-r5-do_populate_staging
2751 FIXED	 patchutils-0.2.31-r0-do_configure
2757 FIXED	 linux-nokia770-2.6.16-osso26-r2-do_deploy
2758 FIXED	 linux-nokia770-2.6.16-osso26-r2-do_populate_staging
2761 FIXED	 glibc-2.5-r6-do_package
2763 DUPLICATE	 patch lzo_1x.patch not apply in mtd-utils-native_1.0.0+git.bb


Bugs opened:
bug_id resolution	 short_desc
2726 	 Boa doesn't start by default
2729 	 java package midpath wrongly assigned RPROVIDES
2730 	 updated recipes for new classpath versions
2732 	 Issues after Xorg cleanup
2742 	 test bug
2746 	 libgsmd_svn.bb uses SRCREV instead of SRCDATE
2752 	 e-image (images/e-image.bb) is broken
2753 	 dbus uses run-parts --reverse which busybox doesn't know about
2754 	 openmoko-devel-image-1.0-r0-do_rootfs
2755 	 Perl's Cross/Makefile re-uses TOPDIR from environment
2756 	 linux-2.6.21-r5-do_unpack
2759 	 angstrom-minimal-image-1.0-r3-do_rootfs
2760 	 linux-x86-2.6.20-r3-do_configure
2762 	 prism2-firmware 1.8.4 does not work on DCF-660W
2764 	 asterisk 1.4: asterisk-sounds recipe
2765 	 Upgrade to net-snmp 5.4.1
2766 	 No brightness adjustment in gpe-login
2767 	 spitz: Unable to adjust brightness with FN+3/4 keys within GPE
2768 	 Unable to switch virtual terminals at gpe-login or during gpe-session
2769 	 angstrom-console-image-1.0-r8-do_rootfs
2770 	 Wanted: Option to disable spitz keys which cause un-wanted power on
2772 	 recent change in fbreader breaks glibc build
2774 	 python-egenix-mx-base-2.0.6-r1-do_patch
2775 	 python-formencode-0.4-r0-do_fetch
2776 	 python-gammu-0.21-ml0-do_compile
2777 	 packages eflpp resp. edje fail to build
2778 	 python-m2crypto-0.13.1-r0-do_compile
2779 	 nmap does not work as root when built with gcc4
2780 	 mysql-4.1.18-r2-do_compile
2781 	 python-soappy-0.11.3-r0-do_compile
2782 	 python-pyode-1.0.0-r0-do_compile
2783 	 python-sip4-4.4.5-ml0-do_compile
2784 	 python-pyqt4-4.2-ml0-do_generate
2785 	 evas-0.9.9+cvs20070721-r0-do_configure
2786 	 directfb-1.0.0-r5-do_rm_work

In total 35 bugs have been created and 42 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGxF8LMkyGM64RGpERAvzCAKCusfNmTfypuddiC+oEfbDYqbcMxgCfarSq
O0EiEhwB9Dk0QX18r7kkw4s=
=QiJL
-----END PGP SIGNATURE-----


