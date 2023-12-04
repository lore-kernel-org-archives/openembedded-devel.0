Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA048C10DC1
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 07:54:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.64033.1701676456848698787
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Dec 2023 23:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdemJ9sa;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54ce4c6a46dso296394a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Dec 2023 23:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701676455; x=1702281255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PD8fwugPsXaAbi2p9ygaikBwXnCHdb9u+BUgDMUfdK8=;
        b=hdemJ9san6aVrTFiwXoOIbsygJssKnInLqrVTXoK1nd1MpPVqyAJtGy9pNZJ83SDlJ
         3K2iTKlclRVkVlV5h0kc+tTPExVFQ+EsgJkPRY242FK2tYcPZgCjPEsZnYgQS7L87OEb
         xBwrv59X+XLdYsG4VTH2aT0Ltm2qHxIH6xFWKyFO61LPHXH8xdEGZMqFhxxPQgjlwzo9
         PDojs7runividmtSftHWiViKUIanPjUvvCeBwjnArL8A8Tsnud4ezZXsbBd0lmN0DmpV
         m+/ZZQATYKuzv+0UInPDsskPy7sXDqHvbc0qu9YU+PezBAvKVa4re5+X5HU/1hGOgfhN
         Nogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676455; x=1702281255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD8fwugPsXaAbi2p9ygaikBwXnCHdb9u+BUgDMUfdK8=;
        b=qMD1/5ntVh0yDZc3aJ0PznnN3PpcV7Uu+dL1NRqUoPskTifLONFohZm+w7q9ejN2Fk
         zwFtYx4G07vIXgjFwzkhJAuI18sC8shInB//Qh+UYvNnpfAUagShzULCySsrUokhkfHi
         Z90aHgkYVvYowSzp789Ll7yb1j0hQRuWtDaslRlbKub+qf9WQM7J1Hj4s4tBD8tprbY/
         hagqcw2PQaOKYSTBBqvJDwJxWvBnVpdCg423ZyVmIIl/wHb36/yfdTWb7X5eeICMs40C
         okQaEg4xP+skFd9CYjGVTf4OFzuyVlwI39V6WyVIatMq1Ak5+xWnz8Yj9NLQXg3gYTFY
         KIZQ==
X-Gm-Message-State: AOJu0YxcmxiXHm1BBPD0gmhdii/T7QOamAKnG70k716YEAEB5DoA7RSN
	AnJaPxfdNzx18VQfRj29PPDT32V5qPES+Q==
X-Google-Smtp-Source: AGHT+IGtuwF332F+I+cuolXKY5pxLisxh40gDZOG4Y97y7Tn/JU23VfRJ702khaTPzW7r7J+imgrpw==
X-Received: by 2002:a50:c2c9:0:b0:54c:4837:7d2f with SMTP id u9-20020a50c2c9000000b0054c48377d2fmr2004985edf.110.1701676454430;
        Sun, 03 Dec 2023 23:54:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id w5-20020a056402268500b0054b25e865f6sm3823534edd.18.2023.12.03.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:54:13 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] snappy: upgrade 1.1.9 -> 1.1.10
Date: Mon,  4 Dec 2023 10:53:56 +0300
Message-Id: <20231204075356.26863-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 07:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107200

* 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed because fixed in the new version

Changelog:

* Performance improvements
* Compilation fixes for various environments

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
 .../{snappy_1.1.9.bb => snappy_1.1.10.bb}     |  8 +--
 2 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
 rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb => snappy_1.1.10.bb} (85%)

diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
deleted file mode 100644
index 27357d88a..000000000
--- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
-From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
-Date: Wed, 5 May 2021 14:16:46 +0300
-Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-
-Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
-fix the following compilation errors and a warning with GCC:
-
-[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
-/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
--I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
--march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
--DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
-/tmp/snappy-1.1.9/snappy.cc
-/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
-function might not be inlinable [-Wattributes]
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
-unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
-uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
-char; ptrdiff_t = int]':
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-CMakeFiles/snappy.dir/build.make:137: recipe for target
-'CMakeFiles/snappy.dir/snappy.cc.o' failed
-
-Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
-inline specifier.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
----
- snappy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/snappy.cc b/snappy.cc
-index 79dc0e8..51157be 100644
---- a/snappy.cc
-+++ b/snappy.cc
-@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
- }
- 
- SNAPPY_ATTRIBUTE_ALWAYS_INLINE
--size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-   const uint8_t*& ip = *ip_p;
-   // This section is crucial for the throughput of the decompression loop.
-   // The latency of an iteration is fundamentally constrained by the
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
similarity index 85%
rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
index 9e0e43ce8..7baf9c647 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
@@ -10,12 +10,10 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
-    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
-"
-SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
-S = "${WORKDIR}/git"
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main"
+SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
 
+S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-- 
2.25.1


