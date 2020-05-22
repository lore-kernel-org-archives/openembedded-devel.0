Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9788.1590139429261048204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 02:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,421,1583164800"; 
   d="scan'208";a="92800488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 17:23:48 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B32A4BCC89D
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 17:23:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 17:23:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.1 -> 2.3.2
Date: Sat, 23 May 2020 02:23:42 +0800
Message-ID: <1590171822-9496-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9B32A4BCC89D.A46AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
index ec375fed9d..b9668eb099 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "cef482c0579f34d9524311ac70c0875f"
-SRC_URI[sha256sum] = "92aba4d559a2cf7043faed92e0f22c5addea36bd63f8c039ba5a8f3a159fe7d2"
+SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
+SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1



