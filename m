Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiRJU-0001HY-9P
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 11:05:09 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9I8wNUx027541 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2007 10:58:23 +0200
Message-ID: <47172032.6050000@student.utwente.nl>
Date: Thu, 18 Oct 2007 10:58:26 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: OE weekly ChangeLog 20071011 - 20071018
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
X-List-Received-Date: Thu, 18 Oct 2007 09:05:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

bluelightning@bluelightning.org:
    libqpe: bump PV for CVS version - closes #3152

cbrake@openembedded.org:
    em-x270.conf: remove redundant "arm" in PACKAGE_EXTRA_ARCHS
    em-x270: add machine/kernel support (from compulab)
    glibc 2.3.3+cvs20050221: fix patch pnum (from Robert Shuster)
    linux 2.6.23: add kernel version, cm-x270 support, and binutils patch from poky

daniel@openembedded.org:
    conf/distro/openmoko.conf: Remove month name from DISTRO_VERSION
    alsa-state: Add state file gsmspeakerout (fic-gta01)
    matchbox-keyboard: Bump svn revision and remove some patches in the bb file

eha@doredevelopment.dk:
    libid3tag: update to 0.15.1b, fix SRC_URI - close #3147
    libmad: fix SRC_URI - close #3147

florian@openembedded.org:
    bd-neon.conf: Use regular linux 2.6.22 recipe.
    linux: Add bd-neon support to 2.6.22 recipe.
    minimo: Fix libIDL linking (patch by Takeshi Hamasaki <hma@syd.odn.ne.jp>)

henryk@openembedded.org:
    python-pygtk-2.10.4: Fix duplicate ${PN}-dev in PACKAGES
    conf/distro/openmoko.conf: Fix regex for the https case
    classes/angstrom-mirrors.bbclass: fix mirror regex
    libgsmd: fix typo in last commit
    gtk-sharp: Inherit pkconfig to stage .pc files, so other packages can compile against
gtk-sharp
    mono.bbclass: Stage all .dll files that have been packaged so that other packages can
compile against them
    openmoko-appmanager2: DEPENDS on libipkg from ipkg
    mono: Remove obsolete files, update README
    mono: add recipe for building from svn

hrw@openembedded.org:
    checksums.ini: add some new entries created by generator built-in to base.bbclass
(from Poky)
    base.bbclass: add checksums.ini generator (from Poky)
    sane-srcrevs: bump openmoko-today2
    libid3tag: use SOURCEFORGE_MIRROR
    libmad: use SOURCEFORGE_MIRROR
    disapproval of revision '6491515c0991b335eb83774c7692f5c94ed7c304'
    libmutil: dropped empty dir
    opie-usermanager: drop as this is not supported in OPIE since 1.2.3 - close #2709
    at91sam92*: fix require lines
    ttf-liberation: fetch from http not https - closes #3153
    neod: added apm into RDEPENDS
    neod: added alsa-utils-amixer into RDEPENDS
    neod: no need to have gconf in DEPENDS when gconf.bbclass is inherited
    neod: added gpe-scap and xrandr into RDEPENDS
    sane-srcrevs: bump openmoko-dialer2 to get fix to OM #860

ifaistos@openembedded.org:
    conf/machine : Remove MACHINE_TASK_PROVIDER from all machines that defined it

jluebbe@openembedded.org:
    linux-openmoko-devel: add missing patches (thanks mickey)
    linux-openmoko-devel: update to 2.6.23.1

khem@openembedded.org:
    Handle new textinfo version in binutils configure.

koen@openembedded.org:
    xserver-kdrive-common: nothing support PACKAGE_ARCH = "<distro>", we don't want those,
and you can't build 2 distros in the same TMPDIR anyway.
    task-sdk: fix uclibc
    meta-toolchain: include target os to distinguish between (e)glibc and uclibc
    sdk.bbclass: package more debug files
    rootfs_deb.bbclass: fix hardcodes
    rootfs_ipkbbclass: fix hardcodes
    python-2.5-manifest.inc: fix hardcodes
    libgsmd: add maxrev to patches that have been applied upstream (finally!)
    sanesrcrevs: bump some openmoko stuff, tested on a780 and gta01
    linux-bfin: re-enable touchscreen since r3731 fixed it
    sane-srcrevs: update linux-bfin
    blackfin machine: use linux-bfin
    elf2flt: update to match cross dir updates
    sane-srcrevs: add blackfin stuff
    linux-bfin: add kernel from blackfin svn, currently support adzs-bf548-ezlite
    linux.inc: try harder to find a kernel image in arch/<foo>/*
    linux-libc-headers: add 0.23
    adzs-bf548-ezlite: add machine and defconfig
    gutenprint: fix packaging, it builds for me now
    linux-openmoko-devel: use patch instead of forcing people to download 40MB every time
the nano version gets bumped, also apply patch using patch.bbclass instead of inside silly
do_prepatch hack
    ijs: add 0.35
    gutenprint: add 5.1.3, this doesn't work yet, but -native needs it
    mango-lassi: add depends
    mango-lassi: add git version, needs dbus > 1.1.1 for `dbus_connection_set_allow_anonymous'
    avahi-ui: hack to get libavahi-ui built and packaged
    busybox: enable more stuff in angstrom config, fixed #3150
    angstrom-2008.1: use busybox 1.7.2
    openmoko-panel-bt: depend on libnotify
    busybox: add 1.7.2, remove most OE patches
    uclibc 0.9.29: add patches from buildrot to fix mmap

likewise@openembedded.org:
    mpd: Added sane revision.

mickeyl@openembedded.org:
    uboot-openmoko svn build variants for gta02v3 and gta02v4
    add {meta|task}-toolchain-openmoko{-sdk} based on meta-toolchain
    meta-toolchain: softlink libgcc_s.so until libgcc_s-dev gets built
    alsa-state: (fic-gta01) limit PCM a bit and crank up Amplifier, so that we are less
likely to distort in the PCM section
    xserver-kdrive-common_openmoko: fix (cosmetic) merge damage in Xserver script
    openmoko-mediaplayer2: add dependency on curl
    openmoko-sound-system: depend on gst-plugin-pulse
    openmoko-session: set pulsesink and pulsesrc as gstreamer default output
    openmoko-common2: remove pixmaps that ought to be part of openmoko-Xserver from here
    meta-toolchain: only touch pkgconfig files if they're actually present
    xserver-kdrive-common: install xsplash ppms for branding

mwester@openembedded.org:
    slugos-packages: Added curl and cups

nicolas.ferre@atmel.com:
    vlc-gpe: use proper pkg-config - close #2949

pH5@openembedded.org:
    magician.conf: use xserver-kdrive as virtual/xserver, add display info

purdyd_at_wisheights@yahoo.com:
    gutenprint: add gutenprint native (need cups-native and libijs-native on host)

rwhitby@nslu2-linux.org:
    slugos-{packages,native}: Fixed building empty packages
    slugos-packages: Promoted some packages that now build, and demoted some that don't
    slugos.inc: require sane srcdates and srcrevs
    slugos-packages (and derivatives): inherit meta so all packages are built for the feeds

stefan@openembedded.org:
    gst-plugins.inc: conifugre parameter should start with  two hyphens instead of one.
    gst-plugins.inc: Disable cdaudio as it breaks if you have libcdaudio-dev

svolpe@openembedded.org:
    directfb_1.1.0 r1: Disabled vnc by default

todd@openembedded.org:
    ghi270: Provide initial support for Grayhill ghi270 platform.

xora@openembedded.org:
    packages/uboot/uboot-openmoko_svn.bb : same idirafter fix as rest of uboot
    packages/gtk-webcore/midori_0.0.10.bb : version bump midori, this one
    packages/uicmoc/uicmoc4-native_4.3.1.bb : fix problem some people are

packages/uboot/uboot-openmoko_1.2.0+gitf34024d4a328e6edd906456da98d2c537155c4f7+svn2943.bb
: add patch to stop pulling in files from host by accident
    uboot/files/makefile-no-dirafter.patch : this patch is more general
    packages/tasks/task-openmoko.bb : add appmanager2 and browser2 to images
    packages/openmoko2/openmoko-appmanager2_svn.bb : fix packaging
    packages/openssh/openssh_4.6p1.bb : package sftp-server seperately from
    packages/usbpath/usbpath_svn.bb : DEPENDS on libusb and native does as well.
    conf/distro/*srcrev* : add usbpath
    packages/usbpath/* : add usbpath library and add is as DEPENDS to
    packages/ipkg/ipkg-collateral.bb : remove hard setting of PACKAGE_ARCH to
    distro/openmoko.conf : make gta01/02 equivalent machines for packages
    packages/gtk+/gtk+-fastscaling_2.10.14.bb : split out fast innaccurate



Bugs fixed:
bug_id resolution	 short_desc
468 WONTFIX	 osso-gnome-vfs2_2.8.4.4-1.bb should depend on samba-3.0.14a
1570 DUPLICATE	 ncurses-native-5.4-r8 OE install fails to place libncurses.so.5 correctly
1583 FIXED	 hostap-fw-load doesn't work with bash
1590 FIXED	 libmutil cannot be fetched
1736 FIXED	 omap1710h3 lack kernel configuration
1766 FIXED	 a1200 lack kernel defconfig
2403 FIXED	 minimo build process needs libidl-dev on host side.
2554 FIXED	 broken cross build environment / fix ncurses build
2709 WONTFIX	 opie-usermanager 1.2.3 doesn't fetch
2765 FIXED	 Upgrade to net-snmp 5.4.1
2844 FIXED	 lograte fails to package
2847 INVALID	 gpe-lock-display on screen keyboard is cut-off when using rotated screen
2852 FIXED	 mono-1.2.4+1.2.5pre5-r3-do_compile
2903 FIXED	 claws-plugin-maildir-0.24.4-r0-do_configure
2949 FIXED	 vlc-gpe do_compile error modules/gui/pda/pda.c
2998 FIXED	 CF Bluetooth doesn't work on resume (spitz)
3048 FIXED	 at91sam9260ek/at91sam9261ek include nonexisting file
3057 FIXED	 claws-plugin-maildir-0.24.4-r0-do_compile
3058 FIXED	 claws-plugin-mailmbox-1.13-r1-do_compile
3116 FIXED	 problem installing libmono2.0-cil_1.2.5.1-r2_armv4t.ipk
3121 FIXED	 claws-plugin-rssyl-0.13-r0-do_compile
3142 INVALID	 cannot find package when PACKAGES ${PN} is empty
3143 FIXED	 cramfs and smbfs not defined as DISTRO_FEATURES
3144 FIXED	 bind-9.3.4-P1
3145 FIXED	 Upgrade to vlan-1.9 and fixed SRC_URI
3147 FIXED	 upgrade to libid3tag-0.15.1b and fixed URI for libmad-0.15.1b
3148 INVALID	 nmap-4.20-r0-do_fetch
3149 INVALID	 nmap-4.20-r0-do_configure
3150 FIXED	 busybox 1.7.2 shell issues
3152 FIXED	 libqpe-opie_cvs needs version bump
3153 FIXED	 ttf-liberation do_fetch fails with certification error
3157 INVALID	 Dropbear requires libz.so.1
3160 FIXED	 matchbox-panel-2-0.1+svnr1626-r8-do_configure
3167 FIXED	 Add machine configuration for EM-X270
3170 FIXED	 meta-toolchain fails at binutils-cross-sdk fails on x86/Angstrom with QA errors
3171 INVALID	 gcc-cross-sdk-4.1.2-r6-do_unpack
3172 FIXED	 uclibc-0.9.29-r8-do_configure
1318 INVALID	 Metabug for OpenZaurus 3.5.5
3138 FIXED	 makeinfo confused by too many params
3092 INVALID	 Same problem like Bug 2289
1791 DUPLICATE	 db1200 lack kernel information


Bugs opened:
bug_id resolution	 short_desc
3166 	 Enable the developer to choose what shell will be used
3146 	 Samba smbfs and cifs packages
3151 	 uImage compression broken by recent kernel decompression changes
3154 	 opie-batteryapplet not included by default
3155 	 Patch for libgstmad to generate 16-bit output instead of 32-bit
3156 	 autotools_stage_all() tried to copy nonexistant files
3158 	 Can't build linux-rp_2.6.22.bb
3159 	 iputils package set ${PN} package empty
3161 	 h5000 lacks usbhost module
3162 	 Angstrom h5000 support metabug
3163 	 h5000 doesn't report second battery
3164 	 h5000 sleeves don't work
3165 	 Add kernel-vmlinux to blacklist
3168 	 dbench-3.04-r1-do_install
3169 	 meta-toolchain fails to build when icecc is used
3173 	 PATCH: libopieobex: disable bluetooth detection

In total 16 bugs have been created and 41 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFyAyMkyGM64RGpERAk01AKC8N5BSp9Mw6uqtCZLvKzcjY1MwZgCfTFiy
s2zLpAnIDoAguFriJPs3zlc=
=oMv6
-----END PGP SIGNATURE-----


