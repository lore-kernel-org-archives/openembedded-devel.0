Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E51856011A
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 19:57:03 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z13so8479912qki.2
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=heArUAH61ByJNw07oKItRMujDTgD1bESXOT5ufod1fI=;
	b=Hv145WhAevInC2Q7o7/Fn4HnihX5K7f8TBsBcsMdbokyuwjBo1XKTvD7CT7n2sQXad
	iKc5Zv/BPzuQ7uLmwEZh9sS+HF/dblGx+a0VK2rR1DT6tRp0uweq1Jo9HLBMY1gTY4km
	ZKB+TkzJVQBsVRLzyIfXTq6TyCSVjxZcefiWt0ZcQP/EsoAt6bAW6K0/RD9IrTb6UTbK
	Mx/onzwGBLAgsYZEeG5EMy3p+KYsxW9bmMx+IMDMVHMbJA33xr/BlxKgFSFiz5Rxw8WV
	8B+HAZ2zp9rIKX5QBjaM6sPNkgSb1n3jD++ldDPhILwECbTJUg48RoD0WMgYmHcbVbHn
	OdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=heArUAH61ByJNw07oKItRMujDTgD1bESXOT5ufod1fI=;
	b=dxaH6RLjr//klM7UO/tWscgus9Lhkj4YIElC2v1ES6F8WgEzoZtszbS96pfvzEfGUj
	/D0bUrNL3YTD+SDED/IohXJHac2ZiThGpTdkwjnByxd1qfraSfMdyEDtkmYLPkTApioI
	9R6QPraVruKConqzjfzlI7vb7T23+tbzehxyHyCByIEZ2jUNniyb0iSESrE22kr80JbY
	hQ129U/bCdm75x60n9gLfnxswzb82AlwsERYclJIo2D9Vd59Gnu9L/xz0jqkH4BK2jCf
	xmb7DxI1pUQX2DHTeU21EjxmSRMsF18nFo0x/tgzstXAY2URHwzCbGqyWO4t8KwACfGl
	al7A==
X-Gm-Message-State: APjAAAVLqtrJPbeCttdVxmevGncfFsJ+7oP3l07wfAF69KV0kPyOBT1F
	1Y0GSYuwBcpWULnUUvPJW2il/BjbJcFoazH9cEY=
X-Google-Smtp-Source: APXvYqzuKXdihrAXDFafo6kpeAlPAwSnpkvkSheLRG13YbCeDBDHP4wdnVhT61Onu/xiFRfGniIL3H4zLOI9s/6m1GM=
X-Received: by 2002:a37:6814:: with SMTP id d20mr10562999qkc.102.1552852624279;
	Sun, 17 Mar 2019 12:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<a3929e03-c4ef-d9cd-6267-7e1166ffc923@gmail.com>
In-Reply-To: <a3929e03-c4ef-d9cd-6267-7e1166ffc923@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Mar 2019 12:56:38 -0700
Message-ID: <CAMKF1srmpwd6Bz29VaR_3x0y7yY_aYgGoj6rQqg+bRKm0rseRw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 17 Mar 2019 19:57:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 17, 2019 at 9:46 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/17/19 8:26 AM, Khem Raj wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > == Failed tasks 2019-03-16 ==
> >
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190317_082308.log
> >
> > === common (2) ===
> >     * sources/meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
> >
> > === common-x86 (1) ===
> >     * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile
> >
> > === qemuarm (6) ===
> >     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
> >     * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
> >     * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa
> >
> > === qemuarm64 (5) ===
> >     * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa
> >
> > === qemux86 (4) ===
> >     * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb:do_compile
> >     * sources/meta-browser/recipes-browser/chromium/chromium-x11_72.0.3626.121.bb:do_compile
> >     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
> >     * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.33.0.bb:do_compile
> >
> > === qemux86_64 (1) ===
> >     * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa
>
> Are any of the meta-openembedded recipes above earmarked for
> blacklisting for warrior?
>

Not yet, I am hoping they will be fixed in due course.

> - armin
> >
> > === Number of failed tasks (33) ===
> > {| class=wikitable
> > |-
> > || qemuarm || 8 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190316_182729.log/
> > ||
> > |-
> > || qemuarm64 || 9 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190316_204957.log/
> > ||
> > |-
> > || qemux86 || 8 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190316_043014.log/
> > ||
> > |-
> > || qemux86_64 || 8 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190316_070310.log/
> > ||
> > |}
> >
> > === PNBLACKLISTs (2) ===
> >
> > === QA issues (61) ===
> > {| class=wikitable
> > !| Count ||Issue
> > |-
> > ||0 ||already-stripped
> > |-
> > ||0 ||compile-host-path
> > |-
> > ||0 ||file-rdeps
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
> > ||0 ||unknown-configure-option
> > |-
> > ||1 ||host-user-contaminated
> > |-
> > ||1 ||textrel
> > |-
> > ||3 ||build-deps
> > |-
> > ||56 ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190316_221024.log/
> >
> >
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> > in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> > /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> > /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >
> >
> > PNBLACKLISTs:
> > sources/meta-96boards:
> > sources/meta-atmel:
> > sources/meta-browser:
> > sources/meta-freescale:
> > sources/meta-freescale-3rdparty:
> > sources/meta-intel:
> > sources/meta-odroid:
> > sources/meta-openembedded:
> > meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:PNBLACKLIST[librcf]
> > = " error: invalid use of incomplete type 'RCF::AsioIoService {aka
> > class boost::asio::io_service}; among others?"
> > sources/meta-qcom:
> > sources/meta-qt5:
> > sources/meta-raspberrypi:
> > sources/meta-riscv:
> > sources/meta-rust:
> > sources/meta-ti:
> > sources/meta-variscite-fslc:
> > sources/meta-yoe:
> > sources/openembedded-core:
> > meta/lib/oeqa/selftest/cases/imagefeatures.py:PNBLACKLIST[busybox] =
> > "Don't build this"
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
> > PNBLACKLIST[smartrefrigerator] = "Needs porting to QT > 5.6"
> > PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
> > PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
> > PNBLACKLIST[homeautomation] = "Needs porting to QT > 5.6"
> > PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
> > PNBLACKLIST[applicationlauncher] = "Needs porting to QT > 5.6"
> >
> >
> > QA issues by type:
> > count: 0 issue: already-stripped
> >
> >
> > count: 0 issue: libdir
> >
> >
> > count: 1 issue: textrel
> > mpeg2dec-0.5.1: ELF binary
> > '/tmp/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
> > has relocations in .text [textrel]
> >
> >
> > count: 3 issue: build-deps
> > glide-0.13.2: glide rdepends on libstd-rs, but it isn't a build
> > dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> > [build-deps]
> > go-dep-0.5.0: go-dep rdepends on libstd-rs, but it isn't a build
> > dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> > [build-deps]
> > go-helloworld-0.1: go-helloworld rdepends on libstd-rs, but it isn't a
> > build dependency, missing libstd-rs in DEPENDS or PACKAGECONFIG?
> > [build-deps]
> >
> >
> > count: 0 issue: file-rdeps
> >
> >
> > count: 56 issue: version-going-backwards
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dbg went backwards which would break package feeds
> > from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dbg went backwards which would break package feeds
> > from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dev went backwards which would break package feeds
> > from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dev went backwards which would break package feeds
> > from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-doc went backwards which would break package feeds
> > from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-doc went backwards which would break package feeds
> > from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-locale went backwards which would break package
> > feeds from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-locale went backwards which would break package
> > feeds from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-src went backwards which would break package feeds
> > from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-src went backwards which would break package feeds
> > from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-staticdev went backwards which would break package
> > feeds from (0:1.1-r2.79 to 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-staticdev went backwards which would break package
> > feeds from (0:1.1-r2.88 to 0:1.1-r2.87) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> > went backwards which would break package feeds from (0:1.1-r2.79 to
> > 0:1.1-r2.78) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> > went backwards which would break package feeds from (0:1.1-r2.88 to
> > 0:1.1-r2.87) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-dbg went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-dev went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-doc went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-locale went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-src went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-staticdev went
> > backwards which would break package feeds from (0:1.0-r0.98 to
> > 0:1.0-r0.97) [version-going-backwards]
> > os-release-1.0: Package version for package os-release went backwards
> > which would break package feeds from (0:1.0-r0.98 to 0:1.0-r0.97)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-dbg went backwards
> > which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-dev went backwards
> > which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-ptest went backwards
> > which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-src went backwards
> > which would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target went backwards which
> > would break package feeds from (0:1.0-r8.148 to 0:1.0-r8.147)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-dbg went backwards which would break
> > package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-dev went backwards which would break
> > package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-ptest went backwards which would break
> > package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-src went backwards which would break
> > package feeds from (0:1.0-r3.148 to 0:1.0-r3.147)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug went backwards which would break package
> > feeds from (0:1.0-r3.148 to 0:1.0-r3.147) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-dbg went backwards which would break package
> > feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-dbg went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-dev went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-ptest went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-dev went backwards which would break package
> > feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-dbg went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-dev went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-ptest went backwards which would
> > break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-dbg went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-dev went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-ptest went backwards which would
> > break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-dbg went backwards which would
> > break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-dev went backwards which would
> > break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-ptest went backwards which would
> > break package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-ptest went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-dbg went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-dev went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-ptest went backwards which would break
> > package feeds from (0:1.0-r13.148 to 0:1.0-r13.147)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk went backwards which would break package
> > feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-src went backwards which would break package
> > feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted went backwards which would break package
> > feeds from (0:1.0-r13.148 to 0:1.0-r13.147) [version-going-backwards]
> >
> >
> > count: 1 issue: host-user-contaminated
> > glibc-locale-2.29: glibc-locale:
> > /glibc-binary-localedata-mag-in/usr/lib/locale/mag_IN/LC_CTYPE is
> > owned by uid 3004, which is the same as the user running bitbake. This
> > may be due to host contamination [host-user-contaminated]
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
> > 6065540c .gitattributes: Add to improve git diff for minified css/js files
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - openembedded-core ==
> > latest upstream commit:
> > afea472cdc systemd: do not disable SELinux with musl
> > not included in master yet:
> > 55ed568c2d lttng-tools ptest: add missing dependencies
> > 991f971050 lttng-tools ptest: fix test_ust-dl
> > e0f9710025 lttng-ust: add python3-agent feature
> > a450f34cd6 resulttool/report: Enable roll-up report for a commit
> > 55f7d0de90 xev: update to 1.2.3
> > 5b2d9d12ec glibc: fix do_populate_sdk fail when multilib used
> > 8c7fbd3b17 mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
> > 432192e0c7 inetutils: Remove talk / talkd from ALTERNATIVES
> > ac7ea9011b inetutils: Handle rsh, etc more consistently
> > 584c12c892 inetutils: Disable rsh, etc in the build
> > a2d8bd2705 virglrenderer: requires distro feature opengl
> > 5c0b937f30 glib-2.0: clean up EXTRA_OEMESON
> > 8a47f45962 systemd: drop unused kill-path option
> > f4b08a0610 shadow: drop inappropriate patch
> > 6a78430c82 class/sanity: strip the output of get_filesystem_id()
> > 95164cbc13 gst-examples: switch to gitlab url and https protocol
> > 5c5c4c80fe systemd: fix CVE-2019-6454
> > fbded47018 iproute2: add tc to the alternatives list
> > 42741dc701 fixup
> > 3337aa2ced oeqa/manual/bsp-hw.json: test id updated and obsolete test
> > cases removed
> > 567c6c82b7 oeqa/manual/compliance-test.json: test id updated and
> > missing test cases added
> > 3bdae69c94 oeqa/manual/kernel-dev.json: test id updated
> > 79da19b826 fixup
> > 57476421be recipes: Add runit and related recipes
> > db750cc7d3 oeqa: Recognise svlogd as another logger
> > 66ff9aa6d4 gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
> > a47d60761d arch-armv5-dsp.inc: Check for dsp only to enable 'e' in
> > package arches
> > a9d66477ee cross-canadian.bbclass: Do not override LIBCOVERRIDE with
> > SDK libc override
> > 81d34140d4 go: Minor 1.21.1 patch update
> > 4833bdeb9d lttng: Enable on musl and riscv
> > e633820dc3 packagegroup-core-tools-profile: Do not remove lttng-ust
> > for musl and risc-v
> > a32f61aeed gdb: Do not disable lttng-ust on risc-v
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> > latest upstream commit:
> > 0248b3ee2 wireshark: upgrade to 3.0.0
> > not included in master yet:
> > 38eb4e77b gvfs/libgtop: inherit upstream-version-is-even
> > b42de097d squid: upgrade 3.5.27 -> 3.5.28
> > f7f06219f crash: Upgrade to 7.2.5
> > b3eeaf449 krb5: Upgrade to 1.17
> > 666c23a48 librelp: Upgrade to 1.4.0
> > 0597e7980 python-pyflame: Disable for risv architecture
> > 9d8943fd2 klibc: Upgrade to 2.0.6 release
> > 059aa8962 netkit-rsh: don't build under musl
> > 02f050205 hdf5: fix installed-vs-shipped QA WARNING
> > 93c5f4704 dnsmasq: avoid conflict with systemd-resolved
> > 3189c0dc8 opencv: fix installed-vs-shipped QA WARNING
> > 60f872278 kexec-tools,kexec: Fix build with latest klibc
> > e51545e4c mariadb: fix atomic support on arm
> > b9d6d28cd nghttp2: update to 1.37
> > d3bfe0a62 libsodium: update to 1.0.17
> > 4464399e5 python-networkmanager: update to 2.1
> > 41c263bf8 mbedtls: update to 2.16.0
> > 98461f1c2 klibc.bbclass: Add libc-klibc to overrides
> > 319789e47 postgresql: Fix build for RISC-V
> > 5c2c565e1 live555: Upgrade to 20190306 release
> > 010c2f388 gstreamer-0.10: Remove recipes
> > 6b77b1a95 libnice: Drop support for gstreamer-0.10
> > 409fb4baa xfce4-mixer: Remove recipe
> > 5ea50a047 packagegroup-meta-multimedia: Remove gst 0.10 related packages
> > 1f0a2ec48 sysdig: Upgrade to 0.24.2+
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 77ed8fb qtbase: Adjust target mkspec settings
> > not included in master yet:
> > 6280bef qtscript: add fix for build with gcc 8.3
> > e117b58 qtbase: Fix test builds with clang/x86_64
> > 92c34de qt5: cleanup mkspecs
> > fe88b99 nativesdk-qtbase: use rpath for nativesdk Qt tools
> > 87f0462 qttools/cmake: use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > f2b9a4b chromium: Fix chromium build with musl again
> > not included in master yet:
> > ~/oe/world/yoe
>

