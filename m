Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MDgSw-0007zW-JE
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 17:08:50 +0200
Received: by qw-out-1920.google.com with SMTP id 14so1644330qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2009 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=kQg/g2ECsLr/qIULjzDZt6alBqhGuGbvw/tggcS+zZ4=;
	b=S9ZYKzDlAxotEOM8wlhHpQUR0Lv+YHU8KgsLcpBi+jtrZr8MfWdTbBaboW0ds9MLjP
	pYgc6M5Jzs4mPYlVX7/hVoC0tD/6vH0Nq/UQOAdyTPL7WEBa52ayN9OuYBku4yPr2MdY
	xroOr3Tge9cL3xuMW8/91YhZm/0x0uyaG/wPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=f+AfPjopaW5Gh30UT3+ZtYkMW0OjxfiT88rwvAjR2SY0hsiV3HTW2Zd04F9kuwDTxL
	wu8SF4nuZv3tt6FiTDJgpBiN+OXoCsEdfv7ag65MmfqQwrhpxGmSSXmR8JUzFYSeQejT
	71HiSY4J8o1PgpCm38uFGfuETWBb4e9HnOEmI=
MIME-Version: 1.0
Received: by 10.150.195.6 with SMTP id s6mr12648927ybf.315.1244473161227; Mon, 
	08 Jun 2009 07:59:21 -0700 (PDT)
Date: Mon, 8 Jun 2009 10:59:21 -0400
Message-ID: <f96d234e0906080759q40afd1dau930f93999048fbd9@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-06-01 to 2009-06-08
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
X-List-Received-Date: Mon, 08 Jun 2009 15:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-06-01 to 2009-06-08

Andrea Adami (4):
      zaurus-2.6.inc: [tosa] wlan-ng is now inside the kernel for tosa
      zaurus-2.6.inc: FIX - collie doesn't need zaurus-updater in
      xserver-kdrive_1.4.0.90: fix AC_SUBST in configure.ac
      xserver-kdrive-imageon_1.2.0: fix AC_SUBST in configure.ac

Denis 'Gnutoo' Carikli (2):
      uclibc.inc : also exclude mips and mipsel from GNU hash.

Florian Boor (7):
      micro2440.conf: make matchbox penel look nicer with the big display
      TX27: Generate a better jffs2 and add hook for summary
information enabled jffs2.
      linux: Update Linux 2.6.28 defconfig for TX27. Move root to
'userfs' partition since the first 'rootfs' is too small to hold a
filesystem with GUI.
      gtk+: Provide gdk-pixbuf in order to avoid conflict with the
framebuffer gdk-pixbuf recipe.
      linux-mini2440: These can be used for both mini and micro2440
      u-boot: Add support for micro2440
      micro2440.conf: Merge in some bits from mini2440.conf, add
support for u-boot.

Graeme Gregory (1):
      mutt_1.5.19.bb : latest version of the mutt MTA with sidebar support

Koen Kooi (71):
      gnuradio: add hack to build a private copy of libusb (the gnarly
old one) and statically link that since gnuradio is using private
methods of libusb that libusb-compat won't provide
      udev: Allow standard users to access shared memory (from poky)
      dbus: start a bit earlier in the init sequence (from poky)
      connman: fix initscript and start earlier (but after dbus) (from
poky)
      librsvg: add 2.26.0
      clutter 0.9: add from poky
      clutter 0.9: fixup GLES backend
      startup-notification: add 0.9
      clutter-gst: add 0.9
      moblin: add nbtk, hornsey and bognor-regis
      busybox: put mountall in its own package
      util-linux-ng: put mountall in its own package, have it RRPLACE
busybox-mountall * this makes them parallel installable
      autoconf: add 2.63 with patches ported forward, disabled by
default
      libsndfile: add 1.0.20
      libsamplerate: update to 0.1.7
      libcanberra: sync with poky
      pulseaudio: add 0.9.15, sync with poky
      gnuradio: add deptask for the buildlibusb task
      distcc: fix startup by creating 'distcc' user
      xf86-video-displaylink: add 0.1 * this recipe is a mess because
upstream is a mess
      guile 1.8.5: remove -Werror
      linux-kirkwood: update to 2.6.29.4
      guile-native: depend on gettext-native
      task-beagleboard-demo: add linux-firmware files
      angstrom 2009.X: weakly assign xserver-xorg as default * images
can still pick kdrive if wanted
      linux-davinci git: update dm355-leopard defconfig
      firefox 3.0.1: make it go faster in 16bpp modes
      angstrom 2009.X: switch to autoconf 2.63 * update to a newer
pulseaudio as well
      angstrom feed sorter: add htcalpine and optimize db refreshes
      pixman git: update to 0.15.8, includes more NEON bits
      task-beagleboard-demo: 'kernel-modules' currently has all the
firmware already
      linux-davinci git: update to 2.6.30-rc7, drop vpfe patches in
favour of using the staging/vpfe branch
      enlightenment: bump SRCREV in anticipation of new snapshot
coming friday * systray is now part of e-wm, so adjust metadata * use
lib-glibc override now it exists * fix upgrade paths for eina * fix
upgrade paths for evas * fix upgrade paths for edje
      linux-davinci git: add OTG to dm355-leopard defconfig
      pixman git: add patches to fix NEON bugs
      gstreamer-ti: bump SRCREV to 225
      vim: fix u-a path
      glibc 2.6.1: bump PR for packaging changes
      linux-kirkwood: enable more features in defconfig
      u-boot git: bump beagle SRCREV * WARNING: the u-boot dudes
changes 'mmcinit' to 'mmc init', so update your bootcmd
      xf86-video-sisub: update to 0.9.1
      gpe-login 0.95: make gpe-theme-clearlooks RRECOMMENDS
      webkit: bump SRCREV
      clutter-0.9: fix build for gles2
      clutter-gst-0.9: fix build
      bognor-regis: bump SRCREV
      nbtk: bump SRCREV
      hornsey: fix build
      kernel-module-udlfb: update to 0.2.2
      xf86-video-display: update to 0.2 and remove hacks from recipe
      kernel-module-udlfb: fix SRC_URI
      midori: bump SRCREB
      fldigi: add 3.11.4
      swig: update to 1.3.39
      opencv: upstream moved to svn, update recipes
      task-beagleboard-demo: include gnome-bluetooth
      angstrom feed builder: add fldigi and xf86-video-sisusb
      angstrom 2009.X: prefer a newer usbutils
      x11vnc: add 0.9.7
      gnome-bluetooth: add git version (disabled by default)
      enlightenment: update a bunch of PVs to match SRCREV
      bluez4: update to 4.41
      obexd: update to 0.13
      alsa-state: disable dmix from angstrom, it creates way more
problems than it attempts to solve
      dttsp: add svn version
      webkit-git: bump SRCREV
      sdrshell: add svn version

Leon Woestenberg (6):
      linux-powerpc-fsl-git: New recipe for Freescale PowerPC Linux
kernel GIT tree.
      linux-powerpc-fsl-git: Add patch for missing MSI support in the
DTS.
      linux-power-fsl-git: Fix defconfig.
      linux-powerpc-fsl-git: Actually add the patch.
      nilfs-utils: user space tools for NILFS2 logging filesystem.

Lucian Ion (4):
      update cppunit version to 1.12.1
      update cppunit version to 1.12.1
      add log4cxx checksum
      add log4cxx recipes from apache

Lynn Lin (2):
      add myself entry
      delete .swp dirty file

Marcin Juszkiewicz (8):
      gcc 4.3.3: add ep93xx patches from Martin W. Guy
      ep93xx: use Maverick FP
      tune-ep9312: use flags from Martin W. Guy work
      tune-ep9312: ep9312 can run armv4t
      tune-ep3912: optimize with -O not -O2
      angstrom: no binary locales for ep93xx
      ep93xx: switch back to armv4t

Michael Smith (2):
      busybox: allow building when prefix is "", not "/usr".
      busybox: let update-alternatives create all symlinks, and use INC_PR

Michal Hrusecky (1):
      linux-hackndev: fixed SRC_URI

Michel Pollet (10):
      Base "machine" support
      Added support for u-boot git
      MINI2440: Kernel 2.6.30 recipe
      Small kernel defconfig update
      MINI2440: Bumped kernel version tag
      Removed evbug from default kernel
      MINI2440: Update kernel recipe to get 2.6.29.3
      MINI2440: Bumped Kernels version
      MINI2440: Bumped 2.6.30 recipe
      MINI2440: Updated kernel recipes

Phil Blundell (6):
      glibc-package: respect ${base_libdir}, don't admit .a files into
main library package
      sysvinit: allow /proc to be mounted without /etc/fstab
      base-files: eliminate bloat for micro distribution
      micro: eliminate some bloat

Philip Balister (2):
      checksums.ini : Add checksum for gnuradio-3.2
      gnuradio-3.2.0 : Add recipe for new release of gnuradio.

Ramax Lo (2):
      at2440evb.conf: Add AT2440EVB machine config.
      at2440evb.conf: Add AT2440EVB machine config.

Robert Nelson (1):
      linux-firmware: add recipes to package firmwares that used to be
in the kernel

Rolf Leggewie (7):
      atd: fix spelling of LICENSE
      zaurusd: fix spelling mistake in DESCRIPTION
      zaurus-installer: add collie support.  properly unbreaks collie
image build.
      util-linux-ng: add e2fsprogs-libs to DEPENDS.
      xorg-xserver: push a couple of patches upstream.
      xserver-xorg: drop unused miext_layer_shadow_h.patch against
code that was removed in 2005.
      xorg-xserver: update and document status of some more patches

Roman I Khimov (1):
      (e)glibc.inc: add minimal sane kernel versions, move from bitbake.conf

Stefan Schmidt (6):
      libefso: Sync package version
      essential-dialer: Sync package version
      sane-srcrevs: Update and add more swisscom revisions
      bubble-keyboard: Add swisscoms bubble-keyboard prototyp
      gridpad: Add swisscoms gridpad.
      intuition: Add swisscoms intuition prototype.

Tom Rini (2):
      python-native: Actually bump PR
      initscripts: Get rid of the vtmaster stuff, bump PR.

Bugs fixed:

bug_id resolution        short_desc
3010 INVALID     Can't build bluez-gnome-0.14-r1
5126 FIXED       util-linux-ng-2.15-autobuild
5131 FIXED       linux-kexecboot-2.6.24-autobuild
4686 INVALID     Bitbake does not recognize environment variables
2675 FIXED       libtool breakage in -dev package
4333 FIXED       omap1-linux-2.6.24 fails to build with gcc 4.3
4476 FIXED       smpeg fails do_configure
4478 FIXED       pkgconfig fails do_qa_staging
4479 FIXED       pidgin: ICQ-Server says: client too old
5064 FIXED       bluez-cups-backend_3.36.bb
5134 WONTFIX     Build Errors for AT91Bootstrap + u-boot
5139 DUPLICATE   libxml2.so: undefined reference to `gzopen64'
5143 DUPLICATE   gumstix-kernel-2.6.21 fails to build with gcc 4.3
5151 FIXED       zaurus-installer for collie

Bugs opened:
(I know, this is still broke)

bug_id resolution        short_desc


