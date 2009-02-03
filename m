Received: from [209.85.198.230] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LUO8V-0000yf-Fk
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Feb 2009 17:28:39 +0100
Received: by rv-out-0506.google.com with SMTP id g9so1413028rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Feb 2009 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=XTpNoMzIErR1ulAweq7GKIQu4UVjuHfOeqJng5P8P5Y=;
	b=vpasyL9qfCMJYUm1oErJX5U+0yE9Mqe9Rm2LyUTnJ5IShGqfmoU1TDNdQHAVtNIy/0
	Xh6dJhICs11Lbvd4h3Wnx5qQUSwkwWE2QrhdYcaJEWUh4rwf2QhcXxHz/c8CALnMqpp3
	iPVOwt7hdRcvEGjlWv0I62BEifewv3L2OuPq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=uwBUZzVFhdOj4rQVHWXpYk+nlesFlRo6hZjuZvGA/Ye+4CnqVT0xN04lST5OJ19JOU
	SBr7iDk4PFEOK5ADJRZKkcQQLdTeQPZ5rwn0ousZGBzajtlVyX44BtGpd2DaODVztmwn
	tlEdOSO9S0agRPCqhWPTegW38fh6OQsp6s8tM=
MIME-Version: 1.0
Received: by 10.141.71.14 with SMTP id y14mr3042967rvk.131.1233678025098; Tue, 
	03 Feb 2009 08:20:25 -0800 (PST)
Date: Tue, 3 Feb 2009 11:20:25 -0500
Message-ID: <f96d234e0902030820x7e0da7c3nf5e4f7a0a33f66ba@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-01-26 to 2009-02-02
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
X-List-Received-Date: Tue, 03 Feb 2009 16:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-01-26 to 2009-02-02

Andrea Adami (23):
      linux-kexecboot.inc: revert 71d21c5e379ab3f5d754a967a52240963552a71c
      linux-kexecboot_2.6.26: revert 71dade0cdaef0220d31a309d8b6d28b99eb25b=
29
      linux-kexecboot-2.6.26: defconfig fixes
      linux-kexecboot: bootlogo patches
      kexecboot: add new (beta) release 0.4 and add patches from upstream
      kexecboot: remove kexecboot-0.3
      kexecboot: delete initramfs-kexecboot
      device-table-minimal: add last 4 mmcblk0 devices (p4-p7)
      linux-kexecboot: add bootlogo for collie and poodle
      linux-kexecboot: remove 2.6.23 (for zaurus c700 testing only)
      checksums.ini: remove kexecboot-0.3
      kexecboot-0.4: add logo for framebuffer menu - bump PR
      kexecboot: fix framebuffer mini-logo(s) background color
      zaurus-2.6.inc: require kexecboot for all Zaurus models
      linux-rp: update defconfig for spitz
      linux-rp: massive defconfig update
      base-files: fix fstab for Zaurus machines now booting with kexecboot
      linux-rp-2.6.24: set DEFAULT_PREFERENCE=3D "1"  for all Zaurus models
      device-table-minimal: add mmcblk0p7 (last allowed)
      linux-kexecboot-2.6.24: defconfig-rework for Zaurus clamshells
      linux-rp-2.6.24: defconfig-rework for Zaurus clamshells
      linux-kexecboot-2.6.24: rework defconfig for poodle, akita, spitz
      linux-kexecboot-2.6.26: rework defconfigs for zaurus clamshells

Cliff Brake (10):
      checksums.ini: add checksums for gpio-event
      checksums.ini: added checksum for char-driver
      socketcan: initial recipe for socketcan kernel modules
      MAINTAINERS: add socketcan to my entry
      socketcan-modules: cleanup, remove commented out code
      module.bbclass: add common make options to module_do_install()
      misc kernel module recipes: add note suggesting not using kernel
source from work dir
      socketcan-modules_svn: modify SRC_URI to be compatible with
socketcan-utils-test
      socketcan-utils-test_svn: add initial recipe for socketcan userspace =
apps

Dmitry Baryshkov (3):
      linux-kexecboot: support tosa
      tosa: enable kexecboot
      linux-rp-2.6.24: reenable ide-cs and ext3 on tosa

Frans Meulenbroeks (14):
      cwiid: added HOMEPAGE to recipe
      libwiimote: added HOMEPAGE
      checksums.ini: removed some junk at the end
      gphoto2: updated to 2.4.4
      libexif: updated to 0.6.17
      cdparanoia: updated to 10.2
      ekiga_3.1.0: added dependency on gnome-doc-utils
      libtorrent: updated to libtorrent 0.12.4 and rtorrent 0.8.4
      alsa-utils: added missing PR =3D and bumped it

Graeme Gregory (11):
      checksums.ini : add more checkums for zaurus patches
      kexecboot/kexecboot_0.4.bb : add refreshed patches from Dmitry
Baryshkov for
      tosa.conf : clean up kexecboot and enable tar.gz images
      kexecboot_0.4.bb : tweak the tosa support to draw menu the right way
      tosa.conf : add to IMAGE_FSTYPES instead of just setting it
      connman-gnome_0.4.bb : add connman-gnome so we can attempt to control
      angstrom/build-feeds.sh : add connman and connman-gnome
      connman-gnome_0.4.bb : use gtk-icon-cache class
      kexecboot_0.4.bb : add patch to always use 16bit writes, this fixes t=
osa
      package_deb.bbclass, rootfs_deb.bbclass : merge in poky changes
to these classes that make sure correct files end up on rootfs
      rootfs_deb.bbclass : fix merge problems where I removed ${libdir}

Henry von Tresckow (1):
      sg3-utils: add 1.24

Ian Rickards (1):
      pixman 0.13.2: and patch for NEON fastpaths

Ihar Hrachyshka (2):
      Added base pnx833x stb225 board support.
      Reworked stb225 machine configuration file; build uImage for stb225.

Jan L=FCbbe (5):
      remoko: bump to SVN revision 121 and update base version
      moko-autorev: remove entry for no longer existing linux-openmoko pack=
age
      preferred-om-2008-versions: bump connman and python to the current ve=
rsion
      connman: build the depends for the plugin packages
      task-fso-compliance: add connman and plugins now that they build corr=
ectly

Jeremy Lain=E9 (4):
      watchdog: package version 5.4
      checksums.ini: add entry for watchdog 5.4
      boc01.conf: prune extraneous PACKAGE_EXTRA_ARCHS
      checksums.ini: add entry for tcpdump 4.0.0

Klaus Kurzmann (1):
      numptyphysics: depend on libpng

Koen Kooi (52):
      angstrom feed builder: add iscsi-target
      vortex86sx: start machine file for vortex86sx
      angstrom 2009.X: make 486sx use gcc 4.3.2
      linux-omap: make 2.6.28 the default for beagle, this makes both
EHCI and OTG work
      gst-plugins-good: add explicit theora and jpeg depends
      angstrom feed builder: add cdparanoia
      x264: add 20090127 snapshot
      dsplink/: bump PR and fix some depends
      linux-handhelds: remove some stale versions
      linux-handhelds 2.6.21: add mtd back into hx4700 and h2200 defconfigs
      dsplink: fix staging
      linux-kexecboot: add a recipe for 2.6.21-hh20, this should work
all machines the linux-handhelds kernel recipe supports, modulo the
missing mtd support issue for some machines
      dmai: make the build go a bit further
      codec-engine: adjust staging for DMAI
      dmai: make build get a bit further
      bluez-utils 3.36: sync with 3.33
      libdvdcss: disable docs
      beagleboard: remove kernel-modules meta-package , those have no
place in machine.conf
      task-base-usbhost: add asix and pegasus modules
      checksums: add libpcap
      hal, fix packaging:
      bigbuckbunny: add recipes for 480p and 720p mpeg4 asp versions
      bigbuckbunny: fix typos
      kernel.bbclass: move initramfs stuff to configure so we can do
postprocessing on it with do_configure_append
      linux-kexecboot 2.6.21: do postprocessing on initramfs in
do_configure_append
      linux-kexecboot: make hx4700 work
      pointercal: reinstate hx4700 pointercal
      device-table minimal: use increment feature instead of listing each e=
ntry
      initramfs-kexecboot-image: specify custom device tables from
hx4700 and h2200 since those are from the pre dynamic mmc dark ages
      devicetables: when using autoincrement don't specify device number
      hx4700, h2200: band-aid device table to account for the
prehistoric .21 kernel
      bonjour: add 107.6 (from gumstix)
      checksums: add bonjour
      bonjour: make the config file more generic, fix GNU_HASH QA problems
      gnome-icon-theme: update icon cache in postinst
      zaurus-2.6: remove RDEPENDS-kernel-base hackery
      linux-omap: add missing patch
      libsoup: add 2.24.3
      angstrom feed builder: add bonjour
      ekiga: ARM_INSTRUCTION_SET =3D "arm"
      bluez4: also depend on libusb-compat
      omap3-sgx-modules: add patch for DSS2
      angstrom feed builder: add lirc and lcd4linux
      omap3 sgx modules: rip out existing buildsystem and replace it
with something that works
      angstrom 2009.X: use regular toolchain for armv7a kernel builds
      pixman: bump PR for last commit
      linux-omap 2.6.28: bump PR for compiler change

M. Dietrich (3):
      epydial.image: split from moko-underground-image; also zad-image
      bluez-utils: enable more tools
      gdk-pixbuf: remove no-longer-applying patch

Marcin Juszkiewicz (6):
      busybox: fix mdev->busybox-mdev switch (postinst part). Thx to
'pieterg' for spotting.
      conf/machine: EXTRA_PACKAGES_ARCHS cleanup
      checksums.ini: added 2.6.25.20 patch
      linux: enable TX buffers in SRAM on at91sam9263ek - less underruns
      findutils: use update-alternatives properly
      alsa-state: added state for at91sam9263ek board

Michael 'Mickey' Lauer (8):
      python-coherence: new recipe; python multimedia framework
      gnuradion: fix reference to python includedir flags.
      task-openmoko-feed: s/tichy/paroli/
      connman: fix include hickup, add ppp dependency
      python: fix libffi building for mips. Should close #5001
      e2fsprogs: remove bogus recipe in files directory; move 1.41.2
to nonworking (patches not found/not applying)
      linux-ezx all: remove unmaintained kernels
      motorola-ezx-base.inc: openezx-kernel is the new kernel for all
EZX machines

Otavio Salvador (1):
      atftp: use 0.7-6 Debian diff since 0.7-3 has been droped

Philip Balister (9):
      gnuradio : Remove hard coded python version. Bump SRCREV.
      gnuradio : Add dependency on gsl (GNU Scientific Library).
      gsl : Convert recipe to use include file.
      gsl : Add recipe for gsl-1.12.
      gnuradio : Install python files in the proper directory.
      gnuradio : Pass machine specific optimization selection information t=
o
      gnuradio-image : Add image to simplify testing gnuradio on OMAP3 boar=
ds.
      swig : Add recipe for version 1.3.38.
      libnfnetlink : Add bb file to build libnfnetlink-0.0.39

Sergey Lapin (3):
      libpcap: added 1.0.0
      tcpdump: added 4.0.0, minimal support for IEEE802.15.4 capture
      libnl build fix

Stanislav Brabec (2):
      mysql: Provide config cache for ps checks:
      mysql: Provide config cache for ps checks:

Stefan Schmidt (1):
      angstrom.inc: Catch up with openmoko kernel recipe renames.

Steffen Sledz (1):
      busybox-1.11.3: udhcpd script: Do not deconfig network interface
ONLY if rootfs on network

Tim 'timtim' Ellis (19):
      krb5: Add krb5 1.6.3 - the MIT kerberos 5 implementation
      uclibc: Add uClibc.machine for n1200
      krb5: Fix uclibc build issue
      samba: Big clean/fixup of samba including
      MAINTAINERS: Add me.
      n1200: Remove ppc603e from extra archs, already in tune-ppc603e
      lsppc: Remove ppc603e from extra archs, already in tune-ppc603e
      checksums.ini: Add samba 3.3.0
      samba: Rework samba in preparation for separate AD support:
      samba-ads: Add a separate version of samba for active directory
and any other bells and whistles
      samba-ads: Add 3.3.0 and centralise common stuff from 3.2.7 into
an include. Also remove smbfs-ads-doc as these man pages are not
included in these versions.
      samba: Further fixups to samba:
      krb5: Fix issues with do_configure
      checksums.ini: Add vblade 19 and aoetools 29 and sort
      vblade: Add package, ATA over Ethernet target daemon
      aoetools: Add package, ATA over ethernet userspace utilities
      netatalk: Fix non-working package:

Tom Rini (10):
      Merge trini/canadian-merge branch into org.openembedded.dev, fixup a
      mingw-binutils-canadian-cross, mingw-gcc: Add missing Canadian SDK re=
cipes
      tune-cortexa9.inc: Add a tune file for Cortex A9, based on Cortex A8
      package_ipk.bbclass: Add and use IPKGCONF_CANSDK.
      bitbake.conf: Add a full set of SDK variables.
      gcc-package-sdk.inc: Make use of ${EXEEXT}
      canadian-sdk.bb:  Add a meta recipe to assemble a canadian sdk.

woglinde (4):
      libecj: fix download file
      libecj: bump PR
      libecj: update to version 3.4.1
      mtd-utils_1.2.0+git: remove the second docfdisk from the binary list

Bugs fixed:

bug_id resolution        short_desc
2891 FIXED       update udev - current version 118 has serious issues
1052 FIXED       Non optimal default keymap
1396 FIXED       tosa wakes-up from suspend when power is connected
2239 FIXED       Tosa gpe logout makes black screen
2547 FIXED       Collie froze when setting clock
2873 FIXED       the sound driver in kernel 2.6.21 does not work on c7x0
3806 FIXED       Release 2007.12 c7x0 kernel is buggy
4154 FIXED       CDPATH affects base.bbclass
4191 FIXED       c7x0 opie install to flash fails
4214 FIXED       Angstrom c7x0 wpa
4304 FIXED       c7x0 wont resume using linux-rp_2.6.23
4545 FIXED       [RFC] kexecboot on zaurus clamshells (c7x0
5006 FIXED       git server link is broken
4664 FIXED       Canadian SDK support
3886 FIXED       udev-118 initscript is very inefficent
5001 FIXED       python 2.6 fails to compile


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


