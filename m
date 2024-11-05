Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82127D2B934
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.19495.1730817401244552789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwJVSdg0;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e5e5c43497so44345177b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817400; x=1731422200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+s0ByEMIT9qZu8WxS3eYX4vg6DOJgJKWW8ZmAyi2YTA=;
        b=FwJVSdg09S3aQ6BHkowaT3arfANAlRaGvp2dwu0m2z8F+2vf9TKA9BrbFcaUXukC7n
         8JG7/LMT8svflNgV0x++vcRMWbQY4FSDgyMqjzzGIpc8xXgS9N/GV+nKsqyCoJLB6YZp
         +vVNwcKACd1t9aT3RiQfdJSVrTVHiX/VrElncUf2LP85C5wqF6ryo3B3PodqPL994LqX
         2XpuA1UMBeEJNsLm7JXavWO/2ejXthaXQPQHgo4mDdNXRiQ15S3sfMswn8AhfHUbQ56J
         a7sM6nQ84q51zMrOtTrptlKpMSsw7q/lYbCQb/K0n9DMueS96TSKmBppPG1tHQHk/iU4
         Lddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817400; x=1731422200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s0ByEMIT9qZu8WxS3eYX4vg6DOJgJKWW8ZmAyi2YTA=;
        b=sWvx3wAESHwRqUqTb2esCs4XeHSszSB86NhoX3lOGzVxOshEoo50ruKf1nu4Xz3z3R
         /xrJZQLolzbqQrPhltvPMzC14QBQjkeLcBJGJmbLiaP+Ost/c88z3WU0oArVCBx8d8Q3
         o4YPxR5FT388BT2nsqtkXdaDRKgfMGw7j5rGCY5QUtxlwAMTGyrZabmFOCojZX0Jz5I5
         tiO4gaSjMltn8N3oBMT674P9aJVmCHiKs12K8I8J1FPZyL8awtoVVH0owgZ5UaUSTjIB
         /VF+NXOutJGFhpegOsKcpFof7/sUkQa5UE65BvWdbUPaoHTd3TEuyKllpL1S/QZTtUoo
         PDAg==
X-Gm-Message-State: AOJu0YytZDsUUUd+/MSJewP/PP+KfzO/OoXK64s8CmSydmkSpq3aNYuS
	R73L/tIfjC+eJaXUtmg4RfOZisn3YrOG3lPoir16bm2JTfor7oTLPMrx/Q==
X-Google-Smtp-Source: AGHT+IHi2ycNxLedkR4XlBtVhPbGPH1iZAddyoNEDqRKaSTtmmG+4MxHQ6S122bhYzJiaxJ5qtnR/w==
X-Received: by 2002:a81:b554:0:b0:6dd:d0fa:15a8 with SMTP id 00721157ae682-6ea52520ba4mr144435217b3.35.1730817399926;
        Tue, 05 Nov 2024 06:36:39 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][styhead][PATCH 00/90] Patch review
Date: Tue,  5 Nov 2024 09:34:25 -0500
Message-ID: <20241105143638.2301245-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113418

Please have comment back by Nov 7th.

Armin Kuster (1):
  audit: fix build when systemd is enabled.

Chen Qi (1):
  jansson: add JSON_INTEGER_IS_LONG_LONG for cmake

Etienne Cordonnier (1):
  perfetto: upgrade 31.0 -> 47.0

Ghislain Mangé (1):
  wireshark: fix typo in PACKAGECONFIG[zstd]

J. S. (5):
  syslog-ng: upgrade 4.6.0 -> 4.7.0
  xfce4-panel: upgrade 4.18.3 -> 4.18.4
  nodejs: upgrade 20.17.0 -> 20.18.0
  xfce4-panel: upgrade 4.18.4 -> 4.18.5
  nodejs: cleanup

Jeroen Knoops (1):
  nng: Rename default branch of github.com:nanomsg/nng.git

Jiaying Song (2):
  wireguard-tools: fix do_fetch error
  vlock: fix do_fetch error

Jose Quaresma (3):
  gpsd: make the meta-python dependency conditionally
  Revert "gpsd: make the meta-python dependency conditionally"
  gpsd: condition the runtime dependence of pyserial on the pygps

Katariina Lounento (1):
  libtar: patch CVEs

Khem Raj (15):
  python3-typer: Disable test_rich_markup_mode tests
  python3-pydbus: Add missing rdep on xml module for ptests
  python3-ujson: Add python misc modules to ptest rdeps
  python3-gunicorn: Add missing rdeps for ptests
  python3-eth-hash: Add packageconfigs and switch to pep517-backend
  python3-validators: Add missing rdeps for ptests
  python3-pint: Upgrade to 0.24.3
  python3-pytest-mock: Fix ptests
  python3-sqlparse: Add missing rdep on mypy module for ptests
  libhugetlbfs: Use linker wrapper during build
  webkitgtk3: Always use -g1 for debug flags
  webkitgtk3: Fix build break with latest gir
  ndisc6: Fix reproducible build
  rsyslog: Enable 64bit atomics check
  xmlsec1: Switch SRC_URI to use github release

Liyin Zhang (1):
  sound-theme-freedesktop: Update SRC_URI

Markus Volk (3):
  gnome-shell: add gnome-control-center dependency
  gnome-desktop: update 44.0 -> 44.1
  cryptsetup: fix udev PACKAGECONFIG

Martin Jansa (1):
  xmlrpc-c: update SRCREV

Rouven Czerwinski (1):
  softhsm: add destroyed global access prevention patch

Ryan Eatmon (1):
  kernel-selftest: Update to allow for turning on all tests

Shinji Matsunaga (1):
  audit: Fix CVE_PRODUCT

Valeria Petrov (1):
  apache2: do not depend on zlib header and libs from host

Wang Mingyu (29):
  bdwgc: upgrade 8.2.6 -> 8.2.8
  ctags: upgrade 6.1.20240908.0 -> 6.1.20240915.0
  gnome-backgrounds: upgrade 46.0 -> 47.0
  gnome-chess: upgrade 46.0 -> 47.0
  gnome-font-viewer: upgrade 46.0 -> 47.0
  libmanette: upgrade 0.2.7 -> 0.2.9
  pegtl: upgrade 3.2.7 -> 3.2.8
  python3-elementpath: upgrade 4.4.0 -> 4.5.0
  python3-eventlet: upgrade 0.36.1 -> 0.37.0
  python3-filelock: upgrade 3.16.0 -> 3.16.1
  python3-greenlet: upgrade 3.0.3 -> 3.1.0
  python3-nmap: upgrade 1.6.0 -> 1.9.1
  python3-paramiko: upgrade 3.4.1 -> 3.5.0
  python3-platformdirs: upgrade 4.3.1 -> 4.3.6
  python3-psycopg: upgrade 3.2.1 -> 3.2.2
  python3-pyasn1-modules: upgrade 0.4.0 -> 0.4.1
  python3-pymisp: upgrade 2.4.197 -> 2.4.198
  python3-pyproject-api: upgrade 1.7.1 -> 1.7.2
  python3-pyunormalize: upgrade 15.1.0 -> 16.0.0
  python3-regex: upgrade 2024.7.24 -> 2024.9.11
  python3-rich: upgrade 13.8.0 -> 13.8.1
  python3-robotframework: upgrade 7.0.1 -> 7.1
  python3-virtualenv: upgrade 20.26.4 -> 20.26.5
  python3-xmlschema: upgrade 3.3.2 -> 3.4.1
  python3-yarl: upgrade 1.10.0 -> 1.11.1
  stunnel: upgrade 5.72 -> 5.73
  tecla: upgrade 46.0 -> 47.0
  traceroute: upgrade 2.1.5 -> 2.1.6
  nmap: Fix off-by-one overflow in the IP protocol table.

Yi Zhao (6):
  abseil-cpp: upgrade 20240116.2 -> 20240722.0
  protobuf: add abseil-cpp to RDEPENDS
  protobuf: upgrade 4.25.4 -> 4.25.5
  lksctp-tools: upgrade 1.0.19 -> 1.0.20
  tcpslice: upgrade 1.7 -> 1.8
  libhugetlbfs: upgrade 2.23 -> 2.24

Yoann Congal (4):
  non-repro-meta-networking: update known non-reproducible list
  polkit: Update Upstream-Status of a merged patch
  wtmpdb: fix installed-vs-shipped build error
  minidlna: fix reproducibility

alperak (8):
  python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to PEP-517
    build backend
  python3-alembic: switch to PEP-517 build backend
  python3-inflate64: switch to PEP-517 build backend
  python3-spidev: switch to PEP-517 build backend
  python3-pastedeploy: switch to PEP-517 build backend
  python3-reedsolo: switch to PEP-517 build backend
  curlpp: Fix build issue
  libhugetlbfs: Fix contains reference to TMPDIR [buildpaths] error

ptak (1):
  opencv: upgrade 4.9.0 -> 4.10.0

s-tokumoto (2):
  capnproto: Add "capnp" to CVE_PRODUCT
  fuse: Add "fuse:fuse" to CVE_PRODUCT

 .../recipes-support/fuse/fuse_2.9.9.bb        |   2 +-
 ...unds_46.0.bb => gnome-backgrounds_47.0.bb} |   2 +-
 ...nome-chess_46.0.bb => gnome-chess_47.0.bb} |   4 +-
 ...-desktop_44.0.bb => gnome-desktop_44.1.bb} |   2 +-
 ...dow-Fix-function-callback-definition.patch |  43 --
 ...ewer_46.0.bb => gnome-font-viewer_47.0.bb} |   3 +-
 .../gnome-shell/gnome-shell_46.2.bb           |   1 +
 .../tecla/{tecla_46.0.bb => tecla_47.0.bb}    |   2 +-
 .../recipes-multimedia/minidlna/minidlna.inc  |   4 +
 .../include/non-repro-meta-networking.inc     |  33 +-
 .../recipes-connectivity/nanomsg/nng_1.7.3.bb |   2 +-
 .../wireguard/wireguard-tools_1.0.20210914.bb |   2 +-
 ...id-conversion-from-int-to-CURLoption.patch |  36 +
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |   3 +-
 ...tools_1.0.19.bb => lksctp-tools_1.0.20.bb} |  14 +-
 ...riables-indicating-buildtime-informa.patch |  85 +++
 .../recipes-support/ndisc6/ndisc6_1.0.8.bb    |   1 +
 .../stunnel/stunnel/fix-openssl-no-des.patch  |  19 +-
 .../{stunnel_5.72.bb => stunnel_5.73.bb}      |   2 +-
 .../{tcpslice_1.7.bb => tcpslice_1.8.bb}      |   2 +-
 ...raceroute_2.1.5.bb => traceroute_2.1.6.bb} |   2 +-
 .../wireshark/wireshark_4.2.7.bb              |   2 +-
 ...bfs-fix-Ttext-segment-argument-on-AA.patch | 210 ------
 ...32-and-LIB64-if-they-point-to-the-s.patch} |  19 +-
 ...Append-CPPFLAGS-rather-then-override.patch |  31 -
 ...d-search-host-library-path-for-cros.patch} |   6 +-
 ...le-install-static-4G-edge-testcases.patch} |  22 +-
 ...t-use-hard-coded-path-.-obj-hugeadm.patch} |   8 +-
 ...i386-avoid-search-host-library-path.patch} |   6 +-
 ...0006-include-stddef.h-for-ptrdiff_t.patch} |  12 +-
 ...=> 0007-Mark-glibc-specific-code-so.patch} |  19 +-
 ...conf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} |  12 +-
 ...hm.c-Mark-glibc-specific-changes-so.patch} |  10 +-
 ... => 0010-Include-dirent.h-for-ino_t.patch} |   8 +-
 ... 0011-include-limits.h-for-PATH_MAX.patch} |  14 +-
 ...etup_helper-use-python3-interpreter.patch} |   6 +-
 ...link.c-include-libgen.h-for-basename.patch |  41 ++
 .../libhugetlbfs/libhugetlbfs_2.24.bb         |  87 +++
 .../libhugetlbfs/libhugetlbfs_git.bb          |  79 --
 .../cryptsetup/cryptsetup_2.7.5.bb            |   2 +-
 .../0001-absl-always-use-asm-sgidefs.h.patch  |   7 +-
 ...e-maes-option-from-cross-compilation.patch |  17 +-
 ...e-neon-option-from-cross-compilation.patch |  18 +-
 ...aledcycleclock-remove-RISC-V-support.patch |  82 ---
 ...ixes.patch => 0004-abseil-ppc-fixes.patch} |  44 +-
 ...20240116.2.bb => abseil-cpp_20240722.0.bb} |   7 +-
 .../capnproto/capnproto_1.0.2.bb              |   2 +
 ....20240908.0.bb => ctags_6.1.20240915.0.bb} |   2 +-
 .../oe-npm-cache                              |   0
 ....17.bb => nodejs-oe-cache-native_20.18.bb} |   0
 ...001-build-fix-build-with-Python-3.12.patch |  55 --
 .../0001-gyp-resolve-python-3.12-issues.patch |  63 --
 .../nodejs/nodejs/libatomic.patch             |   2 +-
 .../{nodejs_20.17.0.bb => nodejs_20.18.0.bb}  |   4 +-
 .../perfetto/common/0001-fix-musl-build.patch |  40 ++
 ...ng-header-cstdint-for-uintXX_t-types.patch |  58 --
 .../recipes-devtools/perfetto/libperfetto.bb  |   2 +-
 ...1-meson-add-pc-file-for-lib_perfetto.patch |  20 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  30 +-
 .../recipes-devtools/perfetto/perfetto.inc    |  11 +-
 ...-Remove-check_build_deps-build-steps.patch |  18 +-
 .../0002-traced-fix-missing-include.patch     |  28 +
 ...{protobuf_4.25.4.bb => protobuf_4.25.5.bb} |   4 +-
 ...copg_3.2.1.bb => python3-psycopg_3.2.2.bb} |   2 +-
 .../xmlrpc-c/xmlrpc-c_1.59.01.bb              |   2 +-
 ...-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch |  51 ++
 .../recipes-extended/jansson/jansson_2.14.bb  |   1 +
 .../pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb}  |   2 +-
 ...pport-openembedded-OS-for-PAM-config.patch |   2 +-
 .../rsyslog/rsyslog_8.2408.0.bb               |  11 +-
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |   2 +-
 .../recipes-extended/wtmpdb/wtmpdb_0.11.0.bb  |   1 +
 .../kernel-selftest/kernel-selftest.bb        |  26 +-
 .../sound-theme-freedesktop_0.8.bb            |   2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb  |   3 +-
 meta-oe/recipes-security/audit/audit_4.0.2.bb |   8 +
 ...ne-overflow-in-the-IP-protocol-table.patch | 165 +++++
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |   1 +
 ...g-of-global-c-objects-once-they-are-.patch | 672 ++++++++++++++++++
 .../recipes-security/softhsm/softhsm_2.6.1.bb |   1 +
 .../bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb}  |   2 +-
 ...ibmanette_0.2.7.bb => libmanette_0.2.9.bb} |   2 +-
 ...-missing-prototype-compiler-warnings.patch |  53 ++
 ...ix-invalid-memory-de-reference-issue.patch |  44 ++
 ...escriptor-leaks-reported-by-cppcheck.patch | 101 +++
 ...0006-fix-memleak-on-tar_open-failure.patch |  26 +
 ...ix-memleaks-in-libtar-sample-program.patch | 119 ++++
 ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 +++
 ...-for-NULL-before-freeing-th_pathname.patch |  30 +
 ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 +
 ...amming-mistakes-detected-by-static-a.patch | 100 +++
 .../libtar/files/CVE-2013-4420.patch          | 160 +++++
 ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 ++
 .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 ++
 .../recipes-support/libtar/libtar_1.2.20.bb   |  12 +
 .../{opencv_4.9.0.bb => opencv_4.10.0.bb}     |   4 +-
 ...ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch |  40 --
 ...{syslog-ng_4.6.0.bb => syslog-ng_4.7.0.bb} |   5 +-
 ...b1773bff2ef7c3b867ab019d69faa36c010d.patch |  33 +
 .../webkitgtk/webkitgtk3_2.44.3.bb            |   6 +-
 .../recipes-support/xmlsec1/xmlsec1_1.3.5.bb  |   2 +-
 .../python/python3-alembic_1.13.2.bb          |   4 +-
 ..._4.4.0.bb => python3-elementpath_4.5.0.bb} |   2 +-
 .../python/python3-eth-hash_0.7.0.bb          |  20 +-
 ...t_0.36.1.bb => python3-eventlet_0.37.0.bb} |   2 +-
 ...k_3.16.0.bb => python3-filelock_3.16.1.bb} |   2 +-
 ...let_3.0.3.bb => python3-greenlet_3.1.0.bb} |   2 +-
 .../python/python3-gunicorn_23.0.0.bb         |   2 +
 .../python/python3-inflate64_1.0.0.bb         |   4 +-
 ...n3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb} |   2 +-
 ...iko_3.4.1.bb => python3-paramiko_3.5.0.bb} |   2 +-
 .../python/python3-pastedeploy_3.1.0.bb       |  17 +-
 .../python/python3-pint/run-ptest             |   2 +-
 ...-pint_0.24.1.bb => python3-pint_0.24.3.bb} |  17 +-
 ...4.3.1.bb => python3-platformdirs_4.3.6.bb} |   2 +-
 ...4.0.bb => python3-pyasn1-modules_0.4.1.bb} |   2 +-
 .../python/python3-pydbus_0.6.0.bb            |   2 +-
 ...p_2.4.197.bb => python3-pymisp_2.4.198.bb} |   2 +-
 ....7.1.bb => python3-pyproject-api_1.7.2.bb} |   2 +-
 ...t_mock-skip-args-introspection-tests.patch |  38 -
 .../python/python3-pytest-mock/run-ptest      |   4 +-
 .../python/python3-pytest-mock_3.14.0.bb      |  19 +-
 ....1.0.bb => python3-pyunormalize_16.0.0.bb} |   4 +-
 ...024.7.24.bb => python3-regex_2024.9.11.bb} |   2 +-
 ...7.0.1.bb => python3-robotframework_7.1.bb} |   2 +-
 .../python/python3-spidev_3.6.bb              |   2 +-
 ...2.0.32.bb => python3-sqlalchemy_2.0.35.bb} |   7 +-
 .../python/python3-sqlparse_0.5.1.bb          |   1 +
 .../python/python3-typer/run-ptest            |   3 +-
 .../python/python3-ujson/run-ptest            |   2 +-
 .../python/python3-ujson_5.10.0.bb            |   3 +-
 .../python/python3-validators_0.34.0.bb       |   4 +
 ....26.4.bb => python3-virtualenv_20.26.5.bb} |   2 +-
 ...ma_3.3.2.bb => python3-xmlschema_3.4.1.bb} |   2 +-
 ...-yarl_1.10.0.bb => python3-yarl_1.11.1.bb} |   2 +-
 .../python3-reedsolo_2.1.0b1.bb               |   2 +-
 ...-rich_13.8.0.bb => python3-rich_13.8.1.bb} |   2 +-
 .../recipes-httpd/apache2/apache2_2.4.62.bb   |   2 +-
 ...-panel_4.18.3.bb => xfce4-panel_4.18.5.bb} |   2 +-
 139 files changed, 2452 insertions(+), 1013 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_46.0.bb => gnome-backgrounds_47.0.bb} (76%)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb => gnome-chess_47.0.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb => gnome-desktop_44.1.bb} (92%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_46.0.bb => gnome-font-viewer_47.0.bb} (71%)
 rename meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} (80%)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} (79%)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
 rename meta-networking/recipes-support/stunnel/{stunnel_5.72.bb => stunnel_5.73.bb} (93%)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb => tcpslice_1.8.bb} (87%)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb => traceroute_2.1.6.bb} (94%)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch => 0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} (70%)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-avoid-search-host-library-path-for-cros.patch => 0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} (98%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{tests-Makefile-install-static-4G-edge-testcases.patch => 0003-tests-Makefile-install-static-4G-edge-testcases.patch} (73%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch => 0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} (90%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-elf_i386-avoid-search-host-library-path.patch => 0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} (94%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-include-stddef.h-for-ptrdiff_t.patch => 0006-include-stddef.h-for-ptrdiff_t.patch} (81%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0002-Mark-glibc-specific-code-so.patch => 0007-Mark-glibc-specific-code-so.patch} (74%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch => 0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} (92%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0004-shm.c-Mark-glibc-specific-changes-so.patch => 0009-shm.c-Mark-glibc-specific-changes-so.patch} (91%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0005-Include-dirent.h-for-ino_t.patch => 0010-Include-dirent.h-for-ino_t.patch} (90%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0006-include-limits.h-for-PATH_MAX.patch => 0011-include-limits.h-for-PATH_MAX.patch} (85%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-huge_page_setup_helper-use-python3-interpreter.patch => 0012-huge_page_setup_helper-use-python3-interpreter.patch} (88%)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
 rename meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch => 0004-abseil-ppc-fixes.patch} (69%)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240722.0.bb} (88%)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb => ctags_6.1.20240915.0.bb} (95%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.17 => nodejs-oe-cache-20.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.17.bb => nodejs-oe-cache-native_20.18.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb => nodejs_20.18.0.bb} (98%)
 create mode 100644 meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
 delete mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
 rename meta-oe/recipes-devtools/perfetto/{files => libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch (69%)
 rename meta-oe/recipes-devtools/perfetto/{files => perfetto}/0001-Remove-check_build_deps-build-steps.patch (85%)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb => protobuf_4.25.5.bb} (97%)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb => python3-psycopg_3.2.2.bb} (85%)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb} (93%)
 create mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
 create mode 100644 meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb} (96%)
 rename meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb => libmanette_0.2.9.bb} (87%)
 create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb} (98%)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb => syslog-ng_4.7.0.bb} (97%)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.4.0.bb => python3-elementpath_4.5.0.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.36.1.bb => python3-eventlet_0.37.0.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.16.0.bb => python3-filelock_3.16.1.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.3.bb => python3-greenlet_3.1.0.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.1.bb => python3-paramiko_3.5.0.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb => python3-pint_0.24.3.bb} (66%)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.3.1.bb => python3-platformdirs_4.3.6.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.0.bb => python3-pyasn1-modules_0.4.1.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.197.bb => python3-pymisp_2.4.198.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.1.bb => python3-pyproject-api_1.7.2.bb} (86%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
 rename meta-python/recipes-devtools/python/{python3-pyunormalize_15.1.0.bb => python3-pyunormalize_16.0.0.bb} (58%)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.7.24.bb => python3-regex_2024.9.11.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.0.1.bb => python3-robotframework_7.1.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} (77%)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.4.bb => python3-virtualenv_20.26.5.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.2.bb => python3-xmlschema_3.4.1.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb => python3-yarl_1.11.1.bb} (88%)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.8.0.bb => python3-rich_13.8.1.bb} (85%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb => xfce4-panel_4.18.5.bb} (94%)

-- 
2.43.0


