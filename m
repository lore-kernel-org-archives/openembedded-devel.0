Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lvv3i-0000lW-Jy
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 17:05:23 +0200
Received: by gxk28 with SMTP id 28so2355024gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=xrij4DYGOHei6rkPnD2tvV9wWptRdwedTzKvw5phquE=;
	b=KNkS1ZNctqpYvBEDfY1ImFl3mbWbcD1PerWmRuXZkKtMZWzwHAnJ95Owrah02ufVtB
	mfJXIRNnkC125B/e6KNcU2Zzvbhuz4LT5A5hA9RiLcoiILDDi9CJBCbvp4HNVN8JOFxd
	QWlApuC5b0BLw0XL80/pvnQGQH6CB/5K0E+fg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=OYfey4LTKIfXdiJSIpxO2rSGWyPpBC1lzftPmZwOZINpr3SHiuXOVWqbZOSGnWI/Zc
	6EFizESA+RLWBqVoFv5IJk7gsF9wBu+Jo8ONkx3ajIQDKFaLuA/STpRBNd1TdJI24G28
	tNs0KGyPbNNRNadvlG/nFrZ41BEAYFgAOLOeY=
MIME-Version: 1.0
Received: by 10.151.147.10 with SMTP id z10mr6511744ybn.159.1240239658425; 
	Mon, 20 Apr 2009 08:00:58 -0700 (PDT)
Date: Mon, 20 Apr 2009 11:00:58 -0400
Message-ID: <f96d234e0904200800j216b9928i24a260064c3e0e9f@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-04-13 to 2009-04-20
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
X-List-Received-Date: Mon, 20 Apr 2009 15:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-04-13 to 2009-04-20

Andrea Adami (1):
      zaurus-updater: force PARALLEL_MAKE =3D ""

Carsten Haitzler (13):
      e2fsprogs: fix compile to use 3 args so it works.
      elementary-sms: add recipe
      palmt650-keyboard-modmap: keyboard map for palmt650 so it works right
      palmt650: use palmt650-keyboard-modmap on t650 to make kbd work right
      pointercal: add pre-calibration for palmt650
      preferred-om-2008-versions: use nfs-utils version that works
      glibc: write ld.so.cache to usual /etc location so it can be
cached and speed
      xserver-kdrive-common: fix tscalibrate script to not run if ts
dev not exist
      xserver-kdrive-common: fix Xserver script to properly choose
background PPM
      xserver-kdrive-common: fix start script to suport background opt
and up pkgrev
      efl: updates to have improved packaging and fewer... bugs!
      illume-image: update packages to be cleaner
      efl: update svnrev

Carsten Haitzler (Rasterman (9):
      sane-sercrevs: fix duplicate of essential-dailler and libefso
      sysstat: fix build on omap3 to actually work (gnu_hash problem
like ltrace)
      libfribidi: add native version
      evas: use fribidi-native package
      efl: update to srcrev with fribidi build fixes and e win
management fixes
      pointercal: update palmt650 pre-seeded pointercal data (i just
re-ran it)
      efl: newer svnrev with exquisite/ecore-fb fixes and more.
      angstrom, exquisite, psplash, opkg, angsrtom-images, sysvinit:
abstract splash
      libelf: fix another GNU_HASH issues while building libelf

Carsten Haitzler (Rasterman) (2):
      ltrace: fix build (at least for omap3)
      xserver-kdrive-common: fix Xserver script to detect overo and
run xorg

David Huggins-Daines (1):
      canadian-sdk: Synchronize (to some extent) canadian-sdk.bb with
meta-toolchain.bb.

Denis 'Gnutoo' Carikli (1):
      libgpg-error: add inherit gettext in order to have libiconv as
dependency with uclibc

Denys Dmytriyenko (3):
      asterisk 1.4.23.1: move to recipes/ from accidentally commited
packages/
      e2fsprogs 1.41.4: depends on gettext-native, due to the removal
of do_configure
      udev 124: fix the absolute soname link in libvolume for SDK

Dirk Opfer (1):
      uclibc: use LDFLAGS for ldd and ldconfig (fixes QA error)

Florian Boor (3):
      initramfs-image: Make sure static busybox gets into the initfs image.
      micro2440.conf: New device: FriendlyARM micro2440
      linux: initial micro2440 support for 2.6.29 using mini2440 kernel pat=
ches.

Frans Meulenbroeks (1):
      python-zopeinterface: fixed building

Jeremy Lain=E9 (10):
      siteinfo.bbclass: add entry for arm-darwin9
      odcctools: add cctools for Darwin (from Poky)
      iphone: start adding toolchain elements for iphone
      apple-csu: add core libraries for iPhone
      iphone.conf: add basic machine description for iPhone
      gcc-iphone-cross: add rough cross-compiler for iPhone
      iphone-compat.conf: add mini distro with toolchain for iPhone
      insane.bbclass: add an entry for darwin9/arm
      bitbake.conf: fix package population for darwin
      lib_package.bbclass: fix package population on darwin

Khem Raj (2):

Koen Kooi (54):
      obex-data-server: add 0.4.4
      obexftp: update to 0.23
      gnome-bluetooth: add obex-data-server to rrecommends
      gvfs: update to 1.2.1
      nautilus: add 2.26.1
      gnome-bluetooth: update to 2.27.3
      gnome-menus: update to 2.26.0
      packagekit: update to 0.4.6
      gnome-packagekit: update to 2.27.1
      gdbm: use LDFLAGS (fixes QA error)
      gtk-icon-cache bbclass: build caches for all icondirs in ${datadir}/i=
cons
      gnome-icon-theme: update to 2.26
      angstrom gpe task-base: gnome-bluetooth now does that
gpe-bluetooth and bluez-gnome tried to do, so replace them
      gnome-bluetooth: add fix for properties crash
      gnome-bluetooth: remove debugging leftovers
      linux-omap 2.6.29: add more DSS2 patches
      overo, pandora: remove traces of u-boot-omap3
      dsplink: add INSANE_SKIP till the codec build gets fixed
upstream
      udev: add 141, needs more work since it only creates static libs
and the OE-only kernel match patch needs to get evaluated
      haserl: update to 0.9.25
      gnome-bluetooth: add 2.27.4
      packagekit: fix RDEPENDS
      checksums: add avr32 gdb patch
      python 2.6.1: fix build for architectures lacking libffi support
      xserver-xorg: make avr32 build go a bit further
      exquisite-theme-angstrom: add angstrom theme as a quick hack
      exquisite-theme-angstrom: make it glow harder
      exquisite-theme-angstrom: import needed files after rasterman
fixed the images
      linux-omap 2.6.29: sync with dss2 tree for YUV rotation
      e-wm-config-angstrom: connman module is disabled in recent
builds, so don't try to load it
      various image: weakly assign $SPLASH so it isn't unset on
expansion
      psplash-zap: recommend psplash
      task-beagleboard-demo: remove psplash hardcode
      iphone-compat: require angstrom, since minimal is just a copy of
angstrom with added bugs, which we don't need
      iphone-compat: require angstrom, since minimal is just a copy of
angstrom with added bugs, which we don't need
      pulseaudio: fix volatiles and ship policykit file
      packagekit: fix service and policy files, update git version
      policykit: fix permissions and volatiles
      opkg: only ping splash when splashfuncs are present
      sysvinit: only ping splash when splashfuncs are present
      minimal-image: update to use util-linux-ng
      testlab bbclass: disable package graphs when
ONLINE_PACKAGE_MANAGEMENT !=3D full
      udev 141: start clean up
      linux-omap 2.6.29: add more dss2 patches
      angstrom: start removing FEED_ARCH
      gnome-media: fix packaging and make it more determistic

Leon Woestenberg (7):
      util-linux-ng: Fixed dangling symlinks.
      MAINTAINERS: Updated my email address.
      squashfs-tools: Added release 4.0 (for SquashFS 4.0 in Linux 2.6.29).
      lighttpd: Added 1.4.22 with DEFAULT_PREFERENCE -1.
      linux-rt: Add 2.6.29 with DEFAULT_PREFERENCE -1.
      wt-2.2.3: ARM_INSTRUCTION_SET =3D "arm" to workaround toolchain issue=
.
      lighttpd: Added 1.4.22 to checksums.ini to prevent punishment.

Marcin Juszkiewicz (11):
      linux: fixed defconfigs for at91sam* devboards
      atngw100: do not set kernel version in machine config
      linux: atngw100 uses 2.6.29 now (config updated with lot of changes)
      linux: enabled lot of options for Atmel NGW100 device
      linux: make 2.6.29 default for ep93xx (tested on edb9301)
      linux: updated defconfig for ep93xx
      tracker: added libgnomecanvas to dependencies
      checksums.ini: added checksum for util-linux-ng 2.13.1
      util-linux-ng: depend on virtual/libintl to pass building with uclibc

Marek Vasut (1):
      Improve libgemwidget fix

Michael 'Mickey' Lauer (6):
      linux-msm7xxx: bump to HEAD which seems to be working again
      iphone.conf: revert 8821a1efe4bf6a5cb88792b5d5f250ef480604cb,
since apart from the polemics, it's the call of
      libgsm0710: bump version to 1.1.1 release; add author and homepage
      libeflvala: bump to 0.0.1.0 and fix Q/A packaging error
      libgsm0710mux: bump to 0.3.3 release
      fso-term: new recipe; a versatile muxer-aware terminal program

Mike Westerhof (2):
      Openmoko: linux-openmoko-2.6.29 - commit new recipe tied to
upstream kernel
      Revert "Openmoko: linux-openmoko-2.6.29 - commit new recipe tied
to upstream kernel"

Robert Schuster (1):
      java.bbclass: Use force (-f) for ln (suggested by Marcin).

Stanislav Brabec (19):
      mtkbabel: Update to version 0.8.
      mc: Fixed invalid references to staging bindir.
      navit: Modules .so files must go to the main package, modules
.la can go away.
      espeak: Fixed GNU_HASH QA error.
      libatomics-ops: Package all installed files.
      eds-dbus: Package missing files, remove unneeded .la files.
      libsndfile1: Package unpackaged octave files to subpackage
libsndfile1-octave.
      libcanberra: Updated to version 0.12.
      autotools.bbclass, distutils-common-base.bbclass, bitbake.conf:
Fully support datadir/pkgconfig...
      iso-codes: Arch-independent package.
      gnome-media: New recipe.
      gvfs: Don't refer to the host system (samba includes, gawk).
      vala: Fixed bootstrapping.
      nautilus-cd-burner: Added version 2.24.0, removed old one.
      nautilus-cd-burner: Added version 2.24.0, removed old one.

Steffen Sledz (4):
      hipox: HIPOX machine uses u-boot-2009.03 for NOR/NAND combi boot
      u-boot: tiny printout for HIPOX machine fixed
      linux-2.6.24, linux-rt-2.6.24: squashfs-lzma-2.6.24.patch
imported to oe repo
      linux-2.6.24: nand and ubifs patches for HIPOX machine

Tick Chen (1):
      madbutterfly: adding madbutterfly bb file

Tom Rini (2):
      canadian-sdk: We DO want DEPENDS_prepend to always bring in host
virtual gcc/binutils
      mingw-gcc, mingw-runtime, mingw-w32api: Fix DEFAULT_PREFERENCES
to be correct

Bugs fixed:

bug_id resolution        short_desc
5073 FIXED       Local git (git:///path/to/it) URIs don't work
5002 FIXED       Graphviz deps tree generation broken

Bugs opened:

bug_id resolution        short_desc
5083     Support i386-darwin build platform


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


