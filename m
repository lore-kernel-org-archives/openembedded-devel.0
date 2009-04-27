Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LyPet-0004SG-8n
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 14:10:05 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1432035ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=C8guY+a0zIZ+eeR9mOuTpiEXr5ZO64Zy64xTfbeTFMc=;
	b=gV+JSCT5+yXGDmPBHcIOC/dh27zJzejh3EbfG/zVCKR+0JEzLuKDURe+eIm2F0qqmK
	eR2sfOXBXxgmXDb5aw/Myyzo3nXzWHFc7Ovw0wQI9tUgxcL3k9j0aE/RmpzVSJlA1Orz
	UENfBAPiO/tT8Os9ADEjyhszk1wKMpfthGtLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gadtKP+tWPMh7Li/FRar5FRO0hZCruQyzpFZYHizlEp45mMXxqBsB20Qtw6zhCBGtr
	vuyeLXR4O7P1tqaFIdB4mA7NM1eyO4hki4T8jb4mZFdukDpQJTarO0xdFA96yil3/pRw
	ID5Jd8OvkR6mm9iIdLuq37QQoyeYApKhjqVOA=
MIME-Version: 1.0
Received: by 10.151.68.8 with SMTP id v8mr8738227ybk.201.1240833413584; Mon, 
	27 Apr 2009 04:56:53 -0700 (PDT)
Date: Mon, 27 Apr 2009 07:56:53 -0400
Message-ID: <f96d234e0904270456i1db3c409t7308b9d6b36c95c4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-04-20 to 2009-04-27
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
X-List-Received-Date: Mon, 27 Apr 2009 12:10:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-04-20 to 2009-04-27

Andrea Adami (4):
      console-base-image,console-image,gnuradio-image: don't hardcode
psplash-zap
      console-base-image,console-image,gnuradio-image: readd
psplash-zap
      initramfs-kexecboot-image: minor text cleanings
      kexecboot-cfg: initial deploy of /boot/boot.cfg (for
kexecboot_0.6)

Angus Ainslie (3):
      python-evas: make sure all headers are staged for dependencies
      fltk2: add an svn recipe for the beta version of fltk library
      fltk2 : ship all of the libs

Cliff Brake (1):
      linux-2.6.29: update cm-x270 kernel to 2.6.29

Denys Dmytriyenko (1):
      udev 124: add cache invalidation logic on kernel change or its
bootargs/cmdline/atags

Dirk Opfer (6):
      argp-standalone: new recipe, version 1.3
      pthsem: new recipe, version 2.0.7
      eibd: new recipe, version 0.0.4
      owfs: new recipe, version 2.7p21
      linknx: new recipe, version 0.0.1.26
      checksums.ini: add some more checksums

Dmitry Baryshkov (2):
      ppce500: add ppce500 to PACKAGE_EXTRA_ARCHS

Dmitry Eremin-Solenikov (3):
      site/powerpc-common: add ac_cv_va_val_copy result
      u-boot: fix compilation for at91sam9g20ek boards

Florian Boor (7):
      micro2440.conf: Improve jffs2 image parameters.
      linux-2.6.29: Tune micro2440 defconfig a little bit, build in
loop for loop root.
      New recipe: lowlevel-topas910, a mini bootloader for the
Topas910
      New machine: Topas910 - Toshiba TMPA910CRAXBG Starter Kit
      linux: Add topas910 defconfig for 2.6.26.
      checksums.ini: Add original Topas patch and bootloader.
      linux: 2.6.26 Add inital support for Topas910, we'll add a
better kernel later.

Frans Meulenbroeks (2):
      flickcurl: created recipe

Gregoire Gentil (1):
      mplayer: reenable vo_omapfb patch

Jeremy Lain=E9 (10):
      bitbake.conf, lib_package.bbclass: fix packaging of ${base_libdir}/*.=
so
      bitbake.conf, lib_package.bbclass: fix missing '$' in previous commit
      checksums.ini: add entries for Qt 4.5.1
      qt4(-tools-native)?.inc: compatibility fixes for Qt 4.5.1
      qt4: update from 4.5.0 to 4.5.1
      qt4.inc: add translation packages to the dynamic list
      Author: Otavio Salvador <otavio@ossystems.com.br>
      qt4-tools-native.inc: add qdbuscpp2xml to Qt native tools
      qmake2.bbclass: add OE_QMAKE_QDBUSXML2CPP and OE_QMAKE_QDBUSCPP2XML

Khem Raj (3):
      binutils-2.19.51.0.3: Add the latest HJ Lu's binutils release
2.19.51.0.3 recipes.
      gcc-4.4.0: Add recipes for latest gcc release 4.4.0
      checksums.ini: Add gcc-4.4.0 checksum.

Koen Kooi (36):
      checksums: add some more checksums
      linux-omap 2.6.29: add support for changing tranparency of overlays
      libxml++: add 2.26.0
      beagleboard: move to 2.6.29
      sane-srcrevs: bump EFL_SRCREV to the one mentioned in
http://trac.enlightenment.org/e/wiki/ReleaseSchedule?version=3D3
      etk: hack around gettext breakage
      angstrom: have bluez4 provide bluez-utils as well
      glibc: add 2.9
      checksums: add more checksums
      iputils: add 20071127
      patchword apply helper: use git-am -s and remove file when done
      bluez4: add 4.37
      linux-omap 2.6.29: add more dss2 patches, should solve problems
when using u-boot splash
      powertop: fix ldflags problem with omap3 machines
      linux-omap-pm git: update to latest git, refresh DSS2 patches
      ecore: fix packaging after e17 soname change upstream
      omapfbplay: update for 2.6.29 header location change
      angstrom 2009.X: move armv7a and vortex to gcc 4.3.3
      ekiga: update to 3.2.0
      angstrom feed sorter: add support for a few more machines
      Revert "efl: sync versions with upstream"
      Revert "ecore: catch up with the new SONAMEs; move to
autosplitting"
      Revert "evas: catch up with new upstream library names; bump
version string"
      linux-omap-pm: readd patch to register all OPPs, fix overo
defconfig
      ecore: fix git merge damage
      distcc-master-image: image that servers as distcc master, with
GUI
      gstreamer-ti: bump SRCREV
      libsdl-mixer: convert to autotools_stage
      u-boot git: update omap3evm
      u-boot 1.2.0: adjust dm355-leopard patch, still needs work to
compile with eabi
      webif: add recipe to build the webif binary and package support
files

Leon Woestenberg (2):
      contrib/mtn-bisect.sh: Removed, we moved to git which has bisect itse=
lf.
      binutils-avr32.inc: Add DEPENDS autoconf-native and automake-native.

Marcin Juszkiewicz (9):
      rpm-native: do not emit packages
      angstrom-2008.1: do not use Thumb for uclibc
      linux.inc: unset CONFIG_LOCALVERSION_AUTO to not get
2.6.27.2-svn8826-dirty26 like names
      buildbot: config of my buildbot running on
http://home.haerwu.biz:8010/
      task-base: added btusb driver to list of recommended BT drivers
      bug: added BUG Labs device
      linux-bug: added 2.6.27.2 from BUG Labs svn
      marvel-gspi-fw: added firmware for WiFi bugmodule
      netbase: added BUG support

Michael 'Mickey' Lauer (14):
      e-wm: reorder metadata for clarity; fix packaging
      sane-srcrevs.inc: bump EFL as per last weekend's feature freeze
recommendation
      libgsm0710mux: bump to 0.3.4
      libfsotransport: new recipe; transport library for FSO. add as
dependency for fso-term
      libgsm0710mux: needs libfsotransport now
      vala-dbus-binding-tool-native: new recipe; a dbus interface
generator
      dbus: bump default timeout value
      bustle-dbus-monitor: new recipe; monitoring utility for the
Bustle D-Bus suite
      openezx-kernel: bump to 2.6.30-rc2; this fixes the touchscreen
issues we had for a while
      ecore: catch up with the new SONAMEs; move to autosplitting
      evas: catch up with new upstream library names; bump version
string
      fltk2: make it somewhat work; still very hacky, since these
people
      efl: sync versions with upstream
      openezx-kernel: this rev brings back solid GSM on gen1 devices

Mike Westerhof (1):
      SlugOS: packages - deprecate ctrlproxy, depends on unstaged tbd.h (sa=
mba)

Petri Lehtinen (1):
      base.bbclass: Combine all checksum.ini files found in BBPATH

Roman I Khimov (14):
      busybox: update appletlib dependency patch
      image.bbclass: reorder do_rootfs
      bitbake.conf: use ROOTFS_SIZE for gzip'd images
      package.bbclass: fix globbing for mask-like files
      ace: New recipe for ACE 5.6.8
      image.bbclass: IMAGE_VARS->IMAGE_BOOT, make overridable
      icecc.bbclass: fix kernel distributed compilation
      tunctl: new recipe, version 1.5
      dialog: update version 1.0-20050306 -> 1.1-20080819
      clamav: add 0.94.2 version recipe
      siproxd: new recipe
      bitbake.conf: use rootfs/${PN} for IMAGE_ROOTFS
      sqlite3: add version 3.6.13

Stanislav Brabec (5):
      gnome-media: Built wihout gnomecd =3D> nautilus-cd-burner is not
needed. Removed obsolete .la file.
      man: GNU_HASH QA fix.
      fsi-client: GNU_HASH QA fix.
      unzip: GNU_HASH QA fix.
      pxaregs: GNU_HASH QA fix.

Steffen Sledz (8):
      hipox: switch serial console to ttyS1
      linux-2.6.24: Kconfig patch for HIPOX machine added
      linux-2.6.24: new defconfig for HIPOX machine
      u-boot_2009.03: fixes/adds for HIPOX machine
      base-passwd: default password for hipox machine set
      initscripts: modifications for hipox machine
      linux-2.6.24: enable kexec in defconfig for hipox machine
      linux-2.6.24: make ubifs available for all machines

Tom Rini (4):
      binutils-canadian-sdk:  Add 2.18.50.7 (as this is a popular default)
      fbv: Add a framebuffer-based png viewer.

Bugs fixed:

bug_id resolution        short_desc

Bugs opened:

bug_id resolution        short_desc
5085     syntax error when compile every package
5087     GNU_HASH in madwifi-ng-r3837-20080802-r1


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


