Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.20671.1605842984465246543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 19:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; 
   d="scan'208";a="101571027"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 11:29:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8203C4CE5447
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 11:29:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 11:29:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.13.0.1 -> 3.14.0
Date: Fri, 20 Nov 2020 21:10:46 +0800
Message-ID: <1605877846-34948-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8203C4CE5447.A19E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../protobuf/{protobuf_3.13.0.1.bb => protobuf_3.14.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.13.0.1.bb => protobuf_3.14.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
index 8c349db4d..31e3bcc5b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "d1eca4e4b421cd2997495c4b4e65cea6be4e9b8a"
+SRCREV = "2514f0bd7da7e2af1bed4c5d1b84f031c4d12c10"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
-- 
2.25.1



