Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E267D65E4E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 11:22:05 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 62CCC228F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 13:22:06 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Apr 2014 13:21:51 +0200
Message-Id: <1398597711-17825-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
References: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH 4/4] Add ignore-lost-context PACKAGECONFIG to ignore lost EGL contexts
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
X-List-Received-Date: Sun, 27 Apr 2014 11:22:06 -0000

Accelerating the HTML5 canvas element rendering with OpenGL ES is tricky,
because an EGL context can get lost with some drivers. Since pages using
canvas assume they can paint into the canvas and the pixels inside will
never vanish, this is a problem. Workarounds like periodic snapshots are
being considered. The WHATWG discussion about this problem can be found at:
http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2012-September/206450.html

Until then, one has to choose: either no acceleration and full standards
compliance, or acceleration and potentially lost pixels.

Using this PACKAGECONFIG chooses the second option.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../remove-linux-accel-canvas-from-blacklist.patch | 32 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_35.0.1883.0.bb   |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch

diff --git a/recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch b/recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch
new file mode 100644
index 0000000..635e563
--- /dev/null
+++ b/recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch
@@ -0,0 +1,32 @@
+Together with the --gpu-no-context-lost command line switch, this patch is
+necessary to enable hardware accelerated 2D canvas rendering when using
+EGL.
+
+Note the implications on the behavior of Canvas, in particular with lost
+contexts, as discussed here:
+
+http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2012-September/206450.html
+
+Upstream-Status: Inappropiate [see link above]
+
+diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
+index 35060a9..4bd6ef5 100644
+--- a/gpu/config/software_rendering_list_json.cc
++++ b/gpu/config/software_rendering_list_json.cc
+@@ -232,16 +232,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
+       ]
+     },
+     {
+-      "id": 24,
+-      "description": "Accelerated 2d canvas is unstable in Linux at the moment",
+-      "os": {
+-        "type": "linux"
+-      },
+-      "features": [
+-        "accelerated_2d_canvas"
+-      ]
+-    },
+-    {
+       "id": 27,
+       "description": "ATI/AMD cards with older drivers in Linux are crash-prone",
+       "cr_bugs": [95934, 94973, 136240],
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index d0495d8..c7901fc 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "\
         file://include.gypi \
         file://oe-defaults.gypi \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
         file://unistd-2.patch \
         file://google-chrome \
         file://google-chrome.desktop \
@@ -35,6 +36,7 @@ ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
 
 CHROMIUM_EXTRA_ARGS = " \
 	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
 "
 
 python __anonymous() {
-- 
1.8.3.2


