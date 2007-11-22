Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iv97z-0001pL-GI
	for openembedded-devel@openembedded.org; Thu, 22 Nov 2007 11:17:47 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAMAFLnH024953 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 11:15:22 +0100
Message-ID: <474556B9.2000508@student.utwente.nl>
Date: Thu, 22 Nov 2007 11:15:21 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: OE weekly changelog 20071115 - 20071122
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
X-List-Received-Date: Thu, 22 Nov 2007 10:17:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cwiiis:
    libjana_svn.bb : build and package examples

coredump2@openembedded.org:
    linux: Update ix4xx defconfig to enable cryptsetup on NSLU2
    cryptsetup: Update RECOMMENDS and DEPENDS
    Add cryptsetup: cryptsetup with luks support creates and manages
encrypted containers and partitions
    altboot: Update to SVNR69,  importing sd-dynamix-fix.patch, thanks!
    zaurusd: Try a bit harder to re-enable the backlight on hinge-open
and resume when APM fails to do so for whatever reason
    display-brightness: Do not allow to turn off the backlight
    hostap: Fix path to firmware for f/w auto-loading

crofton@openembedded.org:
    wifistix : Sync with gumstix repo.

dbaryshkov@gmail.com:
    wlan-ng-modules: fix for the fix of wlan-ng-modules 0.2.7 - close #3340

florian@openembedded.org:
    firewall: Add svn recipe
    useen: Add svn recipe
    quickdial: Add svn recipe

hrw@openembedded.org:
    zaurus-updater: Unified version for all PXA zaurus models - close #1526
    gpsdrive: fix SRC_URI - close #3279

ifaistos@openembedded.org:
    conf/distro/angstrom-2007.1.conf : Set gcc to 4.1.1 for the xilinx
ml403 board
    packages/liboil/liboil_0.3.11.bb : Correctly detect if the powerpc
target has fpu
    packages/glibc/glibc_2.5.bb : Add a new patch for the powerpc
targets with softfloat

jeremy_laine@openembedded.org:
    python-cheetah_2.0.1.bb: package version 2.0.1 of the cheetah
template engine
    python-pyopenssl_0.6.bb: add simple Python wrapper around OpenSSL
    python-pyrad_1.1.bb: package pyrad 1.1
    setuptools.bbclass : add class for python packages using setuptools
    distutils.bbclass : make the arguments passed to setup.py variables
to allow customisation
    linux-2.6.23: add LEDs driver for MPC8323E-RDB boards
    iptables: backport fix for "getsockopt failed strangely" (Closes: #3260)
    Fix python 2.5 manifest:

jluebbe@openembedded.org:
    checksums.ini: Add some new checksums.

koen@openembedded.org:
    linux-rp 2.6.23: bump PR to force rebuild to get gcc fix
    angstrom-2007-preferred-versions: adjust versions to match feeds, as
discussed on the angstrom-dev mailinglist
    local.conf.sample: update DISTRO to something that works for 99.9%
of the users
    cryptsetup: run through oe-stylize and remove postinst hack
    libmokogsmd2: bump PR for libgsmd change
    openmoko-panel-gsm: bump PR for libgsmd change
    angstrom 2007: prefer libgsmd over libgsmd-devel for the time being
    seppuku: some more debugging
    angstrom.inc: fix sepukku typo
    sepukku: don't log html to file, log more usefull stuff. Debug now
looks like:
    gsmd: repair breakage for people not using bleeding edge svn versions
    notecase: update to 1.7.2
    angstrom: only ship strace and procps for debug builds, this is a
first step into removing angstrom frobbing task-base stuff (should be
left to images to decide on this stuff)
    matchbox-common: make it bug compatible again
    midori: update to 0.11
    maemo: rename maemo3 to maemo4 since it's using most of the chinook
API already

likewise@openembedded.org:
    gcc-4.1.2: Update PR for gcc(-cross). Mention to update PR of -cross
when .bb main changes.
    gcc-4.1.2: Follow upstream fix for pr34130. -C*abs(D) became
abs(-C*D), not good.
    pango: Added 1.18.3 with DEFAULT_PREFERENCE -1.
    squashfs-tools: Fix; move PV from .inc into .bb.
    squashfs-tools: Added release 3.3.

mickeyl@openembedded.org:
    openmoko-sound-system2:
    gsmd: add new plugin gta01

mwester@openembedded.org:
    SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files.
 (Note that
    slugos-packages: added portmap and nfs-utils back in.
    slugos-init: turnup - use volatiles to create /var/log/lastlog when
turned-up
    autofs: remove dependency on bash, and add rc.update.d stuff to bb file.
    portmap: SlugOS only - do not build with "-pie -fpie" due to
binutils problems.
    Bump PR
    wireless-tools.if-pre-up - move setting of the ESSID to the end of
the script,
    initscripts: SlugOS - add bootclean.sh to clean out /tmp, /var/lock,
/var/run
    gtk+: undo erroneous changes to gtk+ that were probably
inadvertantly committed along with squashfs changes.
    base-files: bump PR to force a rebuild of this package with updated
package.bbclass
    package.bbclass: fix some corner cases with the new package copy
mechanism.

pH5@openembedded.org:
    angstrom-2007.1.conf: remove xrandr preferred versions, they are
defined in angstrom-2007-preferred-versions.inc
    angstrom-2008.1.conf: use gcc 4.2.2
    angstrom-2008.1.conf: sync with 2007.1, use linux-handhelds-2.6
version 2.6.21-hh18
    angstrom-2008.1.conf: sync with 2007.1, avahi and
openssh-sftp-server in RRECOMMENDS
    gmailfs: add 0.8.0
    fuse-module: add 2.7.1
    gvfs: add 0.0.2, a userspace virtual filesystem
    gio-standalone: add do_stage function
    gio-standalone: add 0.1.2, a file and I/O abstraction library
    site/arm-*: add getgrgid for gio
    fuse: add 2.7.1
    tmut: add 1.1.0
    libtinymail: add 0.0.5, shuffle around no-iconv-detect.patch

rpurdie@openembedded.org:
    packages: Remove various hardcoded staging layout assumptions
    Remove meta-sdk* and replace with meta-toolchain stubs
    meta-toolchain: Sync with Poky
    gnutls: Add patch to fix bogus -L and -I compiler options being used
(from poky)
    glibc: Various tweaks from Poky
    eds-dbus: Sync some changes from Poky (mainly for staging fix)
    autoconf: Apply patch to stop bogus x includes creeping in through
standard tests (from poky)
    atk: DEPENDS on gtk-doc-native, not gtk-doc (from Poky)
    bitbake.conf: Fix TERMCMD handling and a typo (from Poky)
    bitbake.conf: Extend PATH in anticipation of staging changes, add
ability to switch OOB layout for yaffs2 images (from Poky)
    bitbake.conf: Set verion dependencies of -dbg and -dev packages more
correctly (from Poky)
    classes: Sync staging layout cleanups from Poky

rwhitby@nslu2-linux.org:
    slugos-packages: Demote packages that no longer build
    net-tools: Put quotes around flags so that expansion with spaces
does not cause syntax errors.
    sane-srcrevs: Bump libgsmd to match mickey's changes to gsmd.inc -
tested by CM

xjqian@gmail.com:
    gnuplot: fix QA errors, unify, add opie terminal, closes #2299

xora@openembedded.org:
    xserver-kdrive : commit missing patches
    linux-openmoko : commit missing patch
    xserver-kdrive_1.3.0.0.bb : add Xglamo server for Neo1973
    openmoko-session2.bb, sane-srcrevs.inc : version boost for all openmoko
    netbase_4.21.bb : on gta01/02 machines set default DNS on bring usb up
    initscripts_1.0.bb : restore the resolv.conf handling we used to have
    alsa-state.bb : add states for fic-gta01 for VOIP usage (full duplex
audio)
    linux-rp_2.6.23.bb : add missing patch to prevent connect+ cards from
    openmoko-session2.bb : install out window manager script using
update-alternatives. Fixes no openmoko-today2 problem


Bugs fixed:
bug_id resolution	 short_desc
3223 FIXED	 Akita PCMCIA module packages lacks chipset driver
2747 FIXED	 failme-1.0-r0-do_configure
1526 FIXED	 One updater.sh to rule all PXA Zaurus models
2299 FIXED	 gnuplot packaging QA issue
2348 FIXED	 alsa-utils build fails against uclibc
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2974 FIXED	 madwifi-ng-r2518-20070626-r5-do_compile
3177 INVALID	 Sepukku.bbclass can't attach logs anymore
3251 FIXED	 popt-1.7-r4-do_compile
3260 FIXED	 iptables fails with error getsockopt failed strangely
3272 FIXED	 python-logging is missing some dependencies
3279 FIXED	 gpsdrive SRC_URI changed
3293 INVALID	 opie-taskbar-images fails to build
3296 FIXED	 python-core is missing struct.py
3299 FIXED	 cvs recipe for navit
3301 FIXED	 sqlite3_3.4.1 : source tarball is no longer available
3302 FIXED	 expat fails to install to image
3303 FIXED	 python-crypt 2.5 has an incorrect FILES definition
3304 INVALID	 Bitbake complains about missing deps due to changes to the
repo.
3320 FIXED	 h2200 autobuild images (20071117) don't ever make it into
gpe desktop
3323 FIXED	 notecase-1.7.2-r1-do_compile
3324 FIXED	 sysvinit-2.86-r36-do_rm_work
3331 DUPLICATE	 ping: permission denied. (are you root?)
3334 WONTFIX	 -rootdelay locks up linux-rp-2.6.23
3340 FIXED	 fix for the fix of wlan-ng-modules 0.2.7
2685 FIXED	 Screen Rotator GPE applet does not rotate from landscape to
portrait
2928 FIXED	 binutils-cross 2.18 fails to build on x86_64

Bugs opened:
bug_id resolution	 short_desc
3321 	 Both libxine-fb and libxine-x11 get built as both have same
PACKAGES-DYNAMIC
3305 	 white keys do not work correctly (akita)
3306 	 mpeg2dec-0.4.0b-r4-do_compile
3307 	 Fix for angstrom-task-sectest
3308 	 Fix for cacao-cldc
3309 	 Fix for flumotion
3310 	 Fix for task-native-sdk
3311 	 Fix for task-opie-all
3312 	 Fix for task-python-sharprom
3313 	 Fix for task-sdk-opie
3314 	 wireshark: missing icon
3315 	 gpe-conf xxx does not work (akita)
3316 	 linphone does not start (akita)
3317 	 clawas-mail: Plugins cannot be started (akita)
3318 	 module-init-tools-cross-3.2.2-r3-do_configure
3319 	 elf2flt-0.0+svnr1786-r0-do_compile
3322 	 fortune-mod builds for the host
3325 	 glib-2.0-2.14.1-r2-do_compile
3326 	 vim: arrows doesn't work in insert mode
3327 	 gvim: syntax highliting doesn't work
3328 	 sound broken for h2200 in 20071117 autobuild
3329 	 h2200 images (20071117 and earlier) have a media 'folder' in the
gpe menu with no contents
3330 	 epdfview: error while loading libpoppler-glib.so.1
3332 	 Abiword 2.5.x: workaround for UI issues on small screens
3333 	 linux-rp-2.6.23: sd drivers do not load before looking for root fs
3335 	 Add support for Socket 10/100 CF Ethernet Card
3336 	 openmoko-dialer2-0.1.0+svnr3438-r5-do_compile
3337 	 gpe-conf task_backlight can not turn off the power of the backlight
3338 	 pref. version of packages Angstrom 2007.1
3339 	 Upgrade to mpfr-2.3.0
3341 	 webkit-gtk-0.1+svnr27222-r3-do_configure
3342 	 binutils 2.17.50.0.5 fails to build due makeinfo version problem
3343 	 [PATCH] fix libungif download location
3344 	 openmoko-feedreader2-0.0.1+svnr623080-r1-do_fetch
3345 	 ecore-native stages unusable libraries
3346 	 Upstream GCC C compiler bug
3347 	 glibc-2.5-r8-do_compile
3348 	 glibc-intermediate-2.5-r8-do_compile
3349 	 alsa-lib-1.0.14-r2-do_install
3350 	 gpe-clock applet does not expand to show entire time
3351 	 zImage-2.6.23-poodle-20071117021844.bin crashes on boot
3352 	 xserver-kdrive-1.3.0.0-r20-do_compile


In total 42 bugs have been created and 27 bugs were closed.



- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHRVa5MkyGM64RGpERAhCcAJ4iy6O55l3PdK3P449XGwuGTWyjWgCggmoY
XsCMj7mwnWYM1q+PjEpaGFQ=
=dxnX
-----END PGP SIGNATURE-----


