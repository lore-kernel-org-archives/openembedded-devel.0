Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OauZr-0005Zl-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 19:56:42 +0200
Received: by wye20 with SMTP id 20so4900489wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=ac+JBhhuk3XsZaRAgrJn0qhAF25roJIjMYjJHJ59g5I=;
	b=Uq0Z7scwkU/u+GR+Ckj4elLp86XjiLjzgALbjAY5a2qWT4QtKuLe4lWC6tCcQZD/Wi
	CMfui12YunW6LJwR0srBM9ye0D2FaxJxcUaGQ6srnsI5vukeKZ+41uhDtDVXU9vWzbDW
	f2xdGyPCo1R0VNkPIERa+GGjGOw57v+2+81SM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=wZlV3erN6H/QhwNbTfcTYs/ZeE96b4ddXi2T4pO2lnJ4giE8jwV+E1gfMg2krBN76V
	e8runPHeClhTOpTvVsHGKVPEUL5UwzUxajrk3DYzvdDE9BKJrnQNZ8l/r1D38pmNKGxn
	IsNt55bc3rYyErrJf9aFb5ymQv4OYaVtapyJg=
MIME-Version: 1.0
Received: by 10.227.157.70 with SMTP id a6mr4391261wbx.163.1279562182915; Mon, 
	19 Jul 2010 10:56:22 -0700 (PDT)
Received: by 10.216.234.165 with HTTP; Mon, 19 Jul 2010 10:56:22 -0700 (PDT)
Date: Mon, 19 Jul 2010 13:56:22 -0400
Message-ID: <AANLkTinYMDqQlfpxdDxpJdwj4vwg8LN9WGaBNyDcZxUZ@mail.gmail.com>
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
Subject: OE weekly changelog for 2010-07-12 to 2010-07-19
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
X-List-Received-Date: Mon, 19 Jul 2010 17:56:50 -0000
X-List-Received-Date: Mon, 19 Jul 2010 17:56:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-07-12 to 2010-07-19

Denis 'GNUtoo' Carikli (4):
  marvell-gspi and marvell-sdio: move duplicated license in separate packag=
e/r
  xserver-xorg-conf: add new htcdream's xorg.conf
  linux-leviathan: switched to a new branch and bump PR
  keymaps: remove initscripts dependency

Denys Dmytriyenko (3):
  libc-client: remove extra "openssl" from the include path
  php: make sed avoid unaccessible .pc files left by quilt
  libgles-omap3: pass rpath-link properly instead of adding more -lX libs

Dmitry Eremin-Solenikov (8):
  u-boot: add a recipe for fresh release of u-boot. Also make it default fo=
r t
  u-boot: switch lite5200 to current u-boot and drop u-boot 2010.03 which h=
ad
  tqm8540: drop u-boot versioning, add kernel uImage parameters
  linux.inc: add KERNEL_DEVICETREE_tqm8540 definition
  linux-2.6.34: add tqm8540 configuration
  gdb: stop conflicting with binutils

Enrico Scholz (6):
  dbus: use $(LIBTOOL) to install 'dbus-daemon'
  freetype: updated to 2.3.12
  freetype: build with system zlib
  encodings/font-util: swapped inter-DEPENDS
  ipkg-utils: convert mtime to int before comparing it
  freetype: fixed broken patches

Frans Meulenbroeks (7):
  base.bbclass: introduce COMPATIBLE_TARGET_SYS
  gcc 4.1.x: patch Makefile.in for cross compile badness
  glibc: remove old/obsolete versions
  glibc 2.10.1: cleaned up; patches only in local dir
  glibc 2.9: cleaned up; patches only in local dir
  glibc 2;5: cleaned up; patches only in local dir
  glibc-2.9: added missing ld.so.conf

Graham Gower (3):
  perl_5.8.8.bb: Don't use hostperl's $Config{cppflags} with cross compiler=
.
  usermanual/chapters/recipes.xml: Executables should be executable.
  lsof_4.83.bb: Make recipe buildable again.

Henning Heinold (10):
  libtimedate-perl: don't depend on target packages
  openjdk-6: fix download URL for jaxws and jaf
  uclibc: update git version, fixes ppc32 nptl error
  icedtea6-native: use zip-native, rather than hostsystem-zip which is not =
an
  uclibc: fix arm nptl support in the git-version
  uclibc: remove obsolete patches for git version
  llvm-common: use do_stage for now, until there is a better solution
  llvm-common: use do_install to do the stuff
  icedtea6-native: use the right variable for zip and override it via make =
com
  openjdk-6: use zip-native rather than host-zip, similiar to icedtea6-nati=
ve

Khem Raj (4):
  quilt-native: Remove RDEPENDS on libtimedate-perl-native
  gtk+-2.20.0,gtk+-2.20.1: Fix case where /usr/bin/nm was being generated i=
nto
  gcc-configure-common.inc: Disable multilib generation.
  gdb-common.inc: Add -f to rm the files dont exist while building target g=
db

Koen Kooi (16):
  angstrom: fix another regression with DISTRO_FEATURES
  opal: add 3.8.2
  ekiga git: lower default pref
  ekiga: add 3.2.7
  ptlib: add 2.8.2
  ekiga git: bump to current head
  ekiga: raise defaultpref for angstrom
  ekiga, opal: bump PR
  angstrom-task-gnome: remove xorg-minimal-fonts
  usbmodeswitch: add 1.1.3
  clutter-1.0: add 1.0.10
  clutter-box2d: update to 0.10.0
  webkit-gtk: add 1.2.3 build (from release tarball, not svn/git)
  angstrom: don't use -ggdb3 for -native and -cross
  jack: add 0.118.0 (latest stable)

Lukas Gorris (3):
  htc-qsd8: use xf86-video-fbdev until xf86-video-msm is fixed
  linux-qsd8: bump srcrev, update defconfig and machine features

Martin Jansa (19):
  linux-openmoko-2.6.34: bump SRCREV, try to disable UBI debug and reenable=
 ba
  linux(-kexecboot): bump SRCREV in git version and update defconfig
  freesmartphone: bump cornucopia SRCREV, remove aplied patch from fsogsmd =
and
  libphone-ui: bump SRCREV, remove applied patch
  frameworkd: bump SRCREV, remove applied patches
  xserver-common_1.33: add xinput-calibrator to SHR RDEPENDS
  shr: include sane-toolchain-java.inc and angstrom-jalimo.conf, add largef=
ile
  icedtea6-native_1.7.3: backport patch for building without jar in system
  icedtea6-native_1.8: don't use kenai.com for jdk6-jaf and jdk6-jaxws, add=
 ri
  llvm2.7: force arm mode for now for armv4t
  xserver-xorg: move from 1.8.99.904 to 1.8.99.905
  task-shr-feed: add openjdk-6
  openjdk-6-release-6b18: force arm mode for now
  task-shr-feed: fix openjdk-6 add
  shr: bump SRCREVs to latest
  cornucopia: bump SRCREV
  phonefsod: bump SRCREV
  linux(-kexecboot)_git: bump SRCREV, add fix for bug 16310
  task-shr-feed: update openjdk entry

Michael 'Mickey' Lauer (5):
  libgee: move to known-good revision
  vala: 0.9.2.1 -> 0.9.3.1
  msmcommd: add missing dependency
  dbus 1.3.1: apply patch from fdo bug 17754
  vala: 0.9.3.1 -> 0.9.3.2

Robert Schuster (7):
  llvm-common: Fixed installation path of helper script (led to issues in O=
pen
  jamvm-initial 1.4.5: Face random crashes with a silent retry.     jamvm-i=
nit
  cacao 0.99.3: Fixed packaging of libjvm.so.     cacao 0.99.4: Dito.
  jamvm 1.4.5 - 1.5.3: Fixed packaging of libjvm.so
  jamvm-initial 1.4.5,1.5.0: Fixed binary to be called in script.
  jamvm-native: Add automatic restart workaround to native package as well.
  jamvm-native: Removed restart workaround, use libffi instead of custom as=
sem

Roger Monk (1):
  u-boot_git: Change default console for OMAP3EVM

Roman I Khimov (2):
  libdbix-simple-perl: add DBIx::Simple Perl module
  perl 5.10.1: fix standard module rdependencies

Roman Khimov (1):
  busybox: add suport for FEATURE_INDIVIDUAL setup

Sebastian Krzyszkowiak (1):
  task-shr-feed: add missing shr-splash themes to feed

Stanislav Brabec (3):
  obex-data-server: Adding imagemagick to DEPENDS (requires MagicWand by de=
fau
  lsof: Fixed typo in addtask.
  balsa: Updated to version 2.4.7. Fixed infinite symlink error.

Stefan Schmidt (11):
  bison.inc: Configure asks for gettext inherit it
  grep_2.6.3: Configure asks for gettext inherit it
  opensp-native_1.5: Configure asks for gettext inherit it
  dfu-util_0.1: Add 0.1 release
  json-glib_0.10.4: Add json-glib
  libdbusmenu_0.3.5: Add for other Ayatana parts
  ido_0.1.6: Add for other Ayatana parts
  libindicator_0.3.8: Add for other Ayatana parts
  indicator-applet_0.4.3: Gnome applet for so called indicators of Ayatana
  indicator-network_0.2.6: And finally the connman/ofono based network indi=
cat
  json-glib: Put in an extra folder as it may be used by others.

Tom Hayward (2):
  python 2.6: generated new python-2.6-manifest.inc for python-numbers
  python-django: added recipe for 1.2.1, based on 1.0.2 recipe.

Tom Rini (5):
  ipsec-tools: Add a patch to not 'install' vmbuf.h twice
  pkconfig.bbclass: Add -R... to the regex, and reindent.
  clamav 0.96.1: Add a patch to drop @CFLAGS@ from libclamav.pc.in, bump PR
  inetutils 1.8: Add --with-path-procnet-dev so that a path is used.
  lmbench: Fix builds by pulling in siteinfo stuff

Xerxes R=E5nby (3):
  openjdk-6-6b18: Add ARM Linux Shark CPU features detection code.
  openjdk-6-6b18: Remove vestigial thumbee.patch.
  openjdk-6-6b18: Disable Shark ARM NEON support LLVM PR6561

Yuri Bushmelev (1):
  quilt-native_0.48: Patch to properly detect newer versions of GNU patch i=
s a


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-07-12 to 2010-07-19


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


