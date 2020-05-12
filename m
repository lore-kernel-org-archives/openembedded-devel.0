Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4085.1589284285635750360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 04:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,383,1583164800"; 
   d="scan'208";a="91951091"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 19:51:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 100C350A997D
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 19:51:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 19:51:15 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] cpprest: upgrade 2.10.15 -> 2.10.16
Date: Wed, 13 May 2020 04:51:36 +0800
Message-ID: <1589316696-102232-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 100C350A997D.A4E19
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
index dee5ae2564..5d7dbd8bda 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.15
-SRCREV= "b94bc32ff84e815ba44c567f6fe4af5f5f6b3048"
+# tag 2.10.16
+SRCREV= "18212a2a7967e12d740bfb957e500892b3463c88"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



