Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.31806.1613977073648922958
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104716622"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:57:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 036AC4CE730C
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 14:57:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:57:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] lcms: upgrade 2.11 -> 2.12
Date: Tue, 23 Feb 2021 02:57:46 +0800
Message-ID: <1614020266-4864-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 036AC4CE730C.A214D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: The typesetting format has been adjusted.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.11.bb => lcms_2.12.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.11.bb => lcms_2.12.bb} (55%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.11.bb b/meta-oe/recipes-support/lcms/lcms_2.12.bb
similarity index 55%
rename from meta-oe/recipes-support/lcms/lcms_2.11.bb
rename to meta-oe/recipes-support/lcms/lcms_2.12.bb
index 4f10f35316..f07b881a76 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.11.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.12.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9391499b030def18e7bb25bab4bee052"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac638b4bc6b67582a11379cfbaeb93dd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[md5sum] = "598dae499e58f877ff6788254320f43e"
-SRC_URI[sha256sum] = "dc49b9c8e4d7cdff376040571a722902b682a795bf92985a85b48854c270772e"
+SRC_URI[md5sum] = "8cb583c8447461896320b43ea9a688e0"
+SRC_URI[sha256sum] = "18663985e864100455ac3e507625c438c3710354d85e5cbb7cd4043e11fe10f5"
 
 DEPENDS = "tiff"
 
-- 
2.25.1



