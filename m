Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6940.1614522626471235951
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 06:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,213,1610380800"; 
   d="scan'208";a="104951469"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2021 22:30:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A97D64CE76D1
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 22:30:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Feb 2021 22:30:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.2.1 -> 1.2.2
Date: Sun, 28 Feb 2021 22:30:15 +0800
Message-ID: <1614522615-90416-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A97D64CE76D1.A2E6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{redis-plus-plus_1.2.1.bb => redis-plus-plus_1.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.2.1.bb => redis-plus-plus_1.2.2.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
index 4059fd47e8..8b7a8d06e3 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "hiredis"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-SRCREV = "a9f9c301f8de1c181e6d45c573b5d1fe7b8200b1"
+SRCREV = "8ac506e6eb0e5c5b2625785b67400bde705773a1"
 SRC_URI = "git://github.com/sewenew/redis-plus-plus"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



