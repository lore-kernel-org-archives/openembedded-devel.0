Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4199.1606789057945349897
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:17:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 97F364CE5CFB
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:17:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:17:32 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dfu-util: upgrade 0.9 -> 0.10
Date: Tue, 1 Dec 2020 10:17:30 +0800
Message-ID: <1606789050-56640-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 97F364CE5CFB.AA9C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{dfu-util-native_0.9.bb => dfu-util-native_0.10.bb}       | 0
 .../dfu-util/{dfu-util_0.9.bb => dfu-util_0.10.bb}            | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/dfu-util/{dfu-util-native_0.9.bb => dfu-util-native_0.10.bb} (100%)
 rename meta-oe/recipes-support/dfu-util/{dfu-util_0.9.bb => dfu-util_0.10.bb} (72%)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
similarity index 100%
rename from meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb
similarity index 72%
rename from meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb
index 8a2ac6934..86353712d 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://dfu-util.sourceforge.net/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "233bb1e08ef4b405062445d84e28fde6"
-SRC_URI[sha256sum] = "36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833"
+SRC_URI[md5sum] = "8cf55663703cdc6b40f377f999eb8d3d"
+SRC_URI[sha256sum] = "a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42"
 
 inherit autotools pkgconfig
-- 
2.25.1



