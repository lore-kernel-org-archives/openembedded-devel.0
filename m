Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31C577965C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:35:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45056803"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2018 17:35:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 60BE04B6EC83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 17:35:22 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 18 Sep 2018 17:35:21 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Sep 2018 17:35:21 +0800
Message-ID: <20180918093521.1113-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
References: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 60BE04B6EC83.AF17B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-py:1.5.4 -> 1.6.0
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
X-List-Received-Date: Tue, 18 Sep 2018 09:35:29 -0000
Content-Type: text/plain

Upgrade python-py from 1.5.4 to 1.6.0

Upgrade python3-py from 1.5.4 to 1.6.0

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-py.inc                     | 4 ++--
 .../python/{python-py_1.5.4.bb => python-py_1.6.0.bb}                 | 0
 .../python/{python3-py_1.5.4.bb => python3-py_1.6.0.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.5.4.bb => python-py_1.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.5.4.bb => python3-py_1.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 3480cb5..8144523 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "7502d66fa68ea4ae5b61c511cd177d6a"
-SRC_URI[sha256sum] = "3fd59af7435864e1a243790d322d763925431213b6b8529c6ca71081ace3bbf7"
+SRC_URI[md5sum] = "5ccd0cd5373c55171cf9fd61b9f19a1b"
+SRC_URI[sha256sum] = "06a30435d058473046be836d3fc4f27167fd84c45b99704f2fb5509ef61f9af1"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.5.4.bb b/meta-python/recipes-devtools/python/python-py_1.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.5.4.bb
rename to meta-python/recipes-devtools/python/python-py_1.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.5.4.bb b/meta-python/recipes-devtools/python/python3-py_1.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-py_1.6.0.bb
-- 
2.7.4




