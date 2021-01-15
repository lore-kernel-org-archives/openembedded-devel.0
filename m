Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4505.1610680652124082120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 19:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; 
   d="scan'208";a="103502068"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jan 2021 11:17:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 49B124CE6033
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Jan 2021 11:17:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 11:17:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] htop: upgrade 3.0.4 -> 3.0.5
Date: Fri, 15 Jan 2021 23:17:26 +0800
Message-ID: <1610723846-7223-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 49B124CE6033.A13DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.0.4.bb => htop_3.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.0.4.bb => htop_3.0.5.bb} (95%)

diff --git a/meta-oe/recipes-support/htop/htop_3.0.4.bb b/meta-oe/recipes-support/htop/htop_3.0.5.bb
similarity index 95%
rename from meta-oe/recipes-support/htop/htop_3.0.4.bb
rename to meta-oe/recipes-support/htop/htop_3.0.5.bb
index 49d53ec98f..8e9b95d91d 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.4.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.5.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git \
            file://0001-Use-pkg-config.patch \
            "
-SRCREV = "0b989ee38ce37eb4a50265faa11df2bd7ed8e5c3"
+SRCREV = "ce6d60e7def146c13d0b8bca4642e7401a0a8995"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



