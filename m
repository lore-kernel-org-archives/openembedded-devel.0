Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B78C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 04:14:37 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.130266.1672028074257002883
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 20:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lDPwalcC;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 65so6629942pfx.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 20:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WMQs23bw8bJxHTy8OMmdb1qwzlTDIa2fc4zeCVXoTk=;
        b=lDPwalcCCAeTSfcNoJPFyOtULHmV1t4Uk9BnORyOjplcpcRdsaef8lcpdaZLHmRkB1
         w80g7L1Z1C/pBJK62N+XwQCf/sWyvsrkcn0GQSC1GkW2j0hB6mL7NfqBvBv01x1qMBG9
         LMmJHH+2z6teBgGJJ55tXGsAjd1rhvQFkxmYg0hsLyEUKYV5R3jF325TOL2puWiH1e/B
         YFiugdZSuEds5hO4tkHmxszYjmCEUnR456YLFGO6X2lliX/IQWRSCr+FqM0oZL/5GLM1
         00tP6ubg5CzaAuDF0Zf4cVlTZWNrsKnkYDLcYtXxfyl/mq9QEQ3GP0jyXbd7q/3MhTLL
         hYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WMQs23bw8bJxHTy8OMmdb1qwzlTDIa2fc4zeCVXoTk=;
        b=WQ5dll+Wp5j5CcseA+Yiffx5sg9xkoXA+Qxmu7ALO93pcxV0NsHQFKgwT6vYQgD2QC
         O5j8qCSzriRDvH3GHpWXtX6qtTttQjy1hF1BVLXS5UfZvPLuPvn+aCgstozGImW1rwv5
         ESb3UxS1mA45cjnUUuV6njYOLbODhte5/xCIuU0OdeFjuq7XmY2uLi1eUEmZJzkQhdn6
         RiEfmIvrW8ADWBlws15oXIAZAQn7Xa+WxMElZF40eb9gjoJr/7NArxH7pNitHnWIhSGd
         t9X0VT5+FK7ZHz1TpuKouAJtKXdFgsU3f7AuSpQUscqm8j14Jf0feto76R0c8EY0jwSd
         PXMg==
X-Gm-Message-State: AFqh2krjEzI/CwZIAsUtt2adNcNrzftm3gXsTWjphBLBAfZy109pa4rv
	Qo4WDkKRwG1b4Hz4S9Jp2JUYlDb+9Ok=
X-Google-Smtp-Source: AMrXdXtYC9tPoOKjch7o8dNd2eNm3r3rfpFOOeDghMqJmzzVfeV9mUxQIzR+kZy23/N8UKXSqwsofg==
X-Received: by 2002:a05:6a00:1906:b0:580:9d4a:4e1c with SMTP id y6-20020a056a00190600b005809d4a4e1cmr13144226pfi.3.1672028073266;
        Sun, 25 Dec 2022 20:14:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id x7-20020aa79a47000000b005800cb7cbcasm5892983pfj.120.2022.12.25.20.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:14:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gperftools: Define off64_t on musl
Date: Sun, 25 Dec 2022 20:14:30 -0800
Message-Id: <20221226041430.3700024-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 04:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100235

alias it to off_t which is 64bit always on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Define-off64_t-as-off_t-on-musl.patch | 33 ++++++++++++++++++
 .../0001-fix-build-with-musl-libc.patch       | 34 -------------------
 .../gperftools/gperftools_2.10.bb             |  2 +-
 3 files changed, 34 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
new file mode 100644
index 0000000000..2b782c2040
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
@@ -0,0 +1,33 @@
+From 41260e21e271eb1dc8b34f952ea3f90a0dc35e9e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Dec 2022 20:01:29 -0800
+Subject: [PATCH] Define off64_t as off_t on musl
+
+Musl's default bitlength for off_t is always 64bit therefore define
+off64_t as off_t on musl
+
+Upstream-Status: Submitted [https://github.com/gperftools/gperftools/pull/1379]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/malloc_hook_mmap_linux.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
+index c7d8b4b..a10687e 100644
+--- a/src/malloc_hook_mmap_linux.h
++++ b/src/malloc_hook_mmap_linux.h
+@@ -45,6 +45,11 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
++// musl's off_t is already 64-bit
++#if defined(__linux__) && !defined(__GLIBC__)
++typedef off_t off64_t;
++#endif
++
+ // The x86-32 case and the x86-64 case differ:
+ // 32b has a mmap2() syscall, 64b does not.
+ // 64b and 32b have different calling conventions for mmap().
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
deleted file mode 100644
index baaaa4b53b..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 696674a800cb6d2070897a565b92d7e63022a8f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 15:51:28 -0700
-Subject: [PATCH] fix build with musl libc
-
-Patch from https://github.com/gperftools/gperftools/pull/765/
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/malloc_hook_mmap_linux.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
---- a/src/malloc_hook_mmap_linux.h
-+++ b/src/malloc_hook_mmap_linux.h
-@@ -45,6 +45,10 @@
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-+#ifndef __GLIBC__
-+typedef off64_t   __off64_t;
-+#endif
-+
- // The x86-32 case and the x86-64 case differ:
- // 32b has a mmap2() syscall, 64b does not.
- // 64b and 32b have different calling conventions for mmap().
-@@ -175,7 +179,7 @@ extern "C" void* mmap64(void *start, siz
-   return result;
- }
- 
--# if !defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH)
-+# if defined(__GLIBC__) && (!defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH))
- 
- extern "C" void* mmap(void *start, size_t length, int prot, int flags,
-                       int fd, off_t offset) __THROW {
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.10.bb b/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
index 602a7e263a..8db0cecbfd 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
@@ -13,10 +13,10 @@ DEPENDS:append:libc-musl = " libucontext"
 SRCREV = "bf8b714bf5075d0a6f2f28504b43095e2b1e11c5"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https \
            file://0001-Support-Atomic-ops-on-clang.patch \
-           file://0001-fix-build-with-musl-libc.patch \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
            file://sgidef.patch \
+           file://0001-Define-off64_t-as-off_t-on-musl.patch \
            "
 
 SRC_URI:append:libc-musl = " file://ppc-musl.patch"
-- 
2.39.0


