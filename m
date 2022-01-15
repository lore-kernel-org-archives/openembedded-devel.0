Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9510AC433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:27:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.7842.1642256877948007335
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nIonch/z;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id f13so5347356plg.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zc9Cz4nYld6I+Ltn58WotZ1HxmWSpjj5v5ZooLQz/Mc=;
        b=nIonch/zSyXatxEwDxB/arhwvWBZm4JJbEw2LKRoxT5+lBUZzg2f5xJkRFe53xJI86
         VkEItHeK3HLOOaQ476b0sM35hyJBrFxARmHrh5ZhUUhRX4rFQk/rO1m9mwv0+R72kLSK
         7VwV6tJXsr35kvS83pq/OLxlXyS+Bl8aTg1sUsbLXAapQd7CilSx9L09SiNu/rLQtSEM
         Kjne5Eyh5ta9vdGNZ4ZIsJM7UTWdHm9/sczp8JGJSdElIpmUSPN7iQGoMEdIiOQo1yVG
         8++e7PxO2PnmH59HbgBN4f+5ooCDX1YU7utqeh9f3pD9JXEOuvuD/zppdBfYwuD8gvQx
         SnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zc9Cz4nYld6I+Ltn58WotZ1HxmWSpjj5v5ZooLQz/Mc=;
        b=ySxaWNoaOPitCauMPRz5YXl4qLh0pT1JAJ9pDmxPXi3V3GE7O6KNoB8xHpe777WaAK
         hmRyfK3PHlJCSk2bAClrVh8Dg9vKHxfeTSOlaAwG+oFlN1dvWvSavcqeGjImIajIKM1v
         X8ETqHL8LmU5AMr+3pK0s+cwvCEm5Eu+xj1hSDhDkKLubfRL5jum5mhtKWeJ+Dce/+xn
         xZnCrJWHHBqfnXGoqOzZZLzx0JndIlToBy4e9EnDWVxNUC6SeLlgZHl8rMOBtAfScOHw
         4vCZExNLpETKkcUKnvx7CW4vKWAmS6RKaTOJTxRbu5Nu53vydl9Or3yi6zCjDx4Op8W0
         Pqhw==
X-Gm-Message-State: AOAM531PW8v4uDKg2HpuHYZUHa/AStmQDbEl15XWevJHY4SVTCo/zkP0
	BNupEVyXkWPfe8urHYqpop/XrjV5RCJvfw==
X-Google-Smtp-Source: 
 ABdhPJybJVbRd+STn2WgOhXM6uiLSrem0BqYFg3UZE5XWZNh01YuKUjhtU4Q9MP6YFf6iOY5zLlVDA==
X-Received: by 2002:a17:90a:e50a:: with SMTP id
 t10mr25296274pjy.186.1642256877167;
        Sat, 15 Jan 2022 06:27:57 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.27.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:27:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/11] Patch review: Jan 15th
Date: Sat, 15 Jan 2022 06:27:43 -0800
Message-Id: <cover.1642256648.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94859

Please have comments back by Monday

The following changes since commit 4932616b69b957e3a876541a579b79cb3f83306f:

  sdbus-c++-libsystemd: Avoid hard dependency on rsync (2021-11-18 08:05:44 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Armin Kuster (1):
  wireshark: update to latest stable 3.4.11

Changqing Li (2):
  syslog-ng: adjust control socket location
  redis: add back missing patch

Chen Qi (1):
  udisks2: upgrade from 2.9.2 to 2.9.4

Jeremy Puhlman (1):
  ifenslave: Add branch=main

Mingli Yu (1):
  libteam: switch to python3

Peter Kjellerstedt (1):
  googletest: Switch branch from master to main

Sakib Sajal (1):
  nss: fix CVE-2021-43527

Yi Zhao (2):
  postfix: fix build with glibc 2.34
  postfix: upgrade 3.4.12 -> 3.4.23

wangmy (1):
  apache2: upgrade 2.4.51 -> 2.4.52

 .../0001-fix-build-with-glibc-2.34.patch      |  46 +++
 .../{postfix_3.4.12.bb => postfix_3.4.23.bb}  |   5 +-
 .../ifenslave/ifenslave_2.11.bb               |   2 +-
 .../0004-lemon-Remove-line-directives.patch   |  15 +-
 ...wireshark_3.4.8.bb => wireshark_3.4.11.bb} |   2 +-
 meta-oe/recipes-extended/redis/redis_6.2.6.bb |   4 +
 ...team_basic_test.py-switch-to-python3.patch | 101 ++++++
 ...asic_test.py-use-python3-interpreter.patch |  28 --
 .../recipes-support/libteam/libteam_1.31.bb   |   2 +-
 ...re-DER-encoded-signatures-are-within.patch | 297 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.64.bb       |   1 +
 ...log-ng.service-the-syslog-ng-service.patch |   2 +-
 .../{udisks2_2.9.2.bb => udisks2_2.9.4.bb}    |   4 +-
 .../recipes-test/googletest/googletest_git.bb |   2 +-
 .../{apache2_2.4.51.bb => apache2_2.4.52.bb}  |   2 +-
 15 files changed, 466 insertions(+), 47 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-fix-build-with-glibc-2.34.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb} (75%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.8.bb => wireshark_3.4.11.bb} (97%)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch
 delete mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1737470-Ensure-DER-encoded-signatures-are-within.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb => apache2_2.4.52.bb} (99%)

-- 
2.25.1


