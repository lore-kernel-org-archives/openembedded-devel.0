Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 061BE6FF93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 04:21:17 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u25so3250721qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 21:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MgLeWuzLl4/YjN1Azxr1IDPaNLC0vbUhP4gEiaRJcMc=;
	b=HxvuQr39J4gbdpgMP610yX0EVaA/v+3LN35miMsjhdiUJ/wh79EkSYnlu9kGuPgDr/
	HR0JHROvKoVDZ2u2Fi/0Rz1ZRJ3HbkybR5lGGjXY7fBIuezmBgQLi7hEQPe10Rg7katk
	JchN6056APYWleyu8BnNCs09bOd3sT/tj94ZiB62oO7UvuoXEyUE0M/96XctjVVtYLX9
	h735UnAPU3zGhYkEtaWz405eRS7BIxKgP+rk3n45aAzfHYZj4BauV1RDGWsovB5DWIg7
	RnkOY4cUnpNQbFDfbAzCV0nvnzjnj8mJFcsyEY5rlNXnyX3+aeDziOx1wbeIGvMUM0iN
	QruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MgLeWuzLl4/YjN1Azxr1IDPaNLC0vbUhP4gEiaRJcMc=;
	b=fsaoyuM8JUDJFCwbyy+ZjY/cTugWKRuDsMs3jv/pTGtRVTIjPGLGy0KHTeI77Qq3Lp
	IK+9dlUZW+eHH8IIIUnRYcGcZRpsh6D2EIRMWRuYh9QhmXbK2Cf+8NgW3Rr1d8zKD/CP
	BB8cFPcN7guX7IJFfI3EYs2/5nXGT7uEUW/g99nQndUycrzxBnjdrVueiVHDDSKlqrgv
	REXAjO2xGwJ+E/qazENbW3Niwnuolrum0RrHGXDb3nnagimKzZMN2iN9G2KN0I3qpYqI
	o8mLwtsVwzhrNljmZGBAnhYBTq0EDPGlPHpCc5/rtD82vvsx2Jx2TElBAKfwDFqWvUm5
	oc9Q==
X-Gm-Message-State: ALyK8tKBbCaKl0gtT2M1+de3Gqh9zhGwz1mMIPNOnEkgjxK8crrQhZb9HLQi4WmeSxLKtA==
X-Received: by 10.200.35.44 with SMTP id a41mr53533699qta.25.1469074877143;
	Wed, 20 Jul 2016 21:21:17 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b132sm3342006qkg.8.2016.07.20.21.21.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 21:21:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 00:21:32 -0400
Message-Id: <20160721042134.14806-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160721042134.14806-1-twoerner@gmail.com>
References: <20160721042134.14806-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH v2 2/4] chromium: gcc-6 support
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
X-List-Received-Date: Thu, 21 Jul 2016 04:21:18 -0000

Allow chromium to build with gcc-6.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 60 ---------------
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 39 ----------
 .../0008-Fix-GCC-uninitialized-warning.patch       | 26 -------
 ...9-Fix-build-errors-with-GCC-in-Debug-mode.patch | 46 ------------
 ...be-used-uninitialized-in-this-function-wa.patch | 25 -------
 ...for-unused-variable-error-in-ui-gfx-color.patch | 86 ----------------------
 .../chromium/chromium-48/remove-Werror.patch       | 73 ++++++++++++++++++
 recipes-browser/chromium/chromium_48.0.2548.0.bb   | 12 +--
 8 files changed, 74 insertions(+), 293 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitialized-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch

diff --git a/recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch
deleted file mode 100644
index 67f9800..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5b8c53a6bb11c8aa9b575b5a8155c25c5085f349 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.oss.09@gmail.com>
-Date: Fri, 6 Nov 2015 12:22:35 +0100
-Subject: [PATCH] bignum.cc: disable warning from gcc 5
-
-addresses:
-  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: assuming
-  signed overflow does not occur when assuming that (X + c) < X is always
-  false [-Werror=strict-overflow]
-      void Bignum::AssignDecimalString(Vector<const char> value) {
-           ^
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-
-Upstream-Status: Pending
-See the discussion on the issue in Chromium upstream:
-https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
----
- third_party/WebKit/Source/wtf/dtoa/bignum.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-index a000b46..6c6d336 100644
---- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-+++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
-@@ -102,7 +102,10 @@
-     }
- 
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
-     void Bignum::AssignDecimalString(Vector<const char> value) {
-+#pragma GCC diagnostic pop
-         // 2^64 = 18446744073709551616 > 10^19
-         const int kMaxUint64DecimalDigits = 19;
-         Zero();
-@@ -696,7 +696,10 @@
-     }
-
-
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
-     void Bignum::Align(const Bignum& other) {
-+#pragma GCC diagnostic pop
-         if (exponent_ > other.exponent_) {
-             // If "X" represents a "hidden" digit (by the exponent) then we are in the
-             // following case (a == this, b == other):
-@@ -709,7 +709,10 @@
-             for (int i = used_digits_ - 1; i >= 0; --i) {
-                 bigits_[i + zero_digits] = bigits_[i];
-             }
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
-             for (int i = 0; i < zero_digits; ++i) {
-+#pragma GCC diagnostic pop
-                 bigits_[i] = 0;
-             }
-             used_digits_ += zero_digits;
--- 
-1.8.4.5
diff --git a/recipes-browser/chromium/chromium/chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch
deleted file mode 100644
index 1825a85..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.oss.09@gmail.com>
-Date: Tue, 3 Nov 2015 22:13:40 +0100
-Subject: [PATCH] image_util.cc: disable warning from gcc 5
-
-addresses:
-  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed overflow does
-  not occur when assuming that (X - c) <= X is always true
-  [-Werror=strict-overflow]
-  bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
-       ^
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-
-Upstream-Status: Pending
-See the discussion on the issue in Chromium upstream:
-https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g
-
----
- ui/gfx/image/image_util.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
-index 89a3f8c..d595da3 100644
---- a/ui/gfx/image/image_util.cc
-+++ b/ui/gfx/image/image_util.cc
-@@ -47,7 +47,10 @@
- }
- #endif  // !defined(OS_IOS)
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wstrict-overflow"
- bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
-+#pragma GCC diagnostic pop
-   *leading = 0;
-   *trailing = std::max(1, image.width()) - 1;
-   if (!image.HasRepresentation(1.0))
--- 
-1.8.4.5
diff --git a/recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitialized-warning.patch b/recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitialized-warning.patch
deleted file mode 100644
index 3bf6d96..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0008-Fix-GCC-uninitialized-warning.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 12d7fb643188ea5033aaf70ffe64b4c58eefc5eb Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Fri, 29 Apr 2016 14:02:44 +0200
-Subject: [PATCH] Fix GCC uninitialized warning
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- third_party/ots/src/name.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/third_party/ots/src/name.cc b/third_party/ots/src/name.cc
-index a0dd1ea..070ddae 100644
---- a/third_party/ots/src/name.cc
-+++ b/third_party/ots/src/name.cc
-@@ -79,7 +79,7 @@ bool ots_name_parse(Font *font, const uint8_t* data, size_t length) {
-   const char* string_base = reinterpret_cast<const char*>(data) +
-       string_offset;
- 
--  NameRecord prev_record;
-+  NameRecord prev_record(0, 0, 0, 0);
-   bool sort_required = false;
- 
-   // Read all the names, discarding any with invalid IDs,
--- 
-2.5.0
-
diff --git a/recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch b/recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch
deleted file mode 100644
index f5f7889..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2d7143090fdfd82950be352078daa5019279d81f Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Fri, 29 Apr 2016 17:14:15 +0200
-Subject: [PATCH] Fix build errors with GCC in Debug mode
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- third_party/WebKit/Source/wtf/dtoa/utils.h                         | 7 +++++++
- .../cacheinvalidation/src/google/cacheinvalidation/include/types.h | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/third_party/WebKit/Source/wtf/dtoa/utils.h b/third_party/WebKit/Source/wtf/dtoa/utils.h
-index 0a61c01..7738e9a 100644
---- a/third_party/WebKit/Source/wtf/dtoa/utils.h
-+++ b/third_party/WebKit/Source/wtf/dtoa/utils.h
-@@ -165,7 +165,14 @@ namespace double_conversion {
- 
-         // Access individual vector elements - checks bounds in debug mode.
-         T& operator[](int index) const {
-+#if !defined(NDEBUG)
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstrict-overflow"
-+#endif // !defined(NDEBUG)
-             ASSERT(0 <= index && index < length_);
-+#if !defined(NDEBUG)
-+#pragma GCC diagnostic pop
-+#endif // !defined(NDEBUG)
-             return start_[index];
-         }
- 
-diff --git a/third_party/cacheinvalidation/src/google/cacheinvalidation/include/types.h b/third_party/cacheinvalidation/src/google/cacheinvalidation/include/types.h
-index 4e3be27..835e956 100644
---- a/third_party/cacheinvalidation/src/google/cacheinvalidation/include/types.h
-+++ b/third_party/cacheinvalidation/src/google/cacheinvalidation/include/types.h
-@@ -172,7 +172,7 @@ class ErrorInfo {
-  */
- class ObjectId {
-  public:
--  ObjectId() : is_initialized_(false) {}
-+  ObjectId() : is_initialized_(false), source_(0) {}
- 
-   /* Creates an object id for the given source and name (the name is copied). */
-   ObjectId(int source, const string& name)
--- 
-2.5.0
-
diff --git a/recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch b/recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch
deleted file mode 100644
index 30cd511..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 135debdc4613d5d323d1659166466f74f2e75284 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Fri, 6 May 2016 12:44:36 +0200
-Subject: [PATCH] Fix "'rv' may be used uninitialized in this function" warning
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- third_party/mojo/src/mojo/edk/system/unique_identifier.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/third_party/mojo/src/mojo/edk/system/unique_identifier.cc b/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
-index 22abf22..6f9a761 100644
---- a/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
-+++ b/third_party/mojo/src/mojo/edk/system/unique_identifier.cc
-@@ -31,6 +31,7 @@ UniqueIdentifier UniqueIdentifier::FromString(const std::string& s,
-     memcpy(rv.data_, &bytes[0], sizeof(rv.data_));
-     *success = true;
-   } else {
-+    memset(rv.data_, 0, sizeof(rv.data_));
-     *success = false;
-   }
-   return rv;
--- 
-2.7.4
-
diff --git a/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch b/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
deleted file mode 100644
index e3f20ef..0000000
--- a/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 41cb20a99eb12443f649051a608c7dfe28661d85 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Thu, 19 May 2016 22:38:32 +0200
-Subject: [PATCH] Workaround for unused-variable error in
- ui/gfx/color_palette.h
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- ui/gfx/BUILD.gn         |  1 +
- ui/gfx/color_palette.cc | 12 ++++++++++++
- ui/gfx/color_palette.h  | 12 ++++++------
- ui/gfx/gfx.gyp          |  1 +
- 4 files changed, 20 insertions(+), 6 deletions(-)
- create mode 100644 ui/gfx/color_palette.cc
-
-diff --git a/ui/gfx/BUILD.gn b/ui/gfx/BUILD.gn
-index dcd15b0..bf1455c 100644
---- a/ui/gfx/BUILD.gn
-+++ b/ui/gfx/BUILD.gn
-@@ -61,6 +61,7 @@ component("gfx") {
-     "codec/png_codec.h",
-     "color_analysis.cc",
-     "color_analysis.h",
-+    "color_palette.cc",
-     "color_palette.h",
-     "color_profile.cc",
-     "color_profile.h",
-diff --git a/ui/gfx/color_palette.cc b/ui/gfx/color_palette.cc
-new file mode 100644
-index 0000000..a8e6280
---- /dev/null
-+++ b/ui/gfx/color_palette.cc
-@@ -0,0 +1,12 @@
-+#include "color_palette.h"
-+
-+namespace gfx {
-+
-+const SkColor kChromeIconGrey = SkColorSetRGB(0x5A, 0x5A, 0x5A);
-+const SkColor kGoogleBlue300 = SkColorSetRGB(0x7B, 0xAA, 0xF7);
-+const SkColor kGoogleBlue500 = SkColorSetRGB(0x42, 0x85, 0xF4);
-+const SkColor kGoogleRed700 = SkColorSetRGB(0xC5, 0x39, 0x29);
-+const SkColor kGoogleGreen700 = SkColorSetRGB(0x0B, 0x80, 0x43);
-+const SkColor kGoogleYellow700 = SkColorSetRGB(0xF0, 0x93, 0x00);
-+
-+}  // namespace gfx
-diff --git a/ui/gfx/color_palette.h b/ui/gfx/color_palette.h
-index 372f52c..63fa8af 100644
---- a/ui/gfx/color_palette.h
-+++ b/ui/gfx/color_palette.h
-@@ -9,15 +9,15 @@
- 
- namespace gfx {
- 
--const SkColor kChromeIconGrey = SkColorSetRGB(0x5A, 0x5A, 0x5A);
-+extern const SkColor kChromeIconGrey;
- 
- // The number refers to the shade of darkness. Each color in the MD
- // palette ranges from 100-900.
--const SkColor kGoogleBlue300 = SkColorSetRGB(0x7B, 0xAA, 0xF7);
--const SkColor kGoogleBlue500 = SkColorSetRGB(0x42, 0x85, 0xF4);
--const SkColor kGoogleRed700 = SkColorSetRGB(0xC5, 0x39, 0x29);
--const SkColor kGoogleGreen700 = SkColorSetRGB(0x0B, 0x80, 0x43);
--const SkColor kGoogleYellow700 = SkColorSetRGB(0xF0, 0x93, 0x00);
-+extern const SkColor kGoogleBlue300;
-+extern const SkColor kGoogleBlue500;
-+extern const SkColor kGoogleRed700;
-+extern const SkColor kGoogleGreen700;
-+extern const SkColor kGoogleYellow700;
- 
- }  // namespace gfx
- 
-diff --git a/ui/gfx/gfx.gyp b/ui/gfx/gfx.gyp
-index 8067bee..98b6312 100644
---- a/ui/gfx/gfx.gyp
-+++ b/ui/gfx/gfx.gyp
-@@ -142,6 +142,7 @@
-         'codec/png_codec.h',
-         'color_analysis.cc',
-         'color_analysis.h',
-+        'color_palette.cc',
-         'color_palette.h',
-         'color_profile.cc',
-         'color_profile.h',
--- 
-2.7.4
-
diff --git a/recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch
new file mode 100644
index 0000000..2d1842b
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch
@@ -0,0 +1,73 @@
+Index: chromium-48.0.2548.0/build/common.gypi
+===================================================================
+--- chromium-48.0.2548.0.orig/build/common.gypi
++++ chromium-48.0.2548.0/build/common.gypi
+@@ -1421,7 +1421,7 @@
+ 
+     # Disable fatal linker warnings, similarly to how we make it possible
+     # to disable -Werror (e.g. for different toolchain versions).
+-    'disable_fatal_linker_warnings%': 0,
++    'disable_fatal_linker_warnings%': 1,
+ 
+     'release_valgrind_build%': 0,
+ 
+@@ -3135,12 +3135,6 @@
+               '-Wsign-compare',
+             ]
+           }],
+-          # TODO: Fix all warnings on chromeos too.
+-          [ 'os_posix==1 and OS!="mac" and OS!="ios" and (clang!=1 or chromeos==1)', {
+-            'cflags!': [
+-              '-Werror',
+-            ],
+-          }],
+           [ 'os_posix==1 and os_bsd!=1 and OS!="mac" and OS!="android"', {
+             'cflags': [
+               # Don't warn about ignoring the return value from e.g. close().
+@@ -3692,10 +3686,10 @@
+     }],
+     ['os_posix==1 and OS!="mac" and OS!="ios"', {
+       'target_defaults': {
+-        # Enable -Werror by default, but put it in a variable so it can
++        # Disable -Werror by default, but put it in a variable so it can
+         # be disabled in ~/.gyp/include.gypi on the valgrind builders.
+         'variables': {
+-          'werror%': '-Werror',
++          'werror%': '',
+           'libraries_for_target%': '',
+         },
+         'defines': [
+@@ -5045,7 +5039,7 @@
+           'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # -fobjc-call-cxx-cdtors
+           'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # -fvisibility=hidden
+           'GCC_THREADSAFE_STATICS': 'NO',           # -fno-threadsafe-statics
+-          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
+           'GCC_VERSION': '4.2',
+           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
+           'USE_HEADERMAP': 'NO',
+Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+===================================================================
+--- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
++++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+@@ -687,7 +687,6 @@ config("default_warnings") {
+     cflags += [
+       # Enables.
+       "-Wendif-labels",  # Weird old-style text after an #endif.
+-      "-Werror",  # Warnings as errors.
+ 
+       # Disables.
+       "-Wno-missing-field-initializers",  # "struct foo f = {0};"
+Index: chromium-48.0.2548.0/build/nocompile.gypi
+===================================================================
+--- chromium-48.0.2548.0.orig/build/nocompile.gypi
++++ chromium-48.0.2548.0/build/nocompile.gypi
+@@ -81,7 +81,7 @@
+             '<(nocompile_driver)',
+             '4', # number of compilers to invoke in parallel.
+             '<(RULE_INPUT_PATH)',
+-            '-Wall -Werror -Wfatal-errors -I<(DEPTH)',
++            '-Wall -I<(DEPTH)',
+             '<(nc_result_path)',
+             ],
+           'message': 'Generating no compile results for <(RULE_INPUT_PATH)',
diff --git a/recipes-browser/chromium/chromium_48.0.2548.0.bb b/recipes-browser/chromium/chromium_48.0.2548.0.bb
index 2a52568..70afa6c 100644
--- a/recipes-browser/chromium/chromium_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium_48.0.2548.0.bb
@@ -2,16 +2,11 @@ include chromium-browser.inc
 
 SRC_URI += "\
         file://chromium-48/add_missing_stat_h_include.patch \
-        file://chromium-48/0001-bignum.cc-disable-warning-from-gcc-5.patch \
-        file://chromium-48/0002-image_util.cc-disable-warning-from-gcc-5.patch \
         file://chromium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://chromium-48/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://chromium-48/0005-Override-root-filesystem-access-restriction.patch \
-        file://chromium-48/0008-Fix-GCC-uninitialized-warning.patch \
-        file://chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch \
-        file://chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch \
         file://chromium-48/0011-Replace-readdir_r-with-readdir.patch \
-        file://chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch \
+        file://chromium-48/remove-Werror.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-48/0002-Disable-API-keys-info-bar.patch', '', d)} \
 "
@@ -43,8 +38,3 @@ CHROMIUM_X11_DEPENDS = "xextproto gtk+ libxi libxss"
 CHROMIUM_X11_GYP_DEFINES = ""
 CHROMIUM_WAYLAND_DEPENDS = "wayland libxkbcommon"
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
-
-# | gen/protoc_out/components/enhanced_bookmarks/proto/cluster.pb.cc:257:3: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
-# |    if (!_extensions_.IsInitialized()) return false;  return true;
-# |    ^~
-PNBLACKLIST[chromium] ?= "BROKEN: fails to build with gcc-6"
-- 
2.9.0


