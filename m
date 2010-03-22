Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Ntfze-0008GS-3I
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:40:34 +0100
Received: by iwn14 with SMTP id 14so4151166iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/PmKJfKPZnl0hL/tQ3Tcj1ut8bachHAWhbvwHHDK+QA=;
	b=fzW9P34NVyIw3ebnpHoEFq1u9PLgg4BjUITfBhFqJIqcBINRaJcqc1yteR3Nb+KmxL
	IkNbwqu06FiFYg4CKQyp+dE5LFWaQu5VNZoizXARkHK9mEe0EtODdHSJHLVxCUDLCDqA
	ic2wO3fX4Kt8AoqsC62isUTkIl+5crd8qZ8Tg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=r4RRjCh+aLuOoPqwwoAMIpGpu4B1fZZ3brStqDGf0kKAfUDUCZ7pujdVE3vnRW/2fV
	19zIVCmAhOehq3FJnYYaUmoOojW/uRWKusiiVk5pS32Wa84MUM9l2rg/DD4/50HQ54VX
	oILV3obRRf1/UtYo9H3xTgFkGLOjAmnjXqCqo=
MIME-Version: 1.0
Received: by 10.231.174.142 with SMTP id t14mr1047472ibz.69.1269257837413; 
	Mon, 22 Mar 2010 04:37:17 -0700 (PDT)
Date: Mon, 22 Mar 2010 07:37:17 -0400
Message-ID: <f96d234e1003220437h56c1038gd756c805f4b88f81@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-03-15 to 2010-03-22
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
X-List-Received-Date: Mon, 22 Mar 2010 11:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for org.openembedded.dev, 2010-03-15 to 2010-03-22

Adrian Alonso (7):
  linux.inc: add device tree for xilinx ml507
  xilinx-ml507.conf: new config file for ml507 devboard
  device_table_add-xsa: add dev nodes for system ace
  linux-xilinx-ml507_git: new kernel recipe for xilinx ml507
  defconfig: xilinx ml507 kernel config
  xilinx-bsp.bbclass: add support for xilinx ml507
  tune-ppc440.inc: add base to extra archs

Antonio Ospite (1):
  vala-dbus-binding-tool: fix HOMEPAGE and SRC_URI

Benjamin Schieder (1):
  fltkspacetrader: update to version 1.2-stable

Chris Larson (8):
  collections.inc:  define COLLECTIONS with ?=3D so it can be pulled in by =
a dis
  base.bbclass: Add note about base_path_relative
  Don't inherit siteinfo in base.bbclass
  Initial split of base.bbclass
  base: erk, don't remove do_setscene from EXPORT_FUNCTIONS, silly
  utility-tasks: unbork do_{clean,rebuild,mrproper,distclean}
  slugos: add siteinfo to INHERIT, since it's used for the distro and image=
 na
  src_distribute: simplify do_distribute_sources

Christopher Larson (1):
  base.bbclass: add popen/system convenience functions

David Lanzend=F6rfer (4):
  xserver-kdrive-common: add trout board to Xserver start script (kdrive)
  Added wl1251 firmware
  alsa-scenarii-shr: make alsa-scenarii-shr available for htcdream
  xf86-video-msm: fix build errors

Denys Dmytriyenko (20):
  alsa-lib: update LICENSE to more specific LGPLv2.1
  alsa-utils: update LICENSE to more specific GPLv2
  busybox: update LICENSE to more specific GPLv2
  base-passwd: update LICENSE to more specific GPLv2
  devmem2: update LICENSE to more specific GPLv2
  dosfstools: update LICENSE to more specific GPLv2
  i2c-tools: update LICENSE to more specific GPLv2
  iproute2: update LICENSE to more specific GPLv2
  libusb: update LICENSE to more specific LGPLv2.1
  module-init-tools: update LICENSE to more specific GPLv2
  opkg: update LICENSE to more specific GPLv2
  tslib: update LICENSE to more specific LGPLv2
  usbutils: update LICENSE to more specific GPLv2
  gdb: update LICENSE to specific GPLv2/GPLv3 depending on version
  fbset: update LICENSE to more specific GPLv2
  netbase: update LICENSE to more specific GPLv2
  sysvinit: update LICENSE to more specific GPLv2+ (v2 or later)
  udev: update LICENSE to more specific GPLv2+ (v2 or later)
  opkg: fix global depends on openssl, even in -nogpg/-nocurl

Enrico Scholz (1):
  ffmpeg: moved to native staging

Frans Meulenbroeks (12):
  mythtv: updated SRCREV
  evas-native_svn: removed old_stage code
  ffmpeg: updated to latest svn version, added targetos flag to configure
  orc: created recipe
  schroedinger: upgraded to 1.0.9
  gettext: fixed build with autoconf
  tiff: moved to 4.0.0 beta5
  xorg-proto-common.inc: replaced PN with BPN to avoid native compilation e=
rro
  libunfig: no need for native variant as no-one uses it
  xorg-util: used BPN in xorg-util-common
  libusb: removed unneeded BBCLASSEXTEND=3D"native"
  xfsprogs: added 3.1.1

Geetha T (4):
  omapzoom36x.conf: Machine config for OMAP Zoom36x
  linux-omap-zoomsync_2.6.32: Added support for OMAPZoom36x
  u-boot_git: Added support for OMAPZoom36x
  x-load_git: Added support for OMAPZoom36x

Graeme Gregory (18):
  git-native_1.7.0.2.bb : disable building/installing of python stuff
  linux-omap-zoomsync_2.6.32.bb : update to the latest zoomsync kernel
  linux-omap-zoomsync_2.6.32.bb : reinstate bootlogo
  linux-omap-zoomsync_2.6.32.bb : update defconfig
  alsa-state.bb : add default state file with onboard speakers enabled for =
zoo
  autoconf_2.65.bb : add newest version of autoconf.
  libpcap_1.0.0.bb : apply patch to fix autoconf 2.64+ problems.
  angstrom-2008-preferred-versions.inc : update angstrom to autoconf 2.65
  php* : fix for autoconf 2.64+ problems
  libffi_3.0.8.bb : add fix for autoconf 2.64+
  automake_1.10.3.bb : add latest version of 1.10.X branch.
  angstrom-2008-preferred-versions.inc : move angstrom to the latest 1.10.3=
 am
  linux-omap-zoomsync_2.6.32.bb : update defconfig to enable power manageme=
nt
  linux-omap-zoomsync : make logo more generic now recipe has 2 machines
  x-load_git.bb : fix minor mistake in omapzoom36x version
  contrib/angstrom/sort.sh : add the new omapzoom36x machine

Holger Hans Peter Freyther (42):
  liboop: Disable www, glib, adns, readline and tcl as it is not in the DEP=
END
  lsh: Upgrade to the latest version to address two CVEs
  libwmf: Apply two patches from Fedora to address known issues
  gzip: Upgrade to 1.3.13 to address multiple issues
  streamripper: Upgrade to 1.64.6 to address multiple buffer overflows
  gftp: Address multiple flaws by taking the gentoo patch
  gftp: Add more gentoo patches for gftp 2.0.18
  gftp: Add a mkinstalldir patch as seen in findutils and such
  contrib/qa/oe_audit.py: Add audit script
  grip: Apply FreeBSD patch to fix a flaw with handling CDDB responses
  grip-3.2.0: Add another FreeBSD patch for getting the locale right.
  grip-3.2.0: Add patch from FreeBSD to fix the locale.
  grip-3.2.0: Remove host includes from the Makefile.am and make it compile=
 ag
  libvorbis-1.2.3: Address CVE-2009-3379
  ctorrent-3.3.1: Apply patch from the bugtracker...
  gnupg-1.4.10: Upgrade to the latest gnupg release
  gnupg-1.4.10: Readd the ARM Thumb patch as debian has no thumb support
  expat-native: Upgrade to match latest of expat.
  proftpd: Upgrade to the latest version.
  oe_audit.py: Ignore packets that are not in OE
  oe_audit.py: Upgrade list of packet match
  oe_audit.py: Print only vulnerabe software
  cscope: Upgrade to 15.7a to address multiple flaws
  socat: Upgrade to version 1.7.1.2
  cdrtools-native: Upgrade to the latest version
  nsd: Bump to 3.2.4
  maradns: Upgrade to version 1.4.03
  lighttpd: Upgrade to 1.4.26
  bogofilter: Upgrade to 0.96.6
  wv: Upgrade to 1.2.4 to address multiple flaws
  pulseaudio-0.9.15: Fix a flaw in the tmp directory handling
  curl-sdk: Upgrade to 7.19.7
  dpkg: Upgrade to 1.14.29 to address a flaw in dpkg-source
  ez-ipzpdate.bb: Address flaw in syslog handling
  oe_audit.py: Document a bug which was uncovered on chat
  oe_audit.py: Parse the full output of bitbake -s
  pango-1.24.4: Address flaw in handling Opentype fonts
  php: 5.2.13 and 5.3.2 both have flaws in the handling of xmlrpc
  oe_audit.py: Properly handle used version..
  oeaudit: Move the oeaudit into a new subdirectory and split it up
  oeaudit: Print a friendly message when the bitbake module can not be foun=
d
  oeaudit: Use optparse to specify the parameters

Jesus McCloud (1):
  shr-theme-o2: new recipes for o2 theme

Joshua Lock (1):
  packaged-staging: Fix packagaging of cross packages

Klaus Kurzmann (2):
  sane-srcrevs-fso.inc: bump rev of frameworkd needed to get the fix for co=
nta
  sane-srcrevs-fso.inc: bump rev for libframeworkd-glib

Koen Kooi (41):
  orc: fix packaging, recipe style issues and factor into .inc
  gnome-screensaver: update to 2.28.3
  tiff 3.9.2: fix build breakage
  gnome-screensaver 2.28.3: fix up configure as well now
  angstrom: our preferred tiff version was removed for some reason, move to=
 3.
  faad2: add 2.7
  angstrom: move to wget 1.11.4
  musicbrainz: _append needs a leading space
  linux kernels: linux is GPLv2, so specify that in LICENSE instead of gene=
ric
  sourcepkg.bbclass: put files in ${PN} subdir to avoid cluttering up the d=
ir
  sourcepkg.bbclass: OE's quilt now puts patches in patches/ instead of .pc=
/,
  sourcepkg: replace python with shell to avoid problems with packaged-stag=
ing
  mplayer: bump PR for ffmpeg change
  xf86-input-evtouch: perform sprint cleaning on the recipe to make it buil=
d a
  udev 151: provide compatibility symlink to /lib/udev where some recipes i=
nst
  qt4-x11 4.6.2: apply neon fix from qt/e to here as well
  sourcepkg: split per package arch to catch arch overrides as well
  desktop-file-utils: add 0.16
  udev 151: libdir symlinking logic was reversed, fix that
  udev 151: remove symlinking logic completely:
  pixman git: update to 0.17.10 + ~alexl/alex-scaler2 + overlapped blt
  pixman git: fix typo in patch
  angstrom feed sorter: add smdk6410
  angstrom: pin lighttpd to 1.4.26
  sourcepkg: save lots of space by only making the diff arch specific
  ffmpeg: install more avutil headers, partially fixes the breakages introd=
uce
  gst-ffmpeg: add 0.10.10, needed for newer ffmpeg_svn.bb
  gegl: convert to new-style staging
  orc: add license stub, packaging still needs to change to comply with it
  babl: add git version
  gegl: add git version
  pixman git: remove patches that were applied upstream
  gstreamer: updates
  dbus: add 1.2.22
  angstrom: prefer dbus 1.2.22
  feed-browser: add unstable configs for beagle and hawk
  qt4: make .pc files work with sysroot support
  pixman git: update to 0.17.13, update NEON patches
  pixman git: revert a commit that breaks thumb, reported by Martin Jansa
  abiword: bump PR for wv change
  angstrom: bump version

Marcin Juszkiewicz (9):
  base.bbclass: fix quoting for md5/sha256 checksums checking
  src_distribute_local: fix quoting
  spectrum-fw: added checksums
  procps: added 3.2.8 and dropped older
  netbase: add BUG 2.0 support
  bug20: initial configuration for BUG 2.0 device
  xserver-xorg-conf: provide working setup for BUG 2.0
  check-kernel-updates.sh: really fetch list
  procps: apply patch from Ubuntu to finally get rid of 'Unknown Hz value'

Mario Domenech Goulart (4):
  xinput-calibrator: install xinput_calibrator_get_hal_calibration.sh
  xinput-calibrator: patch to fix miny and maxx printing order for UDEV and=
 HA
  chicken: added recipe for version 4.4.0
  chicken-cross: added recipe for chicken-cross version 4.4.0

Martin Jansa (57):
  navit: bump SRCREV
  elementary: add .debug from tests to -dbg package before including it in =
-te
  mplayer_git: bump SRCREV and remove unsupported option
  phoneui-shr-theme-neo: SRCREV bump
  libxml-parser-perl: PR bump after libexpat soname change
  vala-dbus-binding-tool: PR bump after libexpat soname change
  evas: PR bump after libexpat soname change
  ecore: PR bump after libexpat soname change
  edje: PR bump after libexpat soname change
  fontconfig: PR bump after libexpat soname change
  dbus-glib: PR bump after libexpat soname change
  dbus: PR bump after libexpat soname change
  ventura: bump SRCREV for https handling
  findutils: convert to BBCLASSEXTEND, add 4.5.5 instead of 4.4, use more s=
pec
  sane-srcrevs: move SRCREVs to recipes for openmoko related svn recipes
  shr: bump SRCREVs for SHR projects, fsogsmd, remove frameworkd-config fro=
m a
  fsogsmd: fix SRCREV bump
  socat_1.7.1.2: change SRC_URI, it's available only without /Archive/
  sane-srcrevs-fso: bump all (because I forgot to bump libfso-glib, fos-spe=
cs
  util-macros: convert to BBCLASSEXTEND, add version 1.6.1
  task-shr-feed: add neolight
  makedepend: convert to BBCLASSEXTEND, .inc, move checksums to recipe
  xorg-util: add checksums to recipe
  checksums.ini: remove entries for xorg-util (moved to recipes)
  xorg-drivers: add checksums to recipes
  checksums.ini: remove entries for xorg-drivers (moved to recipes)
  xf86-input-penmount, xf86-video-nv, xf86-video-vmware: newer versions
  xinit, xinput, libxt: add newer versions
  xorg: update preferred-xorg-versions-live
  frameworkd: bump SRCREV for opimd fixes
  vala: add checksum for 0.7.10.5
  om-gta01: fix jffs2 building params, xorg.conf (Thanks to Michael)
  xserver-kdrive-common: simplify cmdline generation for GTA0(1|2), use DPI=
=3D28
  gnuchess: add launcher and icon, thanks to Graziano Sorbaioli
  elmdentica: use SRC_URI from enlightenment repo instead googlecode, bump =
ver
  gst-plugins-base_0.10.28: add updated ivorbis-thumb patch from gst-plugin=
s-b
  librsvg-native: PR bump after libexpat soname change
  preferred-shr-versions.inc: update SHR to autoconf 2.65
  mplayer_git: use same SRC_URI for all, additional patch in glamo repo won=
't
  libxml2: add version 2.7.7
  frameworkd: bump SRCREV
  pixman: add pixman.inc, unify recipes, remove do_stage from few old versi=
ons
  task-shr-feed: add shr-theme-02
  pixman_0.16.2: disable gtk (as done in 0.17.*, to break circular dependen=
cy
  EFL: bump SRCREV
  shr: use binutils 2.20.1
  efl: move epsilon/etk to obsolete, because they're not supported with new=
er
  esmart: drop epsilon dependency, then we won't get thumb
  epdf: disable deprecated etk
  esmart: update SRC_URI as it was moved to OLD
  tasks: remove etk/epsilon from task recipes
  edje-viewer: configure.ac shows that it depends on elementary instead etk=
 no
  ewl: doesn't depend on epsilon now, but still on Ecore_data/Ecore_txt
  fsogsmd: bump SRCREV
  ecore: convert BBCLASSEXTEND
  preferred-shr-version: update automake to 1.11.1
  shr-image: use install_linguas

Martyn Welch (2):
  Add Freescale P2020DS Demo Board
  Add Freescale mpc8641_hpcn demo board

Michael 'Mickey' Lauer (7):
  task-cli-tools: add gdb to task-cli-tools-debug
  task-fso2-compliance: remove unnecessary dependencies
  fso-image.inc: remove unconditional autostart of bluetooth, avahi, connma=
n.
  fsodatad: DEPEND on mobile-broadband-provider info
  vala: 0.7.10.4 -> 0.7.10.5
  fso2-demo-image: new image recipe; FSO-compliant image w/ zhone2 as smart=
pho
  vala-dbus-binding-tool: 0.1.3 -> 0.1.4

Michael Lippautz (4):
  udns: New recipe
  unrar, unrar-native: Bump to version 3.9.9
  lighttpd: Convert to new staging. Recipe cleanup. Signed-off-by: Michael =
Lip
  lighttpd: Add configuration to CONFFILES.

Mike Westerhof (3):
  preferred-slugos-versions.inc: bump up autotools-native, and lock down au=
tot
  apex-nslu2: replace endianness tests to not require CONFIG_SITE. Required=
 si
  inetutils: Copy in config.rpath prior to running configure task (fixes co=
nfi

Nicolas Ferre (1):
  alsa-state: add alsa-state for at91 processors

Paul Eggleton (2):
  opkg: update to include upstream libopkg C++ header fixes
  opie-packagemanager: fix for recent opkg SRCREV bump

Paul Menzel (5):
  libmusicbrainz: Include header to fix build with g++ 4.4.
  liba52: Disable `-prefer-non-pic` to enable `-fPIC`.
  ffmpeg: Convert recipe to use INC_PR.
  ffmpeg: Stage `attributes.h`.
  ffmpeg: Stage `avconfig.h` which is built at compile time.

Richard Purdie (2):
  base.bbclass/bitbake.conf: Fix some string quoting to handle more unusual=
 UR
  spectrum-fw: Use the standard fetcher process (from Poky)

Roman I Khimov (16):
  qemu: fix build with zlib-dev missing on host
  ipsec-tools: convert to INC_PR
  ipsec-tools: add version 0.7.2
  dnsmasq: add version 2.52
  dnsmasq: add status check to init file
  perl: remove versions 5.8.4 and 5.8.7
  squid: move potentially reusable in other versions parts to .inc files
  squid: move config files to /etc/squid
  squid: introduce version 2.7.STABLE8
  squid: add volatiles for log directory
  squid: revamp init
  squid: enable ssl support
  squid: enable null store for non-caching proxies
  squid: build with LDAP authentication support
  cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
  openldap: update version 2.4.17 to 2.4.21

Steffen Sledz (2):
  libunwind: new recipe
  linux-2.6.24: enable ftdi_sio module for hipox machine

Thomas Zimmermann (5):
  qemu: fix build without zlib headers installed on buildhost
  attr: fix MSGFMT and MSGMERGE paths
  Revert "qemu: fix build without zlib headers installed on buildhost"
  acl: fix msgfmt and msgmerge paths like already done for xgettext

Tom 'TAsn' Hacohen (2):
  shr-e-gadgets: new recipe for e17 gadgets
  e-wm-config-illume2-shr: Added shr-e-gadgets to RDEPENDS

Tom Rini (1):
  packaged-staging: Grab the staging lock before we copy and test the stamp=
s s

Ulf Samuelsson (3):
  at91bootstrap-2.13: Build ${AT91BOOTSTRAP_BOARD}
  osb-jscore_svn.bb:  Templates cannot be static
  fbv-1.0:  Build fbv with support for jpeg and bmp

Valentin Longchamp (1):
  Do not generate NEON code for qt-4.6.2 embedded on armv6

Valery Febvre (1):
  NeoLight: new recipe (version 1.4.0 from svn)


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-03-15 to 2010-03-22


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5412 FIXED       glibc-binary-locale-en-us_2.9-r35.3.5_armv5te.ipk missing

Bugs opened:
bug_id resolution        short_desc


