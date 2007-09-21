Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IYes2-0005ma-8X
	for openembedded-devel@openembedded.org; Fri, 21 Sep 2007 11:32:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8L9SFYY013223 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2007 11:28:15 +0200
Message-ID: <46F38EB3.6070503@student.utwente.nl>
Date: Fri, 21 Sep 2007 11:28:19 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: ss
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog
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
X-List-Received-Date: Fri, 21 Sep 2007 09:32:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake@openembedded.org:
    epiphany: add libstartup-notification to DEPENDS

crofton@openembedded.org:
    gumstix.inc : autoload smc91x module. Provide a commented out example of how
    omap5912osk : Add usb module to image.
    gumstix-connex.conf : Prevent installation of uImage in /boot.
    gumstix-verdex.conf : Prevent installation of uImage in /boot.
    omap5912osk.conf : Prevent installation of uImage in /boot.
    exmap-console : Add dependency on glib-2.0.

daniel@openembedded.org:
    libmokoui2: Touch gtk-doc.make to fix issues with gtk-doc support (Thomas Wood)
    navit: Add checksums for navit tgz. Improve performance on arm (thanks cp15)
    navit: Add Navit, the car navigation system with routing engine.
    matchbox-keyboard: Update sane-srcrevs.inc for improved handling of shift.
    matchbox-keyboard-inputmethod: Add a patch to delay mb_kbd_ui_hide.
    openmoko-sound-theme-standard2: inherit openmoko2 so sources get fetched from the
correct location

florian@openembedded.org:
    gpe-applauncher: add svn recipe, ship device specific softkey configuration.
    gpe-applauncher: add 0.11
    task-sdk-extra: Some updates, add libraries, drop obsolete.
    gpe-applauncher: Make a separate package for the machine specific configuration files.
    gpe-session-scripts-phone: Minor session update to avoid session restart.

hrw@openembedded.org:
    alix: use tuning for GeodeLX cpu, switch to i586
    tune-geodelx: added tuning for AMD GeodeLX cpu
    moko-autorev: add also libraries: libmoko* and libgsmd

khem@openembedded.org:
    Update SVN revision of eglibc.
    Delete the fcntl2 patch. Its committed upstream.

koen@openembedded.org:
    mplayer: enable iwmmxt for more machines
    matchbox-keyboard-im: apply small-screen patch
    gcc 4.1.2: disable fortran as it doesn't build for everybody (it works fine on the
autobuilder and my home machine)
    gcc: change the way to package fortran, reduce spurious variables, make missing
fortran files non-fatal
    gcc(-cross): enable fortran for arm/EABI, thanks to Alain for showing and testing the
patch
    poppler dependants: bump PR since poppler 0.6 changed soversion
    bluez-gstreamer-plugin: add 3.19
    bluez: fix problems with CONFFILES, rfcomm.conf goes into -compat
    python-pybluez: update to 0.13
    bluez-utils*: update to 3.19
    bluez-libs: update to 3.19
    bluez: add 3.18, with the cups and alsa split discussed on the mailinglist
    sane-srcrevs: bump webkit and openmoko-browser2
    openmoko-browser2: depend on intltool
    sane-srcrevs: add openmoko-browser2
    openmoko-browser2: add svn version
    alsa: enable fixed-point PCM conversion for TARGET_FPU=soft
    alsa-state: update c7x0 state file (from #2667), add akita one (from #2667)
    gtk+ 2.12.0: also build tiff pixbug loader
    epiphany: needs gnome-vfs-plugin-http
    epiphany: add 2.19.6 with webkit as default backend
    iso-codes: add 1.4
    angstrom 2008: prefer pango 1.18.x
    sane-srcrevs: bump ezxd to get the powerbutton working
    ezxd: remove --reverse from run-parts
    linux-ezx: enable uinput feature
    task-openmoko: use qvga icon theme for qvga machines and make the ui task machine specific
    angstrom 2008: use glib-2.0 2.14.0
    angstrom 2008: use gtk+ 2.12.0
    glib 2.0: add 2.12.13 and 2.14.0 from poky
    gtk: add 2.12.0 from poky
    linux-ezx: disable backlight patch for rorkre6 as it only turns of bl at this point
    remove size check again
    sane-srcrevs: SRCREV_FORMAT is broken, so work around it by setting a global (and
hence bogus for most webkit svn modules) SRCREV
    linux-ezx: more a1200 and rokre6 tweaks, also remove size check since boot_usb can
handle 1MB images quite well nowadays and blob2 can flash like 1.3MB to mtd4
    linux-ezx: fix a1200 and rokre6 defconfig, should fix #3009
    linux-ezx: add 18bpp support to pxafb and enable it for a1200, rokre6 owners will have
to make a small change to arch/arm/mach-pxa/ezx-e6.c
    kdrive-1.3-18bpp.patch: add, but not activate a patch to have 18bpp support in kdrive 1.3
    pointercal: add file for a780
    gconf-dbus: DEPENDS += virtual/libintl
    h2200 defconfig: CONFIG_TOUCHSCREEN_ADC=y
    sane-srcrevs: fix webkit entry, it uses SRCREV_FORMAT, which the generator script
doesn't pickup
    efl: more PV unbreaking
    ecore, edje: try to repair PV going backwards
    sane-srcrevs: bump openmoko-icons2
    linux-ezx: improve rokre6 support
     sane-srcrevs: bump libgsmd
    gdk-pixbuf-csource-native: add a workaround for #3000
    sane-srcrevs: add gconf-dbus
    gconf-dbus: sync with poky, drops dependency on gtk+

likewise@openembedded.org:
    lighttpd: Moved from 1.4.16 to 1.4.18.

mickeyl@openembedded.org:
    moko-autorev.inc: add entry for moko-gtk-engine
    add moko-gtk-engine, a gtk theme engine to improve painting performance
    uboot-openmoko: set localversion to PV
    linux-openmoko-devel: add squashfs 3.2 patch and enable in defconfig as module
    moko-autorev.inc: add missing packages
    openmoko-sound-theme-standard2: rreplaces openmoko-sound-theme
    openmoko-sound-system2: rreplace openmoko-sound-system
    gdk-pixbuf-csource-native: DEPENDS on libpng-native and jpeg-native
    linux-openmoko-devel: add printascii patch, disable it
    linux-openmoko-devel: revert back to using the u-boot uncompressor, since
    libwnck: remove old ones, add dependency to gdk-pixbuf-csource-native
    linux.inc: make convenient selection of root-over-nfs actually work
    sane-srcrevs.inc: bump openmoko-dialer2 and openmoko-sound-theme-standard2
    add openmoko-sound-system2
    linux-openmoko-devel: refactor to use linux.inc
    linux-ezx 2.6.21: repair formatting again
    openmoko-session: remove libgtkstylus. We will handle right clicks differently
    task-openmoko[-feed]: add some packages, move some others around
    openmoko-sound-theme-standard: add classic ringtone, load on startup, bump PR
    linux-ezx 2.6.21: fix formatting (please STOP mixing tabs and spaces), catch up with
linux.inc improvements
    linux.inc: add sizecheck, add convenient support for root-nfs-over-usb
    sane-srcrevs: bump openmoko-terminal2
    openmoko-terminal2: add rdependency on ttf-liberation-mono
    add ttf-liberation fonts
    add termcap, the terminal capabilities file. at least vte needs this to operate
correctly (backspace et. al.)
    vte: add rdependency on termcap

ospite@studenti.unina.it:
    device-table-ezx: add uinput node (ezxd starts before udev and needs it for the power
button)

pH5@openembedded.org:
    pango: add 1.18.1 from Poky
    libgsmd: remove -w parameter for universal
    task-openmoko: let magician use the qvga icon theme
    task-openmoko: only include the gps panel applet for devices that have gps
    fic-gta0[12]: add gps MACHINE_FEATURE
    openmoko-icon-theme-standard2-qvga: icon theme for qvga devices
    preferred-xorg-versions-X11R7.3: fix versions once and for all
    glibc-package.bbclass: fix do_prep_locale_tree

pfalcon@openembedded.org:
    linux-handhelds-2.6 2.6.21-hh9: Drop old version.
    linux-handhelds-2.6 2.6.21: Drop few older versions.
    linux-handhelds-2.6 2.6.21-hh16: Bump PR for defconfigs changes.
    linux-handhelds-2.6: h2200: Update to defconfigman config.
    linux-handhelds-2.6: Fix Hermes/Atmel PCMCIA WiFi support.
    linux-handhelds-2.6: Enable NET_WIRELESS_RTNETLINK.
    linux-handhelds-2.6: hx4700: Dirty magic to enable AX8817X USB Ether driver.
    linux-handhelds-2.6: hx4700: Enable USB WiFi drivers.
    linux-handhelds-2.6: Enable TUN and, where applicable, PPPoE.
    linux-handhelds-2.6: hx4700: Enabled USB Printer/Modem drivers.
    sane-srcrevs.inc: Add linux-hacknev-2.6 rev.
    linux-handhelds-2.6: Enable binfmt misc and ipv6 consistently for all machines.
    linux-handhelds-2.6: Update hx4700 defconfig from defconfigman r395:

rpurdie@openembedded.org:
    dbus: Drop fix-segfault patch. Thei issue it fixed can no longer be reproduced (tested
by thos)
    gcc-cross-initial: Add missing file
    gcc-cross-initial: Use common inc file for a couple more files (from poky)
    gcc-cross-initial: Factor common code into an inc file, don't run make install for
do_install since its pointless (from poky)
    pkgconfig-0.22: Add sysroot support patch from poky

rwhitby@nslu2-linux.org:
    task-openmoko-feed: added bootchart
    openocd: Converted to SRCREV and added to *-*revs?.inc

svolpe@openembedded.org:
    gst-plugins.inc: Fixed QA Compile Badness with X headers and Libs.

xora@openembedded.org:
    evince/evince_2.20.0.bb : new release with gnome 2.20
    mplayer/files/simple_idct_armv5te.S : reduce MAX_NEG_CROP to same as
    mplayer/files/makefile-nostrip-svn.patch : forget to push latest version
    mplayer/mplayer_svn.bb : convert to SRCREV
    mplayer/mplayer_svn.bb : update the svn build again and also add ssvb's
    poppler/poppler_0.6.bb : new version of poppler
    bluez/bluez-utils3.inc : correct quote at end of SRC_URI
    links/links*_2.0+2.1pre30.bb : new version
    libglade/libglade_2.6.2.bb : remove no-deprecation.patch
    sylpheed/claws-mail_3.0.1.bb : new version
    libetpan/libetpan_0.52.bb : new version
    libglade/libglade_2.6.2.bb : version upgrade needed with newer gtk+/glib combo
    gnome/epiphany_2.19.6.bb : add iso-codes to DEPENDS



Bugs fixed:
bug_id resolution	 short_desc
2617 FIXED	 spitz/akita sound mixer misconfiguration
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2972 INVALID	 linux-ezx-2.6.21-ezxdev-r11-do_compile
2976 DUPLICATE	 webkit-gtk-0.0+svnr25489-r25486-r1-do_configure
2981 DUPLICATE	 webkit-gtk-0.0+svnr25505-r25501-r1-do_configure
2984 FIXED	 openmoko-terminal2-2.1.0+r2879-r1-do_configure
2997 FIXED	 gconf-dbus-2.16.0+svnr1-r3-do_fetch
3005 DUPLICATE	 webkit-gtk-0.0+svnr25507-r1-do_configure
3012 FIXED	 webkit-gtk-0.0+svnr25582-r25571-r1-do_fetch
3030 FIXED	 bluez-utils_3.19.bb fails with Exception:<class 'bb.MalformedUrl'>
3034 FIXED	 bluez-utils-3.19-r0-do_package_write_ipk
3036 FIXED	 bluez-cups-backend-3.19-r0-do_package_write_ipk
3037 WONTFIX	 A crash is done while booting Angstrom 2007.1 with binary locales disabled
3039 INVALID	 gcc-cross-4.1.2-r8-do_rm_work
3040 DUPLICATE	 gcc-cross-4.1.2-r8-do_rm_work
3021 FIXED	 gst-plugins-base QA bug


Bugs opened:
bug_id resolution	 short_desc
2998 	 CF Bluetooth doesn't work on resume (spitz)
2999 	 e-wm_0.16.999.041-r0_armv5te.ipk doens't install
3000 	 native.bbclass should clear RRECOMMENDS as well
3001 	 qvga version for free42
3002 	 etk-native-0.1.0+cvs20070819-r0-do_patch
3003 	 engrave-0.0.0+cvs20070819-r0-do_fetch
3004 	 edbus-cvs-r0-do_fetch
3006 	 etk-native-0.1.0+cvs20070819-r0-do_compile
3007 	 latest kernel (2.6.22) does not see the sd-card (akita)
3008 	 gconf-dbus-2.16.0+svnr606-r3-do_compile
3009 	 linux-ezx-2.6.21-ezxdev-r12-do_compile
3010 	 Can't build bluez-gnome-0.14-r1
3011 	 libgpelaunch-0.14-r1-do_compile
3013 	 Add support for squeak-x
3014 	 Updated support for erlang/OTP
3015 	 correct audiofile.m4 to work with automake 1.10
3016 	 make libsdl-qpe buildable with automake-1.10
3017 	 linux-2.6.20-r8-do_install
3018 	 bogus hardcoded paths in patches
3019 	 linux-2.6.22+2.6.23-rc3-r1-do_install
3020 	 pcmciautils gets into an infinite loop in building due to yes
3022 	 linux-2.6.21-r9-do_patch
3023 	 elfutils-0.127-r0 does not build. A warning treated like a bug stops the process.
3024 	 openmoko-browser2-0.0.1+svnr1-r0-do_fetch
3025 	 openmoko-browser2-0.0.1+svnr${SRCREV}-r0-do_fetch
3026 	 linux-2.6.21-r9-do_unpack
3027 	 openmoko-browser2-0.0.1+svnr3004-r0-do_configure
3028 	 Recipe for PyWebKitGtk
3029 	 glibc-2.5-r7-do_package
3031 	 mpd CROSS COMPILE BADNESS
3032 	 espgs doesn't build w/ ijs
3033 	 gutenprint doesn't build
3035 	 please add help2man to Debian openembedded-essential task
3038 	 octave-2.9.14-r0-do_configure
3041 	 dillo segfaults always
3042 	 NOTE: package gconf-dbus-2.16.0+svnr1-r3: task do_fetch: started
3043 	 add supervisor mode
3044 	 djvulibre 3.5.19 not compiling
3045 	 evince 0.9.2 does not build
3046 	 nokia800/pointercal isn't calibrated
3047 	 u-boot 1.1.5 at91sam9260 with eabi patches

In total 41 bugs have been created and 16 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG846zMkyGM64RGpERAopIAJ0QBiv3sezEbasfoDRlAMwOjgbvIACeJA3T
cOpnYizk7ualxXTN5Lba03w=
=Swg6
-----END PGP SIGNATURE-----


