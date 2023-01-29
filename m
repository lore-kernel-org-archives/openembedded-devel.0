Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A782C61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.25477.1675026042996005470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRTXVUU4;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id i9so8574434oif.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0EhlGCGt3PDAP7bDoEMZi6PQ1irJi46vWSUEybSSOA=;
        b=kRTXVUU4l9wciahhBgzpTVLDKHgaZecveXQgUXPikFTQgAZYNg6BTcnFQYVq/4OQzp
         oSnvAJxzM+yaXn4GqYKV90cT+qhajeEHPe5auQmPTEDSAuqeOY7LZj3/jKJ/0NXp5Puq
         UExOccQ1YOnK9ppV1xtWS2Z07u545Itv+iUahBkqL532Nm38XnRXmUIRTKRfWVaWOUJZ
         pDKnwKPHfcMVBfybuM1MOIVbP+PbKoACok0AFzLeRIZRsNAwGk9wbM8qL6E8Ejb4BRdb
         +0mIAkdwnrN7xGOc9LbBYFd7M9SC/ds5YuePsNA5jnJ7WTQ4hqePYTryC1cefznfzaxM
         8lDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0EhlGCGt3PDAP7bDoEMZi6PQ1irJi46vWSUEybSSOA=;
        b=wKDStFmu+mkLQt0h/8ZhbNlbxZBmye974pecMOEAMAlWx6GJ/WIeuxjxZKujpPQDjt
         o3F3Fl7T7NBg+gFlrSX4fpHDqWyHLp5OQ50AACTkkYZNpniSVa1efyfuAk69VqslC1nq
         UXrTHQFYSGzxe+JJL1Daps/AT4Ik7h98bZcgUtin5xWPFFI2CyS1/3fwBRHXMoQbL0lt
         ppfPsh8xKXsnoqoaRLibhcs4e2oBcv1KnksyDa7ktivvumNBS5cwLGM0kQxHNLIccEB5
         SOX4DG4O/7KxWVo7EbJ+11BQE8tyIhgA+t4wdIBU57EX7HX+SK5jfWJrFpSWqA982Mnt
         nE6w==
X-Gm-Message-State: AFqh2krBnUPTfCXRPgeqaeybfvdgKa8Lad9Nj9P4ZEimmaMaSpfayKa8
	yiyuWqZwl9Wnarzst8HbYp7HSi46g2c=
X-Google-Smtp-Source: AMrXdXus+dKg3Ll0zclXPVyQDHaB2T+hYyEoe7quQMQwBcjQ7mUdcMbdaEQz8FV8acfoSgIKZxxG9g==
X-Received: by 2002:a05:6808:2084:b0:36e:f318:c401 with SMTP id s4-20020a056808208400b0036ef318c401mr14224476oiw.3.1675026041730;
        Sun, 29 Jan 2023 13:00:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/10] Patch review 
Date: Sun, 29 Jan 2023 16:00:28 -0500
Message-Id: <cover.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100834

Please have comments back by Tuesday

The following changes since commit 29a2410f75a483bbaa5520aa2cdc24aba3b726b6:

  postfix: upgrade 3.6.5 -> 3.6.7 (2023-01-12 11:06:02 -0500)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Andrej Valek (1):
  grpc: upgrade 1.45.2 -> 1.46.6

Changqing Li (3):
  redis: 6.2.7 -> 6.2.8
  redis: upgrade 7.0.4 to 7.0.5
  redis: 7.0.5 -> 7.0.7

Chee Yang Lee (1):
  zsh: Fix CVE-2021-45444

Hermes Zhang (1):
  kernel_add_regdb: Change the task order

Hitendra Prajapati (2):
  net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
  krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing

Niko Mauno (2):
  nftables: Fix missing leading whitespace with ':append'
  Fix missing leading whitespace with ':append'

 .../classes/kernel_wireless_regdb.bbclass     |   2 +-
 .../recipes-filter/nftables/nftables_1.0.2.bb |   2 +-
 .../CVE-2022-44792-CVE-2022-44793.patch       | 116 +++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   1 +
 .../krb5/krb5/CVE-2022-42898.patch            | 110 ++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 .../recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb   |   2 +-
 .../fsverity-utils/fsverity-utils_1.5.bb      |   2 +-
 .../grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb}   |   4 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |  20 +--
 ...006-Define-correct-gregs-for-RISCV32.patch |  15 +-
 .../redis/{redis_6.2.7.bb => redis_6.2.8.bb}  |   2 +-
 .../redis/{redis_7.0.4.bb => redis_7.0.7.bb}  |   2 +-
 .../zsh/zsh/CVE-2021-45444_1.patch            |  60 ++++++++
 .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ++++++++++++++++++
 .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ++++++++++
 meta-oe/recipes-shells/zsh/zsh_5.8.bb         |   6 +-
 17 files changed, 538 insertions(+), 24 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb} (97%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} (96%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.7.bb} (96%)
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch

-- 
2.25.1


