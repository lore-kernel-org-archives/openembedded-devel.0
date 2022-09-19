Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07626ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:48 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.19251.1663590824510365965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mbi2Uxiy;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id d15so20302390qka.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=7ANMFt38fJzGf8q99dOyp9HlvdOBEBPDcdPJxiIsNf0=;
        b=mbi2UxiyS9pZ5wpuIngUlUhJYqOL0PSbSglpUfTfIG3jUpa0tgXIcnwuz3AzbrI/2n
         qsiWkbG0IxSSrqSQOGzi2jCtMmZWwOFh6RsCBlpSP6Ek+kOmqUtrdrkqLYK2vCPLKOsJ
         sd41m7iUqJc9a0eYbdF4Q0m8AjU4TFac4nemskEzo9c6btCK8SdLytRE5Dy1QHxBDZRC
         MBEK7n8n54fpzb0sT2cfYs6YCjWrlWh708xJTEf9yHi/Ng0Z0PnBysPEwyYXg5C6emtX
         6wM8rY/H6+vnbSHFifn/joh0NMfIqUgcC3c85fPgdr47cNx+Bu87k6rRujyrHokIC5pg
         bUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=7ANMFt38fJzGf8q99dOyp9HlvdOBEBPDcdPJxiIsNf0=;
        b=pNNv5PqQORTZyghQg+ivIVJfMr18tTPNQwrPvb7U5jEDfL1MXU36k2fV6r5amjJtxV
         95d1luXMVXVodXl+Zd33KDRUwrRLvaRQOXEzTl0yyZh2Gy0TKdJ2m9Tr6WdczumsAcWW
         ul7KB1m7l4Ch2Biv/5pZl67hG+uhNNO9ZqBETLRX4oKZ5eFXh4+lynekHaq1n36NhXpe
         NJYMKfmFEqA48k9GDnGxe/wTwE1c8/3XxCeosPT7+SVOfBNJouJZCHBu3qXLS1Osp0Xv
         srfPoj/k+PXCgq87wlN3mkAs02cfGHq79+87FrEwbYbZxXvjTIq42raLMDpKZi49I7PL
         FZyA==
X-Gm-Message-State: ACrzQf0+VLZkqsBlEoGFIOlAm1emstS5lMo33W6SKn8C1t1y5ohosYbd
	pB6VG77TUxBX7uU2ll6nh+/z1/Xh0XM=
X-Google-Smtp-Source: 
 AMsMyM7jq7En+KIWe3XyBMsIxbq9iVo9QFjXzEgWqkAVIqgweD94o2CPBVk72Essllq6maUyMTALRA==
X-Received: by 2002:a37:897:0:b0:6cd:f5da:f1bc with SMTP id
 145-20020a370897000000b006cdf5daf1bcmr12424247qki.491.1663590823200;
        Mon, 19 Sep 2022 05:33:43 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/11] Patch review Sept 19th
Date: Mon, 19 Sep 2022 08:33:27 -0400
Message-Id: <cover.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98851

Please have comments back by Wednesday Sept 21st.

The following changes since commit 8f96c05f6d82fde052f2cb1652c13922814accb0:

  lmdb: only set SONAME on the shared library (2022-09-04 07:52:16 -0400)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Enrico Scholz (1):
  nodejs-oe-cache-native: initial checkin

Jose Quaresma (2):
  wireguard-module: 1.0.20210219 -> 1.0.20220627
  wireguard-tools: Add a new package for wg-quick

Khem Raj (3):
  ntpsec: Add -D_GNU_SOURCE and fix building with devtool
  gd: Fix build with clang-15
  safec: Remove unused variable 'len'

Mingli Yu (1):
  postgresql: make sure pam conf installed when pam enabled

Wang Mingyu (1):
  php: upgrade 8.1.8 -> 8.1.9

Yi Zhao (3):
  libldb: upgrade 2.3.3 -> 2.3.4
  samba: upgrade 4.14.13 -> 4.14.14
  samba: fix buildpaths issue

 ...orture-skip-test-case-tfork_cmd_send.patch |  38 ++++++
 .../{samba_4.14.13.bb => samba_4.14.14.bb}    |   3 +-
 ...19.bb => wireguard-module_1.0.20220627.bb} |   4 +-
 .../wireguard/wireguard-tools_1.0.20210914.bb |  14 ++-
 .../{libldb_2.3.3.bb => libldb_2.3.4.bb}      |   4 +-
 ...01-wscript-Widen-the-search-for-tags.patch |  29 +++++
 .../recipes-support/ntpsec/ntpsec_1.2.1.bb    |   6 +-
 ...strpbrk_s-Remove-unused-variable-len.patch |  42 +++++++
 meta-oe/recipes-core/safec/safec_3.7.1.bb     |   3 +-
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   2 +-
 .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache |  77 ++++++++++++
 .../nodejs/nodejs-oe-cache-native_16.14.bb    |  21 ++++
 .../php/{php_8.1.8.bb => php_8.1.9.bb}        |   2 +-
 ...1-Fix-deprecared-function-prototypes.patch | 115 ++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.3.bb        |   1 +
 15 files changed, 348 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.13.bb => samba_4.14.14.bb} (98%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} (85%)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb} (95%)
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
 create mode 100644 meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
 create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
 rename meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} (99%)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch

-- 
2.25.1


