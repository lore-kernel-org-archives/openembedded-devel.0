Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7127FC79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:29 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31924.1788776661668999151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jmLYtWdV;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b145a9623fso1558911eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776661; x=1789381461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8U4dnXA0L2t0AJS602QpK+TT+qumjXIhGnhFU3JtyoY=;
        b=jmLYtWdVjU7h4QRjibtxfGRIvKCEwpJpdlTYlJ1RU+Z7QWnxmIRhTZpmx9NqoLIoot
         d6qmem64Mdh89NdlSzwNeAvYK404A01Q51NqKl180qKN+0mk3weX88HTnerKF0ZNEkL7
         45U5b/29h4kbDcz6B9082nm16NOtOci0xn9J32D/OXnfZfv5rLXae7FC7MHDvkj3igAr
         9ZAJpCiDHXvsdqHUjhAVMSoimlYPh8qrDKrEqDu7y5F1FPQ3Bq5t5THf9NDjw81C3u+S
         LhUZkJOykyfSkkFMjK3X68TKeXfRbM/XWxMeYOPJTch+GRh2JVCwtTBpu8NdW7jmfqYq
         rbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776661; x=1789381461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8U4dnXA0L2t0AJS602QpK+TT+qumjXIhGnhFU3JtyoY=;
        b=MBmVKig+tD23E+CCdmzaOHPrJCqn25egW5QpGLzR2DfZFsgbJQXiVVOykDX5wO8nTk
         VQki/8ZTE+mYu8piRCVDGTH0KAw97CPII4nYOMAbaUpvYdAiqPHuzvh1G0FZXRzD6dEG
         guvPhmjUPqRQUNRQFcqWQ/IH4Hob44zsZLkYsE26ETqmLgI/8OJNG9mp7H0eBUJ/srAr
         lf3xA5kauEUnAntfq8M2/YMeNvmgE9X+lY3ps+mh/8BiHIM5u/vvnZLR8CnCHp470Reg
         Q7hwkrLKS2PvqvcczPOrmF5CXZ3TysEAxVejEIXSw4yB4CmG68JXzhcUu+0SMpn8mtnU
         y7Tw==
X-Gm-Message-State: AFuF++lCdjVHR+sTebLeK1+WcLxRSz4bBeG/zxFpSwvWS0q3/lFGE1Uv
	lP68nP9xzjnOwEEXLjRHSw7HOrtugKpBGFS9XnAWfMzJtqE/hWZ4KWkLAH3OaHKu
X-Gm-Gg: AYBFou3G0r5EoeNWmJE9R85eHwCzq65Is8nxISguNOu1UaGVq+OFJM3EFK8DGEPK0oE
	0fLPJq77V9pcAab6LoyxNOS0pIkVFcw93HtC+yxxEsIYm3V3ezYyabg+4syEjqDoFvLntmOHF3c
	mD+5dbWGXCvT3Th6Fwz0GjV7GZ24SXZnWKLtYB9QZctmdLh5QlOFnoBdcKauQQtfsyiS+QCtxGe
	Dms+PdvPdiUrE+UcG+rvfALWvQcIdikTzacq+Hm5jwJY9NmkX9KoFh1j03dPGjn49JXwgX+WctU
	x+MvTJpEaYvKewEI2TMOvaok2Zmx0ZehZ7O/4NZt0E4/3A+CV2zg81V+JduUjcVlNpRAL3pN44H
	7j1mln/kCEb25ptc/tIbEkfeUd0HTBwOh2Zu2Xolih0UqclKm0UGdXE4QrwkvWIMxJfwebmX0pO
	JTE06r3VgyXVXzTKLK4MAdNX3Z5q+naXOikyUldyoW0dNClWFBTIkkMSMJsKCVF3xHv5/BmzE+H
	Fh/AGaZl1g=
X-Received: by 2002:a05:6820:2906:b0:6a3:8738:4106 with SMTP id 006d021491bc7-6b6fdbbfe7fmr13023943eaf.26.1788776660613;
        Mon, 07 Sep 2026 03:24:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 19/33] tesseract: patch CVE-2026-73067
Date: Mon,  7 Sep 2026 22:23:03 +1200
Message-ID: <20260907102318.2459883-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129831

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-73067

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/CVE-2026-73067-1.patch          | 423 ++++++++++++++++++
 .../tesseract/CVE-2026-73067-2.patch          |  96 ++++
 .../tesseract/tesseract_5.5.2.bb              |   2 +
 3 files changed, 521 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch
new file mode 100644
index 0000000000..95fd102ebf
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch
@@ -0,0 +1,423 @@
+From 9d83107c2511e7e2a7dc649c7bb1633da746669f Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Sun, 12 Jul 2026 13:49:46 +0200
+Subject: [PATCH] Fix memory-safety issues in .traineddata deserialization
+
+Add bounds checking on count/length fields read from untrusted
+.traineddata files before they are used to size allocations or index
+arrays. Use unsigned types where negative values make no sense.
+
+Key changes:
+- serialis.cpp: overflow check in DeSerializeSkip, size limits for
+  DeSerialize(string) and DeSerialize(vector<char>)
+- unicharcompress.h: validate RecodedCharID length before reading
+  into fixed-size code array (buffer overflow fix), change length_
+  to uint32_t, use unsigned types for Set() index and length()
+- dawg.cpp/h: use uint32_t for num_edges_, add bounds checks on all
+  edge traversal loops, replace no-op ASSERT_HOST with proper errors
+- fontinfo.cpp: bounds check font name size to prevent integer
+  overflow in size+1, use uint32_t for spacing vector size
+- tessdatamanager.cpp: validate offsets are within file bounds
+- bitvector.cpp, weightmatrix.cpp, plumbing.cpp: add size limits
+
+Assisted-by: OpenCode / big-pickle (opencode)
+Signed-off-by: Stefan Weil <stweil@tessus.org>
+(cherry picked from commit 82727cc11c34eaf1249af002d69f6bbae70993b9)
+
+CVE: CVE-2026-73067
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/82727cc11c34eaf1249af002d69f6bbae70993b9]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ccstruct/fontinfo.cpp      | 10 ++++++---
+ src/ccstruct/fontinfo.h        |  2 +-
+ src/ccutil/bitvector.cpp       |  4 ++++
+ src/ccutil/serialis.cpp        | 10 +++++++++
+ src/ccutil/tessdatamanager.cpp |  9 ++++++++
+ src/ccutil/unicharcompress.h   | 19 ++++++++++------
+ src/dict/dawg.cpp              | 40 ++++++++++++++++++++++++++--------
+ src/dict/dawg.h                | 16 +++++++++-----
+ src/lstm/plumbing.cpp          |  4 ++++
+ src/lstm/weightmatrix.cpp      |  4 ++++
+ 10 files changed, 92 insertions(+), 26 deletions(-)
+
+diff --git a/src/ccstruct/fontinfo.cpp b/src/ccstruct/fontinfo.cpp
+index 65d4d032..9984469f 100644
+--- a/src/ccstruct/fontinfo.cpp
++++ b/src/ccstruct/fontinfo.cpp
+@@ -145,6 +145,10 @@ bool read_info(TFile *f, FontInfo *fi) {
+   if (!f->DeSerialize(&size)) {
+     return false;
+   }
++  // Reject unreasonably large font names to prevent overflow in size + 1.
++  if (size > 100000) {
++    return false;
++  }
+   char *font_name = new char[size + 1];
+   fi->name = font_name;
+   if (!f->DeSerialize(font_name, size)) {
+@@ -161,16 +165,16 @@ bool write_info(FILE *f, const FontInfo &fi) {
+ }
+ 
+ bool read_spacing_info(TFile *f, FontInfo *fi) {
+-  int32_t vec_size, kern_size;
++  uint32_t vec_size;
++  int32_t kern_size;
+   if (!f->DeSerialize(&vec_size)) {
+     return false;
+   }
+-  ASSERT_HOST(vec_size >= 0);
+   if (vec_size == 0) {
+     return true;
+   }
+   fi->init_spacing(vec_size);
+-  for (int i = 0; i < vec_size; ++i) {
++  for (uint32_t i = 0; i < vec_size; ++i) {
+     auto *fs = new FontSpacingInfo();
+     if (!f->DeSerialize(&fs->x_gap_before) || !f->DeSerialize(&fs->x_gap_after) ||
+         !f->DeSerialize(&kern_size)) {
+diff --git a/src/ccstruct/fontinfo.h b/src/ccstruct/fontinfo.h
+index 1a84a567..cfb19e06 100644
+--- a/src/ccstruct/fontinfo.h
++++ b/src/ccstruct/fontinfo.h
+@@ -76,7 +76,7 @@ struct FontInfo {
+   bool DeSerialize(TFile *fp);
+ 
+   // Reserves unicharset_size spots in spacing_vec.
+-  void init_spacing(int unicharset_size) {
++  void init_spacing(uint32_t unicharset_size) {
+     spacing_vec = new std::vector<FontSpacingInfo *>(unicharset_size);
+   }
+   // Adds the given pointer to FontSpacingInfo to spacing_vec member
+diff --git a/src/ccutil/bitvector.cpp b/src/ccutil/bitvector.cpp
+index a02781a8..2b8b7f00 100644
+--- a/src/ccutil/bitvector.cpp
++++ b/src/ccutil/bitvector.cpp
+@@ -102,6 +102,10 @@ bool BitVector::DeSerialize(bool swap, FILE *fp) {
+   if (swap) {
+     ReverseN(&new_bit_size, sizeof(new_bit_size));
+   }
++  // Reject unreasonably large bit vectors.
++  if (new_bit_size > 500000000) {
++    return false;
++  }
+   Alloc(new_bit_size);
+   int wordlen = WordLength();
+   if (!tesseract::DeSerialize(fp, &array_[0], wordlen)) {
+diff --git a/src/ccutil/serialis.cpp b/src/ccutil/serialis.cpp
+index d9c9a8d4..cb663094 100644
+--- a/src/ccutil/serialis.cpp
++++ b/src/ccutil/serialis.cpp
+@@ -88,6 +88,10 @@ bool TFile::DeSerializeSkip(size_t size) {
+   if (!DeSerialize(&len)) {
+     return false;
+   }
++  // Check for overflow: len * size must not overflow size_t.
++  if (size != 0 && len > SIZE_MAX / size) {
++    return false;
++  }
+   return Skip(len * size);
+ }
+ 
+@@ -95,6 +99,9 @@ bool TFile::DeSerialize(std::string &data) {
+   uint32_t size;
+   if (!DeSerialize(&size)) {
+     return false;
++  } else if (size > 50000000) {
++    // Arbitrarily limit the size to protect against bad data.
++    return false;
+   } else if (size > 0) {
+     // TODO: optimize.
+     data.resize(size);
+@@ -113,6 +120,9 @@ bool TFile::DeSerialize(std::vector<char> &data) {
+   uint32_t size;
+   if (!DeSerialize(&size)) {
+     return false;
++  } else if (size > 50000000) {
++    // Arbitrarily limit the size to protect against bad data.
++    return false;
+   } else if (size > 0) {
+     // TODO: optimize.
+     data.resize(size);
+diff --git a/src/ccutil/tessdatamanager.cpp b/src/ccutil/tessdatamanager.cpp
+index 8ab26506..67e86dc0 100644
+--- a/src/ccutil/tessdatamanager.cpp
++++ b/src/ccutil/tessdatamanager.cpp
+@@ -132,14 +132,23 @@ bool TessdataManager::LoadMemBuffer(const char *name, const char *data, int size
+   }
+   for (unsigned i = 0; i < num_entries && i < TESSDATA_NUM_ENTRIES; ++i) {
+     if (offset_table[i] >= 0) {
++      if (offset_table[i] > size) {
++        return false;
++      }
+       int64_t entry_size = size - offset_table[i];
+       unsigned j = i + 1;
+       while (j < num_entries && offset_table[j] == -1) {
+         ++j;
+       }
+       if (j < num_entries) {
++        if (offset_table[j] < 0 || offset_table[j] > size) {
++          return false;
++        }
+         entry_size = offset_table[j] - offset_table[i];
+       }
++      if (entry_size < 0) {
++        return false;
++      }
+       entries_[i].resize(entry_size);
+       if (!fp.DeSerialize(&entries_[i][0], entry_size)) {
+         return false;
+diff --git a/src/ccutil/unicharcompress.h b/src/ccutil/unicharcompress.h
+index 2e81bbde..67a441e8 100644
+--- a/src/ccutil/unicharcompress.h
++++ b/src/ccutil/unicharcompress.h
+@@ -41,7 +41,7 @@ public:
+     length_ = length;
+   }
+   // Sets the code value at the given index in the code.
+-  void Set(int index, int value) {
++  void Set(uint32_t index, int value) {
+     code_[index] = value;
+     if (length_ <= index) {
+       length_ = index + 1;
+@@ -59,7 +59,7 @@ public:
+     return length_ == 0;
+   }
+   // Accessors
+-  int length() const {
++  uint32_t length() const {
+     return length_;
+   }
+   int operator()(int index) const {
+@@ -73,14 +73,19 @@ public:
+   }
+   // Reads from the given file. Returns false in case of error.
+   bool DeSerialize(TFile *fp) {
+-    return fp->DeSerialize(&self_normalized_) && fp->DeSerialize(&length_) &&
+-           fp->DeSerialize(&code_[0], length_);
++    if (!fp->DeSerialize(&self_normalized_) || !fp->DeSerialize(&length_)) {
++      return false;
++    }
++    if (length_ > kMaxCodeLen) {
++      return false;
++    }
++    return fp->DeSerialize(&code_[0], length_);
+   }
+   bool operator==(const RecodedCharID &other) const {
+     if (length_ != other.length_) {
+       return false;
+     }
+-    for (int i = 0; i < length_; ++i) {
++    for (uint32_t i = 0; i < length_; ++i) {
+       if (code_[i] != other.code_[i]) {
+         return false;
+       }
+@@ -91,7 +96,7 @@ public:
+   struct RecodedCharIDHash {
+     uint64_t operator()(const RecodedCharID &code) const {
+       uint64_t result = 0;
+-      for (int i = 0; i < code.length_; ++i) {
++      for (uint32_t i = 0; i < code.length_; ++i) {
+         result ^= static_cast<uint64_t>(code(i)) << (7 * i);
+       }
+       return result;
+@@ -103,7 +108,7 @@ private:
+   // that map to the same code. Has boolean value, but int8_t for serialization.
+   int8_t self_normalized_;
+   // The number of elements in use in code_;
+-  int32_t length_;
++  uint32_t length_;
+   // The re-encoded form of the unichar-id to which this RecodedCharID relates.
+   int32_t code_[kMaxCodeLen];
+ };
+diff --git a/src/dict/dawg.cpp b/src/dict/dawg.cpp
+index af45176f..dab4dfc2 100644
+--- a/src/dict/dawg.cpp
++++ b/src/dict/dawg.cpp
+@@ -221,7 +221,11 @@ EDGE_REF SquishedDawg::edge_char_of(NODE_REF node, UNICHAR_ID unichar_id,
+             (!word_end || end_of_word_from_edge_rec(edges_[edge]))) {
+           return (edge);
+         }
+-      } while (!last_edge(edge++));
++        if (last_edge(edge)) {
++          break;
++        }
++        ++edge;
++      } while (edge < num_edges_);
+     }
+   }
+   return (NO_EDGE); // not found
+@@ -234,7 +238,11 @@ int32_t SquishedDawg::num_forward_edges(NODE_REF node) const {
+   if (forward_edge(edge)) {
+     do {
+       num++;
+-    } while (!last_edge(edge++));
++      if (last_edge(edge)) {
++        break;
++      }
++      ++edge;
++    } while (edge < num_edges_);
+   }
+ 
+   return (num);
+@@ -274,7 +282,11 @@ void SquishedDawg::print_node(NODE_REF node, int max_num_edges) const {
+       if (edge - node > max_num_edges) {
+         return;
+       }
+-    } while (!last_edge(edge++));
++      if (last_edge(edge)) {
++        break;
++      }
++      ++edge;
++    } while (edge < num_edges_);
+ 
+     if (edge < num_edges_ && edge_occupied(edge) && backward_edge(edge)) {
+       do {
+@@ -290,7 +302,11 @@ void SquishedDawg::print_node(NODE_REF node, int max_num_edges) const {
+         if (edge - node > MAX_NODE_EDGES_DISPLAY) {
+           return;
+         }
+-      } while (!last_edge(edge++));
++        if (last_edge(edge)) {
++          break;
++        }
++        ++edge;
++      } while (edge < num_edges_);
+     }
+   } else {
+     tprintf(REFFORMAT " : no edges in this node\n", node);
+@@ -326,14 +342,17 @@ bool SquishedDawg::read_squished_dawg(TFile *file) {
+     return false;
+   }
+ 
+-  int32_t unicharset_size;
++  uint32_t unicharset_size;
+   if (!file->DeSerialize(&unicharset_size)) {
+     return false;
+   }
+   if (!file->DeSerialize(&num_edges_)) {
+     return false;
+   }
+-  ASSERT_HOST(num_edges_ > 0); // DAWG should not be empty
++  if (num_edges_ == 0) {
++    tprintf("Empty dawg: num_edges is 0\n");
++    return false;
++  }
+   Dawg::init(unicharset_size);
+ 
+   edges_ = new EDGE_RECORD[num_edges_];
+@@ -341,7 +360,7 @@ bool SquishedDawg::read_squished_dawg(TFile *file) {
+     return false;
+   }
+   if (debug_level_ > 2) {
+-    tprintf("type: %d lang: %s perm: %d unicharset_size: %d num_edges: %d\n",
++    tprintf("type: %d lang: %s perm: %d unicharset_size: %d num_edges: %" PRIu32 "\n",
+             type_, lang_.c_str(), perm_, unicharset_size_, num_edges_);
+     for (EDGE_REF edge = 0; edge < num_edges_; ++edge) {
+       print_edge(edge);
+@@ -378,8 +397,11 @@ std::unique_ptr<EDGE_REF[]> SquishedDawg::build_node_map(
+         break;
+       }
+       if (backward_edge(edge)) {
+-        while (!last_edge(edge++)) {
+-          ;
++        while (edge < num_edges_ && !last_edge(edge)) {
++          ++edge;
++        }
++        if (edge < num_edges_) {
++          ++edge; // Skip past the last backward edge.
+         }
+       }
+       edge--;
+diff --git a/src/dict/dawg.h b/src/dict/dawg.h
+index b87b3880..d0f412c3 100644
+--- a/src/dict/dawg.h
++++ b/src/dict/dawg.h
+@@ -418,7 +418,7 @@ public:
+     ASSERT_HOST(read_squished_dawg(&file));
+     num_forward_edges_in_node0 = num_forward_edges(0);
+   }
+-  SquishedDawg(EDGE_ARRAY edges, int num_edges, DawgType type,
++  SquishedDawg(EDGE_ARRAY edges, uint32_t num_edges, DawgType type,
+                const std::string &lang, PermuterType perm, int unicharset_size,
+                int debug_level)
+       : Dawg(type, lang, perm, debug_level),
+@@ -441,7 +441,7 @@ public:
+     return true;
+   }
+ 
+-  int NumEdges() {
++  uint32_t NumEdges() const {
+     return num_edges_;
+   }
+ 
+@@ -462,7 +462,11 @@ public:
+       if (!word_end || end_of_word_from_edge_rec(edges_[edge])) {
+         vec->push_back(NodeChild(unichar_id_from_edge_rec(edges_[edge]), edge));
+       }
+-    } while (!last_edge(edge++));
++      if (last_edge(edge)) {
++        break;
++      }
++      ++edge;
++    } while (edge < num_edges_);
+   }
+ 
+   /// Returns the next node visited by following the edge
+@@ -516,7 +520,7 @@ private:
+   }
+   /// Goes through all the edges and clears each one out.
+   inline void clear_all_edges() {
+-    for (int edge = 0; edge < num_edges_; edge++) {
++    for (uint32_t edge = 0; edge < num_edges_; edge++) {
+       set_empty_edge(edge);
+     }
+   }
+@@ -555,7 +559,7 @@ private:
+   /// Prints the contents of the SquishedDawg.
+   void print_all(const char *msg) {
+     tprintf("\n__________________________\n%s\n", msg);
+-    for (int i = 0; i < num_edges_; ++i) {
++    for (uint32_t i = 0; i < num_edges_; ++i) {
+       print_edge(i);
+     }
+     tprintf("__________________________\n");
+@@ -565,7 +569,7 @@ private:
+ 
+   // Member variables.
+   EDGE_ARRAY edges_ = nullptr;
+-  int32_t num_edges_ = 0;
++  uint32_t num_edges_ = 0;
+   int num_forward_edges_in_node0 = 0;
+ };
+ 
+diff --git a/src/lstm/plumbing.cpp b/src/lstm/plumbing.cpp
+index ebb6612e..f0133148 100644
+--- a/src/lstm/plumbing.cpp
++++ b/src/lstm/plumbing.cpp
+@@ -222,6 +222,10 @@ bool Plumbing::DeSerialize(TFile *fp) {
+   if (!fp->DeSerialize(&size)) {
+     return false;
+   }
++  // Reject unreasonably large network stacks.
++  if (size > 10000) {
++    return false;
++  }
+   for (uint32_t i = 0; i < size; ++i) {
+     Network *network = CreateFromFile(fp);
+     if (network == nullptr) {
+diff --git a/src/lstm/weightmatrix.cpp b/src/lstm/weightmatrix.cpp
+index 86255266..d40e9373 100644
+--- a/src/lstm/weightmatrix.cpp
++++ b/src/lstm/weightmatrix.cpp
+@@ -295,6 +295,10 @@ bool WeightMatrix::DeSerialize(bool training, TFile *fp) {
+     if (!fp->DeSerialize(&size)) {
+       return false;
+     }
++    // Reject unreasonably large scale vectors.
++    if (size > 100000000) {
++      return false;
++    }
+ #ifdef FAST_FLOAT
+     scales_.reserve(size);
+     for (auto n = size; n > 0; n--) {
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch
new file mode 100644
index 0000000000..04d1db2dc5
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch
@@ -0,0 +1,96 @@
+From 364a1a76ed19fd2f975f267405f8e36f521e7175 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Sun, 12 Jul 2026 18:04:46 +0200
+Subject: [PATCH] Fix unbounded allocation and validate DAWG edge structure
+
+Bound num_edges_ against remaining component bytes before allocating
+the edges_ array in read_squished_dawg. This prevents a crafted
+num_edges_ = 0x7FFFFFFF from requesting ~17 GB and aborting via
+uncaught std::bad_alloc.
+
+After loading, validate the edge structure:
+- Reject edges whose next_node value exceeds num_edges_ (wild-index
+  read during dictionary lookup).
+- Reject unterminated forward edge runs (the original heap OOB read).
+
+Also add TFile::RemainingBytes() to query how many bytes are left to
+read from the current position.
+
+Assisted-by: OpenCode / big-pickle (opencode)
+Reported-by: GitHub Copilot
+Signed-off-by: Stefan Weil <stweil@tessus.org>
+(cherry picked from commit 55287a94b8044c05ce3fd10f5aca6ebbd238e518)
+
+CVE: CVE-2026-73067
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/55287a94b8044c05ce3fd10f5aca6ebbd238e518]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ccutil/serialis.h |  4 ++++
+ src/dict/dawg.cpp     | 32 ++++++++++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+)
+
+diff --git a/src/ccutil/serialis.h b/src/ccutil/serialis.h
+index d6e4a996..59a4e1f1 100644
+--- a/src/ccutil/serialis.h
++++ b/src/ccutil/serialis.h
+@@ -75,6 +75,10 @@ public:
+   void set_swap(bool value) {
+     swap_ = value;
+   }
++  // Returns the number of bytes remaining to be read.
++  size_t RemainingBytes() const {
++    return data_ != nullptr && offset_ < data_->size() ? data_->size() - offset_ : 0;
++  }
+ 
+   // Deserialize data.
+   bool DeSerializeSize(int32_t *data);
+diff --git a/src/dict/dawg.cpp b/src/dict/dawg.cpp
+index dab4dfc2..75cb9a1f 100644
+--- a/src/dict/dawg.cpp
++++ b/src/dict/dawg.cpp
+@@ -353,12 +353,44 @@ bool SquishedDawg::read_squished_dawg(TFile *file) {
+     tprintf("Empty dawg: num_edges is 0\n");
+     return false;
+   }
++  // Reject if the declared edge count exceeds the remaining component bytes.
++  if (num_edges_ > file->RemainingBytes() / sizeof(EDGE_RECORD)) {
++    tprintf("Dawg num_edges %u exceeds remaining data\n", num_edges_);
++    return false;
++  }
+   Dawg::init(unicharset_size);
+ 
+   edges_ = new EDGE_RECORD[num_edges_];
+   if (!file->DeSerialize(&edges_[0], num_edges_)) {
+     return false;
+   }
++  // Validate the loaded edge structure: check that next_node values are in
++  // bounds and that forward edge runs are properly terminated.
++  for (uint32_t i = 0; i < num_edges_; ++i) {
++    if (edges_[i] == next_node_mask_) {
++      continue; // Empty slot.
++    }
++    NODE_REF next = next_node_from_edge_rec(edges_[i]);
++    if (next != 0 && static_cast<uint32_t>(next) >= num_edges_) {
++      tprintf("Dawg edge %u has out-of-bounds next_node\n", i);
++      return false;
++    }
++    if (forward_edge(i)) {
++      uint32_t j = i;
++      bool terminated = false;
++      do {
++        if (last_edge(j)) {
++          terminated = true;
++          break;
++        }
++        ++j;
++      } while (j < num_edges_);
++      if (!terminated) {
++        tprintf("Dawg forward edge run starting at %u is not terminated\n", i);
++        return false;
++      }
++    }
++  }
+   if (debug_level_ > 2) {
+     tprintf("type: %d lang: %s perm: %d unicharset_size: %d num_edges: %" PRIu32 "\n",
+             type_, lang_.c_str(), perm_, unicharset_size_, num_edges_);
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index 1b5a5fe2df..f26d2f36a1 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "6e1d56a847e697de07b38619356550e5cf4e8633"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV} \
            file://CVE-2026-73066.patch \
+           file://CVE-2026-73067-1.patch \
+           file://CVE-2026-73067-2.patch \
 "
 
 

