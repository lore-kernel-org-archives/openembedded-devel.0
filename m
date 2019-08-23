Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE9D7F324
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:22:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74145847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 14:22:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B51254CE03FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:22:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 14:22:48 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Aug 2019 15:22:35 +0900
Message-ID: <20190823062235.4250-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: B51254CE03FC.AF9BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-jsonschema: upgrade 2.6.0 -> 3.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2019 06:22:59 -0000
Content-Type: text/plain

Add dependency on setuptools-scm-native

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc   | 6 +++---
 ...ython-jsonschema_2.6.0.bb => python-jsonschema_3.0.2.bb} | 0
 ...hon3-jsonschema_2.6.0.bb => python3-jsonschema_3.0.2.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonschema_2.6.0.bb => python-jsonschema_3.0.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonschema_2.6.0.bb => python3-jsonschema_3.0.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 6fdc02498..8f5bdaa58 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -2,10 +2,10 @@ SUMMARY = "An implementation of JSON Schema validation for Python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
 
-SRC_URI[md5sum] = "50c6b69a373a8b55ff1e0ec6e78f13f4"
-SRC_URI[sha256sum] = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"
+SRC_URI[md5sum] = "2b44d00dccc96d7ba3839190263152eb"
+SRC_URI[sha256sum] = "8d4a2b7b6c2237e0199c8ea1a6d3e05bf118e289ae2b9d7ba444182a2959560d"
 
-DEPENDS += "${PYTHON_PN}-vcversioner-native"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
rename to meta-python/recipes-devtools/python/python-jsonschema_3.0.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonschema_3.0.2.bb
-- 
2.17.1




