Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6399.1614561171441524067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 17:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,214,1610380800"; 
   d="scan'208";a="104960222"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Mar 2021 09:12:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DA0BF4CE6F9E
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Mar 2021 09:12:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Mar 2021 09:12:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libgphoto2: upgrade 2.5.26 -> 2.5.27
Date: Mon, 1 Mar 2021 09:12:42 +0800
Message-ID: <1614561162-101608-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DA0BF4CE6F9E.A60EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.26.bb => libgphoto2_2.5.27.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.26.bb => libgphoto2_2.5.27.bb} (93%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
similarity index 93%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
index e9a3002829..ebb0c34169 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.26.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "7e7e18abe6a764cb4becb2728d86ed84"
-SRC_URI[libgphoto2.sha256sum] = "7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4"
+SRC_URI[libgphoto2.md5sum] = "83a2f96dade72e95dffb8e5fa9628d7e"
+SRC_URI[libgphoto2.sha256sum] = "f8b85478c44948a0b0b52c4d4dfda2de1d7bcb7b262c76bd1ae306d9c63240d7"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.25.1



