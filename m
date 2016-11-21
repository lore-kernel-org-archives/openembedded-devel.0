Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 3116771A07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 13:17:41 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BNAgCe8zJY/5tjdVtdHgYMgzgBAQEBAR9YgQCjfZB5gjqCDoIFJIV9AoF8PxQBAgEBAQEBAQFiKIRpAgQjDwFGECUCJgICVxmIcQGrJoIpi08BAQEBAQUBAQEBI4EJhTOJb4IACy2CXQWaTYZCijUCkCVJkSEeN4RbG4FePTQBAYhPAQEB
X-IPAS-Result: A2BNAgCe8zJY/5tjdVtdHgYMgzgBAQEBAR9YgQCjfZB5gjqCDoIFJIV9AoF8PxQBAgEBAQEBAQFiKIRpAgQjDwFGECUCJgICVxmIcQGrJoIpi08BAQEBAQUBAQEBI4EJhTOJb4IACy2CXQWaTYZCijUCkCVJkSEeN4RbG4FePTQBAYhPAQEB
X-IronPort-AV: E=Sophos;i="5.31,675,1473112800"; d="scan'208";a="196930037"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Nov 2016 14:17:23 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c8oTL-0000B8-7a; Mon, 21 Nov 2016 14:17:23 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c8oTJ-0001iu-8h; Mon, 21 Nov 2016 14:17:21 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:17:00 +0100
Message-Id: <1479734221-15056-2-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479734221-15056-1-git-send-email-jaragunde@igalia.com>
References: <1479734221-15056-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH v3 2/3] Disable CHROMIUM_ENABLE_WAYLAND in the x11 recipe
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

The chromium x11 recipe crashed when run with CHROMIUM_ENABLE_WAYLAND
enabled, because it missed some steps that are performed in the
chromium-wayland recipe. Doing this change, we eliminate one possible
failure point.

Also adds a check for x11 in DISTRO_FEATURES.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium_52.0.2743.76.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
index 14b519c..a3270e9 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -1,3 +1,5 @@
+CHROMIUM_ENABLE_WAYLAND = "0"
+
 include chromium-browser.inc
 
 DEPENDS += "xextproto gtk+ libxi libxss"
@@ -16,3 +18,9 @@ SRC_URI += "\
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
 SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
+
+# X11 must be available for this flavor of Chromium
+python() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d):
+        raise bb.parse.SkipPackage("X11 is not available")
+}
-- 
2.1.4


