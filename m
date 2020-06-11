Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.1663.1591855190707602247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 22:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,498,1583164800"; 
   d="scan'208";a="94285197"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Jun 2020 13:59:43 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CD43746B5FB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:59:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Jun 2020 13:59:40 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-scapy: upgrade 0.25 -> 0.26
Date: Thu, 11 Jun 2020 13:59:31 +0800
Message-ID: <1591855171-36461-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: CD43746B5FB0.A43E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Version updated from 0.25 to 0.26.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-scapy_0.25.bb => python3-scapy_0.26.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scapy_0.25.bb => python3-scapy_0.26.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-scapy_0.25.bb
rename to meta-python/recipes-devtools/python/python3-scapy_0.26.bb
index f785a2fe8..31c88942d 100644
--- a/meta-python/recipes-devtools/python/python3-scapy_0.25.bb
+++ b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
@@ -3,11 +3,11 @@ based on scapy with python3 compatibility"
 SECTION = "devel/python"
 HOMEPAGE = "https://github.com/phaethon/scapy"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a4282d4d80227fa599a99e77fdd95e71"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "scapy-python3"
 
-SRC_URI[md5sum] = "c9003d39def73c028cb8c71bcbb42629"
-SRC_URI[sha256sum] = "2ae1b3bd9759844e830a6cc3ba11c3f25b08433a8ee3e7eddc08224905e5ef2b"
+SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
+SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
-- 
2.17.1



