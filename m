Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.1676.1595577472319949353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 00:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; 
   d="scan'208";a="96848095"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 15:57:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 094DC4CE506F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 15:57:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 15:57:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.1.8 -> 4.2.0
Date: Fri, 24 Jul 2020 15:57:38 +0800
Message-ID: <1595577459-84025-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 094DC4CE506F.A4883
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ser2net/{ser2net_4.1.8.bb => ser2net_4.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.8.bb => ser2net_4.2.0.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb
index 4a91fa4f4d..13794ad9d5 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5f51a72"
+SRC_URI[sha256sum] = "1d895f005896e8c5bcff4fe573e2fec3611bf4feee1247857e476b74323d916c"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1



