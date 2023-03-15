Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E404C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 12:01:40 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by mx.groups.io with SMTP id smtpd.web10.5979.1678881696799134210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.133, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VdwE9P3_1678881687;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VdwE9P3_1678881687)
          by smtp.aliyun-inc.com;
          Wed, 15 Mar 2023 20:01:33 +0800
From: cp0613@linux.alibaba.com
To: openembedded-devel@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-perl][PATCH] meta-perl-base:fix SUMMARY
Date: Wed, 15 Mar 2023 20:01:16 +0800
Message-Id: <20230315120116.250-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 12:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101534

From: Chen Pei <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 meta-perl/recipes-perl/images/meta-perl-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/images/meta-perl-base.bb b/meta-perl/recipes-perl/images/meta-perl-base.bb
index ec671020d..2af10b218 100644
--- a/meta-perl/recipes-perl/images/meta-perl-base.bb
+++ b/meta-perl/recipes-perl/images/meta-perl-base.bb
@@ -1,4 +1,4 @@
-SUMMARY = "meta-per build test image"
+SUMMARY = "meta-perl build test image"
 
 IMAGE_INSTALL = "packagegroup-core-boot"
 
-- 
2.25.1


