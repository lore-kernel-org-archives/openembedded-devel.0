Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LbyYK-0002zq-Ao
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 15:46:33 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2809795rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=y0h9LnCX3Cbl/r0sN2KuMGuj3PCkxv2xEePNHFVtv4Y=;
	b=WD85R22de5qc1dcuB+o/Vfpk5eSFtYLF68PH+ETsA2tfu2zAVWYE0OEw6TmuAiE21H
	i//wAJp6EjnuoNovSi/lKYT1XhZDdNjSRC9+Q3XiU2PnXDuGHOyYuMmwYwXJR++Isuj5
	Y0iH+ZlDxEOOAW2wsVjDdezy+AOZED0ovaOS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=WGjT+75Malr2L60obJeoNGF3vQCC7CPxfj7MWu0K5wz5oPvFbWT8gROKqx0Chzb5HS
	5nNMzGYNdFHsm3xrBZ1J6KmLQf27iLpksrNhudpSi96oUnejvPYjYUVQXpgXGrLPIP0B
	xzUOWcWLiMu7uIetuVuVlfz1ZEeukR3P5q+X8=
MIME-Version: 1.0
Received: by 10.140.250.14 with SMTP id x14mr2639738rvh.79.1235486610126; Tue, 
	24 Feb 2009 06:43:30 -0800 (PST)
Date: Tue, 24 Feb 2009 09:43:30 -0500
Message-ID: <f96d234e0902240643g6e84afb2u6ad1659202fb5a1a@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-02-16 to 2009-02-23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2009 14:46:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-02-16 to 2009-02-23

Andrea Adami (1):
      angstrom-autobuilder: build kexecboot kernel for tosa too (wiped by a

Bernhard Guillon (1):
      konqueror-embedded: fix acinclude and unset KDE_LDPATH, bump PR

Carsten Haitzler (Raster (2):
      libgles-omap3: add comments on how to get the gles binary files to he=
lp
      efl: update efl and fix ecore package to not have dfb patch
anymore - obsolete.

Carsten Haitzler (Raster) (1):
      libgles-omap3: add comments on how to get the gles binary files to he=
lp

Cliff Brake (2):

Denys Dmytriyenko (3):
      python-2.6.1: add back empty -O flag to fix weird host=3D=3Dtarget
binary mixing
      fso-images.inc: add an empty file to allow bitbake to parse the
entire tree
      gcc-package-sdk.inc: fix packaging of include-fixed in sdk

Dmitry Eremin-Solenikov (1):
      wireshare: fix building with current toolchain

Elena Grandi (2):
      tuxmath 1.7.1: new recipe
      checksums.ini: added entry for tuxmath 1.7.1

Frans Meulenbroeks (9):
      midori: updated to git version
      php: fixed build
      mpd: added sample /etc/mtd.conf file
      mpd: fix mode of mpd.conf
      apache-native: inherit native; NOT inherit cross!
      apache-native: fixed dirs to native
      modphp: fixed build errors
      angstrom: added cdstatus to the feed; better than cdparanoia as
it has cddb support
      gpsd: moved to 2.38

Graeme Gregory (6):
      xf86-video-glamo_git.bb : add bb file for glamo xorg git
      xf86-video-glamo_git.bb : add this file to build the Xorg glamo
driver written
      ecore-native_svn.bb : enable ecore-config which is needed by
other parts of e17
      entrance_0.9.0.010.bb : refresh the patches so this actually builds
      linux_2.6.28.bb : add tosa support to this recipe
      linux_2.6.28.bb : increase preference for tosa and bump PR
forgotten in last

Jan L=FCbbe (4):
      linux-openmoko-2.6.28: use the correct path the config files
      bluez4: bump to 4.30 (4.29 had broken legacy pairing)
      linux-openmoko: fix defconfig names
      bluez4: ship the other config files

Jeremy Lain=E9 (9):
      qt4: enable phonon support for qt4-x11-free and qt-embedded
      gstreamer: update to version 0.10.22
      checksums.ini: add entry for gstreamer 0.10.22
      gstreamer: drop version 0.10.21
      gst-plugins-base: update to version 0.10.22
      gst-plugins-good: update to version 0.10.13
      gst-plugins-ugly: update to version 0.10.10

John Willis (1):
      libgles-omap3: make /dev/pvrsrvkm accessible by non ROOT users.

Khem Raj (5):
      yasr_0.6.9.bb: New recipe
      evtest_1.23.bb: New recipe
      gnuchess_5.021: New recipe
      popt-1.7: Fix build with new libtool

Koen Kooi (45):
      overo: add ubifs support
      linux-omap 2.6.28: improve overo support
      linux-omap 2.6.28: further tweaks to overo defconfig
      dmai: move CE_INSTALL_DIR
      distcc: update to 3.1
      boost 1.36: ARM_INSTRUCTION_SET =3D "arm"
      linux-omap: set CONFIG_MODULE_FORCE_LOAD=3Dy
      failure-cleanup.bbclass: class that does -c clean on a package
that fails to build
      linux-omap-pm: update to current HEAD, refresh patches
      dmai: comment out install, add staging
      gstreamer-ti: add more vars to make xdc a bit happier
      linux-omap-pm: add patch to register all OPPs, tweak defconfig
      linux-omap-pm: add patch to register all OPPs, tweak defconfig
      angstrom contrib: check in local.conf used on autobuilders
      task-native-sdk: install task-proper-tools and all perl-modules
      gob2: add -native version
      mpd: massive update
      angstrom feed builder: add gmpc
      task-boot: rename DISTRO_ vars to IMAGE_ vars and move to
image.bbclass * update users as well
      Revert the portions of "libgles-omap3: add comments on how to
get the gles binary files to help" that snuck in
      mpd: add fix from mpd-alsa
      gstreamer-ti: set CODEC_INSTALL_DIR, fix packaging
      gstreamer-ti: add dmai to RDEPENDS
      gstreamer-ti: set FC_INSTALL_DIR as well
      gstreamer-ti: update to match codec-engine renaming
      gstreamer-ti: bump PR
      ti-dmai: fix postinst
      ti-codec-engine: also add RREPLACES
      ti-dmai: make ${PN} a meta package
      checksums: add some checksums
      libgc: update to 7.1, still broken autotools
      omap3-sgx-modules: add patch to fix spurious IRQ
      gstreamer-ti: bump PR for memleak fixes
      run-postinsts: add from poky
      rootfs_ipk bbclass: make ONLINE_PACKAGE_MANAGEMENT work on non
task-base images as well
      angstrom 2009.X: select our preferred opkg variant, can be
overridden on a per image bases
      motion: fix ffmpeg support
      image.bbclass: install stuff listed in IMAGE_INSTALL as well
      task-gstreamer-ti: add task to get a load of gstreamer stuff

Marcin Juszkiewicz (9):
      base.bbclass: output messages only if BitBake 1.8 is used (from Poky)
      e2fsprogs: use Koen's trick to get GNU_HASH section in binaries
      linux: added 2.6.29-rc5 with support for Vortex86sx based devices
      MAINTAINERS: updated my entry
      v86d: this is x86 compatible so mark as such
      vortex86sx: we use sisfb which gives 2D acceleration
      checksums.ini: added some new entries

Michael 'Mickey' Lauer (24):
      popt: clean up 1.7
      bitbake.conf: override XDG_DATA_DIRS to point into our staging area;
      preferred-om-2008-versions.inc: bump vala and libtiff
      tiff 3.8.2: use autotools_stage, make default
      libgsm0710: 1.0.0 -> 1.1.0
      sane-srcrevs.inc: bump fso-monitord
      sane-srcrevs.inc: bump fso-abyss
      fso-monitord: bump for 0.2.0
      fso-images: add fso-paroli-image; refactor fso-image into .inc;
add fso-zhone-image
      python-native-2.5.1: remove forgotten dir
      fso-image.inc: add contents
      linux-openmoko[devel]: use $CONFIG_NAME for upstream defconfig
      frameworkd: add configuration for Openmoko GTA03
      om-gta03.conf: prefer openmoko-devel for now
      dropbear: add latest stable version 0.52; untested, hence DP =3D -1
      htc*.conf: factor out common include file for the msm7xxxx devices
      linux-msm7xxxx: bump kernel for raphael and diamond
      vala: add another patch against glib-2.0.vapi
      linux-msm7xxxx: use kernel 2.6.27 with upstream defconfig for
htcraphael and htcdiamond
      fso-abyss: version 0.3.1
      sane-srcrevs.inc: bump for abyss 0.3.1
      conf/checksums: update
      vala[-native]: 0.5.6 -> 0.5.7
      libdaemon: 0.12 -> 0.13

Mike Westerhof (16):
      SlugOS: nail down preferred version for avahi and tiff (libtool
crappage victims)
      coreutils: install df and nice into correct directories, fixes
update-alternatives
      procps: add pkill to the update-alternatives list
      bridge-utils: add brctl to the update-alternatives list
      inetutils: Added tftp, telnet, logger to the update-alternatives list
      SlugOS: busybox defconfig - drop printenv command
      bridge-utils: fix typo in do_install
      SlugOS: slugos.inc - SlugOS 5.3-alpha enters the world.
      ntpclient: use update-alternatives for adjtimex
      dbus: fix post-install script to change ownership _after_ group
and id is created.
      SlugOS: preferred-slugos-versions.inc - lock down gst plugins version
      gst-plugins-base: re-instate 0.10.17 so that SlugOS feeds build again=
.
      ntpclient: correct directory for adjtimex to be consistent with busyb=
ox
      hdparm: install to /sbin, not /usr/sbin and enable update-alternative=
s
      SlugOS: Adjust to accomodate YAACTATW - Add IPKG_VARIANT to slugos.co=
nf
      SlugOS: slugos.conf - add IMAGE_INITSCRIPTS, which apparently
became requires suddenly.

Otavio Salvador (2):
      parted: drop syscalls patches sinse we device _llseek now
      parted: drop configure_prepend since syscalls.h was remove

Philip Balister (5):
      linux-omap-2.6.27 : Add USB to defconfig. Build more modules.
      libnetfilter_queue : Use default configure method. Resolves
issue on 64 bit build machine.
      libnetfilter-queue : Convert recipe to use include file.
      libnetfilter-queue : Add recipe for version 0.0.16.
      libnetfilter_queue : Fix "I am an idiot" type problem.

Philipp Zabel (1):
      busybox-static-1.11.3: Add missing B921600 patch to fix build.

Robert Nelson (1):
      picodlp-control: add options to control individual leds and
overall led current

Roger Monk (13):
      dmai: add patch to unbreak xdc
      dmai: update 1.20, remove obsolete 1.16
      codec-engine: fix lpm build and clean up old files
      dmai: remove xdc hack
      omap3530-dvsdk-combos: add recipe to (re)build the codecs from the DV=
SDK
      dmai: update paths to codecs
      dsplink, codec-engine: restructuring and packaging improvements
      dmai: Repackaging for codec-combos and dmai, remove dsplink
recipe that isn't needed anymore
      codec-engine: Added RREPLACES for dsplink packages - bumped PR
      codec-engine: Added-scripts for loading/unloading modules for
running dsplink/ce/dmai test apps
      codec-engine: Added SDMA linuxutils build and package, minor
DSPLINK DIRSEP fix
      codec-engine: fix typo
      dsplink: Added class device create support to dsplink to allow
udev to create the device node.

Roman I Khimov (1):
      busybox-1.13.2: fix parallel build failing on appletlib

Sergey Lapin (15):
      lowpan-utils: added (IEEE802.15 userspace)
      lowpan-utils: fixed binaries locations
      lowpan-utils: updated packaging to suit source changes
      wireshark: added 1.0.5
      wireshark: ARM_INSTRUCTION_SET =3D "arm" due to relocation truncated =
to fit
      wireshark_1.0.5: patch for IEEE80215.4 to have 'nofcs' dissector
by default
      checksums.ini: added wireshark-1.0.5
      checksums.ini: added checksum for libsmi
      net-snmp: added _svn version, has proper staging to work with tshark
      net-snmp_svn, net-snmp_5.1.2, net-snmp_5.4.1: extracted common parts
      wireshark/tshark: extracted common parts
      build-feeds.sh: adding lowpan-utils and wireshark
      build-release.sh: added machines palmz72, afeb9260
      lowpan-utils: proper python scripts packaging

Steffen Sledz (3):
      popt_1.7: SRC_URI changed
      checksums: new URL for popt_1.7 added
      forte: new package

Tim 'timtim' Ellis (1):
      amule: Fix linking issue and add checksums

Tom Rini (9):
      gcc-common.inc: In get_gcc_fpu_setting make sure we only do soft
float for targets.
      gcc-canadian-sdk: Fix a problem where we were passing the wrong
headers and such as the target ones.
      gcc-common.inc: Make my last change to fpu check catch all linux vari=
ants
      busybox-{1.11.3,1.7.2,1.9.2}: Fix parallel build failing on appletlib
      eglibc: Rework the glibc compat packages logic again.
      apt: Add 0.7.20.2 (current on debian mirrors)
      dpkg: Add 1.14.25 (current on mirrors)
      checksums: Add apt-0.7.20.2, dpkg-1.14.25

Bugs fixed:

bug_id resolution        short_desc
2351 WONTFIX     gnome-desktop-2.16.1 doesn't compile
2625 WONTFIX     gnome-desktop-2.16 fails do_compile
2865 WONTFIX     Qemu fails to build - error in cpu-exec.c
3028 WONTFIX     Recipe for PyWebKitGtk
3473 WONTFIX     curl builds fails due to bad configure parameter
3907 FIXED       Package apt-native_0.7.11
4004 WONTFIX     gumstix-kernel-2.6.21-autobuild
4005 WONTFIX     gcc-cross-4.2.2-autobuild
4008 WONTFIX     e2fsprogs-1.38-autobuild
4012 WONTFIX     uclibc-0.9.29-autobuild
4013 WONTFIX     ffmpeg-0.4.9-pre1-autobuild
4014 WONTFIX     gnome-mplayer-0.5.3+cvs20080101-autobuild
4016 WONTFIX     driftnet-0.1.6-autobuild
4017 WONTFIX     nmap-4.20-autobuild
4018 WONTFIX     uqtreader-1.2.2opie+cvs20070601-autobuild
4019 WONTFIX     exiv2-0.15-autobuild
4021 WONTFIX     glibc-intermediate-2.6.1-autobuild
4022 WONTFIX     libsdl-net-1.2.7-autobuild
4023 WONTFIX     mono-1.2.5.1-autobuild
4024 WONTFIX     cacao-cldc-0.98-autobuild
4026 WONTFIX     minimo-0.02+cvs20070626-autobuild
4027 WONTFIX     enca-1.9-autobuild
4031 WONTFIX     directfb-1.1.0-autobuild
4032 WONTFIX     libsidplay-1.36.59-autobuild
4033 WONTFIX     rt73-k2wrlz-2.0.1-autobuild
4034 WONTFIX     rt2570-1.1.0-b2-autobuild
4035 WONTFIX     rt2570-k2wrlz-1.6.1-autobuild
4036 WONTFIX     evince-2.20.0-autobuild
4037 WONTFIX     kexec-tools-1.101-autobuild
4039 WONTFIX     apex-env-1.5.13-autobuild
4040 WONTFIX     apache2-2.2.3-autobuild
4041 WONTFIX     mplayer-0.0+1.0rc2-autobuild
4042 WONTFIX     openmoko-dates2-0.1.0+svnr673-autobuild
4043 WONTFIX     gst-plugins-bad-0.10.5-autobuild
4045 WONTFIX     libsdl-mixer-1.2.6-autobuild
4046 WONTFIX     gtk+-2.12.3-autobuild
4047 WONTFIX     exhibit-0.0.0+cvs20071206-autobuild
4049 WONTFIX     libtool-cross-1.5.10-autobuild
4050 WONTFIX     dfu-util-0.1+svnr2866-autobuild
4053 WONTFIX     busybox-static-1.2.1-autobuild
4054 WONTFIX     klibc-1.5-autobuild
4055 WONTFIX     libgpelaunch-0.14-autobuild
4057 WONTFIX     linux-handhelds-2.6-2.6.21-hh20-autobuild
4060 WONTFIX     libdisplaymigration-0.99-autobuild
4063 WONTFIX     qte-mt-2.3.10-autobuild
4066 WONTFIX     uclibc-initial-0.9.28-autobuild
4067 WONTFIX     openmoko-contacts2-0.1.0+svnr387-autobuild
4079 WONTFIX     synergy-1.3.1-autobuild
4082 WONTFIX     ipkg-0.99.163-autobuild
4085 WONTFIX     libmikmod-3.2.0-beta2-autobuild
4091 WONTFIX
linux-beagleboard-2.6.x+git2+1a77f70604e00b94bb3c841665a44b34430e9eda-autob=
uild
4092 WONTFIX
linux-beagleboard-2.6.23+2.6.24rc3-git1a77f70604e00b94bb3c841665a44b34430e9=
eda-autobuild
4093 WONTFIX     mono-native-1.2.5.1-autobuild
4097 WONTFIX     mono-1.2.6-autobuild
4098 WONTFIX     qt4-x11-free-4.3.3-autobuild
4099 WONTFIX     webkit-gtk-0.1+svnr28656-autobuild
4102 WONTFIX     sdcc-native-2.5.0-autobuild
4103 WONTFIX     epdf-0.1.0+cvs20071206-autobuild
4104 WONTFIX     openmoko-dialer2-0.1.0+svnr3902-autobuild
4105 WONTFIX     libconic-0.13-autobuild
4107 WONTFIX     apex-nslu2-16mb-1.5.8-autobuild
4109 WONTFIX     linux-rp-2.6.20-autobuild
4110 WONTFIX     xserver-kdrive-xomap fails to compile
4117 WONTFIX     gst-plugins-ugly-0.10.6-autobuild
4120 WONTFIX     inetutils-1.4.2-autobuild
4122 WONTFIX     e-wm-0.16.999.041-autobuild
4124 WONTFIX     apmd-3.2.2-autobuild
4126 WONTFIX     openmoko-image-1.0-autobuild
4128 WONTFIX     djvulibre-3.5.19-autobuild
4134 WONTFIX     embryo-native-0.9.1.042+cvs20080330-autobuild
4135 WONTFIX     claws-mail-3.3.0-autobuild
4138 WONTFIX     midori-0.0.17-autobuild
4139 WONTFIX     dbench-3.04-autobuild
4140 WONTFIX     abiword-plugins-2.5.2-autobuild
4141 WONTFIX     abiword-plugins-2.6.0-autobuild
4157 WONTFIX     goffice-0.6.2-autobuild
4161 WONTFIX     gnome-doc-utils-0.12.0-autobuild
4163 WONTFIX     boost-1.33.1-autobuild
4164 WONTFIX     cppunit-1.10.2-autobuild
4165 WONTFIX     mtpaint-3.02-autobuild
4166 WONTFIX     groff-1.19.2-autobuild
4167 WONTFIX     fftwf-3.1.2-autobuild
4169 WONTFIX     qt-x11-free-3.3.7-autobuild
4170 WONTFIX     jack-0.103.0-autobuild
4173 WONTFIX     jikes-initial-1.0-autobuild
4175 WONTFIX     openmoko-dialer2-0.1.0+svnr3689-autobuild
4176 WONTFIX     Patch for Ruby 1.8.5 to compile with sockets
4177 WONTFIX     busybox-1.9.1-autobuild
4192 WONTFIX     avahi-0.6.22 fails to build
4287 WONTFIX     uclibc-0.9.29+svnr21926-autobuild
4289 WONTFIX     uclibc-initial-0.9.28-autobuild
4291 WONTFIX     madwifi-ng-r3314-20080131-autobuild
4295 WONTFIX     dsplink-1.50-autobuild
4297 WONTFIX     gcc-cross-4.2.1+csl-arm-2007q3-53-autobuild
4301 WONTFIX     klibc-1.5-autobuild
4306 WONTFIX     uclibc-0.9.28-autobuild
4311 WONTFIX     dsplink-1.50+kernel2.6.25-davinci1-autobuild
4315 WONTFIX     dsplink-1.50+kernel2.6.24-omap1-autobuild
4416 WONTFIX     qtopia-core-4.3.3-autobuild
4420 WONTFIX     meta-toolchain-neuros-1.0-autobuild
4480 WONTFIX
x-load-1.41+r6+git04ad40d5c8bca196aa4a5dfe945a007e21f1b149-autobuild
4484 WONTFIX     firefox-3.0.1-autobuild
4601 WONTFIX     shasum-native-1.0-autobuild
4604 WONTFIX     osb-jscore-0.5.2+svnr117-autobuild
4605 WONTFIX     minimo-0.02+cvs20070626-autobuild
4606 WONTFIX     apache2-native-2.2.3-autobuild
4608 WONTFIX     gpe-sketchbook-0.2.9-autobuild
4609 WONTFIX     notecase-1.7.2-autobuild
4610 WONTFIX     irssi-0.8.10-autobuild
4612 WONTFIX     liburi-perl-1.35-autobuild
4613 WONTFIX     totem-2.23.4-autobuild
4614 WONTFIX     quasar-0.8+0.9beta3-autobuild
4615 WONTFIX     vlc-gpe-0.8.4-autobuild
4616 WONTFIX     gnome-mplayer-0.5.3+cvs20080101-autobuild
4617 WONTFIX     kismet-2007-10-R1-autobuild
4618 WONTFIX     scummvm-0.12.0-autobuild
4619 WONTFIX     ctorrent-3.3.1-autobuild
4621 WONTFIX     gnuradio-3.1.3-autobuild
4622 WONTFIX     gtkimageview-1.3.0-autobuild
4623 WONTFIX     xf86-video-ati-6.6.193-autobuild
4625 WONTFIX     openmoko-terminal2-3.0.0+svnr4039-autobuild
4627 WONTFIX     bonnie++-1.03c-autobuild
4628 WONTFIX
packagekit-0.2.3+gitr813fa8cfb139246cf180d52895b52b28616ae2f5-autobuild
4629 WONTFIX     libspiff-0.8.2-autobuild
4631 WONTFIX     mono-1.2.6-autobuild
4632 WONTFIX     webkit-gtk-0.1+svnr36540-autobuild
4633 WONTFIX     firefox-3.0.1+3.1a2-autobuild
4634 WONTFIX     fennec-0.8+0.9pre-autobuild
4636 WONTFIX     apache2-2.2.3-autobuild
4637 WONTFIX     roadmap-gtk2-1.1.0-autobuild
4638 WONTFIX     gst-ffmpeg-0.10.4-autobuild
4639 WONTFIX     rdesktop-1.6.0-autobuild
4640 WONTFIX     xf86-video-vesa-1.3.0-autobuild
4641 WONTFIX     qte-mt-2.3.10-autobuild
4642 WONTFIX     enca-1.9-autobuild
4643 WONTFIX     guile-1.8.5-autobuild
4644 WONTFIX     opencv-1.0.0-autobuild
4645 WONTFIX     classpath-native-0.97.2-autobuild
4646 WONTFIX     qt4-x11-free-4.4.1-autobuild
4647 WONTFIX     enchant-1.3.0-autobuild
4649 WONTFIX     libusb-0.1.12-autobuild
4650 WONTFIX     libwww-perl-5.808-autobuild
4651 WONTFIX     imagemagick-6.4.4-1-autobuild
4652 WONTFIX     libgnomeprintui-2.18.3-autobuild
4653 WONTFIX     evince-2.23.4-autobuild
4654 WONTFIX     libsidplay-1.36.59-autobuild
4655 WONTFIX
zhone-0.0.0+r9-gitr11392b1d2ee3a0622dc324e1805699e4301249c4-autobuild
4656 WONTFIX     lirc-modules-0.8.3+cvs20080713-autobuild
4657 WONTFIX     ioquake3-1.34+svnr1470-autobuild
4658 WONTFIX     quake2-0.16.1+svnr205-autobuild
4662 WONTFIX     libnids-1.18-autobuild
4663 WONTFIX     libxine-fb-1.0-autobuild
4665 WONTFIX     madwifi-ng-r3837-20080802-autobuild
4666 WONTFIX     exiv2-0.15-autobuild
4667 WONTFIX     cacao-0.99.3-autobuild
4670 WONTFIX     mplayer-0.0+1.0rc2-autobuild
4673 WONTFIX     gettext-native-0.17-autobuild
4674 WONTFIX     e2fsprogs-libs-1.41.2-autobuild
4675 WONTFIX     agg-2.5-autobuild
4676 WONTFIX     navit-0.0.4-autobuild
4677 WONTFIX     speech-dispatcher-0.6.6-autobuild
4678 WONTFIX     gst-plugins-good-0.10.7-autobuild
4679 WONTFIX     libetpan-0.52-autobuild
4680 WONTFIX     konqueror-embedded-20070316-autobuild
4681 WONTFIX     ubahnnav-0.4.1-autobuild
4682 WONTFIX     zuc-1.1.2ern-autobuild
4683 WONTFIX     zauralign-1.0.2-autobuild
4684 WONTFIX     uucp-1.07-autobuild
4685 WONTFIX     gst-plugins-ugly-0.10.7-autobuild
4689 WONTFIX     gnuplot-4.2.3-autobuild
4690 WONTFIX     obexftp-0.22-autobuild
4691 WONTFIX     libmodplug-0.8-autobuild
4692 WONTFIX     multitap-pad-0.0+svnr373-autobuild
4693 WONTFIX     bash-3.2-autobuild
4694 WONTFIX     openmoko-appmanager2-0.1.0+svnr4530-autobuild
4695 WONTFIX     openmoko-tasks2-0.1.0+svnr399-autobuild
4696 WONTFIX     gnome-panel-2.24.0-autobuild
4697 WONTFIX     gst-plugins-bad-0.10.6-autobuild
4698 WONTFIX     goffice-0.6.3-autobuild
4700 WONTFIX     gpgme-1.1.4-autobuild
4701 WONTFIX     liburiparser-0.5.1-autobuild
4702 WONTFIX     libxxf86dga-1.0.2-autobuild
4703 WONTFIX     mythtv-0.21-autobuild
4705 WONTFIX     recode-3.6-autobuild
4706 WONTFIX     recode-native-3.6-autobuild
4729 WONTFIX     gpe-mini-browser-0.21-autobuild
4730 WONTFIX     gtk+-1.2-1.2.10-autobuild
4734 WONTFIX     hal-0.5.11-autobuild
4736 WONTFIX     sword-1.5.10-autobuild
4737 WONTFIX     libtelepathy-0.3.3-autobuild
4738 WONTFIX     python-numpy-1.1.1-autobuild
4739 WONTFIX     vlc-0.9.2-autobuild
4741 WONTFIX     gnome-desktop-2.24.0-autobuild
4742 WONTFIX     t1lib-5.0.2-autobuild
4744 WONTFIX     xserver-kdrive-xomap-1.1.99.3-autobuild
4751 WONTFIX     opkg-0.1.4+svnr4640-autobuild
4754 WONTFIX     fennec-0.9+1.0a1-autobuild
4756 WONTFIX     gdal-1.5.2-autobuild
4767 WONTFIX     opkg-nogpg-0.1.4+svnr4640-autobuild
4769 WONTFIX     gcc-cross-initial-4.3.1-autobuild
4770 WONTFIX     vlc-0.9.4-autobuild
4771 WONTFIX     libgsm-1.0.10-autobuild
4773 WONTFIX     Apache2 failed to build
4775 WONTFIX     sylpheed-2.2.9-autobuild
4776 WONTFIX     icu-3.6-autobuild
4777 WONTFIX     libx11-native-1.1.1-autobuild
4778 WONTFIX     empathy-2.24.0-autobuild
4779 WONTFIX     exo-0.3.4-autobuild
4780 WONTFIX     findutils-4.2.29-autobuild
4781 WONTFIX     gimp-2.6.0-autobuild
4785 WONTFIX     nmap-3.81-autobuild
4786 WONTFIX     xfce4-mixer-4.4.2-autobuild
4793 WONTFIX     openmoko-browser2-0.0.1+svnr4172-autobuild
4794 WONTFIX     python-pyxdg-0.15-autobuild
4795 WONTFIX     libowl-0.0+svnr277-autobuild
4796 WONTFIX     emotion-0.1.0+svnr36540-autobuild
4801 WONTFIX     aspell-0.60.6-autobuild
4803 WONTFIX     libxkbfile-1.0.4-autobuild
4806 WONTFIX
ffmpeg-0.4.9+r35+gitrafb98868e19e63cbca6c9f0ed9e6cfa48d40277d-autobuild
4807 WONTFIX     libxfce4util-4.4.2-autobuild
4809 WONTFIX     portmap-6.0-autobuild
4810 WONTFIX     mpeg2dec-0.4.0b-autobuild
4811 WONTFIX     directfb-1.2.3-autobuild
4812 WONTFIX     wpa-supplicant-0.5.10-autobuild
4813 WONTFIX     gamin-0.1.8-autobuild
4815 WONTFIX     wireless-tools-29-autobuild
4816 WONTFIX     keylaunch-conf-2.0.10-autobuild
4817 WONTFIX
linux-omap-2.6.27+2.6.28-rc3+r1+gitrf7429fd378a29cf6947c2613e0fd6e6e3616516=
7-autobuild
4818 WONTFIX     mtd-utils-native-1.0.0+git-autobuild
4819 WONTFIX     xf86-input-tslib-0.0.5-autobuild
4820 WONTFIX     opkg-native-0.1.4+svnr4755-autobuild
4821 WONTFIX     beagleboard-demo-image-1.0-autobuild
4823 WONTFIX     gail-1.20.0-autobuild
4824 WONTFIX     gnome-keyring-2.20.0-autobuild
4825 WONTFIX     libgtop-2.24.0-autobuild
4826 WONTFIX     qt-x11-free-3.3.7-autobuild
4830 WONTFIX     neon-0.25.5-autobuild
4836 WONTFIX     madplay-0.15.2b-autobuild
4837 WONTFIX     dfu-util-0.1+svnr4160-autobuild
4838 WONTFIX     viking-0.9.6-autobuild
4839 WONTFIX     wpa-gui-0.6.4-autobuild
4842 WONTFIX     sylpheed-2.5.0-autobuild
4844 WONTFIX     apr-1.2.12-autobuild
4845 WONTFIX     libhildonfm-1.9.46-autobuild
4848 WONTFIX     firefox-3.0.4-autobuild
4850 WONTFIX     xserver-xorg-1.5.3-autobuild
4851 WONTFIX     libosso-2.13-autobuild
4852 WONTFIX     libxt-1.0.5-autobuild
4855 WONTFIX     libtorrent-0.12.3-autobuild
4856 WONTFIX     xapian-core-1.0.7-autobuild
4862 WONTFIX     ffmpeg-0.4.9-pre1-autobuild
4863 WONTFIX     exhibit-0.1.1+svnr37395-autobuild
4865 WONTFIX     moko-gtk-engine-0.1.0+svnr4734-autobuild
4866 WONTFIX     vte-0.16.13-autobuild
4867 WONTFIX     gst-plugin-pulse-0.9.7-autobuild
4868 WONTFIX     ooo-build-2.4.1.5-autobuild
4869 WONTFIX     libpam-1.0.2-autobuild
4870 WONTFIX     libmailwrapper-1.2.4-autobuild
4875 WONTFIX     claws-plugin-rssyl-0.18-autobuild
4876 WONTFIX     claws-plugin-mailmbox-1.14-autobuild
4879 WONTFIX     edbus-0.5.0.043+svnr37395-autobuild
4880 WONTFIX     numptyphysics-0.2+svnr109-autobuild
4881 WONTFIX     starling-0.2+svnr9574-autobuild
4882 WONTFIX     angstrom-version-2008.1-test-20081129-autobuild
4883 WONTFIX     gnuplot-4.2.4-autobuild
4884 WONTFIX     gspcav1-20071224-autobuild
4885 WONTFIX     jack-0.103.0-autobuild
4887 WONTFIX     octave-3.0.3-autobuild
4888 WONTFIX     opencv-1.0.0+cvs20081115-autobuild
4889 WONTFIX     povray-3.6.1+3.7.0-beta25b-autobuild
4890 WONTFIX     vlc-0.9.6-autobuild
4892 WONTFIX     epiphany-2.24.0-autobuild
4893 WONTFIX     gcc-cross-sdk-4.2.4-autobuild
4895 WONTFIX     cppunit-1.10.2-autobuild
4898 WONTFIX     openssh-4.6p1-autobuild
4899 WONTFIX     sugar-presence-service-0.82.2-autobuild
4900 WONTFIX     efreet-0.5.0.043+svnr37395-autobuild
4901 WONTFIX     osso-gnome-vfs2-2.16.3-autobuild
4902 WONTFIX     epsilon-0.3.0.012+svnr37395-autobuild
4909 WONTFIX     libhildon-1.99.0-autobuild
4910 WONTFIX     thunar-0.9.0-autobuild
4912 WONTFIX     xfdesktop-4.4.2-autobuild
4919 WONTFIX     artoolkit-2.72.1-autobuild
4923 WONTFIX     boost-1.33.1-autobuild
4924 WONTFIX     sugar-toolkit-0.82.11-autobuild
4925 WONTFIX     flac-1.1.2-autobuild
4926 WONTFIX     xinit-1.1.0-autobuild
4927 WONTFIX     libfakekey-0.2+svnr1455-autobuild
4928 WONTFIX     openmoko-today2-0.1.0+svnr4168-autobuild
4929 WONTFIX     matchbox-panel-2-0.1+svnr1626-autobuild
4930 WONTFIX     dropbear-0.51-autobuild
4931 WONTFIX     xmodmap-1.0.3-autobuild
4932 WONTFIX     openmoko-icon-theme-standard2-0.1.0+svnr4232-autobuild
4933 WONTFIX     opie-mailapplet-1.2.4-autobuild
4934 WONTFIX     neod-0.1.0+svnr4617-autobuild
4940 WONTFIX
ffmpeg-0.4.9+r36+gitr48b4495cdae4a4bc2bc65902f3214c1b084be01d-autobuild
4941 WONTFIX     gdm-2.24.1-autobuild
5024 WORKSFORME  bitbake fails with too many open files
490 FIXED        tosa screen corruption (vertical yellow/blue lines)
3315 WONTFIX     gpe-conf xxx does not work (akita)
4228 WONTFIX     various likely targets for backporting
4231 WONTFIX     org.openembedded.stable: gconf-dbus_svn.bb do_fetch &
do_compile fail (bp)
4243 FIXED       twisted_2.5.0.bb creates empty packages
4275 FIXED       modphp fails to build
4320 WONTFIX     sablevm_1.12.bb and sablevm-classpath_1.12.bb do_fetch fai=
lure
4324 WONTFIX     flash issues with LAB
4334 WONTFIX     dbus-native compilation fails
4338 WONTFIX     reboot doesn't reboot h2210 ipaq
4342 WONTFIX     Default kernel for HTC Universal does not start
4354 WONTFIX     mtd-utils don't work on h2200 ipaq
4362 WONTFIX     flash_eraseall gives segfault
4363 WONTFIX     matchbox-applet-card broken with 2.6 kernel
4367 WONTFIX     lib links end up in dev pkg when they shouldn't for navit
4404 WONTFIX     kernel-arch.bbclass and kernel.bbclass doesn't care
about kernels >=3D 2.6.24
4410 WONTFIX     rootfs fails in ipkg.py in Fedora 9
4455 WONTFIX     wpa-supplicant cant be run on-demend by dbus
4465 WONTFIX     missing libgsmd: error during bitbake x11-image on Ubuntu =
8.04
4486 WONTFIX     ecj-initial_3.3.bb can't remove build.xml
4513 WONTFIX     gcc-4.1.2 cannot build for efika/ppc603e
4518 FIXED       New bb for libsdl-pango
4519 FIXED       new recipe for tuxtype
4535 WONTFIX     glibc-intermediate-2.6.1 build fails on powerpc
4546 WONTFIX     DNS server setting gets lost
4547 WONTFIX     Bluetooth: Second and subsequent networking connections fa=
il
4564 WONTFIX     Please backport fbreader.bb from dev to stable
4593 WONTFIX     building uClibc fails when USE_NLS is set to yes
4668 WONTFIX     IndexError
4672 FIXED       entrance_0.9.0.010.bb do_install failed
4768 WONTFIX     gpe-calendar alarms do not wake a suspended system
4860 WONTFIX     FFTW 3.1.2 fails to fetch sources
4871 WONTFIX     libxml does not build with Ubuntu Intrepid
4904 WONTFIX     bitbake base-image fails on libtool-native
4920 WONTFIX     glibc-2.3.6 requires ld.so.conf
4942 FIXED       php-5.2.6 fails to configure
4948 WONTFIX     openwrt-sdk.conf points to generic-uclibc.conf which
doesn't exist
4956 WONTFIX     gcc-native-3.4.4 build failed on Ubuntu Intrepid
4957 WONTFIX     qemu-native-0.9.1 build failed on recent Linux distro
4959 WONTFIX     HX4700: Bluetooth PXA270 BTUART BRF6150 patch
4963 WONTFIX     package.bbclass - uncaught exception from os.stat()
on symbolic link
5004 WONTFIX     generated totally unusable rootfs
5018 WONTFIX     angstrom-2007.12: configure step for
libtool-native-1.5.10-r9 failed - wrong option for autoreconf
5020 INVALID     bluez (bluez4-4.29-r2) fails to build
5029 INVALID     All bugzilla changes have me as an assignee
429 FIXED        new bb files for gnuchess and libfltk based frontend fltk-=
chess

Bugs opened:

bug_id resolution        short_desc
5030     klibc-1.5 build failed


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


