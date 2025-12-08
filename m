Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2C7D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:02:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.672.1765220564899597515
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLXCccUm;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2958db8ae4fso46944065ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765220564; x=1765825364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KoDknuZtItRvl7QR5vEj7fely9b7KJN6lzHsF1OoamI=;
        b=eLXCccUmvvuzenAvbTg/NkQ569aqETI4kelMkiUX5B4qfL/jDgN82dUJ8lKIHfSEU8
         SnPJ0IH5Eo2MG5MxyKyKMSXZh60SIaxlJlFlJX6RK0OpItcmdyyX05dGY0vv7RU7COJ4
         yCxUMWlgWfAGZ5Aty1kFKf/T3lxXCz+s+8k/Gr/VquWZjz1iQmZ24OuJaDNd/4XQ+iE7
         5RJnSHdRivcNB2RTE1zc8xi6sutlzUy+EcSX2rh1joPhwuJD7LfRBzIbY4E6H2+J+wrx
         G03XibfFvCjrZ8fXZloFWWezSbEaFyJ6O6NNLW3cP8wWwfI8ss8wwg8XCBeC7yruWVhg
         LR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765220564; x=1765825364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoDknuZtItRvl7QR5vEj7fely9b7KJN6lzHsF1OoamI=;
        b=roj94NEpd1DpNJlPse9Z5zijhdLqYtSKuMaXHOkHqT9b0As76IBNHVPGvLBYhoOff0
         uPBKY5I3UvsYwHlWmLryFtacut+WSagb1uftGi/+F6+yddo2Z+ygPoBTKGI0+mvFKOcl
         sQ0qzWthvYz/1aJQLYSvn+d7eFJht2IISQGko4FmMtG4xpWH7qZ6zYpz63ONU7DE+5XD
         8WbrpFaRCFNcM6IXqrJuukJlj1w7McIlXyQcm6o83G9rvtLFK6L5bG79hm+ixtOk/mMi
         d+kOMDjeeXd4ts6JSAhg6VGV8coLfl1r9z94IiMYmmATpn3R+UmTUIAufQuGLJAtX/hB
         kthA==
X-Gm-Message-State: AOJu0YyIcSScOsDpbUVDVqgwnz8NwectLEkOBXq3RJiV/iJRsdJ6GKUc
	bus0cgzW7a4a87xLn60SKcoPz3XpsEf+lXo6JPM5dc8UC57ifI/3kIUvi4V+6A==
X-Gm-Gg: ASbGncufHPCxoY3LS2/JYcSbW+n37A1jxYX3+hB9Uwa7HZQVdQbeHeCEEUUvF82jd9+
	Nh9V9JvVbzWjMNOzCMxK76ypNrOnert5ZDpMNnyvhWZFJHjpVCQQTm7eM/VToXriKcz81io8TbI
	Zc3BZDjXKebla86MCl/nx2gmoyLoV4Oo/77YNVdNpaW4/TO+qAP5Nn+3sYIFXAnFe5xWsS6lNqN
	hbn/BXLZfHQEBXIUoMwvTBtbMW2LTv8h02/PzeiS6a7IDfIkXyZlkpEwuQrroJA8GlKT5FxsOQe
	Vz2GaQLlJ5rkxnYyzby8VfocFcl3HBXXup+a/tctsqMj0Nt/3P9O+eJ4GNLBnJVxcVw7R2OiGs1
	SkGt/LmDuM5x7qGtFWdoU4cbiOYD5ECt+qXpzJLBmu/kVGlwowcmBKwSX0hqf0eF8RNNXilb33O
	Yj13W4aXMKi7onHZ2lIsX27VC8
X-Google-Smtp-Source: AGHT+IEFZDKWLrvLhbb7oEf1OjPrtxMFbB745aw038KXO0F5LRnAaHA87SpZaiYQaqtQSUOoIbqsgg==
X-Received: by 2002:a17:903:b0e:b0:295:8a21:155a with SMTP id d9443c01a7336-29df5bb4030mr89732495ad.35.1765220563991;
        Mon, 08 Dec 2025 11:02:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.250.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49cbf0sm130485845ad.4.2025.12.08.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 11:02:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] libavif: patch CVE-2025-48174
Date: Tue,  9 Dec 2025 08:02:33 +1300
Message-ID: <20251208190233.3120323-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122388

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-48174

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libavif/libavif/CVE-2025-48174_1.patch    | 27 +++++++
 .../libavif/libavif/CVE-2025-48174_2.patch    | 31 ++++++++
 .../libavif/libavif/CVE-2025-48174_3.patch    | 27 +++++++
 .../libavif/libavif/CVE-2025-48174_4.patch    | 72 +++++++++++++++++++
 .../libavif/libavif_1.0.1.bb                  |  7 +-
 5 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch
new file mode 100644
index 0000000000..c9bee6c62a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch
@@ -0,0 +1,27 @@
+From d9c933e79109becdbc6be9ddf9fbe00be03d533e Mon Sep 17 00:00:00 2001
+From: DanisJiang <43723722+DanisJiang@users.noreply.github.com>
+Date: Fri, 18 Apr 2025 17:31:53 +0800
+Subject: [PATCH] Add integer overflow checks to makeRoom.
+
+CVE: CVE-2025-48174
+Upstream-Status: Backport [https://github.com/AOMediaCodec/libavif/commit/e5fdefe7d1776e6c4cf1703c163a8c0535599029]
+(cherry picked from commit e5fdefe7d1776e6c4cf1703c163a8c0535599029)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/stream.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/stream.c b/src/stream.c
+index c85ca31b..70e8bfaa 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -320,6 +320,9 @@ avifBool avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t enforc
+ static avifResult makeRoom(avifRWStream * stream, size_t size)
+ {
+     size_t neededSize = stream->offset + size;
++    if (neededSize < stream->offset) {
++        return AVIF_RESULT_INVALID_ARGUMENT;
++    }
+     size_t newSize = stream->raw->size;
+     while (newSize < neededSize) {
+         newSize += AVIF_STREAM_BUFFER_INCREMENT;
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch
new file mode 100644
index 0000000000..4ba27d5a57
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch
@@ -0,0 +1,31 @@
+From 5bd6529e7e729718ac2d164859965771466c8410 Mon Sep 17 00:00:00 2001
+From: DanisJiang <43723722+DanisJiang@users.noreply.github.com>
+Date: Mon, 21 Apr 2025 10:45:59 +0800
+Subject: [PATCH] Add integer overflow check to makeRoom.
+
+CVE: CVE-2025-48174
+Upstream-Status: Backport [https://github.com/AOMediaCodec/libavif/commit/50a743062938a3828581d725facc9c2b92a1d109]
+(cherry picked from commit 50a743062938a3828581d725facc9c2b92a1d109)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/stream.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/stream.c b/src/stream.c
+index 70e8bfaa..893ba3f0 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -319,10 +319,10 @@ avifBool avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t enforc
+ #define AVIF_STREAM_BUFFER_INCREMENT (1024 * 1024)
+ static avifResult makeRoom(avifRWStream * stream, size_t size)
+ {
+-    size_t neededSize = stream->offset + size;
+-    if (neededSize < stream->offset) {
+-        return AVIF_RESULT_INVALID_ARGUMENT;
++    if (size > SIZE_MAX - stream->offset) {
++        return  AVIF_RESULT_OUT_OF_MEMORY;
+     }
++    size_t neededSize = stream->offset + size;
+     size_t newSize = stream->raw->size;
+     while (newSize < neededSize) {
+         newSize += AVIF_STREAM_BUFFER_INCREMENT;
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch
new file mode 100644
index 0000000000..2fddbeeb81
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch
@@ -0,0 +1,27 @@
+From 0b0b88596f21821af605ed316e996739820d3b17 Mon Sep 17 00:00:00 2001
+From: "Danis Jiang (Yuhao Jiang)"
+ <43723722+DanisJiang@users.noreply.github.com>
+Date: Thu, 24 Apr 2025 10:39:19 +0800
+Subject: [PATCH] Fix format errors
+
+CVE: CVE-2025-48174
+Upstream-Status: Backport [https://github.com/AOMediaCodec/libavif/commit/c9f1bea437f21cb78f9919c332922a3b0ba65e11]
+(cherry picked from commit c9f1bea437f21cb78f9919c332922a3b0ba65e11)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/stream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/stream.c b/src/stream.c
+index 893ba3f0..b38c93c6 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -320,7 +320,7 @@ avifBool avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t enforc
+ static avifResult makeRoom(avifRWStream * stream, size_t size)
+ {
+     if (size > SIZE_MAX - stream->offset) {
+-        return  AVIF_RESULT_OUT_OF_MEMORY;
++        return AVIF_RESULT_OUT_OF_MEMORY;
+     }
+     size_t neededSize = stream->offset + size;
+     size_t newSize = stream->raw->size;
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch
new file mode 100644
index 0000000000..ecdef9e5bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch
@@ -0,0 +1,72 @@
+From 083ce38f549183a3d74a0a6d2dc4d3f4b195867f Mon Sep 17 00:00:00 2001
+From: Wan-Teh Chang <wtc@google.com>
+Date: Sun, 27 Apr 2025 14:34:35 -0700
+Subject: [PATCH] Add another integer overflow check to makeRoom
+
+Replace the while loop with a formula in makeRoom.
+
+Test the integer overflow checks in makeRoom.
+
+See https://github.com/AOMediaCodec/libavif/pull/2768.
+
+CVE: CVE-2025-48174
+Upstream-Status: Backport [https://github.com/AOMediaCodec/libavif/commit/32eae7c5c1e72d9999cb31d02e333b6a76029bad]
+(cherry picked from commit 32eae7c5c1e72d9999cb31d02e333b6a76029bad)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/stream.c                  | 16 +++++++++-------
+ tests/gtest/avifstreamtest.cc | 13 +++++++++++++
+ 2 files changed, 22 insertions(+), 7 deletions(-)
+
+diff --git a/src/stream.c b/src/stream.c
+index b38c93c6..e79e9691 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -319,14 +319,16 @@ avifBool avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t enforc
+ #define AVIF_STREAM_BUFFER_INCREMENT (1024 * 1024)
+ static avifResult makeRoom(avifRWStream * stream, size_t size)
+ {
+-    if (size > SIZE_MAX - stream->offset) {
+-        return AVIF_RESULT_OUT_OF_MEMORY;
+-    }
+-    size_t neededSize = stream->offset + size;
+-    size_t newSize = stream->raw->size;
+-    while (newSize < neededSize) {
+-        newSize += AVIF_STREAM_BUFFER_INCREMENT;
++    AVIF_CHECKERR(size <= SIZE_MAX - stream->offset, AVIF_RESULT_OUT_OF_MEMORY);
++    size_t newSize = stream->offset + size;
++    if (newSize <= stream->raw->size) {
++        return AVIF_RESULT_OK;
+     }
++    // Make newSize a multiple of AVIF_STREAM_BUFFER_INCREMENT.
++    size_t rem = newSize % AVIF_STREAM_BUFFER_INCREMENT;
++    size_t padding = (rem == 0) ? 0 : AVIF_STREAM_BUFFER_INCREMENT - rem;
++    AVIF_CHECKERR(newSize <= SIZE_MAX - padding, AVIF_RESULT_OUT_OF_MEMORY);
++    newSize += padding;
+     return avifRWDataRealloc(stream->raw, newSize);
+ }
+ 
+diff --git a/tests/gtest/avifstreamtest.cc b/tests/gtest/avifstreamtest.cc
+index af94bb82..e768939b 100644
+--- a/tests/gtest/avifstreamtest.cc
++++ b/tests/gtest/avifstreamtest.cc
+@@ -204,6 +204,19 @@ TEST(StreamTest, Roundtrip) {
+   EXPECT_FALSE(avifROStreamSkip(&ro_stream, /*byteCount=*/1));
+ }
+ 
++// Test the overflow checks in the makeRoom() function in src/stream.c.
++TEST(StreamTest, OverflowChecksInMakeRoom) {
++  testutil::AvifRwData rw_data;
++  avifRWStream rw_stream;
++  avifRWStreamStart(&rw_stream, &rw_data);
++  const char ten_bytes[10] = {0};
++  EXPECT_EQ(avifRWStreamWrite(&rw_stream, ten_bytes, 10), AVIF_RESULT_OK);
++  EXPECT_EQ(avifRWStreamWrite(&rw_stream, ten_bytes, SIZE_MAX - 9),
++            AVIF_RESULT_OUT_OF_MEMORY);
++  EXPECT_EQ(avifRWStreamWrite(&rw_stream, ten_bytes, SIZE_MAX - 10),
++            AVIF_RESULT_OUT_OF_MEMORY);
++}
++
+ //------------------------------------------------------------------------------
+ 
+ }  // namespace
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
index 8ddd16ee2a..bca6e40409 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
@@ -4,7 +4,12 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
 
-SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
+SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x \
+           file://CVE-2025-48174_1.patch \
+           file://CVE-2025-48174_2.patch \
+           file://CVE-2025-48174_3.patch \
+           file://CVE-2025-48174_4.patch \
+"
 
 S = "${WORKDIR}/git"
 SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"

