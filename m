Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E8ECAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 07:19:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.13405.1758007145019692566
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 00:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abJUOJ4E;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f2b27a751so2322699a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758007143; x=1758611943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFY1oSLmHHQiQrxI8RO6TnJksMN9I2db5slzBE/pQPA=;
        b=abJUOJ4ED9JFA7pAxBz50iSXWPGejlqLifxqoopD/xoLR6XBW6f+0id26wXwbRMxNC
         M4YI3GBXbpmu+p8gvwRq81CfGPIdDFURyfm7ElcUpFIHrbnGKS6U6BUK8lGIJTAaWer6
         ZJ2yaN5zw4eADQVIoPlPxp3Pv09jn1FFDnlT3A4DSpFy0y9hNSeja/YlxJ7f9fC6qcXe
         qrWaXHOnNw1LEQ1zEd878MVoDhIItZaIUrn/9+v4wHLg6Y+awJnuie/k4lAzJ2NgAz5g
         Ina9Ashf8Sy6QbOwS0GsyF3EX6C1zBo42j7UJbqG2oX/IVttAOEaOMR75/7psRRKJ+RI
         98Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758007143; x=1758611943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFY1oSLmHHQiQrxI8RO6TnJksMN9I2db5slzBE/pQPA=;
        b=FK36lLJz2WyHpAFX1HvCvT1V1VgHFoh/12zOzZV5Lh1j2UEsmApCBRzelnAZUOt8uj
         TObJxOL3kg9ksiv7P/kJlzKetdJKO4bRZClufZ8ZN4zplLHNGdyYeJ9Sx0IEbhzHczUh
         RkEnmVN2JmJUc1ldR31z9+7lU7bDmebui/LUW71Fq2keln0P8Vu/EypgNQGjXYLEnW9b
         Xn8QPUYMgjxEoxesrzwEJL/ELRrmaQz0C+cKtoFawoPQiIkVQVcsDfp7P6kL34c2ckF5
         abWUElAwVq1/EgpjoOKEWI3z0C3d72Emwb2G8OR0KhV29arSbTXDQDtUQ9QNYAklQg4X
         YJxA==
X-Gm-Message-State: AOJu0YxJZ/iTb4RW61FUGT6Cg8aUyRUse4LoqDIS9M5ywZbNBvr6re63
	JRbQ+sHfpvVBqeArjKjIbaux8fRRt9RGwTe2UztGGr6ki45mmy1w4KSKxAMwTg==
X-Gm-Gg: ASbGnctSiqgCDeIIXhtcUGDQpLB0R/1wMR5oqjE5wxQ0maI76NKHFXQCbPnl42X0hdv
	fxwXKrIWRT7lLy+JCO6i3hurqWNv+iehyCDMwPw+rVaHo8xV3hS4PNskOShCTJm9boQ09xNTxmU
	PmuqrUakWxSJRMriW+bgx9H5HhTcwXd2V8aMCayJenpQNX9MMlubbj2iToj0Rfw4XW2E9XODknq
	l6gWd3wBOj5ofFoNIhaXijqTwAr5AcsD0XSx68brkjnabTepfe1ZtbANgUfCHch3muXioJffMFb
	prHlC9GhlxiC+nTvIcji7IQvHlLox1Xs05RDW9s5l5HNNdD3/Zim/7wW01fh8rAA8AA9336+l9H
	15b5SJkdVmZvE5d/y+v7C
X-Google-Smtp-Source: AGHT+IE6NJHIgHFlnmtf7kxT+codzuNsL/pM3TtwRM2YuYPlyJjQVjr1rLIlf0Fh1F/+y7jrH/U0bw==
X-Received: by 2002:a17:907:989:b0:b04:6e94:f317 with SMTP id a640c23a62f3a-b07c35fb4c3mr1239219666b.34.1758007142996;
        Tue, 16 Sep 2025 00:19:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c28f190fsm915139766b.39.2025.09.16.00.19.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:19:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Walnascar pull request Sep 16th
Date: Tue, 16 Sep 2025 09:19:00 +0200
Message-ID: <20250916071900.2264263-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119419

Please find below a summary of updates for the Walnascar branch.
The changes were tested with a full world build on x86, x86-64, arm and aarch platforms.

The following changes since commit dca497d728792e3cb655c78455c2d649af312ce8:

  ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg (2025-07-27 14:35:10 -0400)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/walnascar-nut

for you to fetch changes up to 80ab58cc404959ae2f0e8b2e68935b3bfd8e8cfe:

  readme: update maintainer (2025-09-16 08:37:07 +0200)

----------------------------------------------------------------
Bo Sun (1):
      thin-provisioning-tools: fix bindgen build error with clang on octeontx2

Changqing Li (2):
      libwnck3: fix build failure for lib32-libwnck3
      libwnck: fix build failure for lib32-libwnck

Chen Qi (3):
      protobuf: upgrade from 5.29.4 to 5.29.5
      python3-protobuf: upgrade from 5.29.4 to 5.29.5
      libnwck/libnwck3: use time_t to avoid build failure

Gijs Peskens (1):
      php: fix removal of --with-zlib-dir configure option

Gyorgy Sarvari (6):
      metacity: fix compilation on 32-bit systems
      pgpool2: fix compiling for 32-bit arches
      libgdata: fix compiling for 32-bit targets
      libchamplain: don't compile for 32-bit targets
      ledmon: fix building on 32-bit x86
      readme: update maintainer

Hitendra Prajapati (1):
      openjpeg: fix for CVE-2025-54874

Jason Schonberg (6):
      php: upgrade 8.4.6 -> 8.4.8
      php: upgrade 8.4.8 -> 8.4.10
      c-ares: backport a patch for a memory leak
      pgpool2: upgrade 4.5.1 -> 4.5.2
      pgpool2: upgrade 4.5.2 -> 4.5.3
      pgpool2: upgrade 4.5.3 -> 4.5.4

Jef Driesen (1):
      lcov: Add missing RDEPENDS for nativesdk

Jeroen Hofstee (1):
      php: sort PACKAGECONFIG options

Jiaying Song (7):
      v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
      debootstrap: correct the SRC_URI
      logcheck: correct the SRC_URI
      passwdqc: correct the SRC_URI
      libconfig: switch source to GitHub repository
      yaffs2-utils: correct the SRC_URI
      softhsm: switch source to GitHub repository

Jinfeng Wang (1):
      iperf3: Fix CVE-2025-54349

Khem Raj (2):
      jq: Add tzdata to ptest rdeps
      gtkwave: Add libtirpc to depends

Koen Kooi (1):
      libwnck: update to 43.2 and fix build errors

Marc Ferland (2):
      freerdp3: add bindir to SYSROOT_DIRS
      libvncserver: fix generated LibVNCServerTargets.cmake

Martin Jansa (1):
      libiodbc: use gnu17 and ignore incompatible-pointer-types to allow building with gcc-15

Peter Marko (7):
      corosync: fix upstream version check
      corosync: upgrade 3.1.6 -> 3.1.9
      corosync: patch CVE-2025-30472
      libbpf: patch CVE-2025-29481
      fontforge: patch CVE-2024-25081 and CVE-2024-25082
      fcgi: patch CVE-2025-23016
      nginx: patch CVE-2025-53859

Richard Leitner (1):
      python3-moteus: upgrade 0.3.88 -> 0.3.89

Robert Yang (1):
      CVE-2025-53643.patch: Add CVE ID

Wang Mingyu (3):
      apache2: upgrade 2.4.63 -> 2.4.64
      libssh: upgrade 0.11.1 -> 0.11.2
      jq: upgrade 1.8.0 -> 1.8.1

Yi Zhao (1):
      valkey: upgrade 8.1.1 -> 8.1.3

Yoann Congal (3):
      python3-evdev: upgrade 1.9.1 -> 1.9.2
      python3-evdev: add missing uinput header
      python3-evdev: add ptest

Yogita Urade (2):
      poppler: upgrade 25.06.0 -> 25.08.0
      postgresql: upgrade 17.5 -> 17.6

Zhang Peng (1):
      wxwidgets: fix CVE-2024-58249

 README.md                                          |    2 +-
 meta-filesystems/README.md                         |    2 +-
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb |    2 +-
 meta-gnome/README.md                               |    2 +-
 .../libchamplain/libchamplain_0.12.21.bb           |   11 +
 .../0001-Drop-usage-of-deprecated-GTimeVal.patch   | 1134 ++++++++++++++++++++
 .../recipes-gnome/libgdata/libgdata_0.18.1.bb      |    2 +
 ...ssue-caused-by-OE-core-changes-to-startup.patch |   50 +
 ...t.c-fix-Wincompatible-pointer-types-error.patch |   42 +
 .../ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch |   40 +
 .../libwnck/{libwnck3_43.0.bb => libwnck3_43.2.bb} |    4 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |    2 +
 ..._sn_startup_sequence_get_last_active_time.patch |  188 ++++
 .../recipes-gnome/metacity/metacity_3.52.0.bb      |    3 +-
 meta-initramfs/README.md                           |    2 +-
 meta-multimedia/README.md                          |    2 +-
 meta-networking/README.md                          |    2 +-
 .../corosync/corosync/CVE-2025-30472.patch         |   69 ++
 .../{corosync_3.1.6.bb => corosync_3.1.9.bb}       |   17 +-
 .../0001-fix-compiling-on-32-bit-systems.patch     |   83 ++
 ...d-math.h-to-ensure-isnan-and-isinf-are-de.patch |   40 +
 .../pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.4.bb} |    6 +-
 .../thin-provisioning-tools_1.1.0.bb               |    5 +-
 .../iperf3/iperf3/CVE-2025-54349.patch             |   98 ++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb    |    1 +
 .../ledmon/ledmon/Correct-get_uint64.patch         |   44 +
 meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb          |    3 +-
 ...ure.ac-bypass-autoconf-2.69-version-check.patch |    6 +-
 .../{postgresql_17.5.bb => postgresql_17.6.bb}     |    4 +-
 .../debootstrap/debootstrap_1.0.140.bb             |    2 +-
 .../jq/{jq_1.8.0.bb => jq_1.8.1.bb}                |    8 +-
 .../php/{php_8.4.6.bb => php_8.4.10.bb}            |   26 +-
 .../{protobuf_5.29.4.bb => protobuf_5.29.5.bb}     |    2 +-
 .../recipes-extended/libconfig/libconfig_1.7.3.bb  |    6 +-
 .../valkey/valkey/init-valkey-server               |    0
 .../valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb}    |    4 +-
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch       |  178 +++
 .../recipes-extended/wxwidgets/wxwidgets_3.2.6.bb  |    1 +
 .../fontforge/CVE-2024-25081_CVE-2024-25082.patch  |  181 ++++
 .../fontforge/fontforge_20230101.bb                |    1 +
 .../recipes-graphics/gtkwave/gtkwave_3.3.121.bb    |    1 +
 .../libvncserver/libvncserver_0.9.14.bb            |    4 +-
 .../openjpeg/openjpeg/CVE-2025-54874.patch         |   44 +
 .../recipes-graphics/openjpeg/openjpeg_2.5.3.bb    |    1 +
 .../libbpf/files/CVE-2025-29481.patch              |  102 ++
 meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb      |    1 +
 ...3-meson.build-fix-arm-_TIME_BITS-64-error.patch |   38 +
 .../v4l2apps/v4l-utils_1.28.1.bb                   |    5 +-
 .../recipes-security/passwdqc/passwdqc_2.0.3.bb    |    2 +-
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb  |    5 +-
 .../c-ares/c-ares/0001-ares_uri-memory-leak.patch  |   21 +
 meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb    |    1 +
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb  |    1 +
 meta-oe/recipes-support/lcov/lcov_1.16.bb          |    6 +
 .../recipes-support/libiodbc/libiodbc_3.52.16.bb   |    6 +
 .../libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb}  |    4 +-
 .../{poppler_25.06.0.bb => poppler_25.08.0.bb}     |    2 +-
 meta-perl/README.md                                |    2 +-
 .../recipes-extended/logcheck/logcheck_1.4.3.bb    |    2 +-
 meta-python/README.md                              |    2 +-
 .../include/ptest-packagelists-meta-python.inc     |    1 +
 .../python/python3-aiohttp/CVE-2025-53643.patch    |    2 +
 ...roducibility-option-for-building-ecodes.c.patch |  116 --
 ...thon3-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} |    9 +-
 ...3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb} |    2 +-
 ...otobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} |    2 +-
 meta-webserver/README.md                           |    2 +-
 .../{apache2_2.4.63.bb => apache2_2.4.64.bb}       |    2 +-
 .../recipes-httpd/nginx/files/CVE-2025-53859.patch |  131 +++
 meta-webserver/recipes-httpd/nginx/nginx.inc       |    1 +
 .../recipes-support/fcgi/fcgi/CVE-2025-23016.patch |   40 +
 meta-webserver/recipes-support/fcgi/fcgi_git.bb    |    1 +
 meta-xfce/README.md                                |    2 +-
 73 files changed, 2643 insertions(+), 193 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata/0001-Drop-usage-of-deprecated-GTimeVal.patch
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.0.bb => libwnck3_43.2.bb} (75%)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/screen_avoid_sn_startup_sequence_get_last_active_time.patch
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb} (84%)
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.4.bb} (85%)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.5.bb => postgresql_17.6.bb} (76%)
 rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} (88%)
 rename meta-oe/recipes-devtools/php/{php_8.4.6.bb => php_8.4.10.bb} (98%)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)
 mode change 100755 => 100644 meta-oe/recipes-extended/valkey/valkey/init-valkey-server
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb} (96%)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
 create mode 100644 meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.11.1.bb => libssh_0.11.2.bb} (94%)
 rename meta-oe/recipes-support/poppler/{poppler_25.06.0.bb => poppler_25.08.0.bb} (96%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} (62%)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} (95%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb => apache2_2.4.64.bb} (99%)
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch

