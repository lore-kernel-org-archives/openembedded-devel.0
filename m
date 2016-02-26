Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 69FB87745D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:01:46 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so80506171wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZaqdyuR9tzsmRXF3vt2D9MctrDfPUQ3sRxUdNX9GSZ0=;
	b=P1wN/EIGrL/SicsF+CcTwXW4zR1NVm2dKMZEsYHeWqLlDO0SlowvJLvr050bdOc+Sb
	klM5ICXi6UI+KERpCqX7hxhEUaEz68P3bA1zCKP9pcnZtO9AlILZrAAelvp5AHhbecmq
	uU8mnn7n0BvCUFmg+uGCWniMN6y40xaXsmHsFFGESRAomyjlcEhdnXtVZMLbhVCwAM7u
	Kp41Ct91dALMntlV/nS6SacHTPM9NOUVw2UqYmqdNCCw7jfdRVDf5VsJhAxp5bPRA8Zs
	f8bScz9rolOV6Jhlh8wrmdKlZ72THZk5FGDunqOB0pxR+PwzZbbNxlneWWvU7VDfIpDq
	deFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZaqdyuR9tzsmRXF3vt2D9MctrDfPUQ3sRxUdNX9GSZ0=;
	b=Fc7hh8r9B8n/4ERwNp5PTzvMZ2fO3MrEFL85vOg/O+8Xq3nfedgxcKz/YlqQosLJKb
	ZAiy/DA0f14oKJSy5hd1rb7t9udTJcbQoVf+CDQXtoI+5b5Ddt7AkUbX/vfDjEdZaPDP
	mVfLNW7ZbrUWlD7twQ0t4kvl20EnAIyqqE4tSe9zJku/2xwi4lhAj3boutmLY5cQcEWW
	6fJy9dfPzTn/WFTfyEH+hoSV1lVp1D80+lj673H5cozrt+kNbiyy0bYO6pYsaTcTL1vf
	P6NJdC3Mx/Fy2EVcbiIJRjWVjNyeTy+BiubaxPGTzvYHY44I1SjiNPUuUmcCklWLHY5R
	SM6A==
X-Gm-Message-State: AD7BkJKPTE3eh94hKwpecsd5tGBAFah8j07MT3LDZAtz1YWGSI7amwr+jKBo+Uncth6PJQ==
X-Received: by 10.194.90.172 with SMTP id bx12mr2984589wjb.128.1456509707109; 
	Fri, 26 Feb 2016 10:01:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 77sm3836315wmp.18.2016.02.26.10.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 10:01:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 19:03:09 +0100
Message-Id: <1456509790-23305-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCHv2][meta-browser 1/2] chromium: fix build with newer gcc
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
X-List-Received-Date: Fri, 26 Feb 2016 18:01:47 -0000

* for whatever reason setting -Wstrict-overflow just for problematic
  line doesn't work and it needs to be adjusted on function definition
* the errors are also report line number where the function starts not
  the specific line which causes that warning
../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function 'void WTF::double_conversion::Bignum::Align(const WTF::double_conversion::Bignum&)':
../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
             for (int i = 0; i < zero_digits; ++i) {
                               ^
../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function 'void WTF::double_conversion::Bignum::AssignDecimalString(WTF::double_conversion::Vector<const char>)':
../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: assuming signed overflow does not occur when assuming that (X + c) < X is always false [-Werror=strict-overflow]
     void Bignum::AssignDecimalString(Vector<const char> value) {
          ^

../../ui/gfx/image/image_util.cc: In function 'bool gfx::VisibleMargins(const gfx::ImageSkia&, int*, int*)':
../../ui/gfx/image/image_util.cc:50:6: error: assuming signed overflow does not occur when assuming that (X - c) <= X is always true [-Werror=strict-overflow]
 bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
      ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 +++++++++++++++++-----
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 17 +++++-----
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
index 4a28bda..86691a5 100644
--- a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
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
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
index 7023233..1825a85 100644
--- a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
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
-- 
2.7.1


