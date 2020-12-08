Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.5344.1607412933356935876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 23:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102169940"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 15:35:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B8D5E4CE6011
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Dec 2020 15:35:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 15:35:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] ser2net: 4.2.0 -> 4.3.0
Date: Tue, 8 Dec 2020 15:35:12 +0800
Message-ID: <1607412912-2573-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B8D5E4CE6011.A2BBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ser2net/{ser2net_4.2.0.bb => ser2net_4.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.2.0.bb => ser2net_4.3.0.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb
index 13794ad9d..6293d1229 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1d895f005896e8c5bcff4fe573e2fec3611bf4feee1247857e476b74323d916c"
+SRC_URI[sha256sum] = "5e407d684d0aa0919ddd15af368f890c5940cddd6034b7efc363823f38f6ff0c"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1



