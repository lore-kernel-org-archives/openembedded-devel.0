Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97D6F6FF86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:50:53 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g62so286502463wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 10:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7W2u7sQ08CU9tSvNr/wMlnguTUn6iNoDMa106IJ48mQ=;
	b=FD2npgpJvwMdwMK5oHyFWqCoi72gQylMi+AWkGtaGgARHQluyRrT3kpJNTB31O07mm
	YZrJEucASBIR0K2FVhtnFj8qxiX2vTLjfifbN3M0Q/vcctZC6Y6C8DiffnplmdhswSos
	6Yta4uklNc4CXmhQI50nxe57xVPBFPEtRKJ/zDlBlrqf+V2io9o7BgqGEXAqJrMJBjgP
	ad55r4ctQqcBm5KgSuxWZHMQGoqHrFbNQj9g9WcVrVSxp1i4nlRiW3YihortPJ1Uyqw6
	VDjP8vYrHg018fjWTFpOt8udI+v49ihP7bzuKCDsWjX318neLhhU2XaqfInxqE1J43/Y
	Z8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7W2u7sQ08CU9tSvNr/wMlnguTUn6iNoDMa106IJ48mQ=;
	b=N3aP81LBJ637+6yOu8XED7cj9QlWiCzOvZC/o7rLcxLcI6PXfcmHQgf/k/d5Rimh+5
	oNFQfow8S3YXok8izCb9Hf774BkTJ3Gp9lbJf6O/8KZ148nLFHLyZ5Rtzzi5QsjHJP5g
	cFDtik5ueQ48yA3C4PdzWNdwbNGID5MLgB8EwR3SqpOmtYFihO0DrKiQYA9UM0vTJ6dJ
	Dp6DZm1q5fH4vyMmQr+FKY8PY+yW6x3uEd0wn0APjrDsJJrhpuinIUlowuVQC2xaiEBo
	EZEWgEttI0UzyxeP2q9OX2NAZt2c692kz6UzuC5NyFDVUQkxD5esG1wuxRnop7zlPs0s
	T5uQ==
X-Gm-Message-State: AG10YOSjzlET90KJvUyveY+52AQVjoIn7Ymvjeiu2tlCLfr3c4/AS3thGh9ByZNFsp+JWQ==
X-Received: by 10.28.17.81 with SMTP id 78mr26491851wmr.84.1456339854088;
	Wed, 24 Feb 2016 10:50:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x186sm32547529wmg.19.2016.02.24.10.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 10:50:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 19:51:57 +0100
Message-Id: <1456339917-10798-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-browser] chromium: fix build with newer gcc
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
X-List-Received-Date: Wed, 24 Feb 2016 18:50:55 -0000

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
 .../0001-bignum.cc-disable-warning-from-gcc-5.patch     | 17 ++++++++---------
 .../0002-image_util.cc-disable-warning-from-gcc-5.patch | 17 ++++++++---------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
index 4a28bda..e01e044 100644
--- a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
@@ -23,17 +23,16 @@ diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc b/third_party/WebKit/S
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


