Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2451.1610071902070403630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103293264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 10:11:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 85CFA4CE602D
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Jan 2021 10:11:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 10:11:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cpprest: upgrade 2.10.16 -> 2.10.17
Date: Fri, 8 Jan 2021 22:11:25 +0800
Message-ID: <1610115085-4840-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 85CFA4CE602D.A321C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cpprest/{cpprest_2.10.16.bb => cpprest_2.10.17.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.16.bb => cpprest_2.10.17.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb
index 5d7dbd8bda..c16e893299 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.16
-SRCREV= "18212a2a7967e12d740bfb957e500892b3463c88"
+# tag 2.10.17
+SRCREV= "41e7d0074b6cb5b22c89f835b4531d848ab66987"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



