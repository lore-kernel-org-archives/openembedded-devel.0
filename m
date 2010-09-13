Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OvDhs-0002fy-So
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 20:24:46 +0200
Received: by wwi14 with SMTP id 14so7257267wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=ucMzTPHMcat/mDj4b7qIQVn3uRxsWLIosZuxueOfqLQ=;
	b=HkXKEehjeSmvfRpIeBpQyp1CkEV2Z61agcA/O3QUY4bNpXcpHj9PmfkH0jaYsGQDTv
	Elfp1IgLU9LmUBWttzvRPZ3h+vKvo0JNjLakgyE3QuWx0DXzq6/Sh19eYU31VHn+vZZ7
	M9joptuq1Pdp0hvWqVK4JX0QijbjbTqYkRUts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=U/PwjvsNy0vTTeHv3TAEJpJoKr9A8SAapK/RJRbkus5fdIyrCv4blCMJcDeSaTwZpG
	3S/m5p9fccyPUuVjDRvUINqX40cAMAsKuOJWyiAih8GFuDLskpCISz1g7ycyijcm0RNN
	enkFN0/EJnjTnZ/0cdN3RcJuF9HgoNn4VTN/Q=
MIME-Version: 1.0
Received: by 10.216.232.90 with SMTP id m68mr4698238weq.10.1284402236679; Mon,
	13 Sep 2010 11:23:56 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 13 Sep 2010 11:23:56 -0700 (PDT)
Date: Mon, 13 Sep 2010 14:23:56 -0400
Message-ID: <AANLkTikdfxqBdJBkzO_OhRtVFP1euxTNGCHyQu_2ZX9k@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-09-06 to 2010-09-13
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
X-List-Received-Date: Mon, 13 Sep 2010 18:24:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-09-06 to 2010-09-13

AJ ONeal (1):
  added recipe for nodejs

Andrea Adami (2):
  klibc: bump to 1.5.20
  klibc: fix packaging mismatch

Andreas Mueller (7):
  clutter: remove svn recipes and unreferenced files
  clutter: clean builds for clutter 1.0
  libchamplain(-gtk): Bumped to 0.7.1 to meat actual clutter
  moblin: update recipes to match latest clutter
  clutter (+box2d +gtk): Bump to latest (stable) versions
  clutter: the font display problem is worked around.
  clutter-box2d: renamed clutter-box2d_0.10.0_git.bb -> clutter-box2d_git.b=
b

Brijesh Singh (3):
  ti-linuxutils_2.25.05.11: add new linux utils recipe
  ti-xdais_6.26.00.02: add new xdais version.
  ti-framework-components_2.25.03.07: add new framework components recipe

Chase Maupin (4):
  sourceipk: make extra files inclusion optional
  psplash-ti: update configurability patch
  common_use_cases: add description of SOC_FAMILY
  jpeg_8b: Allow using older versions of automake

Chris Larson (6):
  Per the TSC decision, make packaged-staging default
  insane.bbclass: run qa_staging before do_package_stage, rather than do_bu=
ild
  packaged-staging: use oe_run rather than os.system
  Fix unpack issue with bitbake 1.10
  Revert now unnecessary do_unpack bug workarounds
  packaged-staging: add missing debug level

Denis 'GNUtoo' Carikli (3):
  linux-2.6.28 : nokia900: update patchset and unbreak compilation with gcc=
 4.
  nokia900: do not require omap3.inc as we would have to override nearly ev=
ery
  mplayer_git: fix omapfb patchset and bump PR

Enrico Scholz (3):
  ncurses: added libtermcap.so file for backward compatibility
  ncurses: use linker scripts for libncurses(w)
  ncurses: fixed PR

Eric B=E9nard (10):
  lib/oe/unpack.py: fix uncompressing .gz .bz2 or .xz
  rlpr 2.05: unbreak recipe
  rlpr: upgrade to version 2.06
  mercurial-native: add recipe
  fix bitbake ERRORS for machine not having virtual/egl
  util-linux-ng: fix readprofile update-alternatives vs busybox
  util-linux-ng: fix reset update-alternative vs busybox
  util-linux-ng: add missing `update-alternatives --remove' in pkg_prerm
  util-linux-ng: fix broken symlinks
  util-linux-ng: increase PR

Filip Zyzniewski (10):
  jlime: fix glibc include
  jlime: set virtual/libc preferred provider.
  jlime: bumped up coreutils-native version.
  jlime: switched from OABI to EABI.
  jlime: removed some of PREFERRED_VERSION entries
  jlime: minor changes based on minimal.conf
  jlime: using glibc-2.11
  linux-jlime-jornada7xx: moved from 2.6.32 to 2.6.34.
  dialog: removed hardcoded -L/lib ld flag from configure.
  jornada7xx: fix for bug #4951

Florian Boor (2):
  mini6410.conf: Initial support for S3C6410 based Mini6410 board.
  linux: Add 2.6.28 patches and config for Mini6410.

Frans Meulenbroeks (43):
  js: fixed libtermcap
  js: renamed files dir to more appropriate name js
  js: removed old unreferenced patch file host-cc.patch
  pulseaudio: made 0.9.21 compile for armv4 and armv5 too
  libxml-twig-perl: updated to 3.35, changed uri to fetch from cpan
  libimage-size-perl: added
  libxml-libxml-perl: added dependency for XML::NamespaceSupport
  pulseaudio.inc: set INC_PR back to 10, was actually dropped to 0 in a pre=
vio
  libxml-libxml-perl_1.70.bb: fix native build
  libsoap-lite-perl: updated to 0.712
  libxml-namespacesupport-perl: updated to 1.11
  libtask-weaken-perl_1.03.bb: new recipe
  libclass-inspector-perl_1.24.bb: new recipe
  libclass-inspector-perl_1.24.bb: removed faulty HOMEPAGE
  libclass-singleton-perl_1.4.bb: new recipe
  libtask-weaken-perl_1.03.bb: remove faulty HOMEPAGE
  libxml-simple-perl_2.18.bb: fixed dependencies
  libsoap-lite-perl_0.712.bb: fixed dependencies
  libxml-xpath-perl_1.13.bb: new recipe
  libdatetime-timezone-perl_1.21.bb: new recipe
  libdatetime-locale-perl_0.45.bb: new recipe
  libdatetime-perl_0.61.bb: new recipe
  libclass-factory-util-perl_1.7.bb: new recipe
  libdatetime-format-builder-perl_0.80.bb: new recipe
  libdatetime-format-iso8601-perl_0.07.bb: new recipe
  libtest-exception-perl_0.22.bb: added BBCLASSEXTEND =3D "native"
  base.bbclass: fix soc-family test
  libxml-twig-perl_3.35.bb: fix DEPENDS/RDEPENDS
  liblist-moreutils-perl_0.22.bb: new recipe
  libdatetime-format-iso8601-perl_0.07.bb: fix DEPENDS/RDEPENDS
  libnetaddr-ip-perl_4.027.bb: removed DEPENDS
  libxml-simple-perl_2.18.bb: fix DEPENDS/RDEPENDS
  libxml-sax-perl_0.96.bb: fix RDEPENDS
  libterm-progressbar-perl_2.09.bb: fix DEPENDS/RDEPENDS
  libxml-libxml-perl_1.70.bb: fix DEPENDS/RDEPENDS
  libsoap-lite-perl_0.712.bb: fix DEPENDS/RDEPENDS
  libmime-tools-perl_5.427.bb: fix DEPENDS/RDEPENDS
  libhttp-cache-transparent-perl_1.0.bb: fix DEPENDS/RDEPENDS
  libdatetime-format-builder-perl_0.80.bb: fix DEPENDS/RDEPENDS
  libdatetime-locale-perl_0.45.bb: fix DEPENDS/RDEPENDS
  libdatetime-perl_0.61.bb: fix DEPENDS/RDEPENDS
  libdatetime-timezone-perl_1.21.bb: fix DEPENDS/RDEPENDS
  mythplugins_0.23: added mythweather dependencies

Graeme Gregory (1):
  MAINTAINERS : correct my entry

Holger Hans Peter Freyther (2):
  libx11: Disable generating PS/PDF for the spec
  glibc_2.9: Apply patch to fix manual/Makefile for newer GNU make

Khem Raj (13):
  java-library.bbclass: do_stage is not needed anymore
  jaxme_0.5.2.bb, xpp3_1.1.3.4.O.bb: Remove do_stage_append
  udev,udev-compat141: Fix machine specific RDEPENDS
  bitbake.conf: Redefine STAGING_DIR_JAVA to point to target sysroot by def=
aul
  Revert "gnumail_1.1.2.bb: Point inetlib to java data dir in target stagin=
g a
  midpath-backend-sdl_0.2+0.3rc2.bb: Fix QA errors and remove do_staging
  ffmpeg_0.5.bb: On ARMv7 it needs to be compiled with -fPIC
  midpath-core_0.2+0.3rc2.bb: Fix compilation error and QA HASH error on AR=
M
  eglibc_svn.bb: Bump SRCREV
  xalan-j_2.7.1.bb: Add missing quote to the HOMEPAGE string
  gpephone: Move to obsolete
  task-sdk-gpephone.bb: Move to obsolete
  task-gpephone.bb: Move to obsolete

Klaus Kurzmann (1):
  libfreesmartphone-glib: new recipe

Koen Kooi (18):
  firefox: update to 3.6.8
  bash 3.2: bump PR
  angstrom: switch to ggdb2 to save space, noone seems to really exploit th=
e t
  angstrom: bump DISTRO_PR
  nodejs: fix recipe
  gcc: trade QA errors for broken runtime dependencies
  multi-kernel: more do_unpack unbreaking
  openjdk: fix random behaviour due to _PN being a local override
  openjdk-6: fix including things like 'openjdk-6-jdk' into tasks and image=
s
  openscenegraph: use gcc atomic builtins to make cmake happy
  linux-omap-psp 2.6.32: OMAP: DSS2: OMAPFB: swap front and back porches fo=
r b
  exquisite-theme-angstrom: another workaround for do_unpack breakage
  ti recipes: remove -sourcetree support
  angstrom feed sorter: add mini6410
  gcc-package-cross.inc: install shlibs lists into target dir instead of ho=
st
  cairo: add 1.10.0, latest stable release
  angstrom-next: switch to a newer busybox and cairo
  Revert "gcc: trade QA errors for broken runtime dependencies"

Leon Woestenberg (3):
  ltp-20100831: New release of the Linux Test Project.
  linux-efikamx: Added git version for 2.6.31.14.
  efikamx: Fixed spelling error Genisi to Genesi.

Peter Klassen (2):
  xserver-xorg-conf: add xorg.conf for palmpre machine
  xserver-xorg-conf: add xorg.conf for palmpre machine

Roger Monk (8):
  angstrom-gdm-autologin-hack : Fix missing quote mark + space
  angstrom-uboot-scripts: tweak linuxtagdemo image boot script
  mozilla: Add Category 'Network' to firefox/thunderbird for desktop files
  ti-codec-engine: Add space at end of SRC_URI to enable SRC_URI_append
  ti-dspbios: Add Latest versions 5.41.06/07
  ti-xdctools: Add Latest Versions 3.20.02/03
  ti-cgt6x: Add latest c6000 code generation tools versions (6.1.15/16/17)
  ti-cgt6x: Prepare for ELF/C6000 EABI - Add cgt v7 versions (7.0.1/2/3)

Rui Miguel Silva Seabra (1):
  Elmdentica abandoned json-c in favor of cjson

Sean Cross (3):
  chumby-falconwing: Add machine definition
  bootstream: Add falconwing bootloader definition
  linux-imx-git: Add linux-imx-git and chumby Falconwing patches

Sebastian Krzyszkowiak (11):
  task-shr-feed: add udev
  task-shr-feed: add xterm
  xserver-xorg-conf: add xorg.conf for nokia900
  task-shr-minimal: add gtk-immodule-xim for devices with hardware keyboard
  nokia900: generate also tar.gz images for installation on SD card
  shr-splash-theme.inc: support splashes for different machines
  shr-splash-theme-logo: bump and support nokia900
  cornucopia: bump
  frameworkd-config-shr: bump
  cornucopia: bump to get fsogsmd fix
  shr-splash-theme-logo: support palmpre and htcdream machines

Simon Busch (1):
  Revert "xserver-xorg-conf: add xorg.conf for palmpre machine"

Stanislav Brabec (1):
  python-m2crypto: Fix for openssl-1.0.0: Update to 0.20.2, apply compatibi=
lit

Stefan Schmidt (1):
  netbase: Add interface file for imote2 and bump PR

Steffen Sledz (1):
  gtk+: fix configure problem for native build

Stuart Gray (1):
  taglib: add 1.6.3

Tom Rini (14):
  ffmpeg: Pass along all of CCLDs flags, fix !Altivec PowerPC
  packaged-staging: When taking ipks use PKGV not PV
  libtool-cross 2.2.6[ab]: Drop legacy staging, taken from poky
  packaged-staging: Fix libtool-cross staging
  apr 1.3.5: Rework and re-apply the cleanup patch, so this builds.
  apr 1.2.12: Switch to getting libtool from PATH
  apr-util: Switch to getting libtool from PATH
  apmd: Switch to getting libtool from PATH
  jpeg 6b: Switch to getting libtool from PATH
  sg3-utils: Switch to getting libtool from PATH
  xfsdump: Switch to getting libtool from PATH
  xfsprogs: Switch to getting libtool from PATH
  inetutils: Add traceroute and ifconfig to u-a, ifconfig moves to /sbin
  time: Make /usr/bin/time use update-alternatives

Vasily Khoruzhick (2):
  linux-2.6.35: add rx1950 support
  rx1950: change default kernel to linux-2.6.35


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-09-06 to 2010-09-13


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5474 FIXED       busybox and util-linux-ng register alternative
`readprofile' to different paths
5475 FIXED       broken symbolic links in util-linux-ng package
5476 FIXED       [patch] add missing `update-alternatives --remove' in
pkg_prerm_util-linux-ng

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


