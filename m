Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MsHc6-00057j-KM
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 16:54:09 +0200
Received: by ywh7 with SMTP id 7so5161905ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=V0knLzUkpUHM0atgsKd+xeFWuh+bS0sbC0gtkdvprg4=;
	b=FgL+B6ltlSlnyO50LQyfCfEE0tPfFfEgATq4R/mVuo+qntcpM8ew5Sea3pTuWLK4uw
	jJ/QzhSwfCxxhegd9m+czAbpEUobxIySKrdBhjTYvhpKe5gPpCcAUYhPKP2IPxfV5496
	jxrTGhNkxKhcLBw/MH/oEwRu13k4ZlpQ0sVWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=dx4g7uSa66oak6rKaiDB8esoMrBXUJEgNUzbYDatuyMgHUqW4RmryfnOyDb9SPdIH4
	CWuDOZL/tmM2fTOC7BewG0rWrWAMYqui8mxjpP93zupaR0qaHKQjnUph6E3bYAH5dlUy
	xk5aFtmkX7MDRkdUV0O3q44X9t1d6tCVhKzkc=
MIME-Version: 1.0
Received: by 10.150.235.14 with SMTP id i14mr7894091ybh.337.1254149603966; 
	Mon, 28 Sep 2009 07:53:23 -0700 (PDT)
Date: Mon, 28 Sep 2009 10:53:23 -0400
Message-ID: <f96d234e0909280753s175d7485ke7ccc364662a62a3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-09-21 to 2009-09-28
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
X-List-Received-Date: Mon, 28 Sep 2009 14:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-09-21 to 2009-09-28

Andrea Adami (5):
  kexec-tools_2.0: bump to 2.01 (lot of fixes !)- update checksums.ini
  kexec-tools-klibc-static_2.0.1: recipe is unstable, WIP. Lower def pref.
  kexec-tools_2.0.1: arm seems unstable. WIP. Lower default pref.
  kexec-tools_2.0.1: fix insane arch detection [arm], bump pref and PR
  kexec-tools-klibc-static_2.0.1: update patch against new ver. Still broke=
n.

Denis 'Gnutoo' Carikli (4):
  intltool-0.40.3: addded libxml-parser-perl-native dep
  xorg-driver-common.inc: also inlcude(-I) the staging headers of xorg(else=
 co
  xf86-video-fbdev-0.4.0 : force it to use staged headers
  mdev,micro-base-image: removing mdev,because there is already "busybox-md=
ev"

Denys Dmytriyenko (1):
  omap3517-evm: fix jffs2 erase block and serial console

Elena Grandi (3):
  xapian-bindings-python: added build dependency on xapian-core-native
  python-xklavier: Python bindings for libxklavier
  sugar: added missing dependencies

Florian Boor (3):
  libetpan: Introduce patch to fix LDFLAGS for 0.57. Fixes QA issue.
  sqlite: Fix packaging to get pc file into -dev package.
  dbus.inc: Make sure target directory exists before installing files to it=
.

Graeme Gregory (3):
  linux-omap-zoomsync_2.6.31.bb : intoduce OEV to increment until omapzoom2
  omap3-sgx-modules_1.3.13.1607.bb : add 2.6.31 patch building, only for

Henning Heinold (2):
  batmand: update to version 0.3.2
  mc: fix configure

Jeremy Lain=E9 (1):
  linux-2.6.29: add devicetree image for boc01 v1 and v2

Koen Kooi (39):
  rt3070: add driver for the ralink 3070 sb wifi module, original recipe fr=
om
  omap3-touchbook: drag in rt3070 driver using task-base
  ffmpeg svn: bump SRCREV, increase PR for gst-ffmpeg
  mplayer: bump SRCREV, remove hacks that aren't needed anymore
  task-base: remove rt3070 again, it needs wifi support to be enabled in th=
e k
  ffmpeg: move default_preference for armv7a to svn version
  ffmpeg svn: bump SRCREV
  angstrom feed sorter: add more machines
  glib-2.0: update 2.21 series to 2.21.6
  angstrom: move to a newer glib-2.0
  linux-omap 2.6.31: move to a later SRCREV that has more paches applied
  glib 2.0: add patch to work around bug #556515
  glib-2.0 2.21.6: add another patch to make gobject unrefing less racy
  lua 5.1: attempt to get in in a buildable state again
  enlightenment: bump SRCREV
  glib-2.0: add 2.22, latest stable
  gtk+: add 2.18.0
  angstrom: switch to gtk 2.18 + glib 2.22
  omap3-touchbook: also ship xf86-input-tslib
  linux-omap-pm 2.6.29: add omap3-touchbook support
  linux-omap -2.6.29: use proper omap3-touchbook file
  linux-omap-psp: add 2.6.31rc7 recipe
  omap3: bump MACHINE_KERNEL_PR
  linux-omap-pm 2.6.29: tweak omap3-touchbook defconfig
  omap3-touchbook: switch to linux-omap-pm
  pointercal: add omap3-touchbook support
  xf86-input-tslib: rrecommend tslib-calibrate
  ti-dmai: add omap3-touchbook support
  omap3-sgx-modules: add proc patch for omap3517 and omap3 evms as well
  ti dsp recipes: replace some _beagleboard depends with _armv7a ones
  ffmpeg: bump SRCREV
  mplayer: bump SRCREV to pull in a newer ffmpeg, update vo_omapfb
  linux-omap-psp 2.6.31: disable dss2 v4l2 since it breaks compilation

Leon Woestenberg (5):
  linux-powerpc-fsl: Update GIT revision for Freescale Calamari board kerne=
l.
  libvorbis: In configure.in, remove cpu=3D for powerpc tripplets.
  libvorbis: Add missing patch.
  openssl.inc: Deal with HOST_OS=3Dlinux-gnu during configure.
  lsof.bb: Add configure support for linux-gnu.

Mike Westerhof (1):
  SlugOS: initscripts - add in the correct device_table.txt for SlugOS,

Omar Barron (1):
  linux-omap-zoomsync_2.6.31.bb : updated linux omap zoom sync kernel

Stanislav Brabec (1):
  matchbox2: Make it working:

Stefan Schmidt (11):
  e-wm-config-illume-shr: Add recipe (from SHR)
  ophonekitd: Add recipe (from SHR)
  shr-contacts: Add recipe (from SHR)
  shr-dialer: Add recipe (from SHR)
  shr-installer: Add recipe (from SHR)
  shr-messages: Add recipe (from SHR)
  shr-splash*: Different splash themes (from SHR)
  shr-themes: Different SHR theme (from SHR)
  shr-today: Add recipe (from SHR)
  linux-palmpre: Add kernel recipe for the Palm Pre.
  palmpre.conf: Add recipe for the Palm Pre handset.

Steve Sakoman (1):
  libgles-omap3: fix typos in cpu detection script and pvr init

Bugs fixed:

bug_id resolution        short_desc
68 WONTFIX       gcc-cross-3.4.4 fails under uclibc: argz.h not found
4302 FIXED       php build error
5293 FIXED       Apache 2.2.3 issue with multiple listen

Bugs opened:

bug_id resolution        short_desc


