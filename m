Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 88F6E60125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 01:48:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,368,1549900800"; d="scan'208";a="59707368"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Apr 2019 09:48:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 441814C8B03D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 09:48:35 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 19 Apr 2019 09:48:36 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Apr 2019 09:49:24 +0800
Message-ID: <20190419014924.31855-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 441814C8B03D.A7198
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCHv2] python-cython: upgrade 0.28.5 -> 0.29.6
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
X-List-Received-Date: Fri, 19 Apr 2019 01:48:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cython_0.28.5.bb to python-cython_0.29.6.bb.

-Upgrade from python3-cython_0.28.5.bb to python3-cython_0.29.6.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cython.inc         | 4 ++--
 .../{python-cython_0.28.5.bb => python-cython_0.29.6.bb}      | 0
 .../{python3-cython_0.28.5.bb => python3-cython_0.29.6.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.5.bb => python-cython_0.29.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.5.bb => python3-cython_0.29.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 0939cad26..afdf974a4 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "0cb620e1259818e4ecc1a056e8c3a8be"
-SRC_URI[sha256sum] = "b64575241f64f6ec005a4d4137339fb0ba5e156e826db2fdb5f458060d9979e0"
+SRC_URI[md5sum] = "8a9441e85ac8085e3d947082db4e7993"
+SRC_URI[sha256sum] = "6c5d33f1b5c864382fbce810a8fd9e015447869ae42e98e6301e977b8165e7ae"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.5.bb b/meta-python/recipes-devtools/python/python-cython_0.29.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.5.bb
rename to meta-python/recipes-devtools/python/python-cython_0.29.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.5.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.5.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.29.6.bb
-- 
2.20.1




