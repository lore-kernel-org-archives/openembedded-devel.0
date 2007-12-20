Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J5HFZ-0007iX-7W
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 09:59:29 +0100
Received: from Powerbook-2.local (vpn006011.vpn.utwente.nl [130.89.6.11])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBK8sH0k019463 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 09:54:17 +0100
Message-ID: <476A2DB9.2060501@student.utwente.nl>
Date: Thu, 20 Dec 2007 09:54:17 +0100
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
	lBK8sH0k019463
Subject: OE changelog 20071213 - 20071220
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
X-List-Received-Date: Thu, 20 Dec 2007 08:59:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Laibsch@openembedded.org:
    matchbox-applet-cards: fix unfetchable SRC_URI
    atk: drop obsolete versions 2.2 and 2.4
    atk: drop packages version 1.10 and older.
    reiserfsprogs: fetch from DEBIAN_MIRROR instead of namesys.com
    guile-native: add DEPENDS for gmp-native
    glibmm: update to 2.14.2 (with DEFAULT_PREF -1).  Closes 3265.
    MAINTAINERS: update my and CoreDump's entry
    timezones: drop from OE in favor of tzdata as specified in RFC
    spandsp: fix SRC_URI
    opie-citytime: replace recommendation for timezones with tzdata
    sip: upgrade sip-native and python-sip to 4.7.3
    divers: fix spelling mistake in license (GPL2 -> GPLv2).

awilcox@openembedded.org:
    Remove u-boot-utils-native from RDEPENDS.  Remove openprotium
specificity.
    Rename uboot-utils to u-boot-utils-native. u-boot-utils now makes

cbrake@openembedded.org:
    linux 2.6.23+2.6.24-rc5: add cm-x270 support (prep for 2.6.24 release=
)
    cm-x270.conf: allow user to override kernel version
    angstrom-2007-preferred-versions.inc: add mono-mcs-intermediate as
it must match mono version
    mono 1.2.6: update recipies from 1.2.6pre4 to 1.2.6

florian@openembedded.org:
    mainstone.conf: Add jffs2 magic and adjust image size to the default
16MB partition.
    mainstone-kernel: Update configuration to become more useful: use
rootfs from internal flash, enable pcmcia module, mmc and power managemen=
t

freyther@openembedded.org:
    packages/curl/{curl,curl-native}: Do not try to use libssh2.

hrw@openembedded.org:
    contacts: SVN version is not default
    pimlico: sync svn versions with Poky
    tasks: update to 0.13
    dates: refreshed patch
    dates: updated to 0.4.5
    contacts: updated to 0.8
    x11-sato-image: fix also image name - spotted by Rolf
    x11-sato-image: renamed poky-image-base as this image is not related
to any of Poky images.
    libxml: dropped not used file

jeremy_laine@openembedded.org:
    libvorbis: package version 1.2.0
    libogg: package version 1.1.3
    linux-rp-2.6.22: improve defconfig for qemux86
    linux-2.6.23: improve LEDs support on mpc8313e-rdb

john_lee@openmoko.com:
    fix bugzilla #882
    missed SRCREV_pn-openmoko-panel-demo ?=3D "${AUTOREV}"
    patch moko-autorev.inc to reflect the removal of OM2007 in svn
    fix sourcepkg minor error.  make it possible to inherit in .bb

koen@openembedded.org:
    qt4-x11: repair vi damage
    angstrom: have autobuilder report distro version to bugzilla
    qt4-x11: create dir before trying to put files into it
    angstrom build feed: replacement for meta-angstrom-2007 recipe, will
be deprecated once the problems with the meta package get sorted out
    angstrom 2007: bump to RC 1.3
    angstrom build release: base-files contains DISTRO_VERSION, so clean
it to get the correct version into images
    poky-base-image: add an image that offers a basic "poky" gui, and
its dependencies
    midori: add 0.0.15
    linux.inc: merge in poky stuff
    angstrom build release.sh: build base-image instead of minimal image
per RFC on angstrom-devel mailinglist
    angstrom: bump to RC1.1
    angstrom-autobuilder: remove workaround for broken -native recipes
    apache2-native: inherit cross instead of native. This is a
workaround, not a real fix
    qmake2-native: inherit cross instead of native, bandaid for recent
build problems
    minimal-gpe-image: include gpe-dm
    angstrom: bump to RC1
    angstrom autobuilder: add meta-angstrom-2007
    libart: add config file for armeb, closes #3469
    meta angstrom 2007: add skeleton for autobuilder feed population file
    angstrom 2007 preferred versions: bump midori to 0.13 to get it
built against a recent webkit

mickeyl@openembedded.org:
    task-python-everything fix typo. closes #3492
    xserver-kdrive-common 0.1 (openmoko) write log file to /tmp/x.log
    python-pyqt 4.3.3 set sip tag back to 4.3.2 until we actually have
Qt 4.3.3 in OE
    sip.bbclass: =3D+ emits problems with task dependencies, using +=3D n=
ow
    matchbox-keyboard-inputmethod svn catch up fic-gta01-font-size patch
and also apply for gta02
    pointercal 0.0 add file for e680
    python-pyqt 4.3.3 change sip tag
    python-pyqt 4.3.1 update to 4.3.3
    disapproval of revision '246f9c04a53439921ddf3390aeea277ba55bba13'
    uboot-openmoko svn remove glamo-ram-init.patch; has been applied
upstream
    libgsmd svn add gta02 specific version
    moko-autorev.inc: remove openmoko 2007.1 stuff (won't receive updates=
)

openmoko@openembedded.org:
    change to rev 3630.

pH5@openembedded.org:
    avahi: add 0.6.22, adds libavahi-gobject
    angstrom-2008.1.conf: sync with 2007.1 changes
    magician.conf: remove deprecated kernel modules, enable jffs2 image
building
    hx4700: MACHINE variable housekeeping
    gconf-dbus: fix -dev packaging of svn version
    scons.bbclass: create ${D}${prefix} before calling scons

pfalcon@openembedded.org:
    angstrom-2007.1.conf: Upgrade linux-handhelds-2.6 to 2.6.21-hh20
    linux-handhelds-2.6: Add 2.6.21-hh20.
    bitbake.conf: Allow TARGET_ARCH to be passed via environment.
    task-base: Bump PR to propogate machines' vfat feature.
    PDA-like machines with card slots: Enable "vfat" feature.
    task-base: Introduce "vfat" feature to get VFAT support.
    angstrom-2007.1.conf: Bump to RC1.2.
    task-base: Add NLS modules for VFAT support.
    gcc* 3.4.4: Add patch to accept gcc4-style arm926/1026 subarch names.
    ncurses 5.4: Fix host includes issue for the case ${prefix} !=3D /usr.
    linux-libc-headers: Do not hardcode /usr.
    Ability to write ipk's depends on ipkg-utils-native having been stage=
d.
    generic-uclibc.conf: Revamp, add PREFERRED_PROVIDERs for toolchain
packages.
    generic.conf: Revamp Generic distro per the current standards of
TARGET_PREFIX handling.
    base.bbclass: Unexport TARGET_ARCH, quilt (at least) is a victim.
    sanity.bbclass: Requiring MACHINE to be set is too paranoid.
    package.bbclass: Add ASSUME_SHLIBS, way to specify shlib
dependencies for ASSUME_PROVIDED.
    task-devimage: Add kexec-tools.
    devimage 0.1: Add DESCRIPTION.
    initramfs-module-bootmenu 1.0: RRECOMMENDS NLS modules required for
vfat mounting.
    linux-handhelds-2.6 2.6.21-hh19: Make NLS cp437 & iso8859-1 modular.

rpurdie@openembedded.org:
    package.bbclass: Don't strip files in .debug directories meaning
rerunning the package task doesn't create chains of .debug directories
(from poky)
    binutils-cross-sdk-2.18: Sync debug packaging fix from Poky (also #24=
82)

rwhitby@nslu2-linux.org:
    unslung-kernel: Fix kernel suffix to match correct MACHINE_ARCH
    slingbox-1.3.1: Remove bashism from scripts/trylink
    disapproval of revision '8c623c07e2b9ac8518c6996f21854952b110d66c'
    slingbox-1.3.1: Remove bashism from scripts/trylink
    Remove the MACHINE_ARCH override for nslu2be and nslu2le, to enable
proper multimachine support for nslu2 and ixp4xx together in the same
build tree.
    Remove obsoleted ixp4xx and nslu2 conf files (use the le or be
alternatives instead)
    glibc-2.2.5: Disable gconv package processing for Unslung distro.
    glibc-2.2.5: Fixed staging (someone made a typo when putting in
layout_base_libdir).
    task-slugos: Formatting cleanup, no functional change.
    angstrom.inc: Remove the nslu2 DISTRO_FEATURES override, since the
equivalent is done in a much better way in base-image now.
    linux-ixp4xx: Updated from 2.6.21.6 to to 2.6.21.7
    glibc-2.2.5: Added a couple of well-known patches to allow this old
version of glibc to be built with gcc 4.x and dash.
    unslung.conf: Add some more preferred providers to stop
external-toolchain interfering.
    angstrom/build-release: Instead of building a useless
nslu2-minimal-image, build a minimal-image plus a useful nslu2-base-image.
    base-image: Added more documentation, including criteria for adding
and removing packages from the image.
    base-image: New image designed to be a basis upon which you can
install any other desired functionality using task packages from feeds.

xjqian@openembedded.org:
    roadmap: 1st round of updating roadmap recipies after moving
zroadmap over to roadmap

xora@openembedded.org:
    uboot-openmoko_svn.bb : version number increased from LaForge
    openmoko-dialer2_svn.bb : now uses libnotify for new sms
    task-openmoko-phone.bb : doesnt provide task-openmoko-everything
    sane-srcrevs.inc : lets have some OM application improvements
    u-boot-mkimage-openmoko-native_oe.bb : solve the mkimage not found
problem
    linux-openmoko_2.6.22.5.bb : commit the work for OM bug #910 now peop=
le



Bugs fixed:
bug_id resolution	 short_desc
1305 WONTFIX	 gxine ogg vorbis playback broke
1307 WONTFIX	 gnumeric won't start when ran as a normal user
1308 WONTFIX	 matchbox mb-applet-cards freezes system
2214 FIXED	 create dual-GUI GPE/Opie image
450 WONTFIX	 collie: very low speed of writing to jffs2
553 WONTFIX	 pppd updates wrong (?) resolv.conf
558 WONTFIX	 opie-mediaplayer2 glitches when playing mp3 from an sd card
626 WONTFIX	 opieplayer volume cannot be changed without restart of the
program
809 WONTFIX	 Frodo 4.2-r1 package broken under OZ 3.5.4 and collie...
821 WONTFIX	 kaffe-gtk won't run any programs
888 WONTFIX	 gpe-calendar & gpe-announce alarms will repeat / duplicate
until acknowledged
889 WONTFIX	 gpe-calendar alarms aren't saved after reboot
927 WONTFIX	 Hardware 'OK' button doesn't work in many dialog boxes
994 WONTFIX	 gnomesword crashes when starting up.
1007 WONTFIX	 mpd file structure
1008 WONTFIX	 TERM /etc/profile
1064 WONTFIX	 mplayer video output under opie abnormal on spitz/cl-3000
1149 WONTFIX	 spitz locks on shutdown of rtl8150 usb ethernet
1186 WONTFIX	 gpe-login quits if screen rotated lanscape -> portrait
1242 WORKSFORME	 qt-x11-free-3.3.6-r0 fails with on do_package
1259 INVALID	 Poodle test image won't boot.
1306 WONTFIX	 vlc-gpe crashes when trying to play a file
1309 WONTFIX	 gpdf quits when opening a file
1358 WONTFIX	 gkdial packages doesn't create required /etc/chatscripts
directory
1388 WONTFIX	 sound problem with the rc2 release on SL-5600
1395 WONTFIX	 GPE crashes/shuts down at Zaurus suspend
1445 WONTFIX	 Poodle screen turns off when starting OPIE in oz 3.5.4.2 rc=
2
1494 WONTFIX	 gaim crash when login to msn...
1509 WONTFIX	 Light&Power settings not working correctly on collie
1537 DUPLICATE	 opie-console window too large
1617 WONTFIX	 Enable VNC-Server support in QT/E
1621 WONTFIX	 Akita won't use TCP/IP-over-USB with WinXP
1723 WONTFIX	 Dropbear keeps regenerating machine rsa key
1796 WONTFIX	 Unabe to install timezone information because of a missing
dependency.
1801 WONTFIX	 contrast problem on SL-C700
1810 WONTFIX	 Network application bug and enhancement request
1822 WONTFIX	 Lack of joystick support for 3.5.4 releases on SL6000/tosa
1825 FIXED	 install-native missing inherit native
1928 WORKSFORME	 libx11 fails with crosscompile badness
1969 WONTFIX	 busybox ifup does not pass parameters properly?
2249 FIXED	 opie-tinykate fails do_package
2482 FIXED	 binutils-cross-sdk: non debug package contains .debug directo=
ry
2660 FIXED	 smbfs cannot mount ms windows share
2804 WONTFIX	 Updating the version of gtkmm library.
2946 INVALID	 linux-rp-2.6.19+git-r5-do_fetch
3003 INVALID	 engrave-0.0.0+cvs20070819-r0-do_fetch
3024 FIXED	 openmoko-browser2-0.0.1+svnr1-r0-do_fetch
3025 FIXED	 openmoko-browser2-0.0.1+svnr${SRCREV}-r0-do_fetch
3133 FIXED	 mono-1.2.5.1-r3-do_compile
3253 FIXED	 Belkin bt card not working - hciattach fails with bcsp error
messages
3265 FIXED	 Update the version of glibmm library
3344 INVALID	 openmoko-feedreader2-0.0.1+svnr623080-r1-do_fetch
3398 FIXED	 hal_0.5.9: add intltool-native to dependencies to prevent
configure from failing
3451 INVALID	 eet-native-0.9.10.041+cvs20071206-r0-do_fetch
3452 INVALID	 eet-0.9.10.041+cvs20071206-r0-do_fetch
3463 INVALID	 librecord-1.0-r0-do_configure
3465 DUPLICATE	 zaurus-hinge cannot find bl (on c7x0)
3466 FIXED	 webkit update breaks midori-0.0.12
3469 FIXED	 libart-lgpl-2.3.19-r0-do_unpack
3482 FIXED	 reiserfsprogs-3.6.19 no longer available from namesys.com or
angstrom-distribution.org
3486 INVALID	 audiofile build failed
3491 INVALID	 dependencies of frozen-bubble are compiled but not installe=
d
3492 FIXED	 Mispelling of python-pydirectfb as python-directfb in
task-python-everything.bb
3493 FIXED	 qt4-x11-free-4.3.2-r6-do_compile
3460 FIXED	 x11-image does not build with ANGSTROM_MODE=3Deglibc
3457 DUPLICATE	 provide a java5-capable compiler to compile native
classpath and JVM
482 WONTFIX	 pretec bluetooth card not recognized
877 WONTFIX	 qplot segfaulting on OZ-alpha2
1550 WONTFIX	 setting time in gpe-conf produces hwclock/RTC error on akit=
a
879 WONTFIX	 /usr/bin contains boot-critical binaries
1198 WONTFIX	 opie-reader segfaults with when opening chm file


Bugs opened:
bug_id resolution	 short_desc
3484 	 SD and CF memory cards don't mount on hx4700
3488 	 [META] Angstrom 2007: Machine-specific issues
3470 	 bitbake doesn't work when using a x86_64 kernel with a 32bit
userspace
3479 	 buildall not working as advertised
3467 	 epdf_cvs.bb
3468 	 fuse module not included in 2.6.23
3472 	 apache2-2.2.3-r5-do_configure
3473 	 curl builds fails due to bad configure parameter
3474 	 unable to bitbake gpe-image -- bitbake pixman fails with cross
compiler badness
3476 	 webkit-gtk-0.1+svnr28656-r4-do_compile
3477 	 minimalist-gpe-image is missing X server init scripts
3478 	 uim-native fails compilation unless libxext-dev is installed
3480 	 5500 hangs during boot
3481 	 libsdl-qpe and libsdl-x11 conflict with each other
3483 	 guile-native-1.6.4 fails do_compile
3485 	 Angstrom image for Tosa unavailable
3489 	 gpe-bluetooth applet has error message on exit for h2200
3490 	 ipkg install (using package manager) crashes package manager with
IPKG backend failure (h2200)
3494 	 gpsdrive-2.10pre2-r1-do_fetch
3495 	 Problems with exceptions with psyco 1.5
3496 	 New package for geany stable
3497 	 qt4-x11-free-4.3.2-r6-do_populate_staging
3471 	 psplash rotation doesn't really work
3487 	 [META] =C3=85ngstr=C3=B6m 2008 and beyond
- -e
In total 24 bugs have been created and 71 bugs were closed.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHai25MkyGM64RGpERAi9wAKCeS6cqe6/UmMYLduH30+A1PbXonQCdFUlE
6eMRm9zHLhP6yriKvZwr0V8=3D
=3DFLyN
-----END PGP SIGNATURE-----


