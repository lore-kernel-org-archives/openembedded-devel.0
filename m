Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.3036.1611205842318455077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 21:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pPbo44PM;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id my11so4250832pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 21:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=WveBEn7fSF1CPNLGQPwd3pRyl4Td9oamPefa6hkbmQg=;
        b=pPbo44PMHKUBn0TOmgLB6Botr62dm3wj6dcUzvtLjVGwyku6RYlfagAH6zr18+ArFm
         b+18to+Z9+z5xJ/XnKBX3DyFPfYSVw5+5TWV7Xm9EmGuD/WuiqvNNzkDaOlKEuyXcLNu
         K2pDjwtoSvPa+ZUekxtGtxhKXy+q5f+Gks3cF+/bEjN6/6GOMefeN6W6pNqmzyrXjwfr
         ODo7dyJpc+2Fs/XGmDrb+mfxwLDFG8DqCOTEyiL71JRo98zRxVFPTy08zSXMKjIgBNRy
         whAvS5VvSK8lJ1c0JtpQxryQnTf6gPzLvmhKikOw4iQYX9TJmreWNKUTIXp/xJWGw4Vo
         ZS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=WveBEn7fSF1CPNLGQPwd3pRyl4Td9oamPefa6hkbmQg=;
        b=Cqqr1XEZoQSnnRXyyEi6U9wFHmPxNYyyrNJZuBsykqKY6hdZ5Z8kzVII3ugXP6356u
         lZP2etHXam0FCTI+SpC08OILaFG0rTyfHzmJeSMXOx+JNmhHzJ9n05MdLQUEGPghRBIM
         nWQJzJuB21A7loBPozvx7KFsXovU4+jkDgvc3kbOjxZfpLH5LqhDRvRmV4NyBtIbfzLx
         zhLnEa2fASbu8us0OeD/sBBy+3gbm4esD+S5KRrX24BLvUdTf0WtT/cR8qeYxAKCgG4F
         yrBXgU8161aqJrtnrAi1EewhchsyutXZOPHiPi/ePmicoYmw7vs1B9pjRfPn/u4vnH/V
         QbQw==
X-Gm-Message-State: AOAM531jCQKnazvd571i+zSmcIEnANla7sW8y/dejNokBoz2wNaj/DLO
	gymyl9LFif+h4jvb0ZrrLjQ=
X-Google-Smtp-Source: ABdhPJzraTLhOGSZdpA6JaR88UtUEYVoOMFhOu5sjoLFd2dG6gVeLycwHs55gntxlK1lin+K8brdzg==
X-Received: by 2002:a17:90a:fd0b:: with SMTP id cv11mr9545949pjb.26.1611205841677;
        Wed, 20 Jan 2021 21:10:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c089:d7d0:f232:b36f? ([2601:202:4180:a5c0:c089:d7d0:f232:b36f])
        by smtp.gmail.com with ESMTPSA id w11sm3928670pge.28.2021.01.20.21.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 21:10:41 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Dunfell merge request Jan 20th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <91cab38c-e67e-7c32-0755-8cc6299d9cef@gmail.com>
Date: Wed, 20 Jan 2021 21:10:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit f2d02cb71eaff8eb285a1997b30be52486c160ae:

  python3-pyinotify: Add missing ctypes dependency (2020-11-15 11:13:25
-0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 5bba79488b7d393d2258d6e917f7bf7b0d7c4073:

  gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)

----------------------------------------------------------------
Armin Kuster (5):
      wireguard-module: fix build issue with 5.4 kernel
      mariadb: update to 10.4.17 for cve fixes
      lua: update to 5.3.6
      nss: Security fix CVE-2020-12401
      wireshark: Several securtiy fixes

Chenxi Mao (1):
      geoclue: select avahi-daemon if nmea enabled

Diego Santa Cruz (2):
      gssdp: Upgrade to 1.2.2 -> 1.2.3
      gupnp: Upgrade to 1.2.2 -> 1.2.4

Gianfranco (1):
      dlt-daemon: add upstream patch to fix CVE-2020-29394

Khem Raj (4):
      nodejs: Fix build with icu 67.1
      nodejs: Upgrade to 12.18.3
      nodejs: Fix arm32/thumb builds with clang
      nodejs: Update to 12.19.0

Leon Anavi (1):
      php: Upgrade 7.4.4 -> 7.4.9

Max Kellermann (1):
      php: remove the failing ${D}/${TMPDIR} code

Robert Joslyn (1):
      postgresql: Update to 12.5

Roland Hieber (1):
      pcsc-lite: provide pcsc-lite-lib-native explicitly for native build

Sakib Sajal (1):
      apache2: upgrade v2.4.43 -> v2.4.46

Sean Nyekjaer (1):
      nodejs: 12.19.1 -> 12.20.1

Stacy Gaikovaia (1):
      nodejs: 12.19.0 -> 12.19.1

Wang Mingyu (1):
      zabbix: CVE-2020-15803 Security Advisory

Wenlin Kang (2):
      lua: fix CVE-2020-15945
      lua: fix CVE-2020-24371

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

 .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}       |   4 +-
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}       |   4 +-
 .../samba/samba/CVE-2020-14318.patch               | 142 ++++++++++++++++++
 .../samba/samba/CVE-2020-14383.patch               | 112 ++++++++++++++
 .../recipes-connectivity/samba/samba_4.10.18.bb    |   2 +
 ...YM_FUNC_-START-END-were-backported-to-5.4.patch |  29 ++++
 .../wireguard/wireguard-module_1.0.20200401.bb     |   3 +-
 ...-escaping-don-t-allocate-a-too-large-buff.patch |  70 +++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb       |   1 +
 .../{wireshark_3.2.7.bb => wireshark_3.2.10.bb}    |   2 +-
 .../zabbix/zabbix/CVE-2020-15803.patch             |  36 +++++
 .../recipes-connectivity/zabbix/zabbix_4.4.6.bb    |   1 +
 ...native_10.4.12.bb => mariadb-native_10.4.17.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   6 +-
 ...build-breakage-from-lock_guard-error-6161.patch |  32 ----
 .../mariadb/0001-Fix-library-LZ4-lookup.patch      |  19 +--
 .../recipes-dbs/mysql/mariadb/c11_atomics.patch    |  24 +--
 .../mariadb/configure.cmake-fix-valgrind.patch     |  10 +-
 .../mysql/mariadb/fix-a-building-failure.patch     |  13 +-
 .../recipes-dbs/mysql/mariadb/fix-arm-atomic.patch |  13 +-
 ...CMakeLists.txt-fix-gen_lex_hash-not-found.patch |  12 +-
 ...es-CMakeLists.txt-fix-do_populate_sysroot.patch |  10 +-
 .../{mariadb_10.4.12.bb => mariadb_10.4.17.bb}     |   0
 .../{postgresql_12.4.bb => postgresql_12.5.bb}     |   2 +-
 ...ug-barriers-cannot-be-active-during-sweep.patch |  90 +++++++++++
 .../recipes-devtools/lua/lua/CVE-2020-15945.patch  | 167
+++++++++++++++++++++
 .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}             |   8 +-
 .../mcpp/files/CVE-2019-14274.patch                |  34 +++++
 meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch |  31 ----
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb        |   3 +-
 ...of-register-r7-because-llvm-now-issues-an.patch |  53 +++++++
 ...allow-passing-multiple-libs-to-pkg_config.patch |  41 -----
 ...uild-allow-use-of-system-installed-brotli.patch |  66 --------
 ...0003-Install-both-binaries-and-use-libdir.patch |  28 ++--
 .../{nodejs_12.14.1.bb => nodejs_12.20.1.bb}       |  12 +-
 .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158
+++++++++++++++++++
 .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 +++
 .../php/php/debian-php-fixheader.patch             |  27 ++--
 .../php/{php_7.4.4.bb => php_7.4.9.bb}             |  16 +-
 .../dlt-daemon/dlt-daemon/275.patch                |  38 +++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb                |   1 +
 .../recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb |   2 +-
 .../recipes-navigation/geoclue/geoclue_2.5.3.bb    |   2 +-
 .../recipes-support/nss/nss/CVE-2020-12401.patch   |  52 +++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb          |   1 +
 .../recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb  |   1 +
 .../{apache2_2.4.43.bb => apache2_2.4.46.bb}       |   4 +-
 47 files changed, 1116 insertions(+), 290 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb =>
gssdp_1.2.3.bb} (83%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb =>
gupnp_1.2.4.bb} (64%)
 create mode 100644
meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 create mode 100644
meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 create mode 100644
meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
 create mode 100644
meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb =>
wireshark_3.2.10.bb} (96%)
 create mode 100644
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =>
mariadb-native_10.4.17.bb} (100%)
 delete mode 100644
meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb =>
mariadb_10.4.17.bb} (100%)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.4.bb =>
postgresql_12.5.bb} (73%)
 create mode 100644
meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (87%)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
 create mode 100644
meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
 delete mode 100644
meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
 delete mode 100644
meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.14.1.bb =>
nodejs_12.20.1.bb} (94%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 mode change 100755 => 100644
meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.4.bb => php_7.4.9.bb} (97%)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb =>
apache2_2.4.46.bb} (98%)
