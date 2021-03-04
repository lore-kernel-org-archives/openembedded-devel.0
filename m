Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4116.1614848449497914472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 01:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105154197"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 17:00:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 13A974CE931C
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 17:00:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 17:00:32 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] sigrok-cli: upgrade 0.7.1 -> 0.7.2
Date: Thu, 4 Mar 2021 17:00:24 +0800
Message-ID: <1614848424-105769-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 13A974CE931C.A6667
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../sigrok/{sigrok-cli_0.7.1.bb => sigrok-cli_0.7.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/sigrok/{sigrok-cli_0.7.1.bb => sigrok-cli_0.7.2.bb} (78%)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
similarity index 78%
rename from meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
rename to meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
index 369e2f6f4a..4fd516bc2b 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
@@ -13,7 +13,7 @@ PACKAGECONFIG ??= "decode"
 inherit autotools pkgconfig mime-xdg
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
-SRC_URI[md5sum] = "3f45ce664bad529d8b3f78a61b017d75"
-SRC_URI[sha256sum] = "f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797"
+SRC_URI[md5sum] = "856fd496cd99d1091aa128405c522a36"
+SRC_URI[sha256sum] = "71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8"
 
 FILES_${PN} += "${datadir}/icons/hicolor"
-- 
2.25.1



