Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L7F4N-0004Wo-Pn
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 21:08:36 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3231497rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2008 12:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=NLmiqPbpbF4cKgWMQm3EQX3Cd7wgLTZLKl4RNBLO3ug=;
	b=BhrsRWv7IgAl9sQlu5fQQQS9VTMGOQWzAWKNuBRrU3zLk6LtepcnUUbUehrts9E9X7
	RcVdrvMDX04ik1shSa/l6Kd6n7mDBYh2VSCzN40AGOz5yo0yxrXounTtnEsBby7PABD9
	BqpnHbl/HMm2B1KQnTK4ZhO8q9YHxIrFOJX3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=FoD4BeftLzAAf8I5qBfOtPkcsmyqnfIMtbXMQRQFzuH7PkjKiBszTghZshibybGXYE
	cJYQ3bZs8LxwJ9kVZyPzpwr0HsIH4iJyp2LQ5Fo/r+EgALWutzGRhXOniXPuMn8/bUKR
	+vkpj/qfTF+yLCfgvUZm6FmQjgTtBpoyNm7I0=
Received: by 10.141.44.13 with SMTP id w13mr5388019rvj.176.1228161912814;
	Mon, 01 Dec 2008 12:05:12 -0800 (PST)
Received: by 10.141.129.13 with HTTP; Mon, 1 Dec 2008 12:05:12 -0800 (PST)
Message-ID: <f96d234e0812011205x1aa3d20dkf9a47c08b8bf68da@mail.gmail.com>
Date: Mon, 1 Dec 2008 15:05:12 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-11-24 to 2008-12-01
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
X-List-Received-Date: Mon, 01 Dec 2008 20:08:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-11-24 to 2008-12-01

Bernhard Guillon (3):
      checksums.ini: update for xqt2 and blackbox
      xqtlauncher: add package
      xqt2: hack to fix screen rotation

Jeremy Lain=E9 (12):
      u-boot: add support for boc01 LCD display
      u-boot: add mtdparts support for boc01
      linux-2.6.26: add patches for boc01 hardware
      wbxml2: update to version 0.9.2
      dnsmasq: create ${sysconfidir}/dnsmasq.d config directory
      boc01: fix erase block size for jffs2
      dnsmasq: fix permissions on dnsmasq.conf (644, not 755)
      dnsmasq-dbus: add a version of dnsmasq with DBus support
      linux-2.6.26: add cdc ether support for boc01
      linux-2.6.26: add cdc_ether support on mpc8313e-rdb

Julien 'Ainulindale' Cassignol (2):
      e-wm: Created a new package for sysactions.
      e-wm: Corrected PACKAGE_ARCH for e-wm-sysactions. Comment was appende=
d.

Junqian Gordon Xu (1):
      checksums.ini: add linux-rp-2.6.24

Khem Raj (1):
      uclibc_0.9.30.bb: Use renamed ldso_hash.patch for avr32

Koen Kooi (33):
      e-wm: attempt to unbreak uclibc builds
      package_ipk bbclass: add License: to control file
      feed browser: mention License field
      angstrom-version: fix LICENSE
      angstrom feed builder: add ushare and mediatomb
      libmokoui2: add license, the python magic in openmoko2.bbclass is bro=
ken
      elementary: fix up .pc
      elementary-alarm: fix SRC_URI and S
      angstrom 2008: move distro pr to main file
      e-wm: really fix RDEPENDS
      beagleboard-demo-image: ship more LINGUAS
      sourcepkg.bbclass: use same deploydir as source-distribute classes
      ffmpeg git: replace arm SRCREV that got wiped out by a git commit --a=
mend
      linux-omap git: bump SRCREV
      angstrom feed configs: generate config files for locale feeds as well
      angstrom: use src_distribute_local in symlink mode by default
      vlc: update 0.9.4 to 0.9.6 to get rid of the "version <foo> has
vulnerabilities" nag screen
      omapfbplay: update SRCREV and make it non-machine specific
      fso-apm: remove RPROVIDES
      openssh: make ssh rdepend on keygen
      beagleboard-demo-image: add en-us
      angstrom 2008: switch from en-gb to en-us since en-gb sometimes
gets misdetected
      freeglut: add 2.4.0
      artoolkit: add 2.72.1
      angstrom feed builder: reindent
      angstrom feed sorter: add armv6-novfp arch
      linux-msm7xxxx: fix defconfig location
      angstrom feed builder: clean opkg-native as well to speed up
packaged-staging
      dsplink: use ${DSPLINK} in do_configure to make it work in
codec-engine as well
      ti-paths.inc: add dsptools URL now the site is back up
      angstrom: disable binary localegen for armv6-novfp as well
      angstrom: set target fpu to soft for armv6-novfp
      linux-msm7xxxx: move some machine dirs around to make overrides work

Lucas Gorris (1):
      htc{diamond,kaiser,polaris,raphael,vogue}: add machine files and kern=
el

Lukas Gorris (1):
      linux-msm7xxxx: add SRCREVs for all machines

Marcin Juszkiewicz (7):
      tune-pentiummmx.inc: tune for MMX i586
      progear: use pentium mmx tune, switch to i586
      progear: do not recommend ac/battery modules cause they break
with newer kernels
      checksums.ini: added junit, progear-ac, ruby
      checksums.ini: added progear-battery
      progear: install all kernel modules
      linux: added 2.6.27 as default for Progear

Michael 'Mickey' Lauer (4):
      task-cli-tools: ship s3c24xx always, it's supersmall
      python-rpyc: new recipe; remote procedure call package for python
      git[-native] 1.5.x: remove
      fso-apm: new recipe; apm compatibility command for
freesmartphone.org framework

Mike Westerhof (1):
      busybox-1.11.3: fix segfault with fdisk command

Otavio Salvador (4):
      vte: include gnome-pty-helper on libvte package
      vte: move gnome-pty-helper to a specific package
      xfce-terminal: rdepends on gnome-pty-helper
      xfce-terminal: add --into support

Robert Schuster (7):
      classpath 0.97.2: Added gtk performance fix.
      antlr 2.7.5: Moved to obsolete since it does not build.
      Replace non-working antlr recipe with working ones from Jalimo repo.
      preferred-om-2008-versions.inc: Set preference for
antlr[-native} to 2.7.7.
      lesstif 0.95.0: Provide faked -x-include argument to fix
compilation of configure tests.
      classpath: Install jawt headers into staging as well.
      libffi-native 2.0+gcc4.3.2 : New recipe.

Sergey Lapin (5):
      at91bootstrap: new package
      afeb9260: adding machine conf
      u-boot: update for afeb9260 support
      linux_2.6.28-rc6: new Linux version for afeb9260 board
      MAINTAINERS: update

Tom Rini (6):
      task-sdk, task-sdk-bare: Update and abstract to support uclibc
      task-sdk-bare: Add uclibc-thread-db for uclibc targets
      samba, samba-essential: Move IFACE related autoconf variables to
common-linux site file.
      samba: Fix mount.smb/mount.smbfs link locations
      samba: Fix mount.cifs location
      samba: Put mount.(smb|smbfs) into smbfs package.

woglinde (9):
      uclibc: avr32 can not be build with gnuhash-style
      libnxcl: various updates from my work for the n810
      qtnx: add my latets patches from the n810 work
      libxcomp: update to latest releas from nomachine
      nxproxy: update to latest release from nomachine
      nxssh: initial import
      libnxcl: set RDEPENDS to nxssh and bump PR
      qmake: add *linux-uclibcgnueabi-oe-g++ to the qmakespecs

Bugs fixed:

 bug_id resolution       short_desc
3634 FIXED       Smallscreen mod for GtkFileChooser
4007 FIXED       Angstrom 2.6.24 kernel won't boot on tosa.
4015 DUPLICATE   dsniff-2.3-autobuild
4294 FIXED       linux-rp-2.6.24 fails do_compile for tosa
4284 WORKSFORME  no sound on htcblueangel
4582 FIXED       X/Qt2 fixes (screen rotation screen resolution)
4603 FIXED       xqtlauncher integrates X/Qt2 nicely into opie
4745 FIXED       missing md5 and sha256 apr-util 1.2.12 source code
in checksum.ini
4763 FIXED       php-native do_fetch failure because of missing checksum
4790 FIXED       apr-util-1.2.12 missing checksums
4797 FIXED       task-sdk.bb and task-sdk-bare.bb duplicate some functional=
ity.
4861 FIXED       checksums.ini update for xqt2 and blackbox
4886 FIXED       glibc-2.6.1-r15 do_configure fails on armv6-novfp
3880 FIXED       The samba package is not having a correct
mount.smb/mount.smbfs link created
4071 FIXED       fusionsound cannot compile with linux-libc-headers >=3D 2.=
6.23
4761 FIXED       linux-rp 2.6.25+2.6.26-rc4 can't find all sources.
4854 FIXED       Common samba autoconf variables are in arch-specific files

Bugs opened:

bug_id resolution        short_desc
4878     msm machine update/cleanup
4891     kernel.bbclass do_deploy() should keep the linux.bin.gz file


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


