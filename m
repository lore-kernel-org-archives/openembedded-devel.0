Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L24Qj-0002cg-Sc
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 14:46:20 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3133975rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=swMuYigShjP2wX+i0OEOIkvLtqv8/xHMbKeS6EqfUHQ=;
	b=C7DkjjIawk6DuqE31MTnIRUxrsLLliJiUFHlADamdJCw4OLWO6iwJM/Qdto4qh7ReJ
	pwHY/asMdDNVL2yEWHp2mfalMFM7gmTvBGTq6gRfkQfot6X2+NXHkZiGsw7o0Hho0c5e
	n/oX6tHU5leIgDoc5lUDEsURwaZRst17+IVpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=SFgH+7us6knbNmHf3p32BJfhv7+XSo2oBNx8oo9ZkYJAcs+LJFmG5f0+VxAJ4mJBor
	7NTk1ID6hwvxX5ldWfRe+KWe/yhSXY87PP1Bk2p7CEOBla2Cui3DD3Qe8qyi3PeJJG33
	RJR+pcN0sxHj/5uEgKrfP2OuiapMMpZqgoQ6w=
Received: by 10.141.43.5 with SMTP id v5mr2227890rvj.281.1226929437274;
	Mon, 17 Nov 2008 05:43:57 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Mon, 17 Nov 2008 05:43:57 -0800 (PST)
Message-ID: <f96d234e0811170543tb063db9i3e31e25312a995b0@mail.gmail.com>
Date: Mon, 17 Nov 2008 08:43:57 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-11-10 to 2008-11-17
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
X-List-Received-Date: Mon, 17 Nov 2008 13:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OE weekly changelog 2008-11-10 to 2008-11-17

Carsten Haitzler (2):
      ompower: Add ompower from Openmoko
      resolvconf: fix resolvconf to actually work and fix up
resolv.conf file properly by

Carsten Haitzler (Raster (10):
      Linux (Palm): Fix Linux kernel build so it actually works for palmt650
      netbase: provide a default network setup for palmt650 so usbnet works
      palm.inc: plam.inc machne conf need to remove EXTRA_PACKAGE_ARCHS
      sysvinit: add the openmoko upstream changes to use exquisite as splash
      exquisite: Fix the package so it actually can be a splash screen app
      edje: disable program cache as it uses a fair bit of ram
      e17+efl: update to match latest additions and changes upstream
      exquisitie: update initial timeout to wait for exquisite and the
total boot too
      e-wm: decrease e niceness to -10 to get all the cpu it wants/needs
      e-wm: fix nice level set for e

Daniel Willmann (9):
      xserver-kdrive-common: Update openmoko/Xserver script
      Prepare for FSO milestone4 release
      opkg_nogpg: Properly repair the damage by FSO people
      checksums.ini: Add checksums for vala-0.5.1
      frameworkd-devel: Use FILESPATH of frameworkd
      frameworkd_devel: Use base_set_filespath for machine specific
subdirs in FILESPATH
      sane-srcrevs: Bump vala-terminal to working version
      fso-illume-image: Make fso-illume-image build with ENTERPRISE_DISTRO=1

Denys Dmytriyenko (2):
      autotools.bbclass: allow autotools_do_configure to accept
parameters and pass to oe_runconf
      hal: Find and use the right linux/input.h to work with external toolchain

Dmitry Baryshkov (26):
      opie-cardapplet: add 1.2.4 version recipe
      libmailwrapper: add 1.2.4 version recipe
      task-sdk-opie: correctly select qte or qte-mt
      meta-toolchain-opie: add Opie SDK package
      checksums.ini: add few more checksums
      checksums.ini: update the checksum for libchenabler-0.1
      checksums.ini: update the checksum for libmsgenabler-1.0
      checksums.ini: update the checksum for lips_event-0.1
      checksums.ini: update the checksum for lips_im-0.2
      task-sdk-base: switch to newer pixman
      task-sdk-extra: use randrproto-dev instead of randrext-dev
      x11-sato-image: use correct package names instead of ttf-liberation
      gloox: fix gloox.pc in the staging
      libsvg-cairo: fix building with current libtool/autoconf
      linphone: fix building with current speex
      contacts: fix build error
      tasks: fix building with current libtool
      libgemwidget-1.0: fix build error
      src_distribute: update to reflect current bitbake
      dropbear: fix FTBFS
      add some stricter versions
      linux-rp-2.6.24: fix tosa kernel build
      libim: do actually bump the PR as the source has changed
      liblipsevent: do actually bump the PR as the source has changed
      libmsgenabler: do actually bump the PR as the source has changed
      libchenabler: do actually bump the PR as the source has changed

Elena ``of Valhalla'' Grandi (4):
      checksums.ini: added entry for gnuchess 5.05
      ipython 0.9.1: new recipe
      checksums.ini: added entry for ipython 0.9.1

Graeme Gregory (77):
      xf86-input-tslib_0.0.5.bb : add rotation handling patch from debian and
      rtorrent_0.8.3.bb : update to the latest unstable build
      om-gta02.conf : preliminary switch to xorg from Xglamo
      xwd_1.0.2.bb : new version for X11R7.4
      xwininfo_1.0.4.bb : new version for X11R7.4
      xserver-xorg_1.5.1.bb : new version for X11R7.4
      angstrom-2008.1.conf : move to using X11R7.4
      angstrom-2008-preferred-versions.inc : update xserver-xorg to 1.5.1 for
      checksums.ini : add some new checksums for X11R7.4 stuff
      preferred-xorg-versions-X11R7.4.inc : update some versions to be correct
      libx11_1.1.5.bb : add new version for X11R7.4, keysymdef patch had to be
      diet-x11_1.1.5.bb : new version for X11R7.4
      xf86-input-evdev_2.0.4.bb : new version for X11R7.4
      checksums.ini : add xinit checksum for X11R7.4
      om-gta02.conf : use tslib not evdev
      preferred-xorg-versions-X11R7.4.inc : update some more versions for 7.4
      xproto_7.0.13.bb, xproto-native_7.0.13.bb : new versions for X11R7.4
      libsm_1.1.0.bb : new version for X11R7.4
      libxft_2.1.13.bb : new version for X11R7.4
      libxrandr_1.2.3.bb : new version for X11R7.4
      libxxf86vm_1.0.2.bb : new version for X11R7.4
      xcursorgen-native_1.0.2.bb : add a native version for X11R7.4
      libxcursor-native_1.1.9.bb : add a native version for X11R7.4
      libxfixes-native_4.0.3.bb : add a native version for X11R7.4
      libxrender-native_0.9.4.bb : add a native version for X11R7.4
      fixesproto-native_4.0.bb : add native version for X11R7.4
      renderproto-native_0.9.3.bb : add native version for X11R7.4
      xcursor-themes_1.0.1.bb : needs xcursorgen-native which has now been
      checksums.ini : add more checksums for X11R7.4
      xorg-driver-common.inc : fix the header file detections now we are using
      xf86-input-joystick_1.3.2.bb : new version for X11R7.4
      xf86-input-synaptics_0.15.0.bb : new version for X11R7.4
      xf86-video-geode_2.10.1.bb : new version for X11R7.4
      xf86-video-glint_1.2.1.bb : new version for X11R7.4
      xf86-video-i128_1.3.1.bb : new version for X11R7.4
      checksums.ini : more new checksums for X11R7.4
      xorg-driver-common.inc : add an extra header to our autoconf workaround
      xf86-video-impact_0.2.0.bb : new version for X11R7.4
      xf86-video-intel_2.4.2.bb : new version for X11R7.4
      xf86-video-mach64_6.8.0.bb : new version for X11R7.4
      xf86-video-mga_1.4.9.bb : new version for X11R7.4
      xf86-video-nv_2.1.12.bb : new version for X11R7.4
      xf86-video-openchrome_0.2.903.bb : new version for X11R7.4
      xf86-video-r128_6.8.0.bb : new version for X11R7.4
      xf86-video-sunffb_1.2.0.bb : new version for X11R7.4
      xf86-video-sunleo_1.2.0.bb : new version for X11R7.4
      xf86-video-tga_1.2.0.bb : new version for X11R7.4
      xf86-video-vermilion_1.0.1.bb : new version for X11R7.4
      checksums.ini : more new checksums for X11R7.4
      xf86-video-vesa_2.0.0.bb : new version for X11R7.4 with some more
      xf86-video-vmware_10.16.5.bb : new version for X11R7.4
      xf86-video-wsfb_0.2.1.bb : new version for X11R7.4
      xf86-video-xgixp_1.7.99.3.bb : new version for X11R7.4
      checksums.ini : even more new checksums for X11R7.4
      libsm_1.1.0.bb : add e2fsprogs-libs to DEPENDS, needed for libuuid
      xserver-xorg_1.5.1.bb : add openssl to DEPENDS as its used for SHA
      om-gta02.conf : prefer xserver-xorg
      xf86-input-tslib_0.0.5.bb : needs to DEPEND on tslib
      xserver-common_1.22.bb : update with two xorg patches, one generic to
      xorg-xserver-common.inc : disable apm handling for Xorg on arm, it
      xserver-xorg_*.bb : remove duplicate EXTRA_OECONF entry that is already
      xserver-xorg_*.bb : bump PR for apm change
      xserver-xorg-conf_0.1.bb : split the xorg.conf out of xserver-xorg
      xserver-xorg/beagleboard/xorg.conf : forgot to move this into the new
      Revert "om-gta02.conf : prefer xserver-xorg"
      Revert "om-gta02.conf : use tslib not evdev"
      Revert "om-gta02.conf : preliminary switch to xorg from Xglamo"
      xserver-xorg_1.5.3.bb : xserver update to 1.5.3
      preferred-xorg-versions-X11R7.4.inc : add comment about mesa version
      angstrom-2008-preferred-versions.inc : dont hardcode xserver here
      preferred-xorg-versions-X11R7.4-updates.inc : add file to list updates
      angstrom-2008.1.conf : make use of the X11R7.4 updates file
      checksums.ini : forgot to sort after xserver-xorg commit
      openmoko-feed: add python-pygame
      openmoko-feed: add epdfview nice small pdf viewer
      [tasks/*asu*] merge in the asu feed

Holger Hans Peter Freyther (34):
      gstreamer_0.10.17: Work around glibc bug with dlopen
      debianutils_2.30: Add this version and make it default for openmoko
      task-openmoko-feed:  Add various full blown tools to escape from busybox
      task-openmoko-feed: Add a bunch of Xorg server side fonts
      libxfont-native: Do not provide xfont...
      enterprise: Blacklist ffmpeg and mplayer too
      gnash: Build without ffmpeg
      OpenMoko => Openmoko in u-boot-mkimage-openmoko-native, gsm, libmrss
      task-openmoko-feed: Put back the java stuff
      tasks: connman plugin packages got renamed, catch up
      tasks: Set PACKAGE_ARCH after inherit task
      task-openmoko-feed: Enable a bunch of packages again
      ompower: Ompower executes xset and needs to find the display
      sane-srcrevs.inc: Try to harmonize the  versions with Openmoko
      u-boot-openmoko: Remove AUTHOR line, this was meant to be the
recipe author line
      openmoko.conf: Add some post process foo to write a version hint
into the rootfs
      assass-thumbnail: No SRCPV yet, use SRCREV
      task-openmoko-asu: Make it buildable again by using task-x11-illume
      [om2007.2] Install a package which contains the default config
      task-openmoko-basic: Use task-x11-illume (like
task-openmoko-asu) install the asu theme afterwards
      task-openmoko-feed: Add a bunch of Xorg server side fonts
      tzdata: Write a default /etc/timezone, install a /etc/localtime
      packages: Fix PV naming of svn/git based recipes to have
+gitr/+svnr in the PV
      tasks-openmoko-feed: Add wget for werner
      task-openmoko-feed: Use task-proper-tools as pointed out by Koen
      gpsd: Only change gpsd-default for the om-gta02 machine

I-Fan, Chen (1):
      various Openmoko recipes: Adding alias name tags for packages

John Lee (9):
      openmoko-mediaplayer2: remove pulseaudio, use alsa instead.
      preferred-om-2008-versions.inc: update strace to 4.5.15 due to #1829.
      sane-srcrevs.inc: update to the latest stable kernel.
      illume-config: this package should not exist anymore.
      tzdata: add localtime in conffiles
      illume-theme-asu: change to svn and use asu config by default
      illume-theme-asu: fix install argument
      illume-theme-asu: add correct DEPENDS
      openmoko-sound-system2: make pulseaudio stops listening for TCP by default

Julian_chu (15):
      mplayer_0.0+1.0rc2.bb: Apply ENTERPRISE_DISTRO condition for mplayer
      mplayer_0.0+1.0rc2.bb: Apply ENTERPRISE_DISTRO condition for mplayer
      oprofile: Bump up preferred version of oprofile to 0.9.4 to
match current kernel version
      task-openmoko-debug.bb: Apply ENTERPRISE_DISTRO condition for madplay
      task-openmoko-feed: Add zhone into openmoko-feed
      task-openmoko-feed: Add frameworkd into openmoko-feed
      openmoko: Add openmoko-bare-image
      openmoko: Change the order of illume-theme in Openmoko Bare Image.
      openmoko: Change name of image from openmoko-bare to openmoko-base
      openmoko: Add illume-theme-illume to task-openmoko-basic
      [icecc.bbclass] Add connman into blacklist
      [mokoko] Add mokoko recipe
      [illume-theme] Modify illume-theme-asu.bb
      gpsd: Modify gpsd daemon script to use start-stop-daemon
      [gpsd] change gpsd device file from /dev/ttyS3 to /dev/ttySAC1

Julien Cassignol (1):
      numptyphysics: Update to rev 109, add some patches

Koen Kooi (63):
      feedbrowser: remove bogus check so the db will get created and
fix SQL to get the feeds created
      xserver xorg: simplify omap3evm xorg.conf, HAL handles most of
the input stuff nowadays
      xf86-input-tslib: add patch to make detection using HAL work
instead of hardcoding /dev/event0
      xserver-xorg: remove touchscreen section from omap3evm xorg.conf
now that everything gets detected automagically
      linux-omap git: update DSS2 patches and attempt to fix ASoC
      opkg nogpg: attempt to repair damage by FSO people, it should build
      angstrom feed builder: s/ctorrent/rtorrent/
      xf86-video-omapfb: bump SRCREV to attempt to fix init with 24bit displays
      opencv: disable GTK+ since it isn't present in DEPENDS
      avahi: add 0.6.23, a bigfix release for 0.6.22
      checksums.ini: add xinit 1.1.0
      gnome-games: make ${PN} RDEPENDS on all subgames, this fixes the
upgrade path
      libatomics-ops: turn of thumb
      linux-omap git: update DSS2 patches
      angstrom 2008: start using binutils 2.19
      qt4 arch.inc: ARM_INSTRUCTION_SET = "arm"
      xf86-video-omapfb: bump PR for XORG ABI bump
      angstrom feed builder: add xserver-xorg-conf to machine specific section
      checksums.ini: add gnome-games 2.25.1 and codec-engine 2.21
      linux-omap git: add DSS2 patch for omap3evm
      codec-engine, dsplink: start updating it to the upcoming 2.21 release
      angstrom: switch armv4t to thumb as per RFC on angstrom-devel
      linux omap git: bump to 2.6.28rc4, fix evm dss2 patch for upstream changes
      angstrom 2008: while binutils 2.19 works fine on some platforms
it breaks thumb, so switch back to 2.18.something
      binutils 2.18.50.0.7: bump PR to force rebuild
      linux-omap git: update DSS2 patches, fix mmc
      mplayer: ARM_INSTRUCTION_SET = "ARM"
      empathy: add gnome-doc-utils to DEPENDS
      firefox.inc: ARM_INSTRUCTION_SET = "arm"
      webkit gtk: ARM_INSTRUCTION_SET = "arm"
      madplay: ARM_INSTRUCTION_SET = "arm"
      u-boot omap3: update SRCREV for l1neon fix
      mono 1.2.6: ARM_INSTRUCTION_SET = "arm"
      kernel.bbclass: stage more headers for >=2.6.27 kernels
      task-proper-tools: add more network related utils to replace busybox parts
      angstrom feed builder: add numptyphysics
      ti-cmemk-module, ti-lpm-module: adapt build to release versions
that fixed the weird stuff we worked around
      wpa-gui: AyRM_INSTRUCTION_SET = "arm"
      angstrom feed builder: add opencv
      opencv: add cvs version that works with recent toolchains
      angstrom feed builder: add opencv-samples
      vpnc: fix do_install
      cacao: ARM_INSTRUCTION_SET = "arm"
      qt-x11-free 3.3.7: add libxmu to DEPENDS
      quake2: add libxxf86dga to DEPENDS
      sylpheed: update to 2.5.0
      checksums.ini: add more entries
      linux-omap git: add DSS2 debug patch, switch omap3evm to DSS2
      vlc: disable glx
      openmoko-calculator2: add missing png
      checksums.ini: add tango-icon-theme checksum for new url
      tango-icon-theme: fetch from an unexpired url
      checksums.ini: add dsplink 1.60 release
      dsplink: use 1.60 release instead of beta
      tango-icon-theme: add 0.8.1
      dsplink: remove obsolete files
      xserver-xorg: add libpciaccess to RRECOMMENDS
      pushover: add 0.0.1
      angstrom feed builder: add pushover

Marcin Juszkiewicz (9):
      m8050: added config for AML M8050 device
      checksums.ini: added mime-support and gnome-themes
      linux: added support for m8050 device
      checksums.ini: added gpe-theme-industrial
      checksums.ini: added php 5.2.6
      php: fix configure part so it will build again
      phoneme: use proper way to specify user/pass (from BugLabs)
      cacao-native: create few directories before build to get classes
generated (from BugLabs)
      checksums.ini: add 1212 entries from test fetch build

Michael 'Mickey' Lauer (18):
      vala[-native] 0.4.0: bump to 0.5.1
      vala 0.5.1: add patch working around a vte bug
      preferred-om-2008-versions.inc: prefer vala 0.5.1
      ecore: bring back software-16 engine -- courtesy Michael
'emdete' Dietrich.
      sane-srcrevs.inc: bump openmoko-terminal2
      vala-terminal: new recipe; a lightweight vte-based terminal
written in Vala.
      fso-image: ship vala-terminal
      clucene-core 0.9.21: update to 0.9.21b
      frameworkd-devel git: fix FILESDIR
      boost 1.33.1: apply patch for gcc4.1, courtesy Sander van
Grieken. closes #4710
      zope 3.3.1: sanitize to work with multiple Python versions
      python-twisted 2.5.0: improve packaging (still not 100% ok though)
      python-twisted 2.5.0: remove trailing whitespace
      fsu-[illume-]image: ship tango icon theme and activate it
      hicolor-icon-theme: remove outdated ones
      vagalume 0.5.1: ship png icons
      vagalume 0.7: new version
      fsod: new recipe, a C/Vala implementation of the
freesmartphone.org dbus APIs

Mike Westerhof (1):
      conf/machine/ixp4xx: remove duplicate archs now specificed in tune-xscale

Otavio Salvador (5):
      qemu (svn): fix include of dirent.h file
      preferred-xorg-versions-X11R7.4.inc: set mesa preferred version to 7.2
      evince: add 2.24.1
      xorg-xserver-common.inc: add default font path to misc fonts
      xorg-xserver-common.inc: build xephyr package

Paul Eggleton (1):
      linux-handhelds: fix compilation error due to missing include

Robert Schuster (11):
      classpath-initial 0.93: Added miscompilation patch.
      openjdk-langtools-native: Rename 'javac' to 'sun-javac' when
installing to staging.
      openjdk-javac-native: New recipe.
      openmoko.conf: Set virtual/javac-native preference to
ecj-bootstrap-native.
      openjdk-javac-native: Inherit native.
      openjdk-langtools-native: Add virtual/java-native to DEPENDS
(the tools need a runtime otherwise there are useless)
      openjdk-langtools-native: Rework do_stage to manually install things.
      libecj-bootstrap 3.4: Prevent recipe being taken by default.
      Revert "libecj-bootstrap 3.4: Prevent recipe being taken by default."
      classpath-initial 0.93: Use a patch that fits to classpath 0.93.
      openjdk-javac-native: Use relative path for symlink.

Rod Whitby (2):
      unslung.conf: Define PREFERRED_PROVIDER for
virtual/libc-initial:glibc-initial
      glibc_2.2.5: Make it buildable again for Unslung distro

Stanislav Brabec (5):
      mplayer: Temporarily disable debug build due to gcc bug#37987.
      bitbake.conf:Define STAGING_BINDIR_CROSS_BASEPKG and add it to the PATH:
      perl and cpan.bbclass: Never reference to host instance of perl:
      zaurusd: Turn backlight off when closing the lid and ~/.norot exists.
      claws-mail: Update to 3.6.1 + libetpan: update to 0.57:

Stefan Schmidt (14):
      illume: Add patch to fix segfault on gsm module on FSO.
      illume: Actually use a patch that applies. Sorry.
      checksums.ini: Add i2c-tools
      sysvinit: Bump PR for last change
      edje_svn: Bump PR for cache change
      illume_svn: It inside E now. Remove the extra recipe for it
      eina: Cleanup recipe
      angstrom-2007-for-openmoko: OM prefers exquisite over psplash
      task-x11-illume: Make it build with the current EFL changes.
Need more tweaks later.
      numptyphysics_svn: Add a comment about fetching problems due to
svn only available as https
      task-x11-illume: Catch up with new theme name
      e-wm: Apply patch former in the illumeeeeee package

Thomas Seiler (1):
      preferred-om-2008-versions: Bump shared-mime-info to 0.51

woglinde (8):
      gdal-1.5.2: fix various stuff
      checksum.ini: fix entry of wesnoth
      uclibc-0.9.29: remove DEFAULT_PREFERENCE
      uclibc: update to version 0.9.30
      uclibc-0.9.30: enable linker option for hashstyle-gnu
      minimal-uclibc: use uclibc 0.9.30 as default
      minimal-uclibc: use proxy-libintl as provider for virtual/libintl
      uclibc: add mpc8315e-rdb machine.conf

Bugs fixed:

bug_id resolution        short_desc
4015 DUPLICATE   dsniff-2.3-autobuild
4028 DUPLICATE   scummvm-0.9.1-autobuild
4738 WORKSFORME  python-numpy-1.1.1-autobuild
4591 DUPLICATE   NOTE: package linux-handhelds-2.6-2.6.21-hh20-r20:
task do_compile failed
4710 FIXED       [bb patch] boost_1.33.1 header file fix for GCC4.1
4717 FIXED       uClibc.machine file missing for mpc8315e-rdb board
(uclibc 0.9.29)
4799 FIXED       hal-0.5.11 fails with external toolchain/SDK
4828 INVALID     opkg-nogpg fails to build with undefined ref to gnutls

Bugs opened:

bug_id resolution        short_desc
4843     fetch-pack from 'git://git.infradead.org/mtd-utils.git' failed
4822     new bb recipe for Xlogical (game)
4835     Proposal to update git/git-native


-- 
=======================
Cliff Brake
http://bec-systems.com


