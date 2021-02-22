Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.31835.1613979894025548506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 23:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104718652"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 15:44:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C98204CE7314
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 15:44:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 15:44:52 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.0 -> 4.3.3
Date: Mon, 22 Feb 2021 15:44:47 +0800
Message-ID: <1613979887-44149-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C98204CE7314.A63D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../ser2net/{ser2net_4.3.0.bb => ser2net_4.3.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.0.bb => ser2net_4.3.3.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
index 6293d1229b..87b5b15b75 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.0.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5e407d684d0aa0919ddd15af368f890c5940cddd6034b7efc363823f38f6ff0c"
+SRC_URI[sha256sum] = "f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1



