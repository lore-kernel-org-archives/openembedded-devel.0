Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ig098-0008Rd-MW
	for openembedded-devel@openembedded.org; Thu, 11 Oct 2007 17:40:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9BFYF98022208 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2007 17:34:15 +0200
Message-ID: <470E4272.3000800@student.utwente.nl>
Date: Thu, 11 Oct 2007 17:34:10 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
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
X-List-Received-Date: Thu, 11 Oct 2007 15:40:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake@openembedded.org:
    tiff 3.7.2: patch configure.ac to work with auto automake 1.10
    cm-x270.conf: add variable for NAND flash eraseblock size
    compulab-px270 kernel: set compatible machine to cm-x270 (machine name change)
    rename compulab-pxa270 machine to cm-x270
    argtable 2.7: mv to packages, and fix 2.7 version info in recipe

crofton@openembedded.org:
    rxvt-unicode_7.9.bb : Fix LD_LIBRARY_PATH so tic finds a library. From bug #2807.

eha@doredevelopment.dk:
    vlan: update to 1.9
    bind: update to 9.3.4
    task-base: add cramfs and smbfs DISTRO_FEATURES, closes #3143
    logrotate: fix packaing, closes #2844e

florian@openembedded.org:
    gpe-session-scripts-phone: Load ALSA profile in session startup.
    u-boot: Add support for Boundary Devices Neon board.
    tslib: bump PR
    tslib: Add NEON board support files
    linux-bd-neon: Use KERNELORG_MIRROR
    linux-bd-neon: Linux kernel for Boundary Devices Neon boards.
    bd-neon.conf: New machine: Boundary devices NEON board.

freyther@openembedded.org:
    contrib/mtn2git: mtn add is not recursive by default, actually add files ;)
    contrib/mtn2git: Add a tool to export the monotone database to git
    packages/qmake/qmake2-native: Move the LFLAGS to the end of the linker line
    packages/llvm: Build version 2.1 of LLVM
    packages/icu/icu-3.6: Use binconfig to stage icu-config to avoid having icu-config
- --ldflags return the host dirs

gilligan@openembedded.org:
    * armmon_xfer: Tool to automate tarnsfer of kernel/ramdisk to compulab

henryk@openmoko.org:
    mono: clean up packaging
    gtk-sharp 2.10: add package
    ipkg: fix long filenames

hrw@openembedded.org:
    sane-srcrevs: bump openmoko-contacts2 to get fix for openmoko #815
    linux 2.6.22: provide symlink to latest kernel image built for Compulab CM-X270 board
    linux: provide symlink to lastest kernel image built
    cm-x270: added iwmmxt into archs and features
    cm-x270: prefer 2.6.22 version of linux not compulab-pxa270
    cm-x270: change kernel provider to linux
    linux 2.6.22: merge cm-x270 kernel (from compulab-pxa270 recipe)
    x86 machines: added 'x86' MACHINE_FEATURE to limit amount of overrides needed when
package need x86 special options - look at mplayer as example
    lmsensors-apps: ugly fix to get it properly packaged
    lmsensors-apps: added missing patch
    gnutls: update to 1.6.3, remove autoconf 2.59 hack (from Poky)
    task-boot: include keymaps for devices with keyboard (taken from Poky)

jluebbe@openembedded.org:
    linux-openmoko-devel: add missing squashfs port to 2.6.23
    linux-openmoko-devel: change CONFIG_LEDS_S3C24XX from module to compiled-in.
    linux-openmoko-devel: correct versioning mistake (thanks, koen!)
    linux-openmoko-devel: Upgrade to 2.6.23-rc9
    openmoko2: use startup_unintrusive.wav instread of startup_openmoko.wav

koen@openembedded.org:
    disapproval of revision 'c5093a8451fb4abb52c3c01148a1b9f6139e116e'
    task-base: add smbfs and cramfs distro features
    isane-srcrevs: bump more openmoko stuff, tested on a780 and fic-gta01
    bluez: update to 3.20
    bluez-libs: add 3.20
    ex-angstrom images: move to image dir
    altboot*: fix includes
    minimal-image-mtd: fix include
    angstrom images: rename, see previous commit
    angstrom images: rename, it's safe now since reenoo stopped sending me hatemail
    at91*: use uImage
    machines: don't include .conf files, they were renamed to .inc files like a month ago
    gcc: add 4.2.2
    linux.inc: add RPSRC
    dropbear: familiar: DIE DIE DIE
    linux 2.6.21: replace gumstix 18bpp patch with pxa-overlay patch from RP
    mono: add missing file
    linux 2.6.21: patch tsc2003 to scan at more addresses
    2.6.21: add support for the ts controller on the console-vx-lcd gumstix boards
    kdrive: move patch to proper place
    xserver-kdrive 1.3: add patch to get the gumstix lcd working
    hal: enable pci when available
    llvm: commit WIP hacks to keep holger busy
    sane-srcrevs: add openmoko-appmanager2
    openmoko-appmanager2: add it
    sane-srcrevs: bump some stuff
    webkit-gtk: add unstage task till Holger fixes qmake
    gcc 4.2.1: make maverick stuff ep93xx specific
    ipkg: check in missing patch

laforge@openmoko.org:
    conf/bitbake.conf, conf/machine/fic-gta02.conf : fix arguments for yaffs

likewise@openembedded.org:
    linux-efika: Moved from 2.6.20.11-cfs to .20.20-cfs. Needed div64_32() symbol
weakening in lib.
    fastcgi: Disable parallel build, it's broken
    lighttpd: split plugin modules into separate packages.
    mpd-alsa-svn: Added FLAC, Ogg and AAC.
    linux-efika-2.6.20.x: Include sound support as modules.
    mpd: Added mpd-alsa from SVN. Builds, but needs configuration love.

mickeyl@openembedded.org:
    gdk-pixbuf-csource-native: add necessary dependencies (gettext-native, glib-2.0-native)
    python-pygobject[-native]: drop 2.12.2, add dependency on glib-2.0[-native]

pH5@openembedded.org:
    glib-2.0: add 2.14.1
    angstrom-2008.1.conf: revert accidental xorg downgrade
    preferred-xorg-versions-X11R7.3: upgrade xdpyinfo to 1.0.2

pfalcon@openembedded.org:
    linux-handhelds-2.6: Add htcsable to COMPATIBLE_MACHINES.
    h1910.conf: Remove PREFERRED_VERSION_linux-handhelds-2.6.
    angstrom-2007.1.conf: Use linux-handhelds-2.6_2.6.21-hh16.
    linux-handhelds-2.6: Add 2.6.21-hh17.
    gpsd: Cleanup startup script.

philippe@openembedded.org:
    gtk-webcore : update default preferences
    disapproval of revision '7b5746140aa364c513fc814efde39c90df31234e'

rwhitby@nslu2-linux.org:
    nfs-utils: Removed duplicated chunks in uclibc patch
    slugos-init: Load ehci-hcd on boot
    task-slugos: Add ehci-hcd to the rootfs

stefan@openembedded.org:
    ohm_git.bb: Touch gtk-doc.make and disable xauth to let it build again.

svolpe@openembedded.org:
    fpdf: r0  Initial release

xora@openembedded.org:
    packages/sylpheed/claws-mail_3.0.2.bb : version upgrade and bring
    yaffs2/yaffs2-utils-native_cvs.bb : DEPDENDS on mtd-utils-native
    packages/mtd/mtd-utils-native_1.0.0+git.bb : fix incomplete commit and
    packages/mtd/mtd-utils-native.inc : dont override do_stage because we
    distro/include/moko-autorev.inc : add dft-util/dfu-util-native thanks roh
    classes/insane.bbclass : x64_64 becomes x86_64 which is more useful
    openmoko2/libmokojournal2_svn.bb : gtk-doc patch
    mplayer/files/mplayer-imageon-svn.patch : I am now handing koen my passport
    mplayer/files/pxa_configure.patch : fix patch AGAIN, this is I am a koen day.
    mplayer/mplayer_svn.bb : fix pxa_configure.patch to not disable imageon
    packages/mplayer/mplayer_svn.bb : update the c7x0 and hx4700 w100 support
    libw100/libw100_svn.bb : make this the default as we need it for
    gcc/gcc-cross_4.2.1.bb : de-koen the gcc-cross so if you wish to cause anyone
    machine/include/zaurus-2.6.inc : virtual/xserver = xserver-kdrive
    distro/angstrom-2008.1.conf : update to udev 115 for speed and fun

zecke@selfish.org:
    glib-2.0-2.14.0: fix inline warnings with gcc 4.2 in gutils.h



Bugs fixed:
bug_id resolution	 short_desc
2765 FIXED	 Upgrade to net-snmp 5.4.1
2807 FIXED	 rxvt-unicode fail compile terminfo
2844 FIXED	 lograte fails to package
3043 FIXED	 add supervisor mode
3089 FIXED	 gcc-cross-4.1.2-r9-do_compile
3107 FIXED	 mono-1.2.5.1-r2-do_compile
3109 FIXED	 bitbake gpe-image fails on gpe-mini-browser
3110 FIXED	 liba52-0.7.4-r1-do_configure
3111 FIXED	 liba52-0.7.4-r1-do_compile
3117 FIXED	 glibc-2.5-r7-do_rm_work
3118 DUPLICATE	 glibc-2.5-r7-do_rm_work
3129 INVALID	 gcc-cross-initial-4.1.1-r14-do_patch
3130 FIXED	 lmsensors-apps-2.10.1-r2-do_patch
3133 FIXED	 mono-1.2.5.1-r3-do_compile
3143 FIXED	 cramfs and smbfs not defined as DISTRO_FEATURES
3144 FIXED	 bind-9.3.4-P1
3145 FIXED	 Upgrade to vlan-1.9 and fixed SRC_URI


Bugs opened:
bug_id resolution	 short_desc
3135 	 'unexport' attribute of variable still doesn't work sometimes
3119 	 Fakeroot 1.7.1 not available from Debian repositories
3120 	 gcc-cross-kernel-3.3.4-3.3.4-r5-do_populate_staging
3121 	 claws-plugin-rssyl-0.13-r0-do_compile
3122 	 bitbake gpephone-image fails on liblipsevent due to incorrect MD5/SHA256 checksums
3123 	 bitbake gpephone-image fails on no 'email' provider available.
3124 	 mrxvt crashes and brings down X when forced to close
3125 	 webkit-gtk-0.0+svnr25808-r1-do_configure
3126 	 llvm-gcc4-cross-2.0+svnr374-r0-do_compile
3127 	 ecore-0.9.9.041+cvs20070819-r5-do_compile
3128 	 tremor ogg decoder in mpd?
3131 	 zaurusd should rdepend on bl
3132 	 mplayer-0.0+1.0rc1+svnr24587-r5-do_compile
3134 	 apmd-3.2.2-r8-do_compile
3136 	 webkit-gtk-0.0+svnr26079-r1-do_configure
3137 	 `bitbake xproto' fails on do_configue -- automake: unknown warning category 'cross'
3138 	 makeinfo confused by too many params
3139 	 pixops-test-1.0-r2-do_compile
3140 	 Touch screen does not work in fresh branch from october 9 2007
3141 	 EFL modifcations
3142 	 cannot find package when PACKAGES ${PN} is empty
3146 	 Samba smbfs and cifs packages
3147 	 upgrade to libid3tag-0.15.1b and fixed URI for libmad-0.15.1b
3148 	 nmap-4.20-r0-do_fetch
3149 	 nmap-4.20-r0-do_configure

In total 25 bugs have been created and 17 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHDkJyMkyGM64RGpERApv/AJ4rjhyn5OCbJLngydtezRGTJdw0zACgqVrH
hJWDqrXXulqO/R+G+0VBq/E=
=wY9k
-----END PGP SIGNATURE-----


