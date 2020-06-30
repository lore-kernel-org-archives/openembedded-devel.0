Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.5968.1593480446368729459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532616"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:27:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4BDC54CE4B19
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:16:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:27:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] librelp: upgrade 1.5.0 -> 1.6.0
Date: Tue, 30 Jun 2020 09:27:15 +0800
Message-ID: <1593480435-5012-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4BDC54CE4B19.A3985
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../rsyslog/{librelp_1.5.0.bb => librelp_1.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.5.0.bb => librelp_1.6.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb
index a4663148c..f3933f930 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
 "
 
-SRCREV = "0beb2258e12e4131dc31e261078ea53d18f787d7"
+SRCREV = "fe366f3770320cbe76bac7e84b26a48491d14531"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



