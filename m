Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6471.1611305296333855362
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103733220"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 16:48:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BD12E4CE6033
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 16:48:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 16:48:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] czmq: upgrade 4.2.0 -> 4.2.1
Date: Sat, 23 Jan 2021 04:48:06 +0800
Message-ID: <1611348486-4602-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BD12E4CE6033.A15CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../zeromq/{czmq_4.2.0.bb => czmq_4.2.1.bb}                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{czmq_4.2.0.bb => czmq_4.2.1.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
rename to meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 7c9a33e8c1..e742d2a1c4 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "zeromq"
 
 SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7e09997db6ac3b25e8ed104053040722"
-SRC_URI[sha256sum] = "cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb"
+SRC_URI[md5sum] = "471e9ec120fc66a2fe2aae14359e3cfa"
+SRC_URI[sha256sum] = "5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeromq/${BPN}/releases"
 
-- 
2.25.1



