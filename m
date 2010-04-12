Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1O1Mh0-00029F-9S
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 18:40:59 +0200
Received: by pwj5 with SMTP id 5so4160232pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=G4hjU8CWkAr3oxextzXyJE6e19JPeLOok/sw3k2nN14=;
	b=CTfvlnZZuCGrn2NMuewlTIFs0jJoWptwhTlXxkXqbEUVCsnSOEaJrUy3NH/raNUN2J
	mFpz2bms3C/x0x8tVcdtoNg8RsPkBheJagoCVPfVAG84C4eFvvHm64DRmb6Z0wDzrT12
	MC7QJvjAqpBDbRH7qn0rOEzmNHAWcBObb1Xg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VWVoSJuTWBYsY4pgGXH4NTqhjL8LLviINSExgAk990g8RRgtIY1NBc/PiaykPuxd/r
	JzvGx9wEmGnpFHWax+iuwLfTjRe0KIBvkSlqRCeusA3ZtY2/VzQbf+fDhKcbYMLnM9+k
	c1Ee4PC7DEHQeEURSWBZd1Y3mBJ3BZstiQGRs=
MIME-Version: 1.0
Received: by 10.231.36.134 with HTTP; Mon, 12 Apr 2010 09:37:30 -0700 (PDT)
Date: Mon, 12 Apr 2010 12:37:30 -0400
Received: by 10.141.213.23 with SMTP id p23mr3731535rvq.159.1271090250865; 
	Mon, 12 Apr 2010 09:37:30 -0700 (PDT)
Message-ID: <u2xf96d234e1004120937sf30eb9e4q2e7e9a4a6e1db484@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for org.openembedded.dev, 2010-04-05 to 	2010-04-12
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
X-List-Received-Date: Mon, 12 Apr 2010 16:40:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-04-05 to 2010-04-12

Andrea Adami (5):
  linux-kexecboot: remove bogus omap3 refs in 2.6.33+2.6.34-rc3 recipe
  linux-kexecboot: try to standardize Zaurus defconfigs for 2.6.34. WIP.
  linux-kexecboot: add forgotten loglevel=3D3 to collie and poodle cmdline.
  linux-kexecboot: fix/refine defconfigs of collie and tosa for 2.6.34
  zaurus-installer: remove trailing tabs

Antonio Ospite (2):
  tzcode-native_2010f: Update tzdata SRC_URI and checksum
  tzdata: move tzdata_2010g.bb to tzdata_2010h.bb

Chris Larson (4):
  Add ac_cv_sys_symbol_underscore to site/ for gnupg
  clean.bbclass: add pstage bits, for use with srctree
  Using NotHandled/Handled in event handlers is deprecated
  task-base: change the 'set' logic to work a bit better

Denis 'GNUtoo' Carikli (3):
  xf86-video-msm : bump git version(fixes gtk issue),rebased patch,also mad=
e i
  htcdream.conf: added mesa-dri as PREFERRED_PROVIDER for virtual/libgl und=
er
  mesa-dri 7.8: disable egl for htcdream(this recipe is machine arch)

Klaus Kurzmann (2):
  e-wm-config-illume2-shr_git.bb: bump SRCREV
  shr-e-gadgets_git.bb: bump SRCREV

Koen Kooi (44):
  cheese: add 2.30.0
  gnome-panel 2.30: add missing dep on libcanberra
  gnome-control-center: drop eel dependency
  nautilus 2.30: drop eel dependency
  gnome-mount 0.8: clean up recipe
  gftp 2.0.19: fix src uri name
  abiword: add 2.8.2
  goffic: add 0.8.1
  libsigc++: add dep on mm-common
  angstrom-task-gnome: add gnome-mount
  abiword: add 2.8.3
  nautilus-cd-burner: add 2.25.3 + patches to remove runtime dep on 'eject'=
 an
  gphoto2: add 2.4.8 libgphoto2: add 2.4.8
  metacity: remove def_pref from 2.30
  modemmanager: add 0.3
  angstrom-task-gnome: add modemmanager
  gnome-utils: add 2.30.0
  gnome-terminal: add 2.30.0
  gnome-bluetooth: add 2.30.0
  nm-applet: enable BT PAN
  gnome-bluetooth git: lower default pref for angstrom
  pidgin: enable audio and vv when available
  gconf-editor: add 2.30.0
  policykit: fix pam auth
  gnumeric: add 1.10.1
  gnome-power-manager: add 2.30.0
  cups 1.4.x: cleanups
  gtk-engines: add 2.20.0
  murrine: add 0.90.3
  elementary-icon-theme: add 2.2 from openpandora OE overlay
  elementary-gtk-theme: add 1.0
  murrine: add git version
  gtk-engine-aurora: add 1.5.1
  elementary-gtk-theme: also depend on aurora
  elementary-icon-theme: update to 2.3
  gnuplot: add 4.4.0
  abiword 2.8.3: fix regression that caused the collab plugin being dropped=
 fr
  totem-pl-parser: add 2.30.0, convert to new style staging
  totem: add 2.30.0
  packagekit 0.5.6: add recipe from poky
  xf86-input-tslib: install udev rule to create multiple /dev/input/touchsc=
ree
  packagekit 0.5.6: use IPKG_VARIANT
  gnome-packagekit: add 2.8.2 from poky
  gnome-packagekit: polkit->policykit

Marcin Juszkiewicz (2):
  vim: updated to upstream patch 411
  giflib: added native, moved to new staging, improved

Marco Cavallini (2):
  mh355/linux-2.6.28.10-at91-mh.patch: updated touchscreen options
  recipes/linux/linux_2.6.28.bb: bumped DEFAULT_PREFERENCE_mh355

Martin Jansa (29):
  linux-openmoko-2.6.32: move to 2.6.32.11
  xorg-sgml-doctools: add version 1.4
  util-macros: add version 1.7.0
  xf86-video-fbdev: add version 0.4.2
  preferred-xorg-versions-live: updated versions
  e17/enna: drop empty directory, enna is now moved to recipes/enna
  recipes: move SRCREVs also to git recipes
  serial-forward: rename recipe to show that it's git based
  shr-e-gadgets: bump SRCREV
  e-wm-theme-illume-gry: bump SRCREV
  freesmartphone: move SRCREVs to recipes
  opimd-utils: update PV to correspond with SRCREV
  bluez4: add udev rules to FILES_${PN}
  linux-openmoko-2.6.32: enable MMC_S3C in defconfig
  connman_0.51: add missing checksums
  illume-keyboards-shr: bump SRCREV for fixed persian layout
  msmcommd: bump SRCREV, needed for pushed FSO_CORNUCOPIA_SRCREV (fsogsmd)
  libxml2_2.7.3: move checksum from checksums.ini
  illume-keyboards-shr: SRCREV bump, more fixes to persian keyboard
  packagekit_0.5.6: add PE, include stdio.h before opkg.h to make newer gcc=
 ha
  packagekit: respect IPKG_VARIANT in all versions
  pyphonelog: bump SRCREV
  e-wm-theme-illume-gry: bump SRCREV
  intone: bump SRCREV for segmentation fault fix after latest EFL bump
  linux-openmoko-2.6.32: add patches from qtmoko, move defconfig to kernel =
tre
  obsolete: add include files to make recipes parse-able
  openh323_1.13.5.4: add missing checksum
  liberf_0.8.6: use same name SRC_URI param as those 2 URLs provide the sam=
e f
  uclibc: add checksums to recipes

Michael 'Mickey' Lauer (13):
  linux-leviathan: bump to latest version; enable mac80211 and cfg80211
  MAINTAINERS: fix my entry
  linux-leviathan: bump; remove patch that has been applied upstream
  conf/machine/htcdream.conf: add wifi to MACHINE_FEATURES and add required=
 ke
  fso2-demo-image: install iptables and some alsa utils
  firmware-ti-wl1251: new recipe
  libfso-glib: bump as per spec bump
  fso-specs: bump
  vala-dbus-binding-tool: bump and promote git version until we're stabiliz=
ing
  vala[-native]: add 0.8.0.69
  Revert "vala[-native]: add 0.8.0.69"
  vala[-native]: add 0.8.0.69
  zhone2: install init script

Michael Lippautz (6):
  python-lxml: Fix recipe.
  omap3-mkcard.sh: Adding sleep and umounts to fix race cond.
  libxslt: Convert old version to new staging
  libxslt: Inherit from binconfig to add support for xslt-config
  zbar: Convert to new staging
  smpeg: Installing smpeg.m4 inoto staging aclocal

Mike Westerhof (6):
  SlugOS: initscripts-slugos - add dependency on update-rc.d-native
  SlugOS: preferred-slugos-versions.inc - fix kernel SRCREV selection This =
mak
  SlugOS: preferred-slugos-versions.inc - add autoconf-2.61 This fixes buil=
d f
  SlugOS: preferred-slugos-versions.inc - lock down older version of gtk+ A=
voi
  SlugOS: preferred-slugos-versions.inc - fix missing closing quote
  SlugOS: preferred-slugos-versions.inc - older atk required due to autocon=
f

Paul Menzel (8):
  xf86-input-evdev: Add evdev 2.4.0 [1].
  libsvdrp: Add libsvdrp hg.
  libplayer: Add `virtual/libx11` and `libxcb` to `DEPENDS`.
  libplayer: Use `${PN}` instead of `libplayer`.
  libplayer: Update `SRCREV` to 4fb30e64db79 [1].
  libvalhalla: Correct `PV` for `libvalhalla_hg.bb`.
  enna: Move to own recipe folder and update to new Enna hg repository.
  =C5ngstr=F6m feed builder: Add Enna media center application.

Roman I Khimov (11):
  poptop: fix broken sed script
  ragel-native: new recipe
  util-linux-ng: ensure that LDFLAGS are clean on native build
  gd: build with freetype support
  sarg: new recipe
  beep: fix building and packaging
  cluster-resource-agents: fix headers define extraction
  pacemaker: fix headers define extraction and uclibc build
  tzdata/tzcode: leave only latest version
  preferred-om-2008-versions.inc: use latest tzcode-native/tzdata
  perl 5.10.1: update perl-rdepends

Sebastian Spaeth (4):
  connman: bump v0.46 to v0.51
  connman: readd v.046
  sane-sercrevs: bump fso-cornucopia to newer

Stefan Schmidt (4):
  imote2.conf: Change flash size to 30 Mbyte
  lowpan-tools_git.bb: Bump SRCREV
  angstrom-2008-preferred-versions.inc: Bump python version to 2.6.4
  linux_2.6.33.bb: Add iMote2 as supported board.

Steve Sakoman (10):
  evince: add 2.30.0
  gcalctool: add 5.30.0
  gftp: add 2.0.19
  epiphany-extensions: add 2.30.0
  gnome-backgrounds: add 2.30.0
  gnome-games: add 2.30.0
  gnome-games-extra-data: add 2.30.0
  gnome-mount: add 0.8
  gnome-nettool: add 2.30.0
  gvfs: add 1.6.0

Tarjei Knapstad (1):
  cups: add 1.4.3

Thomas Zimmermann (1):
  omnewrotate: make recipe valid

Vladimir Sorokin (2):
  binutils: Add x86_64_i386_biarch patch for 2.20 & 2.20.1
  insane.bbclass: add x86_64 architecture for linux-uclibc

Xerxes R=E5nby (1):
  classes/cmake.bbclass: make cmake continue if the build dir already exist


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-04-05 to 2010-04-12


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
4989 FIXED       Install aclocal file for smpeg
5082 FIXED       fix QA error in gdbm package

Bugs opened:
bug_id resolution        short_desc


