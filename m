Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lgh3H-0003LV-PS
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 16:06:00 +0100
Received: by rv-out-0708.google.com with SMTP id b17so1647145rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=RJfd/aVh35n5eLWZqjqpTxnQMDoBH5pyePJSFKi4to0=;
	b=s6scnAOPHsf5HMewqTMUd5fFVc0vGi/VG6qfIk9VuiKPN1tvd90+epxad3ZdS3TZTO
	DdJXST8atHsSeQjc6dV7SkOWzLlUR4BVaDbFBsQgXpeB79LwW7OXsZyri6mGr7vWfsxN
	teDhH7x/IwtRPa3cEFLNH023lxw1dm0zv5zx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rhZ2hEVQEgOaoyI4LbWUFurWGdLiOT2zVrQRb/0ox19qaXol7rP9mHwe6DxjXSOvQo
	GPzEtOghbRP4PyQt+EpNkEBKOS8jVM1vjFw1BTRFImw4Ri7dQXq3T93GHPWwOLieEtWw
	THq0gEORt+lZeKhUomXHn8Zwa5BXFBUWX8uK4=
MIME-Version: 1.0
Received: by 10.141.100.15 with SMTP id c15mr3109257rvm.222.1236610863593; 
	Mon, 09 Mar 2009 08:01:03 -0700 (PDT)
Date: Mon, 9 Mar 2009 11:01:03 -0400
Message-ID: <f96d234e0903090801g4f956dc2saecfd51362c26951@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-03-02 to 2009-03-09
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
X-List-Received-Date: Mon, 09 Mar 2009 15:06:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-03-02 to 2009-03-09

Andrea Adami (1):
      sane-srcdates: add missing entry for zaurusd_svn

Bernhard Guillon (1):
      gamecube: add new machine,kernel patches and defconfig bump PR
of linux_2.6.28.bb

Cliff Brake (1):
      docs: unbreak "make html" by adding missing xsl files

Elena Grandi (1):
      tuxmath: removed old 1.6.0 version that never properly worked

Frans Meulenbroeks (7):
      python-coherence: updated to 0.6.2
      angstrom/build-feeds.sh: fixed package name: w3cat -> w3cam
      cdrkit: updated for LE cross compilation
      libattr: created: lib to access attribute bits of a file
      libcap2: libcap 2.16; created as separate package to allow both
.so.1 and .so.2 to coexist
      cdrkit: forgot this file in my earlier commit ...
      setpwc: updated to 1.2; removed older versions

Graeme Gregory (3):
      bluez4_4.31.bb : looks like removal of usb patch was dropped at somet=
ime
      linux_2.6.29-rc6.bb : new version of mainline kernel with tosa patch
      checksums.ini : add patch-2.6.29-rc9 for linux recipes

Jeremy Lain=E9 (2):
      qmake: drop obsolete patch 0008-backport-qt-lib-infix.patch
      qt-embedded: use qt-embedded.inc to prepare for Qt 4.5.0

Khem Raj (6):
      checksums.ini: Add more checksums.
      nfs-utils_1.1.2: Set compile flags to use flags_for_build when
building tools.
      coreutils-6.0: Make the install utility to honor STRIP
environment variable
      gnutls-2.4.2: Get rid of siginterrupt () call.

Koen Kooi (28):
      gstreamer: package libs seperately to account for things moving
between -good, -bad, -ugly and -base.
      sane-srcrevs: bump opkg-target to 202, leave -sdk and -native alone
      libgles-omap3: poke sgx to full speed when devmem2 is installed
      gstreamer-ti: bump PR for gst-plugins packaging change
      gstreamer-ti: add patch to make more sinks work
      omapzoom: initial support for the omapzoom1 platform (aka ldp3430)
      linux-omapzoom: tweak defconfig a bit
      omapzoom: disable bits that aren't working yet
      xserver-xorg-conf: add omapzoom support
      angstrom 2009.X: bump automake-native to 1.10.2 since some idiot
deleted 1.10
      sane-srcrevs: bump opkg* to r203 to get fix for filenames that
are exactly 99 chars in lenght (see oe-devel mailinglist for details)
      libxsettings: fix problems with strip
      opkg: maxrev the unarchive patch
      omapzoom: correct u-boot machine
      u-boot git: add configs for omapzoom, need to debug bugs later
      pointercal: add omapzoom support
      gpe-ownerinfo: fix more install -s breakage
      pingus: ARM_INSTRUCTION_SET =3D "arm"
      gst-ffmpeg: lower rank of plugin to allow better plugins to get
picked over this one
      distcc-slave-image: add image that has all the needed tools to
act as a distcc slave
      linux-omap-pm: enable bridging for beagleboard
      linux-omap, -pm: add patch to reset MUSB phy
      linux.inc: add back 'yes '' | oe_runmake oldconfig' that got dropped
      gnash: add 0.8.5
      distcc-slave-image: add wirelesstools and iptables
      linux-omap-pm: enable iptables for beagle

Lukas Gorris (2):
      linux-msm7xxxx: add htcblackstone machine, update srcrevs

Marcin Juszkiewicz (2):
      package_ipk.bbclass: use bb.utils.prunedir to remove CONTROL director=
y
      mbw: added 1.1 version of simple memory bandwidth benchmark

Michael 'Mickey' Lauer (32):
      checksums.ini: merge
      checksums.ini: add more checksums from branch
      minimal.conf: don't build ext2fs; remove irda; use packaged staging
      preferred-om-2008.inc: catch up with some versions
      fso-abyss: ship datadir
      ezx-gen-blob: fix kernel dependency
      bitbake.conf: sort download locations lexically
      bitbake.conf: add GNOME_GIT
      linux-openmoko.inc: Openmoko's GTA03 device got a new name
      blueprobe 0.18: fix makefile so that it actually builds
      lyx: after a while of breakage, this software works again.
      MAINTAINERS: update my entry
      sane-toolchain.inc: remove typos
      qi: try harder to fix compiler flags
      pyneo: remove unbuildable images until all dependencies are
contributed again
      sane-toolchain.inc: add indirection again, it's really necessary
      tune-arm1136-novfp.inc: include tune-thumb here as well
      sane-toolchain.inc: remove KEEP_OABI overrides for specific
kernels from here.
      netbase: add interfaces file for om-3d7k
      base-files: add fstab for om-3d7k
      frameworkd: catch up with new machine name for om-gta03
      libgsm0710mux: catch up with new machine name for om-3d7k
      linux-openmoko: add support for om-3d7k
      om-3d7k.conf: fix serial console UART
      samsung-soc-utils: new directory (renamed from s3c24xx-utils)
      angstrom-{2008.1|2007-for-openmoko}: remove my name
      task-cli-tools: add subpackage task-cli-tools-debug shipping
some of the common debug utilities
      minimal.conf: ship task-cli-debug, if we're building a debug distro
      task-cli-tools: add some more utilities as suggested by hrw
      vala-native: add git version (DP=3D-1)
      libgsm0710mux: fix modem path on om-3d7k

Philip Balister (7):
      linux-omap : Change Overo defconfig to support netfilter.
      davinci-sffsdr : Remove dsplink dependency until dsplink works
on sffsdr board.
      linux-davinci-2.6.25 : Fix recipe so it builds reliably. Update git u=
rl.
      linux-davinci_2.6.27 : DEFAULT_PREFERENCE =3D "-1"
      linux-davinci : Move linux-davinci directory to linux-davinci-2.6.25.
      linux-davinci-git : Update recipe so it builds for sffsdr board.
      davinci-sffsdr : Use Default preference in kernel recipes to
select kernel.

Stanislav Brabec (3):
      mc-4.6.2: More fixes: cursor on tab, UTF-8 regexp, ftpfs, Esc(.
      gnome-vfs: DEPENDS on dbus-glib:
      osso-esd: Fixed configure QA failure.

Stefan Schmidt (2):
      navit: Add version 0.1.0
      preferred-om-2008-versions: Use new navit version

Theodore A. Roth (1):
      metadata.xml: Update 'File Layout' section.

Thomas Kunze (3):
      linux_2.6.24: add ide-cs to defconfig
      fix configuration of older kernels
      linux_2.6.24: enable serial_cs for simpad

woglinde (2):
      uclibc: update to version 0.9.30.1
      MAINTAINERS; update my entry

Bugs fixed:

bug_id resolution        short_desc
1344 WORKSFORME  prboom_2.4.3 fails to link
2002 WORKSFORME  parted 1.8.2 fails to build
2381 FIXED       rootfs fails in ipkg.py due to 'missing' control file
2470 FIXED       mpd   build failure
4856 WONTFIX     xapian-core-1.0.7-autobuild
4497 WORKSFORME  Bitbake fails to build libpam_0.79
4935 WORKSFORME  build of flex-native fails
4936 WORKSFORME  Build of openssl-native fails
5052 FIXED       libxsettings-0.11-r0 build fail on angstrom-2008.1 for stb=
225
5055 FIXED       setpwc does not build because of bad tarball checksum


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


