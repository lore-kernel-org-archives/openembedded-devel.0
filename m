Received: from mail-iw0-f198.google.com ([209.85.223.198])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NA8FJ-0000aZ-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 21:32:24 +0100
Received: by iwn36 with SMTP id 36so4357996iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=DXwz+5Ce0D93u2x7Quyo/Ba7gfStp2iCsJiQySiCWGg=;
	b=GozTFodvOHU5Rqn42bTOFkM4Lkjvke0WwQv1oXBarReKJrfyC7Wk6OCsSHXtUAvOw5
	MSvxpVVCITFbiNcPtMeHEzwztE1r2n6o2rF82diZXkqya142Jt7jb7hIOtmdG2dsnm59
	hv4dtZ96K1Qy43n6/FvUmRlXvs+EZdLUhdBUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=e8FurP//YCAqDIkgL3gh5Podj16t9162llccR+w1Ae+9OlzNxVzFxQK6ypo/cOw4Xm
	p5e8DIYqs01cKQ/E0h4HovNDBrI1r/d7IFjwxxft3g88UkH0uQvgw4HXYvzlmiK7aTk4
	yuBtqVi4x342CmEDiPpJwMdb5wR71FYuXZDYw=
MIME-Version: 1.0
Received: by 10.231.25.160 with SMTP id z32mr2021703ibb.5.1258403458345; Mon, 
	16 Nov 2009 12:30:58 -0800 (PST)
Date: Mon, 16 Nov 2009 15:30:58 -0500
Message-ID: <f96d234e0911161230g46741a2bvaaf7afc504aad877@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-11-09 to 2009-11-16
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
X-List-Received-Date: Mon, 16 Nov 2009 20:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-11-09 to 2009-11-16

Dmitry Eremin-Solenikov (7):
  mplayer-svn: fix building for armv4t, arm-oabi, collie
  gnutls-native: new recipe
  curl: fix dependencies of native package
  fbreader: fix 0.10.7 FTBFS by adding DEPENDS on libfribidi
  libacpi: steal from Poky
  ltrace: fix compilation on PPC platforms

Frans Meulenbroeks (20):
  mythplugins: added mythweb (not fully tested yet)
  mysql5: removed DEFAULT_PREFERENCE=3D"-1" i(as discussed on email and irc=
)
  mythtv: upgraded recipe to 0.22, removed DEFAULT_PREFERENCE=3D"-1"; added=
 depe
  myththemes: updated to 0.22
  mythplugins moved to 0.22
  perl: added libhtml-treebuilder-perl and libhtml-treebuilder-perl-native =
rec
  libhtml-parser-perl-native: new recipe
  libhtml-tagset-perl-native: new recipe
  libextutils-makemaker-perl: added recipe, also -native
  libhtml-treebuilder-perl: added DEPENDS still need to check out RDEPENDS
  libxml-parser-perl-native: updated to 2.36
  libwww-mechanize-perl and -native: recipes added (needed for xmltv)
  various perl libs: removed unneeded EXTRA_CPANFLAGS for EXPAT
  libhtml-parser-perl and -namtive, upgraded to 3.64
  xmltv: added some grabbers

Graeme Gregory (6):
  xterm_243.bb : add newest version of xterm
  xterm_251.bb : really add latest version of xterm
  xterm_207.bb : fix problem on "SELinux" F11 based builds xterm_251.bb : f=
ix

Henning Heinold (7):
  Revert "geodegx: Fix glibc configure error"
  Revert "geodegx: Linux 2.6.31.4"
  povray: fix boost includes and std::exceptions
  boost-1.36.0: fix compiling with gcc-4.4
  libsdl-mixer: update to version 1.2.10
  wt3: update to version 3.0.0
  pingus: make it buildable again

Jaap de Jong (1):
  Precision Time Protocol (PTP) as defined by the IEEE 1588 standard

Jeremy Lain=E9 (1):
  linux-2.6.31: cleanup boc01 RTC driver

Khem Raj (3):
  mono: Replace cross compilation workaround for x86 architecture.
  klibc-1.5.15: Unbreak the build for x86 with kernels < 2.6.31
  eglibc_2.11: Add recipes for new eglibc 2.11 release

Koen Kooi (18):
  curl-native: disable gnutls since we don't have a gnutls-native recipe
  python-native: remove prefix and exec_prefix, native.bbclass should take =
car
  gnome-icon-theme: as I said in my commit two weeks ago: things check for =
its
  cpan-base bbclass: update to match change to perl-native staging
  perl: complete config.sh fix
  debian bbclass: remove hardcoded workdir/install and replace with PKGDEST
  cups: fix do_package, do_stage is still broken
  cups: switch to new style binconfig (un)Mangling
  mysql: adopt to new style sysroot stuff
  ilibdiscid: update SRC_URI
  libdiscid: some further cleanups
  qt4: bump PR
  gst-plugins-good: depend on flac as well
  pixman git: bump SRCREV to one where almost all patches are upstream
  libusb1: update to 1.0.4, convert to new style staging
  midori: add 0.2.1
  libfreespace: add 0.4
  webkit-gtk: adopt to new style staging

Liam Girdwood (3):
  pulseaudio: added pulseaudio-0.9.19
  Merge remote branch 'origin/org.openembedded.dev' into upstream
  glibc: added glibc-2.10.1

Marc Olzheim (3):
  Move 3.0.2 to a .inc and use INC_PR (to avoid useless duplication).
  Add latest 3.1.2p1 (latest 3.x stable release).
  Get rid of useless bash dependency in the linux client script.

Marcin Juszkiewicz (3):
  mtd-utils: unify recipes, move mkfs.ubifs into separate package
  mtd-utils-tests: update to 1.2.0+git
  mtd: dropped 1.0.0(+git) versions

Martin Jansa (20):
  shr: add SHR distribution configs
  sane-srcrevs.inc: sort right, before inserting new items
  sane-srcrevs: add SRCREVs for recipes which will be merged from SHR
  sane-srcrevs: add SRCREV for shr-splash-theme-logo
  bitbake.conf: SRCPV always upgradeable paths for git recipes
  sane-srcrevs-fso: add pycd libfsoresource libfsobasics fso-apm, remove mi=
sc-
  sane-srcrevs: add few more SRCREVs for shr apps
  sane-srcrevs-fso: fix libpersistence revision
  dbus: disable libaudit for all and X for native packages (from POKY)
  openmoko-panel-plugins: change svn${SVNREV} to svnr${SRCPV}
  openmoko-panel-plugins: change svn${SVNREV} to svnr${SRCPV}
  shr themes: new recipes from shr/merge
  illume-keyboards: add more keyboard definitions from shr/merge
  shr phone applications: new recipes
  initscripts-shr_git.bb: renamed to recipes/shr/initscripts-shr_0.0.1.bb, =
bec
  shr recipes: switch SRCREV->SRCPV, without PE bump
  Revert "illume-keyboards: add more keyboard definitions from shr/merge"
  illume keyboards: switch from SRCREV to SRCPV
  libmodulo: remove girepository inherit

Michael 'Mickey' Lauer (8):
  vala: add unofficial point release 0.7.8.1
  libnl2: new recipe; netlink support library v2
  freesmartphone: misc-vapi is gone; remove traces
  vala-native: remove git repository; we prefer release versions for it now=
ada
  mobile-broadband-provider-info: new recipe; database for mobile broadband=
 pr
  fsogsmd: depend on mobile-broadband-provider-info and libxml2
  ptpd: stylize
  ltrace: fix wrong path to coreutils-native and add actual dependency

Mike Westerhof (2):
  SlugOS: preferred-slugos-versions.inc - use older pulseaudio version (lat=
est
  SlugOS: slugos.inc - set preferred provider for util-linux to util-linux-=
ng.

Otavio Salvador (2):
  xf86-video-cirrus: add 1.3.2 and set it as prefered for X11 7.5
  linux-libc-headers: add missing unifdef.patch for 2.6.25

Petr =A6tetiar (3):
  linux: Linux 2.6.31.5
  linux: Linux 2.6.31.5 for IEI Nano GX-466
  Machine configuration for IEI Nano GX-466

Phil Blundell (4):
  tcl: try to fix sundry problems with library staging
  base.bbclass: add support for checksums in .bb files
  fix c&p error in last patch
  busybox_1.14.3: move checksum to bb file

Richard Purdie (60):
  sanity.conf: Bump minimum bitbake version requirement
  base.bbclass: Drop legacy rebuild mangling code
  base.bbclass: Drop import bb and import os as no longer needed
  package.bbclass: Move variable checks to one place making the code more r=
ead
  package.bbclass: Remove hardcoded use of PKGDEST variable (from Poky)
  package.bbclass: Change to operate on a copy of the install directory ins=
tea
  package.bbclass: Add the option to declare package preprocess function ho=
oks
  autotools.bbclass: Remove pointless inherit (from Poky)
  autotools.bbclass: Allow for leading whitespace in gettext and intltool s=
ear
  autotools.bbclass: Create m4 directory earlier avoding issues with intlto=
oli
  packagedata.bbclass: Split package data handling functions out from base.=
bcl
  base.bbclass: Promote packagedata inherit to a direct inherit due to orde=
rin
  glibc-package.bbclass: Operate on PKG, not D after package.bbclass update=
s
  elibc-package.bbclass: Operate on PKG, not D after package.bbclass update=
s
  Start removal of layout_* variables and replace these with new mechanisms=
 to
  binconfig.bbclass: Convert do_install_append() into a PACKAGE_PREPROCESS_=
FUN
  autotools.bbclass: Convert .la file mangling to package preprocessing hoo=
k
  autotools.bbclass: Separate out useful staging functions into base.bbclas=
s a
  binconfig/pkgconfig.bbclass: Convert staging functions into SYSROOT_PREPR=
OCE
  native.bbclass: If do_stage isn't overridden, allow do_install to run for=
 na
  packaged-staging.bbclass: Use a variable for the location of the staging =
loc
  base.bbclass: Rework staging function to use a DESTDIR style configuratio=
n b
  base.bbclass: Note legacy staging packages in debug output
  base.bbclass: Add stubs for functions when package-staging isn't active a=
nd
  base.bbclass: Fix staging for native and non-native packages
  native.bbclass: Add BBCLASSEXTEND support (from poky)
  base.bbclass: Replace the base_package_name function with the base_prune_=
suf
  Add replacement canadian classes from Poky, marking the replacements as d=
epr
  sanity.conf: Bump bitbake version to 1.8.18
  perl-native: Fix after layout/native.bbclass changes (merged from Poky)
  base.bbclass: Detect recipes where there are problems with staging functi=
ons
  recipes: Fix recipes using do_stage_append or do_stage_prepend directly a=
gai
  module-init-tools: Split into a .inc file for use by -cross so bindir and=
 sb
  classes: Drop some random import bb/os statements
  module-init-tools-3.4: Fix typo
  perl: Move config.sh to STAGING_LIBDIR rather than trying to be clever wi=
th
  bitbake.conf: Build MACHINE_ARCH from BASE_PACKAGE_ARCH, not HOST_ARCH fi=
xin
  icu: Fix class ordering problem by converting to use SYSROOT_PREPROCESS_F=
UNC
  mysql5: Fix class ordering problem by converting to use SYSROOT_PREPROCES=
S_F
  perl: Bump the remaining PRs so the last changes take effect
  zaurus-updater: Fix task order for packaged-staging. PARALLEL_MAKE is poi=
ntl
  base.bbclass: Fix legacy staging package generation as pre hook was calle=
d t
  native.bbclass: Force legacy staging mode autotools_stage_all is used as =
oft
  native.bbclass: Change warning to debug, not a note for now
  meta-toolchain: Various corrections after the layout_* variable removal (=
fro
  meta-toolchain-qte: Update prefix references -> SDKPATH
  curl: Drop unneeded custom staging functions
  bitbake.conf: Fix TERMCMD variables (from Poky)
  Revert "bitbake.conf: Fix TERMCMD variables (from Poky)"
  icu: Add missing SYSROOT_DESTDIR to sysroot processing function
  udev-141: Fix staging of .pc file due to exec_prefix being ''
  udev-141: Fix staging of include files due to exec_prefix being ''
  dbus-native: The native version should have the install fix applied else =
a w
  dbus-1.2.1: Update fix-daemon-install patch to use automake magic to avoi=
d t
  kernel.bbclass: Fix populate_packaged 'D' references
  python-native: do not look in host paths for shared objects
  packaged-staging.bbclass: Fix references to libdir which should be libdir=
_na
  gconf: Remove hardcoded PKGDEST directory assumption
  gtk-icon-cache.bbclass: Remove hardcoded PKGDEST directory assumption
  mime.bbclass: Remove hardcoded PKGDEST directory assumption

Robert P. J. Day (1):
  User manual typoes and aesthetics, chapter 2 only.

Sebastian Spaeth (5):
  minimal.conf: fix spelling for BAD_RECOMMENDATIONS
  elmdentica: port elmdentica_svn.bb from shr/merge branch
  Revert "elmdentica: port elmdentica_svn.bb from shr/merge branch"
  ophonekitd: remove. obsoleted by phonefsod

Stuart Gray (3):
  cdparanoia 9.8alpha: run recipe through oe-stylize.py cdparanoia 10.2: ad=
d n
  libdiscid: add 0.2.2
  libmusicbrainz: add depends, clean up inc file

Bugs fixed:

bug_id resolution        short_desc
1427 FIXED       passwd crashes when changing password
3400 INVALID     OE.mtn.bz2 won't bunzip2
4162 REMIND      zaurus-updater do_deploy fails to run in .stable
4998 FIXED       Connman fails to compile
5023 FIXED       Missing depencies of package python-email
5336 INVALID     Can't flash the colli anymore

Bugs opened:

bug_id resolution        short_desc


