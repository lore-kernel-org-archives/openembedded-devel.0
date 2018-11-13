Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 801E76C248
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 00:25:31 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id z17-v6so4808266pgv.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 16:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6VYzgvWZRLadlf0yuWJwAhLJjB3b8xyAl5Va+ldvBTk=;
	b=sVjShwNmd95mU9bv9tiC29yhWD7GTo4W5Ispl36+tLYKidYCbfWRWPz5V8palRr+By
	jOMhuE6lsSI8ss7lhSUyVCjexDBPMCeDG0giL7R3zj+VeHMNddxttH8W4z8jMPErzVhk
	wLLNbcV3rQtyLMRHSLASUecfWsuvNS3DGyvhU0Tw+CSkDiOGaHF8xP3c4a+H/nThhZz6
	wieB8Qj9rc0m78akZdMVu6NxqLuk+ptNUgGAkM4iCXWGVOdK0bdvbWKYsOnda7SOfFDW
	pm3nHtyHvmtXSLcjHRQ72x5Imh9rV2NiCj6QzNVNp5Er6Pk8Z5bMtRtlzn1OvgUN6tMU
	kGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6VYzgvWZRLadlf0yuWJwAhLJjB3b8xyAl5Va+ldvBTk=;
	b=dOD1lGLSGZt3AdJj3f313UiAxHdUjep/OkW00tMfVW9mvmii7oA6NRupGKHwWShkWL
	SM335ybw/zix54Qa3vcaYJvJkHT03Y7oW4ON7K6WLW/N8zGc2dKWEBze+Ob47spMvrPT
	XPoLqwelOZiv93yYmIrAsXFOCDDoSu28jXUUOy4HkCzfPw0NcPIbq4CBWgcTNGbSOaPu
	5YlCivaBwwQGgnLTAgupjtXAmhy2NCbF7H8UcNvzcJrOKwlqyOpY3TerktyDT4eJXpLh
	4E8auiaT0oItDz2hAENb7aP2elCxOaK+brrbp6sY9UAR3FWDJ6kXDwB7/4EA4wHFhW+M
	IOaQ==
X-Gm-Message-State: AGRZ1gJPOXbmImgmq14BVntMx27rLJZWRjOeMJtzm75cPrBo8gJ2SWgW
	gXzdiHSwZQfqBb7xd9bk8ilXe4u1
X-Google-Smtp-Source: AJdET5dJllyvF5QvpTKib2paE8kYatBULjdq1MO4RDGpUfOpPxBBKk32hkUZ61E9qVCGRQX7zOBejg==
X-Received: by 2002:a63:8c2:: with SMTP id 185mr2741726pgi.26.1542068732027;
	Mon, 12 Nov 2018 16:25:32 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:1c0a:2ccb:cca7:f2b7?
	([2601:202:4180:c33:1c0a:2ccb:cca7:f2b7])
	by smtp.gmail.com with ESMTPSA id z7sm8750153pga.6.2018.11.12.16.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 16:25:30 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1sqO21kt-g0e_jgQqRRWDG4hGS4kZWDx-CV0shYExvz9kw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b069456e-fdf7-d737-8cef-c6d324bae089@gmail.com>
Date: Mon, 12 Nov 2018 16:25:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqO21kt-g0e_jgQqRRWDG4hGS4kZWDx-CV0shYExvz9kw@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Nov 2018 00:25:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/12/18 10:02 AM, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status

Thanks for the info. I notice a few more layers are now being included.
How does one use this info to get an Idea of the state of
meta-openembedded ?

- armin

>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date     !!colspan='4'|Failed tasks    !!|Signatures
> !!colspan='15'|QA !!Comment
> |-
> || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> ||version-going-backwards ||host-user-contaminated
> ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
> ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
> ||qa_pseudo ||
> |-
> ||2018-11-10 ||7 ||4 ||4 ||3 ||0 ||0 ||0 ||0 ||0 ||0 ||14 ||0 ||0 ||0
> ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2018-11-10 ==
>
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181112_095808.log
>
> === common (2) ===
>     * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
>     * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install
>
> === common-x86 (0) ===
>
> === qemuarm (5) ===
>     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
>     * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
>     * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile
>
> === qemuarm64 (2) ===
>     * sources/meta-openembedded/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb:do_configure
>     * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile
>
> === qemux86 (1) ===
>     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (18) ===
> {| class=wikitable
> |-
> || qemuarm || 7 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181110_145700.log/
> ||
> |-
> || qemuarm64 || 4 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181111_024719.log/
> ||
> |-
> || qemux86 || 4 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181110_145620.log/
> ||
> |-
> || qemux86_64 || 3 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181110_231754.log/
> ||
> |}
>
> === PNBLACKLISTs (0) ===
>
> === QA issues (14) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||build-deps
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
> |-
> ||0 ||host-user-contaminated
> |-
> ||0 ||installed-vs-shipped
> |-
> ||0 ||invalid-pkgconfig
> |-
> ||0 ||ldflags
> |-
> ||0 ||libdir
> |-
> ||0 ||pkgname
> |-
> ||0 ||qa_pseudo
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||textrel
> |-
> ||0 ||unknown-configure-option
> |-
> ||14 ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181111_193921.log/
>
>
>     * ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-*:
> PNBLACKLIST[android-system] = "depends on lxc from
> meta-virtualiazation which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 0 issue: libdir
>
>
> count: 0 issue: textrel
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 14 issue: version-going-backwards
> curl-7.61.0: Package version for package curl-dbg went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-dbg went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-dev went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-dev went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-doc went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-doc went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-locale went backwards
> which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-locale went backwards
> which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-staticdev went backwards
> which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl-staticdev went backwards
> which would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package curl went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
> curl-7.61.0: Package version for package libcurl went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.10)
> [version-going-backwards]
> curl-7.61.0: Package version for package libcurl went backwards which
> would break package feeds from (0:7.61.1-r0.4 to 0:7.61.0-r0.9)
> [version-going-backwards]
>
>
> count: 0 issue: host-user-contaminated
>
>
> count: 0 issue: installed-vs-shipped
>
>
> count: 0 issue: unknown-configure-option
>
>
> count: 0 issue: symlink-to-sysroot
>
>
> count: 0 issue: invalid-pkgconfig
>
>
> count: 0 issue: pkgname
>
>
> count: 0 issue: ldflags
>
>
> count: 0 issue: compile-host-path
>
>
> count: 0 issue: qa_pseudo
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
> ~/oe/world/yoe ~/oe/world/yoe
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> afee3f5 server/process: Fix unclosed socket warnings upon server
> connection refused
> not included in master yet:
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> f0394e8 curl: actually apply latest CVE patches
> not included in master yet:
> 800f4bd nspr: Update to 4.20
> 0697141 gnutls: update to 3.6.4
> e619b06 libpcre2: update to 10.32
> d9b69aa openssh: Update to 7.9 primarily bug fixes
> 4e22f40 libsm: update to 1.2.3
> 7edcf4f libx11: update to 1.6.7 and sytle cleanup
> c3ecf47 libxcb: update to 1.13.1
> ff129d2 xkeyboard-config: update to 2.25
> ec251cd xf86-input-libinput: update to 0.28.1
> 5775e9e dhcp: fix issue with new bind changes
> bf1be2e bind: update to latest LTS 9.11.5
> 8593dcb kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
> 7d96e16 xserver-xorg: update to 1.20.3
> 85b76e5 connman: update to 1.36
> a181b36 xf86-video-intel: update to latest
> 93b599a ppce500v2: remove spe
> 06dc919 pkgconfig: export variables
> a103b16 go 1.9/1.11: fix textrel qa warning for non mips arch
> be0bc03 machine/qemu*: fix kernel finish crng init more and more slowly
> 8fa764d shadow: improve reproducibility by hard-coding shell path
> 72b5b1b metadata_scm.bbclass: simplify base_detect_revision()
> 0d942fe rootfs: ensure that packages in IMAGE_INSTALL_DEBUGFS are existing
> 1467385 glide: disable ptest on mips
> 4e17789 pseudo: fix link with new sqlite3
> 07df5fc systemd-systemctl-native: handle Install wildcards
> 42c97f7 sqlite3_3: Update to 3.25.2
> 09eb7a8 scripts/runqemu: Add serialstdio mode
> 5353901 scripts/runqemu: Replace subprocess.run() for compatibilty
> af29d9a scripts/autobuilder-worker-prereq-tests: Shore up qemu testing
> 1df2a63 oeqa/runtime: Add tests for gstreamer CLI
> 99250f8 busybox: make busybox.links.{suid, nosuid} reproducible
> 0fc7b1a cpan.bbclass: avoid newer MakeMaker run perl.real
> 3f62857 openssl-1.1.1: remove build path from version info
> 5cd6aea base.bbclass: Display name of licenses which caused SkipRecipe
> f19726a oeqa/manual/build-appliance: Drop test which is already automated
> 84c62d2 metadata_scm: Drop orphaned monotone functions
> 2127540 distcc: Handle upstream branch deletion for old releases
> 10c6187 oeqa/runtime/cases: Improve test dependency information
> cf78ad1 oeqa/utils/buildproject: Only clean files if we've done something
> 0a6c530 oeqa/runtime/utils/targetbuildproject: Use a subdir within ~/
> 79ad913 testimage: Simplfy DEFAULT_TEST_SUITES logic
> 9e15af6 testimage: Remove duplicate dependencies
> f08b652 oeqa/runtime/cases: Improve dependencies of kernel/gcc/build tests
> d5cc5f1 testimage: Further cleanup DEFAULT_TEST_SUITES
> b7f42cc libxt: extend to nativesdk
> be97b0d libxft: extend to nativesdk
> c9dec34 fontconfig: extend to nativesdk
> 2b49400 libice: extend to nativesdk
> d05c774 rng-tools: 5 -> 6.6
> 6ffa4f0 libjitterentropy: add 2.1.2
> 04e5a36 testsdk: fix skipped testcase output "UNKNOWN" status while
> multiprocess execution
> 9d8c169 rng-tools: Fix crazy defaults
> 32a9fcf apr: upgrade 1.6.3 -> 1.6.5
> bc10a37 gnupg: upgrade 2.2.9 -> 2.2.10
> 61fb130 ncurses: upgrade 6.1 -> 6.1+20180714
> 5ff1ee2 man-db: 2.8.3 -> 2.8.4
> 8da5a18 gpgme: 1.11.1 -> 1.12.0
> 9b80e66 rpcbind: 0.2.4 -> 1.2.5
> fb2d2e9 maintainers.inc: Add entry for libjitterentropy (copied from rng-tools)
> c0e4751 rng-tools: fix typo of unrecognised options: --disable-jitterntropy
> 842059d libsm: extend to nativesdk
> 40d3f15 libaio: Extend to native
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 15141ab lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
> not included in master yet:
> c90572b glog: updated libunwind look up function
> 80d37c4 brotli: add initial recipe, based on meta-webkit layer
> cabdfa2 cpprest: upgrade to version 2.10.7 and add support for brotli library
> 3be07af modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
> d77cac3 vim-tiny: remove alternative for xxd
> 030c3ce network-manager-applet: move GNOMEBASEBUILDCLASS to correct position
> 6646362 python-configparser.inc: Fix SUMMARY
> b40cc18 meta-xfce: xfconf: fixup installed-vs-shipped QA issue
> 317412b Adding support for xscreensaver-5.39
> 8a88083 networkmanager: Fix build with musl
> b534159 tk: extend to nativesdk
> aea60d4 curlpp: Fix packaging and reference to license
> 97f56b7 sedutil: Add recipe
> 0e0104d libunique: fix installed-vs-shipped qa issue
> 993da5d hwloc: Update the SRC_URI
> 016b243 libgpiod: bump version to v1.2
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 5832bf2 qtbase: don't use thumb for armv[45]
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> b5fa3f5 Add dependency on meta-rust
> not included in master yet:
> ~/oe/world/yoe

