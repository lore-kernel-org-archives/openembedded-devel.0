Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IbZna-0006Xu-3N
	for openembedded-devel@openembedded.org; Sat, 29 Sep 2007 12:43:52 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8TAcuYY006664 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2007 12:38:57 +0200
Message-ID: <46FE2B42.9040203@student.utwente.nl>
Date: Sat, 29 Sep 2007 12:38:58 +0200
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
X-List-Received-Date: Sat, 29 Sep 2007 10:43:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake@openembedded.org:
    mono-1.2.5.1: add new version, and remove 1.2.5
    compulab-pxa270 2.6.22: add kernel cmdline for jffs2 rootfs
    compulab-pxa270-2.6.22: fix kernel command line, add support for W module
    compulab-pxa270.conf: fix --pad option for making jffs2 images

cesarb@cesarb.net:
    binutils: workaround x86_64 problems, should close #2928

crofton@openembedded.org:
    linux-davinci : Add patch to avoid bloated kernels due to binutils confusion.
    linux-davinci : Update defconfig to current defconfig from git.

cwixon@usa.net:
    abiword: ship glade files, should fix #3062

henryk.ploetz:
    libsdl-net: fix #2813

henryk@openmoko.org:
    mono-native 1.2.5.1: add needed patch libdir patch
    mono-native 1.2.5.1: fix up mono native compile and make mono depend on it

jluebbe@openembedded.org:
    base-files: mount mmc card async
    openmoko-base: use startup_unintrusive.wav instread of startup_openmoko.wav

koen@openembedded.org:
    iproute2: fix include ordering
    dbus.inc: remove libinstall for dbus-glib
    gnome.bbclass: sync with poky
    udev: sync with poky, def_pref 115 negative
    packages/gnome: sync with poky, while maintaining OE tweaks like avahi and gnutls
    network-manager svn: sync with poky
    iproute2: sync with poky
    gnome-keyring: sync with poky
    dbus: sync with poky and use .inc file
    linux-ezx: catch up with svn and unbreak booting by enabling ext2
    linux-ezx: add patches for a1200 flip switch and keys
    pppd: stage headers (from poky)
    networkmanager: clean up packaging a bit
    pointercal: remove broken n800 one
    tasks: update to 0.12 and add owl patch from poky
    linux-ezx: another attemp to disable backlight
    sane-srcrevs: add gtk-webcore stuff (people should use webkit-gtk)
    disapproval of revision 'dafc45b783c7c1867efc20a0f0f316abc5553d5a'
    ezx-boot-usb: use a more recent version to get rokre6 and a1200 working
    ezxd: work around bug in makedevs (doesn't do subdirs) and make the devnod in do_install
    linux-ezx: sync up with eoc and backlight patches
    hal-info: add snapshot since the git one requires an unreleased hal :(
    dht-walnut: fix PACKAGE_EXTRA_ARCHS
    linux-ezx: fix PR
    sane-srcrevs: openmoko tweaks
    linux-ezx: package kernel so people can flash it from userspace on the phone
    linux-ezx: sync a1200 and e6 changes with openezx svn, add more RP patches
    libpng: update to 1.2.20, should fix #2992
    moko-gtk-engine: give proper filename
    libgsmd: select 'ti' vendor for Ezx platforms, still not working, but a lot closer to
the truth than using teh Broadcom vendor
    openmoko-session2: honour ${sysconfdir} instead of hardcoding /etc and mark
matchbox-session as conffile since #$()*&@$*(&#@( ipkg keeps overwriting mine on my a780
    linux-ezx: enable alternate mtd layout for a780
    linux-ezx: substitute 18bpp patch with RP's overlay patch and activate overlay for a780
    libgsmd: apply queued patches and updates from Andzej and Erin
    alsa-state: add config for a780

mwester@openembedded.org:
    libgsmd: Fix return value from lgsm_send(), this fixes the dialer failure on boot.
    openmoko-feed: add kexec-tools to the list of available packages.
    sane-srcrevs.inc: Bump up libmokoui2 to a more recent SVN version as the current
    glibc: ldconfig patch applies to big-endian (armeb) as well as arm.
    /etc/init.d/gsmd: Disable echo before powering on the gta01 GSM modem so that

pH5@openembedded.org:
    preferred-xorg-versions-X11R7.3.inc: fix xserver preferred version (1.4, not 1.4.0)
    openal: add void workaround, otherwise gcc 4.2.1 doesn't want to compile
    openal: add OpenAL, a cross-platform 3D audio API
    pointercal: remove pointercal again, we tried this before :/
    alsa-state: add magician state, bump PR
    pointercal: add hx4700 pointercal
    alsa-state: add asound.state for hx4700
    guichan: fix do_stage
    guichan: a C++ game GUI library using Allegro, OpenGL, OpenLayer and/or SDL

pfalcon@openembedded.org:
    liveramdisk-image: No longer stuff payload during, doesn't scale.
    linux-handhelds-2.6: Generate sample HaRET boot script just like reflash.ctl.
    initscripts 1.0: checkroot.sh: Die, die, die fsck interactivity!
    base-files: PocketPC machines: stop using random / mounts in fstab.
    initscripts 1.0: checkroot.sh: Stop doing random positive login regarding fsck.
    sysvinit 2.86: ENABLE_ROOTFS_FSCK is referenced by checkroot.sh, so add it here.
    opie-taskbar-images: Add recent CVS snapshot to het 320x480 images.

philippe@openembedded.org:
    gtk-webcore: Fix svn recipes. Use SRCDATE instead of SRCREV

rwhitby@nslu2-linux.org:
    ixp4xx-npe: Updated to version 2.4 microcode - already well tested in OpenWrt for some
months, and now under a redistributable in binary form license.
    slugimage: Updated to latest version which can accept the version 3.0 intel microcode.
    ixp4xx-kernel: Ensure zd1211-firmware is built, so it can be included in the rootfs if
the kernel module is included.
    fis: Update to svn rev 6
    slugos-packages: Added bluez-hcidump

svolpe@openembedded.org:
    pango-directfb:  Remove it again do to conflicts with pango
    pango-directfb: Added it back with RPROVIDES to stop conflicts
    gtk+-directfb: added RPROVIDES
    cairo-directfb: R1 Added RPROVIDES to stop interference with cairo
    pango-directfb: Removed since it broke pango builds for other distros.
    gtk+-directfb: r1: Add gtk+ to conflicts list
    pango-directfb: Added directfb support to pango
    gtk+-directfb: r0 Added verion 2.10.14, deleted 2.10.9, fixed gtk-2.10.inc
    cairo-directfb: r1: Added RCONFLICTS for cairo
    cairo-directfb:  Added initial support
    Directfb-1.1.0:  Added Directfb Version 1.1.0
    Fusionsound-1.1.0:  Added Fusionsound 1.1.0

xora@openembedded.org:
    imagemagick/imagemagick_6.3.5-10.bb : new version of image magick.
    libtiff/tiff_3.7.2.bb : change to use oe_libinstall helper based on work



Bugs fixed:
bug_id resolution	 short_desc
1379 FIXED	 imagemagick tries to link with libraries from host /usr
2525 FIXED	 Magick-config --prefix incorrect
2813 FIXED	 libsdl-net fails sanity checks in configure
2842 FIXED	 Linux 2.6.21 support for gumstix boards
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2923 DUPLICATE	 libsdl_net doesnt compile - looking for host includes
2926 FIXED	 Clean build of Angstrom for Gumstix-Verdex Fails
3054 FIXED	 hal-info-20070923+git-r1-do_configure
3055 INVALID	 hal-0.5.10-r0-do_fetch
3056 FIXED	 hal-info-20070618-r0-do_configure
3059 FIXED	 ezx-boot-usb-native-0.1.0+r2060-r1-do_compile
3062 FIXED	 Abiword 2.5.x: Dialogs don't work - with patch
3064 DUPLICATE	 pango-1.16.4-r0-do_compile
3070 INVALID	 udev: sync mount option causes extreme slow flash memory writes
3076 WONTFIX	 opie-mediaplayer2 doesn't build on fresh OE/angstrom


Bugs opened:
bug_id resolution	 short_desc
3065 	 busybox 1.2.1's e2fsck cannot check ro-mounted fs
3066 	 SVN Fetcher default revision is 1
3051 	 glibc-intermediate-2.5-r7-do_compile
3052 	 glibc-intermediate-2.6.1-r1-do_compile
3053 	 ruby-1.8.5 fails to build with dash as /bin/sh
3057 	 claws-plugin-maildir-0.24.4-r0-do_compile
3058 	 claws-plugin-mailmbox-1.13-r1-do_compile
3060 	 starling 0.2-r0 segfaults (gstreamer-critical errors)
3061 	 usb-gadget is broken (at least in card reader and file-backed mode)
3063 	 cups-1.2.12-r0-do_compile
3067 	 dcopidl2cpp and  dcopidl have wrong SRC_URI
3068 	 do_unpack fails the second time when source is a zip files
3069 	 kdrive with support for screens of 800x480
3072 	 A Mastermind-style game *.bb file
3073 	 libetpan fails to link with gnutls
3074 	 linxine-x11 fails with syntax error in configure
3075 	 screen takes long time to start due to huge termcap file
3077 	 Notecase: Updated recipe for 1.6.6
3078 	 networkmanager-0.7+svnr2914-r2-do_compile
3079 	 webkit-gtk-0.0+svnr25804-r1-do_compile
3071 	 Adding Opie Camera2 to OE

In total 21 bugs have been created and 15 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG/itCMkyGM64RGpERAkHkAKCbJCnNEfpCaUtssjaigSiAJjGz6ACggsxW
5aMONRmoK+ipOxj/anwCOhs=
=e8iC
-----END PGP SIGNATURE-----


