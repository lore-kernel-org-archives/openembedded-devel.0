Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE65FC25B74
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 00:57:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2336.1715302655310051997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 17:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DM9gDL13;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3ca546d40so12628765ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 17:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715302654; x=1715907454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ8YnLoWs3288cG0Fv/JqOBQk1Bd3MiPgJnn076ZgRQ=;
        b=DM9gDL13R3i5wlPP5sqMneDK7E3nRJ9XubdmUsbmqDxfUz5VEx/W4pNf4hi5Btv/fn
         wwjQyl4K22iA8rz1Dg0UqNTUO87afsm3yOgwqbpDMPitwYes2/m/tbRYzjr4J9KCCiiR
         Gqxp5ldBH6H+4cnykJeKWDAG+Z5lfvLF+95NpAdeHwvMP0BRFaBGlK1aEVi27MIBoX6y
         uAuRW6OIxKcQWpkWxBK0yU3+Ne2JO0ywEKWx4fgFgWqD7EuRNKGCYbiu+EpVtzmQsR/y
         VmhpBFcfvrGYVDo+8PSHRDMKF85NXV4zJHhgrVRPr8xsAOn7qbT43qtK3f2Mf4TB70qS
         clog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715302654; x=1715907454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ8YnLoWs3288cG0Fv/JqOBQk1Bd3MiPgJnn076ZgRQ=;
        b=f12QvjDSTd8iqI0EdsLYsirfBKUFkxsE4XlWZCITJx3aKAtk63PnMWEJcqN6Nl+Vn7
         aj5haqJuHpR6em3y61mXL5WxDVcgUPUIl5mVxqtL3LIHigHzCWVjieLXWJAAJhYHQHIU
         siEp+B1ID09rgzHFq3bg+2eZ9TiXSeNxqvP2B/wDw2y4jdIXl8zoFK1Y5lU2rcSNMiu+
         ARfG4aIalveXzmutFoVu7glXKIyyXotvOsZnCxTlQML9j44hMd+k6M5dSRQ2Pk3NCWuz
         OlXK+LEtcJYw3O6f0snAPJ1BlFcLHK3nN7d2F3qDbNvQ9vqv9IlgaQ/olcTFh3bkyA7K
         6pcA==
X-Gm-Message-State: AOJu0YxbcT+BuaUR0I+pPHYu5XlQ8awWOB/W03JW5irRrms7GGkBvsnX
	Yf+dkj0q1qw4pTP+C/uyFTikPc2MFXoq03VqVr4dl0tq2IAEbEeZ5lfDyH9XVVo=
X-Google-Smtp-Source: AGHT+IFkkjMhQstf/YBOCFYUlbYXMsWGHcARICvjjXcLXlqiGHzMYqJYZofzuJvKiBikjCLom+Feww==
X-Received: by 2002:a17:902:6ac1:b0:1e2:7dc7:477 with SMTP id d9443c01a7336-1ef440583dbmr11503255ad.57.1715302654198;
        Thu, 09 May 2024 17:57:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13823asm20508605ad.263.2024.05.09.17.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 17:57:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] fvwm: Fix build with gcc-14
Date: Thu,  9 May 2024 17:57:28 -0700
Message-ID: <20240510005731.2074507-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 00:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110300

Fixes for C99 compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-require-support-for-implicit-ints.patch | 45 +++++++++++++++++++
 ...-missing-unistd.h-to-AM_SAFETY_CHECK.patch | 32 +++++++++++++
 ...gure-Further-defang-the-Werror-check.patch | 35 +++++++++++++++
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb   |  3 ++
 4 files changed, 115 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0001-configure-Do-not-require-support-for-implicit-ints.patch
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0002-acinclude.m4-Add-missing-unistd.h-to-AM_SAFETY_CHECK.patch
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0003-configure-Further-defang-the-Werror-check.patch

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-configure-Do-not-require-support-for-implicit-ints.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-configure-Do-not-require-support-for-implicit-ints.patch
new file mode 100644
index 0000000000..356bd73f88
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-configure-Do-not-require-support-for-implicit-ints.patch
@@ -0,0 +1,45 @@
+From cbba378a23410241176d62f3bb43965c044615e3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 24 Nov 2022 13:06:50 +0100
+Subject: [PATCH 1/3] configure: Do not require support for implicit ints
+
+Implicit ints  have not been part of C since 1999, and future
+compilers will disable support for them by default.  Fortunatenly,
+only one configure check needs adjusting.
+
+Upstream-Status: Submitted [https://github.com/fvwmorg/fvwm/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 8b74ff1e..b66042f9 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -30,7 +30,7 @@ if test "$ac_cv_func_select" = yes; then
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif],
+-[extern select ($ac_cv_type_fd_set_size_t,
++[extern int select ($ac_cv_type_fd_set_size_t,
+  $ac_cv_type_fd_set *,	$ac_cv_type_fd_set *, $ac_cv_type_fd_set *,
+  $ac_type_timeval *);],
+ [ac_found=yes ; break 3],ac_found=no)
+diff --git a/configure.ac b/configure.ac
+index 97ab9e7a..c9fcede6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -220,7 +220,7 @@ AC_MINIX
+ 
+ # catch -Werror and similar options when running configure
+ AC_TRY_COMPILE([#include <stdio.h>],
+-[int i; static j; int *p; char *c;
++[int i; int *p; char *c;
+   switch (*p = p = *c) { case 0: printf("%Q", c, p); }
+   *c = &i; c = p;
+   while (1 || (unsigned int)3 >= 0 || ((int)-1) == ((unsigned int)1));
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0002-acinclude.m4-Add-missing-unistd.h-to-AM_SAFETY_CHECK.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0002-acinclude.m4-Add-missing-unistd.h-to-AM_SAFETY_CHECK.patch
new file mode 100644
index 0000000000..50ecb20c72
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0002-acinclude.m4-Add-missing-unistd.h-to-AM_SAFETY_CHECK.patch
@@ -0,0 +1,32 @@
+From 51287fb60263530f61b14df5519e10dabe67d2ad Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 24 Nov 2022 13:07:56 +0100
+Subject: [PATCH 2/3] acinclude.m4: Add missing <unistd.h> to
+ AM_SAFETY_CHECK_MKSTEMP
+
+Otherwise, the check fails on a compiler which does not support
+implicit function declarations (a language feature removed in 1999).
+
+Upstream-Status: Submitted [https://github.com/fvwmorg/fvwm/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index b66042f9..4dee2abe 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1154,6 +1154,9 @@ AC_DEFUN([AM_SAFETY_CHECK_MKSTEMP],[
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#ifdef HAVE_UNISTD_H
++#include <unistd.h>
++#endif
+ int main(void)
+ {
+   char template[128];
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0003-configure-Further-defang-the-Werror-check.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0003-configure-Further-defang-the-Werror-check.patch
new file mode 100644
index 0000000000..e9d780ddc6
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0003-configure-Further-defang-the-Werror-check.patch
@@ -0,0 +1,35 @@
+From 542c6f25327587d5a6bffb8a45b457ec85dcf8e1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 19 Dec 2023 13:24:50 +0100
+Subject: [PATCH 3/3] configure: Further defang the -Werror check
+
+Incompatible pointer types are actually errors (in the sense
+that they are invalid C).  Compilers have merely tolerated them as
+warnings for backwards compatibility.  This is changing with Clang 16
+and GCC 14, so relax the check a little.
+
+Upstream-Status: Submitted [https://github.com/fvwmorg/fvwm/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c9fcede6..2e9615b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -220,9 +220,8 @@ AC_MINIX
+ 
+ # catch -Werror and similar options when running configure
+ AC_TRY_COMPILE([#include <stdio.h>],
+-[int i; int *p; char *c;
+-  switch (*p = p = *c) { case 0: printf("%Q", c, p); }
+-  *c = &i; c = p;
++[int unused; int *p; char *c;
++  printf("%Q", c, p);
+   while (1 || (unsigned int)3 >= 0 || ((int)-1) == ((unsigned int)1));
+ ], , AC_MSG_ERROR("
+ configure is not able to compile programs with warnings.  Please
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index 8daf38a0ba..df349494aa 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -34,6 +34,9 @@ DEPENDS = " \
 SRC_URI = " \
     git://github.com/fvwmorg/fvwm.git;protocol=https;branch=master \
     file://0001-Fix-compilation-for-disabled-gnome.patch \
+    file://0001-configure-Do-not-require-support-for-implicit-ints.patch \
+    file://0002-acinclude.m4-Add-missing-unistd.h-to-AM_SAFETY_CHECK.patch \
+    file://0003-configure-Further-defang-the-Werror-check.patch \
 "
 
 SRCREV = "7baf540e56fb1a3e91752acba872a88543529d46"
-- 
2.45.0


