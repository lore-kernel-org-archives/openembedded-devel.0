Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 3222A71A63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 13:17:42 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BHAgCe8zJY/5tjdVtdHQEFAQsBgzgBAQEBAR9YgQCNP6c3gjqCDoIFGAyFfYF+PxQBAgEBAQEBAQFiKIUSDwFGNQImAnKIcQEJqx2CKYtPMYEJhTOJb4IACy2CXQWaTYZCijUCgj2NaEmRIR43hQ6BRj00AQGITwEBAQ
X-IPAS-Result: A2BHAgCe8zJY/5tjdVtdHQEFAQsBgzgBAQEBAR9YgQCNP6c3gjqCDoIFGAyFfYF+PxQBAgEBAQEBAQFiKIUSDwFGNQImAnKIcQEJqx2CKYtPMYEJhTOJb4IACy2CXQWaTYZCijUCgj2NaEmRIR43hQ6BRj00AQGITwEBAQ
X-IronPort-AV: E=Sophos;i="5.31,675,1473112800"; d="scan'208";a="196930073"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Nov 2016 14:17:27 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c8oTP-0000BF-FF; Mon, 21 Nov 2016 14:17:27 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c8oTJ-0001iu-6x; Mon, 21 Nov 2016 14:17:21 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:16:59 +0100
Message-Id: <1479734221-15056-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH v3 1/3] Set CHROMIUM_ENABLE_WAYLAND flag in chromium-wayland recipe
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
X-List-Received-Date: Mon, 21 Nov 2016 13:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It makes no sense to trigger a build of chromium-wayland and not
enable CHROMIUM_ENABLE_WAYLAND, so we are doing it directly in the
recipe now.

Now we know the value of the flag beforehand, we are allowed to
remove some conditionals. Additionally, we check if Wayland is
available before building.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index bbba147..0db8f7d 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -1,3 +1,5 @@
+CHROMIUM_ENABLE_WAYLAND = "1"
+
 include chromium-browser.inc
 
 DEPENDS += "wayland libxkbcommon"
@@ -21,15 +23,14 @@ SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f6
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
 OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
 
-SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch', '', d)}"
+SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
 
 # Component build is unsupported in ozone-wayland for Chromium 48
 python() {
-    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
-        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
-            bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
-    else:
-        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enabled")
+    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
+        raise bb.parse.SkipPackage("Wayland is not available")
+    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
+        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
 }
 
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
-- 
2.1.4


