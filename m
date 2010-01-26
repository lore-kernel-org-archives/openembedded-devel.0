Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NZkui-0005zq-9y
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 13:53:03 +0100
Received: by ewy5 with SMTP id 5so5375682ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=WSv7EALzJ6GstfbUWdCvTl+6XE3OJBUj1BAdISHxjZA=;
	b=KaC3AcxIAifYoHUYGXEUg2lTIUVt2N61ap6DiqEtHgP1TfDUgaDmpVt0o4yIFklBqI
	F4wpPsjTSLBB5bWrnX+1Ry9DRLUrKM1EFjgHOGWBWfTG5PlNPkDeVF8LYWEKWzSHMiAd
	9D3prTcLD1rUZu98NbEKDAltiWlr99xX2DG6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=CfXVVk22MDQPjJAsEdWFRVcsCzWTCEc8O0YyEcnyRrXr/mzRwk3vpQ2Tf4MgJRDWhu
	RgAq1nTnmj/giRXegxDCXV+FiFuLByUZjH2Gyy3zbHtOS/qWxhiZAhj0XeuXEhuSf6hk
	3/Rc1ZCFEk9+HTwJsfwCSDQLm5aYFkcfwEelQ=
MIME-Version: 1.0
Received: by 10.216.91.66 with SMTP id g44mr114893wef.121.1264510239220; Tue, 
	26 Jan 2010 04:50:39 -0800 (PST)
Date: Tue, 26 Jan 2010 07:50:39 -0500
Message-ID: <f96d234e1001260450j45766a19ub598d9f5063af117@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2010-01-18 to 2010-01-25
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
X-List-Received-Date: Tue, 26 Jan 2010 12:53:03 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2010-01-18 to 2010-01-25

Aleksey Makarov (1):
  kernel.bbclass: fix kernel build, version >=3D 2.6.33-rc1, arch x86

Andrea Adami (1):
  linux-kexecboot_2.6.32+2.6.33-rc5: add LZMA pending patch for ARM

Bernhard Kaindl (3):
  binutils_2.17.bb: Fix setscene of binutils-cross-sdk_2.17, switch binutil=
s_2
  htop_0.7.bb: Fix htop do_configure: Ensure that ncurses is staged.
  libsdl-mixer: drop version 1.2.9 (md5sum mismatch)

Chris Larson (14):
  package_dbg.bbclass: add current incarnation from MVL6
  amend-recipes.inc: Add. Allows tweaks to be amended to a recipe via a .in=
c i
  rpm-native: kill unnecessary varprefix/localstatedir manipulation
  konq-e 20060404: don't override the exec_prefix var
  konq-e 20030705: kill the exec_prefix var hack
  postfix: kill funky FILESDIR usage in SRC_URI
  man: fix ldflags typo
  libcap: BUILD_CFLAGS can need the libcap/include too
  shadow: unbork the dependencies.. its DEPENDS, not DEPEND.
  shadow: reorg into .inc, pull some mvl6 changes over, use a 'pam' distro =
fea
  iptables: unbork the 1.3.8 build, merge iptables-utils into iptables.
  package_dbg: kill the explicit dir list
  Lets rename conf/amend-recipes.inc to amend.bbclass, for consistency
  recipe_sanity: check RRECOMMENDS/RCONFLICTS and make the message more com=
pre

Dallas Foley (1):
  libdrm_2.4.17: disable intel for non-x86

David Lanzend=F6rfer (2):
  conf/machine/include/htc-msm7.inc: Remove IMAGE_FSTYPES assignment
  xserver-xorg-conf/htcdream/xorg.conf: Add htcdream specific Xorg.conf

David-John Willis (7):
  shadow.inc: Correctly install /etc/securetty and add back support for cre=
ati
  shadow: Extend securetty file to include more common ttys (inc. ones used=
 on
  hicolor-icon-theme: Add 0.11.
  poppler: Add 0.12.3 and corresponding poppler-data 0.4.0 recipe.
  gnome-games: Bump 2.24.0 > 2.24.3 and add checksums for newer versions (r=
eci
  netboot-launcher-efl: Bump version to 0.2.2 and fix download link.
  xinput-calibrator 0.5.0: Add desktop file so it has a link in menus.

Denis 'Gnutoo' Carikli (7):
  gnumeric 1.9.14 : temporally removed dolt,build-only failure =3D>no PR bu=
mp
  linux-2.6.32: added eee701 support
  eee701 : added machine config
  xorg.conf: added eee701 support
  grub 0.97: added config for eee701
  pygtk 2.10.4 : fix bug #44974 (gnome bugzilla)
  abiword: build the mathview plugin

Eric B=E9nard (1):
  barebox: Add recipe for this new bootloader

Frans Meulenbroeks (5):
  linux-powerpc-fsl_git : patch was made one level too high; fixed it
  tgt: updated to 1.0.0
  contrib/angstrom/build-feeds.sh: added tgt (needed for iscsi)

Graeme Gregory (6):
  checksums.ini : alternative URLs for Thunar and xfce4-dev-tools
  at-spi_1.28.0.bb : fix compile on systems without host installen gnome de=
vel
  libgdata_0.5.1.bb : add newer libgdata
  eggdbus_0.6.bb : add this new recipe which is gobject bindings for dbus

Guo Hongruan (3):
  Set preferred glibc to 2.10.1 in conf/distro/micro.conf
  Fix a bug of COMPATIBLE_HOST defination in linux-sun4cdm_*.bb
  checksums.ini: add checksum for linux-2.6.8.1.tar.bz2 and linux-2.6.27.7.=
tar

Henning Heinold (4):
  gnome-games: set libsdl-mixer as dependency and delete sdl.m4 macro only =
whe
  libsdl-x11: use newer sdl.m4 macro from svn
  gettext: move to BBCLASSEXTEND, taken from popky
  gettext: add extra package for libintl

Jan Paesmans (1):
  gSOAP

Johan Hovold (1):
  wxwidgets: add 2.9.0 and clean up recipes

Khem Raj (9):
  libqpe, opie-taskbar: Fix linking errors found with 2.20 ld
  cherokee_0.99.24.bb: Add missing DEPENDS
  gdb: Add RRECOMMENDS for uclibc-thread-db when using uclibc for system C =
lib
  uclibc-nptl: Fix Global dynmaic TLS loads.
  sane-toolchain.inc: Bump glibc PREFERRED_VERSION to 2.10.1
  whois: Add recipe for version 5.0.0.
  eglibc-svn: Bump SRCREV to tip of trunk.
  wxsqlite3: Add  version 1.9.7 recipe.
  uclibc: Add new recipes for 0.9.30.2 release.

Koen Kooi (14):
  libbonobo: update to 2.24.2 (automake 1.11.x fixes)
  gnome-keyring 2.28: update to 2.28.2
  rygel: add hack to get rid of automake 1.11.x dependency
  libsoup: add 2.29.5
  webkit: bump SRCREV to get a fix for servers that always send gzip compre=
sse
  gst-plugins-base 0.10.25: add patch to fix 'native' sinks, so no more spu=
rio
  mplayer svn: bump SRCREV
  places: fix build, we sed out 'po', but the new gettext macros dislike th=
at
  efl: bump SRCREV
  netbook-launcher-efl: update to 0.2.3
  t1lib: fix GNU_HASH QA error
  e2fsprogs-libs, util-linux-ng: sort out libblkid move some more
  hal: add 0.5.14+git
  angstrom: prefer hal 0.5.14+git

Kristoffer Ericson (7):
  Remove obselete distro files: * We earlier had an need for different dist=
ro
  Add update-alternatives for distro file
  We should not use this kernel so add an -1 for all supported machines.
  Lets use the linux-hpc v2.6.32-hpc branch to build for nanonote. Eventual=
ly
  Remove ben nanonote from the linux 2.6.31.bb file. We intend on using lin=
ux-
  Add require tune-mips32 and also the currently best supported kernel for =
the
  Rename jlime distro file. Stupid having 2009 for a file we are still perf=
ect

Liam Girdwood (1):
  MAINTAINERS: update my email and add interests + recipies.

Lynn Lin (1):
  rpm: fix qa stage error (non-debug package contains .debug dir)

Marc Olzheim (1):
  iproute2: Remove unneeded bash dependency

Marcin Juszkiewicz (10):
  rygel: added 0.4.8 (requires automake-native 1.11.1)
  gssdp: added 0.7.1
  gupnp: added 0.13.1
  gupnp-av: added 0.5.2
  gupnp-tools: added 0.8
  gupnp-vala: added 0.6.2
  checksums.ini: added rygel 0.4.8, automake 1.11.1
  xinput-calibrator: added 0.5.0
  qt3e.bbclass: fix paths for staging

Marco Cavallini (5):
  kaeilos-2009-preferred-versions.inc: added PREFERRED_VERSION_wxwidgets 2.=
8.1
  kaeilos-2009-preferred-versions.inc: errata in PREFERRED_VERSION_wxwidget=
s
  xinput-calibrator-0.5.0/0002-gui_x11.cpp-Load-font-fixed-when-9x15-fails-=
in-
  xinput-calibrator_0.5.0.bb: added line for new patch to original package
  xserver-kdrive-common/xserver-kdrive-common/Xserver: Add settings for Ron=
eti

Mario Domenech Goulart (1):
  firefox: added sqlite3 as dependency for firefox >=3D 3.5

Martin Jansa (16):
  sanity.bbclass: handle lack of permission to read /proc/sys/vm/mmap_min_a=
ddr
  linux-openmoko-2.6.32: bump SRCREV for suspend/resume fix, enable MMC_UNS=
AFE
  checksums.ini: add checksums for upcomming xorg upgrades
  stopwatch: new recipe for QT4 based stopwatch
  cairo-native: depend on pixman-native instead libpixman-native
  libpixman: move all to obsolete directory (replaced with pixman recipes)
  pixman_0.16.2: drop DEFAULT_PREFERENCE =3D -1 and add BBCLASSEXTEND=3Dnat=
ive (pi
  pixman_git: add BBCLASSEXTEND=3Dnative (pixman-native used in cairo-nativ=
e)
  xorg: update recipes to latest releases 2010-01-18
  task-shr-feed: add stopwatch and rtmom
  mokomaze: bump PR after libsdl-ttf update
  task-shr-minimal: add xinput-calibrator
  linux-openmoko-2.6.32: update to latest stable 2.6.32.5
  linux-kexecboot: upgrade 2.6.33-rc4->2.6.33-rc5
  linux: upgrade 2.6.33-rc4->2.6.33-rc5
  linux-openmoko-2.6.32: bump srcrev for latest pcf50633 fix

Michael Lippautz (4):
  libxml-namespacesupport-perl_1.10.bb: create recipe
  libxml-sax-perl_0.96.bb: new recipe
  libxml2: Add catalog and docbook support
  libxml-libxml-perl: Adds perl module XML::LibXML

Michael Pilgermann (1):
  rtmom: elementary based gui for RTM (Remember the milk)

Nicolas Ferre (3):
  xserver-common: add SAM9G10/G45/9RL to Xserver file
  Update of ATMEL board configuration files
  sane-feed.inc: adding some ATMEL boards

Otavio Salvador (1):
  parted: depends on util-linux-ng to provide libuuid

Paul Menzel (1):
  libcap: Append `-fPIC` to `CFLAGS` to fix compilation on newer binutils/l=
d.

Petr =A9tetiar (2):
  xinput_calibrator: switch to autotools
  xf86-input-evtouch: add support for ET&T TC5UH touchscreen controller

Philip Balister (2):
  libxml2 : Convert to INC_PR. Bump PR for earlier commit.
  task-sdki-native: Add libtool and pkgconfig the the task-native-sdk packa=
ge.

Przemyslaw Wesolek (1):
  boost-1.33.1: Corrected GNU_HASH error.

Ricardo Salveti de Araujo (3):
  package_deb.bbclass: make the PACKAGES check earlier so if there is nothi=
ng
  mamonaim-e-applet-git: bumping rev, fixing PV and using oe-stylize
  mamona-input-methods-git: bumping rev, fixing PV and using oe-stylize

Robert P. J. Day (1):
  sensors-applet: Add support for current version 2.2.4.

Robert Schuster (1):
  nokia900: initial version of machine config for Nokia N900 tablet/phone

Rolf Leggewie (1):
  boost: move to INC_PR

Roman Khimov (2):
  icecc: remove bb.errors on un-built compilers
  icecc: introduce ICECC_FALLBACK_PARALLEL

Simon 'Morphis' Busch (1):
  preboot: new recipe; a dual boot solution for the palm pre (WIP)

Simon Busch (1):
  preboot: remove defconfig requirement

Stanislav Brabec (9):
  irdadump: Migrated to glib-2.0.
  glib-1.2: Fixed file list of glib-1.2-dev.
  glib-2.0: Typo fix in previous commit.
  xf86-input-tslib: Fix double free crash while on chvt or exit. * For more=
 se
  xserver-xorg: Worked around server termination after chvt on some fbdev d=
evi
  checksums.ini: Added missing checksum for balsa-2.4.2.
  pidgin: Update to version 2.6.5 (security: CVE-2010-0013). * Fixes, secur=
ity
  libx11: keysymdef_include.patch must be applied, otherwise host-installed=
 in

Stefan Schmidt (1):
  checksums.ini: Add missing sum for linuxkernel-2.6.24-patch

Steffen Sledz (1):
  linux-2.6.24: defconfig for hipox machine changed

Thomas Zimmermann (1):
  mickeydbus2: add new recipe

Vasily Khoruzhick (1):
  conf/machine/rx1950.conf: Correct information of the config file

Bugs fixed:

bug_id resolution        short_desc
3273 FIXED       gdb missing 'uclibc-dev' dependency
5376 FIXED       properly investigate commit
63004ac58ade27db5f1a242bf2bb416b0d01e863 (opie-taskbar)

Bugs opened:

bug_id resolution        short_desc


