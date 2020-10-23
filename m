Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4656.1603432749489382333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 22:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435444"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 13:59:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 81D8A48990FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 13:58:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 13:58:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gphoto2: upgrade 2.5.23 -> 2.5.26
Date: Fri, 23 Oct 2020 13:58:51 +0800
Message-ID: <1603432731-100174-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 81D8A48990FC.A1A89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gphoto2/{gphoto2_2.5.23.bb => gphoto2_2.5.26.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.23.bb => gphoto2_2.5.26.bb} (79%)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb
similarity index 79%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb
rename to meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb
index ef3100f665..a425287a8e 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.26.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch \
 "
 
-SRC_URI[gphoto2.md5sum] = "0abd5ae8315109ae66bf06ac37902678"
-SRC_URI[gphoto2.sha256sum] = "df87092100e7766c9d0a4323217c91908a9c891c0d3670ebf40b76903be458d1"
+SRC_URI[gphoto2.md5sum] = "f663b10bca639290fdb150b6ffe23e93"
+SRC_URI[gphoto2.sha256sum] = "7653213b05329c1dc2779efea3eff00504e12011436587aedc9aaa1e8665ab2f"
 
 inherit autotools pkgconfig gettext
 
-- 
2.25.1



