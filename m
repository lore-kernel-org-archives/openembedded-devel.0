Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D27C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.2387.1654283963547835887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YO6fGe0T;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id a10so8026662pju.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QpUd6FmPyhQ2hOmfHwLTiBJNtK670FSkcIExCfOTqfg=;
        b=YO6fGe0TBekQcZCTRbA8+IVp/7ezfgS8TjqY73aKFqX872EkJp72quH2QwCkgOWAqv
         3J10X02yk1NBaZYFSv+tuCh4F/mOQ9fbdcnaaaCzJi/7KJnv008AncoczKtulmapOz2E
         apBwHqQrYqrB6DmbnnW+B4lCV32bfC/kwu5sKxj+Q4KazWv4nVigIxBl2buSwL9bsOxn
         yRMOphRklb5NoBlS6IqDKvzMfrgvTT5D7MVWN0/T5C24yxxmFFZcQRlTc5B8R79wmLyb
         e8rxgk+meaVcAO6myc2OTEn7LXUBe11cjEXXvncIVS8BGtXPE1qjNtsWhSMM1RsUH6tu
         9sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QpUd6FmPyhQ2hOmfHwLTiBJNtK670FSkcIExCfOTqfg=;
        b=zVsvT0gmKniXxMQZC30rShzL864ZM86w3hy6ugJ55stYJnu89uI+XS1IBsakqVbJPt
         JBXvSS0GOf5G1NQNljywfwJbFU8ZPStQ53Hy+umYCr4jPZLRALK/irQh+s9gQ+QdoccI
         pmraZOwsQxdnkDid5CbhVS4+neH1kHqxgmV2lIY+G6naYgQ7iNwpez5psVDDeez1VmWN
         UjPYJKWt6yK7ssh2/eoz+ojiJ67XHl0xsOQUAhIaljKFXlWrzvsdTJcpfbqTqqpLxrci
         psCgcAngyrI07Ue4MOU0tSGc00rSbhvsG0EKF2GXXz99prSLX7hx6P3wPI2wsxn8qyaA
         RWgQ==
X-Gm-Message-State: AOAM5339IShLBEyw59QG3VA/Izal1rZjdZS+5SlI5nsY0HfkfrUmBG93
	/JHvCkgpGgaDApojlujXeYdfvXWeSQU=
X-Google-Smtp-Source: 
 ABdhPJxFiSfEaNZf/H/VzTj9RYi7uT6m793CoDhokT9e+8iKHacQm5wpTv0aH0XezH2/SvbS0zRTEg==
X-Received: by 2002:a17:90b:1c82:b0:1dd:1b46:5aa9 with SMTP id
 oo2-20020a17090b1c8200b001dd1b465aa9mr12551082pjb.158.1654283962435;
        Fri, 03 Jun 2022 12:19:22 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/20] Patch review: June 3rd
Date: Fri,  3 Jun 2022 12:16:59 -0700
Message-Id: <cover.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97389

Please have comment back by Sunday.
There may be a delay in response as I will be on vaction next week.

The following changes since commit 0b78362654262145415df8211052442823b9ec9b:

  bats: upgrade 1.6.0 -> 1.6.1 (2022-05-23 07:39:02 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Adrian Fiergolski (1):
  python3-matplotlib: add missing dependency

Adrian Freihofer (1):
  conntrack-tools: fix postinst script

Armin Kuster (2):
  mariadb: update to 10.7.4
  mariadb: Fix i386 Clang builds

Bartosz Golaszewski (1):
  python3-speedtest-cli: fix RDEPENDS

Denys Dmytriyenko (1):
  devmem2: the source and patches moved to github repo

Gianfranco (2):
  sdbus-c++-libsystemd: Bump SRCREV to last commit of 250-stable branch
  libmtp: Add doxygen-native dependency in case documentation build is
    enabled in PACKAGECONFIG. This fixes a FTBFS due to missing
    dependency.

Joerg Vehlow (1):
  jq: Fix typo OE_EXTRACONF -> EXTRA_OECONF

Julien STEPHAN (1):
  libcamera: fix packaging

Kai Kang (3):
  python3-wxgtk4: backport patch to fix svg issue
  libportal: add distro features check
  graphviz: rrecommends on liberation-fonts

Khem Raj (4):
  unattended-upgrades: Disable auto-detecting modules
  sdbus-c++: Link with libatomic on mips/ppc32
  sdbus-c++: Link with libatomic for rv32
  sdbus-c++-libsystemd: Fix patch fuzz

wangmy (3):
  php: upgrade 8.1.4 -> 8.1.5
  php: upgrade 8.1.5 -> 8.1.6
  postgresql: upgrade 14.2 -> 14.3

 .../recipes-gnome/libportal/libportal_0.6.bb  |   4 +-
 .../recipes-multimedia/libcamera/libcamera.bb |   4 +-
 .../conntrack-tools/conntrack-tools_1.4.6.bb  |   1 +
 .../libmtp/libmtp_1.1.19.bb                   |   2 +-
 ...missing.h-check-for-missing-strndupa.patch |   4 +-
 .../sdbus-c++/sdbus-c++-libsystemd_250.3.bb   |   2 +-
 .../recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb |   6 +
 ...ive_10.7.3.bb => mariadb-native_10.7.4.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   5 +-
 .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ----
 .../{mariadb_10.7.3.bb => mariadb_10.7.4.bb}  |   0
 ...c-bypass-autoconf-2.69-version-check.patch |   6 +-
 ...{postgresql_14.2.bb => postgresql_14.3.bb} |   2 +-
 meta-oe/recipes-devtools/jq/jq_git.bb         |   2 +-
 .../php/{php_8.1.4.bb => php_8.1.6.bb}        |   2 +-
 ...up.py-Disable-autodection-of-modules.patch |  28 +
 .../unattended-upgrades_2.6.bb                |   1 +
 .../graphviz/graphviz_2.50.0.bb               |   2 +
 ...word-is-32-bit-and-add-support-for-6.patch |  70 --
 ...ort-different-page-sizes-at-run-time.patch |  35 -
 .../devmem2/devmem2/devmem2-fixups-2.patch    |  91 --
 .../devmem2/{devmem2.bb => devmem2_2.0.bb}    |  17 +-
 .../python/python3-matplotlib_3.5.1.bb        |   1 +
 .../python/python3-speedtest-cli_2.1.3.bb     |   6 +-
 ...rsion-to-fix-NanoSVG-issues-with-Pyt.patch | 861 ++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.1.1.bb    |   1 +
 26 files changed, 927 insertions(+), 404 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.3.bb => mariadb-native_10.7.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.3.bb => mariadb_10.7.4.bb} (100%)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.2.bb => postgresql_14.3.bb} (80%)
 rename meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.6.bb} (99%)
 create mode 100644 meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
 rename meta-oe/recipes-support/devmem2/{devmem2.bb => devmem2_2.0.bb} (40%)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch

-- 
2.25.1


