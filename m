Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5FCC4167B
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 21:08:01 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.6167.1671397674195986794
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 13:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UVH4iweF;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id v23so1998317pju.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 13:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKECqfwmpCxd15IJEmxX4EURwfYFSZ312JouupCk0/Q=;
        b=UVH4iweFCtfe2eV7pfAMAx8cT/tyZ1tMC3aKRdeqT0G+8yRRo1qbs6Jb6mOqu9TxIi
         0szoub9dDfY4fVahE8SGgtLGGufaXEurttDWJ0v3ygrkpR7+G7Gor0SdnBh+AKEFPRWl
         TMgAuYiMTupoB3I0u69DowcMBYQnJi+H3wNVdtDkgX+x00atLfyue7b3Bnpu98WoUoFh
         0XMz+j1cwWAfwppuVSe3QSpX1GjbYFKNYkKYjOVFEnLo5/5T+WhxIAObPrMLcmpXW74G
         MZ81+fj95Mjlc0OhuUhTVmyfbrbhL4w1kMMD9i8FhKfVkFHGCFmsAS09oxqxaROI20DH
         jkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKECqfwmpCxd15IJEmxX4EURwfYFSZ312JouupCk0/Q=;
        b=FhkiWcSXAPCWRVSCIdjTdmmy6ztp5NvG3PESpKWhRnAVXx70lSt4EbP0ufvvrmZw0C
         pj9dfBroPMCC7f3YzivxA5P3nDGvOIZlVpp9GEBw6qT8mJgwx9qUe/JQ2842MHENNtHz
         MjdfxBl2C2gzOmcAfOtgbs2uhBjYYwxCDtIMfkccxaN8yiL4qz3Bd+AxXAdT1OuoQTR2
         aUxy+XM+Jd1Yrc1YMhIwWnVNheu+zBdvcrB4LVROpcCY7H724rMa80gyp471W/gtXCJ9
         CzJVxCE8quxk02/19/bH0HcONuwaPFMBP87Amxk939tikIX9Rd3V0pGoi2Hx84ZtkfT0
         UKjw==
X-Gm-Message-State: AFqh2kqX18JyE3HAE+KPpUSjjpi51SHLTjbp4s/+ryW2NbRzYFOsovrX
	i+dGmSr4LSCxfPIQqOIeL8tQkR73rVo=
X-Google-Smtp-Source: AMrXdXtOMu26NlTl29ZeBkmj7hmFr1cD6HBmABhhOvLNyMiyku/tWcZI9BnH+emeoqp9pH7duFiYmg==
X-Received: by 2002:a05:6a20:e616:b0:ae:47a6:e6d9 with SMTP id my22-20020a056a20e61600b000ae47a6e6d9mr8788119pzb.6.1671397673389;
        Sun, 18 Dec 2022 13:07:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id e64-20020a621e43000000b005770fd365d8sm5120928pfe.97.2022.12.18.13.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 13:07:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] nspr: Upgrade to 4.35
Date: Sun, 18 Dec 2022 13:07:48 -0800
Message-Id: <20221218210748.225122-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221218210748.225122-1-raj.khem@gmail.com>
References: <20221218210748.225122-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 21:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100088

Use -D_PR_HAVE_LARGE_OFF_T instead of -D_PR_HAVE_OFF64_T on musl
Drop remove-srcdir-from-configure-in.patch its fixed upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nspr/0001-md-Fix-build-with-musl.patch    | 17 +++-----
 .../nspr/nspr/0002-Add-nios2-support.patch    | 39 +++++++------------
 .../remove-srcdir-from-configure-in.patch     | 19 ---------
 .../nspr/{nspr_4.29.bb => nspr_4.35.bb}       |  8 ++--
 4 files changed, 21 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 rename meta-oe/recipes-support/nspr/{nspr_4.29.bb => nspr_4.35.bb} (93%)

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
index d2b9bf6420..09855a03dc 100644
--- a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 147f3c2acbd96d44025cec11800ded0282327764 Mon Sep 17 00:00:00 2001
+From 5f6fcaeb0b7a319c8afd32ddb48b3515b63a6c0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Sep 2017 17:22:43 -0700
 Subject: [PATCH] md: Fix build with musl
@@ -6,24 +6,17 @@ Subject: [PATCH] md: Fix build with musl
 The MIPS specific header <sgidefs.h> is not provided by musl
 linux kernel headers provide <asm/sgidefs.h> which has same definitions
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
  pr/include/md/_linux.cfg | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index aa3af78..899826f 100644
 --- a/pr/include/md/_linux.cfg
 +++ b/pr/include/md/_linux.cfg
-@@ -499,7 +499,7 @@
- #elif defined(__mips__)
- 
- /* For _ABI64 */
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- 
- #ifdef __MIPSEB__
- #define IS_BIG_ENDIAN 1
 @@ -511,7 +511,7 @@
  #error "Unknown MIPS endianness."
  #endif
diff --git a/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
index 3a04d426a8..dab2a4e291 100644
--- a/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
@@ -1,4 +1,4 @@
-From 95bda64fb4cf1825fea745e918cfe8202843f0ba Mon Sep 17 00:00:00 2001
+From 4760065a58153e4dae24e4e437a5136592c624bc Mon Sep 17 00:00:00 2001
 From: Marek Vasut <marex@denx.de>
 Date: Sat, 30 Jan 2016 07:18:02 +0100
 Subject: [PATCH] Add nios2 support
@@ -7,15 +7,14 @@ Add support for the nios2 CPU.
 
 Signed-off-by: Marek Vasut <marex@denx.de>
 Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1244421 ]
+
 ---
- nspr/pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++++++++++
- nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
- 2 files changed, 59 insertions(+)
+ pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.h   |  4 +++-
+ 2 files changed, 48 insertions(+), 1 deletion(-)
 
-Index: nspr/pr/include/md/_linux.cfg
-===================================================================
---- nspr.orig/pr/include/md/_linux.cfg
-+++ nspr/pr/include/md/_linux.cfg
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
 @@ -975,6 +975,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
@@ -68,10 +67,8 @@ Index: nspr/pr/include/md/_linux.cfg
  #elif defined(__or1k__)
  
  #undef  IS_LITTLE_ENDIAN
-Index: nspr/pr/include/md/_linux.h
-===================================================================
---- nspr.orig/pr/include/md/_linux.h
-+++ nspr/pr/include/md/_linux.h
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
 @@ -55,6 +55,8 @@
  #define _PR_SI_ARCHITECTURE "avr32"
  #elif defined(__m32r__)
@@ -81,22 +78,12 @@ Index: nspr/pr/include/md/_linux.h
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
  #elif defined(__riscv) && (__riscv_xlen == 32)
-@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
+@@ -143,7 +145,7 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
  #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
  #endif
  
-+#if defined(__nios2__)
-+#if defined(__GNUC__)
-+/* Use GCC built-in functions */
-+#define _PR_HAVE_ATOMIC_OPS
-+#define _MD_INIT_ATOMIC()
-+#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
-+#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
-+#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
-+#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
-+#endif
-+#endif
-+
- #if defined(__or1k__)
+-#if defined(__loongarch__)
++#if defined(__loongarch__) || defined(__nios2__)
  #if defined(__GNUC__)
  /* Use GCC built-in functions */
+ #define _PR_HAVE_ATOMIC_OPS
diff --git a/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch b/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
deleted file mode 100644
index bde715c5dc..0000000000
--- a/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-the $srcdir is not defined at the time of gnu-configurize.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: nspr/configure.in
-===================================================================
---- nspr.orig/configure.in
-+++ nspr/configure.in
-@@ -8,7 +8,7 @@ AC_PREREQ(2.61)
- AC_INIT
- AC_CONFIG_SRCDIR([pr/include/nspr.h])
- 
--AC_CONFIG_AUX_DIR(${srcdir}/build/autoconf)
-+AC_CONFIG_AUX_DIR(build/autoconf)
- AC_CANONICAL_TARGET
- 
- dnl ========================================================
diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.35.bb
similarity index 93%
rename from meta-oe/recipes-support/nspr/nspr_4.29.bb
rename to meta-oe/recipes-support/nspr/nspr_4.35.bb
index 92c5234c34..c8cb618bc9 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.35.bb
@@ -8,24 +8,22 @@ SECTION = "libs/network"
 SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
-           file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
            file://nspr.pc.in \
-"
+           "
 
 CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
-                                          -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
+                                          -D_PR_HAVE_LARGE_OFF_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
                                           -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
                                           -D_PR_INET6_PROBE -DNO_DLOPEN_NULL'"
 
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "a546926d3c8e887be02c668c1293da92"
-SRC_URI[sha256sum] = "22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582"
+SRC_URI[sha256sum] = "7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.39.0


