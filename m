Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF1D65DFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 11:22:04 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 18BAD228F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 13:22:05 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Apr 2014 13:21:50 +0200
Message-Id: <1398597711-17825-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
References: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH 3/4] Add use-egl PACKAGECONFIG to let chromium use EGL automatically
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Apr 2014 11:22:04 -0000

By default, Chromium will try to use GLX and regular OpenGL. On embedded
platforms, these are often not present, or unaccelerated, and using EGL
and OpenGL ES instead makes more sense. To produce builds that use EGL and
OpenGL ES by default instead, this PACKAGECONFIG option can be used.

An EGL/OpenGLES-enabled build produces a chromium version that renders
2D and WebGL with GPU acceleration (if present).

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/chromium_35.0.1883.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index 080282b..d0495d8 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -34,8 +34,15 @@ EXTRA_OEGYP =	" \
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 
 CHROMIUM_EXTRA_ARGS = " \
+	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
 "
 
+python __anonymous() {
+    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    if 'use-egl' in pkgconfig.split():
+        d.appendVar("DEPENDS", " virtual/egl virtual/libgles2")
+}
+
 export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 do_configure() {
 	cd ${S}
-- 
1.8.3.2


