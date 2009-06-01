Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MBB1T-0008Q4-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2009 19:10:10 +0200
Received: by yw-out-1718.google.com with SMTP id 9so3866522ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2009 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=O6tvLgNGznKIsAZuYuf6a7P6OPB8NQfWLjXyVxafrJQ=;
	b=oRGCZvaT0qboBVNBbnsT2aHUzxkIyJ+oH/7H9EBxplwdsIpp9lN648NVCggQBJvJiF
	ZH3RhROvS3VIw+olJg3dAV2BMwC5VDDtOOjcGyANXBUeH/1PJA5JR7HkA9fUzeUGCHmI
	9FIV8GEzsHYNIvNUzJbbSPFjXHhCuPFMzR5oA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=sNGa0P4FX1ukynMmONLXZX1PqAGFDg6cBA5yJEyLXVi2cAwCN+P51sV//XepSSkSiO
	3D3tso1tNzeg7zxeZudfR8enRBoKphan88gAffvHe6m0+t5lBFMZbE512330stcDSbxC
	ZGA1gkWXkiwnrkolsXI6pJWm/jLIMREsRb71A=
MIME-Version: 1.0
Received: by 10.151.111.13 with SMTP id o13mr11939156ybm.259.1243875681714; 
	Mon, 01 Jun 2009 10:01:21 -0700 (PDT)
Date: Mon, 1 Jun 2009 13:01:21 -0400
Message-ID: <f96d234e0906011001w2a246416m2eeed6bc4e23da75@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-05-25 to 2009-06-01
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
X-List-Received-Date: Mon, 01 Jun 2009 17:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-05-25 to 2009-06-01

Andrea Adami (4):
      linux-rp-2.6.24: fix compilation with gcc-4.3
      linux-rp-2.6.23: fix compilation with gcc-4.3
      linux-kexecboot-2.6.24: fix compilation with gcc-4.3. Bump PR
      zaurus-kernel: bump PR to match linux-kexecboot-2.6.24 fix for gcc-4.=
3

Chris Larson (1):
      kexecboot: require ../linux/linux.inc, not recipes/linux/linux.inc.

Denis 'Gnutoo' Carikli (1):
      emacs 22.3: Fixed compilation,bump PR

Dmitry Artamonow (6):
      checksums.ini: add checksums for netsurf-2.1 and related libs
      libnsbmp: add recipe for version 0.0.1
      libnsgif: add recipe for version 0.0.1
      libparserutils: add recipe for version 0.0.1
      hubbub: add recipe for version 0.0.1
      netsurf: add recipe for version 2.1

Dmitry Eremin-Solenikov (7):
      seppuku: add support for working behind the proxy
      lowpan-tools: fix building
      tinderclient: support sitting behind proxy
      at91*: drop PREFERRED_VERSION_u-boot
      at91*: use correct u-boot configs

Florian Boor (5):
      task-sdk-extra: Replace some oldstyle X bits with new
components. This helps to keep toolchain and filesystem in sync and
avoids messing up staging.
      xserver-kdrive: patch for supporting 800x480 video modes.
      task-sdk-extra: pull in missing libxi
      tx27.conf: Initial machine description for Ka-Ro TX27 board
      linux: Initial support for the Ka-Ro TX27 (rev. 4)

Graeme Gregory (1):
      alsa-scenario_0.2.bb : add new release of alsa scenario

Ihar Hrachyshka (4):
      udev: include udev-utils into udev rootfs
      directfb: added new version 1.2.8
      udev: fixed obsolete udevadm syntax for udev init.d script.
      gnome.bbclass: remove unneeded scrollkeeper stuff from gnome packages=
.

Jeremy Lain=E9 (1):
      libx11: fix libtool invocation on x86/ppc

John Willis (1):
      usb-gadget-mode: Add defaults for omap3-pandora and fix broken script=
.

Khem Raj (1):
      python-native_2.6.1.bb: Add zlib-native to DEPENDS

Koen Kooi (55):
      udev 141: merge in some fixes from poky
      alsa-lib: add 1.0.20
      hamlib: add rough version of 1.2.9
      fltk: fix gnu-hash QA error
      hamlib 1.2.9: fix bindings
      xf86-video-omapfb: bump SRCREV and use overlay 2 instead of overlay 1
      angstrom-led-config: add sheevaplug support
      xextproto-native: add util-macros DEPENDS
      angstrom 2009.X: require newer util-macros
      xorg proto common: depend on util-macros
      xorg drivers: bump PR for xorg 1.6.x changes
      angstrom 2009.X: prefer Xorg-xserver 1.6.1
      omap3: bump MACHINE_KERNEL_PR
      angstrom 2009.X: remove some useless preffered_version files
      libx11 1.1.5: the old "floating point exeception" problem has
arrived again, bump MIN_REHASH to 16 to get around it
      libxext: add 1.0.6
      libx11: add 1.2
      linux-omap 2.6.29: add more DSS2 patches
      lockdown: steal some bits from openmoko that will dump
prefferred_versions to TMPDIR
      xserver xorg 1.6.1: fix sysroot regression by applying the same
patch as 1.5.x
      xf86-input-keyboard: update to 1.3.2
      linux(-rp).inc: Quirk for udev greater or equal 141
      angstrom 2009.X: some more preferred versions
      devicekit: add 003
      xproto-native 7.0.15: depends on util-macros-native
      usbutils: update to 0.82
      usb-gadget-mode: add support for all linux gadgets and make
g_cdc the default for beagleboard
      linux-omap 2.6.29: update defconfig
      omapfbplay: bump SRCREV
      libx11-native: add 1.1.5
      ptp-gadget: add ptp gadgetfs driver
      ptp-gadget: fix breakages when used with musb_hdrc controllers
      imagemagick: fix program-prefix to not include target-prefix
      ffmpeg 0.5: sync arm optimizations with current git
      clutter 0.8: update to 0.8.8
      samba 3.3.0: tdb fixes from poky
      displaylink: add kernel-module-udlfb and libdlo, which are 2
ways of controlling displaylink based usb devices
      checksums: add some more checksums
      xserver-common 1.24: fix xdg autostarting
      pango: add 1.24.2
      angstrom 2009.X: preferred-versions updates
      angstrom-gpe-task-base: bump PR
      check: add 0.9.5 (from poky)
      gupnp*: sync with poky
      gnet: sync with poky
      libjana: sync with poky
      redland: add 1.0.8 (from poky)
      xdg-user-dirs: add 0.10 (from poky)
      moblin: add recipes from poky 'meta-moblin' overlay
      gimp 2.6.3: bump PR for gnome.bbclass change
      gnome-vfs: bump PR for gnome.bbclass change

Marcin Juszkiewicz (14):
      busybox: enabled stat in 1.13.2/angstrom
      checksums.ini: added some X.org tarballs
      xtrans: added 1.2.3
      applewmproto: added 1.2.0
      dri2proto: added 2.0
      inputproto: added 1.5.0
      randrproto: added 1.3.0
      xextproto: added 7.0.5
      xproto: added 7.0.15
      xf86-input-evdev: added 2.2.2
      xf86-input-mouse: added 1.4.0
      util-macros: added 1.2.1
      xorg-xserver: added 1.6.1 (tested only on armv6/glibc)
      xf86-input-tslib: make it build against XServer 1.6

Martin Dietze (18):
      netbase: updated etc/network/interfaces files for mtx-[12] *
since hostap and madwifi drivers are installed, the system will pick
the config for whatever wlan card is found
      Patches to get glibc 2.3.2 and 2.3.3 compile for nylon * disable
check of gcc version in configure script * add definition of macro
_ABIO32 for mipsel architecture in sysdeps/mips/sgidefs.h * added
missing ld.so.conf for above glibc versions
      Fixed broken download URL for elvis
      Fixed broken configure script which lead to invalid prefix for
cross executables in some cases * the sed substitutions for flags like
`--program-transform-name' were not global, they are now
      libusb: added patch to allow compiling with gcc 3, used by nylon
distro * the gcc flags -fvisibility=3Dhidden and -Wno-pointer-sign are
removed from configure script and Makefile templates
      hostap: nylon-specific patches * for hostap-daemon 0.4.4, the
MADWIFI_BSD macro is unset * for hostap-daemon 0.5.10, dependency and
include dirs for madwifi are added
      linux-libc-headers: nylon-specific addition to do_stage
      mobilemesh: fixed broken download URL
      openswan: fixed broken download URL
      wlan-ng: ARM-binary usbctl is only installed on ARM
architectures
      logrotate-script: fixed broken download URL
      nylon-feed: removed usbutils from nylon feed
      gcc: made sure that no unsubstituted @LDFLAGS@ is left in the
generated Makefiles
      gnutsl: added missing build dependency guile-native
      initscripts: fixed bootmisc.sh so that hwclock.sh is only called
if installed
      perl-native: removed settings clashing with gcc 3 for nylon *
Config_heavy.pl and config.sh contained the gcc flag
`-Wdeclaration-after-statement' which broke the build with gcc 3, this
is disabled for nylon now
      rrdtool: fixed gcc options clashing with gcc 3 for nylon,
refined package definition for insane.bbclass * the gcc option
`-Wdeclaration-after-statement' broke the gcc 3 build, this is fixed
now for nylon * the package definition ${libdir}/perl broke the build
due to QA problems, this is now replaced by the list of files actually
installed
      linux-hotplug: fixed the path to the hotplug command in pci.rc *
the hotplug command was assumed to be in /sbin, but it actually is in
/usr/sbin

Michael Smith (6):
      syslog-ng: fix SRC_URIs
      Remove references to base_set_filespath() from recipes that don't nee=
d it.
      Replace obsolete base_set_filespath() with FILESPATHPKG in some recip=
es.
      glibc/eglibc: remove calls to obsolete base_set_filespath()
      uclibc: remove calls to obsolete base_set_filespath()
      vim: be an alternative to /bin/vi; switch to INC_PR

Michal Hrusecky (2):
      opie-sheet: fix compilation failure due to two function arguments wit=
h
      zuc: corrected iostream include to fix compilation

Paul Eggleton (5):
      h2200-bootloader: fix for mtd being built into kernel again
      libopie2/qte: fix bad cursor key rotation on some devices
      MAINTAINERS: add myself to list
      opie-packagemanager / opie-sheet: Add notes to recently added
patches indicating upstream status.

Pratheesh Gangadhar (1):
      quake3: Add pandora (actually omap3) quake3 gles port

Robert Schuster (3):
      checksums.ini: Cleaned up jamvm entries, added one for 1.5.3.
      jamvm-native 1.5.3: New recipe.
      jamvm-native 1.5.3: Added note.

Rolf Leggewie (5):
      bluez: 3.36 does not need the hciattach-ti-bts.patch.  Fixes do_patch=
.
      docs: fix URL for bitbake manual.  (Closes: #5122)
      docs: add copyright notice for 2009
      MAINTAINERS: re-sort alphabetically and add a note about this to
the bottom, too
      justreader: document that correct-settings-path.patch has been
sent upstream

Roman Khimov (1):
      (e)glibc-package: enable binary locale generation for powerpc

Stanislav Brabec (14):
      e2fsprogs-libs, util-linux-ng, pidgin: Use unique variable names
in do_split_packages():
      flac: Fixed build. Added printf format fix.
      kismet: Fixed build.
      kismet: Update to version 2008-05-R1.
      totem-pl-parser: Updated to version 2.26.2.
      libmusicbrainz: Fixed build.
      rhythmbox: Updated to version 0.12.1, removed unbuildable versions.
      mpd, mpd-alsa: Don't search in host system includedir (QA error).
      libsdl-gfx: GNU HASH QA fix.
      libsdl-ttf: GNU HASH QA fix.
      man-pages: Update to version 3.21.
      gpe-login: Do not depends on kernel with CONFIG_SYSFS_DEPRECATED*=3Dy=
.
      man-pages: Removed man-pages_2.79.bb.
      libx11-1.1.4: Prevent crash of makekeys (backport from 1.1.5).

Tim Ellis (1):
      php: Add fastcgi support

Tom Rini (1):
      python-native: Add readline-native to DEPENDS, bump PR.

Bugs fixed:

bug_id resolution        short_desc
2713 FIXED       get rid references to temporary directories on installed s=
ystem
4665 WONTFIX     madwifi-ng-r3837-20080802-autobuild
5125 FIXED       lowpan-tools-git-autobuild
5127 FIXED       u-boot-2009.01-autobuild
5131 FIXED       linux-kexecboot-2.6.24-autobuild
5132 WORKSFORME  zaurusd-0.0+svn20090501-autobuild
4686 INVALID     Bitbake does not recognize environment variables
4476 FIXED       smpeg fails do_configure
4478 FIXED       pkgconfig fails do_qa_staging
5122 FIXED       Incorrect hyperlink in OE docs

Bugs opened:

bug_id resolution        short_desc


