Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13753.1606442754937106947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800840"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:05:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3960C4CE5CDD
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:05:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:05:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 2.9 -> 3.0
Date: Fri, 27 Nov 2020 10:05:49 +0800
Message-ID: <1606442749-117420-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3960C4CE5CDD.A28AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_2.9.bb => weechat_3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_2.9.bb => weechat_3.0.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_2.9.bb b/meta-networking/recipes-irc/weechat/weechat_3.0.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_2.9.bb
rename to meta-networking/recipes-irc/weechat/weechat_3.0.bb
index 512ed0e49..6a0c9386c 100644
--- a/meta-networking/recipes-irc/weechat/weechat_2.9.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "eab406c385c3a10d0107ddc3aac6596ae8c59af99e9158c6d769e90ec9adfa0e"
+SRC_URI[sha256sum] = "6cb7d25a363b66b835f1b9f29f3580d6f09ac7d38505b46a62c178b618d9f1fb"
 
 inherit cmake pkgconfig
 
-- 
2.25.1



