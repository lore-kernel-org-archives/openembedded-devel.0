Received: from mail-pz0-f178.google.com ([209.85.222.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1O3spN-0007kc-FJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 17:24:08 +0200
Received: by pzk8 with SMTP id 8so297575pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=FLzhQKZPkW2hiBAD8d4+Y5mAPiM+9ZQYbr90bdPylK0=;
	b=wvHxY9eEpVPB01Xu4wqFHJfDQYUmml5WVR3Kc2EI6JXfE0DZrNz/DmVMZtMyyCOtKu
	3H+lj5T+siFxmugCdGbnbvZSh+rjdN24+cONdHumhs7Y3XivlEovPsRPkZPiIpZWXzCZ
	vchDwEoiVw3XJs0oJZRpLJrPp9OlE+CkWFFl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JlNHqIqIh0S8CjBa4mJvoJa6fHARdiWGbzfpZsOCmNJ+0DtJwwxGPF3oInPajm+U7a
	tG3spP9OQaNkx3kX0Pkg/3dCT2aYg2cqensntqL9hGsWxJq/+dbS3b+50/DMMcX3mZjT
	ywGXM2bAU9k8M0u7NPqnfc2wT4e7VAlHG6HAE=
MIME-Version: 1.0
Received: by 10.231.36.134 with HTTP; Mon, 19 Apr 2010 08:20:26 -0700 (PDT)
Date: Mon, 19 Apr 2010 11:20:26 -0400
Received: by 10.142.121.1 with SMTP id t1mr2059571wfc.100.1271690427465; Mon, 
	19 Apr 2010 08:20:27 -0700 (PDT)
Message-ID: <k2gf96d234e1004190820tedde6cc5k80c61ad588a3742@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.178
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-04-12 to 2010-04-19
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
X-List-Received-Date: Mon, 19 Apr 2010 15:24:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

=====================================================
OE weekly changelog for org.openembedded.dev, 2010-04-12 to 2010-04-19

Andrea Adami (1):
  linux-kexecboot: bump 2.6.33+2.6.34-rc3 to 2.6.33+2.6.34-rc4

Brijesh Singh (11):
  ti recipes: add license section
  ti-linuxutils.inc: build irq module on dm365 platform
  ti-dmai_svn: add edma and irq module runtime depedency on dm365 platform.
  ti-dmai_svn.bb: update 365 loadmodules to use modprobe
  ti-codec-engine.inc: add conditional depedency on dsp tools (cgt, bios etc)
  ti-codec-engine_2.25.01.06: add loadmodule.sh on DM365 platform.
  ti-codecs-dm6446_2.05.00.00: add LICENSE field
  ti-dm355mm-module_1.13: add LICENSE field
  ti-codecs-omapl137_1.00.00: add LICENSE field
  ti-codecs-dm6467_1.00.00.03: add LICENSE field
  ti-codecs-omapl138_1.00.00: add LICENSE field

Chase Maupin (5):
  sort: Added dm3730-am3715-evm machine type
  clutter: Add dm3730-am3715-evm machine type
  linux-omap-psp_2.6.32: Add dm3730-am3715 support
  u-boot_git: Add dm3730-am3715-evm u-boot support
  dm3730-am3715-evm: Add dm3730-am3715-evm machine

Chris Larson (1):
  bitbake.conf: drop default inclusion of collections.inc

Denis 'GNUtoo' Carikli (3):
  xserver-xorg 1.7.4,1.8.0,git : make it MACHINE_ARCH for ion and bump PR
  xchat 2.8.6: fix CVE-2009-0315 and a building issues with 2 debian patches a
  mpd,mpd-alsa : fix init script(start and stop were swaped in restart),bump a

Denys Dmytriiyenko (1):
  ti: point properly to toolchain, whether it's internal or external

Denys Dmytriyenko (32):
  checksums.ini: add ti-dvsdk-demos
  ti-dvsdk-demos: fix the versioning, as ?= doesn't work
  bitbake.conf: set default TOOLCHAIN_* vars to internal
  checksums.ini: more checksums (still in the old format)
  ti-codecs-dm365: include required defines, fix the build
  ti: add codecs for DM6467
  ti-dvsdk-demos: add DVSDK demos for DM6467
  ti-dmai: some more DaVinci fixes
  ti-dvsdk-demos: ti-linuxutils was split, set
  ti-codec-engine: fixes
  dsplink.inc: remove old and unused file
  ti-dmai: add lost loadmodules.sh file
  ti-dm365mm-module: add newer version
  ti-dmai: enable loadmodules.sh for dm6467
  ti-codecs-dm6467: add newer version
  ti: set similar versions for DaVinci platforms
  dm6467t-evm: use SOC_FAMILY
  ti-codecs-omap3530: fix the URL for previous -42 release
  ti-codecs-omap3530: add the new -44 release
  ti-dmai: make sure ALSA headers are found in staging
  ti-lpm-module: fix the packaging of kernel module into correct package
  ti-dmai: fix GPPOS/G711 issue similar to ti-codec-engine
  ti-dvsdk-demos: use the proper variable for the build
  ti-codecs-dm355: codec server has no GNU_HASH
  linux-davinci: update to the latest staging snapshot
  ti-dm355-module: unbreak the build by accepting EULA
  ti-codecs-dm365: rework with the new version
  ti-dvsdk-demos: rework the build and install, update the version
  gstreamer-ti: update dm365 bootscript with the correct values
  multi-kernel.inc: introduce MULTI_CONFIG_BASE_SUFFIX variable
  ti-dmai: bump the SRCREV for dm365 and dm6467
  u-boot: update DaVinci platforms, fix some wrong PVs

Diego Dompe (2):
  gstreamer-ti: Add support for L138 on gstreamer ti plugin.
  ti-dmai: Add support for OMAPL138 on DMAI.

Enrico Scholz (2):
  kernel.bbclass: s!D!PKGD! (trivial)
  packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'

Esben Damgaard (1):
  iliwi: new recipe for wlan manager I LIke WIfi

Graeme Gregory (1):
  linux-omap-zoomsync_2.6.32.bb : enable thumb interwork errata

Henning Heinold (1):
  phoneme-advanced-foundation: add build 160

Klaus Kurzmann (4):
  task-shr-minimal.bb: remove pisi
  sysvinit: add rcS-default for SHR distro
  fsotdld_git.bb: give it an initscript
  sane-srcrevs.inc: bump EFL_SRCREV to get latest illume2 fixes and enhancemen

Koen Kooi (138):
  libwnck: add 2.30.0
  ti-xdctools: add 3.15.04.70 and 3.16.01.27 ti-dspbios 5.33.04: switch to TSP
  bitblit: fix patch to apply after changing ${S}
  freondemo, gstd: merge from arago repo
  ti recipes: start moving from -native to machine specific
  ti-cgt6x: fix versioning
  angstrom codec-engine versions: catch up with recipe renaming
  gstreamer-ti: stop recommending all gstreamer plugins, it pulls in way too m
  omap3.inc: bump MACHINE_KERNEL_PR for all module and kernel changes
  ti-local-power-manager: fixes
  gstreamer-ti: bump SRCREV
  linux-omap-psp 2.6.32: bump SRCREV
  ti-dmai: remove ti-dmai.inc and put everything in a single recipe
  gstreamer-ti: bump PR for ti-dmai changes
  omap3.inc: bump MACHINE_KERNEL_PR
  linux-davinci git: add hack for hawkboard machine ID
  linux-omap-psp 2.6.32: enable DSI for omap3evm to get colours in DVI working
  gstreamer-ti: RRECOMMEND kernel modules and codecs for omap3
  linux-omap-psp 2.6.32: updates:
  linux-davinci git: enable more usb devices for da850-omapl138-evm
  package-index: remove legacy staging
  ti-codec-engine, ti-dsplink-module: convert to new style staging
  freondemo: bump SRCREV gstd: bump SRCREV, update SRC_URI
  omapfbplay-cmem: add recipe which will can use CMEM as memory allocator and
  ti: if a recipe stages its complete tree, put it in -tree
  meta-toolchain-dvsdk: start protoyping a 'dvsdk' style ARM toolchain + DSP t
  ti-dmai: convert to new style staging ti-linux-utils: ditto
  libatomicops: fix packaging for usage with SDKs
  ti-staging: rename -sdk to -sourcetree to make it clearer what it actually i
  meta-toolchain-dvsdk: replace with arago version
  meta-toolchain-arago-dvsdk: convert to SOC_FAMILY
  task-arago-toolchain-dvsdk-host: convert to SOC_FAMILY
  omap3.inc: bump MACHINE_KERNEL_PR
  linux-omap-psp 2.6.32: add WIP support for beagleboardXM
  multi-kernel.inc: include file to build and deploy multiple kernel and modul
  linux-omap-multi-psp 2.6.32: example recipe on how to use multi-kernel.inc
  angstrom feed uploader: properly blacklist ti sourcetree packages
  multi-kernel: Allow inclusion in regular kernel build flow, deploy improveme
  ti-codec-engine: set GPPOS for dm355 to fix G711 dmai failure
  freondemo: update to latest git, add ipcsink
  linux-omap-psp 2.6.32: update to latest PSP git
  linux-davinci git: VPIF fix for hawkboard and tweak defconfig
  linux-omap-psp 2.6.32: bump SRCREV to get USB and cpufreq fixes
  ti-dm355mm-module: adjust for removed dm355 .inc
  linux-omap-psp 2.6.32: add patch to fix SGX clocks on DM37xx and update omap
  omap3.inc: bump MACHINE_KERNEL_PR
  ti-local-power-manager: reinstate dm6446 support
  ti-codecs-dm6446: change checksums and fix build
  linux-omap-psp 2.6.32: add patch to add a proper 720p60 mode to modedb.c
  linux-omap-psp 2.6.32: update SRCREV and fix DSI_PLL in beagleboard defconfi
  gstreamer-ti: include MACHINE_KERNEL_PR in PR since it statically links to l
  overo: switch to linux-omap-psp 2.6.32 as default
  ti recipes: fix shlibs
  libgles-omap3, omap3-sgx-modules: add 3.01.00.05 release
  linux-davinci git: enable earlyprintk for hawkboard
  bc-cube: add recipe for 0.1.0 + patch to build it against the 3.01.00.05 SGX
  libgles-omap3: fix ES5.x binaries, fix initscript
  linux-davinci git: increase kernel partition to 4M for hawkboard
  linux-omap-psp 2.6.32: update to latest 3.00.00.05 tag
  alsa-state: update alsa state for new omap3-touchbook kernel
  rt3070: also install .bin file, move to directory with other ralink recipes
  linux-omap-psp 2.6.32: update omap3-touchbook patches and defconfig
  libgles-omap3: use udev rule to change permissions on bccat and v4l nodes
  bc-cube: add 0.2.0 with desktop file to launch it using a GUI
  qt 4.6.2: use included wsegl header if staging lacks one, not all SGX SDKs i
  u-boot git: refresh leopardboard support
  linux-davinci git: fix dm355-leopard build
  QT4 gles: also allow ES1 builds, like ES2 needs undocumented magic
  qt4-*-gles 4.6.2: add 'depth' argument to configure, bump PR
  linux-omap-psp 2.6.32: update touchbook patches and defconfig
  alsa-state: update touchbook asound.state
  arora-e: try a bit harder to be parallel installable with arora-x11
  powervr-drivers: .05 was the internal release, switch to .06 that is availab
  omap3-sgx-modules: compile in ES5 mode by default, this makes it work on ES2
  linux-omap-psp 2.6.32: add patches from Mans Rullgard to help finding the DM
  powervr-drivers: The .06 SDK is live now, so make it the default
  linux-omap-psp 2.6.32: update omap3-touchbook patches
  alsa-state: update for latest omap3-touchbook ASoC patches
  flex: depend on gettext
  freetype 2.3.9: convert to BBCLASSEXTEND and new style staging
  dbus: add 1.2.24
  angstrom prefer dbus 1.2.24
  glib-2.0 2.24.0: add patch to extend gio, needed for wncksync
  wncksync: add 0.2.8
  liblauncher: add 0.3.6
  netbook-launcher-efl: add 0.3.0
  libunique: update to 1.1.6
  glib-2.0 2.24.0: bump PR
  angstrom-task-gnome: also ship 'gnome-open'
  tracker: bump PR
  linux-omap-zoomsync: add patch to add more options to detect silicon at runt
  flex 2.5.31: convert to bbclassextend to avoid dep loops with bitbake 1.8.x,
  x-load git: patch beagleboard MLO to be less stupid searching for FAT partit
  u-boot git: update beagleboard patches
  linux-omap-psp 2.6.32: add patch to allow OTG port to detect host cables wit
  angstrom-task-gnome: bump PR
  liba52: convert to new style staging
  live555 20090602: convert to new style staging
  gnome-python-desktop: add 2.30.0
  live555: also copy all headers into /usr/include
  gnome-utils: don't try to build help, it fails most of the times
  gnome: split out gnomebase.bbclass that doesn't have gconf and gmime depends
  gnome-common, gnome-doc-utils: use gnomebase.bbclass
  pixman git + 0.18.0: add patches to fix TLS behaviour
  gail: convert to new style staging
  gnome: convert a lot of recipes to new style staging
  gnome-dvb-daemon: add 0.1.17
  kernel bbclass: don't depend on c library (from poky)
  kernel bbclass: read version from ${B}, remove obsolete hostap logic that br
  python-pygobject 2.20: convert to new style staging
  gnome-db-daemon: fix src_uri name
  xorg-lib: switch to new style staging
  xorg-app: convert to new style staging
  libxml2: fix regression where -native wouldn't build python stuff needed for
  gpsd: fix dbg packaging
  abiword 2.8.3: bump PR
  ti-xdctools: add PRIVATE_LIBS list for internal libs
  claws-mail: bump PR
  at-spi: add 1.30.0
  gtksourceview2: add 2.10.0, convert 2.9.1 to new style staging
  gedit(-plugins): add 2.30.0
  xorg-headers-native: flag with NATIVE_INSTALL_WORKS = "1"
  nspr 4.7.1: import from jalimo overlay, convert to new style staging and che
  nss 3.12: import from jalimo, convert to new style staging, convert to new s
  nss: add pkgconfig support
  nss: make .pc file match do_install layout
  nss: update to 3.12.6
  linux-uml: fix after kernel.bbclass changes
  nss: more pkgconfig fixes...
  xserver-xorg-conf: add dm3730-am3715-evm support and add generic fallback fo
  chromium: import updates from AI repo
  libxml2: fix python badness on target
  nss 3.12.6: the jalimo recipe was trying to be way to clever with shared lib
  chromium: bump PR for nss change
  smartq5: add machine file for smartq5 tablet
  xf86-video-s3c64xx: add accelerated (XAA + Xv) driver for s3c64xx SoCs
  kernel.bbclass: fix ASMDIR regressions
  udev-static 124: prototype for a static udevd and udevadm that can be used a

Marcin Juszkiewicz (3):
  udev 124: disable devcache on BUG 2.0
  linux-libc-headers 2.6.23: backport arm/asm/hwcap.h from recent kernels
  linux-libc-headers 2.6.23: fix syntax error

Martin Jansa (67):
  obsolete: add python-efl.inc
  evolve: update SRC_URI, now it's in OLD instead trunk
  edje_editor: update SRC_URI, now it's in OLD instead trunk
  barebox: add missing SRCREV and bump PV accordingly
  recipes: move SRCDATEs to recipes (as done with SRCREVs)
  bluez-gnome: git repo is now in git.kernel.org, add missing SRCREV, old .pat
  comic-reader: fix SRCREV to existent one
  dtc: add missing SRCREV, set PV, negative D_P
  libeweather: fix SRC_URI s/eweather/libeweather/
  engrave: update SRC_URI -> OLD
  enhance: update SRC_URI -> OLD
  exml: update SRC_URI -> BROKEN
  zhone2: add SRCREV
  zhone2: add checksum for splash file
  uclibc_0.9.30: fix checksum, accidentally pushed checksum for it's locale in
  lockstat: update SRC_URI, now in old subdir and add checksum
  opie: add OPIE_CVS_PV definition to cvs recipes using it for PV without incl
  opie-help-en: TAG wasn't defined, use PV instead
  nonworking: add more .inc files to make packages at least parse-able
  recipes: don't use INC_PR in recipes which weren't converted to include .inc
  recipes: add missing checksums
  dpkg: fix merge
  uinput,mesa: fix merge
  recipes: move checksums to recipes from checksums.ini
  recipes: move checksums to recipes from checksums.ini, part 2 manual adjuste
  xcb,libx11,xserver-kdrive-glamo: add SRCREVs and fix git URL
  utils.bbclass: simplify checksum check, prepare for checksums.ini removal
  atk_1.28.0: add native with BBCLASSEXTEND
  font-misc-misc_1.0.1: remove this version, tarball is not available and 1.0.
  mkfontdir-native: use  in require and fix it for 1.0.5
  linux-h1940_2.6.17-h1940: update SRC_URI
  xapian-quickstartindex: add my different checksums to comment
  xfce: xfcalendar and xffm for 4.2 are only in .tar.gz not .tar.bz2
  linux-h6300-omap1_2.6.12-rc5: fix SRC_URIs and add checksums
  linux-ixp4xx_2.6.21.7: add SRC_URI names
  btsco,btsco-module: 0.41 had different checksums for different mirrors in ch
  gst-plugins-ugly-sid: add checksums
  libeina_0.96.5: drop double quote from DESCRIPTIONi
  ctcs_1.4.1: missing quote in DESCRIPTION, add checksum
  apache_2.0.54: add checksums
  recipes: few more checksums
  putty,puzzles: update SRC_URI for svn.tartarus.org
  squeezeslave_svn: old trunk for 3.0 seems gone, bump to 7.6 and add SRCREV
  sphinx_0.9.8: add checksum I've got
  xserver-kdrive_git: change SRCREV to existing one, bump PV a bit and unify +
  abiword-plugins_2.4.6: drop extra quotes (staging_helper fails)
  agg: add checksum for minimal, not that patch returns HTTP 404
  aircrack_2.1: update SRC_URI for old and add checksums (missing in checksums
  cx3110x_1.1: add checksums, drop ^Ms
  asterisk-addons_1.6.0-beta2: add checksums
  asterisk_1.2.24: update SRC_URI to location where it still is
  asterisk-moh-freeplay: add my checksums to comment, probably really changed
  em8300_0.16.3: drop extra quote, add checksums
  networkmanager-openvpn_0.8: in this case PV in SRC_URI is enough and 'gnome_
  recipes: few more checksums
  linux-openmoko-2.6.32: add 2 new patches from gdrm-2.6.32 branch
  navit,navit-icons: bump SRCREV
  recipes: more checksums and more fixes to download them all
  ventura: bump SRCREV for usability fixes
  bitbake.conf: enable BB_LOCALCOUNT_OVERRIDE by default, please disable if yo
  SHR: disable BB_LOCALCOUNT_OVERRIDE as we're using autoincremented SRCPV and
  linux-openmoko: use SRCPV in git recipes
  freesmartphone: use SRCPV in git recipes
  shr recipes: use SRCPV in git recipes
  recipes: use SRCPV in few more git recipes
  task-shr-feed: add linphone and iliwi

Michael 'Mickey' Lauer (5):
  fso-alsa: add new recipe; alsa diagnostic utility
  linux-leviathan: bump and change defconfig:  * compile wifi drivers as built
  linux-leviathan: enable debugfs to fix wifi (yes, it's true)
  evtest: rewrite recipe and bump to 1.25; it's using autotools now
  task-cli-tools: move some tools to the -debug subpackage

Mike Westerhof (1):
  SlugOS: preferred-slugos-versions.inc - fix to accomodate version numbering

Paul Menzel (1):
  linux-omap*: compile ext4 support into uImage instead of modules

Roger Monk (46):
  ti dsp tools : Adding Framework components 2.25.00.04 ti dsp : Adding EDMA l
  ti-edma3-lld: Adding version 01.11.00.03 (installer fix)
  angstrom: codec-engine preferred versions update to fixed edma3-lld
  linux-davinci: Add MFD Touchscreen Driver from RidgeRun for da850-omapl138
  linux-davinci: Use appropriate BRANCH for DA8xx/OMAPL
  ti-recipes: consistency cleanup
  ti-codec-engine-test-image: Replace dsplink-test-image
  ti-codec-engine: Move version specific code into versioned part + add device
  ti: add DM6467-specific build vars ( rediffed version of an earlier patch De
  ti-local-power-manager : Build and Install Utilities, Remove Module.bbclass
  ti-dsplink: Recipe rename, remove module.bbclass dependence, refactor variab
  ti recipes: DEPENDS/RDEPENDS ti-dsplink/ti-dsplink-module
  ti-dsplink: Add support for 2.6.33 and fix XDC interface generation
  linux-davinci: Update da850-omapl138 to latest staging kernel 2_6_33
  ti-recipes: Add SECTION qualifiers to recipes
  linux-davinci: Start using multi-kernel flow for da850-omapl138-evm
  linux-omap-psp: Update AM3517 to latest kernel + defconfig + add ehci patch
  u-boot: Update da830/da850-omapl138 targets to use latest 2009.11
  linux: multi-kernel: Fix softlinks - squashme
  ti-dsplib: Add TI 64x+ DSPLIB support to OE
  ti recipes: Start moving /files into package specific directories
  ti-codecs-dm6467: Recipe align with omap3/omapl/dm6446
  gstreamer_ti: Patch dm6467 config to remove multiple cs servers
  ti-codecs-omapl138: Fix DMA resource allocation in DSP Server
  linux-davinci_git: Latest kernel DA8/OMAPL + improved hawkboard support
  ti-codecs-dm355: Align with other codec recipes
  ti-dspbios: Add latest DSP/BIOS 5 - 5.41.03.17
  ti-xdctools: Add latest XDC Tools 3.16.03.36
  ti-sysbios: Initial Support for BIOS 6 (6.21.01.16)
  ti-codecs-dm355: fix checksums
  ti-dsplink: Add support for DM6446 build (~ from Niclas)
  ti-recipes: Remove old unused patches/files, cleanup /files
  linux-davinci: Update da8xx/omaplxx to latest commits, remove merged patch
  ti-recipes: Remove temporary (previously) commented (unused) variables
  ti-dsplink: Add support for OMAPL137
  ti-dmai: OMAPL137 include path fix for 2.6.33
  ti-codecs-omapl137: Use L138 codecs for public URL and patch
  gstreamer-ti: Update for OMAPL137 support
  linux-omap-psp_2.6.32.bb : Use multikernel, add 3 framebuffers
  gstd/freondemo: Align with arago file locations
  ti-dsplink: Remove old patches and old untested recipe
  ti-codecs-omap3530: Use real version number, remove duplicate
  ti-recipes: Shoot ti-multimedia-common.inc, move inside ti-paths.inc
  ti-codecs-omap3530: Go back to old binary
  gstreamer-ti: Add IRQ/EDMA module RRECOMMENDS
  freondemo/gstd: Add updates from latest RR recipes

Roman I Khimov (2):
  update-rc.d.bbclass: add dependency on update-rc.d-native
  clamav: remove versions <0.95

Roman Khimov (1):
  rootfs_ipk.bbclass: run preinst/postinst scripts with "-e"

Scott Garman (1):
  libnids: Upgrade to 1.24

Sergey Lapin (2):
  afeb9260: move to recent kernel
  util-linux-ng-blkid: proper busybox blkid replacement

Siebren Hakkesteegt (2):
  cm-x300: add machine configuration
  linux 2.6.31: add cm-x300 support

Stefan Schmidt (3):
  lowpan-tools_git.bb: Bump SRCREV to get segfault fixes
  imote2-image.bb: Add imote2 image with lowpan-tools and ibrdtn
  smartq5.conf: Fix NAME and DESCRIPTION

Steve Sakoman (1):
  alsa-state: update asound.state for beagle, omap3, and overo to reflect asoc

Tom Rini (2):
  dtc: Add flex-native / bison-native to DEPENDS.
  var_src_uri.xml: Update the git entry to include branch and SRCREV

Vitus Jensen (1):
  dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)

Vladimir Sorokin (1):
  libio-socket-inet-perl: update to latest version

koen.kooi@gmail.com (2):
  kernel bbclass: convert to new style staging (from poky)
  recipes/linux: convert users of do_stage_append to new style staging

t.fromm (1):
  linux-2.6.24: deactivate the LEON co-processor for hipox machine


=====================================================
OE weekly changelog for holger/staging-branch, 2010-04-12 to 2010-04-19


=====================================================
Bugs fixed:
bug_id resolution        short_desc
5385 FIXED       Package fso-console-image - 1.1 - r1 fails in do_rootfs

Bugs opened:
bug_id resolution        short_desc


