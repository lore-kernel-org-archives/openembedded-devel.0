Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1504.1590046522528645391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 00:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,416,1583164800"; 
   d="scan'208";a="92705679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 May 2020 15:35:15 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 619F94BCC8A6
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 15:35:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 May 2020 15:35:13 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] jansson: upgrade 2.12 -> 2.13.1
Date: Fri, 22 May 2020 00:35:11 +0800
Message-ID: <1590078911-3332-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 619F94BCC8A6.A3C5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../jansson/{jansson_2.12.bb => jansson_2.13.1.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb => jansson_2.13.1.bb} (60%)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
similarity index 60%
rename from meta-oe/recipes-extended/jansson/jansson_2.12.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
index f47fe5725c..d6e56ea768 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.12.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON d
 HOMEPAGE = "http://www.digip.org/jansson/"
 BUGTRACKER = "https://github.com/akheron/jansson/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fc2548c0eb83800f29330040e18b5a05"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 
 SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ed1f3a924604aae68067c214b0010ef"
-SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9"
+SRC_URI[md5sum] = "570af45b8203e95876d71fecd56cee20"
+SRC_URI[sha256sum] = "f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f"
 
 inherit autotools pkgconfig
 
-- 
2.17.1



