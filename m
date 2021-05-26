Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.3350.1622062308834715928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 13:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GkBw2bI5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id z16so3956993ejr.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6h+9Nxm0NWL+HL6LrXi/XqsUii8O1d7FBN8oIpZzc1g=;
        b=GkBw2bI5oHwIAOfQhB5moTLdoXEh1Z5DB6/dUsMUrSO+9g45EACGzk3MrvMJY3bK2Z
         S/TaXEmCaPeBgEWX61/UsJ/OQMU82ZdBb+Jc1+CnFzlGtOSf+EV1BZ/uX1I+IcfSKqjY
         YOdvT5vKf53RTdfc5T/X1fvgf67N69HkSZldb+wSIr8bkLFC0bbY8Vc882iqBJ5Yr8Fe
         94LOcXTvc3j3PajXfLCOvbpu4zEoO7xsFa8kk5tb9ByiSnyxkbBvrGir9n0TewWMtsgB
         mOCwm2v7bYWTbVR8jMHfzBq+v4NtsFdkKVSHZxpnCohA36HVxYcNi/PKmQQVKwf7t2QL
         l/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6h+9Nxm0NWL+HL6LrXi/XqsUii8O1d7FBN8oIpZzc1g=;
        b=p6kR5e+yPK4QB4e1ziXaaEfvNhxWHmq7qJpuT/2rk6eflicFil5WgguF9l4B5tidd6
         lXjZBEpL1JJvSzMFKkh0LpsajAxuAXNzpjo8m1Rs1WToJkJBshVpk1qFt5mjiQNjWHNK
         qTA3jA34dU9xNQBm6YsB7tgu3CmvCcoGl1+zSCqYiBI7wXxAIF5wEO7DrYkKncMwkNqu
         zZKgqeHKzwe3Zod13+M3UxxM8/CHZv03geh/YDMlJ5M4/BqyKoUqMa5xBrkmZ4qYliZ9
         hdWjS0614SYqwXW3KWe7PuN7CQWzh9OD9y2lS3lgNVsMKiy/qI3jro/RvtV8qX6c96xz
         GwUg==
X-Gm-Message-State: AOAM531JVHasn4WetfWzrjXxGpUNpYdF5NNAqtJklSJgThDs+soVZiiy
	3y5tHwR7BoF10VSh9EIOV204f+bmoFE=
X-Google-Smtp-Source: ABdhPJycLsnMG/IDo0KeJQa1UE1zFXUoOOVvw2mFBI7NSqWgNkEMYQZT2fSDdODr5b7tLEJPtFW1ZA==
X-Received: by 2002:a17:906:843:: with SMTP id f3mr214835ejd.84.1622062307172;
        Wed, 26 May 2021 13:51:47 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p15sm12287edr.50.2021.05.26.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:51:46 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] snappy: fix native build with older gcc on host
Date: Wed, 26 May 2021 22:51:44 +0200
Message-Id: <20210526205144.2202827-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 +++++++++++++++++++
 .../recipes-extended/snappy/snappy_1.1.9.bb   |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch

diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
new file mode 100644
index 0000000000..27357d88aa
--- /dev/null
+++ b/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
@@ -0,0 +1,71 @@
+From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
+From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
+Date: Wed, 5 May 2021 14:16:46 +0300
+Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+
+Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
+fix the following compilation errors and a warning with GCC:
+
+[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
+/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
+-I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
+-march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
+-DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
+/tmp/snappy-1.1.9/snappy.cc
+/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
+function might not be inlinable [-Wattributes]
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
+unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
+uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
+char; ptrdiff_t = int]':
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+CMakeFiles/snappy.dir/build.make:137: recipe for target
+'CMakeFiles/snappy.dir/snappy.cc.o' failed
+
+Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
+inline specifier.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
+---
+ snappy.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/snappy.cc b/snappy.cc
+index 79dc0e8..51157be 100644
+--- a/snappy.cc
++++ b/snappy.cc
+@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
+ }
+ 
+ SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+-size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
++inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+   const uint8_t*& ip = *ip_p;
+   // This section is crucial for the throughput of the decompression loop.
+   // The latency of an iteration is fundamentally constrained by the
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index 151c4ddc38..5c786d8913 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -10,7 +10,9 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https"
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https \
+    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
+"
 SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
 S = "${WORKDIR}/git"
 
-- 
2.30.2

