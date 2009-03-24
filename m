Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lm80p-0001lB-6S
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 15:53:55 +0100
Received: by yw-out-1718.google.com with SMTP id 9so1771745ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=8tGmWYCVpcModzQM9FAQU9bXb38O3gqFyq9lU5ugzn8=;
	b=nFKjA4caSX4dQmK3euUdaqFUcrVgNYX8ISb28FHranoK4rih2kXi/hsMGOMcN8hssH
	oezNMTUof2Rryp5r5iZBFTNJ4qkCQIQTLCC6U7bveKKnMscRfScIsdpYVxcR2oYHH2dG
	0iWRCrAQTKUkv6gFtoQQtaF6muLxkhl6ZqzgU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BqQ54RZK0wEUoTTq1aGoBLW3AitLV/T3aGNa5n+OnSrH6OnArB+VZcEpJGgXVynm4h
	gEXBP9DFt08jvXkKFcOhqfC5/5SQFoRrjkcS5Y/tJ81IBwsdhjEjO1/C1ZDRj9wQT8ZX
	F8KP4/iSfDThvTz4BhLK86Eqg3POlLCduATMw=
MIME-Version: 1.0
Received: by 10.151.101.20 with SMTP id d20mr14470032ybm.122.1237906346037; 
	Tue, 24 Mar 2009 07:52:26 -0700 (PDT)
Date: Tue, 24 Mar 2009 10:52:26 -0400
Message-ID: <f96d234e0903240752t2629eeeu2e65a45f0f9f71ae@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-03-16 to 2009-03-23
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
X-List-Received-Date: Tue, 24 Mar 2009 14:53:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-03-16 to 2009-03-23

Andrea Adami (4):
      qemu_svn: fix FILESPATH after base.bbclass changes
      keymaps: wildcard in SRC_URI doesn't work anymore, specify files
      opie-multikey.inc: add ru.keymap using SR_URI_append
      c7x0.conf: fix typo (rootfs is 53 MB)

Chris Larson (16):
      automake-native: use require, not include.
      omext: Unbork the S variable.
      bzip2-full-native: Kill the manual copy of install-sh,
autoreconf will handle that.
      console-tools: clean up the way it handles its .m4 files
      bitbake.conf: rework FILESPATH generation.
      base.bbclass: Kill the 'Pkg' messages in the event handler.
      classes/base.bbclass: Locate the scm base path via BBPATH.
      base.bbclass: make oe_unpack_file of dirs use FILESPATH, not
FILESDIR.
      cross.bbclass: set autoconf's program prefix to keep TARGET_SYS
and TARGET_PREFIX decoupled
      bitbake.conf: Move the list of vars shown in the pre-build
config display to here.
      insane.bbclass: Silence the annoying GNU_HASH QA checks when
--hash-style isn't set.
      bitbake.conf: Make FILESPATH only contain directories that
actually exist.
      base.bbclass: Add base_path_relative.
      bitbake.conf: make cvs and wget fetching obey PATH from the
metadata.
      base.bbclass: revert removal of base_set_filespath until the
refs can be removed.
      base.bbclass: Fix typo.

Denys Dmytriyenko (5):
      rename packages/ to recipes/ per earlier agreement
      recipes: fix hardcoded instances of packages/
      base.bbclass: fix base_get_scmbasepath() to look for recipes/
and fall back to packages/ while parsing BBFILES
      linux-davinci: re-enable .27 for dvevm until .28 is
finished/tested
      bitbake.conf: --no-check-certificate was added to the wrong
place for RESUMECOMMAND_wget

Frans Meulenbroeks (3):
      moved some files from packages to recipes

Jeremy Lain=E9 (7):
      qtopia-core: drop obsolete package
      qtopia-core transition: replace references to qtopia4core
      webkit-qt(opia): drop obsolete test packages
      nxproxy, nxssh, qtnx: fix installation
      stat; don't call install -s, it fails for cross-builds

Khem Raj (10):
      checksums.ini: Update checksum for phoneserver, soundserver, and
voicecall.
      soundserver_1.0.bb: Remove libtool patch
      binutils_cvs: Various fixes to get it building.
      uclibc: Get uclibc working in thumb mode.
      sane-srcrevs.inc: Bump the sane srcrev for uclibc.
      rpm_4.4.2.3.bb: Define EXTRA_OECONF inside
do_configure_prepend()

Koen Kooi (26):
      uclibc: readd ARM_INSTRUCTION_SET =3D "arm" that someone removed
without actually fixing the problem it solves
      ffmpeg: add 0.5 release
      linux-davinci: add 2.6.28
      linux-davinci git: add WIP dm355-leopard support
      linux-davinci git: update leopard patch since he have an offical
machine ID now :)
      angstrom food sorter: add more machines
      angstrom sample local.conf: update for packages->recipes switch
      dm355-leopard: add more machine features
      linux-davinci git: make usb and ethernet work
      gstreamer-ti: bump SRCREV to 160
      linux-davinci git: add vfpe driver for davinci and dm355, enable
it in dm355-leopard defconfig
      glib-2.0: add 2.20
      gtk+: add 2.16.0
      abiword: update to 2.6.8
      linux-omap-pm: add 2.6.28 recipe so git can move to .29rc
      libproxy: add 0.2.3
      libsoup: add 2.26.0
      webkit-gtk: bump SRCREV
      linux-omap 2.6.28: update resizer patch
      sqlite3: update to 3.6.5
      fennec: update from alpha to beta release, work around latest
mozilla bugs (filed upstream)
      angstrom 2009.X: bump gtk+ and glib-2.0, runtime tests don't
show obvious regressions
      libproxy: add libxmu to depends

Marcin Juszkiewicz (13):
      checksums.ini: added fakeroot 1.12.1
      busybox: do not fetch fixes patches but store them in metadata
      rpm/rpm-native: Add recipe for 4.4.2.3 (from Poky)
      fakechroot: fix duplicated readlink (from Poky)
      libxml2-native: really enable Python extension
      openssl-native: make sure that PACKAGES will be empty (from Poky)
      bluez4: changed globs in FILES_${PN}-dev to make package_rpm happy
      gtk+: make 2.14.2 default version instead of 2.10.14
      package_rpm.bbclass: files needs to start from /
      alsa-state: revert wrong fix, do that better
      alsa-state: fix for a780 additional states
      alsa-state: ${PN} is not always 'all' - some devices have own asound.=
conf

Michael 'Mickey' Lauer (18):
      vala-native: build git version from freesmartphone.org which has
some additional patches on top
      libfsoframework: new recipe; support library for
freesmartphone.org
      fsodeviced: new recipe; C reference implementation of
org.freesmartphone.Device.* APIs
      fso-plugin.bbclass: new class for fso plugin packaging
      cpubench: new recipe; simple OpenWRT CPU benchmark
      minimal: ship debug apps, if requested
      fso-autorev.inc: add libfsoframework and fsodeviced
      openezx-kernel: update to sane version; we're now at 2.6.29-rc8.
Fix branch and remove command line args for
      task-cli-tools: ship nfs-utils-client
      bitbake.conf: weak assignment for DEPLOY_DIR
      fso-autorev: add libeflvala
      sane-toolchain.inc: move non-weak assignments for CACHE and
DEPLOY_DIR to minimal.conf; make them weak
      linux-msm7xxx: bump htcraphael SRCREV to a version that boots
      motorola-ezx-base.inc: set MACHINE_CLASS for overrides
      frameworkd: bump to current HEAD; add configuration for htc-msm7
MACHINE_CLASS and motorola-ezx MACHINE_CLAS
      libeflvala: new recipe; Vala bindings for the Enlightenment
Foundation Libraries
      minimal.conf: override OVERRIDES to include the MACHINE_CLASS
      linux-msm7xxx: enable NFS and CIFS for htcraphael

Mike Westerhof (7):
      wireless-tools: do ifconfig down before the ifconfig up is done.
      SlugOS: bump automake-native to 1.10.2
      ffmpeg: don't forget to stage pixfmt.h, and bump PRs of affected reci=
pes.
      SlugOS: preferred_slugos_versions.inc - bump up libtool
      slugos-packages: demote irrsi - won't build with newer libtool.
      SlugOS: remove preferred_version restrictions for more packages.
      libgsm, bogofilter, man: fix misuse of FILESDIR

Philip Balister (5):
      linux-omap_2.6.27 : Enable TMP FS for omap5912osk.
      libconfig : Add new recipe for libconfig-1.3.1.
      qwo : Add new recipe for qwo.
      checksums.ini : Add checksums for libconfig-1.3.1.tar.gz and
qwo-0.4.tar.gz.
      alsa-state: Wildcard removed and all *.state put back in the
recipes

Richard Purdie (9):
      beecrypt: get patch from Poky to fix building on 64bit machines
      Drop pointless rpm_core class. (from Poky)
      Add python-urlgrabber, python-iniparser, yum-metadata-parser and
native variants (from Poky)
      Add yum and createrepo (from Poky)
      rootfs_rpm.bbclass: added from Poky
      package_rpm.bbclass: added from Poky
      packaged-staging.bbclass: Add rpm package coverage (from Poky)
      base.bbclass: Add read_subpkgdata_dict function (from Poky)
      package.bbclass: Write out extra useful data into the pkgdata
files (from Poky)

Robert Schuster (29):
      cacao 0.99.3: Added patch for PR 99.
      checksums.ini: Added cacao 0.99.4 entry.
      checksums.ini: Added classpath 0.98 entry.
      classpath 0.98: New recipe.
      cacao-native: Updated to 0.99.4.
      cacao 0.99.4: New recipe.
      classpath-native: Clean up
      chinook-compat: Updated versions of packages that where removed from =
OE.
      chinook-compat.conf: Prefer fakeroot-native 1.9.6.
      libhildon-mime: Replaced dependency with gnome-vfs.
      libart-lgpl.inc: Build fix.
      chinook-compat.conf: Fix automake-native preference.
      hildon-thumbnail 0.14: Fixed dependencies.
      libosso 2.13: Fixed build
      glib-2.0.inc: Provide a change in packaging for chinook-compat
specifically.
      swt3.4-gtk.inc: Depends on classpath explicitly.
      automake 1.9.6: Retrieve recipe from history.
      chinook-compat.conf: Declare preference on automake-native 1.9.6.
      cacao-native 0.99.3: Retrieve recipe back.
      cacao-native 0.99.4: Added note about unusability on amd64 hosts.
      osso-gnome-vfs2: Removed.
      task-maemo.bb: Changed osso-gnome-vfs2 to gnome-vfs.
      preferred-om-2008-versions.inc: Update jamvm preference to 1.5.2.
      cmake.bbclass: Allow overriding path-to-source argument for cmake cal=
l.
      cmake.bbclass: Allow out of tree builds with cmake.
      cmake.bbclass: Put mandatory cmake option to end
      swt3.4-gtk 3.4.2: New recipe.
      checksums.ini: Added swt-gtk 3.4.2 entry.
      llvm 2.5: New recipe.

Russ Dill (1):
      mesa 7.2: Add required expat dependancy

Stanislav Brabec (5):
      m4: Updated to version 1.4.12.
      rpm, yum: Reverted back python "site-recipes" to "site-packages".
      rpm: Fixed build if libdir !=3D prefix/lib.
      rpm-native: Requires gettext-native.
      beecrypt: Fixed x64fix.patch to follow standard libdir.

Theodore A. Roth (1):
      local.conf.sample: Replace packages/ with recipes/.

Tim 'timtim' Ellis (2):
      linux-kirkwood: Add kernel recipe for Marvell Kirkwood platforms
including the Sheevaplug
      sheevaplug: Add machine config for Sheevaplug and a generic
include for Kirkwood platforms

cbrake (1):

woglinde (4):
      checksums.ini: fix entry of busybox-1.13.2-modprobe.patch
      wrap.conf: no extra kernel-recpie needed use the plain ones
      linux-2.6.28: make default for wrap and therefore provide a
valid defconfig
      uclibc: add config for wrap

Bugs fixed:

bug_id resolution        short_desc
5005 WORKSFORME  do_compiled failed for shared-mime-info-native_0.51
5010 FIXED       wrong cheksum: do_fetch failed

Bugs opened:

bug_id resolution        short_desc
5069     [patch] rpm recipe :some .debug files isn't included in dbg packag=
e


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


