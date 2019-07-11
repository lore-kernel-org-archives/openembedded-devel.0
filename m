Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E301D7F09D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 08:16:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71170357"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 16:15:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 494D34CDE64B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 16:15:51 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Jul 2019 16:15:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 16:15:04 +0800
Message-ID: <20190711081504.5974-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 494D34CDE64B.A9A32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cython: upgrade 0.29.11 -> 0.29.12
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
X-List-Received-Date: Thu, 11 Jul 2019 08:16:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cython_0.29.11.bb to python-cython_0.29.12.bb.

-Upgrade from python3-cython_0.29.11.bb to python3-cython_0.29.12.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.29.11.bb => python-cython_0.29.12.bb}     | 0
 .../python/{python3-cython_0.29.11.bb => python3-cython_0.29.12.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.29.11.bb => python-cython_0.29.12.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.29.11.bb => python3-cython_0.29.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 1d2c458..e326da4 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "785fa46921b4cbb4028b27b825a268d4"
-SRC_URI[sha256sum] = "763a522cc5d1673ba7a4092c0914790f11704b1d4c41e2671e50d0f702a8c6a0"
+SRC_URI[md5sum] = "f212574687a52706ff53738a64f91398"
+SRC_URI[sha256sum] = "20da832a5e9a8e93d1e1eb64650258956723940968eb585506531719b55b804f"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.29.11.bb b/meta-python/recipes-devtools/python/python-cython_0.29.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.29.11.bb
rename to meta-python/recipes-devtools/python/python-cython_0.29.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.11.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.29.11.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.29.12.bb
-- 
2.7.4




