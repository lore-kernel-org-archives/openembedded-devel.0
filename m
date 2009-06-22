Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MIkDz-0004dU-EC
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 16:10:19 +0200
Received: by gxk2 with SMTP id 2so4628660gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=H21QnighdlHjhQ3UjAwFXY7oiF+KCZF46ntJoyn99zY=;
	b=bPYH1K7IUR9s4EGpvUej8BqnUlajNWSRZ/p2TjsSZ5X1evb/0WqsUOY9FZkWoMpnwk
	XOB3wRzLIoyRS0HlCcdxIEXMpMe+VQ3CqxM0lK/6v5xzWJiBJV8Z1JlfNc1NZkbOLPEM
	BzpNG39y8qpLudAXgbE0qamPMlnRzQDBsdxDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=m5wLdPVdiy5hQRZ767UBIl77UtiwCwrmSBEw31v/wSj/Vu0zpRCM4Pyrng0hartr/f
	DshIkYVy8lgYxzKU+b4PP5OiNwD6aTeT8syJpEBXbYLTK+IdhNjwOPsvSpwjuv+IQYa7
	V2tywA+azoTLDY0YkZ1ZAnY7E8Z43bSK4qb5E=
MIME-Version: 1.0
Received: by 10.151.111.1 with SMTP id o1mr11402878ybm.11.1245679159534; Mon, 
	22 Jun 2009 06:59:19 -0700 (PDT)
Date: Mon, 22 Jun 2009 09:59:19 -0400
Message-ID: <f96d234e0906220659m13cc4e20v14a88a49559df359@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-06-15 to 2009-06-22
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
X-List-Received-Date: Mon, 22 Jun 2009 14:10:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-06-15 to 2009-06-22

Andrea Adami (5):
  kexecboot: new SRC_URI
  checksums.ini: follow kexecboot SRC_URI changes
  zaurus-kernel.inc: remove MACHINE_KERNEL_PR settings (optional now)
  kexecboot: sanitize recipe
  kexec-tools: rename static recipes built against klibc

Chris Larson (10):
  image.bbclass: remove tmp/rootfs after image creation unless you set a va=
ria
  rootfs_ipk.bbclass: add log_check for "Cannot satisfy the following depen=
den
  task.bbclass: add missing 'import bb'.
  base.bbclass: make git fail silently in the metadata scm bits.
  base.bbclass: set PATH when calling git for metadata scm bits.
  recipe_sanity: add check for PACKAGES in native/cross and split to recipe=
_sa
  recipe_sanity.bbclass: add check to handle bugs wrt var expansions in var=
 na
  recipe_sanity.bbclass: add checks for missing/default variables
  recipe_sanity.bbclass: add checks for "bad" vars like RDEPENDS/RPROVIDES.
  recipe_sanity.bbclass: only check RPROVIDES/RDEPENDS in target recipes.

Denys Dmytriyenko (1):
  alsa-utils: fix linking against host libc.so/libm.so

Dieter Thimm (1):
  This is the Boardfile, defconfig, Kerneldiff and adapted bb file for the =
new

Dmitry Eremin-Solenikov (13):
  libnl: fix compilation with new toolchain
  madwifi-ng: update the SRC_URI for snapshots
  checksums.ini: follow the change of madwifi-ng SRC_URI
  madwifi-ng: new snapshot
  linux-2.6.29: add a default kernel for tqm8540
  linux-2.6.29: add a default kernel for tqm8540
  u-boot: set PACKAGE_ARCH to MACHINE_ARCH in .inc
  u-boot: drop PACKAGE_ARCH from individual recipes
  u-boot: upgrade at91sam9g20ek from 2009.01 to 2009.06
  lowpan-tools: bump git srcrev
  glibc-2.9: fix builds for arm-oabi

Florian Boor (7):
  linux-mini2440: update defconfig, enable wifi driver
  linux-mini2440: Update kernel recipes (merged from mini2440 OE git)
  mini2440.conf, micro2440.conf: Pull wifi firmware into images.
  micro2440.conf, mini2440.conf: Set u-boot entry point currectly.
  linux-mini2440: Improve bad kernel configration a little bit. Makes wifi =
(WN
  linux: Use 2.6.30 for the TX25
  zbar: New recipe for zbar barcode decoder.

Holger Schurig (2):
  glibc: fix "extract" and "munge"/"configure" for ancient glibc 2.3.5+cvs
  glibc: move missing ld.so.conf into correct directory

Jeremy Lain=E9 (2):
  glibc_2.[79].bb: remove extra quote from SRC_URI for powerpc

Koen Kooi (51):
  Angstrom: build with -ggdb3 by default
  dvsdk: sync with TI overlay (http://arago-project.org/git/people/?p=3Dbri=
jesh/
  iputils 20071127: touch up debian patches
  image.bbclass: unbreak postinst status in the install_lingua method
  enlightenment: bump SRCREV to latest rev before soname change
  checksums: add more checksums
  clutter 0.9: update SRCREV, fix gtk-doc properly
  libgles-omap3: add support files for .08 release
  angstrom 2009.X: switch to glibc 2.9
  angstrom feed buider: add dialog and unzip
  libpcre: fix staging and packaging
  gnote: add 0.5.0
  gnome-bluetooth: bump SRCREV
  Angstrom: fix OESTATS_SERVER host
  e-wm config angstrom: add support for more flavours
  libgles-omap3: add recipe for .08 release
  e-wm config angstrom: update widescreen config
  e-wm config angstrom: add config for touchscreen devices (illume based)
  task-beagleboard-demo: add more e-wm configs
  e-wm config angstrom: add PACKAGES_DYNAMIC
  ffmpeg git: lower default pref now that 0.5 covers arm and avr32 decently=
 (g
  Revert "linux-2.6.29: add a default kernel for tqm8540"
  checksums: add some more checksums
  ti-dmai: bump SRCREV and fix path to cross-compiler
  gstreamer-ti: fix build with non-external toolchains
  geoclue: update to 0.11.1 + git
  linux-omap-pm git: start syncing with linux-omap non-pm
  linux-omap-pm: add .6.29 recipe so the git one can move to 2.6.30
  util-linux-ng: fix packaging, u-a and replace hardcoded paths
  util-linux-ng: only delete bogus symlink, not all swap* binaries for craz=
y p
  clutter(-gst)-0.9: fix GLES build
  angstrom: inheric recipe_sanity by default
  image bbclass: fix logic buglet in lingua code
  linux-omap pm 2.6.29: tweak versioning, attempt to get sound working for =
bea
  checksums: add more checksums
  dvsdk: sync with TI overlay, but change a few things:
  angstrom source mirror: blacklist some more packages
  angstrom feed uploader: blacklist some more packages
  Angstrom feed builder: build dvb apps as well
  dvb-apps: update to current state
  gtk-engines: provide RREPLACES for gpe-theme-clearlooks
  linux-kirkwood: update to 2.6.29.5, enable more usb drivers
  fennec: use native bpp to speed up rendering on 16bit framebuffers
  dvb*: update SRCDATE, fix QA stuff

Leon Woestenberg (2):
  linux-2.6.30: Added to checksums.ini
  u-boot: Added 2009.06. Machine mpc8315e-rdb uses it now.

Lynn Lin (1):
  rootfs_deb: Update IMAGE_ROOTFS variable usage to be consistent

Marcin Juszkiewicz (4):
  fbprogress: make it work better
  fix for MACHINE_KERNEL_PR stuff
  checksums.ini: added connman 0.18 and connman-gnome 0.5
  kernel.bbclass: remove not used 'pr' variable - spotten by Koen

Phil Blundell (26):
  netbase: don't ship update-inetd if not doing online package management
  Revert "bitbake.conf, lib_package.bbclass: fix packaging of ${base_libdir=
}/*
  procps: adjust FILES so that libproc-*.so lands in ${PN}
  irda-utils: note that this patch isn't wanted upstream
  xcb: note that this patch isn't wanted upstream
  binutils: note that uclibc-segfault.patch is already upstream
  busybox: add less bloated defconfig for micro
  rootfs_ipk: move "mkdir /etc/opkg" inside ONLINE_PACKAGE_MANAGEMENT condi=
tio
  micro-base-image: new image
  binutils, irda-utils, libxcb: remove extraneous hashes that were disrupti=
ng
  busybox: fix typo in defconfig for micro
  dropbear: last micro change was a bad idea, revert it
  udev: fix confusion in naming of subpackage RDEPENDS
  base-files: add /sys for micro
  sysvinit: make sure /sys is mounted at bootup
  busybox: make udhcpc script work in absence of legacy net-tools
  kernel.bbclass: don't add dependency on update-modules if not doing O_P_M
  busybox: fix up some recipes with custom SRC_URIs
  util-linux-ng: fix packaging for prefix=3D''
  micro-uclibc: avoid selection of crazy iphone stuff as provider for iconv
  micro{-uclibc}: use ${LIBC} instead of PREFERRED_LIBC, per suggestion fro=
m T

Philip Balister (4):
  gnuradio : Fixes for usrp support files packaging.
  fann-2.0.0 : Add recipe for Fast Artificial Neural Network Library.
  gnuradio : Remove older recipes.
  gnuradio : Update .inc file and other updates

Rolf Leggewie (6):
  preferred-xorg-versions-X11R7.4.inc: pin xextproto-native and xtrans-nati=
ve
  kakasi: remove S definition from native recipe
  uim: remove S definition from native recipe
  siteinfo.bbclass: add support for via C3 host
  tslib: update SRCREV to 77.  (Closes: #518)
  ruby: introduce SHRT_VER to follow recent restructuring of upstream FTP s=
erv

Roman I Khimov (1):
  Make package_update_index_ipk proper task with locking

Stanislav Brabec (5):
  xserver-kdrive-common.inc: Introduce PKGN variable that allows to set pac=
kag
  xserver-kdrive-1300: Package xserver-kdrive-1.3.0.0 under another name to=
 al
  conf/machine/akita.conf and conf/machine/spitz.conf: Revert to xserver-kd=
riv
  angstrom-x11-base-depends: Bump PR to get new XSERVER for spitz and akita=
.

Tom Rini (27):
  pax-utils-native: Install into layout_exec_prefix not layout_prefix
  meta-toolchain: Use ${layout_base_libdir} not usr/lib for opkg.
  gcc-3.3.4: Use INC_PR
  gcc-3.4.3: Switch to INC_PR
  gcc-3.4.4: Switch to INC_PR
  gcc-4.1.0: Switch to INC_PR
  gcc-4.1.1: Switch to INC_PR
  gcc-4.1.2: Switch to INC_PR
  gcc-4.2.2: Switch to INC_PR
  gcc-4.2.3: Switch to INC_PR
  gcc-4.3.1: Switch to INC_PR
  gcc-4.3.2: Switch to INC_PR
  gcc-4.4.0: Switch to INC_PR
  gcc-package-sdk.inc: ${layout_base_bindir} is not the path to where the r=
eal
  binutils-cross-sdk: ${layout_base_bindir} is not the path to where the re=
al
  binutils-2.14.90.0.6: Switch to INC_PR
  binutils-2.14.90.0.7: Switch to INC_PR
  binutils-2.15.94.0.1: Switch to INC_PR
  binutils-2.16.91.0.6: Switch to INC_PR
  binutils-2.16.91.0.7: Switch to INC_PR
  binutils-2.17.50.0.12: Switch to INC_PR
  binutils-2.18.50.0.7: Switch to INC_PR
  binutils-2.18: Switch to INC_PR
  binutils-2.19.1: Switch to INC_PR
  binutils-2.19.51.0.3: Switch to INC_PR
  binutils-2.19: Switch to INC_PR
  binutils-cvs: Switch to INC_PR

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
3285 INVALID     libnss-mdns-0.9-r0 do_compile fails first time on i686-ang=
strom
3517 WONTFIX     altboot redirection broken due to a wrong OUT_TTY in
default mode
3537 WORKSFORME  libgpg-error-1.4    function do_compile failed
3557 REMIND      matchbox-panel do_package QA issue
4323 FIXED       glibc build error
5117 FIXED       kergoth_sanity.bbclass
4251 WONTFIX     evaluate hg as replacement for monotone
4309 WORKSFORME  uicmoc4-native-4.3.3-r1-do_compile: endless compilation
4720 INVALID     gettext 0.17 fails to compile
4727 FIXED       enable fastcgi in php
4740 WORKSFORME  do_install failed in e2fsprogs-1.38
4843 WORKSFORME  fetch-pack from 'git://git.infradead.org/mtd-utils.git' fa=
iled
4858 WORKSFORME  tiff do_compile failed
4937 WORKSFORME  Build of db-native fails
4938 WORKSFORME  build of git-native fails
5019 WORKSFORME  perl-native-5.8.8 fails
5053 INVALID     libdisplaymigration_0.99 strip issue
5060 WORKSFORME  python-2.6.1-ml4 compile failed:  Floating point exception
5087 FIXED       GNU_HASH in madwifi-ng-r3837-20080802-r1
5121 FIXED       udev-141 has broken all udev images
5166 FIXED       tinderbox on melo is unpackaged
5211 INVALID     Example profile corrupts the path and prevents
classpath to build successfully
5231 INVALID     test
1059 WONTFIX     altboot screen does not support delete key
2330 INVALID     gpdf missing a library
2232 FIXED       sound and audio players
518 FIXED        [PATCH] tslib: work with different screen resolution

Bugs opened:

bug_id resolution        short_desc
5246     opie for qemuarm freezes (udev start sequence problem)


