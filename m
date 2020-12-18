Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6575.1608275950971362406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102706236"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:19:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 37C584CE601E
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:19:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:19:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.0 -> 3.10.1
Date: Sat, 19 Dec 2020 03:19:00 +0800
Message-ID: <1608319140-4504-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 37C584CE601E.A267F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.0.bb => fuse3_3.10.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.0.bb => fuse3_3.10.1.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb
index c8680d950..80ce02872 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "26517954567f237a7dbcb532755ba0d2c77575c5d90db7566b6e40ec05b0a039"
+SRC_URI[sha256sum] = "d82d74d4c03e099f806e4bb31483955637c69226576bf0ca9bd142f1d50ae451"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1



