Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.6229.1611305380339221993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103733270"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 16:49:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9724B4CE6782
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 16:49:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 16:49:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.27.1 -> 5.27.2
Date: Sat, 23 Jan 2021 04:49:36 +0800
Message-ID: <1611348576-4776-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9724B4CE6782.A12BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../monit/{monit_5.27.1.bb => monit_5.27.2.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_5.27.1.bb => monit_5.27.2.bb} (91%)

diff --git a/meta-oe/recipes-support/monit/monit_5.27.1.bb b/meta-oe/recipes-support/monit/monit_5.27.2.bb
similarity index 91%
rename from meta-oe/recipes-support/monit/monit_5.27.1.bb
rename to meta-oe/recipes-support/monit/monit_5.27.2.bb
index 0a1442fc78..b5e16d0f97 100644
--- a/meta-oe/recipes-support/monit/monit_5.27.1.bb
+++ b/meta-oe/recipes-support/monit/monit_5.27.2.bb
@@ -15,8 +15,8 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[md5sum] = "200068f37847e3402f6a9b061c2d327e"
-SRC_URI[sha256sum] = "f57408d16185687513a3c4eb3f2bb72eef76331ac16210e9652e846e5c84ed51"
+SRC_URI[md5sum] = "13a0804dae18ef08198c3ace72f9dd60"
+SRC_URI[sha256sum] = "d8809c78d5dc1ed7a7ba32a5a55c5114855132cc4da4805f8d3aaf8cf46eaa4c"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1



