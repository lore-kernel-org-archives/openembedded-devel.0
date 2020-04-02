Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5281.1585791944865717481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363704"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:45:44 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AB732406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:35:21 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:45:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:45:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.4.0 -> 1.4.2
Date: Thu, 2 Apr 2020 02:15:30 -0700
Message-ID: <1585818933-28648-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: AB732406AB15.A15C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-alembic_1.4.0.bb => python3-alembic_1.4.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.4.0.bb => python3-alembic_1.4.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
index 8247166da..22630604b 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "758b28361557e45c79c454d662131a83"
-SRC_URI[sha256sum] = "2df2519a5b002f881517693b95626905a39c5faf4b5a1f94de4f1441095d1d26"
+SRC_URI[md5sum] = "1d67bdbd3abd33f0319afcd29bc59686"
+SRC_URI[sha256sum] = "035ab00497217628bf5d0be82d664d8713ab13d37b630084da8e1f98facf4dbf"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1



