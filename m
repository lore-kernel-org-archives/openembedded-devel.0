Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD6DD6C29B
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 21:15:32 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.32946.1732050927368253376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 13:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dUcyodDx;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7180a5ba498so2444813a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 13:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732050926; x=1732655726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RCLpX0KhENCV8PND3z1T3axGoWJMq5ku+OqF+qgeXU=;
        b=dUcyodDxS425mKYoSbIWjcrTcpcG2a7AsmWPH11kC8n4IVdX/RdYRJFQiL39rsE3z0
         iaHEf9Qsb3510AWX8y3+trsJy22qu7b7Hdfl4CXjw+jeNGcb+r+cA4aem6ol2LVVIFrz
         m2TdIS//lFC4jSlaKa5nPctVf9CsMP8youiWHApTSPiHoBn+VPne5wvVlWpSsleFT+R7
         7RtuTa+R6Rwz+eaE1zXh3vDvQ4PubmTPYdasmju6Qv8exnG/wHei6gra7771kJaVrD7R
         ct0h4xd3OfeO7Pl3rYp5hY/XgpBeXFbrNZWy1U25R9rhdJN6vRdePmD36kVRnNoDufJC
         Jw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732050926; x=1732655726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RCLpX0KhENCV8PND3z1T3axGoWJMq5ku+OqF+qgeXU=;
        b=DLXiRwmFwIl8KaBxx1RApxUNhGpLUXBR2Ivu7/n7rfjmIQ/YGL0ow4YVsyhHJrr51M
         s1f8Pn3wnXQZDOyWsveiUhF90DbFoWm17r4tEagYg/pvR/znq+IW2/ADPVt51WhsbJLn
         nYtTqj4XIQxzkRPAo7FxoIVT0uU2MqKfKXwp+h6qV3II7L+/Hb7s0Lwv4aHNTFebFlvh
         VOYYqWIt4uJGoiJMFKhvtXdenOjKmeMluXY9CfcfIo4kpGA87wDwnuviXl5Aet/NTBGz
         7FFaoZbIrg6l9Oj3biv7UjtZdNVNY8c1xU/zv1CCkHg1S1q6TnGYvJxHaXrR8MLxb+OI
         t7lw==
X-Gm-Message-State: AOJu0YyI1CzoqJTzueKmSMFAOQ7u5023NoQi8xJ0+yDvONwIl2cYdkxP
	tnzT1AqhdEO5P/LUlAn4Mk30lcNW8rdcsZnm75BZx/VpMXd4+jCt+tRzCYkJyC39qeKurM7JScS
	ZHTssrsc5TFnTNX86QuvZhOQRmYfSFw==
X-Google-Smtp-Source: AGHT+IHnerxiiIc9BLLfLCSrOh47SVcb/tXGEMei4xOzRlNsrDxTUO6Ea3cVzMA/Ub0Zg2cTB9/qitw6jRoVordSTO0=
X-Received: by 2002:a05:6830:378a:b0:718:1150:a031 with SMTP id
 46e09a7af769-71ab3159df2mr534738a34.14.1732050926382; Tue, 19 Nov 2024
 13:15:26 -0800 (PST)
MIME-Version: 1.0
References: <dcf8b1d5-cb88-4401-9835-e51104834dcb@gmail.com>
In-Reply-To: <dcf8b1d5-cb88-4401-9835-e51104834dcb@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2024 13:15:00 -0800
Message-ID: <CAMKF1socZkfKXBC4Ae0ppPBBYC-ixpqDNz9JHrtbu+Fjp8m2Vg@mail.gmail.com>
Subject: Re: styhead merge request: Nov 9th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 21:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113917

merged now thanks Armin

On Sat, Nov 9, 2024 at 11:22=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit a7a24fc390966bb4ebe2cb1e536c2634494f46=
58:
>
>    meta-openemnedded: Add myself as styhead maintainer (2024-09-29
> 12:09:29 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/git/meta-openembedded styhead-next
>
> for you to fetch changes up to afbbe81df6425805392b62b6f153acf740782e8a:
>
>    nng: Rename default branch of github.com:nanomsg/nng.git (2024-11-09
> 14:07:27 -0500)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        audit: fix build when systemd is enabled.
>
> Chen Qi (1):
>        jansson: add JSON_INTEGER_IS_LONG_LONG for cmake
>
> Etienne Cordonnier (1):
>        perfetto: upgrade 31.0 -> 47.0
>
> Ghislain Mang=C3=A9 (1):
>        wireshark: fix typo in PACKAGECONFIG[zstd]
>
> J. S. (5):
>        syslog-ng: upgrade 4.6.0 -> 4.7.0
>        xfce4-panel: upgrade 4.18.3 -> 4.18.4
>        nodejs: upgrade 20.17.0 -> 20.18.0
>        xfce4-panel: upgrade 4.18.4 -> 4.18.5
>        nodejs: cleanup
>
> Jeroen Knoops (1):
>        nng: Rename default branch of github.com:nanomsg/nng.git
>
> Jiaying Song (2):
>        wireguard-tools: fix do_fetch error
>        vlock: fix do_fetch error
>
> Jose Quaresma (3):
>        gpsd: make the meta-python dependency conditionally
>        Revert "gpsd: make the meta-python dependency conditionally"
>        gpsd: condition the runtime dependence of pyserial on the pygps
>
> Katariina Lounento (1):
>        libtar: patch CVEs
>
> Khem Raj (17):
>        python3-typer: Disable test_rich_markup_mode tests
>        python3-pydbus: Add missing rdep on xml module for ptests
>        python3-pdm: Upgrade to 2.19.1
>        python3-pdm-backend: Upgrade to 2.4.1 release
>        python3-ujson: Add python misc modules to ptest rdeps
>        python3-gunicorn: Add missing rdeps for ptests
>        python3-eth-hash: Add packageconfigs and switch to pep517-backend
>        python3-validators: Add missing rdeps for ptests
>        python3-pint: Upgrade to 0.24.3
>        python3-pytest-mock: Fix ptests
>        python3-sqlparse: Add missing rdep on mypy module for ptests
>        libhugetlbfs: Use linker wrapper during build
>        webkitgtk3: Always use -g1 for debug flags
>        webkitgtk3: Fix build break with latest gir
>        ndisc6: Fix reproducible build
>        rsyslog: Enable 64bit atomics check
>        xmlsec1: Switch SRC_URI to use github release
>
> Liyin Zhang (1):
>        sound-theme-freedesktop: Update SRC_URI
>
> Markus Volk (3):
>        gnome-shell: add gnome-control-center dependency
>        gnome-desktop: update 44.0 -> 44.1
>        cryptsetup: fix udev PACKAGECONFIG
>
> Martin Jansa (1):
>        xmlrpc-c: update SRCREV
>
> Rouven Czerwinski (1):
>        softhsm: add destroyed global access prevention patch
>
> Ryan Eatmon (1):
>        kernel-selftest: Update to allow for turning on all tests
>
> Shinji Matsunaga (1):
>        audit: Fix CVE_PRODUCT
>
> Valeria Petrov (1):
>        apache2: do not depend on zlib header and libs from host
>
> Wang Mingyu (29):
>        bdwgc: upgrade 8.2.6 -> 8.2.8
>        ctags: upgrade 6.1.20240908.0 -> 6.1.20240915.0
>        gnome-backgrounds: upgrade 46.0 -> 47.0
>        gnome-chess: upgrade 46.0 -> 47.0
>        gnome-font-viewer: upgrade 46.0 -> 47.0
>        libmanette: upgrade 0.2.7 -> 0.2.9
>        pegtl: upgrade 3.2.7 -> 3.2.8
>        python3-elementpath: upgrade 4.4.0 -> 4.5.0
>        python3-eventlet: upgrade 0.36.1 -> 0.37.0
>        python3-filelock: upgrade 3.16.0 -> 3.16.1
>        python3-greenlet: upgrade 3.0.3 -> 3.1.0
>        python3-nmap: upgrade 1.6.0 -> 1.9.1
>        python3-paramiko: upgrade 3.4.1 -> 3.5.0
>        python3-platformdirs: upgrade 4.3.1 -> 4.3.6
>        python3-psycopg: upgrade 3.2.1 -> 3.2.2
>        python3-pyasn1-modules: upgrade 0.4.0 -> 0.4.1
>        python3-pymisp: upgrade 2.4.197 -> 2.4.198
>        python3-pyproject-api: upgrade 1.7.1 -> 1.7.2
>        python3-pyunormalize: upgrade 15.1.0 -> 16.0.0
>        python3-regex: upgrade 2024.7.24 -> 2024.9.11
>        python3-rich: upgrade 13.8.0 -> 13.8.1
>        python3-robotframework: upgrade 7.0.1 -> 7.1
>        python3-virtualenv: upgrade 20.26.4 -> 20.26.5
>        python3-xmlschema: upgrade 3.3.2 -> 3.4.1
>        python3-yarl: upgrade 1.10.0 -> 1.11.1
>        stunnel: upgrade 5.72 -> 5.73
>        tecla: upgrade 46.0 -> 47.0
>        traceroute: upgrade 2.1.5 -> 2.1.6
>        nmap: Fix off-by-one overflow in the IP protocol table.
>
> Yi Zhao (6):
>        abseil-cpp: upgrade 20240116.2 -> 20240722.0
>        protobuf: add abseil-cpp to RDEPENDS
>        protobuf: upgrade 4.25.4 -> 4.25.5
>        lksctp-tools: upgrade 1.0.19 -> 1.0.20
>        tcpslice: upgrade 1.7 -> 1.8
>        libhugetlbfs: upgrade 2.23 -> 2.24
>
> Yoann Congal (4):
>        non-repro-meta-networking: update known non-reproducible list
>        polkit: Update Upstream-Status of a merged patch
>        wtmpdb: fix installed-vs-shipped build error
>        minidlna: fix reproducibility
>
> alperak (8):
>        python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to
> PEP-517 build backend
>        python3-alembic: switch to PEP-517 build backend
>        python3-inflate64: switch to PEP-517 build backend
>        python3-spidev: switch to PEP-517 build backend
>        python3-pastedeploy: switch to PEP-517 build backend
>        python3-reedsolo: switch to PEP-517 build backend
>        curlpp: Fix build issue
>        libhugetlbfs: Fix contains reference to TMPDIR [buildpaths] error
>
> ptak (1):
>        opencv: upgrade 4.9.0 -> 4.10.0
>
> s-tokumoto (2):
>        capnproto: Add "capnp" to CVE_PRODUCT
>        fuse: Add "fuse:fuse" to CVE_PRODUCT
>
>   meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb |   2 +-
>   .../gnome-backgrounds/{gnome-backgrounds_46.0.bb =3D>
> gnome-backgrounds_47.0.bb}            |   2 +-
>   meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb =3D>
> gnome-chess_47.0.bb}         |   4 +-
>   meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb =3D>
> gnome-desktop_44.1.bb}   |   2 +-
>   .../gnome-font-viewer/0001-window-Fix-function-callback-definition.patc=
h
> |  43 ---
>   .../gnome-font-viewer/{gnome-font-viewer_46.0.bb =3D>
> gnome-font-viewer_47.0.bb}            |   3 +-
>   meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb |   1 +
>   meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb =3D>
> tecla_47.0.bb}                           |   2 +-
>   meta-multimedia/recipes-multimedia/minidlna/minidlna.inc |   4 +
>   meta-networking/conf/include/non-repro-meta-networking.inc |  33 +--
>   meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb |   2 +-
>   meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.b=
b
> |   2 +-
>   .../curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.pa=
tch
> |  36 +++
>   meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb |   3 +-
>   .../recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb =3D>
> lksctp-tools_1.0.20.bb}       |  14 +-
>   .../ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-inf=
orma.patch
> |  85 ++++++
>   meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb |   1 +
>   meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patc=
h
> |  19 +-
>   meta-networking/recipes-support/stunnel/{stunnel_5.72.bb =3D>
> stunnel_5.73.bb}              |   2 +-
>   meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb =3D>
> tcpslice_1.8.bb}              |   2 +-
>   meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb =3D>
> traceroute_2.1.6.bb}   |   2 +-
>   meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb |   2 +-
>   .../libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argum=
ent-on-AA.patch
> | 210 --------------
>   ...int-to-the-s.patch =3D>
> 0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} | 19 +-
>   .../libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-=
override.patch
> |  31 --
>   ...ath-for-cros.patch =3D>
> 0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} | 6 +-
>   ...4G-edge-testcases.patch =3D>
> 0003-tests-Makefile-install-static-4G-edge-testcases.patch} |  22 +-
>   ...h-.-obj-hugeadm.patch =3D>
> 0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} |   8 +-
>   ...library-path.patch =3D>
> 0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} | 6 +-
>   ...001-include-stddef.h-for-ptrdiff_t.patch =3D>
> 0006-include-stddef.h-for-ptrdiff_t.patch} |  12 +-
>   .../{0002-Mark-glibc-specific-code-so.patch =3D>
> 0007-Mark-glibc-specific-code-so.patch}    |  19 +-
>   ...INESIZE-on-l.patch =3D>
> 0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} | 12 +-
>   ...rk-glibc-specific-changes-so.patch =3D>
> 0009-shm.c-Mark-glibc-specific-changes-so.patch} |  10 +-
>   .../{0005-Include-dirent.h-for-ino_t.patch =3D>
> 0010-Include-dirent.h-for-ino_t.patch}      |   8 +-
>   ...{0006-include-limits.h-for-PATH_MAX.patch =3D>
> 0011-include-limits.h-for-PATH_MAX.patch} |  14 +-
>   ...ython3-interpreter.patch =3D>
> 0012-huge_page_setup_helper-use-python3-interpreter.patch} |   6 +-
>   .../libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.pat=
ch
> |  41 +++
>   meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb |  87 +++++=
+
>   meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb |  79 -----
>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb |   2 +-
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm=
-sgidefs.h.patch
> |   7 +-
>   .../abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilatio=
n.patch
> |  17 +-
>   .../abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilatio=
n.patch
> |  18 +-
>   .../abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V=
-support.patch
> |  82 ------
>   .../abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch =3D>
> 0004-abseil-ppc-fixes.patch}         |  44 ++-
>   .../recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb =3D>
> abseil-cpp_20240722.0.bb}    |   7 +-
>   meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb |   2 +
>   meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb =3D>
> ctags_6.1.20240915.0.bb}       |   2 +-
>   .../recipes-devtools/nodejs/{nodejs-oe-cache-20.17 =3D>
> nodejs-oe-cache-20.18}/oe-npm-cache |   0
>   .../nodejs/{nodejs-oe-cache-native_20.17.bb =3D>
> nodejs-oe-cache-native_20.18.bb}           |   0
>   meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python=
-3.12.patch
> |  55 ----
>   meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-iss=
ues.patch
> |  63 ----
>   meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch |   2 +-
>   meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb =3D>
> nodejs_20.18.0.bb}                  |   4 +-
>   meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch |
> 40 +++
>   .../perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.p=
atch
> |  58 ----
>   meta-oe/recipes-devtools/perfetto/libperfetto.bb |   2 +-
>   .../perfetto/{files =3D>
> libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch |  20 +-
>   meta-oe/recipes-devtools/perfetto/perfetto.bb |  30 +-
>   meta-oe/recipes-devtools/perfetto/perfetto.inc |  11 +-
>   .../perfetto/{files =3D>
> perfetto}/0001-Remove-check_build_deps-build-steps.patch |  18 +-
>   meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-incl=
ude.patch
> |  28 ++
>   meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb =3D>
> protobuf_4.25.5.bb}              |   4 +-
>   meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb =3D>
> python3-psycopg_3.2.2.bb}    |   2 +-
>   meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb |   2 +-
>   .../jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.p=
atch
> |  51 ++++
>   meta-oe/recipes-extended/jansson/jansson_2.14.bb |   1 +
>   meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb =3D>
> pegtl_3.2.8.bb}                         |   2 +-
>   .../polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.pat=
ch
> |   2 +-
>   meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb |  11 +-
>   meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |   2 +-
>   meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb |   1 +
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb |  26 +-
>   meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
> |   2 +-
>   meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb |   3 +-
>   meta-oe/recipes-security/audit/audit_4.0.2.bb |   8 +
>   .../nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.pa=
tch
> | 165 +++++++++++
>   meta-oe/recipes-security/nmap/nmap_7.95.bb |   1 +
>   .../softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-=
are-.patch
> | 672 +++++++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb |   1 +
>   meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb =3D>
> bdwgc_8.2.8.bb}                          |   2 +-
>   meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb =3D>
> libmanette_0.2.9.bb}           |   2 +-
>   meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compile=
r-warnings.patch
> |  53 ++++
>   meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-referen=
ce-issue.patch
> |  44 +++
>   .../libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.pa=
tch
> | 101 +++++++
>   meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failu=
re.patch
> |  26 ++
>   meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample=
-program.patch
> | 119 ++++++++
>   .../libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_path=
nam.patch
> |  89 ++++++
>   meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing=
-th_pathname.patch
> |  30 ++
>   meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-=
lib-decode.c.patch
> |  26 ++
>   .../libtar/files/0011-libtar-fix-programming-mistakes-detected-by-stati=
c-a.patch
> | 100 +++++++
>   meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch | 160 ++++++++=
+++
>   meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-=
2021-33646.patch
> |  42 +++
>   meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patc=
h
> |  52 ++++
>   meta-oe/recipes-support/libtar/libtar_1.2.20.bb |  12 +
>   meta-oe/recipes-support/opencv/{opencv_4.9.0.bb =3D>
> opencv_4.10.0.bb}                      |   4 +-
>   .../syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_I=
PV6.patch
> |  40 ---
>   meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb =3D>
> syslog-ng_4.7.0.bb}              |   5 +-
>   .../recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69=
faa36c010d.patch
> |  33 +++
>   meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb |   6 +-
>   meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb |   2 +-
>   meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb |   4 +-
>   .../python/{python3-elementpath_4.4.0.bb =3D>
> python3-elementpath_4.5.0.bb}                 |   2 +-
>   meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb |  20 +-
>   .../recipes-devtools/python/{python3-eventlet_0.36.1.bb =3D>
> python3-eventlet_0.37.0.bb}    |   2 +-
>   .../recipes-devtools/python/{python3-filelock_3.16.0.bb =3D>
> python3-filelock_3.16.1.bb}    |   2 +-
>   .../recipes-devtools/python/{python3-greenlet_3.0.3.bb =3D>
> python3-greenlet_3.1.0.bb}      |   2 +-
>   meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb |   2 +
>   meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb |   4 +-
>   meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb =3D>
> python3-nmap_1.9.1.bb}      |   2 +-
>   .../recipes-devtools/python/{python3-paramiko_3.4.1.bb =3D>
> python3-paramiko_3.5.0.bb}      |   2 +-
>   meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb |  17 =
+-
>   .../python/{python3-pdm-backend_2.3.3.bb =3D>
> python3-pdm-backend_2.4.1.bb}                 |   2 +-
>   meta-python/recipes-devtools/python/{python3-pdm_2.16.1.bb =3D>
> python3-pdm_2.19.1.bb}      |   3 +-
>   meta-python/recipes-devtools/python/python3-pint/run-ptest |   2 +-
>   meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb =3D>
> python3-pint_0.24.3.bb}    |  17 +-
>   .../python/{python3-platformdirs_4.3.1.bb =3D>
> python3-platformdirs_4.3.6.bb}               |   2 +-
>   .../python/{python3-pyasn1-modules_0.4.0.bb =3D>
> python3-pyasn1-modules_0.4.1.bb}           |   2 +-
>   meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb |   2 +-
>   .../recipes-devtools/python/{python3-pymisp_2.4.197.bb =3D>
> python3-pymisp_2.4.198.bb}      |   2 +-
>   .../python/{python3-pyproject-api_1.7.1.bb =3D>
> python3-pyproject-api_1.7.2.bb}             |   2 +-
>   .../python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspe=
ction-tests.patch
> |  38 ---
>   meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest |   4=
 +-
>   meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb |  19=
 +-
>   .../python/{python3-pyunormalize_15.1.0.bb =3D>
> python3-pyunormalize_16.0.0.bb}             |   4 +-
>   .../recipes-devtools/python/{python3-regex_2024.7.24.bb =3D>
> python3-regex_2024.9.11.bb}    |   2 +-
>   .../python/{python3-robotframework_7.0.1.bb =3D>
> python3-robotframework_7.1.bb}             |   2 +-
>   meta-python/recipes-devtools/python/python3-spidev_3.6.bb |   2 +-
>   .../python/{python3-sqlalchemy_2.0.32.bb =3D>
> python3-sqlalchemy_2.0.35.bb}                 |   7 +-
>   meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb |   1 +
>   meta-python/recipes-devtools/python/python3-typer/run-ptest |   3 +-
>   meta-python/recipes-devtools/python/python3-ujson/run-ptest |   2 +-
>   meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb |   3 +-
>   meta-python/recipes-devtools/python/python3-validators_0.34.0.bb |   4 =
+
>   .../python/{python3-virtualenv_20.26.4.bb =3D>
> python3-virtualenv_20.26.5.bb}               |   2 +-
>   .../recipes-devtools/python/{python3-xmlschema_3.3.2.bb =3D>
> python3-xmlschema_3.4.1.bb}    |   2 +-
>   meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb =3D>
> python3-yarl_1.11.1.bb}    |   2 +-
>   meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.=
bb
> |   2 +-
>   .../recipes-extended/python-rich/{python3-rich_13.8.0.bb =3D>
> python3-rich_13.8.1.bb}       |   2 +-
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb |   2 +-
>   meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb =3D>
> xfce4-panel_4.18.5.bb}       |   2 +-
>   141 files changed, 2455 insertions(+), 1015 deletions(-)
>   rename
> meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_46.0.bb =3D=
>
> gnome-backgrounds_47.0.bb} (76%)
>   rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb =3D>
> gnome-chess_47.0.bb} (92%)
>   rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb
> =3D> gnome-desktop_44.1.bb} (92%)
>   delete mode 100644
> meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-=
Fix-function-callback-definition.patch
>   rename
> meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_46.0.bb =3D=
>
> gnome-font-viewer_47.0.bb} (71%)
>   rename meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb =3D> tecla_47.0.bb=
}
> (80%)
>   create mode 100644
> meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion=
-from-int-to-CURLoption.patch
>   rename
> meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb =3D>
> lksctp-tools_1.0.20.bb} (79%)
>   create mode 100644
> meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variable=
s-indicating-buildtime-informa.patch
>   rename meta-networking/recipes-support/stunnel/{stunnel_5.72.bb =3D>
> stunnel_5.73.bb} (93%)
>   rename meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb =3D>
> tcpslice_1.8.bb} (87%)
>   rename meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb
> =3D> traceroute_2.1.6.bb} (94%)
>   delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix=
-Ttext-segment-argument-on-AA.patch
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{skip-checking-LIB32-and-LIB=
64-if-they-point-to-the-s.patch
> =3D> 0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} (70=
%)
>   delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-C=
PPFLAGS-rather-then-override.patch
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-avoid-search-h=
ost-library-path-for-cros.patch
> =3D> 0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} (98=
%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{tests-Makefile-install-stat=
ic-4G-edge-testcases.patch
> =3D> 0003-tests-Makefile-install-static-4G-edge-testcases.patch} (73%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-run_test.py-not-use-ha=
rd-coded-path-.-obj-hugeadm.patch
> =3D> 0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} (90%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-elf_i386-avoid=
-search-host-library-path.patch
> =3D> 0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} (94=
%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-include-stddef.h-for-p=
trdiff_t.patch
> =3D> 0006-include-stddef.h-for-ptrdiff_t.patch} (81%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0002-Mark-glibc-specific-co=
de-so.patch
> =3D> 0007-Mark-glibc-specific-code-so.patch} (74%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0003-alloc.c-Avoid-sysconf-=
_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
> =3D> 0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} (92=
%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0004-shm.c-Mark-glibc-speci=
fic-changes-so.patch
> =3D> 0009-shm.c-Mark-glibc-specific-changes-so.patch} (91%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0005-Include-dirent.h-for-i=
no_t.patch
> =3D> 0010-Include-dirent.h-for-ino_t.patch} (90%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0006-include-limits.h-for-P=
ATH_MAX.patch
> =3D> 0011-include-limits.h-for-PATH_MAX.patch} (85%)
>   rename
> meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-huge_page_setup_helper=
-use-python3-interpreter.patch
> =3D> 0012-huge_page_setup_helper-use-python3-interpreter.patch} (88%)
>   create mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libge=
n.h-for-basename.patch
>   create mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
>   delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>   delete mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycle=
clock-remove-RISC-V-support.patch
>   rename
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch
> =3D> 0004-abseil-ppc-fixes.patch} (69%)
>   rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb
> =3D> abseil-cpp_20240722.0.bb} (88%)
>   rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb =3D>
> ctags_6.1.20240915.0.bb} (95%)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.17 =3D>
> nodejs-oe-cache-20.18}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.17.bb =3D>
> nodejs-oe-cache-native_20.18.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3=
.12.patch
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issue=
s.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb =3D>
> nodejs_20.18.0.bb} (98%)
>   create mode 100644
> meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
>   delete mode 100644
> meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-f=
or-uintXX_t-types.patch
>   rename meta-oe/recipes-devtools/perfetto/{files =3D>
> libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch (69%)
>   rename meta-oe/recipes-devtools/perfetto/{files =3D>
> perfetto}/0001-Remove-check_build_deps-build-steps.patch (85%)
>   create mode 100644
> meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-includ=
e.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb =3D>
> protobuf_4.25.5.bb} (97%)
>   rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb =3D>
> python3-psycopg_3.2.2.bb} (85%)
>   create mode 100644
> meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LO=
NG_LONG-for-cmake.patch
>   rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb =3D>
> pegtl_3.2.8.bb} (93%)
>   create mode 100644
> meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-I=
P-protocol-table.patch
>   create mode 100644
> meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c=
-objects-once-they-are-.patch
>   rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb =3D>
> bdwgc_8.2.8.bb} (96%)
>   rename meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb =3D>
> libmanette_0.2.9.bb} (87%)
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-=
warnings.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference=
-issue.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-repor=
ted-by-cppcheck.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure=
.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-p=
rogram.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buf=
fer-in-th_get_pathnam.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-t=
h_pathname.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-li=
b-decode.c.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes=
-detected-by-static-a.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-20=
21-33646.patch
>   create mode 100644
> meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
>   rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb =3D>
> opencv_4.10.0.bb} (98%)
>   delete mode 100644
> meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-=
SYSLOG_NG_ENABLE_IPV6.patch
>   rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb =3D>
> syslog-ng_4.7.0.bb} (97%)
>   create mode 100644
> meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d=
69faa36c010d.patch
>   rename
> meta-python/recipes-devtools/python/{python3-elementpath_4.4.0.bb =3D>
> python3-elementpath_4.5.0.bb} (85%)
>   rename meta-python/recipes-devtools/python/{python3-eventlet_0.36.1.bb
> =3D> python3-eventlet_0.37.0.bb} (80%)
>   rename meta-python/recipes-devtools/python/{python3-filelock_3.16.0.bb
> =3D> python3-filelock_3.16.1.bb} (87%)
>   rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.3.bb
> =3D> python3-greenlet_3.1.0.bb} (81%)
>   rename meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb =3D>
> python3-nmap_1.9.1.bb} (82%)
>   rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.1.bb
> =3D> python3-paramiko_3.5.0.bb} (82%)
>   rename
> meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.3.bb =3D>
> python3-pdm-backend_2.4.1.bb} (80%)
>   rename meta-python/recipes-devtools/python/{python3-pdm_2.16.1.bb =3D>
> python3-pdm_2.19.1.bb} (75%)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb =3D>
> python3-pint_0.24.3.bb} (66%)
>   rename
> meta-python/recipes-devtools/python/{python3-platformdirs_4.3.1.bb =3D>
> python3-platformdirs_4.3.6.bb} (88%)
>   rename
> meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.0.bb =3D>
> python3-pyasn1-modules_0.4.1.bb} (90%)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.197.bb
> =3D> python3-pymisp_2.4.198.bb} (85%)
>   rename
> meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.1.bb =3D>
> python3-pyproject-api_1.7.2.bb} (86%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_=
mock-skip-args-introspection-tests.patch
>   rename
> meta-python/recipes-devtools/python/{python3-pyunormalize_15.1.0.bb =3D>
> python3-pyunormalize_16.0.0.bb} (58%)
>   rename meta-python/recipes-devtools/python/{python3-regex_2024.7.24.bb
> =3D> python3-regex_2024.9.11.bb} (80%)
>   rename
> meta-python/recipes-devtools/python/{python3-robotframework_7.0.1.bb =3D>
> python3-robotframework_7.1.bb} (91%)
>   rename
> meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb =3D>
> python3-sqlalchemy_2.0.35.bb} (77%)
>   rename
> meta-python/recipes-devtools/python/{python3-virtualenv_20.26.4.bb =3D>
> python3-virtualenv_20.26.5.bb} (87%)
>   rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.2.bb
> =3D> python3-xmlschema_3.4.1.bb} (81%)
>   rename meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb =3D>
> python3-yarl_1.11.1.bb} (88%)
>   rename
> meta-python/recipes-extended/python-rich/{python3-rich_13.8.0.bb =3D>
> python3-rich_13.8.1.bb} (85%)
>   rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb =3D>
> xfce4-panel_4.18.5.bb} (94%)

