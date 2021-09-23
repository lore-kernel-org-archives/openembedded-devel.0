Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.2416.1632433187769968214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 14:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fquNEI93;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id e16so7518064qte.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 14:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/tbF5Cwt0d6yi5idvywIgbJ5safpGiTSnGxxkI3alhI=;
        b=fquNEI93eK4vY33W/wCkIdHPtQiRldhpsEqzdRP/z/sGswpeJKl7azPU+MOIQSFOiM
         Uy1sF7MehLj2tzKcp0lyfL4iSeaXka+C/7U3jliSWb787VvhJ54StREQqtBqIDVR0Jur
         clBOnIuqi7LwmyE0A6cM3ZUatfCqPn0gdoEsW7hhbD0y9FbXKZbWDLBuGjQRznU+Hgq8
         qHYgOZ+Kn7QzaAz5EJ5/b2NXH8UdsozaXLN+TuRIK0FzO49B3+VhIYML0NDCEijG6gjl
         qCqRiVqq9cqI9e7VHXmgS5X0X4cgk3zAqHPMJcFymOQFAjm5hqybaYQdQnJ8xiZeKe30
         gctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/tbF5Cwt0d6yi5idvywIgbJ5safpGiTSnGxxkI3alhI=;
        b=rJqZT7g844mpiV8dgILg4vZFjp7ofsosxerSVgHIlsjyzqv6qUg1xIv4VkYngs8DpX
         q+5WzWjpvd5yBp4Iqi0gWWG6xnYW0rQeq9PuCJufKn+a0kKs9P2oA9vn7ENIwx1oFaY0
         uFgJzbjmEy44eHe+B3EROsIEuFLRWjMWS3H4LPBNY7+ZaIM+nM52bjcKffyQA3jY1/Hl
         QxbvT/qheTvq4WKVBnP7l4Sz4xscLnS09FBVPssmeADANjiKq/arkn0D82UoHMBxpN+f
         pNE8meLIswbm4758JEjwhr9KOodWdhz4YiMKKCt8lE/XzYcehlP+Av2URNO0qUQEczhO
         wPuQ==
X-Gm-Message-State: AOAM530/CKcp91yGttxqWMEJoHXTZOn8WFt7dqpLtrtgnBdpDsSuU444
	nIjYgHBO66ujFPQ20pqVK4YAUuFyHX8=
X-Google-Smtp-Source: ABdhPJyO/u0O2jdEiCB1st7m4R7AX9YrDoqW9c4J08lrjNj/RRc9YKrh3F1cdtZABE/KNWuVEogaHw==
X-Received: by 2002:a05:622a:295:: with SMTP id z21mr935563qtw.125.1632433186292;
        Thu, 23 Sep 2021 14:39:46 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id v8sm4000018qta.21.2021.09.23.14.39.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 14:39:45 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] vk-gl-cts: allow the user to specify the target
Date: Thu, 23 Sep 2021 17:39:41 -0400
Message-Id: <20210923213941.24426-1-twoerner@gmail.com>
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
changes in v3:
- incorporate feedback from Saur:
  - use the 6th argument to PACKAGECONFIG to enforce mutual exclusion
  - use bb.utils.contains_any() instead of checking for 0 packageconfigs
- the code works as-is, but would have to be re-written if more
  packageconfigs are added, especially if they don't have anything to do with
  the cts targets
- not to mention these updates are more elegant than my original code

changes in v2:
- add logic to try to guess which dependencies (x11/wayland) will be
  required in the case where the user doesn't set a target explicitly
- add comments to explain the code, and explain how the newly added
  PACKAGECONFIGs work
---
 .../vk-gl-cts/khronos-cts.inc                 | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index f61921473..881d6ca82 100644
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
@@ -36,7 +36,30 @@ SRC_URI:append:toolchain-clang = "\
 	file://fix-clang-private-operator.patch \
 "
 
-EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
+# The best thing for the user to do is to not specify any of the following
+# PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
+# probing and build what it thinks is appropriate.
+# However, if you want, you can specify one of the following PACKAGECONFIGs
+# to override this behaviour.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,,,,wayland x11_egl x11_glx x11_egl_glx"
+PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland,,,surfaceless x11_egl x11_glx x11_egl_glx"
+PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_glx x11_egl_glx"
+PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11,,,surfaceless wayland x11_egl x11_egl_glx"
+PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_egl x11_glx"
+
+python __anonymous() {
+    # if the user doesn't specify any PACKAGECONFIG then the cts build system
+    # is going to probe the sysroot to try to figure out what to build
+    # in this case we try to guess whether the user is building for wayland
+    # or x11 and add the required dependencies automatically
+    distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
+    if not bb.utils.contains_any("PACKAGECONFIG", ["surfaceless", "wayland", "x11_egl", "x11_glx", "x11_egl_glx"], True, False, d):
+        if "wayland" in distrofeatures:
+            d.appendVar("DEPENDS", " wayland ")
+        if "x11" in distrofeatures:
+            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
+}
 
 CTSDIR = "/usr/lib/${BPN}"
 
-- 
2.30.0.rc0

