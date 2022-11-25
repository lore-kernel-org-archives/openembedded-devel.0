Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ECAC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 07:51:06 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by mx.groups.io with SMTP id smtpd.web10.42359.1669362658097640668
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 23:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.57, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VVeNt-i_1669362650;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VVeNt-i_1669362650)
          by smtp.aliyun-inc.com;
          Fri, 25 Nov 2022 15:50:55 +0800
From: cp0613@linux.alibaba.com
To: openembedded-devel@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH] botan: upgrade 2.19.2 -> 2.19.3
Date: Fri, 25 Nov 2022 15:47:53 +0800
Message-Id: <20221125074752.1199-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 07:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99726

From: Chen Pei <cp0613@linux.alibaba.com>

Version 2.19.3, 2022-11-16
    CVE-2022-43705: A malicious OCSP responder could forge OCSP responses due to a 
    failure to validate that an embedded certificate was issued by the end-entity 
    issuing certificate authority.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_2.19.2.bb
rename to meta-oe/recipes-crypto/botan/botan_2.19.3.bb
index 5261367db..8d9d423ce 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75"
+SRC_URI[sha256sum] = "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


