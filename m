Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8588.1619883095549262030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 08:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/OGeJSf;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id i13so1152007pfu.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E6j1EQ3wlviIA5NIPOiLnjJhDs8FvUHFdMkASQtsaJA=;
        b=A/OGeJSfYHJ/ZpAvGdeXQSL4QqPz09lYGUwvMJphU1wQAVKDQV0SGSxT3C4+6Go8Js
         3KQJDYrNaO8HfaZ0cedbDfXzRAYtjnYQoKSm+3Ns3R21EY0bWR9kd0XSWylwRoyFhBbZ
         2ZqS1Dmq6UXmybASN2YWQLCW1OAQjSdSeaQhSoOV6Ey43079OejSkjuA/lB9GxN9qKyI
         OjuQBprKVH2nSA0xFQzyT+UdqsaWJR79FzEH3Rl+ZVk+bYzmRA96dHImkSlO/z46zQ8o
         x6Y25BDrd0taESq+2xJK2+6STUh9yLcHlniYkRDXlG/7A3Ry7hqPjgIMLU4nDfqhS2Gu
         DZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E6j1EQ3wlviIA5NIPOiLnjJhDs8FvUHFdMkASQtsaJA=;
        b=IMmOASyz6sj+0jn1dJ/8Jt/1DsxqGwSg+wv4sOz94e2WwP6LW+GzcifCWBEpiBSVKn
         Ihoc6WbNb5Lac5kyY4C6N0rwHAqha97sXm7EYMW571iXejnUZO1bph4qOMegPAbVOv6U
         48XrYRQTy4aBt3OCg5v4YJpDmn6pwpBYQDxFo8nvzcLidEPqk/TapaMcvHHQuG9sYACp
         N6yih9m74Fj7dTe3dIbapbFRHGqZyVyOKAsJL4gp/3M/pAZiSEaBQ6rikbL5lo685FK/
         rJMUHlRtw1kA6J5RvaIDNufpZi0GEvMg6rMcUsTirjSZJB43x2LlX6oHnycil8Z858Hc
         PerQ==
X-Gm-Message-State: AOAM5332iw5xOULJDLItgt41HrQenTU825oy5ZMMzxHvjB7qQG9U6VXj
	EkycVRTq8nfYlu2YRtraVDIGxzkrhoB/OQ==
X-Google-Smtp-Source: ABdhPJziBbyA/ImpntvOys4xLup5GtPd6qpGN8fas2LFSFbs1WYm32tgBiYPHGaIb2fTGKfN8C2/sw==
X-Received: by 2002:a05:6a00:1a8c:b029:27d:25f3:20d4 with SMTP id e12-20020a056a001a8cb029027d25f320d4mr10274825pfv.30.1619883094743;
        Sat, 01 May 2021 08:31:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id h9sm4807232pfv.14.2021.05.01.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 08:31:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gegl: Update to 0.4.30
Date: Sat,  1 May 2021 08:31:32 -0700
Message-Id: <20210501153132.445455-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix build on build hosts with OpenEXR 3.0
Drop SDL2 patch, its upstream in this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gegl/0001-Fix-build-with-OpenEXR-3.patch  | 28 ++++++++++++++++
 ...on.build-Give-note-if-sdl2-was-found.patch | 32 -------------------
 .../gegl/{gegl_0.4.28.bb => gegl_0.4.30.bb}   |  4 +--
 3 files changed, 30 insertions(+), 34 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gegl/gegl/0001-Fix-build-with-OpenEXR-3.patch
 delete mode 100644 meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.28.bb => gegl_0.4.30.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl/0001-Fix-build-with-OpenEXR-3.patch b/meta-gnome/recipes-gimp/gegl/gegl/0001-Fix-build-with-OpenEXR-3.patch
new file mode 100644
index 0000000000..b2f13afd5d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gegl/gegl/0001-Fix-build-with-OpenEXR-3.patch
@@ -0,0 +1,28 @@
+From 073d622fbf8564271cd9be87c2f619ea00498578 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 May 2021 08:25:24 -0700
+Subject: [PATCH] Fix build with OpenEXR 3
+
+Add a header that is no longer transitively included
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gegl/-/merge_requests/96]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ operations/external/exr-save.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/operations/external/exr-save.cc b/operations/external/exr-save.cc
+index 1e8c09d..87abed5 100644
+--- a/operations/external/exr-save.cc
++++ b/operations/external/exr-save.cc
+@@ -45,6 +45,7 @@ extern "C" {
+ #include <ImfChromaticities.h>
+ #include <ImfStandardAttributes.h>
+ #include <ImfArray.h>
++#include <ImfFrameBuffer.h>
+ #include "ImathRandom.h"
+ 
+ 
+-- 
+2.31.1
+
diff --git a/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch b/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
deleted file mode 100644
index 6a49f1d7ce..0000000000
--- a/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6bed199a73a7af39344cf8e799b665011553600c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 8 Feb 2020 14:29:52 +0100
-Subject: [PATCH] meson.build: Give note if sdl2 was found
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Configure output confused me a bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 9d5b484..296b5f3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -374,6 +374,7 @@ message('\n'.join(['',
- '  OpenEXR:         @0@'.format(openexr.found()),
- '  rsvg:            @0@'.format(librsvg.found()),
- '  SDL:             @0@'.format(sdl1.found()),
-+'  SDL2:            @0@'.format(sdl2.found()),
- '  libraw:          @0@'.format(libraw.found()),
- '  Jasper:          @0@'.format(jasper.found()),
- '  av libs:         @0@'.format(avlibs_found),
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
index 810036162c..d08a3a3c9a 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.28.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
@@ -24,9 +24,9 @@ SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = " \
     https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
-    file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
+    file://0001-Fix-build-with-OpenEXR-3.patch \
 "
-SRC_URI[sha256sum] = "1d110d8577d54cca3b34239315bd37c57ccb27dd4355655074a2d2b3fd897900"
+SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
 PACKAGECONFIG_class-native = "libpng librsvg"
-- 
2.31.1

