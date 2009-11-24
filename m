Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NCwky-0002pN-MW
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 15:52:43 +0100
Received: by fxm8 with SMTP id 8so6928721fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 06:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=H/Im540I8QrNRBL9cEVtpgiFAiHnocVXoQcKnW7HNAQ=;
	b=imVaj4HZcujLC/VOiLfZ0jtOVwn0dHGGI6J0H/aKRFaFpANmoz8R4C4ocgISBpuqVb
	JMtudw38HVhq0ttNkQwU4mnTSqhG2DdcX/DbtlK1LvMEwOjkKH7pCptknK5BO+16SqjJ
	xyVAMIc5plzXd3GS6n53Wf2BxGFsDBrq80AxM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kN7l1heaJHZ6kMbtKWMill/2stHidu9uL7xfFYSXvqJ57pgvLLmt6Y0gRbdZF98QxG
	I2naCPZuzfMvSFUAsCsiUicXo9T5KgaK5zYx0nm53+5npdzZnOBN034VT8BNWCLeY+tm
	OmxG8v/DpJFbeTukg8L54ms+yyKvgioM+gZLY=
MIME-Version: 1.0
Received: by 10.216.86.129 with SMTP id w1mr2034581wee.145.1259074271755; Tue, 
	24 Nov 2009 06:51:11 -0800 (PST)
Date: Tue, 24 Nov 2009 09:51:11 -0500
Message-ID: <f96d234e0911240651w3c8fea77nfb062af9dc091703@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-11-16 to 2009-11-23
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
X-List-Received-Date: Tue, 24 Nov 2009 14:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-11-16 to 2009-11-23

Alex Ferguson (4):
  Add machine configuration for the Samsung Omnia SGH-i900.
  Add kernel recipe for the Samsung Omnia SGH-i900.
  Add support files for the Samsung Omnia SGH-i900 in tslib and pointercal.
  Symlink helper_gspi.bin to gspi8686_hlp.bin for the libertas_spi kernel d=
riv

Andrea Adami (5):
  kexecboot_git: bump to ddf66724ce68509a8d80727f26f682b9a9341ff5. Increase=
 PR
  kexec-tools_2.0.1: add uImage support from upstream. Bump PR of shared an=
d s
  kexec-tools-klibc-static_1.101.bb: inject 'static' in CFLAGS string
  opie-networksettings: unbreak builds against *actual* linux-2.6.31 header=
s.
  palmtop.bbclass: fix QA of plugins wrt packaging of -dbg files

Bernhard Kaindl (1):
  ltrace: cleanup

David Lanzend=F6rfer (1):
  mokomaze: missing space between SRC_URI entries

Graeme Gregory (3):
  libsdl-mixer_1.2.11.bb : update the latest version

Henning Heinold (10):
  micro.conf: use prefix_native and prefix_exec_native
  micro.conf: use latest preferred xorg version
  python-pygtk: fix staging for codegen with right prefix
  ecore: fix building for uClibc
  micro.conf: let gtk+ provide gail
  goffice: make buildable for uclibc
  disko: update git and make recipe for version 1.6.0
  libpam: fix building for uclibc
  disko-git: fix package name, was to early for the change
  ecore: fix building for uClibc

Holger Hans Peter Freyther (1):
  tinderclient.bbclass: Less ego...

Jeremy Lain=E9 (2):
  linux-2.6.31 : fix email for isl12024 driver author
  checksums.ini: add missing entry for wbxml2 0.10.7

Klaus Kurzmann (14):
  sane-srcrevs.inc: bump rev for pyphonelog
  task-fso2-compliance: add tzdata-africa and tzdata-australia to rrecommen=
ds
  sane-srcrevs.inc: bump rev for e-wm-config-illume-shr
  sane-srcrevs-fso.inc: bump rev for fsousaged
  sane-srcrevs.inc: bump rev for mokonnect
  e-wm-sysactions-shr: install lock.sh
  sane-srcrevs.inc: bump rev for e-wm-sysactions-shr and e-wm-config-illume=
-sh
  sane-srcrevs-fso.inc: bump rev for fsodeviced
  task-shr-feed: add xboard
  preferred-shr-versions.inc: add EFL_SRCREV and set to 43898
  e-wm_svn.bb: add patch for SHR to skip some modules from the first start =
wiz
  netbase: add init and options for SHR distro

Koen Kooi (14):
  libgles-omap, omap3-sgx-modules: add SDK 3.01.00.02/1.4.14.2514 release
  Revert "ecore: fix building for uClibc"
  task-boot: move kernel to rrecommends so it can be uninstalled when provi=
din
  ffmpeg svn: bump SRCREV and tweak default pref a bit
  mplayer svn: bump SRCREV
  checksums: add checksums for 2.6.24.X stable patches
  mplayer git: kill SRCPV, no SRCPV for git allowed yet
  nmap: disable parallel make
  package bbclass: give better diagnostic when bb.copyfile fails
  package bbclass: drop ret =3D 0 check for bb.copyfile since it will retur=
n eit
  webkit-efl: run thru oe-stylize.py

Kristoffer Ericson (5):
  Change config into something that actually builds.
  update Maintainer information
  update jlime-2009.1 distro file and check so it builds
  Add machine file for Qi-Hardware's ben nanonote.
  Add preferred kernel for the ben-nanonote and merge that into linux_2.6.3=
1.b

Leon Woestenberg (13):
  squashfs-lzma-tools: Upstream LZMA support requires -comp argument.
  linux-kirkwood: Add patch that re-enables interrupt from idle.
  linux-kirkwood: Add patch that re-enables interrupts from idle.
  MAINTAINERS: Update recipes, machines that I look at now and then.
  squashfs-lzma-tools: Revert, re-applied later in unified commit.
  linux-{,kirkwood-}2.6.31: Add upstream squashfs-4.0 LZMA patches.
  squashfs-4.0: update squashfs-tools to include upstream LZMA inclusion.
  lzma.inc: Remove dependency on dos2unix host command, using sed.
  conf/machine/ion.conf: NVidia Ion based x86 machines.
  ion.conf: TARGET_CC_ARCH =3D "-march=3Di686 -mtune=3Datom" for Atom.
  tune-atom.inc: Use gcc arch and tune options for GCC 4.3.1+
  linux-2.6.31: Added defconfig for MACHINE ion.
  nvidia-display: Added 190.42 release. Builds but packaging needs clean-up=
.

Marc Olzheim (3):
  curl: apply patch for CVE-2009-2417
  curl: apply patch for CVE-2009-2417
  curl: add 7.19.7

Marcin Juszkiewicz (3):
  bug: ship SDIO firmware for WiFi
  MAINTAINERS: added BUG to my devices
  xserver-xorg-conf: added BUG support

Martin Jansa (100):
  svn recipes: change +svnr${SRCREV} +svnr${SRCPV}
  svn recipes: change svn${SVNREV} to svnr${SRCPV}
  fsoraw: add svnr${SRCPV} to PV
  openscada: add svnr${SRCPV} to PV
  matchbox-panel-2-icon-themes: add SRCREV_FORMAT as there is more svn urls
  sane-srcrevs.inc: add SRCREV for wesnoth, its in obsolete bud still parse=
d a
  midori: fix git repository url
  checksums.ini: add entries for SHR recipes
  aceofpenguins: new recipe from SHR
  calc: new recipe for elementary based calculator from SHR
  linux-openmoko-2.6.31: new recipe for 2.6.31 kernel from SHR
  linux-openmoko-shr-drm: new recipe for 2.6.29-rc3 kernel with DRM/KMS sup=
por
  linux-openmoko-shr: new recipe for 2.6.29-rc3 kernel
  shr-image, shr-lite-image: for building SHR distribution
  orrery: new recipe from SHR
  pisi: new recipe from SHR
  om-neon: new recipe from SHR
  advancedcaching: new recipe from SHR
  cellhunter: new recipe from SHR
  callrec: new recipe from SHR
  e-tasks: new recipe from SHR
  elmdentica: new recipe from SHR
  eve: new recipe from SHR
  task-shr: new task for SHR distribution
  webkit-efl: new recipe from SHR
  openmoocow: new recipe from SHR
  pydes: new recipe from SHR
  pyring: new recipe from SHR
  python-blipapi: new recipe from SHR
  python-dateutil: new recipe from SHR
  python-epydoc: new recipe from SHR
  python-ldap: new recipe from SHR
  python-pybluez: add version 0.16 from SHR
  python-vobject: new recipe from SHR
  python-webdav: new recipe from SHR
  python-wifi: new recipe from SHR
  qwo: add version 0.5 from SHR
  sms-sentry: new recipe from SHR
  tangogps: add version 0.9.9 from SHR
  blipmoko: new recipe from SHR
  blueman: new recipe from SHR
  bt-configure: new recipe from SHR
  bt-gps: new recipe from SHR
  mokonnect: new recipe from SHR
  dictator: new recipe from SHR
  ebrainy: new recipe from SHR
  enotes: new recipe from SHR
  erminig: new recipe from SHR
  ffalarms: new recipe from SHR
  intone: new recipe from SHR
  intone-video: new recipe from SHR
  pythm: new recipe from SHR
  omgps: new recipe from SHR
  omnewrotate: new recipe from SHR
  omview: new recipe from SHR
  omoney: new recipe from SHR
  mokomaze: new recipe from SHR
  notifier: new recipe from SHR
  glamo-dri-tests: new recipe from SHR
  libical: add version 0.44 from SHR
  pyphonelog: new recipe from SHR
  openmoko-agpsui: add patch for newer autotools
  linphone: add version 3.1.0 from SHR
  openmoko-alsa-scenarios: add provides virtual/alsa-scenarios
  libmokoui2: add patches from SHR
  sane-srcrevs: update libgee, paroli, pyphonelog, xf86-video-glamo, libmok=
oui
  mplayer-common: add SHR specific config file
  task-fso* compliance: update requirements and include it in shr-image
  alsa-state: use virtual/alsa-scenarios
  bluez4: increase preference for shr, enable udevrules
  elementary: don't pull elementary-tests by default
  ffmpeg_svn: increase preference for shr
  fsodeviced: update recipe from SHR
  paroli: updated recipe from Angus
  python-dbus: add python-epydoc-native for buildhosts without epydoc
  python: force reconf for libffi subdirectory, needed with newer autotools
  samsung-soc-util: switch from https to http as certificat is not valid
  tangogps: RRECOMMENDS fso-gpsd for SHR
  wbxml2: add version 0.10.7 from SHR
  libsyncml: add version 0.5.4 from SHR
  msn-pecan: new recipe from SHR
  mplayer: add git version with glamo patches for om-gta02
  recipes from shr: kill SRCPV, no SRCPV for git allowed yet
  glamo-dri-tests: move to better directory, included in BBFILES
  bitbake.conf: Fix OVERRIDES description (After pb's explanation)
  midori: add shr specific patch
  checksums: add checksum for tzdata
  tzdata: add 2009s, fix typo in do_compile, install zone.tab and iso1366.t=
ab
  linux-openmoko-shr-drm-devel: switch back to drm-tracking branch
  task-shr-feed: remove all stuff depending on bluez-libs
  jamvm-initial: add libffi-native dependency
  sane-srcrevs: bump SRCREV for linux-openmoko-shr-drm-devel and glamo-dri-=
tes
  linux-openmoko: don't clear module_autoload_snd-soc-neo1973-gta02-wm8753 =
for
  task-shr-feed: add sox, zile, mpg123
  checksums: add checksum for new tangogps_0.99
  module_strip.bbclass: look for modules in right directory
  linux-openmoko-2.6.31: add Weiss's patches from gdrm-2.6.31

Martin.Jansa (3):
  sane-srcrevs-fso: update freesmartphone revs
  shr: update config from SHR
  om-gta0(1|2): update config from SHR

Mike Westerhof (2):
  owfs: disable swig to prevent doomed attempt to build a perl module.
  SlugOS: add owfs to the package feeds

Otavio Salvador (3):
  squashfs-tools: add .inc usage again to avoid duplicated logic
  lzma.inc: use CXX and CC environment values to really do cross compile
  squashfs-tools: allow setting of SRC_URI before loading .inc

Phil Blundell (3):
  remove extraneous quoting around MODULE_OPTIONS; patch from Tasslehoff Kj=
app
  move menuconfig task from "after do_patch" to "after do_configure"; patch=
 fr
  curl: add checksums for 7.19.7

Philip Balister (3):
  gnuradio : Update git recipe to build from current HEAD.            * Upd=
ate
  gnuradio : Restore DEFAULT_PREFERENCE =3D "-1".
  gnuradio : Fix stupid typo. Sorry for the noise.

Richard Purdie (15):
  gconf/gtk-icon-theme/mime: Really fix PKGDEST references
  classes: Drop a number of unneeded import calls (from Poky)
  package.bbclass: Add back import os until further metadata cleanups happe=
n
  insane.bbclass: Remove hardcoded path PKGDEST issue
  kernel.bbclass: Revert import os removal for now
  libacpi: Drop undeeded custom staging function
  glibc: Separate out core glibc packaging functionality into a class which=
 ca
  packaged-staging.bbclass: Add method to disable packaged-staging from rec=
ipe
  libxml-parser-perl: Set DEPENDS properly (from Poky)
  .gitignore: Ignore backup files (*~)
  glibc-package.bbclass: Fix case PN =3D glibc and corrupts FILES variables
  glibc-package.bbclass: Add support for precompiled glibc trees (from Poky=
)
  package.bbclass: Make sure PKGD is empty before populating fixing certain=
 bu
  kernel.bbclass: do_deploy modules.tgz should operating on PKGD
  package.bbclass/module-strip.bbclass: Various strip fixes

Robert P. J. Day (2):
  guile-native: Add patch to inhibit generation of linemarkers from cpp.
  Upgrade guile from 1.8.6 to 1.8.7.

Roger Monk (2):
  linux-davinci git: Update to latest OMAPL kernel  - 2.6.32rc6 (PSP 3.20.0=
0.0
  u-boot git: Updated to omap-l machines to latest revisions corresponding =
to

Sebastian Krzyszkowiak (3):
  sane-srcrevs-fso.inc: bump rev for fsodeviced
  tangogps: bump version to 0.99.1
  task-shr-feed: add speex

Sebastian Spaeth (14):
  e-wm-config-illume-shr: update sane src rev
  frameworkd-config-shr: bump sane rev
  libfsobasics: bump sane rev (fixes log file creation)
  task-fso2-compliance: add tzdata back to RRECOMMENDS
  fsodeviced: nice -19 by default in init script
  task-shr-minimal: pull in libcanberra-alsa for now until fsodeviced does =
it
  task-shr-minimal: move comment above pkg listing. borked parsing.
  fsodeviced: bump sane rev to get audio fixes
  fso-specs: bump sane ref to latest existing
  shr-settings: bump sane revs, to catch up with fso2
  fso-apm: add correct DEPENDS and bump PV to what configure.ac is saying (=
2.0
  task-shr-minimal: Remove fso-apm and e-wm-config-illume-shr
  Revert "om-gta0{1, 2}.conf task-shr-minimal: remove apm from machine feat=
ure
  fsodeviced: set default niceness to +10 rather than -19

Thomas Zimmermann (7):
  shr/merge: mplayer: fix ivtv build problem
  midori: add shr config for midori
  om-gta02.conf: correct fbreader spezific config variables
  om-gta0{1, 2}.conf task-shr-minimal: remove apm from machine features and=
 ad
  python-epsilon: Add new SRC_URI
  gpe-sketchbook: add gpe-icons to rdepends
  shr.conf: blacklist atd, because it's replaced by atd-over-fso

Tom (3):
  libphone-ui-shr's recipe now includes only relevant module files
  ILLUME_CONFIG is now also set by a variable
  added SHR specific choices for default illume theme and config

Tom Hacohen (1):
  Updated xboard's recipe and patch to the newest version Removed old recip=
e a

Xerxes R=E5nby (2):
  llvm2.6: Added BX_to_BLX.patch inorder to stabilize LLVM JIT on ARM llvm2=
.7:
  checksum.ini: add sums for cacao-0.99.4.tar.gz used by openjdk-6-cacao fr=
om

Bugs fixed:

bug_id resolution        short_desc
3470 FIXED       bitbake doesn't work when using a x86_64 kernel with
a 32bit userspace
1182 FIXED       Kernel modules are not stripped before they are packaged
5335 FIXED       Initial support for the Samsung Omnia (SGH-i900)

Bugs opened:

bug_id resolution        short_desc


