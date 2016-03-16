Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5198171957
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:44:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l124so53680522wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kN6zWMrOoaClP6Zs/3KsTaKxuVRwh8A4obmvnyrwXAA=;
	b=o6ZxfJct80b5nsRzkmnrgqmgAIoYeOw2FbwOalnbQw3iHCQR8o4yknsS9MREiCSZdO
	E8/RfbYI21X423q1IBqOFKHgC/d7qZjl55J1KvwIMWCpr10dha4z0YRKrkHM/tKX9YSI
	PouIh7uv8zeQoaM5RdNn0T20eblCakH7nIQlMI7oueZ2+16QqdE4Wp079jRaVm1l4g/n
	2NsNLwNr5Xll1VwHo2KuEm1lUrluDAnoM3sqLzTLFwn8vnTEG0rfBPJtczSx8KV2jGXs
	kSUUn7QaNS7Fmc8J6FbbAmqXaOgCSfG28NTT3d4w9WSyRxhDR1vfgbmaZZ/FSfz1CeM5
	3kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kN6zWMrOoaClP6Zs/3KsTaKxuVRwh8A4obmvnyrwXAA=;
	b=DTuV8BKWDlLJRkOytLPHRQZ6WmwghfnHQHJ4wU3Cyq1Gd4r1avN2Os98Zu4QSEjDG3
	oubcow4ek/igGe6F4HyEh+Zpq+ezI+bD7tu8HVO1Jjk+Yf8Bxb7Vp/mhdsPnLM+my6Ls
	woD2rgFMGUP712KMSFghWHEdUjwcj3X1xlDcrmA/nTxl6VnCd3gE6aHesvskB+9PqL4H
	aI6c/cEIFi24WfrX9fDI+j39/59IeQ7zh1iRxsVZSeLZAGsccmicVfIEeaIWneVMD0pT
	pkZ2Ti73FBHhHqrqiEZaA05WvuVysisPqGOJRBP4GCKup1Yavm+Ma8bqJx1rcg3KYbQ6
	v0YA==
X-Gm-Message-State: AD7BkJKYefsqpQ7o+ymjIgsfpumrsO0fnBoxv6AVNEHmJIgyMpEE9vPHUwvdpx6U+F7M2w==
X-Received: by 10.194.192.36 with SMTP id hd4mr4304316wjc.85.1458143047952;
	Wed, 16 Mar 2016 08:44:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm3612839wjz.4.2016.03.16.08.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 08:44:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 16:47:41 +0100
Message-Id: <1458143262-22936-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-browser 1/2] cef3, chromium: fix build with gcc-5.3
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
X-List-Received-Date: Wed, 16 Mar 2016 15:44:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 +++++++++++++++++-----
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 17 +++++-----
 .../cef3/0003-disable-uninitialized-warning.patch  | 24 +++++++++++++
 recipes-browser/chromium/cef3_280796.bb            |  1 +
 .../0003-disable-uninitialized-warning.patch       | 19 +++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
 6 files changed, 83 insertions(+), 18 deletions(-)
 create mode 100644 recipes-browser/chromium/cef3/0003-disable-uninitialized-warning.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0003-disable-uninitialized-warning.patch

diff --git a/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
index 4a28bda..86691a5 100644
--- a/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
+++ b/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
@@ -23,17 +23,38 @@ diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/S
 index a000b46..6c6d336 100644
 --- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
 +++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-@@ -109,7 +109,10 @@ namespace double_conversion {
-         int length = value.length();
-         int pos = 0;
-         // Let's just say that each digit needs 4 bits.
+@@ -102,7 +102,10 @@
+     }
+ 
+ 
 +#pragma GCC diagnostic push
 +#pragma GCC diagnostic warning "-Wstrict-overflow"
-         while (length >= kMaxUint64DecimalDigits) {
+     void Bignum::AssignDecimalString(Vector<const char> value) {
 +#pragma GCC diagnostic pop
-             uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
-             pos += kMaxUint64DecimalDigits;
-             length -= kMaxUint64DecimalDigits;
+         // 2^64 = 18446744073709551616 > 10^19
+         const int kMaxUint64DecimalDigits = 19;
+         Zero();
+@@ -699,7 +699,10 @@
+     }
+
+
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wstrict-overflow"
+     void Bignum::Align(const Bignum& other) {
++#pragma GCC diagnostic pop
+         if (exponent_ > other.exponent_) {
+             // If "X" represents a "hidden" digit (by the exponent) then we are in the
+             // following case (a == this, b == other):
+@@ -715,7 +715,10 @@
+             for (int i = used_digits_ - 1; i >= 0; --i) {
+                 bigits_[i + zero_digits] = bigits_[i];
+             }
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wstrict-overflow"
+             for (int i = 0; i < zero_digits; ++i) {
++#pragma GCC diagnostic pop
+                 bigits_[i] = 0;
+             }
+             used_digits_ += zero_digits;
 -- 
 1.8.4.5
-
diff --git a/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
index 7023233..1825a85 100644
--- a/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
+++ b/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
@@ -24,17 +24,16 @@ diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
 index 89a3f8c..d595da3 100644
 --- a/ui/gfx/image/image_util.cc
 +++ b/ui/gfx/image/image_util.cc
-@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
-   int inner_min = bitmap.width();
-   for (int x = 0; x < bitmap.width(); ++x) {
-     for (int y = 0; y < bitmap.height(); ++y) {
+@@ -47,7 +47,10 @@
+ }
+ #endif  // !defined(OS_IOS)
+ 
 +#pragma GCC diagnostic push
 +#pragma GCC diagnostic warning "-Wstrict-overflow"
-       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity) {
+ bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
 +#pragma GCC diagnostic pop
-         inner_min = x;
-         break;
-       }
+   *leading = 0;
+   *trailing = std::max(1, image.width()) - 1;
+   if (!image.HasRepresentation(1.0))
 -- 
 1.8.4.5
-
diff --git a/recipes-browser/chromium/cef3/0003-disable-uninitialized-warning.patch b/recipes-browser/chromium/cef3/0003-disable-uninitialized-warning.patch
new file mode 100644
index 0000000..bf3eb43
--- /dev/null
+++ b/recipes-browser/chromium/cef3/0003-disable-uninitialized-warning.patch
@@ -0,0 +1,24 @@
+../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp: In static member function 'static void WTF::HashTableBucketInitializer<false>::initialize(Value&) [with Traits = WTF::HashMapValueTraits<WTF::HashTraits<int>, WTF::HashTraits<blink::TimelineThreadState> >; Value = WTF::KeyValuePair<int, blink::TimelineThreadState>]':
+../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp:234:8: error: '<anonymous>.blink::TimelineThreadState::inKnownLayerTask' is used uninitialized in this function [-Werror=uninitialized]
+ struct TimelineThreadState {
+        ^
+
+--- a/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp	2016-03-10 09:53:53.595413000 -1000
++++ b/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp	2016-03-10 09:55:40.131413000 -1000
+@@ -195,6 +195,8 @@
+     Vector<Entry> m_stack;
+ };
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wuninitialized"
+ struct TimelineThreadState {
+     TimelineThreadState() { }
+ 
+@@ -209,6 +211,7 @@
+     bool inKnownLayerTask;
+     unsigned long long decodedPixelRefId;
+ };
++#pragma GCC diagnostic push
+ 
+ struct TimelineImageInfo {
+     int backendNodeId;
diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 6872e5b..dab721e 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_re
 	   file://cef-simple \
 	   file://0001-bignum.cc-disable-warning-from-gcc-5.patch \
 	   file://0002-image_util.cc-disable-warning-from-gcc-5.patch \
+           file://0003-disable-uninitialized-warning.patch \
 	   file://0003-gtest-typed-test.h-disable-warning-unused-definition.patch \
 	   file://0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch \
 	  "
diff --git a/recipes-browser/chromium/chromium/chromium-40/0003-disable-uninitialized-warning.patch b/recipes-browser/chromium/chromium/chromium-40/0003-disable-uninitialized-warning.patch
new file mode 100644
index 0000000..232dbf4
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0003-disable-uninitialized-warning.patch
@@ -0,0 +1,19 @@
+../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp: In static member function 'static void WTF::HashTableBucketInitializer<false>::initialize(Value&) [with Traits = WTF::HashMapValueTraits<WTF::HashTraits<int>, WTF::HashTraits<blink::TimelineThreadState> >; Value = WTF::KeyValuePair<int, blink::TimelineThreadState>]':
+../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp:234:8: error: '<anonymous>.blink::TimelineThreadState::inKnownLayerTask' is used uninitialized in this function [-Werror=uninitialized]
+ struct TimelineThreadState {
+        ^
+
+--- a/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp	2016-03-10 08:14:18.771413000 -1000
++++ b/third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp	2016-03-10 08:15:58.179413000 -1000
+@@ -231,7 +231,11 @@
+     Vector<Entry> m_stack;
+ };
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wuninitialized"
+ struct TimelineThreadState {
++#pragma GCC diagnostic pop
++
+     ALLOW_ONLY_INLINE_ALLOCATION();
+ public:
+     TimelineThreadState() { }
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 0942d7d..25489c1 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -31,6 +31,7 @@ SRC_URI = "\
         file://chromium-40/add_missing_stat_h_include.patch \
         file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch \
         file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
+        file://chromium-40/0003-disable-uninitialized-warning.patch \
         file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch \
 "
 
-- 
2.7.3


