Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1O8wRS-0002Rj-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 16:16:17 +0200
Received: by wwb18 with SMTP id 18so1620686wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=w65P0proJu5NwOkAGEQYqhR2AkYQJ3gattmGY3FEqcs=;
	b=wM7tKMbI2MCYCZNlDWalTeOpwmWBVBWIPdIFWmahXrQFHz0dTxojAZXWeJx1v7zeW4
	9rdzIgFp2LTodnPSHkZaXMDdyyXeX1uAqjfJItzHGupswwjNLrRmRH7sjbxTIBB1VrX5
	z6WT/C0aumWuVWIAbsLiqyC1Bq8IBCIfnMhq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=xscjRvc1gjBkdrHWfJxtz7W0V0Af/JbgmrkHuNnh67dar3vC937KrYC1dUCYNppZHG
	WxXSsLzxXmJjRTHxHbtsOX2g6qLIlXzLgNRnouWxJD3Vo0Qx0RvCWYrFvql6SXff6U8N
	hlkCdWBc4KdNdd8JHY9VsRLPsjdnrnr85HI1Q=
MIME-Version: 1.0
Received: by 10.216.85.2 with SMTP id t2mr8476181wee.220.1272895946769; Mon, 
	03 May 2010 07:12:26 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 3 May 2010 07:12:26 -0700 (PDT)
Date: Mon, 3 May 2010 10:12:26 -0400
Message-ID: <p2xf96d234e1005030712waef7544brf77338768b7f3864@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-04-26 to 2010-05-03
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
X-List-Received-Date: Mon, 03 May 2010 14:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-04-26 to 2010-05-03

Adrian-Ken Rueegsegger (2):
  tzcode: update tzdata to latest version (2010i).
  tzdata: update to latest version (2010i).

Antonio Ospite (1):
  image.bbclass: create /etc/device_table from IMAGE_DEVICE_TABLES

Chris Larson (1):
  package_ipk: fix a missing paren which caused failures attempting to toke=
niz

Christian R=FCb (1):
  qgpslog: update to 0.2.1

Denis 'GNUtoo' Carikli (2):
  freetype 2.3.11: add new version
  illume-image: fix compilation and desktop icons issue

Denys Dmytriyenko (4):
  libgles-omap3: add dm3730-am3715-evm to the list of supported machines
  ussp-push: add OBEX object pusher app
  external-toolchain-csl: remove unnecessary global RPROVIDES
  libgles-omap3: fix 3 build issues with external CSL toolchain

Enrico Scholz (1):
  autotools.bbclass: swapped calls of intltoolize + autoreconf

Eric BENARD (2):
  zlib: convert to BBCLASSEXTEND and add version 1.2.5
  kernel.class : fix for recent kernel on x86

Klaus Kurzmann (3):
  task-shr-feed: add dbus-daemon-proxy
  frameworkd_git.bb: bump rev for some opimd fixes
  opimd-utils_git.bb: bump rev

Koen Kooi (24):
  matrix-gui: add new recipe and initscript, from arago overlay
  angstrom-feed-configs: add sdk feed
  linux-omap-psp 2.6.32: increase dmesg buffer for beagleboard
  vlc: add 1.0.6
  alsa-lib: add 1.0.23
  gst-opencv: add git version
  linux.inc: add angstrom-only hack for angstrom-only toolchain issue
  linux-omap-psp 2.6.32: switch back to 'userspace' governor on beagleboard=
 om
  u-boot git: update beagleboard patchset to match http://gitorious.org/bea=
gle
  linux-omap-psp 2.6.32: update patchset to fix mpurate passing and scary u=
dev
  matrix-gui: bump SRCREV to 21 for setopp fixes
  fennec hg: update SRCREVs to 1.1b2
  ti-eula-unpack: unset DISPLAY to stop upsetting IJ console mode
  firefox.inc: add curl to DEPENDS, needed for crash reporter
  mythtv 0.22+fixes: bump SRCREV to head of .22 fixes branch
  overo-writeprom: rename to omap3-writeprom and make it work on both overo=
 an
  libgles-omap3: packages WSEGL drivers seperately to kill X11 runtime dep =
for
  memtester: add 4.1.3
  linux-omap-psp 2.6.32: update to latest PSP git, rediff patches
  u-boot git: update beagleboard patchset
  omap3: bump MACHINE_KERNEL_PR
  lzo2: add 2.03
  libmms: add 0.5
  i2c-tools: bump PR

Maksym Parkachov (1):
  avrdude: add 5.10

Martin Jansa (53):
  frameworkd: bump SRCREV for fixed "oneshot" vibration.
  xf86-video-glamo: add patch for modesetting
  efreet: update FILES efreet_desktop_cache_create was moved to libdir in 4=
808
  freesmartphone: bump SRCREV for reliable pppd with fsogsmd
  freesmartphone: bump SRCREV a bit more for fsotdld@openmoko_gta config
  Revert "vala.bbclass and assorted recipes: create own task for installing=
 .v
  libgee: add empty do_stage() for do_stage_append() from vala.bbclass (aft=
er
  libgee: move back to autotools_stage inherit as ie gee.h wasn't staged no=
w
  fsodeviced: add short preinst work-arround
  linux-openmoko-2.6.32: upgrade to 2.6.32.12, add latest gdrm patches
  ffalarms: drop do_stage() as vala.bbclass was converted to new staging
  illume-keyboards-shr: add alpha keyboard
  gitignore: ignore *.pyc in lib/oe
  shr-launcher: bump SRCREV and update do_install for added .edj file
  shr-e-gadgets: bump SRCREV, fix packaging
  pyphonelog: bump SRCREV
  frameworkd: bump SRCREV
  freesmartphone: bump SRCREV for latest fsogsmd: modem_ti_calypso tweaks
  fsogsmd: add fsogsmd.conf files to CONFFILES
  freesmartphone: bump SRCREV for more calypso fixes
  frameworkd: bump SRCREV for opimd improvements
  libframeworkd-glib: bump SRCREV for DeviceStatus signals
  dillo2: enable experimental ssl
  spojegui: add recipe for app searching public transport connections in Cz=
ech
  task-shr-feed: add spojegui app
  checksums.ini: remove all entries, all were moved to recipes
  freesmartphone: bump SRCREV for cornucopia bugfix
  EFL: bump SRCREV
  mesa-dri: add 7.8.1
  shr-settings: add elementary.sh
  shr: add shr-version recipe and drop its generation from ROOTFS_POSTPROCE=
SS_
  shr-image: drop all tweaks
  openvpn: add recipe for 2.1.0
  image.bbclass: install_linguas don't install empty list
  busybox: add patch for installing run-parts to /usr/bin/ instead of /bin
  shr-e-gadgets: bump SRCREV
  EFL: bump SRCREV a bit more for focus fix
  shr-e-gadgets: bump SRCREV a bit more
  omnewrotate: bump SRCREV for 0.5.8 version
  freesmartphone: create python-helpers.inc, with shared variables and SRCR=
EV
  cornucopia: move SRCREV to cornucopia.inc and update all recipes using th=
at
  freesmartphone: bump SRCREVs a bit for fixed ppp
  shr-settings: bump SRCREV
  frameworkd-config-shr: don't install big ogsmd files as fsogsmd is not us=
ing
  xserver-common: add SHR patches and RCONFLICTS for xserver-kdrive-common
  xserver-nodm-init: rename old as 1.0, add version compatible with xserver=
-co
  preferred-shr-versions: add preferred version for xserver-common and xser=
ver
  task-x11: add variable for common files provider selection
  mplayer_git: bump SRCREV
  fsoraw: add recipe for fsoraw rewritten in vala
  EFL: bump SRCREV (for fixed quickpanel)
  python-elementary: temporary keep older SRCREV
  initscripts-shr: add procps to RDEPENDS as killproc depends on ps -e

Michael 'Mickey' Lauer (5):
  vala-[native]: update to 0.8.0.95
  vala / freesmartphone: vala now also looks in the target directory for va=
pi
  vala: remove 0.7 versions as they are no longer supported in OE
  dbus-daemon-proxy: new recipe; dbus-forwarder
  task-cli-tools: add dbus-daemon-proxy

Michael Pilgermann (2):
  pisi: upgrade from 0.5 to 0.5.1, remove old
  pisi: Upgrade from 0.5.1 to 0.5.2 (show stopper bug fix)

Robert Schuster (3):
  llvm.inc: Accomodate to changes made to cmake.bbclass which broke the LLV=
M b
  llvm.inc: Added path for nm. llvm2.7 2.6+svnr20091007: Removed prerelease=
 ve
  llvm2.7 2.6+svnr20091007: Removed.

Roger Monk (7):
  angstrom-preferred-versions: Add missing ti packages to preferred list
  ti-xdais_6.24: Fix typo in checkum label
  ti-xdctools_3.16.00.18: Fix typo in PV
  ti-linuxutils: Add recipe for latest version [v.2.25.02.08]
  ti-codec-engine: Add Engineering Release [v.2.25.02.10_eng]
  ti-xdais: Add Engineering Release [v.6.25.02.10_eng]
  angstrom-preferred-versions: Add preferred versions for latest TI Codec E=
ngi

Roman I Khimov (2):
  nano: unify versions with .inc file
  squidguard: fix CVE-2009-3700 and CVE-2009-3826

Scott Garman (1):
  nano: Add version 2.2.4

Sebastian Krzyszkowiak (1):
  fsodeviced: make fsodeviced.conf files CONFFILES

Stefan Schmidt (1):
  llvm2.7-native: Add perl-native to the DEPENDS

Steve Sakoman (1):
  overo-writeprom: add utility to write expansion board config eeproms

Thomas Zimmermann (2):
  pjproject: add version 1.5.5
  dbus-c++: dev.openwengo.org is gone

Tom Rini (8):
  i2c-tools: Don't use _ in regex, use #
  linux-libc-headers: Delete include/scsi/scsi.h
  fso-specs: Don't use PACKAGE_ARCH=3Dall due to pkgconfig files.
  libdmx: Add fso-specs to DEPENDS
  tune-ppc603e: Drop -mhard-float
  Revert "libdmx: Add fso-specs to DEPENDS"
  vala.bbclass:  Add vala-native to virtclass-native DEPENDS.
  minimal: Quoting fixups, always set virtual/psplash to what we would want=
.

sledz (1):
  sysvinit: we don't like volatile cache at hipox machine


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-04-26 to 2010-05-03



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


