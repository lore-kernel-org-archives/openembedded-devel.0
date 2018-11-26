Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEA06C50D
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 18:35:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t13so14269012ply.13
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 10:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tXtMcC7GccSeaEx+eA3gyaMaBCvYaVnOmCfALJzsUO0=;
	b=uo9T7W2fF3zuDapb8Izg6XyrX+y9xwYYBObzUm/MjB+woLkQ6f8AzuLGhX+aj7ogLv
	hM7+bWWtCBW/VQzS6lWG5sPtsOSEST7MrcGSJE0NhgR+3IInwaBsHOSjJ7tOZi6W7bik
	eu1sjTgwBUbMRSKVA7jW6+8rMNZeH04VtKD5UryIZ0Fe+la/x6uPPlIDSsSPN8K9cx03
	d/R5ukmMvRSIER8pAEfiSWCanAS08/n7tg0sUKRoEKaOD2290lCGYMi6b4APLGDLuK+t
	axP5g8CgtfwTpKFjdXnf3PMH82xHiyGS4jQUdSPZELwtg6hBjkaGQghAq7VOKPL02GRC
	97OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tXtMcC7GccSeaEx+eA3gyaMaBCvYaVnOmCfALJzsUO0=;
	b=o7jxooXLi4ArYKo1pldpNbaSHsooA6hcNtnjVEC+pQIYWqRTcFMm7Nk2I1A5Hfz5hM
	Bag9TgM4f8rtymYnBJCTmH6Bx1+BVoxdt6IN5afuxLQ0fuDcoMuuUOU0TRnCJefDcK5n
	BFqmAt7XyJV+D/acIWto85fqDWj4GjtQmDwR34PJrRpY8bt67IhYA8CO2lNOBBSbdMnD
	WK1Mlx0NHZh0CiF3jwu6xfDiQkfKV7N37qjnTN47U5Ucid2TXn6Ic1cSB7mE8gobG65W
	Abgy6Z40/5rXOeqpvoOhAbCT/ehVRdclV4WAV6qvs/QPuX0cidlumrKndWYlhw8TmLo+
	6Gqw==
X-Gm-Message-State: AA+aEWbjlnh3n2ThtW7cxExqMuv0ffwmKbUMx6QuRjBwK9EzoOGlarm/
	2guk2ccIpxQfPHmbEXaWBSXN4S1K
X-Google-Smtp-Source: AFSGD/U9vbgIVenXwnda9p9D8fY2Rx0tHY+ymTO0qaK6Wr1F1ovcfQudaWXPSzkdbPyVcJKGUDITIg==
X-Received: by 2002:a17:902:1008:: with SMTP id
	b8mr19101444pla.252.1543257335095; 
	Mon, 26 Nov 2018 10:35:35 -0800 (PST)
Received: from [192.168.0.33] (174-24-96-92.clsp.qwest.net. [174.24.96.92])
	by smtp.gmail.com with ESMTPSA id
	d65-v6sm1519402pfc.144.2018.11.26.10.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 10:35:34 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1srErP=AT_wQ2Bkkg5YNqnH72bmSvUBjav8W4hpvAk8Y2A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4f5980a5-9bd6-e680-4e32-cc0b05df30b1@gmail.com>
Date: Mon, 26 Nov 2018 11:35:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srErP=AT_wQ2Bkkg5YNqnH72bmSvUBjav8W4hpvAk8Y2A@mail.gmail.com>
Subject: Re: State of the world, 2018-11-26
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
X-List-Received-Date: Mon, 26 Nov 2018 18:35:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/26/18 10:55 AM, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date      !!colspan='4'|Failed tasks     !!|Signatures
> !!colspan='15'|QA !!Comment
> |-
> || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> ||version-going-backwards ||host-user-contaminated
> ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
> ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
> ||qa_pseudo ||
> |-
> ||2018-11-24 ||11 ||9 ||8 ||7 ||0 ||0 ||0 ||0 ||3 ||0 ||24 ||1 ||0 ||0
> ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2018-11-24 ==
>
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20181126_082702.log
>
> === common (5) ===
>     * sources/meta-browser/recipes-browser/firefox/firefox_60.1.0esr.bb:do_configure
>     * sources/meta-browser/recipes-browser/firefox-l10n/firefox-l10n-id_60.1.0esr.bb:do_install
>     * sources/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb:do_compile
>     * sources/meta-openembedded/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb:do_package_qa

>     * sources/meta-openembedded/meta-networking/recipes-support/geoip/geoip_1.6.12.bb:do_fetch

I am seeing the geoip fetch failure in Thud and sumo so once master is
sorted out, backports are in order.
- armin
>
> === common-x86 (0) ===
>
> === qemuarm (6) ===
>     * sources/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb:do_package
>     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.70.1.bb:do_compile
>     * sources/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
>     * sources/meta-rust/recipes-devtools/rust/libstd-rs_1.27.1.bb:do_compile
>     * sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv_git.bb:do_compile
>
> === qemuarm64 (4) ===
>     * sources/meta-rust/recipes-devtools/rust/rust_1.27.1.bb:do_compile
>     * sources/openembedded-core/meta/recipes-devtools/glide/glide_0.13.2.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-devtools/go/go-dep_0.5.0.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_package_qa
>
> === qemux86 (1) ===
>     * sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile
>
> === qemux86_64 (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_git.bb:do_package
>
> === Number of failed tasks (35) ===
> {| class=wikitable
> |-
> || qemuarm || 11 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20181123_224146.log/
> ||
> |-
> || qemuarm64 || 9 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20181124_112648.log/
> ||
> |-
> || qemux86 || 8 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20181123_224145.log/
> ||
> |-
> || qemux86_64 || 7 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20181124_065217.log/
> ||
> |}
>
> === PNBLACKLISTs (0) ===
>
> === QA issues (28) ===
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
> ||0 ||textrel
> |-
> ||0 ||unknown-configure-option
> |-
> ||1 ||host-user-contaminated
> |-
> ||24 ||version-going-backwards
> |-
> ||3 ||build-deps
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20181125_080250.log/
>
>
>     * ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy
> in /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'libdvbcsa' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> DEPENDS on or otherwise requires it). Close matches:
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> /home/jenkins/oe/world/yoe/build/tmpfs/stamps
>     * ERROR: Nothing PROVIDES 'libdvbcsa' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> DEPENDS on or otherwise requires it). Close matches:
>     * ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> /home/jenkins/oe/world/yoe/build/tmpfs/stamps
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
> count: 24 issue: version-going-backwards
> btrfs-tools-4.17.1: Package version for package btrfs-tools-dbg went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-dbg went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-dev went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-dev went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-doc went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-doc went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-locale
> went backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-locale
> went backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-staticdev
> went backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools-staticdev
> went backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.22) [version-going-backwards]
> btrfs-tools-4.17.1: Package version for package btrfs-tools went
> backwards which would break package feeds from (0:4.19-r0.0 to
> 0:4.17.1-r0.24) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-dbg went backwards which would break package feeds from
> (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-dbg went backwards which would break package feeds from
> (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-dev went backwards which would break package feeds from
> (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-dev went backwards which would break package feeds from
> (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-doc went backwards which would break package feeds from
> (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-doc went backwards which would break package feeds from
> (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-locale went backwards which would break package feeds
> from (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0)
> [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-locale went backwards which would break package feeds
> from (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0)
> [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-staticdev went backwards which would break package feeds
> from (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0)
> [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth-staticdev went backwards which would break package feeds
> from (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0)
> [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth went backwards which would break package feeds from
> (0:git-r0.14 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
> pi-bluetooth-1.1+gitAUTOINC+2e1a393955: Package version for package
> pi-bluetooth went backwards which would break package feeds from
> (0:git-r0.17 to 0:1.1+git0+2e1a393955-r0.0) [version-going-backwards]
>
>
> count: 1 issue: host-user-contaminated
> dvb-apps: /dvb-apps/usr/share/dvb/av7110_loadkeys/hauppauge2.rc5 is
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
> 7414b35 fetch: don't use shell=True when listing ar files
> not included in master yet:
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> 04469ab u-boot: Upgrade 2018.07 -> 2018.11
> not included in master yet:
> 80d1749 mdadm: improve the run-ptest
> 988449b musl: Update to latest trunk
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> c26b10b opensc: 0.18.0 version fix fetch error
> not included in master yet:
> 2c96816 ndctl: fix compile issue
> e5d86e6 packagegroup-meta-oe: fix build issues
> 0b22b1d sblim-sfc-common: use official SPDX license for EPL
> 4e41e8e mpd: update to 0.21.3
> 02ce43f Bump libiio version to 0.15
> 2d50225 Fix python-idna egg-info permissions
> 094fdd1 bdwgc: upgrade 7.6.0 -> 7.6.8
> 87fd823 Copy breakpad .sym file in appropriate folder.
> 04c9acc Adds python3 syslog dependency to python3-systemd
> 6d71116 modemmanager: Update flag for disabling mbim
> 317377a dvb-apps: linux dvb apps package support
> 7c6cbf3 krb5: Upgrade to 1.16.2
> 0d79a62 geoip: add downloadfilename for geoip database files
> 8c953a9 librelp: Upgrade to 1.2.18
> 1c64b39 glog: fixed the build for mips and other platforms
> f322116 openwsman: Upgrade to 2.6.8
> 09afca3 evince: Drop x11 requirement
> 0a6c80a vboxguestdrivers: upgrade to 5.2.22
> af4b62a Revert "net-snmp: improve reproducibility"
> 912520f net-snmp: Reproducibility: Fixed path to /bin/uname
> 185df9d net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
> 8864ad1 net-snmp: Reproducibility: Don't check build host for /etc/printcap
> a03b78d net-snmp: Reproducibility: Set NETSNMP_CONFIGURE_OPTIONS null
> c1a8b18 net-snmp: Simplify sed expressions
> d5737d5 ell: remove unused patch
> dc3d610 ell: update to 0.15
> 80ea593 iwd: add version 0.12
> e3b69d7 libcereal: Add native and nativesdk classes
> 10b342a dvb-apps: Fix build with kernel > 4.14
> 7f2d117 mosquitto: update to 1.5.4
> 8e43f2c python*-paho-mqtt: upgrade to 1.4.0
> e68e5a8 python3-bandit: upgrade to 1.5.1
> 5d8e676 sedutil: fix compile errors on big endian architectures
> 3a25eb1 python3-multidict: Workaround for broken make clean
> 5be3b44 postgresql: Allow successful run of postgresql-setup
> 856bdf0 Add a working Tvheadend recipe
> 9affff2 libzip: new package
> e86ad8e libserialport: new package
> 1765e48 doxygen: new native package
> ffe2650 libsigrok: new package
> 7a22679 libsigrokdecode: new package
> 5430b13 sigrok-cli: new package
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 18f82a8 python-pyqt5: Disable parallel install
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 261dba7 chromium: Fix the x86 build with GCC 8.
> not included in master yet:
> ~/oe/world/yoe


