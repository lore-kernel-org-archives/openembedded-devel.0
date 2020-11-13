Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.15024.1605233018539892498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,473,1596470400"; 
   d="scan'208";a="101312232"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 10:03:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0473648990EB
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:03:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 10:03:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20200819 -> 20201105
Date: Fri, 13 Nov 2020 22:03:31 +0800
Message-ID: <1605276211-25674-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0473648990EB.AE72B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../live555/{live555_20200819.bb => live555_20201105.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20200819.bb => live555_20201105.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20200819.bb b/meta-oe/recipes-multimedia/live555/live555_20201105.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20200819.bb
rename to meta-oe/recipes-multimedia/live555/live555_20201105.bb
index c746b6e97..59375c862 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20200819.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20201105.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537"
+SRC_URI[sha256sum] = "89bdfba7fd215e16be2c9d46a797bf85c5f7f7c46b53dc8af2d1171a658da5b7"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1



