Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L4eHi-0002ha-VY
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 17:27:44 +0100
Received: by rv-out-0708.google.com with SMTP id f25so2719415rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 08:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=xUkVCuDih6hApxmsNQIyPGoC9ylq64aKopIc9PND8Z4=;
	b=HjsQ63louixQUi2TA4vYTB0gjlMBpD2Ja8pjozAag2o2S/WjrWRnG+9sb+P9HiWAKD
	X+J3AgEhoRet7OHV9bkn/mjTDd143vuAKnbQVxs/i7MVxnwD4eecgO4yB5W3/XpQOT23
	yXS+7OFY52fcflJDXpc105NO6G8w384MIV0Mo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=nnVw02cBZBrRSACqmAHa35Blypt+egiMaLN330xzAWMTxCj+yWZGlWP+TX2dNMXZJM
	hXTWY1ARf1it5t5Wbf/6l0bWYgtZdECHWtdbeN0259THzzEN4sOhiOkkHDI77CVO3UQw
	YnOQ72/wbWup2SCGZF+EZ/HI5Wx9JAP2ch2Qo=
Received: by 10.140.166.21 with SMTP id o21mr1949812rve.121.1227543886419;
	Mon, 24 Nov 2008 08:24:46 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Mon, 24 Nov 2008 08:24:46 -0800 (PST)
Message-ID: <f96d234e0811240824u4984c3c7o436bd000309dd89d@mail.gmail.com>
Date: Mon, 24 Nov 2008 11:24:46 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-11-17 to 2008-11-24
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
X-List-Received-Date: Mon, 24 Nov 2008 16:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-11-17 to 2008-11-24

Bernie Innocenti (5):
      Initial sucrose build
      sugar: make sugar-toolkit depend on alsa-lib
      sugar: add missing dependency to hippo-canvas
      sugar: rdepend on sugar-datastore and gnome-python-desktop
      rootfs_ipk: avoid matching spurious errors

Carsten Haitzler (Raster (6):
      e-wm: fix package to include AUTHORS and COPYING
      elementary-alarm: UI for alarm settings based on elementary
      exquisite-theme-illume: new recipe; illume-theme for exquisite
      illume-image: disable prelink. very slow first boot.
      illume-image: add some packages
      xserver-kdrive-common: provide xserver ppm splash support for palmt65=
0

Chris Larson (6):
      tslib: refactor into .inc
      tslib: add svn version
      base.bbclass: Add distclean task to clean a package w/ its fetched so=
urces
      base.bbclass: Fix up disclean and clean up its exception handling
      base.bbclass: fix a syntax error in one of distclean's exception hand=
lers

Daniel Willmann (2):
      xserver-kdrive-glamo: Factor out a package xserver-security-policy so
      frameworkd: Use ti_calypso_deep_sleep =3D never by default for GTA0{1=
,2}

Denys Dmytriyenko (5):
      git: move version specific git-gui-install-mode-arg-spaces.patch from=
 .inc
      git: add version 1.6.0.4
      git: fix configure failing on snprintf-returns-bogus check when
cross-compiling
      fbida 2.07: fix do_compile and do_install as it's not autotools based
      git-1.5.2.3: remove mistakenly added patch from 1.5.3

Dmitry Baryshkov (1):
      linux-rp-2.6.24: fix tosa kernel

Gregoire Gentil (1):
      mplayer svn: add vo_omapfb for the overlay found in omap2/omap3 chips

Holger Hans Peter Freyther (6):
      insane.bbclass: Optimisation to speed up the package qa phase
      fso-gpsd: Do not RREPLACE gpsd as of
https://docs.openmoko.org/trac/ticket/2124
      Revert "u-boot-openmoko: Remove AUTHOR line, this was meant to
be the recipe author line"
      netkit-telnet: Add a telnet package...
      task-openmoko-feed: Add netkit-telnet to the feed
      task-openmoko-feed: Add wmiconfig to the feed too

Jeremy Lain=E9 (7):
      dnsmasq: update to version 2.46
      u-boot: refresh patches for mpc8313e-rdb
      boc01: add machine configuration file for boc01 prototype
      u-boot: add initial support for boc01 machine
      u-boot: cleanup boc01 patch for TSEC
      linux-2.6.26: add stub for boc01 machine

Julian_chu (1):
      python-pygame 1.8.1: fix jpeg linking

Khem Raj (4):
      sane-srcrevs: Bump eglibc and uclibc to new sane svn revisions
      uclibc-svn: Enable log2_test in uclibc testsuite
      uclibc-svn: Port hash_style patch from 0.9.30
      gcc-configure-sdk.inc: Change gxx-include path being passed

Koen Kooi (112):
      e-uae: fix build
      mesa 7.x: enable GLU, qt3-x11 needs it
      linux-omap git: add patch to stop zero pixclocks getting propagated
      angstrom feed builder: add e-uae
      scummvm: add missing enterprise parenthese
      scummvm: update to 0.12.0
      checksums.ini: add module-init-tools 3.4
      module-init-tools: update to 3.4
      linux-omap git: actually apply patch
      angstrom x11vnc xinit: add xinit script to export your x session
over VNC - TOTALLY INSECURE -
      linux omap git: fix colour problem on omap3evm with dss2
      sugar-image: remove x11-image remnants
      checksums: add sugar stuff
      angstrom feed builder: clean python-native as well
      opencv-samples: bump PR
      angstrom feed builder: pygtk contains paths to staging, so clean
it between builds
      opencv-samples: fix packages and ldflags
      angstrom 2008: also specify binutils version
      gcc csl 2008q3: add fix for
http://hardwarebug.org/2008/10/11/codesourcery-gcc-2008q3-fail/
      qt4-x11: split PRs are frowned upon in OE, so let's bump to r11 inste=
ad
      gcc 4.3.1: mangle gfortran.patch to work on 64bit hosts as well
      angstrom feed builder: add octave
      octave: add 3.0.3
      module-init-tools: not all people have a working docbook2man
(debian has), so disable man page generation
      gcc-csl-arm-2008q3: rediff gcc-flags-for-build.patch and
gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
      gcc-csl-arm-2008q3: rediff
gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch, apply gfortran patch
      gcc-csl-arm-2008q3: rename gfortran patch to avoid FILESDIR clashes
      octave 3.0.3: adjust packaging so that octave actually starts
      checksums.ini: add git 1.6.0.4
      angstrom feed builder: add meta-toolchain
      gcc: update gfortran.patch for all versions
      firefox 3.0.4: def pref -1 due to missing patch
      task-sdk-sbox: switch to opkg
      nautilus: update to 2.24.1
      angstrom-gnome-icon-theme-enable: meta-package to enable
gnome-icon-theme in gtkrc
      beagleboard-demo-image: use angstrom-gnome-icon-theme-enable
      angstrom feed builder: add povray
      opencv: fix pythonpath
      mesa 7.2: install internal headers like 7.0.2 did, xorg 1.5.x
needs them, also enable swrast next to proper GL drivers
      fftw: upgrade to 3.2 release from 3.2alpha3
      iputils: make ${PN} a meta package depending on all sub utils
      angstrom feed builder: add nautilus
      nautilus: prefer shared-mime-info data over the one from nautilus
      etoys: use mime info from shared-mime-info
      angstrom feed builder: also clean packages during machine specific bu=
ilds
      u-boot git: update omap3 srcrevs, groups srcrevs, pv and machine
to make this mess a bit easier to understand
      beagleboard,omap3evm: set UBOOT_MACHINE
      u-boot: UBOOT_MACHINE belongs in the machine file, not in the uboot r=
ecipe
      libxt: fix build when host and target endiannes don't match
      module.bbclass: also supply KDIR, some projects use that to get
to the kernel source
      dsplink: add a dsplink-module recipe that uses Kbuild to build a
kernel module
      dsplink-module: bump PR for buildsystem change
      angstrom image builder: only do uclibc for the old-style initramfs st=
uff
      gumstix: remove package extra archs
      dsplink: remove damage done by git
      mesa: reinstate granular packaging that got lost in poky merge
      metacity: add 2.24
      libtasn1: add 1.7
      gnutls: stage more stuff
      gnome-keyring: add 2.24.1
      libtasn1: use binconfig
      gnutls: don't stage libs with autotools_stage_all, gnutls has a
broken autofoo
      gnome-session: add 2.24.1
      angstrom feed builder: add i2c-tools and read-edid
      gspcav1: update to 20071224
      angstrom feed builder: add gspcav1
      angstrom: prefer fontconfig 2.6.0
      gdm: add 2.24.1
      angstrom feed builder: add metacity and gdm
      libxklavier: add 3.7
      libxklavier: LGPL, not GPL
      libxklavier: stage more that the .pc file
      libgnomekbd: add 2.24
      net-tools: use u-a for tools
      xf86-video-omapfb: bump SRCREV for modesetting fix
      libcanberra: add 0.10
      gnome-settings-daemon: add 2.24
      gnome-control-center: add 2.24.0
      debianutils: make it use u-a
      mime.bbclass: new class that detects if an package install a
file in /usr/share/mime/applications/ and adds the appropriate
postinst/prerm magic
      gnome-control-center: update to use mime.bbclass
      nautilus: update to use mime.bbclass
      bluez-gnome 0.26: update to use mime.bbclass
      rox-files: update to use mime.bbclass
      kde4.inc: update to use mime.bbclass
      sugar*: update to use mime.bbclass
      beagleboard demo image: add e-wm-config-standard, e-wm-config-default
      beagleboard demo image: fix parse error
      udumpty image: WIP image to mimic a well known gnome-desktop
      beagleboard demo image: fix typo
      udumpty-image: add gnome-session
      udumpty-image: add back a \
      gnome-control-center: add eel to DEPENDS
      metacity: bump u-a priority to take precedence over mb-wm and mb-comm=
on
      clutter: add beagleboard OpenGL ES support
      clutter: switch beagle to GLES2
      sane-srcrevs: add table
      Revert "busybox: Disable busybox shadow support for Angstrom"
      swfdec-*: update to 0.9.2
      swfdec: also depends on gst-plugins-base, as pointed out by the
mighty Marcin
      linux-omap git: update to 2.6.28rc6, remove patches that were applied
      libarchive-zip-perl: add 1.26
      linux-eten: fix versioning
      kernel.bbclass: stage more headers for the .27 header move
      mplayer svn: make omapfb armv7a specific, since it contains
armv7a and NEON assembler which makes gcc choke on non armv7a
platforms
      netkit-telnet: use u-a so it doesn't conflict with busybox:

Leon Woestenberg (1):
      linux-2.6.26: Set as default kernel for AMCC460EX Canyonlands.

Michael 'Mickey' Lauer (27):
      sip-native: add version 4.7.8
      python-sip: refactor to .inc and add 4.7.8 - thanks Erin Yueh.
      sip-native: promote 4.7.7 as default, 4.7.8 is incompatible w/
PyQt 4.4.3 *sigh*
      python-pyqt: update to python-pyqt 4.4.3; patch courtesy Erin Yueh
      qt4-x11-free.inc: enable building webkit
      python-pyqt 4.3.3: remove in favour of 4.4.x
      gst-plugins-ugly-sid: new; A patent-free version of gst-plugins-ugly
      gst-plugins-ugly: bring back sid-patch
      gst-plugins-ugly: skip package for ENTERPRISE_DISTRO =3D 1
      fso-[illume-]image: bring back gst-plugin-sid from the
ENTERPRISE_DISTRO nirvana :)
      gst-plugins-ugly-sid 0.10.7: don't include gst-plugins-ugly,
otherwise we might already be skipped ;)
      enterprise.conf: remove uncritical packages and solve the *ugly*
part by skipping the packages directly from the recipes
      pidgin: [cosmetic] improve indentation for clarity
      wmiconfig: new recipe; configuration utility for atheros wifi chipset=
s
      xserver-kdrive-[splash|common]: refactor splash images into a
seperate recipe -- patch courtesy Rasterman
      python-efl: eina is the new base library, factor the dependency
into the .inc file
      elementary: new recipe; mobile-oriented toolkit based on EFL
      xserver-kdrive-splash-illume: new recipe; illume-splash for xserver-k=
drive
      openmoko-terminal2: remove dead project; has been superseded by
vala-terminal
      gst-plugins-ugly-sid: add RDEPENDS as a quick bandaid for
problem w/ missing ldso dependencies
      gst-plugins-ugly-sid: revert last commit
      illume-image: new recipe. Rasterman's own illume-image (WIP,
needs refactoring)
      python-pygtk 2.10.4: link to pygobject-codegen-2.0 until we have
updated our pygobject-native
      fsod: make it build with python support
      epsilon: ship thumb daemon in a seperate package, it's not a test
      a910.conf: new machine configuration for the Motorola EZX A910
      openezx-kernel: add current git kernel from openezx project

Otavio Salvador (12):
      firefox: add 3.0.4
      firefox 3.0.4: disable striping and updater
      checksums.ini: add firefox 3.0.4
      geodelx: include x86 tune to set the arch for i486 or glibc fails to =
build
      glibc-package: use qemu-i386 when building for i486 architecture
      xorg-xserver-common.inc: depends on libxv due xephyr new package
      xorg-xserver-common.inc: disable xfbdev, xnest and kdrive-vesa
      checksums.ini: fix rpm2cpio checksums
      openrdate: include Debian patches to properly support NTP protocol
      geodelx: set glibc options (nptl addon and use tls)
      geodegx: set architecture to i486 and glibc addons
      firefox 3.0.4: use /usr/lib/mozilla/plugins to load plugins

Paul Eggleton (8):
      shopper: install data file to palmtopdir/share instead of homedir
      tickypip: fix fetching and path issues
      checksums.ini: update tickypip checksums
      zipsc: fix do_install
      puzz-le: fix do_install
      zmerlin: fix do_install
      cumulus: fix do_compile and do_install
      subapplet: fix do_install

Robert Schuster (1):
      classpath-initial 0.93: Explicitly disable -Werror behavior.

Stefan Schmidt (12):
      magician.conf: Remove PACKAGE_EXTRA_ARCHS to ubreak build
      eten-m800: Basic machine support
      eten-m800.conf: Autoload g_ether for now
      linux-eten: Set default CMDLINE to boot from SD
      fontconfig: Use /var/lib/fontconfig for the cache as this is no tmpfs
      illume-image: Add rxvt-unicode and gpe-terminal
      sane-srcrev: Bump EFL_SRCREV
      openmoko/Xserver: Entry for eten-800
      Xserver: Bring in Treo 650, M800 and chumby from openmoko/Xserver.
      xserver-kdrive-common: Bump PR for new machines
      linux-eten: Moved to own git repo.

Steffen Sledz (3):
      oxe810.conf: New machine configuration.
      linux 2.6.24: Make use of oxe810 patch.
      busybox: Disable busybox shadow support for Angstrom

Steve Sakoman (4):
      e-wm: modify applications.menu so that Games menu item contains
apps with either "Game" or "Games" as the Category, and Internet
contains apps with either "Internet" or "Network"
      xmms: update desktop file - Categories setting was absent, now
set to AudioVideo
      gnome-mplayer: remove "OnlyShowIn=3DGNOME" from .desktop file so that=
 icon
      gimp: don't use headers from /usr/include, don't attempt to
build file-wmf since we don't have libwmf

Thomas Kunze (1):
      build linux-kexecboot for supported machines

woglinde (2):
      minimal-uclibc.conf: set the virtual/libintl hard to proxy-libintl
      uclibc-0.9.30: add ldso_hash.patch for avr32 too

Bugs fixed:

bug_id resolution        short_desc
4624 FIXED       opie-mediaplayer1-core-1.2.4-autobuild
3634 FIXED       Smallscreen mod for GtkFileChooser
4015 DUPLICATE   dsniff-2.3-autobuild
4849 FIXED       git-1.6.0.4-autobuild
4507 FIXED       proposed recipe for ipython
4707 FIXED       Got fbi (frame buffer image viewer) working
4808 FIXED       busybox passwd with shadow support
4827 FIXED       support for OXE810(D)SE board
4833 FIXED       AVR32 init segfaults signal 11
4835 FIXED       Proposal to update git/git-native
4859 FIXED       G++ in SDK is non-functional

Bugs opened:

bug_id resolution        short_desc
4857     Angstrom lacks support for switching between multiple
keyboard layouts (physical keyboards)


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


