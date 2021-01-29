Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6806.1611909825383850247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103979235"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:43:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9319A4CE6019
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:43:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:43:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.8.2 -> 3.8.3
Date: Sat, 30 Jan 2021 04:43:36 +0800
Message-ID: <1611953016-5000-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9319A4CE6019.A2EE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../sanlock/{sanlock_3.8.2.bb => sanlock_3.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.2.bb => sanlock_3.8.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb
index 6f3685c4b..e8b2e3721 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.3.bb
@@ -16,7 +16,7 @@ PV .= "+git${SRCPV}"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "01b727adf1ce3c0ed5b95299d60f62bc66d98eb5"
+SRCREV = "3a750fed849405c745dcb7b4ceb85f662c53d8d0"
 
 S = "${WORKDIR}/git/python"
 
-- 
2.25.1



