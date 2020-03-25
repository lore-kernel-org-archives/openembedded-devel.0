Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.3456.1585100584041451872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87205983"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B5A949DF136
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 09:33:00 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:08 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lapack: upgrade 3.8.0 -> 3.9.0
Date: Tue, 24 Mar 2020 23:47:17 -0700
Message-ID: <1585118838-33916-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7B5A949DF136.A4CAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../lapack/{lapack_3.8.0.bb => lapack_3.9.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.8.0.bb => lapack_3.9.0.bb} (75%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
similarity index 75%
rename from meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
index 7544744b3..56c01c533 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
 
 DEPENDS = "libgfortran"
 
-SRC_URI = "http://www.netlib.org/lapack/lapack-${PV}.tar.gz"
-SRC_URI[md5sum] = "96591affdbf58c450d45c1daa540dbd2"
-SRC_URI[sha256sum] = "deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6"
+SRC_URI = "https://github.com/Reference-LAPACK/lapack/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "0b251e2a8d5f949f99b50dd5e2200ee2"
+SRC_URI[sha256sum] = "106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
 OECMAKE_GENERATOR = "Unix Makefiles"
-- 
2.17.1



