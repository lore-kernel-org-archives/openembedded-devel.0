Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5764ECAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 07:12:42 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.13322.1758006761356299709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 00:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bfa5/MSp;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62f1987d49fso1444219a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 00:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758006760; x=1758611560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr4rGv14gRdG+mRkdMnzo6l682IHN3FxAAmo9KOzSeI=;
        b=Bfa5/MSp1rEqsZgsLMJU2rbTFnU9vpKRfXJwx5JnomCeUBglTbMPMP5RCpjl9AFQu5
         yVP+5cqHue0IY2I/IaKv5BfYzLpGEoRUiRcum08jhPqFzBcPkmUw/2oTUkqAmlJGOG6K
         vciiCk3ey7lYojyUVbkgUErkc2kynrprKnskhMGOdyo/q4/8ADzCnK9sqY+cWf9QaCmd
         2eI31aanbqDFQrn8qC9lYEkDknnYhnjPWBOcryYZcF9G5WWoZvsrOJBbhaQTp0rrFFwg
         7Jku4BkXK28LK9FyjtCy05RtiG0uP8ZuWa4NJnamGruFL5fKauvqLBtfKBZ6utUC6SGw
         q5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758006760; x=1758611560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr4rGv14gRdG+mRkdMnzo6l682IHN3FxAAmo9KOzSeI=;
        b=RIJ9brAFWt/U+1CAkqjqb9mt4OM23bAKbEyN74Xip94mI1sTUmqKaGmZ/vpefx8Mz6
         71sm3a7ROdQH7ysu/7sXuBnEsnnUOqXPV0G92eD4wYZEgSFij57vRUGnaaTLX+2GDVqY
         QefZ3AT3xkJUZcfKFjJmsKNUjdbkd4rc76haS9tCzlEBnJvbB88XbLOT6/xCIfz9o5fZ
         XgkvTAF3TabjeSGaP+16E4QfhUkwo8NAEpIhXAqk7XN/xS3Ma9gWa7ALHGmDBYHYotWq
         ii8P+mOom7t1djEzTa7v0nzX/ap05SVHGNnOvA/cmGLM7bZ528cDlWKKJ0UvxBezOaN6
         FJsg==
X-Gm-Message-State: AOJu0YwweWh5fO7aUgtLF4liiLzJwlw316Qv5qr59IvkNcuXssQfVpk+
	KA3YPz3MLwYjR3o1AUu/ide1Oed9JNjmiM2nTGnJPug0l5zA2vVDy58vINFc8A==
X-Gm-Gg: ASbGncuhGRcmRA8xFG9b9jCPsOc/EbTDv3ChkqaQf/JfLk6z9/A1BVV9O5iA01O9cXb
	DJGntMTjNCBLsO2qvwDA0I2TByCaOnjuJeSAzzvWeyZuSw3sewc1DWGrxZWMkdV3PrrD/6lQzuV
	yzw601EbDNpZxaWLjeCbfgHZkxSVmtUSduBCHxq3LHPhIJT8JTuU11Eg/nAJKsB0xK4tTwI9ok1
	l48PtJ8YRkH5wk/Go7T/XiwWn+5rd7Tw4Ph8OFbvUBCbrf1h7PYf7pfreQoWhmnbom+Skl/TjWc
	65ak2lZFN58ADlfKAVRKq8LmgcNle+rQ3Y0VHz1GzkeDSQ/27eoPBtjEJgVVeEWi7KgwhDbwJvJ
	AQrie43oveHXur+/pb+2g
X-Google-Smtp-Source: AGHT+IEI6CyfNRdnNV51TAP8lN8vhlh6+oXAu+siwmHBr7LyD+4wBaxCN5tJh9DlSE+UThBWNDtMdg==
X-Received: by 2002:a17:907:3f02:b0:b0c:99b8:8ac5 with SMTP id a640c23a62f3a-b0c99c7cf4cmr867908766b.44.1758006759585;
        Tue, 16 Sep 2025 00:12:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c7159e6csm880719366b.33.2025.09.16.00.12.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:12:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone pull request Sep 16th
Date: Tue, 16 Sep 2025 09:12:38 +0200
Message-ID: <20250916071238.2263667-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 07:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119418

Please find below a summary of updates for the Kirkstone branch.
The changes were tested with a full world build on x86, x86-64, arm and aarch platforms.

The following changes since commit 06fc0278f10d630838d703dde707bbf0e2999873:

  poco: Fix ptests (2025-07-13 14:41:35 -0400)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 5c138125018fef4b240e62b664a809d19f4b26a5:

  readme: update maintainer (2025-09-16 09:04:49 +0200)

----------------------------------------------------------------
Archana Polampalli (2):
      apache2: upgrade 2.4.62 -> 2.4.65
      tcpreplay: fix CVE-2023-43279

Changqing Li (1):
      luajit: fix several CVEs

Chen Qi (1):
      tcprelay: fix a minor cross compilation do_configure issue

Guocai He (3):
      mariadb: File conflicts for multilib
      unixodbc: fix odbc.pc file generation
      libnet: backport patch to remove configure time SOCK_PACKET check

Gyorgy Sarvari (3):
      hunspell-dictionaries: fix SRC_URI
      geary: don't check iso codes xml at build time
      readme: update maintainer

Hitendra Prajapati (2):
      krb5: fix CVE-2025-3576
      libssh: fix CVE-2025-4877

Jiaying Song (1):
      python3-aiohttp: fix CVE-2025-53643 and drop CVE-2024-42367 patch

Peter Marko (3):
      python3-protobuf: patch CVE-2025-4565
      fcgi: patch CVE-2025-23016
      nginx: patch CVE-2025-53859 in stable

Sana Kazi (2):
      tcpdump: Fix patch-fuzz issue
      imagemagick: Fix patch-fuzz for fix-cipher-leak.patch

Vijay Anusuri (2):
      postgresql: upgrade 14.18 -> 14.19
      openjpeg: Fix CVE-2025-50952

Vyacheslav Yurkov (1):
      packagegroup-meta-filesystems: fix build issue

Wang Mingyu (1):
      unixodbc: Fix install conflict when enable multilib.

Yogita Urade (2):
      poppler: fix CVE-2025-50420
      poppler: fix CVE-2025-52886

Youngseok Jeong (1):
      json-schema-validator: Remove absolute path in INSTALL_CMAKE_DIR

 README                                             |    4 +-
 meta-filesystems/README                            |    2 +-
 .../packagegroup-meta-filesystems.bb               |    1 +
 meta-gnome/README                                  |    2 +-
 ...-not-check-for-iso-xml-files-during-build.patch |   31 +
 .../recipes-connectivity/geary/geary_40.0.bb       |    5 +-
 meta-initramfs/README                              |    2 +-
 meta-multimedia/README                             |    2 +-
 meta-networking/README                             |    2 +-
 .../tcpdump/tcpdump/CVE-2024-2397.patch            |   25 +-
 ...c-do-not-run-conftest-in-case-of-cross-co.patch |   50 +
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch       |   36 +
 .../recipes-support/tcpreplay/tcpreplay_4.4.4.bb   |    2 +
 meta-oe/README                                     |    2 +-
 .../krb5/krb5/CVE-2025-3576-01.patch               |  257 ++
 .../krb5/krb5/CVE-2025-3576-02.patch               |  188 +
 .../krb5/krb5/CVE-2025-3576-pre.patch              |   58 +
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb   |    3 +
 ...01-Remove-support-for-SOCK_PACKET-sockets.patch |  251 ++
 .../recipes-connectivity/libnet/libnet_1.2-rc3.bb  |    1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc              |    7 +-
 ...ure.ac-bypass-autoconf-2.69-version-check.patch |    2 +-
 .../{postgresql_14.18.bb => postgresql_14.19.bb}   |    4 +-
 .../0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch |   45 +
 .../json-schema-validator_2.1.0.bb                 |    1 +
 .../luajit/luajit/CVE-2024-25176.patch             |   32 +
 .../luajit/luajit/CVE-2024-25177.patch             |   44 +
 .../luajit/luajit/CVE-2024-25178-0001.patch        |   28 +
 .../luajit/luajit/CVE-2024-25178-0002.patch        |   49 +
 .../luajit/luajit/CVE-2024-25178-0003.patch        |  163 +
 meta-oe/recipes-devtools/luajit/luajit_git.bb      |    5 +
 .../openjpeg/openjpeg/CVE-2025-50952.patch         |   32 +
 .../recipes-graphics/openjpeg/openjpeg_2.4.0.bb    |    1 +
 .../hunspell/hunspell-dictionaries.bb              |    2 +-
 .../imagemagick/files/fix-cipher-leak.patch        |   51 +-
 .../libssh/libssh/CVE-2025-4877.patch              |   57 +
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |    1 +
 .../poppler/poppler/CVE-2025-50420.patch           |   38 +
 .../poppler/poppler/CVE-2025-52886-0001.patch      |  318 ++
 .../poppler/poppler/CVE-2025-52886-0002.patch      |  108 +
 .../poppler/poppler/CVE-2025-52886-0003.patch      | 4219 ++++++++++++++++++++
 .../poppler/poppler/CVE-2025-52886-0004.patch      |   58 +
 meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    5 +
 ...e.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch |   54 +
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb |   22 +-
 meta-perl/README                                   |    2 +-
 meta-python/README                                 |    2 +-
 .../python/python3-aiohttp/CVE-2024-42367.patch    |   65 -
 .../python/python3-aiohttp/CVE-2025-53643.patch    |  197 +
 .../python/python3-aiohttp_3.8.6.bb                |    2 +-
 .../python/python3-protobuf/CVE-2025-4565.patch    |  377 ++
 .../python/python3-protobuf_3.20.3.bb              |    2 +
 meta-webserver/README                              |    2 +-
 .../{apache2_2.4.62.bb => apache2_2.4.65.bb}       |    2 +-
 .../recipes-httpd/nginx/files/CVE-2025-53859.patch |  131 +
 meta-webserver/recipes-httpd/nginx/nginx.inc       |    1 +
 .../recipes-support/fcgi/fcgi/CVE-2025-23016.patch |   40 +
 meta-webserver/recipes-support/fcgi/fcgi_git.bb    |    1 +
 meta-xfce/README                                   |    2 +-
 59 files changed, 6974 insertions(+), 122 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-01.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-02.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-pre.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.18.bb => postgresql_14.19.bb} (71%)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0001.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0002.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0003.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-50952.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0002.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0003.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0004.patch
 create mode 100644 meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2025-4565.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.65.bb} (99%)
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch

