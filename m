Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.8210.1609726513847233244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150820"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:15:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B08284CE6783
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:15:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:15:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libmicrohttpd: upgrade 0.9.71 -> 0.9.72
Date: Mon, 4 Jan 2021 22:15:08 +0800
Message-ID: <1609769708-7396-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B08284CE6783.A0BBC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libmicrohttpd_0.9.71.bb => libmicrohttpd_0.9.72.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.71.bb => libmicrohttpd_0.9.72.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
index 2bd8148e3..24677386f 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
@@ -8,8 +8,8 @@ DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "c7e230e9b899282b43d9a9faa41e893d"
-SRC_URI[sha256sum] = "e8f445e85faf727b89e9f9590daea4473ae00ead38b237cf1eda55172b89b182"
+SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
+SRC_URI[sha256sum] = "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.25.1



