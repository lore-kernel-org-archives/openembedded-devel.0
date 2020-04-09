Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3884.1586412390337361379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; 
   d="scan'208";a="88733243"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 14:06:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 21DB9406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2020 13:56:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 14:06:23 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking][PATCH] fetchmail: upgrade 6.4.2 -> 6.4.3
Date: Thu, 9 Apr 2020 22:50:44 +0800
Message-ID: <1586443844-20884-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 21DB9406AB15.A54BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.2.bb => fetchmail_6.4.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.2.bb => fetchmail_6.4.3.bb} (86%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
similarity index 86%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
index 236c32bdd..5e2d1be1e 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "039b49a4f41f8544a51d82d2f4599dfc"
-SRC_URI[sha256sum] = "e21f6b3326f29fdb0c4786b5602aa4b9e668805424d0708eb42be6395c1ca630"
+SRC_URI[md5sum] = "614d5a05ac9a042bfc9317e5499bafd4"
+SRC_URI[sha256sum] = "b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1



