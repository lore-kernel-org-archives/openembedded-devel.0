Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FA1CF45B2
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:25:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38272.1768238715822323040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 09:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIT/rckR;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so49233865e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768238714; x=1768843514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjl4dUFtGBInUpHf7XPn+EBl+sBdA1P3HO3KDoskcic=;
        b=WIT/rckRGdS5NjjQIN4TCsQz3IYLSGMBgrHFurJ1Rss+aVvra3MnjKrcQ1Von6Cus9
         l12EY+uoHeKh70pIt9EcXQ73j0hq4oS4W7sqt1sNZesxU9aSp8BjMCP79D1GuFDzZ3W0
         E+r0ji2OZkSyLafl+dovHB0api7KlBknvHWxAXXurSDMJps4e1dr1S3yAow917CafZYA
         kokXcL81ySKUHnD3k+yeMvpoLQ5CVRRzwVPAYQDDolF98zCa/nbIYW6HxBldWjs5+NKP
         o5WRhg5PCNV6F17GFLyUzQsOLIS2FizSbofa8oy8hIUxMCemH94uG6K1z7JajZsWvlFy
         HD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238714; x=1768843514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjl4dUFtGBInUpHf7XPn+EBl+sBdA1P3HO3KDoskcic=;
        b=MOBPIQN794l7Ft/z/hSZnehyX5ZZr8i1qC1FGasLBASpCTrzGVhieIxJgPF68VaE2x
         gLWKXeSAYkOkIPwQ5f5tYm7z13upxJYFmBm5ksXgy0OTZaVi0yHIrAWzoXMW7prlkrvi
         LflKeFGab2yphSUMXv5R9j33ZOpioRfvdso/3PPqnOb3QIYSeD2NS1hXBKFKazg6gC2T
         3yMfgXy66aHjYJzinFeHTCxWsPoHem/ZDwBjWZ8DVGAUzWLheVM/1ZaaH5B+/PXiwIKu
         XSSKiKK9Hl4sLbk0IoeVi1mel49c/VipjMSZRDtzrSBxp1JXWIZmfd8bcaGvPsK4wbUP
         dN7A==
X-Gm-Message-State: AOJu0YwGtgnC3hHKsDUA2JIfK3CUBukz0WqEZ++LHoUFwxFkdEWw9GWC
	w1CMZ4ham4mEimNdPQX837on+JZdeklCDeWQel/91AZi2mxkbmraxSrX4w1BuQ==
X-Gm-Gg: AY/fxX6mD3lUmp1nMZrn68kAey7FsbbSHHdHhiRjHFA+ZQjc1aFNsRI2JS7o2bU5+2x
	Ay8vqB8nbSdd159rlk4DEoSqfAOZhCx1kqVvVLnljzh7qLyy+b1HoY6+e38xN69s2yL8FAr2WtM
	6ffnovYkDogyW7NL528w4AtySBoxpG1Ckx1bj1R047CJob1q2n5nvDPbuuxtH/rdPvDkOVGgEgF
	H6cIiNaAd+KF7TXHUI8+c+H/WwA93fQz3DK2VLvbAUrIXfs4czheizCS+u3Z/tx0M6NXE/mmKni
	Zu9a4cKt27/XCV9i17UwL2jvS5714kwXLXI/UZL+lxWgih29hOZSIMKwISTw2KFEXFZeBVw+Ppu
	TnmJ8aO2eijkO7xelVkZgpq0iYMZhFZsmjh3lkHgtuD0rEHJcGnMpuhAO6eSzXk8foNlp2owqcE
	6L4iF7jDeh
X-Google-Smtp-Source: AGHT+IEx+j0mfygDMyxRa8ipurdm0i7JRXdnBCGfgfksKPeIrZNbf+cGPBzA5cAkPNXS5u4Q2vTONw==
X-Received: by 2002:a05:600c:1e1c:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47d84b0a8eamr188532665e9.3.1768238713642;
        Mon, 12 Jan 2026 09:25:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5feaf8sm40144320f8f.39.2026.01.12.09.24.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:24:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone Pull Request Jan 12th
Date: Mon, 12 Jan 2026 18:24:33 +0100
Message-ID: <20260112172433.1412080-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 17:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123386

Today's Kirkstone PR comes with a small handful of upgrades, and a lot of CVE
fixes - thank you to all contributors who helped with these improvements.

Artifacts:
Yocto Project Layer Compatibility: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20923938912
World Build arm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20923926712
World Build aarch64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20926920377
World Build x86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20926923653
World Build x86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20926926039
Ptest execution (logs attached to run): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20925983031

Please let me know if you have any questions or comments.

The following changes since commit 97d4be2839754dadfc326c21948472c2fc2985ce:

  gupnp-igd: add ptest support (2025-12-06 19:34:22 +0100)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 7d4507f226bd2af939d4482fb14a809867ece939:

  libsodium: patch CVE-2025-69277 (2026-01-12 13:48:02 +0100)

----------------------------------------------------------------
Ankur Tyagi (2):
      smarty: update CVE_PRODUCT
      civetweb: patch CVE-2025-9648

Divyanshu Rathore (11):
      ImageMagick: Fix CVE-2025-53014
      ImageMagick: Fix CVE-2025-53101
      ImageMagick: Fix CVE-2025-55160
      ImageMagick: Fix CVE-2025-55005
      ImageMagick: Fix CVE-2025-53019
      ImageMagick: Fix CVE-2025-55004
      ImageMagick: Fix CVE-2025-57803
      ImageMagick: Fix CVE-2025-57807
      ImageMagick: Fix CVE-2025-55154
      ImageMagick: Fix CVE-2025-55298
      ImageMagick: Fix CVE-2023-34151

Emil Kronborg Andersen (1):
      snappy: add CVE_PRODUCT

Gyorgy Sarvari (79):
      znc: patch CVE-2024-39844
      zlog: patch CVE-2024-22857
      sysdig: set SRCREV_FORMAT
      gosu: set SRCREV_FORMAT variable
      botan: patch CVE-2024-34702
      accountservice: ignore CVE-2023-3297
      postgresql: upgrade 14.19 -> 14.20
      openh264: patch CVE-2025-27091
      proftpd: patch CVE-2024-48651
      xfdesktop: upgrade 4.16.0 -> 4.16.1
      xfce4-panel: upgrade 4.16.3 -> 4.16.6
      tumbler: upgrade 4.16.0 -> 4.16.1
      thunar: upgrade 4.16.9 -> 4.16.11
      cherokee: patch CVE-2020-12845
      hiawatha: set a working SRC_URI
      phpmyadmin: upgrade 5.1.3 -> 5.1.4
      xdebug: upgrade 3.1.1 -> 3.1.5
      nodejs: fix CVE_PRODUCT
      imagemagick: patch CVE-2022-1115
      imagemagick: patch CVE-2025-65955
      imagemagick: patch CVE-2025-62171
      zabbix: patch CVE-2025-49643
      libmediaart-2.0: upgrade 1.9.6 -> 1.9.7
      vorbis-tools: upgrade 1.4.2 -> 1.4.3
      vlc: upgrade 3.0.17-1 -> 3.0.17.4
      mtr: patch CVE-2025-49809
      nanopb: patch CVE-2024-53984
      redis: ignore CVE-2025-46686
      cups-filters: patch CVE-2025-57812
      cups-filters: patch CVE-2025-64524
      cups-filters: patch CVE-2023-24805
      dbus-broker: patch CVE-2022-31212
      smarty: patch CVE-2018-25047
      smarty: patch CVE-2023-28447
      hunspell: patch CVE-2019-16707
      tcsh: update SRC_URI
      pcp: switch SRC_URI to git
      srecord: fix SRC_URI
      thrift: fix SRC_URI
      softhsm: correct SRC_URI branch
      xmlsec1: update SRC_URI
      nbdkit: patch CVE-2025-47711
      nbdkit: patch CVE-2025-47712
      nbdkit: remove unused patch
      php: upgrade 8.1.33 -> 8.1.34
      atop: patch CVE-2025-31160
      python3-django: ignore CVE-2024-22199
      fio: ignore CVE-2025-10824
      nodejs: ignore CVE-2023-30583, CVE-2023-30584 and CVE-2023-30587
      nodejs: patch CVE-2023-39333
      nodejs: ignore CVE-2024-22017
      nodejs: patch CVE-2024-27983
      phpmyadmin: ignore CVE-2020-22452
      nodejs: ignore CVE-2024-3566 and CVE-2024-36138
      nodejs: ignore CVE-2024-36137
      netdata: ignore CVE-2024-32019
      xdg-user-dirs: upgrade 0.17 -> 0.18
      usb-modeswitch: upgrade 2.6.0 -> 2.6.2
      tree: upgrade 2.0.2 -> 2.0.4
      spitools: upgrade 1.0.1 -> 1.0.2
      lldpd: patch CVE-2021-43612
      python3-cbor2: ignore CVE-2025-64076
      python3-configobj: patch CVE-2023-26112
      python3-flask: patch CVE-2023-30861
      tinyproxy: patch CVE-2025-63938
      python3-ipython: patch CVE-2023-24816
      python3-joblib: upgrade 1.1.0 -> 1.1.1
      python3-pyjwt: patch CVE-2022-29217
      python3-mpmath: patch CVE-2021-29063
      python3-werkzeug: ignore CVE-2024-49766 and CVE-2025-66221
      python3-waitress: patch CVE-2024-49768
      python3-waitress: patch CVE-2024-49769
      python3-m2crypto: ignore CVE-2009-0127
      openflow: don't overwrite CVE_CHECK_IGNORE
      python3-tornado: patch CVE-2023-28370
      python3-tornado: patch CVE-2024-52804
      python3-tqdm: patch CVE-2024-34062
      wireshark: upgrade 3.4.12 -> 3.4.16
      wireshark: ignore CVE-2024-24476, CVE-2024-24478 and CVE-2024-24479

Haixiao Yan (1):
      python3-django: fix CVE-2025-64459

Hitendra Prajapati (3):
      wireshark: fix CVE-2025-13499
      krb5: fix for CVE-2024-3596
      wireshark: fix CVE-2025-11626

Jason Schonberg (1):
      Add missing HOMEPAGEs to xfce recipes

Jeroen Hofstee (1):
      php: ignore CVE-2024-3566

Kai Kang (1):
      mbedtls: fix CVE-2025-47917

Ninette Adhikari (1):
      mpd: Update status for CVE-2020-7465 and CVE-2020-7466

Peter Marko (6):
      proftpd: set status of CVE-2001-0027
      sassc: ignore CVE-2022-43357
      python-grpcio(-tools): add grpc:grpc to cve product
      python3-protobuf: set CVE_PRODUCT
      memcached: ignore disputed CVE-2022-26635
      libsodium: patch CVE-2025-69277

Sanjay Chitroda (1):
      recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch

Shinji Matsunaga (1):
      audit: Fix CVE_PRODUCT

Valeria Petrov (1):
      apache2: upgrade 2.4.65 -> 2.4.66

Vijay Anusuri (1):
      net-snmp: Fix for CVE-2025-68615

Viswanath Kraleti (1):
      gflags: switch Git branch from master to main

wangmy (1):
      python3-waitress: upgrade 2.1.1 -> 2.1.2

 .../accountsservice/accountsservice_22.08.8.bb     |   3 +
 .../recipes-multimedia/musicpd/mpd_0.23.12.bb      |   3 +
 .../openh264/openh264/CVE-2025-27091.patch         |  27 +
 .../recipes-multimedia/openh264/openh264_2.1.1.bb  |   1 +
 .../vlc/{vlc_3.0.17-1.bb => vlc_3.0.17.4.bb}       |   4 +-
 ...issing-include-utf8.h-to-codec_skeleton.c.patch |  28 -
 .../vorbis-tools/vorbis-tools/CVE-2023-43361.patch |  57 --
 .../vorbis-tools/vorbis-tools/gettext.patch        |  44 +-
 ...vorbis-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} |   4 +-
 ...iaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} |   2 +-
 .../civetweb/civetweb/CVE-2025-9648.patch          | 234 +++++
 .../recipes-connectivity/civetweb/civetweb_git.bb  |   1 +
 .../mbedtls/mbedtls/CVE-2025-47917.patch           |  52 ++
 .../mbedtls/mbedtls_2.28.10.bb                     |   4 +-
 .../lldpd/files/CVE-2021-43612.patch               |  93 ++
 .../recipes-daemons/lldpd/lldpd_1.0.8.bb           |  12 +-
 .../proftpd/files/CVE-2024-48651.patch             | 321 +++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb      |   6 +-
 .../recipes-irc/znc/znc/CVE-2024-39844.patch       |  61 ++
 meta-networking/recipes-irc/znc/znc_1.8.2.bb       |   4 +-
 .../net-snmp/net-snmp/CVE-2025-68615.patch         |  33 +
 .../recipes-protocols/net-snmp/net-snmp_5.9.3.bb   |   1 +
 .../recipes-protocols/openflow/openflow.inc        |   8 +-
 .../recipes-support/memcached/memcached_1.6.15.bb  |   3 +
 .../recipes-support/mtr/mtr/CVE-2025-49809.patch   |  38 +
 meta-networking/recipes-support/mtr/mtr_0.95.bb    |   4 +-
 ...1-server-Fix-build-when-printf-is-a-macro.patch |  39 -
 .../nbdkit/nbdkit/CVE-2025-47711.patch             | 168 ++++
 .../nbdkit/nbdkit/CVE-2025-47712.patch             | 162 ++++
 .../recipes-support/nbdkit/nbdkit_1.30.2.bb        |   4 +-
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch       |  41 +
 .../recipes-support/tinyproxy/tinyproxy_1.11.0.bb  |   1 +
 .../wireshark/files/CVE-2022-3190.patch            | 145 ---
 .../wireshark/files/CVE-2025-11626.patch           |  99 +++
 .../wireshark/files/CVE-2025-13499.patch           |  41 +
 .../{wireshark_3.4.12.bb => wireshark_3.4.16.bb}   |   8 +-
 .../nanopb/nanopb/CVE-2024-53984.patch             |  36 +
 .../recipes-devtools/nanopb/nanopb_0.4.5.bb        |   4 +-
 meta-oe/recipes-benchmark/fio/fio_3.30.bb          |   3 +
 .../krb5/krb5/CVE-2024-3596.patch                  | 628 +++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb   |   1 +
 .../recipes-connectivity/thrift/thrift_0.16.0.bb   |   2 +-
 .../zabbix/zabbix/CVE-2025-49643.patch             |  38 +
 .../recipes-connectivity/zabbix/zabbix_5.4.12.bb   |   1 +
 .../dbus/dbus-broker/CVE-2022-31212.patch          |  70 ++
 meta-oe/recipes-core/dbus/dbus-broker_29.bb        |   4 +-
 meta-oe/recipes-core/toybox/toybox_0.8.6.bb        |   2 +-
 ...0001-Address-various-name-constraint-bugs.patch |   2 +-
 .../libsodium/libsodium/CVE-2025-69277.patch       |  61 ++
 .../recipes-crypto/libsodium/libsodium_1.0.18.bb   |   2 +
 ...ure.ac-bypass-autoconf-2.69-version-check.patch |   2 +-
 .../{postgresql_14.19.bb => postgresql_14.20.bb}   |   2 +-
 .../nodejs/nodejs/CVE-2023-39333.patch             |  57 ++
 .../nodejs/nodejs/CVE-2024-27983.patch             |  40 +
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb  |  13 +-
 .../php/{php_8.1.33.bb => php_8.1.34.bb}           |   3 +-
 meta-oe/recipes-extended/redis/redis_6.2.21.bb     |   2 +
 meta-oe/recipes-extended/redis/redis_7.0.15.bb     |   2 +
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb    |   2 +
 meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb   |   2 +
 .../zlog/zlog/CVE-2024-22857.patch                 |  31 +
 meta-oe/recipes-extended/zlog/zlog_1.2.15.bb       |   1 +
 meta-oe/recipes-printing/cups/cups-filters.inc     |   6 +-
 .../cups/cups-filters/CVE-2023-24805.patch         | 213 +++++
 .../cups/cups-filters/CVE-2025-57812.patch         | 127 +++
 .../cups/cups-filters/CVE-2025-64524.patch         |  81 ++
 meta-oe/recipes-security/audit/audit_2.8.5.bb      |   2 +
 meta-oe/recipes-security/audit/audit_3.0.8.bb      |   2 +
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb  |   2 +-
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb        |   2 +-
 .../recipes-support/atop/atop/CVE-2025-31160.patch | 607 +++++++++++++
 meta-oe/recipes-support/atop/atop_2.4.0.bb         |   1 +
 meta-oe/recipes-support/gflags/gflags_2.2.2.bb     |   2 +-
 meta-oe/recipes-support/gosu/gosu_1.14.bb          |   6 +-
 .../hunspell/hunspell/CVE-2019-16707.patch         |  25 +
 meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb |   4 +-
 .../0001-ImageMagick-Fix-CVE-2025-53014.patch      |  32 +
 .../0002-ImageMagick-Fix-CVE-2025-53101.patch      |  60 ++
 .../0003-ImageMagick-Fix-CVE-2025-55160.patch      | 165 ++++
 .../0004-ImageMagick-Fix-CVE-2025-55005.patch      |  40 +
 .../0005-ImageMagick-Fix-CVE-2025-53019.patch      |  33 +
 .../0006-ImageMagick-Fix-CVE-2025-55004.patch      |  67 ++
 ...k-Add-support-patch-to-fix-CVE-2025-57803.patch |  58 ++
 .../0007-ImageMagick-Fix-CVE-2025-57803.patch      |  65 ++
 .../0008-ImageMagick-Fix-CVE-2025-57807.patch      |  51 ++
 .../0009-ImageMagick-Fix-CVE-2025-55154.patch      |  84 ++
 ...-Add-support-patch-1-to-fix-CVE-2025-5529.patch |  48 +
 ...-Add-support-patch-2-to-fix-CVE-2025-5529.patch | 205 +++++
 ...-Add-support-patch-3-to-fix-CVE-2025-5529.patch | 103 +++
 .../0010-ImageMagick-Fix-CVE-2025-55298-1.patch    |  71 ++
 .../0010-ImageMagick-Fix-CVE-2025-55298-2.patch    | 274 ++++++
 ...-Add-support-patch-1-to-fix-CVE-2023-3415.patch |  75 ++
 ...-Add-support-patch-2-to-fix-CVE-2023-3415.patch | 973 ++++++++++++++++++++
 ...-Add-support-patch-3-to-fix-CVE-2023-3415.patch | 977 +++++++++++++++++++++
 .../0011-ImageMagick-Fix-CVE-2023-34151.patch      | 314 +++++++
 .../imagemagick/files/CVE-2022-1115.patch          |  25 +
 .../imagemagick/files/CVE-2025-62171.patch         |  26 +
 .../imagemagick/files/CVE-2025-65955.patch         |  25 +
 .../imagemagick/imagemagick_7.0.10.bb              |  22 +
 meta-oe/recipes-support/pcp/pcp.inc                |   6 +-
 meta-oe/recipes-support/sass/sassc_git.bb          |   3 +
 .../smarty/smarty/CVE-2018-25047.patch             | 140 +++
 .../smarty/smarty/CVE-2023-28447.patch             |  74 ++
 meta-oe/recipes-support/smarty/smarty_4.1.1.bb     |   7 +-
 meta-oe/recipes-support/spitools/spitools_git.bb   |   4 +-
 meta-oe/recipes-support/srecord/srecord_1.64.bb    |   2 +-
 .../tree/{tree_2.0.2.bb => tree_2.0.4.bb}          |   2 +-
 ...modeswitch_2.6.0.bb => usb-modeswitch_2.6.2.bb} |   3 +-
 ...xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb} |   3 +-
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb  |   2 +-
 .../recipes-devtools/python/python-django.inc      |   2 +
 .../recipes-devtools/python/python3-cbor2_5.4.2.bb |   3 +
 .../python/python3-configobj/CVE-2023-26112.patch  |  25 +
 .../python/python3-configobj_5.0.6.bb              |   3 +-
 .../python/python3-django/CVE-2025-64459.patch     |  60 ++
 .../python/python3-django_2.2.28.bb                |   1 +
 .../python/python3-flask/CVE-2023-30861.patch      |  94 ++
 .../recipes-devtools/python/python3-flask_2.1.1.bb |   1 +
 .../python/python3-grpcio-tools_1.45.0.bb          |   2 +
 .../python/python3-grpcio_1.45.0.bb                |   2 +
 .../python/python3-ipython/CVE-2023-24816.patch    |  94 ++
 .../python/python3-ipython_8.2.0.bb                |   1 +
 ...on3-joblib_1.1.0.bb => python3-joblib_1.1.1.bb} |   2 +-
 .../python/python3-m2crypto_0.38.0.bb              |   3 +
 .../python/python3-mpmath/CVE-2021-29063.patch     |  51 ++
 .../python/python3-mpmath_1.2.1.bb                 |   1 +
 .../python/python3-protobuf_3.20.3.bb              |   2 +
 .../python/python3-pyjwt/CVE-2022-29217.patch      | 295 +++++++
 .../recipes-devtools/python/python3-pyjwt_2.3.0.bb |   1 +
 .../python/python3-tornado/CVE-2023-28370.patch    |  39 +
 .../python/python3-tornado/CVE-2024-52804.patch    | 142 +++
 .../recipes-devtools/python/python3-tornado_6.1.bb |   3 +
 .../python/python3-tqdm/CVE-2024-34062.patch       |  64 ++
 .../recipes-devtools/python/python3-tqdm_4.64.0.bb |   1 +
 .../python/python3-waitress/CVE-2024-49768-1.patch | 162 ++++
 .../python/python3-waitress/CVE-2024-49768-2.patch |  89 ++
 .../python/python3-waitress/CVE-2024-49768-3.patch |  60 ++
 .../python/python3-waitress/CVE-2024-49768-4.patch |  34 +
 .../python/python3-waitress/CVE-2024-49769-1.patch |  27 +
 .../python/python3-waitress/CVE-2024-49769-2.patch |  53 ++
 .../python/python3-waitress/CVE-2024-49769-3.patch |  34 +
 .../python/python3-waitress/CVE-2024-49769-4.patch |  34 +
 .../python/python3-waitress/CVE-2024-49769-5.patch | 211 +++++
 .../python/python3-waitress/CVE-2024-49769-6.patch |  41 +
 .../python/python3-waitress_2.1.1.bb               |  15 -
 .../python/python3-waitress_2.1.2.bb               |  26 +
 .../python/python3-werkzeug_2.1.1.bb               |   3 +
 .../{apache2_2.4.65.bb => apache2_2.4.66.bb}       |   2 +-
 .../cherokee/cherokee/CVE-2020-12845.patch         | 195 ++++
 .../recipes-httpd/cherokee/cherokee_git.bb         |   1 +
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb       |   2 +-
 .../{phpmyadmin_5.1.3.bb => phpmyadmin_5.1.4.bb}   |   5 +-
 .../xdebug/{xdebug_3.1.1.bb => xdebug_3.1.5.bb}    |   2 +-
 .../recipes-webadmin/netdata/netdata_1.34.1.bb     |   3 +
 meta-xfce/recipes-xfce/exo/exo_4.16.4.bb           |   1 +
 meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb     |   1 +
 .../thunar-volman/thunar-volman_4.16.0.bb          |   1 +
 .../thunar/{thunar_4.16.9.bb => thunar_4.16.11.bb} |   2 +-
 .../{tumbler_4.16.0.bb => tumbler_4.16.1.bb}       |   3 +-
 .../xfce4-appfinder/xfce4-appfinder_4.16.1.bb      |   1 +
 ...xfce4-panel_4.16.3.bb => xfce4-panel_4.16.6.bb} |   3 +-
 .../xfce4-session/xfce4-session_4.16.0.bb          |   1 +
 .../xfce4-settings/xfce4-settings_4.16.5.bb        |   1 +
 meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb     |   1 +
 .../{xfdesktop_4.16.0.bb => xfdesktop_4.16.1.bb}   |   2 +-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb       |   1 +
 166 files changed, 9434 insertions(+), 361 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.17-1.bb => vlc_3.0.17.4.bb} (97%)
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
 rename meta-multimedia/recipes-multimedia/vorbis-tools/{vorbis-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} (79%)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} (90%)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2025-47917.patch
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-2021-43612.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
 create mode 100644 meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
 delete mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-11626.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.12.bb => wireshark_3.4.16.bb} (92%)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/CVE-2024-53984.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-3596.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/CVE-2022-31212.patch
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.19.bb => postgresql_14.20.bb} (84%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-39333.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-27983.patch
 rename meta-oe/recipes-devtools/php/{php_8.1.33.bb => php_8.1.34.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/CVE-2024-22857.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2023-24805.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-57812.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
 create mode 100644 meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch
 create mode 100644 meta-oe/recipes-support/hunspell/hunspell/CVE-2019-16707.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0001-ImageMagick-Fix-CVE-2025-53014.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-2025-53101.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0003-ImageMagick-Fix-CVE-2025-55160.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0004-ImageMagick-Fix-CVE-2025-55005.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0005-ImageMagick-Fix-CVE-2025-53019.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0006-ImageMagick-Fix-CVE-2025-55004.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Fix-CVE-2025-57803.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0008-ImageMagick-Fix-CVE-2025-57807.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-2025-55154.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix-CVE-2025-55298-1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix-CVE-2025-55298-2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-CVE-2023-34151.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-1115.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62171.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-65955.patch
 create mode 100644 meta-oe/recipes-support/smarty/smarty/CVE-2018-25047.patch
 create mode 100644 meta-oe/recipes-support/smarty/smarty/CVE-2023-28447.patch
 rename meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.4.bb} (87%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.0.bb => usb-modeswitch_2.6.2.bb} (86%)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb} (76%)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/CVE-2023-30861.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython/CVE-2023-24816.patch
 rename meta-python/recipes-devtools/python/{python3-joblib_1.1.0.bb => python3-joblib_1.1.1.bb} (80%)
 create mode 100644 meta-python/recipes-devtools/python/python3-mpmath/CVE-2021-29063.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2022-29217.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2023-28370.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2024-52804.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tqdm/CVE-2024-34062.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-6.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)
 create mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/CVE-2020-12845.patch
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.3.bb => phpmyadmin_5.1.4.bb} (90%)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.1.1.bb => xdebug_3.1.5.bb} (91%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.16.11.bb} (90%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.16.1.bb} (88%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.16.6.bb} (90%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.16.1.bb} (82%)

