Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6230.1590114214240554462
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 19:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,419,1583164800"; 
   d="scan'208";a="92764270"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 10:23:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AA5D04BCC8A9
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 10:23:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 10:23:28 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] kea: upgrade 1.7.6 -> 1.7.7
Date: Fri, 22 May 2020 19:23:07 +0800
Message-ID: <1590146587-3670-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AA5D04BCC8A9.A8295
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
index 4e221c39ee..e25f8e6fb0 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "26f48997a37a670a406d5020ce64a7fb"
-SRC_URI[sha256sum] = "1da3d50e0c8e92e1aa6d66100b5afd7b93ba2c50b0a4ea114fd9dcb8be982ca9"
+SRC_URI[md5sum] = "4f8d1251fd41ef2e822a4eb3f0797d46"
+SRC_URI[sha256sum] = "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a9338f1932bc38dcf866"
 
 inherit autotools systemd
 
-- 
2.17.1



