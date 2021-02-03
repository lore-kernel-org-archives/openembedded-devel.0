Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.53424.1612277403184057313
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 06:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,395,1602518400"; 
   d="scan'208";a="104107102"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Feb 2021 22:49:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8C1A74CE6D61
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Feb 2021 22:49:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Feb 2021 22:49:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-matplotlib: upgrade 3.3.2 -> 3.3.4
Date: Wed, 3 Feb 2021 10:49:46 +0800
Message-ID: <1612320586-3432-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8C1A74CE6D61.A3761
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...hon3-matplotlib_3.3.2.bb => python3-matplotlib_3.3.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.2.bb => python3-matplotlib_3.3.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
index 25709a117..a4df9a6fe 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353 \
+    file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -19,8 +19,8 @@ DEPENDS = "\
     python3-certifi-native \
 "
 
-SRC_URI[md5sum] = "a85791908e78818bd425ba9ab38500fa"
-SRC_URI[sha256sum] = "3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b"
+SRC_URI[md5sum] = "0b48f34ec623e765a1bda15924ce0b56"
+SRC_URI[sha256sum] = "3e477db76c22929e4c6876c44f88d790aacdf3c3f8f3a90cb1975c0bf37825b0"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.25.1



