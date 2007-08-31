Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IR4ke-0003SX-JJ
	for openembedded-devel@openembedded.org; Fri, 31 Aug 2007 13:33:24 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7VBVG1R020937 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2007 13:31:16 +0200
Message-ID: <46D7FC2E.9060702@dominion.kabel.utwente.nl>
Date: Fri, 31 Aug 2007 13:31:58 +0200
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
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l7VBVG1R020937
Subject: OE 'weekly' changelog
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
X-List-Received-Date: Fri, 31 Aug 2007 11:33:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

A day late and a dollar short:

cbrake@openembedded.org:
    MAINTAINERS: update my entry
    mono-1.2.5pre5: add mono 1.2.5pre5

clement.hermann@free.fr:
    udev: add sbin into PATH for network.sh, should close #2869

craig@gumstix.com:
    initscripts: lower alignment value for gumstix boards - close #2890

crofton@openembedded.org:
    gumstix.inc : Make sure RECOMMENDED modules get into minimal image.
    base-files : Add machine specific fstabs for gumstix-{connex, verdex}=
. In the
    gumstick-*.conf : Move machine specific parts from gumstix.inc to the
gumstix-{connex,verdex}
    omap5912osk.conf : Clean up machine file.
    base-files : Update fstab for omap5912osk to clear up a boot time err=
or.
    angstrom-minimal-image : Use mount from util-linux. Needed to moutn t=
mpfs.
    MAINTAINERS : Another update to Philip Balister.
    MAINTAINERS : Update entry for Philip Balister
    libnetfilter-queue : Add versioned dependency on libtool-cross
    libnetfilter_queue : Add libnetfilter_queue to OE. Needs libtool 1.5.=
24 to build.
    linux-omap : Add support for more machines. Clean up ABI handling. Mo=
ve toward
linux.inc compatible structure.
    linux : Do not set LOCALVERSION in kernel defconfig.
    linux : Update defconfig for gumstix connex/basix from gumstix svn.
    linux : Update defconfig for gumstix verdex from gumstix svn.
    linux : Update pxafb-definition.patch from gumstix svn.
    ltp : Commit patch intended for earlier commit. from bug #2078.

daniel@openembedded.org:
    linux-gta01_2.6.22.5.bb: Modify fix-EVIOCGRAB-semantics patch for 2.6=
.22 and

florian@openembedded.org:
    intltool: increment PR
    intltool: It needs some perl modules to work at all - latest ones at =
least.
    linux-hackndev-2.6: PR++
    linux-hackndev-2.6: Update Palm TX defconfig from upstream defconfig:=
 Build bluetooth,
border and pcmcia modules, some configuration changes, reduce number of P=
TYs.
    palm.conf: Autoload the TX battery module.
    palmtx.conf: Include more modules, makes sound, battery and pcmcia wo=
rk.
    xserver-common: Add 1.18, drop some older versions.
    fbreader: Get rid of iconv crap
    task-gpephone: Add vochistory
    ptim-engine: Package additional files
    libabenabler2: Add version 1.0
    gpe-session-scripts-phone: Drop some environment crap.
    vochistory: Add 0.1
    xserver-common: Add 1.17
    fbreader: fix dependency
    libsettings: Update download location
    gpe-bootsplash: Update GPE version number for Angstr=C3=B6m
    fbreader: Add libiconv depencency
    librsvg: Add 2.11.1 again

freyther@openembedded.org:
    python-openmoko: Apply Marcin's patch until today as this is going to=
 be applied upstream

hrw@openembedded.org:
    gcc/gcc-cross 4.1.2: bump PR to build working compiler after broken A=
RM Crunch
    disapproval of revision '4fb1a7447c5d8ace96a5ac6358c7fe10f0d951c4'
    linux-gta01: use KERNELORG_MIRROR instead of german mirror
    update-modules: depend on depmod (Take from Poky - r2589)
    nfs-utils: start/stop also statd so clients will be able to do lockin=
g (Taken from
Poky -r2578) - close #2799
    nfs-utils: Add patch to work with uclibc (Taken from Poky -r1796)
    nfs-utils: do not check for nfsd kernel module as it can be built-in =
into kernel.
(Taken from Poky - r1395)
    disapproval of revision 'a8eed6047c4764f6f475a519b127e6c00f07442e'
    nfs-utils: do not check for nfsd kernel module as it can be built-in =
into kernel.
(Taken from Poky - r1395)
    linux: added forgotten alix patches - close #2878
    linux: switched ALIX to 2.6.23-r3, added MFGPT patches, changed confi=
g
    alsa: added 1.0.14 from Poky
    portmap: added 6.0 from Poky
    lmsensors-apps: totally changed packaging + build of sensors applicat=
ion
    disapproval of revision '11e7fd7a1d2b01efd7be20943672ee11977561e2'
    lmsensors-apps: upgrade to 2.10.4, build also sensors app
    less: update to 406 (from Poky), drop older ones
    powertop: update to 1.8
    linux: select proper PATA driver for Alix board
    gtk+ 2.10.14: fix combo-arrow-size.patch (from Poky) - closes #2845
    grub: rdepend on diffutils to get 'cmp' command needed by grub-instal=
l
    openmoko: use proper version of qemu
    MAINTAINERS: updated my entry
    python-dbus: make it build on amd64
    python-openmoko: make it build on amd64
    disapproval of revision '38e2cd40a04ac88008e433a43002415c562145e4'
    python-dbus: make it build on amd64

ifaistos@openembedded.org:
    packages/asterisk/asterisk_1.4.11.bb : Add asterisk 1.4.11
    dropped  packages/asterisk/asterisk_1.2.23.bb : remove old asterisk v=
ersion
    packages/asterisk/asterisk_1.2.18.bb : Remove old asterisk version

jin@mediatomb.org:
    image-magick: fix staging and packaging, closes #2892

koen@openembedded.org:
    bluez: update to 3.17
    apt: sync with poky
    dpkg-native: do not DEPENDS on u-a-native, since u-a-native already d=
epends on this ->
loop
    angstrom-package*: select proper u-a
    dpkg: merge fixes from poky, update to 1.3.25
    gcc 4.1.2: add patches for maverick crunch (that's an FPU)
    gcc 4.2.1: add patches for maverick crunch on ep93xx (That's an FPU)
    zaurus-2.6.inc: consistently suffix jffs2 images with jffs2
    mtd-utils: lock down git rev
    angstrom-x11-<foo>-image: fix basename
    bluez-gnome: update to 0.14
    bluez: update to 3.16
    c7x0: use imageon xserver
    angstrom x11 office: add gphoto2
    squid: add 2.6-stable14
    blktool: add 4 (from poky)
    dht-walnot: set UBOOT_ENTRYPOINT in preparation of kernel recipe clea=
nup
    angstrom-x11-images: follow angstrom-x11-<task>-image naming (thanks =
hrw)
    angstrom: add more images:
    fic-gta01, fic-gta02, smdk2443: set UBOOT_ENTRYPOINT in preparation o=
f kernel recipe
cleanup
    uclibc 0.9.29: add templates for different ARM generations and use iw=
mmxt for
gumstix-verdex
    openmoko-session2: fix tap-n-hold
    h2200: fix defconfig
    openmoko-dialer2: apply patch from
http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=3D757
    openmoko-panel-bt: add patch from
http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=3D639
    uclibc.inc: add support for uclinux-uclibc binaries
    uclibc 0.9.29: add config files for gumstix
    rootfs*.bbclass: uclibc doesn't provides glibc-locale* and locale-bas=
e*, so don't try
to install it
    angstrom.inc: let sepukku delete the workdir on failure, not tindercl=
ient
    linux-handhelds: include wifi support in h2200 kernel and enable usb =
drivers
    openssl: add arm/uclibc support
    machine tune files: add FEED_ARCH to the usual suspects to make out-o=
f-tree machines work
    avahi: attempt #1 to stop it building python by default
    angstrom: add preferred provider for avahi
    angstrom: add sane defaults for tinderclient and seppuku
    angstrom: start adding support for building .debs and .rpms instead o=
f .ipk packages
    gcc: drop lock files
    gcc 4.2.1: add extra patches for uclibc build
    disapproval of revision '6b34ae43bf4f59a33f79e42d0cc2ad1b0d5e0c6e'
    bluez-utils: depend on gstreamer for headset stuff
    olsrd: update to 0.5.3
    sane-frontends: add 1.0.13
    sane-backends: fix packaging and staging
    gimp: add 2.3.19, unify old recipes
    linux.inc: add PV into uboot comment
    libhildonmime: depends on gnome-vfs
    xserver-xorg: fix -dbg packaging
    libtool-native 1.5.24: DEFAULT_PREFERENCE =3D "-1"
    automake-native 1.10: add DEFAULT_PREFERENCE =3D "-1"
    mono: move patchdir, should fix #2851
    mono: fix PV for 1.2.5pre so we don't need an epoch for the 1.2.5 rel=
ease (see our
versioning policy at http://www.openembedded.org/versioningpolicy )
    linux: add 2.6.22+2.6.23-rc3 for at91 machines
    linux 2.6.21: bump PR after all those changes
    linux.inc: catch up with depends after gumstix changes
    bluez-utils: update to 3.15, get out your a2dp headsets :)
    bluez-libs: update to 3.15
    linux 2.6.21: fix gumstix patches and verdex defconfig (works with iw=
mmxt now)
    gumstix: fix name
    angstrom: add feed archs for new gumstix machines
    linux 2.6.21: split gumstix into connex and verdex
    gumstix: split into connex and verdex
    gnuplot: update to 4.2.0
    pidgin: update to 2.1.1, enable avahi
    seppuku.bbclass: add more debugging and keep attaching buildlogs for =
known bugs
    disapproval of revision '0c3cbec705ed9bb1d768da4c43b21a210b3a4609'

likewise@openembedded.org:
    Fixed x86-prescott and added x86-32-nocona machines.
    helloworld-image: trimmed the .bb, had second copy of itself
    linux-x86: Build bzImage, some kernels grew too large for zImage.
    x86-prescott: Added new machine.

mickeyl:
    rename linux-gta01 to linux-openmoko, this kernel will be useful on a=
 family of devices,
    linux-gta01: use gta01 defconfig for gta02
    linux-gta01: use linux-gta02 as kernel
    linux-gta01: make it compatible w/ gta02, adjust DEPENDS
    add openmoko-firststart2
    openmoko-mediaplayer2: ship images, remove patches that have been app=
lied upstream

mickeyl@openembedded.org:
    openmoko-theme-standard2: use SVNREV
    imlib2: set OE_LT_RPATH_ALLOW to make imlib find its modules
    efl_base.bbclass: presource task is no longer necessary
    openmoko-terminal2: use more appropriate icon, bump PR
    libsdl-ttf-native: catch up STAGING_BINDIR changes
    sshfs-fuse: update to 1.8
    linux-gta01: remove 2.6.21.5
    lyx: update to 1.5.1
    qt4-x11 4.3.0 remove bogus OE_QMAKE_LIBS_X11 from pkgconfig file
    add midori, a lightweight web browser based on webkit-gtk
    add x11vnc -- exports your X11 session on-the-fly via VNC
    libsoup: update to 2.2.100
    add openmoko-mediaplayer2
    libspiff: add do-stage()
    add libspiff
    add liburiparser
    add task-openmoko-feed, things we want to have in the feed
    qemu: factor out gcc3 check function and include it
    qmake2: update to 2.10a from Qt/Embedded 4.3.1, thus removing X as de=
pendency
    exhibit|expedite: use E_CVS variable
    remove old versions of libxslt and twisted
    gtk+ 2.10.14: add updated versions of cell-renderer and treeview-chec=
kbox patches
    gst-plugins-bad: add directfb dependency
    python 2.5.1: catch up with some build system changes from 2.4 - 2.5 =
causing only half
of the packages being installed into the prop places
    add openmoko-tasks2 and ship it in the default image
    uicmoc4: add 4.3.1 building against Qt/Embedded. This no longer depen=
ds on X on the
buildhost.

openmoko@openembedded.org:
    gsmd: rewrite start script, use start-stop-daemon. fixes OM bugs #704=
, #751
    task-sdl: add more packages

pH5@openembedded.org:
    libgsmd: fix /etc/default/gsmd script
    dbus-glib-native: stage dbus-binding-tool for eds manually
    MAINTAINERS: add myself
    xtrans: add 1.0.4
    libxtst: add 1.0.3
    xvinfo: add 1.0.2
    xsetroot: add 1.0.2
    xprop: add 1.0.3
    xmodmap: add 1.0.3
    xdm: add 1.1.6
    libxrender: add 0.9.3
    libxpm: add 3.5.7
    sessreg: add 1.0.3
    xrdb: add 1.0.4
    libxaw: add 1.0.4
    setxkbmap: add 1.0.4
    xf86-video-savage: add 2.1.3
    xf86-video-nv: add 2.1.3
    xf86-video-ati: add 6.6.193
    xf86-input-mouse: add 1.2.2
    xorg-sgml-doctools: add 1.2
    libx11, diet-x11: add 1.1.3
    libice: add 1.0.4
    avahi-python: provides avahi, includes python bindings
    avahi: prepare for building gtk and python code, let only -daemon
    avahi: drop old versions
    task-sdl: use task.bbclass
    task-proper-tools: use task.bbclass
    task-gmae: use task.bbclass
    task-e-x11: use task.bbclass
    task-dvb: use task.bbclass
    task-xfce-base: use task.bbclass
    task-xterminal: use task.bbclass
    task-mythfront: use task.bbclass, only the epia version is machine sp=
ecific
    task-mokogateway: use task.bbclass
    task-{opie,qpe}*: use task.bbclass
    task-gpe*: use task.bbclass
    task-{base,boot}: use task.bbclass
    angstrom task packages: use task.bbclass, automatically builds -dev a=
nd
    libgsmd: combine machine specific configuration files, package plugin

raj.khem@gmail.com:
    eglibc: (r)provide glibc stuff, since it is compatible, closes #2894
    angstrom-*libc: make *libc initial overridable

rpurdie@openembedded.org:
    classes: Remove bitbake 1.6 compatibility code
    zaurus-2.6.inc: Zaurus images shouldn't include kernel-image
    kernel.bbclass: Allow machines to override the kernel-base runtime de=
pendencies
    Add blktool 4 (from Poky)
    glibc-package.bbclass: Correct PACKAGES_DYNAMIC
    bitbake.conf: Add MULTI_PROVIDER_WHITELIST

rwhitby@nslu2-linux.org:
    openmoko-feed: Added meta package to actually build all the packages =
in task-openmoko-*
    task-openmoko-feed: added openssh packages
    update-modules: Insert special case work-around for a legacy corner c=
ase of a machine
which supports a 2.6 kernel but is used in a distro which must use a 2.4 =
kernel.  It's
ugly, just look away now.  It has the blessing of RP and hrw, however.
    openocd: Enabled ft2232_libftdi so it can be used on a slug to devirg=
inate a neo
    ixp4xx-kernel: Enable support for IXDPG425 boards in the defconfig
    slugos-packages: added net-tools

stefan@openembedded.org:
    openmoko-panel-bt_svn.bb: Drop panel-bluetooth.patch, as it was appli=
ed upstream
    uboot-openmoko_svn.bb: Update to actual u-boot HEAD, adjust path to n=
ewest OM
    linux-gta01: Add 2.6.22.5
    rm_work.bbclass: Make sure all hidden directories get also removed. (=
.pc for example)
    openmoko-dialer2: Switch dependency. The dialer uses pulseaudio inste=
ad of gstreamer now.

woglinde2@openembedded.org:
    MAINTAINERS: fix spelling of cacao-cldc
    midpath: major rework of midpath
    classpath-minimal: next time I should not forget to bump PR
    MAINTAINERS: added my irc-nick
    MAINTAINERS: add myself to MAINTAINERS

xjqian@gmail.com:
    gnuplot: remove stale patch, fixes #2300

xora@openembedded.org:
    machine/include/zaurus-2.6.inc : dont put .bin on end os jffs2 images
    openmoko-dialer2_svn.bb : patch is now applied upstream
    gst-plugins-bad_0.10.5.bb : apply bug from #2854 to fix properly the =
directfb
    gst-plugins-bad_0.10.5.bb : disable directfb as its broken



Bugs fixed:
bug_id resolution	 short_desc
2034 FIXED	 PACKAGES_DYNAMIC vs. DEFAULT_PREFERENCE
2036 WONTFIX	 setup.py should offer an uninstall command
2501 INVALID	 svn fetcher does not support https/authentication
1744 FIXED	 omap2420h4 does not include kernel configuration
1903 FIXED	 [PATCH] Packaging for pkg-config 0.21
2001 FIXED	 vsftpd 2.0.5 fails to build
2300 FIXED	 gnuplot 4.2.0 recipe
2795 INVALID	 busybox-1.2.1 failed to build
2799 FIXED	 NFS Utils are broken - statd is not started so no locking
2800 FIXED	 angstrom-x11-image-1.0-r11-do_rootfs
2833 FIXED	 gst-plugins-bad-0.10.5-r1-do_compile
2845 FIXED	 gtk+-2.10.14-r5 fail to compile
2854 FIXED	 gst-plugins-bad-0.10.5-r1 build uses wrong include paths for =
directfb
2855 FIXED	 qemu-native-0.9.0+cvs20070613-r1-do_patch
2856 FIXED	 libtool-native-1.5.24-r0-do_compile
2869 FIXED	 udev does not bring up network interfaces on insertion
2878 FIXED	 linux-2.6.22+2.6.23-rc3-r0-do_patch
2883 DUPLICATE=09
uboot-openmoko-1.2.0+git3e66c078003607a7d1d214c15a5f262bc1b4032f+svn20070=
829-r2-do_fetch
2887 INVALID	 xserver-kdrive-imageon-1.3.0-r0-do_fetch
2890 FIXED	 Prevent flood of alignment fault messages on gumstix
2892 FIXED	 ImageMagickis not correctly staged
2894 FIXED	 eglibc should provide glibc packages when chosen as default l=
ibc
1359 FIXED	 bitbake r581 builds multiple providers for one package


Bugs opened:
bug_id resolution	 short_desc
2867 	 Clean smallfonts (4x6 and 5x8) for the kernel
2897 	 bitbake should raise skippackage instead of parse error when an sv=
n repo is down
2857 	 mono issues
2858 	 mono: ARM_FPU_NONE is hardcoded in configure.in
2859 	 mono: is --without-tls the correct TLS option
2860 	 mono: complete packaging
2861 	 mono: mcs directory (C#) code is not being built
2862 	 mono: finish native package
2863 	 mono: test on other architectures
2864 	 mono: add .NET 2.0 profile
2865 	 Qemu fails to build - error in cpu-exec.c
2866 	 PHP fails to build
2868 	 Openldap fails to build
2870 	 enchant-1.3.0-r0-do_compile
2871 	 Add 18BPP support in X for A1200/E2
2872 	 libart-lgpl-2.3.16-r2-do_unpack
2873 	 the sound driver in kernel 2.6.21 does not work on c7x0
2874 	 angstrom 20070803 x11 image cannot boot into x11
2875 	 Opie first-run wizard broken due to path changes
2876 	 please add axnet_cs module to zaurus kernels (linux-rp-2.6.21)
2877 	 Build and package microperl during perl build
2879 	 kernel misses USB host/client switch signalling
2880 	 linux-handhelds-2.6-2.6.21-hh12-r2-do_compile
2881 	 please change default PATH for bash
2884 	 openmoko-panel-mainmenu-0.1.0+svnr2567-r1-do_compile
2885 	 qt4-x11-free-4.3.0-r6-do_populate_staging
2886 	 squid-2.6.STABLE14-r0-do_configure
2888 	 xserver-kdrive-imageon-1.3.0.0-r0-do_patch
2889 	 Remove kernel image from rootfs for gumstix
2891 	 Provide .bb for udev-115
2893 	 Fixups for gumstix machines
2895 	 angstrom-x11-gpe-image-1.0-r0-do_rootfs
2896 	 angstrom-x11-pimlico-image-1.0-r0-do_rootfs
2898 	 broken keymap in spitz image 20070828
2899 	 Fixup autotools.bbclass for samba-3.0.25c
2900 	 samba-3.0.25c support

In total 36 bugs have been created and 23 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG1/wuMkyGM64RGpERAqkqAJwJbp7M4qiFToe8+frJeRtGpVOgtACeIip4
tVz70xtRLiz3n2h5NNkuyjA=3D
=3DboV/
-----END PGP SIGNATURE-----


