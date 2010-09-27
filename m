Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P0JZ3-00008b-7m
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 21:40:43 +0200
Received: by wwi17 with SMTP id 17so135633wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=ABLArocN8qk2KVqPX01X01462/3FKR7mvNmuJUqlsNg=;
	b=IMC3xe86O49MM8W09/dNMzxxINx2hWR+TMNZH3vgqIT1OwcdWE3l4Fpa0onv6W7OgQ
	2Jeg76yWwqsFvHSsf9CsKfSm3JSPOWdOWHImb2bOUfEcl4zQFqTqIGkSQlko/3CExSZn
	T1uA5QfYinZ52hnolgeJ/dAQkzel7FVHk+Aio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aCWeFYCgNQjkJhUswWUGPp/oRSHTk6CeTd2broMEWuSw/pkdcaPzG6uTOn9aBhrq69
	6P8sf66AVI8Pli1uDZOeW0f/Dtkc53+vGo3UNkxhtrr50XEtPM34uIBsxo1aiEEE6yfN
	wVx6U7tx/lAncz31GIIY011DAextATyfFHSrc=
MIME-Version: 1.0
Received: by 10.216.47.80 with SMTP id s58mr6700121web.15.1285616429878; Mon,
	27 Sep 2010 12:40:29 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 27 Sep 2010 12:40:29 -0700 (PDT)
Date: Mon, 27 Sep 2010 15:40:29 -0400
Message-ID: <AANLkTimSzUjv-B+1hSdTDqU_mi0dz20Xd+XGM=5Jxqu_@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-09-20 to 2010-09-27
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
X-List-Received-Date: Mon, 27 Sep 2010 19:40:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-09-20 to 2010-09-27

Chase Maupin (3):
  qte: only export touchscreen setting if ts exists
  freetype: update LICENSE field
  fbset_2.1: add dependency on bison-native

Chris Larson (2):
  utility-tasks.bbclass: drop mrproper task
  amend.bbclass: kill override specific

Cliff Brake (8):
  nodejs: add native support
  qgears: add recipe (used to test perf)
  qgears: add recipe (used to test perf)
  qt4: add 4.7.0 released version
  qt4 4.7.0: move pg patch to proper location
  qt4: remove 4.7.0-beta2

Eric B=C3=A9nard (20):
  generate-manifest-2.6.py: tune python-modules' RDEPENDS
  python-2.6-manifest.inc: regenerate the file
  python_2.6.5: tune python-distutils
  python: increase PR
  utils.bbclass: fix is_machine_specific
  sdk.bbclass: allow virtclass-sdk override
  qt4-tools-sdk: bring compatibility with QTCreator
  gdb-cross-sdk: use static libncurses libtinfo libz and libexpat
  classes/update-rc.d.bbclass: move update-rc after postinst
  nostromo: add new recipe for this web server
  liburi-perl: update to 1.5.5
  gs: unbreak recipe
  apache2: unbreak recipe
  ppp: fix poff
  cups: add version 1.4.4
  ppp: add version 2.4.5
  hplip: add 3.10.6
  openvpn: add 2.1.3
  gs: add gs-fonts-std
  util-linux-ng: reset rdepends on ncurses-tools

Frans Meulenbroeks (37):
  dosfstools : moved unused files to obsolete dir
  directfb-1.1.1: remove
  directfb: remove some old versions
  directfb: moved unused files to obsolete dir
  cdparanoia : moved unused files to obsolete dir
  navit : moved unused files to obsolete dir
  numptyphysics : moved unused files to obsolete dir
  numptyphysics_svn: changed proto=3Dtthps to proto=3Dhttp
  netbase : moved unused files to obsolete dir
  neon : moved unused files to obsolete dir
  transmission : moved unused files to obsolete dir
  transmission: moved to 1.93
  transmission: added 2.04, DP =3D "-1" until more tested
  libevent: added 1.4.14b-stable; DP =3D "-1" until more tested
  mythwebplugins: fixed mythweb packaging
  lemon : moved unused files to obsolete dir
  lesstif : moved unused files to obsolete dir
  libmatchbox : moved unused files to obsolete dir
  ltrace : moved unused files to obsolete dir
  libmimedir : moved unused files to obsolete dir
  libopie : moved unused files to obsolete dir
  libqpe : moved unused files to obsolete dir
  libtool : moved unused files to obsolete dir
  libxslt : moved unused files to obsolete dir
  libintl-perl_1.11.bb: removed
  perl: moved a few unused patches to obsolete
  pango : moved unused files to obsolete dir
  parted : moved unused files to obsolete dir
  packagekit : moved unused files to obsolete dir
  phalanx : moved unused files to obsolete dir
  pdm : moved unused files to obsolete dir
  python: moved unused files to obsolete dir
  pidgin : moved unused files to obsolete dir
  pimlico : moved unused files to obsolete dir
  procps : moved unused files to obsolete dir
  pthsem : moved unused files to obsolete dir
  pulseaudio : moved unused files to obsolete dir

Graham Gower (9):
  tapioca, farsight: move to obsolete. These recipes are old and unbuildabl=
e.
  opkg: disable GPLv3 code.
  p4: remove broken and 4 years old recipes.
  mupdf_git.bb: add recipe.
  mupdf_0.6.bb: remove recipe.
  mythfront-config.bb: Fix do_unpack for machines other than epia.
  pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=3Dspitz.
  at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
  python-numpy: add mipsel config.

Holger Hans Peter Freyther (6):
  qt4.inc: Package the bearer plugins.
  qt4.inc: Package qmlviewer into a new package.
  qt4.inc: Package the xmlpatterns utility
  qt4: Package the debug binaries into tools-dbg
  qt4: Bump the PR after packaging changes

Jeff Lance (3):
  matrix-gui-common: update to latest sources
  matrix-gui-e: updating to latest source revision
  matrix-gui: updating to use latest source revision

Khem Raj (14):
  gcc-cross,gcc-cross-sdk: Link libmpfr, libgmp, libmpc and libelf statical=
ly
  iphone: Mark recipes with COMPATIBLE_MACHINE=3Diphone
  corosync: Fix compilation
  groff_1.20.1.bb: Add recipe.
  chumby-firmware_1.2.bb: Fix typo in COMPATIBLE_MACHINE
  libnl: Update the homepage url and download urls
  binutils_2.20.1.bb: Add patch to fix ld sysroot
  oe/patch.py: Remove series file during Clean()
  libnl_1.1.bb: Fix the build when libnl2 is staged
  staging.bbclass: Use sysroot_stage_dir instead of autotools_stage_dir
  eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
  eglibc.inc: Use quotes to cover -jN and -j N
  binutils_cvs.bb: Use FILESPATHPKG
  quilt-0.48: Check if file is a symlink before deleting.

Klaus Kurzmann (1):
  pointercal-xinput: add calibration data for nokia900 and bump PR

Koen Kooi (35):
  alsa-state: bump PR after 56fa8d7ad350fcbb5dedaa80c656da0bb59a2e7b
  netbase: bump PR after 56fa8d7ad350fcbb5dedaa80c656da0bb59a2e7b
  pixman 0.19.4: add latest release from the unstable series
  plotutils: add 2.6
  enblend-efuse: add 4.0
  gstreamer: add 0.10.30
  gst-plugins-base: add 0.10.30
  gst-plugin-gles: bump SRCREV
  orc: update to 0.4.9
  firefox 3.6.8: fix build from ARMv4T, patch stolen from debian
  gst-plugins-bad: add 0.10.20
  gst-plugins: add some more missing depends
  gvfs: add missing libcdio
  qt4-tools-sdk 4.6.3: bump PR for QtCreator change
  testlab bbclass: add a switch to log testlab results to a git repo
  qt4-x11-free-gles: add 4.7.0
  angstrom feed sorter: fix typo and add some more machines
  linux-igep2 2.6.33.7-0: isee downloads server is broken, switch to fetchi=
ng
  networkmanager: add 0.8.1
  network-manager-applet: add 0.8.1
  webkit-gtk: bump SRCREV
  midori: add 0.2.8
  networkmanager-openvpn: add 0.8.1
  networkmanager: bump PR for ppp
  speex: make float and asm settings more intelligent
  dhcp: add 4.x from poky
  networkmanager 0.8.1: cleanup recipe, fix loopback init with a patch from=
 de
  angstrom: switch to newer networkmanager
  epiphany: bump PR for webkit change
  speex: disable asm for arm since too many toolchains trip up
  gimp: bump PR for webkit change
  angstrom-next: switch to QT 4.7.0
  usb-modewitch: add 1.1.4
  usb-modeswitch-data: add 20100826     usb-modeswitch: recommend the above
  usb-modeswitch: fix recipe and packaging

Marcin Juszkiewicz (4):
  gcc: added 2010.09 Linaro release of gcc-4.4
  gcc: fix INC_PR of Linaro gcc-4.4
  gcc 4.4-2010.09: moved FILESDIR to inc file
  gcc: added 2010.09 Linaro release of gcc-4.5

Martin Jansa (21):
  elmdentica: temporary bump SRCREV above EFL_SRCREV to fix build after 55b=
391
  linux-openmoko-2.6.34: upgrade to 2.6.34.7 and add patch for lower power =
con
  mokowm,mokosuite: update recipes, sources are now in git
  shr-autorev: add mokosuite2, mokowm, mokowm-imf-ecore
  python-cython: upgrade to 0.13, drop legacy staging, use BBCLASSEXTEND fo=
r n
  linux-openmoko-2.6.32: upgrade to 2.6.32.22 and add patch for lower power=
 co
  qt-4.7.0: update add.xmlpatterns.lib.patch to make it compile again
  SHR: prefer QT 4.7.0
  EFL: bump SRCREV
  e-wm-theme-illume: PACKAGE_ARCH all for all SHR themes
  e-wm-theme-illume-(gry|neo): bump SRCREV for last fix
  libfreesmartphone-glib: bump SRCREV
  mokosuite2: bump PR after libfreesmartphone-glib change
  initscripts-shr: prepare /var/volatile/appshadow for shr-wizard
  shr: bump SRCREVs of recipes from shr-autorev for versions compatible wit=
h c
  shr-e-gadgets: bump SRCREV
  linux-openmoko-2.6.34: add 3 patches from qtmoko
  kexecboot: bump SRCREV for devicescan fix
  linux-kexecboot-2.6.35: enable CONFIG_BLK_DEV_SD
  pixman_0.19.4: increase D_P for SHR
  shr-e-gadgets: remove edje_convert calls (should be converted already in =
sou

Michael Kurz (1):
  libesmtp_1.0.4.bb: fix the installed but not shipped in any package warni=
ng.

Michael Lippautz (2):
  x-load/igep0020.conf: Unbreak x-load for igep0020 machine.
  linux-igep2: Bump kernel to 2.6.33.7-0

Michael Smith (6):
  gtk+ 2.14.2: add BBCLASSEXTEND =3D "native"
  libmusicbrainz: fix build when prefix =3D ""
  openvpn: change kernel-module-tun to RRECOMMEND
  libvpx: fix 0.9.1 build when prefix=3D""
  gst-plugins-base 0.10.30: depend on gtk+
  gst-plugins.inc: fix path to orcc when prefix !=3D /usr

Michal Minar (1):
  grub 0.97: fixing broken 256byte-inodes patch

Paul Menzel (1):
  docs/usermanual: s/are be copied/are copied/

Roman I Khimov (10):
  bzip2: update 1.0.5 to 1.0.6
  bzip2: remove 1.0.2
  clamav: update 0.96.2 to 0.96.3
  iw: fix build
  perl 5.10.1: update patches to Debian's 5.10.1-14
  perl 5.10.1: update rdepends
  perl 5.10.1: PROVIDES libmodule-build-perl
  groff: fix groff-native build
  hostap-daemon: add version 0.7.3
  iw: fix build

Rui Miguel Silva Seabra (1):
  omnewrotate: bump SRCREV

Sergey Stasishin (1):
  live555: Packaging live555MediaServer too.

Stanislav Brabec (3):
  rt3070: Added version 2.3.0.4.
  wpa-supplicant: Added version 0.6.10. Refreshed defconfig: Added nl80211 =
and
  iw: Updated to version 0.9.20. Removed old versions.

Steffen Sledz (3):
  libunwind: unbreak native build
  libatasmart: missing udev dependency added
  libatasmart-0.13: resolve cross compile problem

Thomas Zimmermann (1):
  python-pybluez: update to version 0.18

Tom Rini (2):
  nfs-utils: Drop do_ccompile
  tar: Switch to INC_PR and fix native builds.

Vaudano Luca (1):
  estardict: add new version 0.4

Yann Dirson (3):
  git: replace remaining broken hardlinks with symlinks.
  git: split space-hungry rarely-used commands into -perltools and -large p=
ack
  git: activate gitk.

=C5=81ukasz Pankowski (1):
  ffalarms: bump git revision, fixes simultaneous alarms


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-09-20 to 2010-09-27


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


