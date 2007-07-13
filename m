Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I9Jk1-0007G9-HH
	for openembedded-devel@openembedded.org; Fri, 13 Jul 2007 13:55:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I9Jjo-0005g5-JO
	for openembedded-devel@openembedded.org; Fri, 13 Jul 2007 13:55:08 +0200
Received: from 62-50-199-121.client.stsn.net ([62.50.199.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Jul 2007 13:55:08 +0200
Received: from koen by 62-50-199-121.client.stsn.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jul 2007 13:55:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 13 Jul 2007 12:54:55 +0100
Message-ID: <f77p6f$tbm$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: 62-50-199-121.client.stsn.net
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: OE changelog 20070706-20070713
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2007 11:55:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Generated on 20075113
Laibsch@openembedded.org:
    poboxserver: fix -dbg packaging.  reorder some fields.
    qpobox/poboxserver: some unfinished changes

daniel@openembedded.org:
    classes/base.bbclass: Fallback to archive.apache.org for older versions
    * Change URL of package db3_3.2.9 to working mirror. (Closes #2606)

florian@openembedded.org:
    hiker: Add 0.9.1... we silently ignore demos installed to wron directories.
    gnet: Add svn version instead of CVS one. Add necessary site file bits.
    linux-gta01: Add defconfig for 2.6.21.5
    machined: Hardware status and abstraction tool.
    gpe-session-scripts-phone: Update session script to support gtk 2.10 and run machined.
    linux-gta01: Add 2.6.21.5 from OpenMoko
    ptim: Drop some obsolete patches.
    task-gpephone: Add some tools to debug section.
    fic-gta01.conf: Update included modules and enable padding of jffs2 images.
    gpe-scap: Add fixed version 1.3

hrw@openembedded.org:
    automake: added 1.10 - not tested too much, needed by parted 1.8.7, not default
    glib-2.0: fix packaging in 2.12.12 - should end discussion on OE list
    libxosd: fix packaging (from Poky)

koen@openembedded.org:
    e-wm: fix startup script, fix u-a and install xdg stuff (per
http://wiki.enlightenment.org/index.php/E17_and_Efreet)
    angstrom: add altboot versions of x11 and console images, untested, I'll leave that to
the altboot wanting crowd
    angstrom-e-image: move to non-working, since it is, well, non-working. The level of
non-workingness is quite high, since e-wm is currently unbuildable due to ecore-native,
and even if e-wm would build, its update-alternatives are wrong. So before this image can
be moved back, all e packages have to get built, inspected, tested and if needed fixed.
    wireshark: fix -dbg
    disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'

lenehan@openembedded.org:
    perl 5.8.8: A few host paths were being included in the perl for the target.
    perl/perl-native 5.8.8: Fix up asm/page.h include issue. Perl was including

marek.vasut@gmail.com:
    linux-hackndev-2.6 svn: Update repo URL.
    qemu-native: amd64-enabled 0.9.0 cvs snapshot from bug #2589.

mickeyl@openembedded.org:
    ecore-native: fix configure options to make it build on systems without EFL headers
    alsa: integrate alsa-states recipe into alsa-state
    alsa-states: add dummy state
    file: update 4.20 to 4.21, 4.21 contains security and build fixes for some archs
    fic-gta0[1|2].conf: task-base handle alsa-states, no need to duplicate it here
    fic-gta0[0|1].conf: move recommendation of alsa-state(s) from task-openmoko to machine
configuration
    add epsilon_cvs to get the shiny new epdf thumbnailer plugin
    add epdf, the glue between libpoppler and the EFL
    poppler: add recent cvs version since 0.5.9 release doesn't build
    add alsa-states, containing the machine specific alsa states.
    etk upgrade to 0.1.0.004
    remove openmoko-mainmenu, it has been integrated into openmoko-panel-mainmenu
    task-openmoko: merge with OpenMoko svn overlay

pfalcon@openembedded.org:
    sysfsutils 2.0.0: Fix shlib packaging, symlink was omitted.
    linux-handhelds-2.6: Remove adhoc ripping of kernel-image modules.
    devimage-image: Add more content.
    devimage: Bump PR.
    devimage-image, devimage_0.1: Finally, an initrd for kernel testing (minimal userspace
involvment).
    h4000.conf, htcblueangel.conf: Blacklist acx from autoloading while PCMCIA support is
buggy yet.
    linux-handhelds-2.6: Add support for bunch of new machines.
    looxc550: Add Loox C550, fresh hh.org port, but progresses well.
    htcalpine.conf, htcapache.conf, htcsable.conf: Add few more HTC devices.
    asus620.conf: Typo fix.
    asus620.conf: Add Asus MyPal A620.
    aximx50.conf, aximx50v.conf: Split up configs for QVGA vs VGA aximx50 models.
    opie-taskbar: Add patch to get rid of 1-pix stray gap under taskbar.
    qte 2.3.10: kernel-keymap-corgi.patch appears to be safe to be applied
    qte 2.3.10: Clean up ipaq_sound_fix.patch stuff.
    qte 2.3.10: Remove unused ipaq-keyboard.patch.
    qte 2.3.10: Remove deprecated devfs.patch
    bitbake.conf: Introduce variables to specify machine's display properties.
    linux-handhelds-2.6: Enable PCMCIA for ACX_CS.
    linux-handhelds-2.6 2.6.21-hh11: Update defconigs to defconfigman r343.
    angstrom-2007.1.conf: Use 2.6.21-hh1 for linux-handhelds-2.6.
    linux-handhelds-2.6: Add 2.6.21-hh11.
    h4000, htcblueangel: Add pcmciautils to MACHINE_EXTRA.
    site/common-glibc: Added ac_cv_func_malloc_0_nonnull & ac_cv_func_memcmp_working
    gparted 0.3.3: Add GParted.
    parted 1.8.7: Make buildable with latest linux-headers.
    parted 1.8.7: Set DEFAULT_PREFERENCE = "-1", requires autoconf 2.61 to be built properly.
    task-base.bb: Add explicit dependency on bluez-dtl1-workaround to task-base-bluetooth.
    angstrom-2007.1.conf" Bump PREFERRED_VERSION_linux-handhelds-2.6 to "2.6.21-hh10".
    linux-handhelds-2.6: Add defconfigs for htcapache & htcsable, defconfigman r322.

polyonymous@openembedded.org:
    qmake2-native: install mkspecs into host_sys staging area as well
    classes/qt4x11.bbclass, uicmoc4-native: add qt3support
    nunome: move to the new opie location
    poboxserver: adjust to its new home in /usr
    opie-irc: more fixes for utf-8
    qte 2.3.10: fixed build for c7x0 with gcc 4
    opie-irc: utf8-ize
    opie-tinykate: removed multiple occurences of package in PACKAGES
    opie-keyview: adjust to the new filesystem layout
    opie-keyboard: adjust post{inst,rm} and rpath to the new layout
    opie-autorotateapplet: go ${bindir}
    konqueror-embedded: fixed and adjusted to the new filesystem layout
    qpf-font-common: fonts aren't in /opt/QtPalmtop anymore
    opie-init: initscript cosmetics and fixed packaging wrt qpe.conf
    pwmpi: move binaries from ${palmtopdir}/bin to ${bindir}
    kdepimpi: install binaries into ${bindir} instead of ${palmtopdir}/bin
    opie-mailapplet: bump PR to force upgrade to the new layout
    opie-mediaplayer1-lib{wav,mad,tremor}plugin: revert unneded fixes, except for PR bumps
    opie-mediaplayer1-libwavplugin: go ${palmtopdir} way
    opie-mediaplayer1-libtremorplugin: install into ${palmtopdir}
    opie-mediaplayer1-libmadplugin: install codec into $palmtopdir
    opie-unikeyboard: get into /usr
    opie-lockapplet: get out of /opt
    opie-dvorak: adjust post{inst,rm} and rpath to the new layout
    opie-taskbar: restore opie's restartability
    opie-batteryapplet: adjust to the sane prefix
    opie-memoryapplet: adjust to the proper prefix
    glibc: remove /opt/QtPalmtop/lib from ld.so.conf
    opie-clipboardapplet: get /usr-ready.
    opie-volumeapplet: adjust to the new filesystem layout
    opie-screenshotapplet: opie is not in /opt anymore
    opie-pickboard: it's time to be aware of the sane filesystem layout
    opie-pcmciaapplet: qcop is in ${bindir} now, isn't it?
    opie-multikeyapplet: we're not in /opt anymore
    opie-multikey: get the idea of proper filesystem layout
    opie-irdaapplet: now aware of filesystem layout too
    opie-handwriting: actually bump PR
    opie-handwriting: welcome to /usr
    opie-clockapplet: make it ready for the new layout
    opie-brightnessapplet: adjusted to suit new layout
    opie-alarm: adjust for the new filesystem layout
    opie-icon-reload: adjust to the new filesystem layout
    opie-taskbar-images: update-alternatives for pixmaps.
    qemu 0.9.0+cvs: polished .bbs a bit and gave them default preference of -1, anyway
    opie-icon-reload: fix packaging. I suppose it will need more once I try the image.

rwhitby@nslu2-linux.org:
    fsg3-kernel: Update to latest svn defconfig
    gcc-csl-arm-2005q3: Added patch to support big-endian builds of 3.4.4
    fsg3-kernel: Default kernel for Freecom FSG-3, with build defaults in fsgbe.conf to
match vendor binary modules.
    fsg3be: Machine configuration for the Freecom FSG-3 NAS device.
    ixp4xx-npe: Now builds NPE-C as well as NPE-B ethernet microcode.
    arm-kernel-shim: Support building for the fsg3 machine
    ixp4xx-kernel: Support building for the fsg3 machine
    gcc-cross-kernel: Added specific csl 2005q3 version for compiling a kernel to match
the Freecom FSG-3 vendor binary modules.
    openssl: Added configure option for gnueabi-armeb

slapin@openembedded.org:
    Updated installed modules list for Palm Zire 72
    Updated defcinfig for Palm Tungsten T5
    Adding support for Palm Treo 650 and Palm Tungsten T5
    Palm Zire 72: removed unnecessary modules from config, since they
    Palms: unification of configs
    linux-hackndev-2.6: bump PR
    Fixed Palm Zire 72 battery autoload
    Palm Zire 72 machine update

woglinde2@openembedded.org:
    fixing ntp building for uclibc
    Shame on me that I broke oe, now I will be more
    putting ide-support, so we can use cf-pcmcia adapters or
    shame on me, I forget to added the new patches
    Simpad updates taken from
    obexftp needed same autotools-love because it depends on libiconv

xora@openembedded.org:
    libsigc++-2.0_2.0.17.bb : version bump for this package, this builds with
    evince_0.9.2.bb : version bump
    m4-native_1.4.8.bb : added version 1.4.8 which is needed by some packages
    autoconf_2.61.bb : fix a "bug" in autoconf where it treated CONFIG_SITE
    packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.
    linux-rp_2.6.21.bb : add a hack to prevent connect+ card from oopsing



Bugs fixed:
bug_id resolution	 short_desc
2289 FIXED	 Sandisk ConnectPlus oops
2498 INVALID	 can't run horizon due to faulty ~ path
2544 FIXED	 Updating gtkmm
2563 WORKSFORME	 GPE pointer does not accurately track stylus on Zaurus SL-6000
2564 FIXED	 QT/E fails to build due to lack of asm/page.h
2582 FIXED	 sd-card is not correctly recognized by kernel
2602 INVALID	 zaurus c1000 akita touchscreen broken
2606 FIXED	 Source for db3 archive seems to not be avalible any more.
2608 DUPLICATE	 asterisk 1.4 bb files
2613 FIXED	 collie kernel 2.6.21 and modules
2618 WONTFIX	 Clean spitz.c ALSA driver
2620 INVALID	 No SD card device on Jul3 Angstrom
2622 INVALID	 perl-native-5.8.3-r0: task do_compile failed
2639 FIXED	 ptim_*_svn.bb: Makefile patch isnt required any more
2641 FIXED	 svn.sf.net renamed to project.svn.sf.net
2642 FIXED	 alsa-states doesn't build
2495 FIXED	 akita backlight off after suspend.
2407 FIXED	 build of sysvinit fails in do_install


Bugs opened:
bug_id resolution	 short_desc
2644 	 bad structure of sources/svn directory
2609 	 xserver-common should have /etc/X11/shepherd.xmodmap
2610 	 mtd-utils can not be build becuase GIT_AUTHOR_NAME and GIT_COMMITTER_NAME are not set
2611 	 Perl bitbake file uses wrong define to address the cross linker...
2612 	 kazekahase segmentation fault
2614 	 MACHINE_EXTRA_RRECOMMENDS doesn't work
2615 	 libpng-1.2.12-r5 fails do_install for SharpROM
2616 	 libxcb-0.9.93-r2 fails do_install for SharpROM
2617 	 spitz/akita sound mixer misconfiguration
2619 	 Meta-Bug for SL-C1000 (akita)
2621 	 Clicking noises shortly after audio is played
2623 	 QA Issue prevents ewl_0.5.1.009.bb from building
2624 	 If software's SVN repository changes locations (SRC_URI changed)
2625 	 gnome-desktop fails to build for arm target (h3900)
2626 	 altboot on collie ignores key presses
2627 	 altboot seems unable to mount either SD or CF cards on collie
2630 	 xrandr doesn't report rotation state
2631 	 X server returns inconsistent RandR on spitz/akita
2632 	 icewm is unusable in the default configuration
2633 	 autoconf-2.61 in OE doesn't handle OE site properly
2634 	 Newer software requires autconf 2.61 (e.g. parted 1.8.7)
2635 	 No sleeve driver built on h5000
2636 	 The corgi_ts driver has a small bug : it doesn't trigger the KEY event it advertises
2637 	 fixes to make Sharp CE-RH2 remote working in X
2638 	 ZD1211RW kernel drivers
2640 	 e17 screen shifted left
2643 	 Ability to change gpe-clock alarms via gpe-calendar
2645 	 add obexpushd
2646 	 updated bb file for ctorrent
2628 	 No audio driver built for h5000
2629 	 No wireless driver built for h5000

In total 31 bugs have been created and 18 bugs were closed.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGl2gOMkyGM64RGpERAly1AJ9dCPlObUCnqoO9m7DFHGZksNVplQCguGme
9xr+4nuOXbjXw4lI7LQCdlA=
=Fop3
-----END PGP SIGNATURE-----



