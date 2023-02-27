Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDFDC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 19:27:33 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.4116.1677526046640836672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 11:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X2Qadj4G;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: festevam@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id l16-20020a4ad9d0000000b005254905810aso1168444oou.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 11:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677526045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaUJlEa1BA4ft/NDi32+/n6QjmkZu1pMLmOvymWkg50=;
        b=X2Qadj4G3UPDdfS3PCk4dFG8dFKfnc9DpvCAE7nIB5RWkgGeRV5vvn+Y2cmpBeN4Az
         QWt66UCyeKGUE8caLaI+DA4G9uLTdNd5yOhlHqPxVJhtBSHhvIr6EeaRmbpAwma+NMCH
         msCj+zumRgiaOrU0L3cqMawcjrb5RK3wJb4Z00kdW2caY6t1KL/tKaQ3Mrgn/ao4y1/W
         HzWRLLvAS1JU83iX9sQK8S3BWvJaPUnZ7rtCGldhCK1awOdN8I7Y3uT3A4bRF0rQrfJq
         d4og61wKUeeJbOzkZWFH5FBP3zwCjyENrvDjde9EC3QbVYcj2NvYQ1qispIcyfSRoYgQ
         ZVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677526045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaUJlEa1BA4ft/NDi32+/n6QjmkZu1pMLmOvymWkg50=;
        b=E6MrdJH4qPFuZtSkizRLUV9VqmbHxXTjXf1yrnLx53ShQlyijSPdUTHdafBGIwEMMd
         fqRnQ8ppf+f1oJddtTJxd2PSqS9fhPQIHL0HgOvDkbZfySWkzfOthm7eNfVg0x/rx6gf
         oNhMfWT79v0wmN915CiBM4kBHm1hDiYt6Ya+70RpHHQL9ZJAyK8D1s9Q9xshyA29sLz5
         EP6Qf5AUEF6u9o+3X5x8hu4vOMdCqJIMiHGzJNrj5mXWTftiKDIvzHDFySjRKwVK+Iv+
         MkK1iSPWQQqcgjhxBbG3d8i9U7De+XOuP6RarVejfN6OVuJwuc8qk6wa2F3w1GZch/qo
         31PQ==
X-Gm-Message-State: AO0yUKVN1nHwsfK5nMOkbepYA+iUaZkKE+mmY/kuy4MFsVPkHJNvAVDp
	LCRJpLbUKAZ3VtSuczlfWpXvcF7u7h0=
X-Google-Smtp-Source: AK7set9i0RXRvrYEw8objeN98Q7htNEH2NFiPUXN872a/JvFnERNbs139JuxcAu/R5I1hCckP+NiBw==
X-Received: by 2002:a4a:4907:0:b0:525:224c:a896 with SMTP id z7-20020a4a4907000000b00525224ca896mr7326170ooa.0.1677526045387;
        Mon, 27 Feb 2023 11:27:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:ba74:1ef9:1d36:2bb6])
        by smtp.gmail.com with ESMTPSA id m55-20020a05683026f700b00693d8a315eesm2945003otu.31.2023.02.27.11.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 11:27:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] glmark2: Update to 2023.01
Date: Mon, 27 Feb 2023 16:27:16 -0300
Message-Id: <20230227192716.77091-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 19:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101298

From: Fabio Estevam <festevam@denx.de>

Update to the 2023.01 version:

glmark2 2023.01 (20230119)
==========================

* Add gbm-gl/glesv2 flavors for GBM offscreen rendering.
* Add x11-gl-egl flavor that uses EGL under X11.
* Implement SwapInterval 0 for the DRM backend.
* Support multisampled configs in --visual-config.
* Support explicitly specifying the config id in --visual-config.
* Add CPU time and shader compilation time to available results.
* Add --results to specify which kind of results to report.
* Add --results-file to export results to XML or CSV.
* Add --version command-line option.

Remove 0001-libmatrix-Include-missing-utility-header.patch, which has been
upstreamed and refresh 0002-run-dispmanx-fullscreen.patch to avoid
fuzz warnings.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...atrix-Include-missing-utility-header.patch | 24 -------------------
 .../files/0002-run-dispmanx-fullscreen.patch  | 10 ++++----
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  5 ++--
 3 files changed, 8 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch
deleted file mode 100644
index 959a18e5e..000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 45cb02332b38b2059e7e44369c3d8684492a7def Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Apr 2022 11:41:41 -0700
-Subject: [PATCH] libmatrix: Include missing <utility> header
-
-Fixes build with gcc12
-| ../git/src/libmatrix/program.h:43:21: error: 'exchange' is not a member of 'std'                                                   |    43 |         ready_(std::exchange(shader.ready_, false)),                                                                       |       |                     ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/174]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libmatrix/program.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/libmatrix/program.h
-+++ b/src/libmatrix/program.h
-@@ -13,6 +13,7 @@
- #define PROGRAM_H_
- 
- #include <string>
-+#include <utility>
- #include <vector>
- #include <map>
- #include "mat.h"
diff --git a/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
index 0cb22fd56..05a074cf5 100644
--- a/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
+++ b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
@@ -13,10 +13,10 @@ Signed-off-by: Trevor Woerner <twoerner@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/src/main.cpp b/src/main.cpp
-index 677962e..273a217 100644
+index d1077fe..d717cd4 100644
 --- a/src/main.cpp
 +++ b/src/main.cpp
-@@ -164,6 +164,11 @@ main(int argc, char *argv[])
+@@ -202,6 +202,11 @@ main(int argc, char *argv[])
          Options::size = std::pair<int,int>(800, 600);
      }
  
@@ -26,5 +26,7 @@ index 677962e..273a217 100644
 +#endif
 +
      // Create the canvas
- #if GLMARK2_USE_X11
-     NativeStateX11 native_state;
+ #if GLMARK2_USE_EGL
+     GLStateEGL gl_state;
+--
+2.25.1
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 2a3e74f02..a2d5b152f 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -11,15 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "libpng jpeg udev"
 DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native wayland-protocols', '', d)}"
 
-PV = "2021.12"
+PV = "2023.01"
 
 SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https;branch=master \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
-    file://0001-libmatrix-Include-missing-utility-header.patch \
 "
-SRCREV = "0858b450cd88c84a15b99dda9698d44e7f7e8c70"
+SRCREV = "42e3d8fe3aa88743ef90348138f643f7b04a9237"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


