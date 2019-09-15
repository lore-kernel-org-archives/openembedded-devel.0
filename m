Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0917DE5A
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:54:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s17so10631114plp.2
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ilz5HMaA7l2Jjt8inXCBqt+xi2xSnuga3L1Ii3OO4xI=;
	b=Ha6+YGVZsRy2MULnpxt0b5LelRz4JKhK3jtiGSEQIoJzX8bn2X8wwMNeawEg6184hZ
	m+dfXx7PxivmiykLBn22p0+FhbS45GVRm9FwsAytMbK4DdlL5VJ7fQs0KjMql0S5mDiG
	PKUPW2rEHP1owNEd58l4TZ/RBNeAkBCF5WzLcRhiU9hC1kyGBg7yAfOdC1TYUeBHddMd
	SzS7hGBVs/RK1FloxOFyT9rVSYkslTDvRb29RHWDG9DUnt54Mx4pdodJPaAgxrUPe+PH
	ZKw+JNFqaivdC37BDEXyg1jZrWYLmTXz5DnkGoMiWDYRSqoR1TPtnrbYUppnuEe0uTge
	AP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ilz5HMaA7l2Jjt8inXCBqt+xi2xSnuga3L1Ii3OO4xI=;
	b=d1Czy5MUcnaCj3ng5/MppUO2LOXcDs06hTN9z21jP+bXTza6CYRd6z2OFWvfQ969Zo
	UjsB5b44hghTkGrPoJbVBx6E3tyKUymuLEoqpzaHeGyBC2pOQWGfppKXcM45456vWgGm
	qWeAjdzEvQchC2g0sa/G78BZYZkDjuAnrfZBsT3BHGh9fEOwh+xhAb9GCZGzR+AI2xL1
	jpB8EVqkTqYkn391K6MKX24Kb39YBU7EJGQAHLyVab9dekkVL1QH38CHxbV8oP4haMJR
	zUJU1gQzqFW0AItznXxuRxtpZQbW3UVN7u3O3fyQmzyZranYe36NjK0a23t+juFvV6Zl
	93jw==
X-Gm-Message-State: APjAAAVxLXbA6stSe/I97QoeHcUVEWXDJ0tawevS/hZt9Quhx+C+eKk2
	hEJS7S5s/D5NNZclfSWm6tZEaRKvLQY=
X-Google-Smtp-Source: APXvYqw/cN0WZNyJ2SK1BZqf1d7Dyq/iWm8lj0WoWXiZfzLDIf0cn/orbru9t6/dzYVZsGfjtWS0Qg==
X-Received: by 2002:a17:902:8a83:: with SMTP id
	p3mr38303046plo.296.1568566456108; 
	Sun, 15 Sep 2019 09:54:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c1:3eb6:7e0:d804?
	([2601:202:4180:c33:c1:3eb6:7e0:d804])
	by smtp.gmail.com with ESMTPSA id k4sm8057033pjl.9.2019.09.15.09.54.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Sep 2019 09:54:15 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1srQv2w5_6AX0c8af2+tMrLrk2HUk7C+LTYt3-Y2KGuO6A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fd8d282d-c824-22e0-edbd-da6c3bbb86ef@gmail.com>
Date: Sun, 15 Sep 2019 09:54:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srQv2w5_6AX0c8af2+tMrLrk2HUk7C+LTYt3-Y2KGuO6A@mail.gmail.com>
Subject: Re: State of OE world 2019-09-14 ( Zero build failures )
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
X-List-Received-Date: Sun, 15 Sep 2019 16:54:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Khem,

On 9/14/19 1:35 PM, Khem Raj wrote:
> As you all can see we have come to zero build time failures in the
> world builds, thanks for everyone who contributed and let's keep going
> and maintain this status and hop on to other fails we are seeing
> regarding sstate signs and version going backward.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status

Thanks for all your hard work and to the folks who sent patches to help
achieve that.

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
> ||2019-09-14 ||0 ||0 ||0 ||0 ||24 ||0 ||0 ||0 ||0 ||0 ||56 ||0 ||0 ||0
> ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2019-09-14 ==
>
> INFO: jenkins-job.sh-1.8.46 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.report.20190914_132659.log
>
> === common (0) ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemuarm64 (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (0) ===
> {| class=wikitable
> |-
> || qemuarm || 0 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm.20190914_091454.log/
> ||
> |-
> || qemuarm64 || 0 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemuarm64.20190914_095516.log/
> ||
> |-
> || qemux86 || 0 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86.20190914_085019.log/
> ||
> |-
> || qemux86_64 || 0 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.world.qemux86-64.20190914_092639.log/
> ||
> |}
>
> === PNBLACKLISTs (8) ===
>
> === QA issues (56) ===
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
> ||56 ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (24) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/zeus/log.signatures.20190914_103107.log/
>     * ERROR: 24 issues were found in these recipes: 96boards-tools
> atmel-qt-demo-init libcrypt-openssl-guess-perl-native
> libextutils-config-perl-native libextutils-helpers-perl-native
> libextutils-installpaths-perl-native libmodule-build-perl-native
> liburi-perl-native libxml-filter-buffertext-perl-native
> libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
> weston weston-init xscreensaver
>
>     * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
>     * ERROR: 1 errors found in
> signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: 4 errors found in
> signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: 3 errors found in signatures.qemuarm.do_configure.sigdata.log
>     * ERROR: 11 errors found in
> signatures.qemuarm.do_populate_sysroot.sigdata.log
>     * ERROR: 4 errors found in
> signatures.qemuarm.do_package_write_ipk.sigdata.log
>
>     * ERROR: weston-init different signature for task
> do_configure.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemux86.do_configure.sigdata.log
>     * ERROR: weston-init different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: runit different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: weston different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: weston-init different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: xscreensaver different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: 4 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: atmel-qt-demo-init different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
>     * ERROR: libxml-filter-buffertext-perl-native different signature
> for task do_configure.sigdata between qemux86copy and qemuarm
>     * ERROR: weston-init different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
>     * ERROR: 3 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemuarm.do_configure.sigdata.log
>     * ERROR: atmel-qt-demo-init different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libcrypt-openssl-guess-perl-native different signature
> for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libextutils-config-perl-native different signature for
> task do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libextutils-helpers-perl-native different signature for
> task do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libextutils-installpaths-perl-native different signature
> for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libmodule-build-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: liburi-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libxml-filter-buffertext-perl-native different signature
> for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libxml-sax-base-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: libxml-sax-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: weston-init different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
>     * ERROR: 11 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemuarm.do_populate_sysroot.sigdata.log
>     * ERROR: 96boards-tools different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: atmel-qt-demo-init different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: phpmyadmin different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: weston-init different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
>     * ERROR: 4 errors found in
> /home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1568482267/signatures.qemuarm.do_package_write_ipk.sigdata.log
>     * ERROR: 24 issues were found in these recipes: 96boards-tools
> atmel-qt-demo-init libcrypt-openssl-guess-perl-native
> libextutils-config-perl-native libextutils-helpers-perl-native
> libextutils-installpaths-perl-native libmodule-build-perl-native
> liburi-perl-native libxml-filter-buffertext-perl-native
> libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
> weston weston-init xscreensaver
>
>
> PNBLACKLISTs:
> sources/meta-96boards:
> sources/meta-atmel:
> sources/meta-browser:
> sources/meta-clang:
> sources/meta-freescale:
> sources/meta-freescale-3rdparty:
> sources/meta-intel:
> sources/meta-odroid:
> sources/meta-openembedded:
> meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
> = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
> directory"
> meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
> = "Kernel module Needs forward porting to kernel 5.2+"
> meta-oe/recipes-dbs/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] =
> "Since bbclass scons convert to python3, build mongodb failed"
> meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
> = "Kernel module Needs forward porting to kernel 5.2+"
> meta-oe/recipes-extended/sysdig/sysdig_git.bb:PNBLACKLIST[sysdig] =
> "configure: error: in
> 'TOPDIR/build/tmpfs/work/core2-64-yoe-linux/sysdig/0.26.4-r0/build/c-ares-prefix/src/c-ares'"
> meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
> "Needs forward porting to kernel 5.2+"
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:PNBLACKLIST[vboxguestdrivers]
> = "Needs forward porting to kernel 5.2+"
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
> PNBLACKLIST[evolution-data-server] = "Qemu usermode hangs forever on
> abaco/kwaj builders when doing g-ir-scanner-qemuwrapper"
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
> count: 56 issue: version-going-backwards
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dbg went backwards which would break package feeds
> from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dbg went backwards which would break package feeds
> from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dev went backwards which would break package feeds
> from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-dev went backwards which would break package feeds
> from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-doc went backwards which would break package feeds
> from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-doc went backwards which would break package feeds
> from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-locale went backwards which would break package
> feeds from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-locale went backwards which would break package
> feeds from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-src went backwards which would break package feeds
> from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-src went backwards which would break package feeds
> from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-staticdev went backwards which would break package
> feeds from (0:1.1-r2.232 to 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package
> atmel-qt-demo-init-staticdev went backwards which would break package
> feeds from (0:1.1-r2.236 to 0:1.1-r2.235) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> went backwards which would break package feeds from (0:1.1-r2.232 to
> 0:1.1-r2.230) [version-going-backwards]
> atmel-qt-demo-init-1.1: Package version for package atmel-qt-demo-init
> went backwards which would break package feeds from (0:1.1-r2.236 to
> 0:1.1-r2.235) [version-going-backwards]
> os-release-1.0: Package version for package os-release-dbg went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release-dev went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release-doc went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release-locale went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release-src went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release-staticdev went
> backwards which would break package feeds from (0:1.0-r0.234 to
> 0:1.0-r0.233) [version-going-backwards]
> os-release-1.0: Package version for package os-release went backwards
> which would break package feeds from (0:1.0-r0.234 to 0:1.0-r0.233)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-dbg went backwards
> which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-dev went backwards
> which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-ptest went backwards
> which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target-src went backwards
> which would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
> [version-going-backwards]
> packagegroup-core-standalone-sdk-target-1.0: Package version for
> package packagegroup-core-standalone-sdk-target went backwards which
> would break package feeds from (0:1.0-r8.286 to 0:1.0-r8.285)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-dbg went backwards which would break
> package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-dev went backwards which would break
> package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-ptest went backwards which would break
> package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug-src went backwards which would break
> package feeds from (0:1.0-r3.284 to 0:1.0-r3.283)
> [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package
> packagegroup-core-tools-debug went backwards which would break package
> feeds from (0:1.0-r3.284 to 0:1.0-r3.283) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-dbg went backwards which would break package
> feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-dbg went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-dev went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug-ptest went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-debug went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-dev went backwards which would break package
> feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-dbg went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-dev went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended-ptest went backwards which would
> break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-extended went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-dbg went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-dev went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics-ptest went backwards which would
> break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-graphics went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-dbg went backwards which would
> break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-dev went backwards which would
> break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools-ptest went backwards which would
> break package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-host-tools went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-ptest went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-dbg went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-dev went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk-ptest went backwards which would break
> package feeds from (0:1.0-r13.284 to 0:1.0-r13.283)
> [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-sdk went backwards which would break package
> feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted-src went backwards which would break package
> feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package
> packagegroup-self-hosted went backwards which would break package
> feeds from (0:1.0-r13.284 to 0:1.0-r13.283) [version-going-backwards]
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
> 218431b0 bitbake-user-manual: key-expansion: Don't refer to overrides
> not included in master yet:
> 67279466 runqueue/siggen: Optimise hash equiv queries
> f885155f hashserv: Drop handler thread
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> 86b8a1d534 libevent: don't treat test stats line as pass/fail in ptest
> not included in master yet:
> 47edd51970 resulttool: Handle multiple series containing ptestresults
> 34d9f60a8c gcc-cross.inc: Process binaries in build dir to be relocatable
> 06cba9883a oeqa/core/case.py: Add OEPTestResultTestCase for ptestresult helpers
> b75aced558 oeqa/selftest: Rework toolchain tests to use OEPTestResultTestCase
> 267eb1ac98 recipes: Add runit and related recipes
> 97730884a0 elfutils: Fix build on ppc/musl
> cfe128eee6 ptrace: Drop ptrace aid for musl/ppc
> ef469345d0 python3native,pythonnative: Separate definition and export
> of PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
> 2fd39ce85e cogl: Do not depend PN-dev on empty PN
> 2979822373 musl: Update to latest master
> 6a8fe83816 weston-init: Add possibility to run weston as non-root user
> d5d064418e nativesdk.bbclass: Clear out LIBCEXTENSION and ABIEXTENSION
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> a2928764c analyze-suspend: update to 5.5
> not included in master yet:
> 61ccc6d4a mycroft: Remove alsa-oss from rdeps
> 9f825cb31 capnproto: update to 0.7.0
> b7e70d79f ddrescue: update to 1.24
> ee2df5419 fmt: update to 6.0.0
> f94ba5038 jsonrpc: update to 1.2.0
> e45826be2 libburn: update to 1.5.0
> 003f3ad54 libdvdread: update to 6.0.1
> 7d5a99f3f libev: update to 4.27
> f15e4c2e1 libmodplug: update to 0.8.9.0
> aa1387e01 libnice: update to 0.1.16
> 8225bc223 libopus: update to 1.3.1
> 1ca5f1069 libsass: update to 3.6.1
> ed143daed libuv: update to 1.32.0
> 9a0de2779 libsocketcan: update to 0.0.11
> 339494109 tree: update to 1.8.0
> 1e4aebcbf xclock: update to 1.0.9
> 8e4d4391f xcursorgen: update to 1.0.7
> b75237277 xfontsel: update to 1.0.6
> 558fa0591 xmag: update to 1.0.6
> 91658fdf3 xmessage: update to 1.0.5
> 6cde2ccbc xorg-sgml-doctools: update to 1.11
> 4559c0f1f yad: new package
> 7c69fbdfd zenity: new package
> 184cf325c unclutter-xfixes: new package
> 4a80e3700 libqmi: Replace clang patch with configure option
> 40366aee7 bigbuckbunny: Use faster download mirrors
> 62fc26075 tcpdump: Fix CVE-2017-16808
> 19528ba2a evtest: update to 1.34
> efc0b23ea sysdig: Upgrade to 0.26.4
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 12ea469 qttools: Add CONFIG+=config_clang_done when not building with clang
> not included in master yet:
> eb63611 qt5-creator: Fix clangformat with clang 9.x
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> e4ac6bb chromium: Update to 76.0.3808.132.
> not included in master yet:
> ~/oe/world/yoe


