Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OLfRn-0007Rc-Qh
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 18:46:02 +0200
Received: by wwa36 with SMTP id 36so72636wwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=RCYTruHS501S579c95U3NM7wR1PCUC9LFr5yZ6vg2Tc=;
	b=U41Kh/MvIc4Foe4JXun8cSdVIMescpCjE9EX/JMJrSelzsYkzgEqN/QQmbLieJtk0v
	yTBokhzJx/W2uVrr1d85hm+UtyXnUdibKGa4Yyha3rewfN8ie4Tib7hMuXBqeT3ABhpd
	nsnHPAH7ckF18Ec73UI6nuZde1gsctq19VwwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=SyEJ0tuowRt71rj51ArozTQxPNAfcfQljJXAvHe1E8gfnBg/ImatyHFw0eVUeUk121
	MPogcZYghxZVhxMaHbBnT3Cte8wc++RhA7VOtTm5tg1eSixom/mikh7LL+nxaG62ybMu
	dB8FUKwOXylqHn/qYWMj+JBGhppZ0v3mL8Is0=
MIME-Version: 1.0
Received: by 10.227.128.4 with SMTP id i4mr7850764wbs.188.1275928848881; Mon, 
	07 Jun 2010 09:40:48 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 7 Jun 2010 09:40:48 -0700 (PDT)
Date: Mon, 7 Jun 2010 12:40:48 -0400
Message-ID: <AANLkTilCnLqmOOXckpzfmWjz2BhAYvSH4KnpcCMsLGWo@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-05-31 to 2010-06-07
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
X-List-Received-Date: Mon, 07 Jun 2010 16:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-05-31 to 2010-06-07

Andrea Adami (2):
  klibc: major clean out of intermediate recipes.
  klibc: fix packaging

Antonio Ospite (10):
  device_table-minimal.txt: fix input device nodes path
  device_table-ezx.txt: add needed device nodes
  xserver-kdrive-common/Xserver: fix EZX settings
  tslib: Add config file for a780 machine
  motorola-ezx-base.inc: use PREFERRED_PROVIDER_virtual/xserver
  motorola-ezx-base.inc: refresh machine definition
  openezx-kernel_git: update recipe
  ezx-gen-blob: bump SRCREV
  ezx-boot-usb-native: bump SRCREV
  frameworkd_git.bb: bump SRCREV

Bernhard Reutner-Fischer (1):
  xz: add recipe and use BBCLASSEXTEND for native version.

Chase Maupin (6):
  qt4-embedded: rename qtdemo file
  alsa-state/dm355-evm: add asound file from arago
  alsa-state/dm365-evm: add asound file from arago
  alsa-state/dm6467-evm: add asound file from arago
  alsa-state/dm6467t-evm: add asound file from arago
  alsa-state: bump alsa-state PR

Denys Dmytriyenko (1):
  amend.bbclass: don't parse same amend.inc if FILESPATH references it mult=
ipl

Dmitry Eremin-Solenikov (4):
  qemu: fix the fix for qemu-native vs. no zlib on host
  pcmciautils: fix build to use flex from sysroots, not from host
  icecc.bbclass: fix irt changes in toolchains installation
  pcmciautils: don't hardcode path to flex  binary

Eric B=E9nard (5):
  live555: add 20100529 and create include
  libvpx: remove --enable-ccache configure option
  qt4.inc: split font package
  linphone_3.1.0: add libglade dependency
  canutils: move 3.0.2 in socketcan directory

Henning Heinold (3):
  jikes: change RDEPENDS so that jikes-native don't depends on target-class=
pat
  classpath-tools-native: remove do_stage function, not needed anymore
  classpath-tools-native: *sigh* seems do_stage needs to be override in all=
 ca

Holger Hans Peter Freyther (1):
  m4: Fix m4-native-1.4.14 build on Fedora13...

Ilya Petrov (1):
  motorola-ezx-base.inc: Add support for ubifs

Jan Paesmans (2):
  grep: add missing dependency on gettext
  grep-native: add missing inherit on gettext

Jason Kridner (8):
  angstrom-uboot-scripts: fixed file permissions
  angstrom-uboot-scripts: Added some new scripts
  u-boot git: update beagleboard patches
  angstrom-uboot-scripts: Used beaglerev variable
  angstrom-uboot-scripts: Added an EDID read script
  esc-gst: Added fixup for missing files
  esc-node-demo: added simple Node.js demo for ESC
  angstrom-uboot-scripts: Added various resolutions

Khem Raj (33):
  gcc-4.5: rename 4.5.0 to 4.5 and update to latest svn revision.
  m4-1.4.14: Fix compilation on uclibc.
  qemu: When using _append we dont need +=3D
  pump: Pull patches from gentoo and debian and make it compilable with ucl=
ibc
  qemu.inc: zap_root_password for qemu images.
  uclibc-git: Move to latest master and enable UCLIBC_HAS_BSD_RES_CLOSE
  Revert "qemu.inc: zap_root_password for qemu images."
  classes/autotools.bbclass: Dont bail out if gettext/config.rpath does not=
 ex
  classes/gettext.bbclass: Account for libiconv and libintl too.
  gettext-0.18: Add recipe for 0.18
  coreutils-8.5: Add recipes for version 8.5
  libiconv-1.13.1: Add recipes
  db_5.0.21: Add recipes for target and native packages.
  grep-2.6.3: Add recipe.
  glib-2.0_2.24.0.bb: Remove virtual/libiconv virtual/libintl from DEPENDS
  gnutls_2.8.6.bb: Add recipe for version 2.8.6
  inetutils_1.8.bb: Add recipe
  findutils_4.5.9.bb: Add recipe.
  gstreamer_0.10.28.bb: Fix to build with gettext 0.18
  ncurses: Add -fforward-propagate on arm.
  zlib.inc: Add -fforward-propagate on arm.
  libx11_1.3.2.bb: Add -fforward-propagate on arm.
  shadow_4.1.4.2.bb: add --with-nscd=3Dno when compiling for uclibc
  cvs-1.12.9: uclibc does not export __mempcpy so use mempcpy
  binutils-cross: Build with --enable-shared and install libiberty-pic.a
  site/mips-common: Cache cvs_cv_func_printf_ptr
  udev_151: Make it work with uclibc.
  bison: DEPEND on virtual/libintl not on gettext
  angstrom-2008-preferred-versions.inc: Set 1.11 PREFERRED_VERSION for auto=
mak
  sane-toolchain-uclibc.inc: Dont force USE_NLS for glib-2.0 here.
  gettext-native: Add virtual/libintl-native to PROVIDES list.
  grep_2.6.3.bb: DEPEND on xz-native.
  gcc-4.2.4: Fix libstdc++ build failures with new sysrooted staging.

Koen Kooi (38):
  cheese: add 2.30.1
  x264: update snapshot and convert to new style staging
  libvpx: stage headers in ${includedir}/vpx
  gstreamer: add 0.10.29
  gst-plugins: dependency tweaks, enable more plugins
  gst-plugins-base: add 0.10.29
  gst-plugins-good: add 0.10.23
  gst-plugins-bad: add 0.10.19
  gst-plugins-ugly: add 0.10.15
  wavpack: add 4.60.1
  libmicrohttpd: add 0.4.6
  opkg: bump SRCREV to 530
  cairo 1.8.10: add patch to get rid of some double precision FP math and c=
onv
  cheese: remove scrollkeeper-native, it doesn't exist in OE so we shouldn'=
t b
  scrollkeeper: add 0.3.14. Only -native portion works, but that's what we =
are
  task-sdk-native: add cvs to RRECOMMENDS for autopoint
  task-sdk-native: conform to OE packaging guidelines, spotted by Martin Ja=
nsa
  task-sdk-native: and fix typo, also reported by Martin
  psplash-zap: fix typo, spotted by Martin Jansa
  libgles-omap3: add RRECOMMENDS for x11-wsegl to x11 packages
  cairo 1.8.10: use proper patch to get rid of DP FP math
  cairo 1.8.10: even faster version of patch
  linux-input: clean up and fix QA errors
  bc-cube: use webcam icon
  gstd: merge in changes from Ridgerun
  gstd: also bump PR
  u-boot git: update beagleboard patches
  angstrom: automake 1.11 doesn't exist, 1.11.1 does
  efl: revert SRCREV bump, needs more testing
  linux-omap-psp 2.6.32: disable CDC_EEM for beagleboard
  qt 4.7.0-beta1: fix versioning
  gnome-bluetooth 2.30: fix a libtool issue where the 'test' line is true f=
or
  esc-gst: fix versioning
  esc-media: fix versioning
  qt 4.7.0-beta1: drop patches for affine and browser
  ESC/2010: move all files into esc/ dir
  linux-omap-psp 2.6.32: add cpuidle multi-config for beagleboard
  linux-omap-psp 2.6.32: rebase patches onto new baseline

Martin Jansa (9):
  xfce46: remove checksum name atribute from bbclass
  cheese: add gst-plugins-base to DEPENDS
  xinput-calibrator: add INC_PR, move machine specific file to separate rec=
ipe
  Revert "klibc: fix packaging"
  klibc: fix packaging without moving PACKAGES and FILES_ back to recipes
  recipes: conform to OE packaging guidelines with RDEPENDS/RRECOMMENDS
  linux-openmoko-2.6.32: fix for lost touchscreen bug #2328
  linux-openmoko-2.6.34: fix for lost touchscreen bug #2328
  linux-openmoko-2.6.34: add patch for building with gcc-4.5.0 (from linux_=
2.6

Matthias G=FCnther (2):
  qt4: Add qt4-tools-native_4.7.0-beta1
  qt4: Add qt4-x11-free_4.7.0-beta1

Michael Lippautz (1):
  zziplib: Convert to new staging

Phil Blundell (4):
  gtk-demo-image: new
  linux-atm: update to 2.5.1
  thttpd: fix a compilation failure
  gtk+extra: update to 2.1.2, apply lame patch for autotools issuette

Robert P. J. Day (4):
  Manual: Some simple updates in OE manual, reference chapter.
  Manual: Add missing reference to "ftp" as possible fetch method.
  Manual: Add missing unpack file formats to list.
  matrix-gui,udev: Remove superfluous "patch=3D1" parameters from some reci=
pes.

Roger Monk (2):
  ti-codec-engine: Add v2.25.03.13
  ti-xdctools: Add v.3.20

Roman I Khimov (2):
  whois: update to version 5.0.5
  pmacct: update to version 0.12.2

Stefan Schmidt (3):
  u-boot_git: Add bug20 support
  netcat_0.7.1: Gettext is needed
  task-proper-tools: Add netkit-telnet

Todd Fischer (2):
  Streamer scripts for Embedded Systems Conference workshop
  Media files to include on the Embedded Systems Conference workshop

Tom Rini (28):
  busybox-static: Switch to FILESPATHPKG
  bzip2-full-native: Switch to FILESPATHPKG
  elfkickers-native: Drop unnecessary FILESPATH modification
  emacs-x11: Switch to FILESPATHPKG
  emacs: Drop unnecessary FILESPATH
  freetype-native: Drop unnecessary FILESPATH
  genext2fs (1.3+1.4rc1): Drop unnecessary FILESPATH (no vesion specific pa=
tch
  genext2fs (1.3+cvs): Switch to FILESPATHPKG
  gdk-pixbuf-csource-native (2.12.11): Switch to FILESPATHPKG
  gdk-pixbuf (2.10.14): Switch to FILESPATHPKG
  libsdl-ttf-native: Drop unnecessary FILESPATH
  linux-efika (2.6.20.20): Switch to FILESPATHPKG
  linux-handhelds: Switch to FILESPATHPKG
  opensimpad (2.4): Switch to FILESPATHPKG
  lua: Drop unnecessary FILESPATH
  mesa-dri (6.5.2 / 7.0.3): Switch to FILESPATHPKG
  netkit-rpc-native: Drop unnecessary FILESPATH
  obexpush-native: Drop unnecessary FILESPATH
  python-pygobject: Drop unnecessary FILESPATH
  python-setuptools-native: Drop unnecessary FILESPATH
  snes9x-sdl-qpe: Switch to FILESPATHPKG
  xextproto-70-includes: Drop unnecessary FILESPATH (what was added doesn't
  xserver-kdrive-1300: Switch to FILESPATHPKG
  xserver-kdrive-glamo: Switch to FILESPATHPKG
  xserver-kdrive-imageon: Switch to FILESPATHPKG
  xserver-kdrive-nomadik: Switch to FILESPATHPKG
  xserver-kdrive (git): Switch to FILESPATHPKG
  rootfs_ipk/meta-toolchain: Add locking on tasks that add package_update_i=
nde

Vitus Jensen (4):
  linux-n1200_2.6.27-rc9+git: change KERNEL_OUTPUT to a relative path
  libsocketcan: new recipes
  canutils: new recipes
  socketcan-utils-test: rconflicts with canutils

Vladimir Sorokin (2):
  pmacct: recipe for version 0.12.1
  xl2tpd: Initial commit.

Vladimir Zapolskiy (3):
  kdrive: fix compilation problem of xserver-kdrive
  kdrive: fix keyboard device support in kdrive
  libxcb: fix paths for installed python modules


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-05-31 to 2010-06-07


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


