Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.7193.1611313037259107431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103737235"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 18:57:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BD3B94CE6033
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 18:57:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 18:57:17 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.35 -> 0.36
Date: Fri, 22 Jan 2021 18:55:43 +0800
Message-ID: <1611312943-27646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: BD3B94CE6033.A6FCD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.35.bb => satyr_0.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.35.bb => satyr_0.36.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.35.bb b/meta-oe/recipes-support/satyr/satyr_0.36.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.35.bb
rename to meta-oe/recipes-support/satyr/satyr_0.36.bb
index c6159c42ba..b6988baa76 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.35.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.36.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "8690a1f83adc5a7a83e856ebc7adf6310bbd3b9f"
+SRCREV = "a1f232b7dbca7ff787076fcfb63ce7d7fb15b753"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1



