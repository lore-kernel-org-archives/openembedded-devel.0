Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E73C7EE45
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3578.1684914791655669610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Gf5LNSjn;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso3545355a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914790; x=1687506790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lRpmApyweeCt37g2JlTxkplxSfrTpnCNXK+JH7km5M=;
        b=Gf5LNSjnU18HzOH8tlaVTYots6Qwl3DhAllnt/2ae2FP+dNyW/XW+sY5/Y78kWR7U7
         wpiRHczDlrRDbNOtDm7HR8djlsc8mKEh0aC8JhcHnlA9tDmAX0tzitZ+5m9lcvNhtfX/
         Bim0ro+skQUivIPXcEa+c6fKCCvzJeYtTGRJrKEB1ZUv8oVanbfxaGNV8NHgds8PieyJ
         kqROTnhxiX9omBFXJuumcYcu3IJLuFE53RF2cTiLF78fgPqJ1GXeYlWkg1VF5HXTgIxh
         npQ44bY1DOR7T7fIfgSxwiWZNXAfO1Ck0D5fPELtNKx21+8FnaFVxIaGu71CAo28EazT
         d2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914790; x=1687506790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lRpmApyweeCt37g2JlTxkplxSfrTpnCNXK+JH7km5M=;
        b=U1heaAjxM9nDNmdjGclvG0Oi8qVNr9O8F5L20Y/kLu2XdvV0JKI+R4L8xf78i6sv5g
         YOrao4E95Q9BIAPFZu57f9IhW28WKgd7DX5OsGxT4Vod8OoyoRyqbCP9aJhLRN9Omzra
         0oBGC6UpAEocoM5GrF8sGW6jNZ4MLSdur+DsDiF+kkZMTjW46YXpYCvOAVpu50zgim/+
         OTWvtPxIK+iTznBQ4poxQzAWKT5cUB3Mq2mIxnqIzqsgBZOxpJRv1COJYax9TVvF1ZiD
         6V+VjI33tWCPxuxVt8AhtoBQNW4HV/GRMTzhsNf4xRssjXIbWjUB1IMNAn0hi2/b2ijt
         4KHw==
X-Gm-Message-State: AC+VfDx46UJ59alYFmcySjVzdrI8wbU+R/2Q8EI3TBy+c55mJLctv+87
	tDbx3bMicBWLPMd0JVuVKywFBkcmmyc=
X-Google-Smtp-Source: ACHHUZ4fCnSKnEqf80AjPaD2dFSygD5aXAnmIE13eN4waUOnJn5fwt1R03I9s6Oy08p5z9SCzdCZQQ==
X-Received: by 2002:a17:907:360c:b0:969:9c0c:4c97 with SMTP id bk12-20020a170907360c00b009699c0c4c97mr14240403ejc.1.1684914790077;
        Wed, 24 May 2023 00:53:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kg17-20020a17090776f100b0096a6bf89259sm5227283ejc.167.2023.05.24.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/20] opencv: remove unused patch file
Date: Wed, 24 May 2023 09:52:46 +0200
Message-Id: <20230524075253.1033593-13-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102767

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=d0e72f07d3f6362a8d3f070ca00c153aae718cb7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...dparty-ippicv-Use-pre-downloaded-ipp.patch | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
deleted file mode 100644
index 9e6a613713..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9b4959b97d2e95d4b49cf6ca2a3fce3cdb484f2d Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Date: Thu, 31 Mar 2016 00:20:15 +0200
-Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
-
----
- 3rdparty/ippicv/ippicv.cmake | 15 +--------------
- 1 file changed, 1 insertion(+), 14 deletions(-)
-
-diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake
-index 257af6fcc6..f88460450f 100644
---- a/3rdparty/ippicv/ippicv.cmake
-+++ b/3rdparty/ippicv/ippicv.cmake
-@@ -34,18 +34,5 @@ function(download_ippicv root_var)
-   endif()
- 
-   set(THE_ROOT "${OpenCV_BINARY_DIR}/3rdparty/ippicv")
--  ocv_download(FILENAME ${OPENCV_ICV_NAME}
--               HASH ${OPENCV_ICV_HASH}
--               URL
--                 "${OPENCV_IPPICV_URL}"
--                 "$ENV{OPENCV_IPPICV_URL}"
--                 "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${IPPICV_COMMIT}/ippicv/"
--               DESTINATION_DIR "${THE_ROOT}"
--               ID IPPICV
--               STATUS res
--               UNPACK RELATIVE_URL)
--
--  if(res)
--    set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
--  endif()
-+  set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
- endfunction()
-- 
2.40.1


