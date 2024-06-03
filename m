Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F00AC25B78
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 22:33:56 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7408.1717454031618810058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 15:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B/lzH9uw;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b938587a4so2441751e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717454029; x=1718058829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=56FgsUGECD126enAwBHkrkxv5whVidS0hklmtAKVvgE=;
        b=B/lzH9uwrIupj1xzScJIwDKCSZxLagj8G5zX1AizhJu0UTAtyf1ZD4pAY555Wc4Dvu
         d3Y/reWy71j3/ZS8uWWnPHiBYc9nMe1gf1XUsmbH5V6bNcHP4RMIl4KCU6SPSKwRppRX
         I69OCBH7P17l6mn4ffYv0F8rPeUyq2w4XFqiVrVVORIYJYfM1KUhBGTbSwt0P40TbSlz
         tQTYgij82LYKfa5xDqcoHeAvu1A6oi3qoYS3QNR8Ld1IUiqeaBeVvDlCt03D+2E33Xnw
         uX8N+qPXnB22aSfJCxlBaEZbT0yE8Z+FYfPPCpNaGODjzIz5y3Y54JWf4KVwoZoYR/Re
         Bk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717454029; x=1718058829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56FgsUGECD126enAwBHkrkxv5whVidS0hklmtAKVvgE=;
        b=JsPSftrbQb+PRfrWBckNcUut3SB8xvgisALgLAzrKUTw219TY1DlIwz3yUPoksFdVK
         DhYzqVGqLtbjxK4a/ZX0Oa/TjXoRVdXvNYV6mxviCVPhpGtCYPyVIeCGfpcmw/TFvqss
         ogu/Id8955kQSpdaGAAzIo22KE5RVTQETkZ8fjoanTUwlQmUuaZZXYQ0MPtiLB+vchWc
         ty0ZagxUWagI+2fVl/H8VigKQpbbVfhqv62/t4+m/1+79fLGXPjTIZOUPZmZg4mOCcnN
         nIUMgWDteP9ia7rcvnyaKrM+MzjP7uJA7yPEiXITQiIJIujrd2njzX9Uqtr3PpX6YR3b
         Paaw==
X-Gm-Message-State: AOJu0Yy2J5Y8/g/5nyF3zrU3cbXc2wd+WSpX1BClwyn0GnHb73Xd3gJa
	Hwx9THqOxX3Ljw+QmZ2/wYXUJfY7lzoonnV9n2zdZOgdV9g/+HlPzyrXGQ6JB8EXAO7xLaMcady
	d
X-Google-Smtp-Source: AGHT+IGwfufKuJez+yslJjCbfxggVuD9HZrmXO6byZY8MgNok/EjzzBr4uX0DH3gvrWiZijONsoJnQ==
X-Received: by 2002:a05:6512:31d6:b0:52b:337a:fd0b with SMTP id 2adb3069b0e04-52b9c159200mr2532075e87.55.1717454029216;
        Mon, 03 Jun 2024 15:33:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9b31b25fsm364082e87.57.2024.06.03.15.33.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 15:33:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v2] libcamera: update to 0.3.0
Date: Tue,  4 Jun 2024 01:33:48 +0300
Message-Id: <20240603223348.4091551-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 22:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110678

Upgrade libcamera to version 0.3.0, gaining support for SoftISP.

Patch 0001-ipu3-Use-posix-basename.patch is dropped, it is applied
upstream.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Dropped the accepted patch.

---
 .../0001-ipu3-Use-posix-basename.patch        | 71 -------------------
 ...{libcamera_0.2.0.bb => libcamera_0.3.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb => libcamera_0.3.0.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
deleted file mode 100644
index 9e4adf3d8db6..000000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posix-basename.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 35d2acc61b1b27c0810a80cd21de65f29dc79df7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Mar 2024 11:27:21 -0700
-Subject: [PATCH] ipu3: Use posix basename
-
-musl does not implement GNU basename extention and with latest musl
-the prototype from string.h is also removed [1] which now results in
-compile errors e.g.
-
-../git/utils/ipu3/ipu3-pack.c:21:47: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-These utilities are using this function in usage() which is used just
-before program exit. Always use the basename APIs from libgen.h which is
-posix implementation
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/041180.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/ipu3/ipu3-pack.c   | 4 ++--
- utils/ipu3/ipu3-unpack.c | 3 ++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/utils/ipu3/ipu3-pack.c b/utils/ipu3/ipu3-pack.c
-index decbfc6c..23d2db8b 100644
---- a/utils/ipu3/ipu3-pack.c
-+++ b/utils/ipu3/ipu3-pack.c
-@@ -8,6 +8,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -15,9 +16,8 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
--static void usage(const char *argv0)
-+static void usage(char *argv0)
- {
--
- 	printf("Usage: %s input-file output-file\n", basename(argv0));
- 	printf("Convert unpacked RAW10 Bayer data to the IPU3 packed Bayer formats\n");
- 	printf("If the output-file '-', output data will be written to standard output\n");
-diff --git a/utils/ipu3/ipu3-unpack.c b/utils/ipu3/ipu3-unpack.c
-index 9d2c1200..1505a970 100644
---- a/utils/ipu3/ipu3-unpack.c
-+++ b/utils/ipu3/ipu3-unpack.c
-@@ -8,6 +8,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -15,7 +16,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
--static void usage(const char *argv0)
-+static void usage(char *argv0)
- {
- 	printf("Usage: %s input-file output-file\n", basename(argv0));
- 	printf("Unpack the IPU3 raw Bayer format to 16-bit Bayer\n");
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
index 45d6be31ec95..93f29c16124d 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
@@ -13,10 +13,9 @@ SRC_URI = " \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
         file://0002-options-Replace-use-of-VLAs-in-C.patch \
         file://0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch \
-        file://0001-ipu3-Use-posix-basename.patch \
 "
 
-SRCREV = "89227a428a82e724548399d35c98ea89566f9045"
+SRCREV = "aee16c06913422a0ac84ee3217f87a9795e3c2d9"
 
 PE = "1"
 
-- 
2.39.2


