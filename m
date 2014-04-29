Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2A365D00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 06:40:03 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 48F9822D15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:40:04 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 08:39:52 +0200
Message-Id: <1398753593-4447-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH v2 3/4] chromium: Add use-egl PACKAGECONFIG option
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
X-List-Received-Date: Tue, 29 Apr 2014 06:40:04 -0000

By default, Chromium will try to use GLX and regular OpenGL. On embedded
platforms, these are often not present, or unaccelerated, and using EGL
and OpenGL ES instead makes more sense. To produce builds that use EGL and
OpenGL ES by default instead, this PACKAGECONFIG option can be used.

An EGL/OpenGLES-enabled build produces a chromium version that renders
2D and WebGL with GPU acceleration (if present).

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/chromium_35.0.1883.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index 1923b4e..1fb050f 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -23,6 +23,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 inherit gettext
 
+# this makes sure the dependencies for the EGL mode are present; otherwise, the configure scripts
+# automatically and silently fall back to GLX
+PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
+
 EXTRA_OEGYP =	" \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
@@ -33,7 +37,9 @@ EXTRA_OEGYP =	" \
 "
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 
-CHROMIUM_EXTRA_ARGS ?= ""
+CHROMIUM_EXTRA_ARGS ?= " \
+	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
+"
 
 export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 do_configure() {
-- 
1.8.3.2


