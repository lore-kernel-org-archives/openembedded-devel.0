Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L9hap-0002KT-0M
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 16:00:15 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1276144rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=dIO9hi+tWzsoS5gufvR9rOKN5O0EE54URY1iIZMNJBA=;
	b=jZDGVnuhlzNS1M/98zgkPVU/VLF39wdN9QulN44wejc4JHM+ytOhbxMV/LpNGPXYUA
	1NKh2EYAr6NhVQ81sIW6OMyFR7DsJisludUeaUevABfxNtJOzq26YAYlqUH0zWMNzaIo
	koI/KnDp8GjtfoM/AooMiWnvwZ9Au0ZiLzR84=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=QzjoIv3ghyh+QL8lMqjvccQTHdWomcy/7k1guN5J57hNNci34LKAruzNxPDmap+2hC
	a1epnmeOsfKKqINmDg5AlRT5zBz1fYSzRRS8HEeRaAeyiC3UWAeFsoV0d6r099q5n7Pd
	CvVdwLFAkVl7l1duED9sPRuwiCwLoxg3CdVmI=
Received: by 10.141.175.10 with SMTP id c10mr1691218rvp.127.1228748182044;
	Mon, 08 Dec 2008 06:56:22 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Mon, 8 Dec 2008 06:56:22 -0800 (PST)
Message-ID: <f96d234e0812080656h1c9bdb2egf8e7db113224457d@mail.gmail.com>
Date: Mon, 8 Dec 2008 09:56:22 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-12-01 to 2008-12-08
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
X-List-Received-Date: Mon, 08 Dec 2008 15:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-12-01 to 2008-12-08

Bernhard Guillon (3):
      opie-xqtlauncher: added recipe
      xqtlauncher: added convert and cleanup scripts and .desktop files for=
 them
      xqtlauncher: removed xqtlauncher-xkbd-desktop and updated
task-xqtlauncher to fit the change

Carsten Haitzler (Raster) (15):
      ecore: fix package version to match src
      edb: fix package version to match src
      edbus: fix package version to match src
      edje: fix package version to match src
      eet: fix package version to match src
      efreet: fix package version to match src
      embryo: fix package version to match src
      emotion: fix package version to match src
      esmart: fix package version to match src
      ewl: fix package version to match src
      elementary: include test app .desktop and icon in package
      illume-image: update packages to reflect contents
      e-wm: sysactions package is "all" archs, not machne-specific and
preload.a is not used for anything at all. not even dev.
      essemtial-dialer: add swisscom essenital dialler
      libefso: add fso + edbus wrapper library package

Chris Larson (1):
      src_distribute.bbclass: Unbork do_distsrcall, fixes the issue
seen by Rob Tow.

Cyril Humbert (1):
      udev-124: Fix firmware loader script name and bump package PR (from

Dmitry Baryshkov (14):
      sharprom-compatible: update to reflect current toolchain classes
      zaurus-updater: add support for home partition reflashing
      liblinebreak: Unicode line breaking library
      libopie2: add patch to keep up with changed tosa kernel interface
      linux-rp-2.6.24: update tosa defconfig
      apm-tosa-suspendfix: tosa-specific suspend w/around
      tosa: add apm-tosa-suspendfix to MACHINE_EXTRA_RRECOMENDS
      task-base: bump PR as I've changed tosa MACHINE_EXTRA_RRECOMENDS
      gphoto2: correct popt selection madness
      claws-mail: stage headers to let claws plugins compile
      claws-plugin-mailmbox: update to reflect the current Gtk API
      checksums: new checksum for claws-plugin-mailmbox
      claws-plugin-rssyl: fix compilation
      qemu-svn: fix hw/baum.c compilation

Holger Hans Peter Freyther (5):
      tichy: This project moved from svn to git, catch up
      bind: Add bind version 9.3.6
      task-openmoko-feed: Add bind-utils to the feed
      coreutils: Build and package df of coreutils
      coreutils: Make version 6.0 compile by applying a futimens patch as w=
ell

Jeremy Lain=E9 (2):
      linux-2.6.26: cleanup backport of Freescale NAND controller
      linux-2.6.26: update patches for boc01 machine

Jonas Bonn (1):
      gcc, gcc-native 3.4.6 : Fix O_CREAT permissions for -D_FORTIFY_SOURCE

Khem Raj (6):
      sane-srcrevs: Bump sane uclibc svn version which compiles
      libgpg-error: Add virtual/libiconv to DEPENDS
      angstrom-uclibc: Use gettext as PREFERRED_PROVIDER for virtual/libint=
l
      sane-srcrevs:  Bump sane svn versions of uclibc and eglibc
      angstrom-*libc: Disable GNU hash style for mips.

Kir Kolyshkin (1):
      vzctl: add 3.0.23 + patch for arm

Koen Kooi (83):
      gcc 4.2.4, 4.2.4: fix bug #4893
      octave: ARM_INSTRUCTION_SET =3D "arm"
      opencv cvs: ARM_INSTRUCTION_SET =3D "arm"
      linux 2.6.28rc6: fix versioning.
      linux 2.6.28rc6: kernel_version is a reserved var, change it to
kernel_release
      illume image: start cleaning
      angstrom feed sorter: don't run script if there are no packages to so=
rt
      opkg(-nogpg): bump SRCREV to 4838
      angstrom feed builder: add armv6-novfp
      beagleboard demo image: include more linguas
      fontconfig: bump PR for cache change
      linux-omap: add recipe to build 2.6.27
      linux-omap git: bump SRCREV
      xf86-video-omapfb: bump SRCREV for scaling tweak
      linux-omap: add recipe to build 2.6.26
      gcc: gcc 4.2.4 needs a different gfortran patch that 4.3.x
      omap3evm: change XSERVER to Xorg
      angstrom-x11-base-depends: bump PR
      u-boot git: update neuros git repo and bump SRCREV
      linux-neuros: update git repo and bump SRCREV
      policykit: add 0.9 from poky
      packagekit git: make it work again with the current opkg
      policykit-gnome: add 0.9.2
      packagekit: add 0.2.4 release
      gnome-packagekit: add 0.2.5
      pointercal: add file for omap3evm
      angstrom feed uploader: symlink packages instead of copying
them, this saves the autobuilder from moving ~8GB per upload run.
      nokia800: Xomapfb doesn't build and is deprecated, switch to
xf86-video-omapfb
      policykit: create polkituser
      xserver-xorg-conf: make sure nokia800 uses xf86-video-omapfb
      policykit: fix c/p error spotted by Philipp Zabel
      artoolkit: fix typo in DEPENDS
      tinylogin: move u-a prio above busybox so 'su' works again, also
remove links on removal
      linux-davinci: updates:
      gdal: ARM_INSTRUCTION_SET =3D "arm"
      mime.bbclass: check whether update-mime-database is executable
before trying to call it and move prerm to postrm
      mime bbclass: RDEPEND on share-mime-info since we want to run its uti=
ls
      mime.bbclass: inform user that u-m-d will take a while
      shared-mime-info: put freedesktop.org.xml in its own package
      mime.bcclass: automagically add RDEPENDS on package containing
freedesktop-mime-info when detecting the need for it
      nautilus, blurz-gnome: bump PR for mime change
      mythtv: ARM_INSTRUCTION_SET =3D "arm"
      tracker: stage everything
      nautilus: enable tracker backend
      policykit: fix another c/p error
      bitbake.conf: add QEMU_OPTION for armv6-novfp
      emacs.inc: use QEMU_OPTIONS
      glibc-package.bbclass: add -s 1048576 (yes, it's a hack) to qemu
args to work on x86_64 hosts
      angstrom-version: include branch and revision
      dsplink, lpm, cmem: bump PR to force rebuild
      gnome-cups-manager: update to 0.33
      gamin: disable python (it wasn't in DEPENDS before) to stop
-I/usr/include/python25 leaking into the build
      mime.bbclass: fix confusing bb.note
      gvfs: update to 1.0.3
      nautilus: add 2.24.2
      glib-2.0: add 2.18.3
      angstrom 2008: prefer glib 2.18.3 to fix mime handling in GIO
      djvulibre: add 3.5.21
      evince: enable nautilus extension and thumbnailer
      angstrom feed builder: add geda
      xserver xorg: split of Xfbdev to make it parallel installable with kd=
rive
      gimp: add 2.6.3
      mime-support: update to 3.44
      beagleboard demo image: move stuff to a tasks to prevent entries
in IMAGE_INSTALL getting dropped
      readline: update to 5.2
      readline: sync with poky
      parted: update to 1.8.8
      omap3evm: fix virtual/xserver
      parted: fix calloc test
      gparted: update to 0.4.1
      gvfs: fix QA issue in configure
      task-beagleboard-demo: include openssh-scp and openssh-ssh
      linux omap git: update to 2.6.28rc7
      linux omap git: add patch for fix recording on TWL4030 codecs
      orbit2: add 2.14.16
      mythtv 0.21: bump PR
      qt3x11: bump PR
      linux-msm7xxxx: fix upgrade paths
      xscreensaver: enable more screensavers, add 'xscreensaver-hacks'
meta package
      linux-omap 2.6.27: add openvz patch and enable it in the defconfig

Lukas Gorris (1):
      htcdiamond, htcraphael: update machine configs and kernel defconfigs

Marcin Juszkiewicz (6):
      collie-kernels: mark this old Sharp crap as collie only
      checksums.ini: added some entries
      oprofile: move common stuff to oprofile.inc
      oprofile: ship only ARCH related support - saves 1.8MB (from BugLabs)
      generate-manifest-2.5.py: generate python-modules package
      python: generate 'python-modules' package to simplify
installation (from BugLabs)

Michael 'Mickey' Lauer (13):
      gpsd: provide virtual/gpsd
      linux-openmoko[-devel]: bump srcrevs and add netdev LED trigger
patch from openwrt bugtracker
      sane-srcrevs.inc: bump freesmartphone srcrevs and xglamo
      toscoterm: make it compile for the target and add SRCREV entry
      sane-srcrevs.inc: s/=3D/?=3D/ to give people a chance to override rev=
isions
      ezx-boot-usb-native: catch up with new developments & remove
outdated versions
      alsa-state: add state files for MOTO a780
      e-wm: sync version number with upstream; patch from Rasterman
      evas[-native]: sync version number with upstream
      sane-srcrevs.inc: bump EFL and add sane SRCREVs for libefso and
essential-dialer
      imlib2: sync version with upstream
      essential-dialer: cosmetic fix
      evas-native: DEPEND on eina-native

Mike Westerhof (7):
      meta-toolchain: Preserve value of PACKAGE_ARCHS
      linux-ixp4xx: defconfig-2.6.24 - renamed nslu2 version of the
      udev: slugos - add loop devices to blacklist, bump PR
      linux-ixp4xx: bump PR
      slugos-init: drop boot/kexec, alway mount /proc and /sys
      slugos-init: remove last traces of /boot/kexec
      slugos-init: cleanup work, eliminate a warning messages at boot time.

Otavio Salvador (2):
      initramfs-uniboot: split load_modules to allow the module
loading to be customized
      toscoterm: (new) a very simple and small VTE based terminal

Paul Sokolovsky (18):
      initramfs-module-kexecboot: Fix kexec argument order so it works
for any libc.
      dropbear-backdoor: Set of files to provide passwordless root
access for dropbear.
      initramfs-module-bootmenu: If dropbear available, start it if
user drops to shell.
      busybox-static 1.11.3: Initial add, configs are copies of
non-static version.
      busybox-static 1.11.3: Actually enable static option.
      klibc-utils-static 1.5: modprobe should live in /sbin
      initramfs-bootmenu-image: busybox' modprobe is broken, so pull klibc'=
s.
      initramfs-bootmenu-debug-image: A version of
initramfs-bootmenu-image with dropbear included.
      task-devimage: Pull in kernel symlink.
      linux-handhelds-2.6: Add more verbose message about KERNEL_INITRAMFS_=
PATH.
      linux-handhelds-2.6-2.6.21: Update from defconfigman r446
      linux-handhelds-2.6_2.6.21-hh20: Disable CONFIG_LOCALVERSION_AUTO.
      linux-handhelds-2.6 2.6.21-hh20: Typo fix.

Robert Schuster (15):
      classpath 0.97.2: Updated gtk-fix patch.
      midpath: Updated all recipes to rc2.
      checksums.ini: Updated midpath entry (rc1 to rc2).
      preferred-om-2008-versions.inc: Updated to midpath rc2.
      openttd: Updated to 0.6.3.
      checksums.ini: Removed openttd entries not available as recipes
any more, added 0.6.3.
      preferred-om-2008-versions.inc: Set preference of openttd to 0.6.3.
      sane-srcrevs.inc: Removed wesnoth entry (we do not have a
wesnoth-svn recipe).
      wesnoth: Updated to 1.4.6.
      checksums.ini: Updated wesnoth entry to 1.4.6.
      midpath-core 0.2+03rc2: Added patch to fix file opening.
      boost 1.34.1: Use proper python include and library location.
      Cleanup of recipes.
      checksums.ini: Cleaned up and updated dbus-java entries.
      midpath-core 0.2+0.3rc2: Updated fix-openfile patch to what was
committed upstream.

Sergey Lapin (4):
      u-boot_git: updated rev for afeb9260
      linux_2.6.28: made source fetchable after Koen's fix
      at91bootstrap: afeb9260 support, cleanup

Stanislav Brabec (6):
      Added checksums for geda and emacs.
      guile: Created cross-compilation capable guile-config.
      guile: Package Emacs lisp files as guile-el.
      geda: Updated and packaged complete toolchain version 1.4.1.
      emacs: Update to version 22.3. Simplified build. Use GTK+.
      geda: Fixed mime support. Disabled static library.

Stefan Schmidt (3):
      openmoko-calculator2: Add license as band-aid to get it build
      connman: Add the 0.1 "Nikolaus" release

Steffen Sledz (2):
      checksums.ini: add ethtool-6 (additional location)
      vmware machine : We want to include 'tune-pentiumpro.inc' not
'pentiumpro.inc'

Stian Skjelstad (1):
      e-wm usage of RDEPENDS_${PN}_append_linux etc failes to generate
proper depency graphs for *image.bb

Tom Rini (2):
      gdb, gdb-cross, gdb-cross-sdk 6.8 : Pull in a patch from Ubuntu
for gcc-4.3
      gcc, gcc-native 3.4.6 : Oops, O_CREAT was already fixed

woglinde (6):
      linux-2.6.27: start to port the simpad patches
      qtnx: put the key.id to the right place and bump PR
      qtnx: ship a .desktop file as well and bump PR again
      qtnx: somehow the qtnx.inc change was not commited
      linux-2.6.27: porting simpad patches to linux-2.6.27

=D8yvind Repvik (7):
      storcenter: Update machine config
      lsppchd/lsppchg: Update machine configs
      linux-storcenter: Remove ancient kernels with patches, update to
vanilla 2.6.27.7
      samba:
      samba:
      turbostation/linkstation: Split turbostation machine config into
correct ones. Add lsmipsel and lspro machine configs
      bftpd:

Bugs fixed:

bug_id resolution        short_desc
2134 WONTFIX     Tosa Angstrom x11 image  suspend/resume failure
4015 DUPLICATE   dsniff-2.3-autobuild
4914 FIXED       atftp SRC_URI changed
4335 FIXED       netperf 2.4.4 does not build against eglibc
4782 FIXED       Checksum for libftdi-0.13 missing.
4878 FIXED       msm machine update/cleanup
4913 DUPLICATE   ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise
requires the runtime entity
'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but it wasn't found in
any PACKAGE or RPROVIDES variables
4915 FIXED       e-wm usage of RDEPENDS_${PN}_append_linux etc failes
to generate proper depency graphs for *image.bb
4765 FIXED       Better updated support for mx31moboard machine

Bugs opened:

bug_id resolution        short_desc
4916     gnome-panel fails to build


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


