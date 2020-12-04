Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.8821.1607049202637271248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,390,1599494400"; 
   d="scan'208";a="102047329"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:33:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AD6FC4CE5CFB
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:33:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:33:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nanopb: upgrade 0.4.3 -> 0.4.4
Date: Fri, 4 Dec 2020 10:33:15 +0800
Message-ID: <1607049195-63067-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AD6FC4CE5CFB.A8237
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nanopb/{nanopb_0.4.3.bb => nanopb_0.4.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nanopb/{nanopb_0.4.3.bb => nanopb_0.4.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
rename to meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
index ed1a719fe..19db89bdc 100644
--- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
+++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 DEPENDS = "protobuf-native"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git"
-SRCREV = "1466e6f953835b191a7f5acf0c06c941d4cd33d9"
+SRCREV = "2b48a361786dfb1f63d229840217a93aae064667"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



