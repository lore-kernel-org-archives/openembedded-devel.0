Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.32094.1595221936846428398
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2020 22:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96599414"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 13:12:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 976204CE5463
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 13:12:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 13:12:12 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.9.1 -> 1.9.2
Date: Mon, 20 Jul 2020 13:12:06 +0800
Message-ID: <1595221926-52482-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 976204CE5463.A3B45
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../babeld/{babeld_1.9.1.bb => babeld_1.9.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.9.1.bb => babeld_1.9.2.bb} (94%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb b/meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb
similarity index 94%
rename from meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb
index 6dd15ad9fc..a7d7fc81ff 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.9.1.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
-SRCREV = "0835d5d894ea016ab7b81562466cade2c51a12d4"
+SRCREV = "a1043879225ac205614259b480d7f577025d8bb0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



