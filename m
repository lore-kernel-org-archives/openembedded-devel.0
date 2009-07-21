Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MTHzT-0002Hq-Tb
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 18:14:56 +0200
Received: by qyk35 with SMTP id 35so2529962qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2009 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=W8NEUTKMt0tG5Df5fMNBSbZ5rmmgm8opNrHCrCO/2No=;
	b=jcWYzJ06s+F5NelXoIY7lSO/2Dsux70K18YpLvknP3Fy60hy8asbE0IcasQnVAkees
	fboQzz0B3DTThZKw7nS0JPxtmu79mgqpqdlRNgx3B4Fxr4XXjew/n4BcERMwV8O1lH5f
	nmHi+rWX0setiIc7P9G/HycroWct83uH1p0b0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=JrECqX0uK4rncpbzgJQUG1YiKmvHJYyGQEhBpp7Ld4zrrfMXNsvvSFx6EdFf0fpE2v
	O55Nk6n71797mEE3ElW0TAzEayfsNvO4pYwKQRRNt//tMSj9EebvH3AOB+yIblFqBX8o
	AwPOmHmfuaAsom6m0miw0OVsm+szr2T8K0Cwc=
MIME-Version: 1.0
Received: by 10.151.39.2 with SMTP id r2mr9381351ybj.5.1248192050540; Tue, 21 
	Jul 2009 09:00:50 -0700 (PDT)
Date: Tue, 21 Jul 2009 12:00:50 -0400
Message-ID: <f96d234e0907210900t23a05722v7b37c78b0ea3ceed@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-07-13 to 2009-07-20
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
X-List-Received-Date: Tue, 21 Jul 2009 16:14:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-07-13 to 2009-07-20

Dmitry Eremin-Solenikov (5):
  xserver-xorg-1.6.1: fix libtool name in doltlibtool
  binutils-2.18: add a stolen from head patch that fixes building of u-boot on
  bluez4: make bluez4-dev rprovide bluez-libs-dev to fix SDK building

Florian Boor (4):
  linux: Update TX25 support in 2.6.30-rc4, add and turn on CAN support, fixes
  linux-2.6.30-rc4: Turn off broken NAND write page verification
  linux: Update 2.6.30-rc4 defconfig for TX25 - enable USB and some useful dri
  linux: add patch to a get rid of the horribly broken default TX25 video mode

Graeme Gregory (10):
  xserver-xorg-conf_0.1.bb : add xorg.conf for the omapzoom2, exactly the same
  linux-omapandroid : update the omapzoom2 defconfig to enable neon and
  linux-omap_2.6.30+2.6.31-rc1.bb : make a start on latest linux-omap kernel.
  pointercal_0.0.bb : add a pointercal for zoom2
  linux-omap_git.bb : move linux-omap_2.6.30+2.6.31-rc1 to linux-omap_git
  linux-omap_2.6.30+2.6.31-rc1.bb : moved to linux-omap_git
  angstrom.bbclass : a utility bbclass for angstrom, currently implements
  Revert "bluez3: blacklist for angstrom, bluez4 should be used instead"
  angstrom-2008.1.conf : add bluez3 blacklist

Henning Heinold (3):
  directfb: upgrade to version 1.4.1
  taglib: fix hardcoded header-dir in do_stage
  disko: move to newer git version

Janne Grunau (2):
  mythtv 0.22: bump SRCREV and fix configure options
  mythtv 0.22: remove sed magic now upstream has been fixed

Khem Raj (5):
  eglibc_2.10: Add new eglibc 2.10 recipes.
  eglibc_svn: Bump the version to past 2.10
  eglibc_2.9: Adjust sed script to insert _begin in newer linker scripts.
  e2fsprogs-libs: Add version 1.41.8 and dont provide libblkid and libuuid.

Koen Kooi (31):
  Angstrom feed sorter: add omapzoom2
  angstrom feed builder: add more apps
  qt4-embedded gles: add WIP GLES version of qt-e
  packagehistory: add another QA class from poky
  angstrom: use packagehistory by default
  libgles-omap3: add recipe for upcoming 09 release
  mpd: update to 0.15
  libgles-omap3 .09: def pref -1 till it gets released
  angstrom glibc: don't compile native tools with -ggdb3, only with -g
  qt-embedded: fix gles build and packaging
  angstrom: disable packagehistory, it works a bit too well with multimachine
  bluez3: blacklist for angstrom, bluez4 should be used instead
  linux-omap 2.6.29: update support for the ISP resizer
  bluez4: provide bluez-utils-dbus as well
  e-wm config angstrom: fix RDEPENDS usage
  omap3-sgx-modules: update to 1.3.13.1607
  angstrom feed builder: add dosfstools
  python-elementtree: kill standalone recipe, it's in proper python now
  gstreamer: sync with TI arago overlay a bit
  schroedinger: fix packaging
  live555: fix staging
  mplayer: enable live555 rtsp support
  packagehistory bbclass: hotfix from RP to work around the multiple-machine-s

Leon Woestenberg (5):
  nilfs-utils: Move to 2.0.13. Use {PV} in recipe.
  nilfs-utils: Remove 2.0.12. Add 2.0.13 to checksums.ini.
  linux-2.6.30: Add calamari (Freescale MPC8536DS) machine support.
  linux-2.6.30: Add defconfig for calamari.
  checksums.ini: Remove spurious characters. Sorry.

Marcin Juszkiewicz (4):
  matchbox-terminal: added from Poky
  linux: tweaked 2.6.28 for at91sam9263ek board
  linux: added support for at91sam9263ek in 2.6.30 (not default)
  linux: refreshed hrw-linux-2.6.30-exp.patch (no code changes)

Marco Cavallini (3):
  Added machine taskit Stamp9G20 Evaluation Board
  Added linux version recipes/linux/linux_2.6.29.bb for taskit Stamp9G20 Evalu
  Added linux version recipes/linux/linux-2.6.29 for taskit Stamp9G20 Evaluati

Michael Smith (3):
  glibc-initial.inc: remove FILESPATHPKG setting to fix glibc-initial_2.3.2
  glibc-stage.inc: don't overwrite gnu/stubs.h
  glibc: use INC_PR, bumping all PRs to r32.0

Otavio Salvador (1):
  gs: add 8.64

Paul Eggleton (4):
  libopie2: update for current CVS
  libqpe-opie: add no-include-pro.patch to CVS version
  opie-taskbar: add patch for server.pro to cvs version
  opie-taskbar: use patches instead of replacement for server.pro

Philip Balister (2):
  sqlite3.inc : Update include file to use autotools_stage class.

Robert Schuster (1):
  classpath.inc: Added 'inherit java'.

Stanislav Brabec (3):
  libsoup-2.4: Updated to version 2.27.4 required by latest webkit-gtk).
  webkit-gtk: Update to the latest snapshot 45825.
  midori: Updated to the latest git snapshot.

Tom Rini (1):
  binutils-cross-sdk: Add v2.17, for avr32

Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc


