Received: from [209.85.212.188] (helo=mail-vw0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MLQok-0002ru-Lg
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 02:03:22 +0200
Received: by vwj26 with SMTP id 26so51545vwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2009 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=4qCtZ6FxBM5DBiHspVLYbRRNhPaByqLHs47CafuyQTI=;
	b=IWON2zmjAhPquUfHGnqXe3e8ldJ8LaTiKnrzBzldK44clTgr/IhrdFWINs0IiEue4S
	zL8xvsFl2lAkS1Y1YRfwKMde9iXXcgD9Xb4Juo0iBb3w1dNl4eGkbtyGcMQ2xdtM8TJ5
	afI3a1v9fY2AUhNQSbAf6P9ZQiSQuBfQylb9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=elO9nkpJa8xSyuUCpLzxi5/rO/YwKacNHATmdQ2J1orT9NicZ2eyLL5u2ESZsF6F3Y
	TkGSPkPQFUtkyBlMpndBVU4MPmeJ6b6P5ELUIr/bXC8PN7y1qphEW+/po5kEHLzpiREd
	qjQ5Vf1p+6mdZ34JnAGe7Pl2mzVZ50zHQCneE=
MIME-Version: 1.0
Received: by 10.220.76.21 with SMTP id a21mr4569073vck.0.1246319495456; Mon, 
	29 Jun 2009 16:51:35 -0700 (PDT)
Date: Mon, 29 Jun 2009 19:51:35 -0400
Message-ID: <f96d234e0906291651s569f75b8h770ea0a668953edf@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-06-22 to 2009-06-29
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
X-List-Received-Date: Tue, 30 Jun 2009 00:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-06-22 to 2009-06-29

Alan Carvalho de Assis (1):
  Add basic support for i.MX27ADS board

Andrea Adami (5):
  embedix kernels: set COMPATIBLE_MACHINE = "none"
  zaurus-installer: set LICENSE
  kernel-2.4-embedix: revert commit 2f0fcff486dba9daa7b35cc96a3dce86f16ae30d
  sharprom-compatible: add custom COMPATIBLE_MACHINE for c7x0/poodle
  zaurusd: fix borzoi patch

Chris Larson (2):
  packaged-staging.bbclass: use ?= for PSTAGE_PKG.
  bitbake.conf, base.bbclass: Changed build config summary header to be a vari

Denys Dmytriyenko (1):
  /etc/profile: stricter root PATH - require absolute pathname for bins in cwd

Dirk Opfer (1):
  gcc: get rid of fix-ICE-in-arm_unwind_emit_set.diff

Dmitry Eremin-Solenikov (3):
  iproute2: add new upstream version
  checksums: add an entry for iproute2-2.6.29

Florian Boor (1):
  checksums.ini: Add zbar

Koen Kooi (8):
  zip: fix QA errors
  bluez4: add 4.42
  pavucontrol: add 0.9.8
  tango-icon-theme: add 0.8.90
  nbnench-byte: fix QA errors
  linux-omap-pm 2.6.29: fix beagleboard audio
  Angstrom feed builder: add more packages

Lynn Lin (3):
  docs:add deb package to emit
  docs: update GENTOO_MIRROR variable
  docs: update IMAGE_ROOTFS variable

Marcin Juszkiewicz (2):
  nbench-byte: added BYTEmark benchmark
  checksums.ini: added few entries

Marco Cavallini (3):
  Added PREFERRED_VERSION_classpath to support JVM in KaeilOS distro with cont
  Added recipes/images/x11-jvm-image.bb for KaeilOS with JVM inclusion
  recipes/images/x11-jvm-image.bb replaced typo '$(ADD_JVM)'

Michael Smith (4):
  tcpdump: fix mix of tabs and spaces
  tcpdump 4.0.0-r2: remove extra ${sbindir}/tcpdump.4.0.0
  iputils 20071127: add docbook dependency to fix build
  Add fping 2.4b2_to, plus patch from SourceForge.

Philip Balister (1):
  gnuradio.inc : GNU Radio is GPLv3. Update LICENSE.

Rolf Leggewie (9):
  bluez4: poor man's unification
  bluez4: rebase 4.39 and 4.41 on new .inc file
  openssl: add support for compilation on Via C3 host.
  bluez: update bluez-libs to 4.42. unify.
  bluez: document upstream status of avinfo-link.patch as not applicable upstr
  obexftp: version 0.23 compiles fine against bluez-libs 3.x.  Relax DEPENDS a
  conf: remove bluetooth from DISTRO_FEATURES in minimal.conf
  opie-image: make inclusion of irda and bluetooth tasks contingent upon COMBI
  task-opie: make inclusion of irda and bluetooth tasks contingent upon COMBIN

Stanislav Brabec (5):
  keymaps: RDEPENDS fix.
  zaurusd: Support configurable portrait and landscape xrandr orientation.
  xserver-common, zaurusd: Use native xserver orientation for spitz, akita and
  many files: Introduction of virtual/libusb0 provided by libusb or libusb-com
  libusb: Update to latest versions of libusb1 and libusb-compat, removed old

Tom Rini (6):
  netperf: Fix SRC_URI (2.4.4 is in archive now)
  alsa: Add alsa-lib/plugins/utils 1.0.19
  pulseaudio: Switch to INC_PR, add openssl to DEPENDS.
  gdbserver: Switch to INC_PR, add LICENSE, only build gdbserver, drop DEPENDS
  meta-toolchain: Oops, we want layout_libdir not layout_base_libdir for opkg
  eglibc: Make sure that scsi headers are available when needed

woglinde (4):
  mgetty: add mgetty-fax to the package and honor our LDLFAGS
  popt: use the better way for generating or not generationg locales * bump PR
  schroedinger: extra recipe for the gst-plguins * no need for compiling half
  libxine: update to version 1.1.16.3

Bugs fixed:

bug_id resolution        short_desc
2080 DUPLICATE   Bitbake trunk (1.9) doesn't remember errors
1831 FIXED       gpe-dm hangs during shutdown
4907 INVALID     classpath-initial-0.93 incorrect $S
4908 INVALID     classpath-native 0.97.2 invalid $S
5144 FIXED       omapfbplay.c:40:20: error: omapfb.h: No such file or directory
5156 WONTFIX     meta-toolchain doesn't produce any *.pc files in deployed file
5256 INVALID     i2c-tools fetch fails

Bugs opened:

bug_id resolution        short_desc


