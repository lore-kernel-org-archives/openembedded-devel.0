Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 621A96093F
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 22:20:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g23-v6so8057156plq.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EenZNyfC4U0PBuAY4pHNzyQpsmOGVnwckUr8qQS6jeg=;
	b=gRMhuH2+TptUlOqo5dOBeQhtOILZNrxigXifl0keGLK+m0psLfL8UL5HZYoFZ+xKm+
	gpL1ztIAZw6NvgHLlmue00gydHuFbrspqYwlXAbY52Ymw5TH1htAmn1SZ6inCKcw3kAA
	996kCJfQHjq6h3ksz698rNrehv1r1LBpkb8h3k2W290m2SDJkVC1+Qfgud4z+bHtzFhP
	ApuPzRK2oZAHsZ7YtVdeN6Uq29N45RsDe4gCoaytyPJPL4PF09rVirobkt4ZtFQKmYI9
	dbOeCjPnm8Eqq0ovFT8qFGDEGD5ZuWh6W+Du+A0axSmHXNn7Giuq2gD6ubcUdizz5G7b
	r+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EenZNyfC4U0PBuAY4pHNzyQpsmOGVnwckUr8qQS6jeg=;
	b=t9GptOh6ar++hd93ePqNJgs/vflEJcfp8QX6+qE/Kw8scRCrcplcsu8uvpemMhmlAo
	3z9Xa/LDPPk0zUrK+s4GYt5NiKUU2gGFmZKJL+Zo2THemRQb8T6KiuqxNlS2oU/qeiUE
	IgzRmHgvc21Ox7khNowXnu03xPDjHckDKZEeE3zca/Ov3Y6PUiz0GVJ6LBCtiT99k0hO
	wlRq7a1iqtIUlvig9KSsok575fJ7YSuPYZs6HAGUQDAuMtEZsvgfOxVJ4KkJYCl4plRt
	owcbo2oUPTK88vr16Y1ZRWKGUCF84FLCDH0Hxf9RZkXfPNloaSOkg9BYVYxRi5xs8Fzl
	n/jg==
X-Gm-Message-State: APzg51BYXLJufpJKA6auKKXXxekxcRpnNShz3ZdQfdH68Hk77DNnrLsk
	8O9c3vsM0KVnHNsQLNDn/6iLG+YepnSKlpffCgu4kXev
X-Google-Smtp-Source: ANB0VdY2jTSwZKw8J0DY9q2sze4DH/CC+AroFDshwOAKtp7+E8d5DKQO7XkXRRtQv/6mmzStqbH4n+08cGTz+TxJmPo=
X-Received: by 2002:a17:902:68:: with SMTP id
	95-v6mr26359324pla.248.1537222845160; 
	Mon, 17 Sep 2018 15:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spHMgz_31D+qyEz_wFrv4jcTF8figG_iEsAQ68BcOxU_A@mail.gmail.com>
	<CAAQYJAsokmX=DnpFBpqtG+PCqK8Z-yS7AmJqPsy44Zdvm2VLoA@mail.gmail.com>
	<CAMKF1soq-QrpMMbrCRzGJOHqnpCDphWHSkzP8SVHnWO0Vnk2-w@mail.gmail.com>
In-Reply-To: <CAMKF1soq-QrpMMbrCRzGJOHqnpCDphWHSkzP8SVHnWO0Vnk2-w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 18 Sep 2018 00:20:31 +0200
Message-ID: <CAAQYJAsfGfe2WWpz=co-KURRK6qYuOa0ukyBDvws3k0WsiejGw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-09-15
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
X-List-Received-Date: Mon, 17 Sep 2018 22:20:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 17, 2018 at 11:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Sep 17, 2018 at 8:38 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> On Sun, Sep 16, 2018 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > http://www.openembedded.org/wiki/Bitbake_World_Status
>> >
>> > == Failed tasks 2018-09-15 ==
>> >
>> > INFO: jenkins-job.sh-1.8.45 Complete log available at
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180916_060104.log
>> >
>> > === common (0) ===
>> >
>> > === common-x86 (3) ===
>> >     * sources/meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_package
>> >     * sources/meta-qt5/recipes-python/pyqt5/python-pyqt5_5.10.1.bb:do_configure
>> >     * sources/meta-qt5/recipes-qt/qt5/qtwebkit-examples_git.bb:do_compile
>> >
>> > === qemuarm (6) ===
>> >     * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb:do_package_qa
>> >     * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb:do_package_qa
>> >     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>> >     * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
>> >     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_package_qa
>> >     * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile
>> >
>> > === qemuarm64 (2) ===
>> >     * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_71.0.3545.0.r589108.igalia.1.bb:do_compile
>> >     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_install
>> >
>> > === qemux86 (8) ===
>> >     * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
>> >     * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
>> >     * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
>> >     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>> >     * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>> >     * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.7.bb:do_package_qa
>> >     * sources/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb:do_compile
>> >     * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
>> >
>> > === qemux86_64 (1) ===
>> >     * sources/meta-browser/recipes-browser/firefox/firefox_52.9.0esr.bb:do_configure
>> >
>> > === Number of failed tasks (32) ===
>> > {| class=wikitable
>> > |-
>> > || qemuarm || 6 ||
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180915_081551.log/
>> > ||
>> > |-
>> > || qemuarm64 || 7 ||
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180915_125453.log/
>> > ||
>> > |-
>> > || qemux86 || 14 ||
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180915_081220.log/
>> > ||
>> > |-
>> > || qemux86_64 || 5 ||
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180915_155207.log/
>> > ||
>> > |}
>> >
>> > === PNBLACKLISTs (0) ===
>> >
>> > === QA issues (150) ===
>> > {| class=wikitable
>> > !| Count ||Issue
>> > |-
>> > ||0 ||already-stripped
>> > |-
>> > ||0 ||build-deps
>> > |-
>> > ||0 ||compile-host-path
>> > |-
>> > ||0 ||file-rdeps
>> > |-
>> > ||0 ||host-user-contaminated
>> > |-
>> > ||0 ||invalid-pkgconfig
>> > |-
>> > ||0 ||ldflags
>> > |-
>> > ||0 ||libdir
>> > |-
>> > ||0 ||pkgname
>> > |-
>> > ||0 ||qa_pseudo
>> > |-
>> > ||0 ||symlink-to-sysroot
>> > |-
>> > ||0 ||unknown-configure-option
>> > |-
>> > ||117 ||textrel
>> > |-
>> > ||1 ||installed-vs-shipped
>> > |-
>> > ||32 ||version-going-backwards
>> > |}
>> >
>> >
>> >
>> > === Incorrect PACKAGE_ARCH or sstate signatures (12) ===
>> >
>> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180915_194247.log/
>> >     * ERROR: 12 issues were found in these recipes: 96boards-tools
>> > oprofile packagegroup-core-standalone-sdk-target
>> > packagegroup-core-tools-debug packagegroup-self-hosted
>> > phoronix-test-suite phpmyadmin umip
>> >
>> >     * ERROR: 2 errors found in signatures.qemux86.do_configure.sigdata.log
>> >     * ERROR: 2 errors found in
>> > signatures.qemux86.do_populate_sysroot.sigdata.log
>> >     * ERROR: 2 errors found in
>> > signatures.qemux86.do_package_write_ipk.sigdata.log
>> >     * ERROR: 6 errors found in
>> > signatures.qemuarm.do_package_write_ipk.sigdata.log
>> >
>> >     * ERROR: oprofile different signature for task
>> > do_configure.sigdata between qemux86copy and qemux86
>> >     * ERROR: umip different signature for task do_configure.sigdata
>> > between qemux86copy and qemux86
>> >     * ERROR: 2 errors found in
>> > /home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1537076567/signatures.qemux86.do_configure.sigdata.log
>> >     * ERROR: oprofile different signature for task
>> > do_populate_sysroot.sigdata between qemux86copy and qemux86
>> >     * ERROR: umip different signature for task
>> > do_populate_sysroot.sigdata between qemux86copy and qemux86
>> >     * ERROR: 2 errors found in
>> > /home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1537076567/signatures.qemux86.do_populate_sysroot.sigdata.log
>> >     * ERROR: oprofile different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemux86
>> >     * ERROR: umip different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemux86
>> >     * ERROR: 2 errors found in
>> > /home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1537076567/signatures.qemux86.do_package_write_ipk.sigdata.log
>> >     * ERROR: 96boards-tools different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemuarm
>> >     * ERROR: packagegroup-core-standalone-sdk-target different
>> > signature for task do_package_write_ipk.sigdata between qemux86copy
>> > and qemuarm
>> >     * ERROR: packagegroup-core-tools-debug different signature for
>> > task do_package_write_ipk.sigdata between qemux86copy and qemuarm
>> >     * ERROR: packagegroup-self-hosted different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemuarm
>> >     * ERROR: phoronix-test-suite different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemuarm
>> >     * ERROR: phpmyadmin different signature for task
>> > do_package_write_ipk.sigdata between qemux86copy and qemuarm
>> >     * ERROR: 6 errors found in
>> > /home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1537076567/signatures.qemuarm.do_package_write_ipk.sigdata.log
>> >     * ERROR: 12 issues were found in these recipes: 96boards-tools
>> > oprofile packagegroup-core-standalone-sdk-target
>> > packagegroup-core-tools-debug packagegroup-self-hosted
>> > phoronix-test-suite phpmyadmin umip
>> >
>> >
>> > PNBLACKLISTs:
>> > openembedded-core/:
>> > meta-*:
>> > PNBLACKLIST[android-system] = "depends on lxc from
>> > meta-virtualiazation which isn't included in my world builds"
>> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
>> > tested so much"
>> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
>> > tested so much"
>> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
>> > tested so much"
>> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
>> > tested so much"
>> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
>> > tested so much"
>> > PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
>> > directory in /home/builder/poky :/"
>> >
>> >
>> > QA issues by type:
>> > count: 0 issue: already-stripped
>> >
>> >
>> > count: 0 issue: libdir
>> >
>> >
>> > count: 117 issue: textrel
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cat/bin/cat'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-chroot/bin/chroot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cpio/bin/cpio'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dd/bin/dd'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dmesg/bin/dmesg'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-false/bin/false'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-fstype/bin/fstype'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-halt/bin/halt'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ipconfig/bin/ipconfig'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kill/bin/kill'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ln/bin/ln'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-losetup/sbin/losetup'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ls/bin/ls'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-minips/bin/minips'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkdir/bin/mkdir'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkfifo/bin/mkfifo'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mknod/bin/mknod'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mount/bin/mount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mv/bin/mv'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nfsmount/bin/nfsmount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nuke/bin/nuke'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-pivot-root/bin/pivot_root'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-poweroff/bin/poweroff'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-readlink/bin/readlink'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-reboot/bin/reboot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-resume/bin/resume'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-run-init/bin/run-init'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sh/bin/sh'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sleep/bin/sleep'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sync/bin/sync'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-true/bin/true'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-umount/bin/umount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-uname/bin/uname'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cat/bin/cat'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-chroot/bin/chroot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cpio/bin/cpio'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dd/bin/dd'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dmesg/bin/dmesg'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-false/bin/false'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-fstype/bin/fstype'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-halt/bin/halt'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ipconfig/bin/ipconfig'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kill/bin/kill'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ln/bin/ln'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-losetup/sbin/losetup'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ls/bin/ls'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-minips/bin/minips'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkdir/bin/mkdir'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkfifo/bin/mkfifo'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mknod/bin/mknod'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mount/bin/mount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mv/bin/mv'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nfsmount/bin/nfsmount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nuke/bin/nuke'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-pivot-root/bin/pivot_root'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-poweroff/bin/poweroff'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-readlink/bin/readlink'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-reboot/bin/reboot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-resume/bin/resume'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-run-init/bin/run-init'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sh/bin/sh'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sleep/bin/sleep'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sync/bin/sync'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-true/bin/true'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-umount/bin/umount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-uname/bin/uname'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cat/bin/cat'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-chroot/bin/chroot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-cpio/bin/cpio'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dd/bin/dd'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-dmesg/bin/dmesg'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-false/bin/false'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-fstype/bin/fstype'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-halt/bin/halt'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ipconfig/bin/ipconfig'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kill/bin/kill'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ln/bin/ln'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-losetup/sbin/losetup'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-ls/bin/ls'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-minips/bin/minips'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkdir/bin/mkdir'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mkfifo/bin/mkfifo'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mknod/bin/mknod'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mount/bin/mount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-mv/bin/mv'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nfsmount/bin/nfsmount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-nuke/bin/nuke'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-pivot-root/bin/pivot_root'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-poweroff/bin/poweroff'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-readlink/bin/readlink'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-reboot/bin/reboot'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-resume/bin/resume'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-run-init/bin/run-init'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sh/bin/sh'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sleep/bin/sleep'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-sync/bin/sync'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-true/bin/true'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-umount/bin/umount'
>> > has relocations in .text [textrel]
>> > klibc-static-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-static-utils/2.0.4-r0/packages-split/klibc-static-utils-uname/bin/uname'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-utils/2.0.4-r0/packages-split/klibc-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/aarch64-bec-linux/klibc-utils/2.0.4-r0/packages-split/klibc-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-utils/2.0.4-r0/packages-split/klibc-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/armv5te-bec-linux-gnueabi/klibc-utils/2.0.4-r0/packages-split/klibc-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-utils/2.0.4-r0/packages-split/klibc-utils-gzip/bin/gzip'
>> > has relocations in .text [textrel]
>> > klibc-utils-2.0.4: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/klibc-utils/2.0.4-r0/packages-split/klibc-utils-kinit/bin/kinit'
>> > has relocations in .text [textrel]
>> > mesa-18.1.7: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libglapi/usr/lib/libglapi.so.0.0.0'
>> > has relocations in .text [textrel]
>> > mesa-18.1.7: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles1-mesa/usr/lib/libGLESv1_CM.so.1.1.0'
>> > has relocations in .text [textrel]
>> > mesa-18.1.7: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles2-mesa/usr/lib/libGLESv2.so.2.0.0'
>> > has relocations in .text [textrel]
>> > mesa-18.1.7: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgl-mesa/usr/lib/libGL.so.1.2.0'
>> > has relocations in .text [textrel]
>> > x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
>> > has relocations in .text [textrel]
>> > x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
>> > '/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
>> > has relocations in .text [textrel]
>> >
>> >
>> > count: 0 issue: build-deps
>> >
>> >
>> > count: 0 issue: file-rdeps
>> >
>> >
>> > count: 32 issue: version-going-backwards
>> > packagegroup-core-standalone-sdk-target-1.0: Package version for
>> > package packagegroup-core-standalone-sdk-target-dbg went backwards
>> > which would break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
>> > [version-going-backwards]
>> > packagegroup-core-standalone-sdk-target-1.0: Package version for
>> > package packagegroup-core-standalone-sdk-target-dev went backwards
>> > which would break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
>> > [version-going-backwards]
>> > packagegroup-core-standalone-sdk-target-1.0: Package version for
>> > package packagegroup-core-standalone-sdk-target-ptest went backwards
>> > which would break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
>> > [version-going-backwards]
>> > packagegroup-core-standalone-sdk-target-1.0: Package version for
>> > package packagegroup-core-standalone-sdk-target went backwards which
>> > would break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
>> > [version-going-backwards]
>> > packagegroup-core-tools-debug-1.0: Package version for package
>> > packagegroup-core-tools-debug-dbg went backwards which would break
>> > package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
>> > [version-going-backwards]
>> > packagegroup-core-tools-debug-1.0: Package version for package
>> > packagegroup-core-tools-debug-dev went backwards which would break
>> > package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
>> > [version-going-backwards]
>> > packagegroup-core-tools-debug-1.0: Package version for package
>> > packagegroup-core-tools-debug-ptest went backwards which would break
>> > package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
>> > [version-going-backwards]
>> > packagegroup-core-tools-debug-1.0: Package version for package
>> > packagegroup-core-tools-debug went backwards which would break package
>> > feeds from (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-dbg went backwards which would break package
>> > feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-debug-dbg went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-debug-dev went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-debug-ptest went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-debug went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-dev went backwards which would break package
>> > feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-extended-dbg went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-extended-dev went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-extended-ptest went backwards which would
>> > break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-extended went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-graphics-dbg went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-graphics-dev went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-graphics-ptest went backwards which would
>> > break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-graphics went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-host-tools-dbg went backwards which would
>> > break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-host-tools-dev went backwards which would
>> > break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-host-tools-ptest went backwards which would
>> > break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-host-tools went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-ptest went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-sdk-dbg went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-sdk-dev went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-sdk-ptest went backwards which would break
>> > package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
>> > [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted-sdk went backwards which would break package
>> > feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
>> > packagegroup-self-hosted-1.0: Package version for package
>> > packagegroup-self-hosted went backwards which would break package
>> > feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
>> >
>> >
>> > count: 0 issue: host-user-contaminated
>> >
>> >
>> > count: 1 issue: installed-vs-shipped
>> > libqofono: 2 installed and not shipped files. [installed-vs-shipped]
>> >
>> >
>> > count: 0 issue: unknown-configure-option
>> >
>> >
>> > count: 0 issue: symlink-to-sysroot
>> >
>> >
>> > count: 0 issue: invalid-pkgconfig
>> >
>> >
>> > count: 0 issue: pkgname
>> >
>> >
>> > count: 0 issue: ldflags
>> >
>> >
>> > count: 0 issue: compile-host-path
>> >
>> >
>> > count: 0 issue: qa_pseudo
>> >
>> >
>> >
>> > This git log matches with the metadata as seen by qemuarm build.
>> > In some cases qemux86 and qemux86-64 builds are built with slightly
>> > different metadata, you can see the exact version near the top of each
>> > log.world.qemu* files linked from the report
>> > ~/oe/world/oe-build ~/oe/world/oe-build
>> >
>> > == Tested changes (not included in master yet) - bitbake ==
>> > latest upstream commit:
>> > 464d033 runqueue: Ensure setscene tasks that aren't covered get built
>> > not included in master yet:
>> >
>> > == Tested changes (not included in master yet) - openembedded-core ==
>> > latest upstream commit:
>> > d180dc7 oeqa/selftest/recipetool: fix non-determinism in cmake test
>> > not included in master yet:
>> > c70bb5a musl: Wire-up name_to_handle_at and name_to_handle_at syscalls
>> > d24bafa musl: Add MAX_HANDLE_SZ
>> > a0b3389 udev-extraconf: Add systemd-mount to udev-extraconf/mount.sh
>> > 350b7bf mtools: Fix build with clang
>> >
>> > == Tested changes (not included in master yet) - meta-openembedded ==
>> > latest upstream commit:
>> > 131eb1f split net-snmp-libs into smaller packages
>> > not included in master yet:
>> > 99c7136 libpwquality: clean up python3-libpwquality
>> > b336c4a cpprest: bump version to 2.10.6, drop clang 747 patch: upstream
>> > 8cb0272 xmlstarlet: Disable PARALLEL_MAKE (again)
>> > 90467a8 python-pyflame: skip for aarch64 as well
>> > f0b1f3d gstd: Upgrade to latest and fix unrecognised options to configure
>> > 9e050f0 minidlna: restore & fix recipe
>> > 0411983 start-stop-daemon: Recognise musleabi triplet in dpkg
>> > 76bc58e klibc: Fix build with security flags
>> > aee5ef8 opencv: Fix build with clang
>> > 205d839 lcdproc: Update to master tip
>> > b0ece93 gd: Fix CVE-2018-1000222
>> > 376eb38 snappy: modify cmake variable to generate shared library
>> > dca2a7f networkd-dispatcher: new package
>> > e5e95cf cyrus-sasl: fix build out of source tree failed while
>> > configuring with `--enable-ldapdb'
>> > ec81952 pmdk: Initial commit of the PMDK SDK
>> > 5028479 nbd: Upgrade to nbd 3.17
>> > e5c84d8 kexec-tools-klibc: Deliberately add -O2
>> > cff2f38 spice: fix compile error on 32bit system
>> > d347312 spice: cleanup leftover patch from upgrade to 0.13.90
>> > e04a0b5 cyrus-sasl: fix parallel build issue
>> > e6d2fc4 postfix: fix pkg_postinst_${PN}
>> > 6e9c34d kernel-selftest: Fix build on musl
>> > 8baaf20 thrift: Refresh patches
>> > 8929489 python(3)-ndg-httpsclient: use update-alternatives to avoid
>> > do_rootfs failure
>> > dcd9887 fbset-modes: drop allarch inherit
>> > ea2ee9c libdevmapper: Install dmsetup
>> > a6dbefa stunnel: update 5.35 -> 5.49
>> > a95dde2 klibc: fix build on i386 with GCC and security flags enabled
>> > a06c29b klibc: fix build with GCC and -pie for mips, mips64, aarch64
>> >
>> > == Tested changes (not included in master yet) - meta-qt5 ==
>> > latest upstream commit:
>> > 9ffdd55 qtscript: Update the custom patch from mainline
>> > not included in master yet:
>> > 823fa38 qtwebengine: enable debug info for webengine
>> > 75bc440 qtbase: fix install locations used in static builds
>> > cd2d65b qt5: update to Qt 5.11.2
>> > 82d859a qtwebengine: use nasm-native instead of yasm-native
>> > 990b485 qt5: update to latest revision in 5.11 branch
>> > bd0586a qt5-creator: Fix building botan for all non-x86 arches
>> > 1975666 qt5-creator: Strip out redundant RPATH
>> > 3032660 qtwebkit: Fix build with musl
>> > 5d61f54 qtwebkit: Fix conflicts with -I and -isystem
>> > 54b3e41 qtwebkit: add patches to meta-qt5 fork
>> > 930a41a qtscript: Fix build on musl
>> > 60529e8 qtscript: add patches to meta-qt5 fork
>> > 6158f49 qtbase: Fix build error for armv8BE multilib.
>> > 817a904 qtwebkit: Make qtwebkit support arm32 BE.
>> > 62a5602 qt3d-runtime: upgrade to latest revision in 2.0 branch
>> > c3f3b5b qt3d-runtime: Fix compile errors as seen with mips/musl
>> > 5c0f00d qt: remove unnecessary FILES.*-dbg variables for packaging .debug files
>> > d6c7443 nativesdk-qtbase: use default PACKAGES
>> > a3496e6 qt: use single -dev and -staticdev package
>> > ab44617 qmake5_paths: change the default QT_DIR_NAME to be empty
>> > 01724aa qt: append ${PN}-examples to PACKAGES instead of prepending it
>> >
>> > == Tested changes (not included in master yet) - meta-browser ==
>> > latest upstream commit:
>> > 57de32f chromium-ozone-wayland: Update to 71.0.3545.0 aka ToT
>> > not included in master yet:
>> > e05e2a8 firefox: Use nasm instead of yasm
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>> Khem,
>>
>> I did not see these textrel building with gcc and -pie.
>
>
> This auto builder report is for a build with gcc I have local builds that happen with clang


It seems that obviously the issue is -pie linker  vs. static.
We better remove -pie for the klibc-static-utils

FWIW
https://lkml.org/lkml/2007/7/20/430

klibc binaries are indeed statically linked, but composed of two
different ELF images: the application itself and the shared libary
(which is referenced from the application header as the "interpreter").
 Neither of these is an ET_DYN file; they are both ET_EXEC, so it
*should* be unaffected by the PIE randomization patch.

Cheers
Andrea


>>
>>
>> That would defeat the purpose of 'security'...
>>
>> I'll check this again.
>> Cheers
>> Andrea

