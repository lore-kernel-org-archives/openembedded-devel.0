Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NPk6H-0000Ep-KC
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 22:59:36 +0100
Received: by ewy4 with SMTP id 4so12373655ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=SbM+VQB6VHdNfUbwni7IwHgb0pWYDVcGB2ce2tHrytM=;
	b=YROYV1DuF6a1CZQ5daD5Bu4un4VTzXvp4OXXYFwEVaUIImpRLcQH7P5hkEyIlc4x7u
	jbElRM5rDPTu8BELRhrWllQuT3IrNG2KB21HR8GMa097KdMLGt9Vb4fxvjdiEAjGc3p3
	Cb7nnscmMDn26EU0OGfIBKduyVST2rgsAVDkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=e9F4MG6vMAt8FmueW0sNayKPCoaIlLZhAQ0VjhlEwGyX8zzViICCPMV2r/ZXmJc6yX
	1XZhxxXYDBCanE9BzcM6Z95mLZC3unzQiY/+kkrGOJ8hxrYXHW+tSHKop15uwDpKAjo+
	4bGatJ5wulZmyb55yjJzw8/MaMEUh87ptlgMQ=
MIME-Version: 1.0
Received: by 10.216.89.80 with SMTP id b58mr6046898wef.73.1262123855507; Tue, 
	29 Dec 2009 13:57:35 -0800 (PST)
Date: Tue, 29 Dec 2009 16:57:35 -0500
Message-ID: <f96d234e0912291357j5e0577f3me550f5a55931a686@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-12-21 to 2009-12-28
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
X-List-Received-Date: Tue, 29 Dec 2009 21:59:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog 2009-12-21 to 2009-12-28

Andrea Adami (1):
  kexec-tools-klibc-static: don't use OE compiler flags. Use default klcc and

Denis 'Gnutoo' Carikli (1):
  udev-141: added support for buglabs's bug device

Denys Dmytriyenko (2):
  omapl1: fix the .inc/.conf copy/paste error and inconsistency
  davinci: update DM3xx/DM6xxx and OMAPL1xx kernels

Don Darling (1):
  linux-omap-psp: Enable oprofile support as a module for omape3evm.

Frans Meulenbroeks (2):
  calamari: added support for nand and nor flash to dts and changed defconfig
  qt4-tools-native; added dependency on libsm-native

Henning Heinold (1):
  libxft: fix major/minor/patchlevel substitution in Xft.h

Khem Raj (11):
  eglibc: Add libc_nonshared.a to FILE list in eglibc-dev.
  gcc: Enable mips plt extentions if DISTRO_FEATURE has mplt.
  minimal: Add 'mplt' to DISTRO_FEATURES.
  qemumips.conf: Add kernel-modules to MACHINE_EXTRA_RRECOMMENDS.
  libqpe-opie: Dont inherit opie.
  preferred-xorg-versions-X11R7.4: Fix obvious typo
  preferred-xorg-versions-X11R7.4.inc: Add PREFERRED_VERSION for xf86bigfontpr
  conf/machine: Add x86_64 machine.
  Revert "conf/machine: Add x86_64 machine."
  minimal.conf: Add PREFERRED_PROVIDER for opkg and update-alternatives.
  eglibc: Move SRCREV to latest tip for svn and 2.11

Klaus Kurzmann (3):
  task-shr-feed: add libsyncml
  openssh_5.2p1: add custom sshd_config for SHR distro to switch of UseDNS
  openssh-5.2p1: actually turn DNS off not explicitely on for SHR distro

Koen Kooi (19):
  linux-omap 2.6.32: add dss2 driver for beagleboard
  angstrom: switch to qt 4.6.0
  firefox: add 3.5.5
  linux-omap 2.6.32: add some more patches
  angstrom feed uploader: blacklist less packages
  angstrom feed sorter: add cm-t35 machine
  angstrom feed builder: add wvdial
  angstrom-task-gnome: add explicit buildtime dep on gst-plugins-ugly
  archos5: first batch of archos5 machine support. Downloaded from archos.com
  xorg-driver-common.inc: bump PR to force rebuild against newer X
  geany: add 0.18
  xf86-video-omapfb: hack to build against recent xorg
  x11vnc: add 0.9.9
  mesa 7.6: disable EGL to remain compatible with previous versions
  qt4-x11 4.6.0: bump PR for Xorg changes
  xorg-driver: bump PR again for good measure
  mesa-common: package libegl seperately
  xf86-video-omapfb: more fixes for recent xorg
  linux-davinci: add trailing space to make append work

Kristoffer Ericson (10):
  Since we are working with 3 different archs (mips/sh3/arm) we require versio
  Add Preferred version for linux-jlime-jornada6xx and include kernel modules
  Initscripts. Fix devices script for machine jornada6xx
  This is for building binary locales for SH3 via qemu. Note that qemu-native
  Fix compilation of glibc 2.9 for SH3/SH4
  Base files fix (fstab/issue/issue.net/profile) for HP Jornada 6xx.
  Fix keymaps for the HP Jornada 6xx. Includes updates and new ones.
  Copy Angstrom rc and rcS script files for JLiMe
  Updated JLiMe 2.6.17 kernel. Changes include addition of alsa driver and als
  Update jlime-2009.1 distro file: * Remove src_distribute * src_distribute_lo

Martin Jansa (24):
  checksums.ini: fix pisi-src-0.4.10 URL
  openmoko-icon-theme-standard2: add missing FILES include for icons (after op
  checksums.ini: fix sums for libwbxml-0.10.7.tar.gz, strange copy&paste error
  checksums.ini: add checksum for libsyncml-0.5.4
  linux-openmoko: use add module_autoload for 2.6.31, add ppp_generic and load
  linux-openmoko-2.6.32: add new version
  mesa: add version 7.6 for newer xorg
  font-misc-misc: drop patch from old version, this problem should be solved i
  xorg-fongs: set fontdir in OECONF
  spitz: use xorg-xserver and mesa-dri
  libpthread-stubs: add version 0.2
  libdrm: add git version for om-gta02
  xserver-kdrive-common: add Ts_Calibrat script for Xorg
  xorg: upgrade to latest versions from 2009-11-29
  xserver-xorg: add 1.7.3 and xf86-video-dummy 0.3.3
  xserver-xorg: rename wrong filename
  xorg: update listres, xlogo, xf86-input-evdev, xf86-input-synaptics, xf86-vi
  xorg-font-common.inc: allow fonts to be installed in /usr/share it was fixed
  angstrom: set preferred mew version to 7.6, its not used because of DEFAULT_
  xserver-kdrive-common: update sysfs ts calibration node for shr and kernel 2
  linux-openmoko-2.6.32: enable glamo DRM
  kernel, linux-kernel-base classes: update for 2.6.33-rc1 and newer
  sane-srcrevs: bump navit and navit-icons to latest revisions

Martin.Jansa (10):
  xorg: add recipes for X11R7.5 release
  xorg: update recipes of other freedesktop projects
  xorg: add preferred versions for projects not included in X11R7.5
  contrib: scripts for easy preferred-xorg-versions generation
  xorg-xserver-common: drop lbxutil dependency, add dri2 package
  xf86-video-glamo: enable KMS as kms branch is now merged to master
  libxfont: disable docs as workaround for problems on some buildhosts
  libxaw: disable docs building as workaround
  om-gta02: xorg.conf with evdev drivers for input
  angstrom: use latest glproto, libx11, mesa, util-macros and xserver-xorg

Michael 'Mickey' Lauer (1):
  fso-specs: DEPEND on libxslt-native

Paul Menzel (1):
  Typo. s/to used/to use/

Philip Balister (1):
  cppunit : Change recipe to use autotools_stage.           * This stages m4 m

Robert Schuster (4):
  chinook-compat: Added a version preference for libx11.
  native.bbclass: Modify STAGING_DIR_JAVA when native build is in chosen.
  classpath: Added toolwrapper-exithook.patch classpath-native: Dito.
  classpath: Added toolwrapper-exithook.patch. classpath-native: Dito.

Roger Monk (1):
  linux-davinci: Updated OPP config for da850-omapl138-evm/hawkboard

Stanislav Brabec (1):
  ncurses: Removed patches that are no more in use.

Steve Sakoman (2):
  x11vnc:  add missing libxinerama dependency
  libx11: fix build breakage

Thomas Kunze (2):
  angstrom: use eabi for armv4 and remove arm-oabi
  sort.sh: move from oabi to armv4

Thomas Zimmermann (1):
  libx*-native: fix PROVIDES for some packages

Bugs fixed:

bug_id resolution        short_desc
3545 NOTOURBUG   Garbage on screen (doesnt reboot) a780 ezx3
5289 NOTOURBUG   Touchpad stuck key on hx4700
696 NOTOURBUG    package manager shows sigabrt very often
1291 NOTOURBUG   GPE backlight applet sometimes turns off backlight on spitz
1349 NOTOURBUG   Last line scrolls off console in opie
1368 WONTFIX     kopi and kapi help files not available?
1619 NOTOURBUG   Akita does not function as a USB storage device
2213 NOTOURBUG   OPIE: Bluetooth doesn't work properly
2295 FIXED       do_package fails for fortune-mod non-x86 targets
2387 NOTOURBUG   gpe-edit crashes on shift+tab from file open dialogue
2677 NOTOURBUG   nokia 800 kernel not booting
2832 NOTOURBUG   gpe-irc segfaults
2836 NOTOURBUG   gpe-gallery segfaults during image manipulation
2879 NOTOURBUG   kernel misses USB host/client switch signalling
3350 NOTOURBUG   gpe-clock applet does not expand to show entire time
3360 FIXED       bbclass to create maemo scratchbox compatible binaries
3489 NOTOURBUG   gpe-bluetooth applet gives error message on disabling BT
3519 NOTOURBUG   hx4700: ts-adc and high cpu load
3723 NOTOURBUG   h3900: Sleeves not supported
3937 NOTOURBUG   Card widget is broken
5352 FIXED       xf86bigfontproto-1.2.0-autobuild failed due to
util-macros too low
5353 FIXED       xcmiscproto-1.2.0-autobuild
5354 INVALID     ltrace-0.5.3-autobuild
5355 REMIND      eglibc-2.10-autobuild
5356 REMIND      gcc-cross-4.4.2-autobuild
5357 REMIND      gcc-cross-intermediate-4.4.2-autobuild
5358 INVALID     uclibc-initial-0.9.30.1-autobuild
3547 NOTOURBUG   h3900: Sound not available
3548 NOTOURBUG   h3900: Battery status not avilable
4352 NOTOURBUG   Ipaq 2215 99% CPU all the time
4353 NOTOURBUG   system info closes on ipaq 2215
4467 NOTOURBUG   Keyboard 1 key not seen in Gnumeric
4534 WONTFIX     package linux-smdk2440-2.6.20+git: failed
4731 FIXED       RFE/kernel.bbclass: untie 'uImage' from openmoko
4750 FIXED       fso-image fails with openmoko-terminal2
4847 FIXED       gnome-vfs_2.22.0 should depend on dbus-glib
4894 NOTOURBUG   oops in pxa_ir_configure
5028 FIXED       fso-image fails on do_rootfs install gst-plugin-sid
5034 FIXED       gnutls-2.4.2 needs guile-native
5040 FIXED       base-passwd 3.5.19 no longer downloadable
5050 FIXED       New recipe - The Revision Control System (RCS)
5063 FIXED       new recipe wekit-efl
5065 FIXED       xmonobut-0.4.1
5093 FIXED       Infinite recursion in Python on sato-icon-theme package.
5111 FIXED       opie-image build-depends on fso-gsm0710muxd
5261 WONTFIX     guile-native_1.8.2 fails to build
5276 FIXED       fso-gsm0710muxd fails  on git read-tree
5286 NOTOURBUG   opkg goes OOM when upgrading navit on Freerunnner
5350 FIXED       python-gst_0.10.17.bb: ERROR: function do_compile failed
112 NOTOURBUG    Changing Network settings in Opie from dhcp to static
does not kill udhcpc
2643 NOTOURBUG   Ability to change gpe-clock alarms via gpe-calendar
3560 NOTOURBUG   h5000 fingerprint scanner driver unavailable in OE


