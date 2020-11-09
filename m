Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5332.1604885232420839320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 17:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101066268"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 09:26:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 239FE48990E8
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 09:26:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 09:26:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fbgrab: upgrade 1.3.3 -> 1.4
Date: Mon, 9 Nov 2020 09:26:49 +0800
Message-ID: <1604885209-58567-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 239FE48990E8.A17DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/fbgrab/{fbgrab_1.3.3.bb => fbgrab_1.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.3.3.bb => fbgrab_1.4.bb} (89%)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
similarity index 89%
rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb
rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
index e3dff9191..a1294b98a 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "libpng zlib"
 SRC_URI = "git://github.com/GunnarMonell/fbgrab.git;protocol=https"
 
-SRCREV = "b179e2a42b8a5d72516b9c8d91713c9025cf6044"
+SRCREV = "74373aafc0b496e67642562d86eac6b858a31f24"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
2.25.1



