Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6499.1608276135984858312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102706971"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:22:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4B8DF4CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:22:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:22:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dumb-init: upgrade 1.2.2 -> 1.2.5
Date: Sat, 19 Dec 2020 03:22:11 +0800
Message-ID: <1608319331-4756-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4B8DF4CE600B.A3248
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dumb-init/{dumb-init_1.2.2.bb => dumb-init_1.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dumb-init/{dumb-init_1.2.2.bb => dumb-init_1.2.5.bb} (89%)

diff --git a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
similarity index 89%
rename from meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb
rename to meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
index 09eab9dcd..d88775f9d 100644
--- a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb
+++ b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Yelp/dumb-init/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5940d39995ea6857d01b8227109c2e9c"
 
-SRCREV = "b1e978e486114797347deefcc03ab12629a13cc3"
+SRCREV = "89c1502b9d40b5cb4a844498b14d74ba1dd559bf"
 SRC_URI = "git://github.com/Yelp/dumb-init"
 S = "${WORKDIR}/git"
 
-- 
2.25.1



