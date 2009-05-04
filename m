Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M11KX-0007M3-1E
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 18:47:50 +0200
Received: by gxk25 with SMTP id 25so6933202gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 May 2009 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/Bi0zI65VGU0+gZ5p3UsiVY459hcnlCzyZBMcp+7FJM=;
	b=J0hA0qghdbcp55Y+gKo6bBq1WJGKtuT6KlYU3AtYz/0fcn8SowIlvnn2RB2GunY/zJ
	ccwvNIpFR0VaIvyRLIR7I3432YETxouDyh/7OaYswpg6D6J/b3gDbESve8a+Rao8Ix9D
	C3oVptZr/bw/9ulJGPh0iAPLT9KUampBwNenw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fI8hV3XERLsSSokM+ne77WoZwer1CZrL5WcrlXWqc5WrpHKaNQPAH71f5P/inP6oOM
	028csm/XbYiXUQXMhGMhkShLbspF9PEdgMJm1DRtCUDtAxosXjLAqsz7239yG2MySCC5
	n5InqGXTTHfwsFBQSNKcPQOhG7icG0XkJgaHM=
MIME-Version: 1.0
Received: by 10.151.75.13 with SMTP id c13mr12459140ybl.152.1241455301441; 
	Mon, 04 May 2009 09:41:41 -0700 (PDT)
Date: Mon, 4 May 2009 12:41:41 -0400
Message-ID: <f96d234e0905040941m177a54ffvfe091a6c04929100@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-04-27 to 2009-05-04
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
X-List-Received-Date: Mon, 04 May 2009 16:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-04-27 to 2009-05-04

Andrea Adami (35):
      initramfs-kexecboot-image: just deploy cpio.gz
      zaurus-2.6.inc: deploy installkit only for kexecboot kernel
      zaurus-clamshell.inc: fix u-boot addresses for akita/spitz
      zaurus-2.6.inc: fix typo in installkit
      linux_2.6.29+2.6.30-rc: move to rc3
      kexecboot-cfg: fix tabs and typo
      linux-kexecboot.inc: force CONFIG_KEXEC=3Dy just in case
      Zaurus machines: reorganize configuration files
      nandlogical: Fix GNU_HASH QA error - Bump PR
      nandlogical-static: actually build static...
      nandlogical-static: remove bogus PR
      zaurus-2.6.inc: force creation of jffs2 images
      ipaq-sleep: don't strip during install
      gpe-question: don't strip during install
      gpe-othello: don't strip during install
      gpe-nmf: don't strip during install
      gpe-lights: don't strip during install
      gpe-go: don't strip during install
      gpe-soundbite: don't strip during install
      gpe-calculator: don't strip during install
      libdisplaymigration: Makefile fix - don't strip on install
      gpe-confd: Makefile fix - don't strip on install
      xst: Makefile fix - don't strip on install
      gpe-su: Makefile fix - don't strip on install
      minilite: Makefile fix - don't strip on install
      keylaunch: Makefile fix - don't strip on install
      gpe-taskmanager: Makefile fix - don't strip on install
      teleport: Makefile fix - don't strip on install
      gpe-autostarter: Makefile fix - don't strip on install
      gpe-soundserver: Makefile fix - don't strip on install
      gpe-aerial: fix Makefiles - don't strip on install
      teleport: reorder patches for old version 0.33 (still breaks compilin=
g)
      gpe-autostarter_svn: remove 'no strip patch' and hope they fix upstre=
am
      minilite: fix whitespaces
      teleport_0.33: refactor SRC_URI - package breaks on do_compile

Denis 'Gnutoo' Carikli (2):

Frans Meulenbroeks (1):
      added netkit-ftp to angstrom feed

Graeme Gregory (11):
      recipes/unifdef/files/unifdef.c : more modern glibc expose getline fr=
om
      linux-libc-headers_2.6.23.bb : more modern glibc expose getline from
      recipes/opkg/files/configure : fix the case where this is no
splash installed.
      xserver-xorg-conf_0.1.bb : add configuration for om-gta02
machine
      sane-srcrevs.inc : update xf86-driver-glamo git rev to latest
      base-files_3.0.14.bb : fix the om-gta02 fstab and bump the PR
      hal/hal.inc : change hardcoded etc to ${sysconfdir} and remove
bogus directory
      icu/icu-3.6.inc : fix bad #elif that more modern compilers dont
accept.
      fennec_hg.bb : add sqlite3 dependency that is needed by fennec
      uclibc_0.9.30.bb : add fix for unifdef for modern gcc/glibc
combos.

Gregoire Gentil (1):
      gst-omapfb: add recipe to build gst sink for the omapfb overlay

Jeremy Lain=E9 (1):
      qt4: make Qt 4.5.1 the default version

Koen Kooi (6):
      linux-kirkwood: update to 2.6.29.1 and enable some goodies like
mmc and ubifs
      sheevaplug: add ubifs params
      cherokee: fix init script, daemonize is '-d', not '-b'
      netkit-ftp: Fixed GNU_HASH QA error.
      ekiga: add git version
      zaurusd: point tskeys to the real ts device instead hardcoding
it to event1

Leon Woestenberg (5):
      linux-rt-2.6.24: Apply latest -rt patch for all, except mpc8315e-rdb.
      madwifi-ng_r3837: Use LDFLAGS to fix QA GNU_HASH issue.
      ltp-20090131: Added upstream fix for missing non-x86 syscalls.
      madwifi-ng: Recipe whitespace fix.

Marcin Juszkiewicz (4):
      genext2fs: added 1.4.1 version
      buildbot config: simplified a lot and cleaned
      bitbake.conf: make MACHINE_KERNEL_PR defaults to PR

Marco Cavallini (1):
      Modified kaeilos distro configuration

Martin Lund (1):
      Initial add of micro linux dist

Mike Westerhof (11):
      SlugOS: arm-kernel-shim - ensure that the rootfs is mounted with
"noatime" option
      SlugOS: preferred-slugos-versions - get rid of overrides for
openssh, fixed upstream.
      SlugOS: slugos.inc - ensure that the rootfs is mounted with the
noatime option
      SlugOS: slugos-image.bb, initscripts-slugos_1.0.bb - remove
devfs support
      SlugOS: refactor slugos images and tasks to support a standard
and extended image.
      nslu2 machine configs: do not inherit machine-specific image
class
      SlugOS: images - create nas100d and dsmg600 .bin firmware files
with slugos-extd image.
      SlugOS: nas100d-image.bbclass - use nslu2 kernel; we no longer
generate machine-specific kernels.
      SlugOS: make sym-links to the images image-specific.
      SlugOS: remove any kernel images from boot, not just zImages.
      SlugOS: make some of the image dependencies machine-specific.

Rod Whitby (4):
      ixp4xx: Remove proprietary Intel ethernet driver.
      Unslung: Removed all trace of the unslung distro from OE
      oe-stylize: Remove Unslung distro reference

Roman I Khimov (8):
      bitbake.conf: fix parallel build for gzip'd images
      binutils: add binutils-x86_64_i386_biarch.patch
      coreutils: add version 7.2
      coreutils-native: remove autotools and quilt dependencies
      coreutils-native: make mandatory dep for all packages
      remove install-native package
      bridge-utils: remove old versions
      bridge-utils: add version 1.4

Stanislav Brabec (9):
      encdec-updater: GNU_HASH QA fix.
      mtkbabel: Allow to set faster logging.
      mtkbabel: Allow to set faster logging.
      opkg_svn.bb: Explicitly package datadir/opkg/intercept (not
happens automatically for opkg-nogpg).
      subversion: Build with the latest libtool.
      bluez-gnome: Update to version 1.8.

Steffen Sledz (3):
      linux-2.6.24: defconfig for hipox machine updated
      mii-diag-2.11: GNU_HASH QA fix
      bonnie++: GNU_HASH QA fix

Tom Rini (11):
      licenses.conf: Add strings for GPL/LGPLv3 and LGPLv2.1
      buildbot master.cfg: Fix location of Angstrom images for
cleaning and full builds start from scratch
      uClibc: Always enable PTHREADS_DEBUG_SUPPORT
      insane.bbclass: Split package_qa_check_devdbg and don't run -dev
check on SDK packages.
      gcc-3.4.x: Rename gcc-posix.patch to gcc-posix-open-fix.patch,
put in files/
      gcc (various): Drop incomplete LDFLAGS patch and really honor
them, bump PR
      gcc 4.0.0: Fix fortran building, disable libmudflap/ssp, add
gcc-posix-open-fix.patch, add missing cross-initial/cross-intermediate
files, really honor LDFLAGS, bump PR
      gcc 4.0.2: Disable libmudflap/ssp, add gcc-posix-open-fix.patch,
really honor LDFLAGS, bump PR
      gcc-4.1.0: Use patches from 4.1.1, really honor LDFLAGS, bump PR
      gcc-4.3.x: Really honor LDFLAGS, bump PR.
      base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first.


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


