Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4AD6FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 19:45:41 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b35so89062227qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 11:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWb9X5X8u1qFpThLC0FI3IwiD3HIigLyTAARrEwm0h4=;
	b=smY1McHfeThC2+q1EoaBFZ2ev8LMArPUHOkbvedkUA2K93cLEl6PzCdOLONZgmBYql
	/U/HRBKO3/c13dABdciy9I1yRQMlBStI65xX85aYzVf4X85se4Y2Xzcs2jf3C8Fo6Gve
	xwIlNICsKriX9+J8pMZFfbOsMtJySBqogVJAMD6y1Q6z/e+2Z26N0pb19r3hq7m0CGn7
	qBOQnWu+RujC51JAMNAYB/sQ5OezAMZwWuLUjNLpSv8lyKvfy6L3fSZex35W3izdxP+o
	KySeVR2Dqn9ieXAGIW3ySPHxrOKCuewFhwBJJPhEdRCAEgDON3ejTqGEgubwv9c+y2Qo
	Qw2Q==
X-Received: by 10.140.158.4 with SMTP id e4mr106073770qhe.81.1451677542603;
	Fri, 01 Jan 2016 11:45:42 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m127sm25483037qhm.43.2016.01.01.11.45.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jan 2016 11:45:42 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jan 2016 14:45:09 -0500
Message-Id: <1451677511-7346-3-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
Cc: pnandyala <Pavan.Nandyala@LntTechservices.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][RFC PATCH v1 2/4] chromium_40.0.2214.91.bb: improve PACKAGECONFIG info
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jan 2016 19:45:42 -0000

Improve the visual appearance of the PACKAGECONFIG options by adding a title
to the PACKAGECONFIG option section, wrapping lines to 80 columns, aligning
the left justification for subsequent lines, moving the default settings for
each option to a more prominent location, and moving all the items affected by
PACKAGECONFIG options to be closer to where these options are listed and
explained.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 81 +++++++++++++----------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index f20610c..4694506 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -26,39 +26,61 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         file://google-chrome \
         file://google-chrome.desktop \
+        file://unistd-2.patch \
         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
         file://chromium-40/add_missing_stat_h_include.patch \
         file://chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch \
         file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
+        file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch \
 "
 
+# PACKAGECONFIG options
+# ^^^^^^^^^^^^^^^^^^^^^
+# * use-egl: (on by default)
+#       Without this packageconfig, the Chromium build will use GLX for
+#       creating an OpenGL context in X11, and regular OpenGL for painting
+#       operations. Neither are desirable on embedded platforms. With this
+#       packageconfig, EGL and OpenGL ES 2.x are used instead.
 #
-# * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
-#             and regular OpenGL for painting operations. Neither are desirable on embedded platforms. With this
-#             packageconfig, EGL and OpenGL ES 2.x are used instead. On by default.
+# * disable-api-keys-info-bar: (off by default)
+#       This disables the info bar that warns: "Google API keys are missing".
+#       With some builds, missing API keys are considered OK, so the bar needs
+#       to go.
 #
-# * disable-api-keys-info-bar : This disables the info bar that warns: "Google API keys are missing". With some
-#                               builds, missing API keys are considered OK, so the bar needs to go.
-#                               Off by default.
+# * component-build: (off by default)
+#       Enables component build mode. By default, all of Chromium (with the
+#       exception of FFmpeg) is linked into one big binary. The linker step
+#       requires at least 8 GB RAM. Component mode was created to facilitate
+#       development and testing, since with it, there is not one big binary;
+#       instead, each component is linked to a separate shared object. Use
+#       component mode for development, testing, and in case the build machine
+#       is not a 64-bit one, or has less than 8 GB RAM.
 #
-# * component-build : Enables component build mode. By default, all of Chromium (with the exception of FFmpeg)
-#                     is linked into one big binary. The linker step requires at least 8 GB RAM. Component mode
-#                     was created to facilitate development and testing, since with it, there is not one big
-#                     binary; instead, each component is linked to a separate shared object.
-#                     Use component mode for development, testing, and in case the build machine is not a 64-bit
-#                     one, or has less than 8 GB RAM. Off by default.
+# * ignore-lost-context: (off by default)
+#       There is a flaw in the HTML Canvas specification. When the canvas'
+#       backing store is some kind of hardware resource like an OpenGL
+#       texture, this resource might get lost. In case of OpenGL textures,
+#       this happens when the OpenGL context gets lost. The canvas should then
+#       be repainted, but nothing in the Canvas standard reflects that. This
+#       packageconfig is to be used if the underlying OpenGL (ES) drivers do
+#       not lose the context, or if losing the context is considered okay
+#       (note that canvas contents can vanish then).
 #
-# * ignore-lost-context : There is a flaw in the HTML Canvas specification. When the canvas' backing store is
-#                         some kind of hardware resource like an OpenGL texture, this resource might get lost.
-#                         In case of OpenGL textures, this happens when the OpenGL context gets lost. The canvas
-#                         should then be repainted, but nothing in the Canvas standard reflects that.
-#                         This packageconfig is to be used if the underlying OpenGL (ES) drivers do not lose
-#                         the context, or if losing the context is considered okay (note that canvas contents can
-#                         vanish then). Off by default.
-#
-# * impl-side-painting : This is a new painting mechanism. Still in development stages, it can improve performance.
-#                        See http://www.chromium.org/developers/design-documents/impl-side-painting for more.
-#                        Off by default.
+# * impl-side-painting: (off by default)
+#       This is a new painting mechanism. Still in
+#       development stages, it can improve performance See
+#       http://www.chromium.org/developers/design-documents/impl-side-painting
+#       for more.
+SRC_URI += "\
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-40/0003-Disable-API-keys-info-bar.patch', '', d)} \
+"
+CHROMIUM_EXTRA_ARGS ?= " \
+	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', '--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
+"
 
 # Conditionally add ozone-wayland and its patches to the Chromium sources
 # You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
@@ -97,13 +119,6 @@ do_unpack[postfuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'co
 do_patch[prefuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
-SRC_URI += "\
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-40/0003-Disable-API-keys-info-bar.patch', '', d)} \
-        file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://unistd-2.patch \
-"
 SRC_URI[md5sum] = "1f5093bd7e435fdebad070e74bfb3438"
 SRC_URI[sha256sum] = "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481d01d3d60e5e64149"
 
@@ -164,12 +179,6 @@ EXTRA_OEGYP =	" \
 "
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 
-CHROMIUM_EXTRA_ARGS ?= " \
-	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', '--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
-"
-
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
 # These are present as their own variables, since they have changed between versions
-- 
2.7.0.rc3


