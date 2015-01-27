Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 44CDC718E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 00:07:32 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2F84627CBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 01:07:32 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 01:07:25 +0100
Message-Id: <1422317245-13808-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1422317245-13808-1-git-send-email-dv@pseudoterminal.org>
References: <1422317245-13808-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH v2 2/2] chromium: chromium: Upgrade to version 40.0.2214.91
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
X-List-Received-Date: Tue, 27 Jan 2015 00:07:39 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...terization-whitelist-unlocking-impl-side-.patch | 89 ----------------------
 ...ration-conditionally-compile-routines-for.patch | 41 ----------
 ...accelerated-Canvas-support-from-blacklist.patch |  4 +-
 ...Add-Linux-to-impl-side-painting-whitelist.patch | 39 ++++++++++
 .../0003-Disable-API-keys-info-bar.patch}          |  6 +-
 ...-Remove-hard-coded-values-for-CC-and-CXX.patch} |  6 +-
 .../0005-Remove-X-libraries-from-GYP-files.patch}  | 16 ++--
 recipes-browser/chromium/chromium_38.0.2125.101.bb | 27 -------
 recipes-browser/chromium/chromium_40.0.2214.91.bb  | 32 ++++++++
 9 files changed, 87 insertions(+), 173 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/chromium-38/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-38/0001-shell-integration-conditionally-compile-routines-for.patch
 rename recipes-browser/chromium/chromium/{chromium-38 => chromium-40}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (93%)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch
 rename recipes-browser/chromium/chromium/{chromium-38/0002-Disable-API-keys-info-bar.patch => chromium-40/0003-Disable-API-keys-info-bar.patch} (92%)
 rename recipes-browser/chromium/chromium/{chromium-38/0001-Remove-hard-coded-values-for-CC-and-CXX.patch => chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch} (91%)
 rename recipes-browser/chromium/chromium/{chromium-38/0001-Remove-X-libraries-from-GYP-files.patch => chromium-40/0005-Remove-X-libraries-from-GYP-files.patch} (91%)
 delete mode 100644 recipes-browser/chromium/chromium_38.0.2125.101.bb
 create mode 100644 recipes-browser/chromium/chromium_40.0.2214.91.bb

diff --git a/recipes-browser/chromium/chromium/chromium-38/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch b/recipes-browser/chromium/chromium/chromium-38/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
deleted file mode 100644
index 7bc3d34..0000000
--- a/recipes-browser/chromium/chromium/chromium-38/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 2afda4afc9e97164a81ea76367e356c349234fb4 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sun, 12 Oct 2014 17:46:39 +0200
-Subject: [PATCH] Disable rasterization whitelist, unlocking impl side painting
-
-Upstream-Status: Inappropriate [enable feature]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- gpu/config/software_rendering_list_json.cc | 63 ------------------------------
- 1 file changed, 63 deletions(-)
-
-diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
-index 6a12707..4e8e56a 100644
---- a/gpu/config/software_rendering_list_json.cc
-+++ b/gpu/config/software_rendering_list_json.cc
-@@ -1037,69 +1037,6 @@ LONG_STRING_CONST(
-       ]
-     },
-     {
--      "id": 96,
--      "description": "GPU rasterization is whitelisted on N4, N5, N7 and Moto X, and on Qualcomm GPUs on Android 4.4",
--      "cr_bugs": [362779],
--      "os": {
--        "type": "android"
--      },
--      "exceptions": [
--        {
--          "machine_model_name": ["Nexus 4", "Nexus 5", "Nexus 7",
--                                 "XT1049", "XT1050", "XT1052", "XT1053",
--                                 "XT1055", "XT1056", "XT1058", "XT1060"]
--        },
--        {
--          "os": {
--            "type": "android",
--            "version": {
--              "op": ">=",
--              "value": "4.4.99"
--            }
--          }
--        },
--        {
--          "os": {
--            "type": "android",
--            "version": {
--              "op": ">=",
--              "value": "4.4"
--            }
--          },
--          "gl_type": "gles",
--          "gl_version": {
--            "op": ">=",
--            "value": "3.0"
--          }
--        }
--      ],
--      "features": [
--        "gpu_rasterization"
--      ]
--    },
--    {
--      "id": 97,
--      "description": "Additional GPU rasterization whitelist for field trial",
--      "cr_bugs": [380694],
--      "exceptions": [
--        {
--          "os": {
--            "type": "android"
--          },
--          "machine_model_name": ["HTC One",
--                                 "C5303", "C6603", "C6903",
--                                 "GT-I8262", "GT-I8552", "GT-I9195",
--                                 "GT-I9500", "GT-I9505",
--                                 "SAMSUNG-SCH-I337", "SCH-I545", "SGH-M919",
--                                 "SM-N900", "SM-N9005", "SPH-L720",
--                                 "XT907", "XT1032", "XT1033", "XT1080"]
--        }
--      ],
--      "features": [
--        "gpu_rasterization_field_trial"
--      ]
--    },
--    {
-       "id": 98,
-       "description": "Whitelist for using GPU rasterization for a broader set of content",
-       "cr_bugs": [399306],
--- 
-1.9.1
-
diff --git a/recipes-browser/chromium/chromium/chromium-38/0001-shell-integration-conditionally-compile-routines-for.patch b/recipes-browser/chromium/chromium/chromium-38/0001-shell-integration-conditionally-compile-routines-for.patch
deleted file mode 100644
index bf0f274..0000000
--- a/recipes-browser/chromium/chromium/chromium-38/0001-shell-integration-conditionally-compile-routines-for.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 40659667549d1eec5c9ed29c6120584f6628d761 Mon Sep 17 00:00:00 2001
-From: Eric Nelson <eric.nelson@boundarydevices.com>
-Date: Mon, 6 Oct 2014 18:11:29 -0700
-Subject: [PATCH] shell integration: conditionally compile routines for use
- with GLIB
-
-The routine QuoteArgForDesktopFileExec is only called when GLIB is
-used, and compilation will fail with the following error message
-if it is compiled.
-
-	"defined but not used [-Werror=unused-function]"
-
-Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
----
- chrome/browser/shell_integration_linux.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/chrome/browser/shell_integration_linux.cc b/chrome/browser/shell_integration_linux.cc
-index 24a1c55..bd82db4 100644
---- a/chrome/browser/shell_integration_linux.cc
-+++ b/chrome/browser/shell_integration_linux.cc
-@@ -260,6 +260,7 @@ void DeleteShortcutInApplicationsMenu(
-   LaunchXdgUtility(argv, &exit_code);
- }
- 
-+#if defined(USE_GLIB)
- // Quote a string such that it appears as one verbatim argument for the Exec
- // key in a desktop file.
- std::string QuoteArgForDesktopFileExec(const std::string& arg) {
-@@ -307,6 +308,8 @@ std::string QuoteCommandLineForDesktopFileExec(
-   return quoted_path;
- }
- 
-+#endif
-+
- const char kDesktopEntry[] = "Desktop Entry";
- 
- const char kXdgOpenShebang[] = "#!/usr/bin/env xdg-open";
--- 
-1.9.1
-
diff --git a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
similarity index 93%
rename from recipes-browser/chromium/chromium/chromium-38/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
rename to recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
index fab0344..e2c1a5c 100644
--- a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
@@ -1,4 +1,4 @@
-From 7166cba808d1922f4604d6771c21b90513bf9c2b Mon Sep 17 00:00:00 2001
+From 821d9fde2302f68f7cb7f0b211f4f78220c97180 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Sun, 12 Oct 2014 17:54:18 +0200
 Subject: [PATCH] Remove accelerated Canvas support from blacklist
@@ -18,7 +18,7 @@ Upstream-Status: Inappropiate [see link above]
  1 file changed, 10 deletions(-)
 
 diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
-index 4e8e56a..f6dd7e5 100644
+index b9f5e3a..ccf1460 100644
 --- a/gpu/config/software_rendering_list_json.cc
 +++ b/gpu/config/software_rendering_list_json.cc
 @@ -240,16 +240,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
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
diff --git a/recipes-browser/chromium/chromium/chromium-38/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
similarity index 92%
rename from recipes-browser/chromium/chromium/chromium-38/0002-Disable-API-keys-info-bar.patch
rename to recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
index 5b5962a..f36fc24 100644
--- a/recipes-browser/chromium/chromium/chromium-38/0002-Disable-API-keys-info-bar.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0003-Disable-API-keys-info-bar.patch
@@ -1,4 +1,4 @@
-From e3a694a5324b9fab58875f2a1bd4cbe48fe6e151 Mon Sep 17 00:00:00 2001
+From 68773f2faea2608145e820bf23cf5efaf50e3399 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Mon, 9 Jun 2014 15:05:11 +0200
 Subject: [PATCH] Disable API keys info bar
@@ -14,7 +14,7 @@ Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
  1 file changed, 2 insertions(+)
 
 diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-index 5014219..bb2a39d 100644
+index edea11a..4aef68f 100644
 --- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
 +++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
 @@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
@@ -29,5 +29,5 @@ index 5014219..bb2a39d 100644
  
  GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
 -- 
-1.8.3.2
+1.9.1
 
diff --git a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
similarity index 91%
rename from recipes-browser/chromium/chromium/chromium-38/0001-Remove-hard-coded-values-for-CC-and-CXX.patch
rename to recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
index 47ae86e..402a674 100644
--- a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-hard-coded-values-for-CC-and-CXX.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0004-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -1,4 +1,4 @@
-From e5c8af3d5e2a49effd39846657dd55ff6af44a63 Mon Sep 17 00:00:00 2001
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Sun, 12 Oct 2014 19:31:47 +0200
 Subject: [PATCH] Remove hard coded values for CC and CXX
@@ -18,10 +18,10 @@ Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
  1 file changed, 10 deletions(-)
 
 diff --git a/build/common.gypi b/build/common.gypi
-index 609041c..4040a0b 100644
+index 7ec5ae2..11e8d1d 100644
 --- a/build/common.gypi
 +++ b/build/common.gypi
-@@ -5577,16 +5577,6 @@
+@@ -5808,16 +5808,6 @@
          ['CXX.host', '<(host_cxx)'],
        ],
      }],
diff --git a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-X-libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
similarity index 91%
rename from recipes-browser/chromium/chromium/chromium-38/0001-Remove-X-libraries-from-GYP-files.patch
rename to recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
index 4734f31..632590a 100644
--- a/recipes-browser/chromium/chromium/chromium-38/0001-Remove-X-libraries-from-GYP-files.patch
+++ b/recipes-browser/chromium/chromium/chromium-40/0005-Remove-X-libraries-from-GYP-files.patch
@@ -1,4 +1,4 @@
-From 715277bbb81a32c7225416eaef77521b2a4f63ac Mon Sep 17 00:00:00 2001
+From 23e33854a1c5cddc56acd9abdbda14757b809c7d Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Sun, 12 Oct 2014 18:08:37 +0200
 Subject: [PATCH] Remove X libraries from GYP files
@@ -17,10 +17,10 @@ Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
  4 files changed, 1 insertion(+), 11 deletions(-)
 
 diff --git a/third_party/libjingle/source/talk/libjingle.gyp b/third_party/libjingle/source/talk/libjingle.gyp
-index 6064277..7fbf5b5 100755
+index 90d1f41..22655dc 100755
 --- a/third_party/libjingle/source/talk/libjingle.gyp
 +++ b/third_party/libjingle/source/talk/libjingle.gyp
-@@ -575,8 +575,6 @@
+@@ -455,8 +455,6 @@
            ],
            'libraries': [
              '-lrt',
@@ -30,7 +30,7 @@ index 6064277..7fbf5b5 100755
          }],
          ['OS=="win"', {
 diff --git a/third_party/libjingle/source/talk/libjingle_examples.gyp b/third_party/libjingle/source/talk/libjingle_examples.gyp
-index 3e31f50..44252a3 100755
+index f7ce53b..204bc1e 100755
 --- a/third_party/libjingle/source/talk/libjingle_examples.gyp
 +++ b/third_party/libjingle/source/talk/libjingle_examples.gyp
 @@ -207,10 +207,6 @@
@@ -45,10 +45,10 @@ index 3e31f50..44252a3 100755
                },
              }],  # OS=="linux"
 diff --git a/third_party/webrtc/base/base.gyp b/third_party/webrtc/base/base.gyp
-index ba5678e..e1cabc7 100644
+index 2fd64ba..ccab4e9 100644
 --- a/third_party/webrtc/base/base.gyp
 +++ b/third_party/webrtc/base/base.gyp
-@@ -574,10 +574,6 @@
+@@ -593,10 +593,6 @@
              'libraries': [
                '-ldl',
                '-lrt',
@@ -58,9 +58,9 @@ index ba5678e..e1cabc7 100644
 -              '-lXrender',
              ],
            },
-           'conditions': [
+         }, {
 diff --git a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
-index a0195d6..ec6738b 100644
+index 1b702f2..93ede57 100644
 --- a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
 +++ b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
 @@ -97,7 +97,7 @@
diff --git a/recipes-browser/chromium/chromium_38.0.2125.101.bb b/recipes-browser/chromium/chromium_38.0.2125.101.bb
deleted file mode 100644
index 55d2cca..0000000
--- a/recipes-browser/chromium/chromium_38.0.2125.101.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-include chromium.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
-SRC_URI += "\
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-38/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-38/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-38/0002-Disable-API-keys-info-bar.patch', '', d)} \
-        file://chromium-38/0001-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://unistd-2.patch \
-"
-# conditionally add shell integration patch (ozone-wayland contains a patch that makes
-# this one redundant, therefore use this patch only for X11 builds)
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'file://chromium-38/0001-shell-integration-conditionally-compile-routines-for.patch', '', d)}"
-SRC_URI[md5sum] = "be4d3ad6944e43132e4fbde5a23d1ab8"
-SRC_URI[sha256sum] = "d3303519ab471a3bc831e9b366e64dc2fe651894e52ae5d1e74de60ee2a1198a"
-
-OZONE_WAYLAND_EXTRA_PATCHES += " \
-        file://chromium-38/0001-Remove-X-libraries-from-GYP-files.patch \
-"
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-Harvest"
-OZONE_WAYLAND_GIT_SRCREV = "0f8b830730d9b696a667c331c50ac6333bb85c13"
-# using 00*.patch to skip the WebRTC patches in ozone-wayland
-# the WebRTC patches remove X11 libraries from the linker flags, which is
-# already done by another patch (see above). Furthermore, to be able to use
-# these patches, it is necessary to update the git repository in third_party/webrtc,
-# which would further complicate this recipe.
-OZONE_WAYLAND_PATCH_FILE_GLOB = "00*.patch"
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


