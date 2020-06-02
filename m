Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4015.1591074292898216598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 22:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,462,1583164800"; 
   d="scan'208";a="93633021"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Jun 2020 13:04:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 19D3F4BCC8B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2020 13:04:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Jun 2020 13:04:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] proj: upgrade 7.0.0 -> 7.0.1
Date: Wed, 3 Jun 2020 01:04:39 +0800
Message-ID: <1591117479-29549-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 19D3F4BCC8B4.A33E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-Added md5 verification.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-navigation/proj/{proj_7.0.0.bb => proj_7.0.1.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_7.0.0.bb => proj_7.0.1.bb} (75%)

diff --git a/meta-oe/recipes-navigation/proj/proj_7.0.0.bb b/meta-oe/recipes-navigation/proj/proj_7.0.1.bb
similarity index 75%
rename from meta-oe/recipes-navigation/proj/proj_7.0.0.bb
rename to meta-oe/recipes-navigation/proj/proj_7.0.1.bb
index 44674244e..2cfaa7121 100644
--- a/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_7.0.1.bb
@@ -6,7 +6,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ee0e14c1bd2f9429b1a28999240304c0342ed739ebaea3d4ff44c585b1097be8"
+
+SRC_URI[md5sum] = "5ba7536b579a6c9e0ad822dbdd455985"
+SRC_URI[sha256sum] = "a7026d39c9c80d51565cfc4b33d22631c11e491004e19020b3ff5a0791e1779f"
 
 DEPENDS = "sqlite3 sqlite3-native tiff"
 
-- 
2.17.1



