Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.2108.1608320925724373081
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 11:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOy7Vre1;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v5so2130881qtv.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 11:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2Lm8cntsf7FerkIolXnstRJKLNo3ZJgbTzCITx1leY=;
        b=jOy7Vre17H4SaLct35i7eYgDbqrnGWE94q6uaRJ7pwqF/6DlpNgiH9nAp7+QA9ROwG
         oK2BxQudTENY4Jr9OgYzUIwpMvNuT+ryH4in/ZBp5gB5Hz9pBmFCNaXtXX7hsMfiHu9L
         5Qy+hEWo5KAhZaEYxvKZzGFNjrOwZKaTb8m8GeAcnJgpYkYke0lBWxPDLE4hVk3Qtvp1
         SI6to3Xho9Z/P+Qjt9uT88wShJFvpIID0j9iR9yU1QwBwI0RIrZtgzPNWdWVdKzdWBOE
         x9u6zuUW5unV+KTn3Z73zrtkdrBuBeLIkFTPUAVLpIuwu6zlsgAMqHI0eXHYn7M6XMlt
         GKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2Lm8cntsf7FerkIolXnstRJKLNo3ZJgbTzCITx1leY=;
        b=bKd61VobZqBayASgD37LnpWQwQziagSEXwSYVdGvLNs9FiK9YTQqHV7SNeolZpUJUs
         JMNqRLxeZwfCArU3vA58OkUv18rqW/6Ov0DxrqnWtPxjpDRBQ+68bTxKvcV//DPwr1zt
         Do+/WKHTrP+yz+CJ/qUkQI0+eHE2BTkftq0mbndHZvsSwDqg0Tx4pmN2RMwYwwibO33z
         pN8Zd4OXTeZQAXU2F+SDsk26EayTIsockzD8mrQCIYc7sWPJItbWFPJAi5lOJjZ3ZTCi
         Cxbi8inYiEleHyoNQ6WCGMNa4THFGC9lZORaaYFkKDqEyItuufstF8ZMN6gqkv45tWl2
         RQTg==
X-Gm-Message-State: AOAM532M2atQO7ZJBnGc/MZfEmsnJlawg006n7oJdsxp944tkL6IhT+0
	w79PJiQiCe13GluJ2xo16J3cOw/dnVow8A==
X-Google-Smtp-Source: ABdhPJy2vJ8NVnT77RVa/LJjuy50bywLYwlavK3eow17JqzRwNsOhxildMtjhtUTk+p5iclbwgkzUw==
X-Received: by 2002:ac8:5802:: with SMTP id g2mr5662007qtg.383.1608320924203;
        Fri, 18 Dec 2020 11:48:44 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id p23sm5809391qtu.53.2020.12.18.11.48.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 11:48:43 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glmark2: fix precision handling bugs
Date: Fri, 18 Dec 2020 14:48:30 -0500
Message-Id: <20201218194830.33891-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch comes from Alyssa Rosenzweig and fixes/clarifies glmark2's
handling of fp16 overflows which result in corrupted rendering on some
drivers.

See: https://github.com/glmark2/glmark2/pull/132

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../0003-fix-precision-handling-bugs.patch    | 138 ++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch b/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
new file mode 100644
index 000000000..af88f6cd2
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
@@ -0,0 +1,138 @@
+From 90e837ffd1ff5c9add1074d69de23e58a3a4810e Mon Sep 17 00:00:00 2001
+From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+Date: Wed, 11 Nov 2020 09:26:03 -0500
+Subject: [PATCH 1/3] terrain: Fix precision bug in light rendering
+
+Resulting in overly bright rendering when mediump is implemented as
+fp16.
+
+Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+---
+ data/shaders/terrain.frag | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/data/shaders/terrain.frag b/data/shaders/terrain.frag
+index 84d085c..58f17ea 100644
+--- a/data/shaders/terrain.frag
++++ b/data/shaders/terrain.frag
+@@ -67,7 +67,12 @@ void main() {
+     vec3 pointSpecular = vec3( 0.0 );
+     for ( int i = 0; i < MAX_POINT_LIGHTS; i ++ ) {
+         vec4 lPosition = viewMatrix * vec4( pointLightPosition[ i ], 1.0 );
++#ifdef GL_FRAGMENT_PRECISION_HIGH
++        // should be highp for correct behaviour if mediump is implemented as fp16
++        highp vec3 lVector = lPosition.xyz + vViewPosition.xyz;
++#else
+         vec3 lVector = lPosition.xyz + vViewPosition.xyz;
++#endif
+         float lDistance = 1.0;
+         if ( pointLightDistance[ i ] > 0.0 )
+             lDistance = 1.0 - min( ( length( lVector ) / pointLightDistance[ i ] ), 1.0 );
+
+From 1edd76fda77edabd49d713912aee49b8360c86c3 Mon Sep 17 00:00:00 2001
+From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+Date: Wed, 11 Nov 2020 09:49:52 -0500
+Subject: [PATCH 2/3] terrain: Fix precision handling in noise shader
+
+Another overflow resulting in infinity in mediump. Note this bug is
+masked if the driver clamps infinity to MAX_FLOAT, but it's still our
+bug.
+
+Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+---
+ data/shaders/terrain-noise.frag | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/data/shaders/terrain-noise.frag b/data/shaders/terrain-noise.frag
+index 7fea5c0..9535e58 100644
+--- a/data/shaders/terrain-noise.frag
++++ b/data/shaders/terrain-noise.frag
+@@ -17,7 +17,13 @@ uniform float time;
+ uniform MEDIUMP vec2 uvScale;
+ varying vec2 vUv;
+ 
++#ifdef GL_FRAGMENT_PRECISION_HIGH
++// x should be passed as highp since the intermediate multiplications can
++// overflow with mediump
++vec4 permute(highp vec4 x)
++#else
+ vec4 permute(vec4 x)
++#endif
+ {
+     return mod(((x * 34.0) + 1.0) * x, 289.0);
+ }
+
+From e866cc633ffc450e5358b2742f32ca360e4f3f12 Mon Sep 17 00:00:00 2001
+From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+Date: Wed, 11 Nov 2020 09:35:21 -0500
+Subject: [PATCH 3/3] loop,function,conditionals: Fix mediump overflow
+
+The multiplication can produce infinity.
+
+Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
+---
+ data/shaders/conditionals.frag | 9 ++++++++-
+ data/shaders/function.frag     | 9 ++++++++-
+ data/shaders/loop.frag         | 9 ++++++++-
+ 3 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/data/shaders/conditionals.frag b/data/shaders/conditionals.frag
+index 3bd2507..e902263 100644
+--- a/data/shaders/conditionals.frag
++++ b/data/shaders/conditionals.frag
+@@ -2,7 +2,14 @@ varying vec4 dummy;
+ 
+ void main(void)
+ {
+-    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
++#ifdef GL_FRAGMENT_PRECISION_HIGH
++    // should be declared highp since the multiplication can overflow in
++    // mediump, particularly if mediump is implemented as fp16
++    highp vec2 FragCoord = gl_FragCoord.xy;
++#else
++    vec2 FragCoord = gl_FragCoord.xy;
++#endif
++    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
+ 
+ $MAIN$
+ 
+diff --git a/data/shaders/function.frag b/data/shaders/function.frag
+index 3e3c74f..9d0230e 100644
+--- a/data/shaders/function.frag
++++ b/data/shaders/function.frag
+@@ -8,7 +8,14 @@ $PROCESS$
+ 
+ void main(void)
+ {
+-    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
++#ifdef GL_FRAGMENT_PRECISION_HIGH
++    // should be declared highp since the multiplication can overflow in
++    // mediump, particularly if mediump is implemented as fp16
++    highp vec2 FragCoord = gl_FragCoord.xy;
++#else
++    vec2 FragCoord = gl_FragCoord.xy;
++#endif
++    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
+ 
+ $MAIN$
+ 
+diff --git a/data/shaders/loop.frag b/data/shaders/loop.frag
+index 31ae23e..9a6afd2 100644
+--- a/data/shaders/loop.frag
++++ b/data/shaders/loop.frag
+@@ -3,7 +3,14 @@ uniform int FragmentLoops;
+ 
+ void main(void)
+ {
+-    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
++#ifdef GL_FRAGMENT_PRECISION_HIGH
++    // should be declared highp since the multiplication can overflow in
++    // mediump, particularly if mediump is implemented as fp16
++    highp vec2 FragCoord = gl_FragCoord.xy;
++#else
++    vec2 FragCoord = gl_FragCoord.xy;
++#endif
++    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
+ 
+ $MAIN$
+ 
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 44bce9fb5..a5872f435 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
+    file://0003-fix-precision-handling-bugs.patch \
     "
 SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
 
-- 
2.30.0.rc0

