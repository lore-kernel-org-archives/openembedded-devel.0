Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1E00722F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 02:53:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56667021"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jan 2015 10:49:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0R2qGiY014770
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 10:52:17 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 27 Jan 2015 10:52:58 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Jan 2015 10:51:49 +0800
Message-ID: <1422327109-23880-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][PATCH] mozjs_17.0.0: Fix build error in powerpc(e500v2)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Jan 2015 02:54:07 -0000
Content-Type: text/plain

To fix the bug as following

error: cannot convert '__va_list_tag**' to '__va_list_tag (*)[1]' for
argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**,
JSBool, jsval**, __va_list_tag (*)[1])'

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 ...ozjs17.0.0-fix-the-compile-bug-of-powerpc.patch | 36 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
new file mode 100644
index 0000000..de72d4f
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
@@ -0,0 +1,36 @@
+From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 26 Jan 2015 08:53:19 +0900
+Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
+
+To fix the bug as following
+
+error: cannot convert '__va_list_tag**' to '__va_list_tag (*)[1]' for
+argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**,
+JSBool, jsval**, __va_list_tag (*)[1])'
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ jscpucfg.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/jscpucfg.h b/jscpucfg.h
+index dfb1c14..8683491 100644
+--- a/jscpucfg.h
++++ b/jscpucfg.h
+@@ -47,6 +47,12 @@
+ #elif defined(JS_HAVE_ENDIAN_H)
+ # include <endian.h>
+ 
++#if defined(_POWER) || defined(__powerpc__) || \
++    defined(__ppc__)
++# define HAVE_VA_LIST_AS_ARRAY 1
++# endif
++
++
+ # if defined(__BYTE_ORDER)
+ #  if __BYTE_ORDER == __LITTLE_ENDIAN
+ #   define IS_LITTLE_ENDIAN 1
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index ab01471..174f6fe 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 SRC_URI = " \
     http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
     file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
+    file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
 "
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
 SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba"
-- 
1.8.4.2


