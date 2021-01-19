Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6827.1611026709374824853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 19:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103603838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 11:25:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EE0374CE4B3E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 11:25:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 11:25:03 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.1.0 -> 5.2.0
Date: Tue, 19 Jan 2021 23:25:03 +0800
Message-ID: <1611069903-4715-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EE0374CE4B3E.A1A7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

5.2.0 (2020-11-05)
==================

- Add documentation section ``Persistency and Equality``
  (`#218 <https://github.com/zopefoundation/zope.interface/issues/218>`_).

- Create arm64 wheels.

- Add support for Python 3.9.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...n3-zopeinterface_5.1.0.bb => python3-zopeinterface_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.1.0.bb => python3-zopeinterface_5.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
index a66735b8a7..48bb80d578 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "40e4c42bd27ed3c11b2c983fecfb03356fae1209de10686d03c02c8696a1d90e"
+SRC_URI[sha256sum] = "8251f06a77985a2729a8bdbefbae79ee78567dddc3acbd499b87e705ca59fe24"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1



