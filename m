Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5926D6A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 16D6722EF0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 13:33:42 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 13:32:50 +0200
Message-Id: <1413199970-17377-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH] chromium: Upgrade to version 38.0.2125.101
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
X-List-Received-Date: Mon, 13 Oct 2014 11:33:55 -0000

* Starting with this version, several cross compilation specific parts in
the GYP files need to be disabled with both additional flags and an extra
patch. Chromium 38 now includes clang specifics, which are enabled by
default. Additional flags (-Dhost_clang=0 -Dclang=0) disable these.
Furthermore, the GYP files now include default values for CC and CXX
(https://codereview.chromium.org/414343003/patch/40001/50001), which
could not be overridden with environment variables. A patch removes this.

* ozone-wayland's Milestone-Harvest branch is the one to use for
Chromium 38. It includes a patch that collides with another one that is
already present in the chromium/ directly. Consequently, this other patch
is now only used for X11 builds.

* Only 00*.patch patch files from ozone-wayland are used, since
the 10*.patch files cannot be applied cleanly and easily (and are not
actually required for builds with this recipe, since another patch already
takes care of the X11 linker flags removal).

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...terization-whitelist-unlocking-impl-side-.patch | 54 +++++++++++++-------
 .../0001-Remove-X-libraries-from-GYP-files.patch   | 48 +++++++++---------
 ...ccelerated-Canvas-support-from-blacklist.patch} | 17 +++++--
 ...1-Remove-hard-coded-values-for-CC-and-CXX.patch | 43 ++++++++++++++++
 ...m_37.0.2062.94.bb => chromium_38.0.2125.101.bb} | 58 ++++++++++++++++++----
 5 files changed, 164 insertions(+), 56 deletions(-)
 rename recipes-browser/chromium/chromium/{remove-linux-accel-canvas-from-blacklist.patch => 0001-Remove-accelerated-Canvas-support-from-blacklist.patch} (66%)
 create mode 100644 recipes-browser/chromium/chromium/0001-Remove-hard-coded-values-for-CC-and-CXX.patch
 rename recipes-browser/chromium/{chromium_37.0.2062.94.bb => chromium_38.0.2125.101.bb} (66%)

diff --git a/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch b/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
index 3e9d269..7bc3d34 100644
--- a/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
+++ b/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
@@ -1,31 +1,31 @@
-From 96a5a12ecd5b144bfeaa1d2116c2d1996bbb8f6c Mon Sep 17 00:00:00 2001
+From 2afda4afc9e97164a81ea76367e356c349234fb4 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Mon, 22 Sep 2014 23:15:42 +0200
+Date: Sun, 12 Oct 2014 17:46:39 +0200
 Subject: [PATCH] Disable rasterization whitelist, unlocking impl side painting
 
+Upstream-Status: Inappropriate [enable feature]
+
 Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
- gpu/config/software_rendering_list_json.cc | 49 ------------------------------
- 1 file changed, 49 deletions(-)
+ gpu/config/software_rendering_list_json.cc | 63 ------------------------------
+ 1 file changed, 63 deletions(-)
 
 diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
-index 52614eb..bd0bf01 100644
+index 6a12707..4e8e56a 100644
 --- a/gpu/config/software_rendering_list_json.cc
 +++ b/gpu/config/software_rendering_list_json.cc
-@@ -1144,55 +1144,6 @@ LONG_STRING_CONST(
-       "features": [
-         "all"
+@@ -1037,69 +1037,6 @@ LONG_STRING_CONST(
        ]
--    },
--    {
+     },
+     {
 -      "id": 96,
--      "description": "GPU rasterization is whitelisted on N4, N5, N7 and Moto X",
+-      "description": "GPU rasterization is whitelisted on N4, N5, N7 and Moto X, and on Qualcomm GPUs on Android 4.4",
 -      "cr_bugs": [362779],
+-      "os": {
+-        "type": "android"
+-      },
 -      "exceptions": [
 -        {
--          "os": {
--            "type": "android"
--          },
 -          "machine_model_name": ["Nexus 4", "Nexus 5", "Nexus 7",
 -                                 "XT1049", "XT1050", "XT1052", "XT1053",
 -                                 "XT1055", "XT1056", "XT1058", "XT1060"]
@@ -38,6 +38,20 @@ index 52614eb..bd0bf01 100644
 -              "value": "4.4.99"
 -            }
 -          }
+-        },
+-        {
+-          "os": {
+-            "type": "android",
+-            "version": {
+-              "op": ">=",
+-              "value": "4.4"
+-            }
+-          },
+-          "gl_type": "gles",
+-          "gl_version": {
+-            "op": ">=",
+-            "value": "3.0"
+-          }
 -        }
 -      ],
 -      "features": [
@@ -55,8 +69,8 @@ index 52614eb..bd0bf01 100644
 -          },
 -          "machine_model_name": ["HTC One",
 -                                 "C5303", "C6603", "C6903",
--                                 "GT-I8262", "GT-I8552", "GT-I9195", "GT-I9300",
--                                 "GT-I9500", "GT-I9505", "GT-N7100",
+-                                 "GT-I8262", "GT-I8552", "GT-I9195",
+-                                 "GT-I9500", "GT-I9505",
 -                                 "SAMSUNG-SCH-I337", "SCH-I545", "SGH-M919",
 -                                 "SM-N900", "SM-N9005", "SPH-L720",
 -                                 "XT907", "XT1032", "XT1033", "XT1080"]
@@ -65,9 +79,11 @@ index 52614eb..bd0bf01 100644
 -      "features": [
 -        "gpu_rasterization_field_trial"
 -      ]
-     }
-   ]
- }
+-    },
+-    {
+       "id": 98,
+       "description": "Whitelist for using GPU rasterization for a broader set of content",
+       "cr_bugs": [399306],
 -- 
 1.9.1
 
diff --git a/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
index 44f9710..4734f31 100644
--- a/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
+++ b/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
@@ -1,6 +1,6 @@
-From 32642c65e31c26673cc4687eefacdf0087cf4498 Mon Sep 17 00:00:00 2001
+From 715277bbb81a32c7225416eaef77521b2a4f63ac Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Mon, 28 Jul 2014 00:10:03 +0200
+Date: Sun, 12 Oct 2014 18:08:37 +0200
 Subject: [PATCH] Remove X libraries from GYP files
 
 Some X libraries are linked even when ozone-wayland is used, causing
@@ -10,32 +10,30 @@ Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
- third_party/libjingle/source/talk/libjingle.gyp                 | 4 ----
+ third_party/libjingle/source/talk/libjingle.gyp                 | 2 --
  third_party/libjingle/source/talk/libjingle_examples.gyp        | 4 ----
  third_party/webrtc/base/base.gyp                                | 4 ----
  third_party/webrtc/modules/desktop_capture/desktop_capture.gypi | 2 +-
- 4 files changed, 1 insertion(+), 13 deletions(-)
+ 4 files changed, 1 insertion(+), 11 deletions(-)
 
 diff --git a/third_party/libjingle/source/talk/libjingle.gyp b/third_party/libjingle/source/talk/libjingle.gyp
-index 2182561..86c243b 100755
+index 6064277..7fbf5b5 100755
 --- a/third_party/libjingle/source/talk/libjingle.gyp
 +++ b/third_party/libjingle/source/talk/libjingle.gyp
-@@ -633,10 +633,6 @@
-               '-lcrypto',
-               '-ldl',
-               '-lrt',
--              '-lXext',
--              '-lX11',
--              '-lXcomposite',
--              '-lXrender',
-               '<!@(<(pkg-config) --libs-only-l nss | sed -e "s/-lssl3//")',
-             ],
-           },
+@@ -575,8 +575,6 @@
+           ],
+           'libraries': [
+             '-lrt',
+-            '-lXext',
+-            '-lX11',
+           ],
+         }],
+         ['OS=="win"', {
 diff --git a/third_party/libjingle/source/talk/libjingle_examples.gyp b/third_party/libjingle/source/talk/libjingle_examples.gyp
-index f69c5dc..e1ff366 100755
+index 3e31f50..44252a3 100755
 --- a/third_party/libjingle/source/talk/libjingle_examples.gyp
 +++ b/third_party/libjingle/source/talk/libjingle_examples.gyp
-@@ -206,10 +206,6 @@
+@@ -207,10 +207,6 @@
                  'libraries': [
                    '<!@(pkg-config --libs-only-l glib-2.0 gobject-2.0'
                        ' gthread-2.0 gtk+-2.0)',
@@ -47,25 +45,25 @@ index f69c5dc..e1ff366 100755
                },
              }],  # OS=="linux"
 diff --git a/third_party/webrtc/base/base.gyp b/third_party/webrtc/base/base.gyp
-index 330ea82..fa524cc 100644
+index ba5678e..e1cabc7 100644
 --- a/third_party/webrtc/base/base.gyp
 +++ b/third_party/webrtc/base/base.gyp
-@@ -573,10 +573,6 @@
-               '-lcrypto',
+@@ -574,10 +574,6 @@
+             'libraries': [
                '-ldl',
                '-lrt',
 -              '-lXext',
 -              '-lX11',
 -              '-lXcomposite',
 -              '-lXrender',
-               '<!@(<(pkg-config) --libs-only-l nss | sed -e "s/-lssl3//")',
              ],
            },
+           'conditions': [
 diff --git a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
-index 6f4a083..79efef8 100644
+index a0195d6..ec6738b 100644
 --- a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
 +++ b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
-@@ -95,7 +95,7 @@
+@@ -97,7 +97,7 @@
              'desktop_capture_differ_sse2',
            ],
          }],
@@ -75,5 +73,5 @@ index 6f4a083..79efef8 100644
              'libraries': [
                '-lX11',
 -- 
-1.8.3.2
+1.9.1
 
diff --git a/recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch b/recipes-browser/chromium/chromium/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
similarity index 66%
rename from recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch
rename to recipes-browser/chromium/chromium/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
index 635e563..fab0344 100644
--- a/recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch
+++ b/recipes-browser/chromium/chromium/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
@@ -1,3 +1,8 @@
+From 7166cba808d1922f4604d6771c21b90513bf9c2b Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 17:54:18 +0200
+Subject: [PATCH] Remove accelerated Canvas support from blacklist
+
 Together with the --gpu-no-context-lost command line switch, this patch is
 necessary to enable hardware accelerated 2D canvas rendering when using
 EGL.
@@ -8,12 +13,15 @@ contexts, as discussed here:
 http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2012-September/206450.html
 
 Upstream-Status: Inappropiate [see link above]
+---
+ gpu/config/software_rendering_list_json.cc | 10 ----------
+ 1 file changed, 10 deletions(-)
 
 diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
-index 35060a9..4bd6ef5 100644
+index 4e8e56a..f6dd7e5 100644
 --- a/gpu/config/software_rendering_list_json.cc
 +++ b/gpu/config/software_rendering_list_json.cc
-@@ -232,16 +232,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
+@@ -240,16 +240,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
        ]
      },
      {
@@ -29,4 +37,7 @@ index 35060a9..4bd6ef5 100644
 -    {
        "id": 27,
        "description": "ATI/AMD cards with older drivers in Linux are crash-prone",
-       "cr_bugs": [95934, 94973, 136240],
+       "cr_bugs": [95934, 94973, 136240, 357314],
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/0001-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/0001-Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..47ae86e
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0001-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,43 @@
+From e5c8af3d5e2a49effd39846657dd55ff6af44a63 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 19:31:47 +0200
+Subject: [PATCH] Remove hard coded values for CC and CXX
+
+In spite of what the comment says, the environment variables do *not*
+override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
+always called. To undo this, remove the change.
+
+Upstream-Status: Pending
+
+The default values cannot be overriden without the patch; upstream
+might be interested in this.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ build/common.gypi | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 609041c..4040a0b 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -5577,16 +5577,6 @@
+         ['CXX.host', '<(host_cxx)'],
+       ],
+     }],
+-    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
+-      # Set default ARM cross compiling on linux.  These can be overridden
+-      # using CC/CXX/etc environment variables.
+-      'make_global_settings': [
+-        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
+-        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
+-        ['CC.host', '<(host_cc)'],
+-        ['CXX.host', '<(host_cxx)'],
+-      ],
+-    }],
+ 
+     # TODO(yyanagisawa): supports GENERATOR==make
+     #  make generator doesn't support CC_wrapper without CC
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium_37.0.2062.94.bb b/recipes-browser/chromium/chromium_38.0.2125.101.bb
similarity index 66%
rename from recipes-browser/chromium/chromium_37.0.2062.94.bb
rename to recipes-browser/chromium/chromium_38.0.2125.101.bb
index c2b2b8b..8e347a9 100644
--- a/recipes-browser/chromium/chromium_37.0.2062.94.bb
+++ b/recipes-browser/chromium/chromium_38.0.2125.101.bb
@@ -7,16 +7,49 @@ SRC_URI = "\
         file://include.gypi \
         file://oe-defaults.gypi \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
+        file://0001-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://unistd-2.patch \
         file://google-chrome \
         file://google-chrome.desktop \
-        file://0001-shell-integration-conditionally-compile-routines-for.patch \
 "
-SRC_URI[md5sum] = "49bcf221a2e2e5406ae2e69964d01093"
-SRC_URI[sha256sum] = "d27c19580b74cbe143131f0bc097557b3b2fb3d2be966e688d8af51a779ce533"
+SRC_URI[md5sum] = "be4d3ad6944e43132e4fbde5a23d1ab8"
+SRC_URI[sha256sum] = "d3303519ab471a3bc831e9b366e64dc2fe651894e52ae5d1e74de60ee2a1198a"
+
+# PACKAGECONFIG explanations:
+#
+# * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
+#             and regular OpenGL for painting operations. Neither are desirable on embedded platforms. With this
+#             packageconfig, EGL and OpenGL ES 2.x are used instead. On by default.
+#
+# * disable-api-keys-info-bar : This disables the info bar that warns: "Google API keys are missing". With some
+#                               builds, missing API keys are considered OK, so the bar needs to go.
+#                               Off by default.
+#
+# * component-build : Enables component build mode. By default, all of Chromium (with the exception of FFmpeg)
+#                     is linked into one big binary. The linker step requires at least 8 GB RAM. Component mode
+#                     was created to facilitate development and testing, since with it, there is not one big
+#                     binary; instead, each component is linked to a separate shared object.
+#                     Use component mode for development, testing, and in case the build machine is not a 64-bit
+#                     one, or has less than 8 GB RAM. Off by default.
+#
+# * ignore-lost-context : There is a flaw in the HTML Canvas specification. When the canvas' backing store is
+#                         some kind of hardware resource like an OpenGL texture, this resource might get lost.
+#                         In case of OpenGL textures, this happens when the OpenGL context gets lost. The canvas
+#                         should then be repainted, but nothing in the Canvas standard reflects that.
+#                         This packageconfig is to be used if the underlying OpenGL (ES) drivers do not lose
+#                         the context, or if losing the context is considered okay (note that canvas contents can
+#                         vanish then). Off by default.
+#
+# * impl-side-painting : This is a new painting mechanism. Still in development stages, it can improve performance.
+#                        See http://www.chromium.org/developers/design-documents/impl-side-painting for more.
+#                        Off by default.
+
+# conditionally add shell integration patch (ozone-wayland contains a patch that makes
+# this one redundant, therefore use this patch only for X11 builds)
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'file://0001-shell-integration-conditionally-compile-routines-for.patch', '', d)}"
 
 # conditionally add ozone-wayland and its patches to the Chromium sources
 
@@ -35,8 +68,8 @@ OZONE_WAYLAND_EXTRA_PATCHES = " \
 "
 
 OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-Summer"
-OZONE_WAYLAND_GIT_SRCREV = "8346e3cecb5c1331a25ba235f29b72f3f049966a"
+OZONE_WAYLAND_GIT_BRANCH = "Milestone-Harvest"
+OZONE_WAYLAND_GIT_SRCREV = "0f8b830730d9b696a667c331c50ac6333bb85c13"
 SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
 
 do_unpack[postfuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
@@ -54,7 +87,12 @@ python add_ozone_wayland_patches() {
     srcdir = d.getVar('S', True)
     # find all ozone-wayland patches and add them to SRC_URI
     upstream_patches_dir = srcdir + "/ozone/patches"
-    upstream_patches = glob.glob(upstream_patches_dir + "/*.patch")
+    # using 00*.patch to skip WebRTC patches
+    # the WebRTC patches remove X11 libraries from the linker flags, which is
+    # already done by another patch (see above). Furthermore, to be able to use
+    # these patches, it is necessary to update the git repository in third_party/webrtc,
+    # which would further complicate this recipe.
+    upstream_patches = glob.glob(upstream_patches_dir + "/00*.patch")
     upstream_patches.sort()
     for upstream_patch in upstream_patches:
         d.appendVar('SRC_URI', ' file://' + upstream_patch)
@@ -81,6 +119,8 @@ PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
 
 EXTRA_OEGYP =	" \
 	-Dangle_use_commit_id=0 \
+	-Dclang=0 \
+	-Dhost_clang=0 \
 	-Ddisable_fatal_linker_warnings=1 \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
@@ -114,8 +154,8 @@ do_configure() {
 	LD="${CXX}" export LD
 	CC="${CC}" export CC
 	CXX="${CXX}" export CXX
-	CC_host="gcc" export CC_host
-	CXX_host="g++" export CXX_host
+	CC_host="${BUILD_CC}" export CC_host
+	CXX_host="${BUILD_CXX}" export CXX_host
 	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
 }
 
-- 
1.9.1


