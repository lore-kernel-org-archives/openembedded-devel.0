Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LtKSP-0000RZ-4f
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 13:36:25 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1732766rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=AK/OjRDQqfH3YpJq/2b0eMxaHkDkeItRKohQwrtQy7g=;
	b=vhO7WfqyKrzsg6EpHG170CBcEK6x4QjA83sn9c0/1RemfCPoZFdt5zNE0Ocr3n8EEf
	/7iIn8WYFjKWDaqeyCbcnu5iOdje/RR/pcukkLOvEmTEdCdlgJRq/4804+VHfCYfYWj1
	sg4mV+FNcDmwObRf3TG4HSW2BWSb+l7Hc1D3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=o1pMQ/EhgTzYRqAgOxn2fVI8JceGeDG/PlyFivU3gKN6ZiwUAVKXt5JCZAhNmWOicf
	SmBJGA8g4rOEv+HgNMimxlvfkFvgsJtUH4tIHiyJbpdIHN7/N0B8rl4pSLZTJLYLrVrj
	f/4KAUf36wMOoH5e0eAwQwvt4YxUDHhS0XxC4=
MIME-Version: 1.0
Received: by 10.140.193.16 with SMTP id q16mr2722650rvf.215.1239622354768; 
	Mon, 13 Apr 2009 04:32:34 -0700 (PDT)
Date: Mon, 13 Apr 2009 07:32:34 -0400
Message-ID: <f96d234e0904130432k60685454l8ce9b517fdee1cb4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.245
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2009-04-06 to 2009-04-13
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
X-List-Received-Date: Mon, 13 Apr 2009 11:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-04-06 to 2009-04-13

Andrea Adami (7):
      initramfs-kexecboot-image: fix EXTRA_IMAGEDEPENDS for all Zaurus
      linux-rp.inc: respect do_rm_work task
      zaurus-2.6.inc: add ZAURUS_KERNEL_IMAGETYPE
      various kernels: add missing DEFAULT_PREFERENCE =3D "-1"
      linux_2.6.29+2.6.30-rc1: initial commit
      zaurus-clamshell.inc: fix nasty typo in u-boot address
      zaurus-clamshell.inc: fix typo again...

Chris Larson (4):
      bitbake.conf, collections.inc: Add COLLECTIONS mechanism w/ a
sane default.
      collections.inc: add support for collection archives.
      collections.inc: add note about not overwriting existing vars.
      collections.inc: trim off trailing slashes for the entries in
COLLECTIONS.

Christian P=F6ssinger (1):
      asterisk: added 1.4.23.1

Denys Dmytriyenko (2):
      curl: move PACKAGES and FILES_* from the .inc file
      gegl: fix CR+LF newlines in the patch, as it fails to apply

Dirk 'Virk' Van Haerenborgh (3):
      add gsoap v2.7.13, generates C/C++ source codes for Web service
and client applications
      pcsc-lite: Update to version 1.5.2
      pcsc-lite_1.5.2: wrong download link

Frans Meulenbroeks (6):
      wxwdigets 2.8.9: fie cxx flags to allow compilation
      checksums.ini: added wxwidgets 2.8.10
      wxwidgets: moved to 2.8.10
      wxwidgets: add unicode version

Graeme Gregory (3):
      e2fsprogs_1.41.4.bb : remove bogus override of do_configure which bre=
aks
      linux_2.6.28.bb : increment PR and add better defconfig that has
MMC enabled so
      linux-2.6.28/atngw100/atngw100_defconfig : renamed to defconfig
so it

Jeremy Lain=E9 (27):
      libnl: use LDFLAGS (fixes QA error)
      tcp-wrappers: use LDFLAGS (fixes QA error)
      cups: use LDFLAGS for shared libs (fixes QA error)
      libmng: use LDFLAGS (fixes QA error)
      dhclient: use LDFLAGS (fixes QA error)
      pth: use LDFLAGS (fixes QA error)
      gd: use LDFLAGS (fixes QA error)
      postgresql: use LDFLAGS for shared libs (fixes QA error)
      postgresql-8.2.4: fix SRC_URI and checksums.ini
      gsoap: use LDFLAGS (fixes QA error)
      flite-1.3: use LDFLAGS (fixes QA error)
      gsoap: actually stage headers and libraries..
      libsoup-2.4: add missing DEPENDS on sqlite3
      ppp: add patch to use LDFLAGS (fixes QA error)
      irda-utils: add patch to use LDFLAGS (fixes QA error)
      obexpush: use LDFLAGS (fixes QA error)
      gsoap: use autotools_stage
      hostap-utils-0.4.7: use LDFLAGS (fixes QA error)
      hostap-utils: only keep version 0.4.7
      hostap-daemon-0.6.9: add patch to use LDFLAGS (fixes QA error)
      insane.bbclass: make "LDFLAGS ignored" QA errors fatal
      flite-1.3: fix LDFLAGS breakage
      aircrack-ng-0.9.3: use LDFLAGS (fixes QA error)

John Lee (1):
      openmoko.conf: update sources mirror URL

Khem Raj (2):
      gcc-svn: Add recipe to build bleeding edge gcc.
      sane-srcrevs.inc : Rev up eglibc and add revision for gcc-svn.

Koen Kooi (34):
      kernel,module-base class, bitbake.conf: introduce MACHINE_KERNEL_PR
      omap3 boards: introduce MACHINE_KERNEL_PR, put it in
conf/machine/include/omap3.inc
      linux-omap 2.6.28: introduce MACHINE_KERNEL_PR
      u-boot git: update overo and beagleboard to 2009.03
      linux-omap 2.6.29: fixes
      linux-omap 2.6.29: add patches to fix some bugs in the display
driver, XV now works again
      systray: as the name implies, a systray module for e17
      angstrom feed builder: add systray
      initramfs-kexecboot-image: fix parse warning
      e17: bump SRCREV to 39886
      linux-omap 2.6.2[89]: make 720p mode conform to CEA 681-E
instead of CEA 681-D
      gnome-bluetooth: add 2.27.1
      gnome-bluetooth: add RCONFLICTS with bluez-gnome
      linux-oma 2.6.29: reenable BT for beagleboard
      e-wm: fix profile selection in first-run wizard
      diskio: new e17 module
      e-wm-config-angstrom: refresh configs, add systray
      omap3-sgx-modules: add compile fix for DSS2 changes in
linux-omap 2.6.29
      ti-dmai: add compile fix for DSS2 changes in linux-omap 2.6.29
      libgles-omap3: these are evil binaries, so skip insane.bbclass
tests
      linux-omap 2.6.29: reenable BT for overo as well
      bluez4: add less restrictive (and hence less secure) bluetooth
dbus config
      bluez4: fix dbus service file
      gst-plugins-base: depend on libtheora so gst-plugin theora gets
built
      midori: use LDFLAGS (fixes QA error)
      bluez4: add 4.35
      openobex: add 1.5
      bluez4: fix HUGE bug
      obexd: add 0.10, needs bluez4
      gnome-panel 2.24: fix bonobo path
      gnome-bluetooth: use obexd

Luke Gox (2):
      linux-msm7xxxx: update vogue and kaiser. should make Xfbdev work

Marcin Juszkiewicz (1):
      pw-am.sh: script to import patches from patchwork into git repository

Mark Brown (1):
      watchdog: Update to version 5.6

Michael 'Mickey' Lauer (8):
      libssh: add libssh-native
      socat: catch up SRC_URI
      gabriel[-native]: new recipe; proxy for remote dbus access
      task-cli-tools: add socat
      vala-native: bump to 0.6.0 and make git version the default; we
need a bootstrap version now though.
      vala-bootstrap-native: bring back timestamp hack; still necessary
      enter: remove dead project.
      fsogsmd: new recipe

Mike Westerhof (1):
      SlugOS: toolchain/sdk - add a number of missing components

Raffaele Recalcati (1):
      linux-omap: add modeline for 720p60 to .28 and .29

Stanislav Brabec (7):
      autoconf213-native: Added old autoconf for fennec recipe.
      libart-lgpl: Added art_config.h for x86_64.
      gnome-panel: Compile idl files against STAGING_DIR_HOST.
      gnome-panel-2.26.0: Depend on packages explicitly checked by configur=
e.
      libidl: Build depends on flex-native.
      nautilus: Compile idl files against STAGING_DIR_HOST.

Tom Rini (10):
      binutils-cross-sdk: Make relative, not absolute symlinks for
'as', etc, bump PR
      gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
      meta-toolchain, canadian-sdk: Move C++ headers into the correct
location, bump PR
      meta-toolchain-gpe-sbox: Drop task-sdk-gpephone (to match
m-t-gpe), bump PR
      wireless-tools: Fix libiw/ifrename packages, bump PR.
      checksums.ini: Add vala-0.6.0
      canadian-sdk: Add SDK_REALPATH_MINGW variable, so that we can
prepend a drive letter for sysroot.
      binutils-canadian-sdk: Use add SYSROOT, use SDK_REALPATH_MINGW, bump =
PR
      gcc-canadian-sdk: Fix C++ relocation, add SYSROOT, use
SDK_REALPATH_MINGW, bump PR.
      mingw-binutils: Add 2.19.1 recipe and split common parts out
into mingw-binutils.inc

Ulf Samuelsson (8):
      Add support for AT91SAM9G20EK
      Add support for at91cap9adk development board with a at91cap9500 proc=
essor
      Add support for AT91SAM9RL64
      Add recipe for at91bootstrap-2.10
      Add recipe for u-boot-2009.01
      Add linux-2.6.28 support for SAM9260/1/SAM9G20/ATNGW100
      Add checksums for new packages
      Update sam9260/1/3 and ap7000 (stk100,ngw100) to use
linux-2.6.28, u-boot-2009.01 and at91bootstrap-2.10

Bugs fixed:

bug_id resolution        short_desc
4234 FIXED       zaurus-updater not being pulled in

Bugs opened:

bug_id resolution        short_desc
5078     [patch] fix move wrong generated rpm name in package_rpm .bbclass
5080     Add HaRET to provide bootable packages for the WinCE machines
5081     Building Xserver (XORG) Fails


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


