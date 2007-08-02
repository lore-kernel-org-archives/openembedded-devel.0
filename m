Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IGWmG-0008N8-C0
	for openembedded-devel@openembedded.org; Thu, 02 Aug 2007 11:15:28 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l729DMj1029425 for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2007 11:13:23 +0200
Message-ID: <46B1A036.8040509@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 11:13:26 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog 20070726 - 20070802
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
X-List-Received-Date: Thu, 02 Aug 2007 09:15:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Recommended reading: http://www.openembedded.org/monotonephrasebook

crofton@openembedded.org:
    gnuradio_svn.bb : First pass at adding support for GNU Radio. Still needs

daniel@openembedded.org:
    openmook-session2: Start all the other openmoko-panel-applets
    openmoko-session2: Change mb session file so today and dialer are started
    task-openmoko.bb: Remove openmoko-panel-mainmenu as it depends on libmokoui(1)
    qemu_cvs.bb: Fix Makefile so CFLAGS/LDFLAGS in config.mak aren't overwritten

florian@openembedded.org:
    librecord2: Add svn recipe
    task-gpe-*: New GPE tasks
    gpe-image: Update to use new GPE task names.
    e-image: Update to use new GPE task names.
    meta-gpe: Switch to new GPE task names.
    task-gpephone: Add machined, remove some unused bits.
    prismstumbler: Fix build issue with up to date gpsd.
    gpe-calendar: Add 0.91 and update SVN recipe accordingly.
    libsoundgen: add 0.6
    starling: Update svn version number and use esd instead of some pulseaudio which does
not seem to be available.
    machined: update svn bb
    gpe-applauncher: add 0.9
    ptim-manager: Remove patch which was applied upstream.

hrw@openembedded.org:
    uboot-gta01: deployed files are not executable so use -m 0644 during installing them

ifaistos@openembedded.org:
    conf/machine/xilinx-ml410.conf : Initial commit for a machine file for the Xilinx
ML410 dev
    conf/machine/xilinx-ml403.conf : Change url for board description
    classes/magicbox-image.bbclass : Fix a problem with "tail" which failed during fs creation
    packages/asterisk/asterisk-1.2.14 : remove dir from old asterisk package
    packages/asterisk/asterisk_1.2.16.bb : Remove old versions of asterisk
    packages/asterisk/asterisk_1.2.14.bb : remove old versions of asterisk
    packages/asterisk/asterisk-1.2.13 : remove older varsions of asterisk
    packages/asterisk/asterisk-1.2.23 : Add asterisk 1.2.23 which has some

koen@openembedded.org:
    xorg mega commit: merge in change from poky
    eglibc: use SRCDATE for now
    angstrom: add very experimental 'eglibc' ANGSTROM_MODE
    m4-native: make 1.4.8 the default
    eglibc: add svn recipe for eglibc
    matchbox-panel-hacks: patch xrandr-panel-app.sh to (hopefully) work with xrandr 1.3.
should close #2685
    matchbox-wm: also package gconf schema
    libopenraw: add 0.0.2
    matchbox-themes: PACKAGE_ARCH = "all"
    sato-icon-theme: PACKAGE_ARCH = "all"
    sato-icon-theme: add 0.1 from poky
    matchbox-theme-sato: add 0.1 from poky
    gtk-sato-engine: add 0.1 from poky
    ufraw: add 0.12
    gtkimageview: add imageviewing widget
    exiv2: add exif parsing lib
    pidgin: update to 2.1.0
    gtkhtml2: fetch from svn
    edje*: these packages are from cvs, not svn
    u-boot-mkimage-gta01-native_oe.bb: remove conflicting patch
    gnash: add 0.8.0
    disapproval of revision 'f563ab05310af7faf00f83e7bebcae99a5ccb4d8'
    openmoko-theme-standard: fix typo in PV
    openmoko-icon-theme: provide upgrade path
    openmoko-rssreader: rename to openmoko-feedreader2
    openmoko: move NOW srcdates to its own include file and only include it in the
openmoko distro
    disapproval of revision '595f85835a210f4f204d60ffa60017c0d342736b'
    openmoko-session2: add proper RCONFLICTS
    openmoko lib*2: stage stuff so we can build dependants
    openmoko-today2: add libmokoui2 to DEPENDS
    openmoko-today2: set PV to OM standard
    disapproval of revision '0f9c4e9a82d594fcb5e8f31c8f8e761f3d47f099'
    openmoko2.bbclass: add some ugly python foo to get the correct modulename and sourcedir
    openmoko-session2: start matchbox2 and openmoko2 variants where needed
    bluez-utils: depends on libusb
    blassic: add classic BASIC interpreter
    networkmanager: add applet
    bluez-gnome: add 0.10
    networkmanager: add 0.6.5 release
    glibc 2.6: add more broken locales
    gnome-power-manager: split out applets
    synergy: update to 1.3.1
    gnome-power-manager: add 2.18.3
    gnome-panel: add 2.18.1
    libwnck: update to 2.13.5
    gnome-menus 2.16.1: fix packaging
    gnuradio.inc: fix quoting
    pkgconfig.bbclass: more munging
    gnome-vfs: update to 2.18.1
    gnome-desktop: add more DEPENDS
    gnome-keyring: update to 0.6.0
    site: we all have /dev/random, so put it in common
    bluez-hcidump: update to 1.38
    bluez-utils: update to 3.13
    bluez-libs: update to 3.13
    jack: add -ldl, needed for some archs
    gtk 2.10.14: add some patches from poky to have some widgets behave better on high-dpi
screens
    xserver-kdrive 1.2.0: bump PR to get Xw100 rebuilt against a more recent xrandr
    gnuradio: gnuradio-usrp also needs python-core
    gnuradio: packaging fixes:
    gnuradio: enable usrp and package its lib seperately
    guile-native: update to 1.8.2
    gnuradio: add enough python stuff to silence dial_tone.py
    omext: add proof of concept extension handler for openmoko
    gnuradio: fixes
    gnuradio: set PV
    fftw.inc: automake 1.10 workaround
    clutter: rename to clutter-glx so we can have different flavours of clutter
    bluez-gnome: re-add cvs recipe

mickeyl@openembedded.org:
    libgsmd: remove patch guards since patches have been updated - thanks ph5!
    pointercal: add calibration constants for fic-gta0[12]
    openmoko-icon-theme-standard2: don't use SRCREV (yet)
    openmoko* add indirection to make smooth migration from SRCDATE to SRCREV possible
    task-openmoko: switch to openmoko-icon-theme2
    libgsmd: catch up with SVN
    add openmoko-icon-theme-standard2
    openmoko-image: add openmoko-games
    webkit: clean up (guys, please don't mix TABs and SPACEs) and make it build
    oh-puzzles: add libowl to dependencies [should be done in poky as well]
    add libowl (OpenedHand Widget Library) [taken from poky]
    openmoko-panel-plugins: prepare for SVNREV
    task-openmoko: add games, add calculator, remove panel-mainmenu
    openmoko2:
    add oh-puzzles, the Opened Hand Puzzles Collection (taken from Poky)
    fis -> redboot-utils
    simple-firewall -> nylon/
    move fis to nonworking (unfetchable)
    move simple-firewall to nonworking (unfetchable and no sign of alternate download
location)
    minisip-video: fix SRC_URI
    minisip and related libraries: fix SRC_URI and bring svn versions back from nonworking
    move libmnetutil and minisip to nonworking. neither snapshots nor svn is fetchable
    openmoko-session2: remove matchbox-session from SRC_URI
    openmoko-session2: don't ship $bindir/matchbox-session, rather depend on matchbox-common
    sane-srcdates.inc: openmoko*: add SRCDATE = now until the integration work for new
OpenMoko stuff has been done.
    task-openmoko|openmoko-image: adjust for OM-2007.2
    openmoko-theme-standard[2]: set CONFFILES, fix SRC_URI
    first batch of OpenMoko2007.2 stuff
    add openmoko2.bbclass, thanks Koen for spotting
    openmoko-panel-plugin.bbclass: inherit openmoko2
    fic-gta0[12].conf: add dfu-util-native to build/upload utilities
    openmoko.conf: base on angstrom-2007.1.conf

pH5@openembedded.org:
    libgsmd: update gsmd patches again
    libgsmd: update gsmd patches

pfalcon@openembedded.org:
    linux-handhelds-2.6 cvs: CVS HEAD is 2.6.21-hh14.
    linux-handhelds-2.6 2.6.20-hh6: Drop old version.
    linux-handhelds-2.6: Add 2.6.20-hh10, latest tag of 2.6.20 branch (historical).
    opie-taskbar-images 1.2.3: Add missing recipe.
    preferred-opie-versions-1.2.4-pre.inc: Create from preferred-opie-versions-1.2.3-pre.inc
    preferred-opie-versions-1.2.3.inc: Add missing packages.
    opie: Add 1.2.3.
    opie-*: Add 1.2.3.
    linux-handhelds-2.6 2.6.21-hh14: Add 2.6.21-hh14.

polyonymous@openembedded.org:
    preferred-opie-versions-1.2.3: bump preferred konqueror version. Closes #2696
    opie-reader: unicode patch went upstream. Close #2694

rpurdie@openembedded.org:
    base.bbclass: Fix base_get_srcrev()
    base.bbclass: Remove warnings for older bitbake users
    bitbake.conf: Add SRCREV definiton. This is for developers offline use only until we
increase the bitbake version requirements.
    image.bbclass: Fix other bbimage refernce
    image.bbclass: Use system python explicitly, don't use python-native version
    santiy.bbclass: Undo accidental change
    sanity.bbclass: Run sanity checker after configuration parsing for bitbake > 1.8.6
    bitbake.conf: Forcefully expand the cache path - we don't want this to change beyond
this point
    base.bbclass: Only take the slow path if SRC_URI_OVERRIDES_PACKAGE_ARCH is actually
set to something

rwhitby@nslu2-linux.org:
    fis: Made it working again

slapin@openembedded.org:
    palms: Removed obsolete pxapwm-bl driver from defconfigs
    palms: Removed obsolete pxapwm-bl driver from machine configs
    conf/machine/palmt650.conf: Adding pxa2xx-ac97 module to autoload
    opie-taskbar-images: Added Opie backgrounds for devices with 320x320 screen.

stefan@openembedded.org:
    openmoko.conf: Use mirrors to balance load and set FEED_URIS
    Add missing libmokopanelui2 dep for all panel applets.
    It's OpenMoko not OpenMoKo.

woglinde2@openembedded.org:
    file-native/compress.c needs zlib.h so it must depend on zlib-native
    I am to stupid some times it not comes from gettext, it comes
    -spotted by renaming my host zlib.h to see why bug 2679 happens
    -introduce new recipes for classpath-minimal



Bugs fixed:
bug_id resolution	 short_desc
2212 FIXED	 OPIE: IrDA doesn't work properly
2241 INVALID	 gpe-calendar fails to open: Angstrom on Tosa
2332 FIXED	 fix angstroem uclibc for collie and simpad
2478 WORKSFORME	 module packages should 'inherit module'
2630 DUPLICATE	 xrandr doesn't report rotation state
2658 FIXED	 linux-handhelds-2.6-2.6.21-hh11-r1 fails to build
2694 FIXED	 Opie reader doesn't need unicode patch
2696 FIXED	 konqueror-embedded fails looking for oe_runconf
2700 WONTFIX	 ipkg-utils missing in Angstrom feeds
2684 FIXED	 wifi-radar 1.9.6-r0 have wrong dependencies


Bugs opened:
bug_id resolution	 short_desc
2697 	 Bitbake doesn't seem to retry access after lock
2699 	 Bitbake final task error summary is misleading
2688 	 OPIE: feature requests
2689 	 busybox 1.6.0 adduser fails to actually add users
2690 	 Script to make zaurus images usable
2691 	 Sysklogd fails to build
2692 	 lighttpd bb file is configured --without-pcre but pcre is required to read the conf
2693 	 Opie i18n packages need updating to 1.2.3
2695 	 opie reader installs debug and dev versions by default
2698 	 Kernels with usbhost enabled lack drivers for usb devices
2701 	 [PATCH] updated libxslt to 1.1.21
2702 	 [PATCH] updated libxml2 to 2.6.29
2703 	 unable to compile kdrive 1.3.0.0
2704 	 native-quilt reads .quiltrc
2705 	 Updating cups .bb files
2706 	 compulab with 2.6.20 cannot build jffs2 image
2707 	 compulab 2.6.20 kernel needs eabi
2708 	 Package gtk+-2.10.14-r1 fails to compile
2709 	 opie-usermanager 1.2.3 doesn't fetch
2710 	 mplayer dont work with -vo pxa in Spitz
2711 	 add fb.modes to enable qvga resolution in the console
2712 	 does fakeroot  work?

In total 22 bugs have been created and 10 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsaA2MkyGM64RGpERAnQ3AJ9W/YQYk9y7JkI+Nl3YhgEa59J3PwCgoZ01
3kA5grnuwFrcxC7++wkhLas=
=pqXE
-----END PGP SIGNATURE-----


