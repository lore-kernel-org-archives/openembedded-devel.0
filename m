Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NHf8u-000618-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 16:04:55 +0100
Received: by ewy24 with SMTP id 24so5570160ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=yPwdaYCFkWJMjJYnAfSLPkOLDBS+AdyQcv8S1tVreRI=;
	b=Yrvw/CCnnmds1ULR1pXxt7DILHDCl9pWa7176J4+WGcDACYkOr3Ws6Fy045SjlJ/UL
	N5fWrfqWshwtFJQDhcVKyemdB9+9t2fON3fWeeMeuP/QBoEHS1XToDGT0NxINgESK/+2
	fCJaT8lZ88/fmTKa4M+hU3KaLtdYS2UDxexLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OkP9VgYZa075IVHMeWIhscVy92By4TAJLuftc0FosmxoC6aZxDU7QY9VvdUuwmPJLL
	6zE8QTvWr4coq0d3Pfetywl5pJRQ8Fj5mzxkVQSwx2zluQMj7tSmsfb+EfvuPOnW9V7Q
	AUW2ADe42mqL0nuI8FnaILQTXxo0TOQbZ1a9Q=
MIME-Version: 1.0
Received: by 10.216.87.209 with SMTP id y59mr2559718wee.21.1260198193088; Mon, 
	07 Dec 2009 07:03:13 -0800 (PST)
Date: Mon, 7 Dec 2009 10:03:11 -0500
Message-ID: <f96d234e0912070703x3ae4cacema6c86df690a755d3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-11-30 to 2009-12-07
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
X-List-Received-Date: Mon, 07 Dec 2009 15:04:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog 2009-11-30 to 2009-12-07

Alan Campbell (1):
  ti-cs1omap3530: add MP3 decode support to OMAP3 DVSDK 3.0 GA DSP codec-combo

Andrea Adami (5):
  gpe-bootsplash_1.15: prevent the make install from stripping the binary.
  gpe-bootsplash_1.15: actually add the no-strip patch...
  gpe-bootsplash: apply no-strip-on-install patch to the older releases.
  kexecboot_git: bump to 456e052144f58d3c1116a38cbb5caa44c070bce8. Bump PR.
  linux-kexecboot_2.6.32: initial commit.

Benjamin Schieder (4):
  fltkhackdiet: update to svn rev 52
  mokoeightball: new recipe and patch
  fltkclock: update srcrev, makes editing a timezone use a more touchscreen su
  fltkcurrency: new recipe, a currency converter

David-John Willis (24):
  MAINTAINERS: Add myself as omap3-pandora machine maintainer.
  omap3-pandora: Update machine config to define versions of x-load/u-boot to
  x-load-omap3pandora: Bump SRCREV to include early start for batt charging.
  u-boot-omap3pandora: Bump GIT SRCREV (USB charge fix)
  tslib: Add config files for the omap3-pandora.
  xf86-input-evdev: Add 2.2.6 and 2.3.0 (2.3.0 disabled for now).
  ttf-freefonts: Add GNU FreeFont (Free UCS Outline Fonts) package.
  zsh: Add recipe for 4.3.10 (latest upstream).
  libpng: Add target and native recipes for 1.2.40 with checksums.
  libsdl: Add 1.2.14 (and native). Note: Does not use libsdl.inc as that has h
  gigolo: Add build and runtime depends on gvfs (without it, the app is not a
  angstrom-2009.X: Bump SDL upto 1.2.14
  devilspie: Add the devilspie daemon - version 0.22.
  xchat 2.8.6: Drop TCL support from build.
  libgksu: Add --disable-gtk-doc to recipe.
  util-macros: Add 1.3.0 native.
  angstrom-2009.X: Add util-macros 1.3.0 as a pref. version.
  xorg-font-common: Update include to deal with newer fonts installed to /usr/
  font-adobe-*dpi: Add 1.0.1 versions of adobe fonts.
  font-util: Add 1.1.1 target and native.
  xorg-font: Add INC_PR to all the Xorg fonts.
  font-alias: Add 1.0.2
  encodings: Add latest Xorg font encodings package 1.0.3.
  xorg-font: Add latest versions of the XOrg font packages.

Denis 'Gnutoo' Carikli (1):
  boost: add version 1.41.0 and modified boost-14x.inc

Florian Boor (1):
  linux-handhelds-2.6: Update cvs recipe to use the patches from 2.6.21-hh20 r

Frans Meulenbroeks (2):
  mythtv 0.22: updated to new staging

Frederik Sdun (1):
  gypsy: split package, fix compile error (remove werror)

Graeme Gregory (4):
  coreutils-native.inc : fix staging of coreutils-native
  cdparanoia_svn.bb : also add configure.in.patch to svn version
  angstrom-2008.1.conf :  update uclibc to latest bugfix release
  openssl-native_0.9.8j.bb : set the noexec bit for stacks

Henning Heinold (5):
  jack: fix packaging and simplify recipe
  cmake.bbclass: support for seperate building directory
  glew: introduce highlevel gl library
  cmake.bbclass: style fix for CMAKE_FIND_ROOT_PATH
  performous: introduce a new cool game for sining caraoke or playing instrume

Klaus Kurzmann (37):
  openssh-5.2p1: add sshd_config for shr distro
  preferred-shr-versions.inc: specifically set an openssh version
  shr.conf: use openssh as DISTRO_SSH_DAEMON
  task-base: bump PR to pick up DISTRO_SSH_DAEMON change in shr.conf
  shr-image.inc: bump PR to pickup DISTRO_SSH_DAEMON change
  shr.conf: add a missing #
  Revert "openssh-5.2p1: add sshd_config for shr distro"
  shr-settings_git.bb: fix typo in RDEPENDS
  fsodeviced_git.bb: remove niceness as it does not use libcanberra anymore
  shr-wizard_git.bb: new recipe
  shr-wizard_git.bb: SRCREV instead of SRCPV
  task-shr-minimal: add shr-wizard
  illume-keyboards-shr_git.bb: new recipe This folds the various illume-keyboa
  aceofpenguins-launcher: bump PR to pickup EFL_SRCREV bump
  comic-reader: bump PR to pickup EFL_SRCREV bump
  enotes: bump PR to pickup EFL_SRCREV bump
  euphony: bump PR to pickup EFL_SRCREV bump
  ffalarms: bump PR to pickup EFL_SRCREV bump
  intone-video: bump PR to pickup EFL_SRCREV bump
  intone: bump PR to pickup EFL_SRCREV bump
  epiano: bump PR to pickup EFL_SRCREV bump
  diversity-radar: bump PR to pickup EFL_SRCREV bump
  enlazar: bump PR to pickup EFL_SRCREV bump
  om-locations: bump PR to pickup EFL_SRCREV bump
  pyefl-sudoku: bump PR to pickup EFL_SRCREV bump
  ompower: bump PR to pickup EFL_SRCREV bump
  libframeworkd-phonegui-efl2: bump PR to pickup EFL_SRCREV bump
  libframeworkd-phonegui-efl: bump PR to pickup EFL_SRCREV bump
  libphone-ui-shr: bump PR to pickup EFL_SRCREV bump
  shr-config: bump PR to pickup EFL_SRCREV bump
  shr-launcher: bump PR to pickup EFL_SRCREV bump
  elmdentica: bump PR to pickup EFL_SRCREV bump
  task-shr-feed: fix illume keyboards
  illume-keyboard-default: new recipe for default illume keyboards as e-wm wil
  e-wm: add patch to not install the illume default keyboards and RRECOMMEND t

Koen Kooi (32):
  gconfmm: add 2.28.0 paprefs: add 0.9.9
  (lib)gphoto2: update to 2.4.7
  angstrom 2009.X: bump DISTRO_PR to 5 per earlier agreement
  opkg: bump SRCREV
  totem: add libunique to depends
  xclip: add 0.12
  gksu: add 2.0.2 libgksu: add 2.0.12
  gst-plugins: add more explicit dependencies
  opkg: bump to r413
  qt4: add 4.6.0, WIP
  ffmpeg svn: bump SRCREV
  angstrom feed sorter: add more machines
  angstrom feed builder: add more packages, remove E due to webkit-efl and web
  libsdl-mixer: fix flac madness
  angstrom: blacklist fso-apm
  udev 141: fix fragile symlinking by moving it to a smarter postinst
  qt* 4.6.0: more improvements
  util-macros: add 1.3.0 (from Martin's branch)
  linux-omap 2.6.32: start recipe for it
  opkg: bump SRCREV to get some more fixes
  linux-omap 2.6.32: add patch to fix EHCI
  Revert "gnome-keyring 2.28 has a language file ta.po that fails to build."
  font-util: fix merge damage
  efl: bump SRCREV to fix some crashes
  opkg: bump to r446 to make unarchive errors warnings again
  linux-omap 2.6.32: bump SRCREV
  ecore: maxrev iconv patch
  recipes/ti: merge in updates
  libgles-omap3, omap3-sgx-modules: switch to new style installjammer unpacker
  hawkboard, da850-omapl138-evm: use l138 include

Kristoffer Ericson (5):
  Add gettext version to jlime distro file.
  Add e2fsprogs-libs-native version to jlime-2009.1
  Fix configure error (no 16bit type!)
  Add more preferred providers/version to jlime-2009
  gnome-keyring 2.28 has a language file ta.po that fails to build. Looks like

Leon Woestenberg (4):
  helloworld: Use {C,LD}FLAGS during build. Duh.
  machine/ion.conf: Adjust machine arch settings.
  openmoko-alsa-scenarios.bb: Provide a safe SRC_URI default.
  gcc-configure-cross.inc: Remove bogus rm -rf libiberty.a

Marcin Juszkiewicz (5):
  nfs-utils: use 'make install' for 1.1.2 version
  linux-bug: bumped SRCREV for new fixes, autoload SDIO wifi
  linux: added 2.6.32
  simone: added machine config for SimpleMachines Sim.One developer board
  linux 2.6.32: added Sim.One support

Marco Cavallini (1):
  checksums.ini added checksum for wxWidgets-2.8.10

Martin Jansa (14):
  task-shr-feed: add fltkcurrency and mokoeightball
  librsvg-native: add native package for navit-icons
  font-util: Fix cross building, use PKG_CONFIG_PATH in MAPFILES_PATH test
  checksums.ini: add checksums for newer xorg recipes from xorg-7.5 branch
  task-base: remove quotes around DISTRO_APM
  linphone: merge missing patch from shr/import
  checksums.ini: add linphone checksum and move wxWidgets-2.8.10.tar.bz2 check
  linphone: patch needs CR+LF to apply, sorry for that, now it compiles fine
  gst-plugins: disable dvdnav for shr
  navit: change to INC_PR, bump srcrev, split icons and config for navit_svn
  navit: fix merge
  navit: INC_PR for release versions, lost while merging, sorry
  shr-launcher: bump svnrev and merge recipe do_install changes from c_c

Michael 'Mickey' Lauer (2):
  libeweather: new recipe; EFL-based weather report library

Mike Rapoport (2):
  omap3-sgx-modules: fix build for recent kernels
  task-beagleboard-demo: add e-wm-menu

Mike Westerhof (3):
  SlugOS: use IPKG_VARIANT instead of identifying the opkg variant by name.
  opkg: add opkg-nogpg-nocurl-slugos recipe, update slugos.conf to use it. Thi
  SlugOS: update preferred versions for distro to current (fixes problem where

Robert Nelson (3):
  linux-omap 2.6.32: enable mmc power, CONFIG_TWL4030_POWER replaces CONFIG_TW
  linux-omap 2.6.32: mach to plat change for ehci-omap.c
  linux-omap 2.6.32: disable CONFIG_CPU_IDLE

Roger Monk (3):
  davinci machines: udate davinci targets to latest staging kernels
  uboot git : Update davinci machines (dm355/365/6446/6467/6467t)
  dm355-evm: fix UBOOT machine config

Sebastian Krzyszkowiak (2):
  sane-srcrevs: bump mokonnect to have fix for python-elementary callbacks inc
  shr-settings: add python-pexcept to RDEPENDS

Sebastian Spaeth (11):
  shr-image.inc: remove 1 module autoload hack. 2 of them left.
  shr-image.inc: Remove htop.desktop hack, we don't even install htop anymore
  usb-gadget-mode: Add shr-distro specific default config
  shr-image.inc: Remove g_ether loading hack, we use usb-gadget-mode for loadi
  usb-gadget-mode: Bump PR after changing config
  shr.conf: set DISTRO_apm = fso-apm
  task-base: Introduce DISTRO_apm and convert recipes to use it.
  Revert Introduce DISTRO_apm patch until I get permission
  calc: bump to v 0.0.4. Move to openmoko-3rdparty dir
  task-base: Introduce DISTRO_APM and convert recipes to use that
  fso-apm: remove R|PROVIDES=apm

Stanislav Brabec (1):
  matchbox2: Resource ~/.profile correctly.

Steffen Sledz (2):
  linux-2.6.24: signal power on/off to hipox machine board ctrl
  linux-2.6.24: use rtc-drbcc at hipox machine

Stephen Simpson (1):
  libdvb 0.5.5.1: Fix build on GCC 4.x

Thomas Zimmermann (5):
  fso-apm: add RPROVIDES = "apm" and add PREFFERED_PROVIDER for it to shr.conf
  task-shr-feed: add python-wifi to the feed
  babiloo, neomis, numberx: update to recent version (addopting callbacks from
  openttd: update to released 0.7.4
  babiloo-efl: add locales

Tom (1):
  shr-wizard: Remove the inclusion of the debug modules to the package

 Bugs fixed:

bug_id resolution        short_desc
4661 FIXED       libsvg-0.1.4-r1: task do_qa_staging:
5149 FIXED       e2fsprogs-libs fails to compile for RELEASE

Bugs opened:

bug_id resolution        short_desc


