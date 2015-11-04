Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F94F770E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 21:51:54 +0000 (UTC)
Received: by wmll128 with SMTP id l128so125841190wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 13:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sY9VpHxGWzXJUuu8d5VIvXBuoaW27FyS4FXsLpi19s8=;
	b=m2Ulo1cPF6Gx/hHWd5bWsnXXiXsiL/5ZerSXCRc2UOVI1/4OWqCcFid8Oz6wuRcvq0
	5KUsapQ4Y70o+fNtOkxKvAltwfpIrB8pY3eo4GA5tNhMf7gkhnMw4m5JY1EiVzvytF+X
	xnoQCNzUOwa/jyupnLn4gnwu7zF3FTVHViKaZUR30NQgQvFsd0E1InhFL6zWT2dJ4N82
	O6HlpN5HLdKp0BP+vnwWRYMnXtStxhHfBuZj/OTN+Ee6LTRj4ZLXU11Aozx1c5ZaEpqK
	dx3L8gRtCbNX9JlszWgUFsKcCp5JjSJE0JYpH39yDUG4yRw9l5xs7pNc8cDbMbjIa08c
	wcOQ==
X-Received: by 10.28.130.12 with SMTP id e12mr29585153wmd.76.1446673914118;
	Wed, 04 Nov 2015 13:51:54 -0800 (PST)
Received: from Saturn.local.all (212-41-109-218.adsl.solnet.ch.
	[212.41.109.218]) by smtp.gmail.com with ESMTPSA id
	d10sm3615748wje.14.2015.11.04.13.51.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 13:51:53 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 22:50:03 +0100
Message-Id: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Wed, 04 Nov 2015 21:51:59 -0000

A chromium build with gcc5 fails with warnings treated as errors.

bignum.cc, image_util.cc: strict-overflow warning

Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
armv7a with gcc linaro-4.9.4.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../0001-bignum.cc-fix-warning-from-gcc-5.patch    | 56 ++++++++++++++++++++++
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 37 ++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
 3 files changed, 96 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch

diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
new file mode 100644
index 0000000..f3d7f77
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
@@ -0,0 +1,56 @@
+From 689576b2f5c6398f6ef5203fe52edcf86b452790 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Tue, 3 Nov 2015 20:51:04 +0100
+Subject: [PATCH 1/2] bignum.cc: fix warning from gcc 5
+
+Refactoring the source seems to workaround the compiler warning.
+
+addresses:
+  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: assuming
+  signed overflow does not occur when assuming that (X + c) < X is always
+  false [-Werror=strict-overflow]
+      void Bignum::AssignDecimalString(Vector<const char> value) {
+           ^
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+Upstream-Status: Pending
+
+---
+ third_party/WebKit/Source/wtf/dtoa/bignum.cc | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+index a000b46..e5426dd 100644
+--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
+@@ -105,20 +105,19 @@ namespace double_conversion {
+     void Bignum::AssignDecimalString(Vector<const char> value) {
+         // 2^64 = 18446744073709551616 > 10^19
+         const int kMaxUint64DecimalDigits = 19;
++        int currentLen;
+         Zero();
+         int length = value.length();
+         int pos = 0;
+         // Let's just say that each digit needs 4 bits.
+-        while (length >= kMaxUint64DecimalDigits) {
+-            uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
+-            pos += kMaxUint64DecimalDigits;
+-            length -= kMaxUint64DecimalDigits;
+-            MultiplyByPowerOfTen(kMaxUint64DecimalDigits);
++        while (length > 0) {
++            currentLen = length > kMaxUint64DecimalDigits ? kMaxUint64DecimalDigits : length;
++            uint64_t digits = ReadUInt64(value, pos, currentLen);
++            MultiplyByPowerOfTen(currentLen);
+             AddUInt64(digits);
++            pos += currentLen;
++            length -= currentLen;
+         }
+-        uint64_t digits = ReadUInt64(value, pos, length);
+-        MultiplyByPowerOfTen(length);
+-        AddUInt64(digits);
+         Clamp();
+     }
+ 
+-- 
+1.8.4.5
+
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
new file mode 100644
index 0000000..d62645b
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
@@ -0,0 +1,37 @@
+From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.oss.09@gmail.com>
+Date: Tue, 3 Nov 2015 22:13:40 +0100
+Subject: [PATCH 2/2] image_util.cc: disable warning from gcc 5
+
+addresses:
+  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed overflow does
+  not occur when assuming that (X - c) <= X is always true
+  [-Werror=strict-overflow]
+  bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
+       ^
+
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+Upstream-Status: Pending
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
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 8bc05ee..3e00b8d 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -28,7 +28,10 @@ SRC_URI = "\
         file://google-chrome.desktop \
         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
         file://chromium-40/add_missing_stat_h_include.patch \
+        file://chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch \
+        file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
 "
+
 #
 # * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
 #             and regular OpenGL for painting operations. Neither are desirable on embedded platforms. With this
-- 
1.8.4.5


