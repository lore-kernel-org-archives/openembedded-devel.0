Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Krw3f-0002Wm-U5
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 16:48:46 +0200
Received: by rv-out-0708.google.com with SMTP id k29so3242682rvb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=7zROSe7o9u8xq/LVHTjG6XibPUYvnFXRIX0Pal5QL/I=;
	b=Yl8lGJNGrC+KEpSQYRApUbLrqUbsusW59+dVz0yhRkB2QeEVqUDlR59y47oyLWeG52
	m6HZBdMgPx8W4kWTgkqLb7PmqbcBXxcEEUuqYHP6JiOFNK4109BMXWS59wDzuoNPmnPR
	u2dl7G6ps4CB5avWHGu5NO9J+BhfmW/AIFJ5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=MP9RnO5GCu1PX0Bc2BqtJIvhBYfqwbwTxNQJoXjTQvZh3VPMmebC1rec2BMSyNWNF5
	IL/eAazh5jQF7X8PgedCTnAP1KEQDp4PZsZUGd3MSsjce/L86vQRH228Disv5e9oIB6f
	mw2pUOtqji1YFnABHYovxnwrydbzDfePUeM/A=
Received: by 10.141.163.12 with SMTP id q12mr4863229rvo.260.1224514096960;
	Mon, 20 Oct 2008 07:48:16 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Mon, 20 Oct 2008 07:48:16 -0700 (PDT)
Message-ID: <f96d234e0810200748m10ef8660s4ce0df24c31ad3df@mail.gmail.com>
Date: Mon, 20 Oct 2008 10:48:16 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-10-13 to 2008-10-20
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
X-List-Received-Date: Mon, 20 Oct 2008 14:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thought I would start these up again as I always appreciated them when
Koen used to send them out.  I'll try to add bugzilla stats next week.

OE weekly changelog 2008-10-13 to 2008-10-20

Carsten Haitzler (1):
      update to wpa_supplicant 0.6.3 (also add 0.6.0 in) and build packages=
 for

Cliff Brake (1):
      cm-x270.conf: test edit in new git repo

Daniel Willmann (1):
      checksums.ini: Add fakeroot

Dirk Opfer (1):
      fuse/curlftpfs: Update to 0.9.2

Florian Boor (2):
      ucview 0.9.3: add image capture tool ucview
      unicap 0.9.3: video data api framework

Graeme Gregory (7):
      [checksums.ini] add some new checksums
      mokoautorev.inc : sync with the OM version
      hal_0.5.11.bb : add new version from OM branch
      preferred-om-2008-versions.inc : update the versions in line with OM
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      Revert "hal_0.5.11.bb : add new version from OM branch"
      preferred-om-2008-versions.inc : move hal back to latest buildable on=
e

Henning Heinold (2):
      e2fsprogs: fix automake-1.9 vs automake-1.10
      e2fsprogs-libs: fix mkdir_p problem

Holger Freyther (6):
      wvstreams: Add initial compiling and linking version. This is
needed for wvdial
      wvdial: Add wvdial 1.6.0
      [checksums] gpsd 2.36
      [checksums] Add my sums for libtool
      [checksums] Add my sums for rsync
      [checksums] Add my sums for scowl

Holger Hans Peter Freyther (39):
      [squeak] Remove unbuildable old version of the squeak vm
      [site-conf] Add the tests for the squeak vm
      [squeak] Attempt to add squeak 3.10-1
      [squeak] Use a regenrated configure file, build against ffi
      [iotop] Add iotop 0.2.1 to OpenEmbedded/Openmoko
      [iotop] Make the installed package work
      [iotop] Actually remove the site.py and site.pyo from the package
      [prelink] Add recent version of prelink
      [python] Add pyxdg to use fdo specs from python
      [checksums] Add PyYAML 3.05
      [checksums] Add xournal 0.4.0.1
      [checksums] Add SDL image 1.2.6
      [checksums] Add xwininfo to the checksums
      [checksums] Add asterisk 1.4.17
      [checksums] Add bluez-hcidump 1.42
      [checksum] Add checksum of elfutils
      [checksums] Add alternative fbreader source
      [checksums] Add libmodplug 1.8
      [checksums] Add my sums for for wpa_supplicant
      [checksums] Add checksums for hal
      [checksums] Add checksums for navit
      [checksums] Add checksums for portaudio
      [checksum] Add prelink checksum for the normal mirror
      [checksums] Add pygame 1.8.1
      [checksum] Add checksum for pyxdg, matches the debian source
      [checksums] Add speex 1.2rc1
      [checksums] Add sip 4.7.7
      [base.bbclass] Make it fatal if no entry in checksums.ini exist
      [base] Autodetect the SCM and add listing of git repositories
      [ecore] Fix DEPENDS to make the build deterministic
      [connman] Use the http protocol to be able to git-clone/git-fetch con=
nman
      [naming policy] If we build a specific revision from a SCM have
a "r" after the SCM name
      [libgdbus] Use the right git server, use the right protocol
      [hal] Remove commented out things we have a SCM to recover it
      [hal] Move almost everything into the hal.inc file
      [hal] Create hal-info.inc and share it with the releases
      [hal] Add latest hal and hal-info
      [PR] Change PR to FILE_PR and intro PR as FILE_PR + DISTRO_PR
      [commit] Allow the distribution to set the hash-style and enable
it for angstrom

I-Fan, Chen (1):
      [connman]  modify the git server from moblin.org to git.moblin.org

Jan Luebbe (1):
      mtn2git: remove .mtn2git_empty files in non-empty directories

Jan L=FCbbe (10):
      mtn2git: fix bugs in conversion script
      mtn2git: add current name and email mapping script
      mtn2git: fix some more email adresses
      mtn2git: fix some more adresses
      mtn2git: update Phil Blundell's address
      mtn2git: add Jordan Crouse's email
      mtn2git: fix Marcin's address
      mtn2git: add ids missing for the dreambox branch and fix regex
to allow '_' for bk
      merge of '5f2600b1acc33de2cbb3e1f80dfa05badd4beec1'
      mtn2git: commit the final version used for the bk&mtn to git conversi=
on

Jeremy Lain=E9 (25):
      dtc-v1.1.0.tgz: update checksums.ini
      locomo_kbd_tweak-r1a.patch: update checksums.ini
      linux-*.bb: use KERNELORG_MIRROR consistently (fixes checksum errors)
      checksums.ini: remove duplicate slashes in kernel.org urls
      checksums.ini: add entry for squid-2.6.STABLE14.tar.bz2
      offlineimap_4.0.14.bb: fix duplicate slash in URL
      uicmoc4-(native|sdk): update to version 4.4.3
      qmake2-(native|sdk): update to qt 4.4.3
      qt-embedded: update to version 4.4.3
      qt4-x11-free: upgrade to qt 4.4.3
      checksums.ini: add entry for sailcut 1.3.2
      lua5.1: package 5.1 branch of the lua language
      checksums.ini: add entry for pysqlite 2.4.0
      checksums.ini: add hostapd python-django python-flup squidview
      checksums.ini: add entry for v86d
      e2fsprogs-native: don't pick up version 1.41.2 for now, it has issues
      e2fsprogs: better fix for mkinstalldirs issue
      checksums.ini: add entries for gob2 grub libupnp
      avahi: do not force RDEPENDS for avahi-daemon and avahi-autoipd
      python-django: update to django 1.0
      python-django: drop version 0.96.1
      boost-1.36: build missing boost libraries
      wt: add wt 2.2.0, a C++ Web Toolkit
      wt: fix cross-compilation
      boost-1.36.0: disable boost-serialization, it fails on powerpc

Julian_chu (16):
      [checksums] Add checksum for mysql-4.1.22.tar.gz
      [checksums] Add checksum for wxWidgets-2.8.9.tar.gz
      [checksums] Add checksum for x11vnc-0.9.4.tar.gz
      [checksums] Add checksum for ttf-arphic-uming_0.2.20080216.1.orig.tar=
.gz
      [checksums] Add checksum for Arkanoid_PSID.sid (fso-sound use it)
      [checksums] Add checksum for powertop-1.8.tar.gz
      [checksums] Add checksum for liberation-fonts-ttf-3.tar.gz
      [checksums] Add checksum for yaml-0.1.1
      [checksums] Add checksum for gdb-6.7.1
      [checksums] Add checksum for systat-8.1.5.tar.gz
      [checksums] Add checksum for x11vnc-0.9.4.tar.gz
      [checksum] Add checksum for midori-0.0.17
      [checksum] Add checksum for settingsgui-0.8
      [edje-utils] Add recommends to edje-utils
      [edje-sdk] Add edje-sdk.
      [connman] Upgrade connman to latest revision.

Kalev Lember (13):
      gdb: fix compile if ${TARGET_LINK_HASH_STYLE} is not set
      checksums.ini: add glibc 2.7
      checksums.ini: add ivman 0.6.14, pmount 0.9.17 and splashutils 1.5.4.=
2
      dmidecode 2.9: new recipe
      checksums.ini: add some xorg entries
      gdb: fix compile if ${TARGET_LINK_HASH_STYLE} is not set
      checksums.ini: add glibc 2.7
      checksums.ini: add ivman 0.6.14, pmount 0.9.17 and splashutils 1.5.4.=
2
      dmidecode 2.9: new recipe
      checksums.ini: add some xorg entries
      pcsc-lite 1.4.102: new recipe
      ccid 1.3.8: new recipe
      dmidecode 2.9: use FILE_PR instead of PR

Khem Raj (1):
      checksum.ini: Update checksums for packages from debian US mirror.

Koen Kooi (51):
      angstrom feed builder: cut down on excessive build attempt by
building packages only for needed archs
      xf86 video omapfb: bump SRCREV for YV12 support
      merge of '8be7406d131a307bb409ca173b6b0bb55c092bc6'
      merge of '2de185389e4f5cf5e749eb1645efe691e9fad4f8'
      gdal: update to 1.5.2
      merge of '3a2d3525d6188443c195ea295aa262c5e3dccb74'
      merge of '4814b69151af2e49760bb9a3837c26ca674a7636'
      fennec: add super-secret option to speed up rendering in the near fut=
ure
      firefox 3.1: move from alpha2 to beta1
      sysstat: add 8.1.6
      xf86 video omapfb: bump SRCREV
      firefox.inc: add DESCRIPTION
      linux.inc: add switch to turn of OABI compat for arm kernels
      angstrom: turn of OABI compat in EABI kernels
      linux-rp.inc: add switch to disable OABI compat like linux.inc has
      checksums: add more checksums, sort it
      checksums.ini: add even more checksums
      bitbake.conf: removing trailing space from TARGET_HASH to attempt to
      hal 0.5.11: move to nonworking:
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      checksums.ini: add telepathy-glib
      checksums.ini: add loudmouth
      xf86-video-omapfb: bump SRCREV
      telepathy-glib: add libxslt-native to DEPENDS
      checksums.ini: add sugar stuff
      sugar-toolkit: fix python detection
      hippo-canvas: add DEPENDS
      sugar-base: fix python header detection
      angstrom feedbuiler: run entries through 'sort | uniq'
      gtk+ 1.2: use sed to get m4 macros to work with gettext > 0.14.0
      angstrom glibc: -Os seems to trip up almost all non vanilla gcc
toolchains (e.g. the harry potter ones from CSL), so take a small size
penalty to save
      xmms: add sed magic to fix builds with gettext > 0.14.0
      ballfield: add SDL demo of a field with balls
      checksums.ini: add gnuplot
      gimp: add 2.6.0
      duke3d: add svn version from icculus.org
      angstrom feed builder: add more apps
      angstrom feed builder: remove minimo now we have fennec
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      linux-openmoko 2.6.24+git: build in BT and sound modules to work
around toolchain bugs
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      xorg-xserver: change hal to RRECOMMENDS
      checksums: add another 4.3.2 checksum
      angstrom: enable oabi compat for gta01 to keep gllin working,
schwartz doesn't seem to work 100%
      linux-openmoko: bump PR for OABI change
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      duke3d: fix DEPENDS
      angstrom feed builder: add xfce stuff
      angstrom feed builder: add gnome-icon-theme to cleaning list
      libtelepathy: add telepathy-glib to DEPENDS
      angstrom 2008 preferred versions: move busybox to 1.11.3 since
someone deleted the 1.11.1 version we want......

Korey Lu (1):
      ttf-wqy-zenhei 0.6.26: add chinese zenhei fonts

Marcin Juszkiewicz (6):
      MAINTAINERS: I am no longer interested in Tosa
      MAINTAINERS: I am no longer interested in OpenZaurus
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      checksums.ini: re-sorted to remove duplicates
      checksums.ini: merged with Poky
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev

Michael 'Mickey' Lauer (15):
      firefox.inc: fix syntax
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      ttf.inc: INHIBIT_DEFAULT_DEPS
      add task-fonts-truetype
      preferred-{om-2008|xorg}-versions.inc: sync with what's
available in the tree
      add illume-theme-illume (from raster)
      add task-x11 and task-x11-illume
      freesmartphone.org: update revs
      task-x11[-illume]: switch to FILE_PR
      taks-fso-compliance: add
      frameworkd git: ship yaml rules in -config package and tag them
as CONFFILE
      preferred-om-2008-versions.inc: bump busybox,
gdk-pixbuf-csource-native, vala(-native)
      busybox 1.11.1: update to latest stable version (=3D1.11.3)
      python 2.5.2: add some patches from pymaemo, remove
old-and-deprecated package
      dmidecode 2.9 set COMPATIBLE_HOST. closes #4548

Michael Lauer (1):
      preferred-om-2008-versions.inc: bump gettext

Mike Westerhof (6):
      SlugOS: Set PREFERRED_VERSION for gettext, e2fsprogs, and add a tempo=
rary
      merge of '32e97ff195b391fe0a9c6e1af5eada1538dbfa52'
      checksums.ini: added apex 1.5.14
      checksums.ini: Additions from the SlugOS packages
      SlugOS: slugos-packages - demote gdb due to build failure
      SlugOS: slugos-packages - reinstate gdb

Otavio Salvador (73):
      xfce-mcs-manager.inc: fix .pc file to not have tmpdir on includedir f=
ield
      XFCE: allow to set a specific release to be used while grabbing the s=
ource
      gtk-xfce-engine: specify the required XFCE release
      mousepad: specify the required XFCE release
      exo: specify the required XFCE release
      xfwm4-themes: use a single recipe since we don't have multiple
versions packaged
      xfwm4: use a single recipe since we don't have multiple versions pack=
aged
      xfdesktop: use a single recipe since we don't have multiple
versions packaged
      xfce-utils: use a single recipe since we don't have multiple
versions packaged
      xfce-mcs-plugins: use a single recipe since we don't have
multiple versions packaged
      xfce-mcs-manager: use a single recipe since we don't have
multiple versions packaged
      xfce4-panel: use a single recipe since we don't have multiple
versions packaged
      xfce4-mixer: use a single recipe since we don't have multiple
versions packaged
      xfce4-appfinder: use a single recipe since we don't have
multiple versions packaged
      libxfcegui4: use a single recipe since we don't have multiple
versions packaged
      libxfce4util: use a single recipe since we don't have multiple
versions packaged
      libxfce4mcs: use a single recipe since we don't have multiple
versions packaged
      xfce4-dev-tools: use a single recipe since we don't have
multiple versions packaged
      libxfce4util: readd pkgconfig class to fix stagging
      libxfce4mcs: readd pkgconfig class to fix stagging
      xfwm4: add alternative to x-window-manager
      xfwm4: append dynamic packages
      xfce-terminal: update to 0.2.8
      xfce4-dev-tools: update to 4.4.0.1
      thunar: update to 0.9.0
      mousepad: update to 0.2.13
      gtk-xfce-engine: update to 2.4.2
      exo: update to 0.3.4
      xfwm4-themes: update to 4.4.2
      xfwm4: update to 4.4.2
      xfprint: update to 4.4.2
      xfdesktop: update to 4.4.2
      xfce-utils: update to 4.4.2
      xfce-mcs-plugins: update to 4.4.2
      xfce-mcs-manager: update to 4.4.2
      xfce4-session: update to 4.4.2
      xfce4-panel: update to 4.4.2
      xfce4-mixer: update to 4.4.2
      xfce4-icon-theme: update to 4.4.2
      xfce4-appfinder: update to 4.4.2
      orage: update to 4.4.2
      libxfcegui4: update to 4.4.2
      libxfce4util: update to 4.4.2
      xfdesktop: fix a relocation and a memory leak
      xfce4-panel: split plugins in multiple packages
      libxfce4mcs: update to 4.4.2
      thunar: properly install libraries into the staging area
      checksums.ini: add thunar 0.9.0
      checksums.ini: add xfdesktop 4.4.2
      checksums.ini: add libpam 1.0.2
      xfdesktop: depends on thunar to enable support for desktop icons
      checksums.ini: add exo 0.3.4
      checksums.ini: add gtk-xfce-engine 2.4.2
      checksums.ini: add libxfce4mcs 4.4.2
      checksums.ini: add libxfce4util 4.4.2
      checksums.ini: add libxfcegui4 4.4.2
      checksums.ini: add xfce4-dev-tools 4.4.0.1
      checksums.ini: add xfce4-icon-theme 4.4.2
      checksums.ini: add mousepad 0.2.13
      checksums.ini: add orage 4.4.2
      checksums.ini: add xfce-mcs-manager 4.4.2
      checksums.ini: add xfce4-appfinder 4.4.2
      checksums.ini: add xfce4-mixer 4.4.2
      checksums.ini: add xfce4-panel 4.4.2
      checksums.ini: add xfprint 4.4.2
      checksums.ini: add xfwm4-themes 4.4.2
      checksums.ini: add xfce4-session 4.4.2
      base.bbclass: strip branch name in base_detect_branch
      checksums.ini: add xfce-utils 4.4.2
      checksums.ini: add xfwm4 4.4.2
      checksums.ini: add xfce-mcs-plugins 4.4.2
      checksums.ini: add terminal 0.2.8
      task-xfce-base: use splited xfce4-plugins

Paul Eggleton (1):
      corsair: fix compile for qte/qte-mt selection

Phil Blundell (16):
      lirc: move .la files and other development things to -dev package
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      rootfs_ipk: add support for BAD_RECOMMENDATIONS and
      gcc-4.1.1: fix problem with backslash in sed command
      gcc-cross-kernel: defeat fixincludes
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      gcc: respect ${layout_includedir}
      perl-native: respect STAGING_BINDIR over prefix
      glibc: remove ld.so.conf, don't ship ldconfig if USE_LDCONFIG=3D0
      binconfig: add terminating slashes to path matching regexps
      package.bbclass: don't output postinst for ldconfig if USE_LDCONFIG=
=3D0
      openchrome: add missing file
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      autotools: also stage python files in ${prefix}/lib
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      bluez-utils: don't blow up if ${base_sbindir} is same as ${sbindir}

Philip Balister (3):
      libxml2-2.7.2.tar.gz : Add entry in conf/checksums.ini
      numpy-1.1.1.tar.gz : Update checksums.ini
      checksums.ini : Add checksum for boost_1_36_0 and sort.

Robert Schuster (5):
      classpath 0.97.2: Added patch to fix to fix drawPolyline bug.
      linux 2.6.24: Updated defconfig for atngw100
      gizmod 3.4: New recipe.
      firefox.inc: Fix typo.
      libsdl-image: Moved export of SDL_CONFIG location into inc, fixes #47=
28.

Thomas Kunze (6):
      base-files: remove custom fstab file for collie
      pointercal: add file for collie
      linux-rp: update collie patches
      linux-kexecboot: use hacked sharp-flash driver
      checksums.ini: add kexecboot
      linux-kexecboot: repair collie defconfig

freyther@openembedded.org (4):
      wvstreams: Stage the headers and libraries
      wvstreams: Split wvstreams into smaller packages
      checksums: iproute2 2.6.22-070710
      checksums: Add popt 1.13

woglinde (10):
      libinconv: split up into .inc and version file
      libiconv: fix the wrong merge
      gmp: update to version 4.2.4
      checksum.ini: add checksums for gcc-4.3.2
      gettext: add patch open() mode from ubuntu
      Merge branch 'org.openembedded.dev' of
git@git.openembedded.net:openembedded into org.openembedded.dev
      uclibc.inc: do not install ldconfig and ldd to staging
      libsdl-x11: fix sdl.m4 for sdl-config
      libsdl-image: remove the integrated stupid sdl.m4 packages
      Merge branch 'org.openembedded.dev' of
git://git.smartlink.ee/openembedded into org.openembedded.dev


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


