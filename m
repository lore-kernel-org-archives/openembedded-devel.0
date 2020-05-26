Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.44647.1590464864749942135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 20:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,435,1583164800"; 
   d="scan'208";a="93093664"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 May 2020 11:47:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1989746B5FB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 11:47:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 May 2020 11:47:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgphoto2: upgrade 2.5.24 -> 2.5.25
Date: Tue, 26 May 2020 20:47:37 +0800
Message-ID: <1590497258-25173-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1989746B5FB0.A1CFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
index 9d9b0c78c8..8daf737a5e 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "063632d839b71698e99da0ccd19bc9f6"
-SRC_URI[libgphoto2.sha256sum] = "fd3c578769f0fa389c1e68120f224bd98477aa3d82d16b82746c1266c0d4fb31"
+SRC_URI[libgphoto2.md5sum] = "39999aa4bdd3bf849b5716153c659405"
+SRC_URI[libgphoto2.sha256sum] = "7c0e98f438c2b128186afe16ce7833a12fa36f87d01467e837b9d27e7a167f3a"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.17.1



