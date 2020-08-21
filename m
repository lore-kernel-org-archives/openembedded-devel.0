Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.130733.1598000867890893393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98384379"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:07:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 539F748990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 17:07:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:07:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.12.3 -> 3.13.0
Date: Sat, 22 Aug 2020 05:07:32 +0800
Message-ID: <1598044054-6555-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 539F748990D2.A2476
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../protobuf/{protobuf_3.12.3.bb => protobuf_3.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.12.3.bb => protobuf_3.13.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb
index 21ad7a460..f2c5e2bee 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.13.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "31ebe2ac71400344a5db91ffc13c4ddfb7589f92"
+SRCREV = "fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
-- 
2.25.1



