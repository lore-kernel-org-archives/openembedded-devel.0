Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M91Qp-0003WX-M8
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 20:31:24 +0200
Received: by yw-out-1718.google.com with SMTP id 9so2098623ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2009 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=X1j5r6i8eObqcqnwfz7P4tYrh2vh5xiFeE0NOvAib7I=;
	b=F1GlhcIQJlncpjtB58uRBvA6xsVrRbQ3dLsCSjHWai9Vx0FA+Ekzq2Q6lW9J6kwQZx
	HvwqDGljCzWmQsEx2lByOT66jfeNFPRtQbKBBNKq2XJckJrPd/PfkA8QXPMSNwsYe7rl
	/z1AfuFrNECS4EPrZGhfoP6Fpc3mBoaKdK6vk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DoUnqWOxG9EfV2AZ2w8X0gpCYGD8bZcROp8HggSL8e/Q4+7V4mCZUkWXF38geoFm6/
	rTiLdHzgKmNRQ/h8I25uDFjd/n4qYdg+Dv/E5wxDh6zQ+m7i2TPRz3MkbM5/6uaQJL6a
	cevscXAP2bqyySyy0400aqh5d7IlKI1q0EPA4=
MIME-Version: 1.0
Received: by 10.151.125.7 with SMTP id c7mr17238004ybn.138.1243362195820; Tue, 
	26 May 2009 11:23:15 -0700 (PDT)
Date: Tue, 26 May 2009 14:23:15 -0400
Message-ID: <f96d234e0905261123u6c8b4ebdyb0192eb270e7be1e@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-05-18 to 2009-05-25
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
X-List-Received-Date: Tue, 26 May 2009 18:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-05-18 to 2009-05-25

Andrea Adami (5):
      kexec-tools-static_2.0.0: add --nostdinc to purgatory Makefile makefile
      zaurus-2.6.inc: reorder common include - readd collie and tosa
specific bits - add MACHINE_KERNEL_PR
      kexecboot.inc: rename as initramfs-kexecboot.in
      zaurus-2.6.inc: fix bogus MACHINE_EXTRA_RDEPENDS_collie and add
      zaurus-kernel.inc: add a (common) PR for linux-kexecboot

Cliff Brake (1):
      test commit to new server

Denys Dmytriyenko (8):
      davinci.inc: add common DaVinci machine configuration
      dm6446-evm: rename machine from davinci-dvevm and add defconfig
      dm6467-evm: add new machine definition and defconfig
      dm355-evm: add new machine definition and defconfig
      dm365-evm: add new machine definition
      dm357-evm: add new machine definition
      linux-davinci: build linux-davinci kernels for dm6446, dm6467
and dm355 EVMs
      u-boot: update git recipe with the new DaVinci EVMs

Dmitry Artamonow (1):
      linux-handhelds-2.6: fix compilation with gcc-4.3

Dmitry Eremin-Solenikov (11):
      oestats-client: support working behind proxy
      tqm8540: initial support

Elena Grandi (2):
      gtksourceview2 2.6.0: new recipe for the current stable version.
      checksums.ini: added entry for gtksourceview2_2.6.0

Florian Boor (5):
      xserver-kdrive-common: Run calibration script before window
manager and change names in bb accordingly.
      pointercal: Add support for the Topas 910.
      icu: Apply patch working around a gcc bug.
      python: Add patch to fix linking
      sane-srcrevs: Add gpe-mini-browser 2

Graeme Gregory (6):
      libnss-mdns_0.10.bb : add new version of the mdns resolver
      avahi.inc : fix override to libc-glibc instead of linux to get
it to always
      qemu-native.inc : force qemu native to use our C/LDFLAGS so that
you don't
      transmission_1.61.bb : add patch from svn to fix uploading
torrents from the
      transmission/files/webupload.patch : add missing patch

Ihar Hrachyshka (1):
      gst-plugins: fixed pattern for meta package dependencies.

Koen Kooi (60):
      transmission: only run *inst scripts online
      transmission: update-rc.d handles online check, so add a note
saying that,  fix packaging
      xserver-common: add xdg-autostart support (from poky)
      util-linux-ng: update to 2.15
      e2fsprogs(-native): update to 1.41.5
      udev 141: add /dev cache, install binaries to the correct
locations
      udev 141: add fb0 -> fb symlink to make X happy
      util-linux-ng 2.15: stage libblkid (yes, this used to be in
e2fsprogs(-libs))
      hal: add (disabled) hal 0.5.12
      e2fsprogs-libs: update to 1.41.5, split out libs
      util-linux-ng: split out libs to avoid collision with
e2fsprog-libs
      hal-info: update to 20090414
      bitbake.conf: weakly assign OLDEST_KERNEL ?= "2.4.0" *after*
machine and distro configs are included
      angstrom 2009.X: weakly assign OLDEST_KERNEL
      util-linux-ng: fix dep loop
      angstrom feed uploader: use partial mode in rsync
      angstrom feed builder: remove opkg-native from clean list
      zenity: add 2.26.0
      angstrom-feed-builder: add zenity
      linux-omap 2.6.29: refresh dss2 patchset
      zenity cruft: remove files that a failed attemp at using git-am
put there
      u-boot git: add support for dm355-leopardboard
      linux-davinci git: fix dm355-leopard machtype since we can use a
proper uboot now
      angstrom 2009.X: switch to udev 141 and hal 0.5.12 per RFC
      dm355-leopard: use upstream UBOOT_MACHINE
      checksums: add more checksums
      gcc 4.3.2, 4.3.3, 4.4.0: attempt to fix
zecke-no-host-includes.patch
      gstreamer: add 0.10.23
      gst-plugins-base: update to 0.10.23
      gst-plugins-good: add 0.10.14
      gst-plugins-bad: update to 0.10.11
      gst-plugins-ugly: add 0.10.11
      angstrom feed sorter: add support for SDKs, x86_64 and new TI
machines
      udev 141: fix staging
      devicemapper: fix QA problems, add 1.02.28
      libatasmart: add 0.13
      udev 141: symlink /usr/lib/udev/rules.d to /etc/udev/rules.d
      devicekit-disks: add 004
      gst-plugins: switch back to old way of excluding locales
      Angstrom 2009.X: set OLDEST_KERNEL to 2.6.16 to avoid problems
with ppoll()
      glibc 2.6.1: bump PR for oldest-kernel change
      gnome bbclass: package scrollkeeper 'leftovers' in a seperate
package. Like the fdo mime data it overlaps between packages.
      ekiga: update ekiga bits to 3.2.4
      angstrom: stop disabling binary localegen for >=armv6 per RFC on
the ml
      consolekit: fixes suggested by RP
      pixman: add 0.15.6, it has some internal reorg, more NEON
patches and since it's 0.odd.x extra unstableness
      bluez4 4.39: actually run initscript
      linux-davinci: bump PR and point to include file where
MACHINE_KERNEL_PR is located
      linux-omap 2.6.29: add missing ppoll patch

Lynn Lin (1):
      package_rpm: fix move wrong generated rpm name - closes #5078

Marcin Juszkiewicz (8):
      psplash: added BUG support
      e2fsprogs: improve packaging for 1.41.5 to not waste rootfs space
      util-linux-ng: dropped use of FILESPATH
      task-proper-tools: sort alphabetically
      task-proper-tools: added few extra packages
      netcat: use update-alternatives as we have netcat in busybox too
      netcat: use update-alternatives class (thx Koen)
      tftp-hpa: added 5.0 version of HPA tftp client/daemon

Mario Domenech Goulart (3):
      s/IPKG_INSTALL/PACKAGE_INSTALL/
      Documentation for PACKAGE_ARCH is actually for PACKAGE_ARCHS
      Fixed indentation for Python code

Martin Dietze (9):
      nylon classes: update image type and mirror locations
      linux-mtx 2.6.27: updates
      busybox: add more patches, update nylon defconfig
      Ser: Added dbg packet definition to ser to avoid problems with
sanity checks.
      Nylon: Nylon is now derived from angstrom.
      Nylon-feed: Updates
      Base-files: Updated for nylon.
      pciutils: filter out flags that break gcc3
      various nylon stuff: Updates to nylon-only code, needed to work
with the current OE.

Matthieu Poullet (2):
      dsplink: change path to the XDC tools directory
      wget: update to version 1.11.4

Michael Smith (2):
      Remove unused grub-0.93.
      grub: Split the grub-install script and friends into a separate package.

Otavio Salvador (22):
      gtk-engines: add 2.18.1
      machine/geode[gl]x: use more optimization while compiling
      acpid: add 1.0.8 (with netlink support)
      python-pycups: add
      checksums.ini: add flash-plugin
      checksums.ini: add sun-jdk
      checksums.ini: firefox-l10n-pt-br
      system-config-printer: add to provide python-cupshelpers to hal-cups-utils
      hal-cups-utils: add
      conf/licenses.conf: add CUPS license
      fixes wrong license value usage for GPLv2
      mtools: update to 4.0.10 since 3.9.11 was not available anymore
      rt61-firmware: fix installation of binary files
      initramfs-uniboot: properly setup sysfs and tmp
      cups: undo mangle of cups_{datadir,serverbin} in cups-config
      libgnomeprintui: drop gnome-common dependency since it is added
by gnome class
      ppp: add peers dir
      gnumeric: update to 1.8.4
      xf86-video-geode: add 2.11.2
      cups: use INC_PR due cups.inc being used in many recipes
      conf/checksums.ini: add xf86-video-geode
      xf86-video-geode: fix GPIO probing and RandR init

Paul Eggleton (2):
      opie-packagemanager: support opkg and split feed files in 1.2.4 version
      zaurusd: update to latest svn (as of 20090501)

Phil Blundell (3):
      snes9x: fix sundry compilation problems
      bluez-libs: add 4.40, set default preference to -1 pending availability

Pratheesh Gangadhar (1):
      xf86-input-evtouch: add driver for eGalax USB touchscreen

Previdi Roberto (1):
      zenity package

Rolf Leggewie (22):
      flac: add HOMEPAGE and simplify do_stage
      flac: add 1.2.1.  (Closes: #4386)
      libassa: update to 3.5.0.  3.4.2 was incompatible with the
libtool we use now.
      checksums.ini: add entry for gnome-mplayer 0.5.3.
      minilite: unify
      conf/distro/minimal.conf: assign DISTRO_TYPE only weakly
      granule: move SRC_URI definition into .inc file
      granule: add 1.4.0
      granule: drop 1.2.4
      gnome-mplayer: unify
      gnome-mplayer: point svn to googlecode.com.  builds fine.
      gnome-mplayer: unbreak 0.5.3
      gnome-mplayer: add 0.9.5. (Closes: #4575)
      cellwriter: update to 1.3.4
      kanatest: fight some bitrot (SRC_URI, HOMEPAGE, etc.)
      kanatest: add 0.4.8
      checksums.ini: add entry for an AVR32 u-boot patch. (Closes:
#4804)
      minisip-video: move to nonworking.  (Closes: #1577)
      snes9x: bump PR
      pwlib: update SRC_URI, unify and clean-up.
      directfb: 1.2.7 has been superseeded.  Fix SRC_URI.
      bluez: document that hciattach-ti-bts.patch has landed upstream

Roman I Khimov (1):
      qemu 0.10.3: port OE patches, make preferable version

Bugs fixed:

bug_id resolution        short_desc
5078 FIXED       [patch] fix move wrong generated rpm name in
package_rpm .bbclass
913 FIXED        bitbake cache is broken on osx 10.4
2697 FIXED       Bitbake doesn't seem to retry access after lock
2773 FIXED       bitbake 1.8 svn: KeyError: type object 'C' has no
attribute '_append__mutable__'
2897 WONTFIX     bitbake should raise skippackage instead of parse
error when an svn repo is down
296 FIXED        quilt doesn't build under osx (and everything depends
from there
75 FIXED         sablevm-classpath-1.11.3.bb must add xtst to its
DEPENDS
637 WORKSFORME   Different gcc cross output dependent on host ARCH
ia32/amd64
825 FIXED        Alignment trap with samba + uclibc-soft
1196 FIXED       bitbake snes9x complains about missing -lqte
1200 INVALID     RFC: hciattach patch to turn BT radio on
1577 LATER       [DEPENDENCIES] Minisip-video depend on ffmpeg in
nonexisting version
1697 WORKSFORME  glibc-intermediate 2.4 fails to build on self-hosted
Angstrom due to rpcgen change
1856 DUPLICATE   RFE/RFC: strip -native from ${S}
1892 FIXED       Bitbake decides to not package stuff
2302 FIXED       exo not cross-compile safe
2311 REMIND      Openalchemy toolkit in Openembedded
2338 DUPLICATE   display-brightness.sh is missing
2397 FIXED       libmimedir package depends on -dev package
2412 FIXED       dpkg-deb failing when package name contains character
'/'
2479 FIXED       poptop seems to be missing files
2509 FIXED       flumotion is missing ihooks module
2540 FIXED       Asterisk 1.4.x recipe
2549 FIXED       Directfb attempts to use host vnc library
2550 WORKSFORME  imlib2 fails with impossible construc in asm
2690 FIXED       Script to make zaurus images usable
2713 FIXED       get rid references to temporary directories on installed system
2722 FIXED       Seppuku.bbclass triggers recursion error
2742 WONTFIX     test bug
2840 FIXED       gsmd startup script broken
3131 FIXED       zaurusd should rdepend on bl
3177 INVALID     Sepukku.bbclass can't attach logs anymore
3229 WONTFIX     upgrade path for gsmd broken
3267 FIXED       e-wm fails to start after install
3419 DUPLICATE   qmake2-native is broken due to target dependance
3421 DUPLICATE   Oops on boot
3422 FIXED       ERROR: task-base-dbg is listed in PACKAGES multiple times
3480 DUPLICATE   5500 hangs during boot
3499 FIXED       base-image unbuildable for some machines
3833 FIXED       getting OE ready for opkg and throw out ipkg
3847 FIXED       alsa-lib fails do_compile
3990 WONTFIX     SanDisk ConnectPlus not working correctly
4665 WONTFIX     madwifi-ng-r3837-20080802-autobuild
5124 INVALID     package-index-1.0-autobuild
5125 FIXED       lowpan-tools-git-autobuild
5127 FIXED       u-boot-2009.01-autobuild
4241 INVALID     Building an already completed package with bitbake
<packagename> automatically cleans and rebuilds.
5100 DUPLICATE   bitbake $recipe-$oldversion builds $recipe-$lastversion as well
5095 FIXED       build report pages should include target
1823 DUPLICATE   /etc/resolv.conf disappering
4472 FIXED       xfce-mcs-manager fails do_qa_staging
4572 DUPLICATE   xfce-mcs-manager.pc problem which leads to a QA error
4573 DUPLICATE   Exo package compilation fails
4575 FIXED       Incorrect SRC_URI in gnome_mplayer_0.5.3.bb
4594 DUPLICATE   qte-mt-static-2.3.10-r8 do_configure failed
4735 FIXED       introduce BPN (base package name) to simplify *-native recipes
4804 FIXED       Some more checksums missing
4990 DUPLICATE   Fix libsdl-qpe for autoconf 1.10
5008 INVALID     checksums doesn't contain valid sums for
addressbook-0.1: do_fetch failed
5014 FIXED       pidgin uses inexisting preferred version.
5062 WONTFIX     fso-console-image rootfs for a780 is not usable
5086 INVALID     libpcap-1.0.0 failed to install
5094 FIXED       please include link to bug tracker on individual packages pages
5104 DUPLICATE   creation of dependency-complete feed
5110 INVALID     ffmpeg build-depends on GSM stuff
2488 FIXED       Bitbake build for lcdproc
1463 WONTFIX     qte-mt-static: libqte.a not staged
4996 FIXED       Incorrect Rootfs
518 FIXED        [PATCH] tslib: work with different screen resolution

Bugs opened:

bug_id resolution        short_desc


