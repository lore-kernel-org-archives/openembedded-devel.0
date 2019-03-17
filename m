Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8C0B7C4F9
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 16:46:39 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v1so4992514pgi.5
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KlwrvnXBmpSUEOlwma6Pi3Bm7c5do5OQhAIVA1e52Ws=;
	b=rS5sYjg3Sb8yJ6ZDFq5x3zlnsosVKp37MsAys7FnYb23PcE4D+nsGKMNQKQrLlpO0u
	tqbmAVM1yh6MZlT22uc8lE6kPGPo97CGdLoLV8wi38FJfgGETDx6oW06ANi9ClA2PY+Q
	JhCRsqO1EcCANqa2mvdyPln0rIQcoscCG6m3YmwEe4VdR/TVsagAm/Vr+Ufa0gcuL/WB
	sUURJ1BXkZyKs5h/EaEDp54fazzKbtHQOPPsJrs5p01TaRcJxPboPMdv9tcZFnMqDMHp
	1V1IWC+GAWfEFHv+Gq/DR/JxRp5zv9PCVw/w+ep4BffOG7ffsR+ME94DhXoKtdzKPCUF
	Qi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=KlwrvnXBmpSUEOlwma6Pi3Bm7c5do5OQhAIVA1e52Ws=;
	b=efptnB0obXHIY7XvEZ8fRyxrQExfKYYxdVTrchZsc0fkJYCtPNMFBEI7ISdxErjMi0
	Ic9h88hGJwlydhxKXfD3CgArLcqMUkw1OO4MT5za2uc8x72bFzs+bj3hc1llUKa70rww
	gGm7WCiqyvvmW1cVbNyi61/0+WlfvRympZttxcNQT5IiV0/Fv3svvq/YU0fnbxSvAeju
	MOU7gdAHpEF/c6e8bQDxCqCaSjfwhJWNXXHATLrKwK5QkCRD7FytcZ0KoTBEGSPQRfyD
	33A0iIT6frDTRfvDVt4dN9VlmGaaRzexqo0jsaqJdQ5sXOe9Ga3X/MSZDZ35oytukqhj
	TT3A==
X-Gm-Message-State: APjAAAWcU3XJLp9tp8pTipT1Wz3OYYizXCu6aK+8POIxUZRzsE5pNFI6
	1CRV1+LywYlcCdlcl2Uhn7GuNkZU
X-Google-Smtp-Source: APXvYqwE0pYoczLPYtD2w3WWEFrMDYxgEmnpN8xiNtB6RXcVNLHE97FXPf2b0JPA/EtWHsJyNVy4OQ==
X-Received: by 2002:a17:902:8506:: with SMTP id
	bj6mr15300587plb.60.1552841200466; 
	Sun, 17 Mar 2019 09:46:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:55ff:5980:c3cd:d28e?
	([2601:202:4180:c33:55ff:5980:c3cd:d28e])
	by smtp.gmail.com with ESMTPSA id
	h184sm14714353pfc.78.2019.03.17.09.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 09:46:39 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a3929e03-c4ef-d9cd-6267-7e1166ffc923@gmail.com>
Date: Sun, 17 Mar 2019 09:46:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
Subject: Re: State of OE World, 2019-03-16
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
X-List-Received-Date: Sun, 17 Mar 2019 16:46:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/17/19 8:26 AM, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2019-03-16 ==
>
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190317_082308.log
>
> === common (2) ===
>     * sources/meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
>
> === common-x86 (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile
>
> === qemuarm (6) ===
>     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
>     * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
>     * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
>     * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
>     * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa
>
> === qemuarm64 (5) ===
>     * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
>     * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa
>
> === qemux86 (4) ===
>     * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb:do_compile
>     * sources/meta-browser/recipes-browser/chromium/chromium-x11_72.0.3626.121.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
>     * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.33.0.bb:do_compile
>
> === qemux86_64 (1) ===
>     * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa

Are any of the meta-openembedded recipes above earmarked for
blacklisting for warrior?

- armin
>
> === Number of failed tasks (33) ===
> {| class=wikitable
> |-
> || qemuarm || 8 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190316_182729.log/
> ||
> |-
> || qemuarm64 || 9 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190316_204957.log/
> ||
> |-
> || qemux86 || 8 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190316_043014.log/
> ||
> |-
> || qemux86_64 || 8 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190316_070310.log/
> ||
> |}
>
> === PNBLACKLISTs (2) ===
>
> === QA issues (61) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
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
> ||0 ||unknown-configure-option
> |-
> ||1 ||host-user-contaminated
> |-
> ||1 ||textrel
> |-
> ||3 ||build-deps
> |-
> ||56 ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190316_221024.log/
>
>
>     * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>     * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>
>
> PNBLACKLISTs:
> sources/meta-96boards:
> sources/meta-atmel:
> sources/meta-browser:
> sources/meta-freescale:
> sources/meta-freescale-3rdparty:
> sources/meta-intel:
> sources/meta-odroid:
> sources/meta-openembedded:
> meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
> = " error: invalid use of incomplete type 'RCF::AsioIoService {aka
> class boost::asio::io_service}; among others?"
> sources/meta-qcom:
> sources/meta-qt5:
> sources/meta-raspberrypi:
> sources/meta-riscv:
> sources/meta-rust:
> sources/meta-ti:
> sources/meta-variscite-fslc:
> sources/meta-yoe:
> sources/openembedded-core:
> meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
> "Don't build this"
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
> PNBLACKLIST[smartrefrigerator] = "Needs porting to QT > 5.6"
> PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
> PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
> PNBLACKLIST[homeautomation] = "Needs porting to QT > 5.6"
> PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
> PNBLACKLIST[applicationlauncher] = "Needs porting to QT > 5.6"
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 0 issue: libdir
>
>
> count: 1 issue: textrel
> mpeg2dec-0.5.1: ELF binary
> '/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
> has relocations in .text [textrel]
>
>
> count: 3 issue: build-deps
> glide-0.13.2: glide rdepends on libstd-rs, but it isn't a build
> dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> [build-deps]
> go-dep-0.5.0: go-dep rdepends on libstd-rs, but it isn't a build
> dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> [build-deps]
> go-helloworld-0.1: go-helloworld rdepends on libstd-rs, but it isn't a
> build dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> [build-deps]
>
>
> count: 0 issue: file-rdeps
>
>
> count: 56 issue: version-going-backwards
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dbg went backwards which would break package feeds
> from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dbg went backwards which would break package feeds
> from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dev went backwards which would break package feeds
> from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dev went backwards which would break package feeds
> from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-doc went backwards which would break package feeds
> from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-doc went backwards which would break package feeds
> from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-locale went backwards which would break package
> feeds from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-locale went backwards which would break package
> feeds from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-src went backwards which would break package feeds
> from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-src went backwards which would break package feeds
> from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-staticdev went backwards which would break package
> feeds from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-staticdev went backwards which would break package
> feeds from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> went backwards which would break package feeds from (0:1.1-r2.79 to
> 0:1.1-r2.78) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> went backwards which would break package feeds from (0:1.1-r2.88 to
> 0:1.1-r2.87) [version-going-backwards]
> os-release-1.0: Package version for package os-release-dbg went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release-dev went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release-doc went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release-locale went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release-src went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release-staticdev went
> backwards which would break package feeds from (0:1.0-r0.98 to
> 0:1.0-r0.97) [version-going-backwards]
> os-release-1.0: Package version for package os-release went backwards
> which would break package feeds from (0:1.0-r0.98 to 0:1.0-r0.97)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-dbg went backwards
> which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-dev went backwards
> which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-ptest went backwards
> which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-src went backwards
> which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target went backwards which
> would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-dbg went backwards which would break
> package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-dev went backwards which would break
> package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-ptest went backwards which would break
> package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-src went backwards which would break
> package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug went backwards which would break package
> feeds from (0:1.0-r3.148 to 0:1.0-r3.147) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-dbg went backwards which would break package
> feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-dbg went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-dev went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-ptest went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-dev went backwards which would break package
> feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-dbg went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-dev went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-ptest went backwards which would
> break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-dbg went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-dev went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-ptest went backwards which would
> break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-dbg went backwards which would
> break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-dev went backwards which would
> break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-ptest went backwards which would
> break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-ptest went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-dbg went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-dev went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-ptest went backwards which would break
> package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk went backwards which would break package
> feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-src went backwards which would break package
> feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted went backwards which would break package
> feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
>
>
> count: 1 issue: host-user-contaminated
> glibc-locale-2.29: glibc-locale:
> /glibc-binary-localedata-mag-in/usr/lib/locale/mag_IN/LC_CTYPE is
> owned by uid 3004, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
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
> 6065540c .gitattributes: Add to improve git diff for minified css/js files
> not included in master yet:
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> afea472cdc systemd: do not disable SELinux with musl
> not included in master yet:
> 55ed568c2d lttng-tools ptest: add missing dependencies
> 991f971050 lttng-tools ptest: fix test_ust-dl
> e0f9710025 lttng-ust: add python3-agent feature
> a450f34cd6 resulttool/report: Enable roll-up report for a commit
> 55f7d0de90 xev: update to 1.2.3
> 5b2d9d12ec glibc: fix do_populate_sdk fail when multilib used
> 8c7fbd3b17 mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
> 432192e0c7 inetutils: Remove talk / talkd from ALTERNATIVES
> ac7ea9011b inetutils: Handle rsh, etc more consistently
> 584c12c892 inetutils: Disable rsh, etc in the build
> a2d8bd2705 virglrenderer: requires distro feature opengl
> 5c0b937f30 glib-2.0: clean up EXTRA_OEMESON
> 8a47f45962 systemd: drop unused kill-path option
> f4b08a0610 shadow: drop inappropriate patch
> 6a78430c82 class/sanity: strip the output of get_filesystem_id()
> 95164cbc13 gst-examples: switch to gitlab url and https protocol
> 5c5c4c80fe systemd: fix CVE-2019-6454
> fbded47018 iproute2: add tc to the alternatives list
> 42741dc701 fixup
> 3337aa2ced oeqa/manual/bsp-hw.json: test id updated and obsolete test
> cases removed
> 567c6c82b7 oeqa/manual/compliance-test.json: test id updated and
> missing test cases added
> 3bdae69c94 oeqa/manual/kernel-dev.json: test id updated
> 79da19b826 fixup
> 57476421be recipes: Add runit and related recipes
> db750cc7d3 oeqa: Recognise svlogd as another logger
> 66ff9aa6d4 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
> a47d60761d arch-armv5-dsp.inc: Check for dsp only to enable 'e' in
> package arches
> a9d66477ee cross-canadian.bbclass: Do not override LIBCOVERRIDE with
> SDK libc override
> 81d34140d4 go: Minor 1.21.1 patch update
> 4833bdeb9d lttng: Enable on musl and riscv
> e633820dc3 packagegroup-core-tools-profile: Do not remove lttng-ust
> for musl and risc-v
> a32f61aeed gdb: Do not disable lttng-ust on risc-v
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 0248b3ee2 wireshark: upgrade to 3.0.0
> not included in master yet:
> 38eb4e77b gvfs/libgtop: inherit upstream-version-is-even
> b42de097d squid: upgrade 3.5.27 -> 3.5.28
> f7f06219f crash: Upgrade to 7.2.5
> b3eeaf449 krb5: Upgrade to 1.17
> 666c23a48 librelp: Upgrade to 1.4.0
> 0597e7980 python-pyflame: Disable for risv architecture
> 9d8943fd2 klibc: Upgrade to 2.0.6 release
> 059aa8962 netkit-rsh: don't build under musl
> 02f050205 hdf5: fix installed-vs-shipped QA WARNING
> 93c5f4704 dnsmasq: avoid conflict with systemd-resolved
> 3189c0dc8 opencv: fix installed-vs-shipped QA WARNING
> 60f872278 kexec-tools,kexec: Fix build with latest klibc
> e51545e4c mariadb: fix atomic support on arm
> b9d6d28cd nghttp2: update to 1.37
> d3bfe0a62 libsodium: update to 1.0.17
> 4464399e5 python-networkmanager: update to 2.1
> 41c263bf8 mbedtls: update to 2.16.0
> 98461f1c2 klibc.bbclass: Add libc-klibc to overrides
> 319789e47 postgresql: Fix build for RISC-V
> 5c2c565e1 live555: Upgrade to 20190306 release
> 010c2f388 gstreamer-0.10: Remove recipes
> 6b77b1a95 libnice: Drop support for gstreamer-0.10
> 409fb4baa xfce4-mixer: Remove recipe
> 5ea50a047 packagegroup-meta-multimedia: Remove gst 0.10 related packages
> 1f0a2ec48 sysdig: Upgrade to 0.24.2+
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 77ed8fb qtbase: Adjust target mkspec settings
> not included in master yet:
> 6280bef qtscript: add fix for build with gcc 8.3
> e117b58 qtbase: Fix test builds with clang/x86_64
> 92c34de qt5: cleanup mkspecs
> fe88b99 nativesdk-qtbase: use rpath for nativesdk Qt tools
> 87f0462 qttools/cmake: use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> f2b9a4b chromium: Fix chromium build with musl again
> not included in master yet:
> ~/oe/world/yoe


