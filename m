Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IsgNX-0003kb-FN
	for openembedded-devel@openembedded.org; Thu, 15 Nov 2007 16:11:39 +0100
Received: from vpn006139.vpn.utwente.nl (vpn006139.vpn.utwente.nl
	[130.89.6.139])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAFF9sZn005240 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2007 16:09:55 +0100
Message-ID: <473C6142.8030600@student.utwente.nl>
Date: Thu, 15 Nov 2007 16:09:54 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: OE weekly Changelog 20071108 - 20071115
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
X-List-Received-Date: Thu, 15 Nov 2007 15:11:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alessandro:
    navit_cvs.bb: CVS recipe. Thanks for review from koen. Fixes #3299

Jereme_Laine:
    conf/machine/mpc8323e-rdb.conf : Add pci and uboot to MACHINE_FEATURES

Jeremy_Laine:
    packages/linux/linux-2.6.23/mpc8323e-rdb/defconfig : Enable auto
module loading
    packages/madwifi/madwifi-ng_r2826-20071105.bb : Add new package
madwifi-ng_r2826-20071105.bb
    packages/linux/linux-2.6.23/mpc8323e-rdb/defconfig : Add
MPC8323E-RDB's NOR flash support
    conf/machine/mpc8323e-rdb.conf : Add correct parameters for jffs2
creation

abraxa@dar-clan.de:
    sane-srcrevs: dump OpenMoko-(Today2,Dates2) and Matchbox-Desktop to
unbreak OpenMoko builds

andrea.adami@gmail.com:
    apmd: fix SRC_URI

antti.andreimann@mail.ee:
    mkfontdir-native: fix SRC_URI - close #3190

bluelightning@bluelightning.org:
    opie-mediaplayer2: update to 1.2.3 - close #3220
    opie-notes:sync numbering with OPIE release

crofton@openembedded.org:
    davinci-sffsdr : Add support for Lyrtech small form factor SDR board.

dbaryshkov@gmail.com:
    linux-rp: Tosa usb ports management - close #3295
    wlan-ng-modules: build fixes for 2.6.22+ - close #3292
    linux-rp 2.6.23: Update tc6393-ohci driver - close #3290

dirk@openembedded.org:
    wlan-ng: add new snapshot. This version works with current kernel.

eha@doredevelopment.dk:
    apache2: Use WORKDIR path to access apache2 init script - close #3226
    syslog-ng: added 2.0.5 - close #3225
    eventlog: fix SRC_URI, add staging
    libol: fix SRC_URI

florian@openembedded.org:
    libchenabler: Add patch to fix i18n breakage.
    libgemwidget: add 1.0
    vmware.conf: New machine definition and defconfig for vmware disk
images. Fixes #868

henryk@openembedded.org:
    vte: Add missing DEPENDS

hrw@openembedded.org:
    libtheora: do not depend on itself
    python-pygtk: PROVIDES python-pygtk2 for compability
    librcf: drop bogus RDEPENDS
    task-gpe-sectest: dropped as it is now in task-gpe recipe
    lmsensors-apps: fix DEPENDS
    base-files: disable /dev/mmcda1 for all Zaurus machines - we use 2.6
not 2.4
    sqlite3: upgrade to 3.5.2 - now really close #3301
    sqlite: added 3.4.2 from Poky - close #3301
    ettercap: drop 0.6
    ettercap-ng: added 0.7.3 - close #3298
    tosa: stop preffering 2.6.17 kernel - 2.6.23 is up-to-date and have
improvements
    linux-rp: fix tosa patch name (my fault)
    python-gst: fix FILES
    alix: fix config and tune naming
    quasar: added 0.9beta - close #3224
    uicmoc3-native: depend on qmake-native
    notecase: unify recipes
    em-x270: do not assume where mtd-utils are installed
    task-native-sdk: dropped libgcc-s-dev which is now part of gcc
    sane-srcrevs: bump openmoko-appmanager2 to get fix for OM #960
    qte: mark qte-mt 2.3.10 as preferred version to make bitbake a bit
more quiet on parse
    alsa: added 1.0.15 from Poky
    busybox 1.7.2: use Angstrom defconfig as default - there are usable
fixes in it
    linux-rp: cleaned Tosa patches (my fault)
    zaurus-updater: revert tosa one to standard working one
    opie-mediaplayer2: OPIE_CVS_PV cannot be used without inheriting
opie.bbclass
    task-base: bump after c7x0/akita config changes - should close #3223
    linux-rp: update Tosa patchset in 2.6.22 and 2.6.23 - close #3233
    linux-rp: enable uinput for Tosa in 2.6.17 - close #1372
    linux-rp 2.6.23: enable WiFi and PXA Overlays on Akita (from Poky) -
closes #3230 #3212

ifaistos@openembedded.org:
    conf/machine/mpc8323e-rdb.conf : Fix a previus commit where
TARGET_FPU was commented.
    packages/linux/linux_2.6.23.bb : Bump PR
    packages/gcc/gcc_4.1.1.bb : Add mpc8323e patches
    conf/distro/angstrom-2007.1.conf : Set gcc version to 4.1.1 for
mpc8323e-rdb so that both glibc and uclibc targets
    packages/linux/linux-2.6.23/mpc8323e-rdb/defconfig : Enable
moreoptions as modules.
    conf/machine/mpc8323e-rdb.conf : Set uboot version to 1.1.6
    packages/uboot/u-boot_1.1.6.bb : Add support for the MPC8323e-rdb board
    packages/madwifi/madwifi-ng_r2826-20071105.bb : Set
DEFAULT_PREFERENCE=1 for mpc8323e-rdb

joaquinduran@adtelecom.es:
    xdm: added libxaw to dependencies

jorik@kippendief.biz:
    openssl: add sparc support - close #1927

koen@openembedded.org:
    mb-common: use u-a to make the link to x-wm, do not depend on mb-wm
to do it
    mb-wm: u-a to itself, not another package
    glibc-intermediate: first stab at a recipe for 2.7
    feed-browser: start adding a machine -> arch map
    matchbox-wm: stop requiring mb-common
    insane.bbclass: merge dot desktop check from poky
    desktop-file-utils: merge from poky
    sane-srcrevs: add openmoko-messages2, bump some other things
    openmoko-messages2: add recipe
    openmoko-session2: bump PR massively to weed out broken packages in
deploy and existing feeds
    disapproval of revision '9430cfa5a334ac688d23932a066f6495abfa4709'
    glibc 2.7: first stab at recipe
    poppler: add 0.6.2
    monotone: update to 0.37
    fontconfig: more symlinks for maemo stuff
    maemo-mapper: update for current svn, needs gcc4 fixes
    libhildonfm: symlink headers to provide compat between different
maemo versions
    libconic: add 0.13
    squid-native: fix typo
    sane-srcrevs: bump some more entries
    hildon-1: add maxrev for patch
    angstrom 2008: use uclibc 0.9.29
    icu: make libs executable so they get stripped
    sane-srcrevs: add epihpany, fix elf2flt
    epiphany: add svn version to get the webkit backend to compile
    rm_work: only remove ${S}, leave temp and install alone
    angstrom-2007: stop mickeyl's baseless complaints about
'downgrading' from kdrive 1.4, angstrom 2007 has never used it
    linux-ezx: change rootdelay=1 into rootwait=1, that hooks into the
mmc layer to hold of mounting till it's ready instead of waiting N
seconds. This is a 2.6.23 feature
    gsmd.inc: gsmd-devel now completely covers all (R)PROVIDES for gsmd,
so it is installabel now
    task-openmoko: bump PR to get rid of gsmd(-devel) remnants
    gsmd: make -devel also rprovide tools, otherwise OE will build them
both and renders image generation impossible
    neod: fix RDEPENDS, oe automagically maps dbus->dbus-1 when using
debian renaming. Using dbus-1 also breaks for people not inheriting
debian.bbclass.
    bluez-{cups,gstreamer,alsa,utils}: update to 3.22
    bluez-libs: update to 3.22
    openmoko-browser2: add (disabled) patch to use fingerscroll instead
of a regular scrolled window.
    angstrom 2007: lockdown file takes precendence over other files
    neod: add maxrev for patches that have been applied
    xournal: rdepend on poppler to get pdf annotation feature working
    sane-srcrevs: bump ezxd
    angstrom-2007-preferred-versions.inc: correct some entries
    angstrom 2007: remove some preferred version that are already in the
lockdown file
    pty:  Commit by andrew  ::  r3327
/trunk/src/host/qemu-neo1973/pty.c: (link)
    ezxd: compile with -DDEBUG
    pty: add Andrews tty forwarder
    linux-bfin: add compatible host
    angstrom 2008: prefer 2.6.23 for libc headers
    angstrom-2007-preferred-versions.inc: tell people to notify angstrom
mailinglist on changes to this file
    linux-ezx 2.6.23: disable dyntick
    pixman: update to 0.9.6
    cairo: update to 1.5.2 snapshot
    sane-srcrevs: bump openmoko and ezxd
    ezxd: mark ezxd.conf as conffile to preser user changes
    linux-ezx 2.6.23: repair defconfig

likewise@openembedded.org:
    gtk+: Add stand-alone gdk-pixbuf library.
    pixman: Fix previous cleanup. Removed too much.
    pixman: remove false dependency, remove common include.
    libpixman: Added release 0.9.6, needed by cairo 0.5.2+.

mickeyl@openembedded.org:
    sane-srcdates.inc: add python-emotion entry
    openmoko.conf: add neo1973 feed
    navit: add 0.0.2
    openmoko-session2: RREPLACE/RPROVIDE instead of RCONFLICT
    task-openmoko.bb: remove vera fonts. gtk+ already suggest DejaVu ones.
    python-pygobject: remove duplicated packaging statements
    python-py[gtk|cairo]: remove duplicated packaging statements
    task-python-everything: don't build python-emotion and python-edje
for now
    add pulseaudio 0.9.7 (DEFAULT_PREFERENCE=-1, see comments in recipe)
    python-gst: fix packaging -- NEVER EVER use python2.4 directly, use
${PYTHON_DIR}
    sane-srvrecs.inc: add entry for python-formencode
    python-formencode: remove setup.py.diff (no longer necessary),
convert to SRCREV
    python-gtk-1.2: add acinclude.m4 to fix build
    add ipkgorphan, a dependency tracking tool for ipkg
    task-openmoko: remove dependency on matchbox-common
    openmoko-session2: provide own matchbox-session file, get rid of
matchbox-common
    matchbox-common: remove duplicated SECTION
    matchbox-common: fix PACKAGE_ARCH (all)
    add vala, a C#-like language that aims to simplify GObject programming
    neod: add dependency to dbus-1
    conf files: remove preferred-openmoko-versions.inc (they're included
in sane-srcdates.inc),
    linux-openmoko-devel: don't override do_deploy
    libsidplay: use autotools_stage_all
    libid3tag: use autotools_stage_all, inherit pkgconfig
    dbus-c++: catch up with SRCREV and make it build again
    openmoko-icon-theme-standard2-qvga: don't implicitly assume the
buildmachine

mwester@openembedded.org:
    fakeroot: upgrade to 1.8.3 upstream version
    linux-openmoko-devel: add patch to fix bug 788
    linux-openmoko: add patch to fix bug 788
    fstab: clean-up white space, comment out the /media/ram mount

oliver.fels@gmx.net:
    notecase: update to 1.6.9

pH5@openembedded.org:
    wifi-radar: python-pygtk2 got renamed to python-pygtk
    xbitmaps: remove self-dependency
    powertop: add 1.9
    telepathy-inspector: add 0.5.0, a debugging tool for Telepathy
developers
    telepathy: add telepathy-idle 0.1.2
    libgsmd-devel: install ts0705.h and ts0707.h, included by usock.h

pfalcon@openembedded.org:
    dropbear: Typo fix in description.
    dbus*: Typo fix in description.
    bluez-gnome: Typo fix in description.
    blueprobe 0.18: Update h4000 patch and add description.
    ntp: Cast "iana-etc" to RSUGGESTS.
    angstrom-2007.1.conf: Upgrade linux-handhelds-2.6 to "2.6.21-hh18".
    linux-handhelds-2.6: Drop bunch of old 2.6.21 releases.
    linux-handhelds-2.6 2.6.21-hh18: Add new release.
    qte-mt 2.3.10: No longer a machine-specific package.
    qte 2.3.10: Drop var overrides which were needed for deprecated patches.
    qte 2.3.10: Drop application of random machine-specific keyboard
rotation patch.
    qte-mt 2.3.10: Drop application of w100 accel patch for c7x0.
    task-opie-16mb: Add an opie-taskbar-images instance.
    device_table-minimal.txt: Add /dev/ptmx.
    linux-handhelds-2.6: Fix typo in generated HaRET config.
    libopie2 1.2.3: Fix screen rotation issues.
    linux-handhelds-2.6 2.6.21: Use performance governor by default,
move most governors to modules.
    libopie2 1.2.3: Make sure that proper tag is used, not HEAD.

rpurdie@openembedded.org:
    package.bbclass: Stop do_package from being destructive by copying
instead of moving files (from poky). The copyfile function will be moved
to bitbake in due course.
    Remove final references to BUILD_SYS in staging paths
    glibc: Factor staging function into a common .inc and remove
hardcoded staging layout
    bitbake.conf: Add dummy layout variables (describing the current
staging layout for now) (from Poky)
    packages: Improve BUILD_SYS references to staging
    lua-gtk: This looks very very wrong but is equivalent... - Fix
staging references
    xterm: Fix what looks like a totally insane staging path (probably
missed in pervious rounds of cleanup?)
    pkgconfig.inc: We should be installing pkgconfig files into LIBDIR
now (from poky)
    dbus-glib: Fix harcoded staging paths (from Poky)
    fontconfig: Fix hardcoded staging path (from poky)
    gnome-common: Don't hardcode staging paths (from Poky)
    base.bbclass: Move do_install note to more appropriate place
    base.bbclass: Update staging references (from poky)
    autotools.bbclass: Reference STAGING_DATADIR (from poky)
    bitbake.conf: Fix base prefixes in FILES (from poky)
    bitbake.conf: Start cleaning up STAGING variables (from Poky)

stefan@openembedded.org:
    navit_cvs.bb: Remove unused patch from SRC_URI

thebohemian@gmx.net:
    gcc-csl: fix SRC_URI - close #3240

tkemp@klc.net.nz:
    squid: apply patches for #2884
    site/common-glibc: add entries for squid

woglinde2@openembedded.org:
    simpad: making the default kernel 2.6
    alsa-utils: fix bug 2348, nls problem with libintl

xora@openembedded.org:
    openmoko-dialer2_svn.bb, sane-srcrevs.inc : 3306 really is the last
    openmoko-session2.bb, openmoko-today2-folders_svn.bb : reduce this to
    openmoko-session2.bb, openmoko-today2-folders_svn.bb : conflict/replace
    linux-openmoko_2.6.22.5.bb : enable uinput module as some need it for
    fic-gta02.conf : add gta02 sound to the rootfs
    linux-openmoko/defconfig-2.6.22.5 : bring upto date, sound is now
modules
    linux-openmoko_2.6.22.5.bb : update for kernel, gta02 sound support,
    eds-dbus_svn.bb : convert to SRCREV
    sane-srcrevs.inc : bump openmoko-theme-standard2
    mplayer/files/motion-comp-pld.patch : remeber patch
    mplayer_0.0+1.0rc2.bb : fix for armv4
    sane-srcrevs.inc : add linux-openmoko as it was removed from
everywhere else.
    packages/gsm/gsmd.inc : fix regressions caused by moving around gsmd
    openmoko-worldclock2_svn.bb : fix depends
    packages/mplayer/mplayer* : update mplayer relase and svn version PV
    angstrom-2007-preferred-versions.inc : incrment tinymail version
    altboot_1.1.1+wip-SVNR66.bb : add patch to get devnodes for mmcblkp?
from
    packages/gsm/gsmd.inc : we RPROVIDE gsmd as well
    openmoko-worldclock2_svn.bb : add libnotify to DEPENDS
    packages/gsm/gsmd.inc : implement suggestion from koen to solve the both


Bugs fixed:
bug_id resolution	 short_desc
1927 FIXED	 Add (super)sparc target to OpenSSL
2886 FIXED	 squid-2.6.STABLE14-r0-do_configure
2954 FIXED	 New program and recipe: ipkgorphan
2973 FIXED	 opensimpad-64+0-2.4.27-vrs1-pxa1-jpm1-r4-do_compile
3007 FIXED	 altboot does not see the sd-card (akita)
3119 FIXED	 Fakeroot 1.7.1 not available from Debian repositories
3137 WORKSFORME	 `bitbake xproto' fails on do_configue -- automake:
unknown warning category 'cross'
3224 FIXED	 New Quasar recipes available
3226 FIXED	 Use WORKDIR path to access apache2 init script
3247 FIXED	 libgemwidget fails on missings POTFILES.in
3249 FIXED	 Notecase 1.6.9 update
3257 INVALID	 gcc-syntax-fix.patch fixed upstream for libopie2-1.2.3
3261 FIXED	 madwifi snapshot needs updating
3270 INVALID	 gnash-0.8.1-r0-do_compile
3271 FIXED	 epiphany-2.19.6-r1-do_configure
3278 WORKSFORME	 bitbake ptim-headers fails on bitbake gpephone-image
3290 FIXED	 Update tc6393-ohci driver
3292 FIXED	 Compilation fixes for wlan-ng-modules
3293 INVALID	 opie-taskbar-images fails to build
3295 FIXED	 usb ports management
3298 FIXED	 ettercap-ng - new verison of product ettercap
3299 FIXED	 cvs recipe for navit
3301 FIXED	 sqlite3_3.4.1 : source tarball is no longer available
3302 FIXED	 expat fails to install to image
3304 INVALID	 Bitbake complains about missing deps due to changes to the
repo.
2685 FIXED	 Screen Rotator GPE applet does not rotate from landscape to
portrait


Bugs opened:
bug_id resolution	 short_desc
3280 	 git doesn't work with tag or branches names in ascii...
3272 	 python-logging is missing some dependencies
3273 	 gdb missing 'uclibc-dev' dependency
3274 	 uclibc 0.9.29-r8 segfaults
3275 	 mplayer-0.0+1.0rc2+svnr24587-r5-do_configure
3276 	 toolchain badness ?
3277 	 [PATCH] replace oenote with oe_note
3279 	 gpsdrive SRC_URI changed
3281 	 [PATCH] replace oefatal with oe_fatal
3282 	 qemu-native-0.9.0+cvs20070613-r5
3283 	 patches for Zaurus kernel 2.6.23
3284 	 glibc-intermediate-2.6.1 compile failed for 2008.1 on i686
3285 	 libnss-mdns-0.9-r0 do_compile fails first time on i686-angstrom
3286 	 CROSS COMPILE Badness for motion
3287 	 fuse-module-2.6.5-r1-do_compile
3288 	 qmake2-native is not multimachine safe
3289 	 python-ecore-0.1.1+cvs20070819-r1-do_compile
3291 	 hildon-libs needs libmatchbox in dependency
3294 	 BC segfault
3297 	 pulseaudio: build hal-detect module
3300 	 fix build of xserver-kdrive_git
3303 	 python-crypt 2.5 has an incorrect FILES definition
- -e
In total 22 bugs have been created and 26 bugs were closed.



- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHPGFCMkyGM64RGpERAnZpAKCD6LoQr6Iy7HU8SsLtbDgKu9htQgCdEHnk
bVBZPceS8+fjWQdPltVzSaU=
=oI95
-----END PGP SIGNATURE-----


