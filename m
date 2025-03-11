Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCA3C36005
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4165.1741683327904038513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R33lGo4x;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683328; x=1773219328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ef/+srLHZ3QScenvVxcMR1pzpiFfVW0zP2bKCTp3cAw=;
  b=R33lGo4xmxLIa+rGawMnlyJfDnMwLcnt3LYklSGi3AfGnyu/M5ihnR7o
   D0oxZGDe53zmaZspwJ76/9UxO8tcILeZO40E903pCU61jxbAf4Y3pqMaF
   CVvn0JMS9+yqoduE2XlB11mEt1AYTLAEaZVuJse3pmjr2T/CQtB1QCISz
   TwnZING1AqRDg6Cv3QfbkuALF4lt622W1G5CEuVg7Zhx4pwqvaW4le6ZR
   pU8oBuAPJXGEkOiWmqrisz4XTx5Hrr9xHjMtgGLBSM2mfLxts+ASCx/xp
   6vOgpMvWT5f8TFlZRKG2y8Y1EnrH+vK3V8ubeKPBhAszy+Uz9VOCrL/v9
   Q==;
X-CSE-ConnectionGUID: H89uARtDRgSY834+4jeINw==
X-CSE-MsgGUID: vn1fR2Z4Q6ywsOnCC73noA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192962864"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192962864"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DF64DC71B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C72CAD72B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 668D81A009B;
	Tue, 11 Mar 2025 16:55:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/36] libtinyxml2: upgrade 10.0.0 -> 10.1.0
Date: Tue, 11 Mar 2025 16:54:43 +0800
Message-Id: <1741683310-8681-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115861

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtinyxml2_10.0.0.bb => libtinyxml2_10.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_10.0.0.bb => libtinyxml2_10.1.0.bb} (94%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb
similarity index 94%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb
index 2ee43ebc03..6bea792a78 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 CVE_PRODUCT = "tinyxml2"
 
-SRCREV = "321ea883b7190d4e85cae5512a12e5eaa8f8731f"
+SRCREV = "57eea48c5bfc354ac45d53b2eb499e66c80d63e0"
 SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
            file://run-ptest"
 
-- 
2.43.0


