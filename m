Received: from [209.85.198.236] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KuSL0-0006R2-NU
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 14:40:55 +0100
Received: by rv-out-0506.google.com with SMTP id g9so2937419rvb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2008 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=DoCtdSeIu6rBdGL3JP6LiJbsT58nOQHdoSHF7XGAOzE=;
	b=TOCXLMpqzccWG8rM1FEPssYUT2muzvHR4GBObl2V+WrmbgSJNaOpU0T7V8lVppXkrI
	716lqDcyuY0cxXj/0d2W08r2NnQz/N3Kxnq79S3cB1TZeZGQi78W8xIG4td40zREPKd+
	fJgPIvQFMG5buUAFiEBy2/Czottq4IxyGPLBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=aisPM7V5IMxxsm36yA6x4YFJJP/0RvJe8f/kUfyb4GQ1RWuR+SU5kRWYyfNkwbNlN0
	pP6LUvb97s2y17IgUlZD/oewxs+xGoYpVU9Rh1lqzgV7PbNLNNEwfaJEPFe/RqsQ4T+p
	VHohxRp0Qxc/RB7GHBUr5caf3OTa1LFiHCTuM=
Received: by 10.141.96.21 with SMTP id y21mr3257564rvl.132.1225114805806;
	Mon, 27 Oct 2008 06:40:05 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Mon, 27 Oct 2008 06:40:05 -0700 (PDT)
Message-ID: <f96d234e0810270640i3bbb068fx2d8b8b0855ee0e22@mail.gmail.com>
Date: Mon, 27 Oct 2008 09:40:05 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-10-20 to 2008-10-27
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
X-List-Received-Date: Mon, 27 Oct 2008 13:40:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-10-20 to 2008-10-27

Abner Silva (3):
      task-mamona.bb: Alsamixer added as rdepends.
      mamona-sound-n770: Mamona sound package for nokia770.
      cx3110x-{chinooke,770he}: It's no longer needed to bring up the
wireless interface, because it is now up to networkmanager.

Aloisio Almeida Jr (19):
      task-mamona.bb: Removing hal-info as dependencie
      task-mamona.bb: Adding xterm as dependency
      udev-usbserial: Adding package to add a rule to spawn getty on ttyUSB
      task-mamona: Adding alsa packages to task-mamona
      mamona-sound: moving nokia800 asound.state from
mamona-sound-n800 to alsa-state
      mamona.conf: preferring wpa_supplicant 0.5.7
      bash-noemu_3.2, binutils-noemu_2.17 and gcc-noemu_4.1.1: Adding
RCONFLICTS and RREPLACES
      gcc-package-noemu: Recovering some lost files while packaging
      gcc-noemu: Adding 4.1.2 version
      binutils-noemu: Adding 2.18 version
      binutils-noemu: Adding CONFLICTS and REPLACES to binutils-noemu-symli=
nks
      gcc-noemu: (1) Adding CONFLICTS and REPLACES to subpackages (2)
Removing HOST_SYS=3D${BUILD_SYS} (3) Removing --with-host-cross
      gcc-package-noemu.inc: (1) Just building gcc, g++ and cpp noemu
packages (2) Adding libgcc_s.so link to gcc-noemu package
      task-mamona-noemu.bb: Adding missing packages to noemu task
      task-mamona-noemu.bb: Adding task-mamona task-mamona-base
task-mamona-sdk as CONFLICT packages
      bash-noemu: Adding patch to prevent dlopen in runtime
      mamona sdk: Re-arranging tasks, created task-mamona-sdk-noemu
that conflicts and replaces task-mamona-sdk
      task-mamona: removing useless (til now) update-modules
      cx3110x: Rearranging completely the cx3110x driver build

Cliff Brake (7):
      contrib/weekly-changelog-report.py: add script to generate
      weekly-changelog-report.py: remove "Merge Branch" entries, add TODO l=
ist
      vala 0.4.0: add new version
      MAINTAINERS: add vala to my recipe list

Florian Boor (4):
      unicap: 0.9.3 Work around library renaming issue.
      fswebcam: A command line tool for image capture and processing -
add 20070108 code relase.
      checksums.ini: Add ucview, unicap and fswebcam
      linux-bd-neon: Set COMPATIBLE_MACHINES

Francisco Alecrim (1):
      mamona.conf: Choose preference gtk+ version

Graeme Gregory (1):
      etk-theme-ninja_svn.bb : no need to confuse people by using https

Holger Hans Peter Freyther (7):
      gstreamer: mp3 was never needed for Openmoko it was only there accide=
ntly
      NO AUTOREV!
      [assassin-thumbnail] Add tick's assassin-thumbnail recipe
      [openmoko] Fix the feed configuration
      [asu] Create ASU/Om2008.8 task and image (to ease removing Qtopia fro=
m it)

I-Fan, Chen (9):
      [alias name] Adding alias name tags for packages
      [Descriptions] Adding more description to applications
      [alias name] Adding alias name tags for packages
      [alias name] Adding alias name tags for packages
      [Descriptions] Adding more description to applications
      [alias name] Adding alias name tags for packages
      [Descriptions] Adding more description to applications
      [alias name] Adding alias name tags for packages
      [Descriptions] Adding more description to applications

Jeremy Lain=E9 (1):
      gnutls: fixing the pkgconfig is not necessary for gnutls 2.4.2

Julian_chu (14):
      pyefl-sudoku_svn.bb: Add Python EFL sudoku.
      [tichy] Apply Charlie's change
      [Assassin] Add curl to assassin's depends.
      [assassin] Remove curl in DEPENDS of assassin
      [assassin] Change the source URI of assassin
      [openmoko] Change name from Diversity-nav to Om-locations
      [om-locations] Set om-locations to use 0.2 branch of om-locations git=
.
      [om-locations] Set om-locations to use 0.2 branch of om-locations git=
.
      [om-locations] Switch back to master branch
      [diversity] Add diversity-radar, a GPS location based
communicative application
      [diversity] remove PACKAGES =3D "${PN}" from diversity-radar
      [openmoko] add Openmoko community repository bbfile.
      [openmoko] Change default community repository
      [openmoko-community-repository] Modify the URL

Kalev Lember (3):
      i?86-generic.conf: remove duplicate entries from PACKAGE_EXTRA_ARCHS
      valgrind 3.3.1: add new version
      flashrom svn: new recipe

Khem Raj (1):
      Add myself to the list.

Koen Kooi (65):
      nfs-utils: add e2fsprogs to DEPENDS to satisfy libblkid dep
      libffi: update to gcc 4.3.2
      dsplink: disable 128MB patch in 1.51, it doesn't apply
      fennec: update to 1.0a1
      checksums.ini: add more checksums
      beagleboard: make linux-omap the preferred kernel, this makes
UVC cams work on OTG
      xf86-video-omapfb: update SRCREV to get support for rectangular clipp=
ing
      dsplink: overhaul buildsystem
      linux-omap2: add forced module loading support for beagle
      machines: start moving PACKAGE_EXTRA_ARCHS into the appropriate tune =
files
      codec-engine: commit latest work in progress
      checksums.ini: add CE 2.21
      codec engine 2.21: get build move a bit further
      dsplink: cleanups
      dsplink: stage into machine staging dir
      codec engine: start adding comments and davinci support
      package bbclass: add missing 'import bb'
      dsplink, codec-engine: improve davinci support
      codec-engine: fix sed script
      linux-davince: force module loading
      bitbake.conf: add dummy DISTRO_PR
      codec-engine: more cleanups and comments
      dsp-link, codec-engine: move some stuff to inc files, clean up
makefile, etc
      ti-cmemk-module: recipe to only build cmemk.ko instead of the
whole codec-engine
      codec-engine: fix typo
      davinci-dvevm: remove dsplink from RDEPENDS, it isn't strictly needed
      task-base: bump PR
      neuros osd2: remove dsplink from machine recommends, they are
not strictly needed
      pp-dialin: try to make it upgrade safe
      vlc: update to 0.9.4 and add v4l1 support
      vlc: fix v4l option
      omap3evm: remove duplicate package archs
      arm tune files: include tune-thumb by default
      package bbclass: only run ldconfig when there's a ld.so.conf present
      angstrom feeds: add links-x11 pine mutt claws-mail sylpheed
      cairo: add 1.8.0
      linux omap git: update to 2.6.27-omap1
      linux omap git: fix oprofile patch
      angstrom feed builder: add omap3evm and neuros-osd2
      Revert "[tichy] Apply Charlie's change"
      Revert "[alias name] Adding alias name tags for packages"
      Revert "[asu] Create ASU/Om2008.8 task and image (to ease
removing Qtopia from it)"
      Revert "[Descriptions] Adding more description to applications"
      Revert "[openmoko] Fix the feed configuration"
      Revert "[alias name] Adding alias name tags for packages"
      Revert "[openmoko-community-repository] Modify the URL"
      Revert "[openmoko] Change default community repository"
      Revert "[openmoko] add Openmoko community repository bbfile."
      Revert "[Descriptions] Adding more description to applications"
      Revert "[alias name] Adding alias name tags for packages"
      Revert "[diversity] remove PACKAGES =3D "${PN}" from diversity-radar"
      Revert "[diversity] Add diversity-radar, a GPS location based
communicative application"
      Revert "[Descriptions] Adding more description to applications"
      Revert "[alias name] Adding alias name tags for packages"
      Revert "[om-locations] Switch back to master branch"
      Revert "[om-locations] Set om-locations to use 0.2 branch of
om-locations git."
      Revert "[om-locations] Set om-locations to use 0.2 branch of
om-locations git."
      Revert "[openmoko] Change name from Diversity-nav to Om-locations"
      Revert "[assassin-thumbnail] Add tick's assassin-thumbnail recipe"
      Revert "[assassin] Change the source URI of assassin"
      Revert "[assassin] Remove curl in DEPENDS of assassin"
      Revert "[Assassin] Add curl to assassin's depends."
      tune-thumb: make interworking opt-in as well

Lauro Ramos Venancio (7):
      Move binutils from task-mamona-base to task-mamona-devel.
      binutils-noemu: fix the libraries "SEARCH_DIR".
      cx3110x: version 0.8.1 only supports nokia770.
      cx3110x: add 2.0.15 version for n800 and n810.
      cx3110x-chinooke: Make cx3110x-chinooke use the chinooke's kernel sou=
rce.
      Add cx3110x-diablo-2.0.15.
      task-mamona: remove xterm, task-mamona-wm: add aterm and midori.

Leon Woestenberg (1):
      canyonlands.conf: New machine for AMCC460EX (PowerPC) development boa=
rd.

Marcin Juszkiewicz (33):
      linux-rp: fix location of patch-2.6.26-rc4
      checksums.ini: make linux-rp, fakeroot, base-passwd happy
      gdk-pixbuf-csource-native: depend on libx11-native to get X headers
      gnutls: add 2.4.2 (latest stable)
      shared-mime-info: added 0.51 (from Poky)
      shared-mime-info: build mime database on host instead on device
(from Poky)
      shared-mime-info: fix install (from Poky)
      shared-mime-info: fixed dependencies for native version (from Poky)
      sane-srcrevs: added qemu SVN revision (from Poky)
      qemu: added SVN version (from Poky)
      u-boot-mkimage-native: added 1.3.2 (from Poky)
      apt: add 0.7.14 (from Poky)
      apt: added forgotten patch (from Poky)
      apt: unbreak host checking (from Poky)
      apt: bump PR after last change (from Poky)
      apt: moved apt dependencies to apt recipe (from Poky)
      apt-native: remove db-native and curl-native dependencies (from Poky)
      rootfs_deb: use dpkg-scanpackages as our apt-native does not
have apt-ftparchive anymore (from Poky)
      apt-native: create var/log/apt/ dir so rootfs building will work
(from Poky)
      apt: stage headers/libs (from Poky)
      apt: fixed packaging of debug files
      checksums.ini: added all apt versions and newer git
      apt: unbreak 0.7.2/3 versions
      dpkg: upgrade to 1.14.19 (from Poky)
      dpkg: ncurses were needed only for dselect (from Poky)
      dpkg: rm rcS.d/S98configure to not run it on non-first boot (from Pok=
y)
      dpkg: disable dependency on update-alternatives for now
      opkg: S98configure script is needed only on first boot (from Poky)
      dpkg: unbreak 1.13.* versions
      checksums.ini: added dpkg 1.13.22
      dpkg-native: disable SELinux in 1.13.22

Michael Lauer (2):
      sane-srcrevs: bump openmoko-terminal2
      python 2.5.2 limit readline history to 1000

Mike Westerhof (5):
      SlugOS: nslu2?e.conf - fix duplicate archs breakage
      FSO: om-gta0?.conf - remove duplicate armv4t in package architecture =
lists
      package_ipk.bbclass: add import bb where missing
      SlugOS: slugos.inc - set preferred version for gnutls
      SlugOS: slugos.inc - Set preferred version for cairo as well

Otavio Salvador (12):
      vte: depends on ncurses
      libvncserver: fix build properly applying autoconf patch
      qmake2: properly set rcc utility to rcc4 in native stagging
      matchbox-wm: fix dbus support
      pam (1.0.2 and 0.79): install headers in ${includedir}/security
      pam 1.0.2: fix plugins split up
      checksums.ini: add gamin 0.1.8
      checksums.ini: add libpng 1.2.31
      checksums.ini: add freetype 2.3.6
      checksums.ini: add flex 2.5.31
      checksums.ini: add expat 2.0.0
      checksums.ini: add expat 1.95.7

Phil Blundell (2):
      busybox: tolerate empty layout_execprefix

Philip Blundell (1):
      glibc-2.6.1: fix interworking for armv4t

Ricardo Salveti (38):
      mamona.conf: Adding preferred version for mplayer (n770, n800)
      task-mamona.bb: All packages used to let sound working should be
at task-mamona.
      task-mamona-nokia-it.bb: Mamona sound is now at task-mamona.
      Adding diffutils and binutils-symlinks to task-mamona-sdk.
      task-mamona.bb: Adding  glibc-utils as rdepends
      Adding bluez at task-mamona.
      Adding preferred provider for libsdl (to work with mplayer).
      Adding the recipe of mamona-input-methods.
      Adding RPROVIDES at mamona-input-methods.
      Adding libmamona-im as RDEPENDS of task-mamona.
      Just changing the SECTION of mamona-input-methods.
      Adding 'buildallpkgs' as default to mamona.conf.
      Removing mamona-buildall.inc from meta-mamona.
      Removing 'mamona-buildall.inc'.
      Adding e-applet at mamona-input-method's recipe.
      Adding matchbox-keyboard at task-mamona.
      mamona-input-methods: changing git address.
      Moving mamona-input-method applet to another recipe.
      Adding task-mamona-wm.
      Adding libmamona-im-gtk package in mamona-input-methods' recipe.
      Adding libmamona-im-gtk at task-mamona-wm.
      task-mamona-wm: gtk applications (eg firefox) needs pango-modules.
      task-mamona-python: adding new task to support almost everything
in python we have
      task-mamona-systemtap: adding new task to cover everything you
need to run a systemtap enabled system
      meta-mamona: adding missing packages for 0.2-Beta release
      meta-mamona: adding vim, making some people happy
      task-mamona: adding networkmanager
      task-mamona: adding cx3110x, but just for the nokia internet
tablet devices
      task-mamona-devel: adding udev-usbserial again
      task-mamona-sdk: adding git
      task-mamona-sdk: adding cmake.
      meta-mamona: adding quilt
      cx3110x: we should call wlan-cal after loading the module
      cx3110x: fix ooops while connecting with nm
      task-mamona: adding netm-cli
      task-mamona: adding wpa-supplicant-passphrase
      mamonaim-e-applet: moving to _git.bb as it's a git based package.
      task-mamona-wm: adding task-mamona at RDEPENDS

Richard Purdie (1):
      opkg: remove duplicated / from postinst (from Poky)

Robert Schuster (14):
      java-library.bbclass: Remove superfluous quotes from BPN variable.
      giflib 4.1.6: New recipe.
      [checksums]: Added giflib 4.1.6 entry.
      lesstif 0.95.0: New recipe.
      native.bbclass: Run java_stage if JAVA_NATIVE_STAGE_INSTALL is set.
      Added BPN/BP functionality (see #11716)
      classpath.inc: Simplify by using BPN/BP.
      java.bbclass: Fixed indentation.
      lesstif: Removed unneeded patch.
      base.bbclass: Add BPN- and BP-based search path to FILESPATH.
      checksums.ini: Correctly sorted giflib, added wesnoth 1.4.5 and
lesstif 0.9.5 entry.
      checksums.ini: Added jamvm 1.4.5.
      checksums.ini: Fixed sha256 entry for lesstif (accidentally used sha1=
sum).
      checksums.ini: Fixed sha256 entry for wesnoth (accidentally used sha1=
sum).

Rodrigo Vivi (16):
      MAINTAINERS: add my entry
      task-mamona-devel has been changed for runtime development environmen=
t.
      mamona.conf fix preferred versions and providers
      Adding cx3110x package for mamona.
      cx3110x doesn't need dbg and deb package... avoiding their generation=
.
      cx3110x-0.8.1 fixing do_install problems.
      cx3110x: Creating sysfs link between device and interface wlan0.
      mamona.conf: Adding fixed PREFERRED_VERSION for networkmanager and cx=
3110x
      Creating uinput package.
      task-mamona* & meta-mamona*: Reorganising task & meta packages.
      dpkg & task-mamona-base: Moving perl and its modules from
task-mamona-base to dpkg.
      Adding qt and pyqt to meta-mamona
      meta-mamona needs to build mplayer-maemo instead of mplayer.
      Adding openobex to meta-mamona.
      mamona-input-method provides libmamona-im0 instead of
libmamona-im as it was on its RPROVIDES and on task-mamona RDEPENDS.
      gcc-noemu_4.1.2.bb: requiring gcc-${PV}.inc instead of gcc3-build.inc

Stefan Schmidt (2):
      pidgin.inc: Fix typo. Spotted by Koen

Thomas Kunze (2):
      linux-rp_2.6.26: add patch for collie usb
      xserver-kdrive_1.4.090: fix rotated tslib input

julian_chu@openmoko.com (1):
      Add Ninja Theme as default


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


