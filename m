Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B01CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 07:53:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3321.1761638023042640496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 00:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SsyqCe6q;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a226a0798cso4619098b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761638022; x=1762242822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=seyqaQFkrJYo5g9za6bs6sq/iM1xuP24D1+CZY5/FuE=;
        b=SsyqCe6qWJL0LEJUgzzNkngGh9Jo3n/5BNo6JvP6RpJcSDTqFqDy5jH+dQr3ObW1N4
         qE45MiM9eb/L8jjPcvPNXdk7Qnkr5bGjKWEY++kqaLB113ZIFT+t9bl9QnVxFszMNY71
         +MFTMjVuC6FjxV0Iy2sG0RJ5C7l/fuh6RaaN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638022; x=1762242822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seyqaQFkrJYo5g9za6bs6sq/iM1xuP24D1+CZY5/FuE=;
        b=XzFj0B2SSOYQnoLVv32c7T8ReByKr5u0pq9RZHMn5KPwoo1smxbOJX5b+zIfQBWBoU
         8c+G+usfN2NMMWN6ZJ6l4VjIxZWOpf0aH2SN4tTdKS4s9PuNJA2lcNJW2bCo62FGIjGO
         NQHuimIzVtkZ/M0QbtDieBoXFDVOH8DHfDTAhTOyHmgMI4qHECnILpI1qohlUID2DRYN
         CL1YifxH5BhmqbfmHPJUhvxYEfOzCAAvnG3xZ0Wl76IY/LTgZU2G0wve/8I8e0Bhg+1y
         Sh63TjeVGgUlUJJO+AkGZiyjFut7On/ZO8w8YcLk9WSbECDrUrC4GqLtcz0KhyTQPoDR
         geDw==
X-Gm-Message-State: AOJu0Yy/AaoeR1kF70jUGymIUibp6VlCjlvD9IHUqR9anamDAplnnZ7M
	VYzMfsntQfnLBQSie1T6nh8MCVqJJAltKTDIcTUcDscoDaq5ikd0FuDJSWU7bZ4Qn4OaG2NwYiU
	67rOh+Ug=
X-Gm-Gg: ASbGncuVcms/jozeMoI+/92k5LtFdAVJ6xTJe+cSq/RvJylKGnw1mMpvWQ4pAMq9/4J
	XFZiX0tW3ctkygvdgIWbG/hcVWIZJ3W4fAMBskbtijbbLjyiVYdJI5B9ZfMZFr8ZieKs0XulsGI
	SxJ/3UiNZLT6R3pClnvYf9GzzJPB+HRdsKTm57rAMZHI3F85tRWQdZrjjzFktQ9EH2OFavJ4Wnz
	805R3C6fv/so3seyaF6t8+7AKf9KKfClti941n535pug61pANuNMmnKWUednGJBMd7rrx+xEl16
	Kq43RTfobcUPRi23v240dDDbhSvKOizG1jfiCNLyqaod/R8GPwx+beh13L3MxMar0Eu/w18QTVk
	nP4BSGJ35ViiMJVammsZGSEzTLBJSHLITRXGr7snSkROM7bAcKSAQuao/a+aZLM39SbiDDKpLUx
	vUx/3OKL8EYKNRFA==
X-Google-Smtp-Source: AGHT+IG6B6ahQGUPDU6Y6446KlgdX9+ZcbqgW0a9LrYVQVGQnCuTZLRn0v4ghDI04y42EsD0b58fUg==
X-Received: by 2002:a05:6a00:3921:b0:7a2:81fe:b742 with SMTP id d2e1a72fcca58-7a441bde361mr3581995b3a.12.1761638022033;
        Tue, 28 Oct 2025 00:53:42 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414066d0esm10853367b3a.43.2025.10.28.00.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 00:53:41 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] libjxl: fix CVE-2024-11403 & CVE-2024-11498
Date: Tue, 28 Oct 2025 13:23:36 +0530
Message-ID: <20251028075336.114724-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 07:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121066

* CVE-2024-11403 - Upstream-Status: Backport from https://github.com/libjxl/libjxl/commit/9cc451b91b74ba470fd72bd48c121e9f33d24c99
* CVE-2024-11498 - Upstream-Status: Backport from https://github.com/libjxl/libjxl/commit/bf4781a2eed2eef664790170977d1d3d8347efb9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libjxl/libjxl/CVE-2024-11403.patch        |  70 +++++++++++
 .../libjxl/libjxl/CVE-2024-11498.patch        | 113 ++++++++++++++++++
 .../libjxl/libjxl_0.10.2.bb                   |   6 +-
 3 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
new file mode 100644
index 0000000000..625218c2d3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
@@ -0,0 +1,70 @@
+From 9cc451b91b74ba470fd72bd48c121e9f33d24c99 Mon Sep 17 00:00:00 2001
+From: szabadka <9074039+szabadka@users.noreply.github.com>
+Date: Thu, 3 Oct 2024 18:07:38 +0200
+Subject: [PATCH] Port the Huffman lookup table size fix from brunsli. (#3871)
+
+CVE: CVE-2024-11403
+Upstream-Status: Backport [https://github.com/libjxl/libjxl/commit/9cc451b91b74ba470fd72bd48c121e9f33d24c99]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/jpegli/huffman.h                   | 16 ++++++++++++----
+ lib/jxl/jpeg/enc_jpeg_huffman_decode.h | 16 ++++++++++++----
+ 2 files changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/lib/jpegli/huffman.h b/lib/jpegli/huffman.h
+index f0e5e1de..99549668 100644
+--- a/lib/jpegli/huffman.h
++++ b/lib/jpegli/huffman.h
+@@ -15,10 +15,18 @@ namespace jpegli {
+ 
+ constexpr int kJpegHuffmanRootTableBits = 8;
+ // Maximum huffman lookup table size.
+-// According to zlib/examples/enough.c, 758 entries are always enough for
+-// an alphabet of 257 symbols (256 + 1 special symbol for the all 1s code) and
+-// max bit length 16 if the root table has 8 bits.
+-constexpr int kJpegHuffmanLutSize = 758;
++// Requirements: alphabet of 257 symbols (256 + 1 special symbol for the all 1s
++// code) and max bit length 16, the root table has 8 bits.
++// zlib/examples/enough.c works with an assumption that Huffman code is
++// "complete". Input JPEGs might have this assumption broken, hence the
++// following sum is used as estimate:
++//  + number of 1-st level cells
++//  + number of symbols
++//  + asymptotic amount of repeated 2nd level cells
++// The third number is 1 + 3 + ... + 255 i.e. it is assumed that sub-table of
++// each "size" might be almost completely be filled with repetitions.
++// Total sum is slightly less than 1024,...
++constexpr int kJpegHuffmanLutSize = 1024;
+ 
+ struct HuffmanTableEntry {
+   uint8_t bits;    // number of bits used for this symbol
+diff --git a/lib/jxl/jpeg/enc_jpeg_huffman_decode.h b/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
+index b8a60e41..fc9bd17b 100644
+--- a/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
++++ b/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
+@@ -15,10 +15,18 @@ namespace jpeg {
+ 
+ constexpr int kJpegHuffmanRootTableBits = 8;
+ // Maximum huffman lookup table size.
+-// According to zlib/examples/enough.c, 758 entries are always enough for
+-// an alphabet of 257 symbols (256 + 1 special symbol for the all 1s code) and
+-// max bit length 16 if the root table has 8 bits.
+-constexpr int kJpegHuffmanLutSize = 758;
++// Requirements: alphabet of 257 symbols (256 + 1 special symbol for the all 1s
++// code) and max bit length 16, the root table has 8 bits.
++// zlib/examples/enough.c works with an assumption that Huffman code is
++// "complete". Input JPEGs might have this assumption broken, hence the
++// following sum is used as estimate:
++//  + number of 1-st level cells
++//  + number of symbols
++//  + asymptotic amount of repeated 2nd level cells
++// The third number is 1 + 3 + ... + 255 i.e. it is assumed that sub-table of
++// each "size" might be almost completely be filled with repetitions.
++// Total sum is slightly less than 1024,...
++constexpr int kJpegHuffmanLutSize = 1024;
+ 
+ struct HuffmanTableEntry {
+   // Initialize the value to an invalid symbol so that we can recognize it
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
new file mode 100644
index 0000000000..25f85e1527
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
@@ -0,0 +1,113 @@
+From bf4781a2eed2eef664790170977d1d3d8347efb9 Mon Sep 17 00:00:00 2001
+From: Luca Versari <veluca@google.com>
+Date: Thu, 21 Nov 2024 16:33:08 +0100
+Subject: [PATCH] Check height limit in modular trees. (#3943)
+
+Also rewrite the implementation to use iterative checking instead of
+recursive checking of tree property values, to ensure stack usage is
+low.
+
+Before, it was possible for appropriately-crafted files to use a
+significant amount of stack (in the order of hundreds of MB).
+
+CVE: CVE-2024-11498
+Upstream-Status: Backport [https://github.com/libjxl/libjxl/commit/bf4781a2eed2eef664790170977d1d3d8347efb9]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/jxl/modular/encoding/dec_ma.cc | 66 ++++++++++++++++++++----------
+ 1 file changed, 45 insertions(+), 21 deletions(-)
+
+diff --git a/lib/jxl/modular/encoding/dec_ma.cc b/lib/jxl/modular/encoding/dec_ma.cc
+index b53b9a91..df2948d8 100644
+--- a/lib/jxl/modular/encoding/dec_ma.cc
++++ b/lib/jxl/modular/encoding/dec_ma.cc
+@@ -6,6 +6,7 @@
+ #include "lib/jxl/modular/encoding/dec_ma.h"
+ 
+ #include <limits>
++#include <vector>
+ 
+ #include "lib/jxl/base/printf_macros.h"
+ #include "lib/jxl/dec_ans.h"
+@@ -17,23 +18,49 @@ namespace jxl {
+ 
+ namespace {
+ 
+-Status ValidateTree(
+-    const Tree &tree,
+-    const std::vector<std::pair<pixel_type, pixel_type>> &prop_bounds,
+-    size_t root) {
+-  if (tree[root].property == -1) return true;
+-  size_t p = tree[root].property;
+-  int val = tree[root].splitval;
+-  if (prop_bounds[p].first > val) return JXL_FAILURE("Invalid tree");
+-  // Splitting at max value makes no sense: left range will be exactly same
+-  // as parent, right range will be invalid (min > max).
+-  if (prop_bounds[p].second <= val) return JXL_FAILURE("Invalid tree");
+-  auto new_bounds = prop_bounds;
+-  new_bounds[p].first = val + 1;
+-  JXL_RETURN_IF_ERROR(ValidateTree(tree, new_bounds, tree[root].lchild));
+-  new_bounds[p] = prop_bounds[p];
+-  new_bounds[p].second = val;
+-  return ValidateTree(tree, new_bounds, tree[root].rchild);
++Status ValidateTree(const Tree &tree) {
++  int num_properties = 0;
++  for (auto node : tree) {
++    if (node.property >= num_properties) {
++      num_properties = node.property + 1;
++    }
++  }
++  std::vector<int> height(tree.size());
++  std::vector<std::pair<pixel_type, pixel_type>> property_ranges(
++      num_properties * tree.size());
++  for (int i = 0; i < num_properties; i++) {
++    property_ranges[i].first = std::numeric_limits<pixel_type>::min();
++    property_ranges[i].second = std::numeric_limits<pixel_type>::max();
++  }
++  const int kHeightLimit = 2048;
++  for (size_t i = 0; i < tree.size(); i++) {
++    if (height[i] > kHeightLimit) {
++      return JXL_FAILURE("Tree too tall: %d", height[i]);
++    }
++    if (tree[i].property == -1) continue;
++    height[tree[i].lchild] = height[i] + 1;
++    height[tree[i].rchild] = height[i] + 1;
++    for (size_t p = 0; p < static_cast<size_t>(num_properties); p++) {
++      if (p == static_cast<size_t>(tree[i].property)) {
++        pixel_type l = property_ranges[i * num_properties + p].first;
++        pixel_type u = property_ranges[i * num_properties + p].second;
++        pixel_type val = tree[i].splitval;
++        if (l > val || u <= val) {
++          return JXL_FAILURE("Invalid tree");
++        }
++        property_ranges[tree[i].lchild * num_properties + p] =
++            std::make_pair(val + 1, u);
++        property_ranges[tree[i].rchild * num_properties + p] =
++            std::make_pair(l, val);
++      } else {
++        property_ranges[tree[i].lchild * num_properties + p] =
++            property_ranges[i * num_properties + p];
++        property_ranges[tree[i].rchild * num_properties + p] =
++            property_ranges[i * num_properties + p];
++      }
++    }
++  }
++  return true;
+ }
+ 
+ Status DecodeTree(BitReader *br, ANSSymbolReader *reader,
+@@ -82,10 +109,7 @@ Status DecodeTree(BitReader *br, ANSSymbolReader *reader,
+                        tree->size() + to_decode + 2, Predictor::Zero, 0, 1);
+     to_decode += 2;
+   }
+-  std::vector<std::pair<pixel_type, pixel_type>> prop_bounds;
+-  prop_bounds.resize(256, {std::numeric_limits<pixel_type>::min(),
+-                           std::numeric_limits<pixel_type>::max()});
+-  return ValidateTree(*tree, prop_bounds, 0);
++  return ValidateTree(*tree);
+ }
+ }  // namespace
+ 
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
index eced6c7726..2bf0f126b0 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
@@ -8,8 +8,10 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
-
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
+           file://CVE-2024-11403.patch \
+           file://CVE-2024-11498.patch \
+          "
 SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
 S = "${WORKDIR}/git"
 
-- 
2.50.1


