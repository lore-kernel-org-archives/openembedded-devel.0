Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7AC7D277
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:12:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59506688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 14:12:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DAC934CD80D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 14:12:31 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 14:12:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 14:13:22 +0800
Message-ID: <20190417061322.19414-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: DAC934CD80D0.AA881
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-py: upgrade 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 17 Apr 2019 06:12:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-py_1.6.0.bb to python-py_1.8.0.bb.

-Upgrade from python3-py_1.6.0.bb to python3-py_1.8.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-py.inc             | 4 ++--
 .../python/{python-py_1.6.0.bb => python-py_1.8.0.bb}         | 0
 .../python/{python3-py_1.6.0.bb => python3-py_1.8.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.6.0.bb => python-py_1.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.6.0.bb => python3-py_1.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 8144523c2..b6e0409bd 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "5ccd0cd5373c55171cf9fd61b9f19a1b"
-SRC_URI[sha256sum] = "06a30435d058473046be836d3fc4f27167fd84c45b99704f2fb5509ef61f9af1"
+SRC_URI[md5sum] = "d9e30436ce7e79f30847f9b30b62e149"
+SRC_URI[sha256sum] = "dc639b046a6e2cff5bbe40194ad65936d6ba360b52b3c3fe1d08a82dd50b5e53"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.6.0.bb b/meta-python/recipes-devtools/python/python-py_1.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-py_1.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.6.0.bb b/meta-python/recipes-devtools/python/python3-py_1.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-py_1.8.0.bb
-- 
2.20.1




