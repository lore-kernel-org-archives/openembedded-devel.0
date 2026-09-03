Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5248C624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4197.1788429029700951171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RMi7uau/;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1757061b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429029; x=1789033829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uH+WFZpYPMGcyNdGLX9S0238HKwi0ufjoPk5hsnRTks=;
        b=RMi7uau/L+o7XHsVGQMsC+V28KGdqxAd/KxueHS2yYLZn5fA2pGZ+vNycZIJHCNR9c
         3WTmkK3u7W2EPLK/IAfKVkyTFG7/EvoJCLwWNpvSiMAzYcOpp0unvQx+KxLtzSEBCfm4
         /zvmhPi1xMYKBBruPXPAYejrpECV66tXCdEaNEg0NKQDIW/FZbJZKn2JJcwTkjYRZucg
         tWwB0c9OY79gtnd0anXA6TKnv2YOtdgM0d17mj+yr7v3FkoIoU+y6Vrku1NRlGkytf/Q
         I8RQVgvKDZ4s5HOMP9rpMAyfbju+9xtlzta86RAo5cJ+fkRXfQTtG6w6BpjKO6mFTkmn
         mWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429029; x=1789033829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uH+WFZpYPMGcyNdGLX9S0238HKwi0ufjoPk5hsnRTks=;
        b=NyAVTsXZZczG8493+sUT5NmbivePaCbVX24GgHYkFfNNDaDvzm5XLVSg9DO6B5d6u9
         bhgxGgTE/Tld3rSk76W2PX6r4RZChmwYeNy7RQkHFe8wh17A+HFaVdQ+5WtYntbKY0BL
         iMKhxodSHbswfynbCxw6h62g+0S1TSN/a7+qKXXzl+5RrIcUcVwJhY+w6LH9lk7U5b2F
         r0zkB33k+tuG1maRzI+B3sMtbY/la3Gd0zQqkfnuKLqHy7WgLQE5/aPRX3nGnmnY4Zvk
         PsY+XmEKNUWNs4FS12HHLt+Vq7LWux7IQyEQUl06iJBBFNvf+Rbqfcm7cRtV/Ga5R0xP
         TVvQ==
X-Gm-Message-State: AFuF++kD5CJbeie7tAj2NuE5dbo4NUv1ovNG2NVCniHZ2OQp1nlLfHdp
	e9PvPSN0BXvBMv/pJyE/jhPDSujZvqw68s+oaztViDXjLAdTiCvwWodLRGtRPoNw
X-Gm-Gg: AYBFou0rzpn2ekp6Pl6mK+2TT/mSu67wQwt5uG2mWX3aHMF8ZyAOeK6+pUhF+NTKNRH
	ABX4xBwZ5vU+AeJqhl7bO89uT7cXODKG4HS297ZQgpXNWMwrUMO2Af0wi87TBiEs0qpxlZqa4yM
	fZjpmYDDdjy+oiQdPpwQARvAp2h0znX6Chaf7Mbpg1P2P2uf415oYF/iresDgD2X5KpFhulTmCm
	2dLisT/3kyZTRfODN5/Kox6CMUdtn1NWL00k0pyfmd7q2Vgm4Odl7OO+KJOg3ukKyCLKQqjmDU6
	XDxXJEY9RlVU3UCfQutbVPabzLiKF3sEMHoFX3SeCwKF6OZopL3z7xPGVqnbJBhtBpQVUtwlxRC
	SETSLaOgDrRkU5A0D6SN8qdYi30hlqfaDueGIV8KuIKd67MxZ+J0cB49NMA9LmR/hvfdakNiMbj
	72x2yJs+1+9tq5BkMjO9lpjVfSQ7eqL6plTdIEfDTUFuEc1sTr1aU/schqjrz4U6KDiStpXJDMd
	4jBQJDBi7U=
X-Received: by 2002:a05:6a00:2305:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-85ed5015dfemr11243090b3a.25.1788429028861;
        Thu, 03 Sep 2026 02:50:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 13/22] libheif: patch CVE-2026-62289
Date: Thu,  3 Sep 2026 21:49:44 +1200
Message-ID: <20260903094954.3240723-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129729

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-62289

[1]https://security-tracker.debian.org/tracker/CVE-2026-62289

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-62289.patch      | 189 ++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch
new file mode 100644
index 0000000000..5473a2ae18
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch
@@ -0,0 +1,189 @@
+From 49e188ca7a6a81fd1c7d5e76254308c82cbcb5c3 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Thu, 25 Jun 2026 19:58:57 +0200
+Subject: [PATCH] Fix clap transform double-application in image tiling
+ (GHSA-jc8f-p23p-5hjg)
+
+The base ImageItem::get_heif_image_tiling() returned the already
+transformed m_width/m_height, but process_image_transformations_on_tiling()
+applies the transformative properties (irot, imir, clap) itself. This
+applied every transform twice. For a clap that rounds the image down to
+zero, the second application passed 0 into Box_clap::left_rounded(), where
+`image_width - 1U` underflowed to UINT32_MAX and overflowed the Fraction
+constructor (assert abort in debug builds, corrupt crop in release builds).
+The grid, unc and tiled overrides already return coded dimensions, so the
+base class was the lone outlier.
+
+Fixes, in three layers:
+
+ - image_item.cc: base get_heif_image_tiling() now reports coded (ispe)
+   dimensions when available, matching the other overrides, so transforms
+   are applied exactly once. This also fixes a silent irot/imir
+   double-transform on the same path.
+ - context.cc: reject a clap that rounds a dimension to zero or less at
+   parse time, mirroring the existing ispe zero-size check.
+ - box.cc: guard left_rounded()/top_rounded() against a zero image
+   dimension as defense in depth.
+
+Add tests/clap_zero_size.cc covering the hardened clap helpers.
+
+(cherry picked from commit f01870c1d7323a3003796d58eba7fff502be994c)
+
+CVE: CVE-2026-62289
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/f01870c1d7323a3003796d58eba7fff502be994c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/box.cc                    | 11 ++++++++
+ libheif/context.cc                | 12 +++++++--
+ libheif/image-items/image_item.cc | 23 ++++++++++++++---
+ tests/CMakeLists.txt              |  1 +
+ tests/clap_zero_size.cc           | 42 +++++++++++++++++++++++++++++++
+ 5 files changed, 83 insertions(+), 6 deletions(-)
+ create mode 100644 tests/clap_zero_size.cc
+
+diff --git a/libheif/box.cc b/libheif/box.cc
+index 76ba0f0a..57912ab0 100644
+--- a/libheif/box.cc
++++ b/libheif/box.cc
+@@ -3592,6 +3592,12 @@ int Box_clap::left_rounded(uint32_t image_width) const
+ 
+   // left = horizOff + (width-1)/2 - (clapWidth-1)/2
+ 
++  // Guard against image_width==0: `image_width - 1U` would underflow to
++  // UINT32_MAX and overflow the Fraction (GHSA-jc8f-p23p-5hjg).
++  if (image_width == 0) {
++    return 0;
++  }
++
+   Fraction pcX = m_horizontal_offset + Fraction(image_width - 1U, 2U);
+   Fraction left = pcX - (m_clean_aperture_width - 1) / 2;
+ 
+@@ -3607,6 +3613,11 @@ int Box_clap::right_rounded(uint32_t image_width) const
+ 
+ int Box_clap::top_rounded(uint32_t image_height) const
+ {
++  // Guard against image_height==0 underflowing the Fraction (see left_rounded).
++  if (image_height == 0) {
++    return 0;
++  }
++
+   Fraction pcY = m_vertical_offset + Fraction(image_height - 1U, 2U);
+   Fraction top = pcY - (m_clean_aperture_height - 1) / 2;
+ 
+diff --git a/libheif/context.cc b/libheif/context.cc
+index a1bcc268..a3371207 100644
+--- a/libheif/context.cc
++++ b/libheif/context.cc
+@@ -644,8 +644,16 @@ Error HeifContext::interpret_heif_file_images()
+     for (const auto& prop : properties) {
+       auto clap = std::dynamic_pointer_cast<Box_clap>(prop);
+       if (clap) {
+-        image->set_resolution(clap->get_width_rounded(),
+-                              clap->get_height_rounded());
++        int clap_width = clap->get_width_rounded();
++        int clap_height = clap->get_height_rounded();
++        if (clap_width <= 0 || clap_height <= 0) {
++          return {heif_error_Invalid_input,
++                  heif_suberror_Invalid_clean_aperture,
++                  "Clean aperture (clap) reduces image to zero size"};
++        }
++
++        image->set_resolution(static_cast<uint32_t>(clap_width),
++                              static_cast<uint32_t>(clap_height));
+ 
+         if (image->has_intrinsic_matrix()) {
+           image->get_intrinsic_matrix().apply_clap(clap.get(), image->get_width(), image->get_height());
+diff --git a/libheif/image-items/image_item.cc b/libheif/image-items/image_item.cc
+index e803107f..d05536e1 100644
+--- a/libheif/image-items/image_item.cc
++++ b/libheif/image-items/image_item.cc
+@@ -967,10 +967,25 @@ heif_image_tiling ImageItem::get_heif_image_tiling() const
+   tiling.num_columns = 1;
+   tiling.num_rows = 1;
+ 
+-  tiling.tile_width = m_width;
+-  tiling.tile_height = m_height;
+-  tiling.image_width = m_width;
+-  tiling.image_height = m_height;
++  // Report the coded (pre-transformation) dimensions here. The caller applies
++  // the transformative properties (irot, imir, clap) via
++  // process_image_transformations_on_tiling(), so handing it the already
++  // transformed m_width/m_height would apply them a second time. For a clap
++  // that shrinks the image to zero this double application underflowed inside
++  // Box_clap::left_rounded() (GHSA-jc8f-p23p-5hjg); for irot/imir it silently
++  // produced wrong dimensions. The grid/unc/tiled overrides likewise report
++  // coded dimensions.
++  uint32_t coded_width = m_width;
++  uint32_t coded_height = m_height;
++  if (has_ispe_resolution()) {
++    coded_width = get_ispe_width();
++    coded_height = get_ispe_height();
++  }
++
++  tiling.tile_width = coded_width;
++  tiling.tile_height = coded_height;
++  tiling.image_width = coded_width;
++  tiling.image_height = coded_height;
+ 
+   tiling.top_offset = 0;
+   tiling.left_offset = 0;
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index d8fdfd8b..b52bc202 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -38,6 +38,7 @@ if (WITH_REDUCED_VISIBILITY)
+ else()
+     add_libheif_test(bitstream_tests)
+     add_libheif_test(box_equals)
++    add_libheif_test(clap_zero_size)
+     add_libheif_test(conversion)
+     add_libheif_test(idat)
+     add_libheif_test(jpeg2000)
+diff --git a/tests/clap_zero_size.cc b/tests/clap_zero_size.cc
+new file mode 100644
+index 00000000..eafc1258
+--- /dev/null
++++ b/tests/clap_zero_size.cc
+@@ -0,0 +1,42 @@
++/*
++  libheif clean aperture (clap) zero-size unit tests
++
++  MIT License
++
++  Copyright (c) 2026 Dirk Farin <dirk.farin@gmail.com>
++
++  Permission is hereby granted, free of charge, to any person obtaining a copy
++  of this software and associated documentation files (the "Software"), to deal
++  in the Software without restriction, including without limitation the rights
++  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
++  copies of the Software, and to permit persons to whom the Software is
++  furnished to do so, subject to the following conditions:
++
++  The above copyright notice and this permission notice shall be included in all
++  copies or substantial portions of the Software.
++
++  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++  SOFTWARE.
++*/
++
++#include "catch_amalgamated.hpp"
++#include "box.h"
++
++// Regression test for GHSA-jc8f-p23p-5hjg: passing a zero image dimension to
++// the clap rounding helpers used to underflow `image_width - 1U` to UINT32_MAX,
++// which overflowed the Fraction constructor (assert abort in debug builds,
++// corrupt crop in release builds). They must now return 0 without aborting.
++TEST_CASE("clap rounding with zero image size") {
++  std::shared_ptr<Box_clap> clap = std::make_shared<Box_clap>();
++  clap->set(100, 200, 150, 250);  // clap 100x200 inside a 150x250 image
++
++  REQUIRE(clap->left_rounded(0) == 0);
++  REQUIRE(clap->right_rounded(0) == 99);    // clapWidth - 1 + left(0)
++  REQUIRE(clap->top_rounded(0) == 0);
++  REQUIRE(clap->bottom_rounded(0) == 199);  // clapHeight - 1 + top(0)
++}
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index f3f03abdc7..1dfab46513 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;
            file://CVE-2026-32741.patch \
            file://CVE-2026-41071-1.patch \
            file://CVE-2026-41071-2.patch \
+           file://CVE-2026-62289.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

