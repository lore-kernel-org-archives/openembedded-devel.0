Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LKB7h-0003fm-65
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 13:33:29 +0100
Received: by rv-out-0708.google.com with SMTP id f25so8884289rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2009 04:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=t2j9gfaFS9/i5650Su4trOILPapbS5y8QP98Y2m2pHI=;
	b=tYPIbeLA3vONwPWGVA0uw59xu3knlJP5GTnTpGgG6A0YjPe1C6I/FdRtMUjImaRl2P
	tvVkPmjxqxZXZXmyVpgsjsOnUpR1tiAzwJ5lO/uaMyBtUPhOXEgwJFA7z+jcDasG4x1U
	ey2soakCNTXVXwGMrl3yUx0XXqbzlb5yX2a/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=xFC3R+HQqxEehGAZdzunn/SjZRRfL06tRsF4LvYX4NVBJjs1QBbgwT6Z4bL57iNDfz
	tDgo0cUe1dEgKl7OLkLQqweOrWfOXAUmDMwmvcg6RvrKb5cZLVZB25B2aTvlkv9GWS1Z
	Fw0HTdjSkdhkic+8gHedenuJCuM7KfxtBauzw=
Received: by 10.140.247.13 with SMTP id u13mr10905906rvh.288.1231244848643;
	Tue, 06 Jan 2009 04:27:28 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Tue, 6 Jan 2009 04:27:28 -0800 (PST)
Message-ID: <f96d234e0901060427w6032ec4n732d42ef183bb4a@mail.gmail.com>
Date: Tue, 6 Jan 2009 07:27:28 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-12-29 to 2009-01-05
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
X-List-Received-Date: Tue, 06 Jan 2009 12:33:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OE weekly changelog 2008-12-29 to 2009-01-05

Elena Grandi (4):
      python-docutils 0.5: new recipe
      checksums.ini: added entry for python-docutils 0.5
      python-sphinx 0.5.1: new recipe for the python documentation generator
      checksums.ini: added entry for python-sphinx 0.5.1

Gregoire Gentil (1):
      abiword: add meta-package for abiword-plugins

Holger Hans Peter Freyther (1):
      illume-theme-asu: Build revision 4881 of the theme to change the
boot screen

Khem Raj (5):
      usbutils_0.73: Add new recipe
      checksums.ini: Add bluez-4.24 and usbutils 0.73
      binutils_2.18.50.0.7.bb: Add fix for PR 7093
      uclibc_0.9.30: Remove ldso_hash patch

Koen Kooi (40):
      linux-omap: add recipe for 2.6.28
      linux-omap git: update to 2.6.28
      angstrom 2008.1: remove opkg and opkg-collateral,
rootfs_ipk.bbclass already takes care of those for us
      angstrom feed configs: create arch.conf
      linux-omap 2.6.28,git: update beagleboard defconfig
      gupnp: add gupnp and gssdp from poky and update to latest release
      vala: enable vapigen
      ffmpeg: bump SRCREV for svn and git versions
      gupnp-vala: first attempt at a recipe for gupnp vala bindings
      gupnp-vala: fix staging and license
      gupnp-av: add 0.2
      gstreamer: add 0.10.21
      libgee: update to 0.1.4, fix staging and fix -dev package
      checksums: add libgee
      xserver-common: add workaround for xmodmap problems with kdrive 1.4+
      glib-2.0: fix path to perl in glib-mkenums
      lirc modules: add 20081230 cvs version
      mythtv 0.21+fixes: update srcrev
      glib.inc: add || true after sed
      codec-engine: fix SRC_URI
      base-files: change c7x0 and akita fstab to get rootfs mountpoint
from kernel
      bluez-utils 4.24: move to bluez4-utils since it's incompatible
with the regular bluez-utils
      e17: add flame, rain, news and places modules
      angstrom feed builder: add more e17 modules
      angstrom 2008: bump to 2009 internally, the file is still called 2008
      angstrom feed builder: add armv5teb
      dsplink, codec-engine: put include files in one include and
change build depending on source layout
      dsplink: remove dsplink-module from DEPENDS
      dsplink: find -delete isn't supported by findutils 4.1.x
      checksums.ini: add libmodplug
      dsplink: change find | xargs to find -exec
      dsplink, codec-engine: fix dsplink packaging:
      gstreamer-ti: add skeleton for TI gstreamer plugins
      libgles omap3: use insmod in initscript instead of modprobe to
avoid segfault
      linux-omap 2.6.27: enable bc_example for beagle and turn on sgx debugging
      clutter: add recipe to build from the 0.8 release branch
      libgles-omap3: work around SDK bugs in packaging
      clutter-box2d: bump PR for clutter change
      linux-omap 2.6.27: increase DMA size for beagleboard

Leon Woestenberg (1):
      rt-tests-0.21: Upstream package changed (!). New checksums.

Michael 'Mickey' Lauer (13):
      sane-srcrevs.inc: bump EFL srcdate
      sane-srcrevs.inc: bump linux-openmoko-devel
      linux-openmoko-devel: patch the stock defconfig to introduce our changes;
      sane-srcrevs.inc: bump frameworkd[-devel] and zhone
      dbus-hlid: new recipe; a high level dbus introspection daemon
      dbus-hlid: s/vala/vala-native/
      sane-srcrevs: bump dbus-hlid to 0.9.0
      task-fso-compliance: dbus-hlid is now an essential part of FSO
      fso-image: remove autostart of gpsd
      task-cli-tools: ship screen
      libmodplug: update to latest stable version 0.8.4
      python-elementary: new recipe; python bindings for the
elementary widget set (EFL)

Mike Westerhof (6):
      SlugOS: slugos-packages: demote cyrus-*; victims of eabi transition.
      SlugOS: conf files - switch to EABI and newer toolchain
      slugos-packages.bb: replace libusb with libusb1 and libusb-compat
      ftpd-topfield.bb: fix pathnames in usb-header-name-2-6-23.patch;
workdir confusion.
      libusb: create dummy libusb version to pull in libusb-compat instead.
      cdparanoia: Disable parallel make for this package

Stanislav Brabec (6):
      gpsbabel: Updated to version 1.3.6.
      libdevice-serialport-perl: New perl library.
      libtimedate-perl: New perl library.
      mtkbabel: New package for MediaTek GPS chipset manipulation.
      tk-native: Reordered lines to fix dependencies.
      openvpn init script: Ensure that tun module is loaded.

Stefan Schmidt (2):
      linux-openmoko: Disbale the evbug module. Bump OEV and reset PR.

Steve Sakoman (4):
      gimp: remove extra gdk-pixbuf-csource-native from DEPENDS
      guile-native: don't allow configure to specify "-Werr", otherwise
      nautilus: fix broken dependency on orbit2-native
      python-native: ensure that python has zlib support by adding
zlib-native as dependecy

Tick Chen (1):
      opkg: Bump up opkg to latest versions 0.1.6  R194

  Bugs fixed:

bug_id resolution        short_desc
3611 FIXED       error fetch git repo linux-hnd
4952 FIXED       packages/u-boot/u-boot_git.bb git fetch fails
4953 FIXED       packages/mtd/mtd-utils-native_1.0.0+git.bb
4955 FIXED       u-boot_git.bb for BeagleBoard machine do_fetch problem
4918 FIXED       x11 default keymap wrong on Zaurus

Bugs opened:

bug_id resolution        short_desc


-- 
=======================
Cliff Brake
http://bec-systems.com


