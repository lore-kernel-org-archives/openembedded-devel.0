Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.31803.1613977019268330281
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104716572"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:56:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 116114CE730B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 14:56:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:56:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.1 -> 3.10.2
Date: Tue, 23 Feb 2021 02:56:32 +0800
Message-ID: <1614020192-4645-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 116114CE730B.A270D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.1.bb => fuse3_3.10.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.1.bb => fuse3_3.10.2.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb
index 49d6c15daf..91d0e373b6 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "d82d74d4c03e099f806e4bb31483955637c69226576bf0ca9bd142f1d50ae451"
+SRC_URI[sha256sum] = "736e8d1ce65c09cb435fbbb500d53dc75f4d6e93bd325d22adc890951cf56337"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1



