Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M64Bp-0000e1-Q3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 16:51:49 +0200
Received: by gxk25 with SMTP id 25so3406562gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2009 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=PDbypHDgWgfN8odzNcsDymV/V1kowedx9GR/5JxY+wY=;
	b=F/sVCH44/copfjSGVvAXH7JvPL+76XUGEqo+SuhyY4j3pOuYbA9m225ceqGWmLWw3I
	9Pvcdbw74eiyK4iAJ6/lBVDPVTuxtyUkDCOJ7h3GhQgN30NCmxRbS5/7PFnSZXC8zdsw
	5Jj16olx6HQIDIJ4QpHTcmx11xH+QEsnQQj2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=TMNagnxk3IKJFhNupNueb59bqs/LZHFiBWMHlywz3jGtp1XxjvjmUzHIl8tMrFS88C
	+rIHBpfJ1vfw1oP4/7mOEk7pQByn6EQ7J9BW5dRwodBdyvVqo8abbJh2yXC5Q9myBmSu
	e0EwgLti8apod76t0JsH1jyJi2tk4LO0r5rGU=
MIME-Version: 1.0
Received: by 10.151.72.1 with SMTP id z1mr12795682ybk.170.1242657347754; Mon, 
	18 May 2009 07:35:47 -0700 (PDT)
Date: Mon, 18 May 2009 10:35:47 -0400
Message-ID: <f96d234e0905180735p44de82ffq334e9b16044850ec@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-05-11 to 2009-05-18
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
X-List-Received-Date: Mon, 18 May 2009 14:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-05-11 to 2009-05-18

Andrea Adami (6):
      hildon-thumbnail: fix dependencies from gdk-pixbuf -> gtk+
      linux_2.6.29+2.6.30: jump to RC5
      netbook-pro.conf: fix bogus 755 permissions on checkout
      kexec-tools_2.0.0: initial commit - kexec-tools_2.0.0 compiles
just fine - kexec-tools-static_2.0.0 breaks during do_compile (against
klibc) - setting DEFAULT_PREFERENCE =3D "-1"
      kexec-tools-static_2.0.0: more fixes towards klibc static
linking
      kexec-tools-static_2.0.0: another step towards klibc statical
linking - retry with purgatory.c - FIXME: kcc LDFLAGS - STILL FAILING
BUILD

Chris Larson (3):
      First pass of cleanup of messages outputted to the user.
      Shorten some full paths printed to the user.
      collections.inc: add collections to BBPATH, handle typos in
COLLECTIONS, etc.

Cliff Brake (1):
      doc: change openembedded.net reference to openembedded.org

Dmitry Eremin-Solenikov (3):
      linux-2.6.28: Provide a default config for at91sam9g20ek board

Florian Boor (17):
      gpe-mixer: add 0.50
      startup-monitor: Add missing PR
      micro2440.conf: Prefer an up to date kernel.
      topas910.conf: Enable building images with summary information.
      gsoko: Apply fix to suppress strip installing binary.
      local.conf.sample: Add description of BB_NUMBER_THREADS and ad
US locale to the example list which is necessary for Angstrom.
      xserver-common: Add 1.24
      checksums.ini: Add gpe-mixer 0.50 and xserver-common 0.24
      topas910.conf: Add cleanmarkers to jffs2 filesystem
      micro2440.conf: Provide display information and create
filesystem with summary information.
      gpe-image: Soem husekeeping, sortign, comments and improve
Angstrom compatibility.
      xserver-kdrive-common: Run display calibration later to make
sure the device node for the touchscreen has been created already so
that the touchscreen test succeeds.
      psplash: Change the splash orientation for the topas910 since
the default splash screen won't fit in the native QVGA landscape
framebuffer.
      gpe-image: Add license information and allow a "demo" style
distro to log in automatically.
      topas910.conf: Advertize the small NOR flash since everything
needs to fit in there for now.
      sane-srcdates.inc: set rosetta src date.
      gsoko: Remove one fix of two for the same issue.

Graeme Gregory (9):
      sane-srcrevs.inc : update xf86-video-glamo revision to latest,
cures screen
      om-gta02.conf : bring the hard work of xf86-video-glamo to
om-gta02 in .dev
      kexec-tools-static_1.101.bb : fix compile on newer kernels based
on work done
      linux-kirkwood_2.6.29.2.bb : add kludge to allow SDHC cards to
work
      linux-kirkwood_2.6.29.2.bb : fix PR to new scheme
      linux-kirkwood_2.6.29.2.bb : add CPUIDLE support so hopefully we
waste
      transmission_1.61.bb : add new version of transmission make init
run

Jeremy Lain=E9 (1):
      linux-2.6.29: reduce boc01 kernel size

Koen Kooi (24):
      ti-codec-engine: update to 2.23.1 now it has been released
      connman: add 0.16
      linux-omap 2.6.29: enable networking and staging drivers in
beagleboard defconfig
      fennec: bump SRCREV
      checksums: add more checksums
      angstrom feed uploader: upload to unstable feed, the 2008 feeds
are populated from stable/2009
      bluez: add 4.39
      angstrom 2009.X: toolchain updates:
      udev 141: continue cleaning out udev legacy stuff
      angstrom feed builder: allow builder to override machinelists on
the commandline
      gcc 4.3.3: fix regression from 4.3.1 that caused fortran to get
disabled for linux-gnueabi
      fennec: add libnotify to depends, reorder fields
      checksums: add more checksums
      connman update to 0.19
      mtd-utils-natice 1.2.0+git: raise default pref for angstrom
      connman-gnome: add (default disabled) git version
      linux-kirkwood: update to 2.6.29.2
      linux-kirkwood: fix MACHINE_KERNEL_PR
      webkit: bump SRCREV
      midori git: bump SRCREV
      libusb1: update to 1.0.1

Leon Woestenberg (1):
      linux-rt-2.6.24: Fixed missing defconfig for mpc8315e-rdb.

Marcin Juszkiewicz (5):
      patch.bbclass: use hashlib with Python 2.5+ - removes DeprecationWarn=
ing
      sane-srcrevs: update linux-bug to get Ethernet fixed
      fbprogress: BUG only tool to show boot progress on built-in monochrom=
e LCD
      sane-srcrevs: bump linux-bug to get recent fixes
      hdparm: added 9.15

Marco Cavallini (1):
      Added myself in MANTAINERS as KaeilOS mantainer

Mike Westerhof (4):
      openobex_1.5.bb: fix missing openobex.m4 file in staging.
      SlugOS: remove bluez 3 from the package feeds; won't build with newer
      madwifi-ng: (SlugOS only) re-instate "unset LDFLAGS" in
do_compile() in order
      glibc.inc: temporarily comment out the OVERRIDE so that we can
build while folks

Ottavio Campana (1):
      libmicrohttpd: new recipe

Peter Chubb (1):
      Allow use of Itanium as build machine

Robert Schuster (8):
      cacao-native 0.99.4: Set default preference to -1.
      llvm2.6: Updated to newer SVN snapshot (includes some patches
developed in OE).
      glib.inc: Packaging workaround for chinook-compat.
      New recipes by Xerxes Ranby (xerxes@zafena.se)
      llvm2.6-native: SRCREV -> SRCPV
      llvm2.6-native 2.5+svnr20090409: Removed (replaced by newer
snapshot).
      cacao: Added missing patch.
      llvm2.6-native: Revert SRCPV usage (its not appropriate here).

Rolf Leggewie (6):
      uim: update SRC_URI to point to googlecode.com
      podget: libiconv in RDEPENDS is most certainly incorrect
      bitbake.conf: update GENTOO_MIRROR setting.  (Closes: #5054)
      libmicrohttpd: remove unnecessary PN, add AUTHOR and improve
DESCRIPTION and SRC_URI
      libmicrohttpd: update to 0.4.2
      xmms-embedded: fix -dbg packaging

Roman I Khimov (4):
      glibc 2.7/2.9: add march-i686.patch
      (e)glibc-package: fix kernel version passed to qemu
      (e)glibc-package: set LD_LIBRARY_PATH on binary locale generation
      (e)glibc-package: enable binary locale generation on x86 and x86_64

Sergey Lapin (12):
      dvd+rw-tools: Added new recipe
      AFEB9260: add 180MHz config, split machine conf
      u-boot_git: updated for latest version for afeb9260
      linux: added 2.6.30-rc4
      AFEB9260 is not supported with 2.6.28-rc6 kernel anymore
      at91bootstrap: generalization of recipes
      at91bootstrap: added v2.11
      checksum.ini: adding at91bootstrap ver 11
      at91bootstrap: fixed machine name directory
      at91bootstrap_2.11: updated patch for AFEB9260 with thumb.

Theodore A. Roth (1):
      evtest: Fixed GNU_HASH QA error.

Tim 'timtim' Ellis (5):
      linux-kirkwood: Add GSPCA based webcams as modules
      mpeg-encode: Make this aware of LDFLAGS, fixes QA GNU_HASH issue
      netpbm: Make this aware of LDFLAGS, fixes QA GNU_HASH issue
      mysql: mysql_config produced by this build specifies host
includes and libs, sed these out so we can use this to cross compile
stuff with QA checks
      krb5: Force cp to work due to an permissions issue

Tom Rini (4):
      conf/distro/include/{eglibc,glibc,uclibc}.inc: Change OVERRIDES
to libc-foo
      gcc-canadian-sdk: Drop gcc-package-canadian-sdk.inc as we don't
really need it.
      gcc*4.2.4: Switch to using INC_PR (r6).
      gcc*4.3.3: Switch to INC_PR, start at r3

Bugs fixed:

bug_id resolution        short_desc
1709 DUPLICATE   podcast binary
2603 INVALID     glibc-intermediate bailing on gcc for i86
3015 FIXED       correct audiofile.m4 to work with automake 1.10
3016 INVALID     make libsdl-qpe buildable with automake-1.10
3193 FIXED       source code of screeensaver unable to be downloaded
3707 FIXED       reference to zecke home dir
4116 FIXED       Epiphany doesn't build
4255 INVALID     viewmtn is unpackaged
4256 INVALID     monotone is unpackaged
4276 FIXED       upgrade automake to 1.10
4498 INVALID     webkit_qt_svn fails do_patch
4551 FIXED       proposed bb for podget (bash podcast aggregator)
4586 FIXED       2007.13 Feeds not updated any more
4946 FIXED       automake_1.10.bb do_patch error
5054 FIXED       patch to fix GENTOO_MIRROR
5079 FIXED       new recipy: llvm2.6_2.5+svn.bb
5085 FIXED       syntax error when compile every package
5096 INVALID     Testbug for cdbot2
5097 INVALID     Testbug 02 for cdbot2
5098 WORKSFORME  Testbug 03 for cdbot2

Bugs opened:

bug_id resolution        short_desc
5095     build report pages should include target
5099     Error in naming of u-boot-file ?


