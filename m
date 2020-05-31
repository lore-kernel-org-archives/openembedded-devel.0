Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.18031.1590941818892649251
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiJKxfDq;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 131so2284029pfv.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QQGWLEmFjBE6GBOjDOlZI3ncrMPtlnqZqH7Z1EM75u8=;
        b=CiJKxfDq7pHA7i1PrFNh5DQVEWDZ/ZOQ2U1Y6E828bPHysk5azGOgEYgDL2tyvUNnf
         Yax0OCqRt8dlzeor0PMuUK6klkcUeUDFeGfqFpEmOFl6bCdY4STdb4FdmN9jl+y2qfXD
         l5E6ypp1x076zKzHpIYSxgwcF98M9PU/jbGGrSYaPMJpsf/8UxXoGF8Ly/a4C9eVFSEz
         YJX5Y3eqy2gj0FVxSTuJZzETyi3buMDrrWrTaHIJfxUYUXQypwY8TByqK6q/K+nWKR+F
         u0oRKIJPkf1feLLz2PulqZROHE6RTtMzEvIBAxmxLSL7Zbo6VFZkR6KjtzrvngK3IbRP
         mJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QQGWLEmFjBE6GBOjDOlZI3ncrMPtlnqZqH7Z1EM75u8=;
        b=dOGWR8rjt9AiSbdxOcV7ttYG6j/bDTTsrfF1QNyqmYTHKTgp7q4JdTeJT0o0mJmC41
         viAEdcweIjjTu4Y8XUO3HWSEo56c6D7owW3NpFSV2VvL7Efo0fj/u30ID6jm9XF83Rhd
         RYrh48zDxeNyv+xhxEozsIldst1Nub/Ct3S77QcN4DSK7V0rw2eey+2pI8Nr9DVvKcdE
         KmWzjiKa7J+52E1wHv5FEAAhCo/xQLd965NjpXBH9mfmtmADvOiQoAX+orT+pu1hdmVh
         d6y3NEKV6BjDc1wP9Rf+StlepvB5XgcvlsFiD4YU+lC8DuyQDZSLnSQRxZ3tzINH18SF
         2yAg==
X-Gm-Message-State: AOAM531wgrjxXzPD3u8KtzPtN8kCD3MFbaAoDTShWQBoB4fsYk1yOPuY
	lta1LQMsbnjyJj6T4o5aNK8Yqi8B
X-Google-Smtp-Source: ABdhPJznddPLdrEA/Q0lib2U19c0T1/OWKgy1is8zPlUhi/gIuXz+XKor8ixZx/7fFZlApmfn4oMDw==
X-Received: by 2002:a65:6810:: with SMTP id l16mr15419756pgt.390.1590941818269;
        Sun, 31 May 2020 09:16:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:57 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 28/35] safec: Update to latest on 3.5.1 release tags
Date: Sun, 31 May 2020 09:16:15 -0700
Message-Id: <3aad33709b055758a8f9e5e2c4ce8e0abc72a0b1.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

It build fine on mips now.
Musl patch is no longer needed and musl provides memrchr

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 257f67186c697fe5bba36bf86cc05a637e558ca4)
[AK: Bugfix only updates]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 -------------------
 .../safec/{safec_3.5.bb => safec_3.5.1.bb}    |  8 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
 rename meta-oe/recipes-core/safec/{safec_3.5.bb => safec_3.5.1.bb} (59%)

diff --git a/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch b/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
deleted file mode 100644
index 8f18f48720..0000000000
--- a/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 57456b5d034c8965b11eceed1bf861c98a18c324 Mon Sep 17 00:00:00 2001
-From: "jenkins@kwaj" <jenkins@kwaj>
-Date: Wed, 11 Sep 2019 13:43:45 -0700
-Subject: [PATCH] memrchr: Use _ISOC11_SOURCE only with glibc
-
-this is a glibc feature test macro which is not available
-on other libraries e.g. musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/extmem/memrchr_s.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/extmem/memrchr_s.c b/src/extmem/memrchr_s.c
-index 8d10a7b9..e73d3579 100644
---- a/src/extmem/memrchr_s.c
-+++ b/src/extmem/memrchr_s.c
-@@ -36,7 +36,7 @@
- #endif
- 
- #ifdef HAVE_MEMRCHR
--#ifndef _ISOC11_SOURCE
-+#if defined (__GLIBC__) && !defined(_ISOC11_SOURCE)
- extern void *memrchr(const void *, int, size_t);
- #endif
- #endif
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-core/safec/safec_3.5.bb b/meta-oe/recipes-core/safec/safec_3.5.1.bb
similarity index 59%
rename from meta-oe/recipes-core/safec/safec_3.5.bb
rename to meta-oe/recipes-core/safec/safec_3.5.1.bb
index 94cdb3a3c3..91d8fc65a0 100644
--- a/meta-oe/recipes-core/safec/safec_3.5.bb
+++ b/meta-oe/recipes-core/safec/safec_3.5.1.bb
@@ -7,14 +7,12 @@ SECTION = "lib"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "a99a052a56da409638c9fe7e096a5ae6661ca7cb"
+# v08112019
+SRCREV = "ad76c7b1dbd0403b0c9decf54164fcce271c590f"
 SRC_URI = "git://github.com/rurban/safeclib.git \
-           file://0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch \
 "
 
-CPPFLAGS_append_libc-musl = " -D_GNU_SOURCE"
-
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 
 PACKAGES =+ "${PN}-check"
 
-- 
2.17.1

