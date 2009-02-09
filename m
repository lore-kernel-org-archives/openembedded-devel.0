Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LWYJl-0005w5-OO
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Feb 2009 16:45:06 +0100
Received: by rv-out-0708.google.com with SMTP id f25so2247413rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Feb 2009 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=rKIjQOgQYMVWS598CLQFurKZPYJa+anzU26hvRiBjwE=;
	b=xrCaQs0h0dMl7x7/eNVS8OFk5Kdufk/07HYFpr/xcEXdM67wDxJssNhRUMJvFILWpp
	aqC5KCl/n1UkZ5daJJEq68vNUiL2ISZa0eyB13bQt1rG6lQfMBsz4lZHhN624On28Fab
	DWe4H4SdOphhPN5MzsIn4ETAtc8+DVN/eHG5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=F2Vs8o/WHsCFYX80KyxU2ZaqFdfaclmeErFnB0SOyQj8xIK1ZbFYfvu0r4fwaO90ei
	T2lD7TT6/vCC8uqvXbRwRgF/eA7EZ998Vz3zbzmjxRp+UDr7WdXGerCm6PNSf/vAJE6H
	fwsvUga1Lera4nuiZubC4K8O27so6Fd9HnwEM=
MIME-Version: 1.0
Received: by 10.140.174.11 with SMTP id w11mr1019397rve.83.1234194254086; Mon, 
	09 Feb 2009 07:44:14 -0800 (PST)
Date: Mon, 9 Feb 2009 10:44:14 -0500
Message-ID: <f96d234e0902090744w33047b0fscd5987bf57c58bc5@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-02-02 to 2009-02-09
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
X-List-Received-Date: Mon, 09 Feb 2009 15:45:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-02-02 to 2009-02-09

Andrea Adami (2):
      linux-rp-2.6.26: refresh defconfigs
      kexecboot: new recipe and refactoring

Bernhard Guillon (3):
      xqtlauncher: fix convert script and bump PR
      xqt2: fix segfault bump PR

Cliff Brake (1):
      checksums.ini: add checksum for pengutronix canutils

Denys Dmytriyenko (2):
      busybox: fix nfsroot issues with resetting IP and deleting routes

Frans Meulenbroeks (22):
      twisted: updated to 8.2.0
      Revert "twisted: updated to 8.2.0"
      gpgme: bumped PR to force recompile with newer postinst
      pciutils: upgraded to 3.1.2
      pciutils, fixed dynamic linking
      pciutils: one more fix for shared libs
      twisted: updated to 8.2.0
      ddccontrol: created package
      python-coherence: added dependency on python-twisted-core
      python-coherence: added dependencies
      python-coherence; updated to svn 1154
      coherence: removed DEFAULT_PREFERENCE =3D "-1" from svn version
      coherence: added dependency for python-twisted-pair
      python-coherence: added dependency to python-pygobject
      python-elementtree: created package
      python-gdata: added package
      python-coherence: added python-gdata dependency
      boost: fixed GNU_HASH QA errors; removed DEFAULT_PREFERRED =3D -1
      wt: updated to 2.2.3

Graeme Gregory (8):
      e-image.bb : remove non existing task
      wpa-supplicant_0.6.7.bb : add newest version
      connman_0.9.bb : add newest version
      linux-rp_2.6.24.bb : update defconfig for tosa to build hostap
      wpa-supplicant-0.6.inc : fix supplicant dbus service file name
      connman-gnome_0.4.bb : give non xdg/autostart users an icon to start =
the
      console-tools_0.3.2.bb : showkey needs to be u-d-a because also
supplied by
      gtk+_2.14.2.bb : libgailutil is now part of gtk+ so
REPLACE/CONFLICT/PROVIDE it

Ihar Hrachyshka (1):
      directfb-examples: Add 1.2.0

Jan L=FCbbe (2):
      netbase: for om-gta01/02 use allow-hotplug instead of auto
      preferred-om-2008-versions: update connman to 0.10

John Lee (1):
      sane-srcrevs.inc: use latest openmoko-toolchain-scripts for #2228.

Khem Raj (5):
      binutils-2.19.1: New recipe.
      eglibc: Always use ARM instruction set for compilation.
      checksums.ini: New checksum entry for depmod busybox-1.13.2-depmod.pa=
tch

Koen Kooi (91):
      gpe-mini-browser2: convert to SRCREV
      angstrom 2009.X preferred versions: bump pixman and busybox
      connman: add 0.10, the really newest version :)
      angstrom 2009.X preferred versions: bump wpa-supplicant
      opal: ARM_INSTRUCTION_SET =3D "arm"
      davinci-dvevm: remove preferred provider for xserver
      initscripts: make commit
b49e09758de7f29c049c12213347cb32fb64d7a4 apply to initscripts as well
      connman: fix udhcp packaging
      gnuplot: use gdlib from staging, not from host
      apr: beat its autotools into the 21 first century
      kexecboot.inc: fix thinko with _append missing a space
      kexecboot: if the 1337 installkit for kexecboot demands tar.gz
files, why not instruct OE to build them?
      linux-kexecboot.inc: update to match latest kernel.bbclass
      initramfs-kexecboot-image: fix dependency loop created in next commit
      kexecboot.inc: create kexecboot kernel on image build
      ffmpeg git: raise default pref for arm
      hal: apply gentoo patch to fix phy80211 problems with 2.6.27+
(https://bugs.gentoo.org/show_bug.cgi?id=3D246026)
      networkmanager: merge with mamona
      xf86-video-omapfb: add patch for armv7a to do pixel conversion
with NEON SIMD
      checksums: add more checksums
      dsplink: bump PR
      apr: bump PR
      task-beagleboard-demo: add picodlp-control
      e2fsprogs: use u-a for blkid as well
      base.bbclass: only error out on missing checksums when
OE_STRICT_CHECKSUMS is set * we want to error out on non-matching
sums, missing ones are less bad
      angstrom feed sorter: update feed browser as well when new
packages are found
      rt2x00: bump PR
      wpa-supplicant 0.6.7: fix dbus service file
      angstrom ewm config: RDEPEND on e-wm
      gumstix overo: add basic support to OE, based on gumstix repo
      xserver-xorg-conf: add overo support
      kexecboot: add 0.5
      linux-kexecboot*: bump PR for kexecboot upgrade
      libgles omap3: add recipe for upcoming 06 release
      angstrom feed builder: fix typo
      python-coherence: needs twisted at runtime
      gnome: first round of PR bumps for python 2.6 upgrade
      python-twisted: attempt to fix packaging
      checksums: add twisted
      python-configobj: add 4.5.3
      python-coherence: add python-configobj
      python-coherence: add more python modules
      angstrom autobuilder: cleanup and add overo, omap3-pandora
      angstrom feed builder: add python-coherence
      libgles-omap3: try to do proper versioning, fix init script
      connman-gnome: REDEPEND on connman
      connman-gnome: fix RDEPENDS
      libgles-omap3: the libs aren't machine specific
      clutter: add overo support
      checksums: add some more checksums
      python twisted: add native version
      python-divmod-epsilon: add 0.5.11
      python-nevow: add 0.9.32
      python-coherence: add python modules for webui
      divmod.inc: add missing file, thanks Frans!
      connman: update download url
      connman-gnome: fix SRC_URI and add patch to make it work on my networ=
k
      pixman: update NEON patch to fix alpha issues with 32bpp framebuffers
      task-beagleboard-demo: add connman-gnome
      connman: nothing in OE implements the at_console dbus
restriction properly, so change connman to allow generic access
      connman-gnome: rrecommend wifi and udhcp plugins
      angstrom-gpe-task-settings: add connman-gnome
      angstrom feed browser: switch to a more AJAX way of searching,
this makes it appear faster and integrates better with narcissus
      linux-handhelds: build in ext3 support for h2200 and hx4700
      h2200, hx4700: device table hack no longer needed
      apr-util: fix most libtool problems
      connman-gnome: more recommends
      angstrom feed browser: reindent
      angstrom feed sorter: update package browser before stripping source =
lines
      autotools_stage.bbclass: merge from poky
      apr + apr-util: merge from poky
      kexecboot: add 0.5
      checksums.ini: add more checksums
      linux-kexecboot kernels: more PR to .inc file since it's more
tied to the initramfs than the kernel
      linux-rp 2.6.24: enable more CF wifi drivers so XorA can get
online at fosdem
      checksums: add more checksums
      zziplib: fix build
      free-image: add 3.11.0
      libgles-omap3: stage more headers so GLES1 apps build as well
      libpcap: add bluez to depends
      libgles-omap3: provide virtual/egl
      ogre gles: add recipe to build an openGL|ES version of the ogre 3D en=
gine
      clutter-gtk: merge from poky
      libchamplain(-gtk): add 0.2.8
      busybox: update angstrom defconfig

Leon Woestenberg (1):
      rt-tests: Moved from 0.21 to 0.28.

Marcin Juszkiewicz (4):
      libxfont-native: do not provide xfont
      xorg-font: do not call 'fc-cache' during do_install
      sanity.bbclass: make a warning about dash being used as /bin/sh
(from Poky)

Marco Cavallini (1):
      packages/grub/grub_0.97.bb * Correct GRUB installation in
destination directory * added packages/grub/grub-0.97/menu.lst file

Michael 'Mickey' Lauer (6):
      bluez4: add compile patch fixing some usb declaration mismatch
      serial-utils: fix metadata and bump SRCREV
      fso-abyss: new recipe; next-generation user-space GSM 07.10 multiplex=
er
      python-*: unify SECTION, it's devel/python, neither python-devel
nor python/devel
      busybox 1.13.2: add latest set of patches for stable version
      fso-abyss: bump to 0.2.0 release version

Mike Westerhof (3):
      SlugOS: initscripts-slugos - fix cleanup step; no more
checkroot.sh to remove.
      SlugOS: initscripts-slugos - remove _all_ the references to checkroot=
.sh
      SlugOS: /sbin/sysconf - accomodate bugs in recent busybox ash,
fix a few typos

Philip Balister (1):
      nrlolsr : Add checksum so I can commit recipe later, without
forgetting checksum.

Roman I Khimov (1):
      byacc: Add target and native byacc packages

Stanislav Brabec (1):
      mumpot: Updated to version 0.4.

Stefan Schmidt (23):
      sane-srcrevs.inc: Bump frameworkd and zhone for the latest fixes
      fso-image: Add aliases for vim and ll. Finally.
      sane-srcrevs.inc: Bump fso stuff for fixes
      openmoko/Xserver: Add -mouse tslib for EZX
      fso-image: Fix ll alias
      sane-srcrevs.inc: Newer rev for frameworkd and zhone
      preferred-{gpe,om}-versions: Update to versions that are
available and used
      preferred-om-2008-versions.inc: Fix rest of the outdated versions
      ane-srcrevs.inc: Bump frameworkd to get gta01 ogpsd fix
      task-fso-compliance: Ship fso-monitord in the latest version
      fso-image: Ship paroli
      sane-srcrevs.inc: Bump zhone for TTFF display
      sane-srcrevs.inc: bump frameworkd for sound profile fix
      task-fso-compliance: Leave out connman-ethernet as it breaks the
usb ethernet setup
      numptyphysics: Remove xrandr calls from desktop file as they break xg=
lamo
      numptyphysics: Bump PR for xrandr and libpng change
      task-fso-compliance: Bump PR to really avoid
connman-plugin-ethernet in the image
      fso-image: Put vagalume into an enterprise distro condition as
it needs gst-mp3
      vagalume: Add dbus-x11 as RRECOMMENDS
      sane-srcrevs.inc: Bump for more frameworkd fixes
      e-wm: Add patch to disable illume screensaver for openmoko distro.
      linux-openmoko-2.6.28: Add 8 bug fixes cherry-picked from andy-tracki=
ng.
      sane-srcrevs.inc: Bump to newer fso-monitord rev

Thomas Kunze (7):
      linux-rp_2.6.26: remove jffs2_summary from collie defconfig
      angstrom build-feeds.sh: build kexecboot kernels
      kexecboot-cfg: add initial verion
      kexecboot: add kexecboot config file
      conf/machine: separate collie from zaurus-26.inc
      kexecboot.inc: add kexecboot-cfg
      linux-rp: remove packaging of kernel-cmdline

Tim 'timtim' Ellis (6):
      xfsprogs: Fix SRC_URI for this version, does not exist at sgi,
xfs.org or an angstrom mirror so use somewhere else.
      samba: Add volatiles config for samba, fixes logging issue, bump PR
      gdk-pixbuf-csource-native: Fix for build host with cups-config
in PATH - if this is present and the cups headers are not the build
breaks. We don't have a cups-native package so --disable-cups.
      checksums.ini: Add missing checksum for bftpd

Tom Rini (10):
      eglibc: Add DEPENDS +=3D gperf-native to both 2.9 and svn
      checksums.ini: Add squashfs3.3
      bonnie++: Add a patch for gcc-4.3 (needs string.h)
      task-sdk-bare: For 'GLIBC_PKGS' depend on virtual-libc-dev not glibc-=
dev
      directfb: Add 1.2.7
      insane.bbclass: Fix MIPS and GNU_HASH check.
      gdbserver: Add 6.8
      eglibc: Fix RPROVIDES of glibc-localedata-%s, add charmap gconv packa=
ges.

garren smith (1):
      updated jack to latest release and new download location and
added checksum for it

woglinde (2):
      dietlibc: introduce dietlibc to openembedded
      dietlibc: fix trailing white spaces

Bugs fixed:

bug_id resolution        short_desc
2891 FIXED       update udev - current version 118 has serious issues
1052 FIXED       Non optimal default keymap
2547 FIXED       Collie froze when setting clock
2873 FIXED       the sound driver in kernel 2.6.21 does not work on c7x0
3806 FIXED       Release 2007.12 c7x0 kernel is buggy
4160 DUPLICATE   flac-1.1.2-autobuild
4191 FIXED       c7x0 opie install to flash fails
4214 FIXED       Angstrom c7x0 wpa
4304 FIXED       c7x0 wont resume using linux-rp_2.6.23
4545 FIXED       [RFC] kexecboot on zaurus clamshells (c7x0
5006 FIXED       git server link is broken
3886 FIXED       udev-118 initscript is very inefficent


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


