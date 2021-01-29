Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6790.1611909657883109422
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103979076"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:40:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 443524CE6786
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:40:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:40:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.24.4 -> 1.24.6
Date: Sat, 30 Jan 2021 04:40:51 +0800
Message-ID: <1611952851-4525-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 443524CE6786.A0A20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libmbim/{libmbim_1.24.4.bb => libmbim_1.24.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.24.4.bb => libmbim_1.24.6.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb
index 148b3ca8d..6fe6a2e4f 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb
@@ -13,5 +13,5 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4b4b12ab7153d7c999289b5dfc2d25db"
-SRC_URI[sha256sum] = "dd488ee6176243a6adb27a5872897336272ea7bea33a3ad501ba268e5a58b285"
+SRC_URI[md5sum] = "38d228548eae3ee144e19a42b028eab0"
+SRC_URI[sha256sum] = "760465caaa1ccd699c14290e9791da456d5300dd11ebf4c1486151033e875dfd"
-- 
2.25.1



