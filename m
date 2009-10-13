Received: from [209.85.210.171] (helo=mail-yx0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MxiJW-0007lF-3Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 16:25:25 +0200
Received: by yxe1 with SMTP id 1so3169036yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=spAMmsw0eqE8LimXdcf6dSMxwkH3U46gkH0oSQMN1zo=;
	b=Fx8DLhW76Y3P8qDL5SaTFMNi/NCOt09V+3wqQTXyX66Ma+6aEBh6qLwbnVnSx5n0Nr
	8BDaakONFHHKwnLhgyKezhPmQ4pG9VhkCl+JgOkD0kO/fFni5MxdMSZHZBQvQn9z94Z5
	p9+a/e8r9BwOMOr+OSO4kGc2uJwUmy+F2AToE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=YGJznm0+e8MrDGjtqdnOlNpoLZtMLaAt8dMsgwMvD50PiTORrV0kBh0Dnd3163QpdG
	1G00kAmX42JfyEl0i1Qb2L7iyCWIChHEEj7unV7Q9vMNWehoSDJmPGM/A4G6O5LFw9Qu
	cAkynsTVlyKYgliiD7knzi/xZOLUxorSRynVI=
MIME-Version: 1.0
Received: by 10.150.33.1 with SMTP id g1mr12568934ybg.265.1255443867132; Tue, 
	13 Oct 2009 07:24:27 -0700 (PDT)
Date: Tue, 13 Oct 2009 10:24:27 -0400
Message-ID: <f96d234e0910130724y27ae6a4dlb50e17a8b18a1e73@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-10-05 to 2009-10-12
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
X-List-Received-Date: Tue, 13 Oct 2009 14:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-10-05 to 2009-10-12

Andrea Adami (8):
  kexec-tools_klibc-static_2.0.1: rewrite some functions for klibc compatib=
ili
  kexec-tools-klibc-static_2.0.1: revised patchset/Tested on arm. Bump PR.
  kexec-tools_2.0.1: split klibc patch creating the 'no getline, no fscanf'=
 pa
  kexec-tools-klibc-static_2.0.1: bump default preference
  kexec-tools_2.0.1: rework/fix no-getline-no-fscanf.patch. Credits to Yuri=
 Bu
  dietlibc.inc: use the right prefix for cross tools. Bump PR.
  linux-kexecboot.inc: to be quiet we set master console on serial. Bump PR=
.
  kexecboot_git: move to e7f85b13e144a594fa726f5f7ca4bd3e2327e2b3. Bump PR.

Brijesh Singh (1):
  gstreamer-ti_svn: bump-up svn rev

Graeme Gregory (3):
  angstrom-*libc.inc : fix the TARGET_OS definitions for non eabi/spe targe=
ts.
  linux-omap-zoomsync_2.6.31.bb : increment OEV not PE

Graham Gower (1):
  matchbox-panel-0.9.3: fix uninitialised variable causing SIGBUS

Henning Heinold (4):
  lighttpd: switch to .inc file and INC_PR
  lighttpd: inherit gettext
  lighttpd: starting depends on three modules
  opie-networksettings: fix install for changedns

Jeremy Lain=E9 (4):
  linux-2.6.29: update patch for lm73 on boc01
  linux-2.6.29: update SPI patch for boc01
  linux-2.6.29: update boc01 isl12024 driver to new style i2c
  linux-2.6.29: update boc01 unique ID patch to use sysfs

Khem Raj (16):
  siteinfo: Add common-mips site file.
  linux_2.6.31.bb: Make default for db1200
  wvstreams_4.6.bb: Disable parallel build.
  siteinfo.bbclass: Fix powerpc triplets and removed unused ones.
  lsof_4.78.bb: Override LSOF_OS for gnuspe and uclibcspe targets.
  binutils-cvs: Refresh binutils-uclibc-300-012_check_ldrunpath_length.patc=
h w
  gcc-4.4.1: Backport powerpc patches to improve code generation at -Os
  wvdial_1.60.bb: Use g++ for compilation.
  siteinfo.bbclass: Remove spurious print.
  insane.bbclass: Use linux-gnu for TARGET_OS
  omap5912osk: Use 2.6.31 as default kernel.
  conf: Decosmetize TARGET_OS
  angstrom: Revert to linux-gnu triplet
  classes: Use linux-gnuspe instead of non existing linux-spe
  gcc-4.4.1: Add TARGET_FIX_V4BX_SPEC to LINK_SPEC
  uclibc-nptl: Bump the SRCREV

Koen Kooi (4):
  enlightenment: some modules moved in the svn tree, account for that
  gstreamer: update some bits
  wpa-supplicant: fix merge error
  gst-plugins-base: add pango as dep

Konrad Mattheis (1):
  u-boot 2009.08

Marcin Juszkiewicz (6):
  linux-bug: updated to newer svn revision, tweaked kernel configuration
  linux 2.6.30: update to 2.6.30.9
  linux 2.6.31: update to 2.6.31.3
  checksums.ini: added missing entries
  checksums.ini: some new entries
  Revert "Add latest xorg stuff for xserver-1.7, script for easy recipe bum=
p a

Martin Jansa (1):
  Add latest xorg stuff for xserver-1.7, script for easy recipe bump and xf=
86-

Omar Barron (1):
  linux-omap-zoomsync_2.6.31: update commit id

Otavio Salvador (4):
  machine/qemux86: x86 is MACHINE_FEATURES already set in i686-generic mach=
ine
  wpa-supplicant: use INC_PR
  squashfs-tools: drop 2.0, 2.2r2 and 3.1r2 versions
  squashfs-tools: refactor 3.3 and 4.0 recipes and use INC_PR

Stanislav Brabec (5):
  xserver-kdrive-1.3.0.0: Report correct XRandR version. Fixes non-working =
GTK
  xorg-xserver: XRandR version fix 06c06f6 ported to all old X servers.
  python: Fixed -dbg QA error (config/.debug in python-distutils).
  matchbox-desktop-2: Make fallback folder compatible with current matchbox=
-co
  pidgin: crash and recipe fixes:

Steffen Sledz (2):
  linux-2.6.24: enable root nfs support for hipox machine
  linux-2.6.24: build some usb-ethernet modules for hipox machine

Steve Sakoman (8):
  angstrom-2008-preferred-versions.inc: use wpa-supplicant 0.6.9
  atk: add 1.28.0
  atk-native: add 1.28.0
  gcalctool: add 5.28.0
  gnome-icon-theme: add 2.28.0
  angstrom-2008-1.conf:  Use gconf rather than gconf-dbus
  gnome-screensaver: add 2.28.0
  shadow: add 4.1.4

Yuri Bushmelev (1):
  Added SHARP Tosa support to linux_2.6.30 recipe

 Bugs fixed:

bug_id resolution        short_desc
5325 FIXED       clutter uses mesa instead of virtual/libgl

Bugs opened:

bug_id resolution        short_desc


