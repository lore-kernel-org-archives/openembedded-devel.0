Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 12FB56FE33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 20:44:35 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 12CF620C65
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 22:44:35 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 May 2014 22:44:23 +0200
Message-Id: <1401482663-3643-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] chromium: Upgrade to version 35.0.1916.114
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
X-List-Received-Date: Fri, 30 May 2014 20:44:37 -0000

This fixes several CSS transition problems, and improves performance on
some pages

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../chromium/fix-glib-deprecated-warning.patch     | 32 ++++++++++++++++++++++
 ...um_35.0.1883.0.bb => chromium_35.0.1916.114.bb} |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
 rename recipes-browser/chromium/{chromium_35.0.1883.0.bb => chromium_35.0.1916.114.bb} (95%)

diff --git a/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch b/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
new file mode 100644
index 0000000..05b3bbe
--- /dev/null
+++ b/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
@@ -0,0 +1,32 @@
+Stolen the applicable part of https://chromium.googlesource.com/chromium/src.git/+/27f62d43929d33f178e89a832fde0b091a452fdd
+to fix the -Werror problem from a deprecated warning in this file:
+
+| In file included from ../../net/proxy/proxy_config_service_linux.cc:41:0:
+| gen/library_loaders/libgio.h:29:13: error:
+|   'const gchar* const* g_settings_list_schemas()' is deprecated
+|   (declared at .../tmp/sysroots/imx6qsabresd/usr/include/glib-2.0/gio/gsettings.h:74):
+|   Use 'g_settings_schema_source_list_schemas' instead [-Werror=deprecated-declarations]
+|    typeof(&::g_settings_list_schemas) g_settings_list_schemas;
+|              ^
+| cc1plus: all warnings being treated as errors
+
+Upstream-Status: Backport [27f62d43929d33f178e89a832fde0b091a452fdd]
+
+--- chromium-35.0.1883.0/net/proxy/proxy_config_service_linux.cc.old	2014-05-24 11:21:46.456263672 +0200
++++ chromium-35.0.1883.0/net/proxy/proxy_config_service_linux.cc	2014-05-24 11:26:52.041519475 +0200
+@@ -4,6 +4,15 @@
+ 
+ #include "net/proxy/proxy_config_service_linux.h"
+ 
++// glib >=2.40 deprecate g_settings_list_schemas in favor of
++// g_settings_schema_source_list_schemas. This function is not available on
++// earlier versions that we still need to support (specifically, 2.32), so
++// disable the warning.
++// TODO(mgiuca): Remove this suppression when we drop support for Ubuntu 13.10
++// (saucy) and earlier. Update the code to use
++// g_settings_schema_source_list_schemas instead.
++#define GLIB_DISABLE_DEPRECATION_WARNINGS
++
+ #include <errno.h>
+ #include <fcntl.h>
+ #if defined(USE_GCONF)
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1916.114.bb
similarity index 95%
rename from recipes-browser/chromium/chromium_35.0.1883.0.bb
rename to recipes-browser/chromium/chromium_35.0.1916.114.bb
index a9071e7..cab3782 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1916.114.bb
@@ -9,11 +9,12 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
         file://unistd-2.patch \
+        file://fix-glib-deprecated-warning.patch \
         file://google-chrome \
         file://google-chrome.desktop \
 "
-SRC_URI[md5sum] = "c0659bc3c6b540e106e043fd27f54358"
-SRC_URI[sha256sum] = "666d5948c6508072f9f5d6acff82290fa5939e1da1b94b042a1e05daf3357b61"
+SRC_URI[md5sum] = "52a42d4ae36d0104f414cb7b814526d1"
+SRC_URI[sha256sum] = "566fcdc05d53c551d142ac9742ef69ba7c6d5a450d8ec41c0efd4fc8249f77af"
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
 COMPATIBLE_MACHINE = "(-)"
-- 
1.8.3.2


