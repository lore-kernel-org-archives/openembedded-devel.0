Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.471.1616117758531531078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 18:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 76/D0-53635-CFFF3506; Fri, 19 Mar 2021 01:35:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxRffP/+A
  Eg9VHlSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy7qzgL9hpVPJq3mamBcZF2FyMXh5DAFiaJ
  qU8fsUA4exglXn5fydTFyMnBJmAgsf/sBXYQW0RAX2Lp7D3MILawgIvEhWvT2UBsFgFViR1Lv
  4LV8wp4S2ye8QosLiGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhzCrJI7MVJ
  vAyDMLScMsJA0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGloCsZGZXmKVbqJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgCKUUHKjbwfjg9Qe9Q4ySHExKorxHfwcnCPEl5adUZiQWZ8QX
  leakFh9ilOHgUJLgVfkHlBMsSk1PrUjLzAGGM0xagoNHSYT3x1+gNG9xQWJucWY6ROoUYzjHm
  7VLFjFzvAWTbffuAsl2MDlzwcHVzByzwOT99kNA8gGIFGLJy89LlRLnTQfZJgAyLqM0D24ZLF
  4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdQSZwpOZVwJ30yugc5mAzo3gDwI5tyQRISX
  VwKT2R1NmvV8K67ZHCtNWfDPdx5E24f16p9YLxle7PzuFPSzc8fABy/nFoo9888rd9OJWKs1S
  uMOVHhlw1XS70e+E5UcOsliuDXBdNoHNddaK471mts1z10+QtJaVz2sXPr1lRqzWG6OiJ557m
  Wr0H2+aGmAc9dc2/vuZsyVnzp2t1WTM4PkxZ+Wtw2ZfeQ0umkdM4l1wLv9+/aZVXmeubDtltq
  /A0/0j3++8o0nq4tPtVB33W0d0XxSdv2vfpaLlK8JXW0ll1D2fMEVaOaye4SXDmbIjH17IMBy
  94LH2dLXj3fAdovK/1pf/9fQPjRcpycpjvf67j+PzJgPHHIamvuTGLWt+bRJ+ma1wZcvMT+lK
  LMUZiYZazEXFiQCjGt9HUgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-34.tower-265.messagelabs.com!1616117756!166867!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4750 invoked from network); 19 Mar 2021 01:35:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-34.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Mar 2021 01:35:56 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12J1Zuba010032
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 01:35:56 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Mar 2021 01:35:54 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] glmark2: upgrade 20201114 -> 2021.02
Date: Fri, 19 Mar 2021 18:35:49 +0800
Message-ID: <1616150149-59433-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0003-fix-precision-handling-bugs.patch    | 138 ------------------
 .../recipes-benchmark/glmark2/glmark2_git.bb  |   5 +-
 2 files changed, 2 insertions(+), 141 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch b/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
deleted file mode 100644
index af88f6cd2..000000000
--- a/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 90e837ffd1ff5c9add1074d69de23e58a3a4810e Mon Sep 17 00:00:00 2001
-From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
-Date: Wed, 11 Nov 2020 09:26:03 -0500
-Subject: [PATCH 1/3] terrain: Fix precision bug in light rendering
-
-Resulting in overly bright rendering when mediump is implemented as
-fp16.
-
-Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
----
- data/shaders/terrain.frag | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/data/shaders/terrain.frag b/data/shaders/terrain.frag
-index 84d085c..58f17ea 100644
---- a/data/shaders/terrain.frag
-+++ b/data/shaders/terrain.frag
-@@ -67,7 +67,12 @@ void main() {
-     vec3 pointSpecular = vec3( 0.0 );
-     for ( int i = 0; i < MAX_POINT_LIGHTS; i ++ ) {
-         vec4 lPosition = viewMatrix * vec4( pointLightPosition[ i ], 1.0 );
-+#ifdef GL_FRAGMENT_PRECISION_HIGH
-+        // should be highp for correct behaviour if mediump is implemented as fp16
-+        highp vec3 lVector = lPosition.xyz + vViewPosition.xyz;
-+#else
-         vec3 lVector = lPosition.xyz + vViewPosition.xyz;
-+#endif
-         float lDistance = 1.0;
-         if ( pointLightDistance[ i ] > 0.0 )
-             lDistance = 1.0 - min( ( length( lVector ) / pointLightDistance[ i ] ), 1.0 );
-
-From 1edd76fda77edabd49d713912aee49b8360c86c3 Mon Sep 17 00:00:00 2001
-From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
-Date: Wed, 11 Nov 2020 09:49:52 -0500
-Subject: [PATCH 2/3] terrain: Fix precision handling in noise shader
-
-Another overflow resulting in infinity in mediump. Note this bug is
-masked if the driver clamps infinity to MAX_FLOAT, but it's still our
-bug.
-
-Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
----
- data/shaders/terrain-noise.frag | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/data/shaders/terrain-noise.frag b/data/shaders/terrain-noise.frag
-index 7fea5c0..9535e58 100644
---- a/data/shaders/terrain-noise.frag
-+++ b/data/shaders/terrain-noise.frag
-@@ -17,7 +17,13 @@ uniform float time;
- uniform MEDIUMP vec2 uvScale;
- varying vec2 vUv;
- 
-+#ifdef GL_FRAGMENT_PRECISION_HIGH
-+// x should be passed as highp since the intermediate multiplications can
-+// overflow with mediump
-+vec4 permute(highp vec4 x)
-+#else
- vec4 permute(vec4 x)
-+#endif
- {
-     return mod(((x * 34.0) + 1.0) * x, 289.0);
- }
-
-From e866cc633ffc450e5358b2742f32ca360e4f3f12 Mon Sep 17 00:00:00 2001
-From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
-Date: Wed, 11 Nov 2020 09:35:21 -0500
-Subject: [PATCH 3/3] loop,function,conditionals: Fix mediump overflow
-
-The multiplication can produce infinity.
-
-Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
----
- data/shaders/conditionals.frag | 9 ++++++++-
- data/shaders/function.frag     | 9 ++++++++-
- data/shaders/loop.frag         | 9 ++++++++-
- 3 files changed, 24 insertions(+), 3 deletions(-)
-
-diff --git a/data/shaders/conditionals.frag b/data/shaders/conditionals.frag
-index 3bd2507..e902263 100644
---- a/data/shaders/conditionals.frag
-+++ b/data/shaders/conditionals.frag
-@@ -2,7 +2,14 @@ varying vec4 dummy;
- 
- void main(void)
- {
--    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
-+#ifdef GL_FRAGMENT_PRECISION_HIGH
-+    // should be declared highp since the multiplication can overflow in
-+    // mediump, particularly if mediump is implemented as fp16
-+    highp vec2 FragCoord = gl_FragCoord.xy;
-+#else
-+    vec2 FragCoord = gl_FragCoord.xy;
-+#endif
-+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
- 
- $MAIN$
- 
-diff --git a/data/shaders/function.frag b/data/shaders/function.frag
-index 3e3c74f..9d0230e 100644
---- a/data/shaders/function.frag
-+++ b/data/shaders/function.frag
-@@ -8,7 +8,14 @@ $PROCESS$
- 
- void main(void)
- {
--    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
-+#ifdef GL_FRAGMENT_PRECISION_HIGH
-+    // should be declared highp since the multiplication can overflow in
-+    // mediump, particularly if mediump is implemented as fp16
-+    highp vec2 FragCoord = gl_FragCoord.xy;
-+#else
-+    vec2 FragCoord = gl_FragCoord.xy;
-+#endif
-+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
- 
- $MAIN$
- 
-diff --git a/data/shaders/loop.frag b/data/shaders/loop.frag
-index 31ae23e..9a6afd2 100644
---- a/data/shaders/loop.frag
-+++ b/data/shaders/loop.frag
-@@ -3,7 +3,14 @@ uniform int FragmentLoops;
- 
- void main(void)
- {
--    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
-+#ifdef GL_FRAGMENT_PRECISION_HIGH
-+    // should be declared highp since the multiplication can overflow in
-+    // mediump, particularly if mediump is implemented as fp16
-+    highp vec2 FragCoord = gl_FragCoord.xy;
-+#else
-+    vec2 FragCoord = gl_FragCoord.xy;
-+#endif
-+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
- 
- $MAIN$
- 
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index a5872f435..509c5cc40 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -11,15 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "libpng jpeg udev"
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
 
-PV = "20201114+${SRCPV}"
+PV = "2021.02+${SRCPV}"
 
 SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
-    file://0003-fix-precision-handling-bugs.patch \
     "
-SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
+SRCREV = "4b2bbe803576d48f08367aa5441740f9319c21e7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

