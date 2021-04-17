Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.3556.1618693571617838119
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U/WOiRnK;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id p12so21541542pgj.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wV7vYrKAk8oVjoPjpNbT0AxZgKYGjHL8UYTw98ma+Y=;
        b=U/WOiRnKxXM+e/DQjzIo8pLLgB9gk6BQJlLo5aGv5dFvSq9fls52JjTLM/sqC9aYJ4
         GmNubCBUprZcyfnCPIb18mFqeB6cbHjtV9V4jgowCBSznKVjWyeEoy9RS6ikUGkiINN4
         agTKDHiOIRLQXyfv0g6Sn97iG0dGqZBGBEChCj496MNXyfAsNHz36su6EJ8eBj9zd5HQ
         SkGooTGnKISbWjbia6nJvh6f4w7GrM0ws5U/HgyUqtCHkzg7AwWLHVkZqibOHUxCKCJa
         2k8Gcw5cp7ZnHXSBjDvPge30FMTog3PABBavFJr8U6XE6cXGYJKT75GShvyETxqQVmee
         U3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wV7vYrKAk8oVjoPjpNbT0AxZgKYGjHL8UYTw98ma+Y=;
        b=NfghbN7GwgCQ0LhW4G4PUmtHWK+ef0HErMS8j+mXIauRS1O+XvOqyMye/xKm/c2RjM
         MWsQRWOUuhNBF1ZJarZch/TC9XD5R+0rZaBYczlefDl1JFbECnM+VkHbQnBrxo3SZDKi
         4ACwONUQ6W4c5BbWlKUpd4EZIq0bHcULh6Toyk9FAurbXTa3hq8UnyD6B4u0Ywmf6Wn4
         5znJF8E8JlY4S3L9d8GKKMR9Uw94kcY8pticd+8qwZ3Zmm16ZB3NPFT5XtQpLlu7xYVf
         /1+Mh6pEGy3VRkPpjS/rlT/grKhzR4IBIE39JLsRMXo9jVm/xBv2WCSMJP1cpY1aRv6L
         +viQ==
X-Gm-Message-State: AOAM533P+1ySFriJnpj78J5eMGTKPNidXkl73hUwin6lpSh2bpTcBdIa
	LwiBgHOo7fFfAD2F63iXLuIG+OWDMJ0LHw==
X-Google-Smtp-Source: ABdhPJzamd2+OHMoz/AQbJMNVoXmPGiVBy5Nxs/5y7yQ6VjWyb/92cXI7s61WiDW13d0J8Ip+XYoYw==
X-Received: by 2002:a65:618c:: with SMTP id c12mr1288150pgv.296.1618693570495;
        Sat, 17 Apr 2021 14:06:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:10 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 00/50] Patch review April 17th
Date: Sat, 17 Apr 2021 14:05:09 -0700
Message-Id: <cover.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This technically sync's up to current master.
Please review and have feedback back by Monday.


The following changes since commit 94fe80ce8609d62e51cc190595a9f0c2a4a5a89e:

  xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Andreas Müller (2):
  catfish: add python3-dbus to RDEPENDS
  fluidsynth: upgrade 2.1.7 -> 2.2.0

Hongxu Jia (1):
  debootstrap: 1.0.67 -> 1.0.123

Kamil Dziezyk (1):
  bats: upgrade 1.1.0 -> 1.3.0

Khem Raj (4):
  tbb: Fix build with musl
  core-image-minimal-xfce: Use graphical.target as default
  vnstat: Disable install parallism to fix a potential install race
  open-vm-tools: Fix build with gcc 11

Leon Anavi (23):
  python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
  python3-croniter: Upgrade 1.0.10 -> 1.0.11
  python3-decorator: Upgrade 5.0.5 -> 5.0.6
  python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
  python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
  python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
  python3-robotframework: Upgrade 4.0 -> 4.0.1
  python3-grpcio: Upgrade 1.36.1 -> 1.37.0
  python3-cerberus: Upgrade 1.3.2 -> 1.3.3
  python3-humanize: Upgrade 3.3.0 -> 3.4.0
  python3-monotonic: Upgrade 1.5 -> 1.6
  python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
  python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
  python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
  python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
  python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
  python3-sympy: Upgrade 1.7.1 -> 1.8
  python3-pandas: Upgrade 1.2.3 -> 1.2.4
  python3-humanize: Upgrade 3.4.0 -> 3.4.1
  python3-decorator: Upgrade 5.0.6 -> 5.0.7
  python3-colorlog: Upgrade 4.8.0 -> 5.0.1
  python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
  python3-croniter: Upgrade 1.0.11 -> 1.0.12

Martin Jansa (2):
  opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
  opencv: link sfm module with Glog

Naveen Saini (2):
  tbb: upgrade 2020.3 -> 2021.2.0
  ocl-icd: upgrade 2.2.14 -> 2.3.0

Randy MacLeod (1):
  open-vm-tools: upgrade 11.0.1 -> 11.2.5

Ross Burton (1):
  fwts: upgrade to 21.03.00

Stefan Ghinea (1):
  hostapd: fix CVE-2021-30004

Vinícius Ossanes Aquino (2):
  modemmanager: upgrade 1.14.10 -> 1.16.2
  libqmi: upgrade 1.26.6 -> 1.28.2

Yi Fan Yu (1):
  redis: upgrade 6.0.9 -> 6.2.1

persianpros (5):
  PEP8 double aggressive E701, E70 and E502
  PEP8 double aggressive E20 and E211
  PEP8 double aggressive E22, E224, E241, E242 and E27
  PEP8 double aggressive E301 ~ E306
  PEP8 double aggressive W291 ~ W293 and W391

wangmy (1):
  uftrace: Fix error on aarch64 when binutils update to 2.35.1

zhengruoqin (3):
  python3-absl: upgrade 0.10.0 -> 0.12.0
  python3-astroid: upgrade 2.5.2 -> 2.5.3
  python3-bitarray: upgrade 1.9.1 -> 1.9.2

 contrib/oe-stylize.py                         | 121 ++-
 .../fluidsynth/fluidsynth.inc                 |   4 +-
 ...te_float-Allow-zero-pointer-for-left.patch |  26 +-
 ...-Add-resolv_compat.h-for-musl-builds.patch |  72 ++
 ....-Remove-references-to-deprecated-G_.patch |  94 ---
 ...0001-pollGtk-Drop-volatile-qualifier.patch |  32 -
 ...latile-qualifier-exposed-incorrectly.patch |  29 +
 ...1-utilBacktrace-Ignore-Warray-bounds.patch |  33 -
 .../0002-add-include-sys-sysmacros.h.patch    |  30 -
 ...ux-Consider-64bit-time_t-possibility.patch |  42 +-
 ...-test-for-feature-instead-of-platfor.patch |  24 +-
 .../0009-Rename-poll.h-to-vm_poll.h.patch     | 726 ++----------------
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  25 +-
 ...ools_11.0.1.bb => open-vm-tools_11.2.5.bb} |  14 +-
 .../recipes-support/vnstat/vnstat_2.6.bb      |   2 +
 .../oeqa/selftest/cases/meta_oe_sources.py    |   1 +
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 +++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 .../{libqmi_1.26.6.bb => libqmi_1.28.2.bb}    |   2 +-
 ...ager_1.14.10.bb => modemmanager_1.16.2.bb} |   2 +-
 .../{ocl-icd_git.bb => ocl-icd_2.3.0.bb}      |   3 +-
 ...t-to-override-usr-sbin-and-usr-share.patch |  41 +
 ...upport-to-override-usr-bin-arch-test.patch |  47 ++
 .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
 .../debootstrap/debootstrap_1.0.123.bb        |  23 +
 .../debootstrap/debootstrap_1.0.67.bb         |  35 -
 ...error-on-aarch64-with-binutils2.35.1.patch |  27 +
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |   1 +
 ...06-Define-correct-gregs-for-RISCV32.patch} |  26 +-
 .../recipes-extended/redis/redis/ilp32.patch  |  29 -
 ...ile-to-use-environment-build-setting.patch |  66 +-
 .../redis/redis/oe-use-libc-malloc.patch      |  12 +-
 .../redis/{redis_6.0.9.bb => redis_6.2.1.bb}  |   5 +-
 .../opencv/0001-sfm-link-with-Glog_LIBS.patch |  44 ++
 .../recipes-support/opencv/opencv_4.5.2.bb    |   5 +
 ...akeLists.txt-exclude-riscv64-riscv32.patch |  42 +
 ...1-Disable-use-of-_tpause-instruction.patch |  34 +
 ...nfo-is-glibc-specific-API-mark-it-so.patch |  27 +-
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch |  22 +-
 .../tbb/tbb/cross-compile.patch               |  35 -
 .../tbb/tbb/improve-reproducibility.patch     |  30 -
 meta-oe/recipes-support/tbb/tbb/tbb.pc        |  11 -
 .../tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb}    |  53 +-
 .../bats/{bats_1.1.0.bb => bats_1.3.0.bb}     |  10 +-
 ...d-correct-printf-qualifier-for-off_t.patch |  20 +-
 ....h-instead-of-deprecated-sys-poll.h.patch} |  12 +-
 ...ch => 0003-Remove-Werror-from-build.patch} |  18 +-
 ...__SWORD_TYPE-if-not-defined-by-libc.patch} |  12 +-
 ...ZE.patch => 0005-Undefine-PAGE_SIZE.patch} |  10 +-
 ...t-to-fix-pointer-to-int-cast-issues.patch} |  37 +-
 .../{fwts_20.07.00.bb => fwts_21.03.00.bb}    |  18 +-
 ...-absl_0.10.0.bb => python3-absl_0.12.0.bb} |   4 +-
 ...roid_2.5.2.bb => python3-astroid_2.5.3.bb} |   2 +-
 ...n3-backports-functools-lru-cache_1.6.4.bb} |   2 +-
 ...ray_1.9.1.bb => python3-bitarray_1.9.2.bb} |   2 +-
 ...rus_1.3.2.bb => python3-cerberus_1.3.3.bb} |  14 +-
 ...log_4.8.0.bb => python3-colorlog_5.0.1.bb} |   4 +-
 ...r_1.0.10.bb => python3-croniter_1.0.12.bb} |   2 +-
 ...or_5.0.5.bb => python3-decorator_5.0.7.bb} |   2 +-
 ...python3-google-api-python-client_2.2.0.bb} |   2 +-
 ...36.1.bb => python3-grpcio-tools_1.37.0.bb} |   2 +-
 .../python/python3-grpcio/boring_ssl.patch    |  50 +-
 ...cio_1.36.1.bb => python3-grpcio_1.37.0.bb} |   2 +-
 ...ize_3.3.0.bb => python3-humanize_3.4.1.bb} |   3 +-
 ...otonic_1.5.bb => python3-monotonic_1.6.bb} |  10 +-
 ...andas_1.2.3.bb => python3-pandas_1.2.4.bb} |   2 +-
 ...2_0.5.17.bb => python3-pyroute2_0.5.18.bb} |   2 +-
 ...115.bb => python3-python-vlc_3.0.12117.bb} |   3 +-
 ...4.0.bb => python3-robotframework_4.0.1.bb} |   2 +-
 ....17.2.bb => python3-ruamel-yaml_0.17.4.bb} |   2 +-
 ....1.2.bb => python3-speedtest-cli_2.1.3.bb} |   3 +-
 ...y_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} |   2 +-
 ...n3-sympy_1.7.1.bb => python3-sympy_1.8.bb} |   4 +-
 ...st_1.4.2.bb => python3-typed-ast_1.4.3.bb} |   2 +-
 ...ma_1.6.0.bb => python3-xmlschema_1.6.1.bb} |   2 +-
 .../recipes-apps/catfish/catfish_4.16.0.bb    |   2 +-
 .../images/core-image-minimal-xfce.bb         |   2 +
 77 files changed, 969 insertions(+), 1318 deletions(-)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_11.0.1.bb => open-vm-tools_11.2.5.bb} (91%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.6.bb => libqmi_1.28.2.bb} (90%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.10.bb => modemmanager_1.16.2.bb} (95%)
 rename meta-oe/recipes-core/opencl/{ocl-icd_git.bb => ocl-icd_2.3.0.bb} (84%)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
 rename meta-oe/recipes-extended/redis/redis/{riscv32.patch => 0006-Define-correct-gregs-for-RISCV32.patch} (61%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/ilp32.patch
 rename meta-oe/recipes-extended/redis/{redis_6.0.9.bb => redis_6.2.1.bb} (93%)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
 rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb} (59%)
 rename meta-oe/recipes-test/bats/{bats_1.1.0.bb => bats_1.3.0.bb} (75%)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch => 0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch} (81%)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Remove-Werror-from-build.patch => 0003-Remove-Werror-from-build.patch} (74%)
 rename meta-oe/recipes-test/fwts/fwts/{0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch => 0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch} (79%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-Undefine-PAGE_SIZE.patch => 0005-Undefine-PAGE_SIZE.patch} (83%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch => 0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch} (64%)
 rename meta-oe/recipes-test/fwts/{fwts_20.07.00.bb => fwts_21.03.00.bb} (65%)
 rename meta-python/recipes-devtools/python/{python3-absl_0.10.0.bb => python3-absl_0.12.0.bb} (67%)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.2.bb => python3-astroid_2.5.3.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-backports-functools-lru-cache_1.6.3.bb => python3-backports-functools-lru-cache_1.6.4.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.1.bb => python3-bitarray_1.9.2.bb} (77%)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.2.bb => python3-cerberus_1.3.3.bb} (66%)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.8.0.bb => python3-colorlog_5.0.1.bb} (54%)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.10.bb => python3-croniter_1.0.12.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.5.bb => python3-decorator_5.0.7.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.1.0.bb => python3-google-api-python-client_2.2.0.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.36.1.bb => python3-grpcio-tools_1.37.0.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.36.1.bb => python3-grpcio_1.37.0.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.3.0.bb => python3-humanize_3.4.1.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-monotonic_1.5.bb => python3-monotonic_1.6.bb} (63%)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.3.bb => python3-pandas_1.2.4.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.17.bb => python3-pyroute2_0.5.18.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.11115.bb => python3-python-vlc_3.0.12117.bb} (65%)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.bb => python3-robotframework_4.0.1.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.2.bb => python3-ruamel-yaml_0.17.4.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-speedtest-cli_2.1.2.bb => python3-speedtest-cli_2.1.3.bb} (67%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.7.1.bb => python3-sympy_1.8.bb} (68%)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.2.bb => python3-typed-ast_1.4.3.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.0.bb => python3-xmlschema_1.6.1.bb} (83%)

-- 
2.17.1

