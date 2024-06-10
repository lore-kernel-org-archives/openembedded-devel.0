Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99E5C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 10:25:10 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.16228.1718015101234530858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 03:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeEroz5T;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: zboszor@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so10226381fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718015099; x=1718619899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1xNxGjvNTGYS0UW9zzgSJBqJvqUCdyLI0VnZfhV8TM=;
        b=OeEroz5Tj9PDyKtd92SCCl+rcgBhwiQ/k7HwYAh4UtaQWxblIUf3yZxCZbYcVs7QMa
         7VwlIqfft9cuP5+PTEs9R9+cPJxTjituFntkmPoDN4O9hcysroSDsfrSqJ/jE39eIR8m
         bzQ6poffU+OjLN5x3H/2j5kaIlEWtWT5ZMIfeQH7pioiEI/O3DXg6smhDalJoS3fM7WM
         xq+0EiaOV1GeXM1uGED2jLhPbxoIZZksVbJyjgfh2WITTj69FQdFaC+0Lx6FILrkyr/w
         A/My81WMBM/WtwCSHP9LaWHJvY6q6rqn+BQlJ5+5OpgTuoojfNX0qxTPaFf8FRP8F+Sa
         T8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718015099; x=1718619899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1xNxGjvNTGYS0UW9zzgSJBqJvqUCdyLI0VnZfhV8TM=;
        b=eHbqyPXztbM7Oxd8oFOS6szgQ2rVV/mDsuTxkGRkn1qGPEwP465Ml7tKhbdeJ+nDAR
         nnLKYSXRAggxzQDrfGCrpNZWbtIJWGQAxBvYm+JKNNMcYDyix5hnZiQrj+FrU5g59Aqz
         4YdA+lhEQ5Oe8TdbIi9ZgpnG7/87aoYLYfB1ojx/7y/IS4vgniKDRK5tBUVTZabmQYZ7
         Ea+TFZq4otGOTvIXDjAnvY66VtKyGQLOYGFUsH08XiJS85icnJURs5JrkTwi1tkceANG
         604QqvbBblFlnDNSnZDiVEqP98AaoXYIcFQfIXrMjnhzOZ+ZDNlCvSf2PuWiHlmTA51j
         r2Yg==
X-Gm-Message-State: AOJu0Yy8Sd/0//AR8wJp2ILkBkB1igMXRCSg/pDC3BPBS2Hyy2alEOCY
	YGQ46SEtohgsm+IXsAMdGJ3xEOSK7bvm7hiD3/Y7LF38RNaA4DI8/2/uiSGY
X-Google-Smtp-Source: AGHT+IEtmsQj4ziTCjEILgJHD00QJC7aoLGCFzMDmRSXRTP1fQaeCC0rQs4t49NL/OEQlVtcagrXdw==
X-Received: by 2002:a05:651c:507:b0:2eb:df6d:6c36 with SMTP id 38308e7fff4ca-2ebdf6d6df8mr25994701fa.4.1718015098664;
        Mon, 10 Jun 2024 03:24:58 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1aed74cesm5264542f8f.112.2024.06.10.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:24:58 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-initramfs][PATCH] dracut: Drop an unnecessary patch
Date: Mon, 10 Jun 2024 12:24:55 +0200
Message-ID: <20240610102455.2252749-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 10:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110795

Dropped 0001-util.h-include-sys-reg.h-when-libc-glibc.patch
that's unnecessary for a long time now, because dracut
(since version 049) does not rely on __WORDSIZE.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ....h-include-sys-reg.h-when-libc-glibc.patch | 35 -------------------
 .../recipes-devtools/dracut/dracut_102.bb     |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
deleted file mode 100644
index 68ec2b8fd..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 17:14:05 -0700
-Subject: [PATCH] util.h: include <sys/reg.h> when libc != glibc
-
-For musl libc it is required to include <sys/reg.h> to
-have __WORDSIZE defined to e.g. 32 for arm*-musl.
-
-Taken from void-linux
-https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/musl-__wordsize.patch
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/install/util.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/install/util.h b/src/install/util.h
-index a6f9a184..82732913 100644
---- a/src/install/util.h
-+++ b/src/install/util.h
-@@ -36,6 +36,9 @@
- #include <sys/stat.h>
- #include <dirent.h>
- #include <sys/resource.h>
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
- 
- #include "macro.h"
- 
--- 
-2.17.1
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
index 496380a0f..39ff265a3 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
@@ -9,7 +9,6 @@ PE = "1"
 
 SRCREV = "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
-           file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
            "
 
-- 
2.45.2


