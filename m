Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBBE78082
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 12:09:05 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z45so10548329wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G1SMPl69ViiCNWmrrpJlmlplx9+fO53TE5uzw55i1HA=;
	b=XUM9JYg7S1yNZlbsy5lD7EpZehQQW1eHyBrhflm0xHI1fnHdurLyCrs3UVhMAZBQvB
	ilCHxeazwBumrgGd035MIJBgZvtWFwAZYfMDPgCwDjc5kn9lekMxs2Djy01OcJc3tzFu
	+lghNKR1oTMch6KrAJqd4IjPN8Iooe1lpvhmZ6JdtsvHMDQmJVFUlaM1LDXww/UMhUM1
	V1GpqdMCnFlNpZ/HvJ+L/8jePuP7Sv/74aa5I0jkeNf0OI9m0/FQ9NdZJrWX79yk0JrW
	pGc2EJXwyI39p+fNP8cNfOxG+Uw1TC7KigAPFUP2/ffa3Kh+OcRrghqFuUtjeYHEl2Yr
	cBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G1SMPl69ViiCNWmrrpJlmlplx9+fO53TE5uzw55i1HA=;
	b=o79C4LHsrESTicx5dEFmMm/zy0lHFGZ0H2dZoen+vccAZZovlqu4VwvuRoVLxG4mXo
	YkLWo+bHBn4FvWlB5F/ca5eRdlzgUEe/4mos5sM3e45q0f56HCyayobWSS2pltcVbJWL
	XWALJLZzmUF1BGyuWPgpd8EO2LaHAHl5hXAlvCTXqCLcDTo7pOePYXDXiorxu056ciwK
	OgKjLcb8hv1G8RL4ddHKVuyOyayD6vGk7jFHEhIzGqjM6cGoXg5ZO0bPj6QxjXXeQRN4
	5LPFIEfIHtgoZcaHaM/WXaGSJ4P6dOqXPv4VZre9Lkzum7Az63vWPH7P6J2NnFkTZwSr
	2czg==
X-Gm-Message-State: AKS2vOwGmbeatl7S/yh63CZ8wWnw0P902ftkvHmfUHJQRbSUMo4UPKWF
	Z4C47jNRIHlpJ91k
X-Received: by 10.223.139.19 with SMTP id n19mr14403760wra.116.1497787745761; 
	Sun, 18 Jun 2017 05:09:05 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t70sm12990823wmd.1.2017.06.18.05.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jun 2017 05:09:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jun 2017 14:09:08 +0200
Message-Id: <20170618120909.3499-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <CA+chaQdyLDc38rC-geZay6JO_QcsUZn0ZUJPVzqWXcO-wxP2ww@mail.gmail.com>
References: <CA+chaQdyLDc38rC-geZay6JO_QcsUZn0ZUJPVzqWXcO-wxP2ww@mail.gmail.com>
Subject: [meta-browser][PATCHv3 1/2] chromium(-wayland): Fix build with gcc7
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
X-List-Received-Date: Sun, 18 Jun 2017 12:09:07 -0000

* add 3 patches to fix issues detected by gcc7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |    2 +
 .../chromium/chromium-wayland_53.0.2785.143.bb     |    1 +
 .../files/0001-v8-fix-build-with-gcc7.patch        |  112 ++
 .../files/0002-WebKit-fix-build-with-gcc7.patch    |   31 +
 .../files/0003-pdfium-fix-build-with-gcc7.patch    | 1317 ++++++++++++++++++++
 5 files changed, 1463 insertions(+)
 create mode 100644 recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
 create mode 100644 recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
 create mode 100644 recipes-browser/chromium/files/0003-pdfium-fix-build-with-gcc7.patch

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index ad8e497..08853b1 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -26,6 +26,8 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://api-keys.patch;patchdir=${WORKDIR}', '', d)} \
         file://google-chrome.desktop \
         file://unset-madv-free.patch \
+        file://0001-v8-fix-build-with-gcc7.patch \
+        file://0002-WebKit-fix-build-with-gcc7.patch \
 "
 
 S = "${WORKDIR}/chromium-${PV}"
diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
index 5fc554b..cc844c3 100644
--- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -6,6 +6,7 @@ DEPENDS += "wayland libxkbcommon"
 
 SRC_URI += "\
         file://chromium-wayland/add_missing_stat_h_include.patch \
+        file://0003-pdfium-fix-build-with-gcc7.patch \
         file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://0005-Override-root-filesystem-access-restriction.patch \
diff --git a/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..0509238
--- /dev/null
+++ b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
@@ -0,0 +1,112 @@
+Use the fix from nodejs:
+https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f51210c50e8
+
+* fixes:
+| ../../git/src/v8/src/objects-body-descriptors.h: In static member function 'static void v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*, int)':
+| ../../git/src/v8/src/objects-body-descriptors.h:102:20: error: no matching function for call to 'v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*&)'
+|      IterateBody(obj);
+|                     ^
+
+and
+
+| ../../v8/src/objects.h: In member function 'uint32_t v8::internal::HashTable<Derived, Shape, Key>::Hash(Key)':
+| ../../v8/src/objects.h:3205:46: error: invalid use of incomplete type 'class v8::internal::Heap' [-Werror]
+|        return Shape::SeededHash(key, GetHeap()->HashSeed());
+|                                               ^~
+
+and
+
+../../v8/src/heap/mark-compact.cc:3660:43: error: 'v8::internal::PointerUpdateJobTraits<direction>::UpdateTypedPointers(v8::internal::Heap*, v8::internal::MemoryChunk*)::<lambda(v8::internal::SlotType, v8::internal::Address, v8::internal::Address)> [with v8::internal::PointerDirection direction = (v8::internal::PointerDirection)1; v8::internal::Address = unsigned char*; v8::internal::byte = unsigned char]::<lambda(v8::internal::Object**)>' declared with greater visibility than the type of its field 'v8::internal::PointerUpdateJobTraits<direction>::UpdateTypedPointers(v8::internal::Heap*, v8::internal::MemoryChunk*)::<lambda(v8::internal::SlotType, v8::internal::Address, v8::internal::Address)> [with v8::internal::PointerDirection direction = (v8::internal::PointerDirection)1; v8::internal::Address = unsigned char*; v8::internal::byte = unsigned char]::<lambda(v8::internal::Object**)>::<heap capture>' [-Werror=attributes]
+
+--- chromium-54.0.2810.2.orig/v8/src/objects-body-descriptors.h	2016-07-28 12:17:37.000000000 -1000
++++ chromium-54.0.2810.2/v8/src/objects-body-descriptors.h	2017-06-16 01:20:50.026665439 -1000
+@@ -99,7 +99,7 @@
+ 
+   template <typename StaticVisitor>
+   static inline void IterateBody(HeapObject* obj, int object_size) {
+-    IterateBody(obj);
++    IterateBody<StaticVisitor>(obj);
+   }
+ };
+ 
+diff -uNr chromium-53.0.2785.143.orig//v8//src/objects.h chromium-53.0.2785.143/v8//src/objects.h
+--- chromium-53.0.2785.143.orig//v8//src/objects.h	2016-09-29 09:05:23.000000000 -1000
++++ chromium-53.0.2785.143/v8//src/objects.h	2017-06-17 00:04:02.287124975 -1000
+@@ -3199,22 +3199,10 @@
+  public:
+   typedef Shape ShapeT;
+ 
+-  // Wrapper methods
+-  inline uint32_t Hash(Key key) {
+-    if (Shape::UsesSeed) {
+-      return Shape::SeededHash(key, GetHeap()->HashSeed());
+-    } else {
+-      return Shape::Hash(key);
+-    }
+-  }
+-
+-  inline uint32_t HashForObject(Key key, Object* object) {
+-    if (Shape::UsesSeed) {
+-      return Shape::SeededHashForObject(key, GetHeap()->HashSeed(), object);
+-    } else {
+-      return Shape::HashForObject(key, object);
+-    }
+-  }
++  // Wrapper methods.  Defined in src/objects-inl.h
++  // to break a cycle with src/heap/heap.h.
++  inline uint32_t Hash(Key key);
++  inline uint32_t HashForObject(Key key, Object* object);
+ 
+   // Returns a new HashTable object.
+   MUST_USE_RESULT static Handle<Derived> New(
+diff -uNr chromium-53.0.2785.143.orig//v8//src/objects-inl.h chromium-53.0.2785.143/v8//src/objects-inl.h
+--- chromium-53.0.2785.143.orig//v8//src/objects-inl.h	2016-09-29 09:05:23.000000000 -1000
++++ chromium-53.0.2785.143/v8//src/objects-inl.h	2017-06-17 00:03:08.202099672 -1000
+@@ -38,6 +38,26 @@
+ namespace v8 {
+ namespace internal {
+ 
++template <typename Derived, typename Shape, typename Key>
++uint32_t HashTable<Derived, Shape, Key>::Hash(Key key) {
++  if (Shape::UsesSeed) {
++    return Shape::SeededHash(key, GetHeap()->HashSeed());
++  } else {
++    return Shape::Hash(key);
++  }
++}
++
++
++template <typename Derived, typename Shape, typename Key>
++uint32_t HashTable<Derived, Shape, Key>::HashForObject(Key key,
++                                                       Object* object) {
++  if (Shape::UsesSeed) {
++    return Shape::SeededHashForObject(key, GetHeap()->HashSeed(), object);
++  } else {
++    return Shape::HashForObject(key, object);
++  }
++}
++
+ PropertyDetails::PropertyDetails(Smi* smi) {
+   value_ = smi->value();
+ }
+--- chromium-53.0.2785.143.orig/v8/src/heap/mark-compact.cc	2016-09-29 09:05:23.000000000 -1000
++++ chromium-53.0.2785.143/v8/src/heap/mark-compact.cc	2017-06-17 07:19:14.738159288 -1000
+@@ -3614,6 +3614,9 @@
+ #endif
+ }
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wattributes"
++
+ template <PointerDirection direction>
+ class PointerUpdateJobTraits {
+  public:
+@@ -3701,6 +3704,8 @@
+   }
+ };
+ 
++#pragma GCC diagnostic pop
++
+ int NumberOfPointerUpdateTasks(int pages) {
+   if (!FLAG_parallel_pointer_update) return 1;
+   const int kMaxTasks = 4;
diff --git a/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..284a83c
--- /dev/null
+++ b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
@@ -0,0 +1,31 @@
+Based on qtwebengine-opensource-src-5.8.0-wtf-gcc7.patch from
+http://git.net/ml/scm-fedora-commits/2017-03/msg15697.html
+
+* Fixes:
+In file included from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadingTraits.h:14:0,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadState.h:37,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/GarbageCollected.h:8,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/Visitor.h:35,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/GCInfo.h:8,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/Heap.h:35,
+                 from ../../git/src/third_party/WebKit/Source/platform/heap/Handle.h:34,
+                 from ../../git/src/third_party/WebKit/public/platform/WebPrivatePtr.h:38,
+                 from ../../git/src/third_party/WebKit/public/platform/WebString.h:35,
+                 from ../../git/src/third_party/WebKit/Source/platform/exported/FilePathConversion.cpp:8:
+../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h: In member function 'void WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>::swap(WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>&)':
+../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: error: there are no arguments to 'swapAnchor' that depend on a template parameter, so a declaration of 'swapAnchor' must be available [-fpermissive]
+     swapAnchor(m_anchor, other.m_anchor);
+     ^~~~~~~~~~
+../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
+
+--- chromium-54.0.2810.2.orig/third_party/WebKit/Source/wtf/LinkedHashSet.h	2016-07-28 12:16:12.000000000 -1000
++++ chromium-54.0.2810.2/third_party/WebKit/Source/wtf/LinkedHashSet.h	2017-06-16 02:19:37.928797121 -1000
+@@ -542,6 +542,8 @@
+     return *this;
+ }
+ 
++inline void swapAnchor(LinkedHashSetNodeBase& a, LinkedHashSetNodeBase& b);
++
+ template<typename T, typename U, typename V, typename W>
+ inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
+ {
diff --git a/recipes-browser/chromium/files/0003-pdfium-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0003-pdfium-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..01ef1a0
--- /dev/null
+++ b/recipes-browser/chromium/files/0003-pdfium-fix-build-with-gcc7.patch
@@ -0,0 +1,1317 @@
+Use the fix from:
+https://codereview.chromium.org/2154503002
+
+* Fixes:
+../../git/src/third_party/pdfium/fpdfsdk/javascript/global.cpp:27:8: error: template argument '(unsigned int)N' involves template parameter(s)
+
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/app.cpp chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/app.cpp
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/app.cpp	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/app.cpp	2017-06-17 00:10:09.662094562 -1000
+@@ -454,7 +454,7 @@
+ }
+ 
+ void app::ClearTimerCommon(const CJS_Value& param) {
+-  if (param.GetType() != CJS_Value::VT_fxobject)
++  if (param.GetType() != CJS_Value::VT_object)
+     return;
+ 
+   v8::Local<v8::Object> pObj = param.ToV8Object();
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/app.cpp.orig chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/app.cpp.orig
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/app.cpp.orig	1969-12-31 14:00:00.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/app.cpp.orig	2016-09-29 09:05:05.000000000 -1000
+@@ -0,0 +1,707 @@
++// Copyright 2014 PDFium Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style license that can be
++// found in the LICENSE file.
++
++// Original code copyright 2014 Foxit Software Inc. http://www.foxitsoftware.com
++
++#include "fpdfsdk/javascript/app.h"
++
++#include <memory>
++#include <vector>
++
++#include "fpdfsdk/include/fsdk_mgr.h"
++#include "fpdfsdk/javascript/Document.h"
++#include "fpdfsdk/javascript/JS_Define.h"
++#include "fpdfsdk/javascript/JS_EventHandler.h"
++#include "fpdfsdk/javascript/JS_Object.h"
++#include "fpdfsdk/javascript/JS_Value.h"
++#include "fpdfsdk/javascript/cjs_context.h"
++#include "fpdfsdk/javascript/cjs_runtime.h"
++#include "fpdfsdk/javascript/resource.h"
++
++BEGIN_JS_STATIC_CONST(CJS_TimerObj)
++END_JS_STATIC_CONST()
++
++BEGIN_JS_STATIC_PROP(CJS_TimerObj)
++END_JS_STATIC_PROP()
++
++BEGIN_JS_STATIC_METHOD(CJS_TimerObj)
++END_JS_STATIC_METHOD()
++
++IMPLEMENT_JS_CLASS(CJS_TimerObj, TimerObj)
++
++TimerObj::TimerObj(CJS_Object* pJSObject)
++    : CJS_EmbedObj(pJSObject), m_nTimerID(0) {}
++
++TimerObj::~TimerObj() {}
++
++void TimerObj::SetTimer(CJS_Timer* pTimer) {
++  m_nTimerID = pTimer->GetTimerID();
++}
++
++#define JS_STR_VIEWERTYPE L"pdfium"
++#define JS_STR_VIEWERVARIATION L"Full"
++#define JS_STR_PLATFORM L"WIN"
++#define JS_STR_LANGUANGE L"ENU"
++#define JS_NUM_VIEWERVERSION 8
++#ifdef PDF_ENABLE_XFA
++#define JS_NUM_VIEWERVERSION_XFA 11
++#endif  // PDF_ENABLE_XFA
++#define JS_NUM_FORMSVERSION 7
++
++BEGIN_JS_STATIC_CONST(CJS_App)
++END_JS_STATIC_CONST()
++
++BEGIN_JS_STATIC_PROP(CJS_App)
++JS_STATIC_PROP_ENTRY(activeDocs)
++JS_STATIC_PROP_ENTRY(calculate)
++JS_STATIC_PROP_ENTRY(formsVersion)
++JS_STATIC_PROP_ENTRY(fs)
++JS_STATIC_PROP_ENTRY(fullscreen)
++JS_STATIC_PROP_ENTRY(language)
++JS_STATIC_PROP_ENTRY(media)
++JS_STATIC_PROP_ENTRY(platform)
++JS_STATIC_PROP_ENTRY(runtimeHighlight)
++JS_STATIC_PROP_ENTRY(viewerType)
++JS_STATIC_PROP_ENTRY(viewerVariation)
++JS_STATIC_PROP_ENTRY(viewerVersion)
++END_JS_STATIC_PROP()
++
++BEGIN_JS_STATIC_METHOD(CJS_App)
++JS_STATIC_METHOD_ENTRY(alert)
++JS_STATIC_METHOD_ENTRY(beep)
++JS_STATIC_METHOD_ENTRY(browseForDoc)
++JS_STATIC_METHOD_ENTRY(clearInterval)
++JS_STATIC_METHOD_ENTRY(clearTimeOut)
++JS_STATIC_METHOD_ENTRY(execDialog)
++JS_STATIC_METHOD_ENTRY(execMenuItem)
++JS_STATIC_METHOD_ENTRY(findComponent)
++JS_STATIC_METHOD_ENTRY(goBack)
++JS_STATIC_METHOD_ENTRY(goForward)
++JS_STATIC_METHOD_ENTRY(launchURL)
++JS_STATIC_METHOD_ENTRY(mailMsg)
++JS_STATIC_METHOD_ENTRY(newFDF)
++JS_STATIC_METHOD_ENTRY(newDoc)
++JS_STATIC_METHOD_ENTRY(openDoc)
++JS_STATIC_METHOD_ENTRY(openFDF)
++JS_STATIC_METHOD_ENTRY(popUpMenuEx)
++JS_STATIC_METHOD_ENTRY(popUpMenu)
++JS_STATIC_METHOD_ENTRY(response)
++JS_STATIC_METHOD_ENTRY(setInterval)
++JS_STATIC_METHOD_ENTRY(setTimeOut)
++END_JS_STATIC_METHOD()
++
++IMPLEMENT_JS_CLASS(CJS_App, app)
++
++app::app(CJS_Object* pJSObject)
++    : CJS_EmbedObj(pJSObject), m_bCalculate(true), m_bRuntimeHighLight(false) {}
++
++app::~app() {
++}
++
++FX_BOOL app::activeDocs(IJS_Context* cc,
++                        CJS_PropValue& vp,
++                        CFX_WideString& sError) {
++  if (!vp.IsGetting())
++    return FALSE;
++
++  CJS_Context* pContext = (CJS_Context*)cc;
++  CPDFDoc_Environment* pApp = pContext->GetReaderApp();
++  CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++  CPDFSDK_Document* pCurDoc = pContext->GetReaderDocument();
++  CJS_Array aDocs(pRuntime);
++  if (CPDFSDK_Document* pDoc = pApp->GetSDKDocument()) {
++    CJS_Document* pJSDocument = nullptr;
++    if (pDoc == pCurDoc) {
++      v8::Local<v8::Object> pObj = FXJS_GetThisObj(pRuntime->GetIsolate());
++      if (FXJS_GetObjDefnID(pObj) == CJS_Document::g_nObjDefnID)
++        pJSDocument =
++            (CJS_Document*)FXJS_GetPrivate(pRuntime->GetIsolate(), pObj);
++    } else {
++      v8::Local<v8::Object> pObj = FXJS_NewFxDynamicObj(
++          pRuntime->GetIsolate(), pRuntime, CJS_Document::g_nObjDefnID);
++      pJSDocument =
++          (CJS_Document*)FXJS_GetPrivate(pRuntime->GetIsolate(), pObj);
++      ASSERT(pJSDocument);
++    }
++    aDocs.SetElement(0, CJS_Value(pRuntime, pJSDocument));
++  }
++  if (aDocs.GetLength() > 0)
++    vp << aDocs;
++  else
++    vp.SetNull();
++
++  return TRUE;
++}
++
++FX_BOOL app::calculate(IJS_Context* cc,
++                       CJS_PropValue& vp,
++                       CFX_WideString& sError) {
++  if (vp.IsSetting()) {
++    bool bVP;
++    vp >> bVP;
++    m_bCalculate = (FX_BOOL)bVP;
++
++    CJS_Context* pContext = (CJS_Context*)cc;
++    CPDFDoc_Environment* pApp = pContext->GetReaderApp();
++    CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++    CJS_Array aDocs(pRuntime);
++    if (CPDFSDK_Document* pDoc = pApp->GetSDKDocument())
++      pDoc->GetInterForm()->EnableCalculate((FX_BOOL)m_bCalculate);
++  } else {
++    vp << (bool)m_bCalculate;
++  }
++  return TRUE;
++}
++
++FX_BOOL app::formsVersion(IJS_Context* cc,
++                          CJS_PropValue& vp,
++                          CFX_WideString& sError) {
++  if (vp.IsGetting()) {
++    vp << JS_NUM_FORMSVERSION;
++    return TRUE;
++  }
++
++  return FALSE;
++}
++
++FX_BOOL app::viewerType(IJS_Context* cc,
++                        CJS_PropValue& vp,
++                        CFX_WideString& sError) {
++  if (vp.IsGetting()) {
++    vp << JS_STR_VIEWERTYPE;
++    return TRUE;
++  }
++
++  return FALSE;
++}
++
++FX_BOOL app::viewerVariation(IJS_Context* cc,
++                             CJS_PropValue& vp,
++                             CFX_WideString& sError) {
++  if (vp.IsGetting()) {
++    vp << JS_STR_VIEWERVARIATION;
++    return TRUE;
++  }
++
++  return FALSE;
++}
++
++FX_BOOL app::viewerVersion(IJS_Context* cc,
++                           CJS_PropValue& vp,
++                           CFX_WideString& sError) {
++  if (!vp.IsGetting())
++    return FALSE;
++#ifdef PDF_ENABLE_XFA
++  CJS_Context* pContext = (CJS_Context*)cc;
++  CPDFSDK_Document* pCurDoc = pContext->GetReaderDocument();
++  CPDFXFA_Document* pDoc = pCurDoc->GetXFADocument();
++  if (pDoc->GetDocType() == 1 || pDoc->GetDocType() == 2) {
++    vp << JS_NUM_VIEWERVERSION_XFA;
++    return TRUE;
++  }
++#endif  // PDF_ENABLE_XFA
++  vp << JS_NUM_VIEWERVERSION;
++  return TRUE;
++}
++
++FX_BOOL app::platform(IJS_Context* cc,
++                      CJS_PropValue& vp,
++                      CFX_WideString& sError) {
++  if (!vp.IsGetting())
++    return FALSE;
++#ifdef PDF_ENABLE_XFA
++  CPDFDoc_Environment* pEnv =
++      static_cast<CJS_Context*>(cc)->GetJSRuntime()->GetReaderApp();
++  if (!pEnv)
++    return FALSE;
++  CFX_WideString platfrom = pEnv->FFI_GetPlatform();
++  if (!platfrom.IsEmpty()) {
++    vp << platfrom;
++    return TRUE;
++  }
++#endif
++  vp << JS_STR_PLATFORM;
++  return TRUE;
++}
++
++FX_BOOL app::language(IJS_Context* cc,
++                      CJS_PropValue& vp,
++                      CFX_WideString& sError) {
++  if (!vp.IsGetting())
++    return FALSE;
++#ifdef PDF_ENABLE_XFA
++  CPDFDoc_Environment* pEnv =
++      static_cast<CJS_Context*>(cc)->GetJSRuntime()->GetReaderApp();
++  if (!pEnv)
++    return FALSE;
++  CFX_WideString language = pEnv->FFI_GetLanguage();
++  if (!language.IsEmpty()) {
++    vp << language;
++    return TRUE;
++  }
++#endif
++  vp << JS_STR_LANGUANGE;
++  return TRUE;
++}
++
++// creates a new fdf object that contains no data
++// comment: need reader support
++// note:
++// CFDF_Document * CPDFDoc_Environment::NewFDF();
++FX_BOOL app::newFDF(IJS_Context* cc,
++                    const std::vector<CJS_Value>& params,
++                    CJS_Value& vRet,
++                    CFX_WideString& sError) {
++  return TRUE;
++}
++// opens a specified pdf document and returns its document object
++// comment:need reader support
++// note: as defined in js reference, the proto of this function's fourth
++// parmeters, how old an fdf document while do not show it.
++// CFDF_Document * CPDFDoc_Environment::OpenFDF(string strPath,bool bUserConv);
++
++FX_BOOL app::openFDF(IJS_Context* cc,
++                     const std::vector<CJS_Value>& params,
++                     CJS_Value& vRet,
++                     CFX_WideString& sError) {
++  return TRUE;
++}
++
++FX_BOOL app::alert(IJS_Context* cc,
++                   const std::vector<CJS_Value>& params,
++                   CJS_Value& vRet,
++                   CFX_WideString& sError) {
++  CJS_Context* pContext = static_cast<CJS_Context*>(cc);
++  CJS_Runtime* pRuntime = CJS_Runtime::FromContext(cc);
++  std::vector<CJS_Value> newParams = JS_ExpandKeywordParams(
++      pRuntime, params, 4, L"cMsg", L"nIcon", L"nType", L"cTitle");
++
++  if (newParams[0].GetType() == CJS_Value::VT_unknown) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++
++  CFX_WideString swMsg;
++  if (newParams[0].GetType() == CJS_Value::VT_object) {
++    CJS_Array carray(pRuntime);
++    if (newParams[0].ConvertToArray(carray)) {
++      swMsg = L"[";
++      CJS_Value element(pRuntime);
++      for (int i = 0; i < carray.GetLength(); ++i) {
++        if (i)
++          swMsg += L", ";
++        carray.GetElement(i, element);
++        swMsg += element.ToCFXWideString();
++      }
++      swMsg += L"]";
++    } else {
++      swMsg = newParams[0].ToCFXWideString();
++    }
++  } else {
++    swMsg = newParams[0].ToCFXWideString();
++  }
++
++  int iIcon = 0;
++  if (newParams[1].GetType() != CJS_Value::VT_unknown)
++    iIcon = newParams[1].ToInt();
++
++  int iType = 0;
++  if (newParams[2].GetType() != CJS_Value::VT_unknown)
++    iType = newParams[2].ToInt();
++
++  CFX_WideString swTitle;
++  if (newParams[3].GetType() != CJS_Value::VT_unknown)
++    swTitle = newParams[3].ToCFXWideString();
++  else
++    swTitle = JSGetStringFromID(pContext, IDS_STRING_JSALERT);
++
++  pRuntime->BeginBlock();
++  vRet = MsgBox(pRuntime->GetReaderApp(), swMsg.c_str(), swTitle.c_str(), iType,
++                iIcon);
++  pRuntime->EndBlock();
++  return TRUE;
++}
++
++FX_BOOL app::beep(IJS_Context* cc,
++                  const std::vector<CJS_Value>& params,
++                  CJS_Value& vRet,
++                  CFX_WideString& sError) {
++  if (params.size() == 1) {
++    CJS_Context* pContext = (CJS_Context*)cc;
++    CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++    CPDFDoc_Environment* pEnv = pRuntime->GetReaderApp();
++    pEnv->JS_appBeep(params[0].ToInt());
++    return TRUE;
++  }
++
++  sError = JSGetStringFromID((CJS_Context*)cc, IDS_STRING_JSPARAMERROR);
++  return FALSE;
++}
++
++FX_BOOL app::findComponent(IJS_Context* cc,
++                           const std::vector<CJS_Value>& params,
++                           CJS_Value& vRet,
++                           CFX_WideString& sError) {
++  return TRUE;
++}
++
++FX_BOOL app::popUpMenuEx(IJS_Context* cc,
++                         const std::vector<CJS_Value>& params,
++                         CJS_Value& vRet,
++                         CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::fs(IJS_Context* cc, CJS_PropValue& vp, CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::setInterval(IJS_Context* cc,
++                         const std::vector<CJS_Value>& params,
++                         CJS_Value& vRet,
++                         CFX_WideString& sError) {
++  CJS_Context* pContext = (CJS_Context*)cc;
++  if (params.size() > 2 || params.size() == 0) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++
++  CFX_WideString script = params.size() > 0 ? params[0].ToCFXWideString() : L"";
++  if (script.IsEmpty()) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSAFNUMBER_KEYSTROKE);
++    return TRUE;
++  }
++
++  CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++  uint32_t dwInterval = params.size() > 1 ? params[1].ToInt() : 1000;
++  CPDFDoc_Environment* pApp = pRuntime->GetReaderApp();
++  m_Timers.push_back(std::unique_ptr<CJS_Timer>(
++      new CJS_Timer(this, pApp, pRuntime, 0, script, dwInterval, 0)));
++
++  v8::Local<v8::Object> pRetObj = FXJS_NewFxDynamicObj(
++      pRuntime->GetIsolate(), pRuntime, CJS_TimerObj::g_nObjDefnID);
++  CJS_TimerObj* pJS_TimerObj = static_cast<CJS_TimerObj*>(
++      FXJS_GetPrivate(pRuntime->GetIsolate(), pRetObj));
++  TimerObj* pTimerObj = static_cast<TimerObj*>(pJS_TimerObj->GetEmbedObject());
++  pTimerObj->SetTimer(m_Timers.back().get());
++
++  vRet = pRetObj;
++  return TRUE;
++}
++
++FX_BOOL app::setTimeOut(IJS_Context* cc,
++                        const std::vector<CJS_Value>& params,
++                        CJS_Value& vRet,
++                        CFX_WideString& sError) {
++  CJS_Context* pContext = static_cast<CJS_Context*>(cc);
++  if (params.size() > 2 || params.size() == 0) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++
++  CFX_WideString script = params[0].ToCFXWideString();
++  if (script.IsEmpty()) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSAFNUMBER_KEYSTROKE);
++    return TRUE;
++  }
++
++  uint32_t dwTimeOut = params.size() > 1 ? params[1].ToInt() : 1000;
++  CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++  CPDFDoc_Environment* pApp = pRuntime->GetReaderApp();
++  m_Timers.push_back(std::unique_ptr<CJS_Timer>(
++      new CJS_Timer(this, pApp, pRuntime, 1, script, dwTimeOut, dwTimeOut)));
++
++  v8::Local<v8::Object> pRetObj = FXJS_NewFxDynamicObj(
++      pRuntime->GetIsolate(), pRuntime, CJS_TimerObj::g_nObjDefnID);
++
++  CJS_TimerObj* pJS_TimerObj = static_cast<CJS_TimerObj*>(
++      FXJS_GetPrivate(pRuntime->GetIsolate(), pRetObj));
++
++  TimerObj* pTimerObj = static_cast<TimerObj*>(pJS_TimerObj->GetEmbedObject());
++  pTimerObj->SetTimer(m_Timers.back().get());
++
++  vRet = pRetObj;
++  return TRUE;
++}
++
++FX_BOOL app::clearTimeOut(IJS_Context* cc,
++                          const std::vector<CJS_Value>& params,
++                          CJS_Value& vRet,
++                          CFX_WideString& sError) {
++  CJS_Context* pContext = (CJS_Context*)cc;
++  if (params.size() != 1) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++
++  app::ClearTimerCommon(params[0]);
++  return TRUE;
++}
++
++FX_BOOL app::clearInterval(IJS_Context* cc,
++                           const std::vector<CJS_Value>& params,
++                           CJS_Value& vRet,
++                           CFX_WideString& sError) {
++  CJS_Context* pContext = (CJS_Context*)cc;
++  if (params.size() != 1) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++
++  app::ClearTimerCommon(params[0]);
++  return TRUE;
++}
++
++void app::ClearTimerCommon(const CJS_Value& param) {
++  if (param.GetType() != CJS_Value::VT_fxobject)
++    return;
++
++  v8::Local<v8::Object> pObj = param.ToV8Object();
++  if (FXJS_GetObjDefnID(pObj) != CJS_TimerObj::g_nObjDefnID)
++    return;
++
++  CJS_Object* pJSObj = param.ToCJSObject();
++  if (!pJSObj)
++    return;
++
++  TimerObj* pTimerObj = static_cast<TimerObj*>(pJSObj->GetEmbedObject());
++  if (!pTimerObj)
++    return;
++
++  CJS_Timer::Cancel(pTimerObj->GetTimerID());
++}
++
++FX_BOOL app::execMenuItem(IJS_Context* cc,
++                          const std::vector<CJS_Value>& params,
++                          CJS_Value& vRet,
++                          CFX_WideString& sError) {
++  return FALSE;
++}
++
++void app::TimerProc(CJS_Timer* pTimer) {
++  CJS_Runtime* pRuntime = pTimer->GetRuntime();
++  if (pRuntime && (!pTimer->IsOneShot() || pTimer->GetTimeOut() > 0))
++    RunJsScript(pRuntime, pTimer->GetJScript());
++}
++
++void app::CancelProc(CJS_Timer* pTimer) {
++  auto iter = std::find_if(m_Timers.begin(), m_Timers.end(),
++                           [pTimer](const std::unique_ptr<CJS_Timer>& that) {
++                             return pTimer == that.get();
++                           });
++
++  if (iter != m_Timers.end())
++    m_Timers.erase(iter);
++}
++
++void app::RunJsScript(CJS_Runtime* pRuntime, const CFX_WideString& wsScript) {
++  if (!pRuntime->IsBlocking()) {
++    IJS_Context* pContext = pRuntime->NewContext();
++    pContext->OnExternal_Exec();
++    CFX_WideString wtInfo;
++    pContext->RunScript(wsScript, &wtInfo);
++    pRuntime->ReleaseContext(pContext);
++  }
++}
++
++FX_BOOL app::goBack(IJS_Context* cc,
++                    const std::vector<CJS_Value>& params,
++                    CJS_Value& vRet,
++                    CFX_WideString& sError) {
++  // Not supported.
++  return TRUE;
++}
++
++FX_BOOL app::goForward(IJS_Context* cc,
++                       const std::vector<CJS_Value>& params,
++                       CJS_Value& vRet,
++                       CFX_WideString& sError) {
++  // Not supported.
++  return TRUE;
++}
++
++FX_BOOL app::mailMsg(IJS_Context* cc,
++                     const std::vector<CJS_Value>& params,
++                     CJS_Value& vRet,
++                     CFX_WideString& sError) {
++  CJS_Context* pContext = static_cast<CJS_Context*>(cc);
++  CJS_Runtime* pRuntime = pContext->GetJSRuntime();
++  std::vector<CJS_Value> newParams =
++      JS_ExpandKeywordParams(pRuntime, params, 6, L"bUI", L"cTo", L"cCc",
++                             L"cBcc", L"cSubject", L"cMsg");
++
++  if (newParams[0].GetType() == CJS_Value::VT_unknown) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++  bool bUI = newParams[0].ToBool();
++
++  CFX_WideString cTo;
++  if (newParams[1].GetType() != CJS_Value::VT_unknown) {
++    cTo = newParams[1].ToCFXWideString();
++  } else {
++    if (!bUI) {
++      // cTo parameter required when UI not invoked.
++      sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++      return FALSE;
++    }
++  }
++
++  CFX_WideString cCc;
++  if (newParams[2].GetType() != CJS_Value::VT_unknown)
++    cCc = newParams[2].ToCFXWideString();
++
++  CFX_WideString cBcc;
++  if (newParams[3].GetType() != CJS_Value::VT_unknown)
++    cBcc = newParams[3].ToCFXWideString();
++
++  CFX_WideString cSubject;
++  if (newParams[4].GetType() != CJS_Value::VT_unknown)
++    cSubject = newParams[4].ToCFXWideString();
++
++  CFX_WideString cMsg;
++  if (newParams[5].GetType() != CJS_Value::VT_unknown)
++    cMsg = newParams[5].ToCFXWideString();
++
++  pRuntime->BeginBlock();
++  pContext->GetReaderApp()->JS_docmailForm(nullptr, 0, bUI, cTo.c_str(),
++                                           cSubject.c_str(), cCc.c_str(),
++                                           cBcc.c_str(), cMsg.c_str());
++  pRuntime->EndBlock();
++  return TRUE;
++}
++
++FX_BOOL app::launchURL(IJS_Context* cc,
++                       const std::vector<CJS_Value>& params,
++                       CJS_Value& vRet,
++                       CFX_WideString& sError) {
++  // Unsafe, not supported.
++  return TRUE;
++}
++
++FX_BOOL app::runtimeHighlight(IJS_Context* cc,
++                              CJS_PropValue& vp,
++                              CFX_WideString& sError) {
++  if (vp.IsSetting()) {
++    vp >> m_bRuntimeHighLight;
++  } else {
++    vp << m_bRuntimeHighLight;
++  }
++  return TRUE;
++}
++
++FX_BOOL app::fullscreen(IJS_Context* cc,
++                        CJS_PropValue& vp,
++                        CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::popUpMenu(IJS_Context* cc,
++                       const std::vector<CJS_Value>& params,
++                       CJS_Value& vRet,
++                       CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::browseForDoc(IJS_Context* cc,
++                          const std::vector<CJS_Value>& params,
++                          CJS_Value& vRet,
++                          CFX_WideString& sError) {
++  // Unsafe, not supported.
++  return TRUE;
++}
++
++CFX_WideString app::SysPathToPDFPath(const CFX_WideString& sOldPath) {
++  CFX_WideString sRet = L"/";
++
++  for (int i = 0, sz = sOldPath.GetLength(); i < sz; i++) {
++    wchar_t c = sOldPath.GetAt(i);
++    if (c == L':') {
++    } else {
++      if (c == L'\\') {
++        sRet += L"/";
++      } else {
++        sRet += c;
++      }
++    }
++  }
++
++  return sRet;
++}
++
++FX_BOOL app::newDoc(IJS_Context* cc,
++                    const std::vector<CJS_Value>& params,
++                    CJS_Value& vRet,
++                    CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::openDoc(IJS_Context* cc,
++                     const std::vector<CJS_Value>& params,
++                     CJS_Value& vRet,
++                     CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::response(IJS_Context* cc,
++                      const std::vector<CJS_Value>& params,
++                      CJS_Value& vRet,
++                      CFX_WideString& sError) {
++  CJS_Context* pContext = static_cast<CJS_Context*>(cc);
++  CJS_Runtime* pRuntime = CJS_Runtime::FromContext(cc);
++  std::vector<CJS_Value> newParams =
++      JS_ExpandKeywordParams(pRuntime, params, 5, L"cQuestion", L"cTitle",
++                             L"cDefault", L"bPassword", L"cLabel");
++
++  if (newParams[0].GetType() == CJS_Value::VT_unknown) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAMERROR);
++    return FALSE;
++  }
++  CFX_WideString swQuestion = newParams[0].ToCFXWideString();
++
++  CFX_WideString swTitle = L"PDF";
++  if (newParams[1].GetType() != CJS_Value::VT_unknown)
++    swTitle = newParams[1].ToCFXWideString();
++
++  CFX_WideString swDefault;
++  if (newParams[2].GetType() != CJS_Value::VT_unknown)
++    swDefault = newParams[2].ToCFXWideString();
++
++  bool bPassword = false;
++  if (newParams[3].GetType() != CJS_Value::VT_unknown)
++    bPassword = newParams[3].ToBool();
++
++  CFX_WideString swLabel;
++  if (newParams[4].GetType() != CJS_Value::VT_unknown)
++    swLabel = newParams[4].ToCFXWideString();
++
++  const int MAX_INPUT_BYTES = 2048;
++  std::unique_ptr<char[]> pBuff(new char[MAX_INPUT_BYTES + 2]);
++  memset(pBuff.get(), 0, MAX_INPUT_BYTES + 2);
++
++  int nLengthBytes = pContext->GetReaderApp()->JS_appResponse(
++      swQuestion.c_str(), swTitle.c_str(), swDefault.c_str(), swLabel.c_str(),
++      bPassword, pBuff.get(), MAX_INPUT_BYTES);
++
++  if (nLengthBytes < 0 || nLengthBytes > MAX_INPUT_BYTES) {
++    sError = JSGetStringFromID(pContext, IDS_STRING_JSPARAM_TOOLONG);
++    return FALSE;
++  }
++
++  vRet = CFX_WideString::FromUTF16LE(reinterpret_cast<uint16_t*>(pBuff.get()),
++                                     nLengthBytes / sizeof(uint16_t))
++             .c_str();
++  return TRUE;
++}
++
++FX_BOOL app::media(IJS_Context* cc, CJS_PropValue& vp, CFX_WideString& sError) {
++  return FALSE;
++}
++
++FX_BOOL app::execDialog(IJS_Context* cc,
++                        const std::vector<CJS_Value>& params,
++                        CJS_Value& vRet,
++                        CFX_WideString& sError) {
++  return TRUE;
++}
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/Document.cpp chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/Document.cpp
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/Document.cpp	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/Document.cpp	2017-06-17 00:10:09.658094485 -1000
+@@ -411,22 +411,20 @@
+ 
+   int nlength = params.size();
+   if (nlength == 9) {
+-    if (params[8].GetType() == CJS_Value::VT_fxobject) {
++    if (params[8].GetType() == CJS_Value::VT_object) {
+       v8::Local<v8::Object> pObj = params[8].ToV8Object();
+-      {
+-        if (FXJS_GetObjDefnID(pObj) == CJS_PrintParamsObj::g_nObjDefnID) {
+-          if (CJS_Object* pJSObj = params[8].ToCJSObject()) {
+-            if (PrintParamsObj* pprintparamsObj =
+-                    (PrintParamsObj*)pJSObj->GetEmbedObject()) {
+-              bUI = pprintparamsObj->bUI;
+-              nStart = pprintparamsObj->nStart;
+-              nEnd = pprintparamsObj->nEnd;
+-              bSilent = pprintparamsObj->bSilent;
+-              bShrinkToFit = pprintparamsObj->bShrinkToFit;
+-              bPrintAsImage = pprintparamsObj->bPrintAsImage;
+-              bReverse = pprintparamsObj->bReverse;
+-              bAnnotations = pprintparamsObj->bAnnotations;
+-            }
++      if (FXJS_GetObjDefnID(pObj) == CJS_PrintParamsObj::g_nObjDefnID) {
++        if (CJS_Object* pJSObj = params[8].ToCJSObject()) {
++          if (PrintParamsObj* pprintparamsObj =
++                  static_cast<PrintParamsObj*>(pJSObj->GetEmbedObject())) {
++            bUI = pprintparamsObj->bUI;
++            nStart = pprintparamsObj->nStart;
++            nEnd = pprintparamsObj->nEnd;
++            bSilent = pprintparamsObj->bSilent;
++            bShrinkToFit = pprintparamsObj->bShrinkToFit;
++            bPrintAsImage = pprintparamsObj->bPrintAsImage;
++            bReverse = pprintparamsObj->bReverse;
++            bAnnotations = pprintparamsObj->bAnnotations;
+           }
+         }
+       }
+@@ -592,18 +590,16 @@
+     v8::Local<v8::Object> pObj = params[0].ToV8Object();
+     v8::Local<v8::Value> pValue = FXJS_GetObjectElement(isolate, pObj, L"cURL");
+     if (!pValue.IsEmpty())
+-      strURL =
+-          CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++      strURL = CJS_Value(pRuntime, pValue).ToCFXWideString();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"bFDF");
+-    bFDF = CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToBool();
++    bFDF = CJS_Value(pRuntime, pValue).ToBool();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"bEmpty");
+-    bEmpty = CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToBool();
++    bEmpty = CJS_Value(pRuntime, pValue).ToBool();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"aFields");
+-    aFields.Attach(
+-        CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToV8Array());
++    aFields.Attach(CJS_Value(pRuntime, pValue).ToV8Array());
+   }
+ 
+   CPDFSDK_InterForm* pInterForm = m_pDocument->GetInterForm();
+@@ -686,25 +682,22 @@
+     v8::Local<v8::Object> pObj = params[0].ToV8Object();
+ 
+     v8::Local<v8::Value> pValue = FXJS_GetObjectElement(isolate, pObj, L"bUI");
+-    bUI = CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToInt();
++    bUI = CJS_Value(pRuntime, pValue).ToInt();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"cTo");
+-    cTo = CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++    cTo = CJS_Value(pRuntime, pValue).ToCFXWideString();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"cCc");
+-    cCc = CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++    cCc = CJS_Value(pRuntime, pValue).ToCFXWideString();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"cBcc");
+-    cBcc =
+-        CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++    cBcc = CJS_Value(pRuntime, pValue).ToCFXWideString();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"cSubject");
+-    cSubject =
+-        CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++    cSubject = CJS_Value(pRuntime, pValue).ToCFXWideString();
+ 
+     pValue = FXJS_GetObjectElement(isolate, pObj, L"cMsg");
+-    cMsg =
+-        CJS_Value(pRuntime, pValue, GET_VALUE_TYPE(pValue)).ToCFXWideString();
++    cMsg = CJS_Value(pRuntime, pValue).ToCFXWideString();
+   }
+ 
+   pRuntime->BeginBlock();
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/global.cpp chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/global.cpp
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/global.cpp	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/global.cpp	2017-06-17 00:10:09.662094562 -1000
+@@ -17,63 +17,6 @@
+ #include "fpdfsdk/javascript/cjs_context.h"
+ #include "fpdfsdk/javascript/resource.h"
+ 
+-// Helper class for compile-time calculation of hash values in order to
+-// avoid having global object initializers.
+-template <unsigned ACC, wchar_t... Ns>
+-struct CHash;
+-
+-// Only needed to hash single-character strings.
+-template <wchar_t N>
+-struct CHash<N> {
+-  static const unsigned value = N;
+-};
+-
+-template <unsigned ACC, wchar_t N>
+-struct CHash<ACC, N> {
+-  static const unsigned value = (ACC * 1313LLU + N) & 0xFFFFFFFF;
+-};
+-
+-template <unsigned ACC, wchar_t N, wchar_t... Ns>
+-struct CHash<ACC, N, Ns...> {
+-  static const unsigned value = CHash<CHash<ACC, N>::value, Ns...>::value;
+-};
+-
+-const unsigned int JSCONST_nStringHash =
+-    CHash<'s', 't', 'r', 'i', 'n', 'g'>::value;
+-const unsigned int JSCONST_nNumberHash =
+-    CHash<'n', 'u', 'm', 'b', 'e', 'r'>::value;
+-const unsigned int JSCONST_nBoolHash =
+-    CHash<'b', 'o', 'o', 'l', 'e', 'a', 'n'>::value;
+-const unsigned int JSCONST_nDateHash = CHash<'d', 'a', 't', 'e'>::value;
+-const unsigned int JSCONST_nObjectHash =
+-    CHash<'o', 'b', 'j', 'e', 'c', 't'>::value;
+-const unsigned int JSCONST_nFXobjHash = CHash<'f', 'x', 'o', 'b', 'j'>::value;
+-const unsigned int JSCONST_nNullHash = CHash<'n', 'u', 'l', 'l'>::value;
+-const unsigned int JSCONST_nUndefHash =
+-    CHash<'u', 'n', 'd', 'e', 'f', 'i', 'n', 'e', 'd'>::value;
+-
+-static unsigned JS_CalcHash(const wchar_t* main) {
+-  return (unsigned)FX_HashCode_GetW(CFX_WideStringC(main), false);
+-}
+-
+-#ifndef NDEBUG
+-class HashVerify {
+- public:
+-  HashVerify();
+-} g_hashVerify;
+-
+-HashVerify::HashVerify() {
+-  ASSERT(JSCONST_nStringHash == JS_CalcHash(kFXJSValueNameString));
+-  ASSERT(JSCONST_nNumberHash == JS_CalcHash(kFXJSValueNameNumber));
+-  ASSERT(JSCONST_nBoolHash == JS_CalcHash(kFXJSValueNameBoolean));
+-  ASSERT(JSCONST_nDateHash == JS_CalcHash(kFXJSValueNameDate));
+-  ASSERT(JSCONST_nObjectHash == JS_CalcHash(kFXJSValueNameObject));
+-  ASSERT(JSCONST_nFXobjHash == JS_CalcHash(kFXJSValueNameFxobj));
+-  ASSERT(JSCONST_nNullHash == JS_CalcHash(kFXJSValueNameNull));
+-  ASSERT(JSCONST_nUndefHash == JS_CalcHash(kFXJSValueNameUndefined));
+-}
+-#endif
+-
+ BEGIN_JS_STATIC_CONST(CJS_Global)
+ END_JS_STATIC_CONST()
+ 
+@@ -335,9 +278,8 @@
+     CFX_WideString ws =
+         FXJS_ToString(isolate, FXJS_GetArrayElement(isolate, pKeyList, i));
+     CFX_ByteString sKey = ws.UTF8Encode();
+-
+     v8::Local<v8::Value> v = FXJS_GetObjectElement(isolate, pObj, ws);
+-    switch (GET_VALUE_TYPE(v)) {
++    switch (CJS_Value::GetValueType(v)) {
+       case CJS_Value::VT_number: {
+         CJS_KeyValue* pObjElement = new CJS_KeyValue;
+         pObjElement->nType = JS_GLOBALDATA_TYPE_NUMBER;
+@@ -353,8 +295,7 @@
+         array.Add(pObjElement);
+       } break;
+       case CJS_Value::VT_string: {
+-        CFX_ByteString sValue =
+-            CJS_Value(pRuntime, v, CJS_Value::VT_string).ToCFXByteString();
++        CFX_ByteString sValue = CJS_Value(pRuntime, v).ToCFXByteString();
+         CJS_KeyValue* pObjElement = new CJS_KeyValue;
+         pObjElement->nType = JS_GLOBALDATA_TYPE_STRING;
+         pObjElement->sKey = sKey;
+@@ -500,26 +441,3 @@
+   m_mapGlobal[propname] = pNewData;
+   return TRUE;
+ }
+-
+-CJS_Value::Type GET_VALUE_TYPE(v8::Local<v8::Value> p) {
+-  const unsigned int nHash = JS_CalcHash(FXJS_GetTypeof(p));
+-
+-  if (nHash == JSCONST_nUndefHash)
+-    return CJS_Value::VT_undefined;
+-  if (nHash == JSCONST_nNullHash)
+-    return CJS_Value::VT_null;
+-  if (nHash == JSCONST_nStringHash)
+-    return CJS_Value::VT_string;
+-  if (nHash == JSCONST_nNumberHash)
+-    return CJS_Value::VT_number;
+-  if (nHash == JSCONST_nBoolHash)
+-    return CJS_Value::VT_boolean;
+-  if (nHash == JSCONST_nDateHash)
+-    return CJS_Value::VT_date;
+-  if (nHash == JSCONST_nObjectHash)
+-    return CJS_Value::VT_object;
+-  if (nHash == JSCONST_nFXobjHash)
+-    return CJS_Value::VT_fxobject;
+-
+-  return CJS_Value::VT_unknown;
+-}
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Define.h chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Define.h
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Define.h	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Define.h	2017-06-17 00:10:09.658094485 -1000
+@@ -111,7 +111,7 @@
+   CJS_Object* pJSObj = (CJS_Object*)FXJS_GetPrivate(isolate, info.Holder());
+   C* pObj = reinterpret_cast<C*>(pJSObj->GetEmbedObject());
+   CFX_WideString sError;
+-  CJS_PropValue propValue(CJS_Value(pRuntime, value, CJS_Value::VT_unknown));
++  CJS_PropValue propValue(CJS_Value(pRuntime, value));
+   propValue.StartSetting();
+   if (!(pObj->*M)(pContext, propValue, sError)) {
+     FXJS_Error(isolate, JSFormatErrorString(class_name_string, prop_name_string,
+@@ -149,7 +149,7 @@
+   IJS_Context* pContext = pRuntime->GetCurrentContext();
+   std::vector<CJS_Value> parameters;
+   for (unsigned int i = 0; i < (unsigned int)info.Length(); i++) {
+-    parameters.push_back(CJS_Value(pRuntime, info[i], CJS_Value::VT_unknown));
++    parameters.push_back(CJS_Value(pRuntime, info[i]));
+   }
+   CJS_Value valueRes(pRuntime);
+   CJS_Object* pJSObj = (CJS_Object*)FXJS_GetPrivate(isolate, info.Holder());
+@@ -404,7 +404,7 @@
+   CFX_WideString propname = CFX_WideString::FromUTF8(
+       CFX_ByteStringC(*utf8_value, utf8_value.length()));
+   CFX_WideString sError;
+-  CJS_PropValue PropValue(CJS_Value(pRuntime, value, CJS_Value::VT_unknown));
++  CJS_PropValue PropValue(CJS_Value(pRuntime, value));
+   PropValue.StartSetting();
+   if (!pObj->DoProperty(pContext, propname.c_str(), PropValue, sError)) {
+     FXJS_Error(isolate, JSFormatErrorString(class_name, "PutProperty", sError));
+@@ -447,7 +447,7 @@
+   IJS_Context* pContext = pRuntime->GetCurrentContext();
+   std::vector<CJS_Value> parameters;
+   for (unsigned int i = 0; i < (unsigned int)info.Length(); i++) {
+-    parameters.push_back(CJS_Value(pRuntime, info[i], CJS_Value::VT_unknown));
++    parameters.push_back(CJS_Value(pRuntime, info[i]));
+   }
+   CJS_Value valueRes(pRuntime);
+   CFX_WideString sError;
+@@ -485,6 +485,4 @@
+     }                                                                        \
+   }
+ 
+-CJS_Value::Type GET_VALUE_TYPE(v8::Local<v8::Value> p);
+-
+ #endif  // FPDFSDK_JAVASCRIPT_JS_DEFINE_H_
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Value.cpp chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Value.cpp
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Value.cpp	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Value.cpp	2017-06-17 00:10:09.658094485 -1000
+@@ -22,11 +22,10 @@
+   return *(double*)g_nan;
+ }
+ 
+-CJS_Value::CJS_Value(CJS_Runtime* pRuntime)
+-    : m_eType(VT_unknown), m_pJSRuntime(pRuntime) {}
++CJS_Value::CJS_Value(CJS_Runtime* pRuntime) : m_pJSRuntime(pRuntime) {}
+ 
+-CJS_Value::CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Value> pValue, Type t)
+-    : m_eType(t), m_pValue(pValue), m_pJSRuntime(pRuntime) {}
++CJS_Value::CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Value> pValue)
++    : m_pValue(pValue), m_pJSRuntime(pRuntime) {}
+ 
+ CJS_Value::CJS_Value(CJS_Runtime* pRuntime, const int& iValue)
+     : m_pJSRuntime(pRuntime) {
+@@ -48,23 +47,11 @@
+   operator=(dValue);
+ }
+ 
+-CJS_Value::CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Object> pJsObj)
+-    : m_pJSRuntime(pRuntime) {
+-  operator=(pJsObj);
+-}
+-
+ CJS_Value::CJS_Value(CJS_Runtime* pRuntime, CJS_Object* pJsObj)
+     : m_pJSRuntime(pRuntime) {
+   operator=(pJsObj);
+ }
+ 
+-CJS_Value::CJS_Value(CJS_Runtime* pRuntime, CJS_Document* pJsDoc)
+-    : m_pJSRuntime(pRuntime) {
+-  m_eType = VT_object;
+-  if (pJsDoc)
+-    m_pValue = pJsDoc->ToV8Object();
+-}
+-
+ CJS_Value::CJS_Value(CJS_Runtime* pRuntime, const FX_WCHAR* pWstr)
+     : m_pJSRuntime(pRuntime) {
+   operator=(pWstr);
+@@ -84,19 +71,17 @@
+ 
+ CJS_Value::CJS_Value(const CJS_Value& other) = default;
+ 
+-void CJS_Value::Attach(v8::Local<v8::Value> pValue, Type t) {
++void CJS_Value::Attach(v8::Local<v8::Value> pValue) {
+   m_pValue = pValue;
+-  m_eType = t;
+ }
+ 
+ void CJS_Value::Attach(CJS_Value* pValue) {
+   if (pValue)
+-    Attach(pValue->ToV8Value(), pValue->GetType());
++    Attach(pValue->ToV8Value());
+ }
+ 
+ void CJS_Value::Detach() {
+   m_pValue = v8::Local<v8::Value>();
+-  m_eType = VT_unknown;
+ }
+ 
+ int CJS_Value::ToInt() const {
+@@ -146,7 +131,7 @@
+ 
+ void CJS_Value::MaybeCoerceToNumber() {
+   bool bAllowNaN = false;
+-  if (m_eType == VT_string) {
++  if (GetType() == VT_string) {
+     CFX_ByteString bstr = ToCFXByteString();
+     if (bstr.GetLength() == 0)
+       return;
+@@ -162,32 +147,26 @@
+   if (std::isnan(num->Value()) && !bAllowNaN)
+     return;
+   m_pValue = num;
+-  m_eType = VT_number;
+ }
+ 
+ void CJS_Value::operator=(int iValue) {
+   m_pValue = FXJS_NewNumber(m_pJSRuntime->GetIsolate(), iValue);
+-  m_eType = VT_number;
+ }
+ 
+ void CJS_Value::operator=(bool bValue) {
+   m_pValue = FXJS_NewBoolean(m_pJSRuntime->GetIsolate(), bValue);
+-  m_eType = VT_boolean;
+ }
+ 
+ void CJS_Value::operator=(double dValue) {
+   m_pValue = FXJS_NewNumber(m_pJSRuntime->GetIsolate(), dValue);
+-  m_eType = VT_number;
+ }
+ 
+ void CJS_Value::operator=(float fValue) {
+   m_pValue = FXJS_NewNumber(m_pJSRuntime->GetIsolate(), fValue);
+-  m_eType = VT_number;
+ }
+ 
+ void CJS_Value::operator=(v8::Local<v8::Object> pObj) {
+   m_pValue = FXJS_NewObject(m_pJSRuntime->GetIsolate(), pObj);
+-  m_eType = VT_fxobject;
+ }
+ 
+ void CJS_Value::operator=(CJS_Object* pObj) {
+@@ -195,21 +174,12 @@
+     operator=(pObj->ToV8Object());
+ }
+ 
+-void CJS_Value::operator=(CJS_Document* pJsDoc) {
+-  m_eType = VT_object;
+-  if (pJsDoc) {
+-    m_pValue = pJsDoc->ToV8Object();
+-  }
+-}
+-
+ void CJS_Value::operator=(const FX_WCHAR* pWstr) {
+   m_pValue = FXJS_NewString(m_pJSRuntime->GetIsolate(), (wchar_t*)pWstr);
+-  m_eType = VT_string;
+ }
+ 
+ void CJS_Value::SetNull() {
+   m_pValue = FXJS_NewNull();
+-  m_eType = VT_null;
+ }
+ 
+ void CJS_Value::operator=(const FX_CHAR* pStr) {
+@@ -219,36 +189,34 @@
+ void CJS_Value::operator=(CJS_Array& array) {
+   m_pValue =
+       FXJS_NewObject2(m_pJSRuntime->GetIsolate(), (v8::Local<v8::Array>)array);
+-  m_eType = VT_object;
+ }
+ 
+ void CJS_Value::operator=(CJS_Date& date) {
+   m_pValue = FXJS_NewDate(m_pJSRuntime->GetIsolate(), (double)date);
+-  m_eType = VT_date;
+ }
+ 
+ void CJS_Value::operator=(CJS_Value value) {
+   m_pValue = value.ToV8Value();
+-  m_eType = value.m_eType;
+   m_pJSRuntime = value.m_pJSRuntime;
+ }
+ 
+-CJS_Value::Type CJS_Value::GetType() const {
+-  if (m_pValue.IsEmpty())
++// static
++CJS_Value::Type CJS_Value::GetValueType(v8::Local<v8::Value> value) {
++  if (value.IsEmpty())
+     return VT_unknown;
+-  if (m_pValue->IsString())
++  if (value->IsString())
+     return VT_string;
+-  if (m_pValue->IsNumber())
++  if (value->IsNumber())
+     return VT_number;
+-  if (m_pValue->IsBoolean())
++  if (value->IsBoolean())
+     return VT_boolean;
+-  if (m_pValue->IsDate())
++  if (value->IsDate())
+     return VT_date;
+-  if (m_pValue->IsObject())
++  if (value->IsObject())
+     return VT_object;
+-  if (m_pValue->IsNull())
++  if (value->IsNull())
+     return VT_null;
+-  if (m_pValue->IsUndefined())
++  if (value->IsUndefined())
+     return VT_undefined;
+   return VT_unknown;
+ }
+@@ -427,7 +395,7 @@
+     return;
+   v8::Local<v8::Value> p =
+       FXJS_GetArrayElement(m_pJSRuntime->GetIsolate(), m_pArray, index);
+-  value.Attach(p, CJS_Value::VT_object);
++  value.Attach(p);
+ }
+ 
+ void CJS_Array::SetElement(unsigned index, CJS_Value value) {
+@@ -899,7 +867,7 @@
+     v8::Local<v8::Value> v8Value =
+         FXJS_GetObjectElement(pRuntime->GetIsolate(), pObj, property);
+     if (!v8Value->IsUndefined())
+-      result[i] = CJS_Value(pRuntime, v8Value, CJS_Value::VT_unknown);
++      result[i] = CJS_Value(pRuntime, v8Value);
+   }
+   va_end(ap);
+   return result;
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Value.h chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Value.h
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/javascript/JS_Value.h	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/javascript/JS_Value.h	2017-06-17 00:10:09.658094485 -1000
+@@ -27,20 +27,17 @@
+     VT_boolean,
+     VT_date,
+     VT_object,
+-    VT_fxobject,
+     VT_null,
+     VT_undefined
+   };
+ 
+   CJS_Value(CJS_Runtime* pRuntime);
+-  CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Value> pValue, Type t);
++  CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Value> pValue);
+   CJS_Value(CJS_Runtime* pRuntime, const int& iValue);
+   CJS_Value(CJS_Runtime* pRuntime, const double& dValue);
+   CJS_Value(CJS_Runtime* pRuntime, const float& fValue);
+   CJS_Value(CJS_Runtime* pRuntime, const bool& bValue);
+-  CJS_Value(CJS_Runtime* pRuntime, v8::Local<v8::Object>);
+-  CJS_Value(CJS_Runtime* pRuntime, CJS_Object*);
+-  CJS_Value(CJS_Runtime* pRuntime, CJS_Document*);
++  CJS_Value(CJS_Runtime* pRuntime, CJS_Object* pObj);
+   CJS_Value(CJS_Runtime* pRuntime, const FX_CHAR* pStr);
+   CJS_Value(CJS_Runtime* pRuntime, const FX_WCHAR* pWstr);
+   CJS_Value(CJS_Runtime* pRuntime, CJS_Array& array);
+@@ -49,11 +46,12 @@
+   CJS_Value(const CJS_Value& other);
+ 
+   void SetNull();
+-  void Attach(v8::Local<v8::Value> pValue, Type t);
++  void Attach(v8::Local<v8::Value> pValue);
+   void Attach(CJS_Value* pValue);
+   void Detach();
+ 
+-  Type GetType() const;
++  static Type GetValueType(v8::Local<v8::Value> value);
++  Type GetType() const { return GetValueType(m_pValue); }
+   int ToInt() const;
+   bool ToBool() const;
+   double ToDouble() const;
+@@ -66,8 +64,7 @@
+   v8::Local<v8::Value> ToV8Value() const;
+ 
+   // Replace the current |m_pValue| with a v8::Number if possible
+-  // to make one from the current |m_pValue|, updating |m_eType|
+-  // as appropriate to indicate the result.
++  // to make one from the current |m_pValue|.
+   void MaybeCoerceToNumber();
+ 
+   void operator=(int iValue);
+@@ -75,7 +72,6 @@
+   void operator=(double val);
+   void operator=(float val);
+   void operator=(CJS_Object* val);
+-  void operator=(CJS_Document* val);
+   void operator=(v8::Local<v8::Object> val);
+   void operator=(CJS_Array& val);
+   void operator=(CJS_Date& val);
+@@ -91,7 +87,6 @@
+   CJS_Runtime* GetJSRuntime() const { return m_pJSRuntime; }
+ 
+  protected:
+-  Type m_eType;
+   v8::Local<v8::Value> m_pValue;
+   CJS_Runtime* m_pJSRuntime;
+ };
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/jsapi/fxjs_v8.cpp chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/jsapi/fxjs_v8.cpp
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/jsapi/fxjs_v8.cpp	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/jsapi/fxjs_v8.cpp	2017-06-17 00:10:09.662094562 -1000
+@@ -10,15 +10,6 @@
+ 
+ #include "core/fxcrt/include/fx_basic.h"
+ 
+-const wchar_t kFXJSValueNameString[] = L"string";
+-const wchar_t kFXJSValueNameNumber[] = L"number";
+-const wchar_t kFXJSValueNameBoolean[] = L"boolean";
+-const wchar_t kFXJSValueNameDate[] = L"date";
+-const wchar_t kFXJSValueNameObject[] = L"object";
+-const wchar_t kFXJSValueNameFxobj[] = L"fxobj";
+-const wchar_t kFXJSValueNameNull[] = L"null";
+-const wchar_t kFXJSValueNameUndefined[] = L"undefined";
+-
+ // Keep this consistent with the values defined in gin/public/context_holder.h
+ // (without actually requiring a dependency on gin itself for the standalone
+ // embedders of PDFIum). The value we want to use is:
+@@ -540,26 +531,6 @@
+                                .ToLocalChecked());
+ }
+ 
+-const wchar_t* FXJS_GetTypeof(v8::Local<v8::Value> pObj) {
+-  if (pObj.IsEmpty())
+-    return nullptr;
+-  if (pObj->IsString())
+-    return kFXJSValueNameString;
+-  if (pObj->IsNumber())
+-    return kFXJSValueNameNumber;
+-  if (pObj->IsBoolean())
+-    return kFXJSValueNameBoolean;
+-  if (pObj->IsDate())
+-    return kFXJSValueNameDate;
+-  if (pObj->IsObject())
+-    return kFXJSValueNameObject;
+-  if (pObj->IsNull())
+-    return kFXJSValueNameNull;
+-  if (pObj->IsUndefined())
+-    return kFXJSValueNameUndefined;
+-  return nullptr;
+-}
+-
+ void FXJS_SetPrivate(v8::Isolate* pIsolate,
+                      v8::Local<v8::Object> pObj,
+                      void* p) {
+diff -uNr chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/jsapi/include/fxjs_v8.h chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/jsapi/include/fxjs_v8.h
+--- chromium-53.0.2785.143.orig/third_party/pdfium/fpdfsdk/jsapi/include/fxjs_v8.h	2016-09-29 09:05:05.000000000 -1000
++++ chromium-53.0.2785.143/third_party/pdfium/fpdfsdk/jsapi/include/fxjs_v8.h	2017-06-17 00:10:09.662094562 -1000
+@@ -118,15 +118,6 @@
+   FXJS_PerIsolateData();
+ };
+ 
+-extern const wchar_t kFXJSValueNameString[];
+-extern const wchar_t kFXJSValueNameNumber[];
+-extern const wchar_t kFXJSValueNameBoolean[];
+-extern const wchar_t kFXJSValueNameDate[];
+-extern const wchar_t kFXJSValueNameObject[];
+-extern const wchar_t kFXJSValueNameFxobj[];
+-extern const wchar_t kFXJSValueNameNull[];
+-extern const wchar_t kFXJSValueNameUndefined[];
+-
+ class FXJS_ArrayBufferAllocator : public v8::ArrayBuffer::Allocator {
+   void* Allocate(size_t length) override;
+   void* AllocateUninitialized(size_t length) override;
+@@ -209,7 +200,6 @@
+                                            bool bStatic = false);
+ v8::Local<v8::Object> FXJS_GetThisObj(v8::Isolate* pIsolate);
+ int FXJS_GetObjDefnID(v8::Local<v8::Object> pObj);
+-const wchar_t* FXJS_GetTypeof(v8::Local<v8::Value> pObj);
+ 
+ void FXJS_SetPrivate(v8::Isolate* pIsolate,
+                      v8::Local<v8::Object> pObj,
-- 
2.13.1


