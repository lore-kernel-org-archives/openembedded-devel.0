Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OVt0P-0001eY-Of
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 23:15:12 +0200
Received: by iwn34 with SMTP id 34so5868712iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=5468uX3L9aNiGfPRbj3+ZyMP38/5zufJshYNbzwjOzE=;
	b=jIb4BvPKfMSF2U4DboFuJdRub3iGLfQD6MnHme04bQ+t7hz6kYyQ7mv36qV0pXJxn2
	dCYCILH0fVxkBE1lz2qJgftdze2fN/HfIcZq65fYGtTl6GL9QW/JVK7a3ynF0xzTpe7u
	ciqmUFcnEV+IRfJfriiL5nvcqhRR4mAlLhDtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JLwM0oZQxN64lpl4Gmk1KVnKzN/tpzJcKjIFaA4bHrdysCcVDdLR05vWmNzsFz5hAQ
	ss864DnzUlV/8UFQRHzSJKP0idCadha7lzohPR4yeKpB4RJ9t1bFHApVdEEBxfVXp7VR
	KuczzgthQ3+d0I2tPrSRx9nSeI2QBTPitUGeg=
MIME-Version: 1.0
Received: by 10.231.40.6 with SMTP id i6mr3612118ibe.26.1278364220977; Mon, 05 
	Jul 2010 14:10:20 -0700 (PDT)
Received: by 10.231.15.196 with HTTP; Mon, 5 Jul 2010 14:10:20 -0700 (PDT)
Date: Mon, 5 Jul 2010 17:10:20 -0400
Message-ID: <AANLkTimPLCEiGnof9VfJjaMtbXDwGtkLLI7OGXDqZOgC@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-06-28 to 2010-07-05
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
X-List-Received-Date: Mon, 05 Jul 2010 21:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-06-28 to 2010-07-05

Andrea Adami (1):
  kexecboot_git: bump to 485ff04f432115f41b09b39d06ce524b960bfa29

Brijesh Singh (3):
  ti-dsplink.inc: fix dsplink staging include path.
  ti-linuxutils: update recipe to build edma and irq module on dm355 platform.
  ti-dmai_2.05.00.14: add new recipe

Dirk Opfer (2):
  busybox: 1.16.1 -> 1.16.2 (new stable)
  busybox 1.16.2: Fix udhcpd and udhcpc in config     Starting with version 1.

Dmitry Eremin-Solenikov (5):
  libxsettings-client: switch to using INC_PR
  libxsettings-client: use xsettings-common.h from libxsettings-dev
  xcb-proto: allow empty xcb-proto
  libxsettings: bump PR to force rebuild to restore xsettings-common.h in sysr

Frans Meulenbroeks (1):
  tgt: upgraded to 1.0.6

Graham Gower (7):
  qemumipsel.conf: Add qemumipsel support, based upon qemumips.
  dbus: fix building on mipsel and clean up PIE/pie fix to work again.
  xserver-kdrive_1.5.3.bb: add openssl to DEPENDS.
  xserver-kdrive_1.5.3.bb: enable the XCALIBRATE extension.
  gnupg_1.4.10.bb: fix build on mips(el) with recent gcc.
  x264_r2245.bb: fix build for mipsel (duplicate the mips fix).
  tcl_8.5.8.bb: fix build for mips/mipsel.

Henning Heinold (2):
  xalan: fix staging und bump PR
  llvm: fix packaging and bump PR

Khem Raj (17):
  eds-dbus: Update to follow git repository.
  spectrum-fw.bb: Change SRC_URI to somewhere fetchable.
  realpath: Add recipe for version  1.15
  gdb-common.inc: Use FILESPATHPKG in place of FILESDIR.
  gypsy_0.7.bb: Point SRC_URI to updated tar file location
  realpath_1.15.bb: Fix ERROR: QA Issue with realpath: No GNU_HASH in the elf
  devicekit-power: Update the SRC_URI to something fetchable.
  contrib/qemu/run-qemu.sh: Dont search for hdimage when doing a nfsboot
  gcc-4.5: Make gcc-cross build for ppc target
  gcc-svn: Dont disable long double 128 for ppc
  uclibc_git.bb: Bump to latest master.
  gcc-4.5: BUMP INC_PR not BINV
  klibc_1.5.18: Fix the build for x86 on newer kernels.
  v86d: Add recipe for 0.1.9
  sane-toolchain.inc: use 4.4.4 as PREFERRED_GCC_VERSION for armv7
  libpam-1.1.1: Dont use innetgr on uclibc as its not there.
  recipes: Punt use of patch=1 and use striplevel=n instead of pnum

Klaus Kurzmann (1):
  linux-openmoko-2.6.32_git.bb: add a patch to make jack input events work

Koen Kooi (21):
  libxcb: bump PR
  xcb-proto: allow empty ${PN}, otherwise all the xorg -dev packages are broke
  cheese, gnome-python-desktop, empathy, totem-pl-parser: bump PR due to eds-d
  opencv-dsp-acceleration: recipe for the GSoC2010 opencv-dsp project: http://
  efl: bump SRCREV to 49934
  gnome-python-desktop: fix DEPENDS
  angstrom: prefert python-pycairo 1.8.0
  python-pycairo 1.8.0: convert to new style staging and install headers in pr
  libmodplug: convert to new style staging
  xbmc: add recipe to build xbmc from the gsoc-2010 branch, WIP
  xbmc: fix description, as pointed out by xbmc developers
  xbmc: more recipe cleanups
  xbmc: build a slightly more standard version
  jamvm-initial 1.4.5: fix dependencies, see http://tinderbox.openembedded.org
  xbmc: fix version and fixup python lib
  xbmc: add missing deps, bump SRCREV
  qt4-embedded 4.7.0b1: add WIP recipe     qt4-e 4.7b1: make it thru configure
  angstrom-jalimo: add config file tailored to building jalimo stuff for angst
  ti-dmai 2.10.00.10: fix damage introduced by 927721f66e7c2c5b5024ce0a17cd31c
  devicekit-power: use a source location that doesn't change, matches the old
  devicekitpower: since this is based on a git snapshot, run gtkdocize in conf

Lukas Gorris (3):
  [linux-qsd8] update srcrev, defconfig
  [xorg-xserver] add xorg.conf for machine htcleo
  devicekit-power: use same old official release tarball but with correct URI

Marco Cavallini (1):
  kaeilos-2009-preferred-versions.inc: updated packages version

Martin Jansa (27):
  matchbox-keyboard*: drop RPROVIDES
  opie-taskbar-images: fix RPROVIDES
  elmdentica: temporary bump EFL_SRCREV only for elmdentica, please remove wit
  elmdentica: remove temporary SRCREV bump -> use EFL_SRCREV again
  linux-openmoko-2.6.34: add patch for resume
  elementary: fix packaging names and version like evas does
  eet: fix version
  libpthread-stubs: add version 0.3 and convert to new staging
  xserver-xorg-1.8.99.903: add patch for segmentation fault while adding modes
  xf86-video-glamo: add patch for segmentation fault while adding modes withou
  recipes: PR bump after EFL SRCREV change resulting to different .so names.
  libphone-ui-shr: fix packaging
  xf86-video-glamo: add missing patch
  linux-openmoko-2.6.34: update mci resume patch a bit
  linux(-kexecboot): bump SRCREV for git recipe and decrease D_P a bit more
  xf86-video-glamo: better patch for nonDRM kernels
  xserver-xorg-1.8.99.903: update patch for freedesktop #28824
  mcnavi: add 0.2.10
  EFL: bump SRCREV a bit more for tasn's fix for Arabic shaping
  xf86-video-glamo: bump SRCREV, remove applied patch
  libphone-utils: move phoneutils_test to separate package to keep debian pack
  busybox_1.16.2: increase D_P for shr
  xserver-xorg: remove CVS recipe and patches used only there, xserver is in G
  xserver-xorg: remove 1.8.0, keep 1.8.1 as 1.8 representative
  xserver-xorg: upgrade 1.9 RC3 to RC4
  linux(-kexecboot): bump SRCREV and remove applied patch
  qi: add om-gta0* overrides to build qi only for right cpu

Michael 'Mickey' Lauer (3):
  vala: 0.9.1.1 -> 0.9.2.1
  dbus: 1.3.0 -> 1.3.1
  fsogsmd: apply patch only for openmoko devices

Mike Westerhof (1):
  SlugOS: slugos-packages - add dbus and bluez-libs     and documentation chan

Robert Schuster (4):
  llvm2.7 2.7: Split packages for each shared library.
  llvm: Removed 2.5 and 2.6 and both native variants.
  llvm.inc: Moved packages dynamic stuff into the general llvm.inc file.
  llvm2.7 2.7: Changed patch URL to new format.

Roger Monk (17):
  ti-codec-engine: Add CE 2.25.04 and CE 2.25.05
  ti-codec-engine: Force makefile regeneration for complete 'clean'
  ti-xdctools: Add Latest XDC Versions (3.16.04, 3.16.05, 3.20.01)
  ti-linuxutils: Add Latest Versions 2.25.03, 2.25.04(incl.support for 2.6.34)
  ti-framework-components: Add Latest FC Version (2.25.02)
  ti-dspbios: Add Latest DSP/BIOS 5.41.08
  ti-biospsp: Add Preliminary Support for (DSP)/BIOS PSP (Platform Support Pac
  ti-audio-soc-example: Add DSP based audio pass-through example for OMAPL (v.
  ti-eula-unpack: Temp Remove Version Check which is broken in some installers
  ti-codecs-omap3530: Add latest codec server (v.1.01)
  dm3730-am3715-evm: Add x-loader MACHINE name
  am3517-evm: Machine config cleanup
  omap3evm: Cleanup machine config
  u-boot_git: Update TI OMAP/AM machines to latest commits ~PSP 3.01.00.06
  x-load_git: Update TI OMAP/AM machines to latest commits ~PSP 3.01.00.06
  x-load: Remove early (alpha) am3517 x-loader recipes and files
  uboot: Remove early (alpha) am3517 u-boot patches

Stanislav Brabec (2):
  grep: Fixed xz unpack dependency.
  mc: Prefer native libglib-2.0.so.0 over host one in runtime linking of man2h

sledz (1):
  linux-2.6.24: enable DEBUG_FS and USB_MON for hipox machine


