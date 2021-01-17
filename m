Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.21191.1610905592273026416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s4xieTxU;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id i7so9485706pgc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBFRivEjt128DB1kf0xomcJul6BMK6RIHtnraiUO5uI=;
        b=s4xieTxUAhK2zQWMpqnEHtsDgYcqnxJk5ZfzhUZINzksfEx7JwF9BhskwBM9jEEBrb
         TwDYDNvh8oCqHakm4kwgkhYpvWWoDNkWlCo5mGfJO/AJGsa0leVL+pyo1fSYeh58dyjl
         C9Y236e364zll9tgch6ow3UdeIcUed4+7L7uvQ8If+REUqYFam0XZL/Elz8WNySYwrpM
         N1e9HVnZ4jgSkVNFbOa9yz9MGWdcbOx6ftzZgghuNkBmBdZR/s7uGI+YXtNELKucBu/k
         hL/iM8V7Tc5KZHryRFC62qMTxHV1bBfw/LRatnd9VuccI1odrSaQM6GIXPmYjz9Yis8o
         Hsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBFRivEjt128DB1kf0xomcJul6BMK6RIHtnraiUO5uI=;
        b=uUXhUC5hOTk9+MDADWqi309CnLgFQ7oRud9wNHDDs+z/goTfTLdIKIAuwVYo80H7Ef
         Sr3JyoHunSvJ4CVFTfka7hsVQbyjgSQdaBpY0Y21Roe1ts5G8KZYM9XOmPgCYdxviMwZ
         ZG0TxP5XBnMfjZ6xuoueo2w0YG9mDr0v9fhMNzehAVWVrCPTrnnzaPA00IE9Iu6dO+ka
         gZM+TkceoUeIqVXNAIe9NncJCodDMp1thTZYF5AFyxo3TyUwS2rNQU2W3SPHub/zDRJY
         sVp6p6U1LzyiOjdNqM0aEWHwy6UeG5UI/kzASbFo+QNy915Ma73hJ52VrEzGfPVP9VE7
         Gwug==
X-Gm-Message-State: AOAM531UEoV8mJAgUDI44cIyzBU5o2LwU1ZsGtO3sSS/VEVH3/PmsbE5
	0tofmyu1jc+51CqeiHLHtUQkrDwroQJjnw==
X-Google-Smtp-Source: ABdhPJyxP9LhwrP3xFAtBkYFukCinrfSHPmg1dFTmx8GHtZYyhweG4JKFYumohRwJWfoJaxpkRu5CA==
X-Received: by 2002:a62:7c4e:0:b029:1b6:8641:1fb2 with SMTP id x75-20020a627c4e0000b02901b686411fb2mr5034192pfc.10.1610905591312;
        Sun, 17 Jan 2021 09:46:31 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:30 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/28] Patch review Jan 17th
Date: Sun, 17 Jan 2021 09:45:58 -0800
Message-Id: <cover.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is the next batch for Dunfell. Please review and have comments back by Wednesday.

The following changes since commit f2d02cb71eaff8eb285a1997b30be52486c160ae:

  python3-pyinotify: Add missing ctypes dependency (2020-11-15 11:13:25 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (5):
  wireguard-module: fix build issue with 5.4 kernel
  mariadb: update to 10.4.17 for cve fixes
  lua: update to 5.3.6
  nss: Security fix CVE-2020-12401
  wireshark: Several securtiy fixes

Chenxi Mao (1):
  geoclue: select avahi-daemon if nmea enabled

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

 .../samba/samba/CVE-2020-14318.patch          | 142 +++++++++++++++
 .../samba/samba/CVE-2020-14383.patch          | 112 ++++++++++++
 .../samba/samba_4.10.18.bb                    |   2 +
 ...NC_-START-END-were-backported-to-5.4.patch |  29 +++
 .../wireguard-module_1.0.20200401.bb          |   3 +-
 ...ping-don-t-allocate-a-too-large-buff.patch |  70 ++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |   1 +
 ...wireshark_3.2.7.bb => wireshark_3.2.10.bb} |   2 +-
 .../zabbix/zabbix/CVE-2020-15803.patch        |  36 ++++
 .../zabbix/zabbix_4.4.6.bb                    |   1 +
 ...e_10.4.12.bb => mariadb-native_10.4.17.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   6 +-
 ...-breakage-from-lock_guard-error-6161.patch |  32 ----
 .../mariadb/0001-Fix-library-LZ4-lookup.patch |  19 +-
 .../mysql/mariadb/c11_atomics.patch           |  24 ++-
 .../configure.cmake-fix-valgrind.patch        |  10 +-
 .../mariadb/fix-a-building-failure.patch      |  13 +-
 .../mysql/mariadb/fix-arm-atomic.patch        |  13 +-
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |  12 +-
 ...akeLists.txt-fix-do_populate_sysroot.patch |  10 +-
 ...{mariadb_10.4.12.bb => mariadb_10.4.17.bb} |   0
 ...rriers-cannot-be-active-during-sweep.patch |  90 ++++++++++
 .../lua/lua/CVE-2020-15945.patch              | 167 ++++++++++++++++++
 .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}        |   8 +-
 .../mcpp/files/CVE-2019-14274.patch           |  34 ++++
 .../mcpp/files/ice-mcpp.patch                 |  31 ----
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |   3 +-
 ...gister-r7-because-llvm-now-issues-an.patch |  53 ++++++
 ...-passing-multiple-libs-to-pkg_config.patch |  41 -----
 ...allow-use-of-system-installed-brotli.patch |  66 -------
 ...Install-both-binaries-and-use-libdir.patch |  28 ++-
 .../{nodejs_12.14.1.bb => nodejs_12.20.1.bb}  |  12 +-
 .../php/php/CVE-2020-7069.patch               | 158 +++++++++++++++++
 .../php/php/CVE-2020-7070.patch               |  24 +++
 .../php/php/debian-php-fixheader.patch        |  27 +--
 .../php/{php_7.4.4.bb => php_7.4.9.bb}        |  16 +-
 .../dlt-daemon/dlt-daemon/275.patch           |  38 ++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb           |   1 +
 .../libsdl/libsdl2-mixer_2.0.4.bb             |   2 +-
 .../geoclue/geoclue_2.5.3.bb                  |   2 +-
 .../nss/nss/CVE-2020-12401.patch              |  52 ++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 .../pcsc-lite/pcsc-lite_1.8.26.bb             |   1 +
 .../{apache2_2.4.43.bb => apache2_2.4.46.bb}  |   4 +-
 44 files changed, 1111 insertions(+), 285 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb} (96%)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb => mariadb-native_10.4.17.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb => mariadb_10.4.17.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (87%)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.14.1.bb => nodejs_12.20.1.bb} (94%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 mode change 100755 => 100644 meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.4.bb => php_7.4.9.bb} (97%)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb} (98%)

-- 
2.17.1

