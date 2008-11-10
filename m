Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KzeWE-0006vV-5k
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 22:41:58 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3401562rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=EeSnk5wGqo/O0kHIfdckUDnsqMNknWGWq0IH8xxveQI=;
	b=Co/H9Ari1e/6b5igmJnZFp9f8c9YTKoplvbzANk0jGRXEoVzgnDexldhOPoBzcNd5f
	27XBo3xZ7uHjzOb3b2rEuX7x07XnemFLdxfT339520VxtQR2Pn0z1rnF7Ynv7kVv8vcu
	+a8aU//n79fueTXIp5NB6q5hnBTJxzAivhZOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=PHloeMElqu8ogIKJ2lUUWDkUzTxdeq9ujZMl1iJZjauibhnHuHpeZCKyMTtdA8BGzr
	B92WXLzL9vCOFUjMjqBnThgKASpmmyCsdPAz+EUJNGMz5MBDCi6PVOqgd/8bpQhBwvVt
	pTKj8EpkgR5DnwB6pEyfvapnz8oKV8FMgNRE4=
Received: by 10.141.122.1 with SMTP id z1mr3828200rvm.210.1226351797000;
	Mon, 10 Nov 2008 13:16:37 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Mon, 10 Nov 2008 13:16:36 -0800 (PST)
Message-ID: <f96d234e0811101316j25c4f1dfga5b58886f3949cc7@mail.gmail.com>
Date: Mon, 10 Nov 2008 16:16:36 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-11-03 to 2008-11-10
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
X-List-Received-Date: Mon, 10 Nov 2008 21:41:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OE weekly changelog 2008-11-03 to 2008-11-10

Andrea Adami (1):
      bluez-utils: apply sbc-thumb.patch for 3.36

Chris Larson (1):
      base.bbclass: use 'git log' & 'git branch', not git-log & git-branch.

Daniel Willmann (1):
      fso-image.bb: Replace xterm with gpe-terminal

Denys Dmytriyenko (1):
      glibc: Add support for compiling glibc with march=i686

Felix Domke (1):
      twisted-python: fix packaging of twisted-python-protocols

Holger Hans Peter Freyther (3):
      python-pygame: Blacklist smpeg and build pygame without smpeg

Koen Kooi (15):
      sysvinit: avoid u-a race condition by raising 'init' to 60
      totem: add missing patch for 2.24.2
      xserver kdrive 1.4.0.90: bump PR
      webkit gtk: x96 and ppc default to dolt, which doesn't
understand ${TARGET_PREFIX}, so create libtool from
${TARGET_PREFIX}libtool
      angstrom feed builder: add more recipes to build
      xf86 video omapfb: bump SRCREV to fix segfault during fb probe
      linux-omap git: add patches for new DSS (the nokia version, not
the TI one), update beagle defconfig and bump to 2.6.28rc3
      linux-omap git: add patch to fix red-tint on omap3evm screens
      angstrom release set: remove ep93xx machine, add beagleboard and
      angstrom release set: pass machine via env
      checksums: add sums for gnome-python and pyorbit
      pyorbit: update to 2.24.0
      gnome-python: fix locations of defs files
      gnome-python: use stage_all instead of stage_includes
      gnome-python-desktop: sed some more python locations

M. Dietrich (1):
      checksums.ini: Add various checksums

Marcin Juszkiewicz (1):
      checksums.ini: added some entries

Michael 'Mickey' Lauer (6):
      task-cli-tools: ship utils that require python seperately (for
system with low space requirements)
      fso-[console-]image: WIP towards using more tasks
      python-fugrep 0.50: new recipe; a python library for fuzzy
pattern matching.
      fso-illume-image: new recipe; An fso-compliant bare illume image
as a starting point for X-based applications
      sane-srcrevs.inc: bump freesmartphone.org and openmoko recipes
to prepare for FSO ms4
      u-boot-openmoko: bump stable version, remove unstable version
since u-boot-openmoko has been deprecated.

Mike Westerhof (3):
      fso-image-nox: a small no-x11 fso image for the GTA01 and GTA02
      meta-toolchain-fso: bitbake recipes for a toolchain and SDK for fso.
      glib-2.0-native: update older recipe (2.16.1) to also install libgio.

Otavio Salvador (8):
      replace remaining DEBPV variables with EXTENDPV
      libvncserver_0.9.1: fix building using libtool 2.2.4
      thunar: depends on gamin to use inotify
      tightvnc: provide vncviewer alternative to provide more flexibility
      tightvnc: add a default X resources file
      ica-bin: add 10.6 recipe
      xfdesktop: fix segfault when removable icons are disabled
      xkeyboard-config: update to 1.4

Phil Blundell (2):
      glib-2.0: apply patch from Andrea Adami to make thumb work with 2.18.1

Philip Balister (3):
      gnuradio : Fix stupid typo.
      pulseaudio-meta_0.9.10.bb : Correct typo.

Robert Schuster (2):
      openjdk-langtools-native: New recipe.
      checksums.ini: Added entries from SRC_URI of openjdk-langtools-native.

Stefan Schmidt (3):
      shared-mime-info: Bring back db update in postint for 0.20 and 0.22
      fso-image: Use the correct name for the fso illume theme
      checksums.ini: Add sums for xkeyboard-config-1.3

Tom Talpey (6):
      gnome-games: better granular packaging
      guile: Add libtool dependency
      gnome-python-desktop: Add DEPENDS for gnome-python and
libgnomeprint*, needed for gnome-games.
      gnome-desktop: add libxrandr to DEPENDS
      gnome-python 2.22.1: new package
      pyorbit 2.14.3: new recipe

woglinde (1):
      glib-2.0: fix atomic-thumb.patch

(I don't think the bug lists below are complete -- under investigation)

Bugs fixed:

bug_id resolution        short_desc
4624 FIXED       opie-mediaplayer1-core-1.2.4-autobuild
4015 DUPLICATE   dsniff-2.3-autobuild
4028 DUPLICATE   scummvm-0.9.1-autobuild
4798 FIXED       glibc fails with -march=i686 or pentiumpro or pentium3

Bugs opened:

bug_id resolution        short_desc
4799     hal-0.5.11 fails with external toolchain/SDK
4802     gnome-panel-2.24.0 cannot find scrollkeeper


-- 
=======================
Cliff Brake
http://bec-systems.com


