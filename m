Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1N2TUT-0000Zg-GM
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 18:36:24 +0100
Received: by yxe5 with SMTP id 5so7159519yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=dDJYeexcxdE/AeagtXyZOxdi7aekV70StyhnLV8qfpQ=;
	b=C/3BWV80tR0nDUxIZVhG+ctItfyTHkuukJ3O65reb2kK4AO1IMdnwDRpIGXM99BN9S
	vWR0wXWBbGZ8JE6/Dff2wrMxwmMVotTPsgoSvH1rJEkOkUEo2FylclVfT1hXhs3NAQj1
	mNhUIoNaQVLbz9DBW41oRezEefxE3OWHeBNpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Tq9hQmRuCv3Kkx+8TYPipxGTABErZm5DhJ7vYZexCxIt91Xmg644itEeyEGCLgSHSA
	EpeVoy8+G1ZRar87cZw2FO1IEvj1a1AJsTdtCbN+eDPLSjc0/lpQyK6P2VjUiw+05GTh
	SVzZgBaYXwcKoEAdX4PPYumOdVrtRrNDLeJcY=
MIME-Version: 1.0
Received: by 10.150.129.25 with SMTP id b25mr24408533ybd.308.1256578515986; 
	Mon, 26 Oct 2009 10:35:15 -0700 (PDT)
Date: Mon, 26 Oct 2009 13:35:15 -0400
Message-ID: <f96d234e0910261035w2b5a4f95v9c1c6351aea586c8@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-10-19 to 2009-10-26
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
X-List-Received-Date: Mon, 26 Oct 2009 17:36:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-10-19 to 2009-10-26

Andrea Adami (3):
  makedevs: fix interpretation of device table (count).
  device_table(s): fix the 'count' field in device_tables. Line up to the n=
ew
  device_table-oldmmc: adjust count fields according to makedevs fixes.

Cliff Brake (1):
  mono: make 2.4.2.3 the default version

David-John Willis (1):
  omap3-sgx-modules: Fix broken proc-interface.patch.

Enric Balletbo i Serra (2):
  igep0020: Add IGEP v2 support to OE
  linux-igep2: Add 2.6.28.10 for IGEP v2 machine

Frans Meulenbroeks (10):
  gnu common c++ lib: added recipe
  commoncpp2: add .h files to staging
  ccrtp: package created
  commoncpp: inherit binconfig to install script too
  samba: added 3.3.9 recipe
  kernel: changed defconfig so it has RTC as module; bumped MACHINE_KERNEL_=
PR
  php: fixed build errors
  proftpd: moved from 1.3.2 to 1.3.2b
  linux-kirkwood: disabled ubi verify in defconfig (CONFIG_MTD_NAND_VERIFY_=
WRI

Henning Heinold (7):
  fastjar: fix staging
  fastjar: fix staging now for real
  checksum.ini: add sums for mkbc.c from jalimo overlay
  linux-libc-headersr-2.6.20: add unifdef.patch
  chinook-compat: add new toolchain options and stick to util-linux
  gcc-cross_csl-arm-2005q3: put into useable state again
  util-linux-ng: for chinook-compat let util-linux-ng compile with older li=
bto

Holger Hans Peter Freyther (2):
  binutils-cross-sdk: Avoid QA error on building
  mips-common: Add alignment for MIPS

Jeremy Laine (1):
  klibc_*.inc: fix QA about packaging (klibc.so only for -dev)

Jeremy Lain=E9 (4):
  linux-2.6.29: update boc01 capsense driver to new i2c style
  linux-2.6.31: initial port of boc01 patches
  linux-2.6.31: update defconfig and SPI patch for boc01

John Willis (2):
  Upstart: Add version 0.3.11.
  netbase: Add config files for the omap3pandora and bump PR.

Khem Raj (11):
  lmsensors-apps_2.10.8.bb: Fix QA error about missing GNU hash
  openscada: Add new recipe for openscada svn trunk.
  checksums.ini: Add missing checksum for ltrace 0.4
  binutils-2.20.bb: Fix compilation error with missing braces
  fftw-3.2: Rename fftw_3.2 recipes to fftw_3.2.2
  serial-forward.bb: Fix missing GNU_HASH QA Error.
  gcc-4.4.2: Add new recipes for gcc 4.2.2
  eglibc_2.9: Remove un-needed patches.
  ltrace_0.5.3.bb: New recipe for 0.5.3
  Add support for MIPS qemu machine
  linux_2.6.31.bb: Add defconfig for mips qemu

Klaus Kurzmann (5):
  vala(-native): bump to 0.7.7+fso5
  vala.inc: disable vapigen as it's not strictly needed and does not work (=
yet
  libgee-native: new recipe
  vala-dbus-binding-tool-native: depend on libgee-native

Koen Kooi (44):
  omap3-sgx-modules: add INHIBIT_PACKAGE_STRIP =3D "1"
  networkmanager, applet: update to 0.7.2rc
  pixman: add some new versions, update git recipe
  u-boot: fix fw_env logic, update beagle and touchbook
  linux-omap 2.6.29: update touchbook patches
  libpam: add meta package for all plugins
  xdg-utils: add 1.0.2
  ffmpeg: bump SRCREV
  mplayer: bump SRCREV, remove pld patch that went upstream
  gmime: add 2.4.10
  totem-pl-parser: update to 2.28.1
  igep0020: use omap3.inc
  angstrom feed sorter: add igep2 support
  libgdata: add 0.4.0
  totem: update to 2.28.1
  totem: clean up totem dir
  gnome-screensaver: fix packaging
  gnome-python-extras: fix up patch to python stuff
  task-perl-module-all: switch it to RRECOMMENDS
  totem: add missing patch
  ti-dmai: add igepv2 support
  gtksourceview: update to latest release, fix packaging
  gnome-bluetooth git: bump SRCREV
  gedit: fix packaging so that the .pc ends up in -dev and we don't get the=
 de
  geoclue: use the correct virtual for gconf
  libgpsbt: fix QA errors
  angstrom: blacklist libiconv for *glibc to stop people from corrupting th=
eir
  cairo: add 1.8.8
  poppler: add 0.12.1, latest stable
  angstrom: prefer cairo 1.8.8, less bugs and faster
  u-boot git: refresh beagle pinmux patch
  gdm: add dep on libcanberra and bump PR
  angstrom-task-gnome: various tasks or a GNOME desktop based image
  angstrom task gnome: remove non-building uim bit
  angstrom feed builder: add more stuff
  lyx: add 1.6.4.1
  image bbclass: tweak lingue script
  opkg-*: bump SRCREV
  redland: add more DEPENDS
  ekiga git: bump SRCREV, change PV
  libgles-omap3: merge in changes from overo repo
  bluez4: update to 4.53
  bluez4: update to 4.46, 4.53 has build from scratch problems

Leon Woestenberg (2):
  gnash-fb: Fix DEPENDS from cairo to agg.
  u-boot: Patched and tested a GIT version for MACHINE=3Dcalamari.

Marcin Juszkiewicz (3):
  linux-bug: added extra staging, bumped SRCREV
  checksums.ini: added some kernel patches
  xserver-xorg-conf: added config fot at91sam9263ek

Marco Cavallini (11):
  conf/distro/kaeilos.conf added new distro options
  include/kaeilos-2009-preferred-versions.inc  aligned to latest Angstrom s=
ett
  conf/distro/kaeilos.conf completed previous modifications
  bluez4.inc : temporary solution for KaeilOS just to replace at least blue=
z-l
  bluez4_4.35.bb : temporary solution for KaeilOS just to replace at least =
blu
  bluez4_4.37.bb : temporary solution for KaeilOS just to replace at least =
blu
  kaeilos.inc : temporarily aligned to latest Angstrom settings
  distro/kaeilos.conf : switched to glibc 2.9
  glibc-package.bbclass : added KaeilOS hack supporting glibc 2.9
  xserver-xorg-conf: added config for ronetix-pm9263

Mark Brown (1):
  smdk6410: Add initial recipe for SMDK6410

Martin Jansa (2):
  Missing few xorg checksums.ini
  binutils-2.20 is new enough for glibc_2.9, change configure script to acc=
ept

Michael 'Mickey' Lauer (11):
  fso-autorev.inc: add libgee-native
  vala: delete obsolete version
  libgee: use 'require' rather than duplicating the recipe; also add a sane=
 sr
  sane-srcrevs-fso.inc: update to current cornucopia SRCREV
  libcanberra: depends on libtool
  fso: add some new dependencies
  task-fso2-compliance: add libfsoresource and fsogsmd
  serial-utils: fetch updated versions from FSO git and bump sane-srcrevs
  libfso-glib: remove bogus additional prefix in SRC_URI
  task-cli-tools: add serial-forward; bring back ltrace
  libfsoresource: and add the missing recipe (FSO dbus resource abstraction=
 li

Michael Lippautz (1):
  rt3070_2.1.1.0.bb: Install missing etc/Wireless/RT2870STA

Michael Smith (6):
  tzdata: add 2009o as 2009n is no longer available
  udev 141: fix packaging on x86_64
  cairo 1.8.8: fix libtool name in doltlibtool
  libsdl-mixer: add 1.2.9
  curl, curl-native: add 7.19.6
  curl: support openssl in CURL_FEATURES.

Stanislav Brabec (1):
  many recipes: Recipes must not depend on gconf-dbus directly, only dbus c=
an

Steffen Sledz (1):
  linux-2.6.24: enable POSIX message queues for hipox machine

Steve Sakoman (8):
  ckermit: fix GNU_HASH QA error
  dhcp:  create /var/lib/dhcp3 rather than /var/lib/dhcp
  evince: stage evince headers to make nautilus happy
  file-roller: fix packaging
  gnome-themes: clean up packaging
  system-tools-backends: fix packaging
  system-tools-backends: disable 2.8.1 for now
  usb-gadget: add serial gadget option

Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc


