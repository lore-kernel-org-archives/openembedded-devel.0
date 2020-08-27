Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.9340.1598491027827905969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,357,1592841600"; 
   d="scan'208";a="98596714"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Aug 2020 09:17:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AE52C48990D7
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 09:17:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 27 Aug 2020 09:17:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.30 -> 0.31
Date: Thu, 27 Aug 2020 21:17:05 +0800
Message-ID: <1598534226-115864-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598534226-115864-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598534226-115864-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AE52C48990D7.A3081
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.30.bb => satyr_0.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.30.bb => satyr_0.31.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.30.bb b/meta-oe/recipes-support/satyr/satyr_0.31.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.30.bb
rename to meta-oe/recipes-support/satyr/satyr_0.31.bb
index 7831dd956..e99f8ac6a 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.30.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.31.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "871a07001c64cfce15dffd7e93a5c3d55af6d5e8"
+SRCREV = "79506592fa61fa10aa2e186158eecfa10b39e905"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1



