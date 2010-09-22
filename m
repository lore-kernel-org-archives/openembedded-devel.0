Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OyEmh-0005L6-V7
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 04:10:13 +0200
Received: by wyb34 with SMTP id 34so64146wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 19:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=CIWyt4c3VmU/bjUQF+ARYDEBnpaqER/0QpRBdrRkhFU=;
	b=AOw2UKdSeWggvKUKANWxaYICTchwJ4ZQ2gEbW34C+xsO6zh5MK3+kgEXoxo8SE0d6h
	ve9ZRH2iEuCyr462n/12taC787wD2DsQcXoplRP/XMjaFrLMIWywjGEa0a+atbRfo2BZ
	Y2LEfWea7QKRXbYZ1elCHra+BgckDXtCAb0ZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VzoRuG5TR06cymUtuD5HYQXGKJxooY2hZVwtdvc/zk1XwRAdMZvBq3b/s1fIPiOL8o
	5DxwjvslEZnR2Z8UylEp2Q7BiQ775WdWSAuoQHYGhfD6srEdQDIdCcS3z4/5wnLDzcbn
	Vf9KbUIzHQudHAuV8RMbWRhZnilE4xZQLunxw=
MIME-Version: 1.0
Received: by 10.216.232.90 with SMTP id m68mr9990232weq.10.1285121407265; Tue,
	21 Sep 2010 19:10:07 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Tue, 21 Sep 2010 19:10:07 -0700 (PDT)
Date: Tue, 21 Sep 2010 22:10:07 -0400
Message-ID: <AANLkTikH4EvCZ5YWMSJFpwXwKhnTWsF5T+mhL=+jb=sk@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	NORMAL_HTTP_TO_IP,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-09-13 to 2010-09-20
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
X-List-Received-Date: Wed, 22 Sep 2010 02:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-09-13 to 2010-09-20

AJ ONeal (1):
  nodejs: replaced v0.2.0 with v0.2.1

Andreas Mueller (1):
  xfwm4: depends libwnck

Bj=F6rn Krombholz (1):
  qt4-embedded: avoid circular dependencies for reciped providing
qt4-embedded

Brijesh Singh (1):
  ti-codec-engine_2.26.00.08: add new codec engine version.

Denis 'GNUtoo' Carikli (2):
  supertux 0.1.3: depend on libmikmod(fix not-starting issue)
  wesnoth: add inc factorized 1.8.4 version, with normal and wvga
versions

Eric BENARD (3):
  busybox/mdev.conf: add net/tun
  task-qte-toolchain-target: add libqt-embeddedmultimedia4-dev
  python-native: configure unicode to ucs4

Eric B=E9nard (4):
  generate-manifest-2.6.py: tune python-modules' RDEPENDS
  python-2.6-manifest.inc: regenerate the file
  python_2.6.5: tune python-distutils
  python: increase PR

Fahad Usman (1):
  nkf_2.07.bb: fixed build error (QA Issue with nkf: No GNU_HASH in the elf=
 bi

Florian Boor (4):
  gpe-conf: add 0.2.9
  babbage.conf: Add framebuffer video driver to XSERVER
  xserver-xorg-conf: Add xorg.conf for i.MX51 Babbage
  babbage.conf: Add touchscreen support for the default display

Frans Meulenbroeks (48):
  fftw: added --enable-threads to the 3.2.2 recipes
  removal.txt: removed Maemo proposal
  zd1211 : moved unused files to obsolete dir
  abiword : moved unused files to obsolete dir
  alsa : moved unused files to obsolete dir
  apt : moved unused files to obsolete dir
  atd : moved unused files to obsolete dir
  autoconf : moved unused files to obsolete dir
  clean-recipe: added (script to move unused patches to obsolete)
  MAINTAINERS" added lib*perl
  MAINTAINERS: added small change to test git push and CIA
  libversion-perl_0.6701.bb: gave default preference of -1
  e17 : moved unused files to obsolete dir
  e2fsprogs : moved unused files to obsolete dir
  efl1 : moved unused files to obsolete dir
  enchant : moved unused files to obsolete dir
  erlang : moved unused files to obsolete dir
  esmtp : moved unused files to obsolete dir
  evince : moved unused files to obsolete dir
  libversion-perl: updated to 0.82
  python-tlslite_0.3.8.bb: replaced SRC_URI with gentoo one
  mythplugins: fixed netvison packaging, fixed depends
  mythtv: fixed packaging, included .inc file
  libdbd-sqlite-perl: updated to 1.31; fixed depends
  libdbix-simple-perl_1.32.bb: DEPENDS_${PN} -> DEPENDS
  yaffs2-utils: make it patch and compile again
  yaffs2-utils: removed unused patch file yaffs2-unioob.patch
  yaffs2-utils: renamed files dir to yaffs2-utils
  yaffs2-utils: remove inc file
  icedtea : moved unused files to obsolete dir
  ifupdown : moved unused files to obsolete dir
  initscripts : moved unused files to obsolete dir
  ipkg : moved unused files to obsolete dir
  iputils : moved unused files to obsolete dir
  iscsi-target : moved unused files to obsolete dir
  openprotium: fixed unpack
  initscripts-slugos_1.0.bb: improved FILESPATHPKG
  fbreader : moved unused files to obsolete dir
  ffalarms : moved unused files to obsolete dir
  ffmpeg : moved unused files to obsolete dir
  flite : moved unused files to obsolete dir
  fontconfig : moved unused files to obsolete dir
  freenx : moved unused files to obsolete dir
  freesmartphone : moved unused files to obsolete dir
  frodo : moved unused files to obsolete dir
  ftpd-topfield : moved unused files to obsolete dir
  python-tlslite_0.3.8.bb: bump PR
  task-nas-server: added tgt

Graham Gower (4):
  foonas-init: remove broken and unused recipe.
  zziplib: remove 3 years old recipe with no in tree users.
  zziplib_0.13.59.bb: add new recipe.
  xkbd_0.8.15.bb: Fix geometry flag to accept negative offsets.

Henry von Tresckow (1):
  dnsmasq: add version 2.55 from upstream

Holger Hans Peter Freyther (3):
  usermanual: Remove the prebuilt toolchain documentation.
  busybox: Apply a paych for make3.82 and the Makefile
  gst-plugins-base_0.10.29: Fix the gtk-doc Makefiles for make 3.82

Khem Raj (16):
  freesmartphone/msmcomm.inc: Bump SRCREV
  cpuburn-neon.bb: Only build for arm hosts
  cpuburn_1.4.bb: Set COMPATIBLE_HOST to x86 and x86_64 only.
  dspgw-utils_3.3.1.bb,soundtracker-gtk2_0.6.7.bb: Add missing checksums
  eglibc: Do not specify ports multiple time to --enable-addons
  libgles-omap3_3.01.00.07.bb: Add recipe
  startup-notification_0.9.bb: Remove evas from DEPENDS
  linux-efikamx_git+2.6.31.14.bb: Set default preference to -1
  msmcomm.inc: Fix SRCREV
  libsdl-qpe_1.2.9.bb: Add patch to not include asm/page.h
  libjingle-tapioca_0.3.10.bb: Fix compilation and install issues.
  openmoko2.bbclass, openmoko-base.bbclass: Fix openmoko_two_get_license an=
d o
  gtkhtml2, libxosd_svn.bb: Move the recipe to fetch from git instead of ob=
sol
  phalanx_22.bb: Rename the tar file to whats fetchable today
  iphone: Exclude from world.
  fam_2.7.0.bb: Fix compilation with gcc4

Klaus Kurzmann (2):
  watchdog_5.6.bb: add config for the nokia900 machine
  xserver-common: patch to add a section for nokia900 to xserver-common

Koen Kooi (7):
  libdecodeqr: add 0.9.4+git
  angstrom 2008: switch to cairo 1.10
  nodejs 0.2.1: fix regressions introduced by 0.2.0 -> 0.2.1 upgrade
  duke3d: update SRCREV, fix QA errors in .desktop
  ruby 1.8.7: update to p302 to fix CVE-2010-0541
  angstrom-x11-base-depends: switch default to xorg
  angstrom-x11-base-depends: fix typo

Leon Woestenberg (1):
  preferred-xorg-versions-X11R7.5-latest.inc: Move to pixman 0.18.4

Lukas M=E4rdian (1):
  elementary-theme-gry: bump SRCREV and PR This bump brings back the entry =
cur

Michael Kurz (2):
  db{4,5}.inc: fix QA: non -dev contains .so
  db_{4.3.29, 5.0.21}.bb: increase PR to force a rebuild.

Nobuhiro Iwamatsu (1):
  eglibc: Update recipe for all version

Philip Balister (3):
  python-cheetah : Add DEPENDS on python.
  task-sdk-gnuradio-native : Match OE packaging guidelines. Add packages.
  python-docutils : Add DEPENDS on python.

Roger Monk (3):
  ti-codec-engine: Add initial recipe for latest ce 2.26.00.08
  linux-omap-psp: Add latest pending kernel patches
  angstrom-codec-engine-versions: Update latest versions

Roman I Khimov (1):
  dnsmasq: remove versions prior to 2.52

Sean Cross (1):
  driftnet: fix recipe to work with a modern build system

Sebastian Krzyszkowiak (1):
  cornucopia: bump SRCREV for proximity sensor support on N900

Simon Busch (4):
  tslib_git.bb: bump SRCREV
  netbase: add interface file for palmpre machine and bump PR
  linux-palmpre: enable uinput support in defconfig
  fsogsmd: set PACKAGE_ARCH_palmpre =3D "${MACHINE_ARCH}"

Tom Rini (6):
  apr, apr-util: Remove 1.2.* versions
  p2020ds: Pull in tune-ppce500v2.conf
  mpc8544ds: Add this machine
  angstrom-eglibc.inc: Update SPE check
  kernel.bbclass: Fix INITRAMFS_IMAGE logic
  cmake-native: Disable ncurses

Vasily Khoruzhick (1):
  gettext-0.18: use included libcroco instead of one provided by build syst=
em

sledz (1):
  linux-2.6.24: build additional wlan modules for hipox machine


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-09-13 to 2010-09-20


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5430 FIXED       bitbake of bootstrap-image

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


