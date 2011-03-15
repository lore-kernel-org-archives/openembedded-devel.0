Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PzXIk-0000yM-4m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 17:40:54 +0100
Received: by wwi18 with SMTP id 18so2752292wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zLLOzFxLPEgRIJb7K1tW5cgqF5oq+IQNKqvkRGqPIIk=;
	b=cp3SOFWCrrXt6d+ib10/4FBJF83SfsoQVsKR25eKgYVNK7CZlzYOTy4RsnL9UZU4VS
	bn/o016BX0bSKgeBRZsRB98XpNtQvb/yBDQ8e57dO6LyaVM2aEU9cTy8s0kzmnNWXutQ
	UCmrdQa3l6OuGKEUoQ08C641XQuCRLiA8UtZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=NvEaMK6yHmwV/ZOUMcWAkpvuQxFNp0amGyeKJ0VgNtYcM7rrrtTAQHh+AQGs+oIKWG
	Dy7i3P4rph8ny3EaGQ9Pu3GjcZE51ho/cNASSm3NvG0M7F/sL59sGq64ohzQhE1Bc5RA
	kjbUJ7JgXgp4fTTEy8SMCYqrM3fkvSwXNHAbI=
MIME-Version: 1.0
Received: by 10.216.229.4 with SMTP id g4mr4273539weq.54.1300206741226; Tue,
	15 Mar 2011 09:32:21 -0700 (PDT)
Received: by 10.216.47.85 with HTTP; Tue, 15 Mar 2011 09:32:21 -0700 (PDT)
Date: Tue, 15 Mar 2011 12:32:21 -0400
Message-ID: <AANLkTimuk8p4XHvnzgU6amedRepjG-jneu0dTXB4JR7+@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for org.openembedded.dev, 2011-03-07 to 2011-03-14
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
X-List-Received-Date: Tue, 15 Mar 2011 16:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2011-03-07 to 2011-03-14

Andrea Adami (5):
  zaurus: set LZMA_COMPRESSION_LEVEL to lower defaults
  kexecboot-cfg: inherit CMDLINE from machine.conf. Cleaning.
  zaurus-2.6.inc: specify default kernel CMDLINE here.     Signed-off-by: A=
ndr
  ben-nanonote.conf: define default kernel CMDLINE to be used in boot.cfg
  linux.inc: fix CMDLINE_DEBUG injection.

Andreas M=FCller (1):
  collect-qa-errors.sh: Simplify and make it work again

Andreas Oberritter (1):
  mrouted-3.9.4: intitial recipe

Eric B=E9nard (25):
  dropbear: add 0.53.1
  qt4: add 4.7.2
  busybox: add latest fix
  busybox-1.18.3: add latest fix
  nodejs: update to 0.4.2
  obexd: add 0.40
  bluez-hcidump: add 2.0
  libpcre: add latest 8.10 version
  minimal: prefer qt 4.7.2
  angstrom-2010: prefer qt 4.7.2
  busybox: add 1.18.4
  angstrom-2010: use busybox 1.18.4
  apr: add 1.4.2
  apr-util: add 1.3.10
  apr: remove old versions
  apache2: add 2.2.17
  apache2: remove 2.2.14
  libc-client: add 2007e
  libc-client: remove 2007b
  php: add 5.3.5
  php: remove php-native 5.3.2
  shr: prefer qt 4.7.2
  qt4: remove 4.7.1
  slugos: prefer busybox 1.18.4
  busybox: remove 1.18.3

Graeme Gregory (1):
  transmission_2.22.bb : fix nls issue

Henning Heinold (1):
  alsa-utils: replacing exp10 with pow for uclibc

Khem Raj (1):
  gcc-4.5: Fix ICE on i586

Koen Kooi (17):
  gst-plugins: remove last traces of gnome-vfs
  x-load: fall back to xM when detecting beagleboard revisions
  linux-firmware: bump SRCREV
  libfreenect: add git version
  xmms: bandaid some more host path leakage
  libgles-omap3: update 4.03 release to 02
  task-omap-drivers: task for commonly needed drivers on omap chips
  *beagleboard-validation: collection of tasks iand images to serve as basi=
s f
  angstrom 2008.1: remove from .dev
  beagleboard: switch to linux-omap
  sysvinit: bump PR for beagleboard serial console change
  u-boot git: update beagleboard u-boot to 2011.03-RC
  omap3.inc: bump MACHINE_KERNEL_PR for beagleboard changes
  linux-omap 2.6.37: add support for beagleboard xM rev C
  linux-omap 2.6.37: add patch for mmc timeout issues
  angstrom-codec-engine-latest-preferred-versions: bump versions for >2.6.3=
6 s
  ffmpeg: switch to libav, that's where the sane people are at

Lukas-David Gorris (3):
  libevent: recipe for 2.0.10-stable version
  transmission: add recipe for 2.22 version
  htcleo: update xorg.conf

Marco Cavallini (2):
  kaeilos.inc: packages upgrade
  kaeilos-2009-preferred-versions.inc: packages upgrade

Martin Jansa (5):
  linux-kexecboot_git: upgrade to 2.6.38-rc8
  linux-kexecboot_git: add patch for fixed build without swap
  task-shr-feed: add elfe
  task-shr-feed: add sensmon
  shr: bump libshr-glib, shr-specs, libphone-ui, phonefsod SRCREV

Michele Brocco (2):
  sensmon: Added to feed version 0.21
  valacompass: upgrade to version 0.11, drop hmc5843 lis302dl recipes

Mike Westerhof (1):
  SlugOS: preferred-slugos-versions.inc -- unpin atk     Remove unnecessary=
 pi

Otavio Salvador (10):
  freerdp: workaround gcc linking bug forcing -lpthread
  freerdp: add singleton support with PDU error handling
  cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
  bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
  xkeyboard-config: use --with-xkb-rules-symlink=3Dxorg option
  xkeyboard-config (git): update to current version - 2.1 plus fixes
  linux (2.6.37): update to 2.6.37.3 stable patch
  libarchive: add
  cmake: depends on libarchive
  p910nd: update to 0.95 and improve packaging

Pau Espin Pedrol (4):
  exocpslate.conf: add support for exoPC Slate tablet machine.
  netbase: add interfaces config file for exopcslate machine.
  linux: add defconfig file for exopcslate machine.
  xserver-xorg-conf: add xorg.conf config file for exopcslate machine.

Paul Menzel (1):
  xfce4-session_4.6.{1,2}: add `libwnck` to `DEPENDS`

Peter Gsellmann (2):
  gsoap_2.7.13 build errors
  vsftpd-2.0.5: added dependency for correct build order

Robert Schuster (20):
  * introduce libffi.inc and make 3.0.9 use it
  * added libffi 3.0.10rc8
  angstrom-jalimo.conf:     sane-toolchain-java.inc:      * make assignment=
s f
  libffi 3.0.10rc8: Added note about failing build for target.
  kobodeluxe 0.5.1: fix some whitespace
  kobodeluxe: added fix which renames a symbol that clashes with a std C on=
e
  avrdude 5.10: Added patches from Debian.
  jna 3.2.7: Added JNA library.
  jna 3.2.7: Some more notes and pretty formatting.
  openttd 0.6.3: Removed.     Signed-off-by: Robert Schuster <r.schuster@ta=
ren
  openttd 0.7.4: Converted to use openttd.inc           * also using
proper compile
  openttd-gfx 0.1.1: Deleted.           * worked unsatisfactory and
will be replace
  openttd-gfx 0.3.2: New recipe.        * Drop in replacement for formerly =
delet
  openttd-sfx 0.1.0: Delete.      * was working unsatisfactory and is being=
 re
  openttd-sfx 0.2.3: New recipe.
  openttd-sfx: Removed symlink.      * unreleased recipe, not increasing PR
  openttd.inc: Modifications in anticipation of supporting 1.0.5 release
  openttd-gfx: Fix description.
  openttd 1.0.5: Added new recipe.
  openttd.inc: Added some notes and allow adding parameters via EXTRA_OECON=
F.

Simon Busch (3):
  fsoaudiod: add recipe for new audio management daemon
  task-fso2-compliance: add fsoaudiod as dependency
  palmpre: add wifi related packages to MACHINE_EXTRA_RDEPENDS and bump PR =
of

Steffen Sledz (1):
  gupnp_0.13.4/gupnp-av_0.5.9: disable introspection

Tom Rini (46):
  ckermit: Switch to subdir=3D in SRC_URI
  openredalert: Switch to subdir=3D in SRC_URI
  docbook-sgml-dtd-native.inc: Switch to subdir=3D in SRC_URI
  freondemo-media-files: Switch to subdir=3D in SRC_URI
  elementary-icon-theme: Switch to subdir=3D in SRC_URI
  kxml2: Switch to subdir=3D in SRC_URI
  jaxp1.3: Switch to subdir=3D in SRC_URI
  microcom: Switch to subdir=3D in SRC_URI
  netpipes: Switch to subdir=3D in SRC_URI
  qpf-{arabic,unifont,unismall}: Switch to subdir=3D in SRC_URI
  regina-rexx: Switch to subdir=3D in SRC_URI
  slugtool: Switch to subdir=3D in SRC_URI
  otf-junction: Switch to subdir=3D in SRC_URI
  ttf-arphic-uming: Switch to subdir=3D in SRC_URI
  tzdata/tzcode: Switch to subdir=3D in SRC_URI
  v4l2apps: Switch to subdir=3D in SRC_URI
  woodstox2: Switch to subdir=3D in SRC_URI
  zaurus-legacy-tar: Switch to subdir=3D in SRC_URI
  zbedic: Switch to subdir=3D in SRC_URI
  zbedic: Switch to subdir=3D in SRC_URI, add FILESPATHPKG
  zrally: Switch to subdir=3D in SRC_URI
  mtd-utils-native.inc: Drop lzo-native
  util-linux-ng: Drop lzo-native from DEPENDS
  gettext.bbclass: Drop target gettext from DEPENDS.
  apt-native.inc: Update DEPENDS based on already inheriting gettext
  util-linux-ng.inc: Update DEPENDS based on already inheriting gettext
  whois.inc: Update DEPENDS based on already inheriting gettext
  classpath: Update to use 'inherit gettext'
  e2fsprogs: Update to use 'inherit gettext'
  ecore: Update to use 'inherit gettext'
  glib-2.0: Update to use 'inherit gettext'
  gnome-doc-utils: Update to use 'inherit gettext'
  guile: Update to use 'inherit gettext'
  help2man: Update to use 'inherit gettext'
  docbook-sgml-dtd-{3,4}.1-native: Fixup SRC_URI
  Many places: Refer to ${HOST_SYS}-libtool not ${TARGET_PREFIX}libtool
  glib-2.0: Fix DEPENDS_virtclass-native
  Back out recent glib-2.0 changes
  Revert "help2man: Update to use 'inherit gettext'"
  kaeilos-2009-preferred-versions.inc: Lock policykit
  angstrom-2008-preferred-versions.inc: Lock policykit
  policykit / policykit-gnome: Add 0.100
  gettext.bbclass: Add virtclass DEPENDS prepends
  classpath-native: Reorder inherits to fix gettext
  guile-native: Reorder inherits to fix gettext
  libiconv: Clean up


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


