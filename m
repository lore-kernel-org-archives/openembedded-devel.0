Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.30477.1612753787399970344
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 19:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tVfoWTq4;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id y10so7052135plk.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 19:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1aC0HfMkMdEze0Ts5cU9txNMb+qltzU8jkj1AF2K0sg=;
        b=tVfoWTq4O7ArRabQkWWjRuWhSGqKJ2JFEDYswmB0OchroBvAl/Y3oR9LAWsa6/rZxW
         Fly/aT3KegR8reDTYSialhETWnTFlQmvr3ZOm1aQG3RomDJ3LdTNAPuWBKeTl+XscNv+
         YVtd3oVoUQPvQNIoGqcpeMMZmIBkFG9jxbuYZXfOkPMFzlY+hdz1+rSomfmsZp26RI4q
         XE+ucERKZFalFxv7c4iod05CW1iUNEkdm47Oue97+LGh7RZIAzLlZHxw6AS0wV+ZQpEV
         9BhAhcuVIzn42Ki0OHdGBjDR0YtOVwLKUC+H8I7SOVIudxtI1SqB/OBPNPpWEGXiiXTO
         f/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1aC0HfMkMdEze0Ts5cU9txNMb+qltzU8jkj1AF2K0sg=;
        b=U/h8hsRqEvSRCFkFq1adsGisRgzVMrudsPdHS59AM0Iufqjtb8/3h6hxAJeDfM4E46
         ZSHV/+9Dw3qZn3ia72qa+dQCGuFz8al+DfYGj1e6PEjtZqGnQ0QxV9ooUtKIZhi19CWg
         rtUEcNsjZHtYvjzkgCkfCy+m6Uaf+JtxW7BJj66SOvS0JaLTNSDTKPEgw3zDjyUXqwRT
         FubgPI3dPpyUB5glAOkZwnPZ/e3kOwGWxL1RCGy07Qw0Ko8E68eZJDms8dT5CC2kdFeK
         DIB8H4PSayslx5hksPrppQw4phSzAMrv+kBFifnIU6JLDT5OhSCOUorhw7aGcc7HrsnJ
         GqEQ==
X-Gm-Message-State: AOAM532Yt4f3UTO4qb0ZcbpjajgFuD9bw33Cs+D2bC/VL9wzjmIc3M/P
	cbZWfAYqGW/PBnBlhbv3BqWD7tFJjOM3aQ==
X-Google-Smtp-Source: ABdhPJz6TwEX6tHiu3VSYPxFtisGmAFTzUDAAZcO0P70zRVSvkAy/IBQ3FrTiLA/j3O8fLqjBZYFhw==
X-Received: by 2002:a17:90a:a88e:: with SMTP id h14mr15052649pjq.59.1612753786625;
        Sun, 07 Feb 2021 19:09:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id q17sm16974045pfl.143.2021.02.07.19.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 19:09:46 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libsdl2-mixer: Fix build with autoconf 2.70+
Date: Sun,  7 Feb 2021 19:09:43 -0800
Message-Id: <20210208030943.3141614-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure.in-Undefine-AC_CONFIG_AUX_DIR.patch | 34 +++++++++++++++++++
 .../libsdl/libsdl2-mixer_2.0.4.bb             |  8 ++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
new file mode 100644
index 0000000000..0605b32e30
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
@@ -0,0 +1,34 @@
+From 9363c98528ef850235852e44f678df6b5c011ee1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Feb 2021 18:08:36 -0800
+Subject: [PATCH] configure.in: Undefine AC_CONFIG_AUX_DIR
+
+This helps reconfiguring with autotools 2.70+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 5 -----
+ 1 file changed, 5 deletions(-)
+
+--- a/configure.in
++++ b/configure.in
+@@ -1,7 +1,6 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(README.txt)
+ AC_CONFIG_AUX_DIR(build-scripts)
+-
+ dnl Set various version strings - taken gratefully from the GTk sources
+ 
+ # Making releases:
+@@ -40,10 +39,6 @@ AC_SUBST(LT_CURRENT)
+ AC_SUBST(LT_REVISION)
+ AC_SUBST(LT_AGE)
+ 
+-dnl Detect the canonical build and host environments
+-AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
+-dnl AC_CANONICAL_HOST
+-
+ dnl Check for tools
+ AC_PROG_LIBTOOL
+ AC_PROG_CC
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
index 8f1960d8ad..6b6a531d38 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
@@ -4,18 +4,18 @@ DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f"
 
-SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a36e8410cac46b00a4d01752b32c3eb1"
+SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz \
+           file://0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch \
+          "
 SRC_URI[sha256sum] = "b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419"
 
 S = "${WORKDIR}/SDL2_mixer-${PV}"
 
 inherit autotools-brokensep pkgconfig
 
-EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --disable-music-ogg-shared LIBS=-L${STAGING_LIBDIR}"
 
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
 
 do_configure_prepend () {
-- 
2.30.0

