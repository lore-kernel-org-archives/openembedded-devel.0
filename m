Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T221e-0003mL-33; Thu, 16 Aug 2012 17:30:22 +0200
Received: by lban1 with SMTP id n1so1461462lba.6
	for <multiple recipients>; Thu, 16 Aug 2012 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZfURvxRHpCRTDRYh8HpwQLRTWGH3vStrLd/HU/UMRZg=;
	b=OQGFuLbcFbsbw+O6LNn1A6LhaipHPS44H19rIJBxrXjF2oYpHVjHZmM3C/Bzu+nW57
	GCBgg3Sqy0LhI+AkyQIYQaJyIemPjNSl3bzGRrSPXDADuyDw5vprAxS39KT/ifrmTmF7
	Ex3Vi+Qk5IwSOXirTDlyAPG08U07AvXYzg5rXPOx5nK/pFP12zxQoXQkX3uaNLCl30Lv
	T/m02JZKBfg9x9y8OuHKAT4LCTunJtn3B7dNjulacfY3izMLCM/EGvHY73CZY4+x2kmL
	ocuVn84egGahEOhK9uOyJy8bxqDf9kqlu/bkmMbrjGhdG/U2jK2328EYsLfhuFsehrgx
	4i4Q==
MIME-Version: 1.0
Received: by 10.152.102.137 with SMTP id fo9mr1628118lab.35.1345130303391;
	Thu, 16 Aug 2012 08:18:23 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Thu, 16 Aug 2012 08:18:23 -0700 (PDT)
In-Reply-To: <1345129661832.d55ecfab@Nodemailer>
References: <1345129661832.d55ecfab@Nodemailer>
Date: Thu, 16 Aug 2012 11:18:23 -0400
Message-ID: <CAOd_LFwYFHxUti-vX+QambR1y4MM++ohDCDNtUT9ZLH5woDWkg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-ti] OE Changelog since 2012-08-05 until 2012-08-12
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
X-List-Received-Date: Thu, 16 Aug 2012 15:30:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The OE Changelog is back.  Some time ago, I got several reports that the
changelog was missing entries.  I have since revamped the way dates are
handled and may have made things better (or worse).  The tool simply runs
git shortlog --since <date> --until <date> with the dates referenced.  This
should capture changes from Mon through Sun of that week.  The git shortlog
--since/until uses the commit dates, not the author date, so that may
explain some of the missing entries.  git log --format=3Dfuller can be used
to view commit dates.

If you still see missing entries, please send me the changeset hash and
repo, and I'll debug it.  If there are additional repos to include, please
let me know.

Thanks,
Cliff

On Thu, Aug 16, 2012 at 11:07 AM, <cliff.brake@gmail.com> wrote:

> Changelog since 2012-08-05 until 2012-08-12.  Projects included in this
> report:
>
> bitbake: git://git.openembedded.org/bitbake
> openembedded-core: git://git.openembedded.org/openembedded-core
> meta-openembedded: git://git.openembedded.org/meta-openembedded
> meta-yocto: git://git.yoctoproject.org/poky
> meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
> meta-micro: git://git.openembedded.org/meta-micro
> meta-slugos: git://github.com/kraj/meta-slugos
> meta-nslu2: git://github.com/kraj/meta-nslu2
> meta-intel: git://git.yoctoproject.org/meta-intel
> meta-handheld: git://git.openembedded.org/meta-handheld
> meta-opie: git://git.openembedded.org/meta-opie
> openembedded: git://git.openembedded.org/openembedded
> meta-bug: git://github.com/buglabs/meta-bug.git
> meta-efikamx: git://github.com/kraj/meta-efikamx.git
> meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
> meta-ettus: http://github.com/koenkooi/meta-ettus.git
> meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
> meta-igep: http://github.com/ebutera/meta-igep.git
> meta-netbookpro: git://github.com/tworaz/meta-netbookpro
> meta-xilinx: git://git.yoctoproject.org/meta-xilinx
> meta-chicken: git://github.com/OSSystems/meta-chicken
> meta-java: git://github.com/woglinde/meta-java
> meta-qt3: git://git.yoctoproject.org/meta-qt3
> meta-telephony: git://
> gitorious.org/sysmocom-openembedded/meta-telephony.git
> meta-eldk: git://git.denx.de/eldk.git
> meta-ti: git://git.yoctoproject.org/meta-ti
> meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
> meta-browser: git://github.com/OSSystems/meta-browser.git
> meta-mono: git://git.yoctoproject.org/meta-mono.git
> meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
> meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for bitbake:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded-core:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (14):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-openembedded:
>
> Andreas M=FCller (2):
>   systemd-systemctl-native: handle ALIAS tag
>   gdm: replace 'WantedBy=3Dgraphical.target' by
> 'Alias=3Ddisplay-manager.service'
>
> Franklin Cooper Jr (1):
>   ltrace: Fix make error
>
> Gary Thomas (2):
>   media-ctl: Fix build with latest automake
>   libxml++: New recipe - C++ bindings for libxml
>
> Horia Geanta (1):
>   strongswan: upgrade to version 5.0.0
>
> Khem Raj (6):
>   gitpkgv.bbclass: Add a symlink from meta-oe
>   testlab.bbclass: Delete
>   systemd: Upgrade to 187 tag
>   busybox: stopping systemd-kmsg-syslogd is not needed
>   busybox-syslog.service.in: Create alias for syslog.service
>   systemd: Use cross cpp
>
> Koen Kooi (4):
>   orc: update to 0.4.16
>   nodejs: update to 0.6.20
>   fuse: update to 2.9.1
>   sox: add 14.4.0
>
> Martin Ertsaas (1):
>   cpufrequtils: Use CC, LD etc. that comes from OE.
>
> Martin Jansa (14):
>   fbreader: drop machine overrides
>   emacs: rename TUTORIAL.ko to TUTORIAL.KO so it's not picked by
> package.bbcla
>   emacs: copy only needed stuff to qemu-treedir, not whole sysroot
>   phonet-utils: simplify with inherit autotools
>   sip: import from oe-classic and upgrade to latest
>   python-sip: import from oe-classic and upgrade to latest
>   python-pyqt: import from oe-classic
>   anki: import from oe-classic
>   systemd-compat-units: move list of disabled services to variable, fix
> hwcloc
>   mplayer2: enable speex
>   php: inherit pythonnative
>   php: add build-defs.h to SSTATE_SCAN_FILES it defines path to sysroot
> where
>   systemd-compat-units: use systemctl mask
>   systemd-systemctl-native: extend systemctl wrapper to support mask acti=
on
>
> Otavio Salvador (4):
>   libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
>   tiobench: fix aligned allocation method clash with newer glibc
>   postgresql: Fix redundant rpath for '/usr/lib'
>   postgresql: Fix packaging of static libraries
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-yocto:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (15):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   mesa: 7.11 -> 8.0.4
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-smartphone:
>
> Denis 'GNUtoo' Carikli (1):
>   meta-shr: 3rdparty: add ubx-utils uttilites for the om-gta02 machine.
>
> Martin Jansa (14):
>   meta-shr: systemd-compat-units: simplify
>   mesa: drop glamo patch
>   meta-smartphone: kernel recipes using MACHINE_KERNEL_PR now need to
> inherith
>   meta-shr, meta-openmoko: rename gpsd bbappends
>   shr-e-gadgets: bump PR after enlightenment upgrade
>   libphone-ui-shr: update for new elm APIs
>   shr-wizard: bump SRCREV to fix compatibility with python-elementary
> r71083 a
>   shr-wizard: bump SRCREV to fix compatibility with python-elementary
> r65604 a
>   shr-settings: bump SRCREV for newer EFL and remove now unneeded
> do_configure
>   meta-shr: libphone-ui-shr: fix runtime issues in phoneuid after
> EFL_SRCREV r
>   elsa: rename to entrance
>   libphone-ui-shr: bump SRCREV and drop local patches
>
> Simon Busch (5):
>   meta-samsung: samsung-modem-mgr: add initial recipe
>   meta-samsung: netbase: add specific network interface configuration for
> cres
>   Initial creation of the meta-android layer
>   Move all android specific recipes from meta-fso to meta-android
>   meta-fso: drop android utilities from fso-autorev.inc
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-micro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-slugos:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-nslu2:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-intel:
>
> Kishore Bodke (3):
>   meta-romley: Move Matrox MGA Xorg driver to meta-intel/common
>   meta-intel:Add a MATROX MGA variable to ia32-base.inc
>   meta-romley: Add Matrox MGA variable to romley.conf
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-handheld:
>
> Andrea Adami (1):
>   zaurus: fix jffs2 and ubifs images for collie
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-opie:
>
> Paul Eggleton (9):
>   snes9x: remove X11-based recipe
>   snes9x-sdl-qpe: use FILESEXTRAPATHS instead of FILESPATHPKG
>   kaffe: add missing patch from OE-Classic
>   libsdl-qpe: add missing patches from OE-Classic
>   gnuplot: remove
>   opie-taskbar-images: allow re-exec of do_install
>   libetpan: remove
>   opie-sysinfo: split out machine-specific images
>   task-opie-16mb: use 240x320 not 320x240 images
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-bug:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-efikamx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-gumstix:
>
> Andreas M=FCller (4):
>   linux-omap: defonfig add WLAN USB chips and add debug for libertas
>   linux-omap: defconfig compile UBIFS into kernel
>   linux-omap: fix ADS7846 init fault
>   linux-omap: update to v3.5
>
> Samuel Stirtzel (1):
>   overo.inc: Use the linux-firmware-sd8686 instead of
> marvell-sdio-fw_9.70.3-p
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ettus:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-fsl-ppc:
>
> Matthew McClintock (2):
>   u-boot: change UBOOT_MACHINES to use ?=3D so they can be overridden
>   update preferred version for linux kernel
>
> Zhenhua Luo (2):
>   fsl-image-lsb-sdk.bb: replace POKY_BASE_INSTALL with
> CORE_IMAGE_BASE_INSTALL
>   add NOR u-boot into the default build list of p1010rdb
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-igep:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-netbookpro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-xilinx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-chicken:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-java:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-qt3:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-telephony:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-eldk:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (15):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   mesa: 7.11 -> 8.0.4
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ti:
>
> Andreas M=FCller (1):
>   ti-dmai.inc: fix 'proto=3D'-warning on recipe parsing
>
> Koen Kooi (1):
>   u-boot 2011.09+git: update to latest version of Tom Rini's tree
>
> Roger Monk (3):
>   gstreamer-ti: convert proto to protocol in SRC_URI
>   am-sysinfo: switch 'proto' to 'protocol' in SRC_URI
>   u-boot_2011.09[.10rc]: Always use gnu ld for LD
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-angstrom:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-browser:
>
> Martin Jansa (2):
>   chromium-20: add unistd.patch which was used in 19*
>   mozilla: disable elf-hack
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-mono:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-raspberrypi:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-kde:
>
> Samuel Stirtzel (10):
>   task-kde-image: Remove redundant entry shared-mime-info
>   kdelibs4: Update to 4.9.0
>   kdelibs4-native: Update to 4.9.0
>   kde-runtime: Update to 4.9.0
>   kde-workspace: Update to 4.9.0
>   libkactivities4: Update to 4.9.0
>   nepomuk-core: Update to 4.9.0 to fix kde-runtime errors
>   plasma-active: Update to 4.9.0 to fix various issues
>   angstrom-kde-desktop-image: Temporary remove networkmanager
>   Update README
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com

