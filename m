Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E85DCD98D8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87395.1781338742181661794
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X/ktQLbA;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c3543590so12226665ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338741; x=1781943541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9ps80IJ1RrcucvZRYddPyXc5lkBbYgGAIWUu7PRKVM=;
        b=X/ktQLbA4hFH5veDV2P0lRqfHJccIPUB1r+ECN3TxAgwEneGIGA0LzgVCgN/wzoJU+
         y0mDGfzbPAMuH5QWHx6At2zL0QVrbnLDzQtBS9c07U7ZXs/S5JjJCi62wOmhnUY3hqKa
         TykndWdLja+zMdtVubgs7ohZEvAxsmTOEOZ9bOTDHnjyrn3Sgd6oH4BkXEBGOZ4y4hMy
         GuPg8oqjXXAcdaUxqQBb/qroRUC4Md859xdQs+0keBkKtBaT+ISWBYQjwmAUNY9FQqVf
         F0CUXBD8aGE3cVe961AJkd022KJii89GxeEA5rjf4k+CZFlANUivFfgbr26agBgjlb9/
         NQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338741; x=1781943541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9ps80IJ1RrcucvZRYddPyXc5lkBbYgGAIWUu7PRKVM=;
        b=egWwLELt+AKh1maEkiWeGzDgyEGfBk5aJErEE89Zga379GRw7iMvxGwQrBaLwwmb2S
         I64vCm/au/JoUZSIQoLKrcc96HVsvLlorEUAwnqObIXGhm0n2eHwPuKIY2HHST2fMEs3
         3NqmTph1hO2KwPfnSS2hG9SX+b3uxGEZDZJAtfFYUIXy+wKXvYku2dNykdAPCFDPhx8L
         cLkj3hGfJ0AqiXpa5vt5hLigzkY5UHZLnkE0jkfXLGGlMByfUtja7s31VW84KmBaDA5u
         V7kbbKJv3l9UVmgQx5set8oRunzINH1NfjNotBgSSwhsJaXFhipmEpGZXblBfSJHpy5n
         3Vyw==
X-Gm-Message-State: AOJu0YzCoBEOKXN3YPA9F5aPDUEB9DQCp41HHeEBrlh26/sc+tTY6+29
	uF6QoDi1W8d3azwRJiXWuqvd44fV59ChKjepMm58+se6D4oOJzvSr7X7l2R0gPqY
X-Gm-Gg: Acq92OFwdRTI7CS8QM1yb4+DyJz/VUms5EhrxYaGFPjAY8oTgxt7HbfC8EnY98ULzcz
	6kscgfIC68aftAylC026gYCqFk8GcMTmGT4+M/s1VcBYjciFuYFBKKkt1jkVwVttA2RU6yj8Fc6
	zlEh3aXsy5DBPpY5Gz0oiTJDrAwJaZxnbRnBMIBecBYMq6m9dOWw5GcazXtf7eQ6rmOkUcgLbFl
	trfNRcf9jByLm2MMDTTsYQzzp70DBRtSsWozggug50mdP7VLImmXL9a3/Qen02IWhTKgE9KpIIW
	H9aR6cRy75/9hGnwsfk5aBDhBLafCTbWd6bmV8sUe9BG/AgV3uBG2NDjSE4nHdvrSEB++sQSoNs
	WpwA6enW+WfntouTathL/un5JdiIsTpWZJhfao+K+daRhRwgT0oA0lI1pHwgwCYK0AfwBL9pgS2
	el7kSwU2P8NxkrKcqkxPyUkTBN7bKkPVe/UwZt
X-Received: by 2002:a17:903:1a88:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c4141a7f51mr72490355ad.36.1781338741520;
        Sat, 13 Jun 2026 01:19:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 10/16] postfix: upgrade 3.10.9 -> 3.10.10
Date: Sat, 13 Jun 2026 20:18:18 +1200
Message-ID: <20260613081824.1223609-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127562

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped 0001-Fix-build-with-musl.patch which is part of upstream
version.

Release Notes:
https://www.postfix.org/announcements/postfix-3.11.3.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/0001-Fix-build-with-musl.patch      | 50 -------------------
 .../{postfix_3.10.9.bb => postfix_3.10.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb => postfix_3.10.10.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
deleted file mode 100644
index d09418eaac..0000000000
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cbe5ba0deeba6329eed63eade06bb8c062d0d445 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 8 May 2026 22:39:54 +0800
-Subject: [PATCH] Fix build with musl
-
-Guard glibc-specific version check with __GLIBC__ macro. When building
-with musl, __GLIBC__ is not defined, so the preprocessor previously fell
-through to the #else branch and defined NO_SNPRINTF, causing a build
-error:
-
-vbuf_print.c: In function 'vbuf_print':
-vbuf_print.c:208:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
-  208 |                     VSTRING_ADDNUM(fmt, width);
-      |                                              ^
-vbuf_print.c:126:9: note: macro 'VBUF_SNPRINTF' defined here
-  126 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
-      |         ^~~~~~~~~~~~~
-
-Wrap the entire block in #ifdef __GLIBC__ so that neither branch
-is entered on musl.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/util/sys_defs.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
-index 74319f2..6d3c7d2 100644
---- a/src/util/sys_defs.h
-+++ b/src/util/sys_defs.h
-@@ -794,12 +794,14 @@ extern int initgroups(const char *, int);
- #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
- #define NATIVE_COMMAND_DIR "/usr/sbin"
- #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
-+#ifdef __GLIBC__
- #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
- #define SOCKADDR_SIZE	socklen_t
- #define SOCKOPT_SIZE	socklen_t
- #else
- #define NO_SNPRINTF
- #endif
-+#endif
- #ifndef NO_IPV6
- #define HAS_IPV6
- #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 4)
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb
index 633e4a7a0d..5a9d77720e 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb
@@ -27,10 +27,9 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
-           file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
+SRC_URI[sha256sum] = "3b7197e00a98f7fe4624cf51a00ad805674256eff624e678529ccfbf2c7707a4"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

