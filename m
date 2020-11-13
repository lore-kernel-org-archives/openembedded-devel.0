Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.14852.1605232883999180796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,473,1596470400"; 
   d="scan'208";a="101312030"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 10:01:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BAF174CE4B08
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:01:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 10:01:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] can-utils: upgrade 2020.02.04 -> 2020.11.0
Date: Fri, 13 Nov 2020 22:01:18 +0800
Message-ID: <1605276078-25438-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BAF174CE4B08.A4573
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index e3ad04f59..e3a045bcf 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -6,9 +6,9 @@ DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
 
-SRCREV = "da65fdfe0d1986625ee00af0b56ae17ec132e700"
+SRCREV = "856d0a662a02dd2dc0b83a7ad1de9fd120e82c4b"
 
-PV = "2020.02.04"
+PV = "2020.11.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



