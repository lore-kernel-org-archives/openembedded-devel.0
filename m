Received: from [209.85.210.180] (helo=mail-yx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mpja4-0000UE-VY
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 16:09:32 +0200
Received: by yxe10 with SMTP id 10so3768042yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2009 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=wl3XfpUF4tNtHYXlaywhnk/+qwgRucBaIMEQ0kY/f7Q=;
	b=Y5J4aLd1dgaKHMJNOsN/RzFJoxnVHFzUMugYAklWTpRd/83ukvuRxaWpr77ocfiPYd
	nMciZWyN5vYxYHAaLvJtEWZ5798TB487D9RrompxFmUyliobYLjbDy8AHZnUwp2xmlz0
	x2DhBLevx+i5Bj+JidPyVjSng+4QktbeRvcqY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Z8Pw9dCAUPlI5RPtYm9bBlIKS5O7d8ZeNCVMqFS84Jjygclopmf5SaybWFhsbIAVTJ
	5ynhmmUyydUvS1kQA9HleQ8SaixrDXHgk0QqPV7dybm4RduMqLf8JarrfiYchxkQz3m3
	bQ/3ecDBMW9BsqMMao8dILLuLOArOKIccGoyA=
MIME-Version: 1.0
Received: by 10.150.173.5 with SMTP id v5mr8386822ybe.345.1253542131907; Mon, 
	21 Sep 2009 07:08:51 -0700 (PDT)
Date: Mon, 21 Sep 2009 10:08:51 -0400
Message-ID: <f96d234e0909210708o3aa47fc5h79a85e670f73f617@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-09-14 to 2009-09-21
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
X-List-Received-Date: Mon, 21 Sep 2009 14:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-09-14 to 2009-09-21

Aleksandr Koltsoff (1):
  sane-toolchain.inc: armv5te mentioned twice on eabi-capable list

Andrea Adami (2):
  packaged-staging: fix populate_staging_postamble after staging-split by b=
ase
  package_ipk.bbclass: force recreation of DEPLOY_DIR_IPK. The dir is remov=
ed

Brijesh Singh (4):
  ti-cs1-omap35330: update SR_URI
  gstreamer-ti: import omapfbsink in gst_ti and add support for hw accelera=
ted
  gstreamer-ti: remove mp3 cap from gst_ti auddec1 element.
  gst-player: add recipe for a simple gstreamer player

Cliff Brake (2):
  calibrator: add new recipes for cache calibrator
  rt-tests: add git recipe

Denys Dmytriyenko (4):
  linux-davinci: add DA850/OMAPL138, update other DaVinci machines
  u-boot: update all DaVinci machines
  udev: split up init starting and populating messages
  kernel.bbclass: fix ownership inside the modules tarball

Graeme Gregory (6):
  linux-libc-headers_2.6.31.bb : add newest kernel headers, this has the
  transmission : make use .inc file as all recipes are pretty identical.
  libsdl-x11_1.2.11.bb : remove asm/page.h as its no longer there
  mplayer/files/pld-onlyarm5-svn.patch : refresh for newest svn
  linux-omap-zoomsync/omapzoom2/defconfig : enable twl4030 keypad driver

Henning Heinold (1):
  ti: switch download url from dir.com to dir.local

Jan L=FCbbe (12):
  libpoe-perl: add recipe
  net-snmp: switch to INC_PR
  net-snmp: use LDFLAGS (fixes QA error)
  net-snmp: add recipe for perl bindings
  net-snmp: move svn srcrev to sane-srcrevs
  gnupg: split gpgv off into its own package
  libexpect-perl: add recipe
  aufs2-util: add recipe for userspace tools
  libsoap-lite-perl: add recipe
  linux_2.6.30: use debian's defconfig for i686
  linux_2.6.30: add and enable aufs2
  i686-generic: add more devices tables

Khem Raj (11):
  xserver-xorg-1.5.3: Fix the build with nptl
  cross.bbclass: Override BASEPKG_HOST_SYS
  eglibc: Bump the SRCREV to get new fixes.
  libcgicc: Add new recipe for 3.2.8 release
  vagalume: Rename vagalume_0.7.bb as vagalume_0.7.1.bb
  preferred-xorg-versions-X11R7.4.inc: Lock PREFERRED_VERSION_dri2proto ?=
=3D "1.
  clutter.inc: Add omap5912osk to COMPATIBLE_MACHINE
  glib-2.0-native_2.21.4.bb: New recipe for native glib 2.21.4
  proxy-libintl-20080418: Add the patch to compile as shared library
  tzcode-native_2009k.bb, tzdata_2009m.bb: New timezone data
  autoconf: Dont execute perl and m4 for target builds

Koen Kooi (25):
  powertop: fix compilation with the extra states patch
  midori: add 0.10
  julius: add demo files from the TI speechrecognizer demo
  linux-neuros git: updates
  linux-omap 2.6.31: add memhole patch
  u-boot git: add omap3-touchbook support
  linux-omap 2.6.29: add support for the omap3-touchbook
  x-load: add omap3-touchbook support
  omap3-touchbook: add machine config based on the beagleboard one
  linux-omap 2.6.29: only use touchbook aufs stuff when passsing "special" =
as
  xserver-xorg-conf: add omap3-touchbook support
  ffmpeg svn: sync with git version to fix versioning
  omap3-touchbook: also generate squashfs files
  linux-omap 2.6.31: add extra EHCI and USB patches from http://arago-proje=
ct.
  linux-omap 2.6.31: add some more display fixes
  gstreamer-ti: only patch in omapfb for armv7a
  u-boot: if there's a fw-env in SRC_URI build and install tools as well
  libgles-omap3: switch to FLIP wsegl
  angstrom feed sorter: add omap3-touchbook support
  gst-rtsp: add 0.10.4
  angstrom-eglibc: fix eabi target os assignment
  xserver-xorg-conf: add omap3517-evm support
  pidgin update to 2.6.2

Leon Woestenberg (3):
  openrd-base: Support for Marvell Kirkwood ARM based OpenRD-Base board.
  linux-kirkwood: Add kernel support for openrd-base.
  linux-kirkwood-2.6.31: Fetch newer mach-types for MACHINE openrd-base onl=
y.

Mario Domenech Goulart (2):
  uClibc: use __always_inline instead of __inline__
  Avoids overwriting Python's built-in `str' in get_devtable_list

Michael 'Mickey' Lauer (7):
  python-dbus: add some more dependencies
  sane-toolchain.inc: bump default binutils to a version that works with th=
e d
  libcanberra: add 0.17; misc bug fixes and includes vapi bindings now
  checksums: add libcanberra 0.17 and vala 0.7.6-fso2
  vala: update to 0.7.6-fso2
  fso2-console-image: new recipe for fso2-compliance
  vala 0.7.6: make it build

Omar Barron (2):
  linux-omap-zoomsync_2.6.31.bb : added new kernel for omapzoom2
  omapzoom2.conf: added machine conf for linux-omap-zoomsync kernel

Otavio Salvador (3):
  preferred-xorg-versions-X11R7.5.inc: bump xf86-video-intel to 2.6.3
  pcmanfm: fix automounting support
  xf86-video-geode: update to 2.11.4.1

Phil Blundell (5):
  binutils_2.19.51: remove already-applied patches, add source checksum
  micro: select Thumb code where possible
  apply patch from drow to fix linking of thumb binaries
  micro: set PREFERRED_ARM_INSTRUCTION_SET weakly so local.conf can
  pulseaudio: turn off eleet a5m 0ptimiZ4ti0nZ in thumb mode

Robert Schuster (29):
  xerces-j 2.9.1: Added (from Jalimo SVN).
  jlex 1.2.6: Added (from Jalimo SVN).
  cup 0.10k: New recipe (from Jalimo SVN).
  jaxp1.3 1.3.04: New recipe (from Jalimo SVN).
  bcel 5.2: New recipe (from Jalimo SVN).
  regexp 1.5: New recipe (from Jalimo SVN).
  xalan-j 2.7.1: New recipe (from Jalimo SVN).
  inetlib 1.1.1: New recipe (from Jalimo SVN).
  gnujaf 1.1.1: New recipe (from Jalimo SVN).
  jacl 1.4.1: New recipe (from Jalimo SVN).
  jsch 0.1.40: New recipe (from Jalimo SVN).
  jdepend 2.9: New recipe (from Jalimo SVN).
  junit 3.8.2: New recipe (from Jalimo SVN).
  rhino 1.7r1: New recipe (from Jalimo SVN).
  jsp2.0 5.5.26: New recipe (from Jalimo SVN).
  hsqldb 1.8.0.10: New recipe (from Jalimo SVN).
  icommand-bluez 0.7: New recipe (from Jalimo SVN).
  oro 2.0.8: New recipe (from Jalimo SVN).
  avalon-framework-api 4.3: New recipe (from Jalimo SVN).
  logkit 1.2.2: New recipe (from Jalimo SVN).
  log4j 1.2.15: New recipe (from Jalimo SVN).
  commons-logging 1.1.1: New recipe (from Jalimo SVN).
  bsf 2.4.0: New recipe (from Jalimo SVN).
  commons-beanutils 1.8.0: New recipe (from Jalimo SVN).
  ant-native 1.7.1: New recipe (from Jalimo SVN).
  conf/checksums.ini: Fixed URL for jdom 1.1.
  dom4j 1.6.1: New recipe (for Jalimo SVN).
  poi 3.0: New recipe (from Jalimo SVN).
  jaxme 0.5.2: New recipe (from Jalimo SVN).

Stanislav Brabec (12):
  libxcalibrate, calibrateproto: Increment PE to upgrade packages in feeds.
  intltool: Increase INC_PR to replace pre-INC_PR packages in feeds.
  wget: Increase INC_PR to replace pre-INC_PR packages in feeds.
  bluez-gnome: Fix crash on pairing configured rfcomm device. Typo fix.
  gtk+: Implemented INC_PR, require hicolor-icon-theme.
  prismstumbler: Don't apply wireless.patch for linux-libc-headers >=3D 2.6=
.30.
  autoconf: Fixed calling of perl and m4:
  libtool: Use more clean way to set ac_cv_path_* variables. Never load lib=
too
  audiofile: Security fix CVE-2008-5824, coding style fixes from openSUSE, =
rec
  automake: Recipes cleanup and fixes:
  matchbox-wm: Easy fix for crash when clicking on the app switcher (opened=
han
  audiofile: Fixed staging broken by bdd3747.

Stefan Schmidt (15):
  shr-autorev*: Soem auto and some fixed revs for upcoming SHR merge (from =
SHR
  e-wm-menu-shr: Add recipe (from SHR)
  e-wm-sysactions-shr: Add recipe (from SHR)
  e-wm-theme-illume-shr: Add recipe (from SHR)
  initscripts-shr: Add SHR initscripts (from SHR)
  bphone-utils: Add recipe (from SHR)
  alsa-scenarii-shr: Add recipe (from SHR)
  etk-theme-shr: Add recipe (from SHR)
  illume-keyboard*: A bunch of illume keyboard layouts. (from SHR)
  e-wm-illume-dict-pl: Polish dict for the illume keyboard (from SHR)
  e-wm-theme-illume-niebiee: Add recipe (from SHR)
  e-wm-theme-illume-sixteen: Add recipe (from SHR)
  elementary-theme-*: Elementary themes (from SHR)
  frameworkd-config-shr: SHR specific frameworkd config (from SHR)
  libframeworkd-phonegui*: Abstraction libs for fso and efl (from SHR)

Steffen Sledz (1):
  gob2-native: missing glib-2.0-native dependency added

Steve Sakoman (3):
  hal-cups-utils: use STAGING_INCDIR not /usr/include
  packagekit: add 0.4.8
  gnome-packagekit: fix build and packaging

Tom Rini (2):
  uclibc-initial-0.9.30: Fix a typo, install_headers not install-headers
  uclibc-0.9.30: We need the __always_inline__ patch, bump PR.

Xerxes R=E5nby (1):
  llvm 2.7: New recipe.


