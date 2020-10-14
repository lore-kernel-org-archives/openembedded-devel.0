Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8082.1602668050828869771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 02:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,374,1596470400"; 
   d="scan'208";a="100151222"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 17:34:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A3A3E48990EB
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 17:34:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 17:34:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] linuxptp: upgrade 3.0 -> 3.1
Date: Wed, 14 Oct 2020 17:34:05 +0800
Message-ID: <1602668045-125103-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A3A3E48990EB.A29B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../linuxptp/{linuxptp_3.0.bb => linuxptp_3.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_3.0.bb => linuxptp_3.1.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
index 1472a671a7..c8527260b2 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.
            file://Use-cross-cpp-in-incdefs.patch \
            "
 
-SRC_URI[md5sum] = "1318805702eb6d59f9f247e1dd5ce12a"
-SRC_URI[sha256sum] = "d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785"
+SRC_URI[md5sum] = "2264cb69c9af947028835c12c89a7572"
+SRC_URI[sha256sum] = "f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
 
-- 
2.25.1



