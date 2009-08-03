Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MY3JF-0007bA-OD
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 21:35:02 +0200
Received: by yxe31 with SMTP id 31so6216116yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=MqskIkQ56FtIWNnnVrPVJ7FLtEp2A3kb2HSiEd6kGXc=;
	b=UKUYZ9qbiNsIj0clw4snTyL6peDaI8Z1fuqYdpJefpBMXTWLvp/II4PWiKcJITdToI
	Og012xKY2kFWRuFjZ4na9sHSYwnXCJj18pxVB8AEQtsVNcjUpsvOHY6RVdz+kFYLpoU8
	Wsj+AJs35TdeZRXRt77KqeNQTCD5v7lSk3BS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=r4KrMmnSxgpS346MG6Y28chYdPYg+2ZdbPXrtl3Knxf37ZD4pVV1j6zO15Zl1r9xJQ
	VmkTQmRElUL6L2Uu74CwMj+y1C+bmX9O1GZ62MUEtzfSdkht0Rkxt5Maw41uYT+jTj+B
	x5k5q5Ecs8vB6JM9a83LOT99UQVkhIMgXAPrw=
MIME-Version: 1.0
Received: by 10.150.189.20 with SMTP id m20mr11117946ybf.255.1249327171905; 
	Mon, 03 Aug 2009 12:19:31 -0700 (PDT)
Date: Mon, 3 Aug 2009 15:19:31 -0400
Message-ID: <f96d234e0908031219w2d0ff7c1v7a6176da8d695ba5@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-07-27 to 2009-08-03
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
X-List-Received-Date: Mon, 03 Aug 2009 19:35:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-07-27 to 2009-08-03

Andrea Adami (1):
  nandlogical: add nandlogical-klibc-static for Zaurus

Cliff Brake (3):
  mono: add 2.4.2.3 recipes
  checksums.ini: restore entries that got deleted in last commit

Dmitry Eremin-Solenikov (3):
  oestats-client: restore support for proxies

Graeme Gregory (5):
  libtool_2.2.6a : add newest version of libtool disabled by default
  transmission_1.73.bb : add new version of transmission
  powertop_1.11.bb : add omapzoom2 support for building
  linux-omap-pm_git.bb : update the commit to the latest SRCREV
  angstrom-2008-preferred-versions.inc : update the libtool version used.

Graham Gower (2):
  usermanual: Mostly grammar and spelling fixes
  kernel.bbclass : moved uImage creation from do_deploy to between do_compile

Henning Heinold (5):
  chinook-compat.conf: use slighty newer gstreamer version
  libsndfile: remove the libtool.m4 from libtool-2.x
  libsndfile: now really bump PR
  libxine: remove old/new header configure stuff from 1.1.16.3
  util-linux-ng: fix tls detection

Holger Hans Peter Freyther (15):
  libx11-trim: Update makekeys.c to fix the compile
  e2fsprogs-libs: inherit gettext to fix uclibc build
  libxext-1.0.5: Depend on xdmcp as configure wants it
  libdbi: Introduce libdbi 0.8.2
  openbsc: Add openbsc and build it from git.
  libdbi: Move from 0.8.2 to 0.8.3 which is the latest version
  libdbi-drivers: Upgrade to 0.8.3-1 with more db drivers
  qt4: Qt4.5 is released under LGPLv2.1 and GPLv3
  qt4: Use require instead of include to fail on missing includes
  qt4: Add patch to fix the visibility and bsymbolic detection
  qt4: Do not recreate the link if it exists otherwise do_install will fail
  base.bbclass: Strip -sdk from the PN for BPN as well
  gdb: Add a patch to fix compilation of gdb 6.8
  meta-toolchain-qte: Reorder the tasks to match other recipes
  qt4.inc: Fix of shell for some shells

Khem Raj (5):
  tinylogin, unzip: Update URLs.
  minimal.conf: Add PREFERRED_PROVIDER for libusb0.
  uclibc: Convert eligible uclibc recipes to use git instead of svn.
  uclibc_git: Remove DEFAULT_PREFERENCE

Koen Kooi (17):
  kexecboot: switch git version to a stable cfgfiles SRCREV and make it the de
  xserver-common: run tslib-calibrate for angstrom instead of xtscal (patch fr
  ntfs-3g: update to 2009.4.4
  qt4x11 bbclass: only match first 12 chars in automagical dependency adder
  qt4-x11-free-gles: reinstate it now the weird dependency problems have been
  linux-omap-pm git: start updating it to .31rc
  linux-omap-pm git: add patch for fix musb oops and dss2 patches
  linux-omap-pm git: fix mtd and tweak defconfig
  linux-omap-pm: make u-boot flashable from within linux, first attempt at mak
  enlightenment: bump SRCREV, fix upgrade paths
  task-beagleboard-demo: remove exhibit
  libtool 2.2.6a: fix libltdl problem, add default pref version so distros don

Leon Woestenberg (7):
  libnxml: Use .inc and INC_PR.
  libnxml: Added 0.18.3. Changed upstream URL www2.* to www.*.
  libnxml.inc: Fix INC_PR from "0" to "r0".
  libmrss: Use .inc and INC_PR.
  libmrss: Added 0.19.2.
  libnxml: Added 0.18.3.
  rsstail: New recipe for 'tail' like RSS feed reader. (Needs QA love.)

Marc Olzheim (1):
  libtool: 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 broke do_configure.

Philip Balister (1):
  xilinx-ml403 : Do not build a kernel for this machine.

Stanislav Brabec (2):
  libtool: Fixed paths to grep and sed.
  gqview: Use motion hints for smooth panning. Sanitize rc file parser. Fixed

Stefan Schmidt (1):
  emotion_svn: Give path to edje_cc to fix build. Bump PR.

Steffen Sledz (2):
  linux-2.6.24: some pin assignements fixed in defconfig for hipox machine
  linux-2.6.24: NAND flash size fixed for hipox machine

Steve Sakoman (5):
  gnome-power-manager: fix typos in specification of FILES for doc package
  gtksourceview: package was missing a few important files, add them
  policykit: install missing PolicyKit.conf
  xmms: tweak .desktop file so that it works with gnome
  icecast: add 2.3.2

Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc


