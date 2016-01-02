Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC2D6FF9F;
	Sat,  2 Jan 2016 18:19:51 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so102539081wmf.0;
	Sat, 02 Jan 2016 10:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4ivpcL6zS2qZhh6pZtD6Zsem7JMMe9R3EF72v3xoJNw=;
	b=QXeiQE/sCjMk1Wqth3zF8zVYBjATpnt+IxPGyPZ2bkOZPFssW8nFyn24tqvmvW73YK
	fGjmS+Bu284UagbYpVI1+gWtmRa9hKmxUd7o7ztWnf0d7nSICErY94p5rM6kGPdA9CUk
	+87jzWwF7ZXkfBaN/H+7DOMnmIDRfIf7Rt2B3OtiT+2KeFhK48LNepF6FSiFm5fXYvkE
	3+WVQL6W8NL22tXAJsHXZo5Bs5Who7ZSrsRGTKLg6KIEU7WGN1wxGKnrFznRmo5W5ren
	qc9JipcuLC3cLLn9NBh9Oy2711PJ6ulFbUMrA7CZ/JjkdjD2mkkRrZnHlUlnuHii19cG
	5dDg==
MIME-Version: 1.0
X-Received: by 10.194.116.170 with SMTP id jx10mr85908814wjb.166.1451758790978;
	Sat, 02 Jan 2016 10:19:50 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Sat, 2 Jan 2016 10:19:50 -0800 (PST)
Date: Sat, 2 Jan 2016 19:19:50 +0100
Message-ID: <CA+chaQfGTBOqGyGq6S7fMbP8c9rdm+1cDrc===xA1kOF=+WGOQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2016-01-01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jan 2016 18:19:52 -0000
Content-Type: text/plain; charset=UTF-8

Many changes caused by gnutls upgrade, I'll start PNBLACKLISTing these
recipe next week.


There are also reports from test-dependencies at the end, you can see
failure logs for individual recipes there.


== Tested changes (not included in master yet) - bitbake ==
6fd310a world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
4045977 pulseaudio: add PACKAGECONFIG for lirc
6f302fe sstate-sysroot-cruft.sh: Extend the whitelist
1e81f78 scripts/create-pull-request: fix git request-pull syntax
67598b6 qemux86: Add identical qemux86copy variant for tests
b1d6dd0 report-error: Allow to upload reports automatically
094bfc7 tune-*: use mcpu instead of mtune for ARM tunes
cb27d5a arch-armv7ve: add tune include for armv7ve and use it from
cortexa7 and cortexa15
25d27a0 cortexa{7,15,17}: add VFPv4 tunes
21bc2b1 feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
9b6ccf2 feature-arm-{neon,vfp}.inc: refactor and fix issues
cd9516f arch-armv7a.inc: add vfpv4 support also to softfp and big endiand tunes
58175da arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for
tune-armv7atb-vfpv3, tune-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
5f7201e arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and
PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
3319dfc arch-armv[456]*.inc: improve indentation like armv7a
5750bfd arm/arch-arm*, tune-cortexa*, tune-thunderx.inc,
powerpac/arch-powerpc64.inc: Use normal assignment
9b5ebfc arch-armv7a, tune-cortexa*: improve indentation
9aba01b arch-armv7a, tune-cortexa*: improve comment VFP -> HF
8319632 arch-armv7a: add missing space before ?=
99f6520 tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
0338fd8 sanity.bbclass: add more information to error message about
TUNE_PKGARCH missing in PACKAGE_ARCHS

== Tested changes (not included in master yet) - meta-openembedded ==
91f1f79 cifs-utils: add PACKAGECONFIG for cifsidmap
8aace27 cifs-utils: add PACKAGECONFIG for pam
786e398 netmap-modules: fix build with kernel < 3.17
517c8b1 linux-yocto-tiny-kexecboot: upgrade to 4.1
ae87bf6 python-vcversioner: Error Fix for recipes depend on python-vcversioner.
870be62 polkit-gnome: remove unrecognized configure options
4bb9e38 libvncserver: fix PN -> BPN for multilib
84c77b0 iscsitarget: resolve build error if CONFIG_IPV6 config is not enabled
40082f6 contrib: print oldline within single quotes
a28e2fe contrib: add missing common OE variables
20002ed contrib: ensure that oe-stylize.py works with python versions < 3.0
9e770e1 dhcpcd: add recipe for dhcpcd
b45e251 libtalloc: fix SRC_URI
27aaede thrift: Add recipe for Apache Thrift.
7020a19 nodejs: cleanup and update
71fbca0 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
222b522 iperf3: fix build-deps qa warning
34b1f81 opencv: support machines based on oe-core tune-corei7.inc
9294356 opencv: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
2799f33 opencv: sort PACKAGECONFIG options
c4a5a5d OML: move license file from meta-oe to meta-webserver
46e37cc BSD-0-Clause: remove license file now included in oe-core
17bd1b4 crash: 7.1.2 -> 7.1.3
524c029 mime-construct: move from meta-networking to meta-perl
58c18cc hostapd: Fix source and build directory
7043d91 mpg123: add textrel to INSANE_SKIP
bb73e72 strongswan: install strongswan-swanctl systemd service by default.
a1ec098 strongswan: add configure patch fix for systemd
d75db7b strongswan: add additional PACKAGECONFIG flags
1415fbb VLC: depend on jpeg rather than libjpeg-turbo
65e5461 VLC: PACKAGECONFIG for new dependency on libvncserver
49adf62 kexec-tools-klibc: add explicit SRC_URI
a003fe6 python-tornado: move old version recipe from meta-oe to meta-python
93c885a python-pexpect: drop old version recipe
0d28636 apache2: Upgrade 2.4.16 -> 2.4.18
c70d573 Revert "libjpeg-turbo: remove recipe"
c14e4aa libjpeg-turbo: remove recipe
9736004 waf-samba.bbclass: add cross-answers option and files
e45cd8b waf-samba: enable parallel builds
33b0e96 samba: add PACKAGECONFIG for valgrind
9f77e37 samba: fix typo distinguishing between plain sysv init and lsb init
0355b44 lowpan-tools: add missing flex/bison deps
5aaf51d mime-construct: update runtime dependencies
80beb95 xl2tpd: fix warnings with gcc 5
542484f postfix: fix clean broken issue
9ec115e postfix.inc: fix start postfix failed while hostname is numeric
067d96d net-snmp: apply patch for cross-compilation
35a6732 ncftp: fix build failures with ccdv
7a33f29 iscsitarget: skip the arch test for kernel modules
eaaf285 iscsitarget: split the kernel module into separate package
033720e quagga: fix segment fault when stopping ospf6d
a97e0e0 netkit-ftp: fixed invalid symlink
f7c04bb ctdb: add dependency on libldb
73f3379 ctdb: add PACKAGECONFIG for libtdb
9732a92 cim-schema-exper: fix host-user-contaminated
f716b5b nbd: use BPN in Files
0dd2b7d wireshark: update SRC_URI link to sources
d078d09 libtdb: upgrade to 1.3.7
38b85a0 libldb: upgrade to 1.1.21
32330ff talloc: upgrade to 2.1.3
b1a57da libtevent: upgrade to 0.9.25
64f3415 samba: make cyrus-sasl optional
c338951 libtevent: rework dependencies for deterministic build
743a7c4 libldb: allow chosing ldap dependency instead of hard requiring it
5226454 talloc: rename to libtalloc and cleanup dependency mess
1acd017 postfix: premission of /var/spool/mail seems incorrect
d1d7bae tcpdump: add PACKAGECONFIG for libcap-ng

== Tested changes (not included in master yet) - meta-qt5 ==
4ecd9bb Revert "qtbase: fix Tartget typo"
e66978d qtbase: fix Tartget typo
c29c758 qt5: add extra path to qmlplugins

== Tested changes (not included in master yet) - meta-browser ==

== Tested changes (not included in master yet) - meta-webos-ports ==

== Tested changes (not included in master yet) - meta-smartphone ==
96a7810 meta-shr, meta-fso: drop nonworking recipes

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||
|-
||2016-01-01	||9	||14	||17	||3		||5		||15		||3		||27		||0		||20		||0		||1		||0		||0		||0		||
|}
http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2016-01-01 ==

INFO: jenkins-job.sh-1.7.0 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160102_090733.log

=== common (8) ===
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure
    * /meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb,
do_configure
    * /meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-support/iksemel/iksemel_1.4.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile

=== common-x86 (5) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb,
do_configure
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb,
do_compile

=== qemuarm (1) ===
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb,
do_compile

=== qemux86 (1) ===
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
do_compile

=== qemux86_64 (4) ===
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb,
do_compile_kernelmodules
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb,
do_compile
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb,
do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb,
do_compile

=== Number of failed tasks (40) ===
{| class=wikitable
|-
|| qemuarm 	|| 9	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20151230_012029.log//
|| http://errors.yoctoproject.org:80/Errors/Build/11082/
<http://errors.yoctoproject.org/Errors/Build/11082/>
|-
|| qemux86 	|| 14	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20151231_034754.log//
|| http://errors.yoctoproject.org:80/Errors/Build/11085/
<http://errors.yoctoproject.org/Errors/Build/11085/>
|-
|| qemux86_64 	|| 17	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160101_070300.log//
|| http://errors.yoctoproject.org:80/Errors/Build/11098/
<http://errors.yoctoproject.org/Errors/Build/11098/>
|}

=== PNBLACKLISTs (88) ===

=== QA issues (74) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||version-going-backwards
|-
||1	||unknown-configure-option
|-
||15	||textrel
|-
||20	||host-user-contaminated
|-
||27	||file-rdeps
|-
||3	||already-stripped
|-
||3	||build-deps
|-
||5	||libdir
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
invalid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
"OLD and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if
you want to use these modules with E18, then you need to update it to
git recipe fetching newer sources from
http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/enlightenment/modules/news.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want
to use these modules with E18, then you need to update it to git
recipe fetching newer sources from
http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
"depends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and
doesn't build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
"broken: switch to https://git.enlightenment.org/misc/entrance.git and
fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678.
invalid state name: 'defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi]
?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with
more strict ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
?= "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
?= "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
?= "broken at least since April 2013
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and
nobody complained, it's also replaced by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3]
?= "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
?= "CONFLICT: depends on libgweather3 which conflicts with
libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager]
?= "BROKEN: not compatible with current libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
?= "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
?= "BROKEN: fails to build, maybe missing dependency on
gnome-desktop-utils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends]
?= "does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity]
?= "BROKEN: doesn't build with B!=S"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc]
?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been
declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
?= "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander]
?= "BROKEN: fails to use SDL probably because libsdl-config was
removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp]
?= "BROKEN: doesn't build with B!=S (trying to install
rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
?= "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools]
?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails
to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools]
?= "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
?= "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66]
?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
?= "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=
"Not comatible with current nodejs 0.12, but upstream is working on it
for v3"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit]
?= "BROKEN: depends on old deprecated libopkg which is currently
disabled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra]
?= "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=
"BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
not build with distroless qemuarm as reported in 'State of bitbake
world' thread, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed
call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
?= "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends
on blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
?= "BROKEN, fails to build with gcc-5"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=
"BROKEN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb:PNBLACKLIST[qcanobserver-socketcan]
?= "depends on qwt-5 APIs"
meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb:PNBLACKLIST[qcanobserver]
?= "depends on qwt-5 APIs"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e]
?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such
file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=
"BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file
or directory"
meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb:PNBLACKLIST[qt-creator]
?= "BROKEN: fails to build with gcc-5 and conflicts with qt5-creator"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=
"qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
"does not build with distroless qemuarm as reported in 'State of
bitbake world' thread, nobody volunteered to fix them"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
?= "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework]
?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly
inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins]
?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
"Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]
?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNBLACKLIST[start-stop-daemon]
?= "BROKEN: fails because of gettext, partial fix is available here
http://patchwork.openembedded.org/patch/89867/"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp':
No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas]
?= "broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
"rdepends on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
= "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
?= "Depends on blacklisted packagekit"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc
from meta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and
doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't
really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't
really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and
doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] = "tries to
include whole downloads directory in /home/builder/poky :/"
conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
QA issues by type:
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already
stripped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already
stripped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File
'/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was
already stripped, this will prevent future debugging!
[already-stripped]


count: 5	issue: libdir
qtbase-dbg: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/echoplugin/plugin/.debug/libechoplugin.so
[libdir]
qtdeclarative-dbg: found library in wrong location:
/usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexampleplugin.so
[libdir]
qtmultimedia-5.5.99+5.6.0-alpha1+gitAUTOINC+ac1b772ec8:
qtmultimedia-dbg: found library in wrong location:
/usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
[libdir]
qtquick1-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimageproviderplugin.so
[libdir]
qtsensors-dbg: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/.debug/libgruesensor.so.1.0.0
[libdir]


count: 15	issue: textrel
corosync-2.3.5: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
gstreamer1.0-libav-1.6.2: ELF binary
'/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.6.2-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0'
has relocations in .text [textrel]
libav-9.18: ELF binary
'/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1'
has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
'/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
'/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary
'/tmp/work/armv5te-oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-split/matchbox-keyboard/usr/bin/matchbox-keyboard'
has relocations in .text [textrel]
qtwebengine-5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76: ELF
binary '/tmp/work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76-r0/packages-split/qtwebengine/usr/lib/libQt5WebEngineCore.so.5.6.0'
has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary
'/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0'
has relocations in .text [textrel]


count: 3	issue: build-deps
dhcpcd-6.9.4: dhcpcd rdepends on libudev, but it isn't a build
dependency? [build-deps]
rygel-0.26.1: rygel-plugin-media-export rdepends on libunistring, but
it isn't a build dependency? [build-deps]
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build
dependency? [build-deps]


count: 27	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package
chkconfig requires libnewt.so()(64bit), but no providers found in its
RDEPENDS [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package
chkconfig requires libnewt.so, but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate
requires libucsi.so()(64bit), but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate
requires libucsi.so, but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet
requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet
requires libdvbapi.so, but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package
dvb-scan requires libdvbapi.so, but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package
dvb-scan requires libdvbsec.so()(64bit), but no providers found in its
RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package
dvbtraffic requires libdvbapi.so()(64bit), but no providers found in
its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package
dvbtraffic requires libdvbapi.so, but no providers found in its
RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package
dvb-femon requires libdvbapi.so()(64bit), but no providers found in
its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package
dvb-femon requires libdvbapi.so, but no providers found in its
RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps
requires libdvbapi.so, but no providers found in its RDEPENDS
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps
requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS
[file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package
fakeroot requires /bin/bash, but no providers found in its RDEPENDS
[file-rdeps]
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in
package gupnp-dev requires /usr/bin/python, but no providers found in
its RDEPENDS [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package
libbonobo requires /usr/bin/perl, but no providers found in its
RDEPENDS [file-rdeps]
libmodule-build-perl-0.31:
/usr/bin/config@underscore@data_libmodule-build-perl contained in
package libmodule-build-perl requires
/tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl.real, but no
providers found in its RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package
whiptail requires libnewt.so()(64bit), but no providers found in its
RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package
whiptail requires libnewt.so, but no providers found in its RDEPENDS
[file-rdeps]
libnewt-python-0.52.18:
/usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python
contained in package libnewt-python requires libnewt.so()(64bit), but
no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18:
/usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python
contained in package libnewt-python requires libnewt.so, but no
providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui
contained in package networkmanager-nmtui requires
libnewt.so()(64bit), but no providers found in its RDEPENDS
[file-rdeps]
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui
contained in package networkmanager-nmtui requires libnewt.so, but no
providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109:
/usr/share/numptyphysics/convert.pl_numptyphysics contained in package
numptyphysics requires /usr/bin/perl, but no providers found in its
RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109:
/usr/share/numptyphysics/convert@underscore@all.sh_numptyphysics
contained in package numptyphysics requires /bin/bash, but no
providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd:
/usr/bin/memory-map.sh_ubx-utils contained in package ubx-utils
requires /bin/bash, but no providers found in its RDEPENDS
[file-rdeps]


count: 0	issue: version-going-backwards


count: 20	issue: host-user-contaminated
babiloo-efl-2.0.9-10: babiloo-efl:
/babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience:
/cinematicexperience/usr/share/cinematicexperience-1.0/content/images/qt_logo.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
debootstrap-1.0.67: debootstrap:
/debootstrap/usr/share/debootstrap/scripts/breezy is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
espeak-1.37: espeak:
/espeak/usr/share/espeak-data/mbrola_ph/es4_phtrans is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
firefox-addon-webconverger-20120228: firefox-addon-webconverger:
/firefox-addon-webconverger/usr/lib/firefox/extensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
logwatch-7.4.1: logwatch:
/logwatch/usr/share/logwatch/default.conf/logfiles/mysql-mmm.conf is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
monav-0.3: monav: /monav/usr/share/monav/images/directions/left.svg is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
numptyphysics-0.2+svnr109: numptyphysics:
/numptyphysics/usr/share/numptyphysics/org_level/L50_nautilus.nph is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
orrery-2.7: orrery: /orrery/usr/share/orrery/constellations/Andromeda
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qt5everywheredemo-1.0: qt5everywheredemo:
/qt5everywheredemo/usr/share/qt5everywheredemo-1.0/qml/QtDemo/images/tv.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qt5ledscreen-1.0: qt5ledscreen:
/qt5ledscreen/usr/share/qt5ledscreen-1.0/images/logo1.png is owned by
uid 3004, which is the same as the user running bitbake. This may be
due to host contamination [host-user-contaminated]
qt5nmapcarousedemo-1.0: qt5nmapcarousedemo:
/qt5nmapcarousedemo/usr/share/qt5nmapcarousedemo-1.0/content/images/arrow-right.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qt5nmapper-1.0: qt5nmapper:
/qt5nmapper/usr/share/qt5nmapper-1.0/content/images/switch_thumb.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtsmarthome-1.0: qtsmarthome:
/qtsmarthome/usr/share/qtsmarthome-1.0/qml/smarthome/components/tabwidget/VTabBar.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
quitbattery-1.0.0: quitbattery:
/quitbattery/usr/share/quitbattery-1.0.0/qml/QUItBattery/images/glass.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
quitindicators-1.0.1: quitindicators:
/quitindicators/usr/share/quitindicators-1.0.1/qml/QUItIndicators/images/dots_512.png
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/friedberg is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/radio is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/refreshtest is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 1	issue: unknown-configure-option
polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised
options: --disable-examples --disable-introspection
[unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


test-dependencies, complete log:

http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151228_025900.log


ERROR: 93 issues were found in these recipes:
android-image-utils-native cef3 chkconfig-alternatives-native chromium
compat-wireless-all core-image-rt core-image-rt-sdk
core-image-sato-dev core-image-sato-sdk core-image-testmaster
cryptodev-module dfu-util-native freerdp gnome-desktop gnome-panel
iksemel iscsitarget jasper libetpan libftdi lldpd ltp-ddt netmap
netmap-modules openlmi-networking openlmi-providers openlmi-storage
perf pidgin proxy-libintl pty-forward-native python python3 qwt-e
remake rsyslog rygel samba samsung-modem-mgr samsung-rfs-mgr shr-image
shr-image-all shr-lite-image snort synergy system-config-keyboard
vboxguestdrivers xf86-video-ati xf86-video-nouveau
xfce4-clipman-plugin


Summary: 14 tasks failed:
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb,
do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/iksemel/iksemel_1.4.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/cef3_280796.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb,
do_compile
Summary: There were 69 WARNING messages shown.
Summary: There were 24 ERROR messages shown, returning a non-zero exit code.
===== 2nd build to rebuild each recipe with every possible dep =====
Logs will be stored in test-dependencies/1451271541/2_max directory
Building recipe: android-image-utils-native (1/52)
Building recipe: cef3 (2/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/cef3_280796.bb,
do_compile) failed with exit code '1'
Building recipe: chkconfig-alternatives-native (3/52)
ERROR: Task 3 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb,
do_populate_sysroot) failed with exit code '1'
Building recipe: chromium (4/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb,
do_compile) failed with exit code '1'
Building recipe: compat-wireless-all (5/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb,
do_make_scripts) failed with exit code '1'
Building recipe: core-image-rt (6/52)
Building recipe: core-image-rt-sdk (7/52)
Building recipe: core-image-sato-dev (8/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/images/core-image-sato-dev.bb,
do_rootfs) failed with exit code '1'
Building recipe: core-image-sato-sdk (9/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/images/core-image-sato-sdk.bb,
do_rootfs) failed with exit code '1'
Building recipe: core-image-testmaster (10/52)
Building recipe: cryptodev-module (11/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb,
do_make_scripts) failed with exit code '1'
Building recipe: dfu-util-native (12/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb,
do_compile) failed with exit code '1'
Building recipe: freerdp (13/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb,
do_compile) failed with exit code '1'
Building recipe: gnome-desktop (14/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure) failed with exit code '1'
Building recipe: gnome-panel (15/52)
ERROR: Task 230
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure) failed with exit code '1'
Building recipe: iksemel (16/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/iksemel/iksemel_1.4.bb,
do_compile) failed with exit code '1'
Building recipe: iscsitarget (17/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
do_make_scripts) failed with exit code '1'
Building recipe: jasper (18/52)
Building recipe: libetpan (19/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile) failed with exit code '1'
Building recipe: libftdi (20/52)
Building recipe: lldpd (21/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb,
do_compile) failed with exit code '1'
Building recipe: ltp-ddt (22/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb,
do_make_scripts) failed with exit code '1'
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb,
do_configure) failed with exit code '1'
Building recipe: netmap (23/52)
ERROR: Task 106
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
do_compile) failed with exit code '1'
Building recipe: netmap-modules (24/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
do_configure) failed with exit code '1'
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb,
do_make_scripts) failed with exit code '1'
Building recipe: openlmi-networking (25/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb,
do_configure) failed with exit code '1'
Building recipe: openlmi-providers (26/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb,
do_configure) failed with exit code '1'
Building recipe: openlmi-storage (27/52)
ERROR: Task 105
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb,
do_configure) failed with exit code '1'
Building recipe: perf (28/52)
Building recipe: php (29/52)
Building recipe: pidgin (30/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile) failed with exit code '1'
Building recipe: proxy-libintl (31/52)
ERROR: Task 3 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb,
do_populate_sysroot) failed with exit code '1'
Building recipe: pty-forward-native (32/52)
ERROR: Task 11 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-fso/recipes-freesmartphone/serial-utils/pty-forward-native.bb,
do_deploy) failed with exit code '1'
Building recipe: python (33/52)
Building recipe: python3 (34/52)
Building recipe: qwt-e (35/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb,
do_compile) failed with exit code '1'
Building recipe: remake (36/52)
ERROR: Task 3 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb,
do_populate_sysroot) failed with exit code '1'
Building recipe: rsyslog (37/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb,
do_compile) failed with exit code '1'
Building recipe: rygel (38/52)
Building recipe: samba (39/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb,
do_configure) failed with exit code '1'
Building recipe: samsung-modem-mgr (40/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-samsung/recipes-bsp/samsung-modem-mgr/samsung-modem-mgr_git.bb,
do_configure) failed with exit code '1'
Building recipe: samsung-rfs-mgr (41/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr_git.bb,
do_configure) failed with exit code '1'
Building recipe: shr-image (42/52)
ERROR: Task 968
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile) failed with exit code '1'
Building recipe: shr-image-all (43/52)
ERROR: Task 4357
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile) failed with exit code '1'
ERROR: Task 982
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile) failed with exit code '1'
Building recipe: shr-lite-image (44/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-lite-image.bb,
do_rootfs) failed with exit code '1'
Building recipe: snort (45/52)
Building recipe: synergy (46/52)
Building recipe: system-config-keyboard (47/52)
Building recipe: vboxguestdrivers (48/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb,
do_make_scripts) failed with exit code '1'
Building recipe: xdg-utils (49/52)
Building recipe: xf86-video-ati (50/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb,
do_compile) failed with exit code '1'
Building recipe: xf86-video-nouveau (51/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb,
do_compile) failed with exit code '1'
Building recipe: xfce4-clipman-plugin (52/52)
Copying buildhistory/packages to test-dependencies/1451271541/2_max
Copying do_package logs to test-dependencies/1451271541/2_max/do_package/
===== 3rd or 4th build to rebuild each recipe with minimal dependencies =====
Logs will be stored in test-dependencies/1451271541/3_min directory
!!!Removing tmpdir "/home/jenkins/oe/world/shr-core/tmp-glibc"!!!
Building recipe: android-image-utils-native (1/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-android/image-utils/android-image-utils-native_git.bb,
do_configure) failed with exit code '1'
Building recipe: cef3 (2/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/cef3_280796.bb,
do_compile) failed with exit code '1'
Building recipe: chkconfig-alternatives-native (3/52)
Building recipe: chromium (4/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb,
do_compile) failed with exit code '1'
Building recipe: compat-wireless-all (5/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb,
do_compile) failed with exit code '1'
Building recipe: core-image-rt (6/52)
Building recipe: core-image-rt-sdk (7/52)
Building recipe: core-image-sato-dev (8/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/images/core-image-sato-dev.bb,
do_rootfs) failed with exit code '1'
Building recipe: core-image-sato-sdk (9/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/images/core-image-sato-sdk.bb,
do_rootfs) failed with exit code '1'
Building recipe: core-image-testmaster (10/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/images/core-image-testmaster.bb,
do_rootfs) failed with exit code '1'
Building recipe: cryptodev-module (11/52)
Building recipe: dfu-util-native (12/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb,
do_compile) failed with exit code '1'
Building recipe: freerdp (13/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb,
do_compile) failed with exit code '1'
Building recipe: gnome-desktop (14/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure) failed with exit code '1'
Building recipe: gnome-panel (15/52)
ERROR: Task 230
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb,
do_configure) failed with exit code '1'
Building recipe: iksemel (16/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/iksemel/iksemel_1.4.bb,
do_compile) failed with exit code '1'
Building recipe: iscsitarget (17/52)
Building recipe: jasper (18/52)
Building recipe: libetpan (19/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile) failed with exit code '1'
Building recipe: libftdi (20/52)
Building recipe: lldpd (21/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb,
do_compile) failed with exit code '1'
Building recipe: ltp-ddt (22/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb,
do_configure) failed with exit code '1'
Building recipe: netmap (23/52)
Building recipe: netmap-modules (24/52)
Building recipe: openlmi-networking (25/52)
Building recipe: openlmi-providers (26/52)
Building recipe: openlmi-storage (27/52)
Building recipe: perf (28/52)
Building recipe: php (29/52)
Building recipe: pidgin (30/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile) failed with exit code '1'
Building recipe: proxy-libintl (31/52)
ERROR: Task 3 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb,
do_populate_sysroot) failed with exit code '1'
Building recipe: pty-forward-native (32/52)
ERROR: Task 11 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-fso/recipes-freesmartphone/serial-utils/pty-forward-native.bb,
do_deploy) failed with exit code '1'
Building recipe: python (33/52)
Building recipe: python3 (34/52)
Building recipe: qwt-e (35/52)
Building recipe: remake (36/52)
Building recipe: rsyslog (37/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb,
do_compile) failed with exit code '1'
Building recipe: rygel (38/52)
Building recipe: samba (39/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb,
do_configure) failed with exit code '1'
Building recipe: samsung-modem-mgr (40/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-samsung/recipes-bsp/samsung-modem-mgr/samsung-modem-mgr_git.bb,
do_configure) failed with exit code '1'
Building recipe: samsung-rfs-mgr (41/52)
ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr_git.bb,
do_configure) failed with exit code '1'
Building recipe: shr-image (42/52)
ERROR: Task 968
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb,
do_compile) failed with exit code '1'
Building recipe: shr-image-all (43/52)
ERROR: Task 4357
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb,
do_compile) failed with exit code '1'
Building recipe: shr-lite-image (44/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-lite-image.bb,
do_rootfs) failed with exit code '1'
Building recipe: snort (45/52)
Building recipe: synergy (46/52)
ERROR: Task 7 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb,
do_configure) failed with exit code '1'
Building recipe: system-config-keyboard (47/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb,
do_compile) failed with exit code '1'
Building recipe: vboxguestdrivers (48/52)
Building recipe: xdg-utils (49/52)
Building recipe: xf86-video-ati (50/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb,
do_compile) failed with exit code '1'
Building recipe: xf86-video-nouveau (51/52)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb,
do_compile) failed with exit code '1'
Building recipe: xfce4-clipman-plugin (52/52)
Copying buildhistory/packages to test-dependencies/1451271541/3_min
Copying do_package logs to test-dependencies/1451271541/3_min/do_package/

Found differences:
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build
dependency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependency?
WARN: python: python-tkinter rdepends on glibc, but it isn't a build dependency?
WARN: python: python-tkinter rdepends on libpython2, but it isn't a
build dependency?
WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build
dependency?
WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build
dependency?
WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a
build dependency?
WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a
build dependency?
WARN: rygel: rygel-plugin-media-export rdepends on libunistring, but
it isn't a build dependency?
WARN: snort: snort rdepends on liblzma, but it isn't a build dependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode,
but it isn't a build dependency?
WARN: cryptodev-module: kernel-module-cryptodev rdepends on
kernel-3.19.5-yocto-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxguest rdepends on
kernel-3.19.5-yocto-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxsf rdepends on
kernel-3.19.5-yocto-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxvideo rdepends on
kernel-3.19.5-yocto-tiny, but it isn't a build dependency?

