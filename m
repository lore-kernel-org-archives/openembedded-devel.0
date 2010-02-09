Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NexOU-0002Dp-9a
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:13:17 +0100
Received: by ewy4 with SMTP id 4so75030ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=KpQs0XTgQ7BMxlDgE3wF0w/NudKgcHR1Soe9N14T+sg=;
	b=h+eEokyL/C7bkHx48SdNS6BDxE3k4Anygkm2O2X9PQZ0SHhrgqyGSvdWytw5/MM7UW
	Tym4tppA8iMbb12HDT5MDd/2CPdCfWj8cgV3ESinDIceHoLIzIdkalYUphuYFsD25C+j
	TH2q7DQfWIwb3OLqNIMXYH8350Oew8ISkvekA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=L2jivzEzoxWL3y7VTfspKgD5WQagljzTSw9I4qmjVAStSlwVZWMKfl/DMjOXcK6d8q
	Ee4fwGNPSq0eoIkuvz+uyYuRl36mX+65gm76n3sGH6h/piH9U0muF39lAiJhe4BV0WWl
	myB/+skO0Bm6ADalRkkMNn7sEhiO1UMHKLX+s=
MIME-Version: 1.0
Received: by 10.216.90.79 with SMTP id d57mr935114wef.117.1265749840575; Tue, 
	09 Feb 2010 13:10:40 -0800 (PST)
Date: Tue, 9 Feb 2010 16:10:40 -0500
Message-ID: <f96d234e1002091310h6eb4f93ei67068714adadd017@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2010-02-01 to 2010-02-08
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
X-List-Received-Date: Tue, 09 Feb 2010 21:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2010-02-01 to 2010-02-08

Andrea Adami (5):
  zaurus-updater: fix nandlogical writing of kernel. Bump PR.
  linux-kexecboot_2.6.32: remove now obsoleted Zaurus patches. Re-enable LZ=
O/L
  linux-kexecboot_2.6.32+2.6.33-rc6: remove now obsoleted Zaurus patches.
  linux-kexecboot: force LZMA compression for kernels > 2.6.30
  linux-kexecboot.inc: fix minimal versions required for LZMA.

Benjamin Schieder (1):
  fltkspacetrader: new recipe for spacetrader game with fltk based interfac=
e

Brian Pomerantz (1):
  base.bbclass: in base_contains, check for var existance before using it

Christian R=FCb (3):
  stopwatch: Add version 1.4.0
  qgpslog: New recipe for Qt based GPS track logger
  litephone: add new recipe

Denys Dmytriyenko (1):
  meta-toolchain: introduce TOOLCHAIN_TARGET_EXCLUDE to uninstall unneeded =
dep

Frans Meulenbroeks (8):
  packaged-staging.bbclass: added missing $DISTRO_PR}'s
  packaged-staging.bbclass: removed two few superfluous slashes
  Revert "packaged-staging.bbclass: removed two few superfluous slashes"
  packaged-staging.bbclass: removed two superfluous slashes
  xorg-lib/libx11_1.3.3: uncommented dolt-fix.patch; still needed
  libx11-native: removed patch as this is already in libx11
  open-iscsi-user: removed RRECOMMENDS

Graeme Gregory (5):
  transmission_1.83.bb : bugfix upgrade
  alsa-scenario_0.2.bb : sources have been moved on server
  site/avr32-common : add a sizeof value for int, needed for vim compile
  glib-2.0_2.22.4.bb : fix native build issues
  glib-2.0_2.22.4.bb : didnt mean to commit libpcre-native DEPEND

Guo Hongruan (1):
  chumby-kernel: add a patch to remove hard setting CROSS_COMPILE from Make=
fil

Henning Heinold (3):
  ecj: fix maxheap size jamvm is compiled with 512m only
  classpath-native: the exit_hook.patch don't work anymore disable wrapper-=
too
  conf: add inc file for toolchain-java

Khem Raj (5):
  uclibc-nptl: Update to latest top of upstream branch.
  uclibc_git: Bump SRCREV to latest upstream.
  gcc-4.4.3: Add new recipes.
  uclibc-nptl: Add machine conf fragment for SH4.
  eglibc: Bump SRCREV to latest for svn and 2.11 recipes.

Klaus Kurzmann (1):
  sane-srcrevs.inc: bump rev of pyphonelog

Koen Kooi (28):
  efl: bump SRCREV for SDL_gl fixes
  Revert "conf/machine/jornada7xx.conf : Use EABI"
  xserver-common: fix angstrom RDEPENDS for 1.25 and fix ts for angstrom in=
 1.
  angstrom: prefer xserver-common 1.32
  python-pygtk: add 2.16.0
  totem 2.28.5: enable python support for e.g. youtube plugin
  gnome-bluetooth git: move to 2.28.6
  u-boot git: sync omap3-touchbook patches with AI repo
  gnome-python 2.28.0: fixes for new pygobject/pygtk combo
  angstrom feed sorter: add eee701 machine
  pciutils 3.1.2: convert to new-style staging
  angstrom feed sorter: cope with packages like kernel-module-twofish-i586_=
2.6
  gnome-python-desktop: add 2.28.0
  totem: add more RDEPENDS for youtube and iplayer plugins
  angstrom-{x,GNOME}-image: move some definitions around, create timestamp
  gnome-mplayer svn: bump SRCREV
  angstrom-task-gnome: add gecko-media-player-firefox-hack to get youtube w=
ork
  clutter-gst-0.9: fix dependencies, remove clutter-0.8 dep
  moblin: remove clutter-0.8 deps, add clutter-0.9 deps
  networkmanager: add 0.7.999 (aka 0.8.0rc3)
  efl: bump SRCREV for comp fixes
  archos 5: sync with Archos OE repo
  archos5it: add archos5it support from Archos OE repo
  angstrom: also use CSL 2007q3 for archos5it kernel
  angstrom feed sorter: add archos5it support
  checksums: add 2.6.27-omap1 patch
  linux-davinci git: add hack for hawkboard machine ID
  mtd-utils(-native): add v1.3.1

Kristoffer Ericson (1):
  conf/machine/jornada7xx.conf : Use EABI

Lukas Gorris (3):
  Add xorg-driver for msm platform, use it on msm machines. (wip)
  Add htcleo, linux-qsd8; linux-msm7xxxx > linux-msm7, move extra msm kerne=
l i

Marcin Juszkiewicz (1):
  linux 2.6.28: added Nokia N900 support

Martin Jansa (30):
  e-tasks: move SRCREV to recipe and update it for rebuild after EFL bump
  mplayer_git: bump SRCREV ~r30448+
  task-shr-feed: remove stuff (exhibit, tasks, emacs, mpg123) never built s=
ucc
  gtkmathview: fix build for gcc44
  angstrom-2008-preferred-versions: set P_V for gtk+-native (same as for gt=
k+)
  preferred-shr-versions: set P_V for gtk+-native and gtk+ to 2.18.6
  python: add version 2.6.4
  python-cython: add version 0.12
  mplayer-common: fix FILES
  angstrom-2008-preferred-versions: fix preferred version to existing one
  task-shr-feed: add qgpslog
  task-shr-feed: add litephone
  freesmartphone: bump SRCREVs to HEAD, drop configs and use configs provid=
ed
  preferred-shr-versions: drop P_V for python-pygtk
  ffalarms: fix building agains newer libeflvala
  ventura: bump SRCREV for version 0.2
  shr-launcher: bump PR for rebuild after EFL upgrade
  ffalarms: fix patch.. lost change while rebase
  shr: blacklist qt4-x11-free-gles
  python-cython: add bugfix release 0.12.1
  shr-autorev: temporary add emtooth and ventura
  task-shr-feed: add fltkspacetrader
  sane-srcrevs-fso: downgrade libfsotransport revision a bit (needed for wo=
rki
  sane-srcrevs-fso: bump fsodeviced revision for router_alsa fix
  fso-boot: add new cornucopia project
  sane-srcrevs-fso: small upgrade for mdbus2, fsogsmd and fsodeviced
  linux-openmoko-shr-devel: enable UBI in gta01 config too
  fso-boot: use SRCREV instead SRCPV (sorry)
  om-gta01.conf: update ubi params
  om-gta01: update UBI params a bit more

Michael 'Mickey' Lauer (2):
  linux-leviathan: defconfig: enable devtmpfs
  vala[-native]: add 0.7.10

Rolf Leggewie (1):
  distutils-common-base: fix definition of FILES_${PN}-dbg

Steffen Sledz (5):
  u-boot-2009.03: fix link detection for onboard switch at hipox machine
  rtc-drbcc: be a bit more verbose in case of errors
  u-boot-2009.03: nor flash layout changed for hipox machine
  oxnas: remove support for oxnas machine
  linux-2.6.24: enable MAGIC_SYSRQ for hipox machine

Tom Rini (1):
  kernel.bbclass: Fix pstaging do_deploy.

Valery Febvre (1):
  Podboy: update to 1.3.3 (as svn)

Bugs fixed:

bug_id resolution        short_desc
5322 FIXED       rt3070 kernel module misses driver file (unusable)
5395 INVALID     more tests for recipe sanity


