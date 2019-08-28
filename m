Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 780DE7ECCF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:12:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="74441389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 16:12:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 128A74CE032B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 16:12:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 16:12:11 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 17:11:55 +0900
Message-ID: <20190828081155.9327-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 128A74CE032B.A07BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pluggy: upgrade 0.6.0 -> 0.12.0
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
X-List-Received-Date: Wed, 28 Aug 2019 08:12:13 -0000
Content-Type: text/plain

Add dependency on setuptools-scm-native

License update: remove space at end of line and blank lines at end of file.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pluggy.inc     | 8 +++++---
 .../{python-pluggy_0.6.0.bb => python-pluggy_0.12.0.bb}   | 0
 .../{python3-pluggy_0.6.0.bb => python3-pluggy_0.12.0.bb} | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pluggy_0.6.0.bb => python-pluggy_0.12.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pluggy_0.6.0.bb => python3-pluggy_0.12.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
index 320359aa6..c9bee6287 100644
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
+++ b/meta-python/recipes-devtools/python/python-pluggy.inc
@@ -1,9 +1,11 @@
 SUMMARY = "Plugin and hook calling mechanisms for python"
 HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=338dad807ed9337bfaeb9979c3bfe20f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[md5sum] = "ffdde7c3a5ba9a440404570366ffb6d5"
-SRC_URI[sha256sum] = "7f8ae7f5bdf75671a718d2daf0a64b7885f74510bcd98b1a0bb420eb9a9d0cff"
+SRC_URI[md5sum] = "e986647f5d786c0cc1bd065cf9bac658"
+SRC_URI[sha256sum] = "0825a152ac059776623854c1543d65a4ad408eb3d33ee114dff91e57ec6ae6fc"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb b/meta-python/recipes-devtools/python/python-pluggy_0.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb
rename to meta-python/recipes-devtools/python/python-pluggy_0.12.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pluggy_0.12.0.bb
-- 
2.17.1




