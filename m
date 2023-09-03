Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764E4C83F2D
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 13:32:46 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.27502.1693747957482950579
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 06:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=byD9O4xd;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52c4d3ff424so884475a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693747956; x=1694352756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYq7ZnKYvl3axtGENLWcxI/lOnRWzmvQP0/re3H5j2E=;
        b=byD9O4xdsMZaKLoinaNsBxpoCmJPR98N7Etg058hWnuclwXhf0IeJybYXEQH7Yz3u5
         ZqhgipYpLYZNdg7bU0KX9tKbmzfB+cDVSSFILyLpcObqS3upLsG9jjWs9E4eBQDCVzCj
         ENq5nZlVwPNFBx1zFaYFDtDByBgxLvoVhm76ud2/d11smbLWn1hPAYbCmnJ3SfULbEM4
         a9ajswHwSd5Txpwz0EJUGWbmLa+l2gCfyko4nFGy6AnZcEHZpDdTWZh5SRDCrX2R6Ppu
         8f/GIF6ICmAVdjMmerOfqfvvNZIbjdtVzP87O5BkkTdYouSx7o6zpka2SfBqR9sRTiGj
         Cpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693747956; x=1694352756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYq7ZnKYvl3axtGENLWcxI/lOnRWzmvQP0/re3H5j2E=;
        b=NPUqyWPJDCD3wmA2Wvl6mXDrnvBPhZs9Zy6vbvVqBN5nFuuRG5rB0MDSkDZoQYbtsB
         qAk5veMW2GIFDCfxEKvpSQisZgeYdSng7iOLGgFZcdbivZ9FNJmE3pZNjWYrM8LNmw1l
         Xp0RnC5N3C6xeiJ45m9Kd6D/rIYnO3vUHGF2QTnWVaJHuX9DevZXpUpkUVDbGJTCfsbx
         YuXAUV+GgbQWnC1BP9lvaLv38zYt72+HlTivQAGJdkWQ/HGOiRtxw3zVyMONj59pgyyr
         OfsvmyH12DHHhziUIHyHsyHYZEDT+iID21143H+d3C8LSffffn1sAbtAwqf0UTV2zZMe
         B1pQ==
X-Gm-Message-State: AOJu0Yx4YXMekgeWkzWHbQYdSxVC7ODV4dNTD4czGRZtTpu+EhWc1iin
	TBKdTHYw0MttPLD7vHCCmrO8M/9FeKg=
X-Google-Smtp-Source: AGHT+IF+t7juoCqNfv8AstXmk1emf91HwxYIP6DxVoru5AO5KDC5X8eYiyq0B71g6iH9eK+imcQyqw==
X-Received: by 2002:a17:906:6a8d:b0:99b:627b:e96d with SMTP id p13-20020a1709066a8d00b0099b627be96dmr5648633ejr.44.1693747955843;
        Sun, 03 Sep 2023 06:32:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b0099df2ddfc37sm4725270ejb.165.2023.09.03.06.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 06:32:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] khronos-cts.inc: respect MLPREFIX when appending DEPENDS with anonymous python
Date: Sun,  3 Sep 2023 15:32:11 +0200
Message-ID: <20230903133212.455899-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903133212.455899-1-Martin.Jansa@gmail.com>
References: <20230903133212.455899-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 13:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104699

* this causes 2 issues:
  lib32-opengl-es-cts depending on 64bit wayland and wayland-protocols:

  $ bitbake-getvar -r lib32-opengl-es-cts DEPENDS
  #
  # $DEPENDS [14 operations]
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:309
  #     ""
  #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:137
  #     [doc] "Lists a recipe's build-time dependencies (i.e. other recipe files)."
  #   :prepend /OE/build/oe-core/openembedded-core/meta/classes-global/base.bbclass:57
  #     "${BASEDEPENDS} "
  #   :prepend /OE/build/oe-core/openembedded-core/meta/classes-recipe/pkgconfig.bbclass:7
  #     "pkgconfig-native "
  #   :prepend /OE/build/oe-core/openembedded-core/meta/classes-recipe/cmake.bbclass:10
  #     "cmake-native "
  #   :append /OE/build/oe-core/openembedded-core/meta/classes-recipe/python3native.bbclass:11
  #     " python3-native "
  #   append /OE/build/oe-core/meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc:28
  #     "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
  #   :append[libc-musl] /OE/build/oe-core/meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc:38
  #     " libexecinfo"
  #   rename (to) classextend.py:108 [map_depends_variable]
  #     "DEPENDS_NONML"
  #   set classextend.py:109 [map_depends_variable]
  #     "${@oe.classextend.get_depends('DEPENDS', d)}"
  #   append classextend.py:110 [map_depends_variable]
  #     [vardeps] " DEPENDS_NONML"
  #   append cmake.bbclass:25 [__anon_30__OE_build_oe_core_openembedded_core_meta_classes_recipe_cmake_bbclass]
  #     " ninja-native"
  #   append khronos-cts.inc:77 [__anon_80__OE_build_oe_core_meta_openembedded_meta_oe_recipes_graphics_vk_gl_cts_khronos_cts_inc]
  #     " wayland-native wayland wayland-protocols"
  #   append khronos-cts.inc:79 [__anon_80__OE_build_oe_core_meta_openembedded_meta_oe_recipes_graphics_vk_gl_cts_khronos_cts_inc]
  #     " virtual/libx11 virtual/egl "
  # pre-expansion value:
  #   "${@oe.classextend.get_depends('DEPENDS', d)} ninja-native wayland-native wayland wayland-protocols virtual/libx11 virtual/egl "
  DEPENDS="cmake-native lib32-libpng pkgconfig-native python3-lxml-native python3-native qemu-native virtual/lib32-arm-oemllib32-linux-gnueabi-compilerlibs virtual/arm-oemllib32-linux-gnueabi-gcc virtual/lib32-libc virtual/lib32-libgles2 lib32-zlib ninja-native wayland-native wayland wayland-protocols virtual/libx11 virtual/egl "

* lib32-opengl-es-cts-dev runtime depending on 64bit wayland-dev wayland-protocols-dev
  as caught by multilib QA check:

  ERROR: QA Issue: lib32-opengl-es-cts package lib32-opengl-es-cts-dev - suspicious values 'wayland-dev wayland-protocols-dev' in RRECOMMENDS [multilib]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 097acc1a0b..72005636ea 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -74,9 +74,9 @@ python __anonymous() {
     distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
     if not bb.utils.contains_any("PACKAGECONFIG", ["surfaceless", "wayland", "x11_egl", "x11_glx", "x11_egl_glx"], True, False, d):
         if "wayland" in distrofeatures:
-            d.appendVar("DEPENDS", " wayland-native wayland wayland-protocols")
+            d.appendVar("DEPENDS", " wayland-native ${MLPREFIX}wayland ${MLPREFIX}wayland-protocols")
         if "x11" in distrofeatures:
-            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
+            d.appendVar("DEPENDS", " virtual/${MLPREFIX}libx11 virtual/${MLPREFIX}egl ")
 }
 
 CTSDIR = "/usr/lib/${BPN}"
-- 
2.42.0


