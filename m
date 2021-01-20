Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.23696.1611117824882804712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 20:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+Yj3gF4;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id w18so2453219pfu.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 20:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=VKXnklsmFg59XAdFY5MdIwxDrnDYRo5UcL/39+f1Cz0=;
        b=c+Yj3gF4gFkWGXu8KTrdwk1xwyZhpFk9Fp9POQBHmBH6pUmeU2S9YulystnPOzCIg9
         EzMOehA1Me8ZeQMGOtiV5NRc8lbfHlsS/r9zlr68odLOLA62idTvqfwrrR8s+XbxjJUF
         ivzUk5buHP7tSFXbNbGRq8rHwEc+j8QBQWhirk47iJMXr9GypdLK5VcshPUPrzci8JnY
         H9DIu/dE9EktFEqcLkRB5080uD/zZsvVOde11ZvY/0gMXnRjJ0kRq405KqqabF6C8H1p
         ZfZz6eKFXHaAislixdEA2XXG0H+1ptHRSY9bQKiMRn5k1UTRHhW5RgRPWJ9V4b1xKoYs
         XdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=VKXnklsmFg59XAdFY5MdIwxDrnDYRo5UcL/39+f1Cz0=;
        b=PuCjPmlyLcx1A0eLhhgmB5JShW9HPTS16ooRtRLcjwgJ4XAxJncowuD55Rhk/SpZ1/
         5iplqJBT2gaF//UGUG23HFQOSkw/dlADhI5hYjzfz9gpPswmksOVhWUjD2e5oTiOAS3b
         4m1w2awRuq3oqZhv5181Aq+fvjPgyljIjEkPWM2I1VBcUGTL/WBn7EddBPjTRI6CDigJ
         HF3ftM4n/5nli4ffZ8sPSLXRQo9hZrcWfxvDYHn1mA48ppLG33Ce0g9ctXGg9pw5gRbE
         cwyjK2E8gOXfryTjPOrBz6CeABF7RzDNcv25XLAZ2pgC1t0+J4lt5o7mUr+/+kY2YPiO
         o3ug==
X-Gm-Message-State: AOAM530IyNDQeyWdVtXqDUZ2I0z5IeOrozNikRfkk1daJNATVEm13gAB
	UNfsDvaQ+RRlYk6LHah8l98=
X-Google-Smtp-Source: ABdhPJyWj2SzQ7qHPB+guO8Sf+EDkFSSwzlK0OIZ4VzfAGAV1WAISEjHsrKJ1XurWWCDeEaXRNHcXA==
X-Received: by 2002:a62:e515:0:b029:1b9:2dc3:a0da with SMTP id n21-20020a62e5150000b02901b92dc3a0damr7556798pff.9.1611117824246;
        Tue, 19 Jan 2021 20:43:44 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:94e1:880f:156e:2b08? ([2601:202:4180:a5c0:94e1:880f:156e:2b08])
        by smtp.gmail.com with ESMTPSA id v1sm618324pga.63.2021.01.19.20.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 20:43:43 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Gatesgarth pull request Jan 19th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <aea156ae-bcd6-ce3f-afb3-22a3fbef18e5@gmail.com>
Date: Tue, 19 Jan 2021 20:43:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit b9dcf17700014dec679307dc1247882dccd439ca:

  Revert "numactl: Remove the recipe" (2020-11-05 09:00:37 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to 6ff4bd4f345b4e8030b9197d13097308df521576:

  postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)

----------------------------------------------------------------
Armin Kuster (2):
      Revert "gnome-calendar: update to 3.38.1, add libhandy 1.x support"
      wireshark: Several securtiy fixes

Chen Qi (1):
      tclap: fix branch

Chencheng Zhang (1):
      tclap: align version to tag v1.2.2

Diego Santa Cruz (2):
      gssdp: Upgrade to 1.2.2 -> 1.2.3
      gupnp: Upgrade to 1.2.2 -> 1.2.4

Gianfranco (1):
      dlt-daemon: add upstream patch to fix CVE-2020-29394

He Zhe (1):
      lmbench: Fix setting LDLIBS failure

Hongxu Jia (1):
      lvm2.inc: switch branch master to main

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

Max Kellermann (1):
      php: remove the failing ${D}/${TMPDIR} code

Mikko Rapeli (1):
      fuse: set CVE_PRODUCT to "fuse_project:fuse"

Philip Balister (1):
      spdlog: Fix recipe so other recipes can use spdlog with external fmt.

Robert Joslyn (1):
      postgresql: Update to 12.5

Roland Hieber (5):
      pcsc-lite: provide pcsc-lite-lib-native explicitly for native build
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

Yi Zhao (2):
      minifi-cpp: depend on nettle and lz4
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

viatsk (1):
      tcpdump: Patch for CVE-2020-8037

 .../recipes-support/fuse/fuse3_3.9.3.bb            |   2 +
 .../recipes-support/fuse/fuse_2.9.9.bb             |   2 +
 .../8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch | 242
---------------------
 ...calendar_3.38.1.bb => gnome-calendar_3.36.2.bb} |   3 +-
 .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}       |   4 +-
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}       |   4 +-
 .../networkmanager/fix_reallocarray_check.patch    |  27 +++
 .../networkmanager/networkmanager_1.22.14.bb       |   1 +
 .../samba/samba/CVE-2020-14318.patch               | 142 ++++++++++++
 .../samba/samba/CVE-2020-14383.patch               | 112 ++++++++++
 .../recipes-connectivity/samba/samba_4.10.18.bb    |   2 +
 ...01-Makefile-do-not-install-etc-ethertypes.patch |  35 +++
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   3 +-
 ...-escaping-don-t-allocate-a-too-large-buff.patch |  70 ++++++
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb       |   1 +
 .../{wireshark_3.2.7.bb => wireshark_3.2.10.bb}    |   2 +-
 .../recipes-devtools/nanopb/nanopb_0.4.3.bb        |   0
 ...t-CFLAGS-LDFLAGS-to-append-values-passed-.patch |   2 +-
 .../zabbix/zabbix/CVE-2020-15803.patch             |  36 +++
 .../recipes-connectivity/zabbix/zabbix_4.4.6.bb    |   1 +
 .../0001-meson-Fix-reallocarray-check.patch        |  25 +++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb          |   1 +
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |   2 +-
 .../{postgresql_12.4.bb => postgresql_12.5.bb}     |   2 +-
 .../mcpp/files/CVE-2019-14274.patch                |  34 +++
 meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch |  31 ---
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb        |   3 +-
 .../{nodejs_12.19.0.bb => nodejs_12.20.1.bb}       |   4 +-
 .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158 ++++++++++++++
 .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 ++
 meta-oe/recipes-devtools/php/php_7.4.9.bb          |  11 +-
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb      |   4 +-
 .../dlt-daemon/dlt-daemon/275.patch                |  38 ++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb                |   1 +
 .../lockfile-progs/lockfile-progs_0.1.18.bb        |   2 +-
 .../minifi-cpp/minifi-cpp_0.7.0.bb                 |   2 +-
 .../recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb |   2 +-
 meta-oe/recipes-support/colord/colord.bb           |   2 +-
 meta-oe/recipes-support/fbset/fbset_2.1.bb         |   2 +-
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb     |   2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |   2 +-
 ...h-uevent.c-fix-error-handling-for-udev_mo.patch |  39 ++++
 .../multipath-tools/multipath-tools_0.8.4.bb       |   1 +
 meta-oe/recipes-support/openct/openct_0.6.20.bb    |   2 +-
 .../recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb   |   1 +
 ...o-not-add-native-paths-to-pkgconfig-searc.patch |  36 +++
 .../recipes-support/pidgin/pidgin-sipe_1.25.0.bb   |   1 +
 .../0001-Enable-use-of-external-fmt-library.patch  |  26 +++
 meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb     |   5 +-
 .../python/python3-aiohttp_3.7.2.bb                |   4 +-
 50 files changed, 849 insertions(+), 309 deletions(-)
 delete mode 100644
meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
 rename
meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_3.38.1.bb =>
gnome-calendar_3.36.2.bb} (78%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb =>
gssdp_1.2.3.bb} (83%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb =>
gupnp_1.2.4.bb} (64%)
 create mode 100644
meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
 create mode 100644
meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 create mode 100644
meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 create mode 100644
meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
 create mode 100644
meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb =>
wireshark_3.2.10.bb} (96%)
 rename meta-oe/{ =>
dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)
 create mode 100644
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
 create mode 100644
meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.4.bb =>
postgresql_12.5.bb} (73%)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb =>
nodejs_12.20.1.bb} (97%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 create mode 100644
meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
 create mode 100644
meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
 create mode 100644
meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fmt-library.patch

