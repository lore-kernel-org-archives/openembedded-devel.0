Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868E7C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3574.1684914784431491308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GezlnUDm;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51190fd46c3so1290278a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914783; x=1687506783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfQsMhbN/HEcBUzkJYhCacgUb8sYGLHqW94vtcdsspE=;
        b=GezlnUDm+/7tiKECyq1JtMFrTq81Wi99Ci960rxLdg9v9h75WYhAIgFqeWe8u0QxrY
         xFmtmc5+zOvclz9Xtfr1OIjQ9HgBu4zIfwyGxDBwQzhnzExMChpHlMkicvdBxigyHUBP
         EauyNlkDloXb6vTlUyFS2Qt+lkDdZ9dfAPC6Gl8+07e+aIyz1H6H3P/sRK3C65KihdYj
         Wa6TsYuXx1/h+IL8W/BHLRiH8GodpU86Izxe4bnqMFX/JFujBxcIA6oJ1fRPdR3h4Tf+
         OoHOs2lgNm7k2iK8QDVOf998WGbgAE9gWl2G/co0ujodhN1N0zLkMPEgnplBnTJM+wkR
         vvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914783; x=1687506783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfQsMhbN/HEcBUzkJYhCacgUb8sYGLHqW94vtcdsspE=;
        b=G+fNT8B+W+TnX30gb5wRQTjUs9/XUjhwwoXifZFhyDeIeKb5Am/UjuQaaXk0ZdWIw3
         40nTDTIo5xxJ9Kl7aW/3NoA2SZ1HWG9mRJq+md63DGjUr/UtG3/1+pUV1yJqvaANKCqp
         xJxECkemNrpDIOApTs3V3V7WJf3tu67ekAXgEDPxAbApuuYv+P3nKtcX1+uUCpC0efax
         vWW4vw7LO8VDuORpU73OYFmnD3zK9tuEaeU/ZjMNCyT33BQsLBYBkzU2y3wbRPXjqB0w
         HitDgZ9PH/m18GDsk8FuxY0ck9uO10gKFtx/JmnJee5kOpgV92bx+ARRaXPEJjYWktYt
         Tcyg==
X-Gm-Message-State: AC+VfDyS/ysvYQCdrRdIY4DfeGMvmqFZ74IZvjgK4xq9KtH/5BLnAlLT
	pmhSPwh5919EE/6dooQh+VrTbClEgos=
X-Google-Smtp-Source: ACHHUZ5wqDyP8cIxkMN7FQ1bfWmWcE2wovax5mx4IajufiUffV2Z6Xv0YWtUZJ8YJ6tShKa4ndAA7g==
X-Received: by 2002:a17:907:1627:b0:971:484:6392 with SMTP id hb39-20020a170907162700b0097104846392mr5234703ejc.38.1684914782888;
        Wed, 24 May 2023 00:53:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709064a9000b00968db60e070sm5403867eju.67.2023.05.24.00.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/20] python3-pybind11: remove unused 0001-Do-not-strip-binaries.patch
Date: Wed, 24 May 2023 09:52:36 +0200
Message-Id: <20230524075253.1033593-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102757

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=5c455804aede17e0ea0cbb7ab55f8580f912e664

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Do-not-strip-binaries.patch          | 48 -------------------
 1 file changed, 48 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
deleted file mode 100644
index 699eb61550..0000000000
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@balister.org>
-Date: Wed, 8 Jul 2020 09:41:43 -0400
-Subject: [PATCH] Do not strip binaries.
-
- * OpenEmbedded strips them after creating debug packages.
-
-Signed-off-by: Philip Balister <philip@balister.org>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- tools/pybind11NewTools.cmake | 5 -----
- tools/pybind11Tools.cmake    | 4 ----
- 2 files changed, 9 deletions(-)
-
-diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
-index 18da8be1..82ebf5e7 100644
---- a/tools/pybind11NewTools.cmake
-+++ b/tools/pybind11NewTools.cmake
-@@ -246,11 +246,6 @@ function(pybind11_add_module target_name)
-     endif()
-   endif()
- 
--  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
--    # Strip unnecessary sections of the binary on Linux/macOS
--    pybind11_strip(${target_name})
--  endif()
--
-   if(MSVC)
-     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
-   endif()
-diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
-index 32313539..a7d81012 100644
---- a/tools/pybind11Tools.cmake
-+++ b/tools/pybind11Tools.cmake
-@@ -201,10 +201,6 @@ function(pybind11_add_module target_name)
-     endif()
-   endif()
- 
--  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
--    pybind11_strip(${target_name})
--  endif()
--
-   if(MSVC)
-     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
-   endif()
--- 
-2.17.1
-
-- 
2.40.1


