Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OE2bV-0004nl-8B
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 17:51:49 +0200
Received: by wwb28 with SMTP id 28so125702wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=TwKcDLpVCWVdUHj2YFjafLc4/hy1NNf//cvcuAmNK9M=;
	b=kb/B9SoCczFr0PrGyIcCD3x9aYbrV9rZrsReU4wHj+u7fVQo35CAxnlVtOjWuNOl7T
	fkjphJf3iaEZOIUqn95CljOg0FsBRLu8O7aly9l2+MsxFSbwmgsnosqwR7oDQ6ke3TGx
	LdvJU1w1ZAqOpe3PzNXXKNqP5ImCguR32iTmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PInO0Ev0crf8gSr1W5TogQVyTUCO2lAm5dvq19BPpE67nXFsGwPYn6gJCBgSn/TIjj
	JHNodsKUcZK/VquriNFQvvXwmcZi+ZqnZmjNl91xxB2FJ/5FOnLQOYX9yaOkUIbjj2hV
	GorFFioQ61yB+hcqHvvCf+6TB5XPkRIItLKTk=
MIME-Version: 1.0
Received: by 10.216.172.213 with SMTP id t63mr3274219wel.44.1274111261071; 
	Mon, 17 May 2010 08:47:41 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 17 May 2010 08:47:41 -0700 (PDT)
Date: Mon, 17 May 2010 11:47:41 -0400
Message-ID: <AANLkTinitpykgbmFXTUdYJgH4hS7Zoz2qSs-UAmp0IEg@mail.gmail.com>
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
Subject: OE weekly changelog 2010-05-10 to 2010-05-17
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
X-List-Received-Date: Mon, 17 May 2010 15:51:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-05-10 to 2010-05-17

Antonio Ospite (2):
  tzcode-native: update to 2010j
  tzdata: update to 2010j

Brijesh Singh (1):
  matrix-gui_svn: add init script for dm365-evm.

Denis 'GNUtoo' Carikli (7):
  matchbox-desktop 0.9.1: fix segfault at startup and convert to new staging
  gnash: add new 0.8.7 version, based on gnash_trunk.bb in gnash's bzr
  gconf 2.28.0: depending on dbus-x11 fixes ORBit issues and bump PR
  initscripts 1.0 : change it to MACHINE_ARCH and bump PR
  tslib: convert to new staging and bump PR
  matchbox-common: depend on matchbox-panel and bump PR
  Revert "initscripts 1.0 : change it to MACHINE_ARCH and bump PR"

Eric BENARD (5):
  module_strip.bbclass: set KERNEL_MAJOR_VERSION
  nano: add gettext dependency
  psplash : update to latest SVN
  svgalib : add svgalib-1.9.25
  evtest: add libxml2 in DEPENDS

Eric Benard (1):
  psplash: unbreak recipe

Henning Heinold (16):
  java-native.bbclass: silence the legacy staging msg
  unzip: use BBCLASSEXTEND now
  unzip: do_stage is not needed with NATIVE_INSTALL_WORKS = "1"
  fastjar: switch to BBCLASSEXTEND and clean up
  jamvm-initial: use new staging system
  ant-native: convert to new staging system
  xalan: convert to new staging system
  zip: use BBCLASSEXTEND = "native" for native recipe
  gnujaf: remove do_install method to fix native package
  ecj-bootstrap-native: convert to new staging system
  ecj-initial: convert to new staging system
  java-native.bbclass: remove do_stage function, because of NATIVE_INSTALL_WOR
  libecj-bootstrap.inc: convert to new staging system
  classpath-native.inc: convert to new staging system
  jikes: use BBCLASSEXTEND = "native"
  giflib: add dependency to libsm from xorg-libs

John Connolly (1):
  conf/machine/bug20.conf, add xf86-input-tslib for BUG2.0 touchscreen

Ken Gilmer (1):
  bug20/xorg.conf: update to use tslib driver for touchscreen input device.

Khem Raj (17):
  uclibc_git: Bump SRCREV.
  gcc-configure: Disable --enable-target-optspace for powerpc.
  gcc-4.4.4: Move gcc 4.4.3 recipes to gcc 4.4.4
  eglibc: Bump SRCREV for 2.11 and trunk.
  u-boot-1.3.2: Fix compilation with gcc 4.4 for mpc8313e-rdb/ppc
  machine/qemuarm: Move kernel version to 2.6.33
  sane-toolchain.inc: Bump preferred versions for binutils, gcc and eglibc
  eglibc: Bump SRCREV for 2.11 and trunk recipes
  gcc-4.4.4.inc: Fix ppc issues of requiring libgcc at link time when using -O
  machine/qemu.inc: Build and install qemu-native for qemu based targets.
  eglibc_2.11.bb: Bump PR to reflect last update.
  qemuppc: Add new machine qemuppc running ppc on QEMU.
  x264_r2245.bb: Set X264_ECFLAGS="-fPIC" for mips mips
  machine/qemush4: Add new machine for SH4 on qemu
  linux-2.6.33: Make 2.6.33 default kernel for qemumips.
  linux-2.6.33: Make 2.6.33 as default kernel for qemux86
  psplash: Rename HAND_* defines to POKY_* in all remaining psplash-poky-img.h

Klaus Kurzmann (2):
  libphone-ui: add libfso-glib and libfsofamework to DEPENDS
  libphone-ui-shr: add libfsoframework to DEPENDS

Koen Kooi (19):
  ccache: fix QA error
  qt4-embedded: fix decorations and mouse configs
  linux-omap-psp 2.6.32: rediff touchbook and beagleboard patches, tweak beagl
  beagleboard-linuxtag2010-demo-image: add image to show at Linuxtag 2010
  opencv: bump SRCREV
  beagleboard-linuxtag2010-demo-image: add some more stuff
  beagleboard-linuxtag2010-demo-image: add all kernel modules
  pixman: add generic 565 scanline fetcher
  linux-omap-psp 2.6.32: add ram timing for second bank as well
  usb-gadget-mode: switch beagle to g_ether to make MS Windows work
  jikes-initial: make it build with new style staging
  gst-plugins: enable gst-plugin-x264
  linux.inc: add protptype for 'kernel-headers' package
  signgp-native: convert to new-style staging
  ti-devshell: TI version of devshell that has all the 'DVSDK' environment var
  git 1.7.0.2: fix hardlinking problems as reported by Eric Brombaugh
  sed 4.1.2: add missing 'inherit gettext'
  libdiscid: convert to new style staging
  psplash: fix angstrom logo

Lukas Gorris (2):
  htcleo: use uncompressed kernel iamge
  linux-qsd8: updates srcrev, htcleo defconfig

Martin Jansa (11):
  emacs: add missing chunk in use-qemu.patch for 23.1, create libc.so -> libc.
  task-shr-feed: add emacs-x11 and set P_V to 23.1
  shr-autorev: drop fltkspacetrader from AUTOREV
  freesmartphone: bump SRCREVs for more gprs fixes and direct sms delivery
  shr: prefer gcc-4.4.4
  EFL: bump SRCREV for fixed focus and Efreet filter in illume2 Home
  xorg: add newer xserver 1.8.1, xdm, imake
  qemu: add workarround to fallback to safe mmap_min_addr
  linux-openmoko-shr-devel: bump SRCREV for ar6000 fixes
  eglibc: append SRCPV to PR
  shr: drop PREFERRED_VERSIONs for toolchain, now in sync with sane-toolchain.

Michael 'Mickey' Lauer (5):
  vala: 0.8.0.128 -> 0.8.1.1
  vala: fix tarball checksums; tarball was corrupt when i generated mine
  nmon: new recipe; flexible ncurses-based performance monitor
  task-cli-tools: add nmon
  rfkill: new recipe; rfkill configuration utility

Roger Monk (6):
  ti-cgt6x: Add v6.1.5
  ti-local-power-manager: Add v.1.24.02.09
  ti-xdais: Replace Engineering release with Product v.6.25.02.11
  ti-codec-engine: Replace Engineering release with Product v.2.25.02.11
  angstrom-codec-engine-preferred-versions : Update for CE production release
  angstrom-codec-engine-preferred-versions: Add 2 new TI 'preferred' configura

Shane Volpe (1):
  mono: Add version 2.6.3

Stefan Schmidt (2):
  xorg-xserver-common.inc: Bump PR for the last change to the bug20 xorg conf
  imote2.conf: Restore old kernel provider.

Stiffmaster (1):
  linux-qsd8: move to new branch

Thomas B. Ruecker (1):
  fennec: rediff the native bpp patch and update .desktop file

Tom Rini (1):
  busybox: Fix the -dbg package, bump INC_PR


=====================================================
OE weekly changelog for holger/staging-branch, 2010-05-10 to 2010-05-17


=====================================================
Bugs fixed:
bug_id resolution        short_desc
5434 FIXED       psplash fails to build

Bugs opened:
bug_id resolution        short_desc


