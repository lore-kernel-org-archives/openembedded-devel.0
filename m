Received: from [209.85.210.171] (helo=mail-yx0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MzuHQ-0006Ag-OC
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 17:36:20 +0200
Received: by yxe1 with SMTP id 1so3932459yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=dTG7YrV1eRKw5mrySqCm2iQgYYvv+Ped2DErRqkqwsA=;
	b=kb8vIxYOmESgo+2HT87O2tQx7pzlnqK7Nv3jQhPZEqprXkI8CwqN4k+7WoMKS+l0V5
	pogrEZKUabsAU3zv9ZkWp3St5QIo89bocSI370m2651X4fLFKlQ599m/G6iwN2tryKqM
	cMyqaJRHimRQGT+jmZjKKMod8Q/ndHLBbWePw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kOGxEkM3Wm+Fz2q/roKalvcmGHZ4Qznw4Bt71DvivbsiTpjQabjVGoeHxgqurJiDMu
	zTzPRuTM6hCTnVlC4oXh4zO9beMcTYrqqpLuvs/PF/R666stfhEE7WrYBlOFPSE2dV6b
	9CkswefemrpZLQV4SU6Wwo+D4nEAjTFMuuuKE=
MIME-Version: 1.0
Received: by 10.150.65.21 with SMTP id n21mr8371841yba.89.1255966515081; Mon, 
	19 Oct 2009 08:35:15 -0700 (PDT)
Date: Mon, 19 Oct 2009 11:35:13 -0400
Message-ID: <f96d234e0910190835v43897b00w61b3c827ed5483ec@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-10-12 to 2009-10-19
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
X-List-Received-Date: Mon, 19 Oct 2009 15:36:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-10-12 to 2009-10-19

Andrea Adami (2):
  kexecboot_git: bump to 8daf258fc5d1e5eb6127285c63d66f31f05cf80d. Bump PR
  kexecboot-cfg: add ICON tag in boot.cfg. Remove kernel-cmdline. Bump PR.

Denis 'Gnutoo' Carikli (2):
  htcdream: added machine configuration
  linux-msm7xxxx: added htcdream support

Denys Dmytriyenko (6):
  package.bbclass: export subpackage individual version, if different from =
mai
  external-toolchain-csl: auto-package CSL toolchain of any version
  angstrom: framework to select internal/external toolchain and brand (csl/=
gen
  angstrom: clean ups of the external toolchain support
  conf: restore glibc.inc, removed by mistake for external-toolchain suppor=
t

Florian Boor (3):
  unicap: add 0.9.7
  ucview: add 0.30
  checksums.ini: Add new unicap and some more.

Frans Meulenbroeks (4):
  openrd-client: added machine configuration
  linux-kirkwood: added 2.6.32-rc4 recipe
  angstrom build: added openrd-client
  cdstatus: updated to 0.97.01

Henning Heinold (2):
  lighttpd: put last 2 missing modules into RDEPENDS
  lighttpd.conf: cosmetic fix, removed some tabs

Jeremy Lain=C3=A9 (3):
  gconf-2.26.2: don't fail if polkit-policy-file-validate is missing
  linux-2.6.29: cleanup framebuffer driver for boc01
  linux-2.6.29: fix SPI initialisation on boc01

Khem Raj (7):
  sane-toolchain.inc: Compute uclibc based triplets correctly.
  gdb-7.0: Add new recipes which use gdb 7.0
  glib-2.0_2.22.1: Fix broken mc. Thanks zub for patch
  acpid-1.0.10: Add recipe and patches for version 1.0.10
  mono-2.4.2.3: Fix compilation issues.
  mono-xsp_2.4.2.bb: Add recipe for xsp 2.4.2
  binutils-2.20: Add recipes for 2.20 release

Koen Kooi (12):
  binutils-sdk: fix fallout of the strip-staic-libs thing
  dm355-{evm,leopard}: put dm355 SoC variables in a shared include file
  TI recipes: make use of factored-out dm355 variables
  gnome: start cleaning up gconf providers
  angstrom: bump mesa and dbus
  angstrom: bump mesa
  efl: bump SRCREV
  angstrom toolchains: fill in empty files
  checksums.ini: update entry for libxml-twig-perl
  gnome-system-tools: add nautilus to depends
  checksums: add gammu checksum
  omap3 sgx modules: make proc interface patch use proper kernel version ma=
cro

Leon Woestenberg (4):
  linux-powerpc-fsl: Add defconfig for calamari.
  agg-2.5: Fix typoin CFLAGS. Provide X paths to configure.
  gnash-0.8.5: Fix an upstream case-typo in the configure script.
  gnash: Add gnash-fb 0.8.5, gnash for framebuffer devices.

Marco Cavallini (4):
  Added recipes/wxwidgets/wxwidgets-2.8.10/gsockgtk-cpp-wx2810.diff
  Modified recipes/wxwidgets/wxwidgets_2.8.10.bb due to build failure
  linux-2.6.28: added IPv6 support in kernel options for ronetix-pm9263/def=
con

Otavio Salvador (2):
  xvidtune: include app-defaults otherwise it fails to run
  firefox-addon-full-fullscreen: add 3.3

Philip Balister (4):
  gnuradio_svn.bb : GNU Radio is now maintained in git.
  gnuradio : Newer versions of GNU Radio will not need to build private
  gnuradio : Add recipe to build GNU Radio from git.
  wxwindows : Update license information.

Robert Schuster (1):
  gnumail 1.1.2: Use fixed java and javac paths.

Stanislav Brabec (3):
  gconf: Install missing PolicyKit file. Use upstream dbus files. Recipe si=
mpl
  gammu: Updated to version 1.26.1.
  python-gammu: Recipe removed. Now built as part of gammu recipe.

Stefan Schmidt (3):
  palmpre.conf: Don't recommend sgx modules for now.
  u-boot_git: Give a random sane SRCREV to get uboot build for Palm Pre
  linux-palmpre: Override LOCALVERSION again to stay close to the original =
pal

Steffen Sledz (1):
  linux-2.6.24: add some more usb-nic kernel modules for hipos machine

Steve Sakoman (19):
  gnome-system-tools: add 2.71.1
  gnome-keyring: add 2.28.0
  gnome-utils: add 2.28.0
  networkmanager-openvpn: add 0.7.1
  task-perl-module-all: add a task that includes all perl modules
  dbus: Add recipe for version 1.2.3
  libnet-dbus-perl: add 0.33.6
  gedit: add 2.28.0
  sound-theme-freedesktop: add 0.7
  gnome-menus: =D0=B0dd 2.28.0.1
  gnome-media: add 2.28.0
  checksums.ini:  add entry for libnet-dbus-perl
  gnome-panel: add 2.28.0
  gnome-session: add 2.28.0
  libgweather: add 2.28.0
  gnome-system-monitor: add 2.28.0
  gnome-terminal: add 2.28.0
  vte: add 0.21.5
  gnome-themes: add 2.28.0

Tom Rini (3):
  libatomic-ops: Add MIPS support, from gentoo
  Use LDFLAGS not CFLAGS to add libraries for linking
  pidgin: Add libidn to DEPENDS, bump INC_PR

Bugs fixed:

bug_id resolution        short_desc
5301 FIXED       libvorbis configure.in hardcodes -cpu=3D750 for powerpc

Bugs opened:

bug_id resolution        short_desc


