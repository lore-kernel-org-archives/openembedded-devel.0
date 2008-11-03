Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Kx37z-0002Nf-DP
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Nov 2008 18:22:11 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3291508rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Nov 2008 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=IXwtu6/p1Zh0oqZXBEpgEJdI0ANHIW0Dx4mB1C4QrfE=;
	b=uu+fGoT30fqRCNol4YzS99AHFKgaSzi0yLfsB7XexP/aKM0tsrzazAL99xOWozB6jq
	JmSNmRISUptaZO85U55JK8zwMRCq8CVjVZ1Tz50pxohZTQhk9IPnipj2bSqjz8fTZpbH
	i8h54+d8+3roOd4/wSBQOl+x8AUJ+LQnheAe4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=e7ZiqFszKAgp7/WrPA5YvETQNuYdt/9dXlNMiAXdhKeUGdHG2OOeKa9lg+Byhs4MHR
	UyMAx+pKELsgpz4ZylGwYR4GyBfCCVqbWg3k8lrW/MFhky7ila0XGNbb/jWXqP0/fWq3
	iXsPLlnSLopCbuNRE0RO0Mnzz8VsTzwNhrxbE=
Received: by 10.141.13.16 with SMTP id q16mr199923rvi.99.1225730855936;
	Mon, 03 Nov 2008 08:47:35 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Mon, 3 Nov 2008 08:47:35 -0800 (PST)
Message-ID: <f96d234e0811030847v1e300368o8910d355359cb05b@mail.gmail.com>
Date: Mon, 3 Nov 2008 11:47:35 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-10-27 to 2008-11-03
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
X-List-Received-Date: Mon, 03 Nov 2008 17:22:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OE weekly changelog 2008-10-27 to 2008-11-03

Thanks to Koen for adding the bug summary to the script.

=========================
Chia-I Wu (3):
      maps: Add map of Hong Kong.
      om-locations: Attribute to OpenStreetMap.
      om-locations: Add map of low levels.

Elena ``of Valhalla'' Grandi (4):
      podget 0.5.8: new recipe
      podget 0.5.8: added checksum.ini entry
      geany 0.14: added checksum.ini entry
      mcabber 0.9.9: added checksum.ini entry

Graeme Gregory (4):
      exposure_svn.bb : tidy recipe and remove AUTOREV that doesnt belong
      om-settings: fix versions
      app-restarter: fix versions
      openmoko-set-root-password: fix versions

Holger Hans Peter Freyther (31):
      sanity.bbclass: Work if no TMPDIR was created yet
      busybox.inc : Make busybox honor our LDFLAGS
      insane.bbclass: import bb to make python happy
      assassin-thumbnail: Add tick's assassin-thumbnail recipe
      openmoko: Fix the feed configuration Make the package buildable again
      asu: Create ASU/Om2008.8 task and image (to ease removing Qtopia
from it) Create a separate task-openmoko-asu and openmoko-asu-image.
The image is installing task-openmoko-asu and
task-openmoko-qtopia-x11. It should be fairly easy to remove Qtopia
for the people that want that.
      srcrev: Upgrade exposure to be launchable again
      srcrev/exposure: Upgrade exposure to have the xdg changes
      exposure: Add patch to make r62 build The Icon of exposure was
removed from the trunk but is still referenced from the setup.py file.
In the best case the exposure icon would be restored as we currently
lack an icon. As we want to build r62 now for testing it is best to
cope with the missing icon...
      insane.bbclass: Detect if someone is not using our LDFLAGS
      gstreamer.inc: Use base_conditional for Openmoko instead of a
plain override
      hal_0.5.11: Move back to the hal directory and make it default
for Openmoko
      app-restarter: Add the little helper utility to relaunch X11 apps
      sane-srcrevs.inc: Upgrade app-restarter and fix the PV, bump the PE
      app-restarter: Add X11 to the dependencies.
      openmoko: Add a Gtk+ utility to set the root password
      xserver-nodm-init: Make sure to set a HOME and LOGNAME when launching
      packagekit: Disable generation of the docbook
      packagekit: Bump the PE after changing the PV scheme in 5bfa0791
      e-wm: Fix the DESCRIPTION as of https://docs.openmoko.org/trac/ticket/1894
      e-wm: Start e with optional arguments we get from a config file
      e-wm: Remove left over, e gets started through the x-window-manager
      mono: Two svn checkouts are used, specify a SRCREV_FORMAT
      bashism: Move away from pushd/popd as it is only available for bash
      Compile with recent glibc,gcc,headers (e.g. fedora 9) Add a
patch to dbus to properly compile on fedora 9.
      tasks: Set PACKAGE_ARCH so it has an effect
      moblin-proto: Use the right git server
      bluemchen wiese: Allow to disable certain ugly packages globally

I-Fan, Chen (1):
      packagekit: modify summary field to support alias Tags.

John Lee (2):
      dropbear: improve dropbear security by listening only on usb0 by default
      dropbear: add /etc/default/dropbear in conffiles only on openmoko

Joshua Lock (1):
      xerces-c: Correct SRC_URI

Julian Chu (1):
      packagekit: Change revision of packagekit.

Julian_chu (26):
      tichy: Apply Charlie's change
      Assassin: Add curl to assassin's depends. Tick did a quick hack
to assassin for access networking. It's is a temporary solution.
      assassin: Remove curl in DEPENDS of assassin
      assassin: Change the source URI of assassin For some
experimental reason, Assassin is going to move to code google.
      openmoko: Change name from Diversity-nav to Om-locations
Diversity project decided to change the name of diversity-nav to
om-locations and move the repository from svn to git.
      om-locations: Set om-locations to use 0.2 branch of om-locations
git. and bump up the revision to
5cdea8da38561348d4cca6726098afb61d8299eb
      om-locations: Set om-locations to use 0.2 branch of om-locations
git. and bump up the revision to
5cdea8da38561348d4cca6726098afb61d8299eb
      om-locations: Switch back to master branch After Om2008.9
released, switch om-locations back to master branch.
      diversity: Add diversity-radar, a GPS location based
communicative application [sane-srcrevs] Add version of
diversity-radar to 405
      diversity: remove PACKAGES = "${PN}" from diversity-radar
      openmoko: add Openmoko community repository bbfile. It create a
configure file in rootfs for opkg.
      openmoko: Change default community repository set
http://downloads.openmoko.org/repository/Multiverse/ as a default
repository for community
      openmoko-community-repository: Modify the URL Remove the duplicate slash
      exposure: As Marek's request. Add python-dbus to exposure
      exposure: Bump up reversion of exposure to 30. Files layout of
exposure was chaged in upstream. Therefore I chage a little of
exposure bbfile.
      exposure: Bump up the reversion of exposure to 63
      openmoko: Rename from exposure to om-settings
      openmoko: Rename from diversity-maps-* to om-maps-* Splinter had
rename to om-locations. Therefore we also rename those maps.
      apmd: Correct the .la file
      packagekit: Add 2 patched for packagekit.
      packagekit: Add patch to packagekit.
      packagekit: Add a patch to packagekit.
      packagekit: Add patch force_depends.patch
      packagekit: Add a patch to packagekit
      packagekit: Add a patch for packagekit
      packagekit: Add a patch for packagekit

Khem Raj (1):
      binutils checksum.ini: Add binutils 2.19 recipes

Koen Kooi (38):
      xf86-video-omapfb: bump SRCREV for stride fix
      xf86-input-tslib: add tslib driver for Xorg xserver
      xf86-input-tslib: ship hal fdi file to avoid xorg.conf incantations
      xorg xserver: enable xcalibrate to get touchscreens working a bit better
      xf86-input-tslib: fix autoreconf and actually ship fdi fil
      hal 0.5.11: add fix from hal git to fix libtool issues in configure
      xserver xorg 1.4.2: try harder to get xcalibrate enabled
      xserver-xorg: use omapfb driver and tslib for omap3evm machine
      angstrom feed builder: add qemux86 machine
      exo: fix build of python modules and disable running of tests at
      ti-lpm-module: not using oe_runmake allows us to get rid of all
the sed magic
      codec-engine 2.21: apply fix for ti-lpm-module build
      linux-omap git: add patch for fix scaling for the overlay
      package bblass: fix ldconfig_postinst_fragment to not return an
error if no /etc/ld.so.conf is present
      angstrom feed builder: add xf86-input-tslib
      ti-cmemk-module, codec-engine: add patch to fix builds with
>=2.6.26 and class_device_* API change
      dsplink: add omap3evm support
      dropbear: fix do_install for all distros that aren't named 'openmoko'
      weekly changelog: add in bugstats from the mtn2cl script
      kernel bbclass: start adding support for >=2.6.27 where headers moved
      mplayer: enable more inputs
      linux-omap git: bump PR for staging changes
      bluez-gnome: package icons and mime types
      icu 3.6: sed binconfig file so that -I/usr/include doesn't end
up in cflags for e.g. webkit
      webkit-gtk: bump PR to get icu binconfig fix
      glibc 2.6.1: bump PR for package.bbclass change
      checksums.ini: add claws-mail
      initscripts: only run ldconfig on boot when ld.so.conf is present
      linux omap git: add patch that implements downscaling for the overlay
      xserver xorg: have beagleboard use xf86-video-omapfb to gain XV support
      beagleboard.conf: s/fbdev/omapfb/ for xserver
      angstrom-x11-base depends: bump PR for XSERVER change
      task-x11: bump PR for XSERVER change
      beagleboard demo image: include synergy and x11vnc
      checksums.ini: add links
      firefox, fennec, minimo: marks internal libs with PRIVATE_LIBS
      linux-omap git: add patch for omap3evm board to make ts behave

Marcin Juszkiewicz (4):
      qemuarm: do not set PACKAGE_EXTRA_ARCHS as this is done in tune-arm926
      gtk+: added missing dependencies (from Poky)
      gst-plugins-base: added missing dependencies
      gst-plugins-base: enabled XVideo output and gnome-vfs plugin

Michael 'Mickey' Lauer (14):
      freesmartphone: remove git PR hacks
      task-fso-compliance: RRECOMMEND tzdata
      task-cli-tools: add
      libframeworkd-glib: add
      sane-srcrevs: add libframeworkd-glib & frameworkd-devel
      frameworkd: stock version builds stabilization/milestone4 now,
-devel version builds master now
      frameworkd: depend on python-difflib, recommend python-gst
      frameworkd-devel: fix git branch
      libserial 0.5.2: add recipe. C++ library supporting serial port
programming
      qi: new recipe. Qi is the next-generation bootloader for Openmoko devices.
      python 2.5.2 add cProfile and low level module companion to python-profile
      moko-autorev: reenable openocd and packagekit, remove python-etk for good
      python 2.5.2: python-profile depends on python-textutils. closes
Openmoko bug #2106
      python-fusil 1.1: new recipe; Python library for fuzzy algorithms.

Mike Westerhof (5):
      SlugOS: set preferred version for hal
      gnuradio.inc: fix bad line wraps causing bitbake parse errors.
      xorg-lib: xtrans - set ALLOW_EMPTY; fixes dependency problem with SDKs
      xorg-proto: set ALLOW_EMPTY; fixes dependency problem with SDKs
      xorg-util: util-macros - set ALLOW_EMPTY; fixes dependency
problem with SDKs

Otavio Salvador (11):
      sourcepkg.bbclass: use DISTRO_PR value
      bitbake.conf: use base_build_package_revision to ensure DISTRO_PR is used
      gtk-xfce-engine: add depends on gtk+
      xorg-xserver-common.inc: set userid to allow Xorg to be run by users
      checksums.ini: new checksums for a set of packages
      thunar: recommends shared-mime-info to properly support .desktop files
      firefox: use system bz2 library to avoid missing symbols
      Revert "xorg-xserver-common.inc: set userid to allow Xorg to be
run by users"
      initscripts: do /proc remount instead of mounting it
      gnumeric: do not overwrite PACKAGES_DYNAMIC to allow locales to be used
      fennec: use system libraries while building

Phil Blundell (10):
      tremor: suppress thumb mode for this package due to inline asm
      gnupg: disable eleet asm in mpi when compiling for thumb.
      glib-2.0: correct over-zealous patch application in last change
      bluez-utils: avoid inline asm when compiling for thumb
      gst-plugins-bad: disable inline asm during thumb builds
      mpfr: crusade against inline assembler
      epia: repair PACKAGE_EXTRA_ARCHS breakage

Philip Balister (2):
      gnuradio : Update gnuradio_svn build
      gnuradio : Add patch that adds NEON support.

Philip Blundell (2):
      glib-2.0: add workaround for compilation with -mthumb

Richard Purdie (7):
      classes/conf: Handle Distro PR change in sanity.bbclass
      classes/package*.bbclass: Remove the build_package_revision function
      packaged-staging.bbclass: Set the extra staging paths to a sane default
      conf/abi_version.conf: Add lost from previous commit
      omap5912osk: Remove PACKAGE_EXTRA_ARCHS now its set in the tune
include file
      sanity.bbclass: Add check for duplicate entries in PACKAGE_ARCHS

Robert Schuster (1):
      checksums.ini: Added midpath 0.3rc1 entry.

Stanislav Brabec (3):
      checksums.ini: Added several missing checksums (atd, icewm,
pxaregs, wwwoffle).
      checksums.ini: Added checksums for SDL_gfx, kxml2, libhildonfm,
libhildonmime, osso-gnome-vfs2, gpsbabel, rxtx and xmlpull.
      gpe-soundbite: Added missing space in LDFLAGS_append.

Stefan Schmidt (5):
      xo.conf: Add machine config file for the XO laptop
      linux-xo: Add GIT XO kernel with fixed SRCREV
      tune-geodelx.inc: Move in PACKAGE_EXTRA_ARCH from xo.conf
      linux-xo_git: Fix PV. Thanks Koen.
      checksums.ini: Add sums for new xerces-c location

Steffen Sledz (1):
      checksums.ini: Added u-boot checksums (OE#4787).

Thomas Kunze (1):
      linux-kexecboot: add ext3 to some defconfigs

Tick Chen (1):
      packagekit: Update to a public version of packagekit

julian_chu@openmoko.com (1):
      Add Exposure, a setting application

walkingice (1):
      Modify packagekit to make it patch successful

woglinde (12):
      mx31ads.conf: remove extra PACKAGE_EXTRA_ARCHS
      glib-2.0-native: fix installation of libgio
      glib-2.0-native: bump PR
      findutils: switch EXTRA_OECONF setting for uclibc to +=
      findutils: remove install_apend it looks good inside the image dir now
      findutils: update to latest version 4.4, but not enabled yet
      gnuradio: fix depends and rdepends errors sneaked in with the last commit
      findutils: fix mkinstalldirs for the po directroy requested by koen
      gnuradio: revert my fixes because mwester pushed it faster
      gcc: fix open() with O_CREATE for version 3.4.3 and 3.4.6

Bugs fixed:

bug_id resolution        short_desc
4015 DUPLICATE   dsniff-2.3-autobuild
4030 FIXED       openmoko-panel-gsm-0.1.0+svnr3664-autobuild
4074 DUPLICATE   linux-hackndev-2.6-2.6.21-hnd3-autobuild
4114 WORKSFORME  gettext-0.14.1-autobuild
4738 WORKSFORME  python-numpy-1.1.1-autobuild
4495 FIXED       new recipe for Fusil
4551 FIXED       proposed bb for podget (bash podcast aggregator)
4626 FIXED       gcc-native-3.4.6 do_compile failed in Ubuntu
4688 FIXED       [RFE] add ext3 support to linux-kexecboot for Zaurus
clamshell models
4764 FIXED       mcabber do_fetch failure because of missing checksum
4787 FIXED       Checksums for some u-boot sources missing.
4788 FIXED       Fix duplicated EXTRA_ARCHES for mx31ads

Bugs opened:

bug_id resolution        short_desc
4782     Checksum for libftdi-0.13 missing.
4783     build page improvement suggestions
4784     Spurious notes: missing or unbuildable dependency chain


-- 
=======================
Cliff Brake
http://bec-systems.com


