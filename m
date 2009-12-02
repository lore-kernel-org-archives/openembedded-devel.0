Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ferrario.f@gmail.com>) id 1NFsxQ-0000EK-Qz
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 18:25:43 +0100
Received: by ey-out-1920.google.com with SMTP id 5so103128eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 09:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=MlZvQ8Wxk2bMlw6/SG9427N54K3r+V6u3nN2uVNpbOM=;
	b=ae+pJsgsAA2UqG4FAuxSeKGjDjKOAwcFMyGY6yHy7iB9xaOx3GWepo4zS2noIwqRUW
	ne5igOTZUdXOgctRW08WtUQmrh50O3utuRkvs9DaXa8yDJzaEvyJWPFbgkE9YfH9LAXB
	wFsQbzKAZxv+GcbBb90vnwE9t9mspyM8FPuNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n0AfmA08NBSYwIp2nUqkzlsltlLymbba6cZvpfFrqcBz196GezB1M5pA5cZMlgBvRN
	d3OX1b2jqFHhkHbvbIAUdLDd2A0Hczmo1AxLFpRMWqr6F5XUyoSIAMXe2K9iGJ7+wACd
	lVlxz2rTNyJHUq/yf9JJ3d+fL/fNRgwKyCvL8=
MIME-Version: 1.0
Received: by 10.216.89.206 with SMTP id c56mr125810wef.123.1259774646038; Wed, 
	02 Dec 2009 09:24:06 -0800 (PST)
In-Reply-To: <mailman.4137.1259606837.5853.openembedded-devel@lists.openembedded.org>
References: <mailman.4137.1259606837.5853.openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2009 18:24:05 +0100
Message-ID: <dc530dbf0912020924l266902fbkf6e5543c2db27895@mail.gmail.com>
From: fabio ferrario <ferrario.f@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: ferrario.f@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded-devel Digest, Vol 40, Issue 148
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
X-List-Received-Date: Wed, 02 Dec 2009 17:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear Phil and Marco,

thanks for your suggestions :

regarding the BBPATH, this is pointing to the right folder :
BBPATH=$OEHOME/openembedded:$OEHOME/build

Marco, I'll try your suggestion. It looks like the confs are related to the
Taskit boards, while I'll use it for the Beagleboard nd one EPIA VIA based
system. Are there particular parameters that need to be changed beside the
MACHINE?

Thanks

Fabio


On Mon, Nov 30, 2009 at 7:47 PM, <
openembedded-devel-request@lists.openembedded.org> wrote:

> Send Openembedded-devel mailing list submissions to
>        openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> or, via email, send a message with subject or body 'help' to
>        openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>        openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>   1. Re: kubuntu and opemembedded (Philip Balister)
>   2. Re: kubuntu and opemembedded (Marco Cavallini)
>   3. libiberty.a removed from /tmp/cross for -native packages?
>      (Leon Woestenberg)
>   4. OE weekly changelog 2009-11-23 to 2009-11-30 (Cliff Brake)
>   5. Re: cortex-a9 build failure at glibc (Khem Raj)
>   6. Re: nof/libgcc_s.so installed instead of libgcc_s.so on
>      powerpc (Khem Raj)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon, 30 Nov 2009 06:26:12 -0500
> From: Philip Balister <philip@balister.org>
> Subject: Re: [oe] kubuntu and opemembedded
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <4B13ABD4.7080604@balister.org>
> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
>
> On 11/30/2009 05:12 AM, fabio ferrario wrote:
> > I'm pretty much a newby in using both bitbake and openembedded but thing
> is
> > that I cannot get bitbake working my recipe out.
> >
> > I followed the 'official' guide
> > http://wiki.openembedded.net/index.php/Getting_started and eventually,
> after
> > sourcing the environment and adding bitbake to my path I see bitbake
> being
> > called properly (bitbake --help for instance) I see the recipe being read
> > (some fake statements are detected) but any time I try to bitbake
> something
> > (bitbake nano, bitbake console-image..) I am bounched back with
> >
> > NO RULE TO MAKE TARGET whatever my target is..
> >
> > any hint?
>
> Check BBPATH env var.
>
> Philip
>
> >
> > Thanks
> >
> > Fabio
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 30 Nov 2009 16:04:09 +0100
> From: Marco Cavallini <koansoftware@gmail.com>
> Subject: Re: [oe] kubuntu and opemembedded
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <4B13DEE9.5010603@gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> fabio ferrario ha scritto, Il 30/11/2009 11:12:
> > I'm pretty much a newby in using both bitbake and openembedded but thing
> is
> > that I cannot get bitbake working my recipe out.
> >
> > I followed the 'official' guide
> > http://wiki.openembedded.net/index.php/Getting_started and eventually,
> after
> > sourcing the environment and adding bitbake to my path I see bitbake
> being
> > called properly (bitbake --help for instance) I see the recipe being read
> > (some fake statements are detected) but any time I try to bitbake
> something
> > (bitbake nano, bitbake console-image..) I am bounched back with
> >
> > NO RULE TO MAKE TARGET whatever my target is..
> >
> > any hint?
> >
> > Thanks
> >
>
> Fabio,
> maybe you could refer to these instrucions too, maybe just to understand
> how to setup the system.
>
>  http://www.kaeilos.com/?q=download
>
>
> Cordiali Saluti / Kindest Regards / mit freundlichen Gr?ssen
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
>   Atmel third party certified consultant
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>      http://www.KoanSoftware.com
>
>
>
> ------------------------------
>
> Message: 3
> Date: Mon, 30 Nov 2009 18:04:59 +0100
> From: Leon Woestenberg <leon.woestenberg@gmail.com>
> Subject: [oe] libiberty.a removed from /tmp/cross for -native
>        packages?
> To: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Message-ID:
>        <c384c5ea0911300904n6e031f61me6f732ef1dff28b0@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hello,
>
> why is libiberty.a removed from /tmp/cross for -native packages during
> the pre-amble?
>
>
> i686-linux/pax-utils-native-0.1.19-r0/temp/log.populate_staging_preamble.26004:32:/home/leon/sandbox/nios2/openembedded/tmp/cross/nios2/lib/libiberty.a
> removed
>
>
> I'm tracking down an issue where one build from scratch has
> libiberty.a staged in cross, whereas in another build, it is gone...
>
> Thanks,
> --
> Leon
>
>
>
> ------------------------------
>
> Message: 4
> Date: Mon, 30 Nov 2009 13:11:37 -0500
> From: Cliff Brake <cliff.brake@gmail.com>
> Subject: [oe] OE weekly changelog 2009-11-23 to 2009-11-30
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <f96d234e0911301011n6dfa9cc3n272356a84412f051@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> OE weekly changelog 2009-11-23 to 2009-11-30
>
> Andrea Adami (2):
>  nandlogical: rework klibc statical recipe pointing to staged mtd headers
> ins
>  Revert "palmtop.bbclass: fix QA of plugins wrt packaging of -dbg files"
>
> Benjamin Schieder (2):
>  fltkclock, fltkhackdiet, fltkwwpointcal: new fltk apps from Benjamin
> Schiede
>  add package fltkcocktailbar
>
> Cliff Brake (2):
>  docs: fix type in Makefile
>  usermanual: add entries to .gitignore for ps, etc
>
> David-John Willis (5):
>  blueman: Add 1.21
>  libpam-base-files: Start to add default config files for libpam
>  shadow: Add version 4.1.4.2 and checksum.
>  sudo: Add 1.7.2p1 and enable PAM support by default in newer sudo builds.
> su
>  angstrom.inc: Add DISTRO_FEATURES = "pam" to Angstrom distro.
>
> Frans Meulenbroeks (3):
>  apache2: upgraded to 2.2.14
>  linux-kirkwood: added sound driver for openrd-client
>
> Graeme Gregory (3):
>  bluez4.inc : remove DISTRO hacks as they arent really needed its ok to add
> t
>  gcc-4.3.3.inc : replace objc patch with undamaged one from gcc-patches
>
> Henning Heinold (14):
>  uclibc: clean up uClibc for the new oe features mainly done Richard Purdie
>  libpam: fix building on uClibc
>  libvorbis: update to version 1.2.3
>  libogg: update to version 1.1.4
>  libtheora: update to version 1.1.1
>  uclibc: add O_CLOEXEC support needed for newer pulseaudio
>  pulseaudio: make compileable under uclibc again
>  eina: fix building on uClibc
>  mplayer: fix install for micro
>  proxy-libintl: fix install for micro and simply stage
>  mplayer-common: fix arch and install
>  guile-native: simplify the .inc file
>  gnome-games: fix sdl in configure.ac
>  libsdl-mixer: remove defpref -1 from version 1.2.10 because 1.2.11 is now
> de
>
> Jeremy Lain? (3):
>  sane-backends: remove ${sysconfdir}/sane.d/qcam.conf from conffiles
>  sane-backends: add version 1.0.20
>  linux.inc: create DEPLOY_DIR_IMAGE in do_devicetree_image
>
> Klaus Kurzmann (14):
>  e-wm_svn.bb: split ${sysconfdir}/xdg/menus/applications.menu into it's
> own p
>  sane-srcrevs-fso.inc: bump fsodeviced and others to get new alsa stuff
>  fsodeviced: adjust path in initscript - fsodeviced moved to /usr/sbin
>  task-shr-minimal: add e-wm-menu-shr
>  sane-srcrevs.inc: bump mokonnect to 112
>  sane-srcrevs-fso: bump rev for libframeworkd-glib
>  task-shr-feed: add fltkcocktailbar and babiloo-efl
>  phoneuid: conform with the recent changes in upstreams Makefiles
>  phonefsod: conform with latest autotools configuration changes in upstream
>  task-shr-feed: add make
>  sane-srcrevs-fso: bump fsodeviced to get the alsa player ringtone fix
>  python-phoneutils_git: fix DEPENDS
>  exhibit: fix SRC_URI - exhibit moved to OLD
>
> Koen Kooi (27):
>  pixman git: bump SRCREV to 0.17.3 and add support for overlapping blits
>  xserver-xorg: use overlapped blts, needs pixman support, hence not default
>  gcc 4.3.4: add objective-c patch for eabi and add a package for libobjc
>  gcc 4.3.3: fix patch and packaging
>  gcc 4.3.3: ...and bump PR
>  opkg-target,sdk: bump SRCREV
>  Angstrom: switch to opkg-nogpg-nocurl per RFC on the angstrom-devel
> mailingl
>  flac: new style staging
>  flac 1.1.2: fix for new style staging
>  webkit-efl: this is 1.1.11, not 0.1
>  eve: eve-themes is mandatory, so add it to RDEPENDS
>  angstrom-glibc: switch back to -O2
>  linux-omap 2.6.29: add smsc patches and update overo defconfig
>  angstrom feed configs: rrecommend opkg-nogpg-nocurl
>  angstrom-feed-builder: add more stuff
>  angstrom feed sorter: add more boards
>  angstrom task gnome: clean up package list a bit
>  libpam-base-files: polkit is provided by policykit itself
>  pkgconfig bbclass: also sed out bogus includes
>  inkscape: add 0.47
>  gnome-mplayer: fix typo
>  e-wm: stop RRECOMMENDING e-wm-menu e-wm-menu-shr: stop RPROVIDING it
>  checksums.ini: add gdm checksum
>  gdm: tweak do_install a bit
>  linux 2.6.24: add support for smartq5 device (machine.conf will follow
> later
>  e17: bump SRCREV and start adapting it to new-style staging
>
> Kristoffer Ericson (1):
>  Fix so package_tar yet again produces tar packages. This closes bug 5339.
> Th
>
> Liam Girdwood (1):
>  pulseaudio: add version 0.9.21
>
> Mario Domenech Goulart (7):
>  chicken-native: removed
>  chicken: added support for cross compilation with chicken
>  chicken: added support for INC_PR for chicken recipes
>  chicken: fixed installation dir
>  chicken, chicken-cross: added translator-cross.patch for chicken 4.2.0
>  chicken: Added recipes for chicken 4.2.10
>  chicken: path and dependencies fixes for chicken recipes
>
> Martin Dietze (8):
>  linux-mtx-[12]-2.4.27: support bash4 for oldconfig
>  conf/distro/nylon.conf: fixed some broken preferred versions
>  e2fsprogs-libs.inc: removed dependency to unsupported util-linux-ng for
> nylo
>  gcc-configure-common.inc: remove objc from the list of supported languages
> f
>  mtd-utils.inc: flexible handling of ${mtd_utils} in do_stage and
> do_install
>  opkg_svn.bb: added missing dependency to openssl to recipe
>  opkg-nogpg_svn.bb: link without `-Wl,--as-needed' for nylon
>
> Martin Jansa (14):
>  module-strip.bbclass: fix typo, last PKGDEST should be PKGD too
>  kernel.bbclass, linux.inc: move do_deploy task after do_package
>  kernel.bbclass: force do_deploy call before do_build
>  linux-openmoko: bump PR to get module_strip fix
>  task-shr-feed: add new packages fltkclock, fltkhackdiet, fltkwwpointcal
>  preferred-shr-versions: remove preferred version of pixmap, increase
> DEFAULT
>  shr.conf: merge minimal.conf to shr.conf directly, remove all
> preferred-xorg
>  fltk2: switch to build directly from svn, as that old snapshot is not
> availa
>  shr: use newer classpath and jamvm
>  babilo-efl: switch SRCREV -> SRCPV, formal change as bzr returns sortable
> re
>  shr: bump linux-libc-headers to 2.6.31, use EFL_SRCREV from sane-srcrevs
>  linux-openmoko-2.6.31: enable NFS and INOTIFY_USER for gta02
>  om-gta02: create also ubinized image from ubifs
>
> Michael 'Mickey' Lauer (11):
>  libnl2: change includedir to not step over libnl1; also convert to new
> stagi
>  sane-toolchain.inc: bump linux-userspace-headers to match with bumped
> eglibc
>  fsogsmd: no longer requires libxml2 nor broadband info
>  libfsoframework: add missing dependency on alsa-lib
>  vala: add 0.7.8.2 release
>  fsodeviced: explicitly enable the rfkill and canberra player plugins
>  fsodatad: new recipe; FSO data storage service fsomusicd: new recipe; FSO
> mu
>  fsolocationd: renamed recipe; source was fsogpsd
>  fsomusicd: add SRCREV
>
> Otavio Salvador (1):
>  Revert "chicken.inc: fix install and compilation issues"
>
> Richard Purdie (1):
>  uclibc-initial: Convert to us do_install for staging. 0.9.30.1 is tested
> and
>
> Robert P. J. Day (1):
>  usermanual: Update usermanual bitbake references to 1.8.18.
>
> Roger Monk (1):
>  Hawkboard: Add Hawkboard machine and kernel
>
> Sebastian Krzyszkowiak (1):
>  shr-autorev: add opimd-utils to AUTOREV
>
> Sebastian Spaeth (13):
>  navit: Do not set /proc/sys/vm/overcommit in an app launcher, especially
> not
>  calc: add v0.0.3 recipe
>  initscripts-shr: add glamoFIFOtweak to Xsession.d
>  sane-srcrevs.inc: bump 'calc' sane rev to latest release
>  initscripts-shr: remove runtime glamo tweak. Has been pushed into
> andy-track
>  sane-srcrevs.inc: bump linux-openmoko-shr-devel
>  bootchart-lite: Use mkdir rather than install in postinst.
>  babiloo-efl: add tar-based recipe in addion to _bzr variant.
>  babiloo-efl: don't prefer _bzr version over releases
>  task-shr-feed: add babiloo-efl, remove hermining.
>  babiloo: upstream changed SRC_URI
>
> Steffen Sledz (2):
>  u-boot-2009.03: fix flash layout for hipox machine
>  u-boot-2009.03: disable features to fit size requirements for hipox
> machine
>
> Steve Sakoman (6):
>  flac: disable xmms plugin since it breaks the build
>  gdm: update to 2.28.1
>  gnome-mplayer: bump SRCREV
>  gnome-system-monitor: fix typo
>  system-tools-backends: fix packaging
>  totem: don't disable python
>
> Thomas Zimmermann (15):
>  policykit: fix depends it requires intltool >= 0.36.0
>  xournal: add version 0.4.5 and include .desktop file from source. Fixes
> SHR
>  atd-over-fso: override RPROVIDES, RCONFLICTS and RREPLACE for -dbg and
> -dev
>  task-shr-feed: add transmission to the feed, fixes SHR bug #745
>  task-shr-feed: add xf86-input-tslib to the feed, with this TS can be
> calibra
>  obexd: add version 0.19
>  babiloo: new recipe
>  openttd: add version 0.7.4-RC1 and sound and graphic files from
> openttdcoop.
>  openttd: correct path for config file
>  scummvm: copy config from openmoko to shr
>  scummvm: update version to 1.0.0
>  neomis: new recipe
>  numberx: new recipe
>  task-shr-feed: add gtkmm, solves SHR bug #546
>  di: new recipe
>
> Bugs fixed:
>
> bug_id resolution        short_desc
> 3470 FIXED       bitbake doesn't work when using a x86_64 kernel with
> a 32bit userspace
> 1182 FIXED       Kernel modules are not stripped before they are packaged
> 1904 FIXED       glibc-intermediate build failure (icecc compile farm)
> 2393 FIXED       meta-toolchain/sdk does not build.
> 4203 FIXED       gcc-cross-sdk-4.1.2-r11: task do_compile fails if
> toolchain target exists
> 5149 FIXED       e2fsprogs-libs fails to compile for RELEASE
> 5339 FIXED       package_tar no longer produces packages
> 4179 FIXED       external toolchain generated by meta-toolchain
> depends on the original build location
>
> Bugs opened:
>
> bug_id resolution        short_desc
>
>
>
> ------------------------------
>
> Message: 5
> Date: Mon, 30 Nov 2009 10:42:51 -0800
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] cortex-a9 build failure at glibc
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> On Fri, Nov 27, 2009 at 3:37 AM, RK Raggit <rk.raggit@gmail.com> wrote:
> > hi folks,
> >
> > a strange internal compiler error pops up when i am compiling glibc. This
> is
> > my version -
> >
> > PREFERRED_VERSION_glibc ? ? ? ? ? ? ? ? = "2.6.1"
> > PREFERRED_VERSION_glibc-initial ? ? ? ? = "2.6.1"
> > I see the same error when i change the version to 2.9. This is the error
> log
> > -
> >
> > ****************************************************
> > ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a9
> > -mfpu=neon -mfloat-abi=softfp ../sysdeps/unix/sysv/linux/mq_unlink.c -c
> > -std=gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings
> > -fexpensive-optimizations -fmerge-all-constants -Wstrict-prototypes
> > -fomit-frame-pointer ? ?-I../include
> >
> -I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt
> >
> -I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi
> > -I../ports/sysdeps/arm/elf
> -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl
> > -I../ports/sysdeps/unix/sysv/linux/arm/eabi
> > -I../sysdeps/unix/sysv/linux/arm/eabi
> > -I../ports/sysdeps/unix/sysv/linux/arm/nptl
> > -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm
> > -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux
> > -I../nptl/sysdeps/pthread -I../sysdeps/pthread
> -I../sysdeps/unix/sysv/linux
> > -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
> > -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv
> > -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv
> > -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix
> -I../nptl/sysdeps/unix
> > -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi
> > -I../ports/sysdeps/arm/fpu -I../ports/sysdeps/arm/nptl
> > -I../ports/sysdeps/arm -I../sysdeps/wordsize-32
> -I../sysdeps/ieee754/flt-32
> > -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf
> > -I../sysdeps/generic -I../ports -I../nptl ?-I.. -I../libio -I. -nostdinc
> > -isystem
> >
> /home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.2.3/include
> > -isystem
> >
> /home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.2.3/include-fixed
> > -isystem
> >
> /home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
> > -D_LIBC_REENTRANT -include ../include/libc-symbols.h ? -DNOT_IN_libc=1
> > -DIS_IN_librt=1 ? ?-o
> >
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
> > -MD -MP -MF
> >
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o.dt
> > -MT
> >
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
> > ../sysdeps/unix/sysv/linux/mq_unlink.c: In function 'mq_unlink':
> > ../sysdeps/unix/sysv/linux/mq_unlink.c:50: error: could not split insn
> > (insn:TI 80 48 39 ../sysdeps/unix/sysv/linux/mq_unlink.c:43 (parallel [
> > ? ? ? ? ? ?(set (reg/v:SI 4 r4 [orig:135 ret ] [135])
> > ? ? ? ? ? ? ? ?(if_then_else:SI (ne (reg/v:SI 0 r0 [orig:133 ret.53 ]
> > [133])
> > ? ? ? ? ? ? ? ? ? ? ? ?(const_int -1 [0xffffffffffffffff]))
> > ? ? ? ? ? ? ? ? ? ?(neg:SI (reg/v:SI 0 r0 [orig:133 ret.53 ] [133]))
> > ? ? ? ? ? ? ? ? ? ?(const_int 13 [0xd])))
> > ? ? ? ? ? ?(clobber (reg:CC 24 cc))
> > ? ? ? ?]) 311 {*ifcompare_neg_move} (nil)
> > ? ?(expr_list:REG_DEAD (reg/v:SI 0 r0 [orig:133 ret.53 ] [133])
> > ? ? ? ?(expr_list:REG_UNUSED (reg:CC 24 cc)
> > ? ? ? ? ? ?(nil))))
> > ../sysdeps/unix/sysv/linux/mq_unlink.c:50: internal compiler error: in
> > final_scan_insn, at final.c:2553
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <URL:http://gcc.gnu.org/bugs.html <http://gcc.gnu.org/bugs.html>>
> for
> > instructions.
> > make[2]: ***
> >
> [/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o]
> > Error 1
> > ******************************************************
> >
> > glibc-initial seems to have built fine. I couldnt find any hints by
> > googling.
>
> glibc-initial does not compile much of code.
>
> >
> > Anyone seen something similar and could help out with some clues ?
> >
>
> This is gcc ICE. You could preprocess the file and provide commandline
> options and the preprocessed file.
> Secondly I also noticed that you are using gcc 4.2. It would be
> interesting to know if the same ICE happens
> with gcc 4.4. Btw. you would be better of using gcc 4.4 for new arm
> processors like cortex a9
>
> -Khem
>
>
>
> ------------------------------
>
> Message: 6
> Date: Mon, 30 Nov 2009 10:45:39 -0800
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] nof/libgcc_s.so installed instead of libgcc_s.so on
>        powerpc
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <19c1b8a90911301045i6934e415h9e2adb0f0f3ae82f@mail.gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> On Sun, Nov 29, 2009 at 5:15 PM, Jeremy Williams <jerm7861@yahoo.com>
> wrote:
> > Khem Raj <raj.khem <at> gmail.com> writes:
> >
> >
> >>
> >> Thanks. It might be problem in install section of our recipes.
> >> Can you post log.do_compile file
> >>
> >> Thx
> >>
> >> -Khem
> >
> > This is a bump. I am still seeing this issue. I'm assuming that the OP
> did not
> > provide a do_compile log which is why this thread died. I am willing to
> provide
> > the necessary information
>
> thanks that will help to diagnose it further
>
> but I have noticed that the problem does not exist in
> > the image directory when the gcc-sdk package is created. Is this file
> perhaps
> > included from some other package that gets installed to the rootfs?
>
> could be that its from one of intermediate gcc stages.
>
> >
> > -jeremy
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 40, Issue 148
> ***************************************************
>

