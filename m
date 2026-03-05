Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5371FF33A72
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:15:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45025.1772720118691552244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw0hBTXG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c944bb62so1504130f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772720117; x=1773324917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xttFrINTSZAYT9yaWCzjyfBjlGGFTutTRBCuJmt/8E=;
        b=Nw0hBTXGe0wtw6m3xWQWCUHIkOLXiz6jPOZBbxbJlOkWtVT9KbaMRqYwCn46gWmJxb
         7OPwMqbC1oYoJ9nZK+nxmZSt9Im1XnT+gDbFhvOnE/NaleuuHC/aZ9l1oIBBwM//c8Sj
         QDgYQp1kX8XfChIRWhW8FGvABnFcQfPUEksvnbFtbk1UrJGjbYVxDvMXIleWN7PfQgLT
         5C3+MB3v0gC52kv2qXXIDfXWvY/YZIvKKGuk1reLFPy+/rp9FCA0EJFtZA3DpXnOLnA6
         GSKIteK9tJQlPD9kcMuZkyKhhyhewUxnYa7lbU46MtGRjXyCNGw199RrUVC/DniczYBF
         vbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720117; x=1773324917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xttFrINTSZAYT9yaWCzjyfBjlGGFTutTRBCuJmt/8E=;
        b=Aot/dIwU8gvkXOdAClvYxMPk1HvJzzZ81XYQo2oa1RkJ4gA90V1H/yMBHcONk7WDGe
         E2wq6ae8DxmSWEvzE+Ww92YedSP38j6X8ujGe/MlHG/+/g2qzL/fMfAsO6h55g2GAyoG
         sXbWtZhVE66ytN6EHuGCznfEUU/T5bQ6vQjGF3KhS5SK09OQQ0O/IyUBmxxfMjuZ90zy
         0H+XbfRozLHwWSI2tFwJN2719pioMRFMTzRBGCnYFOKvF9O4dzzYpDSdgAqctoVKbdVf
         sVEcZ78jkP4zWDk3g3EjuflfdwidhSlLUL1SBUsyhFloUqMI3NpUwykOTxp4/bO032D8
         jZoA==
X-Gm-Message-State: AOJu0Yz/aAg/xOhoVWO+vmgzAbC6tw2pYaJAXN6vsBXwzlJ0E0XC5R0F
	+cPZ4ctGTNP2N77v+g008h6GocgRkKiBThPnWVQeeJ3nqAVKsFVkPfxr9XWBIQ==
X-Gm-Gg: ATEYQzzY41gUCM738286qUTPYX66TlVuUuWqEwE75OLBCOIjoPvdlsN2FvgugF8Vg4S
	/Du8HVgCDUUTHM2umig3wx0WmYWhGPkOhqxkxEfHigI4TNQETFLfMawcOY9b7JDzTd6hWmvOuzZ
	d2vM8vyNjRPGsyJ77wSsxGFIPdoXBpf18G0bxqlsIAzRAgo53AmAYqBTP8zhLjHbwcS3I9jyWcS
	RN1m8Pqnsm462YiS+v1uyB9P1o57L+yVc/7It6NaNYij2rlMt4ri/a982A7VYaos1sbQrI/HOr3
	ZssxTzVHvxRJsYeAABw0Hr5E+is8yoWllWZqjWgNv1pWjreWYt+6TSw/RscB3KE98dF7hlXFd4C
	wHVWo7PF0t1HpSuLGzCcMr5nAjHq5epYLlRlLt5+KWFZCapXgHdsEmoPwgIawIZUCzt8VfaLgst
	o3C9h6ljBtXLDHqU3odGOP
X-Received: by 2002:a05:6000:26ce:b0:439:c356:9f65 with SMTP id ffacd0b85a97d-439c7fadd3dmr11094560f8f.15.1772720116709;
        Thu, 05 Mar 2026 06:15:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm40034096f8f.5.2026.03.05.06.15.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:15:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] libjxl: upgrade 0.10.2 -> 0.10.5
Date: Thu,  5 Mar 2026 15:15:14 +0100
Message-ID: <20260305141514.3058998-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305141514.3058998-1-skandigraun@gmail.com>
References: <20260305141514.3058998-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124877

Bug fix release, mostly CVE fixes.
Drop patches that are included.

Changelog:
0.10.5:
fix tile dimension in low memory rendering pipeline (CVE-2025-12474)
fix number of channels for gray-to-gray color transform (CVE-2026-1837)
djxl: reject decoding JXL files if "packed" representation size overflows size_t

0.10.4:
Huffman lookup table size fix (CVE-2024-11403)
Check height limit in modular trees (CVE-2024-11498)

0.10.3:
fixed decoding of some special images

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libjxl/libjxl/CVE-2024-11403.patch        |  70 -----------
 .../libjxl/libjxl/CVE-2024-11498.patch        | 113 ------------------
 .../{libjxl_0.10.2.bb => libjxl_0.10.5.bb}    |   7 +-
 3 files changed, 2 insertions(+), 188 deletions(-)
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
index 2bf0f126b0..0a17d50be0 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
@@ -8,11 +8,8 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
-           file://CVE-2024-11403.patch \
-           file://CVE-2024-11498.patch \
-          "
-SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
+SRCREV = "6aa76f3134684f86e239263384230751b56938a7"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \

