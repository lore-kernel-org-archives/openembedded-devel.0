Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CCFC07CB1
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:38:29 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.94643.1701092302083996658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEYDKCrQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54b18c9b21bso2589095a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701092300; x=1701697100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1d04QQNEIwucvp3uV+hkZKt5mszLd1XUpRFbq3kpYJ0=;
        b=HEYDKCrQ/qoLAZe6vNblJE9K/ouNxX2xkC51YsQZJ9TAZ84Gjp0tMfUoSYRlEzqx4C
         3Giic6xbSgU8orLQm/b468O4oZHTNF+c3A7MWgTsX2wuVgn0s43rHdRdGeAtnxN4C7vx
         6iny2VOz7Obve9cC0gvQYoNkX1jYibCnSKaE+1m+Csdh1LRmdI0q6oSSKd8D5pJyX7/h
         6vy+94D18Oyjo+ELpLaja50i18oSXm+4sI+QTvk+E5xufRFdXa9QFKVX8wcd0UG7RNGR
         JaYGnSYzhrHrbK+GqStTmh8e4ArlWDInxWXpfExrnwU15xjUsOT1PlVQe3j88E8VSoaf
         Dn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092300; x=1701697100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d04QQNEIwucvp3uV+hkZKt5mszLd1XUpRFbq3kpYJ0=;
        b=V6tF0H4UUls87qEOa+UA1EZhwE2V/9nznHvCyBEq0D4N8TRv5SzhjW1Iau+ZWPNc/g
         MY67oG0txDDKH2O8Jp5qT/aSN2MnQXYnP/x26OIdaF8GFtd67UVgEgyaxc9hkuwivVng
         Lr3GaqHyU7sbv4QhsvOh2++jnCVFOt0iCZBfkFzCIAvCjbno1zy1nr3b2LKRhi6YwV2r
         pPeZ53BrYPLcGa8iOQKOhI7e4zWnuAahLNbHw1pumFZeV18WszOom1WsFngf104s+mTw
         oDUwGV8FUutqQt1pgz1vvluSX+qy3qZbqEOFyQ7ouaf1DaDfH/yQN0rI1MB4dx1IS9f3
         TQxw==
X-Gm-Message-State: AOJu0YzpdhrFICB1GBH26wztam9H5OJj4bS6QN/gTq9AiPR5zpn72gX1
	c31sSbruFTRqsCCsDBG4QH5NXReQcyUpHA==
X-Google-Smtp-Source: AGHT+IG+apFbX8Qk6zCL2ddi85GB+2f1O5YdfD7FXZBwFxyR2XaVMakd+0M4cOUqB3S5jC/eOiaphw==
X-Received: by 2002:a17:907:728b:b0:9e7:8ad0:a471 with SMTP id dt11-20020a170907728b00b009e78ad0a471mr8860928ejc.12.1701092299778;
        Mon, 27 Nov 2023 05:38:19 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906c40a00b009fd0a0b7ee5sm5671652ejz.9.2023.11.27.05.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:38:19 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] msgpack-c: upgrade 4.0.0 -> 6.0.0
Date: Mon, 27 Nov 2023 16:38:08 +0300
Message-Id: <20231127133808.1396531-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 13:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107059

- GTest should be OFF by default. -> https://github.com/msgpack/msgpack-c/issues/1066

Changelog:

- Remove C++ requirement if test is disabled (#1055)
- Change CMake package name of C library to msgpack-c (#1053)
- Unified all C package, library, cmake, tarball name become msgpack-c.
- Add additional address sanitizer for CI. (#1023)
- Change CMake package name of C library to msgpackc (#1044, #1049)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../msgpack/{msgpack-c_4.0.0.bb => msgpack-c_6.0.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_4.0.0.bb => msgpack-c_6.0.0.bb} (86%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
similarity index 86%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
index c6a6ac467..40d997a52 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                     file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    "
 
-PV .= "+git${SRCPV}"
-
 SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https \
            "
-SRCREV = "a9a48cea3a78ba661ee8096b5dab456361b0ff23"
+SRCREV = "8160ede5e20fd3019a77eea46d9c72cf6163f802"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
+EXTRA_OECMAKE += "-DMSGPACK_BUILD_TESTS=off" 
+
 BBCLASSEXTEND += "native nativesdk"
-- 
2.25.1


