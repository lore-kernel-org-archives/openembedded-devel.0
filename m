Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IW5h0-0008OG-4U
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 09:34:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8E7UtxW028331 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 09:30:55 +0200
Message-ID: <46EA38B7.9020801@student.utwente.nl>
Date: Fri, 14 Sep 2007 09:31:03 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
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
X-List-Received-Date: Fri, 14 Sep 2007 07:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

We have an autobuilder that files bugs now, it would be nice if people looked at those bug
reports.




cbrake@openembedded.org:
    angstrom-minimal-image-with-mtd-utils: change RDEPENDS to IMAGE_INSTALL

crofton@openembedded.org:
    linux-omap.inc : Depend on uboot-utils for mkimage. Do not depend on u-boot.
    linux : Put all defconfig information in the gumstix-verdex defconfig and

daniel@openembedded.org:
    openmoko-terminal2_svn.bb: Put vte in RDEPENDS so it gets installed into the rootfs
(closes OpenMoko bug #809)

hrw@openembedded.org:
    openmoko: use moto-autorev.inc to get OpenMoko apps from SVN always
    starling 0.2: fix DEPENDS
    openmoko-terminal2: fix DEPENDS/RDEPENDS error
    settings-daemon: switch to SRCREV (from Poky)
    madwifi-ng: make r2702 default for alix (which use 2.6.23-rc kernel) - close #2974
    linux: changed way of adding uboot-mkimage dependency so #2926 should be fixed
    base.bbclass: change message about lack of checksums.ini entry for URI to something
easier to understand
    tcpdump: update to 3.9.7 whic do not need libpcap 0.9.3 but builds with 0.9.6

koen@openembedded.org:
    sane-srcrevs: add bfin-uclibc
    bfin-uclibc: add blackfin fork of uclibc
    sane-srcrevc: add elf2flt
    elf2flt: add wrapper for uclinux binaries needing funky linkers
    linux 2.6.21: remove gumstix patch that breaks busybox
    srcrev files: updates
    angstrom 2007.1: require sane-srcrevs.inc
    gpicview: add 0.1.5
    e-wm: add version that uses e-dbus instead of the deprecated ecore-dbus
    libgsmd: use mux0 on ezx phones
    task-openmoko: add openmoko-dates2
    matchbox-keyboard/: fix PVs
    neod: s/MACHINE/MACHINE_ARCH/
    libidn: remove bogus dep on 'glibc' to fix uclibc builds
    disapproval of revision 'faa846d8f78b2a5a405633e96ac2d3c62bd9240a'
    linux-ezx: apply patch to fix mtd access
    libgsmd: add stub for Motorola EZX platforms, tested, but does nothing yet:
    ezxd: fix hardcoded gcc
    linux-ezx: update to svn r2050
    linux-ezx: update a1200, e680, rokre2 and rokre6 defconfigs to match a780 defconfig.
Device owners: please review
    angstrom 2007: include preferred-openmoko-versions
    linux-ezx: expand COMPATIBLE_MACHINE to rokre2 and rokre6
    rokr6: add machine stub
    linux-ezx: bump PR
    linux-ezx: enable swap, loo, nfsrootp and wext in a780 defconfig
    base-files: make machine specific
    netbase: remove bogus a780 and e680 interface files
    linux-ezx: remove 'noinitrd' to fix booting from tf
    dbus: remove --reverse (yes, that is bad) to fix shutting down of dbus services on
halt/reboot
    angstrom 2008: switch to xorg 7.3
    linux.inc: use kernel decompressor (fast!) instead of uboot one (sloooooooow), closes
#2925

likewise@openembedded.org:
    disapproval of revision '1e52f7b1fc531c1622587e798a3e97e77aa163c8'
    devmem2: Simple program to read/write from/to any location in memory.

mickeyl@openembedded.org:
    libgsmd: add modified start script for fic-gta01 due to problems w/ UART multiplexing
    alsa-state: ship standard asoundrc (simple dmix configuration) that should
    xchat: remove 2.6.1, add 2.8.4
    psplash: fix buglet in openmoko psplash-hand-img.h
    psplash: convert to SRCREV, update openmoko branding image
    uboot-openmoko 1.2.0+git+svn bump frozen version
    add gdk-pixbuf-csource-native for building stuff on X/Gtk+-less buildmachines
    neod svn: speficy platform for FIC Neo1973 and Motorola EZX devices
    motorola-ezx.inc: remove
    bitbake.conf: enable yaffs2 image generation
    add yaffs2-utils[-native]
    oh-puzzles: convert to SRCREV
    notification-daemon: remove 0.3.5, package dbus services file in 0.3.6, add 0.3.7
    libnotify: remove older ones, fix formatting
    linux-openmoko: indivate SRCREV in kernel binary version, add dedicated recipe for
development kernel (floating SRCREV)
    openmoko distro configurations:
    linux.inc: prepare adding fic-gta01/fic-gta02 support
    linux-ezx: e6 -> rokre6, e2 -> rokre2
    exhibit cvs: add dependency on epsilon

oe@iss.tu-darmstadt.de:
    fxload: a firmware uploader for ezusb chips

pH5@openembedded.org:
    preferred-xorg-versions-X11R7.3.inc: fix some versions (drop X11R7.x prefix)
    angstrom-2008.1.conf: use 2.6.21-hh16 version of handhelds.org kernel
    preferred-xorg-versions.inc: use "?=", not "="
    task-openmoko: make magician use qvga theme
    MAINTAINERS: add Tim Sander so he can brag in front of his colleagues
    xserver-kdrive-git: add build fix for xephyr
    xserver-kdrive-git: small w100 build fix
    xserver-kdrive-git: add enable-epson.patch for git
    xserver-kdrive-git: drop "--enable-kdrive-vesa" again
    xserver-kdrive-git: fixup
    xserver-kdrive: patch shuffle and cleanup
    xserver-kdrive: move enable-epson.patch out of -common, prep for git fixup
    xserver-kdrive: add 1.4 for X11R7.3 release
    xserver-kdrive: move enable-builtin-fonts.patch out of -common.inc
    xserver-kdrive-1.3.0.0: drop version specific hide-cursor-and-ppm-root.patch
    xserver-kdrive-w100: split configure.ac and Makefile.am out of w100 patch

pfalcon@openembedded.org:
    angstrom-2007.1.conf: Bump PREFERRED_VERSION_linux-handhelds-2.6 to "2.6.21-hh16".
    linux-handhelds-2.6: Add 2.6.21-hh16, update defconfigs to defconfigman r377.
    linux-handhelds-2.6: Update defconfig for h2200 from defconfigman r377.
    liveramdisk-image: Build a LiveRamdisk image.
    initramfs-jffs2 0.1: Bump mtdram size to 24.5Mb, helps h4000 image.
    qt3e.bbclass, qt3x11.bbclass: Follow qmake-base rename.
    Follow qmake-base rename.
    uicmoc-native: Follow qmake-base rename.
    qmake-base.bbclass: Rename to qmake_base.bbclass.
    xserver-kdrive 1.3.0.0: Bump PR for w100 fix.
    xserver-kdrive: Put back w100 support, screwed up by megacommit from Poky.
    linux-handhelds-2.6: Add 2.6.21-hh15.

rpurdie@openembedded.org:
    srcrev: Change default to '1', make assignments in .inc files weak assignment and
update generator code, set SRCREV to the old default insane-srcrevs.inc
    meta-sdk-*: Update/fix to use package_update_index_ipk

rwhitby@nslu2-linux.org:
    openmoko.conf: comment out moko-autorev.inc to enable stability for the openmoko
community.  Change approved by mickeyl.
    free42: HP42 RPN calculator, also added to openmoko-feed
    *-(src|auto)revs: Added revs for some missing openmoko packages.
    task-openmoko-feed: Replaced timezones with tzdata
    task-openmoko-feed: Added joe
    task-openmoko-feed: Added ipkg-utils, mplayer, synergy
    gsm: Fix default file and init script.  GSM_RES was missing, and the tests for null
values needed quotes around the value to prevent syntax errors.
    qmake_base: Fix packages that refer to qmake-base instead of qmake_base.  OE needs a
class files naming convention - choose hyphens or underscores, not both.

stefan@openembedded.org:
    opentapi: Remove as superseeded by ezxd

xora@openembedded.org:
    xournal/xournal_0.4.0.1.bb : version bump, bugfix release

ynezz@true.cz:
    gcc 4.2: fix uclibc compilation, closes #2959



Bugs fixed:
bug_id resolution	 short_desc
2966 INVALID	 Overrides + adding does not work
2931 INVALID	 libgcc-related SO link errors after recent changes to gcc.bb
2093 INVALID	 Cups needs to use gcc to link on arm/eabi
2424 WORKSFORME	 After reboot
2428 WORKSFORME	 ipkg fills root parition space on spitz during upgrade or update
2500 FIXED	 Can't build xserver-kdrive_git.bb
2766 WORKSFORME	 No brightness adjustment in gpe-login
2768 WORKSFORME	 Unable to switch virtual terminals at gpe-login or during gpe-session
2810 WORKSFORME	 at daemon: /var/spool/at is not created on installation
2906 LATER	 /proc/apm stays permanent
2914 WORKSFORME	 gcc-cross-4.1.2-r6 fails to compile because of internal compiler error
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2920 FIXED	 New Recipe: Free42 RPN Calculator
2925 FIXED	 Use linux decompressor instead of u-boot's for uImage kernels
2962 DUPLICATE	 Kernel Oops when inserting SD card
2963 FIXED	 matchbox-keyboard-inputmethod-0.0+svn20070909-r4-do_configure
2965 FIXED	 fxload.bb
2968 FIXED	 ezxd-0.0+svnr2048-r0-do_compile
2971 FIXED	 linux-ezx-2.6.21-ezxdev-r10-do_compile
2972 INVALID	 linux-ezx-2.6.21-ezxdev-r11-do_compile
2974 FIXED	 madwifi-ng-r2518-20070626-r5-do_compile
2978 FIXED	 ERROR: Build of org.openembedded.dev/packages/gnome/gconf-dbus_svn.bb
2979 WORKSFORME	 uicmoc4-native-4.3.1-r0-do_compile
2980 WORKSFORME	 webkit-gtk-0.0+svnr25505-r25501-r1-do_unpack
2985 FIXED	 e-wm-0.16.999.038-r7-do_configure
2986 DUPLICATE	 e-wm-0.16.999.039-r7-do_configure
2997 FIXED	 gconf-dbus-2.16.0+svnr1-r3-do_fetch
2959 FIXED	 Fix for broken gcc-cross-4.2.1-r3 in uClibc mode


Bugs opened:
bug_id resolution	 short_desc
2952 	 Some tasks are skipped during build
2957 	 oe_libinstall -C option issue
2958 	 bitbake handling of '-' in classname
2949 	 vlc-gpe do_compile error modules/gui/pda/pda.c
2950 	 libts version missmatches
2951 	 fontconfig-native 2.3.91 fails to build
2953 	 gstreamer_0.10.14.bb do_configure fails for x86_64
2954 	 New program and recipe: ipkgorphan
2955 	 Unable to change terminal as normal user after logging into gpe
2956 	 gpe-lock-display: unable to adjust brightness on resume
2960 	 Angstrom Akita 20070828 mounts RO
2961 	 update-alternatives in rootfs_deb works on host binaries
2964 	 save-rtc date format causes error if busybox # CONFIG_FEATURE_DATE_ISOFMT is not set
2967 	 uclibc-0.9.29-r7-do_compile
2969 	 Kexec Cmdline support for arm kernels
2970 	 support building 3rd party feeds
2973 	 opensimpad-64+0-2.4.27-vrs1-pxa1-jpm1-r4-do_compile
2975 	 webkit-gtk-0.0+svnr25488-r25486-r1-do_configure
2976 	 webkit-gtk-0.0+svnr25489-r25486-r1-do_configure
2977 	 icu-3.6-r1-do_compile
2981 	 webkit-gtk-0.0+svnr25505-r25501-r1-do_configure
2982 	 icu-3.6-r1-do_populate_staging
2983 	 openmoko-libs-0.4+svnr2367-r0-do_configure
2984 	 openmoko-terminal2-2.1.0+r2879-r1-do_configure
2987 	 gpe-bluetooth won't start (security policy problem)
2988 	 Update gettext to 0.16.1
2989 	 libpcap 0.9.7
2991 	 linux-2.6.21-r9-do_install
2992 	 efl1/emotion fails to build because of edje_cc-native segfault
2993 	 eglibc: export-fcntl2.patch no longer needed since svn rev 3468
2994 	 keylaunch-2.0.10-r12-do_install
2995 	 matchbox-wm-1.2-r1-do_install
2996 	 xrandr-1.2.0-r2-do_compile
2990 	 xrandr stops rotate after a few tries

In total 34 bugs have been created and 28 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG6ji3MkyGM64RGpERAgSZAJ9Q2lVWxcNDAU0Xy8/PkjVrXlBE+QCfct9i
yAb8cZixgefcud4+wZCgi5A=
=flXO
-----END PGP SIGNATURE-----


