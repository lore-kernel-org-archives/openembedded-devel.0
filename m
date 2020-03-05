Return-Path: <sanjeev.nahulanthran@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A85FA611C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 16:19:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2020 08:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="387209678"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.65])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2020 08:19:38 -0800
From: sanjeev.nahulanthran@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 08:20:05 +0800
Message-Id: <20200305002005.23821-1-sanjeev.nahulanthran@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][meta-oe][PATCH] ade: Fix install paths in multilib builds
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
X-List-Received-Date: Wed, 04 Mar 2020 16:19:38 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: ade-0.1.1f-r0 do_package: QA Issue: ade: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libade.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sanjeev Nahulanthran <sanjeev.nahulanthran@intel.com>
---
 ...tallDirs-for-detecting-install-paths.patch | 39 +++++++++++++++++++
 meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch

diff --git a/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch b/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
new file mode 100644
index 000000000..f038b0aa9
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
@@ -0,0 +1,39 @@
+From 67ccf77d97b76e8260c9d793ab172577e2393dbc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 21:33:46 -0800
+Subject: [PATCH] use GNUInstallDirs for detecting install paths
+
+This helps with multilib builds
+
+Upstream-Status: Submitted [https://github.com/opencv/ade/pull/19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sources/ade/CMakeLists.txt | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/sources/ade/CMakeLists.txt b/sources/ade/CMakeLists.txt
+index 2d1dd20..46415d1 100644
+--- a/sources/ade/CMakeLists.txt
++++ b/sources/ade/CMakeLists.txt
+@@ -47,12 +47,14 @@ if(BUILD_ADE_DOCUMENTATION)
+                       VERBATIM)
+ endif()
+ 
++include(GNUInstallDirs)
++
+ install(TARGETS ade COMPONENT dev
+         EXPORT adeTargets
+-        ARCHIVE DESTINATION lib
+-        LIBRARY DESTINATION lib
+-        RUNTIME DESTINATION lib
+-        INCLUDES DESTINATION include)
++	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
++	INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ 
+ install(EXPORT adeTargets DESTINATION share/ade COMPONENT dev)
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
index 332820d14..386180215 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
@@ -5,6 +5,7 @@ organizing data flow processing and execution."
 HOMEPAGE = "https://github.com/opencv/ade"
 
 SRC_URI = "git://github.com/opencv/ade.git \
+           file://0001-use-GNUInstallDirs-for-detecting-install-paths.patch \
            "
 
 SRCREV = "58b2595a1a95cc807be8bf6222f266a9a1f393a9"
-- 
2.17.1


