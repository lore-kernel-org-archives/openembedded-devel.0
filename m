Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B61C79F80
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:35 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4199.1788429031745766031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vv6JkEhg;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1757074b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429031; x=1789033831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VN8RJmq80pkVDawU7RF01ZSghwDNDUd81KtnchzoY1o=;
        b=Vv6JkEhg4HE3NYyp51t7xJvk5Kg/xNpE21kIVG1oMdEnk8xOKMuui7SMFJ3uJbTHac
         IWnTbb7FrO0nQV04ePjveNdzAZ/huovkNKTDWP90eOMPdfAx+RBXQt0XdJRH+zgKkpX8
         akgawnGdrZKccJ9wMTA8jnxvUkx6G5KS7jyYrx/pVhPk+KLslNBJ9SWgUXLCKmo1Et7O
         srg88XUEymLkzhFMmL+iEkHhC8F/ZgekJp184+oA4LJUfPI8SMlj8jvzVLYEEnxaY1pK
         wdH8WJt5DQq93DSuu6CG4IgmQJ9m0pTeIVgVVDDParJQcZAqAoOIGOCBl+TPRVS8O4Lo
         NrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429031; x=1789033831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VN8RJmq80pkVDawU7RF01ZSghwDNDUd81KtnchzoY1o=;
        b=XrTW2b1KN7hrC0pLv6+JLEFqO7yB2SQ8NbkvDytEydJTV6MkXIeWg5H7zrd4WZv+iI
         ckfU0nBVOc1RR2aaYvFcWoUHG959Jb9y+vqwNoKz2cH9I+M1fEui49EBYrhBtfFFo4hN
         hlZjH0ewLaXr5od/urxU4051IDleOIFmV168DUgsE5MColVDQ43K+zBfwvI0vhYS4K7g
         ZsIFYKW0bQnxbRV26Z65Tn71N07SOg5qUdZRGb61iOFoEeMP/0Zzf6a26pKr83U560eZ
         i3ZvqcNDiDX7yKH83nf6et4Sscw8OxHp3UPPFFCX0oSKqNzI/vZmR328D3eocVjwq5MM
         rCNg==
X-Gm-Message-State: AFuF++lbE2mXin4lUK2/xVYGp7uz/lcLeHiiELqZf8nkNLH7OZ3D36dq
	dhYb7dgZZZ1pYzXoYfhmc7aF/O/hgXdRBq6yfVRnJWlWdMpJf8tMm/gUkXRAD+35
X-Gm-Gg: AYBFou3Qa2MJupG02INPCp9YrqXDPEVjiaPV2IPDVlF6MwDTSFAXCqr9ar72+uVuyt9
	8rPaDH0kUXbl3YSWNTtv1U9hBT4IOBiNFmRUQ/PHdeA+IbqBmSbuQRcA+S+0kcL+VDq2kW3zdY6
	fqF8fVTHcsOdPXQsOv5/RclVMlrfYRbN/qw35ndYSUEyGTBMXehkU5TyA49hzCfAobdKI6ntHaq
	NVQswlUjaY+GzAPjalp0a9ZfjWpA1YjIWX3ArAuL+b3Rcjrvy/YsD/AILp6lsxwJWZ6ZbsAi2v5
	Hu8saqSA4Y1XL5aVumOKpBEGTlbnairnNIGplUibBW4T/Vo4xolIZO7NLX09CIqK640opPSWn9Q
	olbUTDCVGd9Phmkd0EwAXql+MuUpKux83wredzJ6hdF3e5ouM49G30h1RFI5GZfVQYiMi/6P7va
	3or8AfIJK0nPU7+Npo1vujseeu6oIduODC/phDHx7bbqmhgvfou+JLhDFXmnKpzr+RvRM8CFM5
X-Received: by 2002:a05:6a00:1d8e:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-85ed454a639mr16388279b3a.17.1788429030974;
        Thu, 03 Sep 2026 02:50:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 14/22] libheif: patch CVE-2026-62377
Date: Thu,  3 Sep 2026 21:49:45 +1200
Message-ID: <20260903094954.3240723-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129730

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-62377

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-62377.patch      | 175 ++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch
new file mode 100644
index 0000000000..5481c198b6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch
@@ -0,0 +1,175 @@
+From cace54a7491cd8eb46617f17ca7078182d9903b0 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Fri, 26 Jun 2026 10:03:31 +0200
+Subject: [PATCH] Return error instead of asserting in get_track() without
+ sequence (#1844)
+
+HeifContext::get_track() asserted has_sequence() up front. Calling the
+public heif_context_get_track() on a context that has no sequence tracks
+(e.g. a still image, or a crafted sequence file accepted with zero tracks)
+therefore aborted the process via the assert, instead of letting the public
+wrapper return the documented nullptr. In NDEBUG builds the assert was
+compiled out and the track_id==0 path dereferenced begin() on an empty map.
+
+Replace the assert with a normal error return so the public wrapper hands
+the caller nullptr as documented.
+
+(cherry picked from commit e1a0bc1c1ae74f8075eaca30a1cdb2b9bee698d3)
+
+CVE: CVE-2026-62377
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/e1a0bc1c1ae74f8075eaca30a1cdb2b9bee698d3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/context.cc         |   9 +++-
+ tests/CMakeLists.txt       |   1 +
+ tests/sequence_no_track.cc | 108 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 117 insertions(+), 1 deletion(-)
+ create mode 100644 tests/sequence_no_track.cc
+
+diff --git a/libheif/context.cc b/libheif/context.cc
+index a3371207..170f8314 100644
+--- a/libheif/context.cc
++++ b/libheif/context.cc
+@@ -1945,7 +1945,14 @@ std::vector<uint32_t> HeifContext::get_track_IDs() const
+ 
+ Result<std::shared_ptr<Track>> HeifContext::get_track(uint32_t track_id)
+ {
+-  assert(has_sequence());
++  // The caller is expected to have confirmed (via has_sequence()) that there are
++  // sequence tracks before requesting one. Guard against an empty track map anyway,
++  // since this is reachable through the public API (e.g. on a still image file).
++  if (!has_sequence()) {
++    return Error{heif_error_Usage_error,
++                 heif_suberror_Unspecified,
++                 "File contains no sequence tracks"};
++  }
+ 
+   if (track_id != 0) {
+     auto iter = m_tracks.find(track_id);
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index b52bc202..d66ffb38 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -59,6 +59,7 @@ endif()
+ add_libheif_test(encode)
+ add_libheif_test(extended_type)
+ add_libheif_test(region)
++add_libheif_test(sequence_no_track)
+ add_libheif_test(tai)
+ add_libheif_test(text)
+ add_libheif_test(cxx_wrapper)
+diff --git a/tests/sequence_no_track.cc b/tests/sequence_no_track.cc
+new file mode 100644
+index 00000000..cde11f77
+--- /dev/null
++++ b/tests/sequence_no_track.cc
+@@ -0,0 +1,108 @@
++/*
++  libheif regression test for requesting a track from a context without sequence tracks.
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
++#include "libheif/heif.h"
++#include "libheif/heif_sequences.h"
++#include "test_utils.h"
++
++#include <cstdint>
++#include <vector>
++
++namespace {
++
++// Sequence API queries that must work on a context that holds no sequence
++// tracks (a still image, or no image at all). heif_context_get_track() is
++// documented to return nullptr on failure; it must not abort/crash. This
++// formerly tripped assert(has_sequence()) in HeifContext::get_track().
++// See https://github.com/strukturag/libheif/issues/1844.
++void check_no_sequence_apis(heif_context* ctx)
++{
++  REQUIRE(heif_context_has_sequence(ctx) == 0);
++  REQUIRE(heif_context_number_of_sequence_tracks(ctx) == 0);
++
++  // Listing track IDs must work (and write nothing) when there are no tracks.
++  heif_context_get_track_ids(ctx, nullptr);
++
++  heif_track* track = heif_context_get_track(ctx, 0);
++  REQUIRE(track == nullptr);
++}
++
++heif_error mem_writer(heif_context*, const void* data, size_t size, void* userdata)
++{
++  auto* out = static_cast<std::vector<uint8_t>*>(userdata);
++  const auto* p = static_cast<const uint8_t*>(data);
++  out->insert(out->end(), p, p + size);
++  return heif_error{heif_error_Ok, heif_suberror_Unspecified, nullptr};
++}
++
++}
++
++TEST_CASE("get_track on context without sequence returns nullptr")
++{
++  heif_context* ctx = heif_context_alloc();
++  REQUIRE(ctx != nullptr);
++
++  // Fresh context, nothing loaded: no sequence tracks present.
++  check_no_sequence_apis(ctx);
++
++  heif_context_free(ctx);
++}
++
++TEST_CASE("get_track on a still-image file returns nullptr")
++{
++  // Encode a tiny still image to an in-memory HEIF file, then read it back.
++  // A still image is a perfectly valid file that contains no sequence tracks.
++  heif_image* img = nullptr;
++  REQUIRE(heif_image_create(16, 16, heif_colorspace_YCbCr, heif_chroma_420, &img).code == heif_error_Ok);
++  fill_new_plane(img, heif_channel_Y, 16, 16);
++  fill_new_plane(img, heif_channel_Cb, 8, 8);
++  fill_new_plane(img, heif_channel_Cr, 8, 8);
++
++  heif_encoder* enc = get_encoder_or_skip_test(heif_compression_HEVC);
++
++  heif_context* enc_ctx = heif_context_alloc();
++  REQUIRE(heif_context_encode_image(enc_ctx, img, enc, nullptr, nullptr).code == heif_error_Ok);
++
++  std::vector<uint8_t> file;
++  heif_writer writer{};
++  writer.writer_api_version = 1;
++  writer.write = mem_writer;
++  REQUIRE(heif_context_write(enc_ctx, &writer, &file).code == heif_error_Ok);
++
++  heif_encoder_release(enc);
++  heif_context_free(enc_ctx);
++  heif_image_release(img);
++
++  // Read the still image back and query the sequence API on it.
++  heif_context* ctx = heif_context_alloc();
++  REQUIRE(ctx != nullptr);
++  REQUIRE(heif_context_read_from_memory(ctx, file.data(), file.size(), nullptr).code == heif_error_Ok);
++
++  check_no_sequence_apis(ctx);
++
++  heif_context_free(ctx);
++}
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index 1dfab46513..165ed0ad2a 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;
            file://CVE-2026-41071-1.patch \
            file://CVE-2026-41071-2.patch \
            file://CVE-2026-62289.patch \
+           file://CVE-2026-62377.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

