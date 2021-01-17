Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.21348.1610905000818901035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cccMZwx5;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c12so8800758pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=OVIB09s/expR4WmAeipYuS+jexyRmlG30ZHRTSDbbUw=;
        b=cccMZwx5XXhJqNSsC8/VN6SHiv70ox//zuNj+hS/UB9V+uED01+4I1oRp2JPvCCTyy
         jhjJVswq0EjmczWWxDOrdHD1eVEkAMzoKnDnockvLAVUdS4JyHEFjMrz2WJJLUwZmCha
         JnQHX7XCGPwOsDy12MGVSiSaLqaZ69DaVzE4+vlyV7+n80TITkhynwP1dz7MpwemLs60
         +JU7VPjXFOuc0SSh6BSX7lOI38Ee2uzG1ctIZ2YbipG0gkw5oLu7aAVdhCMx6qpdtM/4
         9UrQKgKw+Mbg9i4UhRqQP3fzOM5iHRkLICSgwDxr6m/DPdcP2cKyqkP/KA8d1gRopql7
         OadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=OVIB09s/expR4WmAeipYuS+jexyRmlG30ZHRTSDbbUw=;
        b=mMI7iY2JKQU55PE0GM1xC5CNz+JaErqjhd5OMwo624kNgSZtsp801L4icxm9RlCboE
         PA6KdMeNbGmwHj51m9sWulYR2Jxl//7oQkRkW1WjoPy6UHSERs5Jimt2oaUWATfmb52p
         r8JuhpRHnLKQ+TiTcjYmVxGamViZhdaSt3Dnusc8UNcCqpAi41qUfvSnoim5zFv003AJ
         g/hb7YI5uiDtxwJBGx9c5ke7SQKMIaN/4uSePeIs0pzhIjrHHjUW60oYDOycqhR/jgY5
         3kDKK3t2n6ZPd2NK8q4Oj0d93Gu2XQ9Mm8RlB9whSsQs/VC2bAvoMhJw/yoW6xL5uony
         ft7A==
X-Gm-Message-State: AOAM53114Aj2yNF7C+kbZtk1jvWWOtyzqR2IPOewzwlllSrkaeEq3baq
	CXQtYPFK0FcaJ6RXPy+/1tX/MThffYHCew==
X-Google-Smtp-Source: ABdhPJy3/AlrtB7sGv5EMYbyPyejHYJu31e6mCsglTJ2H2cJSIVoAF1PoGzukaiwPZeWxiVHBhCBbw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr22729545pgp.68.1610904999919;
        Sun, 17 Jan 2021 09:36:39 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:39 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 00/31] Patch Review
Date: Sun, 17 Jan 2021 09:36:05 -0800
Message-Id: <cover.1610904792.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please review and have comments back by Tuesday.
Some of this are in master-next and will be merge once in master.

The following changes since commit dba54c19f806b0cc9fed3f8557654a83b0c3a76c:

  Revert "gnome-calendar: update to 3.38.1, add libhandy 1.x support" (2020-12-20 08:49:12 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Armin Kuster (1):
  wireshark: Several securtiy fixes

Chen Qi (1):
  tclap: fix branch

Chencheng Zhang (1):
  tclap: align version to tag v1.2.2

Diego Santa Cruz (2):
  gssdp: Upgrade to 1.2.2 -> 1.2.3
  gupnp: Upgrade to 1.2.2 -> 1.2.4

He Zhe (1):
  lmbench: Fix setting LDLIBS failure

Joe Slater (1):
  multipath-tools: fix error handling for
    udev_monitor_set_receive_buffer_size

Kai Kang (1):
  colord: fix installed-vs-shipped error

Khem Raj (4):
  pidgin-sipe: Do not add native libdir to pkgconfig search path
  sdbus-c++-libsystemd: Fix reallocarray check in meson
  networkmanager: Fix reallocarray check in meson and configure
  postgresql: Use /dev/urandom when openssl is not used

Martin Jansa (1):
  nanopb: move to dynamic-layers

Mikko Rapeli (1):
  fuse: set CVE_PRODUCT to "fuse_project:fuse"

Philip Balister (1):
  spdlog: Fix recipe so other recipes can use spdlog with external fmt.

Roland Hieber (4):
  lockfile-progs: use DEBIAN_MIRROR in SRC_URI
  liboop: use upstream SRC_URI
  fbset: use DEBIAN_MIRROR in SRC_URI
  openct: use upstream SRC_URI

Sean Nyekjaer (1):
  nodejs: 12.19.1 -> 12.20.1

Stacy Gaikovaia (1):
  nodejs: 12.19.0 -> 12.19.1

Vyacheslav Yurkov (1):
  python3-aiohttp: added missing RDEPENDs

Wang Mingyu (1):
  zabbix: CVE-2020-15803 Security Advisory

Yi Zhao (1):
  ebtables: do not install /etc/ethertypes

Zang Ruochen (1):
  mcpp: Normalize the patch format of CVE

Zheng Ruoqin (4):
  samba: CVE-2020-14318 Security Advisory
  samba: CVE-2020-14383 Security Advisory
  php: CVE-2020-7070
  php: CVE-2020-7069

jabdoa2 (2):
  libsdl2-mixer: Fix ogg/vorbis support in libsdl2-mixer
  libsdl2-mixer: set --disable-music-ogg-shared to link statically

 .../recipes-support/fuse/fuse3_3.9.3.bb       |   2 +
 .../recipes-support/fuse/fuse_2.9.9.bb        |   2 +
 .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}  |   4 +-
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}  |   4 +-
 .../fix_reallocarray_check.patch              |  27 +++
 .../networkmanager/networkmanager_1.22.14.bb  |   1 +
 .../samba/samba/CVE-2020-14318.patch          | 142 ++++++++++++++++
 .../samba/samba/CVE-2020-14383.patch          | 112 +++++++++++++
 .../samba/samba_4.10.18.bb                    |   2 +
 ...kefile-do-not-install-etc-ethertypes.patch |  35 ++++
 .../ebtables/ebtables_2.0.10-4.bb             |   3 +-
 ...wireshark_3.2.7.bb => wireshark_3.2.10.bb} |   2 +-
 .../recipes-devtools/nanopb/nanopb_0.4.3.bb   |   0
 ...AGS-LDFLAGS-to-append-values-passed-.patch |   2 +-
 .../zabbix/zabbix/CVE-2020-15803.patch        |  36 ++++
 .../zabbix/zabbix_4.4.6.bb                    |   1 +
 .../0001-meson-Fix-reallocarray-check.patch   |  25 +++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |   1 +
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   2 +-
 .../mcpp/files/CVE-2019-14274.patch           |  34 ++++
 .../mcpp/files/ice-mcpp.patch                 |  31 ----
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |   3 +-
 .../{nodejs_12.19.0.bb => nodejs_12.20.1.bb}  |   4 +-
 .../php/php/CVE-2020-7069.patch               | 158 ++++++++++++++++++
 .../php/php/CVE-2020-7070.patch               |  24 +++
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |   2 +
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb |   4 +-
 .../lockfile-progs/lockfile-progs_0.1.18.bb   |   2 +-
 .../libsdl/libsdl2-mixer_2.0.4.bb             |   2 +-
 meta-oe/recipes-support/colord/colord.bb      |   2 +-
 meta-oe/recipes-support/fbset/fbset_2.1.bb    |   2 +-
 .../recipes-support/liboop/liboop_1.0.1.bb    |   2 +-
 ...ent.c-fix-error-handling-for-udev_mo.patch |  39 +++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 .../recipes-support/openct/openct_0.6.20.bb   |   2 +-
 ...-add-native-paths-to-pkgconfig-searc.patch |  36 ++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |   1 +
 ...1-Enable-use-of-external-fmt-library.patch |  26 +++
 .../recipes-support/spdlog/spdlog_1.8.1.bb    |   5 +-
 .../python/python3-aiohttp_3.7.2.bb           |   4 +-
 40 files changed, 734 insertions(+), 53 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb} (83%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb} (96%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb => nodejs_12.20.1.bb} (97%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
 create mode 100644 meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch

-- 
2.17.1

