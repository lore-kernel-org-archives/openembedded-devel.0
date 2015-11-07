Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E9959770E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:22:56 +0000 (UTC)
Received: by wikq8 with SMTP id q8so44621432wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W18tHa78NJWJ2QE53qWd1JvKxBVUIrGuBR0k4TnTTAo=;
	b=KDrMwNpBy6tYrnRo5SOrSbBzX1rDTLPDORQZ+SzpV+nSKNMfZ8qFqtBZkUi2wpOqQV
	uDf/gPbcf8mhscdsHtuCubSsFuD3U6Fhrno3lne8OWJuljdCojj0BaJD3brQxH49OKSy
	QlvbNUwEz7vhbF+RzWr+GgFyVtdfWku0CYbmB1PSQDps5edn41wD32wN1h3Sx31T3F13
	8ZA6xDSh257kEaFCjKem83zoldpI4/plwO94JX6q4eB0XAB4G4XeFxuK8l9CeoIBiaLL
	1Tqocqa4gT3kid68g6UFk/q6YricYLo06eeRjjwZqta+gC/QL/JompIqvBEwxGnVwvvC
	IsGg==
X-Received: by 10.194.171.69 with SMTP id as5mr19815153wjc.137.1446898976317; 
	Sat, 07 Nov 2015 04:22:56 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:22:55 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:25 +0100
Message-Id: <1446898829-21243-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-browser][PATCH v2 1/5] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Sat, 07 Nov 2015 12:22:57 -0000

A chromium build with gcc5 fails with warnings treated as errors.

bignum.cc, image_util.cc: strict-overflow warning

Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
armv7a with gcc linaro-4.9.4.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 +++++++++++++++++++++
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
 3 files changed, 82 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch

diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
new file mode 100644
index 0000000..4a28bda
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
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
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
new file mode 100644
index 0000000..7023233
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
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
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 8bc05ee..a9635cd 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -28,7 +28,10 @@ SRC_URI = "\
         file://google-chrome.desktop \
         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
         file://chromium-40/add_missing_stat_h_include.patch \
+        file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch \
+        file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
 "
+
 #
 # * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
 #             and regular OpenGL for painting operations. Neither are desirable on embedded platforms. With this
-- 
1.8.4.5


