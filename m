Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NULuq-0003AB-8o
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 16:10:53 +0100
Received: by fxm8 with SMTP id 8so19491558fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=zbjuJ1kv2eXVNumRssJOIOxAKZGFckNCCZ32EubYFE0=;
	b=pZLQCS/NoWbl/qsuvTDXCxwlPrhAhIrageDH1j57ARvKZC7Ri5hkfIou5+QLJZZglo
	W4NLGZoPM6hhF6lfX5vODPeImpPx5xZXlqKIu9pzZs30jCotw5H4yIJsEu4KEoBJgfoS
	bZVON1qKdR3BJMXjKsszWNGx8ynEaRGEqJVnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=F7y9fZRV2zuUBeD20+intWgRXAWs+/ecThvsMG93nrgy/GVntQm1qqEFzkw9HkBQGP
	o/vvsxZ/0rVIRz4v/NkxoD1nqueawhQkIe7j9dQGqe0hSZxfZ7oeK0tlqQB9ZssQ4Qzp
	PgwlxW+ci/e2z9j2+4GodyfWtfHJ7ku4mtkpI=
MIME-Version: 1.0
Received: by 10.216.88.6 with SMTP id z6mr2923725wee.52.1263222518997; Mon, 11 
	Jan 2010 07:08:38 -0800 (PST)
Date: Mon, 11 Jan 2010 10:08:38 -0500
Message-ID: <f96d234e1001110708h7e572b7di1cdb5c768cc80163@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2010-01-04 to 2010-01-11
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
X-List-Received-Date: Mon, 11 Jan 2010 15:11:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2010-01-04 to 2010-01-11

Andrea Adami (5):
  linux-kexecboot_2.6x: fix SRC_URI (origins from linux-kexecboot.inc)
  linux-kexecboot: uniform the SRC_URI (defconfig in kernel recipe)
  linux-kexecboot: updated defconfig for 2.6.32 and 2.6.33-rc3
  zaurus: first reorganization of XSERVER preferences.
  linux-kexecboot_2.6.32+2.6.33-rc3: update defconfigs for akita/spitz

Christian R=C3=BCb (1):
  navit: enable dbus plugin in navit by default

David-John Willis (11):
  libconfig: Add 1.3.2.
  libpng: Remove libpng (target and native) < 1.2.36 as these are blacklist=
ed
  libpng: Add 1.2.41 (target and native) and cleanup recipes.
  libsdl-image: Add 1.2.10 and checksum and cleanup recipe and add INC_PR.
  fuse: Add 2.8.1 and checksum (no module recipe as 2.6 module has been in =
the
  gigolo: Add fuse-utils to RDEPENDS as Gigolo is not a lot of use without =
it.
  libsdl-ttf: Add 2.0.9 and checksums.
  libsdl-mixer: Add libMAD and libTremor support to SDL Mixer 1.2.11.
  libmodplug: Add 0.8.7 and checksum.
  libwnck: Add 2.28.0 and checksum.
  policykit: Add missing /var/run/PolicyKit folder to the do_install.

Denys Dmytriyenko (1):
  ushare: finish fixing for broken hg fetcher in bitbake 1.8.x

Dirk Opfer (5):
  task-sdk-bare: define LIBC_PKGS for for gnuspe toolchain
  busybox: Add new version 1.15.3
  lighttpd: 1.4.23 -> 1.4.25 - Fix SRC_URI
  owfs: 2.7p24 -> _2.7p28
  automake: Add 1.11.1 Lighttpd needs recent automake with AM_SILENT macro.=
 Se

Frans Meulenbroeks (1):
  linux-kirkwood: moved kernel to 2.6.33-rc1 added patches for video and au=
dio

Frederik Sdun (2):
  imagemagick:native: fix build error with space
  libsdl-ttf: Fix path to sdl-config

Graeme Gregory (3):
  transmission_1.76+1.80b4.bb : add new version
  MAINTAINERS : fix my entry to remove openmoko which I never touch these d=
ays

Henning Heinold (3):
  vdr: fix dependency for libintl
  vdr: package /etc stuff too and bumped PR
  vdr: fix libintl problem now the right way

Holger Hans Peter Freyther (8):
  libsdl-native: Create libsdl-native.inc
  oprofile: Move more functionality to oprofile.inc, remove version 0.9.2
  oprofile_0.9.6: Add new version with a fix for timers
  oprofile_0.9.5: Fix opcontrol in timer mode
  glibc_2.9.bb: Apply recent commits to memusage.c as patches
  qt4x11: Cease out the qt4x11 PROVIDER
  qt4: Make the gles variants for Embedded and X11 provide the normal varia=
nt
  qtwebkit-performance-utilities: Add new recipe

Khem Raj (7):
  binutils-2.20: Fix cross native build when using same version on build ma=
chi
  qemumips.conf: Set KERNEL_IMAGETYPE to plain vmlinux.
  gcc-4.4.2.inc: Disable decimal float for uclibc configurations.
  proxy-libintl_20080418.bb: Add -fPIC to CFLAGS for mips.
  mips-linux-uclibc: Add mips linux siteinfo for ucliibc.
  uclibc-nptl: Add machine config parts for mips,x86 qemu.
  gcc-svn.inc: Bump SRCREV now it can build and run qemux86 image

Klaus Kurzmann (7):
  fsodeviced: add a general config file and one for om-gta02 machine
  fsonetworkd: add a config file
  fsousaged: add a general config file and one for om-gta02 machine
  fsodeviced: fix parsing error and disable accel and rfkill in om-gta02 co=
nfi
  fsodatad: add a config file
  fsotdld: add a config file
  fsogsmd: add a config file

Koen Kooi (45):
  mythtv: recommend a gui and menu theme for mythfrontend
  xf86-video-omapfb: tweak patch
  elfutils: add 0.143
  gpsd: move gpsd-conf to RRECOMMENDS since it's machine specific and not r=
eal
  tangogps: add 0.99.2
  angstrom feed builder: rebuild opkg-native at the start of each run
  Revert "libsdl-native: Build with the X11 backend"
  qt 4.6.0: backport a few patches from git, mainly QGL related
  checksums: add new xmonobut location
  gnome-mplayer: add missing DEPENDS on curl
  hawkboard, da850-omapl138-evm: fix SATA
  libdla: add 0.2.3
  ushare: add ushare hg
  libdlna: disable parallel make
  e17: bump SRCREV, enable fixed-point mode in edje according to target fpu=
 se
  checksums: add missing libdlna checksum
  ushare: adjust for broken hg fetcher in bitbake 1.8.x, 1.10.x works fine
  gnome-mplayer svn: add temp hack to get it to link to libmusicbrainz
  eog: add 2.28.2
  angstrom-task-gnome: move xserver around a bit to allow prototyping on ne=
w p
  angstrom feed builder: add eog
  libgphoto2: add hal .fdi files
  libpng: add .inc change needed for .41
  eog: bump PR
  netbook-launcher-efl: add 0.2.0.0 liblauncher: add 0.1.8
  human-icon-theme: add 0.35
  pidgin: update to 2.6.4
  gimp: add 2.6.8
  fltk: add 1.1.10
  xf86-input-tslib 0.0.6: remove patch and bump PR
  xserver-xorg 1.7.3: fix regression where hal was disabled
  linux-omap-zoomsync: add 2.6.32 recipe, fix dss-doc packaging
  libcanberra 0.17: bump PR
  linux-omap-zoomsync 2.6.31: enable cpufreq, cpuidle, powertop options and=
 fi
  omap3 machines: bump MACHINE_KERNEL_PR
  e-wm: package illume-home config in ${PN} for the time being
  u-boot git: update beagleboard uboot for rev C4
  efl: nudge SRCREV up a bit
  ffmpeg: bump SRCREV
  mplayer: bump SRCREV
  navit: fix build with qt4 in staging, only enable floats when you have an=
 fp
  angstrom-feed-builder: add netbook-launcher-efl and sysstat
  linux-kirkwood 2.6.33rc1: fix parsing and make PV adhere to our versionin=
g p

Marco Cavallini (1):
  xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf : added mouse sup=
por

Martin Jansa (46):
  om-gta02: updated UBI params
  linux-openmoko: lower debug level for UBI in defconfigs
  om-gta02: remove ubifs IMAGE_FSTYPES as ubi creates ubifs too
  task-shr-feed: add bonnie++ for ubifs benchmark
  sane-srcrevs-fso: add fsotdld
  remoko: bump revision in sane-srcrevs for bluez4 support
  qi: bump revision for sane-toolchain compatibility
  task-shr-feed: remove fsotimed, because it was removed from OE tree
  sane-srcrevs-fso: bump rev for fsotdld, what I pushed today as HEAD was t=
oo
  qi-ubi: add qi variant with UBI enabled in kernel params
  preferred-shr-version: use newer EFL snapshot from sane-srcrev
  task-shr-feed: add qi and qi-ubi
  linux: move 2.6.33 from rc2 to rc3
  linux-kexecboot: move 2.6.33 from rc2 to rc3
  fsomusicd: RDEPENDS remove some plugins not built by gst-plugins-base
  linux-openmoko-2.6.32: om-gta02/defconfig remove USB_SUSPEND
  libeflvala: move from recipes/freesmartphone to recipes/efl
  task-shr-feed: remove usbmode
  frameworkd: add patch for shr, merge from shr/merge
  libcanberra: add libcanberra-increase-buffer-size.patch from shr/import
  update-alternatives-cworth: use latest installed alternative
  gpe-theme-neo: add recipe from shr/merge
  resolvconf: add version 1.45 from SHR
  packagekit: add version 0.5.2 from SHR
  gpe-theme-neo: kill SRCPV, sorry
  Revert "remoko: bump revision in sane-srcrevs for bluez4 support"
  sane-srcrevs-fso: update to HEAD, remove autorev-fso from fso2-console-im=
age
  vala: bump to 0.7.9.4, needed for latest fsonetworkd
  shr.conf: switch to release DISTRO_TYPE
  gpe-icons: use u-a and postinst merger for gpe-icons only for SHR
  shr-theme: bump srcrev for navitD icon
  linux-openmoko-2.6.32: update to 2.6.32.3
  gpe-icons.inc: readd gpe inherit for shr
  vala: bump 0.7.9.6, fixes libfsoframework build
  shr: temporary disable libsdl-ttf_2.0.9
  fsodeviced: bump revision for fsodevice.accelerometer fix, reenable in co=
nfi
  linux-openmoko-devel: bump revision for NAND speedup
  vala: bump to 0.7.9.7, libfsoframework compiles again (really), fsomusicd=
: u
  navit: bump svnrev, all unset LC_ALL to Exec in .desktop files (gps coord=
s a
  maintainers: add Martin Jansa entry
  libfsoframework: bump srcrev with fixed libnl-2.0.vapi
  Revert "shr: temporary disable libsdl-ttf_2.0.9"
  navit: use --force for fsoraw in SHR launchers (Thanks Zoff)
  classpath-native: disable-gjdoc, it calls antlr and fails without antlr i=
nst
  mplayer: update SRCREV for om-gta02
  navit: use fsoraw params in right order

Michael (1):
  pyrtm: Added Python library for Remember the Time

Michael 'Mickey' Lauer (11):
  libnl2: bump git revision and fix pc file so that it actually links to th=
e s
  fsotimed: is no longer; substituted by fsotdld
  libfsoframework: add dependency on libnl2
  vala: 0.7.9.2 -> 0.7.9.3
  sane-toolchain.inc: bump linux-libc-headers to 2.6.31 to get rfkill.h
  linux: add linux-on-qualcomm-s-msm; new kernel for HTC Qualcomm MSM based=
 de
  dbus-1.3.0: add performance optimization patches from https://bugs.freede=
skt
  connman: use libnl2
  vala: bump to 0.7.9.5 which fixes a regression in type comparison
  linux-on-qualcomm-s-msm: htcraphael: first step sanitizing defconfig for =
GNU
  sysstat: refactor into .inc file, add 9.0.6

Philip Black (1):
  dm365-evm.conf: Call UBOOT_MACHINE davinci_dm365_evm_config on DM365 DVM

Rolf Leggewie (22):
  preferred-xorg-versions-X11R7.4.inc: pin xineramaproto to 1.1.2
  preferred-xorg-versions-X11R7.4.inc: pin kbproto-native to 1.0.3
  preferred-xorg-versions-X11R7.4.inc: pin down bigreqsproto-native and inp=
utp
  preferred-xorg-versions-X11R7.4.inc: pin xf86bigfontproto-native to 1.1.2
  preferred-xorg-versions-X11R7.4.inc: pin down xcmiscproto-native to 1.1.2=
 *
  libtool: remove default_pref -1 from 2.2.6a
  preferred-xorg-versions-X11R7.4.inc: pin down more versions for xorg 7.4
  tracker: s/libgmime/gmime/ in build-time dependencies to fix FTBFS
  preferred-xorg-versions-X11R7.4.inc: pin makedepend-native to 1.0.1
  conf/distro/: move minimal to xorg 7.5
  preferred-xorg-versions-X11R7.5.inc: needs at least 7.1.0 of virtual/libg=
l
  preferred-xorg-versions-X11R7.5.inc: setting P_V does not actually work f=
or
  fso2-console-image: fso-autorev.inc has to be included for this image to =
com
  gtk+: unify
  gtk+: remove DEFAULT_PREFERENCE -1. 2.18.3 is the new default.
  linux: gta03 won't ever see the light of day. remove references to it fro=
m t
  unionfs-modules: move to nonworking.  Closes #1189
  sharprom-compatible.conf: define PREFERRED_VERSION-linux-libc-headers
  sharprom-compatible.conf: fix spelling error, albeit a significant one
  cbrpager: unify
  cbrpager: add version 0.9.20.  Closes #5066.
  checksums.ini: add cbrpager checksum

Sebastian Spaeth (1):
  navit: don't RRECOMMEND 2 text2speech apps in svn, but only RSUGGESTS the=
m.

Stanislav Brabec (15):
  iw: New package: nl80211 based CLI configuration utility for wireless dev=
ice
  mc: Properly pass *_FOR_BUILD variables.
  imagemagick: Add more probably wanted optional libraries to DEPENDS.
  checksums.ini: Added missing iw.
  lzma: Stage lzma binary, initramfs-kexecboot-image depends on it (removed=
 do
  initramfs-kexecboot-image: DEPENDS on lzma-native.
  alsa-lib: Bump PR, r1.5 appeared somehow in angstrom unstable feed and mo=
ves
  xextproto-70-includes: New old package, that provides headers required to=
 co
  xserver-kdrive: Build against xextproto-70-includes: * Ancient xservers a=
re
  xextproto-70-includes: Fixed comments.
  balsa: Update to version 2.4.2.
  gmime: Deleted libgmime-2.4 in favor of gmime. * gmime provides the same =
2.4
  bzip2: Security update to version 1.0.5 (CVE-2008-1372, CERT-FI 20469) an=
d a

Thomas Zimmermann (3):
  connman: move test utils to separate package, shr config do not disable u=
sb0
  vagalume: add index.theme from shr/merge
  netbase: update config files for om-gta*

Tim Abell (2):
  podpooch: new recipe for podcast downloading app for e17
  podpooch: update to 0.2.0.7 to fix qa issues, new download url format

nokia (1):
  libsdl-native: Build with the X11 backend

bug_id resolution	 short_desc
747 LATER	 Familiar Rendered Unbuildable on some hosts
100 FIXED	 rootfs_ipk.bbclass: invalid shell syntax
245 WONTFIX	 Suspend causes usb to quit; Zaurus Poodle 5600
271 WONTFIX	 OpenVPN new *.bb
399 WONTFIX	 frame too large error on prism2 in tosa OZ 2.5.4 12/10/05 snap=
shot
487 FIXED	 Php5 doesn't compile
514 FIXED	 lirc_0.7.1.bb fail to build
517 FIXED	 Touchscreen broken in kernel from repository head on c3000
527 FIXED	 dropbear has a buffer allocation bug in shipping versions.
615 DUPLICATE	 Hrw test images: (3.5.4) sl5600 - suspend/ resume bug
649 FIXED	 OE website DNS fubar
698 WONTFIX	 Internal wireless on SL-6000 breaks after suspend
735 FIXED	 non-SysV host compatability patch
738 INVALID	 QEMU FAILURE WITHOUT BYPASS
816 FIXED	 Checks for kernel size assume too large limit -- installing
resulting images without checking destroys C3000s
824 WONTFIX	 /etc/resolv.conf gets removed upon reboot
870 FIXED	 [patchset] add modular xorg to OE
883 WONTFIX	 no USB host features work
944 FIXED	 eject GUI applet shows mount state incorrectly - can result
in MAJOR FS corruption
948 FIXED	 lftp 3.0.x source no longer available
951 FIXED	 qemu nodocs patch fails on actual CVS
1000 FIXED	 glibc 2.3.2-initial_2.3.2+cvs20040726 bits/* problem
1042 DUPLICATE	 Gpe image doesn't create dirs into /home for root
1197 FIXED	 no space left on device hangs SL-C700
1299 FIXED	 abiword / aspell - no British English spell check function
1302 WONTFIX	 Firefox doesn't start for normal user
1303 FIXED	 gxine doesn't play MP3 or OGG files
1305 WONTFIX	 gxine ogg vorbis playback broke
1307 WONTFIX	 gnumeric won't start when ran as a normal user
1308 WONTFIX	 matchbox mb-applet-cards freezes system
1310 INVALID	 gnumeric Unable to read MS property stream file warning
1314 FIXED	 gpe-conf keys / GPE keys and buttons tool broke
1390 FIXED	 iptables support in 3.5.4.1 (OZ/GPE)
1443 FIXED	 glibc-intermediate_2.4 does not build
1492 INVALID	 bitbake gpe-image ends up with an error
1594 FIXED	 cairo 1.3.2 bitbake recipe
1615 FIXED	 Intergration of the patches of Letux for Acer n30
distribution into the mainstream
1663 FIXED	 optgen application binary named incorrectly
1680 FIXED	 JFFS2 angstrom gpe-image won't boot
1799 FIXED	 keymap_1.0-r11_tosa postinst error
1817 DUPLICATE	 abiword 2.4.5-r0 crash at launch
1842 DUPLICATE	 Glibc locale issue
1882 FIXED	 2.6.20 kernel prevents akita from suspending
1884 WORKSFORME	 udev_100.bb fails on link when extras/volume_id is include=
d.
1898 FIXED	 libts patches for OpenMoko break touchscreen handling
1930 FIXED	 Error message during boot
2061 FIXED	 Fix broken version comparison in ipkg-make-index
2120 FIXED	 Display Corruption in 2.6.20 Kernel on poodle after resume
2198 DUPLICATE	 Wrong screen calibration on poodle
2250 INVALID	 QA check fails with linux-libc-headers-2.6.20 during
angstrom compilation
2533 FIXED	 PalmLD new machine config
2539 FIXED	 Wrong place for patch
2555 FIXED	 patch to make kernel driver for Sharp CE-RH2 working
2686 DUPLICATE	 collie hangs at boot-splash
2891 FIXED	 update udev - current version 118 has serious issues
2918 FIXED	 Support for Technologic Systems TS-72xx SBC
2931 INVALID	 libgcc-related SO link errors after recent changes to gcc.bb
3363 FIXED	 gcc-cross_4.2.x
3484 FIXED	 SD and CF memory cards don't mount on hx4700
3545 NOTOURBUG	 Garbage on screen (doesnt reboot) a780 ezx3
3586 DUPLICATE	 ipaq-sleep causes 100% CPU load
4212 DUPLICATE	 [OPIE] touchscreen is (again) off by 90=C2=B0 for spitz
4266 FIXED	 openssh vulnerability
4451 FIXED	 h2200-bootloader broken causing suspend failures
4766 WORKSFORME	 openssl-0.9.8g-r9: Task failed: Missing field for ipk
generation: 'DISTRO_PR'
5078 FIXED	 [patch] fix move wrong generated rpm name in package_rpm .bbcla=
ss
5289 NOTOURBUG	 Touchpad stuck key on hx4700
314 FIXED	 irda-utils source include path contain system path
319 FIXED	 summary screen is lying about DISTRO
2080 DUPLICATE	 Bitbake trunk (1.9) doesn't remember errors
2133 FIXED	 bitbake 1.8 r816 breaks SRCDATE
2138 FIXED	 base.bbclass can combine two dependencies
3102 FIXED	 unrecognized option `-Qy' to arm-angstrom-linux-gnueabi-as on x=
86_64
3420 FIXED	 ecore - software 16bpp support
3470 FIXED	 bitbake doesn't work when using a x86_64 kernel with a
32bit userspace
4624 FIXED	 opie-mediaplayer1-core-1.2.4-autobuild
124 FIXED	 lzma doesn't build
153 FIXED	 lzma-native_4.17 does not compile
154 FIXED	 squashfs-tools[-native] need lzma[-native]
168 FIXED	 nylon-scripts are not fetchable
1322 FIXED	 gettext fails to compile
1709 DUPLICATE	 podcast binary
1959 FIXED	 update granule to 1.2.4
1987 FIXED	 glibc-2.5 QA issue: non debug package contains .debug directory
2214 FIXED	 create dual-GUI GPE/Opie image
2430 FIXED	 Provide hook so that ttf font dirs are updated.
2808 FIXED	 zten bb file seems to have wrong md5sum
3023 WORKSFORME	 elfutils-0.127-r0 does not build. A warning treated
like a bug stops the process.
244 FIXED	 Setting 'verbose=3Dyes' in /etc/default/rcS causes problem
196 FIXED	 Perl 5.8.7-r9 fails to build for i386
355 FIXED	 Minimo build package incorrect
1666 FIXED	 mplayer 1.0pre8 on collie executable stack error (and patch)
2289 FIXED	 Sandisk ConnectPlus oops
502 FIXED	 PC/CF card config starts with error message
610 FIXED	 hrw test images: GPE-image : Timezone definition on first
login needs directives for user
440 FIXED	 petitepainture 1.5 missing dialogs.patch
316 FIXED	 Support for the Triton XScale board from KaRo
1676 FIXED	 Improved autotools.patch for zlib-1.2.3
34 FIXED	 GFTP 2.0.18rc1 tarball no longer exists
77 FIXED	 _append ignored in h3900.conf
165 FIXED	 new version of gpe-mini-browser
189 FIXED	 tinderbox
310 FIXED	 Updated gaim-mco recipes to fetch patches from cvs
395 FIXED	 Bump octave_2.1.63.bb file name to build later version
402 FIXED	 Remove libeina dependency on libmagic
354 FIXED	 Populate Staging Area with -dev packages
2747 FIXED	 failme-1.0-r0-do_configure
4062 FIXED	 [PATCH] AVR32 gcc 4.2.1 + uClibc 0.9.29 patches
4123 FIXED	 [PATCH] AVR32 support for base-image
1754 DUPLICATE	 efika reboot results in division by zero in an init script
119 FIXED	 qpf-hunkyfonts only contain one rotation
307 FIXED	 Restructure of opie-image and meta-opie recipes.
365 FIXED	 dejavu sans mono garbles screen during scroll in opie-console
369 FIXED	 opie-image missing bluetooth support?
496 FIXED	 hrw test images: OZ+GPE on SL-C1000 and SL-C3100 won't
resume if apm -s started by user
550 FIXED	 Collie - does not mount /media/ram when kernel other then 64/0 u=
sed
611 FIXED	 hrw test images: GPE-image : french locale setting at login
has no effect
653 FIXED	 SD/MMC does not work on first boot on Zaurus 2.4 machines
836 WONTFIX	 Wifi card does not work after upgrade to hostap-modules 0.4.7
910 FIXED	 3.5.4.1-test-rc1 Opie hangs at start on CxK / akita
964 FIXED	 3.5.4 feed totem unusable without a lirc package
1056 FIXED	 No binutils packages in feeds
1080 WONTFIX	 opie-stumbler crashes on SL-5500
1290 FIXED	 qemu-native-0.8.1 fails in staging because of lack of strip bin=
ary
1298 WONTFIX	 [OZ3.5.4.2RC1 tosa opie] Lockup during initial boot
1304 FIXED	 [patch] keymaps: add h2200 keymap
1318 INVALID	 Metabug for OpenZaurus 3.5.5
1400 FIXED	 Can not get 3.5.4.2-rc1 to work on collie
1401 FIXED	 Meta-Bug for hrw test images
1460 WONTFIX	 Socket LP CF WLAN card not working on OZ3.5.4.1 on C860
1667 FIXED	 gpe-mixer-0.42-r0: CROSS COMPILE Badness: /usr/include in
INCLUDEPATH: /usr/include/gpe
1747 FIXED	 wpa_supplicant is not automatically started for wlan0
2045 FIXED	 kernel panic after replacing the internal microdrive
3233 FIXED	 Update Tosa linux kernel patches
254 FIXED	 mythTV 0.18 package instalation fails
678 FIXED	 OPIE need 480x640 background for launcher and first use
1295 FIXED	 [PATCH] Qte: add h2200 support
1551 FIXED	 Clearer instructions for SharpROM target and set
preference for glibc
403 FIXED	 e-utils won't compile
3418 FIXED	 e-wm headers missing
881 FIXED	 [patch] udhcpc-0.9.8-r0 scrpits don't execute
920 DUPLICATE	 coreutils-native_5.1.3 doesn't compile if your dev
machine uses glibc-2.4
1414 FIXED	 Working version of ixp_npe microcode generator
1093 WONTFIX	 altboot metabug
296 FIXED	 quilt doesn't build under osx (and everything depends from there
1 FIXED	 wpa_supplicant 0.3.8-r0 fails on driver_hermes
3 INVALID	 package flex-native-2.5.31-r2: task do_populate_staging: failed
6 FIXED	 xaw do_configure  fails
7 FIXED	 Perl module compilation picking up ${D} in the path
9 FIXED	 sharp-aticore.bb fails to fetch
11 FIXED	 spitz kernel patches don't apply (bk checkout as of 2005/05/18)
12 FIXED	 Kernel (current BK) doesn't compile for spitz
13 FIXED	 bitbake opie-image fails because of konqueror-embedded problems
14 LATER	 uClibc crosscompiler doesn't compile
15 FIXED	 uClibc pulled from obsolete repository
16 FIXED	 autofs fails to build
17 FIXED	 cron fails to build
20 FIXED	 dependancies in ssh packages are shaky
21 FIXED	 edje_cvs SRC_URI is bogus
22 LATER	 konqueror-embedded depends on development version of libqte
23 WONTFIX	 opie-cardmon fails to compile (current checkout)
25 FIXED	 EFL src_uri's should link directly to the files
26 FIXED	 console-tools fails to build if TARGET_OS =3D=3D linux-uclibc
27 FIXED	 hdparm fails to build if TARGET_OS =3D=3D linux-uclibc
28 INVALID	 orinoco-modules (2.4) doesn't compile
29 FIXED	 bitbake opie-image fails on linux-jlime-sh3
30 FIXED	 Wrong kernel built for openzaurus/spitz
33 WORKSFORME	 pcre-4.4-r1 fails due to trying to link with host
library /usr/lib/libc.a
35 FIXED	 libsdl-qpe and libsdl-x11 are compiled with --disable-video-fbcon
36 FIXED	 libsdl-mixer build fails for arm-linux-uclibc
38 DUPLICATE	 gcc 3.4.3+csl-arm-20050416 doesn't compile with EABI support
39 FIXED	 [Patches] for jornada6xx/sh3 specific
41 FIXED	 All schedulers are enabled in the 2.6.XX kernels
42 FIXED	 automount doesn't respect ${CC}
44 FIXED	 openntpd ntpd(8) missing user: _ntp
45 FIXED	 Unzip package fails to unzip files
46 DUPLICATE	 samba: newer version available
48 FIXED	 bitbake gpe-image fails when building
handhelds-sa-2.4.19-rmk6-pxa1-hh39-r5
50 FIXED	 glibc_cvs.bb doesn't compile
51 FIXED	 ipkg fails to find kernel modules in do_rootfs
52 FIXED	 Bin-utils fails to compile. Bison seems to be in an infinite loop=
.
54 WONTFIX	 Flakey on/off suspend/resume behavior on Embedix kernel
(SL5600+SL6000) with OZ3.5.3 and OZ3.5.4-RC
56 WONTFIX	 USB networking chokes on large transfers
58 FIXED	 samba 3.0.14a for mipsel-uclibc
59 FIXED	 libneon: Crossbuild paths left
64 FIXED	 kaffe must DEPEND on libffi
65 FIXED	 kaffe-gtk DEPENDS on xtst
66 FIXED	 Add h1940 support to tslib
67 FIXED	 gcc-cross 4.0.0 configure failure: GMP with MPFR support is
required to build f95
68 WONTFIX	 gcc-cross-3.4.4 fails under uclibc: argz.h not found
69 WORKSFORME	 modutils-cross-2.4.27 gcc4 build failed
70 FIXED	 gcc-cross-kernel-3.3.3 gcc4 build failed
71 WORKSFORME	 ncurses 5.4-r7 fails to patch
73 FIXED	 binutils-cross_2.15.94.0.1.bb gcc4 build failure
74 DUPLICATE	 crash when scrolling through text
75 FIXED	 sablevm-classpath-1.11.3.bb must add xtst to its DEPENDS
76 FIXED	 binutils-cross_csl-arm-20050603.bb missing
79 FIXED	 python-core should depend on libpython
80 INVALID	 Add h1940 backlight support to GPE
81 FIXED	 Fix xserver provider for h1940
82 FIXED	 flite headers/lib not installed in staging
85 FIXED	 ntpdate package missing sys5 startup links and default settings
86 WONTFIX	 new boot medium system / swivel always creates .recovery file
87 FIXED	 cyrus-imapd is packaged incompletely
89 INVALID	 gnome-mime-data doesn't configure - aclocal missing gnome2-macr=
os
90 WONTFIX	 Fix omnievents bb file so shared libs are built
91 FIXED	 Fix typos in xerces-c bb file
92 FIXED	 Add config files to tslib for omap5912osk
93 FIXED	 Add USRP support
94 FIXED	 Add hh40 to available handheld 2.4 kernels to build
95 FIXED	 the latest version of xmame in OE is a little old
99 FIXED	 gcc-cross-3.3.4-r2 fails on com.c: error: conflicting types
for 'ffecom_gfrt_basictype'
101 FIXED	 libgnome2 fails during configure - needs gconftool-2-native?
102 FIXED	 lzma-native 4.17 patches does not apply
104 FIXED	 bb files for ipkg 0.99.151
105 FIXED	 asterisk has unchecked DEPENDS
106 FIXED	 opie-reader: enable flite speech output
107 FIXED	 [PATCH] Caps_Lock not working on C7x0
108 FIXED	 new version of gpe-helpviewer based on gtk-webcore changes build=
 deps
113 FIXED	 Perl 5.8.4 undefined symbol: __eqdf2
114 FIXED	 linux-libc-headers aren't packaged
115 FIXED	 fix libsdl-(qpe|x11) packaging/dependencies
116 WORKSFORME	 procps fails on package step when cross-building
117 FIXED	 mpeg2dec doesn't compile when using libsdl-qpe
118 FIXED	 bitbake file for new gpe-mini-browser application
120 FIXED	 alsa-drivers bb files.
121 FIXED	 Update h1940 tslib.sh
122 INVALID	 Add kernel 2.6.12 for h1940
125 WORKSFORME	 Add kernel 2.4.30 for wrt54g
126 INVALID	 JustReader does not respect all hardware buttons
127 INVALID	 tasklistapplet does not show desktop
128 DUPLICATE	 do_patchcmd should set QUILT_PATCHES
129 FIXED	 linux-hotplug-20040920 assumes /usr/bin/install
130 FIXED	 libpcap_0.8.3.bb: do not assume that include/net exists
134 FIXED	 Gaim Update to 1.3.1 inkl. smaller logo (for collie)
139 FIXED	 oe-commits lacks information
140 FIXED	 zroadmap doesn't link libaticore for c7x0
141 FIXED	 udev seems to be broken in various ways
142 FIXED	 balsa source code is missing
143 FIXED	 installing Firefox does not install all files
144 FIXED	 opiebluez needs an extra include dir to build
145 FIXED	 New bb files for mpc
146 FIXED	 minimo fixed host_ldflags_fix.patch
147 FIXED	 libsdl-mixer fails to do_compile - linker errors
148 FIXED	 Gaim 1.4.0 .bb + patch file
149 FIXED	 ppp doesnt work with latest kernel (2.6.12--mm1-r4)
151 INVALID	 glibc_cvs.bb fails to compile
152 FIXED	 BB file and patch for lineakd
155 FIXED	 GNU parted (partition resizing and creation program) bb file
156 FIXED	 gpsd updated to version 2.28
157 FIXED	 updated sylpheed_2.0.0beta6.bb (gpgme 1.0.3 required)
158 FIXED	 flite 1.2 configure --with-audio=3Doss broken
159 INVALID	 PV_append =3D ${CVSDATE} a good idea?
160 FIXED	 NEW: subversion and subpackages (apr
161 FIXED	 NEW: avetanabt and subpackages (findutils-native)
162 FIXED	 GTK Multitabbed editor .bb file
163 FIXED	 bitbake opie-image fails for openzaurus-3.5.4/spitz
164 FIXED	 gpe-image do_rootfs fails with a bunch of failed libgcc1 depende=
ncies
166 FIXED	 hostap-modules doesnt compile against kernel 2.6.13-rc3-mm1
167 FIXED	 fbvncserver build failed cause of new libvncserver (0.7.1)
169 FIXED	 GPE Terminal app (on spitz
170 FIXED	 GPE image for the spitz (possibly others) is missing lots of pac=
kages
171 FIXED	 better packaging of opie reader
172 FIXED	 ppp-2.4.3-r0 fails when linking libradiusclient.a
173 FIXED	 dbus /etc/init.d/dbus-1 update
174 FIXED	 gcc-cross-kernel-3.4.4
175 FIXED	 mark mipv6 kernel24 specific in ipaq-common.conf
176 FIXED	 tslib configuration for ipaq-pxa270 machines
177 FIXED	 udev compatibility symlinks for /dev/tty*
178 FIXED	 xauth autoconf update 20050726
179 FIXED	 xserver-kdrive segfaults on resume
180 FIXED	 Wifi Card DCF660W stopped working with zImage-collie-48-16-r21.b=
in
181 DUPLICATE	 Linksys WCF12 causes oops in updated collie kernel
182 WORKSFORME	 xmame: wrong byte order
183 FIXED	 ntp-4.1.2 compile failure building for i386
184 FIXED	 bitbake gpe-image fails
185 FIXED	 gpe-irc fails to build
186 WORKSFORME	 openssl fails to build on i586-uclibc
187 FIXED	 error on compiling minimo
188 FIXED	 Build error
190 FIXED	 at76c503a do_install error
191 FIXED	 Changed download url of totem
192 FIXED	 Compilation of kernel fails
193 FIXED	 minimo build hangs on do_fetch()
194 FIXED	 cfu1 cf driver module
195 FIXED	 Problem with GCC 4.0 and pcmcia_cs on x86
197 FIXED	 libgnomeprint build fails due to missing libgnomecups
198 FIXED	 osb-jscore-0.5.0+cvs20050430-r0 does not link due to
undefined pcre references
199 WORKSFORME	 Repeating message while building familiar/h3900: NOTE:
exceptions.SyntaxError:EOL while scanning single-quoted string (line
1) while evaluating
200 FIXED	 gpe-dm spitz support
201 FIXED	 libsdl-mixer fails to do_compile for X11 - linker errors
202 FIXED	 Kernel Module in fbvncserver-kmodule incorectly named
203 FIXED	 package xmodmap files for key rotation on ipaqs
205 FIXED	 vlc-gpe / vorbis library incompatibility
206 FIXED	 spitz kernel (openzaurus-pxa27x) fails to boot
207 FIXED	 Touchscreen in GPE on Spitz is 270 degrees off from the
graphical orientation
208 WONTFIX	 Add a pause to gpe-dm init script to allow for not
starting it (like opie)
210 FIXED	 xev bb file and patch
211 INVALID	 Can't login to GPE after changing virtual keyboard layout
214 INVALID	 failed dependencies kernel-module-usb-storage
kernel-module-irnet kernel-module-usbcore
215 FIXED	 do_patch fails when ~/patches directory exists
216 DUPLICATE	 ipaq-pxa270 modules missing in image
217 FIXED	 handhelds-pxa-2.6_cvs for ipaq-pxa270
218 FIXED	 konqueror-embedded-20030705-r3 fails to do_compile
219 FIXED	 TI Bluetooth script for bluez-utils
220 FIXED	 pivotboot-image dependency failure for h3900
221 FIXED	 E17 libs and programs
222 FIXED	 gnome-mime-data requires perl XML::Parser
223 LATER	 GPE support for iPAQ H1910 and Asus MyPal 716
226 FIXED	 add treecc to OE
228 FIXED	 asterisk is still 1.0.7 which has security issues
229 FIXED	 localedef OOM issue breaks i18n
230 FIXED	 handhelds-pxa-2.6 kernel-module dependencies not working
231 FIXED	 hostap modules 0.3.9 dont work without add_event.patch
232 FIXED	 busybox and module-init-tools disagree about location of lsmod
233 FIXED	 busybox udhcpc fails when af_packet is not loaded
234 DUPLICATE	 udev-065 doesn't work correctly
235 FIXED	 ipaq-pxa270 kernel defconfig and machine configuration
236 FIXED	 e-wm fails to build
237 FIXED	 wrong paths in libvncserver
238 FIXED	 asterisk should install the headers to STAGING_INCDIR
239 FIXED	 mtd-snapshot-20050715 no longer exists
240 LATER	 mISDN bitbake
241 FIXED	 qt-x11-free-3.3.3 fails to build due to uic3moc-native package
242 WORKSFORME	 glibc-2.3.5+cvs20050627-r0 fails to build for MACHINE=3Dnok=
ia770
243 FIXED	 target libgcc1 package depends on non-target packages
246 FIXED	 resolv.conf is erased if not using dhcp
247 FIXED	 newer (1.01) version of busybox is available
248 WORKSFORME	 opie-opbex seems to have a gcc error
249 WORKSFORME	 gtk+ 1 do_configure fails on autoreconf/autoconf
250 FIXED	 gnome-vfs-dbus want build with installed kerberos 5 devel packag=
es
251 FIXED	 libdaemon do_stage() doesn't install dexec.h
252 FIXED	 Build Fails for OpenSSH
253 FIXED	 Build Fails for MySQL
255 FIXED	 build and kernel support fpr Ipaq h6300 series
256 FIXED	 Automatic touschscreen configuration for ipaq h6300
257 FIXED	 linux-hotplug and linux-hotplug-doc conflict
258 LATER	 please add xmms2
259 FIXED	 [Patch] Support for the Intel Xscale based I/O Processor platfor=
ms
260 FIXED	 Teach /etc/sysconfig/pcmcia the 2.6 kernel way
261 FIXED	 Teach /etc/init.d/blueprobe about h2200
262 FIXED	 boa: php via cgi support / init script fix for busy box
263 FIXED	 Add device-mapper version 1.01.04
264 FIXED	 Add lvm2 version 2.01.09
265 FIXED	 Add mdadm version 1.12.0
266 FIXED	 Add h2200 xmodmap to x11-common
267 FIXED	 gtk+-2.8.0 fails to compile
268 FIXED	 zeroconf
269 FIXED	 dbus 0.60
270 WORKSFORME	 gdbm-1.8.3 fails install stage
272 INVALID	 ttf-dejavu fonts SRC_URI outdated
275 FIXED	 gpe-session-scripts_0.65.bb typo
276 FIXED	 gpe-mininet-0.5-r0 build error
277 FIXED	 BlueZ 2.20 is available
278 FIXED	 bitbake task-python-everything fails with missing
python-bluez dependency
279 FIXED	 fetch of Gnosis_Utils-1.1.1 fails
280 DUPLICATE	 fetch of Gnosis_Utils-1.1.1 fails
281 INVALID	 task-python-everything fetches multiple versions of Python and=
 sip
282 DUPLICATE	 task-python-everything fetches multiple versions of
Python and sip
283 FIXED	 libgpevtype-0.12 failed to compile
284 DUPLICATE	 ttf-fonts/dejavu-ttf
285 FIXED	 libmimedir_cvs.bb not including all headers
286 INVALID	 gnome-vfs-2.6.2 does not compile
287 FIXED	 Make pcmcia-cs work better with 2.6 kernels
289 FIXED	 uClibC should be upgraded [0.9.28 out
290 DUPLICATE	 gcc-csl and gcc 4.0.1
291 REMIND	 glibc build breakage on older x86: undefined reference to
`_h_errno' because of thread oddity
292 FIXED	 diet-x11 cvs doesn't find XKeysymDB
293 FIXED	 cairo and freetype2 build problems
294 FIXED	 Gaim_cvs wont build (updated patches)
295 DUPLICATE	 build of opie-image for Jornada/690 fails with no TARGET_OS
297 WORKSFORME	 GPE bluetooth support for hx4700
298 INVALID	 local.conf.sample overlooks jlime using 2.6 kernel
299 FIXED	 DBUS 0.36.2
300 FIXED	 Memory alignment problems with DBUS 0.3x
301 FIXED	 OpenSP fails to build with gcc 3.4.4
302 FIXED	 simpad: allow 2.4 as well as 2.6 kernel
303 FIXED	 ffmpeg wants to install man pages in /usr (patch included)
304 FIXED	 patch: use libetpan CVS (opie-mail relies on that)
305 FIXED	 patch: tslib simpad - support 2.4 and 2.6 kernels
306 FIXED	 patch: upgrade wlan-ng to 0.2.2 (release version)
308 DUPLICATE	 Can't build h3900 image with kernel 2.6
309 FIXED	 Wrong assumption about system pidof
311 FIXED	 permissions not right after login with gpe-login-0.82
313 FIXED	 small changes to sourcepkg.bbclass
317 FIXED	 bluez-utils-nodbus-2.20-r6 acinclude.m4 mix /usr/include
into the build mess up the compile
318 FIXED	 bb for non-GUI version of driftnet (so it doesn't need X11)
320 FIXED	 bb file for a python binding to the sword library
321 FIXED	 PATCH: swig fails to install important files
322 FIXED	 Fn key not working on Zaurus C3000 (spitz) w/ 2.6
323 FIXED	 C3000 (etc?) /dev is unpopulated
324 FIXED	 module-init-tools 3.2-pre9
325 FIXED	 udev 068 for tests
326 FIXED	 conf/machine and conf/distro divergence
327 INVALID	 libqpe-opie-1.2.1 fix-nomax.patch failes to apply
328 INVALID	 opie-packagemanager-1.2.1 ipkg-fix.patch failes to apply
329 INVALID	 libopieobex0-1.2.1 chdir-patch.patch fails to apply
330 FIXED	 LIRC should depend on libX11 and xau
331 FIXED	 sdcontrol failure on getting options from fstab
332 FIXED	 librsvg-2.6.5 build fails due to errors in rsvg.sgml
333 WONTFIX	 upgrade vlc to 0.8.2
336 FIXED	 h2200 no longer needs its own linearizer or conf file
337 FIXED	 Change instances of mbcontrol to matchbox-remote
338 WORKSFORME	 rpm2cpio url has changed
339 INVALID	 missing dependency:  opie-mediaplayer2-skin
340 FIXED	 xserver-kdrive messes up the serial console when probing
for mice on ttyS[01]
341 FIXED	 /etc/init.d/atd stop fails because busybox doesn't
understand --oknodo
342 FIXED	 Next set of EFL core libraries are out. Could you update?
343 FIXED	 Fix for ipaq h6300 kernel config
344 FIXED	 pppd Makefile looks for host /usr/lib/libcrypt.*
345 FIXED	 uicmoc-native-2.3.10-r0 build fails on 64 bit hosts
346 FIXED	 Bootsplash won't build without dependence libmng
347 FIXED	 New version of bl (for GPE) which supports 2.6.x kernels as
well as 2.4.xx iPAQ (and other machines too hopefully)
348 FIXED	 add TARGET_OS setting to jlime.conf (and possibly others?)
349 DUPLICATE	 new bb submission for bitlbee
353 WORKSFORME	 ICE trying to compile mplayer
356 FIXED	 mysql fails to install mysql_config
357 FIXED	 udev initscript fails when util-linux mount is installed
358 WORKSFORME	 libvorbis fails to build
359 DUPLICATE	 pcre fails to build
360 FIXED	 bluez-utils-ndbus fails to find bluez-libs during configure
361 WORKSFORME	 libsoundgen-0.3-r0 fails compiling for oz354fam083
362 INVALID	 built ipks not put into Packages
364 FIXED	 cleaned pcmcia config files
366 FIXED	 ImageMagick package bb file
367 FIXED	 include buzzer in udev.rules
370 WORKSFORME	 building opie-image fails on sqlite3
372 DUPLICATE	 giac 0.5.0 compile fails with mpfr_set_str_raw
373 FIXED	 iPAQ h6300 Blueprobe support patch
376 FIXED	 bluez-utils-nodbus fails during build
377 WONTFIX	 Update aircrack to 2.3 and applying hostap driver patch
379 WONTFIX	 gst-plugins-0.8.7-r3 build fails on cdaudio support
380 FIXED	 /bluez-utils-dbus-2.21-r0 doesn't build with dbus support
381 FIXED	 irda-utils init script attaches to ttyS1
382 FIXED	 handhelds-pxa-2.6_2.6.12-hh3.bb should build
h2200_defconfig for h2200 instead of ipaqpxa_defconfig
383 FIXED	 jlime.conf sets a CVSDATE which breaks CVS fetch of opie-pcmciaa=
pplet
384 FIXED	 build of opie-image for jlime fails compiling binutils gas/app.c=
 file
385 FIXED	 might want to upgrade to linux-libc-headers-2.6.12.0
386 FIXED	 Zaurus and Simpad 2.4.xx kernels fails trying to fetch openswan =
patch
387 FIXED	 python-pygame 1.7.1 .bb file
388 DUPLICATE	 opie-image build for OZ-3.5.4 fails trying to fetch
openswan patch
389 INVALID	 PHP4.3.10 fails with --enable-experimental-zts
390 DUPLICATE	 build opie-image and build opie-kdepim-image fail for
latest OZ 354 snapshot
391 FIXED	 HTC Blueangel machine config and kernel submission
392 FIXED	 missing dependency for task-opie-bluetooth
393 FIXED	 Hardware keys not working on Simpad
394 FIXED	 dbh library is not found by ld linker
396 FIXED	 matchbox-wm_svn fails to fetch sources
397 FIXED	 typo in jlime-shrek.conf
400 FIXED	 dhcp compile error
404 FIXED	 task-xfce-base has non existant dependencies
405 WONTFIX	 mono-native won't compile
406 FIXED	 Missing python modules in python-* packages
407 FIXED	 python download path is broken
408 FIXED	 ecore-x11 won't compile
409 INVALID	 orinoco modules 0.15rc2-r9 doesn't compile.
411 DUPLICATE	 kaffe-qt requires kaffeh-native
412 DUPLICATE	 kaffe-qt compilation error
413 FIXED	 sdl-perl installs to incorrect location
414 FIXED	 Please include new bb files for gpe-mini-browser 0.17
415 INVALID	 fetch of ipkg-utils fails
416 FIXED	 Missing python psyco module
417 FIXED	 suspend/resume script for bluetooth cards
418 WONTFIX	 qpe-gaim has no tabs
419 WONTFIX	 konqueror-embedded javascript is broken
420 INVALID	 Starting day of week only effective for display
421 FIXED	 kernel or opie suspend resume screen doesn't turn on
422 FIXED	 Kernel modules not loaded for Ratoc USB host CF card (on
2.6.x kernel)
423 INVALID	 problems with missing libraries under OZ3.5.4
424 WORKSFORME	 mmc don't work on h3900
425 WORKSFORME	 g_ether is not used on h3900
428 INVALID	 ipkg -force-downgrade option fails
431 INVALID	 package_rpm.bbclass fails in function BUILDSPEC
433 WONTFIX	 wrong feed in the 3.5.4RC ipkg.conf
434 WORKSFORME	 oops with unload of usb_prism modules
437 FIXED	 gaim-desktop-2.0.0.patch doesn't apply against gaim CVS HEAD
441 FIXED	 opie-console font problem due to lack of 'fixed'
443 FIXED	 Problems with pointer on OZ 3.5.4rc With Gpe On Z Poodle
444 FIXED	 no 2.6 kernel in borzai build
445 INVALID	 linux kernel handhelds-sa-2.6 configure loop h3600
446 DUPLICATE	 building gpe-image with 2.6 kernel fails for h3900
447 FIXED	 popt-native fails to build due to missing -lc
448 INVALID	 OpenZaurus 3.5.4-RC - C function atof is not ok
449 FIXED	 Xserver dpi on H3600 H3700 and H3900
450 WONTFIX	 collie: very low speed of writing to jffs2
451 WORKSFORME	 evidence won't build because sourceforge cvs is closed.
453 FIXED	 lirc init script points to non-existant executable
454 DUPLICATE	 pppd fail to compile on x86_64
455 FIXED	 Zaurus 2.4.20 kernels need config updates
457 FIXED	 bitbake of handhelds-pxa-2.6 fails with samcop_base since rev 1.=
63
458 FIXED	 OpenZarus fails to suspend for Zaurus SL-C3000
459 DUPLICATE	 fbvnc not working on OZ 3.5.4RC
460 LATER	 HD Light does not work on SL-C3000
461 FIXED	 bluez-utils depend on libusb
462 FIXED	 Contribution of .bb files from Philips Research
463 FIXED	 Updated .bb for iputils
464 FIXED	 gtk+-2.8.6-r0 doesn't compile (missing no-demos.patch)
465 DUPLICATE	 gpe-shield in 3.5.4RC gpe image although no ip_tables
compiled in akita kernel
466 DUPLICATE	 Fix openssl for sh4 target
467 FIXED	 Fix libnet 1.1.2.1 build
468 WONTFIX	 osso-gnome-vfs2_2.8.4.4-1.bb should depend on samba-3.0.14a
469 FIXED	 Fix gmp 4.1.4 for sh4 target
470 WONTFIX	 package at does not provide atq
471 FIXED	 hdparm-6.1 no longer found on specified SRC_URI
472 INVALID	 gpe-conf depends on ipaq-sleep
473 FIXED	 new bluez-utils and bluez-libs 2.22
474 FIXED	 altboot in oz 3.5.4RC not working on akita SL-C1000
475 FIXED	 New package: tcptraceroute
476 FIXED	 New package: quagga (dynamic routing)
477 FIXED	 small gtk-webcore patch
479 WORKSFORME	 altboot should check SD partition before mounting it
480 WONTFIX	 WEP not disabled when wireless_key not set in
/etc/network/interfaces
481 FIXED	 GPE-mini-browser scrolls page when spacebar pressed in text
entry field
483 FIXED	 Fix net-snmp to correctly determine endianess for all targets
484 INVALID	 Including newt in oe
485 FIXED	 mysql not available
486 FIXED	 Sudo doesn't build due to 1.6.8p8 source no longer being availab=
le
488 WONTFIX	 Aumix is broken against 3.5.4RC image on Collie
489 FIXED	 build of qte-2.3.10-r27 fails for bulding opie-image for tosa
491 FIXED	 netkit-base compilation with gcc4
492 INVALID	 udev update to 071
493 FIXED	 gpe mount /unmount applet
495 FIXED	 OZ/GPE should include some matchbox applet to manage cards
498 FIXED	 build fails: module-init-tools-3.2-pre4.tar.bz2 no longer
mirrored -- use module-init-tools-3.2.1.tar.bz2 instead
499 FIXED	 upgrade to vlc 0.8.4
501 LATER	 Text is not vertically aligned with icons in taskbar's menus
503 INVALID	 Snes9x requires libstdc++6
504 FIXED	 the wget bb should force the issue regarding ipv6
505 FIXED	 add usb drivers to the atmelwlandriver recipes
506 FIXED	 2.6.14-git3 sd card doesnt work.
507 WONTFIX	 [feature request]Adjust brightness with Fn+3/Fn+4 on C7x0
508 INVALID	 Package dropbear seems to be broken
509 FIXED	 Fix the device length in hciattach
510 REMIND	 [OZ 3.5.4-rc] ipkg unable to install local packages
511 FIXED	 [PATCH] tslib: wrong usec in corgi and collie drivers
512 FIXED	 hostap modules install in /lib/modules/2.6 instead of
/lib/modules/2.6.14-rc1 with OZ354rc2
513 FIXED	 zaurus machines overload KERNEL_VERSION
515 FIXED	 add more autoload_modules in the blueangel.conf
516 FIXED	 add blueangel to tslib_cvs.bb
519 FIXED	 atmelwlandriver fails to compile due to missing
add-compaq-usb-ids.patch in org.openembedded.dev
521 FIXED	 psmisc 21.8 doesn't compile due to a newline in signame.h genera=
tion
523 FIXED	 savannah.(non)gnu.org cvs moved to cvs.sv.(non)gnu.org
524 FIXED	 Module dependencies can not be generated in few situations
525 FIXED	 new dropbear released
526 INVALID	 www.oesources.org doesn't contain latest version of gnutls
529 FIXED	 Add 2.6.14-h1940 kernel
530 FIXED	 Update h1940 machine config
532 DUPLICATE	 bitbake any tosa OZ image fails at do_compile of psmisc-21.8=
-r0
533 INVALID	 parse error for opensimpad
534 FIXED	 More xim stubs for diet-x11 needed
535 FIXED	 uicmoc3-native is not 64-bit clean
538 FIXED	 [OZ3.5.4-RC] Top row of keys doesn't work with Fn key
539 FIXED	 Socket CF Bluetooth Rev. G card not recognised
540 FIXED	 patch for blueangel gpe stuff
541 FIXED	 task-bootstrap dependencies broken (virtual/pcmcia-manager)
542 FIXED	 atmelwlandriver fails to build for h3600
545 FIXED	 openswan fails to build due to a whitespace in Makefile.program
546 FIXED	 openswan 2.2.0 is so last year
547 FIXED	 kernel 2.6 on akita in .dev : resume problems after suspend
548 FIXED	 zroadmap 1.0.12 does not build properly
552 WONTFIX	 [OZ3.5.4-RC tosa] Resume fails with CF card inserted
553 WONTFIX	 pppd updates wrong (?) resolv.conf
556 WONTFIX	 New Kernel Module sysrqexec
557 FIXED	 LIRC 0.7.2 with support for NSLU2
558 WONTFIX	 opie-mediaplayer2 glitches when playing mp3 from an sd card
559 FIXED	 add HTC himalaya.conf and make xanadux kernel use the
approbiate MACHINE-defconfig
560 FIXED	 staging step of tslib build fails
561 FIXED	 xstroke.org seems to be down
562 INVALID	 OZ-3.5.4RC: Duff build of 'Orinoco' package - LA-4137
563 DUPLICATE	 Bitbake build of opie or gpe fail with the detail below.
565 FIXED	 bluetooth broken in gpe-image for .dev and .oz354fam083 branches
566 FIXED	 setpwc upstream source forced upgrade
567 WONTFIX	 various blueangel/himalaya related patches
568 FIXED	 libmimedir_cvs.bb needs fixes
569 FIXED	 setserial 2.17 fails to install
570 FIXED	 atk broken due to changed do_stage in glib-2.0
571 FIXED	 build of konqueror-embedded fails due to bad directory name
572 WONTFIX	 Proposal to enable MD5_SUM_CHECK and USLEEP in busybox
573 FIXED	 2.6 kernel for akita in .dev won't boot
574 DUPLICATE	 uicmoc-native-2.3.10-r0 build failure on bitbake opie-image
575 DUPLICATE	 pcre-4.4-r3 fails to link on an opie-image /
familiar-unstable build
577 WONTFIX	 opie-calibrate install doesn't install the binary!
578 WORKSFORME	 coreutils-native is not built although contained in
DEPENDS for gpe packages
579 WORKSFORME	 Suspending on Simpad broken
580 FIXED	 libschedule staging broken
581 FIXED	 mfpr staging failure
583 FIXED	 gpe-contacts CVS PV should be : 0.43
584 FIXED	 Alsa modules cause oops on Akita (2.6.15-r7)
585 FIXED	 fortune-mod needs recode-native
587 FIXED	 wlan-ng-modules 0.2.2 compilation fails against kernel
2.6.14+2.6.15-rc7-r2
588 FIXED	 gconf-dbus fails to compile
589 FIXED	 ppp Makefile contains direct references to /usr/lib /usr/include
590 FIXED	 openswan fails to compile in org.openembedded.oz354fam083 :
blocks gpe-image
591 FIXED	 libtool-native-1.5.10 compilation fails
593 FIXED	 .bb for frozen-bubble appears to not build or include some
files in created package
594 FIXED	 wireless-tools update to 28pre13
595 FIXED	 Update Zaurus kernels to WE-18
596 INVALID	 Failed to boot when headset is plugged in
597 FIXED	 Wellenreiter wireless extensions problem
598 FIXED	 Matchbox-panel icon sizes
599 FIXED	 Hrw test images : Console Font contains extra spaces
600 INVALID	 Misc problems with partitions on the internal HDD
601 WONTFIX	 glibc patch error glibc-2.3.5+cvs20060119-r0
602 WORKSFORME	 fail to patch arm-longlong.patch  with
glibc-2.3.5+cvs20050627-r1
603 FIXED	 hrw test images: collie keymap
604 INVALID	 usb host port is not running on akita (sl c1000) Hrw test imag=
es
605 FIXED	 bluetooth manager is not reporting profiles of devices right on =
akita
606 FIXED	 gconf-dbus fails to compile
607 FIXED	 zroadmap is not running on akita
608 WONTFIX	 hrw test images: resuming from suspend in opie seems not
responsive for a while
609 FIXED	 In .dev : package glibc-2.3.5+cvs20050627-r1: task do_patch: fai=
led
612 WONTFIX	 hrw test images: gpe-contacts + libmimedir may be missing
glibc-gconv for locales
613 WONTFIX	 hrw test images: GPE-image on akita : Minilite crashes :
segmentation fault
614 FIXED	 Update stable branch to latest GPE 2.7 bits
616 WORKSFORME	 Hrw test images: opie mediaplayer is not working
properly on akita
617 WONTFIX	 Hrw test images: no resume of bluetooth cf card after suspend
618 WONTFIX	 Hrw test images: usb memory stick is not working if
connected second time
619 FIXED	 include gpe-conf 0.1.28
621 INVALID	 Opie Media player confused in clamshell mode
622 FIXED	 ttf-sazanami: Sazanami Gothic/Mincho Japanese TrueType fonts
623 FIXED	 anthy: A Japanese input method
624 FIXED	 .bb for SlideRuleZ (RPN Calculator)
625 WONTFIX	 mount issues using Hrw test images
626 WONTFIX	 opieplayer volume cannot be changed without restart of the pro=
gram
627 FIXED	 Hrw test images: gpe-image : system info's distribution :
openembedded ?
628 WONTFIX	 In case of merge in monotone update
630 FIXED	 openswan.org directory structure changed?
631 FIXED	 OZ 3.5.4rc-testing networking problems
632 FIXED	 Add libmimedir fixes to stable branch
634 WONTFIX	 apm 3.2.2-r6 crashes during suspend on 5600
635 FIXED	 xerces-c build broken
636 FIXED	 quilt-native_0.39.bb still references old CVS location
637 WORKSFORME	 Different gcc cross output dependent on host ARCH ia32/amd6=
4
638 WORKSFORME	 hrw test images : typing . in gpe-mini-browser's URL
entry widget doesnt work
639 FIXED	 perl-native and multilib compile problems.
640 INVALID	 device node /dev/console missing from gpe-image.tar.gz
642 FIXED	 orinoco-modules fails in dev with bad value (xscale) for
-mtune=3D switch
643 FIXED	 Building opie-image in dev with 2.4 KERNEL_VERSION build 2.6 ker=
nel
644 FIXED	 RUNSTRIP errors for strip during build process
645 WONTFIX	 Add opie-dict-en to opie-image
646 INVALID	 gnome-vfs-bus-2.8.4.4-r1 fails to compile in dev
647 FIXED	 orbit2-native-2.10.2-r0 configure fails in dev
648 WORKSFORME	 ERROR: function RUNSTRIP failed (apmd)
650 FIXED	 Aircrack 2.41 bitbake file
651 WONTFIX	 hrw test images 5: strange message at kernel startup
652 FIXED	 busybox's udhcpc  gets 99% cpu on EPIA
654 FIXED	 libgpewidget-0.107-r0 fails build with ld: cannot find -lgpewidg=
et
655 FIXED	 portmap 5.9 fails to link when using uclibc
656 FIXED	 psmisc fails to link with uclibc 0.9.26 on i386
657 FIXED	 busybox 1.01 fails on uclibc and i386
658 WONTFIX	 Aircrack rawtx patch for hostap-modules
660 DUPLICATE	 Tosa locks hard
661 FIXED	 busybox: do_install fails on nylon (and may on others)
662 FIXED	 hostap-daemon compile fails at driver_madwifi.c
663 FIXED	 hostap-modules: missing `RPROVIDES'
664 FIXED	 lsof: SRC_URI broken for version 4.75
665 FIXED	 prism2-firmware-update: link broken in SRC_URI
666 WONTFIX	 OZ 3.5.4test2: SD card does not appear in cardmanager.
668 FIXED	 xfce apps fails due to lack of icons
669 FIXED	 libbonoboui contain 'Bonobo Component Browser'
671 FIXED	 module-init-tools-depmod installed in opie-image on collie
672 FIXED	 [bb] expat-2.0.0.bb
674 FIXED	 package.bbclass can't handle duplicates in PACKAGES
675 FIXED	 [bb] libsvg-0.1.4.bb
676 FIXED	 Build failure linux-openzaurus-2.6.15-r5 using gcc4 cross initia=
l
677 DUPLICATE	 bb.build.FuncFailed errors building opie-image for tosa
with oz354fam083
679 FIXED	 bb.build.FuncFailed errors building opie-image for tosa
with oz354fam083
680 FIXED	 RDEPENDing on an auto-munged lib* package causes a build error
681 FIXED	 [bb] osb-jscore-20060212
682 FIXED	 [bb] osb-nrcore-20060212
683 FIXED	 [bb] osb-nrcit-20060212
684 FIXED	 Build failure of foo dependent on gtk-webcore/* using gcc4
cross initial
685 FIXED	 [bb] osb-browser-20060212
687 FIXED	 [patch] sqlite breaks on amd64 build host
688 FIXED	 [bb] sqlite-2.8.17.bb
689 FIXED	 sharp-sdmmc-support.bb needs to be tweaked to allow the fetch to=
 work
690 FIXED	 OE Build for Nokia770 Fails in building the tslib package
691 WONTFIX	 PRFERRED minimo version not available in oz354fam083
692 FIXED	 minimo-0.0cvs20060102-r8 does not build
693 FIXED	 prism3-support interferes with other network interfaces
694 FIXED	 Patch to compile libxine with gcc4
695 WORKSFORME	 hrw test image 5: gpe session won't work on akita
696 NOTOURBUG	 package manager shows sigabrt very often
697 WONTFIX	 compact flash status lost on resume after suspend
699 FIXED	 display on/off on clamshell close/open + autorotation addon
700 FIXED	 eds-dbus doesnt build
701 WONTFIX	 OE build fails for Nokia770 due to bug in bluez-utils-dbus pac=
kage
702 FIXED	 [patch] OZ clamshells & wpa-supplicant-nossl depreciated
703 FIXED	 hrw test5: offlineimap packaging is missing deps and has a path =
bug
704 WONTFIX	 OE Build for Nokia770 Fails in building the libosso package
705 FIXED	 [patch] libmatchbox cleanups
706 FIXED	 [patch] freedesktop anoncvs services changed
707 FIXED	 hostap daemon updates
708 FIXED	 hostap-modules updates
709 WONTFIX	 wpa-supplicant updates
710 FIXED	 ${KERNEL_OBJECT_SUFFIX} not defined in module_strip.bbclass
712 FIXED	 pmacct fails to configure (pcap.h not found)
713 FIXED	 net-snmp build fails with PARALLEL_MAKE set
714 FIXED	 zsh build fails with PARALLEL_MAKE set
715 WORKSFORME	 libnet 1.1.2.1 build fails with PARALLEL_MAKE set
716 FIXED	 Include bb files for wxbase package
717 FIXED	 Include amule package bb files
718 WONTFIX	 oz3.5.4test5/collie: blue gpe background makes program
names unreadable when selected
719 FIXED	 :    Update bb for iproute2 (2.6.8 -> 2.6.15)
720 FIXED	 new packages: fbreader and enca
722 INVALID	 Collie Special-Keys (X11)
723 WONTFIX	 God does not suspend/resume properly
724 FIXED	 I did a quick .bb for sylpheed 2.2.2
725 FIXED	 The latest gnutls doesn't include openssl compatibility function=
s
726 FIXED	 sharp-aticore-oss : Makefile has unresolvable dependencies
and thus does not build
727 FIXED	 diet-x11-6.2.1+cvs20060304-r6 fails patching
728 FIXED	 qemu-native should depend on sdl-native
730 FIXED	 sylpheed 1.9.12 fails to link
731 WONTFIX	 No default file for opd (obex push daemon)
732 WONTFIX	 Add http and https support to subversion
733 FIXED	 Add gcc 4.1.0 support
734 FIXED	 Add binutils 2.16.91.0.6
737 FIXED	 file-native 4.16 fails creating magic files
741 FIXED	 Add glibc 2.4
742 FIXED	 gnome-themes-2.6.2-r0 fails with configure.in:17: error:
possibly undefined macro: AC_PROG_INTLTOOL
743 WORKSFORME	 fontconfig-native doesn't build with freetype-native
744 DUPLICATE	 Billionton Bluetooth card binding
745 LATER	 Busybox 1.2.0 is available and needed for EABI
746 INVALID	 configure error in libtool-native about missing autoreconf
749 FIXED	 rxvt-unicode won't compile witch gcc 4.1
750 FIXED	 [PATCH] fix for bb file rpm2cpio-native_1.2_2.bb - do_stage brok=
en
752 FIXED	 Add binutils 2.16.91.0.7
753 FIXED	 gmp 4.1.4 is missing the native bits
757 FIXED	 SIMpad+GPE: suspend key generates two calls to apm -s and
has auto-repeat on
758 FIXED	 Every reboot resets time to build time or in other cases to 1970
759 FIXED	 3.5.4.1-alpha1 akita : /home/root not created
763 FIXED	 Number lock renders keyboard no functional.
765 INVALID	 wrong includes in conf/machine/simpad.conf
766 WONTFIX	 New iproute2 package - iproute2_2.6.15-060110.bb
767 FIXED	 Varius bug fixes for bash-3.0
769 INVALID	 libpcap-0.9.3-r1 doesn't compile in eabi mode
770 WORKSFORME	 tslib doesn't compile
771 FIXED	 uicmoc-native doesn't compile with gcc 4.1
772 FIXED	 qte 2.3.10 doesn't compile with EABI enabled
773 FIXED	 sudo 1.6.8p12-r4 binary need to have suid bit set
774 FIXED	 New package iperf 2.0.2
775 FIXED	 New package cpusage
776 FIXED	 libqpe-opie fails to compile with EABI support
777 FIXED	 calendar and address book special keys switched
778 FIXED	 diet-x11 lies about X_HAVE_UTF8_STRING
779 FIXED	 hh41 bb needed for a couple of kernel bugs in familiar 0.8.3
780 DUPLICATE	 5600 - Does not save time on reboot
781 FIXED	 3.5.4.1-alpha1 akita/GPE : /dev/rtc missing
782 FIXED	 freetype not in libXfont-X11R7 depends
783 FIXED	 xserver-kdrive fails because of missing Xv.h and Xvproto.h
784 INVALID	 BB file for Contacts
785 INVALID	 BB file for Dates
786 INVALID	 BB file for libspidermonkey (aka libjs
787 FIXED	 BB file for gtkhtml2
788 FIXED	 BB file for Web
789 WONTFIX	 Mileage cannot be resized and is to small for tosa.
790 FIXED	 Enlightenment has changed cvs
791 FIXED	 udev 0.84-r1 startup script uses start-stop-daemon invalid optio=
ns
792 FIXED	 udev rules don't work with /bin/sh : no symlink created for
devices in /dev/bus/usb/...
793 FIXED	 udev won't modprobe modules for USB devices inserted
795 FIXED	 libxml2-2.6.22 sourc url Changed
796 FIXED	 libschedule missing dependency on libgpewidget
797 FIXED	 Borzoi keymap doesn't have @
798 FIXED	 Suggestion: Add MC to GPE image
799 FIXED	 opie-reader display =C5=A1 and =C5=BE as s and z
800 WONTFIX	 gpe-mini-browser  0.19-r0 doesn't follow href tags on the same=
 page
801 FIXED	 GPE : qemu build fails due to uninstalled texi2html on host
802 FIXED	 native xlibs fail on patches
803 FIXED	 [PATCH] udev.inc: should stop the script for runlevels 0 and 6
804 WORKSFORME	 glibc-package.bbclass contains wrong shell expression
805 FIXED	 forced TERM in /etc/profile
806 FIXED	 adding bash to /etc/shells
807 FIXED	 Bootsplash's speed.patch produces errors as /etc is mounted r-o
809 WONTFIX	 Frodo 4.2-r1 package broken under OZ 3.5.4 and collie...
810 DUPLICATE	 Cancel/on/off button on collie hangs machine while it
is ON... (OZ 3.5.4)
811 FIXED	 udev 0.84 won't recognise a USB IDE harddrive as /dev/sd* in .oz=
354x
812 FIXED	 gcc (binutils
813 INVALID	 familiar-unstable bitbake opie-image fails while building
qemu-qop-nogfx-native
815 WONTFIX	 Current handhelds-pxa-2.6-2.6.15-hh0 kernel fails to
compile for h3900
818 WONTFIX	 Creating of images from feeds instead of DEPLOY_DIR_IPK
819 FIXED	 wpa_supplicant can't connect to WPA-PSK AP
820 FIXED	 Typo
821 WONTFIX	 kaffe-gtk won't run any programs
822 WONTFIX	 madwifi package was incomplete
823 FIXED	 hostap-daemon package updates
825 FIXED	 Alignment trap with samba + uclibc-soft
830 FIXED	 orbit2 download fails: incorrect SRC_URI in orbit2-native_2.14.0=
.bb
832 FIXED	 subversion can't be built because of apr outdated URIs.
833 INVALID	 [familiar 0.8.3] Bootup messages on ipaq 5550 sent to wrong po=
rt
834 FIXED	 enca_1.9.bb missing some quotes...
837 FIXED	 m4 upgrade would let automake on handheld actually work.
838 FIXED	 Matchbox session premature end on akita with 3.5.4.1-alpha2+GPE
839 WONTFIX	 GPE Network Config Applet not saving settings
840 FIXED	 Wireless broken after 3.5.4.1 alpha2 update
841 WORKSFORME	 Gadget USB does not work on Zaurus CL-1000 Akita
842 FIXED	 Qt/Embedded Plan
844 WONTFIX	 konqueror-embedded build fix. sort of
845 FIXED	 parallel make breaks nfs-utils
846 FIXED	 wlan-ng-modules/usb-owner.patch malformated patch
847 FIXED	 wlan-ng-utils compilation fails
848 FIXED	 kdepimpi build fix.
850 FIXED	 man does not work because of groff and troff don't
851 FIXED	 gcc 4.0.2 build fails at do_install
852 FIXED	 automake dependencies
853 WONTFIX	 Hostap-module broke. Don't compile any version
857 FIXED	 Fix bugs in offline root handling in ipkg 0.99.154
858 FIXED	 [patch] add classpath 0.90 build and split into
classpath-minimal and classpath-gtk
859 FIXED	 [patch] jamvm requires newer classpath
860 FIXED	 [patch] new jikes build with fixes for floating points on ARM
861 FIXED	 [patch] initial support for gumstix platform with gmustix
distro and gumstix kernel
862 FIXED	 [patch] updated u-boot build with gumstix patches
863 FIXED	 [patch] new grub 0.97 build
864 FIXED	 [patch] updated hotplug-ng build
865 FIXED	 [patched] updated qemu 0.8.0 build
866 FIXED	 [patch] use upstream sysvinit 2.86 instead of patching 2.85
867 WONTFIX	 [patch] build minimal pmount/pumount from updatd pmount 0.9.9
868 FIXED	 [patch] initial support for vmware virtual machines
871 DUPLICATE	 3.5.4.1-alpha2 GPE : installing kernel modules
packages: modprobe not found
872 FIXED	 3.5.4.1-alpha2 : Configuring gst-plugins fails :
gconftool-2 not found
873 WONTFIX	 Beep media player gui is scrambled and unusable
874 WORKSFORME	 /etc/init.d/dbus-1 has incorrect PIDFILE
875 WORKSFORME	 gpe-image permissions on /tmp (/var/tmp) not a+rw
876 FIXED	 BB metadata for monotone-0.25.2
878 DUPLICATE	 ldd fails to run against executables
880 FIXED	 gst-plugins-good-0.10.2 tries to link to host library
882 FIXED	 Seagate Microdrive not recognized by kernel in 3.5.4.1
885 WONTFIX	 sound eventually stops with drain error
886 WONTFIX	 After Resume
887 DUPLICATE	 gpe-calendar alarms are repeated after acknowledged
888 WONTFIX	 gpe-calendar & gpe-announce alarms will repeat /
duplicate until acknowledged
889 WONTFIX	 gpe-calendar alarms aren't saved after reboot
893 WONTFIX	 Matchbox panel doesn't switch to bottom after rotation
896 WONTFIX	 hostap-modules-0.3.9-r9 doesn't build against tosa kernel 2.6.=
16
897 FIXED	 Spelling error
900 FIXED	 New package poptop
901 FIXED	 udev package does not include links.conf
902 FIXED	 New package olsrd 0.4.10
903 INVALID	 Use of chattr +i in libtool-native
904 FIXED	 openttd fails to find sample.cat and package miss some files.
905 WONTFIX	 Europe/London timezone does not exist
907 FIXED	 please add hid2hci to bluez-utils
909 FIXED	 Add glibc 2.3.6
911 INVALID	 recipe for libsdl 1.2.8
912 FIXED	 recipe for uqm 0.5.0
915 FIXED	 gnu-config-native-0.1+cvs20050701-r4 fails to build
[bitbake 1.4 branch
916 FIXED	 Build of gnutls-1.3.5-r1 fails.
917 WORKSFORME	 build fails for libsoundgen if LANG is not english
919 LATER	 atmelwlandriver doesn't compile [distro=3Dangstrom-2006.9
921 FIXED	 uicmoc3-native doesn't compile [distro=3Dangstrom-2006.9
922 WORKSFORME	 konqueror-embedded doesn't compile if unsermake is installe=
d
924 WORKSFORME	 CONFIG_HTC_ASIC2 doesn't compile on 2.6 kernels [h3900]
925 FIXED	 XCB .bb recipes
926 FIXED	 freetype-config adds rpath to ldflags
927 WONTFIX	 Hardware 'OK' button doesn't work in many dialog boxes
928 FIXED	 glibc do_package doesn't diagnose qemu crashes
929 FIXED	 staged quilt scripts contain absolute path to gawk
930 FIXED	 Changes to Jornada6xx.conf (old config was correct
931 DUPLICATE	 Compilation of libXau fails
932 INVALID	 ruby-native does not compile
933 WONTFIX	 gnuz 0.3-r2 can not find icons
934 WONTFIX	 Shutdown on borzoi fails completly
935 FIXED	 Changes to XORG_MIRROR leads to 404 for certain packages [PATCH]
936 DUPLICATE	 libXau fails to build
938 FIXED	 wpa-gui is missing a dependency on uic3
939 FIXED	 libx11 fails to build
941 FIXED	 xserver-common 1.8 at-fix-slcxxxx.patch doesnt apply
942 FIXED	 hostap-conf missing during creation of images
943 FIXED	 libgcrypt 1.2.2 download not available
945 WONTFIX	 bluetooth not running with 3.5.4.1rc2 on akita
946 FIXED	 arpwatch requires fakeroot to build
947 FIXED	 Rsync version update
949 FIXED	 python does not package UserList
950 FIXED	 Missing xmlsave.h in staging install.
953 FIXED	 gpe-aerial fails to build; missing headers
954 FIXED	 fix glibc build for superh archs
955 FIXED	 {SuperH} - Matchbox-Desktop Buildfailed
956 FIXED	 {SuperH} Openssl fails to build.
957 FIXED	 {SuperH} - Libsdl-qpe build failed
958 FIXED	 {SuperH} Jamvm failed build
959 FIXED	 Centericq is broken?
960 FIXED	 {SuperH} - Perl fails to build
961 FIXED	 fix glibc-2.3.5+cvs20050627 build for sh3 and sh4
962 FIXED	 Hebrew keymap for opie-multikey
963 FIXED	 linux-jlime fails in multiple ways...
965 FIXED	 libxcomposite_X11R7.0-0.2.2.2.bb - bad source path
967 FIXED	 standard input: Bad file descriptor after flashing
968 DUPLICATE	 {SuperH} Busbox 1.01-r11 wont build
969 FIXED	 {SuperH} - Changes to jornada6xx.conf
970 FIXED	 {SuperH} Changes for jlime-shrek.conf distro file
971 INVALID	 handhelds-sa-2.4.19-rmk6-pxa1-hh37.4 has wrong
defconfig-h3900 file link....
972 WONTFIX	 hostap .pc/ipaq_compat.patch is wrong!
973 FIXED	 {SuperH} Opie-Logrotate/examples - Segfaults
974 FIXED	 xlibs/libxcomposite wrong SRC_URI
975 INVALID	 {SuperH} - Bluetooth Applet fails build.
976 FIXED	 Samba 3.0.14a-rc12 in 3.5.4 base feed does not work with
Spitz 3.5.4.1rc2
977 FIXED	 {SuperH} Gcc 3.4.3 wont build - missing Jar
978 FIXED	 Fix strace for sh
979 WONTFIX	 at76c503a-modules-0.0+cvs fails compiling...
980 FIXED	 {SuperH} Fix for libxfce4.....
981 FIXED	 Blackbox.bb file
982 FIXED	 libqpe-opie fails to build - (-lqte not found...)
983 WONTFIX	 opie-recorder crashes on SL-5500
984 FIXED	 dpkg (1.13.11) lacks the proper url for download
985 FIXED	 qpPhoto .bb file
986 FIXED	 xqt2 .bb file
987 WONTFIX	 Files not shipped in gcc-3.4.4-r5
988 FIXED	 Icewm in need of some cleanups?
989 FIXED	 Pango missing dependencies in ipk
990 FIXED	 Abiword missing dependencies in ipk
991 FIXED	 xstroke cannot be downloaded
992 FIXED	 wifi-radar .bb file
993 FIXED	 glibc 2.4-r5 fails to build if eabi is DISabled
994 WONTFIX	 gnomesword crashes when starting up.
995 FIXED	 libxss XScrnSaver typo
996 FIXED	 xtscal segfault on GPE/akita
997 WORKSFORME	 ncurses configure fails cc sanity check
998 WONTFIX	 ipkg-link fails on large packets
1001 WONTFIX	 bluez/bluez-utils-dbus_2.25.bb bcm203x problem
1002 FIXED	 New JLime-Donkey distro file
1003 FIXED	 minimo_cvs (20060518) patch failed
1004 FIXED	 display-brightness
1005 FIXED	 zsh links
1006 FIXED	 tmp sticky bit
1007 WONTFIX	 mpd file structure
1008 WONTFIX	 TERM /etc/profile
1009 FIXED	 pcmciautils-013-r3 has Makefile pointing to a wrong /bin/ln
1010 FIXED	 gpesyncd is missing po/POTFILES.in
1011 FIXED	 {SuperH} Scummvm configure patch so that Sh* builds.
1012 FIXED	 Generic x86 build problem
1013 FIXED	 libgpg-error problems when creating the final image
1014 FIXED	 prismstumbler fails with gpsd
1015 DUPLICATE	 pcre does not build on x86_64 platforms
1016 INVALID	 {SuperH} Update to jlime-donkey.conf
1018 FIXED	 FreeNote .bb file
1019 FIXED	 CUPS do_install fails
1021 FIXED	 e and e-wm autotools
1023 DUPLICATE	 gpe-question doesnt install
1024 DUPLICATE	 ipaq-sleep fails installing
1025 WORKSFORME	 install.sh hates combined parameters...
1026 FIXED	 3.5.4.1-RC4 gpe : Mangled shortcut buttons behaviour on akita
1027 INVALID	 USB interface does not come up by default
1028 NOTOURBUG	 Overflowing / crashes machine
1031 FIXED	 wget fails due to searching system paths
1032 FIXED	 New recipe: librsync
1033 FIXED	 New recipe: rdiff-backup
1036 WONTFIX	 3.5.4.1-RC4 gpe : .xsession-errors full of df:
/dev/.static/dev: Permission denied
1037 WONTFIX	 3.5.4.1-RC1 akita+gpe : system info utility will crash X
1038 FIXED	 hdparm_6.3.bb sources are out of date
1039 FIXED	 gpsd build broken
1040 WONTFIX	 OZ3.5.4.1-RC4 akita+gpe : X coordinates mangled
1041 WONTFIX	 OZ3.5.4.1-RC4 akita+gpe : x-terminal-emul produces Alignment =
traps
1043 INVALID	 spitz-rc4-gpe: when you login as user you can't start
software you've installed as root
1044 FIXED	 Drop devfs name tts/0 in h2200.conf
1046 FIXED	 OZ3.5.4.1-RC4 akita+gpe : altboot won't boot without GUI
in option [2]
1047 WONTFIX	 OZ3.5.4.1-RC4 akita+gpe : touchscreen shortcut home icon
behaviour's weird
1048 WONTFIX	 OZ3.5.4.1-RC4 akita+gpe : xcalibrate launch fails when
starting gpe-dm with USB mouse
1049 FIXED	 {SuperH} - pcmcia-cs wont build pcrel too far - Patch Supplied
1050 FIXED	 {SuperH} - lzo-1.08 wont build on Sh3 (and others?)
1051 FIXED	 {SuperH} Parted fails to build due to undeclared items.
1052 FIXED	 Non optimal default keymap
1053 FIXED	 Clearlooks theme crashes abiword
1054 FIXED	 bl-0.1 has a missing dependency: glib-2.0
1055 WONTFIX	 init script bugs
1057 FIXED	 gpe-calendar 0.72 doesnt build
1058 FIXED	 C3000 doesn't detect headphone plug
1060 FIXED	 nested altboot
1061 WONTFIX	 opie-mediaplayer2 will not play ogg/vorbis files on
3.5.4.1 rc4 on cl-3000
1062 WONTFIX	 Audio cuts out when unit is closed or opened on 3.5.4.1 rc4
1063 DUPLICATE	 Volume control applet has no effect on headphone
volume cl-3000/spitz
1064 WONTFIX	 mplayer video output under opie abnormal on spitz/cl-3000
1065 FIXED	 [request for package] pwsafe - password keyring utility
1066 FIXED	 Cross Compile Badness in compiling sdl-perl
1067 FIXED	 {SuperH} - Konqueror-Embedded failing to go through configure
1068 FIXED	 {SuperH} Bootsplash fails to build
1071 WONTFIX	 Kernel Oops running iwconfig after upgrade to 3.5.4
1073 FIXED	 xfce-utils fails do_compile (-I/usr/include/xfce4)
1075 FIXED	 spectrum-fw causes bitbake to bail
1076 FIXED	 kdepimpi fails to build
1077 FIXED	 twisted fetching failure
1078 WONTFIX	 gst-plugins-0.8.7 failed to compile
1079 FIXED	 gnutls-1.4.0 fetching failure
1081 LATER	 sdl-image-1.0 build failed [angstrom-2006.9;tosa]
1082 FIXED	 smpeg fail to build with gcc-4.1.1
1083 FIXED	 wrong cvs path in /gtk-webcore/ osb-jscore_20050430.bb
1084 FIXED	 linux-openzaurus-2.6.16 squashfs EABI build failure
1085 FIXED	 rootfs 100% filled after flashing opie-image
1086 FIXED	 pth-2.0.2 fails to build
1087 FIXED	 minicom-2.1 fail to compile
1088 FIXED	 Problem to build autoconf with ksh as /bin/sh
1089 FIXED	 altboot ought to behave better if there is no bootable
system at the target
1090 WONTFIX	 altboot should e2fsck image files
1091 FIXED	 ipkg list packages twice in certain circumstances
1092 DUPLICATE	 ipkg list packages twice in certain circumstances
1095 FIXED	 misc problems in nunome bb file
1096 FIXED	 nunome seems to be hardcoded for single thread qte
1097 INVALID	 Aircrack-ng 0.5
1098 FIXED	 Hostap modules with rawtx patch applied
1099 FIXED	 lzo build failure -- config.h is not being generated correctly
1100 FIXED	 Kermit symlink
1101 FIXED	 nanorc files
1102 FIXED	 // in feed URL
1104 INVALID	 Mount /tmp as tmpfs
1105 INVALID	 RFE: Timer app
1106 FIXED	 wrong md5 sum in qte_2.3.10.bb
1107 FIXED	 gcc-cross-kernel fails to compile
1109 FIXED	 openssh: error: cannot run test program while cross compiling
1112 FIXED	 bb file for qpf-unismall
1114 FIXED	 new bb files for nunome
1115 WORKSFORME	 libgcrypt_1.2.2.bb fails to compile with MACHINE=3Dnative
1117 FIXED	 new bb file for uim
1118 INVALID	 apmd: familiar-unstable for h3900 fails to build in
org.openembedded.dev
1119 FIXED	 openldap 2.3.11 build problem
1120 FIXED	 Midnight Commander Version 4.6.1
1121 FIXED	 Gaim 2.0 CVS BB Source patch
1125 FIXED	 ffmpeg svn .bb because cvs is retired
1126 WONTFIX	 updated bb file for x11vnc 0.8.1
1127 FIXED	 Auto-mount for SD mounts the device instead of the partition
1128 WONTFIX	 Clicking Root shell on first GPE boot causes GPE to restart
1129 FIXED	 Enca doesnt build on 64-bit systems
1130 FIXED	 Openzaurus does not build due to a number of problems -
fixes included
1131 FIXED	 Opie-Image failes due to missing dependencies
1132 FIXED	 anthy-6801 is missing anthy dictionary
1133 FIXED	 development files and static libs packaged with t1lib
1134 FIXED	 tslib configuration problem on OZ 3.5.4.x
1135 FIXED	 tslib and libqpe-opie unnecessarily have a floating CVS date
1136 FIXED	 zip-native fails to build due to 404 [Patch]
1137 FIXED	 zip-native fails to compile in latest version
1138 FIXED	 emotion fails to build
1139 DUPLICATE	 oe_make fails for openzaurus-2.6.16-r38 for poodle
1141 FIXED	 binutils-cross-2.16.91.0.7 failed
1142 INVALID	 opie-lrelease-native fails to build
1143 INVALID	 ipkg-make-index has problems with tar >=3D 1.15.2
1144 DUPLICATE	 binary locale generation using qemu fails on amd64 host
1146 WONTFIX	 X crash when root terminal invoked right after first login
1147 FIXED	 can't install mplayer on opie
1149 WONTFIX	 spitz locks on shutdown of rtl8150 usb ethernet
1150 FIXED	 opie-embeddedkonsole-help-en depends on opie-help-en
1151 WORKSFORME	 Task-Opie/Opie-Image clears out newer opie-x files?
1152 FIXED	 Moc-2.4.0 failed to build
1153 WONTFIX	 Jornada7xx - toolchain failed -  cannot compute suffix
of object files
1154 FIXED	 xerces-c fails to build on 64bit AMD gcc 3.4.4
1155 FIXED	 dosfstools-native fails to build on 64bit AMD gcc 3.4.4
1158 INVALID	 Open WEP key not assigned correctly
1159 FIXED	 speex does not package headers or install m4 file
1160 FIXED	 libxslt fails to build
1162 WONTFIX	 Wrong locale definition for cyrillic on locale.conf
1164 FIXED	 lack of xmms for GPE
1165 FIXED	 xlibs/libxau-native_0.1.1.bb - patching fails
1166 WONTFIX	 gpe-aerial doesn't work with Socket CF card
1169 FIXED	 compilation of xproto fails with icecc enabled
1170 DUPLICATE	 compilation of xproto fails with either icecc or
parallel compilation
1171 FIXED	 sources for ruby 1.8.2 are gone
1172 INVALID	 building bootstrap-image for SIMpad fails with: Cannot
satisfy the following dependencies
1174 INVALID	 use inheritance for do_stage in pkgconfig.bbclass
1175 WORKSFORME	 gpe-image Build Failed
1176 WONTFIX	 AF_INET6 missing in poodle kernel
1178 FIXED	 librsvg-2.11.1-r0 mozilla plugin depends on host include
1179 FIXED	 linux-uclibc gpe-image arm ep93xx build failed due to
patch failure of uclibc
1180 WONTFIX	 update-modules postinst fails
1181 INVALID	 Bluetooth modules + daemons installed with no bluetooth devic=
e
1182 FIXED	 Kernel modules are not stripped before they are packaged
1183 FIXED	 PREFERRED_VERSION of binutils revert + fixup
1184 FIXED	 build of gtkmm-2.4.8 fails - time for removal?
1185 WONTFIX	 hostap modules broken for WPA on collie image
1186 WONTFIX	 gpe-login quits if screen rotated lanscape -> portrait
1187 INVALID	 qemu doesn't compile
1188 WORKSFORME	 opie-image build breaks during opie-bluepin-1.2.2-r0:
task do_compile
1189 LATER	 'bitbake unionfs-modules' compile fails
1190 REMIND	 Poodle initrd.bin too large
1191 INVALID	 minisip-video trouble
1192 FIXED	 diet-x11 patch fails
1194 FIXED	 metakit fails to build
1195 WORKSFORME	 faad2-2.0-r1 is not gcc4 safe
1196 FIXED	 bitbake snes9x complains about missing -lqte
1200 INVALID	 RFC: hciattach patch to turn BT radio on
1201 FIXED	 drm fails
1202 FIXED	 Applying patch hx2750_test1-r4.patch FAILED
1203 DUPLICATE	 wpa_supplicant fails to start because of wrong filename
1204 DUPLICATE	 wpa_supplicant fails to start because of wrong filename
1205 FIXED	 wpa_supplicant fails to start because of wrong filename
1206 FIXED	 xserver-xorg-X11R7 configure fails because of missing
libdrm.pc in pkgconfig
1207 FIXED	 xserver-xorg-X11R7.1-1.1.0-r0 fails witch CROSS COMPILE Badness
1208 FIXED	 New bbclass - initramfs
1209 LATER	 at76c503a makefile.cc.patch does not apply correctly
1210 FIXED	 typo in asoc patch for 2.6.17 kernel
1211 FIXED	 [Meta bug] Spurious debugging symbols left in packages
1212 FIXED	 tslib ships spurious debug info
1213 FIXED	 a52dec ships spurious debug info
1214 FIXED	 apm ships spurious debug info
1215 FIXED	 binutils ships spurious debug info
1216 FIXED	 db4 ships spurious debug info
1217 FIXED	 esd subpackages ship spurious debug info
1218 FIXED	 fontconfig subpackages ship spurious debug info
1219 FIXED	 gconf-dbus ships spurious debug info
1220 FIXED	 glibc ships spurious debug info
1221 FIXED	 alsa libs contains spurious debug info
1222 FIXED	 curl ships spurious debug info
1223 FIXED	 epat ships spurious debug info
1224 FIXED	 glib-2.0 ships spurious debug info
1225 FIXED	 libgpelaunch ships spurious debug info
1226 FIXED	 libgpewidget ships spurious debug info
1227 FIXED	 libgtkinput shpis spurious debug info
1228 FIXED	 libgtkstylus ships spurious debug info
1229 FIXED	 ipkg ships spurious debug info
1230 FIXED	 wireless-tools ships spurious debug info
1231 FIXED	 jpeg ships spurious debug info
1232 FIXED	 libtool ships spurious debug info
1233 FIXED	 openobex ships spurious debug info
1234 FIXED	 perl ships spurious debug info
1235 FIXED	 libpng ships spurious debug info
1236 FIXED	 librsvg ships spurious debug info
1237 FIXED	 sqlite3 ships spurious debug info
1238 FIXED	 libxml2 ships spurious debug info
1239 FIXED	 libxmuu ships spurious debug info
1240 FIXED	 modutils ships spurious debug info
1241 FIXED	 udev ships spurious debug info
1242 WORKSFORME	 qt-x11-free-3.3.6-r0 fails with on do_package
1243 FIXED	 missing patch for diet-x11
1244 FIXED	 Xtrans.h not in include dir (diet-x11)
1245 FIXED	 libxrender fails to build
1246 FIXED	 linux-openzaurus 2.6.17 doesn't compile due to syntax error.
1248 FIXED	 gtk subpackages depend on debug packages
1250 FIXED	 proposed patch for libxfont
1253 WONTFIX	 2.6.17 kernel on Tosa fails to recognize NAND partitions
1254 FIXED	 mkfontscale-native - missing dependency
1255 FIXED	 dgen-sdl-1.23 fails to build
1256 FIXED	 python-pyxml - version error
1257 FIXED	 local linux headers interfere with apmd build
1259 INVALID	 Poodle test image won't boot.
1260 FIXED	 wlan-ng patching failure when wlan-ng is fetched from svn
1261 FIXED	 esmart-fb patch failure
1262 FIXED	 Bitbake complains about LEAD_SONAME building ncurses-5.4-r8
1263 FIXED	 a fix and an enhancement for bootimg.class
1264 FIXED	 missing dependency for freetype-native (zlib-native)
1265 FIXED	 armv5te gcc-cross sets wrong arch for some packages
1266 FIXED	 Updated h4000.conf
1267 FIXED	 Typo in:  packages/linux/linux-jlime-jornada7xx_2.6.17.bb
1268 FIXED	 Python 2.4.3 build doesnt' package the Subprocess module.
1269 FIXED	 Python 2.4.3 build declares runtime dependency on libz1
1270 FIXED	 qmake2 segfault
1271 FIXED	 Python packages which install scripts do not work properly
1272 WONTFIX	 Never resume after suspend
1274 FIXED	 xserver-xorg-X11R7.1-1.1.0-r0 compile fails
1275 FIXED	 libsoup-2.2.93 doestn build
1276 FIXED	 New package: acct (GNU Accounting Utils)
1277 FIXED	 Revamped Bootchart 0.9 .bb
1283 FIXED	 tslib failes to build for oz354x because of illegal
ZKERNEL_VERSION definition in .bb file
1284 FIXED	 Shopper Application segfaults with OZ 3.5.4.1
1285 WORKSFORME	 Boot image from sd hangs.
1286 FIXED	 tslib-conf for h2200 rdepends on X.
1287 FIXED	 Build ARCH leaking into libtool files for gcc-4.1.1
1289 FIXED	 packages/gnome/libart-lgpl/mipsel/art_config.h
1291 NOTOURBUG	 GPE backlight applet sometimes turns off backlight on spitz
1292 FIXED	 cairo-1.2.2 fails with @libdir@
1293 FIXED	 gpe-task-connectivity not found
1296 WONTFIX	 Touchscreen not working on Collie under 2.6 kernel.
1300 FIXED	 [OZ3.5.4.2RC1 tosa opie] Wrong kernel warning on boot
1301 WONTFIX	 dillo ( dillo2 ) can't open Yahoo mail
1306 WONTFIX	 vlc-gpe crashes when trying to play a file
1309 WONTFIX	 gpdf quits when opening a file
1311 INVALID	 monotone is broken on Ubuntu
1315 DUPLICATE	 usb storage doesn't work under OZ/GPE 3.5.4.1 on spitz
1316 FIXED	 Touchscreen unstable for Tosa OZ 3.5.4.2 RC1
1317 FIXED	 Bash 3.0 build fails for uclibc
1319 FIXED	 mysql SRC_URI link is broken
1320 FIXED	 net-snmp-5.1.2 fails on uclibc x86 and ppc
1321 INVALID	 bitbake bootstrap fails with raise error
1323 WONTFIX	 PHP5 build issues
1324 FIXED	 Cross compile badness in icewm
1326 FIXED	 libpng doesn't build for x86
1327 FIXED	 New machine file for dht-walnut board (PPC)
1328 FIXED	 New machine file for RB5XX board  Routerboard (mips4k)
1329 FIXED	 site file missing for i486-linux-uclibc
1330 FIXED	 site file missing for i586-linux-uclibc
1331 FIXED	 site file missing for powerpc-linux-uclibc
1332 FIXED	 Gettext fails to compile on ppc uclibc
1333 FIXED	 usbutils 0.70 fails on ppc uclibc
1334 FIXED	 libpcap 0.9.3 fails on ppc uclibc
1335 FIXED	 readline 4.3 fails to build on ppc uclibc
1336 FIXED	 libdaemon 0.10 fails on ppc uclibc
1337 FIXED	 iperf 2.0.2 fails on ppc uclibc
1338 FIXED	 Monotone patch to add support for php_5.1.4
1339 FIXED	 GPE Contacts 0.46 need dbus-glib
1340 WORKSFORME	 tslib-1.0: fetch failed
1341 FIXED	 kernel-module-pcnet-cs-2.6 depends on kernel-module-8390-2.6
1342 DUPLICATE	 atmelwlandriver-3.4.1.0-r2 / -3.3.5.6-r0 compile failed
1343 INVALID	 cron postinst fails - update-rc.d not found
1344 WORKSFORME	 prboom_2.4.3 fails to link
1345 FIXED	 opie-mediaplayer1-1.2.2 fails to build
1346 FIXED	 New package libesmtp-1.0.4
1347 FIXED	 New package esmpt-0.5.1
1348 FIXED	 irk-belkin_0.11 fetching failure
1349 NOTOURBUG	 Last line scrolls off console in opie
1350 DUPLICATE	 3.5.4.2-rc1 GPE Poodle suspend hang
1351 FIXED	 Add h4000 support to relevant .bb's
1352 FIXED	 xterm build fails when Xft headers are installed on host
1354 FIXED	 glibc fails to build
1355 FIXED	 Add explicit command separators in populate-volatile.sh
1357 FIXED	 misging dependency for libxine-x11 (libpng)
1358 WONTFIX	 gkdial packages doesn't create required /etc/chatscripts dire=
ctory
1360 FIXED	 Build error in Subversion 1.3.2
1361 FIXED	 Compile error while building cyrus-imapd-2.2.12 with gcc4
1363 FIXED	 konqueror-embedded_20030705 fails in configure stage (no
qte library found)
1364 FIXED	 localegen errors out with LC_ADDRESS: field `lang_ab' must
not be defined
1365 INVALID	 altboot does not find CF card
1366 FIXED	 Python* is missing appropriate PACKAGES_DYNAMIC
1368 WONTFIX	 kopi and kapi help files not available?
1369 WONTFIX	 SD not appearing in /dev OZ-3.5.4.2-rc2
1370 FIXED	 zsafe-2.1.3.bb file
1371 FIXED	 dbus-glib-native-0.71-r0 fails to build
1372 FIXED	 uinput module for 2.6 tosa
1373 FIXED	 gpe-bluetooth-0.54 doesn't build for Angstrom
1374 FIXED	 3.5.4.2 RC1 fails on collie still expecting 2.4 kernel
1375 WONTFIX	 Suspend stops functioning after some time
1376 FIXED	 cairo 1.2.4 + cairo-fixed.patch fails to render
1377 FIXED	 OpenNTPD has incorrect Depends
1378 FIXED	 NFS-Utils does not build with uClibc 0.9.28
1379 FIXED	 imagemagick tries to link with libraries from host /usr
1380 FIXED	 HEAD uClibc build fails on uClibc install
1382 FIXED	 qmake does not exist in oe
1383 FIXED	 [PATCH] packages ztenv and libeb
1384 WONTFIX	 Firefox: package problem
1385 INVALID	 perl-module-encode  and perl-module-encode-alias
dependency problem
1386 FIXED	 scummvm package problem
1387 FIXED	 3.5.4.2RC2 Tosa - system lockup at screen calibration
1388 WONTFIX	 sound problem with the rc2 release on SL-5600
1389 FIXED	 SMPEG stages with broken link
1392 FIXED	 Opie-eye : Do_install fails due to no such file or directory
1393 WONTFIX	 OZ 3.5.4.1/GPE on Akita: A bug in GPE-Contacts app
1394 WONTFIX	 OZ 3.5.4.1/GPE on Akita: 'New/Edit entry' data entry
fields are too small in Contacts app
1395 WONTFIX	 GPE crashes/shuts down at Zaurus suspend
1396 FIXED	 tosa wakes-up from suspend when power is connected
1397 WONTFIX	 3.5.4.2 rc 2
1398 FIXED	 Missing spectrum24 firmware on poodle's 3.5.4.2RC2
1402 WONTFIX	 3.5.4.1 on collie will not bring up the GUI
1403 FIXED	 ts.conf wrong for 2.6 collie (at least in gpe image)
1404 FIXED	 Compilation of libxml-parser-perl-native fails
1407 FIXED	 socat-1.3.2.1 xioinitialize failed
1408 FIXED	 New package to create tor
1409 FIXED	 bitbake dbus-glib fails without PREFERRED_PROVIDER_dbus-glib
1410 INVALID	 Boost DEPENDs on Python and thus on x11
1411 FIXED	 build of libx11 should fail if native build of makekeys fails
1412 FIXED	 libx11: missing flag to make command for native makekeys
1413 FIXED	 package ntp is not created
1415 WONTFIX	 hotkey contact and calendar not working in RC2 on poodle
1416 NOTOURBUG	 Slugos udevsynth does not work during boot
1417 FIXED	 slugos patch to udhcp startup script causes dhcp server ip
starvation
1418 FIXED	 checkroot.sh and /proc/mounts issue
1419 FIXED	 new package to build privoxy
1420 FIXED	 new package to build bacula-fd
1421 FIXED	 Compilation of glibc-2.4 fails for collie (TLS support?)
1422 FIXED	 Sudo (sudo-1.6.8p12) fails oe_runconf (configure)
1424 FIXED	 gdb-cross will not compile for iwmmxt systems.
1425 INVALID	 libfontconfig picks up host's /usr/lib/libz.la (but then fail=
s)
1427 FIXED	 passwd crashes when changing password
1428 FIXED	 gpe-plucker 0.2 forces gcc-3.4.4 cc1 fatal error
1430 FIXED	 bitbake glib-1.2-native fails
1431 INVALID	 Build of ixp4xx-kernel includes non-fatal depmod error
1432 WORKSFORME	 gpe-image fails to find glibc-localedata-i18n
1434 FIXED	 location of pine4.63 sources has been moved and renamed
1436 DUPLICATE	 firefox from oz3451: fn-key + X combinations not working
1437 DUPLICATE	 micro-emacs from 3.5.4.1 feed: backspace not working
1438 FIXED	 Device mapper support in 2.6 kernel missing
1439 FIXED	 perl 5.8.7 fails during configure
1440 FIXED	 multimachine.bbclass ignores TARGET_VENDOR
1441 FIXED	 busybox vs. initscripts date  weirdness
1444 FIXED	 xtscal consumes 100% cpu
1445 WONTFIX	 Poodle screen turns off when starting OPIE in oz 3.5.4.2 rc2
1446 FIXED	 zlib-native-1.2.3.bb does not stage zlib.h
1447 FIXED	 x11-X11R7 fails to build on systems without X headers
(diet-x11 and libx11)
1448 FIXED	 GLIBC_2.4+NPTL missing pthread_kill external declaration
in header file
1449 FIXED	 package gcc-cross-4.1.1-r7: task do_compile: failed
1450 FIXED	 How to make a Angstrom-bootsrap-image for HTC Universal.
1453 FIXED	 htcuniversal: Missing files in the and some other stuff
1454 DUPLICATE	 [SuperH] - Gcc 4.1.1 failed to build
1455 FIXED	 Patches to fix gtk-engines hardcoded GTK+ binary version
1457 FIXED	 Stream redirection in log_check() does not work with /bin/sh
1458 FIXED	 pkg_postinst_ipkg() does not work with /bin/dash
1459 FIXED	 submit of .bb to create FLTK 1.1.7 library
1461 FIXED	 enca fails to compile
1462 FIXED	 sudo 1.6.8p12 failed to configure on Powerpc
1464 FIXED	 New recipe - AGG 2.5  [ antigrain geometry ]
1466 FIXED	 squashfs-tools and squashfs-lzma-tools (cross and native)
1467 FIXED	 lzma bitbake recipe (cross)
1468 FIXED	 bitbake fails on binutils-cross-2.17-r0
1469 FIXED	 package libz-dev is missing header files
1472 FIXED	 busybox conflicts with other packages; more alternatives needed
1473 FIXED	 libc6-dev/linux-libc-headers-dev conflict on scsi headers
1474 WORKSFORME	 opie does not start on c3200
1475 FIXED	 package strace-4.5.14-r3: task do_compile: failed
1476 FIXED	 lzma_4.17.bb missing dependency on zlib
1477 FIXED	 librsvg_2.16.0.bb
1479 FIXED	 Help with bitebaking latest python-dbus
1480 FIXED	 Help to make a gnash recipe
1481 INVALID	 Spitz image file system is not created as gzip
1482 FIXED	 Compilation of glibc-2.5 fails with mawk 1.3
1483 FIXED	 coreutils fails with glibc 2.5
1484 FIXED	 busybox sh is inadequate to run ldd
1485 FIXED	 Fix for python errors in icecc.bbclass.
1486 FIXED	 Recipe for pytgtk2-2.10.0
1487 WONTFIX	 bitbake trunk w/ BB_NUMBER_THREADS=3D3 fails due to
unrespected dependencies on quilt-native
1489 FIXED	 granule: initial release for OE
1490 FIXED	 'fltk-1.2+cvs20040806' directory has been left empty
1491 FIXED	 Soft-/hard-float incompatability with Python
1493 FIXED	 Request for inclusion in MAINTAINERS file
1494 WONTFIX	 gaim crash when login to msn...
1495 FIXED	 icecc.bbclass fails to create a proper tar.bz2 file with
the cross-compiler
1497 INVALID	 Zsafe application doesn't lock upon suspend/resume
1499 WONTFIX	 mapping dot button on SL-6000
1500 FIXED	 no key sequence from bullseye button on SL-6000
1501 FIXED	 no control of backlight on SL-6000
1502 WONTFIX	 add ability to create new tabs in Launcher settings
1504 INVALID	 improve text in Opie PIN buttons
1505 FIXED	 gsoap can not generate gsoap-dev correctly
1506 FIXED	 [PATCH] icewm: Added font recommendation to default .bb file
1507 FIXED	 Add squashfs-lzma support to bitbake.conf
1508 FIXED	 Update NTP source URL
1509 WONTFIX	 Light&Power settings not working correctly on collie
1510 FIXED	 New bb: qtopia/qtopia-core_4.2.0.bb
1512 FIXED	 Mysql won't compile with Glibc2.5 (pthread_kill not declared)
1513 INVALID	 binutils-cross-2.17 DEPENDS on 'makeinfo' being present
1514 INVALID	 OpenEmbedded needs gawk and not mawk
1515 INVALID	 GCC 4.1.1 optimisation bugfix 27363 to makes ALSA work
in the kernel.
1516 FIXED	 Wrong SRC_URI for xstroke
1517 FIXED	 Sourceforge CVS URLs changed -> fetch will fail
1518 FIXED	 Wrong SRC_URI for flex
1523 FIXED	 KF GCC4 Patches
1525 WORKSFORME	 Crosscompiling GCC 4.1.1 fails at end
1526 FIXED	 One updater.sh to rule all PXA Zaurus models
1527 FIXED	 usb networking broken in tosa
1528 FIXED	 gcc-cross fails when using packaged-staging and building
for angstrom
1531 FIXED	 Touchscreen problem updating freedesktop-premodular to the
last xorg-server
1532 FIXED	 package minimo-0.016+cvs20060720-r0: task do_compile: failed
1533 FIXED	 util-linux 2.12r compile error
1534 FIXED	 diet-x11 fails due to wrong target arch
1535 FIXED	 rootfs creation has bashisms but use /bin/sh
1536 FIXED	 New h3600 defconfig for linux-handhelds-2.6
1537 DUPLICATE	 opie-console window too large
1538 FIXED	 allow Opie-PIN to accept input via cursor keys
1539 FIXED	 xserver-kdrive-X11R7.1-1.1.0-r5 fails to build
1540 FIXED	 linux-handhelds kernel upgraded to 2.6-2.6.17-hh2 - change
in bb file needed
1541 FIXED	 Building linux-handhelds-2.6-2.6.17-hh2 for h2200 fails
1542 WORKSFORME	 Opie-rdesktop fails to build due to unset LDFLAGS
1543 FIXED	 Fix python-spyro src_uri
1545 FIXED	 setserial does not compile when using a prebuilt toolchain
1548 INVALID	 Ikada TEST please ignore
1549 FIXED	 rxvt-unicode_7.9.bb wrong URL
1552 FIXED	 Patch for poodle keymap to make the ok key work in opie
1553 FIXED	 Patch to get oss volume working on poodle
1554 FIXED	 work around for Buffalo WLI2-CF-S11
1555 FIXED	 Fix for FLTK v 1.1.7
1556 FIXED	 file-native-4.16 attempts to fetch nonexistent file
1557 FIXED	 libgsm has moved from ftp://ftp.cs.tu-berlin.de/ to
http://www-rn.informatik.uni-bremen.de?
1558 WORKSFORME	 Various packages fail on the strip stage (.la)
1559 DUPLICATE	 bbfile for 'file' and 'file-native' is out of date
1561 FIXED	 devshell broken ?
1562 WONTFIX	 hostap-modules-0.4.7-r4 Makefile: No such file or directory
1563 FIXED	 dbus 0.94 dbus-daemon vs dbus-daemon-1
1564 WORKSFORME	 opie-zkbapplet doesn't build in dev branch
1565 FIXED	 3 new python recipies
1566 FIXED	 Wrong dependencies determined for packages DEPENDing on boost
1567 FIXED	 Dbus fails on waitpid() in /etc/X11/Xsession
1568 INVALID	 nunome fails to build after latest QT changes
1569 FIXED	 Updating kernel packages on LAB bootloader machines fails
due to symlink
1570 DUPLICATE	 ncurses-native-5.4-r8 OE install fails to place
libncurses.so.5 correctly
1571 FIXED	 tslib does not build -> Task failed: Fetch failed: tslib
1572 INVALID	 libpng fails to build for sharprom-compatible
1574 FIXED	 Ipatience package - The Pacitience Game
1575 INVALID	 ACE 5.5 bb file
1577 LATER	 [DEPENDENCIES] Minisip-video depend on ffmpeg in nonexisting ve=
rsion
1578 FIXED	 [DEPENDENCIES] e17genmenu depends on 'e'
1579 FIXED	 [DEPENDENCIES] gnome-power -> hal -> python-pygnome
1580 WONTFIX	 [DEPENDENCIES] ipac-ng depend on libgd-perl which does not ex=
ist
1581 FIXED	 distutils-base.bbclass include .debug files in main package
1582 FIXED	 un-initialised variables in if statement make script error
1583 FIXED	 hostap-fw-load doesn't work with bash
1584 FIXED	 qemu-native doesnt find gcc34 on fedora host system
1587 FIXED	 Add iPaq rx3000 machine
1588 FIXED	 Add asus730 machine
1589 INVALID	 packages/ossie/*_svn.bb are not fetchable
1590 FIXED	 libmutil cannot be fetched
1591 FIXED	 Perl-native does not build on x86_64
1592 WONTFIX	 GDB 6.3 fails to compile with external toolchain - missing LD=
FLAGS
1593 FIXED	 GDB 6.4 fails - CFLAGS has changed since the previous run?
1595 INVALID	 Syncronization port 4243 refuses connection
1597 FIXED	 ipatience game does not work
1599 FIXED	 rxvt is pink and have no shell.
1602 WORKSFORME	 Libsdl-qpe fails on ld
1603 FIXED	 eds-dbus doesn't work with a recent dbus-binding-tool in stagin=
g
1605 FIXED	 sh: gmp 4.2.1 doesn't work on sh
1606 FIXED	 qtopia-core-4.2.0 linker: undefined reference
1607 FIXED	 [OBSOLETE] apr 1.1.1 is 1.5 year old
1608 WONTFIX	 Firefox compilation fails
1609 FIXED	 Fixes for text based bluetooth applications
1610 FIXED	 Unable to build OE.dev tree
1611 FIXED	 bashism in mx31ads-kernel recipe
1612 FIXED	 Improved firefox_1.0.7.bb
1614 FIXED	 valgrind .bb
1617 WONTFIX	 Enable VNC-Server support in QT/E
1618 FIXED	 Add DirectFB-1.0 RC 1
1619 NOTOURBUG	 Akita does not function as a USB storage device
1620 DUPLICATE	 Akita does not function as a USB storage device
1621 WONTFIX	 Akita won't use TCP/IP-over-USB with WinXP
1623 FIXED	 epsilon 0.3.0.007 does not build
1624 FIXED	 libpng fails to build for sharprom-compatible
1625 FIXED	 fetchmail fails to build for sharprom-compatible
1628 FIXED	 libcap fails to build
1629 DUPLICATE	 Loadkeys segfaults on first run
1630 FIXED	 GCC-Cross-4.x fails on x86  when HOST is x86_64
1631 FIXED	 qte fails to build for Sharp ROM
1632 FIXED	 uclibc-initial-0.9.28 fails during install on x86 and
powerpc targets
1633 FIXED	 meta-gpe depends on non-existent diet-x11
1634 WONTFIX	 gnome-desktop is no buildable due to lack of scrollkeeper-con=
fig
1635 FIXED	 New recipe for python-pyiw (libiw bindings)
1636 FIXED	 Update to uim
1637 FIXED	 glibc intermediate fails to build for powerpc due to
missing fpu/bits/mathinline.h in staging
1638 FIXED	 updated to tor version 0.1.1.25
1639 FIXED	 python-pywpa recipe (wpactrl bindings)
1640 FIXED	 irssi_0.8.10 and irssi_svn have incoherent dependency to glib
1641 FIXED	 irssi_svn patch failure
1642 FIXED	 New receipe: bitlbee 1.0.3
1643 FIXED	 wlan-ng-modules & wlang-ng-utils fails to build with
kernel >=3D 2.6.18+git
1644 FIXED	 do_rootfs fails on xserver-kdrive-fbdev needing detect-stylus
1646 DUPLICATE	 glibc should not build all locales
1648 DUPLICATE	 Angstrom fails while rebooting
1650 FIXED	 task-base does not install ohci-hcd module for usbhost mchines
1651 FIXED	 ppp invalid SRC_URI
1653 WORKSFORME	 tin-1.9.1-r0 fails task do_install
1658 WORKSFORME	 Note - Problem with garbled colors under Xfbdev
1659 FIXED	 libcap fails do_configure for Sharp ROM
1660 FIXED	 Enhanced Dillo version with support for i18n
1661 FIXED	 libzvbi 0.2.24
1662 FIXED	 bitbake recipe for lighttpd
1664 FIXED	 libexif 0.6.13 is broken
1668 INVALID	 Dependency on xserver-common
1669 FIXED	 Building mplayer fails
1672 DUPLICATE	 binary locale generation fail on amd64 when compiling glibc
1674 INVALID	 Missing .la file for bz2 library
1675 FIXED	 reiserfsprogs and kernel headers
1677 FIXED	 H2200 and angstrom test images.
1679 FIXED	 Cross Compile Badness - Prismstumbler
1681 FIXED	 Add machine configuration for Palm TX
1682 FIXED	 gnutls suffers from cross-build contamination
1683 FIXED	 add Hack&Dev's 2.6 kernel bb package
1684 FIXED	 Angstrom segfault problems when booting from flash
1685 DUPLICATE	 Sandisk Connect+ causes 2.6.18 kernel to oops
1686 FIXED	 GCC 4.1.1 PR 13685-1 fix - fixes ps crashes on x86
1687 FIXED	 add palm devices' resolutions to kdrive
1689 FIXED	 Calibration xtscal
1690 DUPLICATE	 Calibration xtscal
1691 FIXED	 ALSA improperly configured on Akita
1692 FIXED	 htcuniversal.conf and kernel defconfig update.
1693 FIXED	 Fix architecture list for ixp4xxbe and ixp4xxle machines.
1694 INVALID	 tslib configuration for the palmtx
1695 FIXED	 libusb fails to build for ppc603e
1696 FIXED	 madwifi won't build for ppc603e / efika / powerpc
1697 WORKSFORME	 glibc-intermediate 2.4 fails to build on self-hosted
Angstrom due to rpcgen change
1698 FIXED	 libsamplerate-dev missing
1699 FIXED	 Ruby package lacks Curses support
1700 FIXED	 perl fails compilation for Sharp ROM
1701 FIXED	 Upgrade Angstrom to linux-handhelds-2.6.16-hh8 (and to
common keyboardless buttonmap support)
1702 FIXED	 portmap Makefile has install calls with -s!
1703 WORKSFORME	 do_patch fails on gcc-cross-initial-4.1.1-r9
1704 DUPLICATE	 glibc build fails in do_package while building gpe-image
1705 FIXED	 glibc build fails in do_package while building gpe-image
1706 FIXED	 openprotium build fails in do_rootfs/storcenter_pack_image
1707 FIXED	 vsftpd bitbake build is broken with regard to SSL support
1708 FIXED	 Enabling thumb via -mthumb breaks glibc build
1712 INVALID	 libgcrypt-1.2.3-r0 fails to configure
1713 FIXED	 ipkg-collateral overwrites config file /etc/ipkg.conf
1714 FIXED	 fontconfig-native build failing on amd64
1716 DUPLICATE	 fontconfig-native build failing on amd64
1717 FIXED	 New recipe - softsqueeze_svn.bb
1718 FIXED	 cx0 does not boot
1719 WONTFIX	 RFC: Replace FILES_kernel-image =3D  hacks with rootfs
postprocessing command to remove zImage
1720 FIXED	 dillo2 0.8.6 user agent enhancement
1721 INVALID	 Detect-stylus and some other stuff (HTC Universal )
1723 WONTFIX	 Dropbear keeps regenerating machine rsa key
1724 FIXED	 binconfig.bbclass is broken for multi arch builds
1725 FIXED	 Build many more Ruby extensions
1726 FIXED	 ixp4xxle-feed.conf doesn't point to the right location
1727 FIXED	 ixp4xxle rootfs is too large for most ixp4xxle target devices
1729 FIXED	 ssh-agent dies when opie daemonizes
1730 FIXED	 add AC97 support for EFIKA - experimental
1731 FIXED	 Update of machine HTC Universal
1732 FIXED	 fbvncserver and libvncserver-0.7.1
1733 FIXED	 Update opie for HTC Universal
1734 FIXED	 Angstrom failed to build glibc-2.5 for h3600/ARM
1735 FIXED	 package wrt-imagetools-native-1.0 missing sources (openwrt
has changed from cvs to svn)
1736 FIXED	 omap1710h3 lack kernel configuration
1740 DUPLICATE	 reboot/shutdown do not function on spitz
1742 INVALID	 pcmcia-cs is not included in spitz images
1744 FIXED	 omap2420h4 does not include kernel configuration
1745 WORKSFORME	 IPKG_INSTALL +=3D libc6-dev fails with no provider
1746 INVALID	 altboot causes the clock to be set in the future
1748 INVALID	 libsupc++.la has cross-compile paths in it
1750 FIXED	 bitbake build for package iana-etc (solves a minor ntpdate prob=
lem)
1751 INVALID	 Speed up ipkg-make-index few times
1755 DUPLICATE	 mysql-4.1.18 build fails on gen_lex_hash
1756 FIXED	 glibc binary locale generation fails with Unable to load interp=
reter
1758 WORKSFORME	 libsidplay does not compile for powerpc (MACHINE=3Defika)
1759 WONTFIX	 altboot mounts vfat SD as ext2
1760 FIXED	 te_IN locale broken in glibc-2.3.5
1761 WONTFIX	 Upgrading altboot from 1.0.5 to 1.0.7 removes altboot-conf fi=
le
1762 FIXED	 slugos-packages unparsed line
1766 FIXED	 a1200 lack kernel defconfig
1767 FIXED	 mysql-4.1.18 build fails on gen_lex_hash
1768 FIXED	 sqlite3 build error: fetch
http://www.sqlite.org/sqlite-3.2.5.tar.gz not found.
1769 FIXED	 libstdc++ .la files might be broken wrt dependency_libs line
1770 DUPLICATE	 GTK apps need Native gdk-pixbuf-csource
1772 FIXED	 libsdl-native compile dies on SDL_cpuinfo.c
1773 WORKSFORME	 libsdl-ttf-native build fails on compile
1774 FIXED	 CFLAGS +=3D -lz breaks build of libglade for x86_64
1775 FIXED	 libflac won't build for ppc603/efika
1778 DUPLICATE	 build opie-image for mips failed
1779 FIXED	 build opie-image for mips failed
1782 FIXED	 Flaws in mysql package ipk (fix-perl.patch attached)
1783 WONTFIX	 Backports Meta-Bug
1784 NOTOURBUG	 Abiword exits when italic text formatting is selected.
1786 FIXED	 eds-dbus needs native intltoolize
1787 DUPLICATE	 libsdl-ttf-native build fails on SDL_cpuinfo.lo
1788 DUPLICATE	 Latest ldd depends on bash
1789 INVALID	 libxml2-native fails do_compile
1792 FIXED	 mpc fails early in the configure stage due to CROSS
COMPILE Badness: /usr/include
1795 WORKSFORME	 libxine fails with cross-compile badness
1796 WONTFIX	 Unabe to install timezone information because of a
missing dependency.
1797 FIXED	 mpd crashes on mod files
1798 FIXED	 ruby 1.8.5 will not build without bb changes
1800 DUPLICATE	 hostap.conf deleted on ipkg upgrade / cardmgr unsupported c=
ard
1801 WONTFIX	 contrast problem on SL-C700
1802 FIXED	 OZ-Unstable: kobject_add failed for ttyS3 with -EEXIST
1803 WORKSFORME	 xfce-mcs pugins fails to build
1804 FIXED	 during compilation of libxslt-1.1.17
1806 FIXED	 New Recipie for qpegps 0.9.3 + gpsd updates
1807 FIXED	 license for tin is BSD
1808 DUPLICATE	 Request for keyboard features and improvement
1809 DUPLICATE	 GDE under poodle won't suspend right
1810 WONTFIX	 Network application bug and enhancement request
1811 FIXED	 Palm Zire 72 support
1812 FIXED	 rx3000 machine cleanup + kernel config
1813 FIXED	 rx3000 support in opie
1814 LATER	 rx3000 support in irda-utils
1815 FIXED	 glibc  build fails on locale generation
1816 INVALID	 gpe-conf-0.2.3 missing dependency on esound-gpe
1818 FIXED	 Zire 72 fixes - fixed defconfig and machine conf
1819 FIXED	 linux-hackndev-2.6_svn.bb deploy task added
1820 FIXED	 Missing patches for Zire72 support
1821 FIXED	 Binary locale generation uses the files in /usr/share/i18n/loca=
les/
1822 WONTFIX	 Lack of joystick support for 3.5.4 releases on SL6000/tosa
1825 FIXED	 install-native missing inherit native
1826 FIXED	 CROSS COMPILE Badness in gnokii
1827 FIXED	 remove 'inherit native' from mkfontscale
1829 FIXED	 imlib2-loaders and imlib2-filters .debug packages not
moved into -dbg package
1830 FIXED	 Make a more granular xserver-kdrive
1831 FIXED	 gpe-dm hangs during shutdown
1833 INVALID	 Tcl for arm-linux will not build using osx tools
1834 FIXED	 libol and syslog-ng broken
1835 FIXED	 Vorbis-tools patch for libcurl version 7.16.0 and greater
1836 FIXED	 zaurus-clamshell.conf typos: sumtool uses --eraseblocks
but not mkfs.jffs2 + a missing ;
1837 FIXED	 Updated libxml2-native to 2.6.26
1838 FIXED	 grub build includes un-needed info and man pages
1839 FIXED	 recipie for libxslt-native
1840 FIXED	 gdb-cross fails patch
1843 FIXED	 New .bb file for espgs - Version update and some fixes.
1844 WONTFIX	 libmutil0_svn.bb setup misses libltdl creation
1845 FIXED	 Compilation of gtk+ fails
1846 FIXED	 Palm Zire 72 support update - defconfig
1849 FIXED	 base-files-3.0.14-r58 in dev branch doesn't build
1850 DUPLICATE	 php 4.3 broken SRC
1851 FIXED	 gconf versions inconsistant
1852 DUPLICATE	 Bison contains path to buildsystem
1853 FIXED	 new package: Mono (v. 1.2.2.1)
1855 FIXED	 Cron install error do to -s (stip) symbol in Makefile
1856 DUPLICATE	 RFE/RFC: strip -native from ${S}
1857 FIXED	 Add FusionSound (DirectFB Sound Layer)
1858 FIXED	 Add LiTE (DirectFB Lightweight Toolkit Enabler)
1859 FIXED	 rxvt-unicode-7.9 fails to build on efika
1860 WORKSFORME	 package libxp-X11R7.0-1.0.0  fail on do_stage
1862 FIXED	 firefox-2.0 build fails for Angstrom on hx4700
1865 INVALID	 Remove inheritance from gconf to build gstreamer plugins
1866 DUPLICATE	 mysql fails do_compile
1867 FIXED	 New start with SIMpad 2.6 Kernel based on Vanilla 2.6.20.
The old hh.org one is broken because of changes to the mpc driver
stuff
1870 FIXED	 terminus-fonts fails to download in dev branch
1873 FIXED	 SIMpad switches driver killes the irq of the ucb1x00
touchscreen driver (patch inside)
1874 FIXED	 SIMpad - /dev/console
1877 FIXED	 linux-rp-2.6.20 will not build for collie (do_patch fails)
1879 FIXED	 libxml-parser-perl build failing
1881 FIXED	 Gnome-vfs suffers from configure insanity
1883 FIXED	 /dev/random /dev/urandom wont be created
1886 FIXED	 Add libsdl-directfb
1887 FIXED	 Add FCEU
1888 FIXED	 Dell Axim x50 Angstrom Stuff
1889 FIXED	 Thread-support in perl-native may break libintl-perl
1891 FIXED	 Single channel audio on akita
1892 FIXED	 Bitbake decides to not package stuff
1893 FIXED	 enable C14N in libxml2 modify to allow php_5.2 to build
1894 FIXED	 New Package: ntpclient
1895 FIXED	 New Package: logrotate - binary implementation
1896 FIXED	 Add php_4.4.4 and php 5.2.0
1897 FIXED	 ffmpeg fails do_compile
1899 DUPLICATE	 3.5.4.2-rc2
1900 INVALID	 unable to build binutils-cross for ARM architecture from scra=
tch
1901 DUPLICATE	 os.path.join vs. glibc locales
1902 FIXED	 do_configure fails for collie 2.4 kernel
1903 FIXED	 [PATCH] Packaging for pkg-config 0.21
1904 FIXED	 glibc-intermediate build failure (icecc compile farm)
1905 INVALID	 python_2.4.4.bb requires tk & diet-X11 which doesn't
make sense for SlugOS
1906 FIXED	 freetype-2.3.0 fails do_configure
1907 INVALID	 Toshiba e740 kernel recipe
1908 WONTFIX	 GPE: Impossible to enter international characters such
as =C3=A4 =C3=A1 =C3=A0 =C3=B1 =C3=9F
1909 FIXED	 angstrom-gpe-image build fails for Angstrom on hx4700
1910 INVALID	 /org.openembedded.dev/packages/gtk-engines/gtk-engines_2.7.4.=
bb
1911 FIXED	 dillo_0.8.6-r1 build fails for Angstrom hx4700 on do_package st=
age
1912 FIXED	 Linux-input won't compile due to snes232.patch not being up to =
date.
1913 REMIND	 Bluez suffers from configuration bug
1914 FIXED	 qt4-x11-free upgrade
1916 WORKSFORME	 opie-qcop fails to build
1918 FIXED	 Add soft-float support for powerpc targets without fpu
1921 FIXED	 libmimedir fails to fetch since gnome has migrated to svn
1922 FIXED	 Updating MAINTAINERS file
1923 FIXED	 Reorder the dependencies of gtkmm and glibmm libraries
1924 FIXED	 enca fails for qemux86
1925 INVALID	 Remove cairo/libsvg
1926 FIXED	 Problem to render SVG files with gtk+/gtkmm
1927 FIXED	 Add (super)sparc target to OpenSSL
1928 WORKSFORME	 libx11 fails with crosscompile badness
1929 FIXED	 lirc fails to build
1931 FIXED	 /proc/net/wireless not found during boot
1932 FIXED	 Aircrack-ng 0.7
1933 FIXED	 kismet 2007-01-R1b
1934 FIXED	 mdk2 v33
1935 INVALID	 Void11
1936 FIXED	 Raw FakeAP
1937 FIXED	 aircrack build fails due to missing source
1938 WORKSFORME	 No buildable SDK cross compiler available
1939 FIXED	 Void11
1940 FIXED	 libx11 and diet-libx11 build fails with floating point
exception on amd64
1942 FIXED	 file-native-4.20 doesn't build on debian sarge i386
1943 INVALID	 procps-3.2.7 fails to download file
1945 DUPLICATE	 update meta-toolchain to work with new ipk directory struct=
ure
1947 FIXED	 Bootsplash-native cannot find jpeg
1948 DUPLICATE	 Conflict between zaurusd and X on spitz.
1949 WONTFIX	 xorg7.1-1.0.1 building failed.
1950 FIXED	 Improved simpad.conf from woglinde
1951 FIXED	 gcc fails to build on x86_64
1952 FIXED	 added lirc-modules_0.8.1+cvs20070307 for use with 2.6.20 kernel=
s
1953 WORKSFORME	 building glibc-initial-2.5 fails on x86_64 for i586 target
1954 FIXED	 xfsprogs fails to build for powerpc on x86_64 host
1955 FIXED	 quilt does not get built properly with bb1.8 multithreading
1956 FIXED	 Cannot find package ipkg-collateral
1957 DUPLICATE	 Tosa continually switches on and dries up battery
1958 FIXED	 SpanDSP library for fax and voice VOIP services
1960 FIXED	 New recipe for quilt-0.46
1961 FIXED	 fix for ziq not creating installation dir
1962 FIXED	 hexatrolic bb file wont create intallation dir - fix
1963 FIXED	 zsubhunt bb file wont create intallation dir - fix
1964 FIXED	 New mrxvt-0.5.2 recipe
1965 FIXED	 labyrinth bb file wont create intallation dir - fix
1966 FIXED	 Allow to limit list of binary-generated GLIBC locales
1967 FIXED	 Raw GlueAP
1968 INVALID	 bitbake gcc-cross fails in empty buildroot
1969 WONTFIX	 busybox ifup does not pass parameters properly?
1971 INVALID	 SIMpad mq200 driver Bugfix - thx to mrdata (Heiko Dademasch)
1972 FIXED	 Picocom wont compile - FIX
1973 FIXED	 Add Palm Tungsten|T3 into OE
1974 FIXED	 Add Palm Tungsten|T3 support into linux-hackndev-2.6_svn.bb
1975 FIXED	 make snes9x-sdl-qpe use qte-mt
1976 WORKSFORME	 dbus postinst breaks opie-image
1978 FIXED	 opie-dagger wont build
1979 DUPLICATE	 Freetype Build Fails WIth i686-pc-linux-gnu: command not fo=
und
1980 WONTFIX	 perl-native fails to build with stack-smashing protector
modified gcc
1981 INVALID	 gtk-doc-native fails sanity test
1982 INVALID	 db-native fails do_install
1984 FIXED	 LibSDL-QPE-1.2.9
1985 FIXED	 PalmLifeDrive machine update
1988 WONTFIX	 perl-native-5.8.7-r3 fails to build on x86_64-linux
1989 FIXED	 qpegps-0.9.3
1990 FIXED	 diet-x11 makes bitbake fail
1991 WORKSFORME	 librsvg-2.16.0 build fails: QA Issue: non debug
package contains .debug directory
1992 FIXED	 php 5.2.0 fails when trying to compile it with pear
1993 FIXED	 ntop 3.0 fails do_configure
1994 WORKSFORME	 rfakeap 0.2 fails to build on x86
1995 FIXED	 Konqueror Embedded 2007 preliminary .bb file and patches
1996 FIXED	 broken keymap for collie with kernel linux-rp_2.6.17
1997 FIXED	 task-base does not contain kernel-module-ide-disk
1998 DUPLICATE	 lirc-modules fails to build
2000 FIXED	 Scummvm configure can't find sdl-config
2001 FIXED	 vsftpd 2.0.5 fails to build
2002 WORKSFORME	 parted 1.8.2 fails to build
2003 LATER	 gif2png 2.5.1 fails to build
2004 FIXED	 micro-emacs fails to build - source can not be downloaded
2005 INVALID	 SIMpad CS3 latch to /proc/cs3 patch
2006 DUPLICATE	 fortune-mod-1.99 fails on powerpc (builds without
problem for x86)
2008 INVALID	 broken-1.0-r0-do_configure
2009 WONTFIX	 classpath-gtk picks up kaffe-gtk dependency randomly
2010 FIXED	 gpe-expenses wont build
2011 FIXED	 New Package: OpenPBX.org - VOIP Soft Switch/PBX
2014 FIXED	 Updated Recipe for logrotate
2016 FIXED	 fix for problem in compiling perl-5.8.7 when MACHINE=3Dnative
2018 INVALID	 Patch not applied for perl-5.8.7-r21
2019 FIXED	 Update sox to 13.0.0 and add sox-native
2020 WORKSFORME	 intercom 0.15 fails do_configure
2021 FIXED	 atftp 0.7 fails do_compile
2022 FIXED	 btscanner-2.0 wont build
2023 FIXED	 Rev 1 of OpenPBX package
2024 FIXED	 classes/storcenter-image.bbclass missing
2028 FIXED	 angstrom on hx4700 not compile nano package
2029 FIXED	 libgnomeui-2.16.1 requires gdk-pixbuf-2.0 >=3D 2.9.0 which
is not built
2032 FIXED	 Make dillo2 compile again
2033 FIXED	 No proper PREFERRED_PROVIDER for gtk-pixbuf-*
2035 FIXED	 perl-native is broken on feisty
2037 FIXED	 building dependencies of meta packages does not work
2038 WORKSFORME	 gtk-webcore (osb-nrcore_0.5.0.bb) doesn't compile
against gtk+2.6.10
2040 WORKSFORME	 gnome-doc-utils_0.7.1.bb build failed (depend on xlstproc)
2041 WONTFIX	 opie-image failed build on hx4700
2043 INVALID	 libvocenabler fails do_compile
2044 FIXED	 Rev 2 of OpenPBX package
2046 INVALID	 glibc-2.5 build problem
2047 FIXED	 New recipe (update): sshfs-fuse_1.7.bb
2048 FIXED	 g_spawn_sync() fails to get the child return code if
launched from matchbox-desktop
2051 FIXED	 Billiardz wont build cuz of missing gcc4 patch
2054 DUPLICATE	 glibc-2.5-r5 accesses /usr
2056 INVALID	 monotone pulling fail witch 28/03/2007 DB
2057 FIXED	 gst-plugins-bad FAAD2 checks incompatible with cross-compilatio=
n
2058 FIXED	 can't build dsniff (from bitbake gpe-image)
2059 INVALID	 glibc-utils wants to install file /usr/bin/iconv
2060 DUPLICATE	 Angstrom build failure (using 4.1.2 toolchain)
2064 WORKSFORME	 Angstrom build failure
2065 WONTFIX	 rootfs_tar_do_rootfs function not defined
2066 FIXED	 2.6.20 pxa-serial-hack.patch prevents 8250 loading
2068 FIXED	 gst-plugins-ugly 0.10.4 crosscompilation configure issue
2069 WORKSFORME	 ettercap fails to build.
2070 DUPLICATE	 osb-nrcore-0.5.0+cvs20050430-r1 fails to compile for
OZ-3.5.5 with gtk errors
2071 DUPLICATE	 gpsd build failure
2072 WONTFIX	 zaurus wifi
2073 FIXED	 SIMpad development update
2074 WORKSFORME	 opie-rdesktop build failure
2075 INVALID	 kismet fails compilation with getopt error
2076 FIXED	 git read-tree LABEL_2006_06_30_2020 failed
2077 FIXED	 linux-omap1 builds notbootable image
2078 FIXED	 wrong line in runltp
2079 FIXED	 aspell 0.60.5 QA errors
2081 FIXED	 puzzles package fetch failure
2082 FIXED	 Checksum doesn't expand localpath with localdata
2083 REMIND	 HTC Universal kernel keymap patch
2084 WONTFIX	 Missing multiple shell in HTC Universal
2085 FIXED	 New gst-ffmpeg package
2086 FIXED	 package_deb: dpkg scripts are being genereted without
header: #!/bin/sh
2087 FIXED	 btscanner-2.0 wont build
2088 FIXED	 Groff-1.19.2 installs to host system
2089 FIXED	 libwpd wont build
2090 FIXED	 gkrellm-2.2.7 wont install
2091 FIXED	 puzzles package is non-fetchable again
2092 FIXED	 uboot-utils under packages/uboot is missing all of its patch fi=
les
2093 INVALID	 Cups needs to use gcc to link on arm/eabi
2094 FIXED	 Fix build of libnet_1.0.2a on a AMD64 host
2095 FIXED	 gpe-conf 0.3.5 fails to build with errors in
linux/wireless.h include
2096 FIXED	 2.6 Kernel on Poodle disables VCC (Pin11) on IO connector
2097 FIXED	 qpegps-svn recipe
2098 WONTFIX	 openzaurus-console-image
2099 FIXED	 m4-native doesn't like Os
2100 FIXED	 xqt2 minor bug
2101 FIXED	 do_patch errors not propagated
2102 FIXED	 update-alternatives-dpkg paths are wrong
2103 FIXED	 Submitting first mamona.conf distribution file
2104 DUPLICATE	 unwanted splash screen for console image on poodle (01/04/2=
007)
2105 FIXED	 plash screen stuck to 95% with X11 image for the poodle (01/04/=
2007)
2106 WONTFIX	 sqlite 3.3.9 fetch failure
2109 FIXED	 Angstrom 20070402-spitz /home/root is not created on install
2110 FIXED	 Angstrom 20070402-spitz gpe display-brightness.sh missing
2111 INVALID	 Angstrom 20070402-spitz gpe Networking (ifup) fails
after ipkg upgrade
2112 FIXED	 Firefox 2.0.0.3 segfaults
2113 WORKSFORME	 Abiword 2.5.1 installs with missing dependencies
2115 WONTFIX	 qte-2.3.10 fails to build for distro openzaurus-3.5.5
and bitbake 1.8.1
2116 LATER	 db1200 machine description broken
2117 FIXED	 Cross Compile Badness - samba
2118 WORKSFORME	 libxsetting build crash on angstrom gpe-image
2119 FIXED	 mipsel missing in classes/insane.bb
2121 FIXED	 Cross compile badness and ICL in poppler
2122 INVALID	 libgemwidget build failure
2123 FIXED	 Fixed QA issues for opie-image
2124 FIXED	 Angstrom on akita can't login via gpe-login/xdm
2125 FIXED	 libvncserver_0.9.bb
2127 FIXED	 angstrom-console-image build now depends on GTK
2128 FIXED	 libc-headers_2.6.15.99 build fail
2129 FIXED	 starling depends on non-existing packages
2131 FIXED	 uClibc 0.9.29 support
2132 FIXED	 linux-libc-headers-2.6.20 build fail
2134 WONTFIX	 Tosa Angstrom x11 image  suspend/resume failure
2135 FIXED	 Add /var/log/messages syslogging for Angstrom (with rotation)
2136 FIXED	 gconf-dbus fails to configure with syntax error
2137 FIXED	 [PATCH] resolution to depency problem
2139 FIXED	 Touchscreen Calibration off
2141 FIXED	 libpcre SRC_URI is incorrect
2142 FIXED	 temporary solution for dbus-glib_0.72.bb bug
2143 FIXED	 valgrind package update
2144 WORKSFORME	 xdpyinfo build fails on automake error
2145 FIXED	 do_install fails for libopensync
2147 FIXED	 Insane RPATH in gnutls 1.6.2
2151 FIXED	 angstrom collie basically hangs at boot
2153 INVALID	 xorg-server-1.2.0.tar.bz2 checksum fails.
2154 FIXED	 snes9x-sdl-1.39 compilation error and alignment runtime errors
2155 FIXED	 Added pango 1.16.4. Needs testing before making default.
2157 FIXED	 qemu fails to compile with gcc 4.x
2159 FIXED	 To support WCF12 CF card
2160 FIXED	 RPATH issue in sword
2162 FIXED	 latest altboot packages have packaging issues
2163 FIXED	 glib-2.0 python variable expansion does not work
2165 DUPLICATE	 opie-dagger fails do_compile
2166 FIXED	 qemu fails to build due to compiler.patch
2168 FIXED	 perl-native-5.8.7-r4 doesn't compile
2169 DUPLICATE	 Bad RPATHs in gnutls-xx 1.6.2-r0
2170 FIXED	 ipkg update fails
2173 FIXED	 MD5Sum fails on libid3tag0 package
2174 FIXED	 MD5Sum fails on libmad0 package
2175 FIXED	 Building kernel for h5000 fails because of missing defconfig
2176 FIXED	 gpe-autostarter 0.12 fails compilation with wireless
headers related errors
2177 FIXED	 prismstumbler build fails for two reasons.
2178 FIXED	 kismet fails compilation when it finds host's Magick-config
2179 DUPLICATE	 angstrom x11 calibration off by pi/2 on borzoi problem
2180 WONTFIX	 Opie datebook and KOPI no resume from suspend on alarm
2183 FIXED	 Mono and mcs throw a SIGILL exception after executing
2185 FIXED	 glib-2.0 configure fails on MIPS and x86
2187 FIXED	 libusbpp contains bad RPATH
2189 INVALID	 libgcc-s1 wants to overwrite file from libgcc1
2190 FIXED	 Missing dependancy for evince (gamin)
2191 WONTFIX	 Bad RPATH in xserver-kdrive-sdl
2192 FIXED	 bad RPATH in libmodplug
2193 FIXED	 libopie2 fails do_compile for MACHINE=3Dqemuarm and angstrom
2195 FIXED	 bitbake recipe for json-c
2196 FIXED	 sword (opie) build fails for angstrom fails because of
symbols invisibility
2197 FIXED	 angstrom opie-networksettings build fails due to wireless
headers problem
2199 FIXED	 tslib fails do_compile for Sharp ROM
2200 DUPLICATE	 QA issues in squashfs-lzma-tools-native
2201 FIXED	 qte build for angstrom fails because of kernel includes
2202 FIXED	 do_package of glibc fails because of lack of qemu-arm
2203 WORKSFORME	 shasum-native and stagemanager-native are circularly depen=
dant
2208 FIXED	 RPATH in madplay
2209 FIXED	 The sample export command in the documentation does not
work because the syntax is invalid
2210 FIXED	 QA issues in lftp (RPATH
2211 FIXED	 Sound doesn't work with OPIE in .dev
2212 FIXED	 OPIE: IrDA doesn't work properly
2213 NOTOURBUG	 OPIE: Bluetooth doesn't work properly
2216 FIXED	 evas-x11 build for angstrom-e-image fails due to kernel
headers changes
2217 WORKSFORME	 gpe-contacts installs with missing dependencies
2221 FIXED	 Patch to build strace 4.5.14 for mips target
2222 FIXED	 site/mipsel-linux update for dbus-glib
2223 FIXED	 MIPS updates for avahi
2224 INVALID	 the latest opie-todo build fails
2225 FIXED	 Stylus stops responding
2226 FIXED	 git on the device has template path way off
2227 FIXED	 insane rpath check has troubles with funny filenames.
2228 FIXED	 Meta-Bug: new or updated bb recipes
2230 FIXED	 gpe-login does not allow screen brightness adjustment
2233 FIXED	 prismstumbler compiling failed on gpe-image for hx4700
2234 FIXED	 Packages depending on 'jpeg' need rebuilding
2239 FIXED	 Tosa gpe logout makes black screen
2240 FIXED	 git on the device needs cpio and find
2241 INVALID	 gpe-calendar fails to open: Angstrom on Tosa
2242 FIXED	 cursor key rotation gets confused on c3100
2243 FIXED	 20070422 spitz can't complete ipkg-upgrade Cannot satisfy
the following dependencies for xtscal
2244 FIXED	 Make ipkg more fast
2245 DUPLICATE	 suspend-resume on Tosa fails
2246 INVALID	 look and feel: no background pictures
2247 FIXED	 SIMpad Kernel 2.6.21
2248 DUPLICATE	 suspend/resume crashes gpe on poodle
2249 FIXED	 opie-tinykate fails do_package
2253 WONTFIX	 missing iwconfig & iwpriv commands
2254 FIXED	 move opie away from /opt to /usr
2255 FIXED	 Bad python-fuse_cvs debug packaging
2256 FIXED	 update gmailfs-fuse to 0.7.3
2257 FIXED	 Missing dependency of opie-image: ipkg-native?
2258 DUPLICATE	 failed nano on openwrt
2259 WONTFIX	 [package request] - plotmm
2260 FIXED	 opie-tinykate installs to /opt
2261 FIXED	 opie-taskbar installs to /opt
2262 FIXED	 opie-mailapplet installs to /opt
2263 FIXED	 opie-qss installs to /opt
2264 FIXED	 opie-mediaplayer installs to /opt
2265 FIXED	 opie-pickboard installs to /opt
2266 FIXED	 opie-today installs to /opt
2267 INVALID	 cups installs to /opt
2268 FIXED	 cups-doc installs to /opt
2269 INVALID	 ncurses-doc installs to /opt
2270 INVALID	 ppp installs to /opt
2274 FIXED	 Check success of running terminal-opening commands
2275 WORKSFORME	 Spitz machine feed doesn't contain Packages.gz
2276 FIXED	 tasks 0.4-r1 misses dependency/library
2280 FIXED	 forcing neon (and therefore subversion) to support gnutls
2281 WONTFIX	 rosetta not configuring
2282 FIXED	 python_2.4.4 packaging QA issue
2283 FIXED	 tshark recipe
2284 FIXED	 lirc-modules fails do_compile
2285 DUPLICATE	 ipatience has missing dependency
2286 INVALID	 gsoko is much too small on Spitz
2288 FIXED	 ipaq-sleep doesn't restore backlight brightness correctly
2290 WORKSFORME	 angstrom-x11-image custom build breaks NAND
2291 FIXED	 image for palmtx machine fails on task-base
2292 WORKSFORME	 acpid warning error breaks build
2293 INVALID	 udev - function do_stage failed
2294 FIXED	 libsdl-qpe fails do_compile
2295 FIXED	 do_package fails for fortune-mod non-x86 targets
2296 FIXED	 Java updates
2297 WONTFIX	 libgcrypt-1.2.3 build fails with libtool 1.5.22 installed
2298 FIXED	 login impossible on collie
2299 FIXED	 gnuplot packaging QA issue
2300 FIXED	 gnuplot 4.2.0 recipe
2301 WORKSFORME	 bad RPATH - imlib2-loaders (imlib2-x11)
2302 FIXED	 exo not cross-compile safe
2303 FIXED	 QA errors with xfdesktop
2304 FIXED	 texinfo fails to build
2305 FIXED	 pidgin dependencies may need some love.
2307 INVALID	 qpf-font-common does not build any packages
2308 FIXED	 spitz looses time while suspended
2311 REMIND	 Openalchemy toolkit in Openembedded
2312 WONTFIX	 Terminal font too small
2313 FIXED	 Package gimp contains no files
2315 FIXED	 Asterisk misses speex module
2316 REMIND	 ipkg does not package configuration file
2317 FIXED	 incorrect use of FILES_${PN}-dbg
2324 WORKSFORME	 gtk-webcore/osb-jscore_svn.bb build error
2332 FIXED	 fix angstroem uclibc for collie and simpad
2333 INVALID	 package perl-native-5.8.8-r7: task do_compile: failed
2334 FIXED	 new machine Netgear WGT634U
2335 FIXED	 update mono to 1.2.4
2338 DUPLICATE	 display-brightness.sh is missing
2340 INVALID	 testbug please ignore
2341 INVALID	 testbug2 please ignore
2342 FIXED	 evince needs scrollkeeper-native
2343 FIXED	 bb file for nano 2.0.6 (latest stable version)
2344 FIXED	 hdparm does not build using uclibc
2345 FIXED	 cups 1.2.10 fails to build for some host distros
2346 WORKSFORME	 libcap fails to build
2347 FIXED	 beware of upstream mmap bug in uclibc 0.9.29
2348 FIXED	 alsa-utils build fails against uclibc
2349 FIXED	 Speed up ipkg-make-index few times
2350 FIXED	 Aircrack-ng
2351 WONTFIX	 gnome-desktop-2.16.1 doesn't compile
2352 WONTFIX	 Unable to create gstreamer .xml plugin register due to
conflicts with audioresample
2353 FIXED	 xserver-xorg 1.2.0 package broken
2354 FIXED	 xf86-input-keyboard 1.2.0 needs xserver 1.3.0.0 but it's not in=
 OE
2355 FIXED	 dropbear is defined twice
2356 INVALID	 Loss of Radio connectivity
2358 FIXED	 osb-nrcit-0.5.0+cvs20060212-r0 fails to compile
2360 FIXED	 more granularity for xserver-xorg package
2361 FIXED	 MDK3v1
2362 INVALID	 bootsplash-native 3.0.7 depends on target packages
2363 FIXED	 mesa fails to build on Fedora Core 6 with sed 4.1.5
2364 FIXED	 hardcoded paths in gtk-engines ipk
2365 FIXED	 uclibc: can't handle reloc type 0x49 in lib
'/lib/libc.so.6' for powerpc/angstrom/uclibc
2366 DUPLICATE	 opensp-native fails do_compile
2368 FIXED	 Enhanced Ralink RT2570 Driver
2370 FIXED	 802.11 Sniffer and much more!
2372 WONTFIX	 totem package fail when gpe-image building for hx4700
2373 FIXED	 gsoap-native fails do_compile
2374 FIXED	 gaim doesn't find bonobo.h
2375 FIXED	 can't build lirc
2376 FIXED	 mpeg2dec won't build - no rule to make target install
2377 REMIND	 HH.org ports pointercals broken
2379 FIXED	 phalanx QA Error
2381 FIXED	 rootfs fails in ipkg.py due to 'missing' control file
2382 FIXED	 CROSS COMPILE BADNESS while compiling gst-plugins-good-0.10.4-r=
0
2383 FIXED	 please reenable option 8 on altboot
2384 FIXED	 wrong uClibc.machine for simpad
2385 FIXED	 nunome prevents opie from starting up
2387 NOTOURBUG	 gpe-edit crashes on shift+tab from file open dialogue
2388 FIXED	 qpf-unismall's postinst script fails
2389 WONTFIX	 multiple packages providing same name from ipkg
2390 FIXED	 Full Wget breaks ipkg
2391 FIXED	 glibc fails locale generation due to bad dependency
2393 FIXED	 meta-toolchain/sdk does not build.
2395 WONTFIX	 RFE: package manager GUI
2397 FIXED	 libmimedir package depends on -dev package
2398 LATER	 RFE: altboot should not require shift key for selection
2402 FIXED	 Recent change to openssl.inc breaks compilation when using
prebuilt toolchain
2403 FIXED	 minimo build process needs libidl-dev on host side.
2404 FIXED	 Zaurus clamshells need a custom modmap
2406 FIXED	 Build breaks when the user has a ~/.quiltrc file
2408 FIXED	 Amsdelta distro config file error
2410 INVALID	 apt package: build breaking
2411 FIXED	 .bb for libvncserver 0.9.1
2412 FIXED	 dpkg-deb failing when package name contains character '/'
2413 INVALID	 Klimt wont compile
2415 WORKSFORME	 Vectoroids doesnt compie (fix included)
2417 INVALID	 ScummVM doesnt compie for OPIE
2418 FIXED	 Keyring wont compile
2419 FIXED	 qpegps wont compile
2420 FIXED	 TxDrug wont compile
2422 FIXED	 bb file for altboot 1.0.9 pre-release
2424 WORKSFORME	 After reboot
2425 FIXED	 gpm_4.2.1.bb fails do_configure
2426 DUPLICATE	 Cups-1.2.10.bb installation tries to write to
/var/run/cups/certs on host filesystem
2428 WORKSFORME	 ipkg fills root parition space on spitz during
upgrade or update
2432 FIXED	 Mesa fails on Efika
2433 WORKSFORME	 [PATCH] Fix icewm build (once again) on AMD64 build host
2434 DUPLICATE	 [PATCH] Fix mesa build on AMD64 with i586 target
2435 FIXED	 python-pygtk2 contains paths to buildsystem
2436 FIXED	 QtEmbedded2 uClibc-EABI build doesn't configure.
2437 INVALID	 libqte-opie wont compile with uclibc
2438 FIXED	 angstrom 20070604 ipkg update fails on gstreamer feed
2439 DUPLICATE	 mpd build hangs at svn check out
2440 NOTOURBUG	 Multiple replacers for atd
2441 WORKSFORME	 ipkg install md5sum badness
2442 FIXED	 qt4-x11-free fails do_compile
2443 FIXED	 QA failure for .debug directory in python-cheetah
2444 FIXED	 usb-gadget-mode build failure
2445 FIXED	 Problems during parsing
2446 FIXED	 fbreader: cannot stat `data/help/MiniHelp.openzaurus.fb2
2447 FIXED	 another parse error
2449 FIXED	 webcam-server:removed MAINTAINER field
2450 FIXED	 gallery: cleanup fix
2451 FIXED	 gpe-helpviewer cleanup: replaced direct directory names
use with variables
2452 FIXED	 New recipe - ifplugd 0.28
2453 WONTFIX	 MIPS patches for glibc-2.3.3 from linux-mips.org
2454 FIXED	 Bitbake build for Chicken Scheme
2455 FIXED	 QA failure for .debug directory in twisted
2456 FIXED	 QA failure for .debug directory in python-pysqlite2
2457 FIXED	 Package .debug and lua-config for lua
2458 FIXED	 Package files better for wireless-tools
2459 FIXED	 Bitbake build for python-setuptools
2460 FIXED	 Bitbake build for python-simplejson
2461 NOTOURBUG	 ipkg upgrade does nothing
2462 FIXED	 QA error on gnome-menus package (.debug)
2464 DUPLICATE	 scummvm doesn't build for qemux86
2465 FIXED	 Support /etc/defaults file for gpsd
2466 FIXED	 Bitbake build for python-fam
2468 FIXED	 python-pyqt4 fails do_compile
2469 FIXED	 Add ability to create image consisting of exact package
list (by not pulling up any dependencies)
2470 FIXED	 mpd   build failure
2471 WONTFIX	 Hardcoded PACKAGES lines
2473 FIXED	 libgpevtype: wrong depends
2474 INVALID	 linux-hotplug: mmc.agent shoud be block.agent
2475 FIXED	 gpe-announce build failure
2476 WONTFIX	 spitz default opie image contains unneeded bluetooth support
2478 WORKSFORME	 module packages should 'inherit module'
2479 FIXED	 poptop seems to be missing files
2480 FIXED	 gaim-protocol-msn lacking SSL
2481 FIXED	 binutils-cross-sdk-dbg is listed in PACKAGES mutliple times
2482 FIXED	 binutils-cross-sdk: non debug package contains .debug directory
2483 FIXED	 Perl 5.8.8 (r20) does not build (slugosbe)
2484 FIXED	 rootfs_ipk: Do not hardcode dependency on ipkg
2485 FIXED	 angstrom-x11-image doesn't build due to libgpevtype package
2486 FIXED	 udev-0.92 build error
2487 FIXED	 Problems with python-2.4.4 manifest
2490 FIXED	 Add files to .debug package for modutils
2491 FIXED	 gpesyncd build failure (blocks angstrom-x11-image)
2492 DUPLICATE	 cups-1.2.10-r0
2494 FIXED	 intltool build fails due to PV naming difference
2496 DUPLICATE	 pidgin missing gstreamer >=3D 0.10.12
2498 INVALID	 can't run horizon due to faulty ~ path
2499 FIXED	 Mplayers pxa driver fails to work on Spitz
2500 FIXED	 Can't build xserver-kdrive_git.bb
2502 FIXED	 Angstrom: please make no cursor as default in gpe
2503 FIXED	 angstrom collie: no mmc modules autoloading
2504 WONTFIX	 angstrom collie: altboot misses altboot-2.6.cfg file
2505 FIXED	 netbase has files that are already provided by iana-etc
2506 FIXED	 dropbear: broken connection termination
2507 DUPLICATE	 building for angstrom-2007.1 tries to build glibc 2.3.2
2509 FIXED	 flumotion is missing ihooks module
2510 LATER	 tetex fails do_compile
2512 FIXED	 base-files has simpad-specific files
2513 INVALID	 angstrom collie: can not start GPE
2515 FIXED	 RFP: kernel 2.6 on collie: ext3 support
2516 FIXED	 Collie 2.6: bulk writing to SD gets stuck
2517 FIXED	 update packages/classpath/classpath.inc
2518 FIXED	 update packages/classpath/classpath-minimal-native_0.93.bb
2519 FIXED	 update packages/classpath/classpath-gtk_cvs.bb
2521 FIXED	 update packages/classpath/classpath-gtk_0.93.bb
2522 FIXED	 classpath could be upgraded to 0.95
2524 FIXED	 rrdtool fails to build with newer compilers
2525 FIXED	 Magick-config --prefix incorrect
2526 INVALID	 ru_RU.UTF8 locale problems
2527 FIXED	 Ucslugc does not compile and must be fixed to compile with
uclibc0.9.29
2528 FIXED	 CROSS COMPILE Badness: gtkhtml-3.6 fails do_compile
2529 WONTFIX	 Angstrom insists on using en-gb locale
2530 FIXED	 libpcap_0.9.6 missing shared.patch
2531 FIXED	 gpsd_2.34-r3 fails
2532 FIXED	 Create .bb file for libsigc++ 2.0.17 package
2534 FIXED	 Hackndev project move to 2.6.21
2536 WONTFIX	 update packages/cacao/cacao-fpu.inc
2537 WONTFIX	 update packages/cacao/cacao-native_svn.bb
2538 WONTFIX	 update packages/cacao/cacao_svn.bb
2540 FIXED	 Asterisk 1.4.x recipe
2541 FIXED	 diet-x11 build fails
2543 FIXED	 no icq in pidgin
2544 FIXED	 Updating gtkmm
2545 FIXED	 uclibc build uses host curses.h file instead of file in staging
2546 FIXED	 perl-native does not build on newer distros
2549 FIXED	 Directfb attempts to use host vnc library
2550 WORKSFORME	 imlib2 fails with impossible construc in asm
2551 FIXED	 diet-x11 build failure due to filespath missing patch
2553 FIXED	 fix native coreutils build failure with glibc 2.6
2554 FIXED	 broken cross build environment / fix ncurses build
2556 DUPLICATE	 PalmLD: new machine file (based on hx4700 which should
be correct)
2557 WONTFIX	 PalmLD: new kernel defconfig
2558 FIXED	 fluxbox does not start in angstrom
2559 WORKSFORME	 PATH doesn't contain /sbin and /usr/sbin for root
2561 FIXED	 qemu links with zlib
2562 FIXED	 X server crash on poodle
2563 WORKSFORME	 GPE pointer does not accurately track stylus on Zaurus SL-=
6000
2564 FIXED	 uicmoc-native 2 fails to build due to lack of asm/page.h
2566 FIXED	 Build of ecore-native 0.9.9.038 fails with missing
Evas_Engine_Software_X11.h
2567 FIXED	 Patch to generate atk version 1.19.3
2568 FIXED	 Angstrom logo looks bad on 320x320 screen (psplash)
2569 FIXED	 Sound disabled in default installation
2570 FIXED	 invalid platform packages in repository for gpe-login-locale-cs
2571 FIXED	 scripts under /etc/zaurus/hinge-$orientation.d/ run twice
2573 FIXED	 Fix for esmart QA errors
2574 FIXED	 all dpkg scripts are poiting erroneously to perl native in
workdir instead of /usr/bin/perl
2575 FIXED	 final perl package has a lot of files poiting erroneously
to workdir insted of real bindir
2576 FIXED	 Add iwmmxt support to mplayer for palmld
2577 FIXED	 Added iwmmxt support to mplayer for akita
2578 INVALID	 compilation problem in .bb file.
2579 FIXED	 alignment faults in uclibc + EABI
2580 FIXED	 bison added to sanity.bbclass
2581 FIXED	 unable to build virtual/kernel =3D> patch
2583 FIXED	 modutils-cross_2.4.27.bb; added missing debendency bison-native
2585 FIXED	 No sound output - SL-C750
2589 FIXED	 qemu-native sigsegvs on amd64 while generating glibc locales
2593 FIXED	 Qt4-x11 broken for generic x86 target
2594 FIXED	 palmld defconfig
2596 INVALID	 angstrom simpad: gpe touchscreen calibration restarts
without reason
2597 FIXED	 gsteamer instead of gstreamer in gstreamer--feed.conf
2598 FIXED	 angstrom simpad gpe: metabug suspend with power button does not=
 work
2599 FIXED	 simpad angstrom gpe: keylaunch does not start because of
not defined keysyms
2600 FIXED	 simpad angstrom gpe: simpad.xmodmap keysym is wrong
2602 INVALID	 zaurus c1000 akita touchscreen broken
2603 INVALID	 glibc-intermediate bailing on gcc for i86
2605 FIXED	 mkfontdir-1.0.3 uses the wrong URL
2606 FIXED	 Source for db3 archive seems to not be avalible any more.
2607 LATER	 several problem with compiled tetex package
2608 DUPLICATE	 asterisk 1.4 bb files
2609 FIXED	 xserver-common should have /etc/X11/shepherd.xmodmap
2610 WORKSFORME	 mtd-utils can not be built because GIT_AUTHOR_NAME
and GIT_COMMITTER_NAME are not set
2612 DUPLICATE	 kazekahase segmentation fault
2614 INVALID	 MACHINE_EXTRA_RRECOMMENDS doesn't work
2615 FIXED	 libpng-1.2.12-r5 fails do_install for SharpROM
2620 INVALID	 No SD card device on Jul3 Angstrom
2622 INVALID	 perl-native-5.8.3-r0: task do_compile failed
2623 FIXED	 QA Issue prevents ewl_0.5.1.009.bb from building
2625 WONTFIX	 gnome-desktop-2.16 fails do_compile
2627 FIXED	 altboot seems unable to mount either SD or CF cards on collie
2630 DUPLICATE	 xrandr doesn't report rotation state
2631 WONTFIX	 X server returns inconsistent RandR on spitz/akita
2633 FIXED	 autoconf-2.61 in OE doesn't handle OE site properly
2634 FIXED	 Newer software requires autconf 2.61 (e.g. parted 1.8.7)
2637 FIXED	 fixes to make Sharp CE-RH2 remote working in X
2639 FIXED	 ptim_*_svn.bb: Makefile patch isnt required any more
2641 FIXED	 svn.sf.net renamed to project.svn.sf.net
2642 FIXED	 alsa-states doesn't build
2646 DUPLICATE	 updated bb file for ctorrent
2648 FIXED	 abiword-plugins fails to build
2649 INVALID	 e-wm package does not put the correct command in
Xsessions.d/98enlightenment
2650 FIXED	 I built libiconv instead of virtual/libiconv and now my
staging is broken
2653 FIXED	 update qclockchange to 0.1b
2655 FIXED	 e17 e-wm e-wm_0.16.999.038-r7 doesn't install
2656 INVALID	 test bug
2658 FIXED	 linux-handhelds-2.6-2.6.21-hh11-r1 fails to build
2659 DUPLICATE	 coreutils-native-5.3.0 fails with glibc 2.6
2660 FIXED	 smbfs cannot mount ms windows share
2661 INVALID	 package bluez-gnome-0.9+git20070718: failed
2662 WORKSFORME	 package bluez-gnome failed on h3900
2664 WONTFIX	 iRex iLiad 'ereader' distro config
2666 FIXED	 Error while building the library libsigc++-2.0.17
2667 FIXED	 Sound problems with recent kernels a.k.a. asound
statefiles need updating
2668 FIXED	 Move towards machine-independent qte
2669 FIXED	 Revamp module_conf_* support for 2.6
2670 FIXED	 initial env for altboot lacks /sbin in $PATH : losetup not foun=
d
2672 NOTOURBUG	 angstrom-x11-image does not boot from flash on h3850
2676 NOTOURBUG	 angstrom-x11-image does not boot from flash on h3900
2677 NOTOURBUG	 nokia 800 kernel not booting
2678 FIXED	 RFP: tetex-bin missing in arm5te for zaurus 860
2682 FIXED	 Fixed poodle_pm-r3.patch to compile for linux-rp-2.6.21
2688 INVALID	 OPIE: feature requests
2689 FIXED	 busybox 1.6.0 adduser fails to actually add users
2690 FIXED	 Script to make zaurus images usable
2691 FIXED	 Sysklogd fails to build
2692 FIXED	 lighttpd bb file is configured --without-pcre but pcre is
required to read the conf
2693 FIXED	 Opie i18n packages need updating to 1.2.3
2694 FIXED	 Opie reader doesn't need unicode patch
2696 FIXED	 konqueror-embedded fails looking for oe_runconf
2700 WONTFIX	 ipkg-utils missing in Angstrom feeds
2701 FIXED	 [PATCH] updated libxslt to 1.1.21
2702 FIXED	 [PATCH] updated libxml2 to 2.6.29
2703 INVALID	 unable to compile kdrive 1.3.0.0
2704 FIXED	 native-quilt reads .quiltrc
2705 FIXED	 Updating cups .bb files
2706 INVALID	 compulab with 2.6.20 cannot build jffs2 image
2707 FIXED	 compulab 2.6.20 kernel needs eabi
2708 WORKSFORME	 Package gtk+-2.10.14-r1 fails to compile
2709 WONTFIX	 opie-usermanager 1.2.3 doesn't fetch
2712 INVALID	 does fakeroot  work?
2713 FIXED	 get rid references to temporary directories on installed system
2714 FIXED	 [PATCH] lock mtd-utils to a specific git version so builds
will not break unexpectedly
2715 FIXED	 [PATCH] Fix xf86-video-nsc driver on xserver-xorg 1.2.0 and lat=
er
2719 FIXED	 lsof_4.78.bb compile fails with missing selinux/selinux.h
2722 FIXED	 Seppuku.bbclass triggers recursion error
2723 FIXED	 makedepend do_compile problem: No rule to make target
`makedepend.@APP_MAN_SUFFIX@'
2724 FIXED	 makeinfo-native depends on util-macros-native
2727 FIXED	 New parse error
2728 FIXED	 fluxbox package should depend on libstdc++6
2730 FIXED	 updated recipes for new classpath versions
2731 WONTFIX	 efl does not build
2732 FIXED	 Issues after Xorg cleanup
2733 INVALID	 libpcap-0.9.6-r1-do_configure
2734 INVALID	 libnet-1.0.2a-r1-do_configure
2735 FIXED	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xd369e4c>>
2736 DUPLICATE	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xcd8d28c>>
2737 INVALID	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xd3ced4c>>
2738 FIXED	 u-boot-1.2.0-r2-do_deploy
2739 FIXED	 linux-omap1-2.6.20-omap1-r0-do_deploy
2740 INVALID	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xca1c3ec>>
2741 INVALID	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xd13daec>>
2742 WONTFIX	 test bug
2743 INVALID	 noprovider for <bound method NoProvider.getItem of
<bb.event.NoProvider instance at 0xcc9c20c>>
2744 FIXED	 synergy-1.3.1-r0-do_configure
2745 INVALID	 gtk+-2.10.14-r3-do_install
2746 FIXED	 libgsmd_svn.bb uses SRCREV instead of SRCDATE
2748 INVALID	 librsvg fails to build
2749 FIXED	 patchutils-0.2.30-r0-do_configure
2750 WORKSFORME	 qt4-x11-free-4.3.0-r5-do_populate_staging
2751 FIXED	 patchutils-0.2.31-r0-do_configure
2752 FIXED	 e-image (images/e-image.bb) is broken
2754 WONTFIX	 openmoko-devel-image-1.0-r0-do_rootfs
2755 FIXED	 Perl's Cross/Makefile re-uses TOPDIR from environment
2756 DUPLICATE	 linux-2.6.21-r5-do_unpack
2757 FIXED	 linux-nokia770-2.6.16-osso26-r2-do_deploy
2758 FIXED	 linux-nokia770-2.6.16-osso26-r2-do_populate_staging
2759 WONTFIX	 angstrom-minimal-image-1.0-r3-do_rootfs
2760 WONTFIX	 linux-x86-2.6.20-r3-do_configure
2761 FIXED	 glibc-2.5-r6-do_package
2762 FIXED	 prism2-firmware 1.8.4 does not work on DCF-660W
2765 FIXED	 Upgrade to net-snmp 5.4.1
2766 WORKSFORME	 No brightness adjustment in gpe-login
2768 WORKSFORME	 Unable to switch virtual terminals at gpe-login or
during gpe-session
2769 WONTFIX	 angstrom-console-image-1.0-r8-do_rootfs
2774 FIXED	 python-egenix-mx-base-2.0.6-r1-do_patch
2775 FIXED	 python-formencode-0.4-r0-do_fetch
2776 FIXED	 python-gammu-0.21-ml0-do_compile
2777 FIXED	 packages eflpp resp. edje fail to build
2778 WONTFIX	 python-m2crypto-0.13.1-r0-do_compile
2780 DUPLICATE	 mysql-4.1.18-r2-do_compile
2781 FIXED	 python-soappy-0.11.3-r0-do_compile
2782 WONTFIX	 python-pyode-1.0.0-r0-do_compile
2783 INVALID	 python-sip4-4.4.5-ml0-do_compile
2784 FIXED	 python-pyqt4-4.2-ml0-do_generate
2785 FIXED	 evas-0.9.9+cvs20070721-r0-do_configure
2786 WONTFIX	 directfb-1.0.0-r5-do_rm_work
2787 FIXED	 python-ecore-0.0.0+cvs20070816-r0-do_compile
2788 FIXED	 python-evas-0.0.0+cvs20070816-r0-do_compile
2789 FIXED	 python-pytest-0.6.0-ml0-do_fetch
2790 FIXED	 python-sword-1.5.9-r0-do_compile
2791 WORKSFORME	 python24-native-2.4.0-r2-do_compile
2793 WORKSFORME	 change SRC_URI
2794 WORKSFORME	 Unable to fetch source for intltool
2795 INVALID	 busybox-1.2.1 failed to build
2796 FIXED	 Build of matchbox-keyboard fails
2798 WORKSFORME	 machine qemuarm ext2 image
2799 FIXED	 NFS Utils are broken - statd is not started so no locking
2800 FIXED	 angstrom-x11-image-1.0-r11-do_rootfs
2801 INVALID	 foo
2802 DUPLICATE	 gst-plugins-bad-0.10.5-r0-do_compile
2803 FIXED	 xserver-xorg-1.3.0.0-r0-do_fetch
2804 FIXED	 Updating the version of gtkmm library.
2805 FIXED	 Updating librsvg
2806 WORKSFORME	 openldap-2.3.11-r4  fails do_configure - perhaps due
to new automake?
2807 FIXED	 rxvt-unicode fail compile terminfo
2809 FIXED	 zudoku .bb did not install & package all necessary files
2810 WORKSFORME	 at daemon: /var/spool/at is not created on installation
2812 FIXED	 libmokogsmd2-0.1.0+svnr2703-r1-do_configure
2813 FIXED	 libsdl-net fails sanity checks in configure
2814 WORKSFORME	 webkit-gtk-0.0+svnr25169-r25169-r1-do_install
2815 FIXED	 net-snmp fails to compile on slugos/arm
2816 FIXED	 qt4-x11-free
2817 FIXED	 abiword-2.5.2-r0-do_configure
2818 FIXED	 abiword-embedded-2.5.2-r0-do_configure
2819 DUPLICATE	 [patch] qt4-x11-free-4.3.0 - for loop in do_stage is
not compatible with SH
2820 FIXED	 do_make_rootfs fails on makedevs
2821 FIXED	 wv-1.2.0-r0-do_configure
2822 FIXED	 abiword-embedded-2.5.2-r0-do_compile
2823 FIXED	 abiword-plugins-2.5.2-r0-do_configure
2824 INVALID	 abiword-embedded-2.5.2-r0-do_install
2825 INVALID	 abiword-plugins-2.4.6-r0-do_compile
2826 FIXED	 openmoko-dialer2-0.1.0+svnr2782-r2-do_compile
2827 DUPLICATE	 openmoko-dialer2-0.1.0+svnr2784-r2-do_compile
2828 DUPLICATE	 openmoko-dialer2-0.1.0+svnr2790-r2-do_compile
2830 DUPLICATE	 linux-2.6.21-r6-do_unpack
2831 FIXED	 qemu-native-0.9.0+cvs20070613-r4-do_populate_staging
2832 NOTOURBUG	 gpe-irc segfaults
2833 WONTFIX	 gst-plugins-bad-0.10.5-r1-do_compile
2834 INVALID	 horizon fails to start due to bad hardcoded path
2836 NOTOURBUG	 gpe-gallery segfaults during image manipulation
2837 WONTFIX	 uboot-openmoko-1.2.0+git8993e54b6f397973794f3d6f47d3b3c0c98dd=
4f6+svn20070820-r1-do_configure
2838 WONTFIX	 linux-gta01-2.6.21.6-moko11-r2-do_populate_staging
2839 FIXED	 pidgin/finch packages currently in feed lack network plugins
2840 FIXED	 gsmd startup script broken
2841 FIXED	 Missing xf86-video-chips and  xf86-input-elographics
recipes in org.openempedded.dev
2842 FIXED	 Linux 2.6.21 support for gumstix boards
2843 WONTFIX	 unmet dependency on bluez-dtl1-workaround
2844 FIXED	 lograte fails to package
2845 FIXED	 gtk+-2.10.14-r5 fail to compile
2846 FIXED	 new bb file for htop
2847 INVALID	 gpe-lock-display on screen keyboard is cut-off when
using rotated screen
2848 FIXED	 gnuradio-3.0.4+svnr6169-r2-do_compile
2849 FIXED	 pulseaudio-0.9.6-r5-do_compile
2850 FIXED	 webkit-gtk-0.0+svnr25203-r25195-r1-do_compile
2851 FIXED	 mono-1.2.4+1.2.5pre5-r3-do_patch
2852 FIXED	 mono-1.2.4+1.2.5pre5-r3-do_compile
2853 DUPLICATE	 linux-2.6.21-r7-do_unpack
2854 FIXED	 gst-plugins-bad-0.10.5-r1 build uses wrong include paths
for directfb
2855 FIXED	 qemu-native-0.9.0+cvs20070613-r1-do_patch
2856 FIXED	 libtool-native-1.5.24-r0-do_compile
2858 WONTFIX	 mono: ARM_FPU_NONE is hardcoded in configure.in
2859 WONTFIX	 mono: is --without-tls the correct TLS option
2860 FIXED	 mono: complete packaging
2861 FIXED	 mono: mcs directory (C#) code is not being built
2862 FIXED	 mono: finish native package
2863 WONTFIX	 mono: test on other architectures
2864 FIXED	 mono: add .NET 2.0 profile
2865 WONTFIX	 Qemu fails to build - error in cpu-exec.c
2866 FIXED	 php-native fails to build
2868 DUPLICATE	 Openldap fails to build
2869 FIXED	 udev does not bring up network interfaces on insertion
2870 WONTFIX	 enchant-1.3.0-r0-do_compile
2871 FIXED	 Add 18BPP support in X for A1200/E2
2872 WONTFIX	 libart-lgpl-2.3.16-r2-do_unpack
2874 WONTFIX	 angstrom 20070803 x11 image cannot boot into x11
2875 FIXED	 Opie first-run wizard broken due to path changes
2878 FIXED	 linux-2.6.22+2.6.23-rc3-r0-do_patch
2880 FIXED	 linux-handhelds-2.6-2.6.21-hh12-r2-do_compile
2881 FIXED	 please change default PATH for bash
2882 WONTFIX	 u-boot-git-r1-do_fetch
2883 DUPLICATE=09
uboot-openmoko-1.2.0+git3e66c078003607a7d1d214c15a5f262bc1b4032f+svn2007082=
9-r2-do_fetch
2884 WONTFIX	 openmoko-panel-mainmenu-0.1.0+svnr2567-r1-do_compile
2885 WONTFIX	 qt4-x11-free-4.3.0-r6-do_populate_staging
2886 FIXED	 squid-2.6.STABLE14-r0-do_configure
2887 INVALID	 xserver-kdrive-imageon-1.3.0-r0-do_fetch
2888 FIXED	 xserver-kdrive-imageon-1.3.0.0-r0-do_patch
2890 FIXED	 Prevent flood of alignment fault messages on gumstix
2892 FIXED	 ImageMagickis not correctly staged
2894 FIXED	 eglibc should provide glibc packages when chosen as default lib=
c
2895 WONTFIX	 angstrom-x11-gpe-image-1.0-r0-do_rootfs
2896 WONTFIX	 angstrom-x11-pimlico-image-1.0-r0-do_rootfs
2898 FIXED	 broken keymap in spitz image 20070828
2901 INVALID	 expect-5.44.1-r0-do_configure
2902 INVALID	 expect-5.44.1-r0-do_install
2903 FIXED	 claws-plugin-maildir-0.24.4-r0-do_configure
2904 FIXED	 Dependencies not matched installing openmoko stuff
2905 FIXED	 python-pygtk does not provide working import gtk
2906 LATER	 /proc/apm stays permanent
2907 FIXED	 IndentationError on package_ipk.bbclass
2908 INVALID	 libtool-native-1.5.10-r6-do_compile
2909 INVALID	 glibc-intermediate-2.5-r6-do_unpack
2910 INVALID	 gcc-cross-initial-4.1.2-r6-do_unpack
2911 FIXED	 angstrom-feed-configs-1.0-0-do_compile
2912 FIXED	 angstrom-feed-configs-1.0-0-do_install
2914 WORKSFORME	 gcc-cross-4.1.2-r6 fails to compile because of
internal compiler error
2915 FIXED	 pxaregs utility for gumstix
2916 DUPLICATE	 gnome-desktop_2.18.3 fails do_configure
2917 WONTFIX	 angstrom-console-image-1.0-r0-do_rootfs
2919 WONTFIX	 Create a distro for gumstix
2920 FIXED	 New Recipe: Free42 RPN Calculator
2921 WONTFIX	 ltrace-0.4-r1-do_compile
2923 DUPLICATE	 libsdl_net doesnt compile - looking for host includes
2924 WONTFIX	 openmoko-image-1.0-r0-do_rootfs
2925 FIXED	 Use linux decompressor instead of u-boot's for uImage kernels
2926 FIXED	 Clean build of Angstrom for Gumstix-Verdex Fails
2927 WORKSFORME	 directfb-0.9.25.1-r1 on OE 1.4 for Dreambox fails
2929 FIXED	 eglibc should not regenerate configure scripts
2930 FIXED	 angstrom-2008.1 overwrites the PREFERRED_VERSION for binutils
2932 WONTFIX	 libnotify-0.4.4-r0-do_compile
2933 WONTFIX	 gpe-bluetooth-0.55-r0-do_compile
2934 WONTFIX	 gtk+-2.10.14-r7-do_configure
2935 WONTFIX	 libmokojournal2-0.1.0+svnr2780-r2-do_compile
2936 INVALID	 libiconv-1.11-r4-do_configure
2937 FIXED	 gnome-desktop-2.18.3-r2-do_configure
2938 FIXED	 libwnck-2.13.5-r0-do_package_write_deb
2939 WONTFIX	 libgpewidget-0.115-r0-do_compile
2940 FIXED	 fakeroot-native-1.7.1-r2-do_patch
2941 FIXED	 gnome-panel-2.18.1-r1-do_package
2942 FIXED	 Adding at91 two more machines
2943 WONTFIX	 libmimedir-0.4.2-r0-do_compile
2944 WONTFIX	 libglade-2.5.1-r1-do_compile
2945 DUPLICATE	 matchbox-wm-1.2-r1-do_compile
2946 INVALID	 linux-rp-2.6.19+git-r5-do_fetch
2947 WONTFIX	 angstrom-x11-image-1.0-r0-do_rootfs
2948 WONTFIX	 Packaged Staging feature
2949 FIXED	 vlc-gpe do_compile error modules/gui/pda/pda.c
2950 FIXED	 libts version missmatches
2951 FIXED	 fontconfig-native 2.3.91 fails to build
2953 WORKSFORME	 gstreamer_0.10.14.bb do_configure fails for x86_64
2954 FIXED	 New program and recipe: ipkgorphan
2963 FIXED	 matchbox-keyboard-inputmethod-0.0+svn20070909-r4-do_configure
2964 FIXED	 save-rtc date format causes error if busybox #
CONFIG_FEATURE_DATE_ISOFMT is not set
2965 FIXED	 fxload.bb
2967 DUPLICATE	 uclibc-0.9.29-r7-do_compile
2968 FIXED	 ezxd-0.0+svnr2048-r0-do_compile
2969 FIXED	 Kexec Cmdline support for arm kernels
2971 FIXED	 linux-ezx-2.6.21-ezxdev-r10-do_compile
2972 INVALID	 linux-ezx-2.6.21-ezxdev-r11-do_compile
2973 FIXED	 opensimpad-64+0-2.4.27-vrs1-pxa1-jpm1-r4-do_compile
2974 FIXED	 madwifi-ng-r2518-20070626-r5-do_compile
2975 DUPLICATE	 webkit-gtk-0.0+svnr25488-r25486-r1-do_configure
2976 DUPLICATE	 webkit-gtk-0.0+svnr25489-r25486-r1-do_configure
2977 WONTFIX	 icu-3.6-r1-do_compile
2978 FIXED	 ERROR: Build of
org.openembedded.dev/packages/gnome/gconf-dbus_svn.bb
2979 WORKSFORME	 uicmoc4-native-4.3.1-r0-do_compile
2980 WORKSFORME	 webkit-gtk-0.0+svnr25505-r25501-r1-do_unpack
2981 DUPLICATE	 webkit-gtk-0.0+svnr25505-r25501-r1-do_configure
2982 WONTFIX	 icu-3.6-r1-do_populate_staging
2983 WONTFIX	 openmoko-libs-0.4+svnr2367-r0-do_configure
2984 FIXED	 openmoko-terminal2-2.1.0+r2879-r1-do_configure
2985 FIXED	 e-wm-0.16.999.038-r7-do_configure
2986 DUPLICATE	 e-wm-0.16.999.039-r7-do_configure
2989 FIXED	 libpcap 0.9.7
2991 WONTFIX	 linux-2.6.21-r9-do_install
2992 FIXED	 efl1/emotion fails to build because of edje_cc-native segfault
2993 FIXED	 eglibc: export-fcntl2.patch no longer needed since svn rev 3468
2994 WONTFIX	 keylaunch-2.0.10-r12-do_install
2995 WONTFIX	 matchbox-wm-1.2-r1-do_install
2996 WONTFIX	 xrandr-1.2.0-r2-do_compile
2997 FIXED	 gconf-dbus-2.16.0+svnr1-r3-do_fetch
2998 FIXED	 CF Bluetooth doesn't work on resume (spitz)
2999 FIXED	 e-wm_0.16.999.041-r0_armv5te.ipk doens't install
3002 WONTFIX	 etk-native-0.1.0+cvs20070819-r0-do_patch
3003 INVALID	 engrave-0.0.0+cvs20070819-r0-do_fetch
3004 FIXED	 edbus-cvs-r0-do_fetch
3005 DUPLICATE	 webkit-gtk-0.0+svnr25507-r1-do_configure
3006 WONTFIX	 etk-native-0.1.0+cvs20070819-r0-do_compile
3008 DUPLICATE	 gconf-dbus-2.16.0+svnr606-r3-do_compile
3009 WONTFIX	 linux-ezx-2.6.21-ezxdev-r12-do_compile
3010 INVALID	 Can't build bluez-gnome-0.14-r1
3011 WONTFIX	 libgpelaunch-0.14-r1-do_compile
3012 FIXED	 webkit-gtk-0.0+svnr25582-r25571-r1-do_fetch
3015 FIXED	 correct audiofile.m4 to work with automake 1.10
3016 INVALID	 make libsdl-qpe buildable with automake-1.10
3017 WONTFIX	 linux-2.6.20-r8-do_install
3019 WONTFIX	 linux-2.6.22+2.6.23-rc3-r1-do_install
3020 FIXED	 pcmciautils gets into an infinite loop in building due to yes
3022 INVALID	 linux-2.6.21-r9-do_patch
3024 FIXED	 openmoko-browser2-0.0.1+svnr1-r0-do_fetch
3025 FIXED	 openmoko-browser2-0.0.1+svnr${SRCREV}-r0-do_fetch
3026 WONTFIX	 linux-2.6.21-r9-do_unpack
3027 WONTFIX	 openmoko-browser2-0.0.1+svnr3004-r0-do_configure
3028 WONTFIX	 Recipe for PyWebKitGtk
3029 WONTFIX	 glibc-2.5-r7-do_package
3030 FIXED	 bluez-utils_3.19.bb fails with Exception:<class 'bb.MalformedUr=
l'>
3032 FIXED	 espgs doesn't build w/ ijs
3034 FIXED	 bluez-utils-3.19-r0-do_package_write_ipk
3035 FIXED	 please add help2man to Debian openembedded-essential task
3036 FIXED	 bluez-cups-backend-3.19-r0-do_package_write_ipk
3037 WONTFIX	 A crash is done while booting Angstrom 2007.1 with
binary locales disabled
3038 FIXED	 octave-2.9.14-r0-do_configure
3039 INVALID	 gcc-cross-4.1.2-r8-do_rm_work
3040 DUPLICATE	 gcc-cross-4.1.2-r8-do_rm_work
3042 FIXED	 NOTE: package gconf-dbus-2.16.0+svnr1-r3: task do_fetch: starte=
d
3043 FIXED	 add supervisor mode
3044 FIXED	 djvulibre 3.5.19 not compiling
3045 WORKSFORME	 evince 0.9.2 does not build
3046 FIXED	 nokia800/pointercal isn't calibrated
3048 FIXED	 at91sam9260ek/at91sam9261ek include nonexisting file
3049 FIXED	 bitbake-1.2.1.bb parallel make fails
3051 DUPLICATE	 glibc-intermediate-2.5-r7-do_compile
3052 WONTFIX	 glibc-intermediate-2.6.1-r1-do_compile
3053 WORKSFORME	 ruby-1.8.5 fails to build with dash as /bin/sh
3054 FIXED	 hal-info-20070923+git-r1-do_configure
3055 INVALID	 hal-0.5.10-r0-do_fetch
3056 FIXED	 hal-info-20070618-r0-do_configure
3057 FIXED	 claws-plugin-maildir-0.24.4-r0-do_compile
3058 FIXED	 claws-plugin-mailmbox-1.13-r1-do_compile
3059 FIXED	 ezx-boot-usb-native-0.1.0+r2060-r1-do_compile
3062 FIXED	 Abiword 2.5.x: Dialogs don't work - with patch
3063 WONTFIX	 cups-1.2.12-r0-do_compile
3064 DUPLICATE	 pango-1.16.4-r0-do_compile
3067 FIXED	 dcopidl2cpp and  dcopidl have wrong SRC_URI
3068 INVALID	 do_unpack fails the second time when source is a zip files
3070 INVALID	 udev: sync mount option causes extreme slow flash memory writ=
es
3072 FIXED	 A Mastermind-style game *.bb file
3073 WORKSFORME	 libetpan fails to link with gnutls
3074 FIXED	 libxine-x11 fails with syntax error in configure
3076 FIXED	 opie-mediaplayer2 doesn't build on fresh OE/angstrom
3077 WONTFIX	 Notecase: Updated recipe for 1.6.6
3078 WONTFIX	 networkmanager-0.7+svnr2914-r2-do_compile
3079 FIXED	 webkit-gtk-0.0+svnr25804-r1-do_compile
3080 FIXED	 New package - gumstix wifistix kernel module
3081 FIXED	 procps-3.2.7-r5-do_compile
3082 DUPLICATE	 webkit-gtk-0.0+svnr25808-r25801-r1-do_compile
3083 DUPLICATE	 webkit-gtk-0.0+svnr25808-r25801-r1-do_install
3084 FIXED	 bitbake fails to parse gnome-keyring_2.20.bb
3085 DUPLICATE	 gcc-cross-4.2.1 fails to build
3086 INVALID	 linux-ezx-2.6.21-ezxdev-r24-do_compile
3087 FIXED	 dbus-glib-0.72-r0-do_configure
3088 LATER	 ixp4xx-npe-native-2.4-r0-do_fetch
3089 FIXED	 gcc-cross-4.1.2-r9-do_compile
3090 FIXED	 liboil-0.3.11-r0-do_compile
3091 FIXED	 dbus-1 - 1.0.2-r5 does not install dbus-daemon
3093 FIXED	 dbus-glib-0.74-r0-do_configure
3094 WONTFIX	 ixp4xx-npe-2.4-r0-do_fetch
3095 WONTFIX	 e2fsprogs-1.38-r8-do_compile
3096 FIXED	 midori cannot find WebKitGdk
3097 FIXED	 gnome-vfs-2.20.0-r0-do_compile
3098 FIXED	 gnome-vfs-2.20.0-r0-do_configure
3099 FIXED	 gail-1.20.0-r0-do_configure
3100 FIXED	 gnome-keyring-2.20.0-r2-do_configure
3101 FIXED	 libhildonfm-1.9.41-r0-do_compile
3103 FIXED	 libbonoboui-2.18.0-r1-do_compile
3104 WONTFIX	 maemo-mapper-1.4.7+svnr108-r2-do_compile
3105 FIXED	 wrong bash test syntax in linux.inc
3106 FIXED	 Portman is missing a DEPENDS for fakeroot-native
3107 FIXED	 mono-1.2.5.1-r2-do_compile
3109 FIXED	 bitbake gpe-image fails on gpe-mini-browser
3110 FIXED	 liba52-0.7.4-r1-do_configure
3111 FIXED	 liba52-0.7.4-r1-do_compile
3112 FIXED	 mplayer-0.0+1.0rc1+svnr24587-r3-do_compile
3113 FIXED	 xserver-kdrive-xomap-1.1.99.3-r0-do_compile
3115 DUPLICATE	 angstrom-minimal-image-1.0-r0-do_rootfs
3116 FIXED	 problem installing libmono2.0-cil_1.2.5.1-r2_armv4t.ipk
3117 FIXED	 glibc-2.5-r7-do_rm_work
3118 DUPLICATE	 glibc-2.5-r7-do_rm_work
3119 FIXED	 Fakeroot 1.7.1 not available from Debian repositories
3120 WONTFIX	 gcc-cross-kernel-3.3.4-3.3.4-r5-do_populate_staging
3121 FIXED	 claws-plugin-rssyl-0.13-r0-do_compile
3123 FIXED	 bitbake gpephone-image fails on no 'email' provider available.
3124 NOTOURBUG	 mrxvt crashes and brings down X when forced to close
3125 DUPLICATE	 webkit-gtk-0.0+svnr25808-r1-do_configure
3126 WONTFIX	 llvm-gcc4-cross-2.0+svnr374-r0-do_compile
3127 FIXED	 ecore-0.9.9.041+cvs20070819-r5-do_compile
3129 INVALID	 gcc-cross-initial-4.1.1-r14-do_patch
3130 FIXED	 lmsensors-apps-2.10.1-r2-do_patch
3131 FIXED	 zaurusd should rdepend on bl
3132 WONTFIX	 mplayer-0.0+1.0rc1+svnr24587-r5-do_compile
3133 FIXED	 mono-1.2.5.1-r3-do_compile
3134 WONTFIX	 apmd-3.2.2-r8-do_compile
3136 DUPLICATE	 webkit-gtk-0.0+svnr26079-r1-do_configure
3137 WORKSFORME	 `bitbake xproto' fails on do_configue -- automake:
unknown warning category 'cross'
3139 WONTFIX	 pixops-test-1.0-r2-do_compile
3141 FIXED	 EFL modifcations
3142 INVALID	 cannot find package when PACKAGES ${PN} is empty
3143 FIXED	 cramfs and smbfs not defined as DISTRO_FEATURES
3144 FIXED	 bind-9.3.4-P1
3145 FIXED	 Upgrade to vlan-1.9 and fixed SRC_URI
3146 FIXED	 Samba smbfs and cifs packages
3147 FIXED	 upgrade to libid3tag-0.15.1b and fixed URI for libmad-0.15.1b
3148 INVALID	 nmap-4.20-r0-do_fetch
3149 INVALID	 nmap-4.20-r0-do_configure
3150 FIXED	 busybox 1.7.2 shell issues
3152 FIXED	 libqpe-opie_cvs needs version bump
3153 FIXED	 ttf-liberation do_fetch fails with certification error
3154 FIXED	 opie-batteryapplet not included by default
3155 FIXED	 Patch for libgstmad to generate 16-bit output instead of 32-bit
3157 INVALID	 Dropbear requires libz.so.1
3159 FIXED	 iputils package set ${PN} package empty
3160 FIXED	 matchbox-panel-2-0.1+svnr1626-r8-do_configure
3165 FIXED	 Add kernel-vmlinux to blacklist
3167 FIXED	 Add machine configuration for EM-X270
3168 WONTFIX	 dbench-3.04-r1-do_install
3169 FIXED	 meta-toolchain fails to build when icecc is used
3170 FIXED	 meta-toolchain fails at binutils-cross-sdk fails on
x86/Angstrom with QA errors
3171 INVALID	 gcc-cross-sdk-4.1.2-r6-do_unpack
3172 FIXED	 uclibc-0.9.29-r8-do_configure
3173 FIXED	 PATCH: libopieobex: disable bluetooth detection
3176 WONTFIX	 empathy-0.14-r0-do_configure
3177 INVALID	 Sepukku.bbclass can't attach logs anymore
3178 FIXED	 binutils 2.18 / uclibc : linking error
3179 FIXED	 dbus fails to start on x86/Angstrom
3180 WORKSFORME	 bitbake gtk+ fails on 20071020 (and back at least a
week) due to missing DEPENDS
3183 INVALID	 maxima-5.13.0-r0-do_configure
3184 FIXED	 [PATCH] reanimate xorg-app/mkfontscale recipies
3185 FIXED	 [PATCH] reanimate xorg-app/xkbutils recipie
3186 FIXED	 [PATCH] reanimate xorg-app/xlsfonts recipie
3187 FIXED	 [PATCH] reanimate xorg-app/xkbcomp recipie and add xkbcomp-nati=
ve
3188 FIXED	 [PATCH] fix libx11-native package
3189 DUPLICATE	 [PATCH] new fakeroot package to fix download failure
3190 FIXED	 [PATCH] fix mkfontdir-native download location
3191 FIXED	 openmoko-dates2-0.1.0+svnr640-r0-do_populate_staging
3193 FIXED	 source code of screeensaver unable to be downloaded
3194 WORKSFORME	 2007-10-20 'bitbake gpe-image' failed on several
missing DEPENDS
3195 WONTFIX	 AltBoot does not mount cf card on collie
3196 FIXED	 gpephone-image fails on librecord due to problems in
Makefile.am and configure.ac
3198 FIXED	 syslogd fails to start at boot with busybox 1.7.2
3199 FIXED	 midori fails to build with syntax error in document.h
3201 FIXED	 Fix: missing dependency for xdm
3202 FIXED	 Add a machine definition for MPC8323E-RDB
3203 FIXED	 updater.sh is a forbidden file
3204 FIXED	 libxml2-2.6.29-r5: do_populate_staging: failed
3205 INVALID	 binutils-2.18-r1 fails to link with libiberty.a
3206 FIXED	 Add uClibc configuration for MPC8323E-RDB
3207 FIXED	 Add linux configuration for MPC8323E-RDB
3208 FIXED	 Tree 1.5.1 doesn't build
3209 DUPLICATE	 Git fetcher failing on x86_64 installs (Fedora 7)
3211 FIXED	 libgcc.so ends up in subdir but is not found during install
3212 FIXED	 Kernel config on akita does not include overlay support
3213 WONTFIX	 gconf-dbus-2.16.0+svnr1
3214 FIXED	 Unable to build klibc
3215 FIXED	 Ralink USB WiFi drivers
3216 FIXED	 linux-rp-2.6.23: fixed defconfig.poodle and a patch for
sound/soc/pxa/poodle.c
3218 INVALID	 gcc-cross-initial_4.2.2 doesn't compile
3220 FIXED	 PATCH: Update opie-mediaplayer2 to 1.2.3
3221 FIXED	 PATCH: Update opie-notes to 1.2.3
3224 FIXED	 New Quasar recipes available
3225 FIXED	 Upgrade to syslog-ng 2.0.5
3226 FIXED	 Use WORKDIR path to access apache2 init script
3227 FIXED	 Remove warnings about unsupported scp arguments
3229 WONTFIX	 upgrade path for gsmd broken
3230 FIXED	 no hostap cf support in 2.6.23 builds for akita
3231 FIXED	 matchbox misbehaviour in 2.6.23 angstrom x11-image builds
3232 FIXED	 icecc-create-env.sh is adding cc1 and cc1plus to wrong director=
y
3235 FIXED	 default virtual keyboard in h2200
3239 FIXED	 Add  MTD + JFFS2 support for MPC8323E-RDB
3240 FIXED	 source location for 2005q3-2 codesourcery toolchain changed
3243 DUPLICATE	 fakeroot 1.7.1 - update URL or use newer version
3244 WORKSFORME	 Enable u-boot autoboot on MPC8323E-RDB
3245 WORKSFORME	 'bitbake agg' fails on missing libsdl-native
3246 FIXED	 libgemwidget DEPENDS incomplete - requires gnome-vfs and
gnome-vfs-modules
3247 FIXED	 libgemwidget fails on missings POTFILES.in
3248 FIXED	 agg.bb needs a -D
3249 FIXED	 Notecase 1.6.9 update
3250 DUPLICATE	 gcc-cross-4.1.2-r10-do_compile
3251 FIXED	 popt-1.7-r4-do_compile
3252 DUPLICATE	 uclibc-0.9.29-r8-do_compile
3254 WORKSFORME	 native OpenSSL fails to build due to the use of
target linker flags
3256 WORKSFORME	 fontconfig_2.4.1.bb not building due to error
fetching device_symbols.h
3257 INVALID	 gcc-syntax-fix.patch fixed upstream for libopie2-1.2.3
3258 INVALID	 iptables_1.3.8 fails to compile
3260 FIXED	 iptables fails with error getsockopt failed strangely
3261 FIXED	 madwifi snapshot needs updating
3262 FIXED	 gconf-dbus-2.16.0+svnr606-r4-do_compile
3263 WONTFIX	 xserver-kdrive-1.3.0.0-r19-do_compile
3264 WORKSFORME	 linux-libc-headers depends on gettext-native
3265 FIXED	 Update the version of glibmm library
3266 INVALID	 new version of library libsigc++-2.0
3267 FIXED	 e-wm fails to start after install
3268 WONTFIX	 neod-0.1.0+svnr2956-r5-do_compile
3269 WONTFIX	 gnash-0.8.0-r0-do_populate_staging
3270 INVALID	 gnash-0.8.1-r0-do_compile
3271 FIXED	 epiphany-2.19.6-r1-do_configure
3272 FIXED	 python-logging is missing some dependencies
3274 INVALID	 uclibc 0.9.29-r8 segfaults
3275 WONTFIX	 mplayer-0.0+1.0rc2+svnr24587-r5-do_configure
3276 FIXED	 toolchain badness ? - No it's QA
3278 WORKSFORME	 bitbake ptim-headers fails on bitbake gpephone-image
3279 FIXED	 gpsdrive SRC_URI changed
3284 FIXED	 glibc-intermediate-2.6.1 compile failed for 2008.1 on i686
3285 INVALID	 libnss-mdns-0.9-r0 do_compile fails first time on i686-angstr=
om
3286 FIXED	 CROSS COMPILE Badness for motion
3287 WONTFIX	 fuse-module-2.6.5-r1-do_compile
3289 FIXED	 python-ecore-0.1.1+cvs20070819-r1-do_compile
3291 FIXED	 hildon-libs needs libmatchbox in dependency
3292 FIXED	 Compilation fixes for wlan-ng-modules
3293 INVALID	 opie-taskbar-images fails to build
3296 FIXED	 python-core is missing struct.py
3297 FIXED	 pulseaudio: build hal-detect module
3298 FIXED	 ettercap-ng - new verison of product ettercap
3299 FIXED	 cvs recipe for navit
3301 FIXED	 sqlite3_3.4.1 : source tarball is no longer available
3302 FIXED	 expat fails to install to image
3303 FIXED	 python-crypt 2.5 has an incorrect FILES definition
3304 INVALID	 Bitbake complains about missing deps due to changes to the re=
po.
3306 WONTFIX	 mpeg2dec-0.4.0b-r4-do_compile
3307 FIXED	 Fix for angstrom-task-sectest
3308 FIXED	 Fix for cacao-cldc
3309 FIXED	 Fix for flumotion
3310 FIXED	 Fix for task-native-sdk
3311 FIXED	 Fix for task-opie-all
3312 FIXED	 Fix for task-python-sharprom
3313 FIXED	 Fix for task-sdk-opie
3318 WONTFIX	 module-init-tools-cross-3.2.2-r3-do_configure
3319 WONTFIX	 elf2flt-0.0+svnr1786-r0-do_compile
3320 FIXED	 h2200 autobuild images (20071117) don't ever make it into
gpe desktop
3323 FIXED	 notecase-1.7.2-r1-do_compile
3324 FIXED	 sysvinit-2.86-r36-do_rm_work
3325 WONTFIX	 glib-2.0-2.14.1-r2-do_compile
3328 FIXED	 sound broken for h2200 in RC1.3
3331 DUPLICATE	 ping: permission denied. (are you root?)
3333 FIXED	 linux-rp-2.6.23: sd drivers do not load before looking for root=
 fs
3334 WONTFIX	 -rootdelay locks up linux-rp-2.6.23
3336 WONTFIX	 openmoko-dialer2-0.1.0+svnr3438-r5-do_compile
3338 FIXED	 pref. version of packages Angstrom 2007.1
3339 FIXED	 Upgrade to mpfr-2.3.0
3340 FIXED	 fix for the fix of wlan-ng-modules 0.2.7
3341 DUPLICATE	 webkit-gtk-0.1+svnr27222-r3-do_configure
3342 FIXED	 binutils 2.17.50.0.5 fails to build due makeinfo version proble=
m
3343 FIXED	 [PATCH] fix libungif download location
3344 INVALID	 openmoko-feedreader2-0.0.1+svnr623080-r1-do_fetch
3345 FIXED	 ecore-native stages unusable libraries
3346 FIXED	 Upstream GCC C compiler bug
3347 WONTFIX	 glibc-2.5-r8-do_compile
3348 WONTFIX	 glibc-intermediate-2.5-r8-do_compile
3349 WONTFIX	 alsa-lib-1.0.14-r2-do_install
3350 NOTOURBUG	 gpe-clock applet does not expand to show entire time
3351 FIXED	 zImage-2.6.23-poodle-20071117021844.bin crashes on boot
3352 FIXED	 xserver-kdrive-1.3.0.0-r20-do_compile
3353 FIXED	 gettext fails to build
3354 WORKSFORME	 dropbear-0.49-r1-do_install
3355 INVALID	 glibc-2.5-r8-do_package
3357 FIXED	 openmoko-dialer2-0.1.0+svnr3481-r5-do_configure
3359 FIXED	 libdaemon-0.11 segfaults with avahi-daemon on arm/xscale pxa270
3360 FIXED	 bbclass to create maemo scratchbox compatible binaries
3361 DUPLICATE	 gcc-cross-4.1.2-r11-do_compile
3362 DUPLICATE	 linux-rp-2.6.21-r11-do_compile
3364 INVALID	 mpfr-native-2.3.0-r1-do_populate_staging
3366 FIXED	 webcam-server needs jpeg to build
3367 FIXED	 package binutils-cross-2.18 fails to compile
3368 FIXED	 python 2.5 is not build with ctypes on arm
3369 FIXED	 meta-toolchain uses ipkg-list-fields but it's not in
ipkg-utils-native
3370 FIXED	 Security issues with gpe-login --autolock.
3371 FIXED	 openrdate recipe
3372 FIXED	 remove xcb depends from libx11
3373 FIXED	 fix firefox 2.0.0.3 building
3375 FIXED	 meta-toolchain does not fix pkgconfig data files path properly
3377 FIXED	 contacts-0.7-r1-do_compile
3378 FIXED	 gmp-native-4.2.1 multiple definition bothers gcc 4.3
3380 INVALID	 gettext-native-0.14.1-r6-do_configure
3381 INVALID	 qemu-native-0.9.0+cvs20070613-r5-do_compile
3382 INVALID	 curl-native-7.16.4-r0-do_configure
3383 FIXED	 zlib: allow debian name to be customized to zlib1g
3384 FIXED	 add old versions of libtool and atk
3386 WONTFIX	 xf86-video-ati-6.6.193-r1-do_configure
3387 FIXED	 kismet preferred version
3389 WONTFIX	 linux-efika-2.6.20.20-r1-do_configure
3390 REMIND	 zaurusd does not discriminate between lid was opened and
headphones removed
3391 WONTFIX	 libmad-0.15.1b-r0-do_configure
3392 WONTFIX	 gtk+-2.10.14-r7-do_compile
3393 WONTFIX	 gnome-doc-utils-0.12.0-r1-do_compile
3394 WONTFIX	 minimo-0.02+cvs20070626-r0-do_compile
3395 WONTFIX	 firefox-1.0.7-r0-do_compile
3396 WONTFIX	 epiphany fails to configure
3397 FIXED	 linux-rp-2.6.17: add kexec atag support and make default for po=
odle
3398 FIXED	 hal_0.5.9: add intltool-native to dependencies to prevent
configure from failing
3399 FIXED	 Add --disable-libgomp to gcc 4.2.x recipes
3400 INVALID	 OE.mtn.bz2 won't bunzip2
3401 WONTFIX	 gcc-cross-4.1.2-r12-do_compile
3406 FIXED	 Add mtd 1.1.0
3407 WONTFIX	 Fix mtnpatch.py
3408 FIXED	 popt-1.10.4
3409 FIXED	 e2fsprogs 1.38 does not build with uclibc and USE_NLS=3Dno
3411 WONTFIX	 gst-plugins-base-0.10.14-r2-do_install
3412 WONTFIX	 nslu2-minimal-image-1.0-r0-do_rootfs
3413 FIXED	 libtool-cross-1.5.10-r9-do_patch
3414 FIXED	 libtool-native-1.5.10-r9-do_patch
3415 FIXED	 DirectFB examples look in wrong include path
3416 FIXED	 apex-env-1.5.8-r0-do_compile
3417 FIXED	 dates-0.4.4-r2-do_compile
3419 DUPLICATE	 qmake2-native is broken due to target dependance
3422 FIXED	 ERROR: task-base-dbg is listed in PACKAGES multiple times
3423 FIXED	 gcc-cross-4.1.2-r13-do_configure
3424 FIXED	 Bitbake recipe for lrzsz incorrectly configuring alternatives
3425 WONTFIX	 mipv6-2.0.2-r0-do_configure
3426 INVALID	 build angstrom with unecessary packages.
3427 FIXED	 Add LED classCPU activity trigger
3428 FIXED	 preferred xserver-kdrive-imageon for c7x0
3429 WONTFIX	 gnash-CVS
3430 FIXED	 Patch for adding Cmdline support in kexec-tools
3433 FIXED	 Evas and Ecore no longer build with directfb support
3435 DUPLICATE	 hal: Missing /var/cache/hald
3436 WONTFIX	 libx11-native-1.0.1-r0-do_compile
3437 WONTFIX	 xfonts-xorg-6.8-r1-do_compile
3438 WONTFIX	 New package KedPM
3439 INVALID	 glib2 will not configure in right way on Mamona for qemux86
3441 FIXED	 dates-0.4.4-r2 do package QA errors
3442 FIXED	 gpe-plucker_0.4 fails to build
3444 WORKSFORME	 gpe-irc-0.08 QA issues
3445 FIXED	 gpe-mini-browser-0.2 QA issues
3446 FIXED	 zaurus-updater changes have broken flashing on zaurus c760
3447 DUPLICATE	 linux-rp-2.6.21-r12-do_compile
3448 WONTFIX	 Mplayer lacks Real Video support
3450 FIXED	 python-pygtk-2.10.4-ml5-do_configure
3451 INVALID	 eet-native-0.9.10.041+cvs20071206-r0-do_fetch
3452 INVALID	 eet-0.9.10.041+cvs20071206-r0-do_fetch
3453 WONTFIX	 edje-native-0.5.0.41+cvs20071206-r0-do_compile
3454 INVALID	 mplayer-0.0+1.0rc2-r6-do_compile
3455 DUPLICATE	 php-native-5.2.0-r1-do_compile
3456 FIXED	 Zaurus won't resume if suspended during charge
3458 FIXED	 Issues discovering BT device names with bluez 3.22
3459 FIXED	 altboot-image stuck on altboot prompt
3461 INVALID	 gcc-cross-4.1.2-r13-do_compile
3462 FIXED	 librecord-0.1-r0-do_fetch
3463 INVALID	 librecord-1.0-r0-do_configure
3465 DUPLICATE	 zaurus-hinge cannot find bl (on c7x0)
3466 FIXED	 webkit update breaks midori-0.0.12
3467 FIXED	 epdf_cvs.bb
3469 FIXED	 libart-lgpl-2.3.19-r0-do_unpack
3472 WONTFIX	 apache2-2.2.3-r5-do_configure
3473 WONTFIX	 curl builds fails due to bad configure parameter
3474 INVALID	 unable to bitbake gpe-image -- bitbake pixman fails with
cross compiler badness
3475 WONTFIX	 apache2-2.2.3-r5-do_compile
3476 WONTFIX	 webkit-gtk-0.1+svnr28656-r4-do_compile
3480 DUPLICATE	 5500 hangs during boot
3482 FIXED	 reiserfsprogs-3.6.19 no longer available from namesys.com
or angstrom-distribution.org
3483 WONTFIX	 guile-native-1.6.4 fails do_compile
3485 FIXED	 Angstrom image for Tosa unavailable
3486 INVALID	 audiofile build failed
3489 NOTOURBUG	 gpe-bluetooth applet gives error message on disabling BT
3490 NOTOURBUG	 gpe-package crashes on package install
3492 FIXED	 Mispelling of python-pydirectfb as python-directfb in
task-python-everything.bb
3493 FIXED	 qt4-x11-free-4.3.2-r6-do_compile
3494 FIXED	 gpsdrive-2.10pre2-r1-do_fetch
3495 FIXED	 Problems with exceptions with psyco 1.5
3496 DUPLICATE	 New package for geany stable
3497 WONTFIX	 qt4-x11-free-4.3.2-r6-do_populate_staging
3499 FIXED	 base-image unbuildable for some machines
3500 FIXED	 Parallel compiling breaks gnumeric
3501 FIXED	 2007.11R1x won't boot on Spitz
3502 FIXED	 ipkg-cl update creates incorrect directories
3503 FIXED	 guile-1.6.4 fails do_compile
3505 FIXED	 QA issue prevent gconf-2.6.1 from building
3506 WONTFIX	 brutefir-1.0i-r1-do_compile
3507 WONTFIX	 pulseaudio-0.9.6-r6-do_compile
3508 WONTFIX	 mplayer-0.0+1.0rc2-r6-do_configure
3509 WORKSFORME	 external-toolchain RPROVIDES causes problem.
3512 INVALID	 octave-2.1.73-r0-do_configure
3513 WONTFIX	 exiv2-0.15-r0-do_compile
3515 FIXED	 typo in MACHINE_FEATURES: ushbost (should be: usbhost)
3516 FIXED	 firmware helper not loading on boot - h2200 2007RC2
3517 WONTFIX	 altboot redirection broken due to a wrong OUT_TTY in default =
mode
3518 FIXED	 Tosa default asound.state not enabling speaker/headphone
output [PATCH]
3519 NOTOURBUG	 hx4700: ts-adc and high cpu load
3520 FIXED	 hx4700: bluetooth activation fails from bt-applet in gpe
3521 FIXED	 request to add fmtools package
3522 FIXED	 scummvm 0.9.1 does not configure with arm-angstrom-linux
cross compiler - patch included
3524 WONTFIX	 emacs-20060801-r8-do_install
3525 WONTFIX	 dsniff-2.3-r1-do_compile
3526 FIXED	 emacs-20060801-r8-do_bootstrap
3527 DUPLICATE	 webkit-gtk-0.1+svnr28656-r4-do_configure
3528 FIXED	 Collie should use 64MB of memory
3529 FIXED	 gpsd : missing python module curses.ascii
3532 INVALID	 gpe-conf serial (gpe-conf - 0.2.6-r1)  writes own /etc/gpsd.c=
onf
3534 FIXED	 navit-0.0.2-r0-do_compile
3537 WORKSFORME	 libgpg-error-1.4    function do_compile failed
3538 INVALID	 libgpg-error-1.4    fails to compile
3539 WORKSFORME	 GPE Sleep Config doesn't save values
3540 DUPLICATE	 Backlight sometimes off after resume
3541 FIXED	 ecore: --disable-ecore-evas-gl should be --disable-ecore-evas-x=
11-gl
3542 FIXED	 e-wm depends on ecore-imf now
3543 WORKSFORME	 octave 3.0.0 not able to ld readline library during
do_configure
3546 FIXED	 h5000 keys don't work
3550 FIXED	 libpcre-native fails to stage - libpcreposix.so.0.0.0U
(note the 'U')
3551 FIXED	 git-native fails to build - error in git-gui Makefile
install command
3552 WONTFIX	 gcc-4.1.1-r17-do_install
3553 INVALID	 base-image-1.0-r0-do_rootfs
3554 INVALID	 nas-server-image-1.0-r0-do_rootfs
3557 REMIND	 matchbox-panel do_package QA issue
3561 FIXED	 bluez-cups-backend-3.23 do_patch failure
3562 FIXED	 linux-dht-walnut-2.6.20-r4-do_deploy
3563 FIXED	 linux-dht-walnut-2.6.20-r4-do_populate_staging
3565 FIXED	 linux-dht-walnut-2.6.20-r4-do_install
3566 DUPLICATE	 Poodle backlight control driver unreliable (too dark
3567 FIXED	 add sample wpa_supplicant config to /etc/network/interfaces fil=
e
3569 FIXED	 Konqueror-embedded broken in autoconf
3570 FIXED	 qpegps various problems
3571 WONTFIX	 Base image hangs on boot for machine omap5912osk
3572 DUPLICATE	 scummvm-0.10.0-r0-do_configure
3573 DUPLICATE	 ffmpeg-0.4.9-pre1-r1-do_compile
3575 DUPLICATE	 gpe-bluetooth deactivation on hx4700
3576 FIXED	 midori-0.15 segfaults
3577 WONTFIX	 hwdata-0.191-r0-do_install
3578 FIXED	 Xfbdev and ipaq-sleep hogging the cpu
3579 WONTFIX	 qt-x11-free-3.3.7-r1-do_compile
3580 WONTFIX	 qt4-x11-free-4.3.3-r7-do_compile
3581 WONTFIX	 scummvm-0.10.0-r0-do_compile
3584 WONTFIX	 js-1.5-r1-do_compile
3585 FIXED	 ftp/http fallback mirrors are discarded
3588 FIXED	 New recipe - pv - pipe viewer
3589 WONTFIX	 OE don' t create root image with ext3 FS on AMD64
3590 INVALID	 allow customizing package names
3592 FIXED	 Wireless drivers missing from defconfig-poodle for linux-rp-2.6=
.23
3594 DUPLICATE	 scummvm-0.9.1-r4-do_configure
3595 WONTFIX	 id3lib-3.8.3-r1-do_compile
3596 WONTFIX	 libgpepimc-0.9-r0-do_populate_staging
3597 WONTFIX	 libmimedir-0.3.1-r3-do_populate_staging
3598 WONTFIX	 id3lib-3.8.3-r1-do_install
3599 FIXED	 MMC/SD card compatibility on Poodle
3600 FIXED	 Remove opie-dasher 1.2.3+
3601 FIXED	 Update task-opie-all for Opie 1.2.3
3602 FIXED	 tune-strongarm.inc uses mtune=3Dxscale instead of mtune=3Dstron=
garm1100
3603 FIXED	 avahi-0.6.22-r5-do_compile
3604 FIXED	 e2fsprogs-1.38-r10-do_compile
3605 DUPLICATE	 gnome-mplayer-0.5.3+cvs20080101-r2-do_compile
3606 WONTFIX	 e2fsprogs-1.38-r10-do_configure
3607 FIXED	 gcc-cross-4.2.2-r2-do_compile
3608 WONTFIX	 console-image with broken ssh
3611 FIXED	 error fetch git repo linux-hnd
3612 FIXED	 gaim repo 404 error on fetching
3615 WONTFIX	 nslu2-base-image-1.0-r0-do_rootfs
3616 WONTFIX	 apex-env-1.5.13-r0-do_compile
3617 DUPLICATE	 glibc-intermediate-2.6.1-r1-do_configure
3618 FIXED	 [PATCH] glibc-intermediate-2.6.1 fails to compile for Angstrom =
2008
3619 DUPLICATE	 uclibc-0.9.29-r8-do_install
3620 WONTFIX	 linux-rp-2.6.20-r20-do_compile
3621 WONTFIX	 openmoko-dialer2-0.1.0+svnr3689-r6-do_configure
3622 WONTFIX	 gtk+-2.12.0-r1-do_compile
3623 WONTFIX	 pango-1.18.1-r0-do_compile
3624 WONTFIX	 gnome-mplayer-0.5.3+cvs20080101-r3-do_patch
3625 WONTFIX	 minimal-gpe-image-1.0-r2-do_rootfs
3626 WONTFIX	 bluez-utils-3.24-r2-do_compile
3627 WONTFIX	 distcc-2.18.3-r2-do_install
3628 DUPLICATE	 madwifi-ng_r2702-20070903.bb failed on for alix
3629 DUPLICATE	 gnome-mplayer-0.5.3+cvs20080101-r3-do_compile
3630 WONTFIX	 gnome-mplayer-0.5.3+cvs20080101-r4-do_compile
3631 WONTFIX	 matchbox-wm-1.2-r3-do_compile
3632 WONTFIX	 Spitz will not start after installing RC1
3633 DUPLICATE	 hal-0.5.9-r4-do_compile
3634 FIXED	 Smallscreen mod for GtkFileChooser
3635 FIXED	 xserver-kdrive-imageon-1.2.0-r3-do_compile
3636 WONTFIX	 gcc-4.2.2-r2-do_configure
3637 WONTFIX	 webkit-gtk-0.1+svnr29226-r4-do_configure
3638 FIXED	 glibc-2.6.1 fails for SuperH-based targets.
3639 WONTFIX	 LAB-kernel-2.6.21-hh8+cvs20080107-r0-do_configure
3640 FIXED	 gpe-dm crashes a few seconds after login
3641 WONTFIX	 LAB-kernel-2.6.13-hh2-r0-do_compile
3642 WONTFIX	 LAB-kernel-2.6.21-hh20+cvs20080108-r0-do_compile
3643 FIXED	 free42-vga-1.4.36-r1-do_fetch
3644 WONTFIX	 qte-mt-2.3.10-r25-do_configure
3645 FIXED	 Collie: interface for mail and charging leds
3646 WONTFIX	 directfb-1.1.0-r3-do_compile
3647 FIXED	 New mx31moboard machine support in OE
3648 WONTFIX	 openmoko-panel-gsm-0.1.0+svnr3664-r1-do_configure
3649 WONTFIX	 libsidplay-1.36.59-r0-do_compile
3650 FIXED	 uicmoc4-native fails do_compile
3651 INVALID	 webkit-gtk_svn rev 28656 fails do_configure
3652 WONTFIX	 liburiparser-0.5.1-r0-do_install
3653 WONTFIX	 libxxf86dga-1.0.1-r1-do_install
3654 WONTFIX	 libxinerama-1.0.2-r3-do_install
3655 FIXED	 cleanup after java-native merge
3656 WONTFIX	 libgpepimc-0.9-r0-do_install
3657 WONTFIX	 libmimedir-0.3.1-r3-do_install
3658 WONTFIX	 libmatchbox-1.9-r1-do_install
3660 WONTFIX	 gst-plugins-bad-0.10.5-r1-do_configure
3663 FIXED	 screen build failed
3664 FIXED	 WLAN cards and suspend sometimes don't mix
3665 WONTFIX	 console-image-1.0-r0-do_testlab
3668 NOTOURBUG	 The Angstrom logo in 'issue' and 'issue.net' is undecorated
3669 FIXED	 Opie: time settings cannot find citytime
3670 FIXED	 new package gpsdrive 2.10pre4
3671 WONTFIX	 libevent-1.1a-r0-do_install
3673 WONTFIX	 opie-ttf-support-1.1-r2-do_compile
3674 WONTFIX	 imlib2-1.4.0.002-r2-do_install
3675 WONTFIX	 libxdamage-1.1.1-r1-do_install
3677 LATER	 hx4700 - battery power is always 100%
3679 FIXED	 new package gpsdrive-2.10pre2-ipaq
3680 FIXED	 kernel modules missing (pcmcia wlan cards
3681 FIXED	 Angstrom Opie qcop is not working on simpad
3687 FIXED	 package lcms-1.15-r0: task do_fetch: failed (broken SRC_URI)
3688 WONTFIX	 opie-keytabs-1.2.3-r0-do_install
3689 WONTFIX	 libxcomposite-0.4.0-r0-do_install
3691 INVALID	 test bug
3692 WONTFIX	 libspiff-0.7.2-r0-do_install
3694 WORKSFORME	 libsdl-mixer-1.2.6-r1-do_install
3695 WONTFIX	 libevent-1.1a-r0-do_populate_staging
3696 FIXED	 Package xfonts-xorg 6.8 fails to compile
3698 INVALID	 Test
3699 FIXED	 bbclasses for java recipes
3701 WONTFIX	 driftnet-0.1.6-r0-do_compile
3702 WONTFIX	 rdesktop-1.5.0-r0-do_compile failure for PowerPC
3703 WONTFIX	 libwnck-2.13.5-r0-do_install
3704 WONTFIX	 imlib2-1.4.0.002-r2-do_unpack
3706 FIXED	 Recipe for xautomation
3707 FIXED	 reference to zecke home dir
3710 FIXED	 Add rtc-sa1100 to module_autoload list in kernel.bbclass
3712 FIXED	 RFE: xapian in OE
3716 FIXED	 git-native 1.5.3-r1 doesnt build
3718 FIXED	 busybox/syslog init script bug
3719 INVALID	 calibration for wacom-tablet fails in opie under qemu
3720 FIXED	 opie 1.2.3 fails to start (black screen) under qemu
3721 FIXED	 qemu-native_0.9.1 fails during do_stage
3723 NOTOURBUG	 h3900: Sleeves not supported
3729 FIXED	 glibc locales fail on x86_64 host with qemu-native-0.9.1-r6
3730 FIXED	 gpe-conf misinterprets omap5912osk backlight
3731 FIXED	 omap OSK needs an entry in Xserver
3732 FIXED	 gcc-4.2 arm oabi softloat-patch needs 2 symbol more
3736 FIXED	 wesnoth fails to compile
3737 FIXED	 busybox 1.7.2 defconfig missing options [patch]
3738 FIXED	 RFC: u-boot for zaurus c7x0 and akita
3739 FIXED	 add an initramfs that mounts root and kexecs a kernel from ther=
e.
3741 FIXED	 kdrive 1.4 broken for tslib when rotated
3743 FIXED	 opkg fails do_compile
3745 FIXED	 klibc-utils-static fails do_compile for eabi
3748 LATER	 tetex-native fails do_compile
3750 FIXED	 omap5912osk xmodmap entry [patch]
3752 FIXED	 postgresql failed build
3753 NOTOURBUG	 SD card filesystem errors
3755 FIXED	 D-Bus source code URL change
3757 WONTFIX	 KDrive shouldn't depend on HAL [patch]
3759 DUPLICATE	 h5400: Battery status unavailable
3761 FIXED	 2007.12 on c7x0 dies when boot into /bin/sh
3762 FIXED	 gpm-1.20.1 fails to build with >=3Dkernel-2.6.23
3764 FIXED	 bluez-utils-3.24 do_install failed
3771 FIXED	 tk fails do_configure for SharpROM
3773 FIXED	 busybox-1.9.1-r0-do_unpack
3774 FIXED	 busybox-1.9.1-r0-do_patch
3775 WONTFIX	 glibc-2.7-r0-do_compile
3777 WONTFIX	 glib-2.0-2.14.4-r2-do_configure
3778 FIXED	 busybox 1.9.1 defconfig missing options [patch]
3779 FIXED	 parsing errors regarding PV in anki_0.4.3.b
3780 WONTFIX	 linux-efika-2.6.20.20-r2-do_install
3781 FIXED	 Busybox 1.9.1 needs long options for adduser [patch]
3782 WONTFIX	 gcc-cross-4.2.2-r3-do_compile
3783 WONTFIX	 glibc-intermediate-2.6.1-r2-do_compile
3784 WONTFIX	 linux-omap1-2.6.23-omap1-r0-do_install
3786 WONTFIX	 glibc-intermediate-2.6.1-r2-do_configure
3787 DUPLICATE	 apmd-3.2.2-r10-do_compile
3788 WONTFIX	 initscripts-1.0-r105-do_install
3789 WONTFIX	 e2fsprogs-1.38-r11-do_install
3790 WONTFIX	 gtk+-2.12.3-r0-do_compile
3791 WONTFIX	 hal-0.5.9-r5-do_compile
3792 WONTFIX	 midori-0.0.15-r0-do_compile
3793 WONTFIX	 midori-0.0.17-r0-do_configure
3794 WONTFIX	 minimal-openmoko-image-1.0-r0-do_rootfs
3795 WONTFIX	 libmokogsmd2-0.1.0+svnr3663-r2-do_compile
3796 WONTFIX	 openmoko-feedreader2-0.0.1+svnr3645-r1-do_compile
3797 WONTFIX	 openmoko-browser2-0.0.1+svnr3646-r1-do_compile
3798 WONTFIX	 gumstix-kernel-2.6.21-r1-do_unpack
3799 WONTFIX	 uclibc-0.9.29-r9-do_compile
3800 WONTFIX	 uclibc-0.9.29-r9-do_install
3801 WONTFIX	 at76c503a-modules-0.17-r0-do_compile
3802 WONTFIX	 minimo-0.02+cvs20070626-r0-do_unpack
3804 WONTFIX	 gcc-cross-sdk-4.1.1-r17-do_install
3807 FIXED	 recipe for latest webkit-gtk svn
3808 WONTFIX	 midpath-gtk-0.1-r1-do_compile
3809 WONTFIX	 midpath-pulseaudio-0.1-r1-do_compile
3810 WONTFIX	 uqtreader-1.2.2opie+cvs20070601-r3-do_compile
3811 WONTFIX	 gpe-timesheet-0.32-r0-do_compile
3812 WONTFIX	 bluez-hcidump-1.38-r0-do_install
3813 WONTFIX	 tor-0.1.1.26-r0-do_install
3814 WONTFIX	 cacao-cldc-0.98-r1-do_compile
3815 WONTFIX	 enca-1.9-r3-do_configure
3816 WONTFIX	 openmoko-panel-gsm-0.1.0+svnr3664-r1-do_install
3817 WONTFIX	 gettext-0.14.1-r6-do_populate_staging
3818 WONTFIX	 quasar-0.8+0.9beta3-r0-do_configure
3819 WONTFIX	 wpa-gui-0.4.8-r1-do_configure
3820 WONTFIX	 rt73-k2wrlz-2.0.1-r0-do_compile
3821 WONTFIX	 rt2570-1.1.0-b2-r0-do_compile
3822 WONTFIX	 rt2570-k2wrlz-1.6.1-r0-do_compile
3823 WONTFIX	 djvulibre-3.5.19-r0-do_install
3824 WONTFIX	 uqtreader-1.2.2opie+cvs20070601-r3-do_configure
3827 WONTFIX	 liburiparser-0.5.1-r0-do_populate_staging
3829 WONTFIX	 cacao-cldc-0.98-r1-do_configure
3830 WONTFIX	 ntp-4.2.2p3-r1-do_install
3831 WONTFIX	 gst-plugins-good-0.10.6-r3-do_populate_staging
3832 WONTFIX	 wxwidgets-2.6.3-r0-do_install
3833 FIXED	 getting OE ready for opkg and throw out ipkg
3834 FIXED	 glibc-intermediate build failed
3835 INVALID	 gettext-native_0.14.1 fails do_configure
3836 WONTFIX	 Can't flash 2007.12-r3 to collie correctly
3837 DUPLICATE	 linux-hackndev-2.6-2.6.21-hnd3-r13-do_fetch
3838 WONTFIX	 Busybox 1.9.1 needs long options for adduser [patch] -
push to A* stable
3839 WONTFIX	 evince-2.20.0-r2-do_install
3840 WONTFIX	 gettext-0.14.1-r6-do_install
3841 WONTFIX	 mtpaint-3.02-r0-do_install
3842 WONTFIX	 irda-utils-0.9.16-r8-do_compile
3843 WONTFIX	 gst-plugins-ugly-0.10.6-r3-do_populate_staging
3844 WONTFIX	 edje-viewer-0.0.0+cvs20071206-r0-do_install
3847 FIXED	 alsa-lib fails do_compile
3850 FIXED	 ffmpeg isn't packaging all files currently
3852 FIXED	 libxcalibrate need newer xcalibrateext to compile
3855 FIXED	 lemon-native can't find template file lempar.c
3856 FIXED	 new package - re2c (and re2c-native)
3857 FIXED	 new package - netsurf
3858 WONTFIX	 gpe-login-0.91-r0-do_compile
3859 WONTFIX	 midori-0.0.17-r0-do_compile
3860 WONTFIX	 libetpan-0.52-r0-do_compile
3861 DUPLICATE	 Error compiling glibc-intermediate Please
3862 WONTFIX	 x11vnc-0.9.3-r0-do_install
3863 WONTFIX	 evince-2.20.0-r2-do_compile
3864 WONTFIX	 libxfontcache-1.0.4-r1-do_install
3865 WONTFIX	 opie-sounds-1.2.3-r0-do_install
3866 WONTFIX	 gpe-filemanager-0.30-r0-do_compile
3867 FIXED	 wlan-ng-modules-0.2.1-pre26-r2-do_fetch
3868 WONTFIX	 free42-vga-1.4.36-r1-do_compile
3869 WONTFIX	 roadmap-gtk2-1.1.0-r2-do_install
3870 WONTFIX	 vlc-gpe-0.8.4-r4-do_configure
3871 FIXED	 djvulibre-3.5.20-r1-do_fetch
3872 WONTFIX	 xserver-xorg-1.3.0.0-r4-do_compile
3873 WONTFIX	 qte-mt-static-2.3.12-r4-do_configure
3874 WONTFIX	 texinfo-4.8a-r0-do_compile
3875 WONTFIX	 binutils-2.18-r1-do_compile
3876 WONTFIX	 make-3.81-r0-do_compile
3877 WONTFIX	 coreutils-5.3.0-r2-do_compile
3878 WONTFIX	 screen-4.0.2-r2-do_compile
3881 WONTFIX	 ipkg-link-1.6+cvs20050404-r4-do_install
3882 WONTFIX	 ntpclient-2003_194-r1-do_compile
3884 WONTFIX	 hdparm-6.9-r0-do_install
3885 WONTFIX	 libxxf86dga-1.0.1-r1-do_populate_staging
3887 WONTFIX	 opie-init-1.2.2-r8-do_install
3888 WONTFIX	 libspiff-0.7.2-r0-do_populate_staging
3889 WONTFIX	 ppp-dialin-0.1-r4-do_install
3890 WONTFIX	 libxinerama-1.0.2-r3-do_populate_staging
3891 WONTFIX	 obexpush-1.0.0-r3-do_compile
3892 NOTOURBUG	 Angstrom and rx1950 no console/x11
3894 WONTFIX	 gcc-cross-sdk-4.2.2-r5-do_compile
3895 WONTFIX	 glibc-2.6.1-r2-do_package
3898 WONTFIX	 gcc-cross-4.2.2-r5-do_compile
3899 WONTFIX	 uclibc-initial-0.9.29-r9-do_populate_staging
3900 WONTFIX	 glibc-intermediate-2.6.1-r3-do_compile
3901 WONTFIX	 epiphany-2.20.1+svnr7837-r0-do_configure
3902 WONTFIX	 glibc-2.6.1-r3-do_package
3903 WONTFIX	 glibc-2.6.1-r3-do_populate_staging
3904 WONTFIX	 glibc-2.6.1-r3-do_munge
3906 FIXED	 [ts72xx] Linux 2.6.24
3907 FIXED	 Package apt-native_0.7.11
3910 WONTFIX	 initramfs-bootmenu-image-1.0-r0-do_rootfs
3911 WONTFIX	 liveramdisk-image-1.0-r0-do_rootfs
3912 WONTFIX	 altboot-console-image-1.0-r0-do_rootfs
3913 WONTFIX	 x11-office-image-1.0-r0-do_rootfs
3914 WONTFIX	 opie-image-1.0-r0-do_rootfs
3915 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r13-do_compile
3916 FIXED	 h2200 - g_ether missing in machine conf
3917 WONTFIX	 mono-1.2.6-r1-do_install
3918 WONTFIX	 gpe-mini-browser2-0.0.1+svn20080302-r0-do_configure
3919 WONTFIX	 openmoko-browser2-0.0.1+svnr3646-r1-do_configure
3921 WONTFIX	 openmoko-dialer2-0.1.0+svnr3689-r7-do_compile
3922 WONTFIX	 gcc-cross-4.2.2-r6-do_compile
3923 WONTFIX	 gcc-cross-4.2.2-r6-do_unpack
3924 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r13-do_deploy
3925 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r13-do_rm_work
3926 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r14-do_compile
3927 FIXED	 simpad kernel update to 2.6.24
3928 WONTFIX	 linux-2.6.24-r7-do_patch
3929 FIXED	 opkg-native fails to build from scratch
3930 FIXED	 Typo fix for abiword-plugins STAGING_INCDIR
3931 WONTFIX	 binutils-cross-2.18-r1-do_populate_staging
3932 WONTFIX	 webkit-gtk-0.1+svnr30749-r4-do_configure
3933 WONTFIX	 gypsy-0.0+svnr56-r0-do_configure
3935 FIXED	 Aircrack-NG fix
3937 NOTOURBUG	 Card widget is broken
3938 FIXED	 Marvel 8385 libertas driver will not wake from suspend 2.6.24
3939 FIXED	 glib-2.0-2.15.6-r2-do_configure
3940 WONTFIX	 linux-hackndev-2.6-2.6.21-hnd3-r14-do_configure
3941 WONTFIX	 libxpm-3.5.7-r0-do_compile
3942 WONTFIX	 exhibit-0.0.0+cvs20071206-r0-do_install
3943 WONTFIX	 cups-1.2.10-r3-do_compile
3944 WONTFIX	 pango-1.18.3-r0-do_compile
3945 WONTFIX	 klibc-1.5-r5-do_compile
3947 WONTFIX	 libsdl-mixer-1.2.6-r1-do_populate_staging
3948 FIXED	 glib-2.0-2.15.6-r2 - task do_configure: failed
3949 WONTFIX	 kexec-tools-1.101-r4-do_compile
3950 WONTFIX	 wxwidgets-2.6.3-r0-do_compile
3951 WONTFIX	 openmoko-mediaplayer2-0.1.0+svnr3583-r4-do_install
3953 WONTFIX	 libtool-cross-1.5.10-r9-do_configure
3954 WONTFIX	 openssl-0.9.7g-r6-do_compile
3955 WONTFIX	 wlan-ng-modules-0.2.1-pre26-r2-do_compile
3956 WONTFIX	 openmoko-calculator2-0.1.0+svnr3655-r0-do_install
3957 WONTFIX	 libeventdb-0.90-r1-do_compile
3958 FIXED	 u-boot misconfigured for AVR32 based boards
3959 WONTFIX	 avahi-0.6.22-r5-do_populate_staging
3960 WONTFIX	 opkg-0.0+svnr4142-r1-do_populate_staging
3961 FIXED	 orbit2-2.14.0-r2 build failure
3962 WONTFIX	 contacts-0.8-r1-do_compile
3963 WONTFIX	 claws-mail-3.3.0-r0-do_compile
3964 WONTFIX	 gtk+-2.12.3-r0-do_configure
3966 WONTFIX	 openmoko-browser2-0.0.1+svnr3646-r2-do_compile
3967 WONTFIX	 kismet-2007-10-R1-r5-do_patch
3968 WONTFIX	 orbit2-2.14.0-r2-do_compile
3969 FIXED	 opie image uses MACHINE_TASK_PROVIDER which defaults to task-ba=
se
3970 WONTFIX	 vim-7.0-r1-do_configure
3971 WONTFIX	 mc-4.6.1-r2-do_configure
3972 WONTFIX	 screen-4.0.2-r2-do_configure
3973 WONTFIX	 mono-1.2.6-r1-do_configure
3974 WONTFIX	 mysql-4.1.18-r3-do_configure
3975 WONTFIX	 qt4-x11-free-4.3.3-r7-do_configure
3976 WONTFIX	 libcroco-0.6.1-r2-do_compile
3977 WONTFIX	 osb-jscore-0.5.2+svnr117-r1-do_compile
3978 WONTFIX	 libidl-0.8.6-r3-do_compile
3979 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r15-do_compile
3980 WONTFIX	 makedevs-1.0.0-r5-do_compile
3981 WONTFIX	 klibc-1.5-r6-do_compile
3982 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r16-do_compile
3983 WONTFIX	 mono-1.2.6-r1-do_compile
3984 WONTFIX	 gpe-mini-browser2-0.0.1+svn20080308-r0-do_configure
3985 FIXED	 speech-dispatcher-0.6.5-r7-do_configure
3986 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r17-do_compile
3987 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r18-do_compile
3988 FIXED	 pth-2.0.2-r0 does not compile
3989 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-r18-do_patch
3990 WONTFIX	 SanDisk ConnectPlus not working correctly
3991 INVALID	 akita prism CF broken in 2.6.24
3992 WONTFIX	 libtool-cross-1.5.10-r10-do_configure
3993 WONTFIX	 bluez-gnome-0.24-r1-do_compile
3994 WONTFIX	 avahi-0.6.22-r5-do_configure
3995 WONTFIX	 eds-dbus-1.4.0+svnr659-r7-do_compile
3996 WONTFIX	 shared-mime-info-0.22-r1-do_compile
3997 WONTFIX	 gnumeric-1.6.3-r1-do_compile
3998 WONTFIX	 eds-dbus-1.4.0+svnr659-r7-do_install
3999 WONTFIX	 matchbox-panel-2-0.1+svnr1626-r8-do_compile
4000 WONTFIX	 failme-1.0-autobuild
4001 WORKSFORME	 Midori fails to build due to missing libstdc++.so.6
4004 WONTFIX	 gumstix-kernel-2.6.21-autobuild
4005 WONTFIX	 gcc-cross-4.2.2-autobuild
4008 WONTFIX	 e2fsprogs-1.38-autobuild
4009 WORKSFORME	 ncurses-5.4-autobuild
4010 FIXED	 midpath-gtk-0.1-autobuild
4011 FIXED	 midpath-pulseaudio-0.1-autobuild
4012 WONTFIX	 uclibc-0.9.29-autobuild
4013 WONTFIX	 ffmpeg-0.4.9-pre1-autobuild
4014 WONTFIX	 gnome-mplayer-0.5.3+cvs20080101-autobuild
4015 DUPLICATE	 dsniff-2.3-autobuild
4016 WONTFIX	 driftnet-0.1.6-autobuild
4017 WONTFIX	 nmap-4.20-autobuild
4018 WONTFIX	 uqtreader-1.2.2opie+cvs20070601-autobuild
4019 WONTFIX	 exiv2-0.15-autobuild
4020 FIXED	 rsync tarball URL changed.
4021 WONTFIX	 glibc-intermediate-2.6.1-autobuild
4022 WONTFIX	 libsdl-net-1.2.7-autobuild
4023 WONTFIX	 mono-1.2.5.1-autobuild
4024 WONTFIX	 cacao-cldc-0.98-autobuild
4025 INVALID	 pulseaudio-0.9.6-autobuild
4026 WONTFIX	 minimo-0.02+cvs20070626-autobuild
4027 WONTFIX	 enca-1.9-autobuild
4028 DUPLICATE	 scummvm-0.9.1-autobuild
4029 WONTFIX	 rdesktop-1.5.0-autobuild
4030 FIXED	 openmoko-panel-gsm-0.1.0+svnr3664-autobuild
4031 WONTFIX	 directfb-1.1.0-autobuild
4032 WONTFIX	 libsidplay-1.36.59-autobuild
4033 WONTFIX	 rt73-k2wrlz-2.0.1-autobuild
4034 WONTFIX	 rt2570-1.1.0-b2-autobuild
4035 WONTFIX	 rt2570-k2wrlz-1.6.1-autobuild
4036 WONTFIX	 evince-2.20.0-autobuild
4037 WONTFIX	 kexec-tools-1.101-autobuild
4038 FIXED	 wxwidgets-2.6.3-autobuild
4039 WONTFIX	 apex-env-1.5.13-autobuild
4040 WONTFIX	 apache2-2.2.3-autobuild
4041 WONTFIX	 mplayer-0.0+1.0rc2-autobuild
4042 WONTFIX	 openmoko-dates2-0.1.0+svnr673-autobuild
4043 WONTFIX	 gst-plugins-bad-0.10.5-autobuild
4044 FIXED	 wlan-ng-modules-0.2.1-pre26-autobuild
4045 WONTFIX	 libsdl-mixer-1.2.6-autobuild
4046 WONTFIX	 gtk+-2.12.3-autobuild
4047 WONTFIX	 exhibit-0.0.0+cvs20071206-autobuild
4048 FIXED	 libeventdb-0.90-autobuild
4049 WONTFIX	 libtool-cross-1.5.10-autobuild
4050 WONTFIX	 dfu-util-0.1+svnr2866-autobuild
4051 FIXED	 The Fn and shift keys don't work in Opie-image on Poodle (SL-56=
00)
4052 FIXED	 wlan-ng-modules-0.2.8+svn20071030-autobuild
4053 WONTFIX	 busybox-static-1.2.1-autobuild
4054 WONTFIX	 klibc-1.5-autobuild
4055 WONTFIX	 libgpelaunch-0.14-autobuild
4057 WONTFIX	 linux-handhelds-2.6-2.6.21-hh20-autobuild
4058 FIXED	 gpe-su-0.19-autobuild
4059 FIXED	 db-native_4.3.29 fetch failure
4060 WONTFIX	 libdisplaymigration-0.99-autobuild
4061 FIXED	 gnome-vfs 2.22.0 recipe
4063 WONTFIX	 qte-mt-2.3.10-autobuild
4064 DUPLICATE	 Angstrom freeze on boot of Simpad SL4
4066 WONTFIX	 uclibc-initial-0.9.28-autobuild
4067 WONTFIX	 openmoko-contacts2-0.1.0+svnr387-autobuild
4068 FIXED	 sudo-1.6.8p12-autobuild
4069 FIXED	 linux-2.6.24-autobuild
4070 FIXED	 popt-1.7 unfetchable
4073 INVALID	 altboot-console-image-1.0-autobuild
4074 DUPLICATE	 linux-hackndev-2.6-2.6.21-hnd3-autobuild
4075 INVALID	 base-image-1.0-autobuild
4076 INVALID	 minimal-gpe-image-1.0-autobuild
4077 INVALID	 x11-image-1.0-autobuild
4078 INVALID	 opie-image-1.0-autobuild
4079 WONTFIX	 synergy-1.3.1-autobuild
4080 FIXED	 php-5.2.0-r2 does not build on Gentoo
4081 FIXED	 iptables_1.3.8 fails to compile on eglibc cvs
4082 WONTFIX	 ipkg-0.99.163-autobuild
4083 INVALID	 openmoko-messages2-0.1.0+svnr3868-autobuild
4084 FIXED	 Simpad - Angstrom 2007.12 R10 hangs with soft lockup - hwclock
4085 WONTFIX	 libmikmod-3.2.0-beta2-autobuild
4087 WONTFIX	 bluez-gnome_0.24.bb fails to build
4088 DUPLICATE=09
linux-beagleboard-2.6.x+git7dc52e0ee406b0e5f0759472f3638105ae0a23ab-autobui=
ld
4089 DUPLICATE=09
linux-beagleboard-2.6.x+git0+1a77f70604e00b94bb3c841665a44b34430e9eda-autob=
uild
4090 DUPLICATE=09
linux-beagleboard-2.6.x+git1a77f70604e00b94bb3c841665a44b34430e9eda-autobui=
ld
4091 WONTFIX	 linux-beagleboard-2.6.x+git2+1a77f70604e00b94bb3c841665a44b34=
430e9eda-autobuild
4092 WONTFIX	 linux-beagleboard-2.6.23+2.6.24rc3-git1a77f70604e00b94bb3c841=
665a44b34430e9eda-autobuild
4093 WONTFIX	 mono-native-1.2.5.1-autobuild
4094 FIXED	 SIMpad Kernel 2.6.24 update: rtc and connectplus patches
4095 FIXED	 gpephone/libiac_svn.bb do_fetch error
4096 FIXED	 autobuilder image contains 2.6.21 and 2.6.24 kernel images
4097 WONTFIX	 mono-1.2.6-autobuild
4098 WONTFIX	 qt4-x11-free-4.3.3-autobuild
4099 WONTFIX	 webkit-gtk-0.1+svnr28656-autobuild
4102 WONTFIX	 sdcc-native-2.5.0-autobuild
4103 WONTFIX	 epdf-0.1.0+cvs20071206-autobuild
4104 WONTFIX	 openmoko-dialer2-0.1.0+svnr3902-autobuild
4105 WONTFIX	 libconic-0.13-autobuild
4106 FIXED	 pulseaudio 0.9.9 does not build with uclibc (with patch proposa=
l)
4107 WONTFIX	 apex-nslu2-16mb-1.5.8-autobuild
4108 FIXED	 wlan-ng-modules-0.2.7-autobuild
4109 WONTFIX	 linux-rp-2.6.20-autobuild
4110 WONTFIX	 xserver-kdrive-xomap fails to compile
4111 WONTFIX	 SpanDSP VOIP recipe update for v0.0.4pre16
4113 REMIND	 Callweaver VOIP PBX package recipes and files
4114 WORKSFORME	 gettext-0.14.1-autobuild
4115 DUPLICATE	 linux-rp-2.6.24-autobuild
4116 FIXED	 Epiphany doesn't build
4117 WONTFIX	 gst-plugins-ugly-0.10.6-autobuild
4118 DUPLICATE	 udev-118 failed to create device nodes on Tosa
4120 WONTFIX	 inetutils-1.4.2-autobuild
4122 WONTFIX	 e-wm-0.16.999.041-autobuild
4124 WONTFIX	 apmd-3.2.2-autobuild
4126 WONTFIX	 openmoko-image-1.0-autobuild
4127 FIXED	 cacao-initial-0.98-autobuild
4128 WONTFIX	 djvulibre-3.5.19-autobuild
4129 FIXED	 gnuplot-4.2.0-autobuild
4131 REMIND	 gtk+-directfb broken depends?
4132 FIXED	 tzdata-dbg provides tzdata (fixed in .dev
4133 FIXED	 gtk (from python-pygtk) can't be imported from Python
4134 WONTFIX	 embryo-native-0.9.1.042+cvs20080330-autobuild
4135 WONTFIX	 claws-mail-3.3.0-autobuild
4137 NOTOURBUG	 ipkg: pre/post control files not removed
(remove_obsolete_maintainer_scripts)
4138 WONTFIX	 midori-0.0.17-autobuild
4139 WONTFIX	 dbench-3.04-autobuild
4140 WONTFIX	 abiword-plugins-2.5.2-autobuild
4141 WONTFIX	 abiword-plugins-2.6.0-autobuild
4143 FIXED	 fakeroot 1.9.1 missing
4144 FIXED	 python-core config Makefile includes ccache reference
4145 NOTOURBUG	 opkg: package installed/configured BEFORE its dependencies
4146 FIXED	 Distro generic-uclibc references a non-existant package
libintl for virtual/libintl
4147 INVALID	 avahi-autoipd / udhcpd interaction
4149 FIXED	 libmad for AVR32 fails with layer3.c:2359: error: can't
find a register in class 'GENERAL_REGS' while reloading 'asm'
4150 FIXED	 avahi-daemon needs user 'avahi'
4151 FIXED	 dbus needs user 'messagebus'
4154 FIXED	 CDPATH affects base.bbclass
4155 INVALID	 agere prism cf card not working on akita
4156 FIXED	 bison-native fails on do_qa_staging
4157 WONTFIX	 goffice-0.6.2-autobuild
4158 FIXED	 kernel-module-wlags49-h[1/2]-cs do_fetch fails
4159 FIXED	 libtomcrypt URL changes
4160 DUPLICATE	 flac-1.1.2-autobuild
4161 WONTFIX	 gnome-doc-utils-0.12.0-autobuild
4162 REMIND	 zaurus-updater do_deploy fails to run in .stable
4163 WONTFIX	 boost-1.33.1-autobuild
4164 WONTFIX	 cppunit-1.10.2-autobuild
4165 WONTFIX	 mtpaint-3.02-autobuild
4166 WONTFIX	 groff-1.19.2-autobuild
4167 WONTFIX	 fftwf-3.1.2-autobuild
4168 FIXED	 Value of Pi Defined Wrong in SlCalc
4169 WONTFIX	 qt-x11-free-3.3.7-autobuild
4170 WONTFIX	 jack-0.103.0-autobuild
4172 FIXED	 rox-filer-2.5-autobuild
4173 WONTFIX	 jikes-initial-1.0-autobuild
4174 FIXED	 lib-sdl-qpe cannot be build
4175 WONTFIX	 openmoko-dialer2-0.1.0+svnr3689-autobuild
4176 WONTFIX	 Patch for Ruby 1.8.5 to compile with sockets
4177 WONTFIX	 busybox-1.9.1-autobuild
4181 FIXED	 PATCH building xserver-kdrive-1.4.0.90 without XKB defined
4183 WONTFIX	 Build file for Spook - a webcam monitoring program
4184 WORKSFORME	 edje_cc-native segfaults while building emotion
4186 FIXED	 dbus-native-1.2.1 fails during patching
4188 FIXED	 Parallel compiling breaks firefox 2.0.0.3 do_compile
4190 FIXED	 firefox failed to find headers when compiling host_xpidl
4191 FIXED	 c7x0 opie install to flash fails
4192 WONTFIX	 avahi-0.6.22 fails to build
4193 FIXED	 baking two images at the same time fails
4195 FIXED	 diffutils_2.8.1.bb does not build on linux-uclibcgnueabi
4196 FIXED	 make 3.81 fails to compile on uclibc
4197 FIXED	 Add a new image minimal-native-sdk-image.bb
4198 FIXED	 scp results in 0 byte files on uclibc EABI targets
4201 FIXED	 firefox 2.0.0.3 - compile problem glib/libIDL issue
4202 WONTFIX	 Collie Altboot startup fails
4287 WONTFIX	 uclibc-0.9.29+svnr21926-autobuild
4288 FIXED	 glibc-intermediate-2.6.1-autobuild
4289 WONTFIX	 uclibc-initial-0.9.28-autobuild
4290 WORKSFORME	 apex-env-1.5.13-autobuild
4291 WONTFIX	 madwifi-ng-r3314-20080131-autobuild
4292 DUPLICATE	 Akita: no clicking on touchscreen possible
4293 WORKSFORME	 apmd-3.2.2-autobuild
4294 FIXED	 linux-rp-2.6.24 fails do_compile for tosa
4295 WONTFIX	 dsplink-1.50-autobuild
4296 WORKSFORME	 apex-nslu2-16mb-1.5.13-autobuild
4297 WONTFIX	 gcc-cross-4.2.1+csl-arm-2007q3-53-autobuild
4298 FIXED	 kexec-tools-static-1.101-autobuild
4299 WORKSFORME	 avahi-0.6.22-autobuild
4300 WORKSFORME	 jpeg-6b-autobuild
4301 WONTFIX	 klibc-1.5-autobuild
4305 FIXED	 eglibc-initial-2.8+svnr6229-autobuild
4306 WONTFIX	 uclibc-0.9.28-autobuild
4311 WONTFIX	 dsplink-1.50+kernel2.6.25-davinci1-autobuild
4315 WONTFIX	 dsplink-1.50+kernel2.6.24-omap1-autobuild
4323 FIXED	 glibc build error
4358 INVALID	 gcc-cross-4.1.1-autobuild
4359 INVALID	 glibc-2.6.1-autobuild
4361 WORKSFORME	 libtool-cross-2.2.4-autobuild
4382 FIXED	 qtopia-core-gui-image.bb' failed
4383 DUPLICATE	 Konqueror-embedded build fail with opie-image
4388 FIXED	 -march=3Dk6-2: fnstsw broken in binutils 2.18.50.0.7
(triggered by glibc-intermediate 2.6.1)
4413 WORKSFORME	 gmp-native-4.2.2-autobuild
4414 WORKSFORME	 binutils-cross-2.18.50.0.7-autobuild
4415 WORKSFORME	 gcc-native-3.4.6-autobuild
4416 WONTFIX	 qtopia-core-4.3.3-autobuild
4417 WORKSFORME	 glib-2.0-2.16.3-autobuild
4418 WORKSFORME	 qt-embedded-4.4.0-autobuild
4420 WONTFIX	 meta-toolchain-neuros-1.0-autobuild
4422 WORKSFORME=09
omapfbplay-0.0+r0+gitr980e6e293f380ec038643c2110aec34f0b96697d-autobuild
4423 WORKSFORME=09
linux-omap2-2.6.25+2.6.26-rc9+r41+git7786cd7a00ae0b18923185789380a88052f4ee=
e7-autobuild
4426 FIXED	 Security Vulnerabilities in Bind {8
4448 INVALID	 Xfbdev not working on htckaiser
4456 FIXED	 DNS Cache Poisoning Bug
4477 WORKSFORME	 libusb1-0.9.2-autobuild
4480 WONTFIX	 x-load-1.41+r6+git04ad40d5c8bca196aa4a5dfe945a007e21f1b149-au=
tobuild
4484 WONTFIX	 firefox-3.0.1-autobuild
4561 FIXED	 Pidgin 2.5.0 missing python dependency
4601 WONTFIX	 shasum-native-1.0-autobuild
4604 WONTFIX	 osb-jscore-0.5.2+svnr117-autobuild
4605 WONTFIX	 minimo-0.02+cvs20070626-autobuild
4606 WONTFIX	 apache2-native-2.2.3-autobuild
4608 WONTFIX	 gpe-sketchbook-0.2.9-autobuild
4609 WONTFIX	 notecase-1.7.2-autobuild
4610 WONTFIX	 irssi-0.8.10-autobuild
4611 FIXED	 gpsd-2.37-autobuild
4612 WONTFIX	 liburi-perl-1.35-autobuild
4613 WONTFIX	 totem-2.23.4-autobuild
4614 WONTFIX	 quasar-0.8+0.9beta3-autobuild
4615 WONTFIX	 vlc-gpe-0.8.4-autobuild
4616 WONTFIX	 gnome-mplayer-0.5.3+cvs20080101-autobuild
4617 WONTFIX	 kismet-2007-10-R1-autobuild
4618 WONTFIX	 scummvm-0.12.0-autobuild
4619 WONTFIX	 ctorrent-3.3.1-autobuild
4620 FIXED	 asterisk-1.4.19.1-autobuild
4621 WONTFIX	 gnuradio-3.1.3-autobuild
4622 WONTFIX	 gtkimageview-1.3.0-autobuild
4623 WONTFIX	 xf86-video-ati-6.6.193-autobuild
4625 WONTFIX	 openmoko-terminal2-3.0.0+svnr4039-autobuild
4627 WONTFIX	 bonnie++-1.03c-autobuild
4628 WONTFIX	 packagekit-0.2.3+gitr813fa8cfb139246cf180d52895b52b28616ae2f5=
-autobuild
4629 WONTFIX	 libspiff-0.8.2-autobuild
4631 WONTFIX	 mono-1.2.6-autobuild
4632 WONTFIX	 webkit-gtk-0.1+svnr36540-autobuild
4633 WONTFIX	 firefox-3.0.1+3.1a2-autobuild
4634 WONTFIX	 fennec-0.8+0.9pre-autobuild
4635 FIXED	 nfs-utils-1.1.2-autobuild
4636 WONTFIX	 apache2-2.2.3-autobuild
4637 WONTFIX	 roadmap-gtk2-1.1.0-autobuild
4638 WONTFIX	 gst-ffmpeg-0.10.4-autobuild
4639 WONTFIX	 rdesktop-1.6.0-autobuild
4640 WONTFIX	 xf86-video-vesa-1.3.0-autobuild
4641 WONTFIX	 qte-mt-2.3.10-autobuild
4642 WONTFIX	 enca-1.9-autobuild
4643 WONTFIX	 guile-1.8.5-autobuild
4644 WONTFIX	 opencv-1.0.0-autobuild
4645 WONTFIX	 classpath-native-0.97.2-autobuild
4646 WONTFIX	 qt4-x11-free-4.4.1-autobuild
4647 WONTFIX	 enchant-1.3.0-autobuild
4649 WONTFIX	 libusb-0.1.12-autobuild
4650 WONTFIX	 libwww-perl-5.808-autobuild
4651 WONTFIX	 imagemagick-6.4.4-1-autobuild
4652 WONTFIX	 libgnomeprintui-2.18.3-autobuild
4653 WONTFIX	 evince-2.23.4-autobuild
4654 WONTFIX	 libsidplay-1.36.59-autobuild
4655 WONTFIX	 zhone-0.0.0+r9-gitr11392b1d2ee3a0622dc324e1805699e4301249c4-a=
utobuild
4656 WONTFIX	 lirc-modules-0.8.3+cvs20080713-autobuild
4657 WONTFIX	 ioquake3-1.34+svnr1470-autobuild
4658 WONTFIX	 quake2-0.16.1+svnr205-autobuild
4662 WONTFIX	 libnids-1.18-autobuild
4663 WONTFIX	 libxine-fb-1.0-autobuild
4665 WONTFIX	 madwifi-ng-r3837-20080802-autobuild
4666 WONTFIX	 exiv2-0.15-autobuild
4667 WONTFIX	 cacao-0.99.3-autobuild
4670 WONTFIX	 mplayer-0.0+1.0rc2-autobuild
4673 WONTFIX	 gettext-native-0.17-autobuild
4674 WONTFIX	 e2fsprogs-libs-1.41.2-autobuild
4675 WONTFIX	 agg-2.5-autobuild
4676 WONTFIX	 navit-0.0.4-autobuild
4677 WONTFIX	 speech-dispatcher-0.6.6-autobuild
4678 WONTFIX	 gst-plugins-good-0.10.7-autobuild
4679 WONTFIX	 libetpan-0.52-autobuild
4680 WONTFIX	 konqueror-embedded-20070316-autobuild
4681 WONTFIX	 ubahnnav-0.4.1-autobuild
4682 WONTFIX	 zuc-1.1.2ern-autobuild
4683 WONTFIX	 zauralign-1.0.2-autobuild
4684 WONTFIX	 uucp-1.07-autobuild
4685 WONTFIX	 gst-plugins-ugly-0.10.7-autobuild
4689 WONTFIX	 gnuplot-4.2.3-autobuild
4690 WONTFIX	 obexftp-0.22-autobuild
4691 WONTFIX	 libmodplug-0.8-autobuild
4692 WONTFIX	 multitap-pad-0.0+svnr373-autobuild
4693 WONTFIX	 bash-3.2-autobuild
4694 WONTFIX	 openmoko-appmanager2-0.1.0+svnr4530-autobuild
4695 WONTFIX	 openmoko-tasks2-0.1.0+svnr399-autobuild
4696 WONTFIX	 gnome-panel-2.24.0-autobuild
4697 WONTFIX	 gst-plugins-bad-0.10.6-autobuild
4698 WONTFIX	 goffice-0.6.3-autobuild
4700 WONTFIX	 gpgme-1.1.4-autobuild
4701 WONTFIX	 liburiparser-0.5.1-autobuild
4702 WONTFIX	 libxxf86dga-1.0.2-autobuild
4703 WONTFIX	 mythtv-0.21-autobuild
4705 WONTFIX	 recode-3.6-autobuild
4706 WONTFIX	 recode-native-3.6-autobuild
4729 WONTFIX	 gpe-mini-browser-0.21-autobuild
4730 WONTFIX	 gtk+-1.2-1.2.10-autobuild
4733 FIXED	 gdb-6.8-autobuild
4734 WONTFIX	 hal-0.5.11-autobuild
4736 WONTFIX	 sword-1.5.10-autobuild
4737 WONTFIX	 libtelepathy-0.3.3-autobuild
4738 WONTFIX	 python-numpy-1.1.1-autobuild
4739 WONTFIX	 vlc-0.9.2-autobuild
4741 WONTFIX	 gnome-desktop-2.24.0-autobuild
4742 WONTFIX	 t1lib-5.0.2-autobuild
4744 WONTFIX	 xserver-kdrive-xomap-1.1.99.3-autobuild
4751 WONTFIX	 opkg-0.1.4+svnr4640-autobuild
4754 WONTFIX	 fennec-0.9+1.0a1-autobuild
4756 WONTFIX	 gdal-1.5.2-autobuild
4767 WONTFIX	 opkg-nogpg-0.1.4+svnr4640-autobuild
4769 WONTFIX	 gcc-cross-initial-4.3.1-autobuild
4770 WONTFIX	 vlc-0.9.4-autobuild
4771 WONTFIX	 libgsm-1.0.10-autobuild
4773 WONTFIX	 Apache2 failed to build
4775 WONTFIX	 sylpheed-2.2.9-autobuild
4776 WONTFIX	 icu-3.6-autobuild
4777 WONTFIX	 libx11-native-1.1.1-autobuild
4778 WONTFIX	 empathy-2.24.0-autobuild
4779 WONTFIX	 exo-0.3.4-autobuild
4780 WONTFIX	 findutils-4.2.29-autobuild
4781 WONTFIX	 gimp-2.6.0-autobuild
4785 WONTFIX	 nmap-3.81-autobuild
4786 WONTFIX	 xfce4-mixer-4.4.2-autobuild
4793 WONTFIX	 openmoko-browser2-0.0.1+svnr4172-autobuild
4794 WONTFIX	 python-pyxdg-0.15-autobuild
4795 WONTFIX	 libowl-0.0+svnr277-autobuild
4796 WONTFIX	 emotion-0.1.0+svnr36540-autobuild
4800 FIXED	 tichy is missing python-pygame dependency
4801 WONTFIX	 aspell-0.60.6-autobuild
4803 WONTFIX	 libxkbfile-1.0.4-autobuild
4806 WONTFIX	 ffmpeg-0.4.9+r35+gitrafb98868e19e63cbca6c9f0ed9e6cfa48d40277d=
-autobuild
4807 WONTFIX	 libxfce4util-4.4.2-autobuild
4809 WONTFIX	 portmap-6.0-autobuild
4810 WONTFIX	 mpeg2dec-0.4.0b-autobuild
4811 WONTFIX	 directfb-1.2.3-autobuild
4812 WONTFIX	 wpa-supplicant-0.5.10-autobuild
4813 WONTFIX	 gamin-0.1.8-autobuild
4815 WONTFIX	 wireless-tools-29-autobuild
4816 WONTFIX	 keylaunch-conf-2.0.10-autobuild
4817 WONTFIX	 linux-omap-2.6.27+2.6.28-rc3+r1+gitrf7429fd378a29cf6947c2613e=
0fd6e6e36165167-autobuild
4818 WONTFIX	 mtd-utils-native-1.0.0+git-autobuild
4819 WONTFIX	 xf86-input-tslib-0.0.5-autobuild
4820 WONTFIX	 opkg-native-0.1.4+svnr4755-autobuild
4821 WONTFIX	 beagleboard-demo-image-1.0-autobuild
4823 WONTFIX	 gail-1.20.0-autobuild
4824 WONTFIX	 gnome-keyring-2.20.0-autobuild
4825 WONTFIX	 libgtop-2.24.0-autobuild
4826 WONTFIX	 qt-x11-free-3.3.7-autobuild
4830 WONTFIX	 neon-0.25.5-autobuild
4831 FIXED	 vpnc-0.5.1-autobuild
4836 WONTFIX	 madplay-0.15.2b-autobuild
4837 WONTFIX	 dfu-util-0.1+svnr4160-autobuild
4838 WONTFIX	 viking-0.9.6-autobuild
4839 WONTFIX	 wpa-gui-0.6.4-autobuild
4842 WONTFIX	 sylpheed-2.5.0-autobuild
4844 WONTFIX	 apr-1.2.12-autobuild
4845 WONTFIX	 libhildonfm-1.9.46-autobuild
4848 WONTFIX	 firefox-3.0.4-autobuild
4849 FIXED	 git-1.6.0.4-autobuild
4850 WONTFIX	 xserver-xorg-1.5.3-autobuild
4851 WONTFIX	 libosso-2.13-autobuild
4852 WONTFIX	 libxt-1.0.5-autobuild
4855 WONTFIX	 libtorrent-0.12.3-autobuild
4856 WONTFIX	 xapian-core-1.0.7-autobuild
4862 WONTFIX	 ffmpeg-0.4.9-pre1-autobuild
4863 WONTFIX	 exhibit-0.1.1+svnr37395-autobuild
4865 WONTFIX	 moko-gtk-engine-0.1.0+svnr4734-autobuild
4866 WONTFIX	 vte-0.16.13-autobuild
4867 WONTFIX	 gst-plugin-pulse-0.9.7-autobuild
4868 WONTFIX	 ooo-build-2.4.1.5-autobuild
4869 WONTFIX	 libpam-1.0.2-autobuild
4870 WONTFIX	 libmailwrapper-1.2.4-autobuild
4875 WONTFIX	 claws-plugin-rssyl-0.18-autobuild
4876 WONTFIX	 claws-plugin-mailmbox-1.14-autobuild
4879 WONTFIX	 edbus-0.5.0.043+svnr37395-autobuild
4880 WONTFIX	 numptyphysics-0.2+svnr109-autobuild
4881 WONTFIX	 starling-0.2+svnr9574-autobuild
4882 WONTFIX	 angstrom-version-2008.1-test-20081129-autobuild
4883 WONTFIX	 gnuplot-4.2.4-autobuild
4884 WONTFIX	 gspcav1-20071224-autobuild
4885 WONTFIX	 jack-0.103.0-autobuild
4887 WONTFIX	 octave-3.0.3-autobuild
4888 WONTFIX	 opencv-1.0.0+cvs20081115-autobuild
4889 WONTFIX	 povray-3.6.1+3.7.0-beta25b-autobuild
4890 WONTFIX	 vlc-0.9.6-autobuild
4892 WONTFIX	 epiphany-2.24.0-autobuild
4893 WONTFIX	 gcc-cross-sdk-4.2.4-autobuild
4895 WONTFIX	 cppunit-1.10.2-autobuild
4898 WONTFIX	 openssh-4.6p1-autobuild
4899 WONTFIX	 sugar-presence-service-0.82.2-autobuild
4900 WONTFIX	 efreet-0.5.0.043+svnr37395-autobuild
4901 WONTFIX	 osso-gnome-vfs2-2.16.3-autobuild
4902 WONTFIX	 epsilon-0.3.0.012+svnr37395-autobuild
4909 WONTFIX	 libhildon-1.99.0-autobuild
4910 WONTFIX	 thunar-0.9.0-autobuild
4912 WONTFIX	 xfdesktop-4.4.2-autobuild
4919 WONTFIX	 artoolkit-2.72.1-autobuild
4923 WONTFIX	 boost-1.33.1-autobuild
4924 WONTFIX	 sugar-toolkit-0.82.11-autobuild
4925 WONTFIX	 flac-1.1.2-autobuild
4926 WONTFIX	 xinit-1.1.0-autobuild
4927 WONTFIX	 libfakekey-0.2+svnr1455-autobuild
4928 WONTFIX	 openmoko-today2-0.1.0+svnr4168-autobuild
4929 WONTFIX	 matchbox-panel-2-0.1+svnr1626-autobuild
4930 WONTFIX	 dropbear-0.51-autobuild
4931 WONTFIX	 xmodmap-1.0.3-autobuild
4932 WONTFIX	 openmoko-icon-theme-standard2-0.1.0+svnr4232-autobuild
4933 WONTFIX	 opie-mailapplet-1.2.4-autobuild
4934 WONTFIX	 neod-0.1.0+svnr4617-autobuild
4940 WONTFIX	 ffmpeg-0.4.9+r36+gitr48b4495cdae4a4bc2bc65902f3214c1b084be01d=
-autobuild
4941 WONTFIX	 gdm-2.24.1-autobuild
5047 INVALID	 compiling bluez problem
5123 FIXED	 meta-toolchain-gpe-1.0-autobuild
5124 INVALID	 package-index-1.0-autobuild
5125 FIXED	 lowpan-tools-git-autobuild
5126 FIXED	 util-linux-ng-2.15-autobuild
5127 FIXED	 u-boot-2009.01-autobuild
5131 FIXED	 linux-kexecboot-2.6.24-autobuild
5132 WORKSFORME	 zaurusd-0.0+svn20090501-autobuild
5352 FIXED	 xf86bigfontproto-1.2.0-autobuild failed due to util-macros too =
low
5353 FIXED	 xcmiscproto-1.2.0-autobuild
5354 INVALID	 ltrace-0.5.3-autobuild
5355 REMIND	 eglibc-2.10-autobuild
5356 REMIND	 gcc-cross-4.4.2-autobuild
5357 REMIND	 gcc-cross-intermediate-4.4.2-autobuild
5358 INVALID	 uclibc-initial-0.9.30.1-autobuild
442 FIXED	 recipe for parted 1.6.25
1832 FIXED	 directfb_0.9.99+1.0.0rc2.bb SRC_URI is no longer valid
37 DUPLICATE	 glibc fails to compile if gcc was built with EABI support
43 FIXED	 libc.so script generated broken
47 FIXED	 busybox: celf-ash-builtins.patch breaks collie
53 DUPLICATE	 arm eabi not supported by current version of glibc
1140 FIXED	 glibc binary locale generation: no UTF-8 locales generated
1793 FIXED	 rx3000 support in blueprobe
1655 WONTFIX	 Removing detect-stylus from tslib and some opie stufs
1722 WORKSFORME	 Detect-stylus and some other stuff (HTC Universal )
2050 FIXED	 libopie2 QA pass notes
1739 FIXED	 strace does not build for mipsel
3138 FIXED	 makeinfo confused by too many params
3460 FIXED	 x11-image does not build with ANGSTROM_MODE=3Deglibc
4065 FIXED	 uclibc-initial-0.9.28 fails to build
4428 FIXED	 gcc-cross-sdk 4.3.1 fails to compile
890 FIXED	 zaurusd option to turn off backlight vs suspend
564 FIXED	 damn bitbake moved over to arm-linux-gcc 4.0
2523 FIXED	 OE needs a native java package
2729 FIXED	 java package midpath wrongly assigned RPROVIDES
3457 DUPLICATE	 provide a java5-capable compiler to compile native
classpath and JVM
3511 FIXED	 complete
2899 WONTFIX	 Fixup autotools.bbclass for samba-3.0.25c
2900 WONTFIX	 samba-3.0.25c support
940 FIXED	 (.dev) gstreamer 0.10.x fails to compile due to strange
naming of plugin bbfiles
2685 FIXED	 Screen Rotator GPE applet does not rotate from landscape to por=
trait
3531 FIXED	 roadmap-gtk2 - 1.0.12+cvs20071223-r1 doesn't install binaries
739 LATER	 Neon should be updated to 0.25.5
4221 FIXED	 bugzilla keyword search is b0rked
5302 WORKSFORME	 task links are missing
4914 FIXED	 atftp SRC_URI changed
4998 FIXED	 Connman fails to compile
4246 FIXED	 openmoko image won't boot on machine htckaiser
4903 FIXED	 openmoko-icon-theme-standard2_svn.bb do_package_write_ipk faile=
s
1356 FIXED	 new ja.po files are ready for some gpe-* packages
5346 FIXED	 QT 4.6.0 issues (ld segfault)
4832 FIXED	 new bb recipe: xboard_4.2.7
5108 FIXED	 please truncate version to about 10 characters
5113 FIXED	 include timezone information
5366 FIXED	 please replace references to openembedded.net with .org
5369 FIXED	 slash in builder name seems to give oestats problems?
5117 FIXED	 kergoth_sanity.bbclass
4906 FIXED	 python-etk lacks dependency on eina
4992 FIXED	 python-etk failes to build
5307 FIXED	 mesa 7.2 fails on do_install
4350 FIXED	 x11-image gives weird error at END of bitbake
4 LATER	 Problems showing international symbols
138 FIXED	 update dropbear to version 0.46
204 FIXED	 gcc-csl-3.4.4 compiler has seems to have bugs compared to gcc-3.=
4.4
209 FIXED	 TTY Keyboard handling problems in Qt/Embedded
212 FIXED	 QPDF2 Viewer hangs on startup on Spitz
225 FIXED	 edje_cc (part of edje-native) gets miscompiled
227 WORKSFORME	 linux kenrel 2.6.13-rc5-mmc1 problem with sync-connection
273 FIXED	 Updated gaim recipes
351 FIXED	 Orinoco modules in zaurus-clamshell-2.6.conf
378 FIXED	 Integrate working EABI toolchain
430 WONTFIX	 patch to run fltklib with diet-x11
482 WONTFIX	 pretec bluetooth card not recognized
522 DUPLICATE	 linux-openzaurus build fails because kernel is too big
528 FIXED	 OZ 3.5.4-RC opie bluetooth pin not working
537 INVALID	 ntpdate fails in OZ 3.5.4-RC on tosa
544 FIXED	 [OZ3.5.4-RC] netkit-base postinst script error
549 WONTFIX	 [OZ 3.5.4RC
586 FIXED	 add btsco as alsa bluetooth tool to enable bt headset support
761 WONTFIX	 OZ3.5.4.1-alpha1 akita-gpe : ln: /etc/resolv.conf: File exists
762 WONTFIX	 OZ3.5.4.1-alpha1 akita-gpe : weird halt / reboot behaviour
843 FIXED	 QPObox Japanese IME: patch to enable build
877 WONTFIX	 qplot segfaulting on OZ-alpha2
884 FIXED	 Please add the FUSE kernel module and userspace apps to org.oe.o=
z354x
1070 FIXED	 qte-font-unifont-160 and qpf-unifont-160 need to conflict
1177 FIXED	 libxine fails to build
1193 FIXED	 altboot looking for config file
1273 FIXED	 strace fails on arm patforms with syscall: unknown syscall trap
1297 FIXED	 xmms no icon
1312 FIXED	 Build of libvncserver failed
1313 INVALID	 British keymap wrong or missing under OZ/GPE 3.5.4.1 spitz
1426 FIXED	 Patch to add support for gdb-cross_6.4
1451 FIXED	 libxres-1.0.1 configure fails (autoreconf)
1452 FIXED	 fakeroot has runtime dependency on getopt; where is getopt?
1471 FIXED	 ldd and ldconfig are missing from libc6 package
1496 WONTFIX	 Opie screen lock security issues in OZ
1520 FIXED	 gpe-info (of gpe-conf package) segfaults on start in Angstrom
1550 WONTFIX	 setting time in gpe-conf produces hwclock/RTC error on akita
1596 FIXED	 Vincent - OpenGL-ES library for ARM
1598 INVALID	 gpe-icons package is broken
1765 FIXED	 db3-native breaks the build of OZ 3.5.4.x on AMD64
1771 FIXED	 Only ancient version of the oe-adapting patch is avaliable
1780 FIXED	 gconf-osso fails to be build
1823 DUPLICATE	 /etc/resolv.conf disappering
1885 FIXED	 Samba SRC_URI too specific
2251 FIXED	 installing claws-mail on angstrom 20070505
2394 DUPLICATE	 RFE: hibernate function
2495 FIXED	 akita backlight off after suspend.
2629 DUPLICATE	 No wireless driver built for h5000
2675 FIXED	 libtool breakage in -dev package
3092 INVALID	 Same problem like Bug 2289
3217 FIXED	 h2200 doesn't charge while suspended (angstrom)
3315 WONTFIX	 gpe-conf xxx does not work (akita)
3379 DUPLICATE	 gmp-native-4.2.1-r2-do_compile
3471 FIXED	 psplash rotation doesn't really work
3530 INVALID	 ipkg - 0.99.163-r6 installs with wrong permissions (mask)
3547 NOTOURBUG	 h3900: Sound not available
3548 NOTOURBUG	 h3900: Battery status not avilable
3785 DUPLICATE	 rox-filer won't build
4203 FIXED	 gcc-cross-sdk-4.1.2-r11: task do_compile fails if
toolchain target exists
4204 FIXED	 boost library cannot find bits/atomicity.h
4205 DUPLICATE	 opie touchscreen for spitz is 90=C2=B0 off
4206 FIXED	 python-simplejson does not install
4207 FIXED	 dependencies missing for python-setuptools
4208 FIXED	 uClibc-0.9.29 fails to build
4209 FIXED	 mono 1.2.6 fails to build
4210 FIXED	 Unrecognised cp switch used in autotools.bbclass
4211 WORKSFORME	 Unable to build jffs2 image for cm-x270
4213 FIXED	 /tmp/staging/avr32-angstrom-linux-uclibc/usr/include/errno.h:73=
:
error: multiple types in one declaration
4214 FIXED	 Angstrom c7x0 wpa
4217 FIXED	 tmsnc
4218 FIXED	 naim
4219 FIXED	 FrobTADS
4220 DUPLICATE	 centerim
4223 FIXED	 backport psplash start 01 S
4227 FIXED	 please backport fakeroot
4228 WONTFIX	 various likely targets for backporting
4231 WONTFIX	 org.openembedded.stable: gconf-dbus_svn.bb do_fetch &
do_compile fail (bp)
4232 DUPLICATE	 Impossible to build linux-hackndev-2.6
4233 FIXED	 trivial bug in org.openembedded.documentation
4234 FIXED	 zaurus-updater not being pulled in
4236 WONTFIX	 ERROR: Patches_Linux_2.4.24_1.00.tar.gz: not in gzip format
4237 FIXED	 Outdated URI for 2.6.25-rc4
4238 WONTFIX	 ipkg grammar fix
4242 FIXED	 strace does not build with uclibc_svn
4243 FIXED	 twisted_2.5.0.bb creates empty packages
4244 DUPLICATE	 org.openembedded.stable - gconf-dbus_svn.bb do_compile fail=
ed
4245 FIXED	 gettext does not pass unique '.lai' files test in base.bbclass.
4248 INVALID	 Boot stops on h2200
4260 FIXED	 new package i2c-tools
4261 FIXED	 meta-toolchain for uclibc does not add linux-libc-headers
to the toolchain package
4264 FIXED	 glibmm fails do_compile
4265 FIXED	 New package - sakura terminal emulator
4267 FIXED	 openssl-natve-0.9.7m-r2 does not compile on x86_64
4268 FIXED	 openssl does not build for mips
4271 FIXED	 new package - oneko
4273 FIXED	 util-linux does not compile with 2.6.25 linux-libc-headers
4274 FIXED	 Move eglibc into a separate package
4275 FIXED	 modphp fails to build
4276 FIXED	 upgrade automake to 1.10
4278 FIXED	 BB for enhanced ctorrent and its controller
4282 FIXED	 x11vnc misses libxtst dependency
4284 WORKSFORME	 no sound on htcblueangel
4302 FIXED	 php build error
4303 FIXED	 powerpc-angstrom-linux-gcc: error trying to exec 'cc1':
execvp: No such file or directory
4307 FIXED	 speex_1.2-beta3.bb (r0) does not install libspeexdsp
4309 WORKSFORME	 uicmoc4-native-4.3.3-r1-do_compile: endless compilation
4313 FIXED	 new package: iscsi enterprise target (iscsitarget)
4316 FIXED	 postinst / postrm / preinst / prerm are ignored for
packages with a dash
4317 FIXED	 Fix Opie SD card path for 2.6 kernel devices
4318 FIXED	 parted 1.8.7 does not build for ppc - and needs update to
1.8.8 - which doesn't build either...
4319 WORKSFORME	 error with quilt-native 0.46-r2 at the do_setscene step (h=
5000
4320 WONTFIX	 sablevm_1.12.bb and sablevm-classpath_1.12.bb do_fetch failur=
e
4321 FIXED	 zeroconf build problem on newer glibc
4322 INVALID	 New i2c-tools package
4324 WONTFIX	 flash issues with LAB
4325 DUPLICATE	 zeroconf does not build against eglibc
4326 FIXED	 gmp compilation fails
4331 FIXED	 GCC 4.3.0 needs patches
4333 FIXED	 omap1-linux-2.6.24 fails to build with gcc 4.3
4334 WONTFIX	 dbus-native compilation fails
4335 FIXED	 netperf 2.4.4 does not build against eglibc
4336 NOTOURBUG	 uucp-1.07-r2: do_install fails when no uucp user on host
4337 INVALID	 linux-handhelds-2.6_2.6.21 fails do_configure
4338 WONTFIX	 reboot doesn't reboot h2210 ipaq
4340 FIXED	 commit otavio's patches
4341 FIXED	 provide a working initramfs and corresponding image definition
4342 WONTFIX	 Default kernel for HTC Universal does not start
4343 FIXED	 syslogd init script fails
4347 FIXED	 fakeroot missing
4348 WONTFIX	 QA errors after bitbake navit
4349 FIXED	 h2200: high cpu usage
4351 FIXED	 navit cvs migrated to svn; edit navit_cvs.bb
4352 NOTOURBUG	 Ipaq 2215 99% CPU all the time
4353 NOTOURBUG	 system info closes on ipaq 2215
4354 WONTFIX	 mtd-utils don't work on h2200 ipaq
4360 FIXED	 dbus-1.2.1-r2 on h500/glibc/angstrom needs expat
4362 WONTFIX	 flash_eraseall gives segfault
4363 WONTFIX	 matchbox-applet-card broken with 2.6 kernel
4364 FIXED	 alsa-lib doesn't work properly with uClibc
4366 FIXED	 broken xmodmap for c7x0
4367 WONTFIX	 lib links end up in dev pkg when they shouldn't for navit
4368 FIXED	 Grub 0.97 fails to build wih automake 1.10
4371 INVALID	 opie-mail is missing in the feeds
4373 FIXED	 /etc/asoundrc must have different name
4375 FIXED	 version update: rt73-k2wrlz_3.0.0.bb
4376 FIXED	 add support for rdesktop 1.6.0
4380 NOTOURBUG	 bash causes scp to lost connection
4381 DUPLICATE	 Konqueror build error.
4384 FIXED	 cleanup olsrd recipes
4385 FIXED	 libmpcdec_1.2.6.bb
4386 FIXED	 flac_1.2.1.bb: v1.1.2 -> v1.2.1 upgrade
4387 FIXED	 pushd/popd bashism in recipes
4389 FIXED	 libxcomposite-1_0.4.0 needs libxext
4391 FIXED	 speech-dispatcher - 0.6.6 - r0 fails do_configure
4392 DUPLICATE	 liburi-perl 1.35 r1 fails do_compile
4393 FIXED	 mysql-4.1.18-r3 fails do_compile
4395 FIXED	 subversion: Access via svnserve hangs due to lack of
entropy in /dev/random
4399 FIXED	 kernel.bbclass does not run sizecheck on kernel+initramfs
4403 FIXED	 base.bbclass regexpr on .la files in oe_libinstall seems wrong
4404 WONTFIX	 kernel-arch.bbclass and kernel.bbclass doesn't care
about kernels >=3D 2.6.24
4405 FIXED	 php-native_5.2.0.bb and php_5.2.0.bb obsolete SRC_URI
4408 FIXED	 CMake installed in wrong place
4410 WONTFIX	 rootfs fails in ipkg.py in Fedora 9
4412 REMIND	 Race conditition in concurrent bitbake of .dev
4419 FIXED	 Compile Failure: python-evas-0.2.1+cvs20080610-r0
4421 FIXED	 libfastcgi cgi-fcgi tool does not compile against uclibc. needs=
 -lm
4427 FIXED	 gst-ffmpeg circular dependency of AC_LANG_COMPILER(C++)
4430 FIXED	 task-qtopia-core-console fails to build
4431 FIXED	 rsync package: do_fech failed
4432 FIXED	 gpsdrive_2.10pre4 r2 fails do_configure
4433 FIXED	 Update Chicken Scheme to 3.3.0 (bb included)
4434 INVALID	 Replacing 2007 Angstrom feeds with 2008 causes dbus to crash
4435 FIXED	 openmoko-appmanager2_svn.bb fails in do_configure
4437 FIXED	 squashfs3.3+lzma patch for 2.6.24 kernel
4438 FIXED	 Bump tangogps to 0.9.2
4442 DUPLICATE	 akita 2007.12-r17
4443 INVALID	 openssl break gpe-image build for AVR32
4447 FIXED	 libusb1 0.9.0: contains flags unsuitable for gcc 3.4
4449 DUPLICATE	 libsvg-cairo-20050601 fails do_configure
4450 FIXED	 KERNEL_OUTPUT cannot be overridden and isn't always used
4455 WONTFIX	 wpa-supplicant cant be run on-demend by dbus
4458 WORKSFORME	 Error with oe_libinstall doing populate_staging of
libsdl-x11_1.2
4460 FIXED	 zhone compilation fails
4461 FIXED	 Add machine htcpolaris
4462 WORKSFORME	 alsa-utils_0.1.15 fails to compile due to NLS problem
(LC_ALL not defined)
4465 WONTFIX	 missing libgsmd: error during bitbake x11-image on Ubuntu 8.0=
4
4466 INVALID	 makedevs do_compile fails
4467 NOTOURBUG	 Keyboard 1 key not seen in Gnumeric
4468 INVALID	 libxmu fails do_compile
4469 INVALID	 aspell fails do_compile
4470 FIXED	 [RFC] Nandlogical update
4472 FIXED	 xfce-mcs-manager fails do_qa_staging
4474 DUPLICATE	 meta-toolchain fails do_populate_sdk when
GLIBC_GENERATE_LOCALES is set
4476 FIXED	 smpeg fails do_configure
4478 FIXED	 pkgconfig fails do_qa_staging
4479 FIXED	 pidgin: ICQ-Server says: client too old
4485 FIXED	 linux-openmoko srcrev results in broken build
4486 WONTFIX	 ecj-initial_3.3.bb can't remove build.xml
4487 DUPLICATE	 liburi-perl fails do_compile
4488 FIXED	 libxine-x11 and libxine-fb fail do_configure
4489 DUPLICATE	 recode-native fails do_compile
4490 FIXED	 recode-native FTBFS
4492 FIXED	 python-pycurl requires curl 7.16.4 but 7.18.0 is in oe
4493 NOTOURBUG	 Installing a package with -force-downgrade makes opkg segfa=
ult
4494 FIXED	 lzma-native_4.17.bb fails to fetch source tarball
4495 FIXED	 new recipe for Fusil
4496 FIXED	 new recipe for python-ptrace
4497 WORKSFORME	 Bitbake fails to build libpam_0.79
4498 INVALID	 webkit_qt_svn fails do_patch
4501 FIXED	 compiling linux kernel with gcc 4.3.x
4504 FIXED	 freetype building for armv5te dies on libtool
4505 FIXED	 gtk+-2.12.11-r3 fails to link
4506 DUPLICATE	 proposed recipe for ctorrent-dnh (maintained fork of ctorre=
nt)
4507 FIXED	 proposed recipe for ipython
4508 FIXED	 new recipe for OpenCV - The Open Computer Vision Library
4509 FIXED	 task-native-sdk is missing cc1
4513 WONTFIX	 gcc-4.1.2 cannot build for efika/ppc603e
4514 FIXED	 python-sip_4.7.3.bb source download fails
4516 FIXED	 new recipe for tuxmath
4518 FIXED	 New bb for libsdl-pango
4519 FIXED	 new recipe for tuxtype
4520 FIXED	 [RFC] kexecboot: passing extra cmdline arguments
4523 FIXED	 poodle support for linux-kexecboot
4524 FIXED	 add aufs (patch included)
4527 FIXED	 omap3evm.conf - allow local.conf to override
PREFERRED_PROVIDER_virtual/kernel
4531 WONTFIX	 avahi-0.6.22 link fails - rpl_realloc undefined
4533 FIXED	 Navit Icon
4534 WONTFIX	 package linux-smdk2440-2.6.20+git: failed
4535 WONTFIX	 glibc-intermediate-2.6.1 build fails on powerpc
4536 FIXED	 gcc-cross-sdk 4.3.1 missing include-fixed
4538 FIXED	 Bump libpng version to 1.2.31
4539 FIXED	 Add CodeSourcery arm-2007q3 as external toolchain/SDK
4540 FIXED	 rxtx fails to build
4542 FIXED	 external-toolchain misses providing runtime libgcc
4543 FIXED	 Zaurus clamshell defconfigs for linux-kexecboot
4544 FIXED	 unlock uImage for Zaurus-clamshells
4545 FIXED	 [RFC] kexecboot on zaurus clamshells (c7x0
4546 WONTFIX	 DNS server setting gets lost
4547 WONTFIX	 Bluetooth: Second and subsequent networking connections fail
4548 FIXED	 new package dmidecode_2.9.bb
4549 FIXED	 A number of dev packages are uninstallable
4551 FIXED	 proposed bb for podget (bash podcast aggregator)
4552 FIXED	 php-native fails in .stable with mysql problem
4554 FIXED	 typo in fso-image.bb
4555 FIXED	 Circular dependency in opie-i18n
4556 FIXED	 gst-ffmpeg build error due to missing dependency
4557 FIXED	 Clutter do_configure error due to missing dependency
4558 FIXED	 Pidgin-2.5.0 not able to configure without XScreenSaver
4559 FIXED	 building for sh4 / uclibc causes an exception in insane.bbclass
4560 FIXED	 gcc-cross-*_csl-* cleanup after include-fixed fix in glibc
4562 FIXED	 New package - xdiskusage-1.48
4564 WONTFIX	 Please backport fbreader.bb from dev to stable
4565 FIXED	 pciutils_2.2.4.bb was not creating the pciutils-dev
package nor populating staging
4567 FIXED	 Make klibc work on x86
4568 FIXED	 v86d enchancements
4569 FIXED	 Mozilla x86 jsautocfg.h files
4570 FIXED	 Fix xorg fonts cross-building
4571 FIXED	 Aufs compile fix
4572 DUPLICATE	 xfce-mcs-manager.pc problem which leads to a QA error
4573 DUPLICATE	 Exo package compilation fails
4574 FIXED	 Libosso compilation fails
4575 FIXED	 Incorrect SRC_URI in gnome_mplayer_0.5.3.bb
4576 FIXED	 glibc-intermediate_2.3.2+cvs20040726.bb
4578 FIXED	 uicmoc4-native_4.4.0 does not compile
4579 FIXED	 Fix tangogps dependencies
4582 FIXED	 X/Qt2 fixes (screen rotation screen resolution)
4583 DUPLICATE	 AC_CHECK_ENABLE_LTDL macro is undefined
4584 FIXED	 Unbreak ttf fonts
4585 FIXED	 enable aisleriot in gnome-games
4586 FIXED	 2007.13 Feeds not updated any more
4587 FIXED	 Grub fix for automake 1.10
4588 FIXED	 'bitbake rxtx' fails on jamvm-initial and then classpath-native
4589 NOTOURBUG	 opkg: opkg-cl causes glibc to emit free() errors
4590 FIXED	 ttf-liberation-0.2-r2 fails on do_install
4591 DUPLICATE	 NOTE: package linux-handhelds-2.6-2.6.21-hh20-r20:
task do_compile failed
4592 WORKSFORME	 USE_NLS variable has no effect for uClibc
configuration when building on Fedora 6/7 host
4593 WONTFIX	 building uClibc fails when USE_NLS is set to yes
4594 DUPLICATE	 qte-mt-static-2.3.10-r8 do_configure failed
4595 FIXED	 new recipe - evtest-1.23
4597 FIXED	 opie-console-1.2.3-r1 do_patch: failed. double_name.patch not f=
ound
4598 FIXED	 New recipe: splashutils
4599 FIXED	 New recipe: pmount 0.9.17
4600 FIXED	 New recipe: ivman
4602 FIXED	 sh4
4603 FIXED	 xqtlauncher integrates X/Qt2 nicely into opie
4626 FIXED	 gcc-native-3.4.6 do_compile failed in Ubuntu
4630 FIXED	 SIMpad serial update
4659 FIXED	 new package mini-httpd_1.19.bb
4660 FIXED	 Yasr bitbake recipe
4661 FIXED	 libsvg-0.1.4-r1: task do_qa_staging:
4668 WONTFIX	 IndexError
4669 FIXED	 BB for mcabber - ncurses jabber client
4672 FIXED	 entrance_0.9.0.010.bb do_install failed
4688 FIXED	 [RFE] add ext3 support to linux-kexecboot for Zaurus
clamshell models
4699 WORKSFORME	 opkg-nogpg_svn.bb fails to build.
4707 FIXED	 Got fbi (frame buffer image viewer) working
4708 FIXED	 Vala 0.3.5 recipes
4709 FIXED	 motion: New upstream release 3.2.11
4710 FIXED	 [bb patch] boost_1.33.1 header file fix for GCC4.1
4711 FIXED	 new bb recipe for Pingus
4712 FIXED	 libxml2-2.6.29 is not fetchable anymore
4713 INVALID	 fakeroot(-native)-1.9.4 source tarball not fetchable
4714 FIXED	 New Recipe for mumpot-0.3.1
4716 FIXED	 libssh_0.20.bb
4717 FIXED	 uClibc.machine file missing for mpc8315e-rdb board (uclibc 0.9.=
29)
4718 FIXED	 pax-utils(-native) 0.1.13 not fetchable
4720 INVALID	 gettext 0.17 fails to compile
4726 FIXED	 receipe for dillo 2.0
4727 FIXED	 enable fastcgi in php
4728 FIXED	 libsdl-image 1.2.6 do_qa_configure failure
4731 FIXED	 RFE/kernel.bbclass: untie 'uImage' from openmoko
4732 FIXED	 Fix firefox.inc parse errors
4735 FIXED	 introduce BPN (base package name) to simplify *-native recipes
4740 WORKSFORME	 do_install failed in e2fsprogs-1.38
4743 FIXED	 add a recipe for the Chinese font WenQuanYi Zen Hei
4745 FIXED	 missing md5 and sha256 apr-util 1.2.12 source code  in checksum=
.ini
4746 FIXED	 new recipe mktemp_1.6.bb
4748 FIXED	 qtopia-core-gui-image fails with qtopia-core
4750 FIXED	 fso-image fails with openmoko-terminal2
4752 FIXED	 minicom-2.3
4755 WONTFIX	 Recipes for vala-0.4.0
4757 FIXED	 tinylogin relocated.
4758 FIXED	 Recipe for bootchart-lite
4759 FIXED	 new recipe texi2html_1.78.bb
4760 FIXED	 [patch] wesnoth do_fetch failure because of missing checksum
4763 FIXED	 php-native do_fetch failure because of missing checksum
4764 FIXED	 mcabber do_fetch failure because of missing checksum
4768 WONTFIX	 gpe-calendar alarms do not wake a suspended system
4772 FIXED	 replace task-bootstrap with task-base in jlime-opie.bb
4774 FIXED	 new recipe help2man_1.36.4.bb
4782 FIXED	 Checksum for libftdi-0.13 missing.
4783 NOTOURBUG	 build page improvement suggestions
4784 FIXED	 Spurious notes: missing or unbuildable dependency chain
4787 FIXED	 Checksums for some u-boot sources missing.
4788 FIXED	 Fix duplicated EXTRA_ARCHES for mx31ads
4789 FIXED	 fakeroot_1.9.6 missing checksum for a debian mirror
4790 FIXED	 apr-util-1.2.12 missing checksums
4791 FIXED	 add a patch for package_tar.bbclass
4797 FIXED	 task-sdk.bb and task-sdk-bare.bb duplicate some functionality.
4798 FIXED	 glibc fails with -march=3Di686 or pentiumpro or pentium3
4799 FIXED	 hal-0.5.11 fails with external toolchain/SDK
4802 FIXED	 gnome-panel-2.24.0 cannot find scrollkeeper
4804 FIXED	 Some more checksums missing
4808 FIXED	 busybox passwd with shadow support
4814 WONTFIX	 qemu fails to build on ubuntu 8.10
4827 FIXED	 support for OXE810(D)SE board
4828 INVALID	 opkg-nogpg fails to build with undefined ref to gnutls
4833 FIXED	 AVR32 init segfaults signal 11
4835 FIXED	 Proposal to update git/git-native
4843 WORKSFORME	 fetch-pack from 'git://git.infradead.org/mtd-utils.git' fa=
iled
4847 FIXED	 gnome-vfs_2.22.0 should depend on dbus-glib
4858 WORKSFORME	 tiff do_compile failed
4859 FIXED	 G++ in SDK is non-functional
4860 WONTFIX	 FFTW 3.1.2 fails to fetch sources
4861 FIXED	 checksums.ini update for xqt2 and blackbox
4871 WONTFIX	 libxml does not build with Ubuntu Intrepid
4872 FIXED	 packages/e17/illume_svn.bb file doesn't fetch source from svn
4874 FIXED	 Recipe for mumpot-0.3.2
4878 FIXED	 msm machine update/cleanup
4886 FIXED	 glibc-2.6.1-r15 do_configure fails on armv6-novfp
4894 NOTOURBUG	 oops in pxa_ir_configure
4904 WONTFIX	 bitbake base-image fails on libtool-native
4907 INVALID	 classpath-initial-0.93 incorrect $S
4908 INVALID	 classpath-native 0.97.2 invalid $S
4911 FIXED	 bzip2-full-native-1.0.5 fails with do_configure
4913 DUPLICATE	 ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires
the runtime entity 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but
it wasn't found in any PACKAGE or RPROVIDES variables
4915 FIXED	 e-wm usage of RDEPENDS_${PN}_append_linux etc failes to
generate proper depency graphs for *image.bb
4916 FIXED	 gnome-panel fails to build
4920 WONTFIX	 glibc-2.3.6 requires ld.so.conf
4935 WORKSFORME	 build of flex-native fails
4936 WORKSFORME	 Build of openssl-native fails
4937 WORKSFORME	 Build of db-native fails
4938 WORKSFORME	 build of git-native fails
4942 FIXED	 php-5.2.6 fails to configure
4943 FIXED	 Your PACKAGE_ARCHS field contains duplicates: alix.conf
and tune-geodelx.inc
4946 FIXED	 automake_1.10.bb do_patch error
4948 WONTFIX	 openwrt-sdk.conf points to generic-uclibc.conf which doesn't =
exist
4952 FIXED	 packages/u-boot/u-boot_git.bb git fetch fails
4953 FIXED	 packages/mtd/mtd-utils-native_1.0.0+git.bb
4955 FIXED	 u-boot_git.bb for BeagleBoard machine do_fetch problem
4956 WONTFIX	 gcc-native-3.4.4 build failed on Ubuntu Intrepid
4957 WONTFIX	 qemu-native-0.9.1 build failed on recent Linux distro
4958 FIXED	 scummvm does't build the engines(needed for playing games)
4959 WONTFIX	 HX4700: Bluetooth PXA270 BTUART BRF6150 patch
4963 WONTFIX	 package.bbclass - uncaught exception from os.stat() on
symbolic link
4965 FIXED	 frozen-bubble update to version 2.2.0 and better package
4966 FIXED	 new bb recipe : sdlpango
4967 FIXED	 libsdl-mixer lack libogg libvorbis as DEPENDS
4968 FIXED	 Fix mainstone build
4969 FIXED	 Bump ALSA to 1.0.18
4973 FIXED	 new recipe - directfb-examples_1.0.1.bb
4975 FIXED	 I've a recipe that works on woglinde's machine but not mine
4978 FIXED	 busybox hwclock.sh runlevel script fails without GETOPT_LONG
4982 FIXED	 new package
4984 FIXED	 Add tuning for ARM1176JZF-S core
4985 FIXED	 udev pulling in libvolume-id-dev
4990 DUPLICATE	 Fix libsdl-qpe for autoconf 1.10
4991 DUPLICATE	 Fix libsdl-directfb for autoconf 1.10
4995 FIXED	 Fix alsa-utils 1.0.18 build
5000 FIXED	 glibc 2.7 fails to build
5004 WONTFIX	 generated totally unusable rootfs
5005 WORKSFORME	 do_compiled failed for shared-mime-info-native_0.51
5007 FIXED	 glibc-initial 2.7 missing
5008 INVALID	 checksums doesn't contain valid sums for
addressbook-0.1: do_fetch failed
5009 DUPLICATE	 audioplayer-1.0.tar.bz2: do_fetch failed - wrong checksum
5010 FIXED	 wrong cheksum: do_fetch failed
5012 FIXED	 bison-native-2.3 missing data
5013 FIXED	 python 2.6 fails do_compile for bigendian machines
5014 FIXED	 pidgin uses inexisting preferred version.
5017 INVALID	 angstrom-2008.1: desktop-file-utils-native_0.14.bb build
failure - wants libdb-4.2.so
5018 WONTFIX	 angstrom-2007.12: configure step for
libtool-native-1.5.10-r9 failed - wrong option for autoreconf
5019 WORKSFORME	 perl-native-5.8.8 fails
5020 INVALID	 bluez (bluez4-4.29-r2) fails to build
5026 WONTFIX	 dpkg_1.14.23.bb un-fetchable
5027 FIXED	 fso-monitord fails to link
5028 FIXED	 fso-image fails on do_rootfs install gst-plugin-sid
5030 INVALID	 klibc-1.5 build failed
5034 FIXED	 gnutls-2.4.2 needs guile-native
5035 FIXED	 source archive for fakeroot 1.9.6 no longer downloadable
5036 FIXED	 tzdata2007k.tar.gz no longer downloadable
5039 FIXED	 netbase 4.21 no longer downloadable
5040 FIXED	 base-passwd 3.5.19 no longer downloadable
5042 FIXED	 vala doesn't cross-compile
5044 FIXED	 The source archive for dash 0.5.2 is no longer downloadable
5046 FIXED	 rx1950 machine conf typo
5050 FIXED	 New recipe - The Revision Control System (RCS)
5052 FIXED	 libxsettings-0.11-r0 build fail on angstrom-2008.1 for stb225
5053 INVALID	 libdisplaymigration_0.99 strip issue
5054 FIXED	 patch to fix GENTOO_MIRROR
5055 FIXED	 setpwc does not build because of bad tarball checksum
5058 FIXED	 busybox-1.13.2-r16: task do_fetch - md5 error
5059 FIXED	 Module snd_soc_neo1973_gta02_wm8753 not loaded when booting ope=
nmoko
5060 WORKSFORME	 python-2.6.1-ml4 compile failed:  Floating point exception
5061 FIXED	 gpe-scap-1.3 mips-strdup patch
5062 WONTFIX	 fso-console-image rootfs for a780 is not usable
5063 FIXED	 new recipe wekit-efl
5064 FIXED	 bluez-cups-backend_3.36.bb
5065 FIXED	 xmonobut-0.4.1
5066 FIXED	 Recipe for latest version of cbrpager
5067 FIXED	 New recipe for gRun
5070 FIXED	 webkit-gtk compilation problem
5071 FIXED	 New recipe for toppler
5074 FIXED	 git repo for kexecboot has moved
5076 FIXED	 libxt Header files missing _XFUNCPROTO{BEGIN
5079 FIXED	 new recipy: llvm2.6_2.5+svn.bb
5085 FIXED	 syntax error when compile every package
5086 INVALID	 libpcap-1.0.0 failed to install
5087 FIXED	 GNU_HASH in madwifi-ng-r3837-20080802-r1
5089 FIXED	 New Recipe for mumpot-0.5
5093 FIXED	 Infinite recursion in Python on sato-icon-theme package.
5096 INVALID	 Testbug for cdbot2
5099 NOTOURBUG	 Error in naming of u-boot-file ?
5101 FIXED	 e2fsprogs-libs : unexpected keyword argument 'allow_links'
5104 DUPLICATE	 creation of dependency-complete feed
5107 FIXED	 Cant override thumb default for armv5 and v4 in local.conf
using Angstrom
5110 INVALID	 ffmpeg build-depends on GSM stuff
5111 FIXED	 opie-image build-depends on fso-gsm0710muxd
5121 FIXED	 udev-141 has broken all udev images
5134 WONTFIX	 Build Errors for AT91Bootstrap + u-boot
5139 DUPLICATE	 libxml2.so: undefined reference to `gzopen64'
5140 FIXED	 diffstat SRC_URI needs an update
5141 FIXED	 iputils does not build
5143 DUPLICATE	 gumstix-kernel-2.6.21 fails to build with gcc 4.3
5144 FIXED	 omapfbplay.c:40:20: error: omapfb.h: No such file or directory
5146 FIXED	 Update Vagalume to Version 0.7.1
5147 FIXED	 iproute2-2.6.22-r1 fails on do_compile (with patch)
5149 FIXED	 e2fsprogs-libs fails to compile for RELEASE
5150 WORKSFORME	 IMAGE_FSTYPES =3D cpio.gz does not work
5151 FIXED	 zaurus-installer for collie
5156 WONTFIX	 meta-toolchain doesn't produce any *.pc files in deployed fil=
e
5211 INVALID	 Example profile corrupts the path and prevents classpath
to build successfully
5256 INVALID	 i2c-tools fetch fails
5261 WONTFIX	 guile-native_1.8.2 fails to build
5271 FIXED	 emotion_svn fails to build
5276 FIXED	 fso-gsm0710muxd fails  on git read-tree
5277 FIXED	 wmiconfig_svn fails due to 'no GNU_HASH' bug
5278 FIXED	 wrong SRC_URI for ttf-sazanami
5279 WONTFIX	 glibc 2.2.5 : can't resolve '_GLBOAL_OFFSET_TABLE_'
5280 FIXED	 fakeroot-native_1.12.1.bb do_fetch failed
5282 FIXED	 uClibc 0.9.30.1 / gcc-cross-4.4.0 libstdc++v3 build
failure (possibly locale related)
5286 NOTOURBUG	 opkg goes OOM when upgrading navit on Freerunnner
5288 INVALID	 md5/sha256 checksum mismatch for alsa-utils-1.0.20
5290 FIXED	 devmem2.c has wrong checksum
5291 FIXED	 Building devmem2 fails for fetch checksum mismatch
5293 FIXED	 Apache 2.2.3 issue with multiple listen
5296 FIXED	 libfsobasics_git.bb fails to configure
5297 FIXED	 python-pyqt fails do_compile
5298 FIXED	 Update resolvconf recipe to 1.45
5299 INVALID	 checksum not tested for sources fetched from a mirror
5301 FIXED	 libvorbis configure.in hardcodes -cpu=3D750 for powerpc
5304 FIXED	 cups-1.2.12 fails
5305 FIXED	 x11-gpe-image do_rootfs opkg permission denied
5306 WORKSFORME	 x11-gpe-image do_rootfs failed
5308 FIXED	 conf/machine/include/tune-geodelx.inc is missing
5313 FIXED	 build failure for angstrom-2008.1 with eglibc
5314 FIXED	 libcgicc 3.2.7 recipe
5315 FIXED	 helloworld-image fails on 'opkg_unarchive.patch'
5318 FIXED	 unable to bitbake ortp
5320 FIXED	 socat fails to build for i686/eglibc/minimal
(HAVE_TERMIOS_ISPEED wrong)
5324 INVALID	 cannot build package m4-native
5325 FIXED	 clutter uses mesa instead of virtual/libgl
5326 FIXED	 Bash autocompletion for OE recipes
5327 INVALID	 gcc-cross-intermediate-4.4.1-r6.1: oe_runmake failed.
5330 INVALID	 Problem with building kernel image
5333 FIXED	 at91sam9261ek Build Fails at sqlite3
5335 FIXED	 Initial support for the Samsung Omnia (SGH-i900)
5337 INVALID	 Error unpacking
../../openembedded/recipes/linux/linux-omap-2.6-2.6.9-omap1/defconfig
5339 FIXED	 package_tar no longer produces packages
5341 FIXED	 ez-ipupdate listed multiple times in PACKAGES
5342 FIXED	 libqpe-opie_cvs fails to build
5344 FIXED	 missing checksums for v2.6.14-gitcurrent.patch and  full.patch
5345 FIXED	 cdparanoia fails to run through configure on mipsel target
5347 FIXED	 xorg-server-1.4.0.90/hw/kdrive/vesa/vm86.c:225: error:
'IF_MASK' undeclared
5350 FIXED	 python-gst_0.10.17.bb: ERROR: function do_compile failed
5351 FIXED	 Support updates for the Samsung Omnia (SGH-i900)
5360 NOTOURBUG	 xmms couldn't play mp3
5361 FIXED	 firefox crashreporter requires curl
5362 FIXED	 compilation of gcc-cross-intermediate-4.4.2 failed due to
lack of fenv.h
5363 FIXED	 compilation of uclibc-initial-0.9.30.1 error and report
unrecognized command line option
5367 FIXED	 libfsoframework fails to build
1521 FIXED	 package opie-console-1.2.2-r0: task do_compile: failed
4272 FIXED	 Add 2.6.25 linux-libc-headers
4463 FIXED	 gdb-cross does not build on x86_64 hosts
4464 FIXED	 RRECOMMEND for libgcc in glibc/eglibc
4502 FIXED	 gcc 4.3.1 does not build for arm uclibc
4664 FIXED	 Canadian SDK support
5092 FIXED	 rootfs_deb fails unless bzip2 is in /bin/bzip2 on the build hos=
t
4765 FIXED	 Better updated support for mx31moboard machine
429 FIXED	 new bb files for gnuchess and libfltk based frontend fltk-chess
2488 FIXED	 Bitbake build for lcdproc
1353 FIXED	 gpe-session-scripts shouldn't depend on gpe-bluetooth
62 FIXED	 srec.bbclass
78 FIXED	 do_srec[nostamp] =3D 1
83 FIXED	 tune-xscale for h3900: ipkg architectures don't match
84 FIXED	 local clock and security addendum to ntp.conf
112 NOTOURBUG	 Changing Network settings in Opie from dhcp to static
does not kill udhcpc
375 FIXED	 mpeg2dec and libmpeg2 provide the exact same package
456 FIXED	 Cannot use prerm or postinst in subpackages (package.bbclass)
494 WORKSFORME	 ipkg relies on -passive-ftp switch which is not
provided by busybox
500 FIXED	 some SDL programs won't compile because SDL_CONFIG isn't set
536 FIXED	 .bb=C2=B4s for Qtopia Alarm Clock 1.0.9 & corresponding task bar=
 applet
543 FIXED	 [OZ3.5.4-RC] gpm package missing symlink
721 FIXED	 copy kernel files into staging for ppc platforms
808 FIXED	 modprobe.d is not created for 2.6 kernels
879 WONTFIX	 /usr/bin contains boot-critical binaries
891 NOTOURBUG	 RFE: Chose session type from GPE login screen
898 WONTFIX	 xmms does not close itself on Cancel button
1029 NOTOURBUG	 ipkg tries to access ro SD card
1059 WONTFIX	 altboot screen does not support delete key
1069 FIXED	 Building of the linphone package failed
1198 WONTFIX	 opie-reader segfaults with when opening chm file
1247 FIXED	 e-uae-0.8.27 fail to build with gcc4.1.1
1249 WONTFIX	 Timezone issues
1278 FIXED	 package zudoku-1.1-r0: task do_fetch: failed
1279 FIXED	 Build of zudoku failed
1280 FIXED	 gnutls build failed at gnutls-serv
1281 FIXED	 libvncserver_0.8.2
1282 INVALID	 x11vnc 0.8.3 .bb (w/o packagin)
1406 FIXED	 opie-mediaplayer1 circular dependencies
1463 WONTFIX	 qte-mt-static: libqte.a not staged
1503 NOTOURBUG	 Zsafe application doesn't lock upon suspend/resume
1522 FIXED	 gcc-cross fails to compile due to assembler errors
1665 FIXED	 moving /usr/lib/ipkg/status.tmp fails
1678 FIXED	 libgnutls
1785 WONTFIX	 ERROR: QA Issue: non dev package contains .so: qte-mt
1791 DUPLICATE	 db1200 lack kernel information
1824 WORKSFORME	 apache2_2.2.3 fails to build when host missing quilt
1915 DUPLICATE	 gtk-engines-2.7.4.bb looking in share instead of lib
for gtk+-2.0.pc pkgconfig
1917 LATER	 gpesyncd dependency on new versions of libtododb
1919 FIXED	 add RRECOMMENDS=3Dkernel-module-ipv6 to wget
2025 DUPLICATE	 angstrom gpe build from march 07 no touchscreen
2126 FIXED	 new bb file: fbvncserver2
2149 FIXED	 angstrom collie image brings up bootsplash in landscape mode
2161 FIXED	 unrecognized cards with new collie SD card driver
2164 WONTFIX	 angstrom collie image tries to access CF card from /dev/hda
2218 FIXED	 Please update freetype2 version
2231 FIXED	 Unable to change virtual terminal/session windows after logging=
 in
2271 FIXED	 libqpe-opie installs to /opt
2272 FIXED	 libqpe1 installs to /opt
2273 FIXED	 nunome installs to /opt
2278 WONTFIX	 calendar refuses to run
2330 INVALID	 gpdf missing a library
2643 NOTOURBUG	 Ability to change gpe-clock alarms via gpe-calendar
2763 DUPLICATE	 patch lzo_1x.patch not apply in mtd-utils-native_1.0.0+git.=
bb
3700 FIXED	 Updated Claws-Mail bitbake file
3758 INVALID	 Alsa(-dev) omission
3763 FIXED	 Geany bb file
3845 FIXED	 Angstrom on Collie : No output on serial line (tty
OUT_TTY) (Sharp I/O port)
4374 DUPLICATE	 akita do_rootfs fails
4566 INVALID	 Bug in ipkg-cl install
4980 FIXED	 Error in executing: X.bb file (cannot build any .bb file)
4996 FIXED	 Incorrect Rootfs
760 FIXED	 OZ3.5.4.1-alpha1 akita-gpe : can't open tslib config file messag=
e
4441 FIXED	 New package: otpcalc
350 FIXED	 Which csets from org.openembedded.dev do we want in
org.openembedded.oz354fam083 branch?
1657 FIXED	 Meta-Bug: Building for Sharp ROM
49 FIXED	 gnutls - newer version available
224 FIXED	 BB file for new version of Sword
334 INVALID	 Add lmsensors 2.9.2 for ARM
368 DUPLICATE	 generic versioned dependencies when different packages
provide implementations of the same shared library
398 FIXED	 Bluez hcidump version 1.26
432 FIXED	 cvs.handhelds.org moved to anoncvs.handhelds.org
439 FIXED	 ROOT_FLASH_SIZE is wrong for some machines
551 WONTFIX	 ipkg feed has moved to twente
673 FIXED	 Adding MacChanger Metafile
729 FIXED	 glibc fails when building with gcc4
817 WONTFIX	 Include firmware download support in hostap
892 FIXED	 Jornada6xx.conf Machine changes
906 FIXED	 ntp sources moved
952 FIXED	 need to copy /include/asm/cpu-sh3 content to /include/asm
1030 WONTFIX	 // in path
1035 DUPLICATE	 /home/root directory not created by e17 rc4 c7x0 image (e-i=
mage)
1103 WORKSFORME	 handing over parameters to scap gives awk error
1157 FIXED	 libtool-native does not provide libltdl for convenience use
1199 INVALID	 Changing the home to root partition split ratio on OpenZaurus
1399 REMIND	 altboot in 3.5.4.1 on collie
1576 FIXED	 update qpealarmclock to 1.0.9
1828 FIXED	 Adding OpenSSL 0.9.8 to the packages
1920 FIXED	 SIMpad ucb1x00 switches driver code beautification
1941 FIXED	 Maintainer adjustment
1970 FIXED	 lrzsz should use update-alternatives
2184 DUPLICATE	 gqview-2.1.1 fails to build error in pixbuf_util.c
2232 FIXED	 sound and audio players
2235 FIXED	 angstrom collie: some keys do not work
2314 FIXED	 OpenTTD doesn't run
2339 FIXED	 Speaker and earphone output broken in Angstrom
akita/20070507 on sharp zaurus sl-c1000
2357 FIXED	 Enhanced Ralink RT2570 Driver
2681 FIXED	 3 typos in help world example
2684 FIXED	 wifi-radar 1.9.6-r0 have wrong dependencies
2928 FIXED	 binutils-cross 2.18 fails to build on x86_64
2959 FIXED	 Fix for broken gcc-cross-4.2.1-r3 in uClibc mode
3071 INVALID	 Adding Opie Camera2 to OE
3560 NOTOURBUG	 h5000 fingerprint scanner driver unavailable in OE
3767 FIXED	 Banner does not show boot message on serial console
3772 FIXED	 SharpROM sometimes compiles glibc which it shouldn't really do
4179 FIXED	 external toolchain generated by meta-toolchain depends on
the original build location
4200 INVALID	 test bug after moving from Greg's server to amethyst
4439 FIXED	 New package: fvwm
4440 FIXED	 New package: libstroke
4446 FIXED	 bb recipe for libdmtx - 2D barcode reader / writer
5130 FIXED	 Coreutils-native_7.2 fails to compile
5281 FIXED	 ffmpeg_git do_configure fails due to broken git URL
3905 FIXED	 [Patch] chinook-compat - GCC/libc version mismatch
764 FIXED	 [3.5.4] No Package lists in locale feeds
478 FIXED	 kbd_mode patch to change high keyboard repeat rate under
the 2.6 kernels
1876 WORKSFORME	 opie-sysinfo fails do_compile
2146 FIXED	 bad RPATH in mencoder/mplayer (QA build failure)
2277 FIXED	 dates has missing dependency gconf-dbus
2407 FIXED	 build of sysvinit fails in do_install
2511 FIXED	 uicmoc4-native fails do_compile after recent update to version =
4.3.0
2 FIXED	 build fails - Patch config-guess-uclibc.patch does not apply
5 FIXED	 evas .bbs fail to parse
518 FIXED	 [PATCH] tslib: work with different screen resolution
18 FIXED	 knights 1.14 does not build
8 FIXED	 fakeroot outdated
19 FIXED	 opie-lockapplet has file conflict with opie-security
24 FIXED	 sources for mtd-utils-native-20050414 not available
31 FIXED	 sources for tximage-0.2-r1 unavailable
32 FIXED	 bitbake opie-image fails for openzaurus/spitz
40 FIXED	 Add h1940 machine and kernel to OE
57 FIXED	 gnutls not linked properly?
96 FIXED	 mathomatic .bb for OE
123 INVALID	 opie-pcmciaapplet can not be build
150 FIXED	 Todays gnu-config cvs patch
335 INVALID	 Latin1 RRECOMMENDS in packages
352 DUPLICATE	 ICE trying to compile gtk+ 2.6.7
426 FIXED	 change h6300 builds to use udev
427 FIXED	 2.6.14-rc5 support for h6300
497 FIXED	 hrw test image: suspend-desktop : proposed workaround for
suspending as unprivileged user
520 FIXED	 gpe-image won't build in .dev
633 INVALID	 NOTE: package libtool-native-1.5.10-r3: task do_compile: faile=
d
659 WONTFIX	 OZ 3.5.4: Charge light never goes out on Tosa
711 WONTFIX	 OZ 3.5.4-test5 Suspend fails on Tosa (SL-6000L)
748 INVALID	 Suspend broken on Simpad
814 WONTFIX	 bitbake fails on coreutils-native_5.1.3.bb if glibc
2.4+gcc 4.1 is used
923 FIXED	 3.5.4.1-RC1 akita+GPE : screen rotation doesn't rotate
anything on screen
966 FIXED	 tk does not build on AMD64 build system
999 INVALID	 xlibs/libxss_1.0.1.bb wrong XORG_PN name (problem fetching sou=
rce)
1122 FIXED	 tslib compile for 3.5.4.1 spitz fails
1251 FIXED	 Freetype 2.2.1 link error (libz in wrong location)
1524 FIXED	 Rename handhelds-pxa-2.6 -> linux-handhelds-2.6
1560 FIXED	 linux-handhelds-2.6 (2.6.17) fails to bulid due to missing file=
s
1743 WORKSFORME	 mysql-native fails in oz3541
1752 FIXED	 New Xserver optimized for Imageon graphic cards
1848 INVALID	 hostap-utils build fails
1869 FIXED	 New package: GPE frontend for the snes9x emulator
1983 FIXED	 New release for Ximageon
2007 FIXED	 New recipe for gpe-snes 0.2
2013 WORKSFORME	 bitbake gpe-image fails on gtk-engines looking for
gtk 2.8 (2.6 present)
2031 FIXED	 linux-rp_2.6.20-r7 fails to build
2039 FIXED	 zaurus-clamshells.conf generates defective jffs2 image
2052 FIXED	 New release of Ximageon
2055 FIXED	 starling_0.1.bb needs a dependency with sqlite3
2063 FIXED	 New starling svn package
2067 FIXED	 audioresample from gst-plugins-base 0.10.11 dumps SIGILL
2182 FIXED	 New recipes for o-hand sato gtk engine
2204 FIXED	 New recipe for gstreamer 0.10.12
2205 FIXED	 gst-plugins-good 0.10.5 fails for missing gst/check includes
2206 FIXED	 New recipe for gst-plugins-base 0.10.12
2207 FIXED	 New recipe for gst-plugins-ugly 0.10.5
2572 FIXED	 meta-opie is broken since task-opie-16mb.bb
2617 FIXED	 [PATCH] spitz/akita sound mixer misconfiguration
2764 FIXED	 asterisk 1.4: asterisk-sounds recipe
3021 FIXED	 gst-plugins-base QA bug
3108 FIXED	 bb files for monit 4.9
3849 INVALID	 libsdl-directfb-1.2.9 does not build
3880 FIXED	 The samba package is not having a correct
mount.smb/mount.smbfs link created
3886 FIXED	 udev-118 initscript is very inefficent
3897 FIXED	 mtd-utils-dev is empty
4002 FIXED	 Add 'dt' (Data Test Program) recipe
4006 FIXED	 wpa-supplicant current stable is 0.5.10
4071 FIXED	 fusionsound cannot compile with linux-libc-headers >=3D 2.6.23
4281 FIXED	 mtd-utils-dev is missing headers
1586 FIXED	 Rename machine h5xxx to h5000
1649 WORKSFORME	 getkey missing in busybox newer then 1.0x
4216 FIXED	 gdb-cross and gdb-cross-sdk 6.[68] differ
4262 FIXED	 The /usr/include/scsi headers are missing in some cases
4280 FIXED	 The /usr/include/scsi headers are missing in some cases
4411 INVALID	 gpe-dm crashes X11
4723 INVALID	 No input in X possile
4761 FIXED	 linux-rp 2.6.25+2.6.26-rc4 can't find all sources.
4854 FIXED	 Common samba autoconf variables are in arch-specific files
4877 DUPLICATE	 xmodmap file of spitz on C3000 is wrong.
4918 FIXED	 x11 default keymap wrong on Zaurus
5001 FIXED	 python 2.6 fails to compile
835 FIXED	 gnuz 0.3-r1 can not find levels
bug_id resolution	 short_desc


Bugs fixed:


Bugs opened:


