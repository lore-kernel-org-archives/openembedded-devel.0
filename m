Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1ITZIe-0005us-Ot
	for openembedded-devel@openembedded.org; Fri, 07 Sep 2007 10:34:48 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l878W419005306 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Sep 2007 10:32:04 +0200
Message-ID: <46E10C78.5090903@student.utwente.nl>
Date: Fri, 07 Sep 2007 10:31:52 +0200
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
X-List-Received-Date: Fri, 07 Sep 2007 08:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake@openembedded.org:
    mono 1.2.5: add 1.2.4, drop 1.2.5-pre5
    angstrom-minimal-image-with-mtd-utils.bb: set image base name

florian@openembedded.org:
    site: Add mips site information (untested)
    siteinfo.bbclass: Add mips (MSB) architecture
    fakeroot: Apply patch for fakeroot-native to fakeroot too.
    gpe-applauncher: Add 0.10

freyther@openembedded.org:
    MAINTAINERS: Add the Qtopia interest...
    packages/qte/qtopia-core: Add QtopiaCore version 4.3.1
    classes/{qmake*,qt4x11}.bbclass: Add a qmake2.bbclass to use qmake version two
    conf/checksums.ini: Add md5,sha256 sums for QtopiaCore 4.3.1
    qmake2,uicmoc4: Fix the LICENSE to only be GPL. QtopiaCore/QtE never was QPL licensed

hrw@openembedded.org:
    openmoko-common2: switch to SRCREV
    glibc: do not package /usr/include/scsi as it is in libc-linux-headers-dev (from Poky)
    scummvm: give proper path to sdl-config
    samba: depend on virtual/libiconv and supply path to it to fix building - taken from #2900
    binutils: added 2.18 from Poky (normal, cross, sdk)

ifaistos@openembedded.org:
    site/ix86-common : Add a def for libpcap
    conf/machine/i686-generic.conf : Rename the included tune file from .conf to .inc
    conf/machine/i586-generic.conf : Rename the included tune file from .conf to .inc
    conf/machine/i686-generic.conf: Add pentium pro optimization for i686-generic machine
    conf/machine/i586-generic.conf: Add pentium optimization for i586-generic machine

koen@openembedded.org:
    linux-ezx: use linux.inc to avoid duplication, update patches, add asoc patch
    task-boot: bump PR
    motorola-ezx-base.inc: include ezxd in task-boot instead of task-base
    motorola-ezx-base.inc: replace opentapi with ezxd
    linux.inc: add configure magic for replacing bootlogo
    nokia770: fix XSERVER
    webkit: reinstate ;name inj SRC_URI
    gnome-desktop: fix packaging
    libwnck: remove empty homepage field, fixes #2938
    gnome-desktop: update to fix issues with newer gnome-common, closes #2937
    pimlico: sync with poky
    openmoko-dates2: merge from poky
    midori: update to 0.6, add .desktop entry, remove obsolete versions
    pango.inc: also depend on virtual/libiconv, should fix #2934
    sane-srcrevs.inc: start collecting SRCREVs to compat parse-errors due to e.g. berlios
being down
    angstrom-2008.1: make binutils overridable
    angstrom 2007, 2008: switch to binutils 2.18 to get rid of the warning spew in
stripping and gdb
    angstrom-feed-configs: mark everything as conffiles so user edits get preserved
    angstrom-version: and bump PR
    angstrom-version: ${D} gets deleted on do_install, so install the files in do_install
instead of do_compile
    xoo: convert to SRCREV
    sphyrna: convert to SRCREV
    libowl: convert to SRCREV
    tinymail: convert to SRCREV
    matchbox*: convert to SRCREV
    libxosd: convert to SRCREV
    ffmpeg: convert to SRCREV
    angstrom.inc: include a var that selects which package will provide the feed configs
    eglibc: apply glibc fix to eglibc as well
    gtk-webcore: convert to SRCREV
    opentapi: convert to SRCREV
    openmoko*: convert to SRCREV
    hildon-1: add svn version which builds against stock gtk
    libgsmd: convert to SRCREV
    gnuradio: convert to SRCREV
    dfu-utils: switch to SRCREV
    uclibc: switch to SRCREV
    openmoko: switch to SRCREV
    webkit: switch to SRCREV
    bitbake: require 1.8.8
    common-glibc: add mono and guile stuff
    angstrom-feed-configs: a recipe that add config files for feeds
    angstrom: make ANGSTROM_URI overridable
    angstrom: make distroversion consistent between 2007.x and 2008.1
    tinymail svn: it's not tuesday yet, so s/SRCREV/SRCDATE/
    tinymail: update to 0.0.1 prerelease, needs more work with packaging
    rootfs_deb: make sure directories exist before trying to symlink them
    ttimgextract: add svn version
    xoscope: add 1.12
    angstrom: more .deb integration

likewise@openembedded.org:
    eglibc_svn: get_glibc_fpu_setting must be .._eglibc_..
    eglibc: touch configure files to prevent them from being regenerated.

mickeyl:
    openmoko-terminal2: build new terminal found in OM svn
    uboot-openmoko: create known-good version as seperate bb, make git/svn really uptodate
again
    imlib2: explicitly state that we're building a version with X11 support
    vte 0.11.15: update to 0.16.8

mickeyl@openembedded.org:
    task-openmoko-[debug|feed]: sort alphabetically, add some new packages
    libmokopanelui2: add new dependency on matchbox-panel-2
    openmoko-mediaplayer2: add dependency on gst-meta-audio
    official ezx name for the ROKR E2 is rokre2 (yes it looks ugly... ;)
    add openmoko-theme-standard2-qvga
    task-openmoko: pragmatic approach to choosing themes
    fic-gta01|fic-gta02|ezx.conf: set MACHINE_DISPLAY_ORIENTATION and MACHINE_DISPLAY_PPI
    motorola-ezx-base.inc: all Motorola EZX phones have 240x320 screen
    xserver-kdrive-common: bump PR
    xserver-kdrive-common: add support for the Motorola Ezx Platform
    tslib: remove e680 directory, not necessary anymore
    netbase 4.21: add support for fic-gta02, restore formatting, bump PR

mwester@openembedded.org:
    madwifi-ng: added recipe for the latest snapshop in order to provide support for more

nicolas.ferre@rfo.atmel.com:
    at91sam*: add 2 more at91sam machines, close #2942

ospite@studenti.unina.it:
    ezxd: add svn version, replaces opentapi

pH5@openembedded.org:
    xserver-kdrive: move some patches out of -common inc, preparation for 1.4
    pixman-0.9.5: add upstream alpha copy fix
    pixman: add 0.9.5 for X11R7.3 release
    xbacklight: add 1.1 for X11R7.3 release
    ico: add 1.0.2 for X11R7.3 release
    bdftopcf-1.0.1: fix DEPENDS
    iceauth-1.0.2: fix DEPENDS
    iceauth: add 1.0.2 for X11R7.3 release
    bdftopcf: add 1.0.1 for X11R7.3 release
    xdm: add 1.1.6 for X11R7.3 release
    xinit: add 1.0.5 for X11R7.3 release
    xprop: add 1.0.3 for X11R7.3 release
    xmodmap: add 1.0.3 for X11R7.3 release
    xset: add 1.0.3 for X11R7.3 release
    preferred-xorg-versions-X11R7.3.inc: add version 2.0.3 for xf86dgaproto
    libxxf86dga: add 1.0.2 for X11R7.3 release
    xf86dgaproto: add 2.0.3 for X11R7.3 release
    libxi: add 1.1.3 for X11R7.3 release
    xf86-input-keyboard: add 1.2.2 for X11R7.3 release
    libxrandr: add 1.2.2 for X11R7.3 release
    libxrender: add 0.9.4 for X11R7.3 release
    libxfont: add 1.3.1 for X11R7.3 release
    libxcursor: add 1.1.9 for X11R7.3 release
    renderproto: add 0.9.3 for X11R7.3 release
    inputproto: add 1.4.2.1 for X11R7.3 release
    preferred-xorg-versions-X11R7.3: add preferred versions for X11R7.3 release
    python-pygtk-2.10.4: add runtime dependencies on python-pygobject and -pycairo
    python-pygobject-2.12.3: fix packaging

pfalcon@openembedded.org:
    qte-mt-static: Set DEFAULT_PREF=-1, this is hightly adhoc target.

rpurdie@openembedded.org:
    package_ipk.bbclass: Improve directory existance check (from poky)
    package_ipk.bbclass: Add sdk Packages files and fix ipkf-sdk.conf (fixing
meta-toolchain) (from poky)
    bitbake.conf/image.bbclass: Set IMAGE_BASENAME to a better default and export
correctly, add BZR fetcher config (from poky)
    multimachine.bbclass: Use a new PKGDATA_DIR which includes the multimachine path to
prevent cross contamination between machines. This change requires all install tasks to
rerun (remove the do_install stamps from tmp/stamps)
    package.bbclass: Turn install path into a variable (PKGDATA) and cleanup some unneeded
complexity (from poky)
    package*.bbclass: Switch to separate tasks for each packing type (from poky)
    classes/conf: Remove bitbake < 1.8.8 compatibility code
    base.bbclass: Wipe install directory before running install to make rebuilding
packages safer (from poky)
    package-index.bb: Catch up with package/rootfs changes
    makedevs: Fix named pipe creation and set file modes correctly
    hx2000: Add ushbost to MACHINE_FEATURES, don't include kernels in images, add tarballs
to output types
    conf/machine: Various tweaks from Poky
    conf/machine/include: Rename .conf to .inc files
    site: Sync with Poky
    linux-rp: Sync with Poky (adding 2.6.22 in the process)
    zaurus-updater: Fix task dependencies (no need to work around rm_work now
    initscipts: Improve RTC handling so /etc/timestamp is used if its timestamp is 1 day
or more greater than the existing time. Also set the timestamp on halt/reboot so devices
without a hardware RTC (or with a broken RTC like the PXA) can benefit.
    Fix PKG_CONFIG_PATH references which should be PKG_CONFIG_DIR
    gnome-common: 2.4.0 -> 2.18.0 + associated cleanup (from Poky)
    package_ipk.bbclass: Fix whitespace
    makedevs: Bump PR to fix autobuilders which didn't pickup the previous changes
    package_x.bbclass: Sync with poky preparing for individual package writing tasks
    sdk.bbclass: Remove uneeded code
    meta-toolchain: Switch to use task-sdk-host and allow TOOLCHAIN tasks to be overridden
by the distro
    meta-toolchain: Convert to use package_ipk fnuctions
    rootfs_ipk.bbclass: Convert to use package_ipk function
    bitbake.conf: Add STAGING_ETCDIR_NATIVE variable
    package_ipk.bbclass: Sync with poky for locking, code to add package_write_ipk task
(not activated yet), change OE: field to use PN (not P), cleanups and conf and index
generation functions
    images: Remove bogus PREFERRED_PROVIDERs (they don't work in .bb files)
    meta-toolchain: Fix whitespace and merge in some improvements from poky
    gdb: Add missing patch
    gdb: Sync with poky (metadata cleanups, addition of gdb-cross-sdk)
    gcc-package-sdk.inc: Update packaging after sysroot changes (from poky)
    binutils-cross-sdk: 2.17.50.0.5 -> 2.17.50.0.12 and merge in sysroot fix from poky
    gcc-cross-sdk-4.1.2: Second try and cleaning up SRC_URI (if this fails for anyone,
please post the errors to the list) (from poky)
    gcc4-sdk: Use sysroot to workaround various path problems with external toolchains
(from Poky)
    sdk.bbclass: Use variables from bitbake.conf (from Poky)
    image.bbclass: Append to do_rootfs[recrdeptask]
    native.bbclass: PACKAGE_DEPENDS no longer need be unset, add extra options to
PKG_CONFIG_PATH if EXTRA_NATIVE_PKGCONFIG_PATH is set (from poky)
    images: Clean up image .bb files, moving functionality to image.bbclass (LICENCE
default, setup of RDEPENDS and default IMAGE_BASENAME)
    rootfs_{deb|ipk}.bbclass: Fix whitespace damage, remove bashisms, sync with poky
    base.bbclass: Fix SRC_URI overrides handling, lower the priority of local file url
checksum messages, correct populate_staging dependencies (from poky)
    multimachine.bbclass: Add PKGDATA_DIR defintion, disabled for now (from poky)
    classes: Convert to PKGDATA_DIR variable (from poky)
    jards: Remove insane pkgdata references
    package.bbclass: Improve strip function and convert to python (from poky)
    bitbake.conf: Define various variables (from poky)

rwhitby@nslu2-linux.org:
    task-openmoko-feed: Removed scummvm cause it's broken and too hard for me to fix.
    scummvm: Put it back the (broken) way it was.  Changing to STAGING_BINDIR_CROSS
doesn't help, cause that doesn't end in a 'bin' directory, and the configure script in
scummvm adds a 'bin' to the end of the prefix given. Someone else who cares will need to
fix it properly.
    openmoko-feed: Added ipkg-link
    openmoko-feed: Added scummvm.
    scummvm: Fixed the staging dir location.  Thx hrw for the tip.
    openmoko-feed: Added heaps of packages requested by community members.
    openmoko-feed: Added timezones
    openmoko-feed: Added ntpclient

simon.vogl@researchstudio.at:
    pxaregs: added 1.14 - close #2915

stefan@openembedded.org:
    openmoko.conf: We have september now
    openmoko-session2: Enable systray again as some people still use inputmgr
    task-openmoko.bb: Bump PR
    task-openmoko.bb: Add matchbox-keyboard-applet to the default image.
    uboot-openmoko_svn.bb: Use SRCREV.
    openmoko-session2: Use the new matchbox-keyboard applet.
    matchbox-keyboard-inputmethod: Add patch for a matchbox-panel-2 keyboard toogle

xora@openembedded.org:
    fakeroot/fakeroot-native_1.7.1.bb : dont apply same patch twice
    linux/linux-rp_2.6.22.bb : fix bitrot in c7x0 and akita defconfig where
    classes/base.bbclass : change to make sure ${D} gets removed before
    xorg-xserver/xserver-kdrive-imageon_1.2.0.bb : build Ximageon
    misc-binary-only/prism-firmware.bb : use non broken prism firmware. This
    xournal_0.4.bb : version upgrade

ynezz@true.cz:
    linux: add ts72xx support to 2.6.22.6 and 2.6.22+2.6.23-rc5 (see version policy for
the renaming reason), closes #2918
    ts72xx: add machine description for ts72xx based devices



Bugs fixed:
bug_id resolution	 short_desc
2918 FIXED	 Support for Technologic Systems TS-72xx SBC
2762 FIXED	 prism2-firmware 1.8.4 does not work on DCF-660W
2800 FIXED	 angstrom-x11-image-1.0-r11-do_rootfs
2880 FIXED	 linux-handhelds-2.6-2.6.21-hh12-r2-do_compile
2888 FIXED	 xserver-kdrive-imageon-1.3.0.0-r0-do_patch
2898 FIXED	 broken keymap in spitz image 20070828
2901 INVALID	 expect-5.44.1-r0-do_configure
2902 INVALID	 expect-5.44.1-r0-do_install
2907 FIXED	 IndentationError on package_ipk.bbclass
2908 INVALID	 libtool-native-1.5.10-r6-do_compile
2909 INVALID	 glibc-intermediate-2.5-r6-do_unpack
2910 INVALID	 gcc-cross-initial-4.1.2-r6-do_unpack
2911 FIXED	 angstrom-feed-configs-1.0-0-do_compile
2912 FIXED	 angstrom-feed-configs-1.0-0-do_install
2915 FIXED	 pxaregs utility for gumstix
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2929 FIXED	 eglibc should not regenerate configure scripts
2930 FIXED	 angstrom-2008.1 overwrites the PREFERRED_VERSION for binutils
2936 INVALID	 libiconv-1.11-r4-do_configure
2937 FIXED	 gnome-desktop-2.18.3-r2-do_configure
2938 FIXED	 libwnck-2.13.5-r0-do_package_write_deb
2940 FIXED	 fakeroot-native-1.7.1-r2-do_patch
2941 FIXED	 gnome-panel-2.18.1-r1-do_package
2942 FIXED	 Adding at91 two more machines


Bugs opened:
bug_id resolution	 short_desc
2931 	 libgcc-related SO link errors after recent changes to gcc.bb
2913 	 add support for mercurial (hg) and bazaar-ng URLs
2903 	 claws-plugin-maildir-0.24.4-r0-do_configure
2904 	 Dependencies not matched installing openmoko stuff
2905 	 python-pygtk does not provide working import gtk
2906 	 /proc/apm stays permanent
2914 	 gcc-cross-4.1.2-r6 fails to compile because of internal compiler error
2916 	 gnome-desktop_2.18.3 fails do_configure
2919 	 Create a distro for gumstix
2920 	 New Recipe: Free42 RPN Calculator
2921 	 ltrace-0.4-r1-do_compile
2922 	 qpe-mahjongg - replace some sick code
2923 	 libsdl_net doesnt compile - looking for host includes
2924 	 openmoko-image-1.0-r0-do_rootfs
2925 	 Use linux decompressor instead of u-boot's for uImage kernels
2926 	 Clean build of Angstrom for Gumstix-Verdex Fails
2927 	 directfb-0.9.25.1-r1 on OE 1.4 for Dreambox fails
2932 	 libnotify-0.4.4-r0-do_compile
2933 	 gpe-bluetooth-0.55-r0-do_compile
2934 	 gtk+-2.10.14-r7-do_configure
2935 	 libmokojournal2-0.1.0+svnr2780-r2-do_compile
2939 	 libgpewidget-0.115-r0-do_compile
2943 	 libmimedir-0.4.2-r0-do_compile
2944 	 libglade-2.5.1-r1-do_compile
2945 	 matchbox-wm-1.2-r1-do_compile
2946 	 linux-rp-2.6.19+git-r5-do_fetch
2947 	 angstrom-x11-image-1.0-r0-do_rootfs
2948 	 Packaged Staging feature
2928 	 binutils-cross 2.18 fails to build on x86_64

In total 29 bugs have been created and 24 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG4Qx4MkyGM64RGpERAiWmAJwN5CJhz98o10FB8TYUCsYeyoWOBACfX8xt
b0OjmHAgBX70WN148qSO3LU=
=y7vr
-----END PGP SIGNATURE-----


