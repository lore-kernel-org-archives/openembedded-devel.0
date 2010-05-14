Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OCuyp-0002u5-By
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 15:31:13 +0200
Received: by wwb39 with SMTP id 39so18471wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=fanL/Mm/LNIxKfyCEW3GBWANghE58I0r1BnfaOEm4+M=;
	b=gAPUtxQc7zlcYgK93498yQwpmk8o6DvzcGrH3zol5H3jwJ65ihoVrkXa+2bOT3vlfa
	iBXExPM/zlrBxsMUmhQ69ryfFy63ty9IrSeWi4V58RRHdwhN6Qs91t+Ja9QIoB+hS0Zp
	TfqE0CavlPp/R857i2OBwl3j7Sm3DK/LRiWsU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=HU7l4skHKz24WH7fKq1MUlmVrOoJ+n1ddFUkcyMke1C76qSpNHmj1f3E23wmrskgx4
	KouD5qGH6GpGQ+NC93l0LXpSwQsK9+xMf+eHnUM7luhYa2TwytnWvcCv1zr3k5zgB/SV
	CSGFDxoAbRD1/vPKuMtIYsuz9ZJ2Bcw/ZsGtg=
MIME-Version: 1.0
Received: by 10.216.88.4 with SMTP id z4mr895746wee.107.1273843630831; Fri, 14 
	May 2010 06:27:10 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Fri, 14 May 2010 06:27:10 -0700 (PDT)
Date: Fri, 14 May 2010 09:27:10 -0400
Message-ID: <AANLkTimZCvoT0YctLL-viAhr9LFVObbASmdqSxhiY0WD@mail.gmail.com>
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
Subject: OE weekly changelog 2010-05-03 to 2010-05-10
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
X-List-Received-Date: Fri, 14 May 2010 13:31:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-05-03 to 2010-05-10

Andrea Adami (2):
  opie-init: uncomment c7x0 specific stuff
  linux-kexecboot: further editings for Zaurus defconfigs.

Cliff Brake (2):
  acl: clear TOPDIR env variable in recipe
  attr: clear TOPDIR env variable in recipe

Denys Dmytriyenko (8):
  matrix-gui: numerous updates and fixes (from Arago)
  matrix-tui: add the Matrix TUI (Text UI) launcher app (from Arago)
  am-sysinfo: add AM SysInfo set, currently mem_util only (from Arago)
  am-benchmarks: add ARM Benchmarks dhry/whet-stone, linpack (from Arago)
  matrix-gui: bump the rev for latest fixes, sans external browser binary
  matrix-tui: bump the rev for latest fixes
  am-benchmarks: bump the rev for latest fixes
  ti: disable "eng" non-public versions for non-Angstrom users

Eric BENARD (2):
  klibc: add 1.5.17
  crda: add version 1.1.1

Eric Benard (3):
  mplayer_svn : fix compilation problem
  python-m2crypto: add native
  kernel.bbclass: fix staging of .config

Jacob Helwig (1):
  usermanual: Add missing opening <varlistentry> tag in the user manual.

Jesse Gilles (1):
  python 2.6: add ssl to python-io

Joshua Lock (9):
  packaged-staging: Fix mkdir to actually create destination
  bitbake.conf/base.bbclass: Rename the staging directory to sysroots and the
  packaged-staging: enhancements from Poky for fetching and relocatability
  relocatable: Class to post-process packages for relocatability
  gettext enhancements: Make it easier to use the right gettext
  docs: Fix references to do_staging now that we have changed to sysroot
  packaged-staging.bbclass: Remove hardcoded paths in binconfig files for targ
  relocatable.bbclass: Handle files which don't have read/write permissions
  autotools.bbclass: merge recent changes from Poky

Khem Raj (8):
  gdb-7.1: Add recipes for version 7.1
  eglibc_svn.bb: Move SRCREV to latest trunk.
  eglibc: Move away from legacy staging.
  gdb-cross_7.1.bb: Convert to new staging.
  gcc-4.5.0: Move away from legacy staging.
  libtool-native_2.2.6b.bb: Install remaining missing directories.
  libiconv: inherit gettext
  unifdef-native_2.6.18+git.bb: Fix new style staging.

Klaus Kurzmann (5):
  frameworkd_git.bb: bump rev to get more opimd fixes
  fso-specs_git.bb: bump rev to get TimeReport signal
  cornucopia.inc: bump rev to get SMS reference id fix in fsogsmd
  libfso-glib_git.bb: bump PR to trigger rebuild for updated fso-specs
  fsoinitd_git.bb: new recipe

Koen Kooi (39):
  angstrom feed configs: disable sdk feed by default
  u-boot git: update beagleboard patches, rebase onto denx git
  linux-omap-psp 2.6.32: remove unused v4l2 patches
  linux-omap-psp 2.6.32: sync patches with validation kernel
  lxsession: add 0.4.4
  lxde-common: add 0.5.0
  lxmenu-data: add 0.1.1
  menu-cache: add 0.3.2
  lxpanel: add 0.5.5
  linux-omap-psp 26.32: sync with beagleboard validation kernel again
  matrix-gui: update to latest svn
  linux-omap-psp 2.6.32: refresh touchbook defconfig, add disabled patch to en
  geck-mediaplaer svn: bump SRCREV
  firefox: add 3.6.3
  xkeyboard-config: convert to new style staging
  xorg-xserver-common: make xvfb depend on xkeyboard-config
  lighttpd: add missing dep on zlip
  efl: bump SRCREV to get fixes for the eina_stringshare typos
  e-wm-config-angstrom: remove exebuf and msgbus_lang
  perl-native: attempt to repair staging, bump PR
  aspell: convert to new style staging
  angstrom: add TARGET_SYS to /etc/angstrom-version
  mesa-xlib: add 7.8
  qt4-tools-sdk: symlink tools back to their original names to make e.g. eclip
  libtool-native 2.2.6b: convert to new style staging
  unifdef-native: convert to new style staging
  pax-utils: convert to new style staging and BBCLASSEXTEND
  stagemanager-native: convert to new style staging
  unifdef-native: one NATIVE_INSTALL_WORKS is enough
  gst-plugins: build some more plugins (e.g. mms, aacparse, faad)
  angstrom-uboot-scripts: add some more
  linux-omap-psp 2.6.32: move to 3.00.01.06
  git: add ssh to recommends
  perl-native: fix do_install a bit more
  angstrom feed sorted: add imote2 support
  perl: change 'cp' to 'ln' to fix perl build issues, thanks to Tom Rini for t
  omap3.inc: bump MACHINE_KERNEL_PR
  libsdl-image: convert to new style staging
  task-beagleboard-demo: remove e-wm-config-angstrom-touchscreen

Martin Jansa (21):
  base-files: adjust SHR /etc/profile
  klibc: cleanup all version
  klibc: add 1.5.18
  shr-lite-image: don't set IMAGE_LINGUAS here
  linux: add git recipe for vanilla kernel
  linux-kexecboot: add git recipe for vanilla kernel
  task-shr: replace mokonnect with iliwi
  evopedia: use ventura instead of midory
  iliwi: remove do_stage() as vala.bbclass doesn't use it anymore
  EFL: bump again a bit, fixed python-elementary and improved quickpanel
  base-files: adjust SHR profile a bit more
  omnewrotate: update Xsession.d script for xserver-common
  xserver-common_1.33: add xserver-system include for possible modifications o
  xserver-nodm-init: fix RDEPENDS, add redirect to /tmp/x.log
  linux: spitz defconfig, readd CONFIG_PM
  podboy: depend on gst-plugin-mad only for not enterprise distro
  starling: depend on gst-plugin-mad only for not enterprise distro
  gdb: disable-lto as suggested by zecke on #oe
  pisi: upgrade to 0.5.3
  shr-settings: adjust Categories in .desktop file because of changed Efreet f
  navit: bump SRCREV for improved bookmarks support

Michael 'Mickey' Lauer (2):
  iw: add 0.9.19
  vala: 0.8.0.95-e7a7 -> 0.8.0.128-1150

Michael Lippautz (6):
  libpcre: Remove old staging
  libzip: convert to new style staging
  libnxml: convert to new style staging
  libexif: Switched to .inc file based recipe.
  libexif: Switched to .inc file based recipe.

Mike Westerhof (1):
  SlugOS: initscripts-slugos - "unset" CONFFILES in order to avoid an opkg pro

Philip Balister (1):
  boost : Remove DEFAULT_PREFERENCE = "-1" from all versions.

Richard Purdie (34):
  base.bbclass: Remove pointless data expand call (from Poky)
  base.bbclass: Stage etc directory for native packages and add a use_do_insta
  glibc: Remove now unneeded legacy staging function (from Poky)
  glibc-initial: Convert from legacy staging model (from Poky)
  cross.bbclass: Move target_ variable definitions from gcc recipes to main cl
  gcc-pacpake-cross.inc: Clean up do_install function massively (from Poky)
  gcc-cross: Convert to remove legacy staging functions
  cross.bbclass: Add special sysroot_stage_all function for cross packages and
  binutils-cross: Convert to non-legacy staging
  binutils: Convert to non-legacy staging
  gdb: Convert to new staging mode (from Poky)
  module-init-tools: Convert from legacy staging function (from Poky)
  gconf.bbclass: Sync with Poky
  gcc: Simplfy some require statements
  gcc: Move -native dependencies into the base gcc version configuration file
  gcc: Create and use EXTRA_OECONF_INITIAL and EXTRA_OECONF_INTERMEDIATE varia
  glibc-2.3.6: Drop strange staging addition - the patch is already applied in
  gcc-cross-sdk: Use NATIVEDEPS and drop unneeded DEPENDS
  gcc-cross: Use NATIVEDEPS
  gcc-configure-cross.inc: The install function is used, stage is no longer re
  cross/staging.bbclass: Make sure .la files get mangled and add extra manglin
  aspell: This package requires gettext so inherit the class
  enchant: Add missing glib-2.0 dependency
  flex: This package requires gettext so inherit the class
  util-linux-ng: Add missing gettext dependency
  classes/recipes: Catch populate_staging references that were missed in the f
  libtool-native: Add missing directory creation
  stagemanager-native: Sync with Poky to fix builds
  sanity.bbclass: Fix to work with old versions of bitbake for now
  unifdef-naitve: Fix from Poky
  util-linux-ng: Add gettext-native dependency explicitly due to override usag
  native.bbclass: Clear PACKAGES variable when using BBCLASSEXTEND (from poky)
  pax-utils-native: Make sure prefix variable is correct during do_install

Roger Monk (1):
  ti-cgt6x: Add version 6.1.14

Roman I Khimov (4):
  openssl 1.0.0: fix patches with config-strings
  net-snmp: fix static libs packaging
  net-snmp: convert to new staging
  pacemaker: completely disable stack protector for uclibc builds

Sebastian Spaeth (1):
  omnewrotate: reove superfluous patch

Stefan Schmidt (3):
  matrix-gui_svn.bb: Fix parsing of the recipe
  ibrdtn: Add latest stable version.
  ibrdtn: Add development versions with DP = -1

Steffen Sledz (4):
  rsyslog: recipe cleanup
  rsyslog: new version 5.5.4
  linux-libc-headers: recipe for 2.6.24 added
  linux-libc-headers_2.6.24: legacy staging removed

Tom Rini (3):
  qemu.inc: Set virtual/xserver not xserver.
  perl-native: Switch away from legacy staging, bump PR.
  cross.bbclass: In sysroot_stage_all, only process src dirs if they exist.

sledz (2):
  oxnas-boot-tools: new recipe
  u-boot_2009.03: additional image processing for hipox machine


=====================================================
OE weekly changelog for holger/staging-branch, 2010-05-03 to 2010-05-10


=====================================================
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


