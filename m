Received: from [209.85.211.198] (helo=mail-yw0-f198.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MnB8l-0004Lk-F3
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 14:58:46 +0200
Received: by ywh36 with SMTP id 36so4562409ywh.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=fw6D/btvLXiAd9HZnbDVdiqnrZO59/lbcW07DKq8apE=;
	b=dfbCaXQ6naCwfdRAHokBy8jCpaDQdPVkaY+C9ZW08MrQtF8kihA5AoRHRv2DHc7Dcu
	a3dpFmT7dgyuwyYu8/TzX2WOUcECwJ+msDCNv6mxDdmTECzMVj01ap/7VeJaflgjybND
	ybRjhtvNJqqRAVfjJMhI2y/zZ+cS3hf/jSvpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=RdmAEcSCrU14Che3oHV/RM0Xo5gBPJbH+YcKwaopAsD8pSb4LhH8Fa9jfVAu58IcrR
	G+bOwqn+C/7BWKoj3qM7z/LHdpyTtnobXrsQxl9XeBGaXPMu8tsVstIREy+83LJrwM3h
	9cjlCBcEdRgXjdiJT8AGD3gzww287CbLw7Dlg=
MIME-Version: 1.0
Received: by 10.151.29.10 with SMTP id g10mr10113026ybj.9.1252933092242; Mon, 
	14 Sep 2009 05:58:12 -0700 (PDT)
Date: Mon, 14 Sep 2009 08:58:12 -0400
Message-ID: <f96d234e0909140558g19ae208fjdd6fbba3f7c312d3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.198
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-09-07 to 2009-09-14
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
X-List-Received-Date: Mon, 14 Sep 2009 12:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-09-07 to 2009-09-14

Antonio Ospite (4):
  device_table-ezx: Add header
  device_table-ezx: Static mux nodes from mux1 to mux8.
  device_table-ezx: Add static ttyIPC device node
  device_table-ezx: Add static video device node.

Brijesh Singh (3):
  lpm, sdma, cmem recipes: rename to match PV
  dvsdk: update README to use ce 2.24.01
  gstreamer-ti: bump SRCREV and apply patch from tracker 462

Cliff Brake (2):
  clearsilver: fix various build issues
  MAINTAINERS: update my entry

Florian Boor (4):
  linux: Update TX27 configuration for 2.6.28
  linux: bump 2.6.28 PR
  canutils: add 3.0.2 - needs recent linux-libc-headers
  checksums.ini: add missing checksum

Graham Gower (3):
  enca_1.9.bb: remove unused configure test which is bound to fail.
  Add liblinebreak-1.2
  glibc: Build glibc 2.9 with glibc-ports 2.9

Henning Heinold (3):
  directfb: update to version 1.4.2
  eject: inherit gettext to honour USE_NLS
  disko: update to newer git rev

Jan L=FCbbe (5):
  libdbi: disable building docs (would need docbook/openjade)
  libdbi-drivers: set libdir for libdbi and don't build docs
  libconfig-general-perl: add recipe
  libsnmp-session-perl: add recipe
  libio-pty-perl libio-stty-perl: add recipes

Jeremy Lain=E9 (1):
  linux-2.6.29: add devicetree for boc02

Khem Raj (22):
  uclibc_0.9.30.1: Disable STDIO_GETC|PUTC MACROs
  autoconf: Fix canadian cross build
  tar_1.22.bb: Add recipe for 1.22 release.
  tune-xscale.inc: Use TARGET_ARCH to find endianness
  cherokee: Add new version 0.99.24
  uclibc-initial: Move the compile stuff to do_compile
  images: Rename native-sdk-console-image.bb as native-sdk-image.bb
  console-image.bb: Require console-base-image
  binutils-cross: Do not install libibery.a in wrong place
  gcc-configure-common: Dont fiddle with NATIVE_SYSTEM_HEADER_DIR
  sane-toolchain.inc: Default to gcc 4.4.1
  native-sdk-image.bb: Use IMAGE_BASENAME =3D "native-sdk-image"
  gcc-configure-cross.inc: Export more binutils
  lsof, tcp-wrappers: Fix compilation on linux-uclibceabi
  binutils_cvs.bb: Do not use autotools_do_install
  gcc-configure-common.inc: Muck with NATIVE_SYSTEM_HEADER_DIR
  screen-4.0.3: Fix compilation and make default.
  powertop: Make it compile on uclibc.
  gcc-configure-common.inc: Fiddle with NATIVE_SYSTEM_HEADER_DIR only form =
cro
  uclibc-initial: Create ${UCLIBC_STAGE_PREFIX}/lib
  sysstat_8.1.6.bb: Fix compilation on uclibc
  nfs-utils_1.1.2.bb: Fix compilation on uclibc

Koen Kooi (22):
  angstrom-uboot-scripts: add recipe to generate .scr files easily
  mplayer: bump SRCREV
  sane-srcrevs: bump mplayer SRCREV
  x-load: git has moved, update SRCREV and remove obsolete patches
  quake2: fix QA errors
  freeimage: fix QA errors
  task-native-sdk: fix upgrade paths after task renaming
  linux-omap: add 2.6.31
  omap3517-evm: add machine file
  linux-omap-psp 2.6.29: add shiva support
  u-boot git: add support for omap3517-evm
  angstrom feed sorter: add shiva support
  linux-omap-psp 2.6.29: add WIP patch for EHCI support
  x-load: add omap3517-evm support
  cairo git: update SRCREV
  gtk+: add 2.16.6
  angstrom: prefer gtk+ 2.16.6
  glibc-package bbclass: add hack to avoid "kernel too old" error when gene=
rat
  clutter.inc: rework armv7a machines a bit and add omap3517-evm to compati=
ble
  libsoup-2.4: update to 2.27.91

Marcin Juszkiewicz (7):
  linux-kirkwood: added 2.6.30.5 tested on sheevaplug
  source-checker: added small script to generate list of files for mirrorin=
g
  marvel-sdio-fw: added firmware for WiFi powered BUGBase
  linux-kirkwood: use proper branch for 2.6.30 (thx Koen for spotting)
  linux-omap: added support for BeagleBUG extension board
  pointercal: added at91sam9263ek
  xserver-common: recommend xtscal (works without it but needs for calibrat=
ion

Michael 'Mickey' Lauer (2):
  libgee: move to git version while it's so much under development and depe=
ndi
  fso-alsa-data: create dummy file so that git doesn't remove the directory

Mike Westerhof (1):
  opkg_wget_nogpg: adjust vfork patchset to accomodate general opkg patchin=
g.

Phil Blundell (1):
  micro: select binutils 2.19.51

Stanislav Brabec (1):
  more files: Fixed unpack dependencies on unzip-native, see:

Stefan Schmidt (3):
  moko-autorev.inc: Remove no longer used file.
  emotion_svn: Remove not needed sed hack for edje_cc.

Steve Sakoman (2):
  i2c-tools: build & install eepromer tools
  ebtables: fix GNU_HASH error

Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc


