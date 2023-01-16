Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD647C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 06:18:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.160523.1673849884141529363
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 22:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ATcvd/JV;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v23so24407415plo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvkp7Y6uyRec4QCz5auq04rgpbBZgDda9MIgQOUEQeM=;
        b=ATcvd/JVjkSXxEgfEAnsZBOdZreZRowBfdRbKPqrfx+ZGyh0XPy/p904aG0jLzLVIW
         kRvlOcndZboreGLEdeMpMLf4amzxo/b6UslPVc2YcB3q6bdWNp0sKHBIq0KP8eNHG92n
         xxL0pbebDct60yKLzBIGtxbl+xrSl2dY9QCP5d+okMIMRZ+jxRIyC7LI1/24GQJlcDIS
         ctzrqga74XW+U0gQAuwswvM3kAI6SaGqCXkqSKbvCq1HSS0Gcibi6V8T7b0ZEzZrERCf
         RjQZ8clKVlhHmSJexBDkOl3aFAa9ITV8JZOnwTzcfUETgte532HVl4axVEAYEXUBd1G9
         1Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvkp7Y6uyRec4QCz5auq04rgpbBZgDda9MIgQOUEQeM=;
        b=W/Vr8KA5oAEfxztUG8SebntQuNeH41Epk+Cmshc2cOX4G1Qe3OE73JREth7mbN9t3K
         WkASdws8nJvckyHxjyCwX34caSSSTOPKReLR5wTzORLQRNYoDIZaAcVpRwIAMECLC2bx
         4FQQn6oI3UgMyXe2/ILPcoF5d6/gPnA5ztKRNiy5cRZ73b5oXFJz+Dmfp6W5hpNZRyE7
         a2ARGySbVqqz1EprtNhAgcyTdwoyRMrzZk7b5PVgd332hPV+RsS2TsLI3aG0UBTVD6ZN
         SGg24X0sQ2z7TeqzBYAE+5YvP6wXkwNbCfUgIZham7KAc3TQzzUyCBTHaZT82Sx1dr+B
         hfMQ==
X-Gm-Message-State: AFqh2krVrFtKD/khxfiF0vHtO8TE5yt2WGpfwop+yJUbpcn2mJCERSJ1
	2fhdzgGLasl7yB5SFFyq4V2nQBbykKr4kQ==
X-Google-Smtp-Source: AMrXdXt8cOe8pICAcQPoQHke68muWo9woS730IwxICglZdQfrplF7ySQ+wv5GfeA95tUKU1MVWKTIQ==
X-Received: by 2002:a17:902:ea0b:b0:194:7efa:ee8e with SMTP id s11-20020a170902ea0b00b001947efaee8emr10240361plg.42.1673849883177;
        Sun, 15 Jan 2023 22:18:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902daca00b00192d3e7eb8fsm18303187plx.252.2023.01.15.22.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 22:18:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dibbler: Fix build with c++17 and newer std
Date: Sun, 15 Jan 2023 22:18:00 -0800
Message-Id: <20230116061800.825795-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 06:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100579

Clang also warns about offsetof use to emulate _Alignof
register keyword is no longer available so pre-empt it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sing-_Alignof-when-using-C11-or-newe.patch | 125 ++++++++++++++++++
 .../0002-make-Do-not-enforce-c99.patch        |  50 +++++++
 .../dibbler/dibbler_git.bb                    |   4 +-
 3 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/0002-make-Do-not-enforce-c99.patch

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
new file mode 100644
index 0000000000..d48d7265d4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -0,0 +1,125 @@
+From 9e9d94566d39eef3e4606f806aa418bf5534fab9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 22:04:31 -0800
+Subject: [PATCH 1/2] Define alignof using _Alignof when using C11 or newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+alignof to use builtin "_Alignof" to avoid undefined behavior on
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
+may support C11, exclude those compilers too
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Misc/md5-coreutils.c | 12 +++++++++++-
+ Misc/sha1.c          | 12 +++++++++++-
+ Misc/sha256.c        | 12 +++++++++++-
+ Misc/sha512.c        | 12 +++++++++++-
+ 4 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/Misc/md5-coreutils.c b/Misc/md5-coreutils.c
+index d6503e02..2ffb6050 100644
+--- a/Misc/md5-coreutils.c
++++ b/Misc/md5-coreutils.c
+@@ -154,7 +154,17 @@ md5_process_bytes (const void *buffer, size_t len, struct md5_ctx *ctx)
+   if (len >= 64)
+     {
+ #if !_STRING_ARCH_unaligned
+-# define alignof(type) offsetof (struct { char c; type x; }, x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++        || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++     && !defined __clang__) \
++        || (defined __clang__ && __clang_major__ < 8))
++#    define alignof(type) offsetof (struct { char c; type x; }, x)
++# else
++#    define alignof(type) _Alignof(type)
++# endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
+       if (UNALIGNED_P (buffer))
+ 	while (len > 64)
+diff --git a/Misc/sha1.c b/Misc/sha1.c
+index 18ceb845..a170efe3 100644
+--- a/Misc/sha1.c
++++ b/Misc/sha1.c
+@@ -149,7 +149,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
+   if (len >= 64)
+     {
+ #if !_STRING_ARCH_unaligned
+-# define alignof(type) offsetof (struct { char c; type x; }, x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++        || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++     && !defined __clang__) \
++        || (defined __clang__ && __clang_major__ < 8))
++#    define alignof(type) offsetof (struct { char c; type x; }, x)
++# else
++#    define alignof(type) _Alignof(type)
++# endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
+       if (UNALIGNED_P (buffer))
+ 	while (len > 64)
+diff --git a/Misc/sha256.c b/Misc/sha256.c
+index 68292326..da59e81d 100644
+--- a/Misc/sha256.c
++++ b/Misc/sha256.c
+@@ -372,7 +372,17 @@ sha256_process_bytes (const void *buffer, size_t len, struct sha256_ctx *ctx)
+   if (len >= 64)
+     {
+ #if !_STRING_ARCH_unaligned
+-# define alignof(type) offsetof (struct { char c; type x; }, x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++        || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++     && !defined __clang__) \
++        || (defined __clang__ && __clang_major__ < 8))
++#    define alignof(type) offsetof (struct { char c; type x; }, x)
++# else
++#    define alignof(type) _Alignof(type)
++# endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
+       if (UNALIGNED_P (buffer))
+         while (len > 64)
+diff --git a/Misc/sha512.c b/Misc/sha512.c
+index db86c659..38e162fc 100644
+--- a/Misc/sha512.c
++++ b/Misc/sha512.c
+@@ -190,7 +190,17 @@ sha512_process_bytes (const void *buffer, size_t len, struct sha512_ctx *ctx)
+   if (len >= 128)
+     {
+ #if !_STRING_ARCH_unaligned
+-# define alignof(type) offsetof (struct { char c; type x; }, x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++        || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++     && !defined __clang__) \
++        || (defined __clang__ && __clang_major__ < 8))
++#    define alignof(type) offsetof (struct { char c; type x; }, x)
++# else
++#    define alignof(type) _Alignof(type)
++# endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (uint64_t) != 0)
+       if (UNALIGNED_P (buffer))
+ 	while (len > 128)
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0002-make-Do-not-enforce-c99.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0002-make-Do-not-enforce-c99.patch
new file mode 100644
index 0000000000..8889130a3b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/0002-make-Do-not-enforce-c99.patch
@@ -0,0 +1,50 @@
+From e826206c58bbaa1c256f55b103d5eb7b0182f152 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 22:05:53 -0800
+Subject: [PATCH 2/2] make: Do not enforce c99
+
+Latest gcc/clang from OE defaults to c11 or newer and stickly to c99
+means we can not use _AlignOf
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Misc/Makefile.am       | 4 +---
+ Port-linux/Makefile.am | 1 -
+ 2 files changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Misc/Makefile.am b/Misc/Makefile.am
+index d881525a..8d71d2d4 100644
+--- a/Misc/Makefile.am
++++ b/Misc/Makefile.am
+@@ -6,8 +6,6 @@ endif
+ 
+ noinst_LIBRARIES = libMisc.a
+ 
+-libMisc_a_CFLAGS = -std=c99
+-
+ libMisc_a_CPPFLAGS = -I$(top_srcdir)
+ 
+ libMisc_a_SOURCES = addrpack.c
+@@ -27,4 +25,4 @@ libMisc_a_SOURCES += lowlevel-posix.c
+ 
+ libMisc_a_SOURCES += hmac-sha-md5.h hmac-sha-md5.c
+ libMisc_a_SOURCES += md5-coreutils.c md5.h
+-libMisc_a_SOURCES += sha1.c sha1.h sha256.c sha256.h sha512.c sha512.h
+\ No newline at end of file
++libMisc_a_SOURCES += sha1.c sha1.h sha256.c sha256.h sha512.c sha512.h
+diff --git a/Port-linux/Makefile.am b/Port-linux/Makefile.am
+index 72b0a5e3..635998ea 100644
+--- a/Port-linux/Makefile.am
++++ b/Port-linux/Makefile.am
+@@ -1,6 +1,5 @@
+ noinst_LIBRARIES = libLowLevel.a
+ 
+-libLowLevel_a_CFLAGS = -std=c99
+ libLowLevel_a_CPPFLAGS = -I$(top_srcdir)/Misc
+ 
+ libLowLevel_a_SOURCES = daemon.cpp daemon.h ethtool-kernel.h ethtool-local.h interface.c interface.h ip_common.h iproute.c libnetlink.c libnetlink.h ll_map.c ll_map.h ll_types.c lowlevel-linux.c lowlevel-linux-link-state.c lowlevel-options-linux.c rtm_map.h rt_names.h utils.c utils.h
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index f57767e9b8..34f8a7e3e5 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -10,6 +10,8 @@ SRCREV = "a7c6cf58a88a510cb00841351e75030ce78d36bf"
 SRC_URI = "git://github.com/tomaszmrugalski/dibbler;branch=master;protocol=https \
            file://dibbler_fix_getSize_crash.patch \
            file://0001-port-linux-Re-order-header-includes.patch \
+           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
+           file://0002-make-Do-not-enforce-c99.patch \
            "
 PV = "1.0.1+1.0.2RC1+git${SRCREV}"
 
@@ -30,7 +32,7 @@ inherit autotools
 
 DEPENDS += "flex-native"
 
-CFLAGS += "-D_GNU_SOURCE"
+CPPFLAGS += "-D_GNU_SOURCE -Dregister=''"
 LDFLAGS += "-pthread"
 
 PACKAGES =+ "${PN}-requestor ${PN}-client ${PN}-relay ${PN}-server"
-- 
2.39.0


