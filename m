Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.8501.1594306856983201430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 08:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,331,1589212800"; 
   d="scan'208";a="95993667"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jul 2020 23:00:49 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F2D3D49B1116
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jul 2020 23:00:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Jul 2020 23:00:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-idna: upgrade 2.9 -> 2.10
Date: Thu, 9 Jul 2020 23:00:36 +0800
Message-ID: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: F2D3D49B1116.A3110
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Main new features of idna release 2.10:
- Update to Unicode 13.0.0.
- Throws a more specific exception if "xn--" is provided as a label.
- This is expected to be the last version that supports Python 2.
See here for a full comparison:
https://github.com/kjd/idna/commit/e5c11dbcd8dd32bb048b4dbdd344b49d18ecdf45

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-idna.inc           | 4 ++--
 .../python/{python3-idna_2.9.bb => python3-idna_2.10.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-idna_2.9.bb => python3-idna_2.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index adf26e0279..4968f10726 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
 
-SRC_URI[md5sum] = "870b8b80267f00f0faf1b7ba4bdbf14e"
-SRC_URI[sha256sum] = "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb"
+SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
+SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.9.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.9.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.10.bb
-- 
2.17.1



