Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9315.1604037013528551179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749826"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:50:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 77EE24CE34D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:50:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:50:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libkcapi: upgrade 1.2.0 -> 1.2.1
Date: Fri, 30 Oct 2020 13:50:08 +0800
Message-ID: <1604037008-71343-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 77EE24CE34D2.A2520
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libkcapi/{libkcapi_1.2.0.bb => libkcapi_1.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.2.0.bb => libkcapi_1.2.1.bb} (94%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
similarity index 94%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index b478e4c58..7de64fa0f 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c78be93ed8d1637f2a3f4a83ff9d5f54"
 DEPENDS = "libtool"
 
 S = "${WORKDIR}/git"
-SRCREV = "8397f0f7c45264a3b9aff5a1f9119df25eeb4c60"
+SRCREV = "d41284525ec8960e9a828979cfe269012b7df8db"
 SRC_URI = "git://github.com/smuellerDD/libkcapi.git"
 
 inherit autotools
-- 
2.25.1



