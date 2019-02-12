Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5A43160800
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:20:04 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m9so7813833qkl.4
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 18:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sedGnwCqtEHu6KkkbYDYrPFB0errKT+dCD5IEj/R/OQ=;
	b=s2yHLvYKR6k0K9ihOhx7RoHn13piTYnClQF3t6XGFqdtycoCdEKDeTG1od3KtnnTeF
	gyBt+M45BTwonSchl1jDZG+xA9MKmz3/5es9Vu17GOYHFVuKZmD5oMxF8lLBo2I5COND
	Z+yEpiFo4hCcB9zg1LyZu7aCHGXi4kXlnd2g8hVyL5gYExtyS7lJn+krH95WQlwfu9RB
	1ZS3m7uFf/Xx8iOFHoMZG1HahNL+ExS4oXj0GkbtvJPpUncL4pH1ozO603xblKnCiL5p
	JC8VEuY7hXq4ZzM2ccHD0ZxvBFHJ+qK/uybznJo52VEI/1AEUBDAUFkFx7C7JE1vQ0Tu
	ch7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sedGnwCqtEHu6KkkbYDYrPFB0errKT+dCD5IEj/R/OQ=;
	b=KnnHoyKq/v0+TuVct6cI61AeZ5RHKfmSMzh/HBw/tamQ7pgfCLwCniJuEBRVC8T965
	EYvX6R9wsf8Mo/ZX/i009G47FLHM6sTqS5EG/Mo8CUnbYWJaLZ7HnQcSiS47mWjCwQHC
	/WAodG3wKBph2pqJez8e5Sp+meTgBM6D7tblAjwXKYVnLlA3f3sJPeGbR42Go8Ta/WHT
	wtfd4QEgZE98zpWRTsKgcIj51REwwWBPFUovUhOSluTSrliRAduxsXIvOo2Ky6kqFG8t
	hXF8/W8lYXkyIb4nH6pg75Id7CZrZnQI7C96boic4OfytHe3dXNQ9skG2ybph3MrY+gz
	aMXw==
X-Gm-Message-State: AHQUAuZrqM0YMk7SlHCXcY/qyR0CAFH7BRbasuPm9CqOzGey7cXY7QVP
	1RvnE7dLyvCRtMPY0d7JONefthUQWbc2nVppSM4=
X-Google-Smtp-Source: AHgI3IY+1HV7KC2jJPIzCNeAulE7uvrd2N19VXiPCPmLvhHeIp0mLK+wRqEhdijK6u5m98hDdngrY5xD2qOV3KqbIAk=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr1007136qke.2.1549938004846;
	Mon, 11 Feb 2019 18:20:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sqokSYX8YnFvx2rOrpbFZM5VZYeS3aQYsVULEuJjTSA2w@mail.gmail.com>
	<afdfa37d-fc56-6ec8-963b-0ffb9f395ac0@gmail.com>
In-Reply-To: <afdfa37d-fc56-6ec8-963b-0ffb9f395ac0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Feb 2019 18:19:38 -0800
Message-ID: <CAMKF1srbdWE0QrOKhMsRZQzZus4qCAB++-JB4b93LqNjCb1yLA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2019-02-10
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
X-List-Received-Date: Tue, 12 Feb 2019 02:20:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 11, 2019 at 6:15 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/11/19 7:28 AM, Khem Raj wrote:
> > == Failed tasks 2019-02-10 ==
> >
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190211_072305.log
> >
> > === common (5) ===
> >     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
> >     * sources/meta-rust/recipes-devtools/rust/rust_1.31.1.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-bsp/grub/grub_2.02.bb:do_configure
> >     * sources/openembedded-core/meta/recipes-bsp/grub/grub-efi_2.02.bb:do_configure
> >     * sources/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb:do_compile
> >
> > === common-x86 (1) ===
> >     * sources/meta-openembedded/meta-oe/recipes-devtools/glade/glade_3.22.1.bb:do_configure
> >
> > === qemuarm (10) ===
> >     * sources/meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
> This has been failing for arm since at least thud, should it be black
> listed for arm?
>
> >     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
> This used to pass on thud. it failing now so I suspect something in core
> from master is causing this; binutils or kernel.
> I have not tracked it down for thud yet.
>

I think yes we have upgraded to binutils on master recently.

> - armin
> >     * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.29.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa
> >     * sources/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:do_compile
> >     * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa
> >
> > === qemuarm64 (1) ===
> >     * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
> >
> > === qemux86 (3) ===
> >     * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_compile
> >     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
> >     * sources/meta-rust/recipes-devtools/cargo/cargo_0.31.0.bb:do_compile
> >
> > === qemux86_64 (0) ===
> >
> > === Number of failed tasks (47) ===
> > {| class=wikitable
> > |-
> > || qemuarm || 15 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm.20190210_121151.log/
> > ||
> > |-
> > || qemuarm64 || 11 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemuarm64.20190210_132905.log/
> > ||
> > |-
> > || qemux86 || 9 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86.20190210_121200.log/
> > ||
> > |-
> > || qemux86_64 || 12 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.world.qemux86-64.20190210_134256.log/
> > ||
> > |}
> > ls: cannot access 'openembedded-core': No such file or directory
> > ls: cannot access 'meta-*': No such file or directory
> >
> > === PNBLACKLISTs (0) ===
> >
> > === QA issues (55) ===
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
> > ||1 ||textrel
> > |-
> > ||2 ||host-user-contaminated
> > |-
> > ||3 ||build-deps
> > |-
> > ||49 ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.signatures.20190210_231035.log/
> >
> >
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-1080p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> > in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-480p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> > /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >     * ERROR: Nothing RPROVIDES 'bigbuckbunny-720p' (but
> > /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > RDEPENDS on or otherwise requires it)
> >     * ERROR: Required build target 'meta-world-pkgdata' has no
> > buildable providers.
> >     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> > /home/jenkins/oe/world/yoe/build/tmpfs/stamps
> >
> >
> > PNBLACKLISTs:
> > ls: cannot access 'openembedded-core': No such file or directory
> > ls: cannot access 'meta-*': No such file or directory
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
> > '/tmp/work/armv5e-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
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
> > count: 49 issue: version-going-backwards
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dbg went backwards which would break package feeds
> > from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-dev went backwards which would break package feeds
> > from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-doc went backwards which would break package feeds
> > from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-locale went backwards which would break package
> > feeds from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-src went backwards which would break package feeds
> > from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package
> > atmel-qt-demo-init-staticdev went backwards which would break package
> > feeds from (0:1.1-r2.46 to 0:1.1-r2.45) [version-going-backwards]
> > atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> > went backwards which would break package feeds from (0:1.1-r2.46 to
> > 0:1.1-r2.45) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-dbg went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-dev went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-doc went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-locale went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-src went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release-staticdev went
> > backwards which would break package feeds from (0:1.0-r0.70 to
> > 0:1.0-r0.69) [version-going-backwards]
> > os-release-1.0: Package version for package os-release went backwards
> > which would break package feeds from (0:1.0-r0.70 to 0:1.0-r0.69)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-dbg went backwards
> > which would break package feeds from (0:1.0-r8.120 to 0:1.0-r8.119)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-dev went backwards
> > which would break package feeds from (0:1.0-r8.120 to 0:1.0-r8.119)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-ptest went backwards
> > which would break package feeds from (0:1.0-r8.120 to 0:1.0-r8.119)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target-src went backwards
> > which would break package feeds from (0:1.0-r8.120 to 0:1.0-r8.119)
> > [version-going-backwards]
> > packagegroup-core-standalone-sdk-target-1.0: Package version for
> > package packagegroup-core-standalone-sdk-target went backwards which
> > would break package feeds from (0:1.0-r8.120 to 0:1.0-r8.119)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-dbg went backwards which would break
> > package feeds from (0:1.0-r3.120 to 0:1.0-r3.119)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-dev went backwards which would break
> > package feeds from (0:1.0-r3.120 to 0:1.0-r3.119)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-ptest went backwards which would break
> > package feeds from (0:1.0-r3.120 to 0:1.0-r3.119)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug-src went backwards which would break
> > package feeds from (0:1.0-r3.120 to 0:1.0-r3.119)
> > [version-going-backwards]
> > packagegroup-core-tools-debug-1.0: Package version for package
> > packagegroup-core-tools-debug went backwards which would break package
> > feeds from (0:1.0-r3.120 to 0:1.0-r3.119) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-dbg went backwards which would break package
> > feeds from (0:1.0-r13.120 to 0:1.0-r13.119) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-dbg went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-dev went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug-ptest went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-debug went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-dev went backwards which would break package
> > feeds from (0:1.0-r13.120 to 0:1.0-r13.119) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-dbg went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-dev went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended-ptest went backwards which would
> > break package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-extended went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-dbg went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-dev went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics-ptest went backwards which would
> > break package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-graphics went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-dbg went backwards which would
> > break package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-dev went backwards which would
> > break package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools-ptest went backwards which would
> > break package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-host-tools went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-ptest went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-dbg went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-dev went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk-ptest went backwards which would break
> > package feeds from (0:1.0-r13.120 to 0:1.0-r13.119)
> > [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-sdk went backwards which would break package
> > feeds from (0:1.0-r13.120 to 0:1.0-r13.119) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted-src went backwards which would break package
> > feeds from (0:1.0-r13.120 to 0:1.0-r13.119) [version-going-backwards]
> > packagegroup-self-hosted-1.0: Package version for package
> > packagegroup-self-hosted went backwards which would break package
> > feeds from (0:1.0-r13.120 to 0:1.0-r13.119) [version-going-backwards]
> >
> >
> > count: 2 issue: host-user-contaminated
> > glibc-locale-2.29: glibc-locale:
> > /glibc-binary-localedata-gez-er+abegede/usr/lib/locale/gez_ER@abegede/LC_CTYPE.tmp
> > is owned by uid 3004, which is the same as the user running bitbake.
> > This may be due to host contamination [host-user-contaminated]
> > glibc-locale-2.29: glibc-locale:
> > /glibc-binary-localedata-th-th/usr/lib/locale/th_TH/LC_MEASUREMENT is
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
> > d73dbc35 server/process: Add missing exception raise
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - openembedded-core ==
> > latest upstream commit:
> > 594f858426 arch-armv7*.inc: Add Cortex vfpv4-d16 support
> > not included in master yet:
> > aea24d949e oe-build-perf-report: Improve branch comparision handling
> > 5bcd9c6f46 virglrenderer: add a recipe
> > 051f72ce53 qemu: enable virglrenderer and glx options for
> > native/nativesdk builds
> > 5ed14dc26a qemu: build target variant with gtk+, and nativesdk variant
> > without sdl
> > 859be99467 qemu: remove support for building against host sdl
> > b7fe86730b qemu: add a gettext-native dependency to gtk option
> > 577dbbee95 qemu: add a patch to avoid a missing definition error
> > 1a52fd64cf qemu: add environment variable wrappers to make qemu look
> > good with gtk frontend
> > 738c9308b2 qemu: add a backported patch to fix egl-headless support
> > 7ad7f33115 runqemu: add options for enabling virgl GL acceleration
> > 86b1839e96 runqemu: do not check for GL libraries
> > 4048c59f6b selftest: add tests for virgl GL acceleration
> > 8b48284205 grub2: Disable address-of-packed-member warnings
> > 9d6f48b233 recipes: Add runit and related recipes
> > 8130e24da7 oeqa: Recognise svlogd as another logger
> > 58ccf109ef gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
> > f2e1feda6a libunwind: Upgrade to 1.3.1 release
> > 69ba0c6669 image_types.bbclass: Set 70% RAM memory usage limit and -T for xz
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> > latest upstream commit:
> > 78f210eb3 owfs: Inherit systemd
> > not included in master yet:
> > c8e411dfa cpprest: update to 2.10.10
> > cfa4bb240 evolution-data-server: fix multilib install
> > 6bcca1626 opencv: Upgrade to 3.4.5
> > 3a0a0024b breakpad: Drop SRCPV from PV
> > 8f6995ddc catch2: Upgrade to 2.6.0
> > a07c969ae graphviz: Fix cross-build failures with clang
> > 984526c4b rocksdb: Update to 5.18 branch ( 5.18.2 )
> > 4603ff974 mongodb: Upgrade to 4.0.6
> > cde3ede25 mongodb: Fix build with clang
> > 1a502b308 ltrace: Fix build with clang
> > c19f3a771 python-requests-oauthlib: Recipes to provide support for
> > Requests-Oauthlib libraries
> > f6e0ee746 python3-twitter_3.7.0.bb: Yocto recipes for tweepy packages
> > 7baf5c363 glmark2: update to current git
> > c245374fa ace-cloud-editor_git.bb: Add recipe for ace cloud editor
> > 2e0fd7862 rapidjson: fix cmake artifacts installation for non-default
> > BASELIB case
> > 20e56eb00 python3-gevent: update to 1.4.0
> > bc3560c8e python*-jinja2: Add native and nativesdk to BBCLASSEXTEND
> > d51d78ee7 python*-markupsafe: Add native and nativesdk to BBCLASSEXTEND
> > d09996e63 python*-xlrd: Add native and nativesdk to BBCLASSEXTEND
> > dd893a009 python-protobuf: Add nativesdk to BBCLASSEXTEND
> > a600bc8a8 python-gevent: Upgrade to 1.4.0
> > 74554d3cc python-mprpc: Upgrade to 0.1.17
> > 3d7f68c30 libupnp: Upgrade to 1.8.4
> > e0fe1b047 gerbera: Update to 1.3.0
> > 5b5fae3a0 vncx11: Fix dev package do_rootfs failure
> > 47e16ad6d menulibre: Fix multilib fetch
> > f75c5e048 physfs: Fix multilib install
> > 61ee9cc00 faenza-icon-theme: Fix multilib fetch
> > d3f57ebd5 ftgl: initial add 2.1.3-rc5
> > 5c2db1ccc wifi-test-suite: Fix build with LTO
> > 357573db8 ftgl: Fix build errors with clang
> > 06d4a5427 espeak: Generate phondata based on endianness of targer
> > c4ce63b43 sysdig: Upgrade to 0.24.2+
> > a9d34e00c packagegroup-meta-oe: espeak-data is gone
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 82abc2b qtbase: fix incomplete recipe changes from previous commit
> > not included in master yet:
> > fa27c56 qtconnectivity: Fix build with clang/libc++
> > 7ef1089 maliit-framework,maliit-plugins: Fix build with libc++
> > 264066e qt5-plugin-generic-vboxtouch: Fix build with clang/libc++
> > e1194dc qtbase: Export host compiler and linker
> > 6d61d1b qtwebengine: Fix build with clang/libc++ on aarch64/arm
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > e48bd11 firefox: Backport the patch to accept "triplet" strings with
> > only two parts
> > not included in master yet:
> > be5eaf4 firefox: Fix cmsghdr errors with musl
> > 4daa687 XXX
> > ~/oe/world/yoe
>

