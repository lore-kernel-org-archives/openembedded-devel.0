Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8879.1607049871951720401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,391,1599494400"; 
   d="scan'208";a="102047746"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:44:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A84244CE5CF8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:44:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:44:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] pugixml: upgrade 1.10 -> 1.11
Date: Fri, 4 Dec 2020 10:44:25 +0800
Message-ID: <1607049865-63397-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A84244CE5CF8.A4D77
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../pugixml/{pugixml_1.10.bb => pugixml_1.11.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.10.bb => pugixml_1.11.bb} (85%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb
similarity index 85%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb
index 6f624910b..b5e63cd35 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.bb
@@ -10,8 +10,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d5ee91fb74cbb64223b3693fd64eb169"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "f97237e9908201c6d8536210747b66af"
-SRC_URI[sha256sum] = "55f399fbb470942410d348584dc953bcaec926415d3462f471ef350f29b5870a"
+SRC_URI[md5sum] = "93540f4644fd4e4b02049554ef37fb90"
+SRC_URI[sha256sum] = "26913d3e63b9c07431401cf826df17ed832a20d19333d043991e611d23beaa2c"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 
-- 
2.25.1



