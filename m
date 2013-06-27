Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 628126ABBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:49:04 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so526608eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2tXb792n/NJXq1WfNlYZrjUNtRyUPFHAu0jAjo4a8Yc=;
	b=iNnjqG+GjipYPuwZP/L7loUR8PmlssQWke57cFD9FVBdiLZkyvC7G0On0nPgpxAeEO
	Fv3O6fd+nCsVYnfPty2376OCI9aYuYDEbaCwyLQOGFdAqqGRU1J8rgDfw4XSm9LCj6i6
	u2V2aPwdsiwHUWeV1UCJ90ccPuCpeb2jm04ZAGBq0bNVbqCCnQRyjI7LfCuEG1g8+rZ+
	ugfJTxxR9C06AV69UEgM4a+DN+cTslIr5YhmDHLJLY/XbqbhaDIiYffOvv6Ihtevb/16
	OA6R0N0Qa0UpxDlhVTIJCBNqDLjP7VQvB3OQwBgfrbT285JdazrkxQZ7nc3zN2iGbZRl
	fneg==
X-Received: by 10.15.61.67 with SMTP id h43mr9813151eex.102.1372351744574;
	Thu, 27 Jun 2013 09:49:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm4936879eeb.8.2013.06.27.09.49.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 09:49:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2013 18:49:38 +0200
Message-Id: <1372351778-11262-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-efl][PATCH] webkit-efl: Update patch to fix undefined hasTagName reference
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
X-List-Received-Date: Thu, 27 Jun 2013 16:49:04 -0000

* some builds were still failing to link DumpRenderTree
  and nm revealed that another possible source of this reference is
  CSSStyleSheet:
  ./src/lib/libwebcore_efl.so
   U _ZNK7WebCore4Node10hasTagNameERKNS_13QualifiedNameE
  ./src/Source/WebCore/CMakeFiles/webcore_efl.dir/css/CSSStyleSheet.cpp.o
   U _ZNK7WebCore4Node10hasTagNameERKNS_13QualifiedNameE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...include-Element.h-for-hasTagName-function.patch | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
index f553663..153097b 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
@@ -1,4 +1,4 @@
-From 3de7c4633751c3e55152d4e2429dfcc0f69a1de3 Mon Sep 17 00:00:00 2001
+From a5a5eeb10b56ad1f98899a02281ea825e3cd1202 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 1 Jun 2013 19:23:54 +0200
 Subject: [PATCH] ewk: include Element.h for hasTagName function
@@ -7,13 +7,28 @@ Subject: [PATCH] ewk: include Element.h for hasTagName function
   | ../../../lib/libwebcore_efl.so.0.1.0: undefined reference to `WebCore::Node::hasTagName(WebCore::QualifiedName const&) const'
   | collect2: error: ld returned 1 exit status
   | make[2]: *** [bin/DumpRenderTree] Error 1
+* SDL port has similar issue:
+  https://bugs.webkit.org/show_bug.cgi?id=88536
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- Source/WebKit/efl/ewk/ewk_frame.cpp | 1 +
- Source/WebKit/efl/ewk/ewk_view.cpp  | 1 +
- 2 files changed, 2 insertions(+)
+ Source/WebCore/css/CSSStyleSheet.cpp | 1 +
+ Source/WebKit/efl/ewk/ewk_frame.cpp  | 1 +
+ Source/WebKit/efl/ewk/ewk_view.cpp   | 1 +
+ 3 files changed, 3 insertions(+)
 
+diff --git a/Source/WebCore/css/CSSStyleSheet.cpp b/Source/WebCore/css/CSSStyleSheet.cpp
+index 00b2d91..1d03c2e 100644
+--- a/Source/WebCore/css/CSSStyleSheet.cpp
++++ b/Source/WebCore/css/CSSStyleSheet.cpp
+@@ -29,6 +29,7 @@
+ #include "CSSStyleRule.h"
+ #include "CachedCSSStyleSheet.h"
+ #include "Document.h"
++#include "Element.h"
+ #include "ExceptionCode.h"
+ #include "HTMLNames.h"
+ #include "MediaList.h"
 diff --git a/Source/WebKit/efl/ewk/ewk_frame.cpp b/Source/WebKit/efl/ewk/ewk_frame.cpp
 index fd1ffd2..c86601a 100644
 --- a/Source/WebKit/efl/ewk/ewk_frame.cpp
-- 
1.8.2.1


