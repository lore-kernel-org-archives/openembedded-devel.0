Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE0D3-0002X1-9O
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 12:04:41 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QA3G1R032567 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 12:03:17 +0200
Message-ID: <46A87161.9080105@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 12:03:13 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
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
X-List-Received-Date: Thu, 26 Jul 2007 10:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex:
    initramfs: Add blockboot plugin and cleanup dependency handling.
    initramfs-image: Revamped image for modular initramfs.
    initramfs: New modular initramfs for booting kernel from various media.

cbrake@openembedded.org:
    compulab-pxa270_2.6.16.bb: fix location of custom tasks

crofton@openembedded.org:
    pkgconfig : Add support for pkgconfig-0.22. DEFAULT_PREF = -1 pending

florian@openembedded.org:
    phoneserver: Fix PACKAGE_ARCH
    disapproval of revision '8cdc9906876cb88040360ad2c43a38608055f2b4'
    ptim-helper: Add missing files to package.
    ptim-manager: Make install more flexible agains gtk versions.
    gpe-applauncher: add 0.8
    gpe-phonepanel: add 0.9
    libgpephone: add 0.4
    cms92init: Add patch to work around broken install tools.
    phoneserver: Add patch for FIC GTA01 support.

koen@openembedded.org:
    wifi-radar: fix rdepends, closes #2684
    gcc 4.2.1: add missing uclibc locale patch and a patch to reduce binary size with -Os
    webkit: add some qmake magic from zecke to make install and staging work better
    autotools.bbclass: run sed over .la files to removes various occurences to staging,
workdir and ${D}
    pkgconfig.bbclass: mangle some more workdir occurences
    webkit: fix dftables build
    gcc: 4.2.0 has a bug, so replace it with 4.2.1
    angstrom: move to gtk 2.10.14, fixes some weird behaviour with the xml parser
    openmoko-rssreader: depend on webkit
    sanity.bbclass: add help2man to required utils (apt-get install help2man) in
preparation for autoconf 2.61 activation
    ruby: fix packaging
    task-base: also install bluez-utils-compat in task-base-bluetooth
    disapproval of revision 'd7758e2637918ff4035244d64fb7227f6cf833ad'
    networkmanager: fix packaging and QA issues
    webkit: first attempt at fixing the dftables problem
(http://bugs.webkit.org/show_bug.cgi?id=14744)
    libpcre: fix packaging, stage dftables
    python-pyqt3: fix PR
    midori: update to 0.0.3
    Webkit: update local copy of Makefiles
    geoclue: cath up with recent developments
    gtk+: add 2.10.14, the latest stable release
    jack: update to 0.103.0, fix packaging, remove broken 0.99.0 version
    brutefir: depend on all fftw flavours
    fftw: =+ not +=
    fftw: checkin fftw.inc
    brutefir: add comment about makefile patch
    fftw: start cleaning up packaging
    bruteFIR: add 1.0i
    fftw: add support for building multiple flavours of fftw
    clutter: update it a bit
    gnome-vfs-obexftp: fix packaging
    openobex: update to 1.3
    gnome-vfs-obex-ftp: add WIP recipe

lenehan@openembedded.org:
    usermanual: Fix some typos in the helloworld example. Closes #2681.

mickeyl@openembedded.org:
    add python-efl bindings to task-python-everything
    add python-emotion. all python bindings to EFL compile now, but I didn't test their
runtime capabilities yet...
    python-setuptools, python-simplejson: catch up with changes in distutils build class
    classes/distutils.bbclass: back out specifying the include dir, it was a) implicitly
specified anyway and b) it breaks builds that add own stuff to
    classes/distutils.bbclass:
    add python bindings to the Enlightenment Foundation Libraries
    distutils: set PYTHONPATH and always create the site-packages directory to improve
compatibility with certain extension packages
    python-pyrex[-native]: bump to 0.9.5.1a
    eflpp: supply path to edje_cc
    conf/.../sane-srcdates.inc: add fixed SRCDATE for eflpp
    libcwd: bump to 0.99.47, compiles with g++4/EABI now
    enna: add missing patch. thanks koen for spotting
    efl++: move inside efl1 since it's now a subproject of E17
    add etk-native (non-working yet)
    classes: remove outdated efl1.bbclass, package *.a/*.la in common EFL plugin
directories to PN-dev
    esmart: point to proper edje_cc
    enna: fix svn build (broken locale problem)
    libmusicbrainz: update from 2.1.2 to 2.1.4, add 3.0.1 (DEFAULT_PREFERENCE=-1)
    taglib[c]: unify formatting
    * add edje_editor, an editor for edje files
    EFL: move from building snapshots to cvs again. Reasons:
    python: add subpackage python-debugger including pdb.py* and bdb.py*

pfalcon@openembedded.org:
    initramfs-module-*: Create install dirs before putting stuff there.
    kernel.bbclass: Add support for module config per 2.6 conevntions.
    preferred-opie-versions-1.2.3.inc: Add file for OPIE 1.2.3 release.
    opie-alarm: Use proper-for-upstream PR.
    preferred-opie-versions-1.2.3-pre: Bump SRCDATE to 20070724.
    initramfs-uniboot: Rename from just initramfs.
    linux-handhelds-2.6: Drop few old versions.
    linux-handhelds-2.6: Add 2.6.21-hh13.
    linux-handhelds-2.6: Add missing defconfigs for asus730 and htchimalaya.
    qte-mt 2.3.10: Bump PR.
    qte 2.3.10: Get rid of ipaq vs zaurus dichotomy, it's all 2.4 FUD.
    uclibc-0.9.29: Add config for palmz72 (generic PXA27x).
    uclibc-0.9.29: Add config for palmld (generic PXA27x).
    uclibc-0.9.29: Add palmz31 config (generic PXA of course).
    initramfs-jffs2: Initramfs to boot from jffs2 ramdisk.
    initramfs-nfsboot: Remove, superseded by initramfs-module-nfs.
    initramfs-module-nfs: Make it actually mount NFS by using the same option as kernel does.
    initramfs-image: Do not depend on kernel modules.
    initramfs-minimal-image: Keep sample recipe with PACKAGE_INSTALL_NO_DEPS = "1".
    qte 2.3.10: Remove overrides which are superfluous after latest changes.
    qte 2.3.10: WARNING_UNKNOWN_DEVICE is not referenced anywhere, remove.
    qte 2.3.10: Add tentative patch on the way to kill ipaq vs zaurus descrepancy.
    qte 2.3.10: Refresh patch after deprecating 2.4 stuff.
    qte-mt 2.3.10: Bump PR.
    qte 2.3.10: Rename a patch to match its content.
    qte 2.3.10: Move c700 2.4 patches to deprecated.
    qte 2.3.20: Move simpad 2.4 patches to deprecated.
    task-opie: Try to install backgrounds for device native resolution.
    qte-mt 2.3.10: Bump PR.
    qte 2.3.10: QT_QWS_DEVFS is not referenced anywhere, remove.
    qte 2.3.10: QT_QWS_SL6000 is not referenced in sourec code or patches, remove.

philippe@openembedded.org:
    linux-handhelds-2.6_2.6.21-h11 : fix hamcop compilation issue
    task-gpe : replace gaim by pidgin

polyonymous@openembedded.org:
    libsigc++-2.0: disable autoheader in autoreconf
    conf/machine/spitz: rotated by 3*pi/2
    opie-taskbar-images: package more resoltions.
    conf/machine/spitz: populate MACHINE_* namespace

rpurdie@openembedded.org:
    mtd-utils: Remove stale files/versions (from poky)
    mtd-utils: Updates after lzo patches merged upstream (from poky)

slapin@openembedded.org:
    Bumped PR
    Updated defconfig for Palm Treo 650

stefan@openembedded.org:
    Remove bashism from linux-gta01.inc

todd@openembedded.org:
    hx4700.conf: prefer version 1.2.0 of xserver-kdrive since it supports w100

woglinde2@openembedded.org:
    -updating ecj to 3.3

xora@openembedded.org:
    bluez-utils_3.12.bb : package alsa plugin into bluez-alsa, also fix
    gnome-desktop_2.18.3.bb : version bump
    packages/bluez/files/pkgconfig-add-gthread.patch : add missing patch



Bugs fixed:
bug_id resolution	 short_desc
2644 FIXED	 bad structure of sources/svn directory
2673 INVALID	 about relation calculations & rebuild
997 WORKSFORME	 ncurses configure fails cc sanity check
1707 FIXED	 vsftpd bitbake build is broken with regard to SSL support
2200 DUPLICATE	 QA issues in squashfs-lzma-tools-native
2532 FIXED	 Create .bb file for libsigc++ 2.0.17 package
2617 DUPLICATE	 spitz/akita sound mixer misconfiguration
2624 FIXED	 If software's SVN repository changes locations (SRC_URI changed)
2630 DUPLICATE	 xrandr doesn't report rotation state
2658 FIXED	 linux-handhelds-2.6-2.6.21-hh11-r1 fails to build
2666 FIXED	 Error while building the library libsigc++-2.0.17
2668 FIXED	 Move towards machine-independent qte
2669 FIXED	 Revamp module_conf_* support for 2.6
2678 FIXED	 RFP: tetex-bin missing in arm5te for zaurus 860
2681 FIXED	 3 typos in help world example


Bugs opened:
bug_id resolution	 short_desc
2671 	 Bitbake 1.8 tries to build glibc-intermediate-2.3.2+cvs20040726 for no apparent reason.
2667 	 Sound problems with recent kernels a.k.a. asound statefiles need updating
2670 	 initial env for altboot lacks /sbin in $PATH : losetup not found
2672 	 angstrom-x11-image does not boot from flash on h3850
2674 	 touchscreen on nokia 800 not working
2676 	 angstrom-x11-image does not boot from flash on h3900
2677 	 nokia 800 kernel not booting
2679 	 zlib.h from debian sneaks in when compiling libxml2-native
2680 	 Generating debian source files (.dsc)
2682 	 Fixed poodle_pm-r3.patch to compile for linux-rp-2.6.21
2683 	 wmmxt version of qemu fails while generating the de_DE (UTF-8) localte for glibc 2.5
2686 	 don't pass the bootsplash
2687 	 Apache2 segfaults on shlib load in ld.so on arm4t
2675 	 libtool breakage in -dev package
2684 	 wifi-radar 1.9.6-r0 have wrong dependencies

In total 15 bugs have been created and 15 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqHFhMkyGM64RGpERAp3LAJ9HwkupOHjntgk1uqFP0WXw+v07nwCgm9MD
/AIPeDiaBd7mZss+XMdXcvA=
=YAmQ
-----END PGP SIGNATURE-----


