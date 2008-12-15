Received: from [209.85.198.233] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LCGJp-0001Ll-Ti
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Dec 2008 17:29:18 +0100
Received: by rv-out-0506.google.com with SMTP id f9so837921rvb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2008 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=RTU/keAFwRqIBN5eQ3HIgh52PDH3jMW9uFCaIMePK0Q=;
	b=maMyWzNdUnqvH1Wjjp1RGdjm71IOIr6Bxgo8V7pnSWooRC8mdT47SCMhAbHq7Rwm7N
	MVvdaI2Gv08P6ebUFmvRFUnKN7Frcqp155wB+LcJVAbCSseydQoISCgT0pnhq57Etz7M
	RlpeeO9wNvWXAW5B8pqhjoE8Yl7LUbliqJiEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=OPPhZ9Wv2BOO5ANOvRH1veaQz+CqZpiUTAo7IDbxlyHzWJS1Lc7s76Z2KZ3/D1zfn3
	KS2YQIMHhYjjZPA/XK3TZQQLSzq15XyNM1hEO2rM4Uz+hVdh4VzkEm314eTJ52U+k5Gm
	b7dppYN4fgfs7WtO9Dvk6IMM+Axh8YlUGo9hU=
Received: by 10.140.172.21 with SMTP id u21mr3781111rve.177.1229358294363;
	Mon, 15 Dec 2008 08:24:54 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Mon, 15 Dec 2008 08:24:54 -0800 (PST)
Message-ID: <f96d234e0812150824u257cedc2mee03b84056791180@mail.gmail.com>
Date: Mon, 15 Dec 2008 11:24:54 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-12-08 to 2008-12-15
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
X-List-Received-Date: Mon, 15 Dec 2008 16:29:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-12-08 to 2008-12-15

Andrew Straw (1):
      python-traits: new recipe; explicitly typed attributes for Python

Cliff Brake (1):
      mono 1.9.1+2.2.0-rc2: add recipes for new version

Denys Dmytriyenko (1):
      gnome-panel: fix "couldn't find scrollkeeper" error on
Gnome-less host (#4802)

Dmitry Eremin-Solenikov (1):
      tosa: specify screen dimensions

Graeme Gregory (6):
      xf86-input-evdev : new version 2.1.0 for touchscreen fixes/updates
      inputproto_1.5.0.bb : new version required for new libxi
      libxi_1.2.0.bb : new version for improved joystick support
      checksums.ini : new checksums for inputproto, libxi and xf86-input-ev=
dev
      angstrom-2008-preferred-versions : remove inputproto as this in in xo=
rg
      preferred-xorg-versions-X11R7.4-updates : updates

Jeremy Lain=E9 (7):
      u-boot: update patches for boc01 machine
      u-boot: drop obsolete patches for boc01
      linux-2.6.26: add USB HID support for boc01 as module
      qt4: package QtScript plugin for DBus API
      qt-embedded-4.4.3: rename QtUiTools to QtUiToolsE
      qt-embedded-4.4.3: fix previous patch
      qt4: declare PACKAGES_DYNAMIC for Qt's plugins

Khem Raj (12):
      common-glibc: Add va_copy and _va_copy
      common-uclibc: add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
      gcc-package-cross: Creative relative symbolic link to fortran
and only if fortran is available
      angstrom-uclibc.inc: Disable USE_NLS for gcc-cross
      uclibc.inc: Point uClibc-locale-030818.arm.tgz to updated url.
      checksums.ini: Add checksum for matrixssl-1.1.1
      matrixssl_1.1.1: Revert the PV fix.
      eglibc_2.9: Add recipes for eglibc 2.9 release
      angstrom-2008.1.conf: Update uclibc PREFERRED_VERSION to 0.9.30

Koen Kooi (58):
      linux-omap git: add patch to suppress needless timer reprogramming
      tofrodos 1.7.8: add tofrodos to get dos2unix and unix2dos
      angstrom feed builder: add tofrodos
      angstrom: rename ANGSTROM_MODE to ANGSTROMLIBC to make it work
with bitbake env filtering (>1.8.10)
      gcc: rename gfortran patch to avoid FILESPATH confusion with sdk buil=
ds
      rxtx: pass --tag=3DCC to libtool to make libtool 2.x work
      linux-omap git: add patch to fix DPLL reprogramming
      linux-omap 2.6.27: add pvr patch from
http://repository.maemo.org/pool/maemo5.0/free/k/kernel/kernel_2.6.27-20084=
805r03.diff.gz
      linux.inc: mangle defconfig to support thumb when building a
thumb userspace
      angstrom feed builder: add mpd and mpc
      angstrom feed builder: add prelink
      linux-omap git: refresh DSS2 patches against upstream git
      feed browser: sync config
      angstrom feed configs: also package iwmmxt feed when present
      angstrom-feed-configs: fix typo
      sane-srcrevs: ezxboot usb is at rev 2367, not 2376, the latter
doesn't exist at this point
      openbabel: add 2.2.0
      xserver-xorg-conf: simplify beagle config
      checksums.ini: add openbabel checksum
      task-proper-tools: add grep
      linux-omap 2.6.27: make SGX drivers build
      tracker: add xsession file to launch daemon in low-mem mode,
only indexing $HOME
      gdm: start adding infrastructure to make it start on boot and do
something usefull
      firefox: add 3.1b2
      console-kit: add 0.3.0
      gdm: add consolekit support and fix location of xserver
      x11-image: remove dialer, it doesn't work too well
      artoolkit: depend on libxi
      gnome-power-manager: add 2.24.2
      xserver-xorg: split out Xsdl and modules from ${PN} to save more spac=
e
      gdm: needs full blown grep
      xorg-image: same as x11-image, but with big Xorg server, evdev and ts=
lib
      linux omap git: bump PR and fix EVM lcd config
      sourcepkg bbclass: sync with poky and attemp to make it work
with parallel bitbake
      xserver-xorg: also split out afb
      gcc-package-cross: fix assignment of currdir so do_install succeeds
      dsplink: start adding tweaks to build against a post-header move
kernel as well
      linux-omap 2.6.27: enable forced module loading
      ti-lpm-module: add tweak to build against post header move kernel
      ti-cmemk-module: add tweak to build against post header move kernel
      linux-omap git: add default preference
      dsplink and friends: bump PR for latest changes
      beagleboard: move to linux-omap kernel, version 2.6.27
      dsplink: use KBUILD infrastructure
      dbus: remove spurious RRECOMMENDS on dbus-x11
      dsplink-test-image: update dsplink module names
      devicetable minimal: add mmc devices and event0
      kexecboot.inc: update to reflect current device tables
      omap3-pandora: add machine description for omap3 pandora machine
      linux-omap git: add (untested) support for omap3-pandora
      angstrom feed sorter: add omap3-pandora machine
      xserver-kdrive: add 1.5.3
      linux-kexecboot: force initramfs support in Kconfig since it
can't function without
      initramfs-kexecboot-image: set ONLINE_PACKAGE_MANAGEMENT =3D "none"
      linux-kexecboot: add 2.6.23 for c7x0
      linux-kexecboot 2.6.26: doesn't work on c7x0, so remove default-pref
      qt4: alsa package phonon and phonon-backends

Leon Woestenberg (1):
      netperf-2.4.4: Build on eglibc.

M. Dietrich (10):
      pyneod: move from fso to pyneo directory
      pyneog: move from fso/pyneog to pyneo directory
      task-pyneo: remove
      epydial-image: new image recipe for pyneo
      epydial-image: incorporate fso-image changes
      gsm0710muxd: move to pyneo directory
      epydial: new recipe; Phone dialer application based on pyneo
      ncurses: add rxvt-unicode as symlink to rxvt
      ncurses: add rxvt-unicode
      evas: disable svg loader, which doesn't compile atm.

Marcin Juszkiewicz (7):
      ffed-browser: reindented tables
      pcmciautils: set LICENSE to GPLv2
      shasum-native: install is as executable
      checksums.ini: added some Java related entries
      sharp 2.4 kernels: set COMPATIBLE_MACHINE for all of them - close #47=
84
      xserver-kdrive-common: add support for AML M8050
      openzaurus-pxa: this kernel is for sharprom compatibility only -
not for c7x0 - close #4784

Michael 'Mickey' Lauer (12):
      linux-openmoko: enable 01's battery class only for 01, likewise
for 02's battery class
      Python 2.6: here we are. WIP :)
      Python 2.6: here we are. WIP :)
      vala[-native] 0.5.1: update to 0.5.2
      libxml2: catch up with python 2.6; use distutils-base for gather
the proper include dir
      pyrex[-native]: fix running in optimized mode
      python 2.6.1: ship generic module in python-core, get rid of
individual subpackage revision
      ezx-boot-usb-native: 0.3.0
      python 2.6.1: catch up with packaging changes in 2.6.
      linux-openmoko 2.6.24: solve the sysfs battery clash differently
as it lead to nonworking builds
      epydial: fix recipe to be oe-compliant and add proper source rev
      linux-openmoko-devel: forward-port the ledtrig-netdev patch to
2.6.27; update defconfig-oe from andy-tracking

Michael Buesch (1):
      Fix compilation of Openembedded on ppc64

Mike Westerhof (14):
      checksums.ini: add kernel patch-2.6.27.8
      linux-ixpxx: add 2.6.27.8 recipe
      sane-srcrevs: bump srcrev for ixp4xx kernels
      SlugOS: Select 2.6.27.8 kernel for SlugoS 5.1
      SlugOS: lockdown the kernel version in slugos.conf to override ixp4xx=
.conf
      dsmg600-image.bbclass: use correct kernel file when assembling
the bin image
      sane-srcrevs.inc: ixp4xx kernel - bump up to fetch latest 2.6.27 patc=
hes
      SlugOS: turnup - ensure that /sys and /proc are mounted first in linu=
xrc
      SlugOS: leds - fix extraneous error message issued on beeperless syst=
ems
      SlugOS: turnup - comment out some messages printed during normal oper=
ation
      SlugOS: slugos-init - bump PR, and tuck away the reflash tool on
the rootfs
      SlugOS: initscripts - make reboot kexec-aware
      SlugOS: leds - fix the extraneous error message if no beeper correctl=
y.
      SlugOS: slugos-init - bump PR

Paul Eggleton (1):
      angstrom autobuilder: build Opie images in dev branch

Robert Schuster (1):
      classpath-native: Don't compile with -Werror.

Roger Monk (1):
      dsplink: fix user side build

Stanislav Brabec (1):
      geda-xgsch2pcb: New package.

Stefan Schmidt (9):
      checksums.ini: Add vala 0.5.2
      xorg-xserver-common.inc: Add missing \ to fix parsing
      wpa-supplicant: Ship dbus conf and service files. Bump PR.
      sane-srcrevs.inc: Bump linux-eten to get a version with working
audio and fixed
      linux-eten: Add ro to CMDLINE to work around a strange bug that
the SD gets not
      netbase: Add a network config for the eten-m800
      linux-eten: Update defconfig to compile with new srcrev
      pointercal: Ship pointercal file for eten-m800. Bump PR.

Valentin Longchamp (5):
      checksums.ini: checksum for a patches needed by mx31moboard kernel
      linux 2.6.22.6: config for mx31moboard kernel
      mx31moboard: added support into base-files and ipkg-collateral
      mx31moboard: update config
      busybox: added support for 921600 speed of serial line


Bugs fixed:

bug_id resolution        short_desc
4015 DUPLICATE   dsniff-2.3-autobuild
4448 INVALID     Xfbdev not working on htckaiser
4903 FIXED       openmoko-icon-theme-standard2_svn.bb
do_package_write_ipk failes
4906 FIXED       python-etk lacks dependency on eina
4784 FIXED       Spurious notes: missing or unbuildable dependency chain
4802 FIXED       gnome-panel-2.24.0 cannot find scrollkeeper
4916 FIXED       gnome-panel fails to build
4765 FIXED       Better updated support for mx31moboard machine
4411 INVALID     gpe-dm crashes X11
4723 INVALID     No input in X possile
4877 DUPLICATE   xmodmap file of spitz on C3000 is wrong.

Bugs opened:

bug_id resolution        short_desc
4918     x11 default keymap wrong on Zaurus


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


