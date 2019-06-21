Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 14FC17E7E6
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 13:46:49 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id y57so6962220qtk.4
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=InxHHitLnixp2yX9qcFSEXha+pdiHb10UnBZbbsDE4Y=;
	b=V0TaE8vkcutD2BBjQoZomDYVnm7E6M3gtJ0WuJ6yfpnQqWty9HqS9iOcu81YwapyaD
	2HQoSZJsekpI2lTxf424a0foHytJqZeJ9FSEDcvXtUcPWjqo49Lu7wZ3e1KgUoM5DyAz
	pjawrlOLWLNjpk+/lchNCUQyacaLSqKp+9oGHkPhr25hmGqFtusXwgje9faXHlOOKlck
	yttLYHFaUSr79eyI0sOog/H0aimdUETWJ4qkZKkcn/uDEQl5tLn3m6uTZekr70WeuJLP
	XjqW1pKM2f439hlLIyQy8rIvLgMQmSlEeZVhYU71cp25v3/cf7hCXaiQjPgDvt8vFqEV
	mnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=InxHHitLnixp2yX9qcFSEXha+pdiHb10UnBZbbsDE4Y=;
	b=FTrQTejRqqyCk2UCMnw4KFWtweiPc0o136GsCg4brBifrLsxuB6hJ+PYedS/IKL8P3
	fbRy8RSdQjCJBiWPEKG+6zUn3dIGYfNA3CBtOa1tpKLZHA3EWJ2nS3bNj8i34ruNOOAW
	+A6OyLzCDw347RIfwG8XZvp0USpn0rlcI2E1wl/ifJt6aW2fi8DY1aFHs42N8ttbzSRz
	tJQQJ815ALlKyshrS0rl+/N5GoEs4L0WI9GZKGKmphVbls//5PaRSNwU2aoQzAcXOVaz
	E+bPGxgWt0yQbZheF539xS2+5O3I8T4Ad02XqN3tr7Q3PakuDVNgt8kaBUEtWu43xvg4
	9EKA==
X-Gm-Message-State: APjAAAXB6L6F7tqp1DbXCObwe5ur/MzHxnRcLCOSBss2cxXRJBM5gMz4
	/QfvKMJVf6sf2JdP+7HcLlzEuuGVvPMIgKfsV6Nh3+ky8Q4=
X-Google-Smtp-Source: APXvYqxjMgLrki/lP6FVXU0PLNfCQxsxBSA5Ip26RMqWXGh0o1MmiDFEc07E4qTkKQ+3qrjhsbLxCPLdyonivm3AGLw=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr44713683qvc.65.1561124810178; 
	Fri, 21 Jun 2019 06:46:50 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jun 2019 07:46:24 -0600
Message-ID: <CAMKF1sq9A588GMOHSQQMiSHLqxHJQvBs+Ts0P0XA8DFVoo1FxA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of OE World, 2019-06-19
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
X-List-Received-Date: Fri, 21 Jun 2019 13:46:50 -0000
Content-Type: text/plain; charset="UTF-8"

After a while now jenkins builds are working again. here are latest
run results for details check
https://www.openembedded.org/wiki/Bitbake_World_Status_Zeus

== Failed tasks 2019-06-19 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190621_062638.log

=== common (2) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (10) ===
    * sources/meta-browser/dynamic-layers/rust-layer/recipes-browser/firefox/firefox_60.4.0esr.bb:do_compile
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.90.bb:do_compile
    * sources/meta-freescale/recipes-kernel/kernel-modules/kernel-module-qca6174_2.1.bb:do_compile
    * sources/meta-freescale/recipes-kernel/kernel-modules/kernel-module-qca9377_2.1.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
    * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/rust_1.34.2.bb:do_compile
    * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa

=== qemuarm64 (5) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-core/safec/safec_3.4.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_package_qa

=== qemux86 (7) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_75.0.3770.90.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.34.2.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (39) ===
{| class=wikitable
|-
|| qemuarm || 12 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190618_213721.log/
||
|-
|| qemuarm64 || 13 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190619_114514.log/
||
|-
|| qemux86 || 11 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190618_213711.log/
||
|-
|| qemux86_64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190619_092706.log/
||
|}

=== PNBLACKLISTs (2) ===

=== QA issues (2) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||qa_pseudo
|-
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||0 ||version-going-backwards
|-
||1 ||host-user-contaminated
|-
||1 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190620_024235.log/


    * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in
/home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
sources/meta-96boards:
sources/meta-atmel:
sources/meta-browser:
sources/meta-freescale:
sources/meta-freescale-3rdparty:
sources/meta-intel:
sources/meta-odroid:
sources/meta-openembedded:
meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
= " error: invalid use of incomplete type 'RCF::AsioIoService {aka
class boost::asio::io_service}; among others?"
sources/meta-qcom:
sources/meta-qt5:
sources/meta-raspberrypi:
sources/meta-riscv:
sources/meta-rust:
sources/meta-ti:
sources/meta-variscite-fslc:
sources/meta-yoe:
sources/openembedded-core:
meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
"Don't build this"
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"
PNBLACKLIST[smartrefrigerator] = "Needs porting to QT > 5.6"
PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
PNBLACKLIST[homeautomation] = "Needs porting to QT > 5.6"
PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
PNBLACKLIST[applicationlauncher] = "Needs porting to QT > 5.6"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 1 issue: textrel
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 0 issue: version-going-backwards


count: 1 issue: host-user-contaminated
qtquickcontrols2-5.12.3+gitAUTOINC+f7ba074ca1: qtquickcontrols2:
/qtquickcontrols2-qmlplugins/usr/lib/qml/QtQuick/Controls.2/Fusion/TabBar.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 0 issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report
~/oe/world/yoe ~/oe/world/yoe

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
19291f7c cooker: list all nonexistent bblayer directories
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
b071a1a209 gcc-runtime: fix C++ header mapping for n32/x32 tune
not included in master yet:
d0a30c1c57 runtime/cases/logrotate: make test more reliable
40ea686112 libevent:upgrade 2.1.8 -> 2.1.10
7ddbe6483d libevdev:upgrade 1.6.0 -> 1.7.0
8a21559bd4 target-sdk-provides-dummy: add libperl.so.5 to DUMMY_PROVIDES
b34486a616 gnutls:upgrade 3.6.7 -> 3.6.8
825be9d66a gnupg:upgrade 2.2.15 -> 2.2.16
e3b7cb02a8 curl:upgrade 7.64.1 -> 7.65.1
dc25e95254 lttng-ust:upgrade 2.10.3 -> 2.10.4
23dfbb2746 xkeyboard:upgrade 2.26 -> 2.27
3b556cbdff gobject-introspection:upgrade 1.60.1 -> 1.60.2
c7b0823f9a wic/bootimg-efi: allow multiple initrd
24f4b2a8f2 libffi: Add RISC-V support
112ca2174d opensbi: Initial commit of OpenSBI
11b6020dff qemuriscv64: Add the QEMU RISC-V 64-bit machine
7cc98b0f34 linux-yocto: Mark qemuriscv64 as compatible
2abfbf1869 systemd-conf: not configure network for nfs root
7ce8b1bc51 serf: stop scons trying to create directories in hosts rootfs
00c5a665b4 wireless-regdb: Add recipe
05c9fb5a02 glib-2.0: fix host path appearing in gsocketclient-slow test script
580d7f3325 dpkg: Use less as pager
3e09c8b5b6 rng-tools: 6.6 -> 6.7
f7a470531d meson: Fix native patch to python3
4e315dd23c rootfs: Fix dependency for every dpkg run
2106a56782 python3: python3: Fix build error x86->x86
641529503a libxcrypt: Switch to disable obsolete APIs
f6a064d02c libxcrypt-compat: Add recipe to build the obsolete APIs
43a7a213a9 uninative-tarball: Add libxcrypt-compat
b052d76678 createrepo-c: upgrade 0.14.0 -> 0.14.2
ba107eb246 libmodulemd: upgrade 2.4.0 -> 2.5.0
55c410fd9f vala: upgrade 0.44.3 -> 0.44.5
e8e6e4593f libnewt: merge libnewt-python recipe into the main recipe
712fadb95c epiphany: update to 3.32.3
75e255a95e btrfs-tools: update to 5.1.1
461094cbef cve-update-db: New recipe to update CVE database
6c6c16a9a0 cve-check: Remove dependency to cve-check-tool-native
d8ae775458 cve-check: Manage CVE_PRODUCT with more than one name
c52d5b4f8c cve-check: Consider CVE that affects versions with less than operator
da6f7e81aa oeqa/logparser: ignore test failure commentary
bbb403936c openssh: Add missing DEPENDS on virtual/crypt
0aa57768ed recipes: Add runit and related recipes
7e974240da oeqa: Recognise svlogd as another logger
f257206468 pam_systemd: Include missing.h for secure_getenv
9dceda5291 musl-obstack: Add recipe
23792d6f87 elfutils: Fix eu-* utils builds for musl
d11ea758f2 maintainers: Account for musl-obstack and libssp-nonshared

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
3b245e4fe openipmi: upgrade 2.0.25 -> 2.0.27
not included in master yet:
10c39b96a blueman_%.bbappend: Avoid PAK archive (application/x-pak)
0e342ecaa gitver: Pass git directory argument to gitrev_run
70c2f87bf recipes-benchmark/stressapptest_1.0.9.bb: add recipe
36fcb1a8d stressapptest: Fix build with libc++
5673dae7b stressapptest: Implement reading sysfs and use it if sysconf
is not there
8b5ebbf6e stressapptest: Use git SHA instead of git archive
d7a9d7089 libgpiod: upgrade to v1.4
e3875cdcf libp11: No need to delete *.la anymore
e49a68fa6 libauthen-radius-perl: Remove manual RDEPENDS from PN-ptest
to PN package
52a326728 mariadb: Upgrade to 10.3.16
50440a488 protobuf: 3.6.1 -> 3.8.0
fb3bd9c06 protobuf-c: add patch for protobuf 3 compatibility
1e0ec61f7 python3-protobuf, python-protobuf: 3.6.1 -> 3.8.0
d29f84835 python-twisted: upgrade 19.2.0 -> 19.2.1
86407337b pm-graph: fix multilib build failure
e01261885 network-manager-applet: Remove obsolete dbus-glib and
libnm-glib dependencies
7727e4cb9 ndctl: Remove the unnecessary dependency on virtual/kernel
4257adeeb tipcutils: Remove the unnecessary dependency on virtual/kernel
de09894f3 xl2tpd: Remove the old 1.3.6 version
23cb89eaf openconnect: update to 8.03
875f071ad gmime: Add recipe
c3b19334d pidgin-sipe: Depend on gmime
3e03fe998 snort: upgrade 2.9.11.1 -> 2.9.13
fce37fcfa mozjs: Fix do_patch error for mips64-n32
b25ee28b9 python-wrapt: upgrade 1.11.1 -> 1.11.2
357be4862 python-certifi: upgrade 2019.3.9 -> 2019.6.16
fad26cc14 cpuburn-arm: add aarch64 machine and build configuration
0642700df libmodule-build-perl: drop, has moved to oe-core
22bfe06d1 gpsd: Force using python-scons-native for now
d8dac5d31 sysdig: Upgrade to 0.24.2+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2a5f941 qtbase: fix build with gcc-9
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
e883c12 chromium: Update to 75.0.3770.100.
not included in master yet:
~/oe/world/yoe

