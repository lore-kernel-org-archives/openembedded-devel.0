Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 78B2261904
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:30:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:30:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4922150A9962
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:20:44 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:30:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:30:40 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:57 -0800
Message-ID: <1583236320-114088-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4922150A9962.A0E18
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libpwquality: upgrade 1.4.0 -> 1.4.2
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
X-List-Received-Date: Tue, 03 Mar 2020 05:30:35 -0000
Content-Type: text/plain

refresh add-missing-python-include-dir-for-cross.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...missing-python-include-dir-for-cross.patch | 27 ++++++++-----------
 ...quality_1.4.0.bb => libpwquality_1.4.2.bb} |  4 +--
 2 files changed, 13 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-extended/libpwquality/{libpwquality_1.4.0.bb => libpwquality_1.4.2.bb} (90%)

diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
index d12492f02..ec8672107 100644
--- a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
+++ b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
@@ -13,28 +13,23 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/python/Makefile.am b/python/Makefile.am
-index abc5cd3..e35ba71 100644
+index 1d00c0c..52816b2 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
-@@ -14,4 +14,4 @@ all-local:
- 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-lib=.
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
  
  install-exec-local:
--	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py install --prefix=${DESTDIR}${prefix}
-+	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py install --prefix=${DESTDIR}${prefix} --install-lib=${DESTDIR}/${PYTHONSITEDIR}
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix} --install-lib=${DESTDIR}/${PYTHONSITEDIR}
+ 
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
 diff --git a/python/setup.py.in b/python/setup.py.in
-index 6457595..d3db0e5 100755
+index a741b91..6759a95 100755
 --- a/python/setup.py.in
 +++ b/python/setup.py.in
-@@ -6,6 +6,7 @@
- 
- from distutils.core import setup, Extension
- from distutils.command.build_ext import build_ext as _build_ext
-+import os
- 
- class build_ext(_build_ext):
-     def genconstants(self, headerfile, outputfile):
-@@ -23,7 +24,7 @@ class build_ext(_build_ext):
+@@ -33,7 +33,7 @@ class sdist(_sdist):
  
  pwqmodule = Extension('pwquality',
              sources = ['pwquality.c'],
@@ -44,5 +39,5 @@ index 6457595..d3db0e5 100755
              libraries = ['pwquality'])
  
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb
similarity index 90%
rename from meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
rename to meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb
index 9fb25cdc7..24d2f7ec1 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/${SRCNAME}
            file://add-missing-python-include-dir-for-cross.patch \
 "
 
-SRC_URI[md5sum] = "b8defcc7280a90e9400d6689c93a279c"
-SRC_URI[sha256sum] = "1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6b"
+SRC_URI[md5sum] = "ae6e61fc33f5dac0de5e847eb7520d71"
+SRC_URI[sha256sum] = "5263e09ee62269c092f790ac159112aed3e66826a795e3afec85fdeac4281c8e"
 
 UPSTREAM_CHECK_URI = "https://github.com/libpwquality/libpwquality/releases"
 
-- 
2.17.1




