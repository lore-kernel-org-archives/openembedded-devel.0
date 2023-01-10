Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE44AC678D5
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:25:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.100812.1673346335862239112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 02:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFTi5P2y;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id jl4so12696112plb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reRy2y9dfbicFgvn0Pc+4X6v046OikZVf0qqEukz+uc=;
        b=jFTi5P2yJkEpXG0UZb7iiEbou2KBXc/aJc7s4nJyqpH4tDGnG0YV/HrfmJ3IM2/WkH
         Ekfw2Za/L9GTgmAUbG91NenjXg56evVgyaFPt4HTmQNp7z1iz2dFcOgGbBprVcI4n4NN
         p1CneE14SyCD3MzrDptKkSTEZGeqI9kFRzQ1b6RKXVjuvzspOay/EiaM4aOKreKTvG+O
         D54wN8w14PpLkFi9xjWsC1I/mlxPDwnyH/5Xe4s5SsP5WwY6avASjpjpj3zQ+5J4Fjh2
         ibn7mXcqUkTkHIL2VqlRSZtqDAU1XHsYQgkfdTF5k9BZAN7xZ0LMg6KppvLsogMXc84Z
         C1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reRy2y9dfbicFgvn0Pc+4X6v046OikZVf0qqEukz+uc=;
        b=isZX35onWLmWLgU6YV7cRvtjBhLR0OZFYTb/tdSQmYgTN06+bEpWO/9qOnwS5Uk0HB
         8KUxTvpZCaJ+sCk2KW16PMXXw44aHHehTsCRrGb+PZ1oOJtZJEh3gHHkoVcUjWqUFXz0
         bbGlnad92D8o2FJ1qGM1AUHuTVrfDbfiJX/NMa+D0oUJVVRE+WeMEYwG/zNNICL7f5ul
         OsKM6HCMjxxHPFsfe7ndWETY3JBq2OCZCPyOAIXmKIgxZNSY3xeufHOmxdlopmyAZ2/K
         cTyni3cbeVlYGLLPC+kZzPTVSpABg0UucXyDL+WvVUndSvtQFqbYyomVmCNEASn6D/dB
         YzCg==
X-Gm-Message-State: AFqh2kq8GQmZB1XJqb2SvW+QVGS+OSqdxsnEKDNCr+SnGunyx5+y4cvG
	CCl6UqaMfLkqtysddzbMjIGaXyhQsaNY+Q==
X-Google-Smtp-Source: AMrXdXvGHOaT0utZ4uGSq03ANHtJzK+kx8flPDablMoN/gt6A66l4M+Oq65B7Q1VewNEQzzTMb2Mjg==
X-Received: by 2002:a17:903:260f:b0:192:4b1b:6cdb with SMTP id jd15-20020a170903260f00b001924b1b6cdbmr68363525plb.7.1673346334935;
        Tue, 10 Jan 2023 02:25:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b0018975488514sm7747133plg.126.2023.01.10.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 02:25:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] freeglut: Add packageconfigs for x11/wayland/gles
Date: Tue, 10 Jan 2023 02:25:31 -0800
Message-Id: <20230110102531.619341-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 10:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100516

helps it compiling on on different openGL implementations which may not
implement fulll openGL specs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../freeglut/freeglut_3.4.0.bb                 | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 627ce23544..86b94149bc 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -6,14 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
 
-inherit cmake features_check
+inherit cmake features_check pkgconfig
 
-# depends on virtual/libx11, virtual/libgl
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+# depends on virtual/libgl
+REQUIRED_DISTRO_FEATURES = "opengl"
 
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
+PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,libxkbcommon"
+PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF,"
+PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
 # Do not use -fno-common, check back when upgrading to new version it might not be needed
 CFLAGS += "-fcommon"
 
 PROVIDES += "mesa-glut"
 
-DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
+DEPENDS = "virtual/libgl libxi"
+
+do_install:append() {
+    # Remove buildpaths
+    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
+}
-- 
2.39.0


