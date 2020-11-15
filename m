Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.25169.1605471981907732997
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 12:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Td/3DJ/R;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j19so4043321pgg.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSoxh31GXjtceqpyt6u+65wQlp8KmzWBDQXGXPinT/w=;
        b=Td/3DJ/R/4CMpfxqFzaFuZ5WxJfMIZMQZzmx6zpMFdm9MEklH8JTZsQ36VmBZwDgIB
         8OhCNH9cJ0SXj/wa+SAXeq+kRXPO2DLlb5mJs6MJXnyczYsTXPZtOMnX1t/iv0F0gFmx
         umwtnYO8uqn6BLgZQot+l9LX14KFAETIUdDwq6dSzLUycRiRmgJwLf1bC6qbsQzfrvl0
         VuNx6mgVatmWYUOORdPrORiSNF6lmB+dScxsfFVUnrwQCDNepGF2ior9kYrCiCXGnQbU
         Dm5M3Ht0unZHUXUsVmKlyQDGMCi60H8Nn0jaQiQ/L2KZMk8aCDz2XjsW1Yx9TROeOYXa
         CPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSoxh31GXjtceqpyt6u+65wQlp8KmzWBDQXGXPinT/w=;
        b=qOsXodSazstS31cqQobvYnx+h1s55GgDkYPZnK1NW3Hr27lypMeWxJJinDw5u1jlT/
         ZwhXCQigfP6KR0c5DRS9mMlM1MVMbp/cq++N2ZH4XwT/oEtZUEaghSUcgJipPrwHaw+V
         FcwzL1gFEhBNVEgV3jl1gaAaQIgWCvRMe8pmf5aZ+Unock+19ek5Y0vvOJqakgkom3Fz
         H+r3w8qkHkv4gIxuEnbVwTGlEw92qb8C697twLfvI7B9JA/QMt1VLPsmI96xHSFVtk/l
         PTnKWKzHPhutBCOo5Vb6Bt0fztSp2Lo2ZzSmNtkuxIJ2XNCQwhQGgpR4Ol32pq8rbmMC
         NsRg==
X-Gm-Message-State: AOAM5317ENw7e+y/eOUjuigyxiwi/wrYz+8bIcarPuvPjTkCFN8UPBhr
	uYbpJkRB7br71tiX4a7e0H7BrcnejOUNMw==
X-Google-Smtp-Source: ABdhPJxl5TBRJOVJ9RSHFaQnaXnXjTpppW1Y5BzhI2ciHsSjj5jDZsqkQcRzrQ628MN9VtNwqmPbfg==
X-Received: by 2002:a17:90a:f318:: with SMTP id ca24mr12480168pjb.100.1605471980993;
        Sun, 15 Nov 2020 12:26:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id j13sm16126060pfd.97.2020.11.15.12.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 12:26:20 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] capnproto: Fix build on 32bit arches with 64bit time_t defaults
Date: Sun, 15 Nov 2020 12:26:18 -0800
Message-Id: <20201115202618.2780819-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on-32-bit-architectures-using-64-bit.patch | 38 +++++++++++++++++++
 .../capnproto/capnproto_0.8.0.bb              |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch b/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch
new file mode 100644
index 0000000000..43da4a9ef7
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch
@@ -0,0 +1,38 @@
+From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 12:10:28 -0800
+Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
+
+mutex code uses SYS_futex, which it expects from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+rv32 is using 64bit time_t from get go unlike other 32bit architectures
+in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
+this aliases it to NR_futex so that SYS_futex is then defined for rv32
+
+Upstream-Status: Submitted [https://github.com/capnproto/capnproto/pull/1103]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ c++/src/kj/mutex.c++ | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
+index c81cead7..e1594b11 100644
+--- a/c++/src/kj/mutex.c++
++++ b/c++/src/kj/mutex.c++
+@@ -39,7 +39,13 @@
+ 
+ #ifndef SYS_futex
+ // Missing on Android/Bionic.
++#ifdef __NR_futex
+ #define SYS_futex __NR_futex
++#elif defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#else
++#error "Need working SYS_futex"
++#endif
+ #endif
+ 
+ #ifndef FUTEX_WAIT_PRIVATE
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
index 71f94badfa..54e9daee7b 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
@@ -5,7 +5,9 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV} \
+           file://0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch;patchdir=../ \
+           "
 SRCREV = "57a4ca5af5a7f55b768a9d9d6655250bffb1257f"
 
 S = "${WORKDIR}/git/c++"
-- 
2.29.2

