Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A88CD5BC9
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 14:45:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17257.1779720308544129969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 07:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mWAXl5+I;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d734223e4so6117787f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720307; x=1780325107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMYMZmAjpiYNUrkBTMjWiOZnthEp7ZlMAfLq48SneZ4=;
        b=mWAXl5+Ic4w4UHYghESaH3GHpUPDbl08InQMHgwfeEdcm9KiGIv2wzmAh5SVjJ8g19
         qr3xB/bB4oPgMQPhrJ5SDGELx2rsEt30b3NPvKOQYRHQ4MbJkqGPu3nLVQkIISFvydbn
         0bwZCPKRts6iJfWeZu6iHzRp0KFbaD21dPcGMuVASrjH7bEDYKRy0TJOrrkZdxXRvXuo
         zzu9uUZNXoZkOsuTJxJQdSQ5tDaTXGQi1v1JjXJHVAs+WB/vrE64F4/AsEFLVb27YEPg
         eeuvSFboxXsqwk8d6oZUyGJnctEQQpAlQZMtH8q+BIQz12y2ErrHHDhJF8yaXqRFaTth
         zL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720307; x=1780325107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMYMZmAjpiYNUrkBTMjWiOZnthEp7ZlMAfLq48SneZ4=;
        b=jJUBJ1OPkdLaDjTwID2uHV+qz26D79tB+EICNSifYpi9vWCRwprm6vXG9FnnJ/fot2
         FF1X8x0blGyoLR02S1pJtUP+smRXAde0dTWWAZT+3Hoqc0rdzYLFOUF25aj3SlNq8XeC
         msmFOOu9aHOtpG21pK1RSI9oCuzjGwtjN7oVATHCsti0CDal0ffEsHSevrvSzT8KU0xA
         8dxRFtE1stnub305dE4LKNm3KZezjZs+S+Rp0MjXIvsO1DEb/fp49uyDWgD4ZYwVfvt+
         YZcXUOu4jnavD2mMlyZi6RGsSoKH6UUbVI5OiLMfe0suiNg/SViQYTN4bq3rgaQ9enLi
         lyYQ==
X-Gm-Message-State: AOJu0Yxp5Q+4sY2sS/NMFLI9nIyNnNKgHith3mVx0XZEB2uff+ItMwOq
	kw6cjGeRD5Kcn+paxxFBLf4qjMNvKZen8A5ykb6nquPkEWlOJnHLdc1r4Hjlzw==
X-Gm-Gg: Acq92OH0Kmq3RUJKFClWls+V7pOHlNPf/XokJ9INESr75xHc0B1d23cdCg3pAX8UkZo
	s+pVeJzcQlywZi4H2tSpJiSzf1kIX7TjGuJSAzTleWroEpCN18KchfIOhmpXFx8u+RsLBpLulXg
	6byXgu16cIcLV3U+8obo7ovQ+5Y26T8PX81vuMrLqlENHam87bxAVkOdGGHTqFC6RtYuGmaYajg
	n8eEQxPkEOZ+1GYeZQCu/60i9Wg1PPF8tz/yno2g00C3YmZLSDvlXtfZRTrhCj6BzKyJlpl5aP6
	F7qoK/EBV8GON0bejko5sCqyFcDYz/Vgxt9a3luc9cwdcfYinCbJCyyrOfvqZvRDz85vm4/6vH6
	xQ1/PiU+6GivtWqSdUzZQavPY5Aaen+07MLMb6GLK1gP4AvKjW9LpWsETetV1ZO3gQsN9LDGej6
	Lf/cUG4PbLVK9fON/h6Qoxq5B4FJ/H4UALAeOfo7wa/bTAViBa9t5ZElpupVQEebs9CcvwhRFXx
	bvdhEwkTVZTfzGzjJlxvJHgn3B5sSWUCA==
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr19531689f8f.4.1779720306730;
        Mon, 25 May 2026 07:45:06 -0700 (PDT)
Received: from ThinkCentre.fritz.box (p200300cfaf475000947834ddeb1f7561.dip0.t-ipconnect.de. [2003:cf:af47:5000:9478:34dd:eb1f:7561])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm26674063f8f.4.2026.05.25.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:45:06 -0700 (PDT)
From: toertel@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de,
	wangmy@fujitsu.com,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH] libsdl2-net: Ensure packaging of SDL2_net.pc
Date: Mon, 25 May 2026 16:43:16 +0200
Message-ID: <20260525144455.197612-1-toertel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127201

From: Mark Jonas <toertel@gmail.com>

SDL2_net does not install SDL2_net.pc. Thus, libsdl2-net cannot package
the file. Fix this by applying an upstream patch.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 ...001-cmake-always-install-SDL2_net.pc.patch | 93 +++++++++++++++++++
 .../libsdl/libsdl2-net_2.2.0.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-always-install-SDL2_net.pc.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-always-install-SDL2_net.pc.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-always-install-SDL2_net.pc.patch
new file mode 100644
index 0000000000..0a717a60ae
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-always-install-SDL2_net.pc.patch
@@ -0,0 +1,93 @@
+From 6aceea847131f8ee208d8b8adec336fafcf30d48 Mon Sep 17 00:00:00 2001
+From: Anonymous Maarten <anonymous.maarten@gmail.com>
+Date: Wed, 31 Aug 2022 15:15:43 +0200
+Subject: [PATCH] cmake: always install SDL2_net.pc
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL_net/commit/fb8031364ad852d51faf5b64040440857f5e8f26]
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+---
+ CMakeLists.txt | 67 ++++++++++++++++++++++++++++----------------------
+ 1 file changed, 37 insertions(+), 30 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bf30a70..c34e3f0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -204,39 +204,46 @@ if(SDL2NET_INSTALL)
+         COMPONENT devel
+     )
+
+-    if(SDL2NET_BUILD_SHARED_LIBS)
+-        # Only create a .pc file for a shared SDL2_net
+-        set(prefix "${CMAKE_INSTALL_PREFIX}")
+-        set(exec_prefix "\${prefix}")
+-        set(libdir "\${exec_prefix}/${CMAKE_INSTALL_LIBDIR}")
+-        set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
+-        set(PACKAGE "${PROJECT_NAME}")
+-        set(VERSION "${FULL_VERSION}")
+-        set(SDL_VERSION "${SDL_REQUIRED_VERSION}")
+-        string(JOIN " " PC_REQUIRES ${PC_REQUIRES})
+-        string(JOIN " " PC_LIBS ${PC_LIBS})
+-        configure_file("${PROJECT_SOURCE_DIR}/SDL2_net.pc.in" "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate" @ONLY)
+-        file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc" INPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate")
+-
+-        set(PC_DESTDIR)
+-        if(CMAKE_SYSTEM_NAME MATCHES FreeBSD)
+-            # FreeBSD uses ${PREFIX}/libdata/pkgconfig
+-            set(PC_DESTDIR "libdata/pkgconfig")
++        if(SDL2NET_BUILD_SHARED_LIBS)
++            set(ENABLE_SHARED_TRUE "")
++            set(ENABLE_SHARED_FALSE "#")
++            set(ENABLE_STATIC_TRUE "#")
++            set(ENABLE_STATIC_FALSE "")
+         else()
+-            set(PC_DESTDIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
++            set(ENABLE_SHARED_TRUE "#")
++            set(ENABLE_SHARED_FALSE "")
++            set(ENABLE_STATIC_TRUE "")
++            set(ENABLE_STATIC_FALSE "#")
+         endif()
+-        # Only install a SDL2_net.pc file in Release mode
+-        install(CODE "
+-            if(CMAKE_INSTALL_CONFIG_NAME MATCHES \"Release\")
+-                # FIXME: use file(COPY_FILE) if minimum CMake version >= 3.21
+-                execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy_if_different
+-                    \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc\"
+-                    \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
+-                file(INSTALL DESTINATION \"\${CMAKE_INSTALL_PREFIX}/${PC_DESTDIR}\"
+-                    TYPE FILE
+-                    FILES \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
+-            endif()" COMPONENT devel)
++
++    set(prefix "${CMAKE_INSTALL_PREFIX}")
++    set(exec_prefix "\${prefix}")
++    set(libdir "\${exec_prefix}/${CMAKE_INSTALL_LIBDIR}")
++    set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
++    set(PACKAGE "${PROJECT_NAME}")
++    set(VERSION "${FULL_VERSION}")
++    set(SDL_VERSION "${SDL_REQUIRED_VERSION}")
++    string(JOIN " " PC_REQUIRES ${PC_REQUIRES})
++    string(JOIN " " PC_LIBS ${PC_LIBS})
++    configure_file("${PROJECT_SOURCE_DIR}/SDL2_net.pc.in" "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate" @ONLY)
++    file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc" INPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate")
++
++    set(PC_DESTDIR)
++    if(CMAKE_SYSTEM_NAME MATCHES FreeBSD)
++        # FreeBSD uses ${PREFIX}/libdata/pkgconfig
++        set(PC_DESTDIR "libdata/pkgconfig")
++    else()
++        set(PC_DESTDIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+     endif()
++    # Always install SDL2_net.pc: libraries might be different between config modes
++    install(CODE "
++        # FIXME: use file(COPY_FILE) if minimum CMake version >= 3.21
++        execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy_if_different
++            \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc\"
++            \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
++        file(INSTALL DESTINATION \"\${CMAKE_INSTALL_PREFIX}/${PC_DESTDIR}\"
++            TYPE FILE
++            FILES \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")" COMPONENT devel)
+
+     if(SDL2NET_BUILD_SHARED_LIBS AND (APPLE OR (UNIX AND NOT ANDROID)))
+         install(
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
index 4a7ada94cb..8a1ff45a3d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=68a088513da90254b2fbe664f42af315"
 
 SRC_URI = " \
   https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz \
+  file://0001-cmake-always-install-SDL2_net.pc.patch \
 "
 S = "${UNPACKDIR}/SDL2_net-${PV}"
 
-- 
2.43.0


