Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.6924.1608278956962391132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708819"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:09:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9D40F4CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:09:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:09:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] pugixml: upgrade 1.11 -> 1.11.2
Date: Fri, 18 Dec 2020 16:09:04 +0800
Message-ID: <1608278944-111655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9D40F4CE600B.A71D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../pugixml/{pugixml_1.11.bb => pugixml_1.11.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.11.bb => pugixml_1.11.2.bb} (85%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb
similarity index 85%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb
index b5e63cd35..09abbd9c3 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb
@@ -10,8 +10,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d5ee91fb74cbb64223b3693fd64eb169"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "93540f4644fd4e4b02049554ef37fb90"
-SRC_URI[sha256sum] = "26913d3e63b9c07431401cf826df17ed832a20d19333d043991e611d23beaa2c"
+SRC_URI[md5sum] = "2d0be30b843eb9d1893c1ba9ad334946"
+SRC_URI[sha256sum] = "599eabdf8976aad86ac092a198920d8c127623d1376842bc6d683b12a37fb74f"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 
-- 
2.25.1



