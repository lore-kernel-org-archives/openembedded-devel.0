Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5E50D718E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 23:19:52 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 47D4D27CB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 00:19:51 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 00:19:44 +0100
Message-Id: <1422314384-9091-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1422314384-9091-1-git-send-email-dv@pseudoterminal.org>
References: <1422314384-9091-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH 2/2] chromium: chromium: Upgrade to version 40.0.2214.91
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
X-List-Received-Date: Mon, 26 Jan 2015 23:19:54 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...accelerated-Canvas-support-from-blacklist.patch | 43 ++++++++++++
 ...Add-Linux-to-impl-side-painting-whitelist.patch | 39 +++++++++++
 .../0003-Disable-API-keys-info-bar.patch           | 33 ++++++++++
 ...4-Remove-hard-coded-values-for-CC-and-CXX.patch | 43 ++++++++++++
 .../0005-Remove-X-libraries-from-GYP-files.patch   | 77 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  | 32 +++++++++
 6 files changed, 267 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
 create mode 100644 recipes-browser/chromium/chromium_40.0.2214.91.bb

diff --git a/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
new file mode 100644
index 0000000..e2c1a5c
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
@@ -0,0 +1,43 @@
+From 821d9fde2302f68f7cb7f0b211f4f78220c97180 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 17:54:18 +0200
+Subject: [PATCH] Remove accelerated Canvas support from blacklist
+
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
+---
+ gpu/config/software_rendering_list_json.cc | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
+index b9f5e3a..ccf1460 100644
+--- a/gpu/config/software_rendering_list_json.cc
++++ b/gpu/config/software_rendering_list_json.cc
+@@ -240,16 +240,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
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
+       "cr_bugs": [95934, 94973, 136240, 357314],
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch b/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
new file mode 100644
index 0000000..b5916ca
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
@@ -0,0 +1,39 @@
+From 61cbd67e88f5e99185d7df1a05f842c58e691495 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 21 Dec 2014 01:01:04 +0100
+Subject: [PATCH] Add Linux to impl side painting whitelist
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ gpu/config/software_rendering_list_json.cc | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
+index ccf1460..8630d75 100644
+--- a/gpu/config/software_rendering_list_json.cc
++++ b/gpu/config/software_rendering_list_json.cc
+@@ -1088,13 +1088,18 @@ LONG_STRING_CONST(
+     },
+     {
+       "id": 99,
+-      "description": "GPU rasterization is blacklisted on non-Android",
++      "description": "GPU rasterization is blacklisted on non-Android and non-Linux (Yocto patch)",
+       "cr_bugs": [362779],
+       "exceptions": [
+         {
+           "os": {
+             "type": "android"
+           }
++        },
++        {
++          "os": {
++            "type": "linux"
++          }
+         }
+       ],
+       "features": [
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
new file mode 100644
index 0000000..f36fc24
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
@@ -0,0 +1,33 @@
+From 68773f2faea2608145e820bf23cf5efaf50e3399 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 9 Jun 2014 15:05:11 +0200
+Subject: [PATCH] Disable API keys info bar
+
+Upstream-Status: Inappropriate [other]
+The info bar is not a bug; it is just undesirable in some use cases.
+A clean approach - which requires discussion with upstream - is to
+disable it by using a command line option.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+index edea11a..4aef68f 100644
+--- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
++++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+@@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
+   if (google_apis::HasKeysConfigured())
+     return;
+ 
++#if 0
+   infobar_service->AddInfoBar(ConfirmInfoBarDelegate::CreateInfoBar(
+       scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelegate())));
++#endif
+ }
+ 
+ GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..402a674
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,43 @@
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
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
+index 7ec5ae2..11e8d1d 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -5808,16 +5808,6 @@
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
diff --git a/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
new file mode 100644
index 0000000..632590a
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
@@ -0,0 +1,77 @@
+From 23e33854a1c5cddc56acd9abdbda14757b809c7d Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 18:08:37 +0200
+Subject: [PATCH] Remove X libraries from GYP files
+
+Some X libraries are linked even when ozone-wayland is used, causing
+linker errors if no X libraries are around
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ third_party/libjingle/source/talk/libjingle.gyp                 | 2 --
+ third_party/libjingle/source/talk/libjingle_examples.gyp        | 4 ----
+ third_party/webrtc/base/base.gyp                                | 4 ----
+ third_party/webrtc/modules/desktop_capture/desktop_capture.gypi | 2 +-
+ 4 files changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/third_party/libjingle/source/talk/libjingle.gyp b/third_party/libjingle/source/talk/libjingle.gyp
+index 90d1f41..22655dc 100755
+--- a/third_party/libjingle/source/talk/libjingle.gyp
++++ b/third_party/libjingle/source/talk/libjingle.gyp
+@@ -455,8 +455,6 @@
+           ],
+           'libraries': [
+             '-lrt',
+-            '-lXext',
+-            '-lX11',
+           ],
+         }],
+         ['OS=="win"', {
+diff --git a/third_party/libjingle/source/talk/libjingle_examples.gyp b/third_party/libjingle/source/talk/libjingle_examples.gyp
+index f7ce53b..204bc1e 100755
+--- a/third_party/libjingle/source/talk/libjingle_examples.gyp
++++ b/third_party/libjingle/source/talk/libjingle_examples.gyp
+@@ -207,10 +207,6 @@
+                 'libraries': [
+                   '<!@(pkg-config --libs-only-l glib-2.0 gobject-2.0'
+                       ' gthread-2.0 gtk+-2.0)',
+-                  '-lX11',
+-                  '-lXcomposite',
+-                  '-lXext',
+-                  '-lXrender',
+                 ],
+               },
+             }],  # OS=="linux"
+diff --git a/third_party/webrtc/base/base.gyp b/third_party/webrtc/base/base.gyp
+index 2fd64ba..ccab4e9 100644
+--- a/third_party/webrtc/base/base.gyp
++++ b/third_party/webrtc/base/base.gyp
+@@ -593,10 +593,6 @@
+             'libraries': [
+               '-ldl',
+               '-lrt',
+-              '-lXext',
+-              '-lX11',
+-              '-lXcomposite',
+-              '-lXrender',
+             ],
+           },
+         }, {
+diff --git a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
+index 1b702f2..93ede57 100644
+--- a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
++++ b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
+@@ -97,7 +97,7 @@
+             'desktop_capture_differ_sse2',
+           ],
+         }],
+-        ['use_x11 == 1', {
++        ['use_x11 == 1 and <(ozone_platform_wayland) != 1', {
+           'link_settings': {
+             'libraries': [
+               '-lX11',
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
new file mode 100644
index 0000000..d0ff07d
--- /dev/null
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -0,0 +1,32 @@
+include chromium.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
+SRC_URI += "\
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-40/0003-Disable-API-keys-info-bar.patch', '', d)} \
+        file://chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://unistd-2.patch \
+"
+SRC_URI[md5sum] = "1f5093bd7e435fdebad070e74bfb3438"
+SRC_URI[sha256sum] = "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481d01d3d60e5e64149"
+
+OZONE_WAYLAND_EXTRA_PATCHES += " \
+        file://chromium-40/0005-Remove-X-libraries-from-GYP-files.patch \
+"
+OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
+OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
+# using 00*.patch to skip the WebRTC patches in ozone-wayland
+# the WebRTC patches remove X11 libraries from the linker flags, which is
+# already done by another patch (see above). Furthermore, to be able to use
+# these patches, it is necessary to update the git repository in third_party/webrtc,
+# which would further complicate this recipe.
+OZONE_WAYLAND_PATCH_FILE_GLOB = "00*.patch"
+
+# Component build is broken in ozone-wayland for Chromium 40,
+# and is not planned to work again before version 41
+python() {
+    if (d.getVar('ENABLE_X11', True) != '1') and (d.getVar('ENABLE_WAYLAND', True) == '1'):
+        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
+            bb.fatal("Chromium 40 Wayland version cannot be built in component-mode")
+}
-- 
1.9.1


