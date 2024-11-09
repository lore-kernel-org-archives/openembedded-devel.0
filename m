Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C21D5E37F
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 19:22:58 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.23409.1731180170990590284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 11:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mE+R+PIa;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e292926104bso3009095276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 11:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731180170; x=1731784970; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XyzOeS7GvJZMSk1ihiKN9CinuL5Dn02ouQ5p/b0FbQ=;
        b=mE+R+PIafQ9GLBXudiZvzlNoDJToXCRSWdAR3K6NS2GhMrXw6xvD3qqtevjXPt6x8U
         w6vLG6d5MU3KyblUOu1Ga1vC76AheZL31HYyUnW4NPMtFz6eYX7eLfuYlBFls//k1n0I
         5xmJuLdPBnYdfbIHzQPrNUzSXqmIkq2Hl22w6dTXCtWa3JcoYV18X5HNvtoU8zs5826c
         +acifkmFIG0m+VIbLqpIXTxSmWQ6iDJ228A7r8IV+uQIz+tRyxPUH7gx1u93HafOFSJD
         lX7/rzL/5ck7iz3yvibkeYA7QyobglE7WK71cgPlogCCjujJcn7eux268O49Qz2ZyTmP
         U2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731180170; x=1731784970;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XyzOeS7GvJZMSk1ihiKN9CinuL5Dn02ouQ5p/b0FbQ=;
        b=JTvq06dZYFVXZSXJ/ICl6/+Yzazrh92vmo76MVCYCj24ZOF+32TzSUmyS2wDjWIl1+
         Wt2J432TH+Za3MYDvzPisZol23m9YbrkffxOMGqQmTz1qvtchtNX7KdytK3q44vZEi79
         0UGdbl721Gj2ptYI3POQVOt/A+hMyJuJhgRgBfBU+twwdfQR2DDVP/fOsG/KriN0LiEn
         IJMAPihvlH+zjBzQUL51lHnOt2fBjNwN824c6HzjIYC2fcZYKskY7VxLiWQ0J8fMYuF6
         l8Izs89R4VXn8GkKh1pYsrjnL/p/cXPg/LeET++I3etUh3XcD785D9L7ozQP1JxBBwHM
         RPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFhxu3MSgpYwEySxw14nLmuD1VGVzmUn5rHBKeOsMzIx8w802E75o7l7ZvuXXBuZ5wM6qjp7C/6CX/vjlRrhEiulk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzP3E5qVsokOLLRYAkMIl6Gc5fI//RKMjv9Wfxru4pHaJpVCfMi
	d1ceGqP6o4jyYQ6mtSP6aHtfHbzZ5DbFT1YUZPHC3hR/64IHqQunWkNruw==
X-Google-Smtp-Source: AGHT+IEwIPOCncSQ/SMthMHxyE2uJzZ5G667K4ht/hrXLzyNkr2IDumWpfemAOT2EFFrIxrQZmNxmA==
X-Received: by 2002:a05:6902:338a:b0:e29:2466:c813 with SMTP id 3f1490d57ef6-e337f862e92mr6708114276.19.1731180169568;
        Sat, 09 Nov 2024 11:22:49 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:d3e7:342d:b02:77cc? ([2600:1700:45dd:7000:d3e7:342d:b02:77cc])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336f1ba572sm1314568276.37.2024.11.09.11.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 11:22:49 -0800 (PST)
Message-ID: <dcf8b1d5-cb88-4401-9835-e51104834dcb@gmail.com>
Date: Sat, 9 Nov 2024 14:22:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: styhead merge request: Nov 9th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 19:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113775

The following changes since commit a7a24fc390966bb4ebe2cb1e536c2634494f4658:

   meta-openemnedded: Add myself as styhead maintainer (2024-09-29 
12:09:29 -0400)

are available in the Git repository at:

   https://git.openembedded.org/git/meta-openembedded styhead-next

for you to fetch changes up to afbbe81df6425805392b62b6f153acf740782e8a:

   nng: Rename default branch of github.com:nanomsg/nng.git (2024-11-09 
14:07:27 -0500)

----------------------------------------------------------------
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

Khem Raj (17):
       python3-typer: Disable test_rich_markup_mode tests
       python3-pydbus: Add missing rdep on xml module for ptests
       python3-pdm: Upgrade to 2.19.1
       python3-pdm-backend: Upgrade to 2.4.1 release
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
       python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to 
PEP-517 build backend
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

  meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb |   2 +-
  .../gnome-backgrounds/{gnome-backgrounds_46.0.bb => 
gnome-backgrounds_47.0.bb}            |   2 +-
  meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb => 
gnome-chess_47.0.bb}         |   4 +-
  meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb => 
gnome-desktop_44.1.bb}   |   2 +-
  .../gnome-font-viewer/0001-window-Fix-function-callback-definition.patch 
|  43 ---
  .../gnome-font-viewer/{gnome-font-viewer_46.0.bb => 
gnome-font-viewer_47.0.bb}            |   3 +-
  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb |   1 +
  meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => 
tecla_47.0.bb}                           |   2 +-
  meta-multimedia/recipes-multimedia/minidlna/minidlna.inc |   4 +
  meta-networking/conf/include/non-repro-meta-networking.inc |  33 +--
  meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb |   2 +-
  meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb 
|   2 +-
  .../curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch 
|  36 +++
  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb |   3 +-
  .../recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => 
lksctp-tools_1.0.20.bb}       |  14 +-
  .../ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch 
|  85 ++++++
  meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb |   1 +
  meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch 
|  19 +-
  meta-networking/recipes-support/stunnel/{stunnel_5.72.bb => 
stunnel_5.73.bb}              |   2 +-
  meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb => 
tcpslice_1.8.bb}              |   2 +-
  meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb => 
traceroute_2.1.6.bb}   |   2 +-
  meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb |   2 +-
  .../libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch 
| 210 --------------
  ...int-to-the-s.patch => 
0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} | 19 +-
  .../libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch 
|  31 --
  ...ath-for-cros.patch => 
0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} | 6 +-
  ...4G-edge-testcases.patch => 
0003-tests-Makefile-install-static-4G-edge-testcases.patch} |  22 +-
  ...h-.-obj-hugeadm.patch => 
0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} |   8 +-
  ...library-path.patch => 
0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} | 6 +-
  ...001-include-stddef.h-for-ptrdiff_t.patch => 
0006-include-stddef.h-for-ptrdiff_t.patch} |  12 +-
  .../{0002-Mark-glibc-specific-code-so.patch => 
0007-Mark-glibc-specific-code-so.patch}    |  19 +-
  ...INESIZE-on-l.patch => 
0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} | 12 +-
  ...rk-glibc-specific-changes-so.patch => 
0009-shm.c-Mark-glibc-specific-changes-so.patch} |  10 +-
  .../{0005-Include-dirent.h-for-ino_t.patch => 
0010-Include-dirent.h-for-ino_t.patch}      |   8 +-
  ...{0006-include-limits.h-for-PATH_MAX.patch => 
0011-include-limits.h-for-PATH_MAX.patch} |  14 +-
  ...ython3-interpreter.patch => 
0012-huge_page_setup_helper-use-python3-interpreter.patch} |   6 +-
  .../libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch 
|  41 +++
  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb |  87 ++++++
  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb |  79 -----
  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb |   2 +-
  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch 
|   7 +-
  .../abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch 
|  17 +-
  .../abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch 
|  18 +-
  .../abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch 
|  82 ------
  .../abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch => 
0004-abseil-ppc-fixes.patch}         |  44 ++-
  .../recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => 
abseil-cpp_20240722.0.bb}    |   7 +-
  meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb |   2 +
  meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb => 
ctags_6.1.20240915.0.bb}       |   2 +-
  .../recipes-devtools/nodejs/{nodejs-oe-cache-20.17 => 
nodejs-oe-cache-20.18}/oe-npm-cache |   0
  .../nodejs/{nodejs-oe-cache-native_20.17.bb => 
nodejs-oe-cache-native_20.18.bb}           |   0
  meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch 
|  55 ----
  meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch 
|  63 ----
  meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch |   2 +-
  meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb => 
nodejs_20.18.0.bb}                  |   4 +-
  meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch |  
40 +++
  .../perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch 
|  58 ----
  meta-oe/recipes-devtools/perfetto/libperfetto.bb |   2 +-
  .../perfetto/{files => 
libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch |  20 +-
  meta-oe/recipes-devtools/perfetto/perfetto.bb |  30 +-
  meta-oe/recipes-devtools/perfetto/perfetto.inc |  11 +-
  .../perfetto/{files => 
perfetto}/0001-Remove-check_build_deps-build-steps.patch |  18 +-
  meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch 
|  28 ++
  meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb => 
protobuf_4.25.5.bb}              |   4 +-
  meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb => 
python3-psycopg_3.2.2.bb}    |   2 +-
  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb |   2 +-
  .../jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch 
|  51 ++++
  meta-oe/recipes-extended/jansson/jansson_2.14.bb |   1 +
  meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb => 
pegtl_3.2.8.bb}                         |   2 +-
  .../polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch 
|   2 +-
  meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb |  11 +-
  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |   2 +-
  meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb |   1 +
  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb |  26 +-
  meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb 
|   2 +-
  meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb |   3 +-
  meta-oe/recipes-security/audit/audit_4.0.2.bb |   8 +
  .../nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch 
| 165 +++++++++++
  meta-oe/recipes-security/nmap/nmap_7.95.bb |   1 +
  .../softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch 
| 672 +++++++++++++++++++++++++++++++++++++++++++
  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb |   1 +
  meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb => 
bdwgc_8.2.8.bb}                          |   2 +-
  meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb => 
libmanette_0.2.9.bb}           |   2 +-
  meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch 
|  53 ++++
  meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch 
|  44 +++
  .../libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch 
| 101 +++++++
  meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch 
|  26 ++
  meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch 
| 119 ++++++++
  .../libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch 
|  89 ++++++
  meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch 
|  30 ++
  meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch 
|  26 ++
  .../libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch 
| 100 +++++++
  meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch | 160 +++++++++++
  meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch 
|  42 +++
  meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch 
|  52 ++++
  meta-oe/recipes-support/libtar/libtar_1.2.20.bb |  12 +
  meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => 
opencv_4.10.0.bb}                      |   4 +-
  .../syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch 
|  40 ---
  meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb => 
syslog-ng_4.7.0.bb}              |   5 +-
  .../recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch 
|  33 +++
  meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb |   6 +-
  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb |   2 +-
  meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb |   4 +-
  .../python/{python3-elementpath_4.4.0.bb => 
python3-elementpath_4.5.0.bb}                 |   2 +-
  meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb |  20 +-
  .../recipes-devtools/python/{python3-eventlet_0.36.1.bb => 
python3-eventlet_0.37.0.bb}    |   2 +-
  .../recipes-devtools/python/{python3-filelock_3.16.0.bb => 
python3-filelock_3.16.1.bb}    |   2 +-
  .../recipes-devtools/python/{python3-greenlet_3.0.3.bb => 
python3-greenlet_3.1.0.bb}      |   2 +-
  meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb |   2 +
  meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb |   4 +-
  meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb => 
python3-nmap_1.9.1.bb}      |   2 +-
  .../recipes-devtools/python/{python3-paramiko_3.4.1.bb => 
python3-paramiko_3.5.0.bb}      |   2 +-
  meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb |  17 +-
  .../python/{python3-pdm-backend_2.3.3.bb => 
python3-pdm-backend_2.4.1.bb}                 |   2 +-
  meta-python/recipes-devtools/python/{python3-pdm_2.16.1.bb => 
python3-pdm_2.19.1.bb}      |   3 +-
  meta-python/recipes-devtools/python/python3-pint/run-ptest |   2 +-
  meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb => 
python3-pint_0.24.3.bb}    |  17 +-
  .../python/{python3-platformdirs_4.3.1.bb => 
python3-platformdirs_4.3.6.bb}               |   2 +-
  .../python/{python3-pyasn1-modules_0.4.0.bb => 
python3-pyasn1-modules_0.4.1.bb}           |   2 +-
  meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb |   2 +-
  .../recipes-devtools/python/{python3-pymisp_2.4.197.bb => 
python3-pymisp_2.4.198.bb}      |   2 +-
  .../python/{python3-pyproject-api_1.7.1.bb => 
python3-pyproject-api_1.7.2.bb}             |   2 +-
  .../python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch 
|  38 ---
  meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest |   4 +-
  meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb |  19 +-
  .../python/{python3-pyunormalize_15.1.0.bb => 
python3-pyunormalize_16.0.0.bb}             |   4 +-
  .../recipes-devtools/python/{python3-regex_2024.7.24.bb => 
python3-regex_2024.9.11.bb}    |   2 +-
  .../python/{python3-robotframework_7.0.1.bb => 
python3-robotframework_7.1.bb}             |   2 +-
  meta-python/recipes-devtools/python/python3-spidev_3.6.bb |   2 +-
  .../python/{python3-sqlalchemy_2.0.32.bb => 
python3-sqlalchemy_2.0.35.bb}                 |   7 +-
  meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb |   1 +
  meta-python/recipes-devtools/python/python3-typer/run-ptest |   3 +-
  meta-python/recipes-devtools/python/python3-ujson/run-ptest |   2 +-
  meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb |   3 +-
  meta-python/recipes-devtools/python/python3-validators_0.34.0.bb |   4 +
  .../python/{python3-virtualenv_20.26.4.bb => 
python3-virtualenv_20.26.5.bb}               |   2 +-
  .../recipes-devtools/python/{python3-xmlschema_3.3.2.bb => 
python3-xmlschema_3.4.1.bb}    |   2 +-
  meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb => 
python3-yarl_1.11.1.bb}    |   2 +-
  meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb 
|   2 +-
  .../recipes-extended/python-rich/{python3-rich_13.8.0.bb => 
python3-rich_13.8.1.bb}       |   2 +-
  meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb |   2 +-
  meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb => 
xfce4-panel_4.18.5.bb}       |   2 +-
  141 files changed, 2455 insertions(+), 1015 deletions(-)
  rename 
meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_46.0.bb => 
gnome-backgrounds_47.0.bb} (76%)
  rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb => 
gnome-chess_47.0.bb} (92%)
  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb 
=> gnome-desktop_44.1.bb} (92%)
  delete mode 100644 
meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
  rename 
meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_46.0.bb => 
gnome-font-viewer_47.0.bb} (71%)
  rename meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} 
(80%)
  create mode 100644 
meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
  rename 
meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => 
lksctp-tools_1.0.20.bb} (79%)
  create mode 100644 
meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
  rename meta-networking/recipes-support/stunnel/{stunnel_5.72.bb => 
stunnel_5.73.bb} (93%)
  rename meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb => 
tcpslice_1.8.bb} (87%)
  rename meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb 
=> traceroute_2.1.6.bb} (94%)
  delete mode 100644 
meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch 
=> 0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} (70%)
  delete mode 100644 
meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-avoid-search-host-library-path-for-cros.patch 
=> 0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} (98%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{tests-Makefile-install-static-4G-edge-testcases.patch 
=> 0003-tests-Makefile-install-static-4G-edge-testcases.patch} (73%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch 
=> 0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} (90%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-elf_i386-avoid-search-host-library-path.patch 
=> 0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} (94%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-include-stddef.h-for-ptrdiff_t.patch 
=> 0006-include-stddef.h-for-ptrdiff_t.patch} (81%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0002-Mark-glibc-specific-code-so.patch 
=> 0007-Mark-glibc-specific-code-so.patch} (74%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch 
=> 0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} (92%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0004-shm.c-Mark-glibc-specific-changes-so.patch 
=> 0009-shm.c-Mark-glibc-specific-changes-so.patch} (91%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0005-Include-dirent.h-for-ino_t.patch 
=> 0010-Include-dirent.h-for-ino_t.patch} (90%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0006-include-limits.h-for-PATH_MAX.patch 
=> 0011-include-limits.h-for-PATH_MAX.patch} (85%)
  rename 
meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-huge_page_setup_helper-use-python3-interpreter.patch 
=> 0012-huge_page_setup_helper-use-python3-interpreter.patch} (88%)
  create mode 100644 
meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch
  create mode 100644 
meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
  delete mode 100644 
meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
  delete mode 100644 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
  rename 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch 
=> 0004-abseil-ppc-fixes.patch} (69%)
  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb 
=> abseil-cpp_20240722.0.bb} (88%)
  rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb => 
ctags_6.1.20240915.0.bb} (95%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.17 => 
nodejs-oe-cache-20.18}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.17.bb => 
nodejs-oe-cache-native_20.18.bb} (100%)
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
  delete mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb => 
nodejs_20.18.0.bb} (98%)
  create mode 100644 
meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
  delete mode 100644 
meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
  rename meta-oe/recipes-devtools/perfetto/{files => 
libperfetto}/0001-meson-add-pc-file-for-lib_perfetto.patch (69%)
  rename meta-oe/recipes-devtools/perfetto/{files => 
perfetto}/0001-Remove-check_build_deps-build-steps.patch (85%)
  create mode 100644 
meta-oe/recipes-devtools/perfetto/perfetto/0002-traced-fix-missing-include.patch
  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb => 
protobuf_4.25.5.bb} (97%)
  rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb => 
python3-psycopg_3.2.2.bb} (85%)
  create mode 100644 
meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
  rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb => 
pegtl_3.2.8.bb} (93%)
  create mode 100644 
meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
  create mode 100644 
meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch
  rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb => 
bdwgc_8.2.8.bb} (96%)
  rename meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb => 
libmanette_0.2.9.bb} (87%)
  create mode 100644 
meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
  create mode 100644 
meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
  rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => 
opencv_4.10.0.bb} (98%)
  delete mode 100644 
meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
  rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb => 
syslog-ng_4.7.0.bb} (97%)
  create mode 100644 
meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
  rename 
meta-python/recipes-devtools/python/{python3-elementpath_4.4.0.bb => 
python3-elementpath_4.5.0.bb} (85%)
  rename meta-python/recipes-devtools/python/{python3-eventlet_0.36.1.bb 
=> python3-eventlet_0.37.0.bb} (80%)
  rename meta-python/recipes-devtools/python/{python3-filelock_3.16.0.bb 
=> python3-filelock_3.16.1.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.3.bb 
=> python3-greenlet_3.1.0.bb} (81%)
  rename meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb => 
python3-nmap_1.9.1.bb} (82%)
  rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.1.bb 
=> python3-paramiko_3.5.0.bb} (82%)
  rename 
meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.3.bb => 
python3-pdm-backend_2.4.1.bb} (80%)
  rename meta-python/recipes-devtools/python/{python3-pdm_2.16.1.bb => 
python3-pdm_2.19.1.bb} (75%)
  rename meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb => 
python3-pint_0.24.3.bb} (66%)
  rename 
meta-python/recipes-devtools/python/{python3-platformdirs_4.3.1.bb => 
python3-platformdirs_4.3.6.bb} (88%)
  rename 
meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.0.bb => 
python3-pyasn1-modules_0.4.1.bb} (90%)
  rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.197.bb 
=> python3-pymisp_2.4.198.bb} (85%)
  rename 
meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.1.bb => 
python3-pyproject-api_1.7.2.bb} (86%)
  delete mode 100644 
meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
  rename 
meta-python/recipes-devtools/python/{python3-pyunormalize_15.1.0.bb => 
python3-pyunormalize_16.0.0.bb} (58%)
  rename meta-python/recipes-devtools/python/{python3-regex_2024.7.24.bb 
=> python3-regex_2024.9.11.bb} (80%)
  rename 
meta-python/recipes-devtools/python/{python3-robotframework_7.0.1.bb => 
python3-robotframework_7.1.bb} (91%)
  rename 
meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb => 
python3-sqlalchemy_2.0.35.bb} (77%)
  rename 
meta-python/recipes-devtools/python/{python3-virtualenv_20.26.4.bb => 
python3-virtualenv_20.26.5.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.2.bb 
=> python3-xmlschema_3.4.1.bb} (81%)
  rename meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb => 
python3-yarl_1.11.1.bb} (88%)
  rename 
meta-python/recipes-extended/python-rich/{python3-rich_13.8.0.bb => 
python3-rich_13.8.1.bb} (85%)
  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb => 
xfce4-panel_4.18.5.bb} (94%)

