Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iq7Bi-0006Ol-CG
	for openembedded-devel@openembedded.org; Thu, 08 Nov 2007 14:12:50 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA8DBgYk025427 for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Nov 2007 14:11:43 +0100
Message-ID: <47330B0B.5000106@student.utwente.nl>
Date: Thu, 08 Nov 2007 14:11:39 +0100
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
Subject: OE weekly Changelog 20071101 - 20071108
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
X-List-Received-Date: Thu, 08 Nov 2007 13:12:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jereme_Laine:
    conf/machine/mpc8323e-rdb.conf : Add pci and uboot to MACHINE_FEATURES

Jeremy_Laine:
    packages/linux/linux-2.6.23/mpc8323e-rdb/defconfig : Enable auto
module loading
    packages/madwifi/madwifi-ng_r2826-20071105.bb : Add new package
madwifi-ng_r2826-20071105.bb

abraxa@dar-clan.de:
    sane-srcrevs: dump OpenMoko-(Today2,Dates2) and Matchbox-Desktop to
unbreak OpenMoko builds

eha@doredevelopment.dk:
    apache2: Use WORKDIR path to access apache2 init script - close #3226

florian@openembedded.org:
    libchenabler: Add patch to fix i18n breakage.
    libgemwidget: add 1.0
    vmware.conf: New machine definition and defconfig for vmware disk
images. Fixes #868

henryk@openembedded.org:
    vte: Add missing DEPENDS

hrw@openembedded.org:
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

koen@openembedded.org:
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

mickeyl@openembedded.org:
    add vala, a C#-like language that aims to simplify GObject programming
    neod: add dependency to dbus-1
    conf files: remove preferred-openmoko-versions.inc (they're included
in sane-srcdates.inc),

oliver.fels@gmx.net:
    notecase: update to 1.6.9

pH5@openembedded.org:
    powertop: add 1.9

rpurdie@openembedded.org:
    package.bbclass: Stop do_package from being destructive by copying
instead of moving files (from poky). The copyfile function will be moved
to bitbake in due course.

woglinde2@openembedded.org:
    alsa-utils: fix bug 2348, nls problem with libintl

xora@openembedded.org:
    eds-dbus_svn.bb : convert to SRCREV
    sane-srcrevs.inc : bump openmoko-theme-standard2
    mplayer/files/motion-comp-pld.patch : remeber patch
    mplayer_0.0+1.0rc2.bb : fix for armv4
    sane-srcrevs.inc : add linux-openmoko as it was removed from
everywhere else.
    packages/gsm/gsmd.inc : fix regressions caused by moving around gsmd
    openmoko-worldclock2_svn.bb : fix depends


Bugs fixed:
bug_id resolution	 short_desc
868 FIXED	 [patch] initial support for vmware virtual machines
2876 DUPLICATE	 please add axnet_cs module to zaurus kernels
(linux-rp-2.6.*)
3007 FIXED	 altboot does not see the sd-card (akita)
3049 FIXED	 bitbake-1.2.1.bb parallel make fails
3224 FIXED	 New Quasar recipes available
3226 FIXED	 Use WORKDIR path to access apache2 init script
3244 WORKSFORME	 Enable u-boot autoboot on MPC8323E-RDB
3249 FIXED	 Notecase 1.6.9 update
3255 INVALID	 Spitz amber LED not affected by /sys entries
3256 WORKSFORME	 fontconfig_2.4.1.bb not building due to error fetching
device_symbols.h
3261 FIXED	 madwifi snapshot needs updating
3266 INVALID	 new version of library libsigc++-2.0
3271 FIXED	 epiphany-2.19.6-r1-do_configure

Bugs opened:
bug_id resolution	 short_desc
3259 	 BitBake Shell: error executing 'showdata' command
3251 	 popt-1.7-r4-do_compile
3252 	 uclibc-0.9.29-r8-do_compile
3253 	 Belkin bt card not working - hciattach fails with bcsp error messages
3254 	 native OpenSSL fails to build due to the use of target linker flags
3257 	 gcc-syntax-fix.patch fixed upstream for libopie2-1.2.3
3258 	 iptables_1.3.8 fails to compile
3260 	 iptables fails with error getsockopt failed strangely
3262 	 gconf-dbus-2.16.0+svnr606-r4-do_compile
3263 	 xserver-kdrive-1.3.0.0-r19-do_compile
3264 	 linux-libc-headers depends on gettext-native
3265 	 Update the version of glibmm library
3267 	 e-wm fails to start after install
3268 	 neod-0.1.0+svnr2956-r5-do_compile
3269 	 gnash-0.8.0-r0-do_populate_staging
3270 	 gnash-0.8.1-r0-do_compile
3272 	 python-logging is missing some dependencies

In total 17 bugs have been created and 13 bugs were closed.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHMwsLMkyGM64RGpERAlVKAKCrWrtb4+9Mn6cqnVJsVDavAR1YKQCdEgjk
JV4tE8en/odyq1C+Cib8N6o=
=QPho
-----END PGP SIGNATURE-----


