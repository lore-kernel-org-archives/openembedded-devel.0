Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4746.1603432761043185227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 22:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435454"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 13:59:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 67E9A48990FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 13:59:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 13:59:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libgphoto2: upgrade 2.5.25 -> 2.5.26
Date: Fri, 23 Oct 2020 13:59:13 +0800
Message-ID: <1603432753-100239-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 67E9A48990FC.A1A64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.25.bb => libgphoto2_2.5.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.25.bb => libgphoto2_2.5.26.bb} (93%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb
similarity index 93%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb
index fe7657f54c..e9a3002829 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "39999aa4bdd3bf849b5716153c659405"
-SRC_URI[libgphoto2.sha256sum] = "7c0e98f438c2b128186afe16ce7833a12fa36f87d01467e837b9d27e7a167f3a"
+SRC_URI[libgphoto2.md5sum] = "7e7e18abe6a764cb4becb2728d86ed84"
+SRC_URI[libgphoto2.sha256sum] = "7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.25.1



