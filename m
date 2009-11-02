Received: from [209.85.219.225] (helo=mail-ew0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1N4yCa-0000TR-E3
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 15:48:15 +0100
Received: by ewy25 with SMTP id 25so4934713ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 06:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=lUkUVHHRR7PQBg8C2PG//21nxmwRCfcu0Qyn9NQvtDI=;
	b=lRQJx0k0Svu3AqzS+LMushzC0S/Vo8U9SPHGyOy1y42vzuFAbXP2D82uE9I5wUf0za
	eUuI8v+jvzTTxs3Jta5I1gnTULLU+JLMi8ngi0bbyMdPEwT/dc8pTBOSrINZyKDyx8T/
	Cbb9zKY85Q/JhT4aWjhqqXkXMyu/8V02FbS6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=piDM4otsh6ZIefRq2BoP9wiRgpk127qkbBff4HoimwobzZ+KZa+vYLbyyg7uqhN6Kp
	bKecVgVW6Q7dMxQ57bDL6n0uUCG3jcsUnCzR5Hdu/UWtit1VwVM24OWpZc/BKvMcMljg
	k/GB3oBDpKyFC/AhIm/7/XJD/eTk875y+jcio=
MIME-Version: 1.0
Received: by 10.216.87.133 with SMTP id y5mr4628164wee.139.1257173220969; Mon, 
	02 Nov 2009 06:47:00 -0800 (PST)
Date: Mon, 2 Nov 2009 09:47:00 -0500
Message-ID: <f96d234e0911020647u6a5053d9g7eb9123003bbbcdd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-10-26 to 2009-11-02
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
X-List-Received-Date: Mon, 02 Nov 2009 14:48:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm not sure who OE Builder <oebuilder@waffle.bolloretelecom.eu> is,
but perhaps you could check your workspaces and make sure you have
[user] set correctly.  One way to do this globally is set in
~/.gitconfig, then it will apply to all git workspaces.

Cliff

OE weekly changelog 2009-10-26 to 2009-11-02

David-John Willis (23):
  XFCE: Rename xfce to xfce-base to support the import of the new XFCE 4.6.=
1 b
  xfce46.bbclass: Add a helper class for XFCE 4.6 (based on the existing xf=
ce.
  XFCE: Import all the 4.6.1 recipes (and a newer version of xfce-terminal)=
.
  task-xfce46-extras: Don't try and ship themes that are not in 4.6
  xfce46-image: Add very simple Xfce 4.6 image
  xf86-input-evtouch: Use latest Ubuntu package diff and tweak configure.
  tango-icon-theme-enable: Add recipe for enable the icon theme once instal=
led
  pointercal: Add calibration for the omap3-pandora touchscreen.
  keymaps: Add keymap extension for the omap3-pandora.
  x-load.inc: Add support to build a version of x-load that can be loaded o=
ver
  u-boot/x-load: Add support for the omap3-pandora building from trees as g=
it.
  udev: Add local.rules for the omap3-pandora to open up /dev/event* to all=
 us
  udev: Update recipes to package up local.rules.
  devicekit: Update to remove host dependency on Docbook XSLT files.
  fbset-modes: Add fb.modes for the omap3-pandora LCD.
  libsdl-gfx_2.0.11: Fix build by exposing LDFLAGS.
  aufs_cvs: Fix LDFLAGS build error.
  angstrom-led-config: Add LED setup for the omap3-pandora and bump PR.
  netbase: Add another host to the omap3-pandora hosts.
  base-files: Add base files for the omap3-pandora.
  psplash-omap3pandora: Add psplash splashscreen for the omap3-pandora.
  xchat: Add 2.8.6 release (and fix package to include d-bus service files)=
.
  libgtkstylus: Fix session script to support loading of more than one GTK_=
MOD

Enric Balletbo i Serra (2):
  linux-igep2: Fix audio capture, the capture result is always silence
  u-boot: add IGEP v2 support to 2009.08 release

Enric Balletb=F2 i Serra (2):
  xserver-xf86-config: Add version for IGEP v2 board
  netbase: Add version for IGEP v2 board

Florian Boor (1):
  prelink: Change postrm script to prerm. Calling 'prelink' after removing =
the

Frans Meulenbroeks (23):
  tgt (Linux SCSI target framework) : recipe created
  tgt: updaded recipe to use ${PV} for download
  open-iscsi: added recipe; still needs stress-testing
  open-iscsi: added MACHINE_KERNEL_PR_append =3D "a"
  open-iscsi-user: added RRECOMMENDS
  mythtv: created recipe for 0.22rc1 (based upon svn version)
  mythtv: add S, REALPV, PR
  mythtv: made it compile for armv5te too
  Revert "package.bbclass: Cleanup getVar syntax to use True, not 1 as thir=
d a
  linux-kirkwood: updated defconfigs (more modules, more filesystems in ker=
nel
  Revert "Revert "package.bbclass: Cleanup getVar syntax to use True, not 1=
 as
  mythtv: added staging
  mythplugins: created recipe, not fully tested yet
  checksums: added mythplugins checksum
  mythplugins: added a few lines of comment for clarification
  mythtv: updated staging, fixed configure; renamed recipe
  mythplugins: added more plugins, packaging is not complete yet
  mythtv, mythplugins: updated to 0.22rc2

Graeme Gregory (3):
  proxy-libintl_20080418.bb : add an SONAME to library
  site/avr32-common : add values for ORbit2 taken from debian avr32 logs
  site/avr32-common : fix search replace damage in last commit

Gregoire Gentil (6):
  x-load: sync touchbook patches with AI repo
  u-boot git: sync touchbook patches with AI repo
  linux-omap 2.6.29: sync touchbook patches with AI repo
  perl 5.8.8: pass unidatafiles as extra arg to miniperl
  checksums: merge checksums with AI repo
  perl: sync extra perl recipes with AI repo

Gr=E9goire Gentil (2):
  gnome-mplayer: tweak defaults
  fbreader: add 0.10.7

Holger Hans Peter Freyther (1):
  Revert "binutils-cross-sdk: Avoid QA error on building"

Jeremy Lain=E9 (11):
  update-rc.d.bbclass: make prerm and postrm dpkg-compatible
  linux-2.6.31: remove SPI patch for boc01, use devicetree instead
  klibc-1.5.15: fix build against 2.6.31 linux headers
  linux-2.6.31: add defconfig for qemux86
  linux-2.6.31: use standard GPIO drivers for boc01
  linux-2.6.31: declare boc01 LED in devicetree
  linux-2.6.31: initialise GPIO states on boc01

Khem Raj (2):
  eglibc: Forward port armv4t-interworking patch
  eglibc: Backport IO-acquire-lock-fix.patch

Koen Kooi (38):
  file-roller: add unzip to RDEPENDS
  gnome-panel: refresh idl-sysroot patch for 2.28.0
  linux-omap-pm 2.6.29: sync touchbook patches with linux-omap kernel
  squashfs-tools: add checksum
  bitbake conf: put static libs in ${PN}-static
  package bbclass: don't strip static libs so aggressively
  glibc package bbclass: tweak library packaging
  bison: put liby.a in ${PN}
  flex: put libfl into ${PN}
  libxml2: stop overriding PACKAGES
  angstrom: change *glibc build to -Os
  angstrom: switch to linux-libc-headers 2.6.31
  angstrom: add an option to use -Wl,--as-needed for glibc builds
  xfce 4.6.x: more SRC_URI and checksum tweaks
  gnome-python: fix 2.26.1 build, add 2.28.0
  angstrom: bump samba and python
  u-boot-omap3pandora: fix typo in recipe
  midori: add 0.2.0
  webkit-gtk: bump to 1.1.16
  omap3-pandora: fix uboot provider
  mythtv 0.22rc1: fix PV
  gtk+: add 2.18.3
  angstrom: bump gtk+
  gnumeric: add 1.9.14
  goffice: fix packaging
  asio: add boost to DEPENDS
  abiword: add 2.8.0
  task-beagleboard-demo: switch to nm-applet and abiword-meta
  angstrom-gpe-task-settings: remove comman-applet
  angstrom-uboot-scripts: add more scripts
  omap3517-evm: omap3517 was the pre-production name, AM3517 is the product=
ion
  angstrom: bump DISTRO_PR and some cleanups
  checksums: add xf86-input-tslib 0.0.6
  abiword 2.8.0: band-aid packaging before overhauling it
  abiword: replace 2.8.0 with 2.8.1, some crashes fixed and libtool macros =
upd
  revert sane-srcrevs: add webkit-efl|gtk:
  mythplugins: move into mythtv directory
  pixman git: add more NEON patches, bump SRCREV

Leon Woestenberg (1):
  linux-kirkwood-2.6.31: Add PCI Express support for openrd-base.

Marcin Juszkiewicz (11):
  nhk15: added machine config for ST Microelectronics NHK15 devboard
  linux: added NHK15 support for 2.6.20 version
  xserver-kdrive-nomadik: added 1.3.0.0 version
  xserver-kdrive-nomadik: mark as nhk-15 only
  sgalib: NHK-15 library for userspace access to graphics acceleration
  tzdata: added 2009p
  nhk15: added uImage parameters
  checksums.ini: added X11 r7.5 entries
  xf86-input-tslib: added 0.0.6
  u-boot: added Sheevaplug support

Mario Domenech Goulart (3):
  chicken: added SONAME support for chicken 4
  chicken.inc: fixed vars passed to the build system (LIBRARIAN, TARGET_C_C=
OMP
  chicken-native_4.2.0.bb: added

Michael 'Mickey' Lauer (2):
  vala-dbus-binding-tool-native: remove redundant inherit autotools
  fso-monitord: remove dependency on frameworkd

Michael Smith (1):
  gitver.bbclass: fix git dependency tracking

OE Builder (5):
  linux-2.6.31: add driver for boc01 buttons
  linux-2.6.31: make capsense keys remapable for boc01
  linux-2.6.31: improve GPIO support for boc01
  linux-2.6.31: add support for multiple buttons on boc01
  linux-2.6.31: fix GPIO keys for boc01

Otavio Salvador (4):
  chicken: revamp recipes
  lzma: update to 4.65 and use INC_PR
  squashfs-tools: add lzma support in 4.0 version
  conf/bitbake.conf: use mksquashfs -lzma for squashfs-lzma images

Richard Purdie (1):
  package.bbclass: Cleanup getVar syntax to use True, not 1 as third argume=
nt

Rolf Leggewie (3):
  tzcode: update to 2009p
  tzcode: only update tzdata SRC_URI to 2009p.  Fixes previous commit.
  ballfield: fix spelling mistake that prevents a build. s/vrtual/virtual/

Sebastian Spaeth (1):
  sane-srcrevs: add webkit-efl|gtk

Steffen Sledz (2):
  ltrace_0.5.3: missing checksum added
  ltrace_0.5.3: some more missing checksums added

Steve Sakoman (1):
  gedit-plugins: add 2.28.0

Thomas Kunze (2):
  add collie patches for 2.6.31 kernel
  tune-strongarm.inc:

Xerxes R=E5nby (2):
  llvm2.6: Updated to use llvm 2.6 release tarball.
  llvm2.6: fix checksum

Bugs fixed:

bug_id resolution        short_desc
4437 FIXED       squashfs3.3+lzma patch for 2.6.24 kernel

Bugs opened:

bug_id resolution        short_desc


