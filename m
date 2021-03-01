Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6301.1614561171328449735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 17:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,214,1610380800"; 
   d="scan'208";a="104960219"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Mar 2021 09:12:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C35A44CE72EE
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Mar 2021 09:12:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Mar 2021 09:12:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gphoto2: upgrade 2.5.26 -> 2.5.27
Date: Mon, 1 Mar 2021 09:12:26 +0800
Message-ID: <1614561146-101556-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C35A44CE72EE.A36B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gphoto2/{gphoto2_2.5.26.bb => gphoto2_2.5.27.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.26.bb => gphoto2_2.5.27.bb} (79%)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.27.bb
similarity index 79%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb
rename to meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.27.bb
index a425287a8e..791ea8db16 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.27.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch \
 "
 
-SRC_URI[gphoto2.md5sum] = "f663b10bca639290fdb150b6ffe23e93"
-SRC_URI[gphoto2.sha256sum] = "7653213b05329c1dc2779efea3eff00504e12011436587aedc9aaa1e8665ab2f"
+SRC_URI[gphoto2.md5sum] = "92d39b383c0e0354b4d3af1af7b8b416"
+SRC_URI[gphoto2.sha256sum] = "30054e93a1bb59f501aabd5018713177ea04ce0cb28935319bd6ca80061e8d38"
 
 inherit autotools pkgconfig gettext
 
-- 
2.25.1



