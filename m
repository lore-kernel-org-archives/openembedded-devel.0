Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.25596.1621872530125837782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 09:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRdio7jU;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id t3so32594276edc.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jiJmayOxBAzLZidcPY9pHtx8JeYfaVP+fcCUGwFJ1Gs=;
        b=WRdio7jUiecre4840mCml6c0cODXBXo6Tq3CM0vQA5qEu2LgD2kWypXa/yACdHNTP0
         AWk7/Ek3HBn+ACtqjjEhPoxhHI6X8oERWoLu4UEw2NVqi+pmRVK+xzFp321+WUhRHQ6g
         ciiU7kKXWuVvLeHEjIWsmmls8v1pnlqgunOmfsJsrz3lcexo44qrVheG4icqfry+E6QD
         E9VkA5qdVNz/oa/QyRvZ7It6mDW5qYGfqS9LigztDfOBJHEnqEchNRShFKC3Qx002ea9
         DbnssGGlPEXtFFW6huhqUq4KXgIoeT/F7qQeuOooZ99am0vlMYEtPJx4UTGTckjugIpJ
         cocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiJmayOxBAzLZidcPY9pHtx8JeYfaVP+fcCUGwFJ1Gs=;
        b=OgOKOKGzsqshmNImALo+gIr/hqtCBoz0rZjkXIQPWO1ILd9aWJCrfHGfXvfc4oYWfU
         fU3bIzz50tvFnx2yrGsfzcccoxvgHw4rfHg5/nDkJzw8LkTsfblZc8GW81U0EjXtCKnK
         /2Rn5EcKOUAi3QZ23xbHQMtv+QRInwt8649mGADaBrv8X/Uxi2GhvI0quWFF+UwuD6nd
         Oo4kaspaHO8y1l1H49xniLw4+9FdcLF7/kqmut/r5vxnblJ1+aZx8oj61qMbPhKahcqp
         eD8woFwK9RkAV88NWsCp2Li0CgotQIV/SFpXJcPFezHiha49hG9IJQ2N1BIgFvJplTZB
         CHOA==
X-Gm-Message-State: AOAM532hYJUDMQ+GtgdBFku6UH7phbd6Ktq5aTVdvje6W3zUZ5mz0gy1
	GiXWyELyQB5nfwZiiRXN2P87giPUNKA=
X-Google-Smtp-Source: ABdhPJymOa8bIkNVWyBIoyylBDr//hNH3hKIZG95JrAXbIfdoyWwcN1XEKxCgLwCNV9mdIwz9jw8JQ==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr26614350edu.306.1621872528733;
        Mon, 24 May 2021 09:08:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b189e31b9623dc41a84.dip0.t-ipconnect.de. [2003:f0:7f1a:3b18:9e31:b962:3dc4:1a84])
        by smtp.gmail.com with ESMTPSA id k22sm7953470eja.33.2021.05.24.09.08.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:08:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] mpv: upgrade 0.32.0 -> 0.33.1
Date: Mon, 24 May 2021 18:08:38 +0200
Message-Id: <20210524160840.194431-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524160840.194431-1-schnitzeltony@gmail.com>
References: <20210524160840.194431-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PACKAGECONFIG / configuration changes were necessary:
* libass is mandatory
* luajit on aarch64 is fine
* wayland requires egl
* --disable-libsmbclient is gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mplayer/{mpv_0.32.0.bb => mpv_0.33.1.bb}  | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.32.0.bb => mpv_0.33.1.bb} (89%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.33.1.bb
similarity index 89%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.33.1.bb
index 171eef7b7..1a9150479 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.33.1.bb
@@ -3,7 +3,13 @@ DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features wi
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mpv.io/"
 
-DEPENDS = "zlib ffmpeg jpeg libv4l"
+DEPENDS = " \
+    zlib \
+    ffmpeg \
+    jpeg \
+    libv4l \
+    libass \
+"
 
 DEPENDS += " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' virtual/libx11 xsp libxv libxscrnsaver libxinerama', '', d)} \
@@ -12,9 +18,9 @@ DEPENDS += " \
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=91f1cb870c1cc2d31351a4d2595441cb"
 
-SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
+SRCREV_mpv = "b5d3e43198b9d57af5620b63537885aaa41fa8cd"
 SRC_URI = " \
-    git://github.com/mpv-player/mpv;name=mpv \
+    git://github.com/mpv-player/mpv;name=mpv;branch=release/0.33;protocol=https \
     https://waf.io/waf-2.0.20;name=waf;subdir=git \
 "
 SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
@@ -27,18 +33,16 @@ LDFLAGS_append_riscv64 = " -latomic"
 
 LUA ?= "lua"
 LUA_mips64  = ""
-LUA_aarch64  = ""
 LUA_powerpc64  = ""
 LUA_powerpc64le  = ""
 LUA_riscv64  = ""
 LUA_riscv32  = ""
 LUA_powerpc  = ""
 
-# Note: both lua and libass are required to get on-screen-display (controls)
+# Note: lua is required to get on-screen-display (controls)
 PACKAGECONFIG ??= " \
     ${LUA} \
-    libass \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
@@ -46,11 +50,10 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
 PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,"
+PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgbm"
 PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
-PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
@@ -90,7 +93,6 @@ EXTRA_OECONF = " \
     --confdir=${sysconfdir} \
     --datadir=${datadir} \
     --disable-manpage-build \
-    --disable-libsmbclient \
     --disable-libbluray \
     --disable-dvdnav \
     --disable-cdda \
-- 
2.31.1

