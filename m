Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B45CCDB473
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 17:49:43 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.23376.1697046578667223428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 10:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jlVp7upG;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dc863efb61so35235fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697046578; x=1697651378; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2/n2a1vbiX8Gq8h7fxB4fSyI+2kKmcWo6MW+VajW70=;
        b=jlVp7upGAjHK8XkxhoU8yfww75esBRLDwB4fMjjgrtTBR4iO2Bg5goJZ/rCnNC/9Ci
         D5MzdVDSI+cZQFiLIuLg3UKYEBtYo9DKomjcIGGwktz70cr+GtElyCe4S6xOfExaP5ue
         FQ/wTltZy2l/nqeVoSBeO0q/3PPDJ1B+fNqA94Y1cqZZx1NEeNT7i87jfWBvmMKuBxL8
         mmk73xfIveju6sC2+3N99ojTOIaUv4W+Za3k7XYAFcKbv55za6pRlr13U582UnMlJyKC
         kw6OZ4KYwIC9/a3otgYIhvQSTltSclKl1KScY/IseAAF1expHBlmlv4RcDlNnIFfkWbV
         j8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697046578; x=1697651378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2/n2a1vbiX8Gq8h7fxB4fSyI+2kKmcWo6MW+VajW70=;
        b=gpzFQeySss0irL8Ai0CbfOJ18dFesyiLz6/84I4IbBm6qYQmuJBbihemw5WTaf/fBw
         TlF9ArNSqaWKk5P5O1oWS/Oro2ez17xVIyTPjssvKQ0ho9a0vwtAWhcsz9wfpEe2QtYK
         e267ZWANvamY/BaHyuxgIWtXkPICQMDCNawC2584Q8X1/YMy2GmXqxMz64ZnGUAAj6+3
         L6BfVHI6pvQYoR7BZnXpAuV6uCi96v08oDEvLk4V4+R5gFDxqaK0xzjrtbPHX2TevfTf
         jjOvMeSZkcvNtntUC53eoRwy2gDBSsamNsuPMgZ6b1aHQ8bEuWSE7U29JWtHR9BHJitD
         S7xQ==
X-Gm-Message-State: AOJu0YxCSISUGvZ/kcMrLlJsjIqbSl/VdIB2aeNS/6d31rD2bKQeFBIc
	+NqYAdCnGb3fD6vKl9PDjNon1Db0byFGXtSs5ew=
X-Google-Smtp-Source: AGHT+IGEXnRZdtVYBsa4xypKdSk9bzI2is279blIg1OCBk7jBI7yrODCTjaFTVyUTwVQUcyHmzN1gvKPnbhcYoSKqJo=
X-Received: by 2002:a05:6870:d93:b0:1e9:74c1:52e7 with SMTP id
 mj19-20020a0568700d9300b001e974c152e7mr4936101oab.36.1697046577625; Wed, 11
 Oct 2023 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <f03dae38-7498-41d4-8fa2-164f73aec839@gmail.com>
In-Reply-To: <f03dae38-7498-41d4-8fa2-164f73aec839@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 10:49:11 -0700
Message-ID: <CAMKF1so9YZR=akTv2ec08CTqk_2Nz2+C8k0q4xxJhq+X0Tminw@mail.gmail.com>
Subject: Re: nanbield merge request: Oct 11th ( master sync)
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105432

merged thanks Armin. I think we might need another sync with master after t=
his.

On Wed, Oct 11, 2023 at 5:37=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 3dd5d208be018f0f676d1adfceb9c22f19ad2f=
fe:
>
>    meta-openemnedded: Add myself as nanbield maintainer (2023-09-25
> 11:39:20 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded nanbield-next
>
> for you to fetch changes up to 278c3f75e32f38f71bb52d161fe06bcb6f6bdd2f:
>
>    kernel-selftest: Build headers before compiling tests (2023-10-04
> 07:52:49 -0700)
>
> ----------------------------------------------------------------
> Alex Kiernan (2):
>        mdns: Upgrade 1790.80.10 -> 2200.0.8
>        jq: Upgrade 1.6+git -> 1.7
>
> Archana Polampalli (1):
>        nodejs: upgrade 18.17.1 -> 20.5.1
>
> Bruce Ashfield (2):
>        zfs: update to v2.2.0-rc4
>        vboxguestdrivers: fix kernel v6.5 build
>
> Cl=C3=A9ment P=C3=A9ron (6):
>        etcd-cpp-apiv3: upgrade 0.14.3 -> 0.15.3
>        devtools: grpc: bump to 1.56.2
>        protobuf: upgrade 4.22.2 -> 4.23.4
>        protobuf-c: bump to next release to support protobuf 4.23.x
>        mariadb: add missing <cstdint> in rocksdb string_util.h
>        etcd-cpp-apiv3: fix build when gRPC is cross compiled
>
> Derek Straka (32):
>        python3-apiflask: Update version 2.0.1 -> 2.0.2
>        python3-argh: Update version 0.29.3 -> 0.29.4
>        python3-async-timeout: remove old version of the library
>        python3-pydantic: Update version 1.10.7 -> 2.4.1
>        python3-pyhamcrest: Fix upstream check by specifying the
> UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>        python3-pyasn1-modules: Update version 0.2.8 -> 0.3.0
>        python-pyiface: Update version from git -> 0.0.11
>        python3-pymysql: Fix upstream check by specifying the
> UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>        python3-pymysql: update verion 1.0.2 -> 1.1.0
>        python3-pyproj: update version 3.6.0 -> 3.6.1
>        python3-pyproject-api: update version 1.5.1 -> 1.6.1
>        python3-redis: update version 5.0.0 -> 5.0.1
>        python3-traitlets: update version 5.9.0 -> 5.10.1
>        python3-xxhash: update version 3.2.0 -> 3.3.0
>        python3-pyzmq: update version 25.0.0 -> 25.1.1
>        python3-cachecontrol: Fix upstream check by specifying the
> UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>        python3-flask-babel: update version 2.0.0 -> 3.1.0
>        python3-idna-ssl: Fix upstream check by specifying the
> UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>        python3-ninja-syntax: Fix upstream check by specifying the
> UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>        python3-prettytable: update version 3.6.0 -> 3.9.0
>        python3-pytz-deprecation-shim: Remove outdated recipe meant to be
> a short lived shim
>        python3-tzlocal: Remove dependency on pytz_deprecation_shim
> removed in release 5.0
>        python3-astroid: update version 2.16.6 -> 3.0.0
>        python3-flask: update version 2.3.2 -> 2.3.3
>        python3-google-api-core: update version 2.12.0
>        python3-google-api-python-client: update version 2.100.0 -> 2.101.=
0
>        python3-google-auth: update version 2.23.0 -> 2.23.1
>        python3-parse-type: update version 0.5.2 -> 0.6.2
>        python3-nacl: Add recipe for the latest release of PyNaCl
>        python3-botocore: add recipe for latest version of botocore
>        python3-boto3: add recipe for latest version of boto3
>        python3-flask-cors: add initial version of the recipe for 4.0.0
>
> Gianfranco Costamagna (1):
>        mosquitto: upgrade 2.0.17 -> 2.0.18
>
> Jeffrey Pautler (1):
>        bolt: disable CVE checking for this recipe
>
> Khem Raj (14):
>        mozjs-115: Apply autoconf tuple mismatch fix
>        cpp-netlib: Fix build with boost 1.80+
>        cpp-netlib: Fix buildpaths in generated cmake files
>        python3-pybluez: Fix patch upstream-status
>        python3-pynetlinux: Fix patch upstream-status
>        libnet-idn-encode: Add recipe
>        libio-socket-ssl-perl: Change
> libnet-libidn-perl->libnet-idn-encode rdep for ptests
>        libnfs: Drop -Wno-implicit-function-declaration
>        webkitgtk3: Do not use musttail with clang on arm
>        fftw: Fix ptest result reporting
>        nodejs: Fix ptest result reporting
>        relayd: Update to latest tip of trunk
>        relayd: Fix build with clang
>        kernel-selftest: Build headers before compiling tests
>
> Markus Volk (7):
>        gedit: Upgrade 44.2 -> 46.1
>        tepl: Upgrade 6.4.0 -> 6.8.0
>        libblockdev: Upgrade 2.28 -> 3.03
>        udisks2: Upgrade 2.9.4 -> 2.10.1
>        mozjs: Upgrade 102.15.0 -> 102.15.1
>        libnfs: dont install libnfs-config.cmake
>        gnome-remote-desktop: Upgrade 44.2 -> 45.0
>
> Martin Jansa (9):
>        gupnp: fix build with meson-1.2.0
>        minifi-cpp, mozjs-115, redis-7.2.1, pv: add missing Upstream-Statu=
s
>        mozjs: fix filename in MULTILIB_SCRIPTS
>        gupnp-tools: fix build with meson-1.2.0
>        gnome-tweaks, networkmanager-fortisslvpn, libesmtp,
> json-schema-validator, python3-pybluez, python3-pynetlinux, apache2: Fix
> Malformed Upstream-Status
>        mozjs: use PV in MULTILIB_SCRIPTS
>        mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
>        meta-oe/dynamic-layers: add Upstream-Status where missing
>        meta-oe/dynamic-layers: add one more missing Upstream-Status and
> fix one malformed
>
> Micha=C5=82 Iwanicki (1):
>        python3-pyu2f: add recipe
>
> Mingli Yu (1):
>        mozjs-102: Remove the buildpath
>
> Ross Burton (1):
>        webkitgtk3: reduce size of -dbg package
>
> Samantha Jalabert (6):
>        Remove python3-rdflib
>        Remove python3-license-expression
>        Remove python3-xmltodict
>        Remove python3-booleanpy
>        Remove python3-click
>        Remove python3-isodate
>
> Samuli Piippo (1):
>        protobuf: stage protoc binary to sysroot
>
> Vyacheslav Yurkov (3):
>        overlayfs-tools: Drop unneeded dependency
>        overlayfs-tools: Bump up the version
>        overlayfs-tools: Install fsck binary
>
> Xiangyu Chen (3):
>        mosh: add support of protobuf 4.22.x
>        protobuf: upgrade 3.21.12 -> 4.22.2
>        protobuf-c: add support of protobuf 4.22.x
>
>   meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb           | 2 +-
>   .../0001-Makefile-proper-location-of-LDFLAGS.patch              | 32
> ---------
>   meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb | 32
> ---------
>   ...001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch | 43
> -----------
>   .../overlayfs-tools/0002-makefile-fix-linking-flags.patch       | 33
> ---------
>   meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 10 +-=
-
>   meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb  | 2 +-
>   ...nome-remote-desktop_44.2.bb =3D> gnome-remote-desktop_45.0.bb} |   4=
 +-
>   meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb                     | 22
> ------
>   meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb} |  13=
 +++-
>   meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb           | 17 ++=
+++
>   .../recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb       | 24
> +++++++
>   .../0002-meson-fix-invalid-positional-argument.patch            | 2 +-
>   meta-gnome/recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb} |   6 =
+-
>   .../gupnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch     | 56
> +++++++++++++++
>   .../recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb            | 4 +-
>   .../0001-build-properly-spell-provide-in-.wrap-files.patch      | 25
> +++++++
>   meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb       | 1 +
>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25
> +++++++
>   meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27
> +++++++
>   .../mosquitto/{mosquitto_2.0.17.bb =3D> mosquitto_2.0.18.bb} |   4 +-
>   .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch   | 2 +-
>   .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch   | 2 +-
>   .../relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch   | 34
> ---------
>   meta-networking/recipes-connectivity/relayd/relayd_git.bb       | 8 +--
>   .../mdns/mdns/0001-Handle-interface-without-ifa_addr.patch      | 38
> ++++++++++
>   .../0003-mDNSShared-Drop-MacOS-specific-__block-qualifier.patch | 30
> --------
>   .../mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch    | 17 ++=
---
>   .../recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch | 23
> ++++++
>   .../mdns/{mdns_1790.80.10.bb =3D> mdns_2200.0.8.bb} |   7 +-
>   .../libesmtp/0001-Add-build-option-for-NTLM-support.patch       | 2 +-
>   .../recipes-graphics/openbox/openbox-xdgmenu/7_6.diff           | 2 +
>   .../openbox/openbox-xdgmenu/fix-menu-generation.patch           | 2 +
>   .../openbox/openbox-xdgmenu/port-gnome-menus3.patch             | 2 +
>   .../lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch | 2 +
>   ...1-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch | 2 +
>   .../lirc/lirc/0001-Unbolt-ubuntu-hack.patch                     | 2 +-
>   .../recipes-connectivity/lirc/lirc/fix_build_errors.patch       | 2 +
>   .../netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch  | 2 +
>   .../android-tools/0001-Fixes-for-yocto-build.patch              | 2 +
>   ...2-android-tools-modifications-to-make-it-build-in-yoct.patch | 2 +
>   ...3-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch | 2 +
>   .../0004-adb-Fix-build-on-big-endian-systems.patch              | 2 +
>   .../android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch   | 2 +
>   .../android-tools/debian/Add-riscv64-support.patch              | 2 +
>   .../android-tools/debian/Added-missing-headers.patch            | 2 +
>   .../android-tools/android-tools/debian/Nonnull.patch            | 2 +
>   .../android-tools/android-tools/debian/Vector-cast.patch        | 2 +
>   .../android-tools/debian/add-missing-headers.patch              | 2 +
>   .../external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch   | 2 +
>   .../external/libunwind/legacy_built-in_sync_functions.patch     | 2 +
>   .../android-tools/debian/external/libunwind/user_pt_regs.patch  | 2 +
>   .../android-tools/debian/fix-attribute-issue-with-gcc.patch     | 2 +
>   .../android-tools/debian/fix-build-on-non-x86.patch             | 2 +
>   .../android-tools/debian/fix-gettid-exception-declaration.patch | 2 +
>   .../android-tools/debian/fix-standard-namespace-errors.patch    | 2 +
>   .../android-tools/debian/hard-code-build-number.patch           | 2 +
>   .../android-tools/android-tools/debian/libusb-header-path.patch | 2 +
>   .../android-tools/debian/move-log-file-to-proper-dir.patch      | 2 +
>   .../android-tools/android-tools/debian/simg_dump-python3.patch  | 2 +
>   .../android-tools/android-tools/debian/stdatomic.patch          | 2 +
>   .../android-tools/debian/stub-out-fastdeploy.patch              | 2 +
>   .../android-tools/debian/system/core/Add-riscv64-support.patch  | 2 +
>   .../debian/system/core/Added-missing-headers.patch              | 2 +
>   .../android-tools/debian/system/core/Nonnull.patch              | 2 +
>   .../android-tools/debian/system/core/Vector-cast.patch          | 2 +
>   .../android-tools/debian/system/core/add-missing-headers.patch  | 2 +
>   .../debian/system/core/fix-attribute-issue-with-gcc.patch       | 2 +
>   .../android-tools/debian/system/core/fix-build-on-non-x86.patch | 2 +
>   .../debian/system/core/fix-gettid-exception-declaration.patch   | 2 +
>   .../debian/system/core/fix-standard-namespace-errors.patch      | 2 +
>   .../debian/system/core/hard-code-build-number.patch             | 2 +
>   .../android-tools/debian/system/core/libusb-header-path.patch   | 2 +
>   .../debian/system/core/move-log-file-to-proper-dir.patch        | 2 +
>   .../android-tools/debian/system/core/simg_dump-python3.patch    | 2 +
>   .../android-tools/debian/system/core/stdatomic.patch            | 2 +
>   .../android-tools/debian/system/core/stub-out-fastdeploy.patch  | 2 +
>   .../debian/system/core/throw-exception-on-unknown-os.patch      | 2 +
>   .../android-tools/debian/throw-exception-on-unknown-os.patch    | 2 +
>   meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb                          | 2 +
>   meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb             | 9 ++-
>   .../mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch | 63
> +++++++++++++++++
>   meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb                 | 7 +-
>   .../mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 16 ++=
++-
>   ...1-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62
> ----------------
>   .../0001-cmake-add-separate-export-for-plugin-targets.patch     | 93
> ------------------------
>   .../recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch    | 81
> ---------------------
>   .../recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb} |   7 +-
>   ...1-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch | 40
> -----------
>   .../0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch | 32
> ---------
>   meta-oe/recipes-devtools/jq/{jq_git.bb =3D> jq_1.7.bb} |  25 ++++---
>   .../json-schema-validator/0002-Fix-assumed-signed-char.patch    | 2 +-
>   .../0003-For-root-value-use-empty-pointer.patch                 | 2 +-
>   .../oe-npm-cache                                                | 0
>   ...-oe-cache-native_18.17.bb =3D> nodejs-oe-cache-native_20.5.bb} |   0
>   .../nodejs/nodejs/0001-Using-native-binaries.patch              | 19 ++=
++-
>   .../nodejs/0001-liftoff-Correct-function-signatures.patch       | 42
> ++++-------
>   .../nodejs/0001-mips-Use-32bit-cast-for-operand-on-mips32.patch | 34
> ---------
>   meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch         | 18 --=
---
>   meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch   | 37
> ----------
>   meta-oe/recipes-devtools/nodejs/nodejs/run-ptest                | 5 ++
>   .../nodejs/{nodejs_18.17.1.bb =3D> nodejs_20.5.1.bb} |   9 +--
>   ...1-Makefile.am-do-not-compile-the-code-which-was-genera.patch | 106
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb           | 6 +-
>   .../protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch | 69
> ------------------
>   ...1-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 ++=
--
>   .../protobuf/{protobuf_3.21.12.bb =3D> protobuf_4.23.4.bb} |  22 ++++--
>   .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 68
> ++++++++++++++++++
>   .../etcd/{etcd-cpp-apiv3_0.14.3.bb =3D> etcd-cpp-apiv3_0.15.3.bb} |   8=
 ++-
>   .../libblockdev/{libblockdev_2.28.bb =3D> libblockdev_3.03.bb} |  15 ++=
--
>   .../0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch    | 2 +
>   ...1-Fix-the-constness-issues-around-autovector-iterator_.patch | 2 +
>   .../mozjs/{mozjs-102_102.15.0.bb =3D> mozjs-102_102.15.1.bb} |  11 +--
>   ...1-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch | 25
> +++++--
>   meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch   | 2 +
>   meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb             | 8 ++-
>   .../redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch | 2 +
>   .../recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch | 2 +
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 2 +-
>   .../cpp-netlib/a53f123040998744602f190944464af0e159ea19.patch   | 30
> ++++++++
>   meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb            | 10 ++=
-
>   meta-oe/recipes-support/fftw/fftw/run-ptest                     | 15 ++=
--
>   ...1-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch | 2 +
>   .../udisks2/0001-Makefile.am-Dont-include-buildpath.patch       | 47
> ++++++++++++
>   .../udisks/{udisks2_2.9.4.bb =3D> udisks2_2.10.1.bb} |   8 ++-
>   .../vboxguestdrivers/0001-vbox_fb-fix-kernel-v6.5-build.patch   | 50
> +++++++++++++
>   .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb | 1 +
>   .../recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch  | 21
> ++++++
>   meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb          | 4 ++
>   meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb     | 2 +-
>   meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb        | 23
> ++++++
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 1 -
>   meta-python/recipes-devtools/python/python-idna-ssl.inc         | 15 --=
--
>   .../{python3-apiflask_2.0.1.bb =3D> python3-apiflask_2.0.2.bb} |   2 +-
>   .../python/{python3-argh_0.29.3.bb =3D> python3-argh_0.29.4.bb} |   2 +=
-
>   .../{python3-astroid_2.15.6.bb =3D> python3-astroid_3.0.0.bb} |   3 +-
>   .../recipes-devtools/python/python3-async-timeout_4.0.0.bb      | 18 --=
---
>   meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb    | 13 --=
--
>   meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb    | 16 ++=
+++
>   meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb | 10 ++=
+
>   .../recipes-devtools/python/python3-cachecontrol_0.13.1.bb      | 3 +
>   meta-python/recipes-devtools/python/python3-click/run-ptest     | 3 -
>   meta-python/recipes-devtools/python/python3-click_8.1.7.bb      | 39
> ----------
>   ...ython3-flask-babel_2.0.0.bb =3D> python3-flask-babel_3.1.0.bb} |   7=
 +-
>   meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb | 16 ++=
+++
>   .../python/{python3-flask_2.3.2.bb =3D> python3-flask_2.3.3.bb} |   4 +=
-
>   ...gle-api-core_2.11.1.bb =3D> python3-google-api-core_2.12.0.bb} |   2=
 +-
>   ...t_2.100.0.bb =3D> python3-google-api-python-client_2.101.0.bb} |   2=
 +-
>   ...hon3-google-auth_2.23.0.bb =3D> python3-google-auth_2.23.1.bb} |   2=
 +-
>   meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb   | 19 ++=
++-
>   meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb    | 14 --=
--
>   .../python/python3-license-expression/run-ptest                 | 3 -
>   .../python/python3-license-expression_30.1.1.bb                 | 36
> ----------
>   meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb       | 25
> +++++++
>   .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 2 +
>   ...{python3-parse-type_0.5.2.bb =3D> python3-parse-type_0.6.2.bb} |  12=
 +---
>   ...ython3-prettytable_3.6.0.bb =3D> python3-prettytable_3.9.0.bb} |   7=
 +-
>   ...-pyasn1-modules_0.2.8.bb =3D> python3-pyasn1-modules_0.3.0.bb} |   7=
 +-
>   ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 5 +-
>   .../{python3-pydantic_1.10.7.bb =3D> python3-pydantic_2.4.1.bb} |   8 +=
+-
>   meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb | 3 +
>   .../{python3-pyiface_git.bb =3D> python3-pyiface_0.0.11.bb} |  16 ++---
>   .../{python3-pymysql_1.0.2.bb =3D> python3-pymysql_1.1.0.bb} |   7 +-
>   .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch | 2 +-
>   .../python/{python3-pyproj_3.6.0.bb =3D> python3-pyproj_3.6.1.bb} |   2=
 +-
>   ...n3-pyproject-api_1.5.1.bb =3D> python3-pyproject-api_1.6.1.bb} |   2=
 +-
>   .../python/python3-pytz-deprecation-shim_0.1.0.post0.bb         | 15 --=
--
>   meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb      | 20
> ++++++
>   .../python/{python3-pyzmq_25.0.0.bb =3D> python3-pyzmq_25.1.1.bb} |   8=
 +--
>   meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb     | 19 --=
---
>   .../python/{python3-redis_5.0.0.bb =3D> python3-redis_5.0.1.bb} |   2 +=
-
>   .../{python3-traitlets_5.9.0.bb =3D> python3-traitlets_5.10.1.bb} |   4=
 +-
>   meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb    | 1 -
>   meta-python/recipes-devtools/python/python3-xmltodict/run-ptest | 3 -
>   meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb | 29
> --------
>   .../python/{python3-xxhash_3.2.0.bb =3D> python3-xxhash_3.3.0.bb} |   6=
 +-
>   ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +-
>   177 files changed, 1146 insertions(+), 1117 deletions(-)
>   delete mode 100644
> meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-pr=
oper-location-of-LDFLAGS.patch
>   delete mode 100644
> meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
>   delete mode 100644
> meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-inclu=
des-so-that-it-compiles-on-Ubuntu-20.04.patch
>   delete mode 100644
> meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fi=
x-linking-flags.patch
>   rename
> meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-remote-=
desktop/{gnome-remote-desktop_44.2.bb
> =3D> gnome-remote-desktop_45.0.bb} (82%)
>   delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
>   rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb=
}
> (69%)
>   create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.b=
b
>   create mode 100644
> meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
>   rename meta-gnome/recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb}
> (88%)
>   create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-Fix-wra=
p-file-syntax.patch
>   create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spel=
l-provide-in-.wrap-files.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>   rename
> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.17.bb =3D>
> mosquitto_2.0.18.bb} (95%)
>   delete mode 100644
> meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-=
on-failed-write.patch
>   create mode 100644
> meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without=
-ifa_addr.patch
>   delete mode 100644
> meta-networking/recipes-protocols/mdns/mdns/0003-mDNSShared-Drop-MacOS-sp=
ecific-__block-qualifier.patch
>   create mode 100644
> meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.pat=
ch
>   rename meta-networking/recipes-protocols/mdns/{mdns_1790.80.10.bb =3D>
> mdns_2200.0.8.bb} (96%)
>   create mode 100644
> meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-p=
rotobuf-4.22.x.patch
>   delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC=
-to-GPR_ABSEIL_SYNC.patch
>   delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plu=
gin-targets.patch
>   delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
>   rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D>
> grpc_1.56.2.bb} (90%)
>   delete mode 100644
> meta-oe/recipes-devtools/jq/jq/0001-configure-Pass-_XOPEN_SOURCE-when-che=
cking-for-strpt.patch
>   delete mode 100644
> meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEF=
AULT_SOURCE.patch
>   rename meta-oe/recipes-devtools/jq/{jq_git.bb =3D> jq_1.7.bb} (67%)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 =3D>
> nodejs-oe-cache-20.5}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.bb =3D>
> nodejs-oe-cache-native_20.5.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-opera=
nd-on-mips32.patch
>   delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/big-endian.pa=
tch
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb =3D>
> nodejs_20.5.1.bb} (94%)
>   create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-comp=
ile-the-code-which-was-genera.patch
>   delete mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld=
-gold.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
> protobuf_4.23.4.bb} (76%)
>   create mode 100644
> meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-co=
mpiling.patch
>   rename meta-oe/recipes-extended/etcd/{etcd-cpp-apiv3_0.14.3.bb =3D>
> etcd-cpp-apiv3_0.15.3.bb} (67%)
>   rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.28.bb =3D>
> libblockdev_3.03.bb} (73%)
>   rename meta-oe/recipes-extended/mozjs/{mozjs-102_102.15.0.bb =3D>
> mozjs-102_102.15.1.bb} (87%)
>   create mode 100644
> meta-oe/recipes-support/cpp-netlib/cpp-netlib/a53f123040998744602f1909444=
64af0e159ea19.patch
>   create mode 100644
> meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-buil=
dpath.patch
>   rename meta-oe/recipes-support/udisks/{udisks2_2.9.4.bb =3D>
> udisks2_2.10.1.bb} (86%)
>   create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vbox_fb-fi=
x-kernel-v6.5-build.patch
>   create mode 100644
> meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
>   create mode 100644
> meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python-idna-ssl.=
inc
>   rename meta-python/recipes-devtools/python/{python3-apiflask_2.0.1.bb
> =3D> python3-apiflask_2.0.2.bb} (83%)
>   rename meta-python/recipes-devtools/python/{python3-argh_0.29.3.bb =3D>
> python3-argh_0.29.4.bb} (90%)
>   rename meta-python/recipes-devtools/python/{python3-astroid_2.15.6.bb
> =3D> python3-astroid_3.0.0.bb} (87%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-click/run-ptest
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-click_8.1.7.bb
>   rename
> meta-python/recipes-devtools/python/{python3-flask-babel_2.0.0.bb =3D>
> python3-flask-babel_3.1.0.bb} (59%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
>   rename meta-python/recipes-devtools/python/{python3-flask_2.3.2.bb =3D>
> python3-flask_2.3.3.bb} (84%)
>   rename
> meta-python/recipes-devtools/python/{python3-google-api-core_2.11.1.bb
> =3D> python3-google-api-core_2.12.0.bb} (86%)
>   rename
> meta-python/recipes-devtools/python/{python3-google-api-python-client_2.1=
00.0.bb
> =3D> python3-google-api-python-client_2.101.0.bb} (86%)
>   rename
> meta-python/recipes-devtools/python/{python3-google-auth_2.23.0.bb =3D>
> python3-google-auth_2.23.1.bb} (87%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-license-expression/run-ptest
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-license-expression_30.1.1.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>   rename
> meta-python/recipes-devtools/python/{python3-parse-type_0.5.2.bb =3D>
> python3-parse-type_0.6.2.bb} (51%)
>   rename
> meta-python/recipes-devtools/python/{python3-prettytable_3.6.0.bb =3D>
> python3-prettytable_3.9.0.bb} (75%)
>   rename
> meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.8.bb =3D>
> python3-pyasn1-modules_0.3.0.bb} (74%)
>   rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.7.bb
> =3D> python3-pydantic_2.4.1.bb} (61%)
>   rename meta-python/recipes-devtools/python/{python3-pyiface_git.bb =3D>
> python3-pyiface_0.0.11.bb} (65%)
>   rename meta-python/recipes-devtools/python/{python3-pymysql_1.0.2.bb
> =3D> python3-pymysql_1.1.0.bb} (63%)
>   rename meta-python/recipes-devtools/python/{python3-pyproj_3.6.0.bb =3D=
>
> python3-pyproj_3.6.1.bb} (87%)
>   rename
> meta-python/recipes-devtools/python/{python3-pyproject-api_1.5.1.bb =3D>
> python3-pyproject-api_1.6.1.bb} (86%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.p=
ost0.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_25.0.0.bb =3D=
>
> python3-pyzmq_25.1.1.bb} (81%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
>   rename meta-python/recipes-devtools/python/{python3-redis_5.0.0.bb =3D>
> python3-redis_5.0.1.bb} (83%)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_5.9.0.bb
> =3D> python3-traitlets_5.10.1.bb} (57%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-xmltodict/run-ptest
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
>   rename meta-python/recipes-devtools/python/{python3-xxhash_3.2.0.bb =3D=
>
> python3-xxhash_3.3.0.bb} (69%)
>

