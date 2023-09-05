Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D4FC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:02:42 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.20568.1693918961990332286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D+VhlP05;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5280ef23593so3191635a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693918960; x=1694523760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBdI0vnnZnWBXQCtfbJNy1iiMwIibaUyzbPmeuxLybc=;
        b=D+VhlP05QExp7L5Yaqdkt8dlLzPp75rU3PjT4THGr7uEKr74GNKWQ4jNIXTPw0wz4/
         1zs14JCoF3xinnGXicdwXB5Eo45jKzPtsKn/Z2IPMexpWMr2rHul4jUsE6HnmMTkv5cb
         EmcwomiEEvIyBQe00Kuf2P08CaY5RNwBvrIcv0jF4rg7ieDGulFcAUyC/CpKned/fbYz
         RGW0AsBnR0Da6yMJnmksRNNzUmqq9xhuRHZSHD2Pk2VesbVr3pYFbTB67iK5k2NOl3sk
         TGD4+X4AdK+LsNImTD3liUA/AmfVnZGJCOFJTAxQOAztiv+vZz5+C5uYgLIsj0ntnJ3D
         DuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693918960; x=1694523760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBdI0vnnZnWBXQCtfbJNy1iiMwIibaUyzbPmeuxLybc=;
        b=VfFCsyXLGY/FN8PbjrUoooeCYeqCgJorDYq4Ao+5orRVXZGCQZ+r83ZbmlqmTu9GRh
         RZ5yz6FvWof6zjb3cInn8mYgW/MMUjju2cuCtOWU64eJOm48kLDzttTKy+aAzSwpnqNW
         LqgPDkRd1jM9yODr6GcdWiseeBGWegoRKzDA6O4VEcmej9PIYO8nqYqxKHYV+JpsNTiI
         Ypz0CXSiQtgbf3iDcmVX56Do0qv+ip+kzVFlC5vGMFMFuX1kNN6ALD23ZUqjvP/UST/g
         zdUqiEWUhdFNhP25M5L1F1pc/8Kgjs7n7BwIFl4MWFrgYnqt+nLm6czp+fWZAKgNbHw1
         G4OQ==
X-Gm-Message-State: AOJu0YyRlW5Fs3rswoFB41sSIN+SpJ4rDlgxfq/zHefLPqM303LdpuQY
	Px7EkUO5OBXKgr1wkDTHqqPsuKpOGNc=
X-Google-Smtp-Source: AGHT+IHpAOO6cTB5jxcmRwDUEZv4+rQ6D87iar+DXHwyfn1feGDSkEOeEohBnZIXdltizXNW+52Pmg==
X-Received: by 2002:a05:6402:6d4:b0:523:18db:e3ab with SMTP id n20-20020a05640206d400b0052318dbe3abmr9393088edy.39.1693918960270;
        Tue, 05 Sep 2023 06:02:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p11-20020a056402074b00b005231e1780aasm7031786edy.91.2023.09.05.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 06:02:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 2/4] khronos-cts.inc: respect MLPREFIX when appending DEPENDS with anonymous python
Date: Tue,  5 Sep 2023 15:02:20 +0200
Message-ID: <20230905130222.1448129-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
References: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 13:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104723

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 4fd32d93c2..e05e35fe0e 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -72,9 +72,9 @@ python __anonymous() {
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


