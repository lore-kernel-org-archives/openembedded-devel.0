Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8854.1607049903444227671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,391,1599494400"; 
   d="scan'208";a="102047788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:45:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 001604CE603D
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:45:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:45:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.31 -> 0.35
Date: Fri, 4 Dec 2020 10:44:59 +0800
Message-ID: <1607049899-63457-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 001604CE603D.AC4B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.31.bb => satyr_0.35.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.31.bb => satyr_0.35.bb} (92%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.31.bb b/meta-oe/recipes-support/satyr/satyr_0.35.bb
similarity index 92%
rename from meta-oe/recipes-support/satyr/satyr_0.31.bb
rename to meta-oe/recipes-support/satyr/satyr_0.35.bb
index e99f8ac6a..c6159c42b 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.31.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.35.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "79506592fa61fa10aa2e186158eecfa10b39e905"
+SRCREV = "8690a1f83adc5a7a83e856ebc7adf6310bbd3b9f"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -20,6 +20,7 @@ DEPENDS += " \
     gperf-native \
     json-c \
     nettle \
+    glib-2.0 \
 "
 
 PACKAGES += "python3-${BPN}"
-- 
2.25.1



