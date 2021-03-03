Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.875.1614798693629306474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 11:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TVig9oA4;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id d13-20020a17090abf8db02900c0590648b1so3288261pjs.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npHk1cG4gg2MqZfZfl33YvmIVNqnjOojKxTH/QdN4rQ=;
        b=TVig9oA4JkiX3NSmql2xtZjci6NDGDYw2sMDOMZn9Tg3qVIbnS2q9rx9YIswrXAOwo
         f+seNnQD/d1h6YcSvpPVzBGYfejOULoUTFEwNfu4yEVqMx2LhK8qafcd7/edIvnaZP4T
         jLJHjt9dk/xK3kkh0e72xp6E84d6ebsTvuOMVgHSvJFrqaMp2PPBD0q9U6HmHNn6vJrj
         JrEiN+et+yO9xljg7nhILAlNE6UuHLd+PLSBuq0FBx2uSEwwRNWdE7MFKGXBNKvP6jR+
         idyFR6+rP7vilqjJXjDTwJEqyEP7qY7ZGQkaPmSuWkSeQyVnHcufsCLoEG7k7990WqkN
         ci3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npHk1cG4gg2MqZfZfl33YvmIVNqnjOojKxTH/QdN4rQ=;
        b=Oe2Uwx8xYM32T4iFNkLPPoCrHm7YLQ5YxAqWZs7HB756fLHMWA+Hm5csupIPlyiCB0
         N1XrebA20fgkbeDxonfAHvUz9ZDbMeBCrz6rjJbnyA+uItIWMa9Z2UgDVYQZ078/Nlzp
         MoYqi2vxiEUvlckg0stkkb5Xzei0FMP/ZkiEznYyFQD/J3NhBdy36r6StCj7/FxQc+AI
         alqQ3IkbNNR8PXsmpOduD3ykp86iosVKB9LHL7EMmjED+Yj3LjlELpBiMMnsH9HHE6dJ
         B2pm7kJfuMdoe/MqweQLlf/o8KpqHSjeYDOa8MawPHnbx+fd/iQPLnfQM6dAWZVqH9jc
         PLDw==
X-Gm-Message-State: AOAM531fPoeza4gORsK4ZSONm/FzttcIlXae8c7/+uUhjUgqc06P9SvN
	+7W0qZf9XpBQeXoCw1YgBNoI8xEUu6MSQg==
X-Google-Smtp-Source: ABdhPJxif/jRPq7+I5vck8AaZuBlLwZu/fuH/31uWP1l5hz+95/aW/X1TeukMC7g9Sy6wClxekgoiQ==
X-Received: by 2002:a17:90a:a403:: with SMTP id y3mr540438pjp.227.1614798692803;
        Wed, 03 Mar 2021 11:11:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id e8sm24298244pgb.35.2021.03.03.11.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 11:11:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Drop using JS_VOLATILE_ARM
Date: Wed,  3 Mar 2021 11:11:30 -0800
Message-Id: <20210303191130.2782517-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

JS_VOLATILE_ARM was a workaround for a gcc 4.7 bug on B2G where it
would generate unaligned word accesses that should have been
individual byte accesses.  firefox now a days require at least gcc 6.1+ (and ARM
systems support unaligned accesses). see [1]

in gcc11 volatile wont be accepted as argument qualifier in functions,
hence the build breaks, this patch unbreaks it

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1495731

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mozjs/0014-remove-JS_VOLATIME_ARM.patch   | 111 ++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_60.9.0.bb    |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-remove-JS_VOLATIME_ARM.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-remove-JS_VOLATIME_ARM.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-remove-JS_VOLATIME_ARM.patch
new file mode 100644
index 0000000000..a20873cb0b
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-remove-JS_VOLATIME_ARM.patch
@@ -0,0 +1,111 @@
+# HG changeset patch
+# User Lars T Hansen <lhansen@mozilla.com>
+# Date 1538489772 -7200
+# Node ID bb430eaf5521aa8ab233a45b585ff9e5dfecf4c9
+# Parent  e87d7028568e721e8d297ce62f9622e74d29bb37
+Bug 1495731 - remove JS_VOLATILE_ARM, it is no longer relevant.  r=waldo
+
+JS_VOLATILE_ARM was a workaround for a gcc 4.7 bug on B2G where it
+would generate unaligned word accesses that should have been
+individual byte accesses.  We now require at least gcc 6.1 (and ARM
+systems support unaligned accesses).
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://hg.mozilla.org/integration/mozilla-inbound/rev/bb430eaf5521]
+
+--- a/js/src/vm/TypedArrayObject-inl.h
++++ b/js/src/vm/TypedArrayObject-inl.h
+@@ -259,68 +259,61 @@ class ElementSpecific {
+       return true;
+     }
+ 
+-      // Inhibit unaligned accesses on ARM (bug 1097253, a compiler bug).
+-#if defined(__arm__) && defined(__GNUC__) && !defined(__clang__)
+-#define JS_VOLATILE_ARM volatile
+-#else
+-#define JS_VOLATILE_ARM
+-#endif
+-
+     SharedMem<void*> data = Ops::extract(source);
+     switch (source->type()) {
+       case Scalar::Int8: {
+-        SharedMem<JS_VOLATILE_ARM int8_t*> src =
+-            data.cast<JS_VOLATILE_ARM int8_t*>();
++        SharedMem<int8_t*> src =
++            data.cast<int8_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Uint8:
+       case Scalar::Uint8Clamped: {
+-        SharedMem<JS_VOLATILE_ARM uint8_t*> src =
+-            data.cast<JS_VOLATILE_ARM uint8_t*>();
++        SharedMem<uint8_t*> src =
++            data.cast<uint8_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Int16: {
+-        SharedMem<JS_VOLATILE_ARM int16_t*> src =
+-            data.cast<JS_VOLATILE_ARM int16_t*>();
++        SharedMem<int16_t*> src =
++            data.cast<int16_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Uint16: {
+-        SharedMem<JS_VOLATILE_ARM uint16_t*> src =
+-            data.cast<JS_VOLATILE_ARM uint16_t*>();
++        SharedMem<uint16_t*> src =
++            data.cast<uint16_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Int32: {
+-        SharedMem<JS_VOLATILE_ARM int32_t*> src =
+-            data.cast<JS_VOLATILE_ARM int32_t*>();
++        SharedMem<int32_t*> src =
++            data.cast<int32_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Uint32: {
+-        SharedMem<JS_VOLATILE_ARM uint32_t*> src =
+-            data.cast<JS_VOLATILE_ARM uint32_t*>();
++        SharedMem<uint32_t*> src =
++            data.cast<uint32_t*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Float32: {
+-        SharedMem<JS_VOLATILE_ARM float*> src =
+-            data.cast<JS_VOLATILE_ARM float*>();
++        SharedMem<float*> src =
++            data.cast<float*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+       }
+       case Scalar::Float64: {
+-        SharedMem<JS_VOLATILE_ARM double*> src =
+-            data.cast<JS_VOLATILE_ARM double*>();
++        SharedMem<double*> src =
++            data.cast<double*>();
+         for (uint32_t i = 0; i < count; ++i)
+           Ops::store(dest++, ConvertNumber<T>(Ops::load(src++)));
+         break;
+@@ -329,8 +322,6 @@ class ElementSpecific {
+         MOZ_CRASH("setFromTypedArray with a typed array with bogus type");
+     }
+ 
+-#undef JS_VOLATILE_ARM
+-
+     return true;
+   }
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
index 614cdf6e35..7367c30a5e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0011-To-fix-build-error-on-arm32BE.patch \
     file://0012-JS_PUBLIC_API.patch \
     file://0013-riscv-Disable-atomic-operations.patch \
+    file://0014-remove-JS_VOLATIME_ARM.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-support-musl.patch \
-- 
2.30.1

