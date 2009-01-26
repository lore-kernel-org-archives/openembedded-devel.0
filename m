Received: from [209.85.217.21] (helo=mail-gx0-f21.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LRT4j-0000VB-Qs
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 16:08:34 +0100
Received: by gxk14 with SMTP id 14so4877304gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ZYtRnwbWMuZOCVwKmKq6wD5PyTFxOlMcI1+P0ZYgEoA=;
	b=fGVqhC23Ba1f8BY/4afJKD4ZVeB6Z4sn4VV76jONYRsgyarpMbcVUk/zwrAJtTuwBc
	jtI/Nbt2IYu7RlQiZG0zCSZN9TphnTHhApfqpe7rdEZXM5/kYkbGwMQPb5RUVZ9mJ1kh
	pZJv9RW4B4bOqVEQjDMXNf0RkFWBZbNHqyfXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ZxtTkCnCovzUylow2JXjzNcRVlTWo+8sO9NUog19rtvvxYQ1VJCRhhFWrPKET5L4rS
	ySvTMKoiNa1GpYKtx3siIpMUbDpCDL9XU8SZTmi+CEqGBo9v8R5uNlBZIpe3Hl+1U1yN
	wM27sTMMqTQHcjTaMvyZ34c5wd/4MgN5doKnQ=
MIME-Version: 1.0
Received: by 10.151.111.15 with SMTP id o15mr224100ybm.14.1232982063456; Mon, 
	26 Jan 2009 07:01:03 -0800 (PST)
Date: Mon, 26 Jan 2009 10:01:03 -0500
Message-ID: <f96d234e0901260701l3ba7bd3wa5f65588d517e0fa@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-01-19 to 2009-01-26
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
X-List-Received-Date: Mon, 26 Jan 2009 15:08:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-01-19 to 2009-01-26

Andreas Kemnade (1):
      mumpot: add version 0.3.2

Bernhard Reutner-Fischer (1):
      busybox: use short options for hwclock - closes #4978

Denis 'GNUtoo' Carikli (2):
      scummvm: fix the fact that none of the engines were builtin(so
scummvm was useless) while keeping ENTERPRISE_DISTRO and minor fixes:
      midori-0.1.2 : added a dependency on python-docutils-native and
new python-docutils-native package

Denys Dmytriyenko (2):
      package.bbclass: skip symlinks when generating shlib info in
package_do_shlibs()
      image.bbclass: resize images (ext2/ext3) only if they are bigger
then IMAGE_ROOTFS_SIZE

Elena of Valhalla (1):
      tuxmath: new recipe; A math game based on SDL

Erik Boto (1):
      libgpod: new recipe; A library to access the Apple iPod

Florian Boor (1):
      vpnc: Include correct help file, apply patch to get install
right (fixes #4831) and update makeman.patch to work for multiple
versions.

Frans Meulenbroeks (8):
      lcd4lnux updated to 0.11.0-SVN; added --with-ncurses in bb file
      lirc: updated to 0.8.4a; added mceusb & mceusb2 drivers
      lirc: changed config to build serial and mceusb; building more
modules at the same time seems not possible
      lirc: upgraded to 0.8.4a
      libwiimote: added package
      linux-omap-2.6.27: set UINPUT and MUSB_PIO_ONLY
      linux-omap-2.6.28: added UINPUT to defconfig
      cwiid: created package; wiimote support; requires uinput in
kernel or as loaded module

Jan L=FCbbe (2):
      bluez4-utils: ship missing files, bluetoothd can start now
      bluez4-utils: update to 4.27

Jeremy Lain=E9 (2):
      busybox_1.11.3.bb: don't call update-rc.d for mdev
      tzdata: make it possible to set default timezone

Jeremy Williams (1):
      Busybox 1.13.2: fix config after update form 1.11.x

Ken (1):
      bootchart-lite: new recipe; bootchart diagnostic tool for embedded sy=
stems

Khem Raj (1):
      gcc-4.3.3: New recipe

Koen Kooi (54):
      linux-omap 2.6.28: update to head of 2.6.28 branch
      linux-omap git: update to 2.6.29rc2
      opkg-collateral: fix PR
      opkg: fix postinst script to work outside of OE as well
      opal: update to 3.5.2
      ptlib: update to 2.5.2
      ekiga: add 3.1.0
      checksums.ini: add some more checksums
      gst-plugins-good: enable v4l2
      ekiga: also depend on gst-plugin-video4linux2
      prboom: update to 2.5.0
      linux-omap: remove unused patches
      mplayer: bump SRCREV
      checksums: add prboom and vagalume
      angstrom feed builder: clean opkg-native during machine section as we=
ll
      lmsensors: fix packaging, add 2.10.8, add staging function
      sensors-applet: gnome panel applet for lm-sensors
      angstrom source mirror: blacklist more packages
      angstrom feed builder: add stalonetray and sensors-applet
      ffmpeg: bump SRCREV
      checksums.ini: add vpnc
      linux-omap 2.6.27: add patch to make gwc device work
      myththv: bump PR
      angstrom feed builder: add pimlico
      blueprobe: bump PR
      task-native-sdk: rrecommend fortran symlinks as well
      alsa-utils 1.0.18: def pref -1 till someone fixes it so it actually b=
uilds
      angstrom feed builder: add pingus and frozen-bubble
      pingus: fix style issues and packaging
      checksums.ini: *sigh* add missing checksums for the last 2
commits (pingus and tuxmath)
      checksums.ini: Look, another recipe added without checksums: libgpod
      omap3 sgx drivers: fix initscript, fix S in kernel recipe
      task-native-sdk: try harder to include cpp
      angstrom feed builder: include transmission
      xf86-video-omapfb: get XV working on 32bpp displays
      linux-omap: add patch to get i2c working on the pico DLP
      checksums.ini: add more checksums
      omap3-sgx-modules: add 1.2.12.838 as reference
      task-beagleboard-demo: remove epiphany, midori does a much
better job these days
      postgresql: ARM_INSTRUCTION_SET =3D "arm"
      lirc: disable parallel make and remove bogus machine overrides
      gnash: add 0.8.4, def pref -1 till it's runtime tested
      linux-oma 2.6.28: update SRCREV
      mplayer: bump SRCREV for VDPAU problems
      cherokee: update to 0.98.0
      checksums.ini: add missing cherokee sum
      checksums: add kexecboot 0.4
      angstrom feed builder: add cwiid
      angstrom feed sorter: add more machines
      gnash: package browser plugin
      iscsi-target: rdepending on modules is illegal, move then to rrecomme=
nds

Marcin Juszkiewicz (4):
      Auto resizing ext2/ext3 images (from Poky)
      busybox: rename mdev subpackage to busybox-mdev as we have 1.2.1
mdev as separate recipe
      busybox: ship /dev/snd/timer with mdev
      linux: enabled many drivers for AT91SAM9263-EK board

Mark Brown (3):
      Add tuning for ARM1176JZF-S core
      alsa: update to 1.0.18
      alsa-utils 1.0.18: Remove xmlto usage from the build

Michael 'Mickey' Lauer (18):
      frameworkd: bump for python 2.6
      bluez4: 4.7 -> 4.27; improve package granularity and fix DEPENDS
      paroli: new recipe; combined application for Openmoko 2009.x
      bluez4: packaging tweaks; remove bluez4-utils in favour of that
      openmoko.conf: move to bluez4
      sane-srcrevs: bump FSO bundle
      bluez4: s/alsa-libs/alsa-lib/
      gsm0710muxd: bump to 0.9.3 release
      connman: add RDEPENDS to dynamic packages, enable more plugins
      timidity: new nonworking recipe; needs host tool
      sane-srcrevs.inc: fix typo
      fso-gsm0710muxd: bump to 0.9.3.1
      fso-autorev.inc: add correct name of fso-monitor
      python-pyftpdlib: new recipe; ftp server library for python
      tcltk: 8.4.11 -> 8.4.19; try harder to get proper library packaging
      checksum.ini: add new tcl/tk
      python: bump for updated tcltk; this fixes python-tkinter (which
has been broken since ages)
      tcl: reinstate manual do_stage; necessary due to broken autotools usa=
ge

Mike Westerhof (4):
      SlugOS: busybox-1.13 -- remove blkid and mod* utils from SlugOS defco=
nfig
      SlugOS: rename checkroot.sh to checkroot to avoid rcS "sourcing"
      SlugOS: add modprobe.d/usb - ensure usb modules are loaded in
correct order
      SlugOS: slugos-init - add modprobe.d/usb to the files list.

Otavio Salvador (6):
      bitbake.conf: enable dynamic locale packages since bitbake
1.8.12 is now released
      xorg-xserver-common: do not include .la files in module packages
      syslinux-native: leave only 3.63 version
      syslinux: add a non-native package
      mtools: fix 3.9.11 recipe to properly compile
      bitbake.conf: add EXTRA_IMAGECMD_{cpio,cpio.gz} variables

Philip Balister (1):
      dsplink : Add a (hopefully) stable URL to find TI SW needed to
build dsplink

Richard Purdie (1):
      sanity.bbclass: Provide preserving the mmap_min_addr setting
over reboots (from Poky)

Robert Schuster (1):
      llvm: Various fixes.

Sander van Grieken (1):
      pingus: new recipe; A lemmings-clone based on SDL

Stefan Schmidt (1):
      openmoko.conf: Revert not intended change to
preferred-om-2009-versions.inc

Tick Chen (2):
      vagalume: update the SRC_URI to garage.maemo.org
      opkg: bump up opkg version to R197

Tim 'timtim' Ellis (36):
      foonas: Remove TARGET_FPU from foonas machines orion, lsppc,
lsmipsel, n1200, storcenter
      lsmipsel: Can not inherit lsmipsel-image because it does not exist, r=
emove
      lsppc: Remove uboot from machine features as this is broken atm,
also remove pci
      lsppc: Remove foonas classes lsppchg-image and lsppchd-image
      linux.inc: Add lsppchg and lsppchd to linux.inc and sort the
KERNEL_DEVICETREE devices by name
      checksums.ini: Add transmission-1.40
      transmission: Add transmission, a bittorrent client with a nice
web interface, great on NAS. Thanks dave purdy for this.
      linux-linkstationppc: Move from 2.6.21-rc5 to 2.6.27.10. Move to
using deice tree stuff in linux.inc.
      lsppc: Add KERNEL_IMAGETYPE, UBOOT_ENTRYPOINT and
UBOOT_LOADADDRESS info and kernel-devicetree to MACHINE_EXTRA_RDEPENDS
      checksums.ini: Add avr-evtd 1.7.2 and sort
      avr-evtd: Add avr-evtd, LED/button/watchdog stuff for lsppchd,
lsppchg and lsmipsel
      lsmipsel: Move u-boot-utils from machine rdepends to
rrecommends, remove pci from features
      lsppc: Add avr-evtd to machine rdepends, u-boot-utils to rrecommends
      n1200: Remove lmsensors-apps from MACHINE_EXTRA_RRECOMMENDS as
we dont do anything with it and it doesnt build.
      avr-evtd: Install init script and start at boot - tested on
lsppchd/lsppchg.
      n1200: Add KERNEL_IMAGETYPE, UBOOT_LOADADDRESS and
UBOOT_ENTRYPOINT to machine config
      linux-n1200: Fixup to use the right KERNEL_OUTPUT and use linux.inc
      temper: Add init script before my n1200 melts.
      bftpd: Remove foonasisms
      linux-orion: Add xfs builtin and input evdev for tsx09/piccontrol
      piccontrol: Add init script, tidy up
      checksums.ini: Add mt-daapd 0.2.4.2
      mt-daapd: Add version 0.2.4.2
      checksums.ini: Add jfsutils 1.1.13
      jfsutils: Add jfsutils package, initially includes 1.1.13 and cvs bui=
lds
      tcltk: Fix missing }
      kernel.bbclass: Add missing entry for scsi headers in staging,
as needed by iscsi-target
      kernel.bbclass: Remove some repetition in last commit.
      linux: Bump PR on foonas platforms following staging changes
      checksums.ini: Add krb5 1.6.3 and samba 3.2.7
      samba: 3.2.5 -> 3.2.7
      samba: 3.0.33 -> 3.0.34, also small change to 3.2.7 to merge
stuff better in samba.inc
      checksums.ini: Add samba 3.0.34
      samba: Make 3.0.23c build again since its still an om preferred versi=
on
      samba: Reinstate change to fix 3.0.23c and 3.0.34 installs

Tim Ellis (3):
      checksums.ini: Add p910nd 0.92
      p910nd: Add p910nd, a great little print utility for small devices
      tcltk: Fix the native packages after last tcltk change

frans (1):
      use python from env instead of /usr/bin/python

quickdev (1):
      python-mysqldb: Modified patch to properly compile. Removed it
from nonworking.

woglinde (2):
      frozen-bubble: add version 2.2.0
      libsdl-mixer: add libvrobis as dependency

Bugs fixed:

bug_id resolution        short_desc
1942 FIXED       file-native-4.20 doesn't build on debian sarge i386
2312 WONTFIX     Terminal font too small
2389 WONTFIX     multiple packages providing same name from ipkg
2631 WONTFIX     X server returns inconsistent RandR on spitz/akita
2664 WONTFIX     iRex iLiad 'ereader' distro config
2742 WONTFIX     test bug
3229 WONTFIX     upgrade path for gsmd broken
3267 FIXED       e-wm fails to start after install
3576 FIXED       midori-0.15 segfaults
3757 WONTFIX     KDrive shouldn't depend on HAL [patch]
4831 FIXED       vpnc-0.5.1-autobuild
2899 WONTFIX     Fixup autotools.bbclass for samba-3.0.25c
2900 WONTFIX     samba-3.0.25c support
4238 WONTFIX     ipkg grammar fix
4249 FIXED       evaluate git as a replacement for monotone
4250 FIXED       import old bitkeeper history into git
4252 FIXED       the git server should have hooks to trigger mails
4257 FIXED       convert mtn repo to git repo
4387 FIXED       pushd/popd bashism in recipes
4505 FIXED       gtk+-2.12.11-r3 fails to link
4516 FIXED       new recipe for tuxmath
4579 FIXED       Fix tangogps dependencies
4711 FIXED       new bb recipe for Pingus
4755 WONTFIX     Recipes for vala-0.4.0
4758 FIXED       Recipe for bootchart-lite
4874 FIXED       Recipe for mumpot-0.3.2
4958 FIXED       scummvm does't build the engines(needed for playing games)
4965 FIXED       frozen-bubble update to version 2.2.0 and better package
4967 FIXED       libsdl-mixer lack libogg libvorbis as DEPENDS
4969 FIXED       Bump ALSA to 1.0.18
4973 FIXED       new recipe - directfb-examples_1.0.1.bb
4978 FIXED       busybox hwclock.sh runlevel script fails without GETOPT_LO=
NG
4982 FIXED       new package
4984 FIXED       Add tuning for ARM1176JZF-S core
4985 FIXED       udev pulling in libvolume-id-dev
4995 FIXED       Fix alsa-utils 1.0.18 build
2278 WONTFIX     calendar refuses to run
2657 WONTFIX     spitz soundcard unusable for sample rates < 12000

Bugs opened:

bug_id resolution        short_desc
4997     run-bootsh.bb: Add recipe to execute /media/mmcblk0p1/boot.sh
on startup
4996     Incorrect Rootfs


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


