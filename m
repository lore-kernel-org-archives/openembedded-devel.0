Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hzbw8-00025r-Jo
	for openembedded-devel@openembedded.org; Sat, 16 Jun 2007 19:19:44 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5GHGJLr017236 for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2007 19:16:19 +0200
Message-ID: <46741AD6.7050406@dominion.kabel.utwente.nl>
Date: Sat, 16 Jun 2007 19:16:06 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog for 20070609 - 20070616
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
X-List-Received-Date: Sat, 16 Jun 2007 17:19:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[the usermanual commits are misleading, the mtn magic selectors are really 'magic' :)]

Laibsch@openembedded.org:
    uim: move debug files into proper package
    fix a couple of LICENSE entries
    libopensync: set default pref to -1 for svn version which seems not to build.
    qemu: apply patch from bug 2157
    uim: fix S in native package
    anthy: improve packaging, some reordering of fields to clean up
    udev: disable parallel compilation
    checksums.ini: correct entries and update URI for three tomoe tar files
    tomoe: hardwire mirror for Japanese sourceforge
    MAINTAINERS: add tomoe to my entry.
    gtkmm: remove version 2.4.8 as announced.  Closes 1148.
    gaim: set DEFAULT_PREFERENCE = "-1" for unfetchable cvs version
    remove a bunch of empty directories
    gsoap: remove erroneous PACKAGES-line
    qt-x11-free: move some debug files into proper package
    wireless-tools: rename pre-release packages to conform to
http://www.openembedded.org/wiki/VersioningPolicy
    wireless-tools: unify
    gspcav1: (futile) attempt at unb0rking package
    MAINTAINERS: add an entry for CoreDump
    gspcav1: update to version 20070508 to make it fetchable again.
    usermanual.xml: Replace references to bitbake 1.6 with 1.8.
    recipes.xml: correct unparallel wording.
    usermanual.xml: denominate for useless use of cat award ;-)

coredump2@openembedded.org:
    gspcav1: Add the required video modules to RRECOMMENDS
    linux-rp-2.6.20: Add V4L support to defconfig-spitz and defconfig-akita to enable
(beside other stuff) USB webcams
    netbase: Correct a comment in /etc/network/interfaces
    gspcav1: Add known-good version from 20070110
    gspcav1: Update SRC_URI

florian@openembedded.org:
    gtk+: Add patch to fix file selector segfault contributed by HEXaBYTE.

hrw@openembedded.org:
    udev: make only udev RPROVIDE hotplug not all packages (from Poky)
    gpsd: added forgotten file
    wireless-tools: dropped 26 & 27, updated 28pre13 to 28
    wireless-tools: add 29pre21, fix packaging for pre10/21 - close #2458

ifaistos@openembedded.org:
    packages/uboot/u-boot.inc : Disable parallel make for u-boot as it fails for no apparent
    packages/linux/linux-magicbox_2.6.19.2.bb : Set correct path for images

koen@openembedded.org:
    e17: add expedite, an evas benchmark
    e.bbclass: fix typo
    gtk+: fix RRECOMMENDS
    matchbox-desktop-2: add matchbox-desktop-2
    busybox: add 1.6.0
    xtscal: recommend a font
    angstrom: split up task-angstrom-x11 in to multiple recipes to stop bitbake 1.8 from
building unneeded packages
    angstrom: add feedarch for at91sam9263ek
    linux 2.6.22rc1: fix version
    matchbox-panel-2: enable startupmonitor applet
    linux 2.6.2x: unify and add deploy for u-boot machines
    parted: add 1.8.7
    ipkg-utils: add patch from poky to include more fields in the ipkg metadata, most
notably the OE: field
    pidgin: recommend gnutls plugin
    u-boot-mkimage-gta01-native: add a static git tag and put patches in OE to stop breakage
    netbase: one more missing dir
    linux 2.6.20, 2.6.21, 2.6.21+2.6.22-rc1: more uImage fixes, don't we love that all
kernel archs behave the same? </sarcasm>
    linux 2.6.20, 2.6.21, 2.6.21+2.6.22-rc1: fix install for uImage
    linux 2.6.20, 2.6.21, 2.6.21+2.6.21+2.6.22-rc1: at91sam9263-ek updates
    grrrr
    netbase: add empty dirs needed for the build
    xcalibrate: merge fixes from poky. This should stop it fetching everytime and allow
builds from machines without internet connection
    gpsd: add default
    linux 2.6.21: elaborate support for at91 and avr32
    linux nokia800: add defconfig for 770
    gpe-login: update to 0.90
    angstrom: blackfin updates
    siteinfo,insane: blackfin is uclinux, not linux
    uclibc: make a bfin arch config instead of a machine config
    gpe: mega update
    Blackfin support:
    meta-toolchain: apply some bits of #2393, still incomplete
    iperf: run gnu-configize
    angstrom: unbreak devices that have CONFIG_PACKET=m
    base-files: copy issue files
    basefiles: preserve issue[.net] contents
    angstrom-minimal-image: drop DEPENDS On task-base
    pulseaudio: fix postinsts
    pulseaudio: improve packaging:
    cairo: update to latest stable (1.4.8), this includes all the performance patches we
apply to older versions
    )

lenehan@openembedded.org:
    perl 5.8.8: Don't set LD_LIBRARY_PATH when running miniperl. This was being
    perl 5.8.8: Directly patch the files that need patching instead of having a
    perl 5.8.8: Fix the regexp for removing /usr/local paths - it was eating the
    poptop 1.3.4: Remove the wtmp plugin, it's built for the wrong arch. I
    poptop 1.3.4: Add 1.3.4 with some changes:
    pptp-linux 1.7.1: Added latest version.
    rp-pppoe 3.8: Remove the definition of S, it was needed before the previous
    usermanual usage: Add the missing section_id on the configuration chapter so
    usermanual: Split each of the original chapters out of usermanual.xml into a
    usermanual/usage: Add some details on what configuration files exist in OE.
    usermanual/recipes: Fill in some details in the staging section.
    usermanual/recipes: Put some basic info in the classes section.
    usermanual: Rename the sample in the recipes chapter from helloworld to

mickeyl@openembedded.org:
    oe/libxosd: add patch making libxosd using 'fixed' as default font --
    add gtkterm, a lightweight gtk-based terminal emulator
    vte 0.11.15 increase packaging granularity
    add libxosd, a library for a TV-like on-screen display w/ X11
    distutils-base.bbclass:
    python-dbus: upgrade from 0.71 to 0.8.1
    pulseaudio: beautify pulse.inc, add gcc4 compliance patch, make 0.9.6 the new default

mwester@openembedded.org:
    Unslung: /usr/bin/mkfs.ext3 - strange script to workaround an mke2fs failure

nicolas.ferre@rfo.atmel.com:
    at91sam9263ek: add support for the at91sam9263-ek evaluation board

pH5@openembedded.org:
    openmoko-libs: add libxosd dependency
    libgsmd: update /etc/default/gsmd for universa, use the -w switch
    libgsmd: really add second universal patch
    libgsmd: add two universal patches, bump PR
    libgsmd: update patches

pfalcon@openembedded.org:
    gpe-todo svn: SCM unpinned packages are always DEFAULT_PREFERENCE = "-1".
    xkbd-layout-ru 0.1.1: Nice Russian layout for xkbd.
    angstrom-2007.1.conf: Set kernel version for PocketPC's:
    libgpevtype 0.50: Add dependency on libtododb.
    busybox-static 1.2.1: Re-aad override dir prioperly with files.
    libmimedir: Fix packaging.
    linux-handhelds-2.6: Drop -hh5, add 2.6.21-hh7.
    mboxkbd-layouts-gui: Add DEPENDS and SECTION.
    mboxkbd-layouts-gui: Util to manage matchbox-keyboard layouts.
    matchbox-keyboard svn: Add patches to support multiple layouts.
    linux-handhelds-2.6: Drop 2.6.21-hh4, add 2.6.21-hh6.
    initramfs-image: A sample initramfs image.
    initramfs-nfsboot 0.1: Sample initramfs script to boot from NFS.
    initrdscripts: New package dir for initrd, initramfs, etc. recipes.
    rootfs_ipk.bbclass: Add new option, PACKAGE_INSTALL_NO_DEPS. If set to 1,
    busybox-static 1.2.1: First cut at static busybox.
    helloworld 1.0.0: Remove duplicate content.
    perl-native 5.8.8: Deactivate patch which unconditionally adds commandline
    uqtreader cvs: ${OPIE_CVS_PV} is defined in opie.bbclass.
    fbreader 0.8.2a: Fix READER_RESOLUTION vs RESOLUTION typos/thinkos.
    fbreader 0.8.2a: Fix type s/${MACHINE}/${MACHINE_ARCH}/.

philippe@openembedded.org:
    gpe-mini-browser : add new 0.21 release and remove some obsolete ones

polyonymous@openembedded.org:
    konqueror-embedded: don't use kde-config while configuring.
    conf/distro/include/preferred-opie-versions-1.2.3-pre.inc: bump preferred konqueror
version
    konqueror-embedded: updated to 20070212 snapshot.
    qsvn: made it build for the sake of additional qt4 testing
    subversion 1.4.3: removed DEFAULT_PREFERENCE of -1 and added do_stage
    uqtreader: a lot of fixes and improvements
    classes/qmake-base: reverted half a patch in order to fix qmake-based qte[-mt] builds.
    qt 4.3.0: pkgconfig fixes
    qt 4.3.0: remove pkgconfig stuff postprocessing - not needed with properly staged qmake2
    qt 4.3.0: some more small fixes
    qmake2-native: reworked for qt 4.3.0

rpurdie@openembedded.org:
    glibc-intermediate: Unset PACKAGES_DYNAMIC (from Poky)
    meta-sdk: Update to use new sdk PACKAGE_ARCH (from Poky)
    task-sdk-base: Fix libgcc name
    gcc-cross-sdk 4.1.2: Cleanup (from poky)
    gcc-cross-initial_3.3.3: Set empty PACKAGES (from poky)
    gcc-package-cross: Remove bogus PACKAGES_DYNAMIC
    sdk.bbclass: Remove unneeded PACKAGES, use DISTRO in SDK_NAME, set PACKAGE_ARCH to
something which doesn't conflict with normal packages (from Poky)
    sanity.conf: Increase bitbake minumum version to 1.6.8 since earlier 1.6 releases
don't work with .dev properly

rwhitby@nslu2-linux.org:
    ftpd-topfield: Updated to 0.7.4

sirfred@openembedded.org:
    xserver-kdrive-imageon X11R7.1-1.1.0 : Fixes a bug in randr coordinates
    xserver-kdrive-imageon X11R7.1-1.1.0 : XV Port changes, cleanups

slapinid@gmail.com:
    gpe-announce 0.13: Fix for libsoundgen 0.5.

Bug fixed:
bug_id resolution	 short_desc
844 WONTFIX	 konqueror-embedded build fix. sort of
922 WORKSFORME	 konqueror-embedded doesn't compile if unsermake is installed
1006 FIXED	 tmp sticky bit
1184 FIXED	 build of gtkmm-2.4.8 fails - time for removal?
1315 DUPLICATE	 usb storage doesn't work under OZ/GPE 3.5.4.1 on spitz
1363 FIXED	 konqueror-embedded_20030705 fails in configure stage (no qte library found)
1369 WONTFIX	 SD not appearing in /dev OZ-3.5.4.2-rc2
1871 FIXED	 Suspend on SLC3200
1945 DUPLICATE	 update meta-toolchain to work with new ipk directory structure
1980 WONTFIX	 perl-native fails to build with stack-smashing protector modified gcc
1995 FIXED	 Konqueror Embedded 2007 preliminary .bb file and patches
2145 FIXED	 do_install fails for libopensync
2157 FIXED	 qemu fails to compile with gcc 4.x
2323 FIXED	 angstrom collie: suspend support
2434 DUPLICATE	 [PATCH] Fix mesa build on AMD64 with i586 target
2438 FIXED	 angstrom 20070604 ipkg update fails on gstreamer feed
2441 WORKSFORME	 ipkg install md5sum badness
2442 FIXED	 qt4-x11-free fails do_compile
2443 FIXED	 QA failure for .debug directory in python-cheetah
2446 FIXED	 fbreader: cannot stat `data/help/MiniHelp.openzaurus.fb2
2447 FIXED	 another parse error
2449 FIXED	 webcam-server:removed MAINTAINER field
2455 FIXED	 QA failure for .debug directory in twisted
2456 FIXED	 QA failure for .debug directory in python-pysqlite2
2457 FIXED	 Package .debug and lua-config for lua
2458 FIXED	 Package files better for wireless-tools
2465 FIXED	 Support /etc/defaults file for gpsd
2469 FIXED	 Add ability to create image consisting of exact package list (by not pulling
up any dependencies)
2475 FIXED	 gpe-announce build failure
2479 FIXED	 poptop seems to be missing files
2485 FIXED	 angstrom-x11-image doesn't build due to libgpevtype package
2486 FIXED	 udev-0.92 build error
2492 DUPLICATE	 cups-1.2.10-r0
2496 DUPLICATE	 pidgin missing gstreamer >= 0.10.12
1353 FIXED	 gpe-session-scripts shouldn't depend on gpe-bluetooth
1785 WONTFIX	 ERROR: QA Issue: non dev package contains .so: qte-mt
2149 FIXED	 angstrom collie image brings up bootsplash in landscape mode
2339 FIXED	 Speaker and earphone output broken in Angstrom akita/20070507 on sharp zaurus
sl-c1000
748 INVALID	 Suspend broken on Simpad
2013 WORKSFORME	 bitbake gpe-image fails on gtk-engines looking for gtk 2.8 (2.6 present)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGdBrWMkyGM64RGpERArVLAJsEr7e6J5jQFx65pay2/qmUPySaPACff6W6
EXS1CHO/+XPSgKDuI+ZEtnY=
=bexu
-----END PGP SIGNATURE-----


