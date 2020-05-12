Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.681.1589262100826653690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 22:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,382,1583164800"; 
   d="scan'208";a="91937648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 13:41:35 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C5884BCC8A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:41:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 13:41:33 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] sanlock: upgrade 3.8.0 -> 3.8.1
Date: Tue, 12 May 2020 22:41:55 +0800
Message-ID: <1589294515-97150-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 5C5884BCC8A2.A53C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sanlock/{sanlock_3.8.0.bb => sanlock_3.8.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.0.bb => sanlock_3.8.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb
index ffd46da0af..abae362522 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb
@@ -16,7 +16,7 @@ PV .= "+git${SRCPV}"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "cff348800722f7dadf030ffe7494c2df714996e3"
+SRCREV = "07ab65afb10c8f8c008880a73b7b7aaedbde0e15"
 
 S = "${WORKDIR}/git/python"
 
-- 
2.17.1



