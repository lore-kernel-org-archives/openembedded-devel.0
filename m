Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8130.1604905318448252888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 23:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101082913"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 15:01:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DED274CE3A62
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 15:01:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 15:01:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 20.10.0 -> 20.11.0
Date: Mon, 9 Nov 2020 15:01:29 +0800
Message-ID: <1604905289-63830-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DED274CE3A62.A3FBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../poppler/{poppler_20.10.0.bb => poppler_20.11.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_20.10.0.bb => poppler_20.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_20.10.0.bb b/meta-oe/recipes-support/poppler/poppler_20.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_20.10.0.bb
rename to meta-oe/recipes-support/poppler/poppler_20.11.0.bb
index 0f04b88f2..729923d40 100644
--- a/meta-oe/recipes-support/poppler/poppler_20.10.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_20.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "434ecbbb539c1a75955030a1c9b24c7b58200b7f68d2e4269e29acf2f8f13336"
+SRC_URI[sha256sum] = "021557074516492375c2bb4226a413aad431159e9177f9f14dff4159d2723b14"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1



