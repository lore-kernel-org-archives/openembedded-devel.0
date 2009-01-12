Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LMPLa-0004Yw-De
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jan 2009 17:09:23 +0100
Received: by rv-out-0708.google.com with SMTP id f25so12251494rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2009 08:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=ynXo963C/2lxBDtNqaIlkSgehMnEPfRnkRM5wl/JF0k=;
	b=Yvu4/vYMRM7GQv4o/ugq5707C/+eeysCkoIYIDRZKRAf/ajiArP4kDpd6Pm4SW1KxM
	Yl1rjXgVlzXne6J4eigvvrdz/2gKEPd5B6RYnq8NhBmYJ0KPdtOC7KTJwMsef/Dvar88
	yuGXcD/PisowrBHq2lHnQS3EdvsaqmSA1aIo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=T7D/OF3o/PYDmbKS532UZd8oBUfNhMTbNdX9s624F6uGFPfx+VQmDmOmovsSrP+CaU
	9aGQH2l+Zaw+aMKwBnPh7Kl9g0jUH/fmZgGU0JUM3nLEWeN3nsuHYtfbj5SmDKL+YJN0
	JGHV6vmkZmwcmXJkDt7s6wnC8ghUhqjnbE698=
Received: by 10.140.139.6 with SMTP id m6mr14613049rvd.234.1231776154814;
	Mon, 12 Jan 2009 08:02:34 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Mon, 12 Jan 2009 08:02:34 -0800 (PST)
Message-ID: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>
Date: Mon, 12 Jan 2009 11:02:34 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2009-01-05 to 2009-01-12
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
X-List-Received-Date: Mon, 12 Jan 2009 16:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2009-01-05 to 2009-01-12

Cliff Brake (3):
      mono: disable thumb as incompatible inline ASM is used
      mono 2.2: update from preview 3 to RC1, add EABI patch
      checksums.ini: add checksums for devmem2

Erin Yueh (1):
      obexpush_1.0.0.bb: add opd_args file to append arguments for starting

Florian Boor (11):
      unicap: fix packages
      unnicap: Add 0.9.4 release
      ucview: Fix compiling and move patches around
      htcuniversal.conf: Remove duplicated EXTRA_ARCHS entries.
      gpe-conf: Update svn recipe to new version and use of SRCREV.
      saane-srcrevs.inc: Add entry for gpe-conf
      meta-toolchain-gpe: Remove GPE Phone Edition task.
      task-gpe-connectivity: Use gpe-mini-browser2 instead of old one.
      task-sdk-base: Fix dependencies
      xsp: Fix pc file - passes sanity check now.
      xsp: Remove whitespace from patch

Graeme Gregory (1):
      detect-stylus_svn.bb: install and package detect-tsdevice

Gregoire Gentil (1):
      ffmpeg: specify SRCREV for libswscale as well

Holger Hans Peter Freyther (1):
      ipkg-utils: Make it work on fedora 9.

I-Fan, Chen (1):
      Various recipes: add more detailed descriptions.

Jan L=FCbbe (2):
      task-fso-compliance: add more zoneinfo files for setting timezone via=
 GSM
      linux-openmoko-2.6.28/devel: reduce kernel size by configuring
some stuff as modules

Jeremy Lain=E9 (2):
      linux-2.6.27: update keyboard and LCD patches for boc01
      linux-2.6.27: update keyboard and LCD patches for boc01

John Lee (1):
      netbase: set the default nameserver to OpenDNS for om-gta0?

Khem Raj (1):
      uClibc.config: New

Koen Kooi (57):
      pixman: add 0.13.2, disabled by default
      e-wm-config-angstrom: e-wm profile for angstrom
      task-beagleboard-demo: use angstrom e17 profile
      dmai 1.16: add WIP recipe for CE DMAI driver
      dmai: fix description
      palantier: add 2.7
      angstrom feed builder: add motion and palantir
      linux-omap 2.6.28,git: fix overlay colourspace definition in DSS2 pat=
ches
      gpe-conf: add 0.2.8
      libgles-omap3: add 3...5 release, rework packaging a bit
      linux-omap 2.6.27: sync powervr code with latest code drop from TI
      linux-omap 2.6.27: bump PR
      e-wm-config-angstrom: add some tweaks
      omap3-sgx-modules: recipe to build sgx modules using the kbuild
system from the GPL'ed imgtec sources
      linux-omap 2.6.27: remove outdated PVR patch since we have
external modules now
      module.bbclass: pass KERNELDIR as well
      omap3 machines: add omap3-sgx-modules to RECOMMENDS
      task-base: bump PR
      checksums.ini: add sgx checksums
      libv4l: add 0.5.7. This is needed for e.g. gspca cams to work
with newer kernels:
      clutter: add support for omap3evm
      checksums: add libv4l
      omap3-sgx-modules: install into proper place
      omap3-sgx-modules: really fix the install path
      linux-omap 2.6.28: update to newer DSS2 snapshot
      linux-omap 2.6.28: add patches to make XV work better with DSS2
      task beagleboard-demo: ship 'places' module and x11vnc-init
      e-wm-config-angstrom: rrecommend places module
      libgles-omap3: fix RRECOMMENDS and make binlocation more flexible
      linux-omap 2.6.27: fix NAND access
      e-wm-config-angstrom: disable desktop icons, we have the places
module for that, automount volumes on insert and display them in efm
      sugar: update some bit sto the 0.83 release
      linux-omap git : update to current git
      linux-omap git: update defconfigs
      e-module.inc: add e-wm to DEPENDS
      linux-omap 2.6.28, git: improve graphics, fix sounds support
      linux-omap git: bump SRCREV for clock fixes
      libgles-omap3: fix typo in do_stage
      checksums.ini: add more entries
      gnome-icon-theme: remove PACKAGE_ARCH =3D "all", apps check for
its .pc file :(
      linux-omap 2.6.28,git: fix beagleboard reboot, enable EHCI
      xf86-video-omapfb: make 16 and 32 bpp work
      linux-omap 2.6.28: push patch to make EHCI work (well, needs a
matching u-boot) work on revision C1D beagleboards
      e-wm: ship unpackaged utils in ${PN}-utils
      gumstix utils: add char-driver, gpio-event, i2c and microwindows
      pico-dlpcontrol: use a modified version of the gumstix 'i2c'
program and wrap it with a script
      e-wm: add ewm-utils to rdepends
      tree: add 0.7.5
      linux-omap 2.6.27: add patch for musb RX TX bug
      task-beagleboard-demo: include task-proper-tools
      mtd-utils: add 1.2.0+git for ubifs-support
      mtd-utils: package *all* ubifs utils
      mtd-utils 1.2.0: as Stefan points out, you need to DEPEND on
e2fs-prog libs when you include uuid/uuid.h
      linux-omap-pm git: add patch to add rate tables to beagleboard board =
file

Kristoffer Ericson (3):
      conf/checksums.ini : Add checksums for fakeroot 1.11.4
      conf/distro/jlime-mongo.conf : add tar.gz package output (aswell as i=
pk)
      distro jlime-2009.1.conf : Add new distro file for coming release.

Leon Woestenberg (3):
      busybox-1.11.3: udhcpd script: Do not deconfig network interface
iff rootfs on nfs.
      oprofile: Include powerpc architecture files, due to powerpc/ppc
namespace change.
      dtc: Add 1.2.0 and use -native.inc and .inc files.

Lukas Gorris (1):
      linux-msm7xxxx: update defconfigs and SRCREV

Marcin Juszkiewicz (2):
      ts72xx: do not set PACKAGE_EXTRA_ARCHS
      xserver-common: S98keymap-fixup is =C5ngstr=F6mizm - do no install
for other distros

Mark Brown (1):
      mainstone: do not set PACKAGE_EXTRA_ARCHS - closes #4968

Michael 'Mickey' Lauer (29):
      sane-srcrevs.inc: bump linux-openmoko-devel to a known good state
      linux-openmoko-2.6.28_git: new recipe; this is the new stable
kernel for om-gta[01|02]
      vala[-native]: update to latest stable version 0.5.4
      frameworkd[-devel]: catch up with upstream stabilization phase
work in master
      checksums.ini: add vala 0.5.4
      fso-autorev: add dbus-hlid and fso-apm
      ttf.inc: limit RRECOMMENDS to PN
      fso-image: silence printk
      vala.inc: readd MAJV that got lost during a merge
      checksum.ini: fix unexpanded var
      sane-srcrevs.inc: bump frameworkd
      glib-2.0-native: 2.16.1, 2.18.0: yank EXTRA_OECONF, we want
asserts enabled in the -native version
      frameworkd: use wmiconfig on gta02
      gsm0170muxd: bump to fso-release version 0.9.2.2
      task-fso-compliance: RRECOMMEND wmiconfig
      task-python-efl: add python-elementary
      linux-openmoko: split into linux-openmoko-2.6.24 (old stable),
linux-openmoko-2.6.28 (new stable), land
      om-gta01.conf: prefer kernel 2.6.24 until 2.6.28 has been tested
      vala[-native]: update to 0.5.5
      libgdbus: bump to 0.2+git
      connman: remove 0.1 and 0.2; fix metadata
      linux-openmoko: remove obsolete files
      fso-monitord: new recipe; freesmartphone.org data logger and
supervisor daemon
      gsm0710muxd: move SRC_URI to upstream
      task-openmoko-feed: use fso-gsm0710muxd
      fso-image: silence printk
      illume-image: use fso-gsm0710muxd
      fso-gsm0710muxd: new recipe; indicating gsm0710muxd from FSO
branch (not upstream)
      fso-monitord: fix initscript name

Mike Westerhof (3):
      SlugOS: slugos.inc, opkg-nogpg-nocurl_svn.bb - revert to SVN rev 160
      opkg_nogpg-nocurl: update fix_tmpdirs patch, bump PR
      SlugOS: task-slugos - re-instate module-init-tools due to busybox bug=
s.

Philip Balister (4):
      linux-davinci : Change SRC_URI from source.mvista.com to git.kernel.o=
rg.
      powertop : Add bb file for version 1.11.
      checksums.ini : Add checksums for powertop-1.11 and sort.
      linux-omap-pm : Add recipe for OMAP3 kernel with power
management. This tracks

Robert Schuster (2):
      llmvm 2.4: New recipe.
      checksums.ini: Added llvm 2.4 entry.

Stefan Schmidt (3):
      fso-gpsd: Fix my breakage in the initscript. Bump PR.
      fso-gpsd: Do not RCONFLICTS with gpsd for now as it will not
show up in the image with this
      preferred-om-2008-versions.inc: Bump e2fsprogs-libs to 1.42.2

Tick Chen (2):
      comic-reader: adding new bb file for comic-reader
      opkg: Bump up the version to R196

Your Name (1):
      add simpad sound driver update defconfig bump linux_2.6.24 PR

woglinde (5):
      frozen-bubble: put the patches into their own dir
      mesa: disable tls for uclibc
      sdlpango: new package sdlpango
      uclibc: correct pthread_atfork function for linuxthread
      checksums.ini: add sdlpango

 Bugs fixed:

bug_id resolution        short_desc
4962 FIXED       udhcpd deconfigures the network interface underneath
a NFS rootfs
4966 FIXED       new bb recipe : sdlpango
4968 FIXED       Fix mainstone build
4975 FIXED       I've a recipe that works on woglinde's machine but not min=
e

Bugs opened:

bug_id resolution        short_desc
4960     new package: dashel stream library
4961     new package: aseba distributed robots control library
4971     mobots image
4972     the toolchain that would go with the mobots-image
4976     [PATCH] minimo add support for command line url parameter


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


