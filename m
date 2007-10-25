Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Il1wF-0007AG-Qi
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 14:35:54 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9PCSLUo006190 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2007 14:28:21 +0200
Message-ID: <47208BEB.8000004@student.utwente.nl>
Date: Thu, 25 Oct 2007 14:28:27 +0200
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
Subject: OE weekly changelog, 20071018 - 20071025
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
X-List-Received-Date: Thu, 25 Oct 2007 12:36:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zero_Chaos:
    packages/kismet/* : large cleanup, working sounds and gpsmap courtesy of
    packages/asleap/asleap_2.1.bb : new recipe from Zero_Chaos
    packages/aircrack/aircrack-ng_1.0-svn.bb : update recipe and convert

abraxa_:
    packages/openmoko2/openmoko-mediaplayer2_svn.bb : add gconf schemas

angus@handheldshell.com:
    eseries.conf: Machine config for Toshiba PocketPCs.

antti.andreimann@mail.ee:
    mkfontscale-native: reinstate it, closes #3184

cbrake@openembedded.org:
    em-x270.conf: fix include file names

florian@openembedded.org:
    bitbake.conf: Add -pn bit to alternative OVERRIDES definition and
update descriptions.
    linphone: Make sure 1.5.0 does not use -Werror which is going to break.

freyther@openembedded.org:
    packages/xrestop: Package the wonderful xrestop
    packages/libxml/libxml2: Create the directory before staging files
into it.
    packages/webkit: The API/ABI of WebKit/Gtk+ has changed, update the PV
    packages/{qt,qte,uicmoc,qmake}: Update to Qt(opiaCore) 4.3.2
    packages/webkit: Change the package names of WebKit/Qtopia and force
upgrade.
    conf/distro/include/angstrom-2007-preferred-version: Add a
PREFERRED_VERSION for exmap-console.
    packages/webkit: Build the Qt/Qtopia port of WebKit as well.

henryk@openembedded.org:
    python-pygtk: Remove more duplicate ${PN}-dev

hrw@openembedded.org:
    zaurus machines: c7x0 and akita require pcmcia core modules with
2.6.23+ kernels
    checksums.ini: sync with Poky
    oe-checksums-sorter: small script to sort checksums.ini
    linux-rp: make 2.6.21 default for collie
    libfakekey: bump PV to 0.2
    libxml2: drop useless note
    sato-icon-theme: sync with Poky
    sysfsutils: split libsysfs to separate package (with dev and dbg
ones) (from Poky)
    libfakekey: switch to SRCREV (from Poky)
    wv: cleanup, added missing fields (from Poky)
    libxpm: add dependency on libsm (from Poky)
    zlib: cleanup
    site/ix86-common: removed repeated entry for ac_cv_linux_vers
    keymaps: start after psplash (from Poky)
    hostap-utils: promote 0.4.7 to be default
    gtkhtml2: change to SRCREV (from Poky)
    gtk-clearlooks-engine: fix debug packaging (from Poky)
    gnutls: drop autoconf 2.59 hack (synced from Poky)
    exmap-console require glib-2.0 (from Poky)
    exmap-console: switch to SRCREV (from Poky)
    check: stage pkgconfig data (from Poky)
    generic distro: prefer X.Org 7.2 instead of 7.1 (which is mostly
not-existant)
    checksums: few more fixes from Koen's run
    checksums: dropped geda snapshots (unfetchable)
    source-checker: move bad news to end of program (list of errors when
program end)
    source-checker: added progressbar (from BitBake) and status info at end
    oe-source-checker: some improvements (usage, less exceptions)
    source-checker: small Python script to check local sources against
conf/checksums.ini
    checksums: integrate changes from Poky
    checksums: removed am.tgz which is generated daily
    mathomatic: mark unstable version as BROKEN

ifaistos@openembedded.org:
    conf/machine/dht-walnut.conf : Set soft-float for the machine as its
uses amcc405
    conf/distro/angstrom-2007.1.conf : Set atk version to 1.20.0
    packages/grdesktop : Add new package grdesktop
    conf/machine/i686-generic.conf : Add xserver-kdrive-vesa as the
default xserver
    conf/machine/i586-generic.conf : Add xserver-kdrive-vesa as the
default xserver
    packages/linux/linux/x86/defconfig : add more drivers as modules
    conf/machine/x86.conf : Set default xserver to kdrive-vesa as its
supported by most
    packages/dbus/dbus.inc : Add group netdev during installation (if it
does not exists).
    classes/icecc.bbclass : Add support for the SDK packages
    conf/machine/i686-generic.conf : Switch i686-generic to use OE's
default kernel
    conf/machine/i586-generic.conf : Switch i586-generic to use OE's
default kernel
    conf/machine/x86.conf : Switch x86 to use OE's default kernel
    packages/xorg-xserver/xserver-xorg_1.3.0.0.bb : Fix a typo that
broke xserver-xorg during
    packages/linux/linux-x86-2.6.20/i486-defconfig : Make x86 kernel
"generic" by building most

jemery_laine:
    mpc8323e-rdb: Adapted from mpc8313e-rdb, tested.

jluebbe@openembedded.org:
    sane-srcrevs: update openmoko-mediaplayer2 to 3081

koen@openembedded.org:
    libgsmd: add maxrev for send patch
    linux-ezx: add 2.6.23
    sane-srcrevs: bump libjana to unbreak source-mirrors
    libjana: fix packaging
    sane-srcrevs: add libjana
    libjana: add missing "
    openmoko-dates2: remove staging
    libjana: add Q&D recipe for libjana
    linux-rp: merge .23 and .23+git from poky
    fbset-modes: make the modes a conffile
    openmoko-today2: add openmoko-today2 to DEPENDS
    sane-srcrevs: bump openmoko-browser2 to 3249
    sane-srcrevs: bump webit-gtk to 26915
    linux-ezx: set rootdelay to 1 instead of 5
    angstrom-2007-preferred-versions.inc: bump midori to 0.0.10, fixes #3199
    mkfontscale*: move to xorg-app
    busybox 1.7.2: replace run_part.c with the one we snatched of the
mailinglist
    busybox 1.7.2: add run_parts.c so Marcin can add it into the recipe :)
    openmoko-worldclock2: remove SVNREV
    sane-srcrevs: bump openmoko-appearance for .desktop, calculator for
icon and mediaplayer for video support
    openmoko-theme, openmoko-terminal: repair PV damage by cheating a
bit an bumping the micro version instead of PE
    openmoko2: SVNREV -> rSRCREV
    openobex: use autotools_stage_all, that stages more than we currently do
    angstrom-2007-preferred-versions.inc: and even more fixes
    conf/distro/include/angstrom-2007-preferred-versions.inc: and more
fixes....
    sane-srcrevs: add note about ordering
    sane-srcrevs: bump some more srcrevs for openmoko, tested on
gta01/angstrom
    angstrom-2007-preferred-versions.inc: remove some more svn packages
    angstrom-2007.1.conf: add workaround for missing mtd-utils-native
    task-base: add DISTRO_EXTRA_DEPENDS (workaround for bitbake bug)
    xserver-kdrive-common: adapt script to take framebuffer size into
account when running on devices that can do both vga and qvga
    sane-srcrevs: bump linu-bfin to get pata support=
    angstrom-2007-preferred-versions.inc: more fixes
    angstrom-2007-preferred-versions.inc: remove gcc, kernels and images
    angstrom 2007: activate lock down file, nobody has complained about
errors in the file for the past week, or objected to using it.
    angstrom-preferred-versions: remove more entries, bitbake -s gets
now as far as:
    packages/openmoko2: s:distribution:framework:g
    angstrom-2007-preferred-versions.inc: workaround bitbake bugs
'bitbake x11-image' works without bitbake choking
    angstrom-2007-preferred-versions.inc: formatting and fixes
    angstrom-2007-preferred-versions: fix svn and mickeyl PR entries
    sane-srcrevs: add gypsy
    gypsy: merge (with cleanups) from poky
    conf/distro/include/angstrom-2007-preferred-versions.inc: add file
for locking down almost every package
    ezxd: remove runparts from init script
    angstrom-version: bump PE
    gst-meta-base: change some stuff to RRECOMMENDS, not everybody wants X

likewise@openembedded.org:
    mpc8313e-rdb: Add PREFERRED_VERSION_u-boot
    cairo: Add 1.4.10 with cairo-perf stat patch.
    binutils-2.16: Use . Add comment before powerpc patch URI.
    binutils-2.18: Added powerpc e300c2c3 patch.
    libzvbi: Moved from 0.2.24 to 0.2.25 release.
    mpc8313e-rdb: Added support to build u-boot.
    linux-2.6.23: Added mpc8313e-rdb with defconfig.
    mpc8313e-rdb: Fix PACKAGE_EXTRA_ARCHS and SERIAL_CONSOLE.
    efika: Trivial typo fix.
    MAINTAINERS: Updated my info.
    machine/tune-ppce300c3: Added PowerPC core, used in MPC83xx.
    mpc8313e-rdb: added machine for Freescale MPC8313E-RDB.
    binutils-2.16: Added support for powerpc e300c3 core. Bumped PV for
your pleasure.
    gcc-4.1.2: Added support for powerpc e300c3 core. Bumped PV for your
pleasure.

mickeyl@openembedded.org:
    openmoko-session2: default to digital clock
    libjana: slightly patch it to make more of the background wallpaper
shine through
    ltrace: DEPENDS on binutils
    openmoko-session2: bump PR as per recent wallpaper change
    openmoko-common2: install pixmaps (again)
    openmoko-session2: set wallpaper gconf key
    alsa-state: it's MACHINE_ARCH, not MACHINE!!!!!!!
    openmoko-session2: away the clock it goes
    openmoko-dates2: PROVIDES libjana
    moko-autorev.inc: add neod
    moko-autorev.inc: add entries for openmoko-browser2 and
openmoko-mediaplayer2
    gst-meta-base: remove some duplicates and add more to the video part
    gst-plugins-ugly: add gstsid_autofoo_HACK.patch to make
gst-plugins-ugly build the sid plugin
    gst-plugins-ugly: DEPENDS on mpeg2dec and libsidplay
    mpeg2dec: fix individual packaging, reformat and simplify recipe
    linux-openmoko 2.6.22.5 use linux.inc
    fic-gta01/stereoout.state: turn off (useless) 3d booster
    sane-srvrevs: bump openmoko-mediaplayer2 and openmoko-theme-standard2
    gst-meta-base: fix typo in RDEPENDS. please watch your diffs more
closely

pH5@openembedded.org:
    angstrom-2007.1.conf: move wpa-supplicant pref version into
- -preferred-versions.inc
    angstrom-2008.1.conf: use preferred versions includes (e, gpe2.8,
openmoko)
    angstrom-2008.1.conf: stop including angstrom-2007.1.conf,
    angstrom-2007.1.conf: already uses include/angstrom.inc,
    empathy: add 0.14
    telepathy: add telepathy-python 0.14.0
    telepathy-mission-control: add 4.45
    telepathy-glib: add 0.6.0
    libtelepathy: add 0.2.0

rpurdie@openembedded.org:
    bison-native: Use STAGING_DATADIR (from poky)
    libxml: Stage binconfig file to the correct place (from poky)
    openobex: Fix staging function
    glibc-initial: Factor common code into a .inc file
    glibc-intermediate: Factor common code into a .inc file

stefan@openembedded.org:
    task-openmoko: Add real fbset and fbset-modes
    fbset-modes: Mechanism to install a fb.modes file for devices

xora@openembedded.org:
    packages/linux/linux-openmoko.inc : now linux-openmoko uses linux.inc
    packages/openmoko2/openmoko-mediaplayer2_svn.bb : fixup gconftool
usage and
    (in)sane-srvrevs.inc : add kismet and kismet-newcore
    conf/distro/angstrom-2007.1.conf : avahi and openssh-sftp-server as
RRECOMENDS
    packages/openmoko2/libjana_svn.bb : add gconf to depends
    insane-srcrevs.inc, moko-autorev.inc : add libjana to these
    conf/distro/include/sane-srcrevs.inc : catch up with openmoko changes
    packages/openmoko2/libjana_svn.bb,
packages/openmoko2/openmoko-dates2_svn.bb :
    packages/openmoko2/libjana_svn.bb : add maxrev to patch
    packages/mdk/mdk2_v36.bb, packages/mdk/mdk3_v2.bb : add new versions
of these
    packages/imagemagick/files/ : add two forgotten patches
    packages/fbset/fbset-modes/fb.modes : add default file with reminder why
    packages/fbset/fbset-modes.bb : fix this package up to improve
metadata quality.
    conf/distro/include/sane-srcrevs.inc : increment dates2
    packages/openmoko2/openmoko-worldclock2_svn.bb : add new recipe and
    sane-srcrevs.inc : add libfakekey
    conf/distro/include/sane-srcrevs.inc : rev bump settings-demon
    packages/openmoko2/openmoko-appearance_svn.bb : add appearance an
application
    packages/gstreamer/gst-plugins-ugly_0.10.6.bb : add patch to make
mp3->codec



Bugs fixed:
bug_id resolution	 short_desc
3135 FIXED	 'unexport' attribute of variable still doesn't work sometimes
2714 FIXED	 [PATCH] lock mtd-utils to a specific git version so builds
will not break unexpectedly
3061 DUPLICATE	 usb-gadget is broken (at least in card reader and
file-backed mode)
3155 FIXED	 Patch for libgstmad to generate 16-bit output instead of 32-bit
3179 FIXED	 dbus fails to start on x86/Angstrom
3183 INVALID	 maxima-5.13.0-r0-do_configure
3184 FIXED	 [PATCH] reanimate xorg-app/mkfontscale recipies
3185 FIXED	 [PATCH] reanimate xorg-app/xkbutils recipie
3186 FIXED	 [PATCH] reanimate xorg-app/xlsfonts recipie
3187 FIXED	 [PATCH] reanimate xorg-app/xkbcomp recipie and add
xkbcomp-native
3191 FIXED	 openmoko-dates2-0.1.0+svnr640-r0-do_populate_staging
3194 WORKSFORME	 2007-10-20 'bitbake gpe-image' failed on several
missing DEPENDS
3199 FIXED	 midori fails to build with syntax error in document.h
3202 FIXED	 Add a machine definition for MPC8323E-RDB
3203 FIXED	 updater.sh.tosa is a forbidden file
3206 FIXED	 Add uClibc configuration for MPC8323E-RDB
3207 FIXED	 Add linux configuration for MPC8323E-RDB


Bugs opened:
bug_id resolution	 short_desc
3181 	 Building Angstrom  for x86 without IMAGE_FSTYPES defined in
local.conf results in error
3182 	 bb.data.setVar(PARALLEL_MAKE
3200 	 rm_work could do with the ability to specify specific packages to
keep
3174 	 sound problem over CE-RH2.
3175 	 Toshiba eseries kernel recipe
3176 	 empathy-0.14-r0-do_configure
3177 	 Sepukku.bbclass can't attach logs anymore
3178 	 binutils 2.18 / uclibc : linking error
3180 	 bitbake gtk+ fails on 20071020 (and back at least a week) due to
missing DEPENDS
3188 	 [PATCH] fix libx11-native package
3189 	 [PATCH] new fakeroot package to fix download failure
3190 	 [PATCH] fix mkfontdir-native download location
3192 	 Linksys WCF-11 Card works on OZ Opie
3193 	 source code of screeensaver unable to be downloaded
3195 	 can't mount cf card on collie
3196 	 gpephone-image fails on librecord due to problems in Makefile.am
and configure.ac
3197 	 Proposed keymap for Zaurus spitz and akita
3198 	 syslogd fails to start at boot with busybox 1.7.2
3201 	 Fix: missing dependency for xdm
3204 	 libxml2-2.6.29-r5: do_populate_staging: failed
3205 	 binutils-2.18-r1 fails to link with libiberty.a
3208 	 Tree 1.5.1 doesn't build
3209 	 Git fetcher failing on x86_64 installs (Fedora 7)
3210 	 minimo_cvs fails to build; cannot access nsBuildID.h

In total 24 bugs have been created and 17 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHIIvrMkyGM64RGpERAkRsAJsGnDBzZE+g6uuuvt7P9OrJcfNCYgCfaLNS
PKSlyxU79KVQZxkuKdbsewA=
=jjd0
-----END PGP SIGNATURE-----


