Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3879.1585273795392913141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 18:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,310,1580745600"; 
   d="scan'208";a="87517236"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Mar 2020 09:49:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E828406AB15
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2020 09:39:33 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Mar 2020 09:49:45 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 27 Mar 2020 09:49:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.9.0 -> 3.9.1
Date: Fri, 27 Mar 2020 09:52:15 +0800
Message-ID: <20200327015215.22115-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8E828406AB15.A750F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.9.0.bb => fuse3_3.9.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.0.bb => fuse3_3.9.1.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
index 19a3499a1..1830fa166 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "5dc2be21c0d06c7eace340996e8a37e2"
-SRC_URI[sha256sum] = "fcb7079a1bb4e510377b427d1c5c37c349281d498e249ae0c2379b4cf50059c2"
+SRC_URI[md5sum] = "26d6b450276fb04e20bf91d83b9423f0"
+SRC_URI[sha256sum] = "1bafcfd6c66ba35b7b0beb822532a9106eb8409ad6cde988888fde85f89be645"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.20.1



