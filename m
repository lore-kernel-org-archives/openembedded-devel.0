Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.13817.1606443590750694729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101801452"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:19:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EECF24CE5CDD
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:19:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:19:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] pkcs11-helper: upgrade 1.26 -> 1.27
Date: Fri, 27 Nov 2020 10:19:46 +0800
Message-ID: <1606443586-118116-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EECF24CE5CDD.A7441
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{pkcs11-helper_1.26.bb => pkcs11-helper_1.27.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.26.bb => pkcs11-helper_1.27.bb} (94%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.26.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
similarity index 94%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.26.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
index 9b6e7ccbe..a7365f193 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.26.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = "git://github.com/OpenSC/${BPN}.git"
 
 S = "${WORKDIR}/git"
-# v1.26
-SRCREV = "c7a0cfa08ddc75d963a835d3588170af0e5f1115"
+# v1.27
+SRCREV = "564a582d600c7eec7b8e303a22b575fd52622174"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



