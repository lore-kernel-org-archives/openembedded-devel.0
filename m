Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oszkw-0001is-SE
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 17:06:46 +0200
Received: by wwi14 with SMTP id 14so5449641wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=8E+7Xejx//Ojly/R5ejEWmbllPsWBdpqZccpc6ZODvg=;
	b=T2IinO1VP9gp7j9VnYJyJjOC8JUM66zwhtzOQSchyodliyBNXR4D4uq2A8rs6bkg0J
	Vzs1TdNJ+lV4LJSKZX74hdqRYBw4UNCVNzEvnx1oWot0cSoQT7L5aKvsRHckmhhjkyvw
	D4cqwP6n8ImIq/kG9iGbwoYUyWKNyyKPCAdLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kzVHbxSaui9xWnetivl5LTiyKX7TlXhEOHqVlgXWn5s6K+2rCfFd6BvOQ88db+aEYn
	Uj0KW7XZ7P885+SDJ7jR1vmiAUjb9dDJNnM+kqhxD3QncgSY9Ucfkp85pGvFT38sCdC8
	Lcc828veHi5YoZrYK+GDLFqj1MbA6kXdwORK4=
MIME-Version: 1.0
Received: by 10.227.141.141 with SMTP id m13mr91691wbu.152.1283871960725; Tue,
	07 Sep 2010 08:06:00 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 7 Sep 2010 08:06:00 -0700 (PDT)
Date: Tue, 7 Sep 2010 11:06:00 -0400
Message-ID: <AANLkTiky3WxHUF6TWvOtoz5MZQohsg92SE-E-UhnTzVY@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-08-30 to 2010-09-06
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
X-List-Received-Date: Tue, 07 Sep 2010 15:06:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-08-30 to 2010-09-06

Anatoly Shipitsin (1):
  sysvinit_2.86.bb: change sysvinit-utils for compatible with upstart

Chris Larson (4):
  base.bbclass: fix bug with absolute file:// uris
  Revert "base.bbclass: fix bug with absolute file:// uris"
  base.bbclass: fix bug with absolute file:// uris
  do_unpack, do_patch: shift some responsibility around, clean things up

Denys Dmytriyenko (1):
  matrix-tui: fix DEPENDS and use system LDFLAGS

Florian Boor (7):
  simone.conf: Add jffs2 parameters
  dockstar.conf: Machine configuration for Seagate Dockstar
  linux: Add dockstar support to 2.6.35
  linux: Sim.One support for 2.6.35
  dockstar.conf: Make sure we use our known to be good kernel.
  linux: 2.6.35 - Insert space at the end of SRC_URI fixes building for mac=
hin

Frans Meulenbroeks (6):
  Revert "gtk+: remove old versions"
  iscsi-target: moved to 1.4.20.2
  MAINTAINERS: updated my entry
  tgt: moved to version 1.0.8
  MAINTAINERS: forgot to add urjtag yesterday
  urjtag_git: updated to dev head (aug 30)

Graham Gower (8):
  gst-plugins-bad_0.10.19.bb: add libmodplug to DEPENDS.
  pulseaudio: Fix most recent recipe and remove broken recipes.
  gnome-doc-utils: Add dependency upon gettext-native.
  package_ipk.bbclass: remove redundant dependencies upon opkg/opkg-collate=
ral
  task-boot.bb: Don't pull in u-a if ONLINE_PACKAGE_MANAGEMENT=3D"none".
  gpe-package_0.4.bb: fix build problems introduced in previous commit.
  gpe-package: remove some ancient recipes.
  gpsd: unbreak gpsd_2.38.bb and gpsd_2.39.bb

Jason Kridner (1):
  esc-node-demo: add missing index.html file

Khem Raj (31):
  efikamx.conf: Define entry point and load adress for kernel.
  make_3.82.bb: Add new recipe.
  unionfs-utils: Fix the QA error about hashing style.
  recipes: Move some recipes to nonworking for getting bitbake world.
  clutter_0.6svn.bb,clutter-gtk-0.6_git.bb: Unused and unbuildable for long=
 he
  vlc-davinci_0.8.6h.bb: Rename codec-engine to ti-codec-engine
  bt950-cs_0.1.bb: Dont override PACKAGES but append to it.
  libmsip_svn.bb: Rename libmnetutil0->libmnetutil in DEPENDS
  libmsgenabler2_svn.bb: Replace gsmd-lips with gsmd in DEPENDS
  xqt2_20060509.bb: DEPEND on libxmu instead of xmu
  task-openprotium.bb: Define missing DISTRO_SSH_DAEMON,DISTRO_DEV_MANAGER,=
DIS
  recipes/tasks: Do not RDEPENDS on unavailable packages.
  openmoko-session_svn.bb: Replace openmoko-today with openmoko-today2
  cnetworkmanager_git.bb: python-uuid is not provided remove it from RDEPEN=
DS
  sugar-fructose.bb: sugar-web-activity is not provided by any recipe dont =
DEP
  initramfs-bootmenu-debug-image.bb,initramfs-bootmenu-image.bb: Rename kli=
bc-
  initramfs-module-bootmenu_1.0.bb,initramfs-module-kexecboot_1.0.bb: Renam=
e k
  angstrom/angstrom-bootmanager.bb: Remove
  task-arago-toolchain-target.bb: remove libpng12-dev which is not provided=
 an
  task-demo-x11.bb: Replace non existing libgles-omap3-demos with libgles-o=
map
  task-gmae.bb: it uses XSERVER but doesnt really define it so define it.
  task-gpe.bb: virtual/xserver can not be RDEPEND'ed on it can be DEPEND'ed=
 up
  meta-angstrom-2007.bb,meta-opie.bb: task-opie-bluetooth is added only if =
it
  meta-toolchain-arago-dvsdk.bb: Remove
  meta-toolchain-arago-gst.bb: Remove
  preferred-opie-versions-1.2.3.inc,preferred-opie-versions-1.2.4.inc: Ther=
e i
  startup-notification_0.9.bb: Add evas to DEPENDS
  minimal.conf: Select bluez4 for bluez-utils-dbus and bluez-utils
  preferred-xorg-versions-X11R7.5-latest.inc, preferred-xorg-versions-X11R7=
.5.
  gnumail_1.1.2.bb: Point inetlib to java data dir in target staging area.
  autoconf213_2.13.bb: Re-add.

Koen Kooi (4):
  abiword: add 2.8.6
  qmake2: use the new qt4-tools instead of the unmaintained uicmoc recipes
  goffice: add 0.8.9
  multi-kernel: work around do_unpack breakage a bit

Leon Woestenberg (1):
  Added Freescale P1020RDB machine and linux-powerpc-fsl-2.6.35.

Martin Jansa (1):
  matchbox-panel-2-icon-themes: use same SRCREV as matchbox-panel-2

Michael 'Mickey' Lauer (1):
  vala-dbus-binding-tool: catch up with vala 0.9.6.1

Michael Lippautz (1):
  u-boot: Unbreak u-boot 2009.08 for gcc >=3D 4.4

Micka=EBl CHAZAUX (1):
  Add i.MX51 based "Babbage" board support

Steffen Sledz (3):
  various syslogs: keep syslog running as long as possible on shutdown
  rt2x00: move driver version specific patch files to an own directory
  rt2x00: add linux kernel driver for Ralink RT3572

Tom Rini (2):
  oe-stylize.py: Move exports up to before normal functions
  perl: Use CCLD not ${TARGET_SYS}-gcc in do_compile


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


