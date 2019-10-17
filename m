Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56EBA7F382
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 06:25:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,306,1566835200"; d="scan'208";a="77089654"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2019 14:25:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A33154CE14E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:24:52 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 17 Oct 2019 14:25:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Oct 2019 14:25:24 +0800
Message-ID: <20191017062524.2087-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A33154CE14E3.A8531
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-jsonschema: upgrade 3.0.2 -> 3.1.1
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
X-List-Received-Date: Thu, 17 Oct 2019 06:25:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc             | 4 ++--
 .../python/{python-jsonschema_3.0.2.bb => python-jsonschema_3.1.1.bb} | 0
 .../{python3-jsonschema_3.0.2.bb => python3-jsonschema_3.1.1.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonschema_3.0.2.bb => python-jsonschema_3.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonschema_3.0.2.bb => python3-jsonschema_3.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index c772e9e..d9ccf1c 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of JSON Schema validation for Python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
 
-SRC_URI[md5sum] = "2b44d00dccc96d7ba3839190263152eb"
-SRC_URI[sha256sum] = "8d4a2b7b6c2237e0199c8ea1a6d3e05bf118e289ae2b9d7ba444182a2959560d"
+SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
+SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
 
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.0.2.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonschema_3.0.2.bb
rename to meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.0.2.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonschema_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb
-- 
2.7.4




