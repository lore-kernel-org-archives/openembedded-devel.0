Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3617.1599787516940814952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114460"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:25:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8BD5148990E7
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:25:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:25:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] lcms: upgrade 2.9 -> 2.11
Date: Fri, 11 Sep 2020 21:25:11 +0800
Message-ID: <1599830711-15178-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8BD5148990E7.A3CE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.9.bb => lcms_2.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.9.bb => lcms_2.11.bb} (55%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.9.bb b/meta-oe/recipes-support/lcms/lcms_2.11.bb
similarity index 55%
rename from meta-oe/recipes-support/lcms/lcms_2.9.bb
rename to meta-oe/recipes-support/lcms/lcms_2.11.bb
index be72d765e..4f10f3531 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.9.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.11.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9391499b030def18e7bb25bab4bee052"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[md5sum] = "8de1b7724f578d2995c8fdfa35c3ad0e"
-SRC_URI[sha256sum] = "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
+SRC_URI[md5sum] = "598dae499e58f877ff6788254320f43e"
+SRC_URI[sha256sum] = "dc49b9c8e4d7cdff376040571a722902b682a795bf92985a85b48854c270772e"
 
 DEPENDS = "tiff"
 
-- 
2.25.1



