Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.16745.1594910103370792553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=krKGgL9D;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id q3so5220390ilt.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMmqITo4+z0uHB6LX3x+aF6HxaY9pQthzj8Mu13LNYM=;
        b=krKGgL9DVhO1Wb+KQizi1XbrPpdnJimAfn5wyLijoTR0/pN8xUTuXawTih4v5/WaaN
         K5t1VEv9nvuYccqn15UTrVP10TxC0+sixXrpPPPPCPSfN55XMu5HFcj3Nf6hjzz30s3x
         ufK5kuiMwQJR9yd0JAoeVfsqL83kDxgksMveS1v5zuOKFItrH1dL4N6VRjKvWZGdfn1z
         ZGy9XdoLJgZYTw0jDHZQcqkjaeXapR5YcIAoAayWETXlTJ0Wz8KfJ9h0H/wJvHE7q1ba
         R3r527vjIakyHYUDyofg/8srP0651OHqDlgqSlyvBPOmKjhfX0nyIlW5H3zTx0wl/yJv
         x/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMmqITo4+z0uHB6LX3x+aF6HxaY9pQthzj8Mu13LNYM=;
        b=nVl153ssDs6OJ6Co/CdGFuMuh3swpYK1g+RcfeJmrajQ9zpyguv8gkCd1P2Bz1pCxI
         qXq7mmpKKaliOK11Yu3zdbLZDSFCwMHF0wokVR6hD7Nm+JO/xWvNaGY970pd1PdoalY2
         +E2oPJKAq/OfJ/3OW82TLXkra2wv3nCMWc0ouv312XLxS3dLGlXg0IjjmZKRYZUvZofF
         24xQ9vTO68BzOr6bukzN5/rOfrsfeeQ5msTc9u1v5BcuY309WCIZTv46C3oYOgak5lbW
         Y5rK7x/A5mjXD5Z5QB+KtyjFwzaznU97fMivG7ZJ331AF0LZyOrdPEDEiPmpjUQ7GGzY
         wZBw==
X-Gm-Message-State: AOAM53203I13wGuGCStgRNHiQpBFmqIL8ccUmFY1pXez4fb5DPGT60n2
	x842vC0ExNLty59ddRnRQTTvMs2xjGQ=
X-Google-Smtp-Source: ABdhPJxXSLacXgDn0UO77ET43M94b/1axqywhR29L70tNlt4uWOsWoGcEQYsIWoul4M1hlE3nUPUdA==
X-Received: by 2002:a92:bd0f:: with SMTP id c15mr4684329ile.95.1594910102395;
        Thu, 16 Jul 2020 07:35:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:8425:3b41:f78d:f429])
        by smtp.gmail.com with ESMTPSA id g1sm3122001iov.38.2020.07.16.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:35:01 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Matt Hoosier <matt.hoosier@garmin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] glmark2: don't build full OpenGL backends by default
Date: Thu, 16 Jul 2020 09:34:41 -0500
Message-Id: <20200716143441.30357-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Hoosier <matt.hoosier@garmin.com>

Most embedded GPU's implementations OpenGL include only the OpenGL ES
APIs. Attempting to compile the {x11,wayland,drm}-gl variants of
GLMark fail in those cases.

Signed-off-by: Matt Hoosier <matt.hoosier@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 6d20bbdaf..82821ad63 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -24,9 +24,9 @@ inherit waf pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES += "opengl"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl x11-gles2', '', d)} \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
-                  drm-gl drm-gles2"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gles2', '', d)} \
+                  drm-gles2"
 
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
-- 
2.27.0

