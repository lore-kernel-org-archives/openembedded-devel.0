Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1591378476
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:06:10 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 36so38928144wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eVRsRhvmGjoALYlfIIWRaOBU325l891YWj1qzISRI/Y=;
	b=TJrOC9PwzrcZrY7fITxe+2WQqLIaXLgsLDFnI0tfrKecDyfbiO/Qzc/VBNuKxu7VMz
	G+REL+ketBGDjCeClTd2z8718TR3Qz78J/e/HT4XyMK2p4rlDn8lmjlB+wLLomgUo1a5
	Eqk8v5uwa1ldbLb2LOixvK2XaTDhr2fMtWQYvfMET7wmFOpOF02kz5vgFD5Yu03hN2Wm
	wCXr5dBpU41jI5voMHvLQ3A/YBGckb9INjU/o5ss7RilIBhN9PmaBMIQQibyYzD1+Ll+
	a/v7/ySpgmSR05Q1Wf3dWQfxOBpQoTUcNHmapicS3MswLvss4T4W6m7hexIUs+Ak9YLz
	Vw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eVRsRhvmGjoALYlfIIWRaOBU325l891YWj1qzISRI/Y=;
	b=l91/ead07nbNdavMGfABRCx+Yp/oF9WjTl5FzeNKXJyMiQtGw4o/ABWPlCWlccGuko
	TBUn03DHb5T8diuezN9/vcnvlUJfi2CVs4iOKE0jG06TqDYGEdy6v2syS7nKLkZ6t9pv
	HzW5JIMOwxwWPGbOBQgHq8kXVSFeO9k1aucyNBlYMAE0qtO167YEjYhI+LVG0r0kwejs
	5KGs1qKuLLHjb0MszaSHHEKGZN4F1SkL9D0WYGoLNikwwy9T7dPOuUIoLDoBzKJElqF6
	bH1Egcu7Kvoh+LA1rgdtU/GgV+IbDBidOj7/rMAiaxChQMcs7D1hpNifyn4hsHHHx2oJ
	Hd7A==
X-Gm-Message-State: AKS2vOwrfyD0GCcEkFmzGYq909UImGUK9Pv+6TYi0X2VvWki6Nel8XMN
	YqIHHHiKi9CkQHUb
X-Received: by 10.223.160.88 with SMTP id l24mr7695824wrl.31.1497621971158;
	Fri, 16 Jun 2017 07:06:11 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 18sm2726382wmt.6.2017.06.16.07.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 07:06:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:06:11 +0200
Message-Id: <20170616140611.15494-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-browser][WIP][PATCH] chromium(-wayland): Fix build with gcc7
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
X-List-Received-Date: Fri, 16 Jun 2017 14:06:13 -0000

* add 2 patches to fix issues detected by gcc7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |  2 ++
 .../files/0001-v8-fix-build-with-gcc7.patch        | 20 ++++++++++++++
 .../files/0002-WebKit-fix-build-with-gcc7.patch    | 31 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
 create mode 100644 recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch

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
diff --git a/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..0fc5bfb
--- /dev/null
+++ b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
@@ -0,0 +1,20 @@
+Use the fix from nodejs:
+https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f51210c50e8
+
+* fixes:
+| ../../git/src/v8/src/objects-body-descriptors.h: In static member function 'static void v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*, int)':
+| ../../git/src/v8/src/objects-body-descriptors.h:102:20: error: no matching function for call to 'v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*&)'
+|      IterateBody(obj);
+|                     ^
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
-- 
2.13.1


