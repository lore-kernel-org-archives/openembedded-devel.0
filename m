Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.332.1632423311339881272
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 11:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQHYOWXr;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r16so7127156qtw.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZK+T1RZA8aXkP8cGy20qLNJmWeiYZfYtBeTtGfFC12Y=;
        b=MQHYOWXrbB9zAcFOTIR9BvAUw/CB0kgixjG2OIKjrrQCg16zm/1ivQb/NZ+NFl1c3l
         YTovkyfJcK2lJY2Sk8y1zXpFr7fN51b5+B8R24iTi2mnrnrK5GDDM8jqd06C5cpX4aEU
         3jdzr9l6B7oGlXJImTLkOE4/XfVnYaTuJ2BjgJ+w5/eXnaDUsEahs605A2vEKB76AlUM
         541C8/bKrV2lMNM5KhbPNp1kz4HwKRsd1BEwNdneTY9PuTFpo+oUrR3OJSeyEy2JXcB7
         9KJjN7nia8bJ/FA7W30Hw11N8VZEcZK1RUWo2+Ut0eJJUQpsZqAEmHnlQyZDd0c+Ay5N
         /pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZK+T1RZA8aXkP8cGy20qLNJmWeiYZfYtBeTtGfFC12Y=;
        b=NVHfRUYLP3kVzoil3+xqAF9OI6mZTiiZc/1at94f42cUmw4M56OxcnD1ngb1Ys2ssY
         NqeBSKI1gCcuiW4ynPFRUHJtRhEpz/onSnPfvjlqsegz+nF08M0ItMarRwkPMg7q7fhv
         JoSzqaYqWSXVik1TN8Hpkk5wIJ/x1pUrTT5dQYY56V8x5no20Vzdh3FOpS6CwGuQ1Upq
         Sr/NjCfeOMMi73Z8eQlSmlhO/CSla5CaEqlz80A0PW6lNpyOBRJZCDO8MmyreknA/P90
         SnNZCB7pDvEnJ2TfxlbVc5OA9QYPvgmGWehCgMYk1mcSkHYdomUvi5mWlDwajnntCZpT
         zZrw==
X-Gm-Message-State: AOAM533F6A39lED++eeXAs04/bmRoQvICZcz1cJ4py5hRKY5dlzWDoo0
	1Cgo5+d+p1GX4P9t+bKvRXHnWclEiPQ=
X-Google-Smtp-Source: ABdhPJyA9eqehdn5q2Z29yC1bzdHNIJ5+uOw20vGSBXBF9WQsm9znDqU6S+OUao32piGGiot/AP89Q==
X-Received: by 2002:ac8:4702:: with SMTP id f2mr281111qtp.50.1632423309838;
        Thu, 23 Sep 2021 11:55:09 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a17sm3971115qtn.86.2021.09.23.11.55.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 11:55:09 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify the target
Date: Thu, 23 Sep 2021 14:55:06 -0400
Message-Id: <20210923185506.2188-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building opengl-es-cts (for example), instead of hard-coding a
specific target to build (surfaceless), leave the choice empty by default
which instructs the package's build system to search the sysroot and try to
determine which target to use (i.e. the "Default" target).

Provide overrides (in the form of PACAKGECONFIGs) to allow the user to
specify a specific target to build (if they don't want the target selected
automatically).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- add logic to try to guess which dependencies (x11/wayland) will be
  required in the case where the user doesn't set a target explicitly
- add comments to explain the code, and explain how the newly added
  PACKAGECONFIGs work
---
 .../vk-gl-cts/khronos-cts.inc                 | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index f61921473..903f006db 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake features_check
 
-REQUIRED_DISTRO_FEATURES += "opengl"
+ANY_OF_DISTRO_FEATURES += "opengl wayland"
 
-DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
+DEPENDS += "libpng zlib virtual/libgles2"
 
 SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
             file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
@@ -36,7 +36,34 @@ SRC_URI:append:toolchain-clang = "\
 	file://fix-clang-private-operator.patch \
 "
 
-EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
+# The best thing for the user to do is to not specify any of the following
+# PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
+# probing and build what it thinks is appropriate.
+# However, if you want, you can specify one of the following PACKAGECONFIGs
+# to override this behaviour.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,"
+PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland"
+PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl"
+PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11"
+PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl"
+
+python __anonymous() {
+    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
+    if len(packageconfig) > 1:
+        bb.fatal("only one PACKAGECONFIG of 'surfaceless wayland x11_egl x11_glx x11_egl_glx' can be specified at a time")
+
+    # if the user doesn't specify any PACKAGECONFIG then the cts build system
+    # is going to probe the sysroot to try to figure out what to build
+    # in this case we try to guess whether the user is building for wayland
+    # or x11 and add the required dependencies automatically
+    distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
+    if len(packageconfig) == 0:
+        if "wayland" in distrofeatures:
+            d.appendVar("DEPENDS", " wayland ")
+        if "x11" in distrofeatures:
+            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
+}
 
 CTSDIR = "/usr/lib/${BPN}"
 
-- 
2.30.0.rc0

