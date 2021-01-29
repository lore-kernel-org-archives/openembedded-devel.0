Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6920.1611909587693084470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103979011"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:39:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B72684CE6798
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:39:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:39:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjson-perl: upgrade 4.02000 -> 4.03000
Date: Sat, 30 Jan 2021 04:39:44 +0800
Message-ID: <1611952784-4249-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B72684CE6798.A2DC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../perl/{libjson-perl_4.02000.bb => libjson-perl_4.03000.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libjson-perl_4.02000.bb => libjson-perl_4.03000.bb} (91%)

diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
similarity index 91%
rename from meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
rename to meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
index 4e5a8a6ff..4e7aeb128 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
@@ -11,7 +11,7 @@ DEPENDS += "perl"
 
 SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https"
 
-SRCREV = "42a6324df654e92419512cee80c0b49155d9e56d"
+SRCREV = "ebbae181c5e311fa80ee4c6379b598c7a6400570"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



