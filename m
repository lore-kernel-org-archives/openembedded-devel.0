Received: from [209.85.211.181] (helo=mail-yw0-f181.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mg1pE-0001Jp-2Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 21:37:00 +0200
Received: by ywh11 with SMTP id 11so4842380ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=qg6oee94m7+wVKa/uTJpkp1NvkL6sofxQv+0ZpKgCEI=;
	b=sIb2iLqH/J4ZI+C/9ZxygghfpIyYj10fCBZp1BmWGkUODH8NsNBJL01V1wKr5/71UZ
	BuLkMnHMdb09oT2X7NXoFfB1XVf5BkijcenXxODQYh5fYN4yOo0Z5T081QdJQ4SMJxPj
	e3o5dB7u5UHc5I6R5p3t9UtDHn7eVFUiajMms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AGPmUHIDDPlEy/nCSQsG1pu4PbN4BcLLKf2LaeLwNa08t2KBQcI9AiGW/l0NwiunR8
	gzrgiPM9w3M6+cYbb407JpNiVKybsIuSPB/tNVUFpH5mNzxuDkw+/GeX969u8wbGdgFS
	RqF/rAg0CT6m/cywpBcuv6xlrJR40TItmrV6w=
MIME-Version: 1.0
Received: by 10.150.59.4 with SMTP id h4mr8203024yba.235.1251227945954; Tue, 
	25 Aug 2009 12:19:05 -0700 (PDT)
Date: Tue, 25 Aug 2009 15:19:05 -0400
Message-ID: <f96d234e0908251219o985e3dawb038f4da309a382@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-08-17 to 2009-08-24
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
X-List-Received-Date: Tue, 25 Aug 2009 19:37:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-08-17 to 2009-08-24

Chris Larson (13):
  Let the distro control whether we include hostap or madwifi.
  base.bbclass: catch bb.MalformedUrl in do_fetch.
  collections.inc: sync with MVL6.
  distro-version: new general recipe, based on angstrom-version.
  package_rpm: don't run against native/cross recipes, explicitly
  devshell.bbclass: set a default for XAUTHORITY and export DBUS_SESSION_BUS_A
  ncurses: don't use libtool.
  src_distribute*.bbclass: cleanup, revamp parts, distribute all sources.
  src_distribute: force do_fetch execution in do_distribute_sources.
  opkg: use INC_PR.
  opkg: explicitly clean up the opkg-intercept dirs rather than rm -rf.
  Revert "ncurses: don't use libtool."
  tar: inherit gettext & use a .inc to avoid duplicated metadata.

Denys Dmytriyenko (4):
  dm6467t-evm: add "new" 1GHz DaVinci DM6467 machine
  da830-omapl137-evm: add DA830/OMAPL137 machine
  linux-davinci: update defconfigs for dm355, dm365, dm6446 and dm6467
  rt-tests: fix GNU_HASH QA error

Evan Doiron (1):
  net-snmp.inc: Fix typo in staging paths

Florian Boor (1):
  krb5: Disable tcl in configuration in order to avoid pulling in host include

Graeme Gregory (2):
  firefox_3.5.2.bb : add newest version of firefox

Holger Hans Peter Freyther (2):
  site: Add ac value for mipsel-linux and mipsel-linux-uclibc
  package_tar.bbclass: Do not set IMAGE_PKGTYPE to unbreak parsing

Jeremy Puhlman (3):
  src_distribute_local: Change cp -f to cp -fr to account for directories.
  gettext: Correct autoconf-lib-link code to defer to the compiler's library s
  wireless-tools.inc: Change first use of SRC_URI from += to =

John Willis (1):
  gamin-0.1.8: Fix build issue with recent GCC/GLibC combos.

Jonathan Cameron (1):
  glibc 2.7 and 2.9 (arm): Remove unnecessary asm/page.h include

Khem Raj (6):
  python-sip_4.8.2.bb: set DEFAULT_PREFERENCE = -1
  opkg: Add opkg to FILESPATHPKG.
  u-boot_git.bb: Dont reset machine SRC_URIs by using common SRC_URI.
  minimal, sane-toolchain: Use eglibc if LIBC is not selected.
  micro: Use eglibc as default lib if LIBC is not set.
  sane-toolchain: Define eglibc PREFERRED_VERSIONS

Koen Kooi (1):
  linux-omap* 2.6.29: add patch that should solve the memhole problem

Leon Woestenberg (3):
  angstrom-eglibc: TARGET_OS = linux-gnuspe for specific powerpc machines.
  openssl: Add linux-gnuspe-powerpc to openssl.inc target list.
  linux-2.6.30: calamari/defconfig CONFIG_WIRELESS_EXT=y for madwifi.

Michael 'Mickey' Lauer (1):
  fso-abyss | libgsm0710 | libgsm0710mux: catch up PV with upstream

Michael Smith (13):
  nasm: fix COMPATIBLE_HOST to match any vendor
  mtools: don't install-info; fixes build on non-Debian hosts
  source-checker: usability tweaks
  oe-checksums-sorter.py: speed up about 4X using a hash
  openssh.inc: cleanup
  openssh 5.2p1: remove DEFAULT_PREFERENCE = "-1"
  site/x86_64-linux: Add some vars from ix86-common
  site/common-linux: centralize bash configure vars
  syslinux: upgrade to 3.82 and split into a few packages
  hicolor-icon-theme: don't inherit gnome
  glibc: fix hardcoded /sbin/ldconfig path
  gcc: fix libstdc/libgcc packaging on x86_64
  kernel.bbclass: stage more include files for x86 in 2.6.27+

Rolf Leggewie (2):
  minimal.conf: build opie 1.2.4
  base.bbclass: introduce OE source mirror network as last resort for do_fetch

Roman I Khimov (2):
  site/ix86-common: fix grave bug in ac_cv_sizeof_unsigned_char
  quagga: add version 0.99.14

Stanislav Brabec (11):
  libxcalibrate: Use increment-able PV format as other git version recipes do.
  calibrateproto: Use increment-able PV format as other git version recipes do
  calibrateproto: Added symlink to provide old package pkgconfig name.
  task-mamona.bb, xtscal.inc: DEPEND on libxcalibrate instead of xcalibrate.
  xcalibrateext: Removed old recipe replaced by calibrateproto.
  xcalibrate: Removed old recipe replaced by libxcalibrate.
  gpsd: Disabled parallel build as it sometimes fail.
  util-linux-ng: Fixed empty packages. Provide util-linux.
  angstrom-2008.1.conf: Prefer util-linux-ng over util-linux.
  swfdec: Fixed dependencies and package splitting. Disabled static. Packaged

Steffen Sledz (1):
  linux-2.6.24: use kernel module for SATA disks at hipox machine

Steve Sakoman (8):
  iozone3: fix GNU_HASH related build failure
  gnome-desktop: fix path to python binary in the gnome-about script
  atk: add 1.27.90
  liboobs: add 2.22.0
  gthumb: add 2.10.11
  gnome-keyring: add missing dependency on libpam
  checksums.ini: add missing entry for libcanberra 0.14
  system-tools-backends: add 2.6.1

Bugs fixed:

bug_id resolution        short_desc
4578 FIXED       uicmoc4-native_4.4.0 does not compile
5009 DUPLICATE   audioplayer-1.0.tar.bz2: do_fetch failed - wrong checksum
5296 FIXED       libfsobasics_git.bb fails to configure
5298 FIXED       Update resolvconf recipe to 1.45

Bugs opened:

bug_id resolution        short_desc


