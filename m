Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IdLt0-0004PG-P6
	for openembedded-devel@openembedded.org; Thu, 04 Oct 2007 10:16:46 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l948BOHh014608 for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Oct 2007 10:11:25 +0200
Message-ID: <4704A033.3030106@student.utwente.nl>
Date: Thu, 04 Oct 2007 10:11:31 +0200
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
Subject: OE weekly changelog 20070928 - 20071004
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
X-List-Received-Date: Thu, 04 Oct 2007 08:16:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake@openembedded.org:
    mono 1.2.5.1: add perl-native to DEPENDS
    mono: drop old partially finished versions of mono
    mono 1.2.5.1: disable parallel make due to build issues in the MCS tree
    MAINTAINERS: add argtable to my recipies
    argtable 2.7: add package
    linux.inc: replace == with = to make posix shell compliant
    mtd-utils-tests: add package

crofton@openembedded.org:
    gumstix-verdex : Add support for wired network interface on netwifimicroSD card.
    wifistix : Update conf file with new device name.
    wifistix : Change wifistix wireless device name from mwlan to wlan.
    wifistix-modules : Fix quoting in EXTRA_OEMAKE.
    wifistix-module : Clean up bb file, add configuration file.
    linux : Update patches for gumstix from gumstix buildroot.
    wifistix : Add driver for Marvell cf8385 wireless interface driver for gumstix.

henryk@openmoko.org:
    mono 1.2.5.1: patch genmdesc.pl to use cpp from staging instead of host
    mono.bbclass: fix whitespace problem
    mono 1.2.5.1: added mono.bbclass, many changes required for packaging

koen@openembedded.org:
    sanesrcrevs: bump more openmoko stuff after testing it on the neo
    mplayer: depend on xsp
    ixp4xx-npe: correct download link and instructions
    openmoko-panel-gsm: depend on libnotify
    sane-srcrevs: bump openmoko icon themes
    sane-srcrevs: bump hildon-1
    hildon-1: update PV
    fontconfig: stage nokia device table header
    libhildonhelp: correct DEPENDS
    libhildonfm: add 1.9.41 works against a stock gtk+!
    gtk-2.10.inc: add hack for maemo software
    atk: remove def_pref from 1.19.3
    hx4700: kdrive 1.3.0.0 also has Xw100
    midori: add 0.0.8
    site: commit some local changes
    gst-meta-base: gst-plugins-bad is needed for ivorbis
    er0100: catch up with include renaming
    mplayer svn: use iwmmxt when appropriate MACHINE_FEATURE has been set
    er0100: commit it, this has been sitting in my repo for too long
    iwmmxt machines: add 'iwmmxt' as machine feature
    dbus: include uidgen as well
    dbus: tweak packaging, should help XorA's single core build :)
    sanesrcrevs: bump webkit dependants to catch up with gdk->gtk renaming
    pidgin: update to 2.2.1
    sane-srcrevs: bump openmoko-today, openmoko-theme2 and webkit
    webkit-gtk: catch up with gdk->gtk rename
    dbus.inc: remove unused var

likewise@openembedded.org:
    gnome-keyring: Change package version from 2.20 to 2.20.0. Fixes bb parsing.

pH5@openembedded.org:
    xserver-kdrive-common: only consider Xw100/Ximageon if the device has such a chip
    xserver-kdrive-common: fix tabs/indentation of Xserver script
    xserver-kdrive-common: fix path for Xw100 and Ximageon
    neod: make it work with magician and hx4700
    guichan: make libguichan-sdl actually link against sdl-image
    angstrom-x11-base-depends: inherit task.bbclass
    moko-gtk-engine: fix and update SRCREV in sane-srcrevs.inc
    python-native: drop NOTEs from cross-distutils.patch
    python-netclient: RDEPEND on python-stringold (urllib imports string)
    python-xml: RDEPEND on python-netclients (saxutils imports urrlib)

pfalcon@openembedded.org:
    htcblueangel.conf: Remove PREFERRED_VERSION for kernel.

polyonymous@openembedded.org:
    procps: fixed build error, supposedly closing #3081.

rpurdie@openembedded.org:
    glibc-initial: Clear PACKAGES_DYNAMIC to avoid bogus values
    gcc-cross: Update paths to reference staging instead of cross (from poky), bump PR to
make sure gcc-cross reinstalls after cross changes to ensure everything works correctly
    glibc: No longer need to install to cross as well as staging (from poky)
    glibc-initial: Can install to staging instead of cross due to cross-linkage
    linux-libc-headers: Add dependency on cross-linkage, no longer need to install headers
to cross/ (from poky).
    Add cross-linkage from poky
    package_(deb|ipk).bbclass: Rename package index stamp to make it more obvious what its
for (from poky)
    package_deb.bbclass: Map TARGET_ARCH to DPKG_ARCH to keep dpkg/apt happy with 'valid'
archs (from poky)
    package.bbclass: Fix .packaged pkgmaps data creation to fix depchains. Clean
up/optimise PACKAGES checks a bit
    kernel.bbclass: Add menuconfig task (from poky)
    kernel.bbclass: Package vmlinux file (used by oprofile) (from poky)
    insane.bbclass: Raise exceptions, not strings (from poky)

russf@topia.com:
    portmap: depend on fakeroot-native, closes #3016

xora@openembedded.org:
    uboot/u-boot-mkimage-openmoko-native_oe.bb : make build include dirs be
    linux/linux-openmoko_2.6.22.5.bb : version bump to get new defconfig that
    linux/linux-openmoko/defconfig-2.6.22.5-fic-gta0? : make both of these
    openmoko2/openmoko-theme-standard2_svn.bb : remove creation of gtkrc
    mplayer/mplayer_svn.bb : disable imageon as building is broken
    linux/linux-rp_2.6.22.bb : re-add the w100-extmem patch so that Ximageon
    xorg-xserver/xserver-kdrive-imageon_1.2.0.bb : enable built in fonts
    xorg-xserver/xserver-kdrive-1.2.0/kdrive-imageon.patch : drop duplicate old
    sane-srcrevs.inc : update some openmoko revs
    openmoko2/openmoko-dates2_svn.bb : version bump to latest for thomas
    libgcrypt/libgcrypt_1.2.3.bb : PR bump for last change
    libgcrypt/libgcrypt_1.2.3.bb : remove custom do_stage as its not needed and
    packages/atk/atk_1.20.0.bb : add newer atk from poky
    conf/distro/include/sane-srcrevs.inc : add network manager REVs from poky
    conf/distro/angstrom-2007.1.conf : update version of dbus-glib for angstrom.
    packages/dbus/dbus-glib_0.74.bb : add updated version from poky, remove



Bugs fixed:
bug_id resolution	 short_desc
3066 INVALID	 SVN Fetcher default revision is 1
2860 FIXED	 mono: complete packaging
2861 FIXED	 mono: mcs directory (C#) code is not being built
2862 FIXED	 mono: finish native package
2864 FIXED	 mono: add .NET 2.0 profile
3022 INVALID	 linux-2.6.21-r9-do_patch
3042 FIXED	 NOTE: package gconf-dbus-2.16.0+svnr1-r3: task do_fetch: started
3059 FIXED	 ezx-boot-usb-native-0.1.0+r2060-r1-do_compile
3070 INVALID	 udev: sync mount option causes extreme slow flash memory writes
3076 WONTFIX	 opie-mediaplayer2 doesn't build on fresh OE/angstrom
3079 FIXED	 webkit-gtk-0.0+svnr25804-r1-do_compile
3080 FIXED	 New package - gumstix wifistix kernel module
3081 FIXED	 procps-3.2.7-r5-do_compile
3082 DUPLICATE	 webkit-gtk-0.0+svnr25808-r25801-r1-do_compile
3083 DUPLICATE	 webkit-gtk-0.0+svnr25808-r25801-r1-do_install
3084 FIXED	 bitbake fails to parse gnome-keyring_2.20.bb
3086 INVALID	 linux-ezx-2.6.21-ezxdev-r24-do_compile
3088 LATER	 ixp4xx-npe-native-2.4-r0-do_fetch
3091 FIXED	 dbus-1 - 1.0.2-r5 does not install dbus-daemon
3093 FIXED	 dbus-glib-0.74-r0-do_configure
3096 FIXED	 midori cannot find WebKitGdk
3097 FIXED	 gnome-vfs-2.20.0-r0-do_compile
3098 FIXED	 gnome-vfs-2.20.0-r0-do_configure
3099 FIXED	 gail-1.20.0-r0-do_configure
3100 FIXED	 gnome-keyring-2.20.0-r2-do_configure
3101 FIXED	 libhildonfm-1.9.41-r0-do_compile
3103 FIXED	 libbonoboui-2.18.0-r1-do_compile
3105 FIXED	 wrong bash test syntax in linux.inc
3106 FIXED	 Portman is missing a DEPENDS for fakeroot-native
3107 FIXED	 mono-1.2.5.1-r2-do_compile
3110 FIXED	 liba52-0.7.4-r1-do_configure
3111 FIXED	 liba52-0.7.4-r1-do_compile
3112 FIXED	 mplayer-0.0+1.0rc1+svnr24587-r3-do_compile


Bugs opened:
bug_id resolution	 short_desc
3102 	 unrecognized option `-Qy' to arm-angstrom-linux-gnueabi-as on x86_64
3072 	 A Mastermind-style game *.bb file
3073 	 libetpan fails to link with gnutls
3074 	 linxine-x11 fails with syntax error in configure
3075 	 screen takes long time to start due to huge termcap file
3077 	 Notecase: Updated recipe for 1.6.6
3078 	 networkmanager-0.7+svnr2914-r2-do_compile
3085 	 gcc-cross-4.2.1 fails to build
3087 	 dbus-glib-0.72-r0-do_configure
3089 	 gcc-cross-4.1.2-r9-do_compile
3090 	 liboil-0.3.11-r0-do_compile
3094 	 ixp4xx-npe-2.4-r0-do_fetch
3095 	 e2fsprogs-1.38-r8-do_compile
3104 	 maemo-mapper-1.4.7+svnr108-r2-do_compile
3108 	 bb files for monit 4.9
3109 	 bitbake gpe-image fails on gpe-mini-browser
3113 	 xserver-kdrive-xomap-1.1.99.3-r0-do_compile
3114 	 patch for alsa driver on cm-x270 boards with CS4202 audio chip
3115 	 angstrom-minimal-image-1.0-r0-do_rootfs
3116 	 problem installing libmono2.0-cil_1.2.5.1-r2_armv4t.ipk
3092 	 Same problem like Bug 2289
3071 	 Adding Opie Camera2 to OE

In total 22 bugs have been created and 33 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHBKAzMkyGM64RGpERAhhiAJ9+0f3bMN5WH5mskrKB53QeyzQp6wCfV509
MnJ9WMrNCDpf7VL/PtYxD1Q=
=Ftpx
-----END PGP SIGNATURE-----


