Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D202C3ABBA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.44488.1746426107648239476
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lMbJSyaK;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736a72220edso4479137b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426107; x=1747030907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7EpboEoWoOVowL0YyRX4g7rD2NxZ9Suom1WlfNwqQY=;
        b=lMbJSyaKY7CheJo8zNlwviwtUlLqDK2jgC9hIgN0YOV7O32aSvfV3TOJ/nT0cu8pcl
         kgw0O20+6u1QtNn4PuAlTIKeSkHyo5/NyN+11dia4S+4UFVeEe5ECqMKYM7a0Q16DC0N
         +SaP6Ov46FlQ5Dzz09SrHSdTOlSaKzfe5xY7SFHGtiRM5v5vUAg9iazH4WuLjvhShhf4
         YrOFUPkxHmFCoWFsDK5TxQXviz1kRNgAJ0iKXbLlNCXD8XIGW6BjzvrPuy7OFilclXeV
         ZloEtopUTReEgQoKTZirfi6OJ2wSAv3ec/TibMHI6lkW3o0iy7OS9hzljRnlOrT5iEh3
         NkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426107; x=1747030907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7EpboEoWoOVowL0YyRX4g7rD2NxZ9Suom1WlfNwqQY=;
        b=jnG39Txb3sANWjov8H9GB/UxQzeb4dU//bMSPMSbEf0piZlubqoNGnvnqF/pyL9lQL
         qwJT9ZkgmbEQWc4/CgOfFSxPf8ks65NkDFxHXOZGd1VX8dKsPU4TxGdImzZW4rMz0/32
         gYBxSuA7Sc3qcOCinSqgYaSPYX7nLAaubPwlD8dWTXqd3OhUQujTuuOF1n8+uWZ5H2VE
         QrLCGLi+GEO66RYxgAFDb0r4lxR9jGHDZM83szg6Fhwu7VlzDH1VwVj+/BFajxeTf9Ym
         1M3Pp9su/xSPtJg4nFecQqoEFzJ0Lcrk8yHaDTCJGEjNvgFt+XdpnvwcBDa+0/pbCYj3
         uPUw==
X-Gm-Message-State: AOJu0YxdirU/FKcDX1W5UGro1QS4Q7Dg+L1u0x10GQ0pldBqgT9zmXjH
	5x9NkhBidA4a0OVlZ/f+niEdrzxx5v3C/khgFGtAvth+pQ34DPLKlb/rBLdk
X-Gm-Gg: ASbGncsvfEIqKBeSRZBeXLJv5/cCIgLczVhOeXt4jw6CliKtRo3lzhJkNtRGHceIBJF
	F5Ai+p0SW4/Z0+aBxM3AqUzsVkzfeKdhZQiWztJLlWgVkrYYjKSgW6Cf844Q4jm58A1+mx/i6pD
	c4izcOBeio0UFw+6rYLTDcxlPwmp3gZ3X03jqhWydSI5QkhpmIvBxKEKRdouEUxY+6c5VRGm+jc
	RrVynk2yhq8qhA8ZaA1OzSeK3X3J1pH1ko6jX05hxzoPvBN/erhMhx8geXNCP6EuTrpBoT2J0L+
	5gGIKjq55jNLgT7gdpoWWV6YKbVF6Gzup9YqdIUKgF4=
X-Google-Smtp-Source: AGHT+IFFCSsqnrOHErT46lHoIhCOxDdM6GdMBUF+VdjWPRINe4MXcVnvPhN/14Qo+zhcp6vEUikflQ==
X-Received: by 2002:a05:6a00:ac86:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-7406730af42mr12675627b3a.8.1746426106736;
        Sun, 04 May 2025 23:21:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] renderdoc: Upgrade to 1.38
Date: Sun,  4 May 2025 23:21:38 -0700
Message-ID: <20250505062142.3478500-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117292

License-Upgrade: Copyright year changed

Drop the upstream denied patch, its not needed with clang-20 either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sor-Reorder-stdio.h-include-location.patch | 43 -------------------
 .../{renderdoc_1.33.bb => renderdoc_1.38.bb}  |  5 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.33.bb => renderdoc_1.38.bb} (83%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch
deleted file mode 100644
index 1c714f84dc..0000000000
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4eb26927eebebfc4df8789ba69f60f3c28b8ba33 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Jul 2024 23:36:23 -0700
-Subject: [PATCH] jpeg-compressor: Reorder stdio.h include location
-
-Current, location ends up with compile errors with clang and glibc 2.40
-fortified headers
-
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/renderdoc/1.33/recipe-sysroot/usr/include/bits/stdio2.h:128:13: error: use of undeclared identifier '__builtin___vfprintf_chk'; did you mean '__builtin___sprintf_chk'?
-|   128 |   int __r = __builtin___vfprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1,
-|       |             ^
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/renderdoc/1.33/recipe-sysroot/usr/include/bits/stdio2.h:128:39: error: cannot initialize a parameter of type 'char *' with an lvalue of type 'FILE *const __restrict' (aka 'jpge::_IO_FILE *const __restrict')
-|   128 |   int __r = __builtin___vfprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1,
-|       |                                       ^~~~~~~~
-
-This re-ordering ensures that fortified function prototypes are used correctly.
-
-Upstream-Status: Submitted [https://github.com/baldurk/renderdoc/pull/3369]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- renderdoc/3rdparty/jpeg-compressor/jpge.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/renderdoc/3rdparty/jpeg-compressor/jpge.cpp b/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
-index 74d9d1006..d58e41664 100644
---- a/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
-+++ b/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
-@@ -10,6 +10,7 @@
- 
- #include "jpge.h"
- 
-+#include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
- 
-@@ -897,7 +898,6 @@ bool jpeg_encoder::process_scanline(const void* pScanline)
- }
- 
- // Higher level wrappers/examples (optional).
--#include <stdio.h>
- 
- class cfile_stream : public output_stream
- {
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
similarity index 83%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
index 833845b5a3..8aab26c824 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
@@ -2,12 +2,11 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5536c2b72eeed14bafaf4d2a6c032b87"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=963d134bd809d24547253120513346d3"
 
-SRCREV = "cae289323847ce0a84a0deca4958183567eee17e"
+SRCREV = "34c3c40787f440da9c2947cd63a41e6c4d1f95b9"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
-    file://0001-jpeg-compressor-Reorder-stdio.h-include-location.patch \
 "
 S = "${WORKDIR}/git"
 

