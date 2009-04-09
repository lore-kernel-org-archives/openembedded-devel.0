Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lrsb3-0005Lx-NN
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 13:39:08 +0200
Received: by yx-out-1718.google.com with SMTP id 3so391141yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2009 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=A5AHqoABzn/RNLSanJbU8mKIHtYglqZnnRHAnjmPxSI=;
	b=NLwofxf/LKnA4TALMCBwJkJCXha7vOlGIiM0pXf4myB0ZE9lmOa5WHzaTYAm6j7YWY
	tmWM/Ex1Lv3u97K0fA+uHlM2j8iTD7QU9nqbU1T3cnu9Qk9SJJ/KjOZFnNWZm8kg/abW
	/y+ci5YJa/+IeEOjHYnwNAK+TWw0uA2yaZiP8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DitxG3CAoDnhjrPtsU5lRaSNupdSedGsEZ8ln/0ZXDK8ynCBq09jl9rDW35fyvVqtS
	k5W6qRZb99dwXg2hKJ/U/g2/46Qr1ibz04GeASSMqAUNQXZ/AgLLrlx6xoZuQOJEwpQC
	G5rkne//gSWpH9xaFDUM5W9uUPEvhF7e8+7g8=
MIME-Version: 1.0
Received: by 10.151.112.3 with SMTP id p3mr4485859ybm.27.1239276956787; Thu, 
	09 Apr 2009 04:35:56 -0700 (PDT)
Date: Thu, 9 Apr 2009 07:35:56 -0400
Message-ID: <f96d234e0904090435l3e686f68vc0c77c7c12ef9d47@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.157
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2009-03-30 to 2009-04-06
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
X-List-Received-Date: Thu, 09 Apr 2009 11:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-03-30 to 2009-04-06

Andrea Adami (5):
      kexecboot: clean recipes
      device_table_minimal: add /dev/event1 - /dev/event7
      angstrom-2008.1.conf: add PREFERRED_VERSION_psplash
      angstrom-2008.1.conf: fix typos
      initramfs-kexecboot-image: fix EXTRA_IMAGEDEPENDS for c7x0/akita/spit=
z

Angus Ainslie (1):
      Add elementtree checksum

Chris Larson (4):
      sato-icon-theme: I doubt sato-icon-theme.inc including
sato-icon-theme.inc is helpful.
      bitbake.conf: set a default BBMASK of /(nonworking|obsolete)/.
      MAINTAINERS: I'll grab autoconf, automake, libtool, gnu-config,
and the autoconf classes.
      MAINTAINERS: I can spell my own name.  Really.

Frans Meulenbroeks (9):
      linux-omap_2.6.29.bb: added mmctiming patch
      linux-omap_2.6.29: added ehci patch
      linux-omap_2.6.29: updated defconfig (more compatible with .28);
moved srcrev to git head
      linux-omap_2.6.29: added building nfsd module
      linux-omap_2.6.28: added NFSD as module in beagleboard/defconfig
      checksums: add checksums for zope interface

Graeme Gregory (2):
      firefox_3.0.8.bb : add new version, seems to compile with modern gcc
      checksums.ini : add firefox 3.0.8

Henry von Tresckow (1):
      sg3-utils: Updated Makefile patch to deal with cross-compiling

Ihar Hrachyshka (1):
      ruby-dbus: new recipe

Jader H. Silva (1):
      Add calibrateproto and libxcalibrate sane srcrevs

Jeremy Lain=C3=A9 (29):
      neuros: replace qt-embedded by qt4-embedded
      qtopia-core-*: remove obsolete qtopia tasks and images
      MAINTAINERS: add qt4/* to my entries
      qt4-embedded: rename qt-embedded-* to qt4-embedded-*
      linux-2.6.27: remove unnecessary patch for boc01's PHY
      linux-2.6.29: add patches for boc01
      hostap-daemon-0.6.9: disable madwifi-ng support
      qt4-tools-native: set LFLAGS to pick up zlib from staging
      makedevs: use LDFLAGS (fixes QA error)
      procps: use LDFLAGS (fixes QA error)
      wireless-tools: use LDFLAGS (fixes QA error)
      zeroconf: use LDFLAGS (fixes QA error)
      ncurses: add patch to use LDFLAGS (fixes QA error)
      libmikmod: add patch to use LDFLAGS (fixes QA error)
      insane.bbclass: document error class "9" (LDFLAGS ignored)
      linux-2.6.29: enable legacy wireless regulatory support for boc01
      bzip2: add patch to use LDFLAGS (fixes QA error)
      openssl-0.9.8j: add patch to use LDFLAGS (fixes QA error)
      libpcap: add patch to use LDFLAGS (fixes QA error)
      perl-5.8.8: use LDFLAGS for shared libraries (fixes QA error)
      linux-rp-2.6.26: update qemux86 defconfig
      sqlite: use LDFLAGS (fixes QA error)
      linux-rp-2.6.26: improve qemux86 defconfig, make preferred
      linux-rp=EF=BF=BD-2.6.26: addserial console support for qemux86

Jrg Bakker (1):
      linux-epia: Add patch to include <limits.h> in scripts/mod/sumversion=
.c

Koen Kooi (37):
      ecore: fix packaging after last update to SRCREV
      linux-omapzoom: fix defconfig
      linux-omap 2.6.29: add omapzoom support and fix PV so it can
find the proper patches
      linux-omap: add patch to fix mmc support and update defconfig
      omapzoom: linux-omap work better on the device than
linux-omapzoom, so switch to that
      omapzoom: add xf86-input-tslib
      firefox 3.0.8: lower default pref
      webkit-gtk: fix PV
      gcc 4.3.x: disable thumb mode for now, glibc builds don't like
it
      webkit-gtk: update to 1.1.4 release to get some more bugfixes
      linux-omap 2.6.29: update mmc regulator patch
      angstrom 2009.X: switch to bluez4
      places: bump PR
      initscripts: set alignment to 0 for armv7a
      linux-omap 2.6.29: disable alignment trapping completely for
omap3board
      epiphany: update to 2.27
      checksums: add more packages
      gnome-desktop: update to 2.26
      eds-dbus: bump SRCREV
      cheese: add 2.26
      places: add patch to fix API change introduced by SRCREV bump
      cheese: add rrecommends to gconf-elements
      gnome-keyring: add missing dependency on gconf-dbus
      gimp 2.6.3: explicitly depend on webkit-gtk since it gets
dragged in if present
      gnome-panel: update to 2.26
      gnome-python-desktop: update to 2.26.0
      gstreamer-ti: fix path to codec combos
      ti-codec-combos: symlink .cfg files so gstreamer-ti can find
them
      linux-omap 2.6.29: update overo bits and apply some patches from
the overo OE branch
      linux-omap 2.6.29: fix thinko with overrides
      linux-omap: move overo to 2.6.29

Leon Woestenberg (2):
      linux-2.6.29: Added machine canyonlands (PowerPC 460EX).
      linux-2.6.29: Stylize, use spaces not tabs.

Marcin Juszkiewicz (4):
      gtk+: stage gtk-builder-convert to get gnome-keyring built
      libtheora: added staging to get ffmpeg build
      openssl-native: removed FILESPATH setting which is not needed
      checksums.ini: added entry for esekeyd, removed duplicate of gcc 4.3.=
2

Michel Pollet (1):
      esekeyd: ESE keyboard daemon recipe

Mike Westerhof (4):
      linux-ixp4xx: add 2.6.29 kernel recipe, defconfig for NSLU2, and bump
      openssl: make the default -native recipe match
      SlugOS: leds - attempt to modload ledtrig-timer rather than assuming
      SlugOS: leds - fix logic to attempt to beep even if udev hasn't yet r=
un.

Otavio Salvador (8):
      firefox.inc: disable application updating
      firefox.inc: properly support locale usage based in system locale
      firefox-l10n-pt-br: add
      alsa-state: register the script for the shutdown, storing the setting=
s
      gnome-keyring: depends on gconf to fix a FTBFS
      machine/geodegx: optimize using gcc 4.3 -mgeode and a specific feed a=
rch
      machine/geodelx: optimize using gcc 4.3 -mgeode and a specific feed a=
rch
      qemux86: use i686-generic as basis

Robert Schuster (8):
      cacao 0.99.3: Added patch to fix PR99 (this time for real).
      llvm-native 1.9: Removed.
      lesstif 0.95: Actually install something into staging.
      llvm: Reworked to allow multiple installation of same version.
      llvm-gcc4-cross: Change dependency to llvm2.5-native.
      checksums.ini: Removed llvm entries from 1.9 to 2.4.
      libxt 1.0.4: Added official patch to fix X.org PR10970.
      llvm.inc: Declare dependency of llvm<ver> on llvm<ver>-native

Roger Monk (1):
      ti-codec-combos: Use DVSDK Codec Combos to be aligned with DVSDK

Stanislav Brabec (9):
      mc: Use system libexecdir.
      gst-ffmpeg: Updated to version 0.10.7.
      gtk+.inc: Package modules .debug, remove unusable modules .la files.
      gtk+: Replace also gail subpackages.
      virtual/gail: Introduction of new virtual:

Steve Sakoman (1):
      cmake, git-native, python: Bump PR to force rebuild

Tom Rini (4):
      linux-nokia: Add linux-2.6-limits.patch, bump PR
      ltp: Fix building on ARM.
      gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123] SRC_URI to use
${GNU_MIRROR} and update checksums.ini

Ulf Samuelsson (1):
      libtheora_1.0.bb : Do not build libtheora docs/examples since
this will try

rmonk (1):
      codec-engine: Add development support for Codec Engine 2.23

woglinde (14):
      scons.bbclass: add staging function
      libxine: remove older verison and add the actual 1.1.16
      checksum.ini: add xine-1.1.16 remove older versions
      libgsm: update to version 1.0.12
      liboil: update to latest liboil, needed for latest schroedinger
      Revert "liboil: update to latest liboil, needed for latest schroeding=
er"
      Revert "checksum.ini: add xine-1.1.16 remove older versions"
      Revert "libxine: remove older verison and add the actual 1.1.16"
      libxine: remove older verison and add the actual 1.1.16
      checksum.ini: add xine-1.1.16 remove older versions
      xine: update to new xine recipe
      disko: add disko framework to openembedded
      ffmpeg: fix armv4 arch, patch can be zapped if gcc-4.4 is out
      e2fsprogs: disable tls for now, if we are oabi and uclibc

Bugs fixed:

bug_id resolution        short_desc
4234 FIXED       zaurus-updater not being pulled in

Bugs opened:

bug_id resolution        short_desc
5078     [patch] fix move wrong generated rpm name in package_rpm .bbclass


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


