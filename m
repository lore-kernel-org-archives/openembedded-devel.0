Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD1FC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 17:07:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.733.1692896852570942250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 10:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gUmSGLsk;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4184160a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692896851; x=1693501651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5wXvXaTvHn5FjyMh+Dqo5r2dMdR8AEblK6tlv70d78=;
        b=gUmSGLsknXGa702/EQTFYFMa/ZorElrndwSaBIwhdni+cHbzWn/Pg6iK/IzWwTh3xj
         0tJ/HMT0EI58yThVbMC1debcuY0lyOKoXu5JCGmVFiDc9Y41X+QPj6J4d44b4z4yrDy+
         VKiqUgmv438hMW+LPnlHeUY2GZQsVw8aMiLf+a0axhISxVnCmxFK+MCh5YoGNnn42FDN
         9ZJPQvI7rFRSK4qAHE4edRaDhBtypObtKXfNFYQb0giQwn7MK+qq7aBy5N+jpMrmFxjk
         m8xeVRd03d888eijKv9OkyIHTWxiGpIAkQBv6XjSguc1y8DExiyrdWMZbzDygZGkjCs/
         ceug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692896851; x=1693501651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5wXvXaTvHn5FjyMh+Dqo5r2dMdR8AEblK6tlv70d78=;
        b=TJ1fHZ5eVR724V3aeVf2PuI182rqiEgAy851fU/rpsxCJlADAmPX99uKTEOBI7FCGB
         93kNUkKtwJVF1kRaUdMfPDlksh9fS2YKPqGac44FRjfaY5yfhb7KxEKf/W/BqY5vyiMA
         uyCTibm2581zEfT4OOWLJE+w7wj+XkWh5QWSCr0DknP1BPgm2yyYd6pRyKgGOsgA+gme
         1xXl9m+CPfKZXedoRsblLUAoaX6zmRPS+DbWBSoMVHN2kmhJ3EYHP1xi1JNQiruSgm5v
         WyE0YoC1vp/xQ2Qz2HUqLn/spUdRxYDSm1chFjlJuzzsxYAS+5tfwSP0n+22o1C27I4L
         KoTg==
X-Gm-Message-State: AOJu0Yxo0lFjV/mpaLSFJxRhB28gKmoYp3WJZnk8s36GbWZ1+z100OmC
	0XdvlJVM2vujVPxvcfjxzQWfD3ZveMoVrw==
X-Google-Smtp-Source: AGHT+IF/Se3kiDgbj0KBMotXtCvMkvMdsRPbtrJJDM0G3+QfZnBqt0YEMs+zWJ2CitmA1bQ1bGnpXQ==
X-Received: by 2002:a17:90b:30d8:b0:26f:b158:ef2b with SMTP id hi24-20020a17090b30d800b0026fb158ef2bmr5631380pjb.23.1692896851492;
        Thu, 24 Aug 2023 10:07:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090ae38400b0026971450601sm1842183pjz.7.2023.08.24.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 10:07:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libfaketime: Fix build with clang
Date: Thu, 24 Aug 2023 10:07:28 -0700
Message-ID: <20230824170728.2495629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104590

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Makefile-Detect-compiler-in-makefile.patch | 45 +++++++++++++++++++
 .../libfaketime/libfaketime_0.9.10.bb         |  7 +--
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime/0001-Makefile-Detect-compiler-in-makefile.patch

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Makefile-Detect-compiler-in-makefile.patch b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Makefile-Detect-compiler-in-makefile.patch
new file mode 100644
index 0000000000..ff04837652
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Makefile-Detect-compiler-in-makefile.patch
@@ -0,0 +1,45 @@
+From 735bb5d053efad274aa4ea5a6682e656ff792909 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Aug 2023 01:49:48 -0700
+Subject: [PATCH] Makefile: Detect compiler in makefile
+
+Add compiler specific options based on detected compiler gcc/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 62e924c..c15eb33 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -110,7 +110,23 @@ PREFIX ?= /usr/local
+ LIBDIRNAME ?= /lib/faketime
+ PLATFORM ?=$(shell uname)
+ 
+-CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare -DFAKE_PTHREAD -DFAKE_STAT -DFAKE_UTIME -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"' $(FAKETIME_COMPILE_CFLAGS)
++ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
++COMPILER := clang
++else
++COMPILER := gcc
++endif
++export COMPILER
++
++CFLAGS += -std=gnu99 -Wall -Wextra -Werror -DFAKE_PTHREAD -DFAKE_STAT -DFAKE_UTIME -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"' $(FAKETIME_COMPILE_CFLAGS)
++
++ifeq ($(COMPILER),clang)
++CFLAGS += -Wno-tautological-pointer-compare
++endif
++
++ifeq ($(COMPILER),gcc)
++CFLAGS += -Wno-nonnull-compare
++endif
++
+ ifeq ($(PLATFORM),SunOS)
+ CFLAGS += -D__EXTENSIONS__ -D_XOPEN_SOURCE=600
+ endif
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
index 7500e57658..49f68bf629 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -4,9 +4,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRCREV = "d475b925943ad404c6c728ac868dc73949e7281c"
-SRC_URI = "\
-    git://git@github.com/wolfcw/libfaketime.git;branch=master;protocol=https \
-    "
+
+SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;protocol=https \
+           file://0001-Makefile-Detect-compiler-in-makefile.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


