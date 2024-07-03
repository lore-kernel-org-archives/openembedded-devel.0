Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD09C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 06:57:04 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.45560.1719989815335122641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 23:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rwt9o2Uf;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7180e5f735bso202275a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 23:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719989814; x=1720594614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsEBcpLFH0oHP52g4XIl/BYz2a3O7rpoZSAz0kmrCdY=;
        b=Rwt9o2Uff4Q1kIy9zZe0fnACdVNnPf6cNIj0GhNFq3x1EJ/M5ZWgb3iDIH5UdA23oD
         yMVnl2i98A2MOvqvVbmOL8p8pM5X6C9/JLqEJYQdwinPnWMjW8BOKROuLGoCCLmi/JOi
         rxbYZUr5jhW1bCNpIrNmsECN5gAGRzH57CoXdp/RWDftybQFGBGXauyMGu2bdiIk3h1J
         oNiWKmXf/kSwJk5ICpUiRUF3m5qGaZktZi8KdP/RGs8VrddX+AU6PStNu5fZwgQa3vVc
         eTZnA1cvy0w7S/96IqLAaB9VwK4jBZn/TMgIQ/5VXD/tIydrczuvmmLQRvIyQJWT1XbD
         Kduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719989814; x=1720594614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsEBcpLFH0oHP52g4XIl/BYz2a3O7rpoZSAz0kmrCdY=;
        b=aPLDhog7/dE4kaMoFbKAzntwRqUDP8wC869QCTazTfFOSUAb8iVCPqQ4wNQp29g+vv
         XHvPnUDakt+zhAvNNhi0zUqwyKkp6f4oxCvkEnx7YODVV1S3vfSa8rWpAUyL4HDZ6E77
         UBuLLXxsoa8Yt/puUDkzhERxh+ehzd0dEiQeXijPT0NE9RgO3Dt7HYFqelN11NkN6DdR
         GY0XGDGBK07A9X96jNk9ZRlOd7CP8mKjo82pVIK0oSRPEYj1Vk0ZGXSuxwUDO3GWnrL6
         +JtCGuMsraz7Qb+5LZVrwLnKcerLzx1zRDU9H+56dW4aJcUcf2DcIqoFatWELxPVGTky
         ENEg==
X-Gm-Message-State: AOJu0Yz+R1YmN+/9PIOoWySLX4ynGYC5lsjZ+eCPstHf9LS6yDjx255i
	mRBpb1E7266El4+OnuNiCPLeQpDup4ge/h6zWKxyxbVxuge3+/CGMqQtUQ==
X-Google-Smtp-Source: AGHT+IGmndz4gWPecixzOBW9GJNYqVH4hGaxej+P0vBsMhHumWDn7ed6p8UfkTnj3pGgFoDiSM71cA==
X-Received: by 2002:a05:6a21:458b:b0:1be:f828:965b with SMTP id adf61e73a8af0-1c0bffb7df5mr1001939637.28.1719989814096;
        Tue, 02 Jul 2024 23:56:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205c688sm9657420b3a.5.2024.07.02.23.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 23:56:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] renderdoc: Fix build with clang fortify and glibc 2.40
Date: Tue,  2 Jul 2024 23:56:49 -0700
Message-ID: <20240703065649.3135944-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703065649.3135944-1-raj.khem@gmail.com>
References: <20240703065649.3135944-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 06:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111220

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sor-Reorder-stdio.h-include-location.patch | 43 +++++++++++++++++++
 .../renderdoc/renderdoc_1.33.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch
new file mode 100644
index 0000000000..1c714f84dc
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-jpeg-compressor-Reorder-stdio.h-include-location.patch
@@ -0,0 +1,43 @@
+From 4eb26927eebebfc4df8789ba69f60f3c28b8ba33 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Jul 2024 23:36:23 -0700
+Subject: [PATCH] jpeg-compressor: Reorder stdio.h include location
+
+Current, location ends up with compile errors with clang and glibc 2.40
+fortified headers
+
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/renderdoc/1.33/recipe-sysroot/usr/include/bits/stdio2.h:128:13: error: use of undeclared identifier '__builtin___vfprintf_chk'; did you mean '__builtin___sprintf_chk'?
+|   128 |   int __r = __builtin___vfprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1,
+|       |             ^
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/renderdoc/1.33/recipe-sysroot/usr/include/bits/stdio2.h:128:39: error: cannot initialize a parameter of type 'char *' with an lvalue of type 'FILE *const __restrict' (aka 'jpge::_IO_FILE *const __restrict')
+|   128 |   int __r = __builtin___vfprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1,
+|       |                                       ^~~~~~~~
+
+This re-ordering ensures that fortified function prototypes are used correctly.
+
+Upstream-Status: Submitted [https://github.com/baldurk/renderdoc/pull/3369]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ renderdoc/3rdparty/jpeg-compressor/jpge.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/renderdoc/3rdparty/jpeg-compressor/jpge.cpp b/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
+index 74d9d1006..d58e41664 100644
+--- a/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
++++ b/renderdoc/3rdparty/jpeg-compressor/jpge.cpp
+@@ -10,6 +10,7 @@
+ 
+ #include "jpge.h"
+ 
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+@@ -897,7 +898,6 @@ bool jpeg_encoder::process_scanline(const void* pScanline)
+ }
+ 
+ // Higher level wrappers/examples (optional).
+-#include <stdio.h>
+ 
+ class cfile_stream : public output_stream
+ {
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
index e6b59cfae2..833845b5a3 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5536c2b72eeed14bafaf4d2a6c032b87"
 SRCREV = "cae289323847ce0a84a0deca4958183567eee17e"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
+    file://0001-jpeg-compressor-Reorder-stdio.h-include-location.patch \
 "
 S = "${WORKDIR}/git"
 

