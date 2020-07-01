Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.10724.1593562043814336139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/Pu8LcR;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id y18so9162921plr.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbPHq44KfmC/jbTE8CuUIhrtbIp5nK9KvpfiSQXjbK4=;
        b=A/Pu8LcRrFVtJp32AakIb4XyRjATr//haCHAHxVqCQ3M/rEuDf41eUwH2j2ivF6U6u
         WDCudC0dCgNoLcZAuobsZmnEhL3NCm4JEpNbuKUH+Ol1UoNG9GaJ/tsR5yxA41rW3Vv/
         8soRzEu4T3VnFVcoF3f5mnulllWgyY3zf1NHZ4n1GkE43lrvyUQbG/GuAkapR7X1FuUc
         engFxmsN2ghuie0eOaeQjcDvFFC3ChaKKZTNyrkR6mkNH766FYadOEkYNjmk4eAoPQoJ
         KDsQ8hfMiCHbM4u5Yh9P92km4n6YPcNyRSLpEBiK45mGdhHOO3qGOhLOmk0KbjVhGXEo
         3ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbPHq44KfmC/jbTE8CuUIhrtbIp5nK9KvpfiSQXjbK4=;
        b=KuUQRG2JvaQgQFgbft72o0jW7Yv4PxCnHoOZcajtokdbpQfwg94y642ksJVR3BW88b
         gItcZ+QRJlbvnrAwYDu6Bpnjv2ijeCHt1OEOiWoKmQm1JviVuTZUF26nnhRT3Sh8zt6+
         a48tmVARfhUs3UVmT+PQ6TZ8ztqbkJ8Ucjxx7UN7sUVqenmXE5llo4jRLpfFoqdvVUQt
         T+3ybCL/gtZ2ZFQrz+LMHzDBrY77DlNDqMhQulYIHCV3RJykGYIGjO6TdXogv5KuWhYz
         mobuizaZd2Jce2VEcRx8Ut6ALR6lLL/FwNUsz98g23gdWrlDL18K6K2SASR9CF+1hFeh
         B7gg==
X-Gm-Message-State: AOAM531HDsfu3c+IDThxAUXGctXwQ3UdhwPZcKmta8efOh2YX0w7aKPy
	25g4ApHwPGYqvdjloEZh/rc0wnZoigA=
X-Google-Smtp-Source: ABdhPJyC3PShxbM70G7nU7pNe8esmZoFJQt6KEvFefBIrO/PZgA7mxudq2W9iqjuOKlXNyYikpYfzw==
X-Received: by 2002:a17:90a:a68:: with SMTP id o95mr10804076pjo.64.1593562042700;
        Tue, 30 Jun 2020 17:07:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 00/32] Patch review
Date: Tue, 30 Jun 2020 17:06:45 -0700
Message-Id: <cover.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please provide feedback by Friday

The following changes since commit 8a72d29e0876830ffd96b85d7d0308302eb07a5d:

  python3-docutils: Remove, moved to OE-core (2020-06-12 09:32:24 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  zstd: Upgrade 1.4.4 -> 1.4.5

Andreas Müller (4):
  libblockdev: upgrade 2.23 -> 2.24
  vlc: Fix build with qt5 in PACKAGECONFIG and Qt >= 5.15 / renumber
    patches
  openh264: upgrade 2.1.0 -> 2.1.1
  tcpreplay: upgrade 4.3.2 -> 4.3.3

Armin Kuster (1):
  ntp: update 4.2.8p15

Changqing Li (2):
  python-django: add RDEPENDS
  python-m2crypto: Add RDEPENDS

Christian Eggers (1):
  linuxptp: Fix segmentation fault on 32 bit platforms with 64 bit
    time_t

Khem Raj (1):
  multipath-tools: Fix build with json-c 0.14 and newer

Konrad Weihmann (3):
  netkit-rsh: properly append PACKAGECONFIG
  zile: properly append PACKAGECONFIG
  libtalloc: fix upstream url

Leon Anavi (1):
  python3-sqlalchemy: Upgrade 1.3.12 -> 1.3.17

Mingli Yu (1):
  python3-m2crypto: add the missing rdepends

Paul Eggleton (1):
  protobuf-c: disable parallelism to avoid race condition

Pierre-Jean Texier (9):
  zchunk: upgrade 1.1.5 -> 1.1.6
  uriparser: upgrade 0.9.3 -> 0.9.4
  jsoncpp: upgrade 1.9.2 -> 1.9.3
  jpnevulator: upgrade 2.3.4 -> 2.3.5
  libnftnl: upgrade 1.1.6 -> 1.1.7
  nftables: upgrade 0.9.4 -> 0.9.5
  haveged: upgrade 1.9.8 -> 1.9.9
  rsnapshot: upgrade 1.4.2 -> 1.4.3
  fuse3: upgrade 3.9.1 -> 3.9.2

Qi.Chen@windriver.com (1):
  python-django: set CVE_PRODUCT to be django

Wang Mingyu (3):
  postgresql: 12.2 -> 12.3
  openipmi: upgrade 2.0.28 -> 2.0.29
  twm: upgrade 1.0.10 -> 1.0.11

Zang Ruochen (3):
  proj: upgrade 7.0.0 -> 7.0.1
  libvpx: upgrade 1.8.1 -> 1.8.2
  mm-common: upgrade 1.0..0 -> 1.0.1

 .../fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb}   |   3 +-
 .../{openh264_2.1.0.bb => openh264_2.1.1.bb}  |   4 +-
 ...ch => 0001-make-opencv-configurable.patch} |   0
 ...isidec.patch => 0002-use-vorbisidec.patch} |   0
 ...int.patch => 0003-fix-luaL-checkint.patch} |   0
 ...ackageconfig-to-detect-mmal-support.patch} |   0
 .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch |  56 ++++++++
 .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |   9 +-
 .../{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb}  |   2 +-
 .../{nftables_0.9.4.bb => nftables_0.9.5.bb}  |   3 +-
 .../netkit-rsh/netkit-rsh_0.17.bb             |   2 +-
 .../libtalloc/libtalloc_2.3.0.bb              |   2 +-
 .../ntp/{ntp_4.2.8p14.bb => ntp_4.2.8p15.bb}  |   3 +-
 ...{openipmi_2.0.28.bb => openipmi_2.0.29.bb} |   4 +-
 ...{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb} |   4 +-
 .../linuxptp/time_t_maybe_long_long.patch     | 135 ++++++++++++++++++
 .../linuxptp/linuxptp_2.0.bb                  |   1 +
 ...{mm-common_1.0.0.bb => mm-common_1.0.1.bb} |   4 +-
 ...Use-pkg-config-for-libxml2-detection.patch |  50 -------
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   1 -
 ...{postgresql_12.2.bb => postgresql_12.3.bb} |   4 +-
 .../{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb}    |   2 +-
 .../protobuf/protobuf-c_1.3.3.bb              |   5 +
 .../{haveged_1.9.8.bb => haveged_1.9.9.bb}    |   4 +-
 .../jpnevulator/jpnevulator_git.bb            |   4 +-
 ...ibblockdev_2.23.bb => libblockdev_2.24.bb} |   7 +-
 .../0001-Fix-legacy-build-after-2103.patch    |  27 ++++
 .../zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb}     |   6 +-
 .../xorg-app/{twm_1.0.10.bb => twm_1.0.11.bb} |   5 +-
 .../webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb} |   2 +-
 .../proj/{proj_7.0.0.bb => proj_7.0.1.bb}     |   4 +-
 ...1-fix-boolean-value-with-json-c-0.14.patch |  42 ++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 .../rsnapshot/rsnapshot_git.bb                |   4 +-
 ...{uriparser_0.9.3.bb => uriparser_0.9.4.bb} |   5 +-
 .../zchunk/0001-zck.h-fix-build-on-musl.patch |  39 -----
 .../0002-unzck-fix-build-with-musl-libc.patch |  61 --------
 .../{zchunk_1.1.5.bb => zchunk_1.1.6.bb}      |   8 +-
 meta-oe/recipes-support/zile/zile_2.4.14.bb   |   2 +-
 .../recipes-devtools/python/python-django.inc |   3 +
 .../python/python-m2crypto.inc                |  12 +-
 ...1.3.12.bb => python3-sqlalchemy_1.3.17.bb} |   6 +-
 42 files changed, 330 insertions(+), 206 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb} (91%)
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.1.0.bb => openh264_2.1.1.bb} (94%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-configurable.patch => 0001-make-opencv-configurable.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisidec.patch => 0002-use-vorbisidec.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-checkint.patch => 0003-fix-luaL-checkint.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packageconfig-to-detect-mmal-support.patch => 0004-Use-packageconfig-to-detect-mmal-support.patch} (100%)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb} (88%)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.4.bb => nftables_0.9.5.bb} (90%)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p14.bb => ntp_4.2.8p15.bb} (98%)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.28.bb => openipmi_2.0.29.bb} (96%)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb} (75%)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_long.patch
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.0.bb => mm-common_1.0.1.bb} (66%)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.2.bb => postgresql_12.3.bb} (63%)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb} (93%)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.8.bb => haveged_1.9.9.bb} (96%)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.23.bb => libblockdev_2.24.bb} (94%)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb} (85%)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.10.bb => twm_1.0.11.bb} (67%)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb} (96%)
 rename meta-oe/recipes-navigation/proj/{proj_7.0.0.bb => proj_7.0.1.bb} (75%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.3.bb => uriparser_0.9.4.bb} (64%)
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb} (66%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} (67%)

-- 
2.17.1

