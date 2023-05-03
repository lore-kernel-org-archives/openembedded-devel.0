Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BECAC7EE23
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:47:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.21591.1683125266975913737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 07:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HvdqfyI3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f19323259dso52151335e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125265; x=1685717265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyQcDu2ncfp53wKx7RnkvzsfTJvg8pF8YFznJBrluYY=;
        b=HvdqfyI3Sw/fNn1dnZkkepcQki3jzA780vbQreUtpJAV0BsXffTMiA6s5QvIo2T31q
         36ZAdcsoDAnZ8mQRyOkHE50RDsL/EhiJ7xbtpfVnC4qLAwUrsbB7oLI/Ge0aDQIwTWJG
         VlZyRCIypzMuN6/Z3Iek5E4rK/SYMNO4YOYEONaViVlOR2P1uxWLCHxaCqOsU4P1xoOr
         IjHOqwDOckmzayUcZ7ZtgZArlnFMJjKM6YXtLRssTcT2A8FOuvlj3SRllLL8SUhGaDSp
         +HVORYkZMSVPOwhQCzHKK+3xk6ysICbJcE6t7WSUfJ2XMXhnQjq/3F91e3RAZrFe68kj
         4NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125265; x=1685717265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyQcDu2ncfp53wKx7RnkvzsfTJvg8pF8YFznJBrluYY=;
        b=bgJfDfT2Sp+T1iU0p57t34jERAVbkP3/XUxjPH52yxnSRYLLA419NK9JvpZCHa3FHX
         cf/uwe62sKkEiIhve0QWWC1PKFIZUZtVZ65K4iwF6FPd0DzTtlT03ezofnD21+jkfC/U
         UhwIP7hwm2bpixpq+qJ3/57mNaV2eKgY0BS+NOZSEo7CQNKRJvRy1biJ6fCULAipbH0+
         0CW3m5basbZwXmrGa6mIiB2ytlTQxUC5BiicLDG8lIyGlQQnGnoTWxa6Tfq5Oq6pvu64
         enD5uXFneZjrhfzM2bP+LBe5G3Ko4gGNvaOIqt5JDKqvTR1Wv9mMtq2k6oVSiyJlo/u8
         162w==
X-Gm-Message-State: AC+VfDxV2XX67pn0lQOVJwm0VaS1NQ90t0tT9yu0tUISUUgHZSp5YEU1
	juUTLPBF4MhsXpl4yDYvowPMl3P6L8A=
X-Google-Smtp-Source: ACHHUZ79bAfNYica7IaZWADIUPM2pHJDjxCrpITNr3wHtc+q25mF58ptOOMWcrCsn19aM9b3XhMgdw==
X-Received: by 2002:a1c:7502:0:b0:3f2:5028:a558 with SMTP id o2-20020a1c7502000000b003f25028a558mr14824633wmc.0.1683125265285;
        Wed, 03 May 2023 07:47:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k1-20020a7bc301000000b003eddc6aa5fasm2094553wmj.39.2023.05.03.07.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:47:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] glfw: respect DISTRO_FEATURES when enabling x11 in default PACKAGECONFIG and return it to REQUIRED_DISTRO_FEATURES
Date: Wed,  3 May 2023 16:47:41 +0200
Message-Id: <20230503144741.3909244-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <175B62BB4F7F5F02.4923@lists.openembedded.org>
References: <175B62BB4F7F5F02.4923@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 14:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102288

x11 was recently removed from REQUIRED_DISTRO_FEATURES but it
should still respect x11 in DISTRO_FEATURES, now this causes:

ERROR: Nothing PROVIDES 'libxi' (but meta-oe/recipes-core/glfw/glfw_3.3.bb DEPENDS on or otherwise requires it)
libxi was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxinerama' (but meta-oe/recipes-core/glfw/glfw_3.3.bb DEPENDS on or otherwise requires it)
libxinerama was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxrandr' (but meta-oe/recipes-core/glfw/glfw_3.3.bb DEPENDS on or otherwise requires it)
libxrandr was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libglu' (but meta-oe/recipes-core/glfw/glfw_3.3.bb DEPENDS on or otherwise requires it)
libglu was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxcursor' (but meta-oe/recipes-core/glfw/glfw_3.3.bb DEPENDS on or otherwise requires it)
libxcursor was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.

REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and ANY_OF_DISTRO_FEATURES by "wayland",
but the default PACKAGECONFIG doesn't match with that.

Also move libglu to x11 PACKAGECONFIG, because that also has x11
in REQUIRED_DISTRO_FEATURES.

Return x11 to REQUIRED_DISTRO_FEATURES because even with this change
it still fails to build without x11 in DISTRO_FEATURES, so until
wayland support is resolved it does require x11 to build, otherwise fails with:

glfw/3.3+gitAUTOINC+781fbbadb0-r0/recipe-sysroot-native/usr/share/cmake-3.25/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
|   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index 5b0d61241e..f4d983a6e0 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -20,17 +20,17 @@ EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
 
 CFLAGS += "-fPIC"
 
-DEPENDS = "libpng libglu zlib"
-REQUIRED_DISTRO_FEATURES = "opengl"
+DEPENDS = "libpng zlib"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 ANY_OF_DISTRO_FEATURES = "wayland x11"
 
 # upstream considers x11 and wayland backends mutually exclusive and will
 # prioritize wayland if it is enabled, but wayland has dependencies that cannot
 # be satisfied by this layer so it is disabled by default
 
-PACKAGECONFIG ??= "x11"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
-PACKAGECONFIG[x11] = ",,libxrandr libxinerama libxi libxcursor"
+PACKAGECONFIG[x11] = ",,libxrandr libxinerama libxi libxcursor libglu"
 
 COMPATIBLE_HOST:libc-musl = "null"
-- 
2.40.1


