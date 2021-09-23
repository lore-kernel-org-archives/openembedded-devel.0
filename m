Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.5889.1632409252575437846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 08:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDTXzXvh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id cf2so4268430qvb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Emr8TFXq8rMXPcbrqK/AIv57fEHzm8YOSGU4kdoKDcg=;
        b=DDTXzXvhe5ci9ke4vu9CJyk1j5UqThp8Pt5VLJxWKlgvx+ZdWr/KWucK4xl/GEQ9g6
         1VgdPmL6G4AYSv7tUS0eKqA3Y6m9tVozR4JUcju+m10FXfdvjj7IULpLkvKi4saolREN
         dvenpL8Uq+wTX2PSfSzkdeJVxHFf16WGDDoVm3uwJRJrDCTFsA6Gl/vHQfg+fay+zZ6p
         ONhgDErF1sNqXjTsvQBUJQCT9tIOHN/6lp99VCfnD3QaWQ3EvDbKnp9KbPwTVd+ikSpP
         sYsvpusXssdUeJQ4Sdnd8QxAp+kTKuvj7IAKDkS4GOU6Lj4jcOEwd84JH0jrO5K8ln4M
         OVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Emr8TFXq8rMXPcbrqK/AIv57fEHzm8YOSGU4kdoKDcg=;
        b=hdiwmnWOuhuK4pCDBQ9Tk39XntwnelmmJ8+4u2KcTZzUxn74iVgQtYaV+KTwrfVBRN
         N7d+Vsq1MCxmDHw0t2bXWNx13eb4kWssG5a0DDd8kIqcDG5GWvKSZ29cOs7V0RYHi8Y5
         6A0G3aOc+u61oYJFhWJ1ySZ2SuI8cgU+pTVQ4Ibshp4b4CsXUoPlm3Y0tpEEiyTqhGDB
         bpDSwRpbJqEquCU1sHJosrD4GjBALQtaIFPESW8T4LkI4yvG9U4gyKjTXzq4jExhnab/
         T7Q/XY1+k4IQq1QTvXHak3qDjlyCmcG8nkd61c2Jjm4jZQ2IHqHCPwi7JdVqWgQm8Eu9
         nejQ==
X-Gm-Message-State: AOAM5337xemz6W4EFCubNKshD/w+/qZZXyBaLVWTneMPGRPeG2yulr8J
	lDEP/qsLaorSdlxR3vCL+03tnTEQO3g=
X-Google-Smtp-Source: ABdhPJzedIul2xj1hp79+rCXKX8AEbZy697LxvM/xGL5zRUTpbQtDzJqro+vf06RUHcAKC95EKhz0w==
X-Received: by 2002:a0c:ab12:: with SMTP id h18mr4888279qvb.55.1632409251191;
        Thu, 23 Sep 2021 08:00:51 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id i17sm3352266qti.77.2021.09.23.08.00.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 08:00:49 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vk-gl-cts: allow the user to specify the target
Date: Thu, 23 Sep 2021 11:00:40 -0400
Message-Id: <20210923150040.39332-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building opengl-es-cts (for example), allow the user to pick which
target to build instead of hard-coding the 'surfaceless' target.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-graphics/vk-gl-cts/khronos-cts.inc  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index f61921473..a9c41f1f7 100644
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
@@ -36,7 +36,18 @@ SRC_URI:append:toolchain-clang = "\
 	file://fix-clang-private-operator.patch \
 "
 
-EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
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
+}
 
 CTSDIR = "/usr/lib/${BPN}"
 
-- 
2.30.0.rc0

