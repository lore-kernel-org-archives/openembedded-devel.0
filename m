Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MHIcx-0008SW-DG
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 16:30:07 +0200
Received: by gxk2 with SMTP id 2so1487559gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=D7vex47DyFgnvTiL7aR6+8iDdHTBnxtkvdjXje/g+3g=;
	b=GqkNGFlw0wT2Yhi2lmmoZ4io/ChlIfXMiOXou2eKoaGjd5ZCe0+HqRkQvHs9SuWFhV
	hX1vZsWtEUJy9S/dYh8CbVGhL9x4xEpawTjQwKxwFSKAx2qrO5BDzDphnJz+5tWIK/g0
	qtb/TVl5WvazxZulWF3q46RMhAujfnW4G1Rvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DvlgeUlCPOIQl4C20hHRSBW4KbO3o86vWH6tt0L7cVMCzfYuwbvxkJJO57XldcoTD4
	77urhkanvM/rpy5U6U+Bj2r8kfFus7kOBc6IDPDhjKctgcEOiLqlTrwEc5tTpCqyHl/2
	03/YMsR0W7ub0HIngbly8sC7LV9oM6Lu22smo=
MIME-Version: 1.0
Received: by 10.150.124.11 with SMTP id w11mr3642492ybc.276.1245334772913; 
	Thu, 18 Jun 2009 07:19:32 -0700 (PDT)
Date: Thu, 18 Jun 2009 10:19:32 -0400
Message-ID: <f96d234e0906180719p5c16b3d4pd8c319caf67ce691@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-06-08 to 2009-06-15
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
X-List-Received-Date: Thu, 18 Jun 2009 14:30:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-06-08 to 2009-06-15

Alessandro GARDICH (2):
  kaeilos.conf and SPLASH
  trouble with ext2 filesystem

Chris Larson (1):
  recipe_sanity.bbclass: add initial recipe sanity checker.

Denis 'Gnutoo' Carikli (4):
  guile: added guile and guile-native 1.8.6 using .inc files
  checksums.ini : added guile-1.8.6.tar.gz
  openssh: *add openssh 5.2p1
  checksums.ini: added openssh 5.2p1

Denys Dmytriyenko (1):
  u-boot: add support for DaVinci EVMs, provided by a staging tree

Florian Boor (2):
  tx27.conf: Disable jffs2 cleanmarkers and set preferred X server
  linux: Update 2.6.28 defconfig for tx27

Ihar Hrachyshka (12):
  qt4-embedded: reworked directory layout for the next changes.
  qt4-embedded: added directfb plugin
  qt4: style refinements, more generalization
  qt4-tools-native: use INC_PR
  qt4-x11-free: generalize recipes, port them to INC_PR
  meta-toolchain-qte: initial qt embedded toolchain version
  qt4: fixed regexp pattern for graphics plugins
  qt4: package all installed files
  qt4: fixed pkgconfig for qt4-embedded
  qt4: create mkspecs package
  pkg-config: migrated to INC_PR
  task-qte-toolchain: added mkspecs and new qt4-tools-sdk recipe

Koen Kooi (28):
  irssi: add 0.8.13
  sdrshell: add missing patch
  e-wm config angstrom: remove spurious linebreaks, the wizard has a wider tex
  midori: bump SRCREV
  libsoup-2.4: update to 2.26.2
  webkit-gtk: bump SRCREV
  expedite: more e17 upgrade path tweaking
  gstreamer-ti: bump SRCREV
  chromium: bump SRCREV
  efl: bump SRCREV
  libsoup: actually add 2.26.2 (spotted by Stanislav)
  webkit-gtk: first stab at enabled JIT for armv7a
  kernel-module-udlfb: update to 0.2.3
  xf86-video-displaylink: update to 0.3
  nautilus: add libunique to DEPENDS
  kernel-module-uldfb: sync with mainline, no functional changes
  fontconfig: add fedora branch
  image-magick: fix do_configure
  dsplink: move dir to 'dvsdk' to make merging the TI OE trees easier
  image bbclass: add install_linguas method
  Angstrom: set BUILDNAME
  beagleboard demo image: use install_lunguas

Leon Woestenberg (8):
  linux-powerpc-fsl: Tune defconfig for machine. Fix files path in recipe.
  sysklog-1.5: Remove -s (strip) from install.
  linux-powerpc-fsl: Use FILESPATHPKG
  sysklogd-1.5: Disable strip in Makefile.
  libaio-oracle: Change license from GPL to LGPL. See COPYING.LIB.
  linux-2.6.30: The new Linux kernel. Two days old. Where have you been?

Marcin Juszkiewicz (12):
  binutils: added Maverick support (done by Hasjim Williams)
  glibc: added Maverick support (done by Hasjim Williams)
  angstrom: disable binary locales for ep9312 (tuning) instead of ep93xx (mach
  angstrom: use -O not -O2 for ep9312 tuning
  mpd: make it more buildable
  mtools: change permissions of sources to get quilt apply all patches
  e2fsprogs-native: stage compile_et required by krb5
  krb5: depend on e2fsprogs-native to get compile_et
  weekly-changelog-report.py: limit report line length to 78 chars
  tftp-hpa: fix name of /etc/default/tftp(d)-hpa
  checksums.ini: added xine 1.1.0

Michael Smith (4):
  Add bwm-ng 0.6: lightweight network and disk bandwidth monitor
  busybox: fix udhcpc default script location when prefix is not "/usr"
  busybox: Split syslog initscript into busybox-syslog
  Add iptraf, a heavy-duty bandwidth monitor.

Phil Blundell (42):
  gcc-package-cross: tolerate absence of libstdc++
  uclibc: fix handling of bindir != /usr/bin
  binutils: add 2.19.51
  uclibc: fix glob for FILES
  uclibc: don't use ${OEMAKE_NO_CC} for populate_staging, it breaks uclibc-ini
  directfb-1.2.8: cope with reorganisation of download structure on website
  directfb: try harder to get src_uri correct
  binutils: fix crash when linking uclibc in thumb mode
  base-files: handle DISTRO=micro-uclibc correctly
  uclibc-initial: respect ${CC}
  micro-uclibc: make sure "micro" is in OVERRIDES; use eabi for armeb
  libxcb: look for xproto.xml in staging, not in the host environment
  bitbake.conf: add -g to BUILD_OPTIMIZATION
  enchant: use more sensible FILES
  libidn: add 1.15
  openssl: avoid empty PREFIX since this causes Configure to do the wrong thin
  irda-utils: respect $(sbindir)
  task-gpe: remove xmonobut since SRC_URIs for both versions are unfetchable
  tzdata: fix installation with prefix=''
  console-tools: inherit gettext
  update-rc.d: don't add runtime dependency if not doing online package manage
  gpe-image: figment is unfetchable, punt it from the image
  openobex: relax dependency from bluez4 to generic bluez-libs
  gpe-session-scripts: respect ${bindir}
  gpe-dm: update to 0.52
  figment: update SRC_URI and reinstate in gpe-image
  rootfs_ipk: opkg (at least some versions) doesn't respect ${libdir}, so look
  task-gpe-settings: remove xmonobut, unbuildable and nothing to do with setti
  micro: disable ONLINE_PACKAGE_MANAGEMENT globally
  gcc-4.4.0: add some uclibc patches
  dropbear: adjust packaging for micro
  sysvinit: banish seldom-used utils into sysinit-utils package, recommend it
  sysvinit: move a couple more files to -utils package
  micro-image: remove assignment to ONLINE_PACKAGE_MANAGEMENT, micro.conf sets
  base-passwd: adjust packaging for micro

Philip Balister (1):
  gnuradio-3.2 : Use -program-prefix to remove prefix from programs.

Rolf Leggewie (14):
  xorg-xserver: mark glyphstr.patch as rejected upstream
  minimal.conf: increase number of inodes in ext2 rootfs to 8192.
  minimal.conf: really set inodes in ext2 rootfs to 8192 now.
  guile: libtool 2.x supported in version 1.8.6 and later only.
  tslib: introduce INC_PR
  tslib: RRECOMMEND pointercal for all distributions
  psplash: fix runtime dependencies.  (Partly Closes: #2412)
  libx11: replace virtual/libx11 with virtual-libx11 for runtime #2412
  ttf-fonts: fix runtime dependencies.  (Partly Closes: #2412)
  {qpf|ttf}-fonts: fix runtime dependencies.  (Closes: #2412)
  xtrans: add native 1.2.1 package
  xextproto: add native 7.0.3 package
  libidn: old SRC_URI has become unavailable
  gpe-session-scripts: replace /usr/bin with ${bindir} in 0.67

Stanislav Brabec (7):
  geda: Updated to version 1.4.3.
  midori: Updated to version 0.1.7.
  tangogps: Update to version 0.9.6.
  xserver-kdrive-1.3.0.0: Fixed for new autotools.
  gpsbabel: Fixed for new autotools.
  gammu: Update to version 1.24.0.

Tom Rini (1):
  autotools.bbclass: sdk packages should not depend on libtool-cross

md (3):
  glibc: fixed QA problems
  minicom: fix compile error due to conflicting function names
  xorg-util: use the cross compiler instead of gcc in configure scripts

Bugs fixed:

bug_id resolution        short_desc
4766 WORKSFORME  openssl-0.9.8g-r9: Task failed: Missing field for ipk
generation: 'DISTRO_PR'
1093 WONTFIX     altboot metabug
818 WONTFIX      Creating of images from feeds instead of DEPLOY_DIR_IPK
1759 WONTFIX     altboot mounts vfat SD as ext2
1833 INVALID     Tcl for arm-linux will not build using osx tools
2293 INVALID     udev - function do_stage failed
2425 FIXED       gpm_4.2.1.bb fails do_configure
2433 WORKSFORME  [PATCH] Fix icewm build (once again) on AMD64 build host
2504 WONTFIX     angstrom collie: altboot misses altboot-2.6.cfg file
2623 FIXED       QA Issue prevents ewl_0.5.1.009.bb from building
2706 INVALID     compulab with 2.6.20 cannot build jffs2 image
2806 WORKSFORME  openldap-2.3.11-r4  fails do_configure - perhaps due
to new automake?
2834 INVALID     horizon fails to start due to bad hardcoded path
2953 WORKSFORME  gstreamer_0.10.14.bb do_configure fails for x86_64
3045 WORKSFORME  evince 0.9.2 does not build
3073 WORKSFORME  libetpan fails to link with gnutls
3195 WONTFIX     AltBoot does not mount cf card on collie
3205 INVALID     binutils-2.18-r1 fails to link with libiberty.a
3274 INVALID     uclibc 0.9.29-r8 segfaults
3284 FIXED       glibc-intermediate-2.6.1 compile failed for 2008.1 on i686
3285 INVALID     libnss-mdns-0.9-r0 do_compile fails first time on i686-angstrom
3517 WONTFIX     altboot redirection broken due to a wrong OUT_TTY in
default mode
3537 WORKSFORME  libgpg-error-1.4    function do_compile failed
3557 REMIND      matchbox-panel do_package QA issue
4323 FIXED       glibc build error
5102 INVALID     TMPDIR and switching branches
5117 FIXED       kergoth_sanity.bbclass
4251 WONTFIX     evaluate hg as replacement for monotone
4254 FIXED       bugzilla on amethyst is unpackaged
4309 WORKSFORME  uicmoc4-native-4.3.3-r1-do_compile: endless compilation
4720 INVALID     gettext 0.17 fails to compile
4727 FIXED       enable fastcgi in php
4740 WORKSFORME  do_install failed in e2fsprogs-1.38
4843 WORKSFORME  fetch-pack from 'git://git.infradead.org/mtd-utils.git' failed
4858 WORKSFORME  tiff do_compile failed
4937 WORKSFORME  Build of db-native fails
4938 WORKSFORME  build of git-native fails
5019 WORKSFORME  perl-native-5.8.8 fails
5053 INVALID     libdisplaymigration_0.99 strip issue
5060 WORKSFORME  python-2.6.1-ml4 compile failed:  Floating point exception
5087 FIXED       GNU_HASH in madwifi-ng-r3837-20080802-r1
5121 FIXED       udev-141 has broken all udev images
5166 FIXED       tinderbox on melo is unpackaged
5231 INVALID     test
1059 WONTFIX     altboot screen does not support delete key
2330 INVALID     gpdf missing a library
2232 FIXED       sound and audio players
518 FIXED        [PATCH] tslib: work with different screen resolution

Bugs opened:

bug_id resolution        short_desc


