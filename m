Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 24FEC6C24A
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 00:46:09 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id r71so16686210qkr.10
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 16:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rUA0Am/K+gO95zJrlSjBCe844AOA3pdfkpzBDPZeGZI=;
	b=dvsJKwBOy4HuCX0vB7x9hRalG8vZfTve2IPfYMI3Oa+S+cVX/fsIJ6/xWEm9z37htB
	GODNkG5QdcDhFCHHwT/S4bvYGiEjpppEKKsKc6hM9+XdMDY8G5E0pB9BDOIAmRFxzpQy
	OiWQeYjxuRdRGl3aZG85wKVKFe0aoUoT+esFvYgDvNK1p5UrDeDlY14G8DH6ZcDLOHxs
	LehLQ40JNBiCcMOCBQUzhJoMRZTkO6cRPLhonhjIlA255w9hEkBrAbfHjqvgZGsvFlwP
	BCsZszmMa54/4XHPTmRh27lhnXQ7QwHi0F3Ot1LfO3OGgjw7kHEyrmSKjoVWMQYH9yFh
	P78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rUA0Am/K+gO95zJrlSjBCe844AOA3pdfkpzBDPZeGZI=;
	b=o73cxmUm0A0Q4JmSdN25cMmjip7pmoU+e+Q8uyklgAky8PZGI6Zchpo000GHXB7VnK
	PsvhS99Gk/iQ0ycgJb/0u87fuHgZ8/BTAxjMm2SldttulT2UHOCA6qn9QKbazb47/FcL
	OZh/nmc57OSAfFo/ppcaFheF4Nafo/J8IcQCJ/sI6FGwHQpBbbPjscEhNNG8hODykQuD
	xqfELI+7NovWrJWvjxHVpsvpt6VR8AuGur60aUHrJR3syYt385rwCjanvR2hjiOTT54n
	yF+9JTRw7W4tDqMw/vtph9j9+ai8u746oKLLMWztUhnRRSnXSvwOdxHdesanSjXBC6/D
	371w==
X-Gm-Message-State: AGRZ1gI2VXJMIqFuVGQ7O2KloPmTRDyV9zV9o7ZeYwObxJc27+WS4qF9
	iSP7U1T1E13d4wWmiiOqbmBka3dqr5rLGEVrnzY=
X-Google-Smtp-Source: AJdET5faX3A8xfd1RSjkGhvJErF7vH/bI12i/2HvMXEyzW7U57qLbIdzXr29F/g/t3YHHW4AiL/pnX9B5h0Tnf8WeSY=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr3079400qkm.102.1542069970467; 
	Mon, 12 Nov 2018 16:46:10 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sqO21kt-g0e_jgQqRRWDG4hGS4kZWDx-CV0shYExvz9kw@mail.gmail.com>
	<b069456e-fdf7-d737-8cef-c6d324bae089@gmail.com>
In-Reply-To: <b069456e-fdf7-d737-8cef-c6d324bae089@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Nov 2018 16:45:44 -0800
Message-ID: <CAMKF1sqO4tVb-Z=8Rvc4uyoMgpD=8KF3H-2BdL3Q=utvk6j7kg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-11-10
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
X-List-Received-Date: Tue, 13 Nov 2018 00:46:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 12, 2018 at 4:25 PM akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/12/18 10:02 AM, Khem Raj wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
>
> Thanks for the info. I notice a few more layers are now being included.
> How does one use this info to get an Idea of the state of
> meta-openembedded ?

This is based on Yoe distro which includes extra layers to build some
real world products. If you dont care for non meta-openembedded
layers, then ignore the build failures reported in other layers.
However
these layers do depend on meta-openembedded layers and serve as
a good test case for changes happening to meta-openembedded itself. So
they do serve a purpose.

>
> - armin
>
> >
> > == Number of issues - stats ==
> > {| class='wikitable'
> > !|Date     !!colspan='4'|Failed tasks    !!|Signatures
> > !!colspan='15'|QA !!Comment
> > |-
> > || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
> > ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> > ||version-going-backwards ||host-user-contaminated
> > ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
> > ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
> > ||qa_pseudo ||
> > |-
> > ||2018-11-10 ||7 ||4 ||4 ||3 ||0 ||0 ||0 ||0 ||0 ||0 ||14 ||0 ||0 ||0
> > ||0 ||0 ||0 ||0 ||0 ||0 ||
> > |}
> >
> > == Failed tasks 2018-11-10 ==
> >
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181112_095808.log
> >
> > === common (2) ===
> >     * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
> >     * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (5) ===
> >     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
> >     * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
> >     * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
> >     * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile
> >
> > === qemuarm64 (2) ===
> >     * sources/meta-openembedded/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb:do_configure
> >     * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile
> >
> > === qemux86 (1) ===
> >     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
> >
> > === qemux86_64 (0) ===
> >
> > === Number of failed tasks (18) ===
> > {| class=wikitable
> > |-
> > || qemuarm || 7 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181110_145700.log/
> > ||
> > |-
> > || qemuarm64 || 4 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181111_024719.log/
> > ||
> > |-
> > || qemux86 || 4 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181110_145620.log/
> > ||
> > |-
> > || qemux86_64 || 3 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181110_231754.log/
> > ||
> > |}
> >
> > === PNBLACKLISTs (0) ===
> >
> > === QA issues (14) ===
> > {| class=wikitable
> > !| Count ||Issue
> > |-
> > ||0 ||already-stripped
> > |-
> > ||0 ||build-deps
> > |-
> > ||0 ||compile-host-path
> > |-
> > ||0 ||file-rdeps
> > |-
> > ||0 ||host-user-contaminated
> > |-
> > ||0 ||installed-vs-shipped
> > |-
> > ||0 ||invalid-pkgconfig
> > |-
> > ||0 ||ldflags
> > |-
> > ||0 ||libdir
> > |-
> > ||0 ||pkgname
> > |-
> > ||0 ||qa_pseudo
> > |-
> > ||0 ||symlink-to-sysroot
> > |-
> > ||0 ||textrel
> > |-
> > ||0 ||unknown-configure-option
> > |-
> > ||14 ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181111_193921.log/
> >
> >
> >     * ERROR:  OE-core's config sanity checker detected a potential
> > misconfiguration.
> >     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> > in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >
> >
> > PNBLACKLISTs:
> > openembedded-core/:
> > meta-*:
> > PNBLACKLIST[android-system] = "depends on lxc from
> > meta-virtualiazation which isn't included in my world builds"
> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> > tested so much"
> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> > tested so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> > tested so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> > tested so much"
> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> > tested so much"
> > PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> > directory in /home/builder/poky :/"
> >
> >
> > QA issues by type:
> > count: 0 issue: already-stripped
> >
> >
> > count: 0 issue: libdir
> >
> >
> > count: 0 issue: textrel
> >
> >
> > count: 0 issue: build-deps
> >
> >
> > count: 0 issue: file-rdeps
> >
> >
> > count: 14 issue: version-going-backwards
> > curl-7.61.0: Package version for package curl-dbg went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-dbg went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-dev went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-dev went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-doc went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-doc went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-locale went backwards
> > which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-locale went backwards
> > which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-staticdev went backwards
> > which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl-staticdev went backwards
> > which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package curl went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package libcurl went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> > [version-going-backwards]
> > curl-7.61.0: Package version for package libcurl went backwards which
> > would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> > [version-going-backwards]
> >
> >
> > count: 0 issue: host-user-contaminated
> >
> >
> > count: 0 issue: installed-vs-shipped
> >
> >
> > count: 0 issue: unknown-configure-option
> >
> >
> > count: 0 issue: symlink-to-sysroot
> >
> >
> > count: 0 issue: invalid-pkgconfig
> >
> >
> > count: 0 issue: pkgname
> >
> >
> > count: 0 issue: ldflags
> >
> >
> > count: 0 issue: compile-host-path
> >
> >
> > count: 0 issue: qa_pseudo
> >
> >
> >
> > This git log matches with the metadata as seen by qemuarm build.
> > In some cases qemux86 and qemux86-64 builds are built with slightly
> > different metadata, you can see the exact version near the top of each
> > log.world.qemu* files linked from the report
> > ~/oe/world/yoe ~/oe/world/yoe
> >
> > == Tested changes (not included in master yet) - bitbake ==
> > latest upstream commit:
> > afee3f5 server/process: Fix unclosed socket warnings upon server
> > connection refused
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - openembedded-core ==
> > latest upstream commit:
> > f0394e8 curl: actually apply latest CVE patches
> > not included in master yet:
> > 800f4bd nspr: Update to 4.20
> > 0697141 gnutls: update to 3.6.4
> > e619b06 libpcre2: update to 10.32
> > d9b69aa openssh: Update to 7.9 primarily bug fixes
> > 4e22f40 libsm: update to 1.2.3
> > 7edcf4f libx11: update to 1.6.7 and sytle cleanup
> > c3ecf47 libxcb: update to 1.13.1
> > ff129d2 xkeyboard-config: update to 2.25
> > ec251cd xf86-input-libinput: update to 0.28.1
> > 5775e9e dhcp: fix issue with new bind changes
> > bf1be2e bind: update to latest LTS 9.11.5
> > 8593dcb kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
> > 7d96e16 xserver-xorg: update to 1.20.3
> > 85b76e5 connman: update to 1.36
> > a181b36 xf86-video-intel: update to latest
> > 93b599a ppce500v2: remove spe
> > 06dc919 pkgconfig: export variables
> > a103b16 go 1.9/1.11: fix textrel qa warning for non mips arch
> > be0bc03 machine/qemu*: fix kernel finish crng init more and more slowly
> > 8fa764d shadow: improve reproducibility by hard-coding shell path
> > 72b5b1b metadata_scm.bbclass: simplify base_detect_revision()
> > 0d942fe rootfs: ensure that packages in IMAGE_INSTALL_DEBUGFS are existing
> > 1467385 glide: disable ptest on mips
> > 4e17789 pseudo: fix link with new sqlite3
> > 07df5fc systemd-systemctl-native: handle Install wildcards
> > 42c97f7 sqlite3_3: Update to 3.25.2
> > 09eb7a8 scripts/runqemu: Add serialstdio mode
> > 5353901 scripts/runqemu: Replace subprocess.run() for compatibilty
> > af29d9a scripts/autobuilder-worker-prereq-tests: Shore up qemu testing
> > 1df2a63 oeqa/runtime: Add tests for gstreamer CLI
> > 99250f8 busybox: make busybox.links.{suid, nosuid} reproducible
> > 0fc7b1a cpan.bbclass: avoid newer MakeMaker run perl.real
> > 3f62857 openssl-1.1.1: remove build path from version info
> > 5cd6aea base.bbclass: Display name of licenses which caused SkipRecipe
> > f19726a oeqa/manual/build-appliance: Drop test which is already automated
> > 84c62d2 metadata_scm: Drop orphaned monotone functions
> > 2127540 distcc: Handle upstream branch deletion for old releases
> > 10c6187 oeqa/runtime/cases: Improve test dependency information
> > cf78ad1 oeqa/utils/buildproject: Only clean files if we've done something
> > 0a6c530 oeqa/runtime/utils/targetbuildproject: Use a subdir within ~/
> > 79ad913 testimage: Simplfy DEFAULT_TEST_SUITES logic
> > 9e15af6 testimage: Remove duplicate dependencies
> > f08b652 oeqa/runtime/cases: Improve dependencies of kernel/gcc/build tests
> > d5cc5f1 testimage: Further cleanup DEFAULT_TEST_SUITES
> > b7f42cc libxt: extend to nativesdk
> > be97b0d libxft: extend to nativesdk
> > c9dec34 fontconfig: extend to nativesdk
> > 2b49400 libice: extend to nativesdk
> > d05c774 rng-tools: 5 -> 6.6
> > 6ffa4f0 libjitterentropy: add 2.1.2
> > 04e5a36 testsdk: fix skipped testcase output "UNKNOWN" status while
> > multiprocess execution
> > 9d8c169 rng-tools: Fix crazy defaults
> > 32a9fcf apr: upgrade 1.6.3 -> 1.6.5
> > bc10a37 gnupg: upgrade 2.2.9 -> 2.2.10
> > 61fb130 ncurses: upgrade 6.1 -> 6.1+20180714
> > 5ff1ee2 man-db: 2.8.3 -> 2.8.4
> > 8da5a18 gpgme: 1.11.1 -> 1.12.0
> > 9b80e66 rpcbind: 0.2.4 -> 1.2.5
> > fb2d2e9 maintainers.inc: Add entry for libjitterentropy (copied from rng-tools)
> > c0e4751 rng-tools: fix typo of unrecognised options: --disable-jitterntropy
> > 842059d libsm: extend to nativesdk
> > 40d3f15 libaio: Extend to native
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> > latest upstream commit:
> > 15141ab lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
> > not included in master yet:
> > c90572b glog: updated libunwind look up function
> > 80d37c4 brotli: add initial recipe, based on meta-webkit layer
> > cabdfa2 cpprest: upgrade to version 2.10.7 and add support for brotli library
> > 3be07af modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
> > d77cac3 vim-tiny: remove alternative for xxd
> > 030c3ce network-manager-applet: move GNOMEBASEBUILDCLASS to correct position
> > 6646362 python-configparser.inc: Fix SUMMARY
> > b40cc18 meta-xfce: xfconf: fixup installed-vs-shipped QA issue
> > 317412b Adding support for xscreensaver-5.39
> > 8a88083 networkmanager: Fix build with musl
> > b534159 tk: extend to nativesdk
> > aea60d4 curlpp: Fix packaging and reference to license
> > 97f56b7 sedutil: Add recipe
> > 0e0104d libunique: fix installed-vs-shipped qa issue
> > 993da5d hwloc: Update the SRC_URI
> > 016b243 libgpiod: bump version to v1.2
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 5832bf2 qtbase: don't use thumb for armv[45]
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > b5fa3f5 Add dependency on meta-rust
> > not included in master yet:
> > ~/oe/world/yoe

