Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J2iRM-0003bD-Oo
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 08:25:05 +0100
Received: from Powerbook-2.local (vpn006016.vpn.utwente.nl [130.89.6.16])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBD7KYfr032659 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2007 08:20:35 +0100
Message-ID: <4760DD42.3030201@student.utwente.nl>
Date: Thu, 13 Dec 2007 08:20:34 +0100
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
Subject: OE changelog 20071207 - 20071213
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
X-List-Received-Date: Thu, 13 Dec 2007 07:25:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Fabrice.Aeschbacher@siemens.com:
    xfce-mcs-manager: added intltool-native into deps

cbrake@openembedded.org:
    mono 1.2.6pre4: add new version to OE

crofton@openembedded.org:
    directfb : Remove patch that changes include file path. For bug #3415.

florian@openembedded.org:
    gpe-applauncher: Use grid layout per default.

hrw@openembedded.org:
    curl: really disable libidn (from Poky)
    matchbox-keyboard-inputmethod: fix RCONFLICTS to get openmoko-image
built
    rootfs_deb.bbclass: few fixes to get it working
    zaurus-updater: do not run shell at the end - reboot instead
    zaurus-updater: fix shell error visible on tosa/poodle
    zaurus-updater: fixed JFFS2: wrong bitmask problems (some code needs
to run only on Tosa and Poodle)
    updater: reformat (please use space not tabs)

jeremy_laine@openembedded.org:
    python-django: add Django Python Web framework
    python-pysqlite2: add pysqlite Python interface to SQLite 3

john_lee@openmoko.com:
    fix typo to make sourcepkg.bbclass work when inherited.
    Integrate helper scripts into meta-toolchain-openmoko.

khem@openembedded.org:
    Add glibc-* to equivalent eglibc-* packages in RPROVIDES.

koen@openembedded.org:
    webkit update: update webkit srcrevs, add midori 0.13, bump
openmoko-feedreader2 and openmoko-browser2
    webkit-gtk: fiddle with exceptions and rtti cflags
    task-openmoko: fix typo
    task-openmoko: split in to seperate recipes to cut down buildtime
for minimal-openmoko-image
    minimal-openmoko-image: image with only dialer + terminal
    angstrom 2007 preferred versions: fixes the autobuilder needed to
get things building
    collie-2.6.inc: copy installkit code from zaurus-2.6.inc
    minimal-gpe-image: add images that only offers a basic 'desktop'
    angstrom-feed-configs: add iwmmxt feeds for machine that have
'iwmmxt' as MACHINE_FEATURE
    mysql: workaround two problems:
    linux 2.6.23: _append requires a leading space
    bluez: add 3.23 releases
    meta-toolchain: use FEED_ARCH in tarball-name
    linux.inc: introduce CMDLINE_DEBUG to hide or show kernel messages
    linux.inc: do_deploy changes:
    uboot-openmoko: undo mickey damage that broke *everyones* build due
to parse errors
    angstrom autobuilder: also build native toolchain for all archs
    pkgconfig.bbclass: also catch ${STAGING_DIR_TARGET}
    pkgconfig.bbclass: sed out references to staging as well
    various files: update my email address and website address
    xorg-driver: update ati, add xgi and vmware
    mesa-dri: add RRECOMMENDS for drm kernel modules
    mesa: add 7.0.2
    linux-efika: enable radeon drm
    enchant: add workaround for libstdc++ linking problem. Frobbing
LDFLAGS doesn't help
    package_ipk.bbclass, sanity.conf: attemp to be compatible with
bitbake 1.8.8 again

likewise@openembedded.org:
    package_ipk.bbclass: Fix one remaining occurence of
bb.utils.lockfile(), so that it works with bitbake 1.8.8.
    linux-2.6.23: Add LED trigger for CPU activity. Added powerpc hook.
Build module for MPC8313E-RDB machine.

mickeyl@openembedded.org:
    python-pydirectfb: commit missing patch
    directfb: refactor commonalities into directfb.inc, bring back 1.0.0
    linux-openmoko.inc: catch up with naming changes in linux.inc
    python-pygtk 2.10.4 python-pycairo is actually a build time dependency
    add python-pydirectfb, Python bindings to DirectFB
    directfb 1.1.0 fix pkgconfig issue at last, clean up recipe, fix
packaging
    evas cvs use PACKAGE_DYNAMIC to announce individual low level modules
    expedite cvs fix version number, add rdependencies on necessary evas
low level modules
    agg 2.5 use less offensive way to make it find sdl compile flags
    pty 0.0 fix formatting
    uboot-openmoko svn bump version to 1.3.0+svn, fix display of
LOCALVERSION

mwester@openembedded.org:
    linux-ixp4xx: make the new defconfig specific to the machine, not
the distro.
    linux-ixp4xx: 2.6.21.6 - added custom defconfig (slimmed down) for
SlugOS.
    slugos.inc: added a couple of PREFERRED_PROVIDER lines to avoid
ambiguity

pfalcon@openembedded.org:
    build-release.sh: Add h3900.
    linux-handhelds-2.6: Use deployed kernel filename consistent with
main kernel recipe.
    angstrom-2007.1.conf: Use bluez 3.23.
    matchbox-keyboard-inputmethod svn: Apply multiple-layouts patches.
    task-base: Bump PR again to make sure all machine config changes
propogated.
    h3600.conf: Remove crap.
    h4000.conf: Use canonical module names in autoloads.
    kernel.bbclass: When processing module_autoload's, also try
canonical name (with dashes).
    linux-rp: Bump PR to get kernel-modules fixes.
    devimage-image: Refactor to use task, to get proper
RDEPENDS/RRECOMMENDS.
    linux-handhelds-2.6 2.6.21-hh19: Bump PR to propogate kernel-modules
fix.
    kernel.bbclass: Add kernel-vmlinux to kernel-modules dependency
blacklist.
    PocketPC machines: Remove non machine-specific modules.
    PocketPC machines: Remove bogus af-key module.
    h2200.conf: Deploy and autoload sound modules, should make sound
available.
    h4000.conf: Add kernel-module-h4000-bt.
    htcuniversal.conf: Remove NLS modules, not machine-specific.
    hx4700.conf: Remove NLS modules, not machine specific.
    task-base: Add kernel-module-nls-utf8 to RRECOMMENDS_task-base-kernel26.
    dropbear-early 1.0: Assumes dropbear is present, so RDEPEND on it.

philippe@openembedded.org:
    gpe-mini-browser: fix QA issue with desktop file

slapin@openembedded.org:
    linux-hackndev: Since we support git:// protocol now, use it by default

thebohemian@gmx.net:
    pulse: build hal-detect. Closes #3297

xjqian@openembedded.org:
    zroadmap: move zroadmap recipies to packages/roadmap for merging
    octave: bump 2.9.19, fix -dbg += bug#2317
    angstrom-2007-preferred-versions.inc: prefer octave 2.1.73 (stable).
    tosa_udc_use_gpio_vbus.patch: fix patch hunk only, retain mail header.
    disapproval of revision 'e9723297c42dc2e4470bd4cdc748d71e88ef4148'
    tosa_udc_use_gpio_vbus.patch pxa2xx_udc_support_inverse_vbus.patch:
fix patch hunk, delete junk.



Bugs fixed:
bug_id resolution	 short_desc
3102 FIXED	 unrecognized option `-Qy' to arm-angstrom-linux-gnueabi-as
on x86_64
1527 FIXED	 usb networking broken in tosa
2124 FIXED	 Angstrom on akita can't login via gpe-login/xdm
2163 FIXED	 glib-2.0 python variable expansion does not work
2365 FIXED	 uclibc: can't handle reloc type 0x49 in lib '/lib/libc.so.6'
for powerpc/angstrom/uclibc
2568 FIXED	 Angstrom logo looks bad on 320x320 screen (psplash)
2780 DUPLICATE	 mysql-4.1.18-r2-do_compile
2787 FIXED	 python-ecore-0.0.0+cvs20070816-r0-do_compile
2788 FIXED	 python-evas-0.0.0+cvs20070816-r0-do_compile
2894 FIXED	 eglibc should provide glibc packages when chosen as default libc
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2993 FIXED	 eglibc: export-fcntl2.patch no longer needed since svn rev 3468
3248 FIXED	 agg.bb needs a -D
3289 FIXED	 python-ecore-0.1.1+cvs20070819-r1-do_compile
3297 FIXED	 pulseaudio: build hal-detect module
3346 FIXED	 Upstream GCC C compiler bug
3368 FIXED	 python 2.5 is not build with ctypes on arm
3371 FIXED	 openrdate recipe
3373 FIXED	 fix firefox 2.0.0.3 building
3377 FIXED	 contacts-0.7-r1-do_compile
3399 FIXED	 Add --disable-libgomp to gcc 4.2.x recipes
3417 FIXED	 dates-0.4.4-r2-do_compile
3426 INVALID	 build angstrom with unecessary packages.
3427 FIXED	 Add LED classCPU activity trigger
3439 INVALID	 glib2 will not configure in right way on Mamona for qemux86
3445 FIXED	 gpe-mini-browser-0.2 QA issues
3446 FIXED	 zaurus-updater changes have broken flashing on zaurus c760
3454 INVALID	 mplayer-0.0+1.0rc2-r6-do_compile
3458 FIXED	 Issues discovering BT device names with bluez 3.22
3461 INVALID	 gcc-cross-4.1.2-r13-do_compile


Bugs opened:
bug_id resolution	 short_desc
3431 	 Unknown task spits out traceback instead of friendly error message
3428 	 preferred xserver-kdrive-imageon for c7x0
3429 	 gnash-CVS
3430 	 Patch for adding Cmdline support in kexec-tools
3433 	 Evas and Ecore no longer build with directfb support
3434 	 New recipe for spidermonkey javascript/js 1.7.0
3435 	 hal: Missing /var/cache/hald
3436 	 libx11-native-1.0.1-r0-do_compile
3437 	 xfonts-xorg-6.8-r1-do_compile
3438 	 New package KedPM
3440 	 meta-toolchain does not build for mpc8313e-rdb/powerpc
3441 	 dates-0.4.4-r2 do package QA errors
3442 	 gpe-plucker_0.4 fails to build
3443 	 gpe-theme-clearlooks-0.3 QA issues
3444 	 gpe-irc-0.08 QA issues
3447 	 linux-rp-2.6.21-r12-do_compile
3448 	 MPlayer lacks Real Video support
3449 	 genext2fs file size error
3450 	 python-pygtk-2.10.4-ml5-do_configure
3451 	 eet-native-0.9.10.041+cvs20071206-r0-do_fetch
3452 	 eet-0.9.10.041+cvs20071206-r0-do_fetch
3453 	 edje-native-0.5.0.41+cvs20071206-r0-do_compile
3455 	 php-native-5.2.0-r1-do_compile
3456 	 Zaurus won't resume if suspended during charge
3459 	 altboot-image for c7x0 stuck on altboot prompt
3462 	 librecord-0.1-r0-do_fetch
3463 	 librecord-1.0-r0-do_configure
3464 	 Multiple files for bluez-utils-dbus
3465 	 zaurus-hinge cannot find bl (on c7x0)
- -e
In total 29 bugs have been created and 30 bugs were closed.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHYN1CMkyGM64RGpERApJBAJwJg0i5HgeOnSPg5Y5omfT9VFajJwCbBy9S
Dsplge4X/9EIN2TK8crHjS8=
=+x9G
-----END PGP SIGNATURE-----


