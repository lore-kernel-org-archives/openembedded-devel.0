Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2577.1590024612793163689
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 18:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,416,1583164800"; 
   d="scan'208";a="92669735"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 May 2020 09:30:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id ACF814CE2E6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 09:30:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 May 2020 09:30:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python][PATCH] python3-pycparser: upgrade 2.19 -> 2.20
Date: Thu, 21 May 2020 18:30:06 +0800
Message-ID: <1590057006-40833-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: ACF814CE2E6A.A4375
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
index 35ed93e09b..2a5f414b2f 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
 
-SRC_URI[md5sum] = "76396762adc3fa769c83d8e202d36b6f"
-SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3"
+SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
+SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
 
 inherit pypi setuptools3
 
-- 
2.17.1



