Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M3t7U-0004gc-6T
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 16:38:12 +0200
Received: by yw-out-1718.google.com with SMTP id 9so3462ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ti3k0Nka5qesMMpxEle05vJ6ggSJhFOSMg6LS7uGV/w=;
	b=RiulXAYGI3zmwf77G1afW15N+7Wp2vMjeEHVisAnWt1UYCbXbLxT3rx3BUZSL3QkEw
	bo5DGJFB9t3X4MmHEduz8hSEoZ4LkShLviJFKqHHXgCJTOlhiaZqPVlTy1Aei4SJL3me
	oRjwoQjqSZyShM8jaH7BPq45D+rWUJUYuetMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=t+KrBMO6fRmMuTBxx+vEO4INeLn1G2OZASLHOgikRAZm2W3YkewqavBrS5Fi934wY2
	nHb1p9Z1mEIMe4ILAgRYVchCpSeTpXGnZAeVPaRa9dxv7ssnBP4DI5qinDNhiK3qxSUS
	WJGJF0kTJRwdK4yi6z/mKtWZqQj8FOA3U+mGQ=
MIME-Version: 1.0
Received: by 10.150.151.13 with SMTP id y13mr8967425ybd.267.1242138692817; 
	Tue, 12 May 2009 07:31:32 -0700 (PDT)
Date: Tue, 12 May 2009 10:31:32 -0400
Message-ID: <f96d234e0905120731g27c8d20arde93e76edb06daa@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-05-04 to 2009-05-11
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
X-List-Received-Date: Tue, 12 May 2009 14:38:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-05-04 to 2009-05-11

Andrea Adami (12):
      teleport: remove unused 0.33 version (broken atm - may 2009)
      teleport_0.33.bb: remove from checksums.ini
      gpe-su: remove unused versions
      gpe-su: remove unused entries from checksums.ini
      zaurus-installer: add new package for installkit creation
      zaurus-2.6.inc: fix installkit creation on first build
      initramfs-kexecboot-image: simplify EXTRA_IMAGEDEPENDS = ""
      zaurus-2.6.inc: set ERASEBLOCKSIZE_spitz = "0x20000"
      zaurus-clamshell.inc: remove unused KEXECBOOT_IMAGEDEPENDS
      gpe-clock: skip fix-install patch: sources are ok since 0.27
      gpe-mixer: fix Makefile - don't strip on install
      startup-monitor: fix makefile - don't strip on install

Cliff Brake (2):
      libart-lgpl: fix install issue, switch to INC_PR scheme
      libart-lgpl: remove INSTALL variable as install should be
provided by autotools

Denys Dmytriyenko (1):
      udev 124: disable dev cache on akita, c7x0, spitz and tosa

Dmitry Eremin-Solenikov (2):
      at91sam9g20ek: use the dataflash config
      kernel.bbclass: also stage include/trace if it's available

Florian Boor (9):
      gpe-conf: bump RV in svn recipe
      sane-srcrevs.inc: update gpe-conf
      gtk+: Fix preferred 2.14.2 like 2.16.0: stage gtk-builder-convert
      gpe-announce: Add 0.14
      checksums.ini: add gpe-announce 0.14
      xdemineur: Don't do "install -s"
      gsoko: don't do "install -s"
      gpe-clock: Add 0.27
      checksums.ini: Add gpe-clock 0.27

Khem Raj (1):
      liboil_0.3.15: Consider the soft-float case.

Koen Kooi (13):
      u-boot: add dfu patches for beagleboard
      evas: make splitting magic match PACKAGES_DYNAMIC
      ti-dmai: bump SRCREV to support a wider range of kernels
      checksums.ini: add some checksums
      ecore: bump PR
      webkit-gtk: bump SRCREV, fix gtk-doc, fix packaging
      midori: add 0.1.6
      libcanberra: fix packaging and DEPENDS
      telepathy: update empathy and telepathy bits
      linux-omap: update beagle defconfig to include TT_NEWSCHED and
tweak overo PM config
      pixman: add git version
      angstrom-gpe-task-base: move themes to RRECOMMENDS

Marcin Juszkiewicz (6):
      base.bbclass: added 'gcc-3.4' to list of gcc3 versions (Debian systems)
      Revert "bitbake.conf: make MACHINE_KERNEL_PR defaults to PR"
      sane-srcrevs.inc: bump linux-bug to get Ethernet using MAC from U-boot
      linux-bug: switch to proper SVN branch
      u-boot-bug: Added U-Boot for BUG (from BUG Labs SVN)

Michael Smith (1):
      rootfs_deb: make Packages.gz, not Packages.bz2.

Mike Westerhof (3):
      netpbm: remove -s on install (sigh)
      logrotate: remove -s on install
      monit: add patch to remove -s in install.

Philip Balister (4):
      ortp-0.13.1 : Add later version of ortp. Convert to use .inc.
      u-boot_git.bb : Update FILESPATHPKG to include u-boot-git directory.
      checksums.ini : Sort checksums.
      gnuradio : Stage files so we can build other packages that use gnuradio.

Robert Schuster (3):
      cmake-native 2.6.4: New recipe.
      checksums.ini: New cmake 2.6.4 entry, removed unused cmake entries.
      llvm2.6-native 2.5+svnr20090504: New recipe.

Roman I Khimov (1):
      qemu: add version 0.10.3, initial

Steve Sakoman (6):
      gpe-plucker: Fix install
      gpe-plucker: Add patch
      gpe-announce: Fix install: don't do install -s
      gpe-clock: Fix install: Don't do install -s
      gpe-tetris: Fix install: don't di install -s
      gpe-watch: Fix install: don't do install -s

Tom Rini (16):
      Add distro inc files for eglibc, glibc and uclibc.
      glibc: In various old recipes add RPROVIDES virtual-libc-dev, bump PR.
      All distro conf files: Use LIBC to pick or set your libc.
      All distros: Bring in conf/distro/include/${LIBC}.inc
      gcc: For 4.2.2 and newer, set LICENSE = GPLv3
      alsa-lib: This is LGPL not GPL
      binutils: 2.18 and newer is GPLv3, add GPL to 2.14.90.[67]
      gettext: 0.17 is GPLv3
      gmp: 4.2.4 is GPLv3 LGPLv3
      gdb: 6.8 is GPLv3
      gnutls: The 'extra' lib (and package) is GPLv3
      libiconv: 1.12 has GPLv3 binaries LGPLv2.1 libraries
      mpfr: Both GPL and LGPL components
      samba: 3.2.8 and newer is GPLv3
      m4: 1.4.11 and 1.4.12 are GPLv3

Bugs fixed:

bug_id resolution        short_desc
5092 FIXED       rootfs_deb fails unless bzip2 is in /bin/bzip2 on the
build host


-- 
=======================
Cliff Brake
http://bec-systems.com


