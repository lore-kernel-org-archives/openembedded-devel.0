Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4369.1606789071263078408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914061"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:17:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F7C04CE6006
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:17:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:17:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.26.0 -> 5.27.1
Date: Tue, 1 Dec 2020 10:17:44 +0800
Message-ID: <1606789064-56678-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6F7C04CE6006.A710B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../monit/{monit_5.26.0.bb => monit_5.27.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_5.26.0.bb => monit_5.27.1.bb} (91%)

diff --git a/meta-oe/recipes-support/monit/monit_5.26.0.bb b/meta-oe/recipes-support/monit/monit_5.27.1.bb
similarity index 91%
rename from meta-oe/recipes-support/monit/monit_5.26.0.bb
rename to meta-oe/recipes-support/monit/monit_5.27.1.bb
index a954682d6..0a1442fc7 100644
--- a/meta-oe/recipes-support/monit/monit_5.26.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.27.1.bb
@@ -15,8 +15,8 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[md5sum] = "9f7dc65e902c103e4c5891354994c3df"
-SRC_URI[sha256sum] = "87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2"
+SRC_URI[md5sum] = "200068f37847e3402f6a9b061c2d327e"
+SRC_URI[sha256sum] = "f57408d16185687513a3c4eb3f2bb72eef76331ac16210e9652e846e5c84ed51"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1



