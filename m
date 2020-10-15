Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7124.1602746923130114102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 00:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,378,1596470400"; 
   d="scan'208";a="100184719"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Oct 2020 15:28:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 20C4948990F9
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 15:28:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Oct 2020 15:28:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 20.09.0 -> 20.10.0
Date: Thu, 15 Oct 2020 15:28:30 +0800
Message-ID: <1602746910-13496-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 20C4948990F9.A1409
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../poppler/{poppler_20.09.0.bb => poppler_20.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_20.09.0.bb => poppler_20.10.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_20.09.0.bb b/meta-oe/recipes-support/poppler/poppler_20.10.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_20.09.0.bb
rename to meta-oe/recipes-support/poppler/poppler_20.10.0.bb
index ceff2d0d65..0f04b88f2d 100644
--- a/meta-oe/recipes-support/poppler/poppler_20.09.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_20.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "4ed6eb5ddc4c37f2435c9d78ff9c7c4036455aea3507d1ce8400070aab745363"
+SRC_URI[sha256sum] = "434ecbbb539c1a75955030a1c9b24c7b58200b7f68d2e4269e29acf2f8f13336"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1



