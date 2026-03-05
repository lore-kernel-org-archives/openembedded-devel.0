Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077F8F33A86
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:10:15 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46369.1772723409800783464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 07:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Cs/kOfBL;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35691a231a7so5036197a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 07:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1772723409; x=1773328209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aF3amNbj7BHCWyoWy7nytVK85ibaRg0bM8jn7DYxJik=;
        b=Cs/kOfBL2Cf0u8PSb70QNqESGtpbwJ5XZ8ARFXSDgptWsTXGrQv6Bxou+U8LMuAHVZ
         9Lg3pLOfanNwPn6FadkmvT2gU4PNPiP82xTr/tKK6yi0ps0go7CgjOsvjPIRGcj6xNlJ
         J4lzBzDHlJYB7LlZxulMcCZkYjEuOGA1q3kFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723409; x=1773328209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF3amNbj7BHCWyoWy7nytVK85ibaRg0bM8jn7DYxJik=;
        b=rlTi2EY1ZGF3OhCuWvPevFKTYePRbII0ihveuXyNlnlv3PY6PSy8glPvqTPcMNC21F
         2WkjtHxQ2q41QTzRF09J6z+OJGeywdLx+ufNgpDJA7QctPfoMEeRDZ9ltSP+X6Yq90RN
         3admCL9cWqy2GxAygAjENb1cEdwxfAax/OAoKqN3yIbRJ41Kme5BuE5GUdRDOtXaq7te
         +yixtqGir/ms4yrUdSr7tKa7ukmImJvz3+xMULUgaDSDm7iOcjB/YE/HFTpYEQytQ5mA
         bGWfTb7DYSggvQvlVQPoGzFYjNqUskPTDO1nNA6Ara1o3E/rt8QdOu5vY4Es9UoZLorX
         w2qw==
X-Gm-Message-State: AOJu0YzTfdZ80ww0//5LK1M0CHqWBinLgYqOhLoaMpEvEQj34bn2a4C2
	iLdgYjCBAUaTnRPKWLKZYtbux+ARVXqe6NngvYVT12tEnahQMJn8vA7u8WBPgcqWVzKVFjCJPwv
	dsXDR
X-Gm-Gg: ATEYQzw6oK5OiLGA+6SgEwcb+nJ1UKigxmo5wIdZc/uqHQdz9ohsr2iQMp1eK8CDh4e
	QTuJt79iAjKy/25PKn6ClaaEnsKEXSTKVZ3RwcgwRS7xTaS5bU+H1taTqCGx5IAnPrFqw8N6v8q
	ChhY2K1syQGVkj+J5l45CgYSwofTUdyWFi8aewWp5wFKMc4awUulDFcqmmbWK+jgPto0mtdFHMD
	hg8Y+OqpeF3qBUJU6nCUcQtt938Br7qnlUuwyAiXrs6m+nOTX5+WKXUOp2sbBWi8RG4P8a6zb2L
	PxBwOeixr2jZ8o89CyjmT9J2NsT12dyOLQ1Fz2hDrA6eNF98t7/R4lS/nF5LOAQMJVxbE54hcVQ
	ekwJL9FrGeVMO+wyuxdbS57RXQsoMr7WfLoUFupsNNF+4EL1nxt6PPwsB0CPcmUvWlU26x10cmE
	hqwlHZveajkWHBNfZFpI05oln6/ocedXWG+IA=
X-Received: by 2002:a17:90b:4b47:b0:341:315:f4ed with SMTP id 98e67ed59e1d1-359a69c7705mr5441661a91.10.1772723408355;
        Thu, 05 Mar 2026 07:10:08 -0800 (PST)
Received: from MVIN00352.. ([2406:7400:54:1b6c:1a95:22d2:5d51:a99a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2355275a91.17.2026.03.05.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:10:07 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] libjxl: upgrade 0.10.2 -> 0.10.5
Date: Thu,  5 Mar 2026 20:39:53 +0530
Message-ID: <20260305150953.135315-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 15:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124883

 - fix tile dimension in low memory rendering pipeline (#4495 -
   CVE-2025-12474)
 - fix number of channels for gray-to-gray color transform (#4579 -
   CVE-2026-1837)
 - djxl: reject decoding JXL files if "packed" representation size overflows
   size_t

Changelog:
https://github.com/libjxl/libjxl/releases/tag/v0.10.5

https://github.com/libjxl/libjxl/compare/v0.10.2...v0.10.5

Dropped CVE-2024-11403.patch CVE-2024-11498.patch which are fixed now.
https://github.com/libjxl/libjxl/releases/tag/v0.10.4

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libjxl/libjxl/CVE-2024-11403.patch        |  70 -----------
 .../libjxl/libjxl/CVE-2024-11498.patch        | 113 ------------------
 .../{libjxl_0.10.2.bb => libjxl_0.10.5.bb}    |   8 +-
 3 files changed, 3 insertions(+), 188 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
 delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.10.2.bb => libjxl_0.10.5.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
deleted file mode 100644
index 625218c2d3..0000000000
--- a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 9cc451b91b74ba470fd72bd48c121e9f33d24c99 Mon Sep 17 00:00:00 2001
-From: szabadka <9074039+szabadka@users.noreply.github.com>
-Date: Thu, 3 Oct 2024 18:07:38 +0200
-Subject: [PATCH] Port the Huffman lookup table size fix from brunsli. (#3871)
-
-CVE: CVE-2024-11403
-Upstream-Status: Backport [https://github.com/libjxl/libjxl/commit/9cc451b91b74ba470fd72bd48c121e9f33d24c99]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- lib/jpegli/huffman.h                   | 16 ++++++++++++----
- lib/jxl/jpeg/enc_jpeg_huffman_decode.h | 16 ++++++++++++----
- 2 files changed, 24 insertions(+), 8 deletions(-)
-
-diff --git a/lib/jpegli/huffman.h b/lib/jpegli/huffman.h
-index f0e5e1de..99549668 100644
---- a/lib/jpegli/huffman.h
-+++ b/lib/jpegli/huffman.h
-@@ -15,10 +15,18 @@ namespace jpegli {
- 
- constexpr int kJpegHuffmanRootTableBits = 8;
- // Maximum huffman lookup table size.
--// According to zlib/examples/enough.c, 758 entries are always enough for
--// an alphabet of 257 symbols (256 + 1 special symbol for the all 1s code) and
--// max bit length 16 if the root table has 8 bits.
--constexpr int kJpegHuffmanLutSize = 758;
-+// Requirements: alphabet of 257 symbols (256 + 1 special symbol for the all 1s
-+// code) and max bit length 16, the root table has 8 bits.
-+// zlib/examples/enough.c works with an assumption that Huffman code is
-+// "complete". Input JPEGs might have this assumption broken, hence the
-+// following sum is used as estimate:
-+//  + number of 1-st level cells
-+//  + number of symbols
-+//  + asymptotic amount of repeated 2nd level cells
-+// The third number is 1 + 3 + ... + 255 i.e. it is assumed that sub-table of
-+// each "size" might be almost completely be filled with repetitions.
-+// Total sum is slightly less than 1024,...
-+constexpr int kJpegHuffmanLutSize = 1024;
- 
- struct HuffmanTableEntry {
-   uint8_t bits;    // number of bits used for this symbol
-diff --git a/lib/jxl/jpeg/enc_jpeg_huffman_decode.h b/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
-index b8a60e41..fc9bd17b 100644
---- a/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
-+++ b/lib/jxl/jpeg/enc_jpeg_huffman_decode.h
-@@ -15,10 +15,18 @@ namespace jpeg {
- 
- constexpr int kJpegHuffmanRootTableBits = 8;
- // Maximum huffman lookup table size.
--// According to zlib/examples/enough.c, 758 entries are always enough for
--// an alphabet of 257 symbols (256 + 1 special symbol for the all 1s code) and
--// max bit length 16 if the root table has 8 bits.
--constexpr int kJpegHuffmanLutSize = 758;
-+// Requirements: alphabet of 257 symbols (256 + 1 special symbol for the all 1s
-+// code) and max bit length 16, the root table has 8 bits.
-+// zlib/examples/enough.c works with an assumption that Huffman code is
-+// "complete". Input JPEGs might have this assumption broken, hence the
-+// following sum is used as estimate:
-+//  + number of 1-st level cells
-+//  + number of symbols
-+//  + asymptotic amount of repeated 2nd level cells
-+// The third number is 1 + 3 + ... + 255 i.e. it is assumed that sub-table of
-+// each "size" might be almost completely be filled with repetitions.
-+// Total sum is slightly less than 1024,...
-+constexpr int kJpegHuffmanLutSize = 1024;
- 
- struct HuffmanTableEntry {
-   // Initialize the value to an invalid symbol so that we can recognize it
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
deleted file mode 100644
index 25f85e1527..0000000000
--- a/meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From bf4781a2eed2eef664790170977d1d3d8347efb9 Mon Sep 17 00:00:00 2001
-From: Luca Versari <veluca@google.com>
-Date: Thu, 21 Nov 2024 16:33:08 +0100
-Subject: [PATCH] Check height limit in modular trees. (#3943)
-
-Also rewrite the implementation to use iterative checking instead of
-recursive checking of tree property values, to ensure stack usage is
-low.
-
-Before, it was possible for appropriately-crafted files to use a
-significant amount of stack (in the order of hundreds of MB).
-
-CVE: CVE-2024-11498
-Upstream-Status: Backport [https://github.com/libjxl/libjxl/commit/bf4781a2eed2eef664790170977d1d3d8347efb9]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- lib/jxl/modular/encoding/dec_ma.cc | 66 ++++++++++++++++++++----------
- 1 file changed, 45 insertions(+), 21 deletions(-)
-
-diff --git a/lib/jxl/modular/encoding/dec_ma.cc b/lib/jxl/modular/encoding/dec_ma.cc
-index b53b9a91..df2948d8 100644
---- a/lib/jxl/modular/encoding/dec_ma.cc
-+++ b/lib/jxl/modular/encoding/dec_ma.cc
-@@ -6,6 +6,7 @@
- #include "lib/jxl/modular/encoding/dec_ma.h"
- 
- #include <limits>
-+#include <vector>
- 
- #include "lib/jxl/base/printf_macros.h"
- #include "lib/jxl/dec_ans.h"
-@@ -17,23 +18,49 @@ namespace jxl {
- 
- namespace {
- 
--Status ValidateTree(
--    const Tree &tree,
--    const std::vector<std::pair<pixel_type, pixel_type>> &prop_bounds,
--    size_t root) {
--  if (tree[root].property == -1) return true;
--  size_t p = tree[root].property;
--  int val = tree[root].splitval;
--  if (prop_bounds[p].first > val) return JXL_FAILURE("Invalid tree");
--  // Splitting at max value makes no sense: left range will be exactly same
--  // as parent, right range will be invalid (min > max).
--  if (prop_bounds[p].second <= val) return JXL_FAILURE("Invalid tree");
--  auto new_bounds = prop_bounds;
--  new_bounds[p].first = val + 1;
--  JXL_RETURN_IF_ERROR(ValidateTree(tree, new_bounds, tree[root].lchild));
--  new_bounds[p] = prop_bounds[p];
--  new_bounds[p].second = val;
--  return ValidateTree(tree, new_bounds, tree[root].rchild);
-+Status ValidateTree(const Tree &tree) {
-+  int num_properties = 0;
-+  for (auto node : tree) {
-+    if (node.property >= num_properties) {
-+      num_properties = node.property + 1;
-+    }
-+  }
-+  std::vector<int> height(tree.size());
-+  std::vector<std::pair<pixel_type, pixel_type>> property_ranges(
-+      num_properties * tree.size());
-+  for (int i = 0; i < num_properties; i++) {
-+    property_ranges[i].first = std::numeric_limits<pixel_type>::min();
-+    property_ranges[i].second = std::numeric_limits<pixel_type>::max();
-+  }
-+  const int kHeightLimit = 2048;
-+  for (size_t i = 0; i < tree.size(); i++) {
-+    if (height[i] > kHeightLimit) {
-+      return JXL_FAILURE("Tree too tall: %d", height[i]);
-+    }
-+    if (tree[i].property == -1) continue;
-+    height[tree[i].lchild] = height[i] + 1;
-+    height[tree[i].rchild] = height[i] + 1;
-+    for (size_t p = 0; p < static_cast<size_t>(num_properties); p++) {
-+      if (p == static_cast<size_t>(tree[i].property)) {
-+        pixel_type l = property_ranges[i * num_properties + p].first;
-+        pixel_type u = property_ranges[i * num_properties + p].second;
-+        pixel_type val = tree[i].splitval;
-+        if (l > val || u <= val) {
-+          return JXL_FAILURE("Invalid tree");
-+        }
-+        property_ranges[tree[i].lchild * num_properties + p] =
-+            std::make_pair(val + 1, u);
-+        property_ranges[tree[i].rchild * num_properties + p] =
-+            std::make_pair(l, val);
-+      } else {
-+        property_ranges[tree[i].lchild * num_properties + p] =
-+            property_ranges[i * num_properties + p];
-+        property_ranges[tree[i].rchild * num_properties + p] =
-+            property_ranges[i * num_properties + p];
-+      }
-+    }
-+  }
-+  return true;
- }
- 
- Status DecodeTree(BitReader *br, ANSSymbolReader *reader,
-@@ -82,10 +109,7 @@ Status DecodeTree(BitReader *br, ANSSymbolReader *reader,
-                        tree->size() + to_decode + 2, Predictor::Zero, 0, 1);
-     to_decode += 2;
-   }
--  std::vector<std::pair<pixel_type, pixel_type>> prop_bounds;
--  prop_bounds.resize(256, {std::numeric_limits<pixel_type>::min(),
--                           std::numeric_limits<pixel_type>::max()});
--  return ValidateTree(*tree, prop_bounds, 0);
-+  return ValidateTree(*tree);
- }
- }  // namespace
- 
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
index 2bf0f126b0..de4aabee22 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
@@ -8,11 +8,9 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
-           file://CVE-2024-11403.patch \
-           file://CVE-2024-11498.patch \
-          "
-SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
+
+SRCREV = "6aa76f3134684f86e239263384230751b56938a7"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \
-- 
2.43.0


