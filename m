Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8629.1611639683614380992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; 
   d="scan'208";a="103835102"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 13:41:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id ADD254CE6781
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 13:41:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 13:41:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nmap: upgrade 1.4.8 -> 1.5.0
Date: Wed, 27 Jan 2021 01:41:17 +0800
Message-ID: <1611682877-4449-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ADD254CE6781.A3CCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-nmap_1.4.8.bb => python3-nmap_1.5.0.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.8.bb => python3-nmap_1.5.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
index 2037d496a..e6f093360 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
@@ -8,9 +8,12 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[md5sum] = "e7904b39b64a8a44f275388862659a0d"
-SRC_URI[sha256sum] = "8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759"
+SRC_URI[md5sum] = "3a43dd0f56ade8c76c7c6f994604212d"
+SRC_URI[sha256sum] = "b52744e0c9944c567733b8deb60d6363e17233ee40466edfb1b09a5780576f9a"
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "nmap ${PYTHON_PN}-requests"
+RDEPENDS_${PN} += "nmap \
+	${PYTHON_PN}-requests \
+	${PYTHON_PN}-simplejson \
+"
-- 
2.25.1



