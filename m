Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C910DC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 11:01:46 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by mx.groups.io with SMTP id smtpd.web11.35730.1669028504436797980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 03:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.43, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VVKKO8c_1669028497;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VVKKO8c_1669028497)
          by smtp.aliyun-inc.com;
          Mon, 21 Nov 2022 19:01:42 +0800
From: cp0613@linux.alibaba.com
To: openembedded-devel@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH] suitesparse:fix git branch in SRC_URI
Date: Mon, 21 Nov 2022 19:00:28 +0800
Message-Id: <20221121110027.1610-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 11:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99676

From: Chen Pei <cp0613@linux.alibaba.com>

The master branch of suitesparse no longer exists and has been changed to stable.

See [YOCTO #14968] report it.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 38e34b93c..56cbfce20 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL-2.0-only & GPL-3.0-only & BSD-3-Clause & LGPL-2.0-only & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
-SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=master \
+SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=stable \
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
-- 
2.25.1


