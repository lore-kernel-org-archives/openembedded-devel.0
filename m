Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0cH3-0000BH-D9
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 13:25:45 +0100
Received: from Powerbook-2.local (vpn006063.vpn.utwente.nl [130.89.6.63])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB7CLoiq025814 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2007 13:21:50 +0100
Message-ID: <47593ADE.9030305@student.utwente.nl>
Date: Fri, 07 Dec 2007 13:21:50 +0100
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
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	lB7CLoiq025814
Subject: OE changelog 20071129 - 20071206
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
X-List-Received-Date: Fri, 07 Dec 2007 12:25:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeroen:
    contrib/angstrom/angstrom.svg: An Angstrom logo design, accepted as
the official.

Laibsch@openembedded.org:
    uicmoc4-native: Drop non-compiling 4.2.3 and 4.3.0 (closes bug 2511).

antti.andreimann@mail.ee:
    libx11-native : Add version 1.0.3.
    libungif : Update source URL per bug #3343.

cbrake@openembedded.org:
    base.bbclass: add buildall task from Poky

coredump2@openembedded.org:
    zaurus-updater: Try to unb0rk the flashing of Akita kernels. Still
needs work
    images: Drop unused essential*-image.bb
    zaurusd: - Do only try to rotate when necessary (no more Landscape
- -> Landscape / Portrait -> Portrait rotataions)
    zaurusd: Fix *DEPENDS until the 'bl' situation has been resolved
    subversion: Add version 1.4.5

crofton@openembedded.org:
    angstrom/build-release.sh : Remove graphics support from omap5912osk
until flashing large image problem solved.
    linux-omap1 : Add 2.6.23 kernel for OMAP machines. Tested on OSK.

dbaryshkov@gmail.com:
    linux-rp: add two patches for Tosa to fix usb networking - close #152=
7

hrw@openembedded.org:
    =C3=85ngstr=C3=B6m autobuilder: new RSS generator
    firefox: bit more formatting
    firefox: added forgotten patch
    dates: added libowl dependency - close #3417
    contacts: added libowl dependency - close #3377
    build-release.sh: rewritten =C3=85ngstr=C3=B6m autobuilder script
    task-base: arghh - task.bbclass fixes
    task-base: build only parts required by machine/distro combo used in
build (like in Poky)
    task-native-sdk: really drop libgcc-s-dev (part of gcc now)
    libxml-parser-perl: add expat dependency (from Poky)

jeremy_laine@openembedded.org:
    python2.5: fix RDEPENDS for python-codecs and python-netclient
    sofia-sip: split glib-specific parts to ${PN}-glib
    sofia-sip: restore call to autotools_stage_all, previous commit was
wrong
    sofia-sip: package version 1.12.7
    sofia-sip: add missing DEPENDS on glib-2.0 and openssl
    linux-2.6.23: fix LEDs driver for mpc8313e-rdb
    devmem2: add package description
    mpc8313e-rdb: add JFFS2 arguments for rootfs on NAND flash
    keymap-locales: provide French keyboard extension for qemux86
    keymaps: provide keymap for qemux86 machine
    linux-2.6.23: add generation of binary device tree for mpc8313e-rdb
and mpc8323e-rdb
    linux-2.6.23: fix mpc8313e-rdb realtime clock patch for use with
dtc-native 1.0.0
    dtc-native: package version 1.0.0 of the device tree compiler
    linux-2.6.23: enable mpc8313e-rdb realtime clock (ds1339)
    linux-2.6.23: add license for mpc8313e-rdb LEDs module, fixes module
loading

jluebbe@openembedded.org:
    wesnoth: add a package for the current svn version (thanks Johannes
Schauer)

khem@openembedded.org:
    Disable libssp libgomp and libmudflap in cross gcc 4.2.x
    Forward port PRO34130 patch for gcc 4.2 variants.

koen@openembedded.org:
    directfb: fix #2833
    angstrom: use ${ANGSTROM_FEED_CONFIGS} var for feed config, thanks
to Jeremy Laine for spotting this
    sanity.conf: bump bitbake to 1.8.9 for lockfile changes
    package_ipk.bbclass: merge with poky
    angstrom build-release.sh: fix month/minute confusion
    zaurus-updater: reinstate case-sensitive fixes that got lost in a mer=
ge
    task-base: bump PR for angstrom DISTRO_EXTRA_REDEPENDS change
    angstrom 2007: put feeds under package management
    angstrom/rss.php: fix links
    contrib: angstrom/rss.php: quick & dirty rss generator for
autobuilder uploads
    build-release.sh: timestamp success reports
    build-release.sh: remove console-image from ixp4xx builds
    linux-rp: add default_prefs to get poodle to use 2.6.17
    glibc-package.bbclass: merge LOCALE_UTF8_ONLY from poky
    angstrom.inc: only use utf8 locales
    build-release.sh: script that tells the angstrom autobuilder what to
build
    console-mipv6-image: add skeleton image for ipv6 mobility folks
    mipv6: add untested version 2.0.2, this is suppossed to work with
kernel 2.6
    gcc: replace non-functional block o'python with working overrides
    midori: add 0.12
    nslu2-minimal-image: alter basename to distinguish between regular
and nslu2 images
    angstrom-feed-configs: bump PR to get new feed configs, fix machine
location
    angstrom: add vars for feed config package
    xorg-driver-common: attempt to fix #3386

koen@openembedded.org,xora@openembedded.org:
    gcc3-build.inc: fix C&P error, close #3423

gcc3-build.inc : fix typo

likewise@openembedded.org:
    e2fsprogs-1.38: Always --disable-nls for linux-uclibc.
    e2fsprogs-1.38: Use --disable-nls if USE_NLS=3Dno. Fixes #3409.
    gdk-pixbuf-2.10.14: Trimmed down, replace plugins by built-in.
    gdk-pixbuf-2.10.14: New recipe for stand-alone libgdkpixbuf and
loader plugins.

mickeyl@openembedded.org:
    task-python-everything: bring back some tasks from nonworking
    rage: update to 0.2.0.005
    python-epsilon: adjust dependencies
    distutils.bbclass: install python library dir before installing (fix
typo)
    python-efl: adjust dependencies
    python-efl:
    add python-cython[-native], a C-binding generator. Probably the
successor to pyrex
    expedite: ship everything it needs in one package
    expedite: add dependency on eet
    expedite: add hack patch to disable all unused engines since
    evas|ewl cvs explicitly enable the software-x11-16 engine now that
it's more stable
    ecore|evas cvs update
    python 2.5.1 enable and package ctypes module/package. closes #3368
- -- thanks emdete!
    pulseaudio 0.9.8 needs patch for corner case when you build with
dbus but without HAL
    python-pygtk 2.10.4 python-tokenize is included in python-lang
    pulseaudio 0.9.8 needs dbus now
    task-python-sharprom: catch up with renamings and unavailable
packages. closes #3322
    python-pygtk 2.10.4 package demo seperately and fix demo dependencies
    python-pygtk 2.10.4: fix dependencies and packaging. closes #2905
    add python-sword 1.5.10, remove older versions that no longer build.
closes #2790
    add sword 1.5.10
    libsndfile 1.0.17 needs an ugly hardcoded hack for some autofoo
variables otherwise it silently fails on
    python-[sip|qt]: update to 4.7.1 / 4.3.1 and repair. closes #2468
    sip: upgrade to 4.7.1, catch up with sip3/sip4 renaming
    lyx 1.5.1: remove -1 default preference
    lyx (all versions): change order of inherit statements to catch up
with changes in qt build classes
    pulseaudio: add 0.9.8, remove 0.9.7
    task-toolchain-openmoko-sdk: ship openmoko-sample2-src

otavio@ossystems.com.br:
    firefox: fix firefox 2.0.0.3 building - close #3372
    openrdate: added 1.1.3 - close #3371

pfalcon@openembedded.org:
    angstrom-2007.1.conf: Upgrade linux-handhelds-2.6 to 2.6.21-hh19.
    linux-handhelds-2.6: Add 2.6.21-hh19.
    angstrom-gpe-task-base: Add explicitly xkbd and xkbd-layout-ru per RF=
C.
    xkbd-layout-ru 0.1.1: SRC_URI gone offline, so put small file
directly into OE.
    angstrom-gpe-task-settings: Add mboxkbd-layouts-gui, per RFC.
    initramfs-bootmenu-image: Image to enjoy initramfs-module-bootmenu
functionality.
    dropbear-early: Package which allows to start dropbear ASAP after
the kernel boot.
    xkbd 0.8.15: Differentiate desktop name.
    psplash: Remove stale files in angstrom override dir.
    psplash svn: Add patch to do proper logo display height calc.
    psplash: Update header for Angstrom logo.
    psplash: Add stopgap trap against symptomless hangs with psplash on
the screen.
    contrib/angstrom/angstrom.png: Add rendered version of Angstrom logo.
    angstrom.svg: Update default export dpi.
    angstrom.svg: Use psplash's default background.
    ipkg: Stop hacking in /etc/rcS.d, use update-rc.d.bbclass.
    update-rc.d: Be less verbose by default.
    mboxkbd-layouts-gui: Use git snaphot tarball as repo is offline
currently.
    mboxkbd-layouts-gui: Sane-itize and add desktop icon.
    gpe-login 0.90: Fix autolock landscape/portrait behavior.
    matchbox-applet-inputmanager 0.6: Implement smart IM visibility
protocol.
    matchbox-keyboard svn: Unbreak.
    xkbd 0.8.15: Add default common slides.

rpurdie@openembedded.org:
    angstrom: Define some extra PREFERRED_PROVIDERs to ensure
external-toolchain isn't touched
    Add external-toolchain.bb, based on code from poky
    ipkg-utils-native: Make sure ipkg-list-fields is installed, as
needed by meta-toolchain (from poky)
    libtool: Add missing patches
    ipkg-native: Fix the infamous ' cannot create /usr/lib/ipkg' warning
(from poky)
    Add packaged-staging2.bbclass, the next generation of packaged
staging! Requires bitbake 1.8 svn head or bitbake trunk.
    site/common-glibc: Add entry for gcc-zlib from poky
    libtool: Sync patches from Poky. Drop uneeded tag1 patch, make sure
ltmain.sh regenerates for libtool-cross, package debug files, fix nmedit
references, fix library search path handling particularly on darwin.
    shasum-native: Use do_stage as other recipes do, make sure directory
exists before installing binary
    site: Add arm-darwin (from poky)
    bitbake.conf/cross.bbclass: Add TOOLCHAIN_OPTIONS variable to allow
passing of extra compiler options in future (e.g. sysroot) (from poky)
    stage-manager: Updates to fix various bugs copy files instead of
moving them and handle symbolic links correctly (from poky)
    Add git-native 1.5.3 (from poky)
    classes/meta-toolchain: Remove pkgmaps from use using pkgdata to
provide all functionality in a multimachine safe way instead (from poky).
    package.bbclass: Remove uneeded PACKAGE variable sanity checks, use
pkgdata packaged function from base.bbclass rather than our own (from pok=
y)
    package.bbclass: Ensure 'packaged' pkgdata stamp is emitted for
packages using ALLOW_EMPTY instead of ALLOW_EMTPY_pkg (from poky)
    base.bbclass: Improve pkgdata handling functions so all
PACKAGE_ARCHS are searched (in order) when locating package data. This
fixes handling of packages with split package archs like sysvinit. (from
poky)
    x11vnc: Fix DEPENDS (from poky)
    meta-toolchain: Add a note about the libgcc package problems and
factor out a variable name (from poky)

rwhitby@nslu2-linux.org:
    nslu2-image.bbclass: upslug2-native is not actually required
    ixp4xx.inc: Required networking modules are now compiled into the
kernel.
    linux-ixp4xx: Changed the defcofig-2.6.21.6 to allow for nfs root on
the dsmg600, and for direct boot from disk on nslu2, nas100d and dsmg600.
    task-base: Added task-base-apex, and corrected some missing items
from PACKAGES
    linux-ixp4xx_2.6.21.6: Update defconfig to allow for direct rootfs
loading from an attached USB disk instead of jffs2
    ixp4xx.inc: Add redboot and apex features, and build a .tar.gz
rootfs for direct disk booting.
    task-base: No functional change - just bumping PR due to ixp4xx
MACHINE_ESSENTIALS change.
    nslu2-minimal-image: Added rationale for not changing image
basename, after discussion and agreement with Koen.
    ixp4xx.conf: set the correct working kernel version and essential
modules for networking on ixp4xx machines
    linux-ixp4xx_2.6.23.8: set DEFAULT_PREFERENCE to -1, as it gives an
all-zeros MAC address on the first DHCP request after boot
    angstrom-2007.1.conf: set the correct working kernel version for
linux-ixp4xx
    nslu2-linksys-firmware: Enable for ixp4xx machines too.
    nslu2-minimal-image: use inherit nslu2-image instead of INHERIT +=3D
nslu2-image.  The former works, even when you remove the latter from
your local.conf :-)
    netbase: Added 'auto eth0' to interfaces file as per RFC on list,
and cause busybox ifup doesn't support allow-hotplug.
    sane-srcrevs: (and friends): Added openmoko-sample2
    nslu2-minimal-image: Added (on Koen's advice) to allow creation of
NSLU2 Angstrom (or other DISTRO) flashable images without needing to
create a new DISTRO

sakoman@gmail.com:
    directfb : Update include file paths so that directfb-examples builds.

xjqian@openembedded.org:
    flite: add version 1.3

xora@openembedded.org:
    psplash_svn.bb : rediff openmoko patch
    firefox_2.0.0.3.bb : fix quoting
    angstrom-2007-preferred-versions.inc : increase the Angstrom version =
of
    xserver-kdrive-common : Xglamo now works well enough to be default fo=
r
    xserver-kdrive_1.3.0.0.bb : more glamo patches, have purposely not
bumped
    linux.inc : change the generation of uImage to do_compile_append so t=
hat
    linux-openmoko_2.6.22.5.bb : CONFIG_MTD_NAND_S3C2410_CLKSTOP breaks
accessing


Bugs fixed:
bug_id resolution	 short_desc
3376 FIXED	 DEPENDS and RDEPENDS
1527 FIXED	 usb networking broken in tosa
1726 FIXED	 ixp4xxle-feed.conf doesn't point to the right location
1727 FIXED	 ixp4xxle rootfs is too large for most ixp4xxle target devices
2124 FIXED	 Angstrom on akita can't login via gpe-login/xdm
2163 FIXED	 glib-2.0 python variable expansion does not work
2365 FIXED	 uclibc: can't handle reloc type 0x49 in lib '/lib/libc.so.6'
for powerpc/angstrom/uclibc
2462 FIXED	 QA error on gnome-menus package (.debug)
2468 FIXED	 python-pyqt4 fails do_compile
2774 FIXED	 python-egenix-mx-base-2.0.6-r1-do_patch
2775 FIXED	 python-formencode-0.4-r0-do_fetch
2778 WONTFIX	 python-m2crypto-0.13.1-r0-do_compile
2781 FIXED	 python-soappy-0.11.3-r0-do_compile
2782 WONTFIX	 python-pyode-1.0.0-r0-do_compile
2783 INVALID	 python-sip4-4.4.5-ml0-do_compile
2784 FIXED	 python-pyqt4-4.2-ml0-do_generate
2787 FIXED	 python-ecore-0.0.0+cvs20070816-r0-do_compile
2788 FIXED	 python-evas-0.0.0+cvs20070816-r0-do_compile
2789 FIXED	 python-pytest-0.6.0-ml0-do_fetch
2790 FIXED	 python-sword-1.5.9-r0-do_compile
2791 WORKSFORME	 python24-native-2.4.0-r2-do_compile
2871 FIXED	 Add 18BPP support in X for A1200/E2
2905 FIXED	 python-pygtk does not provide working import gtk
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2993 FIXED	 eglibc: export-fcntl2.patch no longer needed since svn rev 34=
68
3188 FIXED	 [PATCH] fix libx11-native package
3248 FIXED	 agg.bb needs a -D
3289 FIXED	 python-ecore-0.1.1+cvs20070819-r1-do_compile
3312 FIXED	 Fix for task-python-sharprom
3343 FIXED	 [PATCH] fix libungif download location
3346 FIXED	 Upstream GCC C compiler bug
3367 FIXED	 package binutils-cross-2.18 fails to compile
3368 FIXED	 python 2.5 is not build with ctypes on arm
3371 FIXED	 openrdate recipe
3373 FIXED	 fix firefox 2.0.0.3 building
3377 FIXED	 contacts-0.7-r1-do_compile
3378 REMIND	 gmp-native-4.2.1-r2 fails to compile
3387 FIXED	 kismet preferred version
3409 FIXED	 e2fsprogs 1.38 does not build with uclibc and USE_NLS=3Dno
3413 FIXED	 libtool-cross-1.5.10-r9-do_patch
3414 FIXED	 libtool-native-1.5.10-r9-do_patch
3416 FIXED	 apex-env-1.5.8-r0-do_compile
3417 FIXED	 dates-0.4.4-r2-do_compile
3419 DUPLICATE	 qmake2-native is broken due to target dependance
3422 FIXED	 ERROR: task-base-dbg is listed in PACKAGES multiple times
3423 FIXED	 gcc-cross-4.1.2-r13-do_configure
3426 INVALID	 build angstrom with unecessary packages.
2511 FIXED	 uicmoc4-native fails do_compile after recent update to
version 4.3.0

Bugs opened:
bug_id resolution	 short_desc
3410 	 git fetcher problems with http protocol
3420 	 ecore - software 16bpp support
3431 	 Unknown task spits out traceback instead of friendly error message
3432 	 bitbake -e <package> no longer works
3418 	 e-wm headers missing
3401 	 gcc-cross-4.1.2-r12-do_compile
3402 	 Cygwin support for meta-toolchain
3403 	 Perl-native depends on target architecture
3404 	 Add dtc 1.0.0 recipes and dtc-sdk support (for meta-toolchain)
3405 	 Add sdk recipes (git and 1.2.0) and uboot-utils_git.bb
3406 	 Add mtd 1.1.0
3407 	 Fix mtnpatch.py
3408 	 popt-1.10.4
3411 	 gst-plugins-base-0.10.14-r2-do_install
3421 	 Oops on boot
3424 	 Bitbake recipe for lrzsz incorrectly configuring alternatives
3425 	 mipv6-2.0.2-r0-do_configure
3427 	 Add LED classCPU activity trigger
3428 	 preferred xserver-kdrive-imageon for c7x0
3429 	 gnash-CVS
3430 	 Patch for adding Cmdline support in kexec-tools
3433 	 Evas and Ecore no longer build with directfb support


In total 22 bugs have been created and 48 bugs were closed.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWTreMkyGM64RGpERAjCEAJ0bM+xVyrLdpe3VutsxcYDCaUzRyQCfbhcm
dFtyngFTcoaeFxiGnfaHo4c=3D
=3D2kge
-----END PGP SIGNATURE-----


