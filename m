Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 49EE977123
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:23:00 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so44737624wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b7TQcFo7zoX8RM0JnBe2ThGKH4fwna0k03uHJsiMeIY=;
	b=u7K6KI7gYPvpBLDSZvuSlwfsAwDnpBpjVP86mqfrQXuvEbvt19RvT/85vER8DWIlNe
	IxCuG0SydmpGVcLD1tNDvVEBXe8Ez9dOMuheEFJtOymo2eGscCWCrueswk7oHuxMeEq9
	oVZh9Rw3DfWQtOjYIrpcvQcTz7f4mRLIUsHDvsX0wsffI16MFIrQVtRU016bH3J6RYdX
	Yg9HRDJg+qGf/i1pT3Ye/TbhDrPBHVT4+QPdBCu2lBNHSYW21Aq/dvOIYn7ezwK9Pafs
	lXrQerboPdkoDobC1Vf4yo4OB4NSpqPD2c9VDxFc0HrC3ktsXBVaoeZGZgL0owLpC9/8
	LUbw==
X-Received: by 10.194.5.2 with SMTP id o2mr19321765wjo.98.1446898980107;
	Sat, 07 Nov 2015 04:23:00 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:22:59 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:27 +0100
Message-Id: <1446898829-21243-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-browser][PATCH v2 3/5] cef3: fix gcc5 compile issues
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
X-List-Received-Date: Sat, 07 Nov 2015 12:23:00 -0000

A cef3 build with gcc5 fails with warnings treated as errors.

bignum.cc, image_util.cc: strict-overflow warning
gtest-typed-test.h: unused-variable warning
SaturatedArithmetic.h: parentheses warning

Compiles for qemux86 with gcc 5.2.0 and still compiles on
armv7a with gcc linaro-4.9.4.
Note that the resulting binary has not been tested on a target.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 ++++++++++++++++++++
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++++++
 ...-test.h-disable-warning-unused-definition.patch | 43 ++++++++++++++++++++++
 ...ithmetic.h-put-parentheses-to-silence-war.patch | 39 ++++++++++++++++++++
 recipes-browser/chromium/cef3_280796.bb            |  4 ++
 5 files changed, 165 insertions(+)
 create mode 100644 recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
 create mode 100644 recipes-browser/chromium/cef3/0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch

diff --git a/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
new file mode 100644
index 0000000..4a28bda
--- /dev/null
+++ b/recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
@@ -0,0 +1,39 @@
+From 5b8c53a6bb11c8aa9b575b5a8155c25c5085f349 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Fri, 6 Nov 2015 12:22:35 +0100
+Subject: [PATCH] bignum.cc: disable warning from gcc 5
+
+addresses:
+  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: assuming
+  signed overflow does not occur when assuming that (X + c) < X is always
+  false [-Werror=strict-overflow]
+      void Bignum::AssignDecimalString(Vector<const char> value) {
+           ^
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+
+Upstream-Status: Pending
+See the discussion on the issue in Chromium upstream:
+https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
+---
+ third_party/WebKit/Source/wtf/dtoa/bignum.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+index a000b46..6c6d336 100644
+--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+@@ -109,7 +109,10 @@ namespace double_conversion {
+         int length = value.length();
+         int pos = 0;
+         // Let's just say that each digit needs 4 bits.
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wstrict-overflow"
+         while (length >= kMaxUint64DecimalDigits) {
++#pragma GCC diagnostic pop
+             uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
+             pos += kMaxUint64DecimalDigits;
+             length -= kMaxUint64DecimalDigits;
+-- 
+1.8.4.5
+
diff --git a/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
new file mode 100644
index 0000000..7023233
--- /dev/null
+++ b/recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
@@ -0,0 +1,40 @@
+From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Tue, 3 Nov 2015 22:13:40 +0100
+Subject: [PATCH] image_util.cc: disable warning from gcc 5
+
+addresses:
+  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed overflow does
+  not occur when assuming that (X - c) <= X is always true
+  [-Werror=strict-overflow]
+  bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
+       ^
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+
+Upstream-Status: Pending
+See the discussion on the issue in Chromium upstream:
+https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
+
+---
+ ui/gfx/image/image_util.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
+index 89a3f8c..d595da3 100644
+--- a/ui/gfx/image/image_util.cc
++++ b/ui/gfx/image/image_util.cc
+@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
+   int inner_min = bitmap.width();
+   for (int x = 0; x < bitmap.width(); ++x) {
+     for (int y = 0; y < bitmap.height(); ++y) {
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wstrict-overflow"
+       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity) {
++#pragma GCC diagnostic pop
+         inner_min = x;
+         break;
+       }
+-- 
+1.8.4.5
+
diff --git a/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch b/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
new file mode 100644
index 0000000..97a6116
--- /dev/null
+++ b/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
@@ -0,0 +1,43 @@
+From 1dac3072a62d1bb40db8c2f63f2729e658307761 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Sat, 7 Nov 2015 00:45:46 +0100
+Subject: [PATCH] gtest-typed-test.h: disable warning unused definitions
+
+In file included from ../../testing/gtest/include/gtest/gtest.h:66:0,
+                 from ../../base/test/task_runner_test_template.h:62,
+                 from ../../base/test/task_runner_test_template.cc:5:
+../../testing/gtest/include/gtest/gtest-typed-test.h:214:3: error: 'base::gtest_registered_test_names_TaskRunnerTest_' defined but not used [-Werror=unused-variable]
+   gtest_registered_test_names_##TestCaseName##_
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+
+Upstream-Status: Pending
+Seems to be fixed in current chromium sources.
+---
+ testing/gtest/include/gtest/gtest-typed-test.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/testing/gtest/include/gtest/gtest-typed-test.h b/testing/gtest/include/gtest/gtest-typed-test.h
+index fe1e83b..5053bbe 100644
+--- a/testing/gtest/include/gtest/gtest-typed-test.h
++++ b/testing/gtest/include/gtest/gtest-typed-test.h
+@@ -32,6 +32,9 @@
+ #ifndef GTEST_INCLUDE_GTEST_GTEST_TYPED_TEST_H_
+ #define GTEST_INCLUDE_GTEST_GTEST_TYPED_TEST_H_
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wunused"
++
+ // This header implements typed tests and type-parameterized tests.
+ 
+ // Typed (aka type-driven) tests repeat the same test for types in a
+@@ -256,4 +259,6 @@ INSTANTIATE_TYPED_TEST_CASE_P(My, FooTest, MyTypes);
+ 
+ #endif  // GTEST_HAS_TYPED_TEST_P
+ 
++#pragma GCC diagnostic pop
++
+ #endif  // GTEST_INCLUDE_GTEST_GTEST_TYPED_TEST_H_
+-- 
+1.8.4.5
+
diff --git a/recipes-browser/chromium/cef3/0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch b/recipes-browser/chromium/cef3/0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch
new file mode 100644
index 0000000..82fc58f
--- /dev/null
+++ b/recipes-browser/chromium/cef3/0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch
@@ -0,0 +1,39 @@
+From 947380c31305163b3cea2c7352c6a9f38922749c Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Sat, 7 Nov 2015 00:52:23 +0100
+Subject: [PATCH] SaturatedArithmetic.h: put parentheses to silence warning
+
+In file included from ../../third_party/WebKit/Source/platform/LayoutUnit.h:36:0,
+                 from ../../third_party/WebKit/Source/platform/animation/AnimationUtilities.h:29,
+                 from ../../third_party/WebKit/Source/platform/graphics/Color.h:29,
+                 from ../../third_party/WebKit/Source/platform/ColorSuggestion.h:34,
+                 from ../../third_party/WebKit/Source/platform/ColorChooserClient.h:34,
+                 from ../../third_party/WebKit/Source/platform/ColorChooserClient.cpp:32:
+../../third_party/WebKit/Source/wtf/SaturatedArithmetic.h: In function 'int32_t saturatedAddition(int32_t, int32_t)':
+../../third_party/WebKit/Source/wtf/SaturatedArithmetic.h:45:26: error: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Werror=parentheses]
+     if (!((ua ^ ub) >> 31) & (result ^ ua) >> 31)
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+
+Upstream-Status: Pending
+Seems to be fixed in current chromium sources.
+---
+ third_party/WebKit/Source/wtf/SaturatedArithmetic.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/WebKit/Source/wtf/SaturatedArithmetic.h b/third_party/WebKit/Source/wtf/SaturatedArithmetic.h
+index 981276f..19c6157 100644
+--- a/third_party/WebKit/Source/wtf/SaturatedArithmetic.h
++++ b/third_party/WebKit/Source/wtf/SaturatedArithmetic.h
+@@ -42,7 +42,7 @@ ALWAYS_INLINE int32_t saturatedAddition(int32_t a, int32_t b)
+ 
+     // Can only overflow if the signed bit of the two values match. If the signed
+     // bit of the result and one of the values differ it did overflow.
+-    if (!((ua ^ ub) >> 31) & (result ^ ua) >> 31)
++    if ((!((ua ^ ub) >> 31)) & (result ^ ua) >> 31)
+         result = std::numeric_limits<int>::max() + (ua >> 31);
+ 
+     return result;
+-- 
+1.8.4.5
+
diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 939602b..c141b94 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -15,6 +15,10 @@ SRC_URI = "http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_re
            git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools \
            file://01_get_svn_version_from_LASTCHANGE.patch \
 	   file://cef-simple \
+	   file://0001-bignum.cc-disable-warning-from-gcc-5.patch \
+	   file://0002-image_util.cc-disable-warning-from-gcc-5.patch \
+	   file://0003-gtest-typed-test.h-disable-warning-unused-definition.patch \
+	   file://0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch \
 	  "
 SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
 SRC_URI[sha256sum] = "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
-- 
1.8.4.5


