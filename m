Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NjawA-0006Rz-0V
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:15:13 +0100
Received: by iwn9 with SMTP id 9so2414220iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=39u4q08rBJa/ol3iIQ9IDiTjjhai5sO1ABGJ4HEsSrw=;
	b=mjQz3tkos3zNAEb3jMCf8WAdw0YM9aL6ybZ3FKiWv4VIcygAJHyDwf2uvEB6prti1g
	zucLZbjuVgyen642gFZcp9Kl/Byst49fMrwjb6Lx9i7vEVcuMvbJWqZ2D9TmqWtvA3/G
	sbuWacJI3/cjMZ91RM+lnI1fBIiZaM1TZVBOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=wXT4tBI6sP2AU5S//vBHEYLyybqPZKaPYy5KgaWLujYIAOXQ0YEBpcH355BSgaZmTR
	OFzM12sNtMyG7R+tHF5nzPUDdNp3tf89I6F5A29Kg1ypGMiSWpe10H8btvcXSNDx2hwt
	3YR7wCUj5De3IHddHsFqIvNHemADXYVXWO2us=
MIME-Version: 1.0
Received: by 10.231.167.4 with SMTP id o4mr499547iby.66.1266855145457; Mon, 22 
	Feb 2010 08:12:25 -0800 (PST)
Date: Mon, 22 Feb 2010 11:12:25 -0500
Message-ID: <f96d234e1002220812w1450ee07ve7544d4717105cfe@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2010-02-15 to 2010-02-22
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
X-List-Received-Date: Mon, 22 Feb 2010 16:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog 2010-02-15 to 2010-02-22

Andrea Adami (9):
  initramfs-kexecboot-image: move to recipes/images
  initramfs-kexecboot.inc: Remove kexecboot from MACHINE_FEATURES.
  initramfs-kexecboot-image: standardize image (remove PR, reorder)
  initramfs-kexecboot.inc: apply sane defaults
  linux-kexecboot_2.6.32: minor defconfig update for Zaurus clamshells
  linux-kexecboot.inc: enable lzma compression for more kernel versions
  kexecboot-cfg_0.1: minor edits (one echo is enough). No runtime changes.
  klibc_1.5.15+1.5.16: initial commit. Legacy staging is broken. WIP.
  klibc: major patch split and reordering, recipe cleaning.

Bernhard Kaindl (1):
  external-toolchain: Really accept toolchains built by meta-toolchain.bb

Chris Larson (1):
  Revert "package.bbclass: when running 'file', be explicit about the path to

David-John Willis (4):
  system-tools-backends: Add 2.8.3 and checksum and remove DEFAULT_PREFERENCE
  xfce4-power-manager: Remove broken xfce4-power-manager_4.6.1.bb and add late
  xfwm4-themes 4.6.0: Refactor recipe to clean up the production of the theme
  gnome-mplayer: Add INC_PR support to recipes, add 0.9.9 and bump svn to late

Denys Dmytriyenko (3):
  Revert "local.conf.sample: Document proxy setup."
  external-toolchain-csl: add gconv/locale split magic
  meta-toolchain: make SDK relocatable by using $SDK_PATH var in env setup scr

Frans Meulenbroeks (3):
  xf86-video-intel_2.10.0 made dependent on xorg-extensions
  MAINTAINERS: added myself :-)
  xinit: add dependency on util-linux-ng

Koen Kooi (32):
  eee701: add dri* and glx modules to XSERVER
  xfce4-session: add xinit and dbus-x11 to RDEPENDS_
  xfce46-image: xorg stuff moved to its proper place in eee701.conf and xfce4-
  rage: add missing dep on emotion
  python-pygobject-native 2.20: fix configure and convert to new-style staging
  e*bbclass: run autopoint in configure
  collections.inc: comment out python statement that inject PYTHONPATH into th
  libnl 1.1: convert to new style staging and add comment about solving build
  kernel.bbclass: prepare for 2.6.33 header move and simplify logic a bit
  eggdbus: fix depencies and add checksums
  policykit: add 0.96
  libpam-base-files: remove polkit-1 that is already in policykit package:
  network-manager: fix 0.7.9999
  network-manager-applet git: update to 0.7.999
  policykit-gnome: update to 0.96
  checksums: add some old-style checksums
  devicekit, -power: convert to new style staging
  devicekit-power: add 014
  gnome-power-manager: add 2.28.3
  opkg-native: bump to r522 to get a fix to remove duplicate messages from do_
  consolekit: add 0.4.1
  qt4: add 4.6.2
  consolekit 0.4.1: fix PAM and make it a distro feature
  policykit-gnome: fix SRC_URI
  gconf: add 2.28.0
  libpam-base-files: bump PR
  policykit: bump PR
  Revert "recipes/images/console-base-image.bb: factor out Angstrom-specific b
  qt4-*-gles 4.6.2: only enable opengl es2 but not openvg
  angstrom: move to qt 4.6.2 and nm 7.999
  checksums: fix git merge damage, sorry about that

Marco Cavallini (2):
  kaeilos.conf: Added credits to Angstrom
  kaeilos-2009-preferred-versions.inc: Updated preferred package versions due

Martin Jansa (29):
  xserver-xorg_git: bump SRCREV, drop unneeded crosscompile patch
  xserver-xorg_git: add font-util-native dependency
  sane-srcrevs: bump shr-launcher for app rescan fix
  linux-2.6.33-rc6: move to linux-2.6.33-rc8
  linux-kexecboot: move from 2.6.33-rc8 to 2.6.33-rc8, enable DEVTMPFS
  linux-kexecboot: use INC_PR for kernels, PR should get bump with every kexec
  sane-srcrevs-fso: bump mdbus2 for latest fixes
  gtk+-2.18.6: add libxrender-native to virtclass-native dependencies (fails t
  qt4-tools-native: set libdir and incdir in .inc file
  pixman: add 0.17.6 with positive D_P only for shr now
  libdrm: add version 2.4.18
  dri2proto: add version 2.3
  preferred-xorg-versions-live: update dri2proto and pixman requirements
  EFL: bump SRCREV a bit, big python-EFL cleanup
  preferred-shr-versions: use udev 151 and usbutils 0.86
  libdrm: update PV, SRCREV after 2.4.18 release, needed for newer mesa-dri
  shr-neo-theme: lower dependencies from RRECOMMENDS to RSUGGESTS, update SRCR
  mesa-dri: add mesa-dri-glsl-native for building newer mesa-dri than 7.7 from
  mesa-dri: update PV, SRCREV for 7.8, needed for xserver 1.8
  xf86-video-glamo: bump SRCREV for xserver 1.8 compatibility and move SRCREV
  xserver-xorg_git: fix build after mesa 61d26bc82e7c4100acfb551cbb0ba9d84bbc4
  xf86-video-glamo: remove -pedantic as it emits warning for xserver-1.8 and t
  Revert "EFL: bump SRCREV a bit, big python-EFL cleanup"
  libphone-utils, python-phoneutils: bump SRCREV, move it to recipe
  xserver-xorg_git: add hack for ignoring fbdev return mode
  udev: blacklist mmcblk mounting for SHR
  fsomusicd: add gst-plugins to DEPENDS, -ugly conditionaly wrt ENTERPRISE_DIS
  fsomusicd: move more gst-plugins to RRECOMMENDS as agreed with fsomusicd aut
  pixman: disable gtk, to break circular dependency gtk+->cairo->pixman->gtk+

Michael 'Mickey' Lauer (1):
  linux-leviathan: bump to revision with backlight and alsa (almost) working

Rolf Leggewie (2):
  altboot: drop altboot in favor of kexecboot to avoid confusion
  recipes/images/console-base-image.bb: factor out Angstrom-specific bits

Stanislav Brabec (2):
  imagemagick, imagemagick-native: Build with librsvg resp. librsvg-native. Us
  navit-icons: Fixed native dependencies: convert with rsvg is not shr specifi

Stefan Schmidt (2):
  imote2.conf: Add Xbow iMote 2 machine.
  ibrdtn: Add release 0.1.1

Steffen Sledz (1):
  vala-dbus-binding-tool: (mostly) new recipe

Thomas Zimmermann (4):
  tangogps: add version 0.99.3
  aceofpenguins: fix crosscompilation
  phoneui-shr-theme-neo: add new recipe
  eglibc: unbash ldd and add libpthread_nonshared.a to -dev

Tom Rini (5):
  openswan: Set USERLINK=${LDFLAGS} to fix GNU_HASH errors, bump PR
  initscripts: Have sysfs.sh do similar checks to rcS and bump PR.
  package.bbclass: when running 'file', be explicit about the path to the magi
  dt: convert to .inc, add no_aio patch for uclibc
  xdm: need to pass paths to wtmp/utmp, bump PR

Valery Febvre (1):
  Podboy: update to 1.3.4

kergoth (1):
  xserver-kdrive: apply vm86_masks.patch to 1.4.2 also

Bugs fixed:

bug_id resolution        short_desc
5402 NOTOURBUG   Tosa: USB module not loaded on startup (ohci-hcd)
5403 NOTOURBUG   tosa: prism2-usb causes kernel panics upon insertion in kernel
5388 INVALID     meta-toolchain-1.0-r0 fails in  do_populate_sdk


