Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oq6wn-0002Pv-VU
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:11:09 +0200
Received: by wyg36 with SMTP id 36so6201954wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=nGXXaMpmhyyWzcthjHCd1Q2rnfyktG+pAQv9KSu4rdk=;
	b=cwQEc1JTK78fqZMFHKRENizYaC2+eVFXdaRKQe/18mfymFNvNhWpaffoFSyRAX2WXD
	eRI/4+snJnGRk48OP3ZgORnZqNaVi3sJrLRCPS3IVXjL5s1oMqkFDH0R4nVH4JPlTml9
	WfXaHQNLkdceaAWGEDo/H6JR4PvFRiZv8MsgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=P/amF0nCQ6ENn9Ahv+fiOLYdvISI0WftElOQ6f4eIvn3jOQ5Ekr7yywGhrJ2lj2p4E
	iO7zAqUf8Buj1dYDblb+CpidB4wLLZ2lsmTinVafZ9e7RSQV4bHFi7aMs5Qw5Fl5+hxg
	U7BHB3Hx7JBHTcPPbVRe+xrLIwoBY4yGfwAz8=
MIME-Version: 1.0
Received: by 10.227.134.136 with SMTP id j8mr4783120wbt.206.1283184629861;
	Mon, 30 Aug 2010 09:10:29 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 30 Aug 2010 09:10:29 -0700 (PDT)
Date: Mon, 30 Aug 2010 12:10:29 -0400
Message-ID: <AANLkTi=HGkymDLgb8qpT-dheTtuBABd9urHvwP9t3OR9@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-08-23 to 2010-08-30
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
X-List-Received-Date: Mon, 30 Aug 2010 16:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for 2010-08-23 to 2010-08-30

Bas van den Berg (1):
  qt4-embedded: fixed adding qte.sh in package

Chase Maupin (2):
  matrix-gui-e: add dependency packages
  matrix-gui-e: change initscript start level

Chris Larson (5):
  patch: allow importing patches into other dirs
  base: use a variable for the modules to import/inject
  Revert "base: use a variable for the modules to import/inject"
  base: use a variable for the modules to import/inject
  oe.utils: add oe_run convenience function

Denis 'GNUtoo' Carikli (5):
  fso-autorev.inc: added android-rpc
  xchat 2.8.6: bump PR because of openssl version change
  gpsd: add 2.95 version which fixes python binding issues
  gpsd: add htcdream config and bump PR of gpsd.inc
  linux-leviathan: changed ext2 support from m to y and removed extended attri

Enrico Scholz (8):
  ncurses: use ${PN} instead of hardcoded 'ncurses' in package names
  ncurses: splitted common terminal definitions in own package and depend on i
  ncurses: preserve default PACKAGES list by using +=, not =
  ncurses: made -tools depend on base package
  ncurses: set --with-ticlib for widec libs too
  ncurses: set some configure cache variables
  ncurses: fixed widec builds for native targets
  ncurses: bumped PR

Fahad Usman (2):
  makedevs_1.0.0: got rid of separate native recipe and removed legacy staging
  lemon_3.5.4: merged native and non-native recipes

Florian Boor (5):
  smartqv7.conf: Device description for Smartdevices V7
  linux: 2.6.28 patch and workarounds for smartqv7.
  xserver-common: Add new release with several bugfixes and merged patches fro
  tslib: Configuration for smartqv7
  psplash: Add configuration for smartqv7

Frans Meulenbroeks (21):
  Revert "htmldoc[-gui]: remove old versions"
  nx-client: renamed to nx-server
  lmbench-2.0.4: removed
  lmbench: added 3.0-a9 version
  Revert "lmbench-2.0.4: removed"
  opensc: new recipe
  nxproxy: new recipe
  nxcomp: new recipe
  nxcompext; new recipe
  nxcompsh: new recipe
  nxkill: new recipe
  nxssh: new recipe
  nxuexec: new recipe
  nxservice: new recipe
  cdrtools-native: moved to 3.00
  kakasi: merged native and target recipe, removed legacy staging
  minimal.conf: added ivp4 and ipv6 as distro features
  mythplugins: mythplugins dir renamed to mythplugins-0.22
  mythplugins-023: fixed it
  libexif: moved to latest version (0.6.19)
  libexif: removed insecure versions

Khem Raj (10):
  acpid_1.0.10.bb: Fix building on x86 with gcc 4.5
  sed_4.2.1.bb: New recipe.
  python-numpy_1.4.1.bb: Add recipe checksums.
  gnuradio_3.2.1.bb: Add missing dependency on guile-native
  u-boot_git.bb: Update SRCREV for calamari to something fetchable.
  gcc-4.4.4: on PPC/SPE when compiling with -Os gcc needs parts of libgcc.a ma
  openssh_5.6p1: Add recipe.
  dspgw-utils_3.3.1.bb: Remove do_stage and patch=1
  gdb_7.1.bb: Add support to build gdb for SH4 natively.
  omap3-pandora.conf/u-boot-omap3pandora_git.bb: Use PREFERRED_PROVIDER_virtua

Koen Kooi (6):
  Revert "beagleboard.conf: use qt4-x11-free-gles"
  Revert "base-files: beagleboard: profile: use nano"
  hawkboard: tweak ubifs params
  qt4-embedded: bump INC_PR
  openssl: move cnf file to -misc making different libcrypto versions parallel
  hawkboard, da850-omapl138-evm: change UBI parameters after kernel patch

Lukas D. Gorris (1):
  linux-qsd8: bumb srcrev, update htcleo defconfig

Martin Jansa (20):
  EFL: bump SRCREV a bit more again, fix for missing cursor in text fields
  e-wm: use illume2 instead of illume1, fix illume-keyboard paths and locales
  e-wm: introduce E17_DEFAULT_CONFIG to remove e-wm-config-default from RRECOM
  xserver-common: update 89xTs_Calibrate.xinput_calibrator
  mcnavi: bump PR after EFL .so names change
  Revert "e-wm: introduce E17_DEFAULT_CONFIG to remove e-wm-config-default fro
  xserver-common: fix patch
  shr-e-gadgets: add edje_convert call before it's fixed in git repo
  linux-openmoko-2.6.32: upgrade to 2.6.32.20 and add patch for WSOD with 242
  om-neon: bump PR to rebuild .edj
  linux-git: upgrade SRCREV to 2.6.32-rc2
  linux-openmoko-2.6.32: upgrade to 2.6.32.5
  linux-openmoko-2.6.32: fix usbhost patch
  linux-openmoko-2.6.34: upgrade to 2.6.34.6 and add patch for WSOD with 242 t
  linux-openmoko-2.6.32: upgrade to 2.6.32.21
  omhacks: bump SRCREV
  task-shr-feed: add gnuplot
  galculator: add version 1.3.4
  task-shr-feed: add galculator
  galculator: add link galculator_48x48.png, otherwise it segfaults

Michael 'Mickey' Lauer (1):
  vala: add 0.9.6.1     NOTE: Unfortunately upstream decided to change the PC

Noor Ahsan (2):
  sgml-common-native: Run oe-stylize.py and updated the recipe accordingly
  sgml-common-native: Convert to new style staging, remove do_stage()

Petr Vanek (3):
  omnewrotate: SRCREV bump to r67 for 2.6.32 kernel paths
  atrack: SRCREV bump to r128, adds aprs symbols, fix missing TODO file
  xserver-xorg_1.9.0: fix randr support for input calibration

Philip Balister (4):
  task-sdk-gnuradio-native.bb : Update name of python dev package.
  cmake-native_2.8.2.bb : Force ccmake to link against -ltinfo.
  python-numpy_1.4.1.bb : Add version that builds with gcc-4.5.
  python-cheetah: Add native support.

Roger Monk (5):
  angstrom-codec-engine-* : Add Preferred DMAI versions
  da850-omapl138-evm: Add multiconfig for UI card with NAND enabled (requires
  linux-davinci: Add patches to disable NAND SUBPAGE on da850-omapl138-evm/haw
  linux-davinci: Add SATA configuration patches for da850-omapl138/hawkboard
  angstrom: Add (hack) recipe to enable autologin (timed) for gdm

Roman I Khimov (6):
  ethtool: add version 2.6.35
  ethtool: remove versions prior to 2.6.35
  iptables 1.4.9.1: DEPENDS on libnfnetlink
  squid: update 3.1.6 to 3.1.7
  squid: remove version 2.6.STABLE14
  MAINTAINERS: add an entry

Simon Busch (1):
  MAINTAINERS: introduce myself

Stanislav Brabec (3):
  udev: udev-compat-wrapper-patch: Use KERNELMICROVER evaluation that does not
  crda: Skip verification of regulatory.bin of the build host.
  ksymoops: Updated to version 2.4.11, fixed for current libbfd, adjusted /pro

Stefan Schmidt (2):
  linux-omap-hah_2.6.31: Add kernel recipe for bug20
  bug20.conf: Remove note about kernel not in OE yet

Tom Rini (3):
  dosfstools 2.10 / 3.0.9: Fix typo (CLFAGS -> CFLAGS) for !uclibc largefile
  dosfstools: Drop 2.10, make 2.11 use BBCLASSEXTEND for native
  opkg-utils: Fix typo and drop duplicate S entry

Willer Moreira (1):
  dspgw-utils: Adding DSP Gateway Utilities package


=====================================================
OE weekly changelog for holger/staging-branch, 2010-08-23 to 2010-08-30


=====================================================
Bugs fixed:
bug_id resolution        short_desc
5467 WORKSFORME  alsa-utils link error because of ncurses version
difference between host and target

Bugs opened:
bug_id resolution        short_desc


-- 
=================
http://bec-systems.com


