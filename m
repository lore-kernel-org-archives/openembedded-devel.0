Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OjE26-0005a9-87
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 18:20:06 +0200
Received: by wyb38 with SMTP id 38so313148wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vUx+N7XDBn/tfBFuPLpFNbVR6cSgAP2VwHheSnvBAio=;
	b=WZxcNSFU8xq0TwlchwkKgl9Dt/dqz1W0lathrAaHRy8/xsJ9jKv9iD+eBeLI+pKK2I
	kDKUAEHPdmPB7xFZRcfUjTP8QtvQFq8DMcCWlTjrDVXGZ74/MCMkMSnVL1tZOd6md+2e
	IGc+5/e2t1z6gmL9vevm5PCrUVNSEhRuH8eg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AP4j6qhx7V1PxPr3+XumELTwHbRnyay+tB+WZVBME32L4FYaAOmqttJpTyoC3izntP
	nAfxMnT61WJUuhx0JEyQjJzCDpQ0UHEqpC0qapHkwti8pMMfbV6rjSJPtYSfua1C50Bm
	9V1NnKKc0zX7b6WQdiyJJL6rZo9RNTnbJAogQ=
MIME-Version: 1.0
Received: by 10.216.180.200 with SMTP id j50mr5545381wem.36.1281543586993;
	Wed, 11 Aug 2010 09:19:46 -0700 (PDT)
Received: by 10.216.234.166 with HTTP; Wed, 11 Aug 2010 09:19:46 -0700 (PDT)
Date: Wed, 11 Aug 2010 12:19:46 -0400
Message-ID: <AANLkTinV7DYRXaTmXAe2KkUv6jOByBRY6wyqQpjBkk+U@mail.gmail.com>
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
Subject: OE weekly changelog 2010-08-02 to 2010-08-09
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
X-List-Received-Date: Wed, 11 Aug 2010 16:20:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-08-02 to 2010-08-09

Adrian Alonso (11):
  xilinx-bsp: Rewrite to handle xilinx virtex4 virtex5 targets
  linux-xilinx: kernel configs for virtex4 virtex5 targets
  linux-xilinx: kernel recipe for xilinx virtex platforms
  u-boot-xilinx: uboot for xilinx virtex4 virtex5 targets
  xilinx-virtex4: Add machine config for Xilinx Virtex4 platforms
  xilinx-virtex5: Add machine config for Xilinx Virtex5 platforms
  initscripts: functions machine id xilinx virtex5 platforms
  xorg-xserver-conf: virtex5 machine support
  xserver-common: xilinx virtex support
  xserver-kdrive-common: Xsever module_id for virtex5 platform
  xserver-kdrive-common: xilinx virtex5 support

Andrea Adami (2):
  klibc: get rid of legacy staging
  Revert "klibc: get rid of legacy staging"

Bernhard Reutner-Fischer (1):
  perl: use only one method all_perl_packages

Chase Maupin (5):
  distribute_license: added class to copy license files
  base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
  matrix-gui-e: added chvt to init scripts
  37x-evm: remove USE_VT from am37x-evm and dm37x-evm conf
  matrix-gui-e: bump PR for init file fixes

Chris Larson (3):
  rootfs_ipk.bbclass: install the package manager in a separate pass from the
  rootfs_ipk.bbclass: add support for PACKAGE_INSTALL_ATTEMPTONLY
  Recipe fixups for package_dbg usage

Denis 'GNUtoo' Carikli (2):
  libsdl-mixer: fixed the absence of ogg support(because of a libmikmod issue)
  linux-leviathan: bump git revivion and PR

Denys Dmytriyenko (2):
  strace: add latest 4.5.20 version
  gst-ffmpeg: use immediate var expansion of TOOLCHAIN_PATH for PATH_prepend

Dirk Opfer (4):
  owfs: 2.7p28 -> 2.8p0      remove legacy style staging
  argp-standalone: Remove staging null ops
  pthsem: 2.0.7 -> 2.0.8      Get rid of legacy staging
  linknx: 0.0.1.26 -> 0.0.1.27      bump version number of cvs recipe

Elena Grandi (1):
  xapian-core: add BBCLASSEXTEND = "native" and remove -native recipes.

Enrico Scholz (7):
  neon: updated 0.26.0 to 0.29.3
  libfakekey: get rid of legacy staging
  libmatchbox: get rid of legacy staging
  ncurses: added 5.7 recipe
  jpeg: updated to version 8b
  readline: added 6.1 recipe
  readline: apply the patches...

Frans Meulenbroeks (28):
  500+ recipes: remove do_stage
  sane-backends: removed legacy staging
  freetype: removed 2.1 version
  squashfs-tools: added dependency to attr/attr-native
  attr: added BBCLASSEXTEND = "native"
  divmod.inc: added INC_PR
  python-divmodepsilon: removed legacy staging; moved to BBCLASSEXTEND = "nati
  glib-2.0: removed several old versions
  intltool: removed old versions
  wxwidgets/wxbase: remvoed 2.6.4
  zziplib-native: removed
  lirc: removed old recipes
  gphoto2: removed 2.1.x > 4 years old; not pinned
  u-boot: calamari: moved to 2010.06 version
  tar: removed 1.13.93
  xslt: deletel 1.1.17: very old, not pinned
  python-docutils: removed legacy staging, converted to BBCLASSEXTEND
  yasm, migrate to  BBCLASSEXTEND = "native"
  abiword: deleted some old versions
  m4: removed 1.4.4 and 1.4.11 (old, unused)
  apt: removed some very old versions
  openssl: removed old 0.9.7 versions
  python-pygobject[-native]: removed old 2.14.2 version
  python-cython[-native] removed 0.10.3
  sip-native: removed a few old versions
  apt: removed 0.7.2
  urjtag: new recipe
  urjtag: fixed license (GPL -> GPLv2)

Graham Gower (3):
  opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
  package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg.conf
  Remove redundant dependencies upon opkg and opkg-collateral.

Henning Heinold (4):
  uclibc: try to fix isnan and bump PR
  uclibc: use GENERIC_ARM, because we override the cpu flags anyway, bump PR
  java-library.bbclass: workaround for staging when BBCLASSEXTENDED is used
  openjdk: update the unused-backtrace-patch for uclibc

Henri Bragge (2):
  recipe for gsnmp-0.3.0
  recipe for scli-0.4.0

Jason Kridner (2):
  linux-omap-psp_2.6.32: Move camera sensor reset
  linux-omap-psp: Add camera bootarg

Khem Raj (26):
  bitbake.conf,cmake.bbclass,cross.bbclass,icecc.bbclass: Point the toolchain
  binutils-cross.inc: Dont install duplicate copies of tools create relative s
  gcc,eglibc: Use the paths for mutli-machine safe toolchain install.
  recipes: Fix the PATHs for toolchains.
  mpfr_3.0.0.bb: Override needs to be thumb instead of armv4t
  uclibc_git.bb: move to latest git tip.
  mesa_7.2.bb: Tinker DEBUG_OPTIMIZATION to avoid gcc ICE
  xcb-proto: Get rid of legacy staging.
  popt: Use BBCLASSEXTEND instead of native recipes.
  openobex_1.5.bb: Get rid of legacy staging
  gupnp_0.12.5.bb: Get rid of legacy staging
  gupnp_0.13.1.bb: Get rid of legacy staging
  device-mapper_1.02.28.bb: Get rid of legacy staging
  recipes: inherit autotools instead of autotools_stage
  autotools_stage.bbclass: Delete
  netkit-telnet_0.17.bb: Add -lncurses to LDFLAGS
  gtk+_2.20.1.bb: Ask for ARM_INSTRUCTION_SET to be 'arm'
  qemu: Add 0.12.5
  libftdi: Upgrade to 0.18
  confuse: Add recipe for 2.7
  ftdi_eeprom: Add recipe for version 0.3
  elfutils_0.89.bb: Remove.
  uclibc++_0.1.9.bb: Get rid of legacy staging.
  sox: Get rid of do_stage and use BBCLASSEXTEND
  klibc: Get rid of legacy staging.
  eglibc_2.12/eglibc_svn: Update SRCREV to latest tip.

Koen Kooi (22):
  fftw: remove legacy staging
  libidl: remove really old versions
  angstrom-uboot-scripts: bump PR
  opkg: first stab at restoring upgrade paths
  samba: enable mmap for *glibc build and aio (thru -lrt) for everyone
  samba.inc: remove legacy staging
  xscrensaverh: convert to new style staging
  davinci.inc, omap3.inc: bump MACHINE_KERNEL_PR
  linux-omap-psp 2.6.32: remove duplicate patch
  netbase: add custom interfaces file for beagleboard
  cpuburn-neon: add NEON burn app
  intltool: remove legacy staging
  eds-dbus: add missing dep on libical
  eds-dbus: work around crosscompile badness
  libglade: kill legacy staging
  libdisplaymigration: kill legacy staging
  gpe-ownerinfo: kill legacy staging
  u-boot: fix beagle patch names
  mpeg2dec: kill legacy staging
  libgsm: kill legacy staging
  angstrom: jpeg 8b doesn't build, prefer 6b for the time being
  linux-omap-psp 2.6.32: fix SRC_URI indentation

Martin Jansa (24):
  gcc-4.5: bump SRCREV after 4.5.1 release
  eglibc-2.12: bump SRCREV for alignment traps fix
  xorg: bump latest versions from 2010-08-02
  xorg-xserver: new style staging
  linux: add 2.6.35
  linux-kexecboot: add 2.6.35
  linux-openmoko-2.6.34: add patch for proper gsm sysfs node path
  maxima: oe-stylize
  task-shr-feed: use MACHINE_ARCH, because glamo-dri-tests is only for om-gta0
  shr: add PREFERRED_PROVIDER_virtual/libgl
  linux-openmoko-2.6.32: upgrade stable patch to 2.6.32.17, move more stuff to
  libgee-0.5.2: fix SRC_URI for -native
  libxi: move to 1.3.2 with fixed ASCIIDOC test
  linux-openmoko-2.6.34: move to 2.6.34.2, modularize defconfig as 2.6.32 is n
  linux-openmoko-2.6.32: remove CONFIG_DEBUG_FS from defconfig
  bitbake.conf: subversion cmds, remove --trust-server-cert and add --force, -
  eds-dbus: reenable calendar, was disabled in svn->git transition commit (no
  shr: prefer ncurses 5.7
  shr: prefer ncurses 5.7 also for native
  Revert "rootfs_ipk.bbclass: install the package manager in a separate pass f
  recipes: bump PR for packages depending on jpeg which changed .so name with
  calibrateproto: fix qa_staging
  task-shr-feed: add xfsprogs
  task-x11: fix PACKAGE_ARCH override for task-x11-server, _pn- didn't work it

Martyn Welch (1):
  Comedilib: Add version 0.8.1

Michael 'Mickey' Lauer (2):
  libgee: refactor into common inc file and add 0.5.2 release
  minimal.conf: Revert "minimal.conf: Dont redefine OVERRIDES"

Richard Purdie (11):
  binutils: Clean out unneeded do_stage functions
  gcc-cross-kernel: Convert do_stage to do_install (from Poky)
  gcc-native: Convert do_stage to do_install
  gdb: Drop empty do_stage functions
  cross.bbclass: Drop automatic stage function and associated gcc dummy stub
  chicken-cross: Remove do_stage
  modutils-cross: Convert do_stage to do_install (from Poky)
  xorg-font: Remove null op staging functions
  calibrateproto: Convert do_stage to do_install
  shasum: Convert do_stage -> do_install (from Poky)
  cairo/libsvg/xsvg: Remove staging null ops

Robert Schuster (15):
  jamvm-native 1.5.4: New version.
  avalon-framework-api-native: Remove     bsf-native: Dito.     log4j1.2-nativ
  commons-logging-native: Deleted.     commons-net-native: Deleted.     common
  jacl-native: Deleted.     jacl: BBCLASSEXTEND="native"-ified.
  jsch-native: Deleted.     jzlib-native: Deleted.     jsch: BBCLASSEXTEND="na
  jaxp1.3-native: Deleted.     xml-commons-resolver1.1-native: Deleted.     xm
  gnujaf-native: Deleted.     gnumail-native: Deleted.     gnujaf: BBCLASEXTEN
  commons-net: Added missing BBCLASSEXTEND="native"-ification.
  commons-logging: Use += instead of append.
  inetlib-native: Removed.     inetlib: BBCLASSEXTEND="native"-ified.
  xerces-j-native: Deleted.     xerces-j: BBCLASSEXTEND="native"-ified.
  xalan-j-native: Deleted.     xalan-j: BBCLASSEXTEND="native"-ified.
  inetlib: Fixed monkeywork typo.
  * outdated classpath recipe removal spree:     classpath-minimal 0.96.1: Rem
  classpath: Unified remaining recipes.

Roman I Khimov (23):
  openldap: update 2.4.21 to 2.4.23
  byacc: kill -native recipe, replace with BBCLASSEXTEND
  libprelude: new recipe
  snort: merge Altell packaging fixes
  libgcrypt: remove version 1.1.91
  openldap: remove versions 2.2.29 and 2.3.11
  libgpg-error: remove versions 0.6 and 0.7
  libhtp: new recipe
  pf_ring: add recipes for PF_RING kernel module and userspace library
  suricata: new recipe
  barnyard2: new recipe
  bitbake.conf: trust server certificate when doing svn over https
  libpfring: remove deprecated patch options
  lib(html-mason|log-dispatch|module-build)-perl: remove do_stage no-ops
  libparams-validate-perl: update to version 0.95
  barnyard2: remove deprecated patch options
  libpcap: remove deprecated patch options
  tcpdump: remove deprecated patch options
  geda-gattrib: remove deprecated patch parameters
  yaffs2-utils: remove deprecated patch parameters
  tiff: remove version 3.7.2
  cramfs: remove -native recipe, replace with BBCLASSEXTEND
  poptop: remove version 1.3.0

Scott Garman (1):
  tar: Upgrade to v1.23

Sebastian Krzyszkowiak (1):
  shr-theme-niebiee: add phoneui-shr-theme-niebiee to RDEPENDS

Stefan Schmidt (2):
  pointercal: Add bug20 support and bump PR
  firmware: Add recipe to work with the marvell-sdio-tf-fw

Steffen Sledz (2):
  rsyslog: new version 5.5.6
  libunwind: --enable-debug-frame is needed for arm

Tom Rini (2):
  bitbake.conf: Don't export 'LIBC' to the environment
  postmark: A benchmarking app, add.

Vladimir Sorokin (2):
  corosync: new version 1.2.7
  shadow: added new package shadow-group. Fix for build with uclibc.

jkridner@beagleboard.org (5):
  angstrom-uboot-scripts: added default boot scripts
  beagleboard-test-image: added ramdisk
  beagleboard-test-image: add cpuburn-neon
  u-boot: beagleboard: default 3MP camera support
  angstrom-uboot-scripts: fixed tests for revision

sledz (1):
  rsyslog: break potential infinite loop in actionDoRetry


=====================================================
OE weekly changelog for holger/staging-branch, 2010-08-02 to 2010-08-09


=====================================================
Bugs fixed:
bug_id resolution        short_desc
5133 FIXED       do_rootfs hangs when opkg-cl asks for input
5338 FIXED       Task failed : opkg-native_svn.bb


