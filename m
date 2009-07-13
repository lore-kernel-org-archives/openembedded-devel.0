Received: from [209.85.212.182] (helo=mail-vw0-f182.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MQNn4-0004AG-Oj
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 17:50:07 +0200
Received: by vwj12 with SMTP id 12so294646vwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=p210o8O2ifWsCiug+hwXv+qn2wnCg+ZRwOwz5iOHGrQ=;
	b=tIswPsaaiV7TSFydSpVvo0kJn6tAZ6kgjaQfWUvyaZXFCFmKYl3Rzi+mX/8xM6W8JN
	2xqskpbySc3LFP1EerItMxyVvgFtRrYoF852zGWlBKsKedE+JIqyIIHADlrXSLw9OeaS
	tkFlHx6uO++A1DuRXdBcxf4vGzqa9jhycpH/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=bSogS5JcNPhcv60RQOUFKj850bn+DgiQkZGhbvF98TBDYvRqnJ5jt+EsGiwfx2VyuI
	+X9SapR4Smm6SALJzUWR8+B+untQTmtfOA5iu8DvZXhFjxAcQNRYxn3lyaZk/y3HABls
	QeQhkFuJdh3OI8Bgh10rgr4T29wRZT7vaSWGc=
MIME-Version: 1.0
Received: by 10.150.158.21 with SMTP id g21mr8359065ybe.46.1247499411952; Mon, 
	13 Jul 2009 08:36:51 -0700 (PDT)
Date: Mon, 13 Jul 2009 11:36:51 -0400
Message-ID: <f96d234e0907130836y530c759dk9f16f8714d9e95e6@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-07-06 to 2009-07-13
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
X-List-Received-Date: Mon, 13 Jul 2009 15:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-07-06 to 2009-07-13

Cliff Brake (1):
  net-tools: unexport TOPDIR in recipe as it is used by the makefile

Denis 'Gnutoo' Carikli (2):
  udev 118 : fix GNU hash

Dmitry Eremin-Solenikov (10):
  linux-mainstone: fix building with current gcc
  sort.sh: add mainstone and at91sam9g20ek to the list of armv5te machines
  sort.sh: add ppce500 arch and tqm8540 as one of machines
  build-release.sh: add at91sam9g20ek
  build-feeds.sh: it's now lowpan-tools, not lowpan-utils

Florian Boor (1):
  linux: Update 2.6.30-rc4 with more tx25 patches.

Graeme Gregory (5):
  omapzoom2.conf : add new zoom2 machine file
  u-boot_git.bb : add zoom2 support to u-boot git
  linux-omapandroid_2.6.29.bb : android kernel for zoom2, seems to be the
  Revert "base.bbclass: add support for machine configuration fallback"

Henning Heinold (7):
  glibc: fix build for i486 arch at version 2.9
  pulseaudio: use right gettext automake macro for generating locales or not
  pulseaudio: fix building of bluez_ipc stuff
  pulseaudio: fix detection of tls for shared libraries
  pmount: fix gettext suppoprt now for real
  pmount: update to version 0.9.19
  uclibc: put SRC_URI = http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2

Holger Hans Peter Freyther (1):
  qt4.inc: Work with DISTRO=micro where local_prefix is ""

Ihar Hrachyshka (2):
  qt4: updated version to 4.5.2.
  qt4: added postgres, mysql, and sqlite2/3 support.

Koen Kooi (12):
  qt4: package demos and examples as well
  ffmpeg git: bump SRCREV to get decode_video2 api
  omapfbplay: add xv version with netsync option
  omapfbplay-xv: fix typo in recipe
  linux-omap 2.6.29: fix some vfp and neon bugs
  omapfbplay-xv: enable omapfb driver as well
  qt4: add extra hook into configure to munge some qmake stuff
  omap3.inc: bump PR for kernel change
  qt4-x11-free-gles: add an OopenGL ES1 version of qt4-x11-free
  opkg*: bump to r215 to fix segfaults on upgrade
  julius: add 4.1.2 of julius speech recognizer

Leon Woestenberg (2):
  linux: updated 2.6.25 and 2.6.27 for mpc8315e-rdb.
  calamari.conf: New machine (MPC8536DS development system).

Marcin Juszkiewicz (3):
  package_rpm.bbclass: be more quiet
  linux: added AT91 patch to SRC_URI for all devices
  checksums.ini: added 2.6.30-at91 patch

Marco Cavallini (2):
  New conf/distro/kaeilos.conf with customized include files
  Added recipes/psplash/files/ronetix-pm9263/psplash-default

Mario Domenech Goulart (1):
  opkg-native: use OE's libdir instead of hardcoded /usr/lib for update-altern

Michael Smith (4):
  xf86-video-intel: add 2.6.3
  xf86-video-vesa: add 2.2.0
  xf86-input-elographics: add 1.2.3
  package classes: count dotfiles as non-empty

Mike Westerhof (1):
  SlugOS: slugos.inc - switch from diet-x11 libs to standard x11 libs

Otavio Salvador (12):
  skype: add static and dynamic versions
  rdesktop: use INC_PR in recipes
  rdesktop (1.6.0): fix audio redirection for Windows 2008 Server/Vista
  rdesktop (1.6.0): add addin support
  read-edid: add get-edid package
  mesa: add version 7.4
  libdrm: add 2.4.11
  preferred-xorg-versions-X11R7.5.inc: started
  base.bbclass: add support for machine configuration fallback
  checkums.ini: add termcap 1.3.1
  checksums.ini add gnu ghostscript 8.64
  libgpg-error: convert to INC_PR usage

Philip Balister (2):
  gnuradio : Add bb file for GNURadio 3.2.1.
  gnuradio : Update subversion recipe. GNURadio trunk now includes NEON suppor

Robert Schuster (2):
  antlr-native 2.7.7: Use proper variable.
  classpath: Depend on antlr-native, increased resp. PRs.

Tom Rini (1):
  gmp: Fix a problem when ${exec_prefix} != ${includedir}, switch to INC_PR

 Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc


