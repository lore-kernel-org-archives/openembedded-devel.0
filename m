Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5641.1591774253531255671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; 
   d="scan'208";a="94230604"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 15:30:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 98EF64CE280C
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 15:30:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 15:30:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.2 -> 2.3.3
Date: Wed, 10 Jun 2020 15:30:35 +0800
Message-ID: <1591774235-3768-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 98EF64CE280C.A5071
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.3.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb
index b9668eb09..93eba93a9 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.3.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
-SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
+SRC_URI[md5sum] = "6c0ce8be21a7687b89354c77757d0c5b"
+SRC_URI[sha256sum] = "3bca4ffe39e2f94cef50f6ea65acb873a6dbce5db34fc6bcefe38b6d095e82df"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1



