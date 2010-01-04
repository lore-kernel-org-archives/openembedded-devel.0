Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NRtJM-00088m-Qq
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:13:59 +0100
Received: by ewy4 with SMTP id 4so16610385ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 12:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=W/WVxSGnH4CmEEF0eoAk2q9x4SxWXxyecZpP6GRzST8=;
	b=jHJflvB9abN70s8WKcfEVxGXN0bDBfZtBkraRipGnOMgw1gSQGqcq/bl9umFAGJOjX
	Tst4PxdBxQ9b3rNAuklxG7Cvk0ukR3n4HdB1JO5pr60BdSk91yzfcobbzXslxEFOvyil
	wl4QwiBslvDK3E0qREruq7fQ7rOPeK9cQIPLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=sbNO2yCInBqdrf7xwSV89RysOhJffwlUCGU5IjfIytMhZ28ag2DAvKxyVw0HtjeLqp
	hMiI9LNR1N4Tf8Hu2GlF7RnkZW59hbiwWpwWsk2e28vTkI//B+S8x/u+Ou9DUgU4AOe0
	nDe+G6iXr+vKkx1WwnZyESnDLFRTivSieDBiw=
MIME-Version: 1.0
Received: by 10.216.85.138 with SMTP id u10mr8128498wee.185.1262635913493; 
	Mon, 04 Jan 2010 12:11:53 -0800 (PST)
Date: Mon, 4 Jan 2010 15:11:53 -0500
Message-ID: <f96d234e1001041211u6ab12bbbi7cda3e2a368224e2@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-12-28 to 2010-01-04
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2010 20:14:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-12-28 to 2010-01-04

Andrea Adami (3):
  kernel.bbclass: copy gz, lzo, lzma initramfs cpio images. - since 2.6.30 =
the
  linux-kexecboot.inc: favour lzma for initramfs.cpio for k. >=3D 2.6.32
  linux-kexecboot.inc: use bb.utils.vercmp_part for version_less_or_equal. =
 Bu

Benjamin Schieder (1):
  neomis: prevent screen blanking in SHR via fsoraw

Denis 'Gnutoo' Carikli (10):
  grub 0.97 : add support fo 256 bytes inodes
  emacs: added version 23.1 and fixed compilation on x86
  wesnoth 1.6.5 :DO NOT COMMIT YET added support for eee701
  Revert "wesnoth 1.6.5 :DO NOT COMMIT YET added support for eee701"
  libwmf: new recipe, libwmf id a library for converting WMF files
  abiword 2.8.1: multiple fixes
  goffice 0.7.4: fixed compilation removing dolt
  gmime : removed dolt
  xf86-video-intel 2.9.1 : removed dolt

Frans Meulenbroeks (43):
  angstrom/build-feeds.sh: added myththemes and mythplugins
  angstrom/build-feeds.sh: added nano
  libextutils-makemaker-perl: removed; with the new staging it breaks perl =
by
  libhtml-treebuilder-perl: updated dependency
  perl: bumped PR  to force rebuild; libextutils-makemaker-perl can have ov=
erw
  xmltv: fix paths to perl exe
  libio-stringy-perl: created recipe
  libxml-regexp-perl_0.03.bb - created libxml-regexp-perl-native_0.03.bb - =
cre
  libxml-dom-perl-native_1.44.bb: created libxml-dom-perl_1.44.bb: created
  libsoap-lite-perl-native_0.710.08.bb: created
  libdatetime-format-strptime-perl-native_1.1000.bb: created libdatetime-fo=
rma
  libtimedate-perl: moved to 1.20, added BBCLASSEXTEND
  perl/lib*: removed most -native recipes, added BBCLASSEXTEND to the non-n=
ati
  libint-perl: fixed compilation, removed native recipe added BBCLASSEXTEND
  libhttp-cache-transparent-perl_1.0.bb: create recipe
  liblingua-en-numbers-ordinate_1.02.bb: created recipe
  libunicode-string-perl_2.09.bb: added recipe
  libunicode-utf8simple-perl_1.06.bb: created recipe
  libclass-methodmaker-perl_2.15.bb: added recipe libterm-progressbar-perl_=
2.0
  liblinux-dvb-perl_1.0.bb: added recipe
  xmltv_0.5.56.bb: added more dependencies so more grabbers get build
  mythtv_0.22.bb: updated dependencies
  myththemes_0.22.bb: added dependencies
  mythplugins_0.22.bb: updated dependencies; added lihghttpd for mythweb
  libxml-dom-perl_1.44.bb: RDEPENDS -> DEPENDS, removed duplicate PR assign=
men
  verious perl recipes: added missing PR
  perl: added DESCRIPTION to various lib* bb files that didn't have one
  liburi-perl: moved to 1.52
  perl: various recipes did not have ${PV} in URI, replaced
  libintl-perl_1.20.bb created recipe for 1.20
  python-coherence_0.6.6.2.bb: created recipe for 0.6.6.2
  libalgorithm-diff-perl_1.1902.bb updated to latest version
  libarchive-zip-perl_1.30.bb updated to latest version
  libcache-cache-perl_1.06.bb updated to latest version
  libcompress-raw-zlib-perl_2.023.bb updated to latest version
  libcompress-zlib-perl_2.015.bb updated to latest version
  libcrypt-rijndael-perl_1.08.bb updated to latest version
  conf/checksums.ini: added a few missing perl checksums (forgot to commit =
thi

Graeme Gregory (1):
  transmission_1.76+1.80b3.bb : update to the latest beta of transmission

Gregoire Gentil (1):
  xscreensaver 5.07: Fix build with new xorg

Guo Hongruan (2):
  Add mips entry for linux-uclibc into package_qa_get_machine_dict of insan=
e.b
  Fix the wrong setting in qemumips/uClibc.machine

Jeremy Lain=E9 (6):
  libsdl-x11: disable ps3 video, it fails to build
  binutils-2.20: add patch for ld segfault on powerpc
  binutils-2.18: fix ld segfault when building Qt 4.6.0 on powerpc
  checksums.ini: add entry for new tzdata-2009s SRC_URI
  linux-2.6.31: enable 8139cp for networking in qemux86
  iptables: fix packaging of ${libexec}/xtables modules

Khem Raj (6):
  uclibc-nptl: Move SRCREV to latest on nptl branch.
  uclibc_nptl.bb: Set DEFAULT_PREFERENCE to -1.
  gcc-svn: Move SRCREV to recipe.
  libmpc: Rename newly added mpc to libmpc.
  libmpc: Rename require filenames in recipes to reflect recent name change=
.
  gcc-cvs: DEPEND on libmpc instead of mpc.

Koen Kooi (19):
  xserver-xorg 1.7.3: add overlapped blit support for angstrom
  gcc-package-target: set INSANE_SKIP is true on the objc package to mask m=
iss
  angstrom feed sorter: add archos5 machine
  angstrom feed builder: add geany
  bluez4: add 4.59
  libsoup: add 2.28.2 and 2.29.3
  midori: add 0.2.2
  webkit-gtk: bump to 1.1.18+svnr52207
  xf86-video-omapfb: refresh patch
  arora: bump PR
  gnome-mplayer svn: bump SRCREV, fix dependencies and packaging
  linux-omap 2.6.32: add patch to fix NAND ECC errors
  mplayer: bump SRCREV
  angstrom: update mplayer preferred version
  mythtv 0.22: switch to 0.22+fixes
  libxml-dom-perl: do not RDEPENDS on native stuff
  libcompress-zlib-perl: add checksum and fix packaging
  mythtv 0.22: fix versioning
  ruby: add 1.8.7-p248, this one actually builds

Leon Woestenberg (9):
  linux-2.6.32: Add support for MACHINE=3Dion.
  nvidia-display: Set DEFAULT_PREFERENCE=3D1 for MACHINE ion.
  netbase/init: Do not run 'ifup -a' if root is network mounted.
  helloworld-image: Set some IMAGE_* so that nothing extra gets included.
  nvidia-display-190.42: Fix library versioning.
  linux-2.6.32/ion/defconfig: Tune-down to better match machine.
  firefox-3.5.5: --disable-crashreporter
  xserver-xorg-1.7.3: Enable Xinerama for MACHINE ion, due to NVidia.
  xserver-xorg-conf: Added config for MACHINE ion.

Marcin Juszkiewicz (4):
  linux 2.6.27: updated to .42
  linux 2.6.31: updated to .9
  linux 2.6.32: updated to .2
  checksums.ini: added checksums for kernel patches

Martin Jansa (9):
  linux-openmoko-2.6.32: add patch for 2.6.32.2, bump srcrev for ar6000, up=
dat
  linux-2.6.32+2.6.33-rc2, linux-kexecboot-2.6.32+2.6.33-rc2: add new versi=
on
  checksums.ini: missing checksum for vala-0.7.9.1
  checksums.ini: replace checksum for vala-0.7.9.1
  xserver-xorg 1.7.3: add overlapped blit support for shr too
  linux-kexecboot-2.6.32+2.6.33-rc2: update spitz defconfig a bit to suppor=
t o
  om-gta02.conf: set MACHINE_DRI_MODULES =3D glamo only for shr as it needs=
 mesa
  preferred-xorg-versions-X11R7.5-latest: bump liblbxutil and lbxproxy to l=
ate
  xorg: bump viewres, xbiff, xcalc, xeyes, xf86-input-joystick

Michael 'Mickey' Lauer (8):
  xmonobut: fix SRC_URI; old file is no longer available. closes OE #5065
  rcs: new recipe; a revision control system. Closes OE #5050
  vala: 0.7.9 -> 0.7.9.1
  fsotdld: rename from fsolocationd
  tzdata-2009s: fix SRC_URI
  pulseaudio: demote 0.9.21 for armv4t where it doesn't compile
  vala[-native]: 0.7.9.1 -> 0.7.9.2
  task-fso2-compliance: catch up with renaming of projects

Paul Menzel (1):
  vdr: introduce vdr to oe

Sebastian Krzyszkowiak (2):
  navit: add drag_bitmap=3D"1" to navit config This makes dragging much mor=
e res
  shr-autorev.inc: set shr-installer to AUTOREV

Thomas Zimmermann (1):
  midori: 0.2.2 remove retain-navigationbar-in-fullwindow.patch because it'=
s i

Vitus Jensen (1):
  htmldoc: new recipes

 Bugs fixed:

bug_id resolution        short_desc
3545 NOTOURBUG   Garbage on screen (doesnt reboot) a780 ezx3
1368 WONTFIX     kopi and kapi help files not available?
1619 NOTOURBUG   Akita does not function as a USB storage device
2295 FIXED       do_package fails for fortune-mod non-x86 targets
2677 NOTOURBUG   nokia 800 kernel not booting
2879 NOTOURBUG   kernel misses USB host/client switch signalling
3360 FIXED       bbclass to create maemo scratchbox compatible binaries
3723 NOTOURBUG   h3900: Sleeves not supported
3547 NOTOURBUG   h3900: Sound not available
3548 NOTOURBUG   h3900: Battery status not avilable
4352 NOTOURBUG   Ipaq 2215 99% CPU all the time
4353 NOTOURBUG   system info closes on ipaq 2215
4534 WONTFIX     package linux-smdk2440-2.6.20+git: failed
4750 FIXED       fso-image fails with openmoko-terminal2
4847 FIXED       gnome-vfs_2.22.0 should depend on dbus-glib
4894 NOTOURBUG   oops in pxa_ir_configure
5028 FIXED       fso-image fails on do_rootfs install gst-plugin-sid
5034 FIXED       gnutls-2.4.2 needs guile-native
5040 FIXED       base-passwd 3.5.19 no longer downloadable
5050 FIXED       New recipe - The Revision Control System (RCS)
5063 FIXED       new recipe wekit-efl
5065 FIXED       xmonobut-0.4.1
5111 FIXED       opie-image build-depends on fso-gsm0710muxd
5261 WONTFIX     guile-native_1.8.2 fails to build
5286 NOTOURBUG   opkg goes OOM when upgrading navit on Freerunnner
5350 FIXED       python-gst_0.10.17.bb: ERROR: function do_compile failed
5361 FIXED       firefox crashreporter requires curl
5363 FIXED       compilation of uclibc-initial-0.9.30.1 error and
report unrecognized command line option
3560 NOTOURBUG   h5000 fingerprint scanner driver unavailable in OE

Bugs opened:

bug_id resolution        short_desc


