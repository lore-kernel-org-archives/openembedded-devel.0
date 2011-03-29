Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Q4a7b-0008Cn-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 16:42:16 +0200
Received: by wye20 with SMTP id 20so221094wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0O9yhWP87fdsZsO/TjekrMkmBJvLslSXCqFNZZtKhR4=;
	b=qod+ZiS6vRU3g0p1TdPxU8v5tf+gz263wTCRtXIs/v9ULIwQav+a9wgOVvynB59dLy
	wvknzoq1dd+Qyl7+mzhx6GxPdaB4KhMvkLIQ6j2VSgxev8GF/LFdv9Sh6oQPRb2RqZvT
	B1Ry/64y7axEjctEMsJneqoQJyZUtqYyqg5Dk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vmwEV25p8RnHW8IQatRA48USf0ISUpe1mu9Wv7blXxu8Zrz8nge7XaP4NAJEIxXvBp
	lFcU7SjMXskvubB/U3qfCPJm+W/pNKTBVKWNINPIXoQb2VGnwi/nJM4iGssW9zeNPb07
	ZCYk8lhP2XKH2jKzjZAXrpzsVadNMEmquXzvg=
MIME-Version: 1.0
Received: by 10.216.152.170 with SMTP id d42mr5818877wek.39.1301409602292;
	Tue, 29 Mar 2011 07:40:02 -0700 (PDT)
Received: by 10.216.47.85 with HTTP; Tue, 29 Mar 2011 07:40:02 -0700 (PDT)
Date: Tue, 29 Mar 2011 10:40:02 -0400
Message-ID: <AANLkTi=98=Xhhhe4x3oSYBm6zq+tqOgMryoetZpsy+_m@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog, 2011-03-21 to 2011-03-28
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
X-List-Received-Date: Tue, 29 Mar 2011 14:42:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2011-03-21 to 2011-03-28

Andrea Adami (12):
  linux: edit fb font size for collie and poodle in 2.6.38.
  linux: remove unsupported 2.6.37 Zaurus defconfigs. We test 2.6.38 now.
  linux-kexecboot: remove obsolete 2.6.38-rc8 defconfigs in _git.     * Let=
 pl
  linux-kexecboot: edit fb font size for collie and poodle in 2.6.38.
  linux-kexecboot: edit fb font size in older 2.6.2x kernels.
  linux: upddate 2.6.30 defconfig for tosa (fb font size).
  linux-2.6.38: default version for Zaurus devices.     Signed-off-by: Andr=
ea
  linux-kexecboot-2.6.38: default version for Zaurus devices.     Signed-of=
f-b
  zaurus-2.6.inc: default to standard linux kernel recipe for all devices.
  udev: remove udev-compat for Zaurus devices since we use 2.6.38 finally.
  kexecboot: bump to d391c05fe7b9379f62a34e7dd5deb851de2b0a0b.
  linux-kexecboot: bump PR to follow kexecboot update.     Signed-off-by: A=
ndr

Andreas Mueller (1):
  xfce4-session_4.6.1.bb: fix typo lbwnck =E2=86=92 libwnck

Denis 'GNUtoo' Carikli (5):
  gob2 and gob2-native: delete version 2.0.14
  gmpc 0.20.0 : bump PR after gob2 fix
  ekiga_git: fix configure not finding boost signals
  add new recipe: slim (an X display manager)
  abuse: update to 0.7.1,fix license,compilation(host libdir),and sdl insta=
ll

Denis Carikli (1):
  bug20: add wifi and bluetooth to MACHINE_FEATURES

Denys Dmytriyenko (3):
  external-toolchain-csl: update licensing info, document exceptions
  external-toolchain-angstrom: update licensing info, document exceptions
  external-toolchain-angstrom: variable name for gdb license got changed

Henning (1):
  ecj-bootstrap: try 5 times to compile the classes

Henning Heinold (4):
  ecj: for ecj-initial 512 mb heapsize is okay for ecj-bootstrap we need 10=
24
  inetlib: move to proper place
  classpath-native: switch from inherit gettext directly to gettext-native
  llvm: merge native recipe into the normal recipe

Jeff Lance (1):
  matrix-gui: Bump up SRCREV

Kartik Mohta (2):
  libarchive: Requires libxml2
  cmake: add `ncurses` to `DEPENDS` (for `ccmake`)

Khem Raj (4):
  uclibc-git: Add FTS support and update to -rc3
  yasm: Upgrade yasm_0.7.2.bb -> yasm_1.1.0.bb
  cairo_1.10.0.bb: Fennec will now need tee support in cairo so enable it
  fennec: Make it build on ARM eglibc/uclibc

Koen Kooi (5):
  networkmanager 0.8.1: fix build against libl using the patch from the git=
 ve
  x-load git: update to 1.5.0
  u-boot git: remove duplicate filesdir line
  libav: add proper recipe for git version     omapfbplay: switch to libav
  angstrom: switch to libav

Lukas M=C3=A4rdian (1):
  e-wm-config-illume2-shr: use palmpre config option and bump SRCREV

Martin Jansa (25):
  e-wm: use ESYSACTIONS,EMENU,ECONFIG,ETHEME variables instead of hardcoded=
 e-
  bitbake.conf: define shared PERSISTENT_DIR
  native.bbclass: define empty PACKAGES_DYNAMIC
  evas, pango, llvm-native: drop empty PACKAGES_DYNAMIC_virtclass-native as=
 it
  eeze: fix checksums
  cornucopia: bump SRCREV a bit for fsodeviced build fix
  msmcomm: bump SRCREV
  sanity.bbclass: add check for changed bb_persist_data.sqlite3 location
  eve: fix build with newer webkit-efl
  libnl: rename libnl2 to libnl as used in openembedded-core
  libnl: don't use /usr/include/libnl2 anymore
  libnl: add libnl.inc and use INC_PR
  SHR: drop blacklist entries for libnl, now when libnl2 is used by default
  libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
  hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
  iw: depend only on libnl(-2.0) not libnl2(-2.0)
  ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
  wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
  connman: depend only on libnl(-2.0) not libnl2(-2.0)
  libnl_git: remove fix-pktloc-dep-race.patch from this version
  libnl-1.1: rename to libnl1 and build only static lib
  networkmanager_git: fix build with static libnl1
  task-shr-feed: add subversion, cvs
  fsoaudiod: add asound.conf to CONFFILES and RCONFLICTS with alsa-state
  mc: add RRECOMMENDed mc-skins package and more files to FILES_PN

Matt Rice (1):
  angstrom omap3 mkcard: improve loop mount handling

Michael 'Mickey' Lauer (1):
  vala[-native]: 0.11.7.1 -> 0.11.7.2

Mike Westerhof (1):
  SlugOS: slugos-packages - demote ftpd-topfield (recipe needs work), promo=
te

Otavio Salvador (4):
  wrapper/install: add -t support
  flash-plugin: update to 10.2.153.1
  vlc: use INC_PR
  vlc (1.1.4.1): depends on lua5.1

Paul Menzel (4):
  xfce_session_4.6.{1,2}: explicitely pass the path of `iceauth`
  xbmc: add `libass` to `DEPENDS`
  xbmc: add patch to fix `error: call of overloaded 'abs(int64_t)' is ambig=
uou
  orc: add version 0.4.10

Peter Gsellmann (1):
  gsoap_2.7.13 build errors, amendment

Roger Monk (7):
  u-boot-git:  Add omap4430-panda to u-boot git recipe
  omap4430-panda: Prefer u-boot-git and remove extra custom x-load
  gst-plugins-good: update to 0.10.28
  ti-gst-ducati: Update to latest SRCREV, package libs
  ti-libdce: Update to latest SRCREV
  omapfbplay: Add patch for dce codec error handling
  omap4430-panda: Switch panda to use new omap4 include + add new SOC_FAMIL=
Y

Siddharth Heroor (4):
  TI IPC: Fix License field.
  TI IPC: Add missing dependencies
  TI IPC: Add version 1.22.04.25
  TI XDCTools: Add version 3.20.08.88

Simon Busch (5):
  fsoaudiod: several updates to the recipe to be usefull
  libfsosystem: add initial recipe
  fsodeviced: add libfsosystem as dependency and bump PR
  cornucopia: bump SRCREV
  elfe: bump SRCREV to latest

Tom Rini (1):
  coreutils-native: Disable gmp support


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5473 FIXED       gettext-native-0.18-r2 fails to compile

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


