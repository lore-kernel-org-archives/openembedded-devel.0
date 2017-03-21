Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF746719B2;
	Tue, 21 Mar 2017 11:25:44 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t189so9925159wmt.1;
	Tue, 21 Mar 2017 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+eNgCn6HgVJMOaqiM1EfCseQb/VRm6sRpNWiUnJZMmg=;
	b=I1tbCNtGRDP9PBaqhiCsy/QHn1Tznbwtw9AhiIXS2LAybvjIpMIVGKlGYjy3GInRbC
	neWaipy7BbHlG/G8kdW2o+kNv7vUjceYegd8rlcKJfdf15JJCdL5NoHj7p+cQSWgdL02
	5ZM1SDiogihzP9xtlHFdT41Yd4+wkTFnxQ1Vf3/ol0t7ty/i8XfAGuodPLhJLJ8IHkPN
	XM4BVhZH5pUtT3zAzw9Jz32WjLem1FaJ3NUXAG1Lyq+yE2gZcsd+xoYs3hzwuCRPSkPw
	6PoRdG+N3YiEjHp+9gNEIz2RrpovU80cDaxMa1TbKUJ95PJ4iE/L7ZQE6RUkiTcQYmKe
	AQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+eNgCn6HgVJMOaqiM1EfCseQb/VRm6sRpNWiUnJZMmg=;
	b=Urpq9jYGdud/Nf7/Bn4o0mNNqzAGKike1N07mX7PHd9OHacDvDJgEWXA0Xu2fA0r6u
	OChz/HUk3LOk8ZzOdJOgG/26qa1ArfjlKDEYdBXw4udf9OMSlmkgWIhKGmFKuDp+I345
	puQXowvVRdv1pPJXHOVaMRrVc5szzlzinrTTnN9bZB3AsEelqf46so7h7DW0i/5PGKLy
	0Fzi7BFmdknEAJEzV4i+pFjI3gY3G0TdUA00ueDnQ7z/T4/XhpUB3xJSGY3FUWkccCjw
	YanzxF/BZiYJ9wc+LbazO43JKOJvO/aS5wkuWHE3kaZil5ENaAtGLB1EXCV5yhFVbbEf
	nGTg==
X-Gm-Message-State: AFeK/H1r4BH5Edg34vCh1tgqApK0fCzo6ezINudR8x24MFQQFHTQZTcR851r2Y6QuVVasUyBJXrxB6e5VlePKw==
X-Received: by 10.28.19.207 with SMTP id 198mr2188422wmt.49.1490095544974;
	Tue, 21 Mar 2017 04:25:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 21 Mar 2017 04:25:44 -0700 (PDT)
In-Reply-To: <20170316233429.GA3293@jama>
References: <20170316233429.GA3293@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Mar 2017 12:25:44 +0100
Message-ID: <CA+chaQcxjPptw5ghJ73R=G80mKgxfpr=pStGVaN7+5MfHefSTg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, Failed tasks 2017-03-15
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
X-List-Received-Date: Tue, 21 Mar 2017 11:25:45 -0000
Content-Type: text/plain; charset=UTF-8

For next run I've removed sstate-cache and downloads directory to detect
broken SRC_URIs, here is the list:

  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/hwdata/hwdata_0.291.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb:do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb:do_fetch


Complete report will be sent in 1-2 days (qemux86-64 build wasn't even
started yet).


On Fri, Mar 17, 2017 at 12:34 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2017-03-15    ||4     ||4     ||4     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||4
>  ||0             ||0             ||0             ||2             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-03-15 ==
>
> INFO: jenkins-job.sh-1.8.19 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170316_132623.log
>
> === common (3) ===
>     * meta-openembedded/meta-oe/recipes-support/devmem2/devmem2.bb:
> do_patch
>     * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-
> ssleay-perl_1.65.bb:do_configure
>     * virtual:native:meta-openembedded/meta-efl/recipes-
> efl/efl/efl_1.15.1.bb:do_compile
>
> === common-x86 (1) ===
>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.1.14.bb:do_install
>
> === qemuarm (1) ===
>     * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (12) ===
> {| class=wikitable
> |-
> || qemuarm      || 4     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170314_100521.log/ ||
> http://errors.yoctoproject.org/Errors/Build/33915/
> |-
> || qemux86      || 4     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170314_115504.log/ ||
> http://errors.yoctoproject.org/Errors/Build/33916/
> |-
> || qemux86_64   || 4     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170315_125349.log/ ||
> http://errors.yoctoproject.org/Errors/Build/34634/
> |}
>
> === PNBLACKLISTs (351) ===
>
> === QA issues (6) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||0     ||version-going-backwards
> |-
> ||2     ||host-user-contaminated
> |-
> ||4     ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170315_080310.log/
>
> No issues detected
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> e455e40 toaster: resolve missing 'native[sdk]:' prefixes
> not included in master yet:
> 7b8d726 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> 477805b wic: selftest: account for occasional newline in debugfs file names
> not included in master yet:
> ea4cfd5 qemux86: Add identical qemux86copy variant for tests
> 2b668d7 sstate-sysroot-cruft.sh: Extend the whitelist
> 20180be recipes: Replace "cp -a" with "cp -R --no-dereference
> --preserve=mode,links"
> 9e09509 buildhistory.bbclass: metadata-revs show repo parent
> 997fdda metadata-revs: provide more information
> b8a5ee2 report-error: Allow to upload reports automatically
> 9eee58b rm_work: restore old rm_work_all
> 830f53e Revert "rm_work: restore old rm_work_all"
> 4126661 Revert "rm_work.bbclass: clean up sooner"
> b96ea1d bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
> 6f9a0ae bitbake.conf: Temporary add few more binaries to HOSTTOOLS_NONFATAL
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 1dff235 vim: add native BBCLASSEXTEND
> not included in master yet:
> 0fa3a88 netcat-openbsd: fix implicit dependency on pkg-config
> d27cf15 inetutils: Move files only when src != dst.
> 2889a9e ebtables: Move files only when src != dst.
> ec34e51 netcf_git: Check if src != dst while moving files.
> 0e1b685 dnsmasq: add info for port setting
> b80d8ce dnsmasq: disable the service by default
> 8712656 ptpd: add pkgconfig to inherit
> 7faad88 samba: update tevent_internal.h
> f25452b wireshark: update to 2.2.5
> 5f24fb9 postfix: remove references to buildmachine paths in target
> makedefs.out
> 8ed26e0 chrony: fix build failure for arma9
> 1a6700c libcec: update to version 4.0.1 and provide package for python3
> wrapper
> 47f7f79 meson: Update to 0.37.1
> 14e8457 meson.bbclass: Add support for more standard installation
> directories
> ae60e0d meson.bbclass: Make changes to meson.build files trigger
> reconfiguration
> b2b8e3e meson.bbclass: Support building for native
> ea83fbc meson.bbclass: Use the correct C++ compiler when cross compiling
> 8055f63 lvm2: fix bash depends QA issue
> b4173fc python-pyserial: update to version 3.3
> 135418c fuse: update HOMEPAGE and SRC_URI
> 2829912 curlpp: update HOMEPAGE and SRC_URI
> 4902e90 libdnet: update SRC_URI
> 41a056d cherokee: update SRC_URI
> deacf40 lmsensors: update SRC_URI and S
> da983d9 recipes: delete obsolete patches
> 4cae8ae meta: do not prepend/append to BBCLASSEXTEND
> a08f230 toybox: Fix configure failure
> 8cdc920 toybox: Upgrade to 0.7.3
> cdf1f00 luajit: test SITEINFO_BITS instead of maintaining a list of 32bit
> targets
> dfca01b acpica: moved to OE-core
> 493978b devmem2: use different filename to avoid checksum conflicts
> 735a7b5 vim: Update to 8.0.0427
> fe056aa efl: append -fPIC only for target builds
> 2edb15b scsirastools: add dependency on groff-native
> 871b5b9 openflow: add dependency on openssl-native
> b89e68a lprng: disable clear support
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies
> not included in master yet:
> 4f44a57 packagegroup-qt5-toolchain-target: Add QtSerialBus to
> meta-toolchain-qt5.
> abc89e9 qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp
> bootstrapped
> bd2258f packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
> 18603cd qtwebengine: show progress for do_compile
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 021a954 chromium-browser: add missing dependency on gperf-native
> not included in master yet:
> a9dd704 chromium: disable generate_character_data for x86
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> 4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> e39c265 android-system-image: fix builds that don't have overlay-libs
> not included in master yet:
>

