Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBF17DFA1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 05:21:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,448,1549900800"; d="scan'208";a="62214622"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2019 13:21:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id ADD324CDB2FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 13:21:09 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 May 2019 13:21:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2019 13:22:06 +0800
Message-ID: <20190509052206.16842-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: ADD324CDB2FD.AE13E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cython: upgrade 0.29.6 -> 0.29.7
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
X-List-Received-Date: Thu, 09 May 2019 05:21:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cython_0.29.6.bb to python-cython_0.29.7.bb.

-Upgrade from python3-cython_0.29.6.bb to python3-cython_0.29.7.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cython.inc         | 4 ++--
 .../{python-cython_0.29.6.bb => python-cython_0.29.7.bb}      | 0
 .../{python3-cython_0.29.6.bb => python3-cython_0.29.7.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.29.6.bb => python-cython_0.29.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.29.6.bb => python3-cython_0.29.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index afdf974a4..8ccbe0a87 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "8a9441e85ac8085e3d947082db4e7993"
-SRC_URI[sha256sum] = "6c5d33f1b5c864382fbce810a8fd9e015447869ae42e98e6301e977b8165e7ae"
+SRC_URI[md5sum] = "24f6a7e0e6691fbecf5880f38cdf880e"
+SRC_URI[sha256sum] = "55d081162191b7c11c7bfcb7c68e913827dfd5de6ecdbab1b99dab190586c1e8"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.29.6.bb b/meta-python/recipes-devtools/python/python-cython_0.29.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.29.6.bb
rename to meta-python/recipes-devtools/python/python-cython_0.29.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.6.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.29.6.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.29.7.bb
-- 
2.20.1




