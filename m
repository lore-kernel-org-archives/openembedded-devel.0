Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NwH4k-0003ws-8e
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 17:40:28 +0200
Received: by pwj5 with SMTP id 5so2965221pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=WXCz9N2TB73soHLJVbmtfC4p6PwJ9lgF6Ichhi09Gp4=;
	b=K/BTmo28GRKAwkR09uhFNXhQrK5enVjyidUW9SZTOfZgdbT/X/rbXYYcMdGqqe5jiG
	HGehxiaony1MuGtnTY3B4XHyQG0lSYUsPW+tiuqQjEy2B17h+cpqFs4SmVD16y2nWGdq
	4Qwm2MN4PLoyjxDRt9Z/KQWx8k+Vjahxjg3ho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=t2XhP42Uudiyg1dDClIDjdtIXkcF1i2IT8hrKfweJJIN2JG/tbr/z8gD4hi02FaM3U
	P9yBX7FbED015ZQT1M8ZH3mSqlvdOPkFXmGxLPObKhaFtWUnVPGEUgN5EmBqfj4jHg6N
	lOviuF7Yqrier2X6TQ+muHQaEAGu1rCe3S3eU=
MIME-Version: 1.0
Received: by 10.231.36.134 with HTTP; Mon, 29 Mar 2010 08:37:11 -0700 (PDT)
Date: Mon, 29 Mar 2010 11:37:11 -0400
Received: by 10.141.187.4 with SMTP id o4mr4510216rvp.217.1269877031441; Mon, 
	29 Mar 2010 08:37:11 -0700 (PDT)
Message-ID: <f96d234e1003290837k46021762r9de41eb28ce93276@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-03-22 to 2010-03-29
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
X-List-Received-Date: Mon, 29 Mar 2010 15:40:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for org.openembedded.dev, 2010-03-22 to 2010-03-29

Adrian Alonso (1):
  u-boot_git.bb: add xilinx ml507 support

Antonio Ospite (9):
  base.bbclass: add missing import of metadata_scm
  ezx: update openezx-kernel version
  ezx: update ezx-boot-usb-native version
  ezx: update ezxd version and ezxd.init script
  ezx: update device_table-ezx.txt
  ezx: update ezx-gen-blob version
  numptyphysics: update SRC_URI
  gnutls: fix do_configure by depending on gtk-doc
  distros: remove leading dots in DISTRO_VERSIONs

Cliff Brake (1):
  geos: latest versions do not depend on boost

Denis 'GNUtoo' Carikli (8):
  mp3blaster: added version 3.2.5
  fbreader 0.12.1: fix QA issues and bump PR
  linux-2.6.33: added eee701 defconfig
  eee701: changed preferred linux version from 2.6.32 to 2.6.33
  gs 8.64 : fixed GNU_HASH and added checksums
  Revert "Added wl1251 firmware" (license issues)
  xserver-kdrive-common : Xserver: add support xorg for buglabs's bug 1.x a=
n b
  glib-2.0 2.23.6: depend on zlib(configure failed because of it missing)

Denys Dmytriyenko (2):
  u-boot: update LICENSE to more specific GPLv2
  meta-toolchain: fix SDK_PATH resolving early by swapping quoting

Enrico Scholz (1):
  rm_work.bbclass: reordered 'rm $dir -rf' arguments

Graeme Gregory (1):
  xserver-xorg-conf_0.1.bb : add omapzoom36x config files.

Holger Hans Peter Freyther (8):
  oeaudit: Do the PR thin inside the freebsd config.
  oeaudit: Add the FreeBSD revision to the package version.
  pulseaudio: Plug flaw with pulseaudio restarting itself..
  ettercap-ng: Attempt to unbreak the build with a recent libtool
  ettercap-ng: Fix the packaging of the doc package
  libsamplerate0-0.1.7: Fix configure run with recent autoconf
  oeaudit: Add -f option to fetch an auditfile from FreeBSD
  oeaudit: Handle some more naming variants for OE

Ihar Hrachyshka (1):
  Fixed concurrency problem for ZIP packed recipes.

Ilya Petrov (1):
  add 18 bpp support to psplash

Jesse Gilles (1):
  ruby_1.8.7-p248.bb: fix ext/dl compile

Jonathan Cameron (1):
  chrony: time synchronization recipe (chronyc and chronyd)

Khem Raj (7):
  ruby: Move to using INC_PR and BBCLASSEXTEND
  geos: Add recipe for 3.2.0
  geos_3.2.0.bb: Refine PACKAGES and contents.
  lzma: Use BBCLASSEXTEND to get native recipe.
  recipes: Get rid of redundant FILESPATH
  readline: Use BBCLASSEXTEND for native recipe.
  ppp: Prepend ${D} to INCDIR

Koen Kooi (63):
  sysvinit: bump PR for license change
  qmake2: don't install specs, those are packaged by the qt4 recipe. Ship e=
nv
  qt4: sync package between -native, -sdk and target packages
  x-load git: move beagleboard to 1.44
  firefox 3.6.2: add new version
  libcdio: be more precise about license
  glib-2.0: add 2.23.6
  usbmuxd: add 1.0.3
  libplist: add 1.2
  libimobiledevice: add 1.0.0
  libgpod: add 0.7.92
  gvfs: add 1.5.5
  angstrom: prefer glib 2.23.6
  angstrom: add script to make a mini personal feed containing only the dif=
fer
  networkmanager, -applet: bump PR
  udev 151: follow debian/fedora and use /lib/udev as libexecdir. This fixe=
s p
  gnome-mplayer: add 0.9.9.2
  x-load git: update SRCREV for SDRC fix
  angstrom-uboot-scripts: enable triple buffering for dsplink script, fixes=
 te
  udev 151: bump PR
  apmd: convert to new style staging
  libv4l: convert to new style staging and add 0.6.1
  libmad: convert to new style staging
  pkgconfig: convert to new-style staging
  expat: convert to new style staging
  cups: convert to new style staging
  fontconfig: convert to new style staging
  angstrom: switch to fontconfig 2.6.99
  freetype: convert to new style staging
  faac: fix packaging and convert to new style staging
  fontconfig: add 2.8.0 and make it default for angstrom
  wgois: add missing dep and convert to new-style staging
  freeimage: convert to new style staging
  qt4-embedded-gles 4.6.2: try harder to disable openvg and build linuxfb s=
upp
  xinput-calibrator: add 0.6.1
  cmake bbclass: use autotools, not autotools_stage
  cmake 2.6.4: convert native to new style staging and add (currenly non wo=
rki
  curl: add 7.20.0 to fix http://curl.haxx.se/docs/adv_20100209.html and co=
nve
  gtk-doc: convert to new style staging and use BBCLASSEXTEND
  lzo: convert to new style staging and use BBCLASSEXTEND for -native
  jpeg: convert to new-style staging and use BBCLASSEXTEND for -native
  libgpg-error: convert to new style staging
  ncurses: convert to new-style staging
  qemu: curl isn't in DEPENDS, so disable it
  gnome-common: convert to new style staging
  orbit2: convert to new style staging
  libid3tag: convert to new style staging
  dbus-glib: convert to new style staging
  dbus-glib: ad 0.86
  libid3tag: remove stray }
  cmake bbclass: s/build/target/ for cflags
  libmikmod: convert to new style staging
  openscenegraph: add 2.9.6, no HW accel yet
  webkit: bump SRCREV
  ppp: convert to new style staging
  openssl: convert to new style staging
  libpcap: convert to new style staging
  wireless-tools: convert to new style staging
  arora: add 0.10.2, needed to build against qt 4.6.x
  libpcap: also conver 1.0.0 to new style staging
  qt4: fix pkgconfig logic to avoid: NOTE: <type 'exceptions.Exception'>:va=
ria
  sqlite: convert to new style staging
  cmake bbclass: add rudimentary support for cmake site files

Marcin Juszkiewicz (7):
  xserver-xorg-conf: really add BUG 2.0
  networkmanager-openvpn: added missing dependency on glade
  e2fsprogs-libs: dropped as e2fsprogs provide those libs now
  e2fsprogs: cover e2fsprogs-libs too
  misc recipes: migrate from e2fsprogs-libs to util-linux-ng/e2fsprogs
  util-linux-ng: add native
  networkmanager-openvpn: added missing dependency on gnome-keyring

Marco Cavallini (12):
  machine/mh355.conf : Added new Microhard MH355 machine based on AT91SAM92=
63
  linux_2.6.28.bb: added patches for machine Microhard mh355
  linux-2.6.28/mh355/linux-2.6.28.10-at91-mh.patch: added patches for machi=
ne
  MAINTAINERS: added myself as mantainer of machine Microhard mh355
  mh355.conf: Added producer website to machine conf
  linux-2.6.28.10-at91-mh.patch: removed trailing whitespaces, please apolo=
giz
  kaeilos/issue: Changed KaeilOS login logo
  kaeilos-2009-preferred-versions.inc: Updated package versions
  mh355/interfaces: added lan settings for machine mh355
  mh355/xorg.conf: added xorg.conf settings for machine mh355
  kaeilos/issue: Changed KaeilOS login logo (again)
  base-files_3.0.14.bb: bumped PR due to KeilOS new issue file

Martin Jansa (21):
  frameworkd-config-shr: bump SRCREV
  fso: bump SRCREVs to latest
  vim: add diffutils to RSUGGESTS, as vimdiff doesn't like busybox version =
of
  EFL: bump SRCREV, for bluetooth module fix
  frameworkd: bump SRCREV for vibration
  ruby: resolve dependency loop virtual:native:ruby -> ruby-native
  shr-splash: bump SRCREV for hide VT cursor patch
  pyphonelog: bump SRCREV for dbus name fix
  pyphonelog: fix SRCREV, sorry
  libphone-ui: fix weak assignment in sane-srcrevs.inc
  linux-openmoko-2.6.32: upgrade to 2.6.32.10 and one additional patch
  ffalarms: move old 0.2.2 to obsolete with it's checksum, drop unused patc=
h
  alsa-scenarii-shr: move SRCREV to recipe
  alsa-scenarii-shr: move recipe to obsolete
  libxslt: introduce libxslt.inc, move checksums to recipe, add 1.1.26
  checksums: drop libxml2, libxslt checksums which were moved to recipes
  shr-wizard: add e-wm to DEPENDS
  gnome-keyring: remove trailing / for target directories
  libatomics-ops: add patch avoiding installing 2 header files twice
  webkit-efl: remove Ecore_data.h include to fix build with newer EFL
  glib-2.0_2.23.6: rediffed and reenabled atomic-thumb.patch

Martyn Welch (5):
  ettercap-ng: Pass location of ncurses
  gypsy: Add version 0.7, remove broken svn recipe
  udhcp_0.9.8.bb: Update SRC_URI
  Grub: Add disk geometry patch
  mktemp_1.6.bb: use update-alternatives

Michael 'Mickey' Lauer (5):
  vala[-native]: 0.7.10.5 -> 0.7.10.281
  vala-dbus-binding-tool: 0.1.4 -> 0.1.5
  fso-specs: catch up with upstream changes and set proper packaging ARCH
  libfso-glib: catch up with upstream changes
  linux-leviathan: bump to 48afbaf19428893b7aec0a385970f300c38300c3 and ena=
ble

Michael Stanger (1):
  lua: Adopt new staging and BBCLASSEXTEND

Mike Westerhof (1):
  SlugOS: slugos-packages.bb - update to accomodate removal of e2fsprogs-li=
bs

Paul Menzel (4):
  libnfo: Add libnfo hg.
  libplayer: Add libplayer hg.
  libvalhalla: Add recipe for libvalhalla 1.0.1.
  libvalhalla: Add libvalhalla hg.

Ricardo Salveti de Araujo (1):
  groff-1.19.2: avoid running install-info when installing the package

Richard Purdie (1):
  manifest.bbclass: Remove since its broken and unused

Roman I Khimov (82):
  libnfnetlink: unify versions with .inc file
  libnfnetlink: don't libtoolize version 0.0.30
  libnfnetlink: add version 1.0.0
  libnetfilter-queue: rename recipe dir to libnetfiler
  libnetfilter-conntrack: add new recipe
  conntrack-tools: add new recipe
  arptables: add new package
  bridge-utils: add ifupdown script from Debian
  iptstate: move to .inc to ease newer versions addition
  iptstate: build with libnetfilter-conntrack
  iptstate: add version 2.2.2
  acpid: convert to INC_PR
  acpid: add script to halt on power button press
  gamin: add missing dependency on glib-2.0
  fileschanged: new recipe
  ulogd: new recipe
  fprobe-ulog: new recipe
  htb-init: new recipe
  Revert "htb-init: new recipe"
  htb-init: fix ip location, use init script, update package_arch
  cpan-base: add perl version to PR
  perl-native_5.8.8: allow architecture difference in host's Errno
  perl: add version 5.10.1
  classes/cpan-base: fix perl version regexp
  cpan_build: adapt to new staging for native
  libversion-perl: add version 0.80
  liberror-perl: add version 0.17016
  libxml-generator-perl: add XML::Generator Perl module
  libio-zlib-perl: add newer version (1.10)
  libencode-detect-perl: add Encode::Detect Perl module
  libdb-file-perl: add DB::File Perl module
  libtest-pod-perl: add Test::Pod Perl module
  libsocket6-perl: add Socket6 Perl module
  libio-socket-inet6-perl: add IO::Socket::INET6 Perl module
  libnet-ssleay-perl: add Net::SSLeay Perl module
  libio-socket-ssl-perl: add IO::Socket::SSL Perl module
  libip-country-perl: add IP::Country Perl module
  libtree-dag-node-perl: add Tree::DAG_Node Perl module
  libfilesys-df-perl: Add Filesys::Df Perl module
  libsys-hostname-long: Add Sys::Hostname::Long Perl module
  libcurses-perl: add Curses Perl module
  libcurses-ui-perl: Add Curses::UI Perl module
  libcrypt-unixcrypt-perl: add Crypt::UnixCrypt Perl module
  libconvert-binhex-perl: add Convert::BinHex Perl module
  libnet-cidr-perl: add Net::CIDR Perl module
  libdigest-hmac-perl: add Digest::HMAC Perl module
  libnet-dns-perl: Add Net::DNS Perl module
  libnet-pcap-perl: add Net::Pcap Perl module
  libole-storage-lite-perl: add OLE::Storage::Lite Perl module
  libnetpcaket-perl: Add NetPacket Perl module
  libnet-ident-perl: add Net::Ident Perl module
  libauthen-pam-perl: add Authen::PAM Perl module
  libmailtools-perl: Add Mail-Tools Perl module set
  libmime-tools-perl: add MIME-Tools Perl module set
  add Net::DNS::Resolver::Programmable Perl module
  libnetaddr-ip-perl: add NetAddr::IP Perl module
  libmail-spf-perl: add Mail::SPF Perl module
  libcrypt-openssl-bignum-perl: add Crypt::OpenSSL::Bignum Perl module
  libcrypt-openssl-random-perl: add Crypt::OpenSSL::Random Perl module
  libcrypt-openssl-rsa-perl: Crypt::OpenSSL::RSA Perl module
  libdigest-sha: allow native builds with BBCLASSEXTEND
  libmail-dkim-perl: add Mail::DKIM Perl module
  libnet-rawip-perl: add Net::RawIP Perl module
  libwww-perl: update to version 5.834
  libhtml-tagset-perl: fix PACKAGE_ARCH
  liburi-perl: remove broken configure_append, fix PACKAGE_ARCH
  Revert "cpan-base: add perl version to PR"
  distutils-common-base: move Python dir detection to separate class
  use PYTHON_SITEPACKAGES_DIR
  fetchmail: fix fetchmailconf packaging and fetchmail build
  lowpan-tools: fix lowpan-tools-tests packaging
  rpm: fix python-rpm packaging, add missing python-native build dependency
  sphyrna-python: fix missing python-native build dependency
  iptables: update to version 1.4.7
  vlan: add pre-up/post-down/up scripts
  tzcode: add recipe for 2010f version
  tzdata: set PACKAGE_ARCH to all
  tzdata: add 2010f version
  tzdata: fix wrt recent time zone changes in Russia
  mrtg: new recipe

Scott Garman (2):
  grip: Upgrade to 3.3.1
  sed-4.1.1: migrate to using BBCLASSEXTEND for native.

Sebastian Spaeth (1):

Sergey Lapin (4):
  sort.sh: added mini2440 to machine list
  sysklogd: using proper binary locations and update-alternatives

Stefan Schmidt (7):
  lowpan-tools_git.bb: Fix SRC_URI and update SRCREV.
  MAINTAINERS: Add my entry
  MAINTAINERS: Cosmetic trailing whitespace cleanup
  imote2.conf: Update JFFS2 and console informations
  imote2.conf: Remove misleading comment.
  piccontrol_0.4.bb: Fix linking against lua.

Steffen Sledz (1):
  libunwind: unneeded empty DEPENDS var removed

Steve Sakoman (2):
  pulseaudio: patch configure.ac to work around install error
  pulseaudio: patch configure.ac to work around install error

Thomas Zimmermann (6):
  task-shr-minimal-fso: add fso-gpsd as it was removed from task-fso2-compl=
ian
  tiff: add BBCLASSEXTEND to get tiff-native
  matchbox-keyboard-inputmethod: Fix build with newer libtool
  imagemagick: convert to BBCLASSEXTEND and new staging
  tslib: fix build with newer libtool
  ppp: make if-up/-down scripts compatible to resolvconf (thx to Wonka)

Tom Rini (1):
  gdb*: Add flex-native (and make sure we have relevant zlib) in DEPENDS.

Ulf Samuelsson (1):
  at91-l9260.conf: fix spelling error

Valentin Longchamp (1):
  cmake.bbclass: add toolchain file for cmake compilations

Vaudano Luca (1):
  estardict: add version 0.2

=C5=81ukasz Pankowski (1):
  ffalarms: bump to version 0.4


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-03-22 to 2010-03-29


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


