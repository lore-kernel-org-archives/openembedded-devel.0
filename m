Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3C7606B2
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 18:02:35 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id m5so14881751qka.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=BkV0ZhBpKS+MpuZ/IzJzh7ODGtlN6PYxJg/ovTXmJto=;
	b=M/L7fLKNF3S24TMTr/v7re8pm21PCZc7nlBfUQOescSQauwEIEm+j4TEN9PjgcCUjz
	47orBOPjg5i7+oUoKursfdbDiZfmwfM/lluYDqeXhCEVN+J0uFDPppE26nXcQzCjuEcR
	6S291spfgX14efOPagDU908NTVCWVssJu4SoDCuzqhEZM3ul1gQtmWi86Od+EBQbI9aw
	Ik6vUAtJqlYcJLDYfyc1cTZzS+zgsfIT00DUImBQdkNC7+WYgsyUNW692BehUi3uQu6H
	uZa5T9Iq3M+Oz3EILuR0+swpRolR1HHxSVh98jiIwxF6voon0RvXciMJywBXaThG6tJy
	P+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BkV0ZhBpKS+MpuZ/IzJzh7ODGtlN6PYxJg/ovTXmJto=;
	b=IAgXR3pvQMzUDnqyazSAnqELdNQ6h1C6rplaIGr6SeKouFnvf8UNosfmDurepvjT8f
	H4UWWEPvxY3/0wfPDm+/IzbXo8e5nk0U+NFvzeDe82XFaIKUKkhE5iiESL+2tQZVe63M
	0piwV6L/ImkYDRmz37Fh4Ffx74ZUv8isnGHx9hD5COy6Vu2rifNIZWtef6QAf7QBF20U
	16ZfIcOxQuP4CNklw2y5aIob81GmU84T7FDlY5J2HIqDaBZqLwEStM73jm+jyotqUyny
	iBRVI01+qOu0WPkvuKiAg0npSLqKxx2Nr27/FslVNA0oxEuEQy7p9WZ3f+3fBbNLRRTw
	E71Q==
X-Gm-Message-State: AGRZ1gIcvFeY7t9+g9xTDRlbE82LsqM2ix2iwz8DHyuPr/e3lpbn7X7p
	IpFV3XR1FOpx3UgAMcujEWg6ty62il0rgGwz8eFcwGVNtZQ=
X-Google-Smtp-Source: AJdET5e5RDJ7t/amSYOYJCaEE7Y2X5c7aEvWSQEvaAehnI1XbgznsuG+6ePzN0sY3ep1AlIszqbn5Ihp205Zsioemf4=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr1926641qvd.224.1542045755339; 
	Mon, 12 Nov 2018 10:02:35 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Nov 2018 10:02:09 -0800
Message-ID: <CAMKF1sqO21kt-g0e_jgQqRRWDG4hGS4kZWDx-CV0shYExvz9kw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-11-10
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
X-List-Received-Date: Mon, 12 Nov 2018 18:02:35 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='4'|Failed tasks    !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
||version-going-backwards ||host-user-contaminated
||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
||qa_pseudo ||
|-
||2018-11-10 ||7 ||4 ||4 ||3 ||0 ||0 ||0 ||0 ||0 ||0 ||14 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-11-10 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181112_095808.log

=== common (2) ===
    * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
    * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install

=== common-x86 (0) ===

=== qemuarm (5) ===
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
    * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile

=== qemuarm64 (2) ===
    * sources/meta-openembedded/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb:do_configure
    * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile

=== qemux86 (1) ===
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (18) ===
{| class=wikitable
|-
|| qemuarm || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181110_145700.log/
||
|-
|| qemuarm64 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181111_024719.log/
||
|-
|| qemux86 || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181110_145620.log/
||
|-
|| qemux86_64 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181110_231754.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (14) ===
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
||0 ||host-user-contaminated
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
||0 ||textrel
|-
||0 ||unknown-configure-option
|-
||14 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181111_193921.log/


    * ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/yoe/build/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-*:
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


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 0 issue: textrel


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 14 issue: version-going-backwards
curl-7.61.0: Package version for package curl-dbg went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl-dbg went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package curl-dev went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl-dev went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package curl-doc went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl-doc went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package curl-locale went backwards
which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl-locale went backwards
which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package curl-staticdev went backwards
which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl-staticdev went backwards
which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package curl went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package curl went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]
curl-7.61.0: Package version for package libcurl went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
[version-going-backwards]
curl-7.61.0: Package version for package libcurl went backwards which
would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
[version-going-backwards]


count: 0 issue: host-user-contaminated


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
afee3f5 server/process: Fix unclosed socket warnings upon server
connection refused
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
f0394e8 curl: actually apply latest CVE patches
not included in master yet:
800f4bd nspr: Update to 4.20
0697141 gnutls: update to 3.6.4
e619b06 libpcre2: update to 10.32
d9b69aa openssh: Update to 7.9 primarily bug fixes
4e22f40 libsm: update to 1.2.3
7edcf4f libx11: update to 1.6.7 and sytle cleanup
c3ecf47 libxcb: update to 1.13.1
ff129d2 xkeyboard-config: update to 2.25
ec251cd xf86-input-libinput: update to 0.28.1
5775e9e dhcp: fix issue with new bind changes
bf1be2e bind: update to latest LTS 9.11.5
8593dcb kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
7d96e16 xserver-xorg: update to 1.20.3
85b76e5 connman: update to 1.36
a181b36 xf86-video-intel: update to latest
93b599a ppce500v2: remove spe
06dc919 pkgconfig: export variables
a103b16 go 1.9/1.11: fix textrel qa warning for non mips arch
be0bc03 machine/qemu*: fix kernel finish crng init more and more slowly
8fa764d shadow: improve reproducibility by hard-coding shell path
72b5b1b metadata_scm.bbclass: simplify base_detect_revision()
0d942fe rootfs: ensure that packages in IMAGE_INSTALL_DEBUGFS are existing
1467385 glide: disable ptest on mips
4e17789 pseudo: fix link with new sqlite3
07df5fc systemd-systemctl-native: handle Install wildcards
42c97f7 sqlite3_3: Update to 3.25.2
09eb7a8 scripts/runqemu: Add serialstdio mode
5353901 scripts/runqemu: Replace subprocess.run() for compatibilty
af29d9a scripts/autobuilder-worker-prereq-tests: Shore up qemu testing
1df2a63 oeqa/runtime: Add tests for gstreamer CLI
99250f8 busybox: make busybox.links.{suid, nosuid} reproducible
0fc7b1a cpan.bbclass: avoid newer MakeMaker run perl.real
3f62857 openssl-1.1.1: remove build path from version info
5cd6aea base.bbclass: Display name of licenses which caused SkipRecipe
f19726a oeqa/manual/build-appliance: Drop test which is already automated
84c62d2 metadata_scm: Drop orphaned monotone functions
2127540 distcc: Handle upstream branch deletion for old releases
10c6187 oeqa/runtime/cases: Improve test dependency information
cf78ad1 oeqa/utils/buildproject: Only clean files if we've done something
0a6c530 oeqa/runtime/utils/targetbuildproject: Use a subdir within ~/
79ad913 testimage: Simplfy DEFAULT_TEST_SUITES logic
9e15af6 testimage: Remove duplicate dependencies
f08b652 oeqa/runtime/cases: Improve dependencies of kernel/gcc/build tests
d5cc5f1 testimage: Further cleanup DEFAULT_TEST_SUITES
b7f42cc libxt: extend to nativesdk
be97b0d libxft: extend to nativesdk
c9dec34 fontconfig: extend to nativesdk
2b49400 libice: extend to nativesdk
d05c774 rng-tools: 5 -> 6.6
6ffa4f0 libjitterentropy: add 2.1.2
04e5a36 testsdk: fix skipped testcase output "UNKNOWN" status while
multiprocess execution
9d8c169 rng-tools: Fix crazy defaults
32a9fcf apr: upgrade 1.6.3 -> 1.6.5
bc10a37 gnupg: upgrade 2.2.9 -> 2.2.10
61fb130 ncurses: upgrade 6.1 -> 6.1+20180714
5ff1ee2 man-db: 2.8.3 -> 2.8.4
8da5a18 gpgme: 1.11.1 -> 1.12.0
9b80e66 rpcbind: 0.2.4 -> 1.2.5
fb2d2e9 maintainers.inc: Add entry for libjitterentropy (copied from rng-tools)
c0e4751 rng-tools: fix typo of unrecognised options: --disable-jitterntropy
842059d libsm: extend to nativesdk
40d3f15 libaio: Extend to native

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
15141ab lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
not included in master yet:
c90572b glog: updated libunwind look up function
80d37c4 brotli: add initial recipe, based on meta-webkit layer
cabdfa2 cpprest: upgrade to version 2.10.7 and add support for brotli library
3be07af modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
d77cac3 vim-tiny: remove alternative for xxd
030c3ce network-manager-applet: move GNOMEBASEBUILDCLASS to correct position
6646362 python-configparser.inc: Fix SUMMARY
b40cc18 meta-xfce: xfconf: fixup installed-vs-shipped QA issue
317412b Adding support for xscreensaver-5.39
8a88083 networkmanager: Fix build with musl
b534159 tk: extend to nativesdk
aea60d4 curlpp: Fix packaging and reference to license
97f56b7 sedutil: Add recipe
0e0104d libunique: fix installed-vs-shipped qa issue
993da5d hwloc: Update the SRC_URI
016b243 libgpiod: bump version to v1.2

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
5832bf2 qtbase: don't use thumb for armv[45]
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
b5fa3f5 Add dependency on meta-rust
not included in master yet:
~/oe/world/yoe

