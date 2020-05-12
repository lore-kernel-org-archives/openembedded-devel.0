Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.742.1589262351525751986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 22:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,382,1583164800"; 
   d="scan'208";a="91937778"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 13:45:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D63104BCC89D
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:45:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 13:45:45 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python][PATCH] python3-idna: upgrade 2.8 -> 2.9
Date: Tue, 12 May 2020 22:46:08 +0800
Message-ID: <1589294768-97322-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D63104BCC89D.A4E8D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-idna.inc     | 6 +++---
 meta-python/recipes-devtools/python/python3-idna_2.9.bb | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-idna_2.9.bb

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 13b0cdb624..adf26e0279 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=782775b32f96098512e283fb5d4546cd"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
 
-SRC_URI[md5sum] = "2e9ae0b4a0b26d1747c6127cdb060bc1"
-SRC_URI[sha256sum] = "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
+SRC_URI[md5sum] = "870b8b80267f00f0faf1b7ba4bdbf14e"
+SRC_URI[sha256sum] = "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.9.bb b/meta-python/recipes-devtools/python/python3-idna_2.9.bb
new file mode 100644
index 0000000000..a08ca714ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-idna_2.9.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-idna.inc
-- 
2.17.1



