Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1O6vv4-0005yL-I8
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 03:18:32 +0200
Received: by wyb33 with SMTP id 33so1280815wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 18:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=JzunHJz4uuTO3OQBqYlpZ9OHTd80/xLcxiuOgZFZTiI=;
	b=uJsOU4C1QBvsqxwx7hB8lB2ElZMbvgXuZvm0znToKLkAqq3S5/LVKjaFqSkdJqqe9n
	oCyqhnXh3xQ/961vzQtr+x0q8pXQw5PX6oawUaB4SD6VApzWPpqkltVYyluU9pyDwH4J
	ZSVgq7xJG+FMU/nQOktDmIGQdGjfOoXzq1EvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=o6IhyI1lNUvlyZhxt++twZUMJG9H/3wvbTxQb7IE1Eeuxpqggy7Sz4dliF0ZLqhU4p
	arpAzK7EGOF6STAgQmeCocC+ra9G0/DaZtBDFSNzGgw8TFIhGnn6W1O6v75vMtEW3iit
	ujMhP+ZwT7laE+aF2vsFZQHu18o8iRYX4j0xQ=
MIME-Version: 1.0
Received: by 10.216.156.133 with SMTP id m5mr478821wek.115.1272417289762; Tue, 
	27 Apr 2010 18:14:49 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Tue, 27 Apr 2010 18:14:49 -0700 (PDT)
Date: Tue, 27 Apr 2010 21:14:49 -0400
Message-ID: <l2nf96d234e1004271814tc661c3daq1f54e9e68c92dc4f@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-04-19 to 2010-04-26
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
X-List-Received-Date: Wed, 28 Apr 2010 01:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-04-19 to 2010-04-26

?ukasz Pankowski (1):
  ffalarms: bump git version fix snooze when using fsotdld

Andrea Adami (10):
  zaurus-updater: add support for jffs2 images w/o legacy headers.
  zaurus-updater: remove forgotten todo and split the version check
  zaurus-2.6.inc: reorder common Zaurus settings.
  zaurus-2.6.inc: merge the jffs2 bits from zaurus-clamshells.inc.
  zaurus-2.6.inc: remove forgotten comments (#) and unbreak jffs2
  zaurus-installer: deploy legacy gnu-tar here, not in zaurus-updater.
  linux-kexecboot: fix poodle resolution in 2.6.33-rc4 (still no joy)
  [various]: fis absolute reference to 'recipes/'.
  kexecboot.inc: refresh list of configure options
  kexecboot.inc: disable serial debug for Zaurus c7x0 (enough testing;)

Antonio Ospite (1):
  python-2.6.4: make Modules/_ctypes/libffi configure

Chris Larson (15):
  Add initial signature.bbclass, which generates a hash of the recipe data
  Add an initial layer.conf for use with bitbake's bblayers support, for co=
nve
  Add emit_data.bbclass, which emits the metadata and displays diffs from p=
rev
  utils.bbclass: make check_app_exists slightly more pythonic
  Use the python modules for checksum generation where we can
  do_unpack: shift some responsibility around, clean things up
  base.bbclass: add <dir>/lib for each dir in BBPATH to the python search p=
ath
  Initial move of common python bits into modules of the 'oe' python packag=
e
  oe.path.join: simplify a bit
  oe.path.relative: leverage os.path.relpath if available
  oe.path.relative: switch to a different appraoch
  base.bbclass: unbork oe_unpack_file
  Revert "oe.path.relative: switch to a different appraoch"
  oe.path.relative: add missing imports
  Revert "do_unpack: shift some responsibility around, clean things up" Rev=
ert

David-John Willis (1):
  xfce4-panel: Add 4.6.3 and support new style checksums in xfce46.bbclass.

Denys Dmytriyenko (2):
  xorg-headers-native: haven't been updated since 2006, do so now
  tinylogin: update LICENSE to more specific GPLv2

Graeme Gregory (3):
  linux-omap-zoomsync_2.6.32.bb : OTG support without gadget
  qemu_0.12.3.bb : add two patches from git to fix cp15 access

Joachim Ott (1):
  base-files: improve profile for SHR

Khem Raj (3):
  gcc: Add recipes for version 4.5.0
  gcc-svn.inc: Change version to 4.6.0
  uclibc/nptl: Remove nptl recipes.

Klaus Kurzmann (7):
  libframeworkd-glib_git.bb: bump rev to get fsogsmd compatability fix
  frameworkd_git.bb: bump rev to get message timestamp fix
  e-wm-config-illume2-shr_git.bb: bump rev to get adjusted config for curre=
nt
  pyphonelog_git.bb: bump rev to get fixes for changed opimd
  pyphonelog_git.bb: bump rev to get 'multiple contacts with same number' f=
ix
  frameworkd_git.bb: bump rev to get latest fixes
  frameworkd_git.bb: bump rev for fixed MissedCall signal

Koen Kooi (30):
  qt4-tools-native: convert to new style staging
  qt4-*-gles 4.6.2: small updates
  xserver-xorg 1.8.0: update udev as config manager for angstrom
  module bbclass: sync depmod code with kernel.bbclass a bit
  qt4-embedded-gles 4.6.2: move patch down so that it will actually get app=
lie
  angstrom-task-gnome: make task-gnome-apps optional
  angstrom-gnome-image-big: add "big" GNOME image that includes more apps
  qmake2: add missing INFIX export in qtopia env script
  zaurus-update: add back PACKAGE_ARCH =3D "${MACHINE_ARCH}" otherwise you'=
ll mi
  multi-kernel: update depends after kernel.bbclass changes
  angstrom mirrors: fix regression introduced by http://cgit.openembedded.o=
rg/
  tiff 3.9.2: fix QA error during configure
  xserver-common: add 1.33 with some extra fixes
  angstrom: prefer xserver-common 1.33
  angstrom: set DISTRO_FEED_CONFIGS
  meta-toolchain-qte: include QT version for angstrom
  meta-toolchain: add hook to install proper feedconfigs and add an extra c=
hec
  linux-omap-psp 2.6.32: change 37xx OPP to latest definitions
  angstrom feed sorter: atomically replace list of know packages
  tinylogin: bump PR for LICENSE change
  glib-2.0 2.24.0: apply two patches from release branch and one from ubunt=
u
  liblauncher: add 0.3.8, disabled by default since it breaks API
  xfce-base libs: convert to new style staging
  xfce-base apps: convert to new style staging
  xfce4-settings: add 4.6.4
  pmount: fix config.rpath problem
  angstrom-task-lxde: add tasks to base an LXDE image on
  gpicview: add 0.2.1
  opencv + samples: update to 2.1.0
  mesa, mesa-xlib: add 7.8

Marco Cavallini (2):
  kaeilos-2010.conf: added new KaeilOS version 2010
  include/kaeilos-2010.inc: includes for KaeilOS version 2010

Martin Jansa (21):
  mesa: switch to SRCPV with PE bump
  ffmpeg: switch to SRCPV with PE bump
  blktool: bump PR
  python-pyrtc: switch to SRCPV with PE bump
  qi: switch to SRCPV
  midori: switch to SRCPV with PE bump
  frameworkd-config-shr: bump SRCREV
  shr-launcher: bump SRCREV
  fso: bump SRCREV for libfsotransport fixes (reliable GSM registration for=
 om
  shr-settings: bump SRCREV
  EFL: bump SRCREV for more illume2 fixes
  fsogsmd: install dbus activation file again for SHR
  frameworkd: bump SRCREV for s/Notify/Changed/ in opreferencesd
  frameworkd-config-shr: bump SRCREVs to disable ogsmd and switch to fsogsm=
d
  shr: bump SRCREVs for fsogsmd compatible versions
  libconfig_1.3.2: add patch for build with automake-1.11
  qwo: add patch for build with automake-1.11
  task-shr-feed: drop fso-abyss and mokoko
  frameworkd-config-shr: drop fso-abyss from RDEPENDS (not needed with fsog=
smd
  task-shr-minimal: drop fso-abyss from RDEPENDS (not needed with fsogsmd)
  ventura: bump SRCREV for hidding menu

Michael 'Mickey' Lauer (6):
  vala[-native]: 0.8.0.69-35df9 -> 0.8.0.89-8ccb91
  mkdump: new recipe; kernel netlink and kobject message dumper
  task-cli-tools-debug: add mkdump
  linux-leviathan: bump to a revision that can suspend/resume. Thanks Alain=
!
  vala.bbclass and assorted recipes: create own task for installing .vapi a=
nd
  libgee: convert to BBEXTENDSCLASS

Micka=C3=ABl CHAZAUX (1):
  pixman: Add perl-native dependency

Roger Monk (6):
  ti-dsplink: remove unnecessary 'clean' step
  ti-dsplink: Introduce DSPLINKDSP to simplify DSP executable install
  ti-dsplink: Move dsplink_1.64 fix-ups into version specific recipe
  ti-dsplink: Use new URL and add dsplink v1.65.00.02 (early adopter)
  ti-dsplink: Add runtime depends for examples on lpm-utils for lpmOn/Off u=
til
  ti-local-power-manager: Remove OPT from LPM sources using #define

Roman I Khimov (12):
  util-linux-ng: handle setsid through alternatives too
  util-linux-ng: handle chrt through alternatives too
  cluster-resource-agents: disable doc build
  cluster-glue: fix uclibc build
  cluster-resource-agents: fix uclibc build
  pacemaker: fix uclibc build
  corosync: fix volatiles
  pacemaker: fix volatiles
  corosync: update to version 1.2.1
  cluster-glue: update to version 1.0.5
  cluster-resource-agents: update to version 1.0.3
  proxy-libintl: fix build for x86_64

Roman Khimov (1):
  change INHIBIT_PACKAGE_STRIP to PACKAGE_STRIP with more options

Sebastian Spaeth (3):
  iliwi: newer upstream version
  connman: remove obsolete recipes
  libphone-ui*: bump to recent version

Sergey Lapin (2):
  sysklogd: installing init script
  busybox: prevent postinst script from failing

Thomas Zimmermann (3):
  ccrtp: fix linking against libs in /usr/lib
  libzrtpcpp: add new recipe for GNU ZRTP C++ bindings
  pjproject: add new recipe, contains several librarys for SIP, im and mult=
ime

Valery Febvre (1):
  podboy: update to 1.6.1

Vladimir Sorokin (1):
  perl: undef 'futimes' for uclibc build

=C5=81ukasz Pankowski (1):
  atd-over-fso: also support for fsotdld API (incompatible to frameworkd ot=
ime


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-04-19 to 2010-04-26


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


