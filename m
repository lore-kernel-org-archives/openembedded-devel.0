Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OOEQc-0004p6-9E
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jun 2010 20:30:36 +0200
Received: by wyb39 with SMTP id 39so360412wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=M4TePpnK4Cb3RBRYm/w2C9fmXp9jU0FqYPpIwS+6Fs8=;
	b=pqTS7uMxMiuaTXeT57rhwhbbNJLy0iwAArTeZhTKTpZEKTClJSoWbuh6a8w3MDzdI3
	27kcmS4BixkeY7fr7yV7l7N0EGADjxgdu+DiZudFv0mKg1y/8gSG2LCbZvHZQ/UQ+ph7
	wpxMKQ8jJJajmW7+9GT/YK0k/xI/IaBn6Dqxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uzANqFOaQVWo+XaNNSH4NRHsiEOaW+qwenUM+W+LYMHw0+yb3vAuJp/OkA62YZjj5d
	H2AIPNYbcv6QxHgODrv9qDVT/SKFBx+xMNqbuyRMZnCLayNh011o+6lOOW/v+GiLS9Yf
	eROPxFBeRsArVBNxwak79YJZPtab6tutkT/Dk=
MIME-Version: 1.0
Received: by 10.216.91.81 with SMTP id g59mr2711701wef.83.1276539965092; Mon, 
	14 Jun 2010 11:26:05 -0700 (PDT)
Received: by 10.216.19.76 with HTTP; Mon, 14 Jun 2010 11:26:04 -0700 (PDT)
Date: Mon, 14 Jun 2010 14:26:04 -0400
Message-ID: <AANLkTikOOg0QYJvgUr9wJJMgXCn4QSm1qdkWLlAEyS0O@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-06-07 to 2010-06-14
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
X-List-Received-Date: Mon, 14 Jun 2010 18:30:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-06-07 to 2010-06-14

Andrea Adami (2):
  linux_2.6.34: add defconfig for c7x0 and akita
  psplash-zap: default to RRECOMMENDS_${PN} = "${SPLASH}"

Bernhard Reutner-Fischer (1):
  uclibc_git: keep PV at "git"

Brijesh Singh (7):
  ti-dmai_svn: move the common build code in ti-dmai.inc
  ti-dmai_2.10.00.xx: add recipe to build released dmai versions
  ti-codecs-dm365_3.10.00.05: add newer version of codec server
  ti-codecs-omap3530_1.00.01: add LICENSE field
  ti-codecs-dm355_3.10.00.00: add dm355 codec recipie
  gstreamer_ti: use latest svn rev and apply the patches from tracker 1055.
  ti-dvsdk-demos_3.10.00.14: add newer version

Chris Larson (8):
  packaged-staging.bbclass: fix typo, it's PSTAGE_TMPDIR_STAGE, not PSTAGE_TMD
  Add a rm -rf utility function and use it in packaged-staging.bbclass
  bitbake.conf: use := for BUILD_OS and BUILD_ARCH
  bitbake.conf: don't filter out nonexisting paths from FILESPATH
  bitbake.conf: make the EXTENDPE bits slightly less disturbing
  bitbake.conf: Drop some unnecessary getVar usage in python snippets
  utils.bbclass: set close_fds=True by default for the popen helper
  Drop some unnecessary immediate assignments

Denis 'GNUtoo' Carikli (5):
  netbase: add support for htcdream
  linux-leviathan: permit booting directly with fastboot
  scummvm: convert to INC_PR
  scummvm: add version 1.1.1
  linux-leviathan: fix the "empty.gz already exists" message

Dmitry Eremin-Solenikov (2):
  lite5200: update machine config
  linux-2.6.34: add support for Lite5200 board

Frans Meulenbroeks (7):
  scsi-target: updated to 1.4.20.1
  tgt: updated to 1.0.5
  libvpx: added --disable-install-docs to configure
  lirc: moved 0.8.5 to 0.8.6+cvs20100613
  mythtv/myththemes/mythplugins: moved from 0.22+fixes to 0.23+fixes
  MAINTAINERS: updated my entry

Henning Heinold (10):
  cacao-native: add mercurial recipe
  xorg-proto-common.inc: remove do_stage function
  xproto: convert to BBCLASSEXTEND
  zziplib: convert to BBCLASSEXTEND and use new patch system
  inputproto: converted to BBCLASSEXTEND
  bigreqsproto: converted to BBCLASSEXTEND
  xcmiscproto: converted to BBCLASSEXTEND
  xextproto: converted to BBCLASSEXTEND
  xf86bigfontproto: converted to BBCLASSEXTEND
  tgt: unbork then recipe, next please look better into it

Khem Raj (19):
  gcc-4.5: Fix libstdc++ build for ARM
  gcc-cross: Don't stage libiberty.a in sysroot.
  uclibc_git.bb: Bump SRCREV to latest master.
  libpam_1.1.0.bb: Add patch to fix running with DB5
  gcc-4.5.inc: Enable -flto on 4.5 so it can be used but its not on by default
  libelf_0.8.13.bb: Add recipe
  libpam-1.1.1: Add recipe.
  gcc-4.5: flto requires libelf as dependency
  libelf_0.8.13.bb: Provide libelf-native using BBCLASSEXTEND.
  gcc-cross_4.5.bb: Add libelf-native to DEPENDS
  gcc_4.5.bb: Add lto to gcc package.
  shadow-4.1.4.2: Add patches to support dots in login id.
  run-qemu.sh: Suppport option to boot into single user shell.
  minimal-uclibc.conf: Add pam to DISTRO_FEATURES
  lib/oe/patch.py: Dont import patches but symlink them instead
  Revert "lib/oe/patch.py: Dont import patches but symlink them instead"
  gdb_7.1: Add patch to shut a warning when we boot into shell.
  lib/oe/patch.py: Dont import patches but symlink them instead
  eglibc: Apply backports to 2.11 and 2.12

Koen Kooi (12):
  qt4: first part of mediaservices packaging
  psplash-zap: ${SPLASH} is an image var so don't make a *package* depend on i
  psplash-zap: fix another regression for angstrom
  ti-dmai: increase PV of svn version to 2.x
  ti-codecs-dm355: prefer version that is publically available
  gstreamer-ti: enable omapdmaifbsink for omap3
  gstreamer-ti: reinstate omapfb header check
  gstreamer-ti: reinstate LINUXKERNEL_INSTALL_DIR
  gstreamer-ti: prettify postinst and postrm
  gstreamer-ti: fix typo in omp3 init script that prevents modules from being
  gstreamer-ti: bump PR for last change
  EFL: bump SRCREV

Marco Cavallini (2):
  kaeilos-2009-preferred-versions.inc: some distro version updates and mainly
  qt-4.6.2.inc: solved a bug when trying to append an empty string to the qtde

Martin Jansa (28):
  linux-openmoko-2.6.32: add patch for building with gcc-4.5.0 (backport from
  linux-openmoko-2.6.34: add slow resume fix #2337
  ttf, ttf-dejavu: fix-up after RDEPNDS_PN global change
  qt-4.6.2+4.7.0-beta1: fix SRC_URI and S after c070de32d40dd561b63de5b4f41baa
  qt4-tools-native_4.7.0-beta1: add Xau and Xdmcp to xlib.pro config.test
  linux-openmoko-2.6.34: bump SRCREV, remove applied pcf patch
  linux-openmoko-2.6.29: fix for lost touchscreen bug #2328
  postgresql: add version 8.4.4
  shr: prefer postgresql 8.4.4
  debian.bbclass: call objdump from binutils-cross
  gpsd: add libgpsd package
  debian.bbclass: remove unwanted inherit leftover (from trying oe_popen inste
  insane.bbclass: set PATH before calling desktop-file-validate
  ecore: remove no longer available --enable-ecore-txt
  evas: don't use SRCNAME in FILES and RREPLACES as efl.bbclass is using PN
  EFL: bump SRCREV to new snapshots
  packages: PR bump after EFL SRCREV change resulting to different .so names.
  opkg: bump SRCREV for fix preventing overeager removing of files which were
  navit: bump PR after libgps naming fix
  elementary: try to fix upgrade path from older -themes and -configs subpacka
  qt-4.7.0-beta1: build fix for demos/browser
  opkg-utils: convert to new staging, BBCLASSEXTEND native, fix QA GNU_HASH er
  navit: bump SRCREV
  navit: split config, dbus, speech, gui, graphics to separate packages
  recipes: conform to OE packaging guidelines with RSUGGESTS/RPROVIDES/RCONFLI
  recipes: bump PR/INC_PR for packages changed in RDEPENDS/RRECOMMENDS/RSUGGES
  opkg: bump SRCREV for better fix of #50 (incorrect removal of orphaned files
  shr-e-gadgets: bump SRCREV for more sleep

Michael 'Mickey' Lauer (1):
  vala: add 0.9.1.1

Mike Westerhof (1):
  SlugOS: task-slugos.bb - Adjust packages to fit in available flash space.

Otavio Salvador (1):
  freerdp: add

Robert Schuster (2):
  db4.inc: Change SRC_URI to a FreeBSD mirror (link on Oracle site does not wo
  llvm.inc: fixed typo.     llvm2.7 2.7: Build with shared library, added patc

Roman I Khimov (27):
  flex: convert to INC_PR
  dropbear: switch to INC_PR
  dropbear: support comma-separated list of addresses in port spec
  libio-compress-base-perl: remove useless FILES definition
  libio-compress-zlib-perl: remove useless FILES
  libcompress-zlib-perl: add missing dependencies
  libxml-simple-perl: s/RDEPENDS/RDEPENDS_${PN}/
  perl 5.10.1: fix sporadic "Use of uninitialized value $x in scalar assignmen
  procps: handle pgrep through alternatives
  libmail-spf-perl: add missing perl dependencies
  perl 5.10.1: a bit more module runtime dependencies
  spamassassin: add missing perl dependencies
  spamassassin: remove lsb bits from init script
  spamassassin: add prepackaged rules
  libio-zlib-perl: add missing dependency
  libmail-spf-perl: fix bad interpreter in spfquery executable
  clamav: convert to new staging
  clamav: introduce version 0.96.1
  corosync: update to version 1.2.3
  openais: update to version 1.1.3
  ebtables: add version 2.0.9-2
  iproute2: add version 2.6.34
  xtables-addons: new recipe
  iperf.inc: don't disable threads for everyone
  iperf: remove version 1.7.0
  iperf: switch to INC_PR
  iperf 2.0.4: import Debian patches

Stefan Schmidt (2):
  linux-zigbee: Bump rev to fix some problems with channel setting in 802154
  u-boot_git: Add patch for BUG20 HDMI video setting. Bump PR.

Tom Rini (11):
  bluez: Switch to FILESPATHPKG
  clutter-gtk: Drop unnecessary FILESPATH
  dpkg-native: Drop unnecessary FILESPATH
  gcc-csl-arm-2007q3: Switch to FILESPATHPKG
  gtk+-fastscaling: Switch to FILESPATHPKG
  ncurses{,-native,-sdk}: Drop unnecessary FILESPATH
  php-native: Drop unnecessary FILESPATH
  unionfs: Switch to FILESPATHPKG
  vsftpd-charconv: Switch to FILESPATHPKG
  ncurses: Switch to INC_PR and BBCLASSEXTEND.  Fix ncurses-sdk and terminfo
  psplash-zap: Recommend virtual-psplash not psplash-angstrom

Vladimir Sorokin (6):
  ipset: Initial commit
  flex-2.5.35: create lex and flex++ symlinks
  libtree-simple-perl: Initial commit
  at: fix GNU hash QA error (force LDFLAGS)
  rp-pppoe: fix GNU hash QA error (force LDFLAGS)
  libxml-simple-perl: add missing runtime dependency

Yuri Bushmelev (1):
  cmake_2.6.4: Patch added to fix compilation when FORTIFY_SOURCE is enabled

pieterg (1):
  gitpkgv: new


=====================================================
OE weekly changelog for holger/staging-branch, 2010-06-07 to 2010-06-14


=====================================================
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


