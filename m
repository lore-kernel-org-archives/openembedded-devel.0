Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.4768.1603432812584168192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 23:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435533"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 14:00:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BC402486A854
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 14:00:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 14:00:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.13.0 -> 3.13.0.1
Date: Fri, 23 Oct 2020 14:00:19 +0800
Message-ID: <1603432819-100656-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BC402486A854.AEE6F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../protobuf/{protobuf_3.13.0.bb => protobuf_3.13.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.13.0.bb => protobuf_3.13.0.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb
index f2c5e2bee6..8c349db4d0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a"
+SRCREV = "d1eca4e4b421cd2997495c4b4e65cea6be4e9b8a"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
-- 
2.25.1



