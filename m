Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 12E0A73D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:00:19 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DzAQDLEvhV/5tjdVteGQEBAYMHVGm9TAENgVIdCoUvSgKBQjgUAQEBAQEBAYEKhCMBAQEBA4EJHAMBAi9PCBmIMgEIyWgBAQgCAR+Gc4klbIIuTYExBZVchRCHc4FMRoZrjhqDbB8BAUKEAzwzAQGIYIFIAQEB
X-IPAS-Result: A2DzAQDLEvhV/5tjdVteGQEBAYMHVGm9TAENgVIdCoUvSgKBQjgUAQEBAQEBAYEKhCMBAQEBA4EJHAMBAi9PCBmIMgEIyWgBAQgCAR+Gc4klbIIuTYExBZVchRCHc4FMRoZrjhqDbB8BAUKEAzwzAQGIYIFIAQEB
X-IronPort-AV: E=Sophos;i="5.17,535,1437429600"; d="scan'208";a="22813607"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Sep 2015 14:50:04 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZbpgR-0000Fk-Kr; Tue, 15 Sep 2015 14:50:03 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:50:00 +0200
Message-Id: <1442321402-22469-2-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442321402-22469-1-git-send-email-clopez@igalia.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
Subject: [meta-browser][PATCH 1/3] chromium: Allow to build in Debug mode.
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
X-List-Received-Date: Tue, 15 Sep 2015 13:00:20 -0000

  * Add also a patch that workarounds a build error when building
    in Debug mode and using GCC. This patch has no effect when
    building in Release mode because is guarded within ifdef(debug)
    blocks.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 recipes-browser/chromium/chromium.inc              |  4 ++-
 .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 8221779..03141db 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -7,7 +7,9 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-CHROMIUM_BUILD_TYPE = "Release"
+# The build type defaults to Release. If you want a Debug build, you can set
+# the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.conf file.
+CHROMIUM_BUILD_TYPE ??= "Release"
 
 inherit gettext pythonnative
 
diff --git a/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch b/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
new file mode 100644
index 0000000..c05598a
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
@@ -0,0 +1,32 @@
+From bfe80ed5227fccf8ab13df714702fc77e5e3d657 Mon Sep 17 00:00:00 2001
+From: Carlos Alberto Lopez Perez <clopez@igalia.com>
+Date: Thu, 27 Aug 2015 09:54:06 +0200
+Subject: [PATCH] Fix build error with GCC in Debug mode:
+
+  http://code.google.com/p/chromium/issues/detail?id=525428
+---
+ components/invalidation/invalidator_storage.cc | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/components/invalidation/invalidator_storage.cc b/components/invalidation/invalidator_storage.cc
+index 13ba4b1..3d567c1 100644
+--- a/components/invalidation/invalidator_storage.cc
++++ b/components/invalidation/invalidator_storage.cc
+@@ -2,7 +2,14 @@
+ // Use of this source code is governed by a BSD-style license that can be
+ // found in the LICENSE file.
+ 
++#if !defined(NDEBUG)
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
++#endif // !defined(NDEBUG)
+ #include "components/invalidation/invalidator_storage.h"
++#if !defined(NDEBUG)
++#pragma GCC diagnostic pop
++#endif // !defined(NDEBUG)
+ 
+ #include <string>
+ #include <utility>
+-- 
+2.1.4
+
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index e795e14..9d5bba9 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         file://google-chrome \
         file://google-chrome.desktop \
+        file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
 "
 #
 # * use-egl : Without this packageconfig, the Chromium build will use GLX for creating an OpenGL context in X11,
-- 
2.1.4


