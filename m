Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5F00D77EA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:03:28 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id r103so174121661wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M9YESoMdCSEsSiweeIClU/uArikWSKCRX1bXo3ZH2qg=;
	b=TpfyuNygXg8kKrifYThWVMEvAai52VLLytqAByAV24zY8d2HBs5/3XKcWJ17RJI8EN
	sTd0fpF5/UHj/2K3QJF8MxWAOaB2oRYXY0N/QxaxFkoI7xukYWHtigXyXSZ5HRNoRwU+
	OAIyajYL0oKihW+ZA0V2UPVJxgHjRp3gDEXyQwEkGe061q0mnQGw10QdZRjItIEVJpuP
	KruoICrj/dNq/2NE49yk5/FrWs0G693p6C124W+UT16LNHBgitlA0Bycyi6SLXUks/Y1
	7iJdesiTULrRB9KD9zZ/aP0pGHGzL+Y9zlFww/j325CfxWSv5Zcmh3MHQ3hBe0K1t9fh
	+8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M9YESoMdCSEsSiweeIClU/uArikWSKCRX1bXo3ZH2qg=;
	b=qRS28Yg47Md1maoOqJqsvTWeudMw1RTpSI2jOvFPh9npATqlN/3zhC4Hf3I7Od1GL4
	oxov8I9exD1HpG2SY/ZIsOr4Xzf+ACxlnEGwMzPpuoSTEj3xZEA73SBX23Nlq0q55SsM
	nyaxjfn7Vm8OniFQqjAM+UyJJK6auFNdyGpRCKCpFLVyscOCIMcs5RY7xnpIsni4wJaw
	hr51beeg+csSOBgJGjiJ9M3dHnuKME3qFqaU0EhEXdDKVpttltbH4h+tKSGUAzkIxLpS
	qyaEXRS959Cv0SiV6WE+IFf4LRaw7U4P0gRKjHsloBw3D9U00ymn/xX6+zfhXWiFghEF
	SNYg==
X-Gm-Message-State: AIVw111jQMxny4Y+YTyWB8sa+2S3OoWbjYBfLoPd1DKwEkCjKSGp56nx
	11qXw3x7AzHbySmt
X-Received: by 10.223.177.129 with SMTP id q1mr10763230wra.82.1499763808851;
	Tue, 11 Jul 2017 02:03:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z190sm13910055wmz.31.2017.07.11.02.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 02:03:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:04:06 +0200
Message-Id: <20170711090406.21206-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH][meta-qt5] qtwebengine: fix build with gcc7
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
X-List-Received-Date: Tue, 11 Jul 2017 09:03:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...se.gypi-include-atomicops_internals_x86_g.patch |  21 ++--
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  25 ++--
 .../0003-chromium-v8-fix-build-with-gcc7.patch     | 134 +++++++++++++++++++++
 .../0004-chromium-WebKit-fix-build-with-gcc7.patch |  44 +++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |   6 +-
 5 files changed, 208 insertions(+), 22 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index ccd43e2..4490116 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,19 +1,19 @@
-From db56cd0fd185a9f3858f5aa6e95b24e63dee119f Mon Sep 17 00:00:00 2001
+From 83eee1ff5f9259595b8630e464fa869c6fde8f3c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
+Subject: [PATCH 1/4] <chromium> base.gypi: include
+ atomicops_internals_x86_gcc.cc when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/3rdparty/chromium/base/base.gypi | 2 +-
+ chromium/base/base.gypi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index 63c3f76..331c975 100644
---- a/src/3rdparty/chromium/base/base.gypi
-+++ b/src/3rdparty/chromium/base/base.gypi
-@@ -801,7 +801,7 @@
+diff --git a/chromium/base/base.gypi b/chromium/base/base.gypi
+index a4da596070..13173d621e 100644
+--- a/chromium/base/base.gypi
++++ b/chromium/base/base.gypi
+@@ -845,7 +845,7 @@
                  ['include', '^nix/'],
                ],
            }],
@@ -22,3 +22,6 @@ index 63c3f76..331c975 100644
                'sources/': [
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 34f58de..eae2787 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,7 +1,7 @@
-From de6311b4d556abbe131462a3cd962ae87da59522 Mon Sep 17 00:00:00 2001
+From 4aa614106c03793709e5dbd69f45df8a5e5c9fe4 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
-Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
+Subject: [PATCH 2/4] chromium: Change false to FALSE and 1 to TRUE, FIX
  qtwebengine compile
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
@@ -10,11 +10,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
-index 8a08fe0..32b2a05 100644
---- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
-+++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
-@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
+diff --git a/chromium/ui/gfx/codec/jpeg_codec.cc b/chromium/ui/gfx/codec/jpeg_codec.cc
+index 6d926378be..738d3fdedf 100644
+--- a/chromium/ui/gfx/codec/jpeg_codec.cc
++++ b/chromium/ui/gfx/codec/jpeg_codec.cc
+@@ -121,7 +121,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
    // tell libjpeg where to write the next data
    cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
    cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
@@ -23,7 +23,7 @@ index 8a08fe0..32b2a05 100644
  }
  
  // Cleans up the JpegEncoderState to prepare for returning in the final form.
-@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+@@ -262,7 +262,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
    cinfo.data_precision = 8;
  
    jpeg_set_defaults(&cinfo);
@@ -32,7 +32,7 @@ index 8a08fe0..32b2a05 100644
  
    // set up the destination manager
    jpeg_destination_mgr destmgr;
-@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+@@ -274,7 +274,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
    JpegEncoderState state(output);
    cinfo.client_data = &state;
  
@@ -41,7 +41,7 @@ index 8a08fe0..32b2a05 100644
  
    // feed it the rows, doing necessary conversions for the color format
  #ifdef JCS_EXTENSIONS
-@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
+@@ -360,7 +360,7 @@ void InitSource(j_decompress_ptr cinfo) {
  //   set to a positive value if TRUE is returned. A FALSE return should only
  //   be used when I/O suspension is desired."
  boolean FillInputBuffer(j_decompress_ptr cinfo) {
@@ -50,7 +50,7 @@ index 8a08fe0..32b2a05 100644
  }
  
  // Skip data in the buffer. Since we have all the data at once, this operation
-@@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
+@@ -488,8 +488,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
    cinfo.client_data = &state;
  
    // fill the file metadata into our buffer
@@ -61,3 +61,6 @@ index 8a08fe0..32b2a05 100644
  
    // we want to always get RGB data out
    switch (cinfo.jpeg_color_space) {
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..2acce2c
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
@@ -0,0 +1,134 @@
+From 1a163c0cab05761f269fcb5adad5d40d71200d52 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 11 Jul 2017 10:15:41 +0200
+Subject: [PATCH 3/4] chromium: v8 fix build with gcc7
+
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
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ chromium/v8/src/heap/mark-compact.cc       |  5 +++++
+ chromium/v8/src/objects-body-descriptors.h |  2 +-
+ chromium/v8/src/objects-inl.h              | 20 ++++++++++++++++++++
+ chromium/v8/src/objects.h                  | 20 ++++----------------
+ 4 files changed, 30 insertions(+), 17 deletions(-)
+
+diff --git a/chromium/v8/src/heap/mark-compact.cc b/chromium/v8/src/heap/mark-compact.cc
+index f9a55dfc61..da46270aec 100644
+--- a/chromium/v8/src/heap/mark-compact.cc
++++ b/chromium/v8/src/heap/mark-compact.cc
+@@ -3614,6 +3614,9 @@ void MarkCompactCollector::EvacuateNewSpaceAndCandidates() {
+ #endif
+ }
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wattributes"
++
+ template <PointerDirection direction>
+ class PointerUpdateJobTraits {
+  public:
+@@ -3701,6 +3704,8 @@ class PointerUpdateJobTraits {
+   }
+ };
+ 
++#pragma GCC diagnostic pop
++
+ int NumberOfPointerUpdateTasks(int pages) {
+   if (!FLAG_parallel_pointer_update) return 1;
+   const int kMaxTasks = 4;
+diff --git a/chromium/v8/src/objects-body-descriptors.h b/chromium/v8/src/objects-body-descriptors.h
+index 91cb8883be..a1c3634bd7 100644
+--- a/chromium/v8/src/objects-body-descriptors.h
++++ b/chromium/v8/src/objects-body-descriptors.h
+@@ -99,7 +99,7 @@ class FixedBodyDescriptor final : public BodyDescriptorBase {
+ 
+   template <typename StaticVisitor>
+   static inline void IterateBody(HeapObject* obj, int object_size) {
+-    IterateBody(obj);
++    IterateBody<StaticVisitor>(obj);
+   }
+ };
+ 
+diff --git a/chromium/v8/src/objects-inl.h b/chromium/v8/src/objects-inl.h
+index 58441d3853..e850fd787f 100644
+--- a/chromium/v8/src/objects-inl.h
++++ b/chromium/v8/src/objects-inl.h
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
+diff --git a/chromium/v8/src/objects.h b/chromium/v8/src/objects.h
+index 7d774beb5b..eda1478766 100644
+--- a/chromium/v8/src/objects.h
++++ b/chromium/v8/src/objects.h
+@@ -3193,22 +3193,10 @@ class HashTable : public HashTableBase {
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
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
new file mode 100644
index 0000000..46e8761
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
@@ -0,0 +1,44 @@
+From 2be0856e09f47e7f2c35e77d4e000d769c6beaf9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 11 Jul 2017 10:18:13 +0200
+Subject: [PATCH 4/4] chromium: WebKit fix build with gcc7
+
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
+---
+ chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h b/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
+index e85c72fd65..6f94cd6734 100644
+--- a/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
++++ b/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
+@@ -542,6 +542,8 @@ inline LinkedHashSet<T, U, V, W>& LinkedHashSet<T, U, V, W>::operator=(LinkedHas
+     return *this;
+ }
+ 
++inline void swapAnchor(LinkedHashSetNodeBase& a, LinkedHashSetNodeBase& b);
++
+ template<typename T, typename U, typename V, typename W>
+ inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
+ {
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index ca5d263..e319a01 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -114,8 +114,10 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0005-Include-dependency-to-QCoreApplication-translate.patch \
-    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
-    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
+    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch;patchdir=src/3rdparty \
+    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
+    file://0003-chromium-v8-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
+    file://0004-chromium-WebKit-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
 "
 
 SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
-- 
2.13.2


