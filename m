Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LoeOJ-0000SE-5z
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 15:52:35 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1677757ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=neSzVCwbdmO64VreIi/fnRYe6lOXHmpN7BIWEbRwcFo=;
	b=iTxRfN8wKf5kFyHr2wfVfAgataLyhVNc/YdgicLMYb14H2XWXwSZSY1wHdYPe5hkNS
	hl/nodRzVrA4CJN0gZYFDv1A5uKyieLMq2FcTbJ2YKlrxNnteG1+rjZADEryXh5ep0ji
	VUkA1zlnM4AeXaDvOYgLMe0DtmuZ0+AOfYHkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BkQk7B523iUpQPuEigBhPCiSObAmr+CMqrsaVjDZslOHCrWoCxkg96+60cqCTxbpbe
	KQKfY8o1n6pThhSc4OsVpR4aRsH+Th6l96qU02lcBShndvX0hrWPGeQ08xwoY2BT8Pyo
	zm+yLjcDTXv9LvF0NXj4KtH5GJHNLFQhneBDg=
MIME-Version: 1.0
Received: by 10.151.42.10 with SMTP id u10mr12354116ybj.18.1238507422270; Tue, 
	31 Mar 2009 06:50:22 -0700 (PDT)
Date: Tue, 31 Mar 2009 09:50:22 -0400
Message-ID: <f96d234e0903310650m23e2c1due90915a2764dd9ec@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-03-23 to 2009-03-30
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
X-List-Received-Date: Tue, 31 Mar 2009 13:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-03-23 to 2009-03-30

Andrea Adami (9):
      wl500g.conf: fix include
      zaurus-2.6.inc: fix for KERNEL_IMAGETYPE (and allow uImage)
      c7x0.conf: set UBOOT_MACHINE_c7x0 =3D "corgi_config"
      spitz.conf: set UBOOT_MACHINE_c7x0 =3D "akita_config"
      spitz.conf: fix typo
      zaurus-clamshells: add mtdparts info in $machine.conf
      zaurus-clamshells: minor cleanings (machine-overrides unneeded)
      spitz.conf: add note abour max rootfs size
      zaurus-clamshell.inc: add UBOOT_ENTRYPOINT and UBOOT_ADDRESS

Charles Cl=E9ment (1):
      python-pyrex_0.9.8.5.bb: Point SRC_URI to the updated location.

Chris Larson (4):
      base.bbclass: Abort early if localpath() was unable to find a
local file for the url.
      base.bbclass: rstrip the git branch/revision.
      bitbake.conf: resurrect FILESDIR, didn't intend its complete
removal just yet.
      Revert "cross.bbclass: set autoconf's program prefix to keep
TARGET_SYS and TARGET_PREFIX decoupled"

Frans Meulenbroeks (2):
      linux-omap-2.6.28: relaxed timeout values for SD cards

Graeme Gregory (3):
      linux_2.6.29.bb : new version, tosa support added.
      zaurus-2.6.inc : use linux as the tosa kernel instead of linux-rp
      linux_2.6.28, linux_2.6.29-rc6 : demote tosa for these recipes

Ihar Hrachyshka (1):
      libzip: new recipe

Jeremy Lain=E9 (29):
      linux-2.6.27: update patches for boc01
      qt4-x11-free, qt-embedded: stage mkspecs
      {qt4e,qmake2}.bbclass: fix definition of QMAKESPEC
      hostap-daemon: package version 0.6.9 (from Adrien Demarez)
      qmake2-native: don't touch the target's directories
      qmake2-native: install mkspecs for native packages
      qt4-native: add package to replace qmake2-native and uicmoc4-native
      qt4-native: add qt-config.patch from qmake2-native
      qt4-native: rename to qt4-tools-native
      qt4: make use of qt4-tools-native instead of qmake2-native and
uicmoc4-native
      qt-embedded: rename to qt4-embedded for consistency
      qt_staging.inc: fix symlink to qmake
      neuros-*: don't force DEPENDS, let qt4e.bbclass handle it
      qt4-x11-free: drop obsolete versions as per oe-devel
      qt4: unify patches, drop obsolete files, fix mkspecs
      qt4-tools-native: stage mkspecs for the host platform
      qt4: consolidate include files into qt4.inc
      python-pyqt: only apply patches for qreal on arm/mips machines
      qt4: overhaul packaging and staging rules
      qmake2.bbclass: remove gratuitous export of QMAKE_RCC
      qt4: add initial version of qt4-tools-native 4.5.0
      qt4: refresh some patches against qt 4.4.3
      qt4: drop obsolete patch
      qt4-embedded: move patch for 2bpp support
      qt4-tools-native.inc: prune PR definition
      qt4: add qt4-x11-free version 4.5.0
      qt4-embedded: add version 4.5.0

Khem Raj (10):
      libxml2-native: Move EXTRA_OECONF to do_configure_prepend
      distutils-base.bbclass: Move common functionality to
distutils-common-base.bbclass
      linux-libc-headers_2.6.29.bb: Add 2.6.29 kernel headers recipe.
      strace_4.5.14: Do not include linux/dirent{64}.h
      strace_4.5.15: Replace the use of linux/dirent{64].h
      linux-omap_2.6.28.bb: omap5912osk's default preferred kernel.

Koen Kooi (25):
      kirkwood: clean up kernel and machine file a bit
      Angstrom feed sorter: add sheevaplug
      busybox: fix linuxrc link and put it in a seperate package
      angstrom preferred versions: remove libosip version that no-one
can explain
      midori: disable hildon interface
      linux-omap: add recipe for 2.6.29 and update git version to that
as well
      libsoup: fix packaging to keep upgrade paths sane, bump PR on
affected packages
      dmai, cmem: bump PR for kernel change
      kernel.bbclass: stage more files
      linux-omap 2.6.28: bump PR
      ti-dmai: fetch from svn
      dsplink: bump PR on recipes for kernel changes
      gnome-keyring: update to 2.26, adjust packaging accordingly
      packagekit: add 0.4.5
      sane-srcrevs: bump opkg revision
      webkit-gtk: bump SRCREV
      x264: fix a few bugs
      midori: update to 0.1.5 and workaround an issue with the
abomination called 'waf'
      midori git: use git instead of snapshots
      fluxbox: add 1.1.1, remove old versions
      angstrom feed builder: add fluxbox
      libtasn1: add native version
      gnome-keyring: depend in libtasn1-native to get access to needed
binaries
      dsplink: add support for all omap3 boards using the 'armv7a'
override

Leon Woestenberg (10):
      x264: now uses upstream revision number. added --extra-cflags
for beagleboard.
      yasm: New recipe. x86 assembler.
      x264: Enable using yasm-native for x86 machine.
      yasm: New recipe.
      contrib/dependsgraph: Shell script showing simple depends graph.
      ltp: must use configure now; see INSTALL.
      minimal-image: respect ANGSTROM_EXTRA_DEPENDS.
      ltp: Fix two QA issues; .debug leak and GNU_HASH.
      contrib/dependsgraph: Use dot instead of neato.
      x264: Remove do_configure override.

Marcin Juszkiewicz (4):
      netbase: added eth0=3D192.168.7.2 for qemuarm/qemux86 (from Poky)
      checksums.ini: added some new entries
      linux: moved vortex86sx to 2.6.29

Michael 'Mickey' Lauer (5):
      linux-msm7xxx: enable framebuffer console rotation for htcraphael
      zope-interfaces: new recipe; standalone Zope interfaces for
extension products
      zope-3.3.1.inc: -> zope.inc
      linux-msm7xxx: add more useful options to htcraphael defconfig
      sane-srcrevs: bump EFL and add known-good for vala-native-git

Mike Westerhof (1):
      SlugOS: set preferred versions for openssl and openssl-native

Philip Balister (2):
      iperf_2.0.2.bb : Convert to use .inc file
      iperf_2.0.4 : Add new version of iperf. Iperf measures network bandwi=
dth.

Robert Schuster (10):
      llvm 2.5: Fixes
      classpath-native 0.98: Set DEFAULT_PREFERENCE to -1.
      classpath-native 0.97.2: Retrieved back from
595952e9bbff5d25c370fd140d58c3aae9434690.
      llvm 2.5: Updated patch to include preprocessor definitions.
      cacao 0.99.3: Added stackbase fix patch.
      checksums.ini: Added toppler 1.1.3 entries.
      toppler 1.1.3: New recipe.
      - added contrib/presentations folder
      Using_OpenEmbedded_to_build_embedded_Linux_distribution_May2009_FreeE=
lectrons.odp:
      /me wonders how could that have been slipped in ...

Stefan Schmidt (6):
      checksums.ini: New sums for connman, wpa-supplicant and openbmap
      connman: Add version 0.14 and 0.15
      wpa-supplicant: Add version 0.6.9
      openbmap: Add version 0.2.0

Steffen Sledz (3):
      u-boot: homepage updated
      linux-2.6.24: tiny jffs2 compile bug for OXNAS machine fixed
      hipox: new machine added (derived from oxnas)

Theodore A. Roth (2):
      doc/usermanual/chapters: Replace references to packages dir with
recipes dir.
      class_siteinfo.xml: Replace packages/ with recipes/.

Tick Chen (1):
      mokoko: fix the broken bb file SRCPV -> SRCREV

Tim 'timtim' Ellis (1):
      mpeg-encode: Fixup makefile to use the right strip

woglinde (6):
      wrap: fix tuning
      uclibc-0.9.30.1: enable UCLIBC_HAS_GETPT
      taglib: update to version 1.5 and using cmake for build
      libtheora: don't build the examples
      scons: honor PARALLEL_MAKE
      wrap: update defconfig, dont use input

Bugs fixed:

bug_id resolution        short_desc
2190 FIXED       Missing dependancy for evince (gamin)
2570 FIXED       invalid platform packages in repository for gpe-login-loca=
le-cs
3532 INVALID     gpe-conf serial (gpe-conf - 0.2.6-r1)  writes own
/etc/gpsd.conf
3764 FIXED       bluez-utils-3.24 do_install failed
4131 REMIND      gtk+-directfb broken depends?
4298 FIXED       kexec-tools-static-1.101-autobuild
4544 FIXED       unlock uImage for Zaurus-clamshells
5013 FIXED       python 2.6 fails do_compile for bigendian machines
5030 INVALID     klibc-1.5 build failed
5070 FIXED       webkit-gtk compilation problem
5071 FIXED       New recipe for toppler
5074 FIXED       git repo for kexecboot has moved

Bugs opened:

bug_id resolution        short_desc

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


