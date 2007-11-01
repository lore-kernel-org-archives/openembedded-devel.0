Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1InWVi-0001XE-4A
	for openembedded-devel@openembedded.org; Thu, 01 Nov 2007 10:38:46 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA19cMUo022569 for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Nov 2007 10:38:23 +0100
Message-ID: <47299E95.1010705@student.utwente.nl>
Date: Thu, 01 Nov 2007 10:38:29 +0100
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
Subject: OE weekly changelog 20051025 - 20071101
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
X-List-Received-Date: Thu, 01 Nov 2007 09:38:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zero_Chaos:
    rt2570-k2wrlz_1.6.1.bb, rt73-k2wrlz_2.0.1.bb : 2.6.23 capable versions

antti.andreimann@mail.ee:
    mkfontdir-native: fix SRC_URI - close #3190

bluelightning@bluelightning.org:
    opie-mediaplayer2: update to 1.2.3 - close #3220
    opie-notes:sync numbering with OPIE release

cbrake@openembedded.org:
    mono-xsp 1.2.5: fix FILES_ for mono-xsp package
    mono-xsp: add package

eha@doredevelopment.dk:
    syslog-ng: added 2.0.5 - close #3225
    eventlog: fix SRC_URI, add staging
    libol: fix SRC_URI

florian@openembedded.org:
    disapproval of revision '312b45a45c1194cc085cdbc31b261aef92ce23bb'
    checksums.ini: Remove more checksums of "updated" packages.
    task-gpephone: Remove email application which has no pushable bb.
Fixes #3123
    gpe-applauncher: Improved softkey layout.
    MAINTAINERS: Add tmut and bd-neon to myself
    tmut: Do not override SRCREV from inc.
    sane-srcrevs.inc: Add tmut
    tmut: Add tmut - a really small email client based on tinymail.
    libtinymail: add 0.0.3, stage files, use include
    checksums.ini: Remove no longer valid checksums, workaround for #3122
    libabenabler: add 1.0
    libiac: add 1.0
    tiff: Add lzo to dependencies, otherwise it will try to link against
a build host lzo.
    librecord: Add 1.0
    linux.inc: bd-neon needs the uboot mkimage tool
    tea: Add Tea - a small and powerful text editor.
    bd-neon.conf: Add missing uboot bits

freyther@openembedded.org:
    packages/webkit: Apply the qtwebkit-use-image-decoders.patch to
WebKit/Qt, WebKit/Qtopia
    packages/uicmoc: Unify uicmoc4-native
    conf/distro/include/sane-srcrevs.inc: webkit-qt and webkit-qtopia
can use the same rev
    packages/webkit/webkit.inc: Allow debian package renaming again
    packages/webkit: Build and package naming fixes (when using debian
renaming)
    packages/uicmoc: Depend on zlib-native as reported by Jan Luebbe

hrw@openembedded.org:
    linux-rp: cleaned Tosa patches (my fault)
    zaurus-updater: revert tosa one to standard working one
    opie-mediaplayer2: OPIE_CVS_PV cannot be used without inheriting
opie.bbclass
    task-base: bump after c7x0/akita config changes - should close #3223
    linux-rp: update Tosa patchset in 2.6.22 and 2.6.23 - close #3233
    linux-rp: enable uinput for Tosa in 2.6.17 - close #1372
    linux-rp 2.6.23: enable WiFi and PXA Overlays on Akita (from Poky) -
closes #3230 #3212
    gconf-dbus: do not install gconf.service into /usr/share/dbus-1.0/
dir as it is not used by DBus (from Poky)
    libowl: sync with Poky
    linux-rp: sync with Poky (removal of OpenZaurus stuff, added
autoload for pcmcia)
    sane-srcrevs: added OProfileUI
    mtools: add DESTDIR support patch from NetBSD (sync from Poky)
    orinoco-conf: call update-modules to populate information from
/etc/modutils
    hostap-conf: depend on update-modules (from Poky)
    module.bbclass: RDEPEND on update-modules (from Poky)
    bootimg.bbclass: import of new version (from Poky)
    dates: dropped 0.4.3
    contacts: dropped 0.5
    tasks: upgrade to 0.12 from Poky
    pkgconfig: remove whitespaces
    portmap: sync 6.0 with Poky (no package changes)
    bash: apply upstream fixes: up to 025 (was to 005) - from Poky

ifaistos@openembedded.org:
    conf/distro/angstrom-2007.1.conf : Set toolchain to gcc 4.1.1 for
dht-walnut.
    conf/machine/include/tune-ppc405.inc : Default to soft-float is
distro/machine/local.conf
    packages/gcc/gcc-package-cross.inc : Fix to handle /nof/ dirs
generated by some ppc
    conf/machine/dht-walnut.conf : Remove TARGET_FPU as its now included
in the tune-ppc405.inc
    conf/machine/include/tune-ppc405.inc : Move TARGET_FPU    =  "soft"
to the tune file so its
    packages/grdesktop/grdesktop_0.23.bb : Set RDEPENDS

jemery_laine:
    mpc8323e-rdb: Added Linux defconfig.

jeremy_laine:
    packages/linux/linux-2.6.23/mpc8323e-rdb/defconfig : Add
MPC8323E-RDB's NOR flash support
    conf/machine/mpc8323e-rdb.conf : Add correct parameters for jffs2
creation

joaquinduran@adtelecom.es:
    xdm: added libxaw to dependencies

koen@openembedded.org:
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
    sane-srcrevs: bump webkit
    sane-srcrevs: bump openmoko stuff, tested on gta01 and a780
    linux.inc: enable OABI on EABI builds
    linux.inc: build mkimage unconditionally
    linux-ezx: make 2.6.23 the default for a780
    gimp: update to 2.4

likewise@openembedded.org:
    uclibc: (Re)added mpc8313e-rdb/uClibc.machine

mickeyl@openembedded.org:
    linux-openmoko-devel: don't override do_deploy
    libsidplay: use autotools_stage_all
    libid3tag: use autotools_stage_all, inherit pkgconfig
    dbus-c++: catch up with SRCREV and make it build again
    openmoko-icon-theme-standard2-qvga: don't implicitly assume the
buildmachine
    add python-pyusb, python bindings to libusb
    openmoko-tasks2: add icon

mwester@openembedded.org:
    fakeroot: upgrade to 1.8.3 upstream version
    linux-openmoko-devel: add patch to fix bug 788
    linux-openmoko: add patch to fix bug 788
    fstab: clean-up white space, comment out the /media/ram mount

pH5@openembedded.org:
    telepathy-inspector: add 0.5.0, a debugging tool for Telepathy
developers
    telepathy: add telepathy-idle 0.1.2
    libgsmd-devel: install ts0705.h and ts0707.h, included by usock.h
    sane-srcrevs: add a SRCREV for libgsmd-devel
    libgsmd, libgsmd-devel: small fixes to gsmd init script

polyonymous@openembedded.org:
    kdepimpi: gcc syntax fix.
    opie-todo 1.2.3: another fix for stricter gcc.
    libopie2 1.2.3: syntax fix for newer gcc

rpurdie@openembedded.org:
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

thebohemian@gmx.net:
    gcc-csl: fix SRC_URI - close #3240

xora@openembedded.org:
    packages/mplayer/mplayer* : update mplayer relase and svn version PV
    angstrom-2007-preferred-versions.inc : incrment tinymail version
    altboot_1.1.1+wip-SVNR66.bb : add patch to get devnodes for mmcblkp?
from
    packages/gsm/gsmd.inc : we RPROVIDE gsmd as well
    openmoko-worldclock2_svn.bb : add libnotify to DEPENDS
    packages/gsm/gsmd.inc : implement suggestion from koen to solve the both
    openmoko-mediaplayer2_svn.bb : RDEPEND on openmoko-sound-system2 to make
    kismet-newcore_svn.bb : disable gpsmap, it doesnt build in newcore
    openmoko.conf : prefer libgsmd
    preferred-openmoko-versions.inc : should be ?= for linux-openmoko
    gsm/libgsmd_svn.bb, gsm/libgsmd_svn.bb : split gsmd into two packages.
    packages/openmoko2/openmoko-appmanager2_svn.bb : missed a PR bump
sometime



Bugs fixed:
bug_id resolution	 short_desc
1882 FIXED	 2.6.20 kernel prevents akita from suspending
3222 FIXED	 Linux 2.6.23 defconfig-akita is missing wireless modules
1372 FIXED	 uinput module for 2.6 tosa
1444 FIXED	 xtscal consumes 100% cpu
1637 FIXED	 glibc intermediate fails to build for powerpc due to missing
fpu/bits/mathinline.h in staging
1696 FIXED	 madwifi won't build for ppc603e / efika / powerpc
1891 FIXED	 Single channel audio on akita
1913 REMIND	 Bluez suffers from configuration bug
2043 INVALID	 libvocenabler fails do_compile
2361 FIXED	 MDK3v1
2368 FIXED	 Enhanced Ralink RT2570 Driver
2370 FIXED	 802.11 Sniffer and much more!
2904 FIXED	 Dependencies not matched installing openmoko stuff
3007 FIXED	 altboot does not see the sd-card (akita)
3123 FIXED	 bitbake gpephone-image fails on no 'email' provider available.
3158 FIXED	 Can't build linux-rp_2.6.22.bb
3169 FIXED	 meta-toolchain fails to build when icecc is used
3189 DUPLICATE	 [PATCH] new fakeroot package to fix download failure
3190 FIXED	 [PATCH] fix mkfontdir-native download location
3196 FIXED	 gpephone-image fails on librecord due to problems in
Makefile.am and configure.ac
3201 FIXED	 Fix: missing dependency for xdm
3202 FIXED	 Add a machine definition for MPC8323E-RDB
3204 FIXED	 libxml2-2.6.29-r5: do_populate_staging: failed
3206 FIXED	 Add uClibc configuration for MPC8323E-RDB
3207 FIXED	 Add linux configuration for MPC8323E-RDB
3212 FIXED	 Kernel config on akita does not include overlay support
3213 WONTFIX	 gconf-dbus-2.16.0+svnr1
3215 FIXED	 Ralink USB WiFi drivers
3220 FIXED	 PATCH: Update opie-mediaplayer2 to 1.2.3
3221 FIXED	 PATCH: Update opie-notes to 1.2.3
3225 FIXED	 Upgrade to syslog-ng 2.0.5
3230 FIXED	 no hostap cf support in 2.6.23 builds for akita
3239 FIXED	 Add  MTD + JFFS2 support for MPC8323E-RDB
3240 FIXED	 source location for 2005q3-2 codesourcery toolchain changed
3243 DUPLICATE	 fakeroot 1.7.1 - update URL or use newer version
3233 FIXED	 Update Tosa linux kernel patches
721 FIXED	 copy kernel files into staging for ppc platforms
3122 FIXED	 bitbake gpephone-image fails on liblipsevent due to
incorrect MD5/SHA256 checksums


Bugs opened:
bug_id resolution	 short_desc
3223 	 Akita PCMCIA module packages lacks chipset driver
3211 	 libgcc.so ends up in subdir but is not found during install
3214 	 Unable to build klibc 1.1.1 for linux 2.6.20.4
3216 	 linux-rp-2.6.23: fixed defconfig.poodle and a patch for
sound/soc/pxa/poodle.c
3217 	 h2200 doesn't charge while suspended (angstrom)
3218 	 gcc-cross-initial_4.2.2 doesn't compile
3219 	 ifup -a fails to bring up ethernets during networking startup
3224 	 New Quasar recipes available
3226 	 Use WORKDIR path to access apache2 init script
3227 	 Remove warnings about unsupported scp arguments
3228 	 Fix perl path for target installed perl scripts
3229 	 upgrade path for gsmd broken
3231 	 matchbox misbehaviour in 2.6.23 angstrom x11-image builds
3232 	 icecc-create-env.sh is adding cc1 and cc1plus to wrong directory
3234 	 bluetooth not working under h2200 with CSR radio (bcsp)
3235 	 default virtual keyboard in h2200
3236 	 hostap drivers do not load for prism card
3238 	 Cleanup: base perl_5.8.8.bb on perl.inc
3241 	 locale-base-en-gb required (and failing) when not specified in
local.conf
3242 	 librecord 0.1 is broken
3244 	 Enable u-boot autoboot on MPC8323E-RDB
3245 	 'bitbake agg' fails on missing libsdl-native
3246 	 libgemwidget DEPENDS incomplete - requires gnome-vfs and
gnome-vfs-modules
3247 	 libgemwidget fails on missings POTFILES.in
3248 	 agg.bb needs a -D
3249 	 Notecase 1.6.9 update
3250 	 gcc-cross-4.1.2-r10-do_compile

In total 27 bugs have been created and 38 bugs were closed.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHKZ6VMkyGM64RGpERAttyAJwPYoC27DrshpDVedFYbw1+pIjnqwCgjpcA
tG9KBTbLk/BTnXYf80xk66k=
=jnNo
-----END PGP SIGNATURE-----


