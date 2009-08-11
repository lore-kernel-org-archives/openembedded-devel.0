Received: from [209.85.211.186] (helo=mail-yw0-f186.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MaqNR-0007HE-UJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 14:22:54 +0200
Received: by ywh16 with SMTP id 16so5807891ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=xf6n/8D+QRlCdIOMwwunDkEzFz3eBdy0RxbtftOgcMs=;
	b=s9K1hIlAesHlSGeqGAwSmkA+e1w0kAy0hSyF2ZxwOlx+2UwAn/SNrttdx9RgT8vcwO
	bojqThzWc/lnn44BOsyiguB1fT0Ih4FcUJn5y1A9XKCp9mTtijXBkcFshvPpj+FZZg00
	wv+n00dn9EYEt4daeTUw7oPLLduX1+Lyztl7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=XPE7GZD9bS8VjjxTreTx3xf7MrvU7XxAqZj/tI/yiXmsd7jtiKMDlyVBCqvkWYo2O4
	JJ0ir2iYEvddznRYp3XAJfqO7ek787+Bf5vsgLYhWGP4p6HKtwmtfGnnHNw3qqBMm1DR
	wLIeMeiQWcXD8VVB3lj9BVNKC0LvtEF/Ghkrw=
MIME-Version: 1.0
Received: by 10.150.216.1 with SMTP id o1mr10563107ybg.136.1249992393909; Tue, 
	11 Aug 2009 05:06:33 -0700 (PDT)
Date: Tue, 11 Aug 2009 08:06:33 -0400
Message-ID: <f96d234e0908110506q35c86b68n1a88ca38e7bb0d36@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-08-03 to 2009-08-10
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
X-List-Received-Date: Tue, 11 Aug 2009 12:22:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-08-03 to 2009-08-10

Andrea Adami (3):
  klibc, klibc-utils-static: bump to Testing/1.5.15
  klibc: reorganize recipes and patches (use FILESPATHPKG)
  klibc_1.5.15 / klibc-utils-static_1.5.15: add 'dmesg' and 'sync' targets

Christopher Friedt (1):
  emotion_svn.bb: Make it look for edje_cc in STAGING_DIR.

Dirk Opfer (9):
  busybox: add new version 1.14.3
  libesmtp: don't package *.a files
  eibd: add eibd.inc
  ntp: update to 4.2.4p7
  owfs: update to 2.7p23
  curl: update to 7.19.5
  lighttpd: update to 1.4.23
  libxml2: update to 2.7.3
  update checksums.ini

Elena Grandi (2):
  ipython: new recipe for version 0.10
  gtksourceview: renamed the 1.x tree to gtksourceview1

Florian Boor (1):
  RFC: eglibc libc6 and tzdata

Holger Hans Peter Freyther (6):
  qt4-tools-sdk: Use an install target to install the qt4 utilities
  meta-toolchain-qte: Export some more paths
  qt4-x11-free.inc: Do not override the var set by qt4-x11-free-gles
  uclibc-initial_0.9.30.1.bb: Fix do_stage for ubuntu karmic
  usermanual: Grammar fix.
  task-qte-toolchain-target: Do not install the full qt4-embedded

Khem Raj (22):
  minimal-uclibc.conf: Make PREFERRED_VERSION_uclibc as condtional assignme=
nt.
  uclibc_nptl: Rev up to a buildable and bootable revision.
  util-linux-ng-2.16: Replace siginterrupt with sigaction.
  python-native_2.6.1.bb: Unset LIBC
  Delete uclibc recipes before 0.9.28
  gcc: Remove gcc 4.1.0 recipes in favour of gcc 4.4.1
  binutils_cvs.bb: objcopy-rename-errorcode patch is not needed anymore.
  sane-toolchain.inc: PREFERRED_VERSION_linux-libc-headers assignment condi=
tio
  gcc-4.4.1.inc: Make gcc 4.1.1 compilable for uclibc targets.
  wvstreams_4.6.bb: Add new recipe.
  ccache_2.4.bb: Cope with .gcno files generated for coverage analysis.
  ttf-sazanami_20040629.bb: Update SRC_URI.
  wmiconfig_svn.bb: Fix build error due to choice of wrong --hash-style.
  gcc-4.4.1.inc: Make cross compile for SH architecture.
  linux-titan-sh4_2.6.21.bb: Include limits.h in sumversion.c
  lilo-sh_21.bb: Replace PAGE_SIZE
  linux-titan-sh4-2.6.21: Provide sidivsi3_i4i and udivsi3_i4i
  sanity.bbclass: Correct typo to refer to PACKAGE_EXTRA_ARCHS
  pciutils_3.1.2.bb: Dont install gzipped versio of pci.ids its not there.
  tune-sh3.inc tune-sh4.inc: Define BASE_PACKAGE_ARCH

Kirtika Ruchandani (1):
  wvstreams_4.4.1.bb: Make it compilable with gcc 4.3

Koen Kooi (5):
  omap3evm: switch to linux-omap-psp till we can get a recent linux-omap to=
 wo
  gedit: depend on iso-codes
  fribidi: add 0.19.2
  angstrom: prefer fribidi 0.19.x over libfribidi 0.10.x

Marc Poulhi=E8s (1):
  gpe-mixer_0.42.bb: Fix fix-install.patch to apply cleanly.

Marcin Juszkiewicz (5):
  vortex86sx: fix MACHINE_FEATURES
  xserver-xorg-conf: make it machine related
  libdrm: split Intel lib into separate package
  xserver-common: added 1.30 + patches
  xserver-common: 1.30 is experimental, do not use by default

Michael 'Mickey' Lauer (9):
  python: add 2.6.2
  python: sync 05-enable-ctypes-cross-build.patch with the version applied =
to
  vala: here comes 0.7.5+fso2
  libgee: 0.1.4 -> 0.3.0
  libcanberra: add 0.14
  freesmartphone: catch up with milestone5.5 and SHR/import
  dbus: add 1.3.0 (DP=3D-1)
  dbus-glib: add 0.82
  checksums: add dbus 1.3.0 and dbus-glib 0.82

Michal Hrusecky (1):
  justreader: fixed build

Phil Blundell (1):
  eglibc-package.bbclass: Replace hardcoded /lib references

Ramax Lo (1):
  u-boot-mkimage-openmoko: Fix SRC_URI

Stanislav Brabec (9):
  libtool: Backported ac_cv_path_SED typo fix.
  libtool: Do not use target paths to grep and sed for cross and sdk builds=
.
  imagemagick: Bump PR to fix possible failure of libltdl check.
  bluez4: Updated to version 4.47.
  pkgconfig: Bump PR to keep incremental versioning.
  gmp: Bump PR to keep incremental versioning.
  xserver-kdrive-1300: Bump PR to keep incremental versioning.
  xcalibrate: Use increment-able PV format as other git version recipes do.

Stefan Schmidt (8):
  sane-srcrevs.inc: Remove duplicated libowl entry
  libsynthesis: Add new recipe for a syncml engine (from poky).
  mux: Add new recipe (from poky).
  Revert "checksums.ini: Change checksums for devmem2.c after upstream chan=
ges
  sane-srcrevs.inc: Bump wmiconfig SRCREV
  checksums.ini: Add sum for new libgee

Steve Sakoman (22):
  gnome-power-manager: fix broken build - don't build man
  alsa-plugins: add 1.0.20
  desktop-file-utils: add 0.15
  devicekit-power: add recipe for devicekit-power version 009
  eel: add 2.26.0
  gcalctool: add 5.27.5
  glibmm: add 2.21.2
  at-spi: add 1.26.0
  libgail-gnome: add 1.20.1
  atk: add 1.26.0
  gconf.bbclass: adjust the ordering of things so that a package pkg_postin=
st_
  gtksourceview: add 2.7.3
  gedit: add 2.6.22
  gnome-python-extras: add 2.25.3
  gnome-terminal: add 2.26.2
  vte: add 0.20.0
  image.bbclass: fix bug in lingua code (code wasn't spitting entries like =
fr-
  gconf: add 2.26.2
  gnome-common: restructure recipes to use gnome-common.inc, add 2.26.0
  gnome-common: one more bit of cleanup
  gconf-editor: add 2.26.0
  gnome-python: add 2.26.1

Bugs fixed:

bug_id resolution        short_desc
5287 FIXED       <public-media-dir>/img/bugs.png missing
5089 FIXED       New Recipe for mumpot-0.5
5201 WONTFIX     make .net hosts CNAMES for .org
5221 FIXED       bugzilla increments bug number by 5
5271 FIXED       emotion_svn fails to build
5277 FIXED       wmiconfig_svn fails due to 'no GNU_HASH' bug
5278 FIXED       wrong SRC_URI for ttf-sazanami
5280 FIXED       fakeroot-native_1.12.1.bb do_fetch failed
5282 FIXED       uClibc 0.9.30.1 / gcc-cross-4.4.0 libstdc++v3 build
failure (possibly locale related)
5290 FIXED       devmem2.c has wrong checksum
5291 FIXED       Building devmem2 fails for fetch checksum mismatch
5130 FIXED       Coreutils-native_7.2 fails to compile
5281 FIXED       ffmpeg_git do_configure fails due to broken git URL

Bugs opened:

bug_id resolution        short_desc


