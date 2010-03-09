Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Np0FO-0000Tn-02
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 15:17:29 +0100
Received: by iwn4 with SMTP id 4so6454732iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=4EHJQT7HRpQ3J2w6JPC9U1mxfqvnzK8tKBRnCORQzrY=;
	b=LmhM3yNMl1hMpUBbHm3qAZ6e74o727Jc8SL5f4qxYh3bGQSKUjr70eiUPgtKXe5bA2
	u0BmDCrAHvihRiidsAq9t1fvFqhCfl2UylNschnwf4CI0AWqCbbMs9uFqmCvN59a7TdG
	AFy+xLAN0bosMZK3qsZa+1XIQsL20tapre+uI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VKK/6d/ZLZmLJgBTVjiXd50RUXzMHOEWsRG4/1hQvjwaRED5IbzBe4nKToeXuFMLMG
	UrEpmb7R7acXfL64EaLCxbQZa2y1LG9nyaC3bQ9bRuV4p2Ye0mWRb1nl9l3M4TPDgQcw
	HfXsTCDVP14iz3t515qyK46RIzwR28pEMaSd4=
MIME-Version: 1.0
Received: by 10.231.167.135 with SMTP id q7mr35940iby.84.1268144064712; Tue, 
	09 Mar 2010 06:14:24 -0800 (PST)
Date: Tue, 9 Mar 2010 09:14:24 -0500
Message-ID: <f96d234e1003090614m36004721h4c40de07b0bdde52@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog, 2010-03-01 to 2010-03-08
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
X-List-Received-Date: Tue, 09 Mar 2010 14:17:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for org.openembedded.dev, 2010-03-01 to 2010-03-08

Antonio Ospite (1):
  meta-toolchain: Show the host system in toolchain archive name

Bernhard Guillon (2):
  barnyard: add barnyard - a output system for snort
  snort: add snort - a free lightweight nids

Bernhard Reutner-Fischer (1):
  busybox: wget accept and ignore --no-check-certificate

Chris Conroy (1):
  rootfs_ipk.bbclass: move rootfs postprocess command

Chris Larson (2):
  Revert "package.bbclass: when running 'file', be explicit about the path =
to
  m4: use autotools_stage, checksum in SRC_URI, switch to .inc, add 1.4.14

Denis 'GNUtoo' Carikli (1):
  xserver-xorg-conf : fix AllowEmptyInput problem for eee701 and bump PR

Frans Meulenbroeks (3):
  u-boot: removed environment patches
  linux/linux-davinci/hawkboard added netfilter modules to defconfig
  task-nas-server removed the openmoko part

Graeme Gregory (3):
  attr_2.4.44.bb : uclibc needs a -lintl to compile
  angstrom-2008.1.conf : increment angstrom uclibc usage to the latest poin=
t r
  angstrom-2008-preferred-versions.inc : downgrade udev for uclibc

Holger Hans Peter Freyther (9):
  vorbis-tools: Upgrade to 1.2.0
  wireshark: Upgrade from 1.0.5 to 1.2.6
  gd: Upgrade from 2.0.33 to 2.0.36RC1
  fetchmail: Upgrade to 6.3.14 to fix known security issues
  expat-2.0.0: Upgrade expat library to fix various known security bugs
  php-5.2.11: Upgrade to 5.2.12 to fix various issues
  php: Upgrade from php 5.1.12 to 5.1.13
  gpdf: Remove all gpdf recipes from the repository
  sudo: Upgrade from 1.7.2p1.bb to 1.7.2p4

Jeremy Lain=C3=A9 (1):
  qt4-tools-native_4.5.2.bb: use Qt's builtin freetype, otherwise build fai=
ls

Koen Kooi (39):
  firefox 3.6: bump PR for package.bbclass strip problem
  qt4: bump PR for package.bbclass strip problem
  exalt: convert to new style staging
  e-wm: convert to new style staging
  qt4: adjust sed magic to recent QT to sanitize .pc files properly
  ptlib 2.6.5: add RGB16 support
  ptlib: add 2.8.0
  opal: add 3.8.0
  ekiga git: update to 3.3.1 and add rgb16 support
  pango: convert pango.inc to use BBCLASSEXTEND for -native
  flex: add 2.5.35 with new-style checksums, staging and class extension
  webkit-gtk: bump PR for flex-native change
  midori: add 0.2.3
  file.inc: attempt to create proper file.inc that got missing in the earli=
er
  bison.inc: attempt to create proper file.inc that got missing in the earl=
ier
  bison/file.inc: INC_PR -> INCPR
  apex-env 1.5.14: turn of QA checks, adding LDFLAGS is too hard for this
  gperf-native: convert to new style staging and BBCLASSEXTEND
  pixman git: update to 0.17.8 + flags branch to test upcoming 0.18.x RCs
  libxml2: readd binconfig inherit that went missing
  libxslt 1.1.22: convert to new style staging and BBCLASSEXTEND=3Dnative
  gecko-mediaplayer: bump PR so postinst picks up firefox 3.6
  xf86-video-omapfb: update to latest git
  firefox: fix .pc files for 3.5.2 and 3.6, fix up staging a bit
  geck-mediaplayer: add svn version
  gnome-doc-utils: don't build docs since we lack the libxml2 python native=
 mo
  python-pygobject: add libffi dep so -lffi actually works
  gnome-python-extras: adjust to pygtk -> pygobject codegen move
  gconf-editor: add 2.28.0
  gtk+: reinstate no-demos patch for gtk+-native, it fails to build without=
 it
  shadow: use u-a on binaries that conflict with util-linux-ng
  util-linux-ng: use u-a on binaries that conflict with shadow
  opkg*: bump SRCREV to get fixes for conffile reporting and support mixed =
arc
  eog: fix build when gnome-python gets detected
  claws-mail: convert to new-style staging
  hal: convert to new style staging
  gst-plugins-base: add support for rowstride conversion and NEON audioconv=
ert
  gnutls: 2.8.5 lacks the .m4 files, so don't abort if cp fails
  angstrom: prefer gnutls 2.4.2, 2.8.5 induces too much breakage

Lucian Ion (1):
  update-apr-library-version-to-1.3.5

Marcin Juszkiewicz (13):
  autoconf: merged Poky changes (BBEXTENDCLASS + new staging)
  autoconf: merged Poky changes (BBEXTENDCLASS + new staging)
  gnu-config: merge Poky improvements (BBCLASSEXTEND, new staging)
  gnu-config: remove not used uclibc.patch
  bison: merged Poky changes (BBEXTENDCLASS + new staging)
  file: merged Poky changes (BBEXTENDCLASS + new staging)
  base.bbclass: create tmp/legacy-staging.log file with names of recipes wh=
ich
  file: added forgotten files
  bison: added forgotten files
  file: package also magic files - spotted by Koen
  linux: fix compulab_image dependency loop
  gnutls: added 2.8.5, adapted to new staging
  gnutls: install m4 macros only in <2.8.5 versions

Martin Jansa (27):
  opkg: don't run merger in case when /usr/lib/ipkg is link
  elementary-theme-gry: bump SRCREV
  linux-openmoko-2.6.32: simplified JBT6k74 driver as WSOD fix
  initscripts-shr: create /dev/pts, /dev/shm if they doesn't exist (devtmpf=
s d
  task-shr-minimal: we need MACHINE_ARCH, because task-base and MACHINE_TAS=
K_P
  mesa-dri, libdrm: use distro override to force same PV for om-gta01 and o=
m-g
  xorg-xserver-common: move DISTRO_XORG_CONFIG_MANAGER from RDEPENDS to DEP=
END
  xinput-calibrator: add version 0.6.0 and also git version from misclick b=
ran
  task-shr-minimal: add phoneui-apps-quick-settings
  libdrm: use the same OECONF, even when gta01 won't use glamo api
  e-wm: limit illume-keyboard-flow.patch to rev 46549, it was applied in 46=
550
  linux-openmoko-2.6.32: add last 2 patches from DRM branch"
  libphone-ui-shr: drop etk dependency
  xboard: add checksums
  pango-native: remove 1.22.0 as it's already provided by pango_1.22.0.bb t=
han
  efreet: include efreet_desktop_cache_create in main package, because it's=
 ne
  libxml2: migrate -native to BBCLASSEXTEND
  libxml2: new version 2.7.6
  shr: use numeric-alt keyboard in illume* config and default-numeric only =
in
  shr-launcher: fix SRCREV
  preferred-shr-versions: upgrade linux-libc-headers to 2.6.32
  mesa-dri_git: fix building progs (missing -lstdc++, similar patch used in=
 me
  task-shr: fix typo and add task-cli-tools, task-cli-tools-debug
  task-shr-feed: add estardict
  busybox: use u-a for /etc/default/mountall (collision with util-linux-ng-=
mou
  util-linux-ng: use u-a for /etc/default/mountall (collision with busybox-=
mou
  util-linux-ng: missing PR bump after u-a change

Michael 'Mickey' Lauer (2):
  pulseaudio: demote 0.9.19 and 0.9.21 for motorola ezx series and openmoko=
 de
  msmcommd: catch up with upstream changes

Michael Lippautz (8):
  libdbd-sqlite-perl: New recipe (Perl SQLite db backend)
  libyaml: Move to new staging
  libyaml: Bump version to 0.1.3
  libidn: Move to new staging
  libidn: Bump version to 1.18
  libgsasl: Add recipe
  python-wsgiref: Add new recipe
  libol: Convert to new staging

Michael Smith (1):
  kernel.bbclass: pass ${KERNEL_VERSION} to depmod -a

Mike Westerhof (1):
  SlugOS: preferred-slugos-versions.inc: bump up libtool to latest version =
(Re

Petr =C5=A0tetiar (4):
  linux 2.6.24: update ts72xx patchset and stop using it as default kernel
  linux 2.6.27: add support for ts72xx and make it default kernel
  linux 2.6.32: update to latest stable 2.6.32.9 patchset
  linux 2.6.32: add support for ts72xx boards

Phil Blundell (4):
  gtk+: build gtk-demo and package it appropriately
  Revert "xz: add xz package"

Philip Balister (1):
  omniorb : Update to version 4.1.4

Sebastian Spaeth (8):
  sane-srcrevs.inc: bump shr-related recipes to current state
  ffalarms: bump git version as current vala syntax failed
  libgsm0710mux: bump & move SRCREV from sane-srcrev-fso.inc to recipe
  fso-abyss: Update om-gta0X config files to include device_ack_timeout =3D=
 2
  mokonnect: rdepend on connman-plugin-udhcp
  mokonnect: also bump PR due to previous RDEPEND change
  ffalarms: directly RDEPEND on alsa-scenarii-shr

Steve Sakoman (2):
  libgles-omap3: fix for unwanted *.desktop file, shorten app names in menu=
s
  libusb: add patch to fix "BOGUS urb flags" issue

Thomas Zimmermann (2):
  ca-certificates: add package for ssl certificates
  ventura: add ca-certificates to RRECOMMENDS Signed-off-by: Thomas Zimmerm=
ann

Tom Rini (6):
  qemu: Perform our sanity checks based on ENABLE_BINARY_LOCALE_GENERATION
  eglibc-package.bbclass: Add eglibc-pic, resync eglibc-dev with glibc, bum=
p P
  Add glibc-pic package
  firefox: Perform a number of cleanups and fix consistency issues.
  glibc*.inc: Bump OLDEST_KERNEL to 2.6.16
  qemu: Move gcc version check, qemu-TARGET logic into qemu.bbclass

Valery Febvre (1):
  podboy: update to 1.5.0

Vaudano Luca (1):
  estardict: new recipe for elementary based offline dictionary reader


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-03-01 to 2010-03-08


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


