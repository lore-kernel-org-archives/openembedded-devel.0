Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3604.1599787383125582946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114386"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:23:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B191D48990ED
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:22:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:22:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.3 -> 2.3.4
Date: Fri, 11 Sep 2020 21:22:53 +0800
Message-ID: <1599830573-14969-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B191D48990ED.A5FED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.3.3.bb => cryptsetup_2.3.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.3.bb => cryptsetup_2.3.4.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
index 93eba93a9..b9a6b7179 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "6c0ce8be21a7687b89354c77757d0c5b"
-SRC_URI[sha256sum] = "3bca4ffe39e2f94cef50f6ea65acb873a6dbce5db34fc6bcefe38b6d095e82df"
+SRC_URI[md5sum] = "911272e73181fdc850bb4d25103a9f83"
+SRC_URI[sha256sum] = "9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1



