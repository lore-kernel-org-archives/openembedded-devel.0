Received: from [64.233.170.188] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LF9B7-00005J-4v
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Dec 2008 16:28:13 +0100
Received: by rn-out-0910.google.com with SMTP id j66so2074965rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2008 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=HD8oMuHFpUjDVvx5BP+QS3BLMhz0xOh5sgUGmGR9sLE=;
	b=ozFb7ADW+hQLmxw6dwk/KuSlFjJCk5KIK8ShM6OluZvK+ci8cgHmsYBfr9PMYcLJrU
	1aToNAFBtMxtrL68Y0pZ13p7CTboa7PXYWqhB2cbnJALbER1hsMn+eSCcdxD+2P++RNI
	FyqTVb020pB2XLdwpOqyttiP9LBK5nyFvmHyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=jm9Xg48XcZraVZbX32s5qxnJGGBA9HaJLlOLLkdBsfxabD0nwlg6qUc26SdC7EHW8a
	05lwz/h9/cMLO91DkMTsFYw4wTi07ew21cjyf+D46wt1A/tlPqmUHeuISYoVd7tOb0jt
	qq6fc/kfZ9FN09ojNCtYT+tuERo4FSBqnR/4E=
Received: by 10.151.141.16 with SMTP id t16mr14158012ybn.53.1230045795004;
	Tue, 23 Dec 2008 07:23:15 -0800 (PST)
Received: by 10.151.115.17 with HTTP; Tue, 23 Dec 2008 07:23:14 -0800 (PST)
Message-ID: <f96d234e0812230723s7c93ea83u54f9d22918ecd127@mail.gmail.com>
Date: Tue, 23 Dec 2008 10:23:14 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-12-15 to 2008-12-22
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
X-List-Received-Date: Tue, 23 Dec 2008 15:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-12-15 to 2008-12-22

Florian Boor (1):
      gpe-conf: fix WiFi part

Graeme Gregory (8):
      apt_0.7.19.bb, apt-native_0.7.19.bb : add a new fetchable version of =
apt
      dpkg_1.14.23.bb, dpkg-native_1.14.23.bb : add a new fetchable
version of dpkg
      checksums.ini : new checksums for apt and dpkg
      [task-openmoko-feed] add gzip as some stuff like CPAN needs a real gz=
ip
      [openmoko.conf] add ability for our autobuilders to play with deploy =
dir
      [openmoko] turn on packaged-staging for openmoko
      openmoko.conf: switch back to standard gtk+
      [distro-feed-configs] set the right variables in openmoko.conf

I-Fan, Chen (5):
      mokoko: adding conf file
      dbus: adding RPROVIDES to auto replace the old dbus-1 package.
      ncurses: Let ncurses replaces libncurses5
      Assassin: Bump up assassin to 268
      mokoko: Bump up mokoko to 127

Jeremy Chang (1):
      om-locations: Bump up om-locations to latest version.

Jeremy Lain=E9 (11):
      dnsmasq-dbus: add patch for DBus introspection
      u-boot: update patches for boc01
      qt4: prune duplicate entry from qt_staging.inc
      librfid: enable SPI support for boc01
      fbgrab: add support for monochrome framebuffer
      librfid: mark PACKAGE_ARCH as "boc01" for boc01
      linux-2.6.26: update patches for boc01
      u-boot-1.3.2: update patches for boc01
      librfid: add patch for SPI device support
      linux-2.6.26: improve keyboard driver for boc01
      linux-2.6.26: don't apply cdc_ether hack on boc01 for now

John Lee (18):
      openmoko-toolchain-scripts: bugfix ${S}, change directory.
      ompower_git.bb: rename to ompower_svn.  It's obviously using it...
      busybox: update hwclock.sh to honor the UTC setting in /etc/default/r=
cS
      alsa-lib_1.0.15.bb: fix PR, should be "r1" instead of "1"
      ttf-dejavu_2.23.bb: fix PR, should be "r2" instead of "2"
      om-settings: postinst script
      task-openmoko-feed.bb: put in a few packages to for bluetooth usage
      linux-openmoko: don't flash kernel if using SD card.
      PKG_TAGS: get rid of them.
      openmoko-asu: get rid of asu related recipes.
      sane-srcrevs.inc: update om-settings for #2097
      om-gta01.conf: bring over this conf from om.dev
      om-gta02.conf: bring over this conf from om.dev
      om-gta01.conf: fix IMAGE_FSTYPES ?=3D to +=3D
      om-gta02.conf: fix IMAGE_FSTYPES ?=3D to +=3D
      om-gta01.conf: don't need to set PACKAGE_EXTRA_ARCHS now.
      om-gta02.conf: don't need to set PACKAGE_EXTRA_ARCHS now.
      sane-srcrevs.inc: update svnr of openmoko-toolchain-scripts

Julian_chu (4):
      [opkg-sdk] Fix wrong opkglibdir
      [task-openmoko-feed] Add gpe-scap into openmoko feed.
      paroli-gui: Add recipe of paroli-gui and set preferred revision to 11=
8
      paroli-dialer: Add recipe of paroli-dialer and set preferred
revision to 118

Khem Raj (11):
      sane-srcrevs.inc: Move sane srcrev for eglibc out of here.
      native-sdk-console-image.bb: Add new.
      ane-srcrevs.inc: Reinstate eglibc sane srcrevs.
      devmem2.bb: Update URI to point to new location
      omap5912osk.conf: Use linux-omap for PREFERRED_PROVIDER_virtual/kerne=
l
      uclibc-nptl: Add ldso_hash.patch
      uclibc-0.9.30: Update ldso_hash.patch so we do not ignore
LDFLAGS_GNUHASH assignment
      nfs-utils_1.1.2: Add e2fsprogs-libs to DEPENDS
      asterisk_1.4.19.1: Do not run libtoolize and gnu-configize

Koen Kooi (31):
      angstrom: move armv5te to thumb as well
      apache2-native: fix staging of pcre helper binaries
      linux-omap git: move to 2.6.28rc8, this makes usb OTG work
properly (even cable detection works!)
      linux-kexecboot.inc: disable modules and debugging to make kernel sma=
ller
      angstrom-x11-base-depends: bump PR
      i2c-tools: update to 3.0.2
      ffmpeg git: bump SRCREV, armv7a neon patches are now upstream
      omapfbplay: bump PR for ffmpeg change
      gst-ffmpeg: add 0.10.6 for ffmpeg change
      libomxil-bellagio: bump PR for ffmpeg change
      ffmpeg: update svn version to match git build
      angstrom feed builder: add bluez-hcidump
      libusb1: add 1.0.0 release, libusb is EOL
      evas: ARM_INSTRUCTION_SET =3D "arm"
      checksums.ini: add samba checksum
      libffi: add hack to build libffi on softfp machines
      samba.inc: 3.2.5 doesn't need the mv hack, so don't error out on fail=
ure
      angstrom feed builder: add squeakvm
      ffmpeg: ARM_INSTRUCTION_SET =3D "arm"
      povrayL fix up build a bit
      angstrom feed builder: build meta-toolchain for each supported
arch as well
      gnuradio: fix packaging and python detection
      picodlp-control: small program to read out status bits from the
pico DLP projector
      picodlp-control: cycle through flipmodes and reindent
      picodlp control: write to both flip bits, not twice to the same bit
      linux-omap git: fix evm regression
      task-beagleboard-demo: move omapfbplay to armv7a rrecommends,
add kernel-modules
      linux-omap 2.6.27: build in usb wifi modules, add support for
sitecom wl168
      u-boot git: catch up with omap3 repository changes

Lukas Gorris (1):
      htctitan: add machine file and update msm7xxxx kernel to match

Marcin Juszkiewicz (3):
      uicmoc4-native: unbreak building on Gentoo - closes BL#290 (from BugL=
abs)
      php: package php-cgi into separate package (from BugLabs)
      php: depend on lemon-native to build sqlite stuff (from BugLabs)

Michael 'Mickey' Lauer (4):
      vala: update to 0.5.3
      linux-openmoko-devel: add NFS support in defconfig
      frameworkd[-devel]: bump and ship new network file in -devel variant
      frameworkd-devel: RPROVIDE frameworkd.

Mike Westerhof (3):
      dsmg600-image.bbclass: Do not override nslu2; makes image additive.
      SlugOS: distro/include/slugos.inc - PREFERRED_VERSION of udev to 118
      SlugOS: distro/include/slugos.inc - this time really make 118
the preferred udev

Otavio Salvador (11):
      psplash: use psplash.h if the distribution provides it
      ica-bin: rdepends on libxaw
      fbpanel: add 4.12
      openbox: add 3.4.7.2
      menu-cache: add 0.2.2
      lxmenu-data: add 0.1
      lxpanel: add 0.3.8.1
      lxpanel: add 0.3.99
      lxde-common: add 0.3.2.1
      lxsession-lite: add 0.3.6
      xkeyboard-config: fix abnt2 keycodes (when using evdev)

Phil Blundell (1):
      glib-2.3.6: reinstate missing ld.so.conf

Philip Balister (2):
      linux-davinci : Set davinci-sffsdr to use 2.6.25 kernel.

Robert Schuster (9):
      midpath 0.2rc2: Fixed patch.
      jamvm: Increased default max heap.
      libice-native 1.0.4: New recipe.
      libsm-native 1.0.3: New recipe.
      libxt-native 1.0.5: New recipe.
      libice-native 1.0.4: Add 'inherit native'.
      libsm 1.0.3: Add 'inherit native'.
      libxt-native 1.0.5: Fixed contents (committed a copy of libxt_1.0.5.b=
b).
      lcms-native 1.17: New recipe.

Stanislav Brabec (4):
      tcl-native, tk-native: New packages. Needed for compilation of geda/p=
cb.
      geda/pcb: New package.
      wiggle: Fixed oe_install failure.
      man-pages: Fixed destination, file list, prevent double
packaging. Recommend man.

Stefan Schmidt (7):
      connman: Add 0.2 release
      connman: Remove default -1 from connman 0.1 and 0.2
      connman_0.4: Add neweset connman release
      preferred-om-2008-versions.inc: Make connman 0.4 the preferred versio=
n
      task-fso-compliance: Put connman in every image that likes to be
fso-compliant
      frameworkd: Add configuration file for eten-m800
      fso-gpsd: Bump to 0.8 release. Initscript changes.

Steffen Sledz (1):
      lite bb: SRC_URI fixed

erin (1):
      checksums.ini: Add python-lightblue 0.33 and python-pybluez 0.14

Bugs fixed:

bug_id resolution        short_desc
4015 DUPLICATE   dsniff-2.3-autobuild
4620 FIXED       asterisk-1.4.19.1-autobuild
4635 FIXED       nfs-utils-1.1.2-autobuild


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


