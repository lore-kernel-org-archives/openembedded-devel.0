Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7899.1608613384051538975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 21:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,438,1599494400"; 
   d="scan'208";a="102806901"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Dec 2020 13:02:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 023734CE4B3E
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 13:02:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Dec 2020 13:02:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 4.1.1 -> 4.2.0
Date: Tue, 22 Dec 2020 13:02:51 +0800
Message-ID: <1608613371-67021-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 023734CE4B3E.A0CC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

v4.2.0 (2020-12-10)
===================

- Add FIFO cache implementation.

- Add MRU cache implementation.

- Improve behavior of decorators in case of race conditions.

- Improve documentation regarding mutability of caches values and use
  of key functions with decorators.

- Officially support Python 3.9.

The ptest log is as follows:
START: ptest-runner
2020-12-22T02:58
BEGIN: /usr/lib/python3-cachetools/ptest
============================= test session starts ==============================
platform linux -- Python 3.9.0, pytest-6.1.2, py-1.9.0, pluggy-0.13.1
rootdir: /usr/lib/python3-cachetools/ptest
collected 164 items
...
============================= 164 passed in 12.95s =============================
DURATION: 21
END: /usr/lib/python3-cachetools/ptest
2020-12-22T02:58
STOP: ptest-runner

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...n3-cachetools_4.1.1.bb => python3-cachetools_4.2.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.1.bb => python3-cachetools_4.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
index d334070cd..cc697d5a9 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
@@ -14,6 +14,10 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-math \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
@@ -23,7 +27,7 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = "ae41b69896f49727e1621d279cb72522"
-SRC_URI[sha256sum] = "bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20"
+SRC_URI[md5sum] = "9d54dacd774e2af7e9a50741386f5455"
+SRC_URI[sha256sum] = "3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1



