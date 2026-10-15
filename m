Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19579CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:42:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32787.1792042969767900368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oVBTkmD5;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so28511235ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042969; x=1792647769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp3wGgqNA4Zj+w56gIT2ZurD1Puz0j9Q4mTHaiiXjyU=;
        b=oVBTkmD5XYO6eCAIM64uCphKVVoQqUo7OFeBBy0TVJGVubkCBZbMDEL59hg8sUjDFN
         EZW/9KMLuXL3a8wS3GPeYuz6Dea+9oJswjJpqvTySlQIvh+66BuSv6zAvmU3q9H2MQsA
         +vCRKhmuwg7j91crhWfRifAVzOFvOxPIZORz/GWShmcCIIJU0STpIt42pSMTeUWlvu0s
         OR1uGx7GowXOL3OC2hzWsoKY/ogD54zHVXl41fUskQ02gl4/JX9aorrL8lE7L+po6P9v
         0VElouViEu7WnVglscjzTuUsLsI3HJ7JXfTQeSfneQKsVh3DUStMBFNB1k+heYH2QV58
         uh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042969; x=1792647769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xp3wGgqNA4Zj+w56gIT2ZurD1Puz0j9Q4mTHaiiXjyU=;
        b=ojTIebKTLrPrxvPY3kGgvmGvyfKX4Sl0In/CbFHGSyhtqEgy+P6BoTR3ShbTX4gbdv
         UKLF4zD0o4e4WLtyrZFL1WE1H2sWOJNOkDo2La1BOi3KbJinDI5bhKGXgQSe2csxF5/w
         VVRc4t3xB9g4QDsQBDosgg592L0OvBnHzY6kDYugNRrKAdsmmJFQMHi/VoJfMiTFY6s2
         Mmdr0X85FqWlcbTR2lC5KDgmtSTtYTCCpWnZPyBJMyHHiggFQM4hyE2jyNAWUcbtJ3DD
         yFaMbNXFmWiMwubnKHWvEecsvEsRVambfjLqLT1p+ojQ7GDu6bGKQ2NoYzDysqmq8ISu
         R/qA==
X-Gm-Message-State: AFq9FYJjXf4JLy3gFko/aQII5k1Tl2tAeXN0S5LQesRiS0ClWeJrwGaD
	H1a5TehlEkw47rT41i2fXAsd/qiq8xtOfyDaeAWLKWhAJLtQpjdaS0hHEiXCSQ==
X-Gm-Gg: AYBFou2XX14b5HS09Ee2uv2ZhH4YEIrPajxDWQcIivHQmvl/i1yoPjsxnbeaK5Mn/Mr
	5ITe7YSBQJQHOWj97DuJL3gjsm40ZxXetkRCrMHTIx8b5xlLcN+Gdc1xCyxoq+s0ZKDimZFWyRv
	k1RM+g7qUggVaubyNH11PALZf3eshgZjKEGGLE9M3vWFmsqk3CEdFiKedSZgQgAvESE8elF2/y8
	f+jZ5YOlej+nHrg/jMXDlP2YpUynLug4ZhR8PE08JuLAPsAA9YdUSxs3T3f75HaoWQ8T8pjkfM7
	ZnXWu2GAMVh2J3hgJoQi5mWHjLZ2F4QXgdHE8dOBRbzDT8/sbLxExt3K8r50z7FQnew79/XWumQ
	Af7yPssoMls5XO1klPsTSIOaj9X/6FGVopztw9tBbcvCRhy2mtMw4N406WZluz1Jr7j2K7DY7fZ
	kAOf6yozUaBZ5q9ZH7HR5M5MwgdMdo5c6rVIf/+dR+zjzZiTARlTHOCyrFd2Yo4LAu8eWHLHizY
	nY7z/Xg/UFffoTd9SqMS9A=
X-Received: by 2002:a17:902:cec2:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2e842e01866mr155195705ad.61.1792042968700;
        Wed, 14 Oct 2026 22:42:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/82] Blacksail pull request
Date: Thu, 15 Oct 2026 18:40:48 +1300
Message-ID: <cover.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130920

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Please merge these changes in blacksail. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1860

The following changes since commit ca3cf5fe14bed658890bac643cced054932fcb51:

  fuse3: Fix ptest for the new test runner (2026-10-01 20:41:15 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib ankurt/blacksail
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=ankurt/blacksail

for you to fetch changes up to a9d69bc066bf9498397db27902c287dd666fdfd4:

  lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)

----------------------------------------------------------------

Ankur Tyagi (74):
  readme: update maintainer
  libwebsockets: patch CVE-2026-19773
  capnproto: ignore CVE-2026-59704
  civetweb: ignore CVE-2026-5789
  dovecot: ignore already fixed CVEs
  eject: ignore CVE-2026-28065
  gpsd: patch CVE-2026-58459
  bcc: correct CVE_PRODUCT mapping
  dool: patch CVE-2026-56651
  dool: patch CVE-2026-56652
  haveged: ignore CVE-2026-41054
  gpm: ignore CVE-2025-4558
  gerbera: ignore CVE-2025-23386
  libde265: patch CVE-2026-49295
  libde265: patch CVE-2026-49337
  libde265: patch CVE-2026-49346
  libde265: patch CVE-2026-54240 and CVE-2026-54241
  hdf5: patch CVE-2026-17572
  hdf5: patch CVE-2026-17573
  hdf5: patch CVE-2026-17574
  hdf5: patch CVE-2026-19025
  iniparser: mark CVE-2025-0633 pached
  jq: ignore already fixed CVEs
  libiec61850: mark CVE-2024-45969 patched
  libnfs: patch CVE-2026-53689
  libnfs: patch CVE-2026-57918
  libssh: ignore CVE-2025-14821
  libssh: mark CVEs patched
  libssh: ignore CVE-2026-59851
  miniupnpd: patch CVE-2026-107159
  libyang: patch CVE-2026-41401
  tinyproxy: patch CVE-2026-31842
  tinyproxy: patch CVE-2026-54387
  tinyproxy: patch CVE-2026-55202
  wolfssl: mark CVEs patched
  python3-gunicorn: mark CVE-2024-1135 patched
  pgpool2: upgrade 4.7.2 -> 4.7.3
  smarty: upgrade 5.8.4 -> 5.8.5
  python3-astroid: upgrade 4.3.2 -> 4.3.3
  python3-django: upgrade 6.0.8 -> 6.0.9
  python3-django: upgrade 5.2.17 -> 5.2.18
  python3-tzdata: upgrade 2026.4 -> 2026.5
  python3-werkzeug: upgrade 3.1.8 -> 3.1.9
  python3-zeroconf: upgrade 0.151.3 -> 0.151.5
  swagger-ui: upgrade 5.33.0 -> 5.33.1
  openvpn: ignore CVE-2026-84256
  openvpn: patch CVE-2026-88964
  openvpn: patch CVE-2026-84790
  python3-eventlet: mark CVE-2023-29483 fixed
  cjson: patch CVE-2026-87933
  smarty: mark CVE-2026-82531 patched
  ntopng: patch CVE-2026-84990
  ntopng: patch CVE-2026-86090 and CVE-2026-86091
  sngrep: patch CVE-2026-90558
  strongswan: patch CVE-2026-78123
  strongswan: patch CVE-2026-78124
  strongswan: patch CVE-2026-78126
  strongswan: patch CVE-2026-78127
  strongswan: patch CVE-2026-78129
  strongswan: patch CVE-2026-78133
  strongswan: patch CVE-2026-78131
  strongswan: patch CVE-2026-78130
  strongswan: patch CVE-2026-78132
  strongswan: patch CVE-2026-78135
  strongswan: patch CVE-2026-78134
  tesseract: patch CVE-2026-88052
  tesseract: patch CVE-2026-88048
  tesseract: patch CVE-2026-88049
  tesseract: patch CVE-2026-88050
  tesseract: patch CVE-2026-88047
  tesseract: patch CVE-2026-88051
  tesseract: patch CVE-2026-88054
  gpsd: patch CVE-2026-60122
  lvgl-demo-fb: fix SRCREV

Bastian Krause (1):
  pcsc-lite: create pcscd user and group also via useradd

Markus Volk (5):
  Revert "libpwquality: remove recipe (moved to oe-core)"
  Revert "gnome-shell-extensions: upgrade 50.3 -> 51.0"
  Revert "gnome-shell: upgrade 50.4 -> 51.0"
  Revert "mutter: upgrade 50.4 -> 51.0"
  apache2: fix build with OpenSSL 4

Peter Marko (2):
  libwebsockets: patch CVE-2026-78161
  nginx: set status for CVE-2026-90439

 README.md                                     |   2 +-
 meta-filesystems/README.md                    |  10 +-
 meta-gnome/README.md                          |  10 +-
 ...51.0.bb => gnome-shell-extensions_50.3.bb} |   2 +-
 ...ver-Fix-build-failure-with-libical-4.patch |  44 ++
 ...nome-shell_51.0.bb => gnome-shell_50.4.bb} |   7 +-
 .../mutter/{mutter_51.0.bb => mutter_50.4.bb} |  17 +-
 meta-initramfs/README.md                      |   8 +-
 meta-multimedia/README.md                     |  10 +-
 .../gerbera/gerbera_3.3.0.bb                  |   2 +
 .../libde265/libde265/CVE-2026-49295.patch    |  41 +
 .../libde265/libde265/CVE-2026-49337.patch    |  53 ++
 .../libde265/libde265/CVE-2026-49346.patch    | 102 +++
 .../CVE-2026-54240-CVE-2026-54241.patch       | 426 +++++++++++
 .../libde265/libde265_1.0.19.bb               |   7 +-
 meta-networking/README.md                     |   8 +-
 .../civetweb/civetweb_1.16.bb                 |   1 +
 .../libiec61850/libiec61850_1.6.2.1.bb        |   2 +
 .../miniupnpd/files/CVE-2026-107159.patch     |  78 ++
 .../miniupnpd/miniupnpd_2.3.11.bb             |   1 +
 .../wolfssl/wolfssl_5.9.4.bb                  |   2 +
 .../recipes-support/dovecot/dovecot_2.4.5.bb  |   8 +
 .../ntopng/files/CVE-2026-84990.patch         |  53 ++
 .../files/CVE-2026-86090-CVE-2026-86091.patch |  67 ++
 .../recipes-support/ntopng/ntopng_6.6.bb      |   2 +
 .../openvpn/openvpn/CVE-2026-84790.patch      | 361 +++++++++
 .../openvpn/openvpn/CVE-2026-88964.patch      |  78 ++
 .../recipes-support/openvpn/openvpn_2.7.7.bb  |   3 +
 .../{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb}    |   2 +-
 .../sngrep/sngrep/CVE-2026-90558.patch        |  84 +++
 .../recipes-support/sngrep/sngrep_1.8.4.bb    |   4 +-
 .../strongswan/CVE-2026-78123.patch           |  51 ++
 .../strongswan/CVE-2026-78124.patch           |  34 +
 .../strongswan/CVE-2026-78126.patch           |  37 +
 .../strongswan/CVE-2026-78127.patch           | 115 +++
 .../strongswan/CVE-2026-78129.patch           | 155 ++++
 .../strongswan/CVE-2026-78130.patch           |  49 ++
 .../strongswan/CVE-2026-78131.patch           |  86 +++
 .../strongswan/CVE-2026-78132.patch           |  75 ++
 .../strongswan/CVE-2026-78133.patch           | 620 +++++++++++++++
 .../strongswan/CVE-2026-78134.patch           | 712 ++++++++++++++++++
 .../strongswan/CVE-2026-78135.patch           |  72 ++
 .../strongswan/strongswan_6.0.7.bb            |  14 +-
 .../tinyproxy/tinyproxy/CVE-2026-31842.patch  |  33 +
 .../tinyproxy/tinyproxy/CVE-2026-54387.patch  |  37 +
 .../tinyproxy/tinyproxy/CVE-2026-55202.patch  | 107 +++
 .../tinyproxy/tinyproxy_1.11.3.bb             |   3 +
 meta-oe/README.md                             |   8 +-
 .../recipes-devtools/bcc/bcc_0.37.0.bb        |   2 +
 .../libnfs/libnfs/CVE-2026-53689.patch        |  34 +
 .../libnfs/libnfs/CVE-2026-57918.patch        |  34 +
 .../libnfs/libnfs_6.0.2.bb                    |   2 +
 .../libwebsockets/CVE-2026-19773.patch        |  31 +
 .../libwebsockets/CVE-2026-78161.patch        |  45 ++
 .../libwebsockets/libwebsockets_4.5.8.bb      |   2 +
 .../packagegroups/packagegroup-meta-oe.bb     |   1 +
 .../capnproto/capnproto_1.5.0.bb              |   1 +
 .../cjson/cjson/CVE-2026-87933.patch          | 110 +++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
 meta-oe/recipes-devtools/jq/jq_1.8.2.bb       |   4 +
 .../haveged/haveged_1.9.26.bb                 |   2 +
 ...-Use-setuptools-instead-of-distutils.patch |  78 ++
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch |  26 +
 .../libpwquality/libpwquality_1.4.5.bb        |  39 +
 .../libyang/libyang/CVE-2026-41401.patch      |  43 ++
 .../libyang/libyang_3.13.6.bb                 |   1 +
 .../lvgl/lvgl-demo-fb_9.5.0.bb                |   2 +-
 .../tesseract/tesseract/CVE-2026-88047.patch  | 225 ++++++
 .../tesseract/tesseract/CVE-2026-88048.patch  | 227 ++++++
 .../tesseract/tesseract/CVE-2026-88049.patch  | 315 ++++++++
 .../tesseract/tesseract/CVE-2026-88050.patch  | 209 +++++
 .../tesseract/tesseract/CVE-2026-88051.patch  | 184 +++++
 .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++
 .../tesseract/tesseract/CVE-2026-88054.patch  | 274 +++++++
 .../tesseract/tesseract_5.5.3.bb              |  11 +-
 .../gpsd/gpsd/CVE-2026-58459-1.patch          |  48 ++
 .../gpsd/gpsd/CVE-2026-58459-2.patch          |  46 ++
 .../gpsd/gpsd/CVE-2026-58459-3.patch          |  58 ++
 .../gpsd/gpsd/CVE-2026-60122.patch            |  45 ++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |   4 +
 .../dool/dool/CVE-2026-56651.patch            |  47 ++
 .../dool/dool/CVE-2026-56652.patch            |  35 +
 meta-oe/recipes-support/dool/dool_1.3.8.bb    |   5 +-
 meta-oe/recipes-support/eject/eject_2.1.5.bb  |   2 +
 meta-oe/recipes-support/gpm/gpm_git.bb        |   2 +
 .../hdf5/files/CVE-2026-17572.patch           | 253 +++++++
 .../hdf5/files/CVE-2026-17573.patch           |  53 ++
 .../hdf5/files/CVE-2026-17574.patch           |  65 ++
 .../hdf5/files/CVE-2026-19025.patch           | 112 +++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   4 +
 .../iniparser/iniparser_4.2.6.bb              |   2 +
 .../recipes-support/libssh/libssh_0.11.5.bb   |   9 +
 .../pcsc-lite/pcsc-lite_2.5.1.bb              |   5 +-
 .../{smarty_5.8.4.bb => smarty_5.8.5.bb}      |   3 +-
 meta-perl/README.md                           |  10 +-
 meta-python/README.md                         |  12 +-
 ...roid_4.3.2.bb => python3-astroid_4.3.3.bb} |   2 +-
 ...ngo_5.2.17.bb => python3-django_5.2.18.bb} |   2 +-
 ...jango_6.0.8.bb => python3-django_6.0.9.bb} |   2 +-
 .../python/python3-eventlet_0.41.2.bb         |   2 +
 .../python/python3-gunicorn_26.2.0.bb         |   2 +
 ...ata_2026.4.bb => python3-tzdata_2026.5.bb} |   2 +-
 ...eug_3.1.8.bb => python3-werkzeug_3.1.9.bb} |   2 +-
 ...0.151.3.bb => python3-zeroconf_0.151.5.bb} |   2 +-
 meta-webserver/README.md                      |  10 +-
 ...gger-ui_5.33.0.bb => swagger-ui_5.33.1.bb} |   2 +-
 ...mod_md-Add-OpenSSL-4.0-compatibility.patch |  47 ++
 .../recipes-httpd/apache2/apache2_2.4.68.bb   |   1 +
 .../recipes-httpd/nginx/nginx_1.30.5.bb       |   2 +
 meta-xfce/README.md                           |  11 +-
 110 files changed, 6601 insertions(+), 79 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_51.0.bb => gnome-shell-extensions_50.3.bb} (85%)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libical-4.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_51.0.bb => gnome-shell_50.4.bb} (86%)
 rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb => mutter_50.4.bb} (85%)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb} (95%)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} (88%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb} (94%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch


