Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NMqOU-0000K2-Am
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 23:06:25 +0100
Received: by ewy2 with SMTP id 2so6620047ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 14:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=QG/GCxteFgp46dkWtyWr/1dgs57tIKV2W5S1hKp+VWc=;
	b=XJUPLf4t+VHc64hHA/R91ycFRXA8PstSdnLfER+D/g+oazlSVm+8fyhSWy+wyZoWqO
	NtPZpJqHf0dNWHCJ1qhixyMpJ4TUiJmAN4wzCRDrrwMQ3LOOEEGT2Qlat9tB48KORGxI
	wUdavr1cxIFKweOrGp+sB7QDBqoNSljfyacbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jpkKz4mSt8EOYrq/QRM+aY7+jEqC5rsXTv1hppDC+T6dZZaAb0r8GgoTN1zHvwotCH
	Eh02Nzst3PgZPAJOPRCTZV0lwGb87JqN78tk3eW0SpXwEwh1W4AMD/OTRP26qIa2R9kE
	oDLOY1PPFTzQFx+ZGNn+dplK15xQjuTLlUL90=
MIME-Version: 1.0
Received: by 10.216.89.195 with SMTP id c45mr2775468wef.38.1261433070868; Mon, 
	21 Dec 2009 14:04:30 -0800 (PST)
Date: Mon, 21 Dec 2009 17:04:30 -0500
Message-ID: <f96d234e0912211404p696a26o4e26b85143efdc98@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.210
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-12-14 to 2009-12-21
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
X-List-Received-Date: Mon, 21 Dec 2009 22:06:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog 2009-12-14 to 2009-12-21

Andrea Adami (5):
  kexecboot_git: move to daa68b5aaa56a036c24c7929e239ebd5edf8fdfe.
  kexec: rename to kexec-tools (kexec and kdump)
  kexec-tools-dietlibc_2.0.1: fix typo, remove unused line.
  kexec-tools-klibc-static_1.101: remove unsetting of compiler flags - klcc is
  kexecboot_git: jump to 76f764cebe1fb0207b44850b52eb5f57ece6f363. Bump PR.

Chris Larson (8):
  coreutils: don't patch the autotools files in the native recipes
  lzma-native: dep on zlib-native, not zlib
  portmap 6.0: kill -O2 and replace -fpie with -fPIC.
  glib-2.0-native: kill unnecessary FILESPATH overrides.
  python: only dep on tk if tk is in DISTRO_FEATURES.
  angstrom: add tk to DISTRO_FEATURES for compatibility (python-tkinter module
  yum: kill python-bzip2 dep, as python-compression includes it now, per micke
  gettext-native: rename the M4 var to better reflect its contents

David-John Willis (8):
  mesa: Add INC_PR for old mesa recipes as these still seem to be in use.
  mesa-xlib 7.2: Add missing INC_PR.
  mesa-xlib: Add 7.4.
  mesa: Add a few more missing INC_PR's for old recipes.
  angstrom-2008-preferred-versions: Add PREFERRED_VERSION for mesa-dri and mes
  networkmanager: Update recipe to install an empty VPN folder in /etc/network
  zenity: Add 2.28.0 and checksum.
  xf86-input-tslib: Add patch to stop events being flooded upto to the X serve

Denis 'Gnutoo' Carikli (1):
  xserver-xorg-conf: improved buglabs's bug device's xorg.conf

Frans Meulenbroeks (2):
  sg3-utils: fixed GNU_HASH issue

Frederik Sdun (1):
  gabriel: fix depency

Holger Hans Peter Freyther (3):
  openbsc: Build more recent version of OpenBSC
  openbsc: Switch to INC_PR and include file
  openbsc-onwaves: Add new recipe for the OpenBSC On Waves Branch

Khem Raj (11):
  iproute2: Use $CC in configure tests.
  uclibc-nptl: Move to current tip of branch
  mpc: New recipe for mpc.
  linux-libc-headers_2.6.32.bb: New recipe
  gcc-svn: Add mpc to DEPENDS.
  gcc-svn.inc: Reduce priority via DEFAULT_PREFERENCE
  iptables_1.4.6.bb: Recipe for version 1.4.6.
  linux-libc-headers_2.6.32.bb: New recipe.
  gnupg: Fix compilation when using gcc 4.4+
  gmp-4.2.4: Dont use 'h' asm constraint on mips.
  mpfr_2.3.1.bb: Dont use 'h' asm constraint on mips.

Klaus Kurzmann (10):
  initscripts-shr: add initscript to set usb gadget mode for palmpre
  fbreader: add 0.12.1
  sane-srcrevs-fso.inc: bump rev of libframeworkd-glib
  illume-keyboards-shr: do NOT use SRCPV for git in org.oe.dev yet
  task-shr-feed: add obex-data-server
  task-shr-feed: add dnsmasq
  phoneuid: make it rconflict with shr-today
  sane-srcrevs-fso.inc: bump rev of libframeworkd-glib

Koen Kooi (6):
  wolfenqt: add qt3d demo
  qt 4.6.0: fix packaging, staging and x11 build
  libgles-omap3: add compatible machine
  da850-omapl138-evm: fix include
  qt4: munge more references to
  qt4-tools: add sdk version as well

Marcin Juszkiewicz (31):
  linux 2.6.18: update to latest stable patch
  linux 2.6.20: update to latest stable patch
  linux 2.6.20: added patch to fix PATH_MAX related build error
  linux 2.6.21: update to latest stable patch
  linux 2.6.22: update to latest stable patch
  linux 2.6.22: merge 2.6.22.6 recipe as it is 2.6.22.19 now
  linux 2.6.22: drop ts72xx support due to lack of patches
  linux 2.6.23: update to latest stable patch
  linux 2.6.23: keep sched-cfs locally updated to 2.6.23.17
  linux 2.6.23: added time.h.patch to make it build for ARM
  linux 2.6.23: dropped em-x270 copy of time.h.patch
  linux 2.6.24: update to latest stable patch
  linux 2.6.24: drop time.h.patch - it is in 2.6.24.7 update
  linux 2.6.25: update to latest stable patch
  linux 2.6.26: update to latest stable patch
  linux 2.6.26: do not apply 2.6.26.5 for topas910
  linux 2.6.27: update to latest stable patch
  linux 2.6.28: update to latest stable patch
  linux 2.6.29: update to latest stable patch
  linux 2.6.29: removed two patches from micro2440 which are also in stable up
  linux 2.6.31: update to 2.6.31.7
  linux 2.6.30: update to 2.6.30.10
  linux 2.6.25: merge 2.6.25.20 into it (they are same version)
  checksums.ini: some new entries
  checksums.ini: some new entries
  linux: fix location of patches for misc RCx kernels
  linux 2.6.31: update to 2.6.31.8
  linux 2.6.32: update to 2.6.32.1
  checksums.ini: added 2.6.31.8 and 2.6.32.1
  java.bbclass: stage all JAR files outside of ARCH related directories

Martin Jansa (8):
  e-tasks,intone,intone-video,shr-launcher,guitartune: bump srcrev, simplify r
  compatibility-providers: set mesa instead of mesa-dri as default virtual/lib
  linux_2.6.23: move task compulab_image after do_package instead do_deploy
  mesa: add 7.6 from xorg-7.5 branch, update git version with different SRC_UR
  om-gta0(1|2): set virtual/libgl provider without shr override
  xorg-xserver-common.inc: depend on virtual/libgl instead of mesa
  checksums.conf: add checksums for packages added to xorg-7.5 branch
  sane-srcrevs: update shr-launcher revision for new release

Michael 'Mickey' Lauer (2):
  vala[-native]: add 0.7.9 release
  ttf-mplus: new recipe; sans serif font package

Michael Pilgermann (3):
  upgrade pisi to version 0.4.9; bug fix release
  PISI: Upgrade vom 0.4.9 to 0.4.10
  PISI: Upgrade vom 0.4.9 to 0.4.10

Sebastian Spaeth (2):
  sane-srcrevs.inc: Bump shr apps to latest
  openmoko-icon-theme-standard2: remove inherit openmoko2 which is broken

Thomas Zimmermann (1):
  aceofpenguins-launcher: update recipe from 0.3 to 0.4

Yuri Bushmelev (2):
  Patch added to fix QEMU 0.10.3 compilation on distros with FORTIFY_SOURCE en

Bugs fixed:

bug_id resolution        short_desc
5147 FIXED       iproute2-2.6.22-r1 fails on do_compile (with patch)
5320 FIXED       socat fails to build for i686/eglibc/minimal
(HAVE_TERMIOS_ISPEED wrong)

Bugs opened:

bug_id resolution        short_desc


