Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5489.1600305926726256742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331810"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:25:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EE66748990C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 09:25:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:25:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] znc: upgrade 1.8.1 -> 1.8.2
Date: Thu, 17 Sep 2020 21:25:22 +0800
Message-ID: <1600349122-4710-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EE66748990C1.A1F7A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-irc/znc/{znc_1.8.1.bb => znc_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.8.1.bb => znc_1.8.2.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.8.1.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.8.1.bb
rename to meta-networking/recipes-irc/znc/znc_1.8.2.bb
index c54e617fde..806d622d70 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.1.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "openssl zlib icu"
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "0a3909beaa15e0da499473d6d041e5b75c14e885"
+SRCREV_znc = "bf253640d33d03331310778e001fb6f5aba2989e"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
-- 
2.25.1



