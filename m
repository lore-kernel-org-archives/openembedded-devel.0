Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id ECA5471A07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 13:17:43 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AwAgCe8zJY/5tjdVtdHAEBBAEBCgEBgzgBAQEBAR+BWI0/pzeCOoIOggWGIQKBfD8UAQIBAQEBAQEBYiiEaQIEIw8BRhAlAiYCAlcZiHEBqyaCKYtPAQEBAQYBAQEBI4EJhTOJb4IACy2CXQWOa4tikHcCkCVJkSEeN4UOgUY9NIhRAQEB
X-IPAS-Result: A2AwAgCe8zJY/5tjdVtdHAEBBAEBCgEBgzgBAQEBAR+BWI0/pzeCOoIOggWGIQKBfD8UAQIBAQEBAQEBYiiEaQIEIw8BRhAlAiYCAlcZiHEBqyaCKYtPAQEBAQYBAQEBI4EJhTOJb4IACy2CXQWOa4tikHcCkCVJkSEeN4UOgUY9NIhRAQEB
X-IronPort-AV: E=Sophos;i="5.31,675,1473112800"; d="scan'208";a="196930074"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Nov 2016 14:17:27 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c8oTP-0000BJ-NG; Mon, 21 Nov 2016 14:17:27 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c8oTJ-0001iu-AJ; Mon, 21 Nov 2016 14:17:21 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:17:01 +0100
Message-Id: <1479734221-15056-3-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479734221-15056-1-git-send-email-jaragunde@igalia.com>
References: <1479734221-15056-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH v3 3/3] Remove conditional detection of CHROMIUM_ENABLE_WAYLAND
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
X-List-Received-Date: Mon, 21 Nov 2016 13:17:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It can be a source of problems, because you must have chosen the
correct recipe to build the wayland or x11 version of chromium.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium-browser.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 4fb47fd..8c73207 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -102,12 +102,6 @@ PACKAGECONFIG[kiosk-mode] = ""
 PACKAGECONFIG[proprietary-codecs] = ""
 
 
-# Conditionally add ozone-wayland and its patches to the Chromium sources
-# You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
-CHROMIUM_ENABLE_WAYLAND ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', \
-                     bb.utils.contains('DISTRO_FEATURES', 'wayland', '1', \
-                     '0', d),d)}"
-
 # ozone-wayland will be cloned into a directory with this name
 OZONE_WAYLAND_GIT_DESTSUFFIX ?= "ozone-wayland-git"
 # Use glob to filter out the patches that shall be applied against ozone-wayland.
-- 
2.1.4


