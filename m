Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id DDC5170602
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 09:49:57 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so6137388wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KlgXu2jT6UOZwvkpY1gR/9/d9lVX5dJcfJ1Nryov+BU=;
	b=PgNgTXvHO7+6FW2+FDf9kghZ55NdPWbrVm6dscHNCH57v3vK5W05H8WK6ewzoe7lEA
	dX473rAGDIhi5vGpUyZ/xm0Vdl3VmyAEskM7oiiztmflDRljkiXKMCYOhaq3hXceZMvD
	Qv5z/v40ZR6OJa56CsZncCGE3pRMA8+GDaK28B7Hq6K4PPSKM2sONI3ANbXi7slYE2Tc
	hE99UolVM2Y4+LPFS6frzaHopdHmcQcNYGkOL4pOZUAftxE5moooPrFFDa7g6aqmmTmX
	BVhUFW/AYUOrxyA9YuBHVyAVwXXARDFRH/QtqDb1PGbunwju4UHkMSUOj6D38LOlHPp8
	NjUQ==
X-Received: by 10.180.10.98 with SMTP id h2mr22836488wib.29.1405849798403;
	Sun, 20 Jul 2014 02:49:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ed15sm28272979wic.9.2014.07.20.02.49.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 02:49:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 11:50:07 +0200
Message-Id: <1405849809-30338-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405849809-30338-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/4] webkit-efl: Fix type-limits warning
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
X-List-Received-Date: Sun, 20 Jul 2014 09:49:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  2 +-
 ...emorySamplerLinux-Fix-type-limits-warning.patch | 32 ++++++++++++++++++++++
 .../webkit/webkit-efl_2.3.4+svnr164189.bb          |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
index 864b9c9..c769c7f 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
@@ -20,7 +20,7 @@ index 409931c..345b346 100644
 +            # FIXME: When we use -fno-tree-dce to support the jsCStack branch merge, build error occurs due to the uninitialization. Temporarily we set
 +            # uninitialized as build warning in order to support the jsCStack merge. https://bugs.webkit.org/show_bug.cgi?id=127777.
 +            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter -Wno-error=uninitialized ${OLD_COMPILE_FLAGS}")
-+	    # | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp:161:104: error: cast from 'uint8_t* {aka unsigned char*}' to 'JSC::FloatTypedArrayAdaptor<double, JSC::GenericTypedArrayView<JSC::Float64Adaptor>, JSC::JSGenericTypedArrayView<JSC::Float64Adaptor>, (JSC::TypedArrayType)9u>::Type* {aka double*}' increases required alignment of target type [-Werror=cast-align]
++            # | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp:161:104: error: cast from 'uint8_t* {aka unsigned char*}' to 'JSC::FloatTypedArrayAdaptor<double, JSC::GenericTypedArrayView<JSC::Float64Adaptor>, JSC::JSGenericTypedArrayView<JSC::Float64Adaptor>, (JSC::TypedArrayType)9u>::Type* {aka double*}' increases required alignment of target type [-Werror=cast-align]
 +            set(OLD_COMPILE_FLAGS "-Wno-error=cast-align -Wno-error=array-bounds -Wno-error=deprecated-declarations ${OLD_COMPILE_FLAGS}")
          endif ()
  
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch
new file mode 100644
index 0000000..f30987b
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch
@@ -0,0 +1,32 @@
+From ed7972510df191d9fabe7aff2f688cbc45f0c955 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 20 Jul 2014 10:52:17 +0200
+Subject: [PATCH] WebMemorySamplerLinux: Fix type-limits warning
+
+* otherwise it fails with:
+  webkit-efl/2.3.4+svnr164189-r0/efl-webkit/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp:70:16:
+  error: comparison is always false due to limited range of data type [-Werror=type-limits]
+  |          if (ch == EOF || (isASCIISpace(ch) && index)) // Break on non-initial ASCII space.
+  |                 ^
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp b/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
+index 7cb70d4..6bb78d8 100644
+--- a/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
++++ b/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
+@@ -67,7 +67,7 @@ static inline String nextToken(FILE* file)
+     unsigned int index = 0;
+     while (index < maxBuffer) {
+         char ch = fgetc(file);
+-        if (ch == EOF || (isASCIISpace(ch) && index)) // Break on non-initial ASCII space.
++        if (isASCIISpace(ch) && index) // Break on non-initial ASCII space.
+             break;
+         if (!isASCIISpace(ch)) {
+             buffer[index] = ch;
+-- 
+2.0.0
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
index 65418ca..748ecea 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
@@ -5,6 +5,7 @@ SRC_URI = "\
     file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
     file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch \
     file://0003-Fix-linking-issue.patch \
+    file://0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch \
 "
 SRC_URI[md5sum] = "731513fc042ec8e03840bc1ab6a66771"
 SRC_URI[sha256sum] = "660aefd65c0e5c6494eaec30539cda5f40fbdff17f28e7e83d341b245227cccd"
-- 
2.0.0


