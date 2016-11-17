Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id AF20271ABB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:34:24 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DmAQCi6S1Y/5tjdVteHAEBBAEBCgEBgzcBAQEBAR+BWI0/py+COIIOggeGIQKCGT8UAQIBAQEBAQEBYiiEaQIEIw8BRhAlAiYCAlcZiHABrQaCKYteAQEBAQYBAQEBI4EJhTOJb4IACy2CXQWOYYtikG0CkCRJkRIeN4UBgUY9NId5AQEB
X-IPAS-Result: A2DmAQCi6S1Y/5tjdVteHAEBBAEBCgEBgzcBAQEBAR+BWI0/py+COIIOggeGIQKCGT8UAQIBAQEBAQEBYiiEaQIEIw8BRhAlAiYCAlcZiHABrQaCKYteAQEBAQYBAQEBI4EJhTOJb4IACy2CXQWOYYtikG0CkCRJkRIeN4UBgUY9NId5AQEB
X-IronPort-AV: E=Sophos;i="5.31,506,1473112800"; d="scan'208";a="79860797"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 17 Nov 2016 18:34:24 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c7QZs-0004Jk-2r; Thu, 17 Nov 2016 18:34:24 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1c7QZq-0006Qg-4v; Thu, 17 Nov 2016 18:34:22 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 18:34:15 +0100
Message-Id: <1479404055-12584-3-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
References: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH 3/3] Remove conditional detection of CHROMIUM_ENABLE_WAYLAND
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
X-List-Received-Date: Thu, 17 Nov 2016 17:34:26 -0000
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


