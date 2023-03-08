Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D41C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 10:57:30 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4087.1678273045873859019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 02:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpzBOYtA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id k10so40118812edk.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678273044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/H/kSoEoXdI39JmqYfLVVo6V827Rriv54EWVO0uQ3c=;
        b=kpzBOYtAiaC6EUH7QRuNjDo2wNLv6VcZ0TRscW6xj7uqG9kw5Y553QAz3kAvYkSLDZ
         4J3/ffZcjSlsFzVjVC0hP5no81MzyTkAu6yuBFb6ufAr7e6S3fsQOXJiNHQuF8Ngkuq4
         XuiZzwO9YUUFszr5AbWzkXKFchZchP56x7gejdlXb5fXOZhNPENk8DryM2jOH7kp5vPl
         j+yGfR6+hRd9qIspWyX3h1wmJZGmuoBaDFwyDsjM0aaJXYgjihHnuoyqN910M79mWJni
         j7A9fjq3x9mk93eza62zsDv5dPfgNbUa8cdNj6j5lY7EfknLpXkUxeFGn9fIYkm6en/9
         DA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/H/kSoEoXdI39JmqYfLVVo6V827Rriv54EWVO0uQ3c=;
        b=TV1dkB323oUzCE14wEL0w9Xocnm+aMQGfB896dEiE4TiLrwEBauBkY8r41JLRZcEW0
         /Bp19YHQ2NkfJRXx43brQwCd/Sl8iBguBCGVWxQDxgry3+3/DaxaFSH0ofdCTwq4wn9X
         rIKmABoUzDnd0/t6WKIck6O5g15+yaiGxEEkDDwHNaPtA1dGJIcI8GjNqGRnWqPuGodQ
         2oA0GN7p7mj8bXBYS0gf1Dek6OscpkW69PmSG0xhhCbh1QhMSzMG+H6anrr9hQkb/sXM
         EtmtF9C//WWvRaknKbTPQDojtzW9yb1J3opjcFegHmgsmA1ib62ptz1kj44ygjQPf1DO
         f6Ig==
X-Gm-Message-State: AO0yUKWClSZmW+Vb/NrvXOTmCXuJevs9V8wUAyHAwQnEVakpq1Ouo0LG
	lt6AWjwOHcc5jkFjA5nbYShTVmVhvzcbRQ==
X-Google-Smtp-Source: AK7set++t7C/iFzR4YsdNMVZiWC32kdRPDFEWDqTMzK/feZgwLnOj4iBHw0HSvWag8T0/aUgHqEtsA==
X-Received: by 2002:aa7:db58:0:b0:4ad:738b:6706 with SMTP id n24-20020aa7db58000000b004ad738b6706mr18035786edt.2.1678273043973;
        Wed, 08 Mar 2023 02:57:23 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id r17-20020a50aad1000000b004bfa4f747d2sm7978763edc.54.2023.03.08.02.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:57:23 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencv: 4.7.0
Date: Wed,  8 Mar 2023 11:57:19 +0100
Message-Id: <20230308105719.1360985-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 10:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101410

Removed an upstream patch.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...ng-header-for-LIBAVCODEC_VERSION_INT.patch | 26 -------------------
 .../{opencv_4.6.0.bb => opencv_4.7.0.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.6.0.bb => opencv_4.7.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
deleted file mode 100644
index 59da6ab32..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d6bdd0a91eb0ed57688c0af5ba5088cf0afdc0a0 Mon Sep 17 00:00:00 2001
-From: Jochen Sprickerhof <jspricke@debian.org>
-Date: Mon, 8 Aug 2022 21:10:13 +0200
-Subject: [PATCH] Add missing header for LIBAVCODEC_VERSION_INT
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/22357]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/videoio/src/ffmpeg_codecs.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/videoio/src/ffmpeg_codecs.hpp b/modules/videoio/src/ffmpeg_codecs.hpp
-index 61788e0345..faad2596ed 100644
---- a/modules/videoio/src/ffmpeg_codecs.hpp
-+++ b/modules/videoio/src/ffmpeg_codecs.hpp
-@@ -60,6 +60,7 @@ extern "C" {
- #include <errno.h>
- #endif
- 
-+#include <libavcodec/version.h>
- #include <libavformat/avformat.h>
- 
- #ifdef __cplusplus
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.6.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.7.0.bb
index 1e4c3545b..eef2e66ca 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
-SRCREV_contrib = "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
+SRCREV_opencv = "725e440d278aca07d35a5e8963ef990572b07316"
+SRCREV_contrib = "e247b680a6bd396f110274b6c214406a93171350"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -30,7 +30,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
-- 
2.39.2


