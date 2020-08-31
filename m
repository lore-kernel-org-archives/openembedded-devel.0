Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.47061.1598850329819073706
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,374,1592841600"; 
   d="scan'208";a="98722346"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Aug 2020 13:05:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8253348990D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 13:05:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 13:05:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 4.4.0 -> 4.5.0
Date: Tue, 1 Sep 2020 01:05:16 +0800
Message-ID: <1598893516-71706-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8253348990D9.AFA9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wolfssl/{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
index db7b0d486..70e13f1e6 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "e116c89a58af750421d82ece13f80516d2bde02e"
+SRCREV = "0fa5af9929ce2ee99e8789996a3048f41a99830e"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1



