Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFE77ED40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:34:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="74443422"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 16:34:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 651AF4CE087D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 16:34:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 16:34:20 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 17:34:05 +0900
Message-ID: <20190828083405.9527-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 651AF4CE087D.A078E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cmd2: upgrade 0.9.2 -> 0.9.16
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
X-List-Received-Date: Wed, 28 Aug 2019 08:34:19 -0000
Content-Type: text/plain

Add dependency on setuptools-scm-native

License update: Copyright year updated to 2019.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../{python-cmd2_0.9.2.bb => python-cmd2_0.9.16.bb}       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.2.bb => python-cmd2_0.9.16.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
index 1b75e347b..94db37a2d 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
@@ -1,13 +1,15 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=60bc6842001870a418935bd84570b676"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "bfe0900a2288283a40f0ee7533486a2f"
-SRC_URI[sha256sum] = "e7b6b4b76272a051c943c3c709cd760142af16fbc9218e0ed3c22b28ea38d0a8"
+SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
+SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
 
 inherit pypi setuptools
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-pyparsing \
-- 
2.17.1




