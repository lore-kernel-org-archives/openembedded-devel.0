Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E55C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:39:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.34066.1715927980574548069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 23:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PkxrWi/U;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b2b42b5126so868725a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 23:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715927980; x=1716532780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucAqbrauCDiZ/Jxq3n06Tq9mrkwcBevk2w6Bzw+MGzw=;
        b=PkxrWi/UHJurXNvussw326zkcfty/GdPwVz3W+RG/l+TqeH3J4BZTOLnLdlHThWr+h
         AZKrSUOKpfD9F2mzRm8ULpDF4kl35x85oigg7baFnV26DVROxiy+arx5fcpM61hpd6N7
         setMREEYqNNcqMeoxre8kbN3oHO7G7+5NcN7zdhgYSI4qM3Awq/4dvw3rSXVkM882kKb
         NVBfImhkd9bSZ3N3JfLyJnwL7O4Rttwo7haNmz1tqwdKejTz9jYPncViJXu2WPaIGe6n
         hgNhDzgbZiTqJAvJUHk9YknaUJ9QLpy94eqLaPQeDM4pnxMnu36j9CF7exUIJHpmDgQF
         Ifgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715927980; x=1716532780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucAqbrauCDiZ/Jxq3n06Tq9mrkwcBevk2w6Bzw+MGzw=;
        b=t5JP+QAGzf+0e/bq7Qg9z1d03FfQP+iDHD+KSV+0ZSaYuehahvAXY10j3WxKqK23wY
         /C0JwAAOJLgSgwwLieeSYPYngvygmhga7nLtBFj+77OfBxSlXbdgQHch8jGhA08OIYZq
         lyyF/DjDw0GxbuMRGZUhbSRu6tjQ8aLltaIHAaseSULG30vlMbvuEgTcoE0CJArs/aIM
         Gjp7jyl5/tYjGYIUOr19sVArta956zJRmN6qQ0YoH4TIoX/3LmKZjgYovrXNyMaKa3YZ
         crZ8JFAiNq3ZbJIjEm9s/MncmB47HtPSjCI9MlDAHk8UO4ee0t6i7O/hVBk9Bdz4snNQ
         3XTw==
X-Gm-Message-State: AOJu0YymH0c4TdaPdJ/awgjDb9kpZ9xLvlC3GgpRwiTlt4dGd65W+LLn
	/DF+8doC2UI4M35URIdhjF+zsreIereSVcHHFEEyF8FBHWAAJyaggzKr7O+NgEU=
X-Google-Smtp-Source: AGHT+IEZagfIU5oSVf5eFOWkS+/wugZ7752mV67eXVJ+rqQi5jvEE8QZVreyRybgLzBIYncuHRGMKw==
X-Received: by 2002:a17:90a:5318:b0:2a5:8ff:9d1 with SMTP id 98e67ed59e1d1-2b6cc4547efmr20226229a91.14.1715927979716;
        Thu, 16 May 2024 23:39:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e372])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b669sm16622575a91.24.2024.05.16.23.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 23:39:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] xterm: Upgrade to 391
Date: Thu, 16 May 2024 23:39:34 -0700
Message-ID: <20240517063934.753527-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517063934.753527-1-raj.khem@gmail.com>
References: <20240517063934.753527-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110422

Add a patch to fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-configure-time-check-for-setsid.patch | 75 -------------------
 ...ude-missing-pty.h-header-for-openpty.patch | 35 +++++++++
 .../xorg-app/{xterm_388.bb => xterm_391.bb}   |  7 +-
 3 files changed, 38 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
 rename meta-oe/recipes-graphics/xorg-app/{xterm_388.bb => xterm_391.bb} (85%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
deleted file mode 100644
index a6cf16e4e9..0000000000
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From b23d38f1216c4d70738edaa367cf9ecd2dd4b660 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Dec 2019 12:59:26 -0800
-Subject: [PATCH] Add configure time check for setsid
-
-Do not assume glibc == linux
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure    | 1 +
- configure.in | 1 +
- main.c       | 4 ++--
- xtermcfg.hin | 1 +
- 4 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 72342c7..c2ec2ac 100755
---- a/configure
-+++ b/configure
-@@ -5803,6 +5803,7 @@ for ac_func in \
- 	unsetenv \
- 	sched_yield \
- 	setpgid \
-+	setsid \
- 	strftime \
- 	tcgetattr \
- 	waitpid \
-diff --git a/configure.in b/configure.in
-index 56dbc25..0608c80 100644
---- a/configure.in
-+++ b/configure.in
-@@ -99,6 +99,7 @@ AC_CHECK_FUNCS( \
- 	unsetenv \
- 	sched_yield \
- 	setpgid \
-+	setsid \
- 	strftime \
- 	tcgetattr \
- 	waitpid \
-diff --git a/main.c b/main.c
-index 24da0eb..332174c 100644
---- a/main.c
-+++ b/main.c
-@@ -2956,7 +2956,7 @@ main(int argc, char *argv[]ENVP_ARG)
-     }
- }
- 
--#if defined(__osf__) || (defined(__GLIBC__) && !defined(USE_USG_PTYS)) || defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
-+#if defined(__osf__) || (defined(__linux__) && !defined(USE_USG_PTYS)) || defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
- #define USE_OPENPTY 1
- static int opened_tty = -1;
- #endif
-@@ -4205,7 +4205,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
- 	    /*
- 	     * now in child process
- 	     */
--#if defined(_POSIX_SOURCE) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
-+#if HAVE_SETSID
- 	    int pgrp = setsid();	/* variable may not be used... */
- #else
- 	    int pgrp = getpid();
-diff --git a/xtermcfg.hin b/xtermcfg.hin
-index 19048cd..e54d2cd 100644
---- a/xtermcfg.hin
-+++ b/xtermcfg.hin
-@@ -98,6 +98,7 @@
- #undef HAVE_SCHED_YIELD		/* AC_CHECK_FUNCS(sched_yield) */
- #undef HAVE_SETITIMER		/* CF_SETITIMER */
- #undef HAVE_SETPGID		/* AC_CHECK_FUNCS(setpgid) */
-+#undef HAVE_SETSID		/* AC_CHECK_FUNCS(setsid) */
- #undef HAVE_STDINT_H		/* AC_PROG_CC_STDC */
- #undef HAVE_STDLIB_H		/* AC_CHECK_HEADERS(stdlib.h) */
- #undef HAVE_STDNORETURN_H	/* CF_C11_NORETURN */
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
new file mode 100644
index 0000000000..56c317200d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
@@ -0,0 +1,35 @@
+From e30ab2d73a21bc55511cbedbb9ae603246dbfcd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 May 2024 23:10:00 -0700
+Subject: [PATCH] include missing pty.h header for openpty()
+
+On musl this problem is unearthed
+
+Fix
+./main.c: In function 'get_pty':
+./main.c:3123:14: error: implicit declaration of function 'openpty'; did you mean 'openat'? [-Wimplicit-function-declaration]
+ 3123 |     result = openpty(pty, &opened_tty, ttydev, NULL, NULL);
+      |              ^~~~~~~
+      |              openat
+
+Upstream-Status: Submitted [sent to dickey@invisible-island.net]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/main.c b/main.c
+index 7165938..04a2aa2 100644
+--- a/main.c
++++ b/main.c
+@@ -92,6 +92,7 @@
+ #include <xterm.h>
+ #include <version.h>
+ #include <graphics.h>
++#include <pty.h>
+ /* xterm uses these X Toolkit resource names, which are exported in array */
+ #undef XtNborderWidth
+ #undef XtNiconName
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_388.bb b/meta-oe/recipes-graphics/xorg-app/xterm_391.bb
similarity index 85%
rename from meta-oe/recipes-graphics/xorg-app/xterm_388.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_391.bb
index 8578f0cc97..633d025eea 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_388.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_391.bb
@@ -2,13 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=9c96124b492c0c02356850c243aaeca2"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=1a3032aa728f8fda9d686948940ca58d"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
-           file://0001-Add-configure-time-check-for-setsid.patch \
+           file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-
-SRC_URI[sha256sum] = "ac429345e6f937a5945a89d425a265fee6c215fc669dbdc6a0326e21f4c5f674"
+SRC_URI[sha256sum] = "6091371e94de867ce186cc1bc306947b0482d71631847fdeab7982acb20ae6b8"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.45.1


