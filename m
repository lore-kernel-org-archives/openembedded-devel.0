Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14C426098F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jun 2013 18:03:13 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id b15so671592eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jun 2013 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dmJwEq9NJu/L45gs74PHcWhg8n1UtHdCb4BgmmaS25I=;
	b=kRhRurHFw1g4rel/eTcmUvDWOlnyKZ0WYDw3rD/8jCmVkXy0fp9RdGsDlqB2KeISB2
	6a1M5ce8wE5BMX70/zypmZE1udMTleytk+VyIN5k8ifuzk5iy2GswosH3dxN2VhjSfm3
	1W+vNtO2KQzWV57xNZh9ljXWrDI0S3FUHIaeR0s33ML1a1iF/HETi4MwElP++XArUBNG
	Z+cD2eqtT/s4v08qTV1l3yqWUAyYEHUql1gzGi5jxKJ990WU8Ivu9P6YwVUVQYuMq2j2
	w+RzlGNSTgu4fksIOUWrFoiQyCnmCE+G0wOdmuHaLjjXLYFo/PUVW4LnLJrwbua4jpLf
	CG/Q==
X-Received: by 10.14.215.137 with SMTP id e9mr17485565eep.44.1370109793563;
	Sat, 01 Jun 2013 11:03:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a5sm74356832ees.6.2013.06.01.11.03.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Jun 2013 11:03:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jun 2013 20:03:22 +0200
Message-Id: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-efl][PATCH] webkit-efl: Fix build with gcc-4.8
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
X-List-Received-Date: Sat, 01 Jun 2013 18:03:14 -0000

---
 ...include-Element.h-for-hasTagName-function.patch | 43 ++++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
new file mode 100644
index 0000000..f553663
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
@@ -0,0 +1,43 @@
+From 3de7c4633751c3e55152d4e2429dfcc0f69a1de3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 1 Jun 2013 19:23:54 +0200
+Subject: [PATCH] ewk: include Element.h for hasTagName function
+
+* ewebkit build fails like gtk in http://trac.webkit.org/changeset/72745
+  | ../../../lib/libwebcore_efl.so.0.1.0: undefined reference to `WebCore::Node::hasTagName(WebCore::QualifiedName const&) const'
+  | collect2: error: ld returned 1 exit status
+  | make[2]: *** [bin/DumpRenderTree] Error 1
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/WebKit/efl/ewk/ewk_frame.cpp | 1 +
+ Source/WebKit/efl/ewk/ewk_view.cpp  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Source/WebKit/efl/ewk/ewk_frame.cpp b/Source/WebKit/efl/ewk/ewk_frame.cpp
+index fd1ffd2..c86601a 100644
+--- a/Source/WebKit/efl/ewk/ewk_frame.cpp
++++ b/Source/WebKit/efl/ewk/ewk_frame.cpp
+@@ -32,6 +32,7 @@
+ #include "FocusController.h"
+ #include "FrameLoaderClientEfl.h"
+ #include "FrameView.h"
++#include "Element.h"
+ #include "HTMLCollection.h"
+ #include "HTMLHeadElement.h"
+ #include "HTMLImageElement.h"
+diff --git a/Source/WebKit/efl/ewk/ewk_view.cpp b/Source/WebKit/efl/ewk/ewk_view.cpp
+index 9798e94..7a5da60 100644
+--- a/Source/WebKit/efl/ewk/ewk_view.cpp
++++ b/Source/WebKit/efl/ewk/ewk_view.cpp
+@@ -36,6 +36,7 @@
+ #include "FocusController.h"
+ #include "FrameLoaderClientEfl.h"
+ #include "FrameView.h"
++#include "Element.h"
+ #include "GraphicsContext.h"
+ #include "HTMLElement.h"
+ #include "HTMLInputElement.h"
+-- 
+1.8.2.1
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index be5a534..ce73431 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -12,7 +12,7 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
 # 120145 and 122103 introduces dependency on libsoup-2.39.3 and glib-networking-2.33.2
 SRCREV = "120144"
 PV = "1.9.3+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRCREV_FORMAT = "source"
 
@@ -22,6 +22,7 @@ SRC_URI = "\
     svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src \
     svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src \
     svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src \
+    file://0001-ewk-include-Element.h-for-hasTagName-function.patch \
     file://CMakeLists.txt \
     file://bison-2.6.patch \
 "
-- 
1.8.2.1


