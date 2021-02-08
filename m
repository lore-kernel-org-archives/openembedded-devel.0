Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.29673.1612748305574020921
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 17:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; 
   d="scan'208";a="104306418"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 09:38:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 35D444CE6786
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Feb 2021 09:38:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 09:38:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cpprest: upgrade 2.10.17 -> 2.10.18
Date: Mon, 8 Feb 2021 21:38:10 +0800
Message-ID: <1612791490-6915-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 35D444CE6786.A2CFB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

cpprestsdk (2.10.18)
* PR#1571 Add ability to parse and emit the NT Epoch 1601-01-01T00:00:00Z
* PR#1571 Update vcpkg submodule
* Update CI configuration
-- cpprestsdk team MON, 1 Feb 2021 20:02:00 -0700

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cpprest/{cpprest_2.10.17.bb => cpprest_2.10.18.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.17.bb => cpprest_2.10.18.bb} (93%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
similarity index 93%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
index c16e89329..1633412cf 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.17.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-outside-tests.patch "
 
 # tag 2.10.17
-SRCREV= "41e7d0074b6cb5b22c89f835b4531d848ab66987"
+SRCREV= "122d09549201da5383321d870bed45ecb9e168c5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



