Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 7D19073D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:00:22 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DRBQDLEvhV/5tjdVteGQEBAYMHVGmqBohTgWmJGIF1hX0CgUI5EwEBAQEBAQGBCoQkAQEEgQlRVxmIMgHJcAErhnOKEReEFQWHMo4qhRCHc4IShmuSBiMDPYISGxaBQDwzAQGKKAEBAQ
X-IPAS-Result: A2DRBQDLEvhV/5tjdVteGQEBAYMHVGmqBohTgWmJGIF1hX0CgUI5EwEBAQEBAQGBCoQkAQEEgQlRVxmIMgHJcAErhnOKEReEFQWHMo4qhRCHc4IShmuSBiMDPYISGxaBQDwzAQGKKAEBAQ
X-IronPort-AV: E=Sophos;i="5.17,535,1437429600"; d="scan'208";a="22813608"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Sep 2015 14:50:04 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZbpgR-0000Fk-OS; Tue, 15 Sep 2015 14:50:03 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:50:01 +0200
Message-Id: <1442321402-22469-3-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442321402-22469-1-git-send-email-clopez@igalia.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
Subject: [meta-browser][PATCH 2/3] chromium: Clean the definitions of some ozone-wayland variables.
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
X-List-Received-Date: Tue, 15 Sep 2015 13:00:22 -0000

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 9d5bba9..195246d 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -64,15 +64,9 @@ ENABLE_WAYLAND = "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
                      base_contains('DISTRO_FEATURES', 'wayland', '1', \
                      '0', d),d)}"
 
-# variable for extra ozone-wayland patches, typically extended by BSP layer .bbappends
-# IMPORTANT: do not simply add extra ozone-wayland patches to the SRC_URI in a
-# .bbappend, since the base ozone-wayland patches need to be applied first (see below)
-
-OZONE_WAYLAND_EXTRA_PATCHES = " "
-
 OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
-OZONE_WAYLAND_GIT_BRANCH = ""
-OZONE_WAYLAND_GIT_SRCREV = ""
+OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
+OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
 SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
 OZONE_WAYLAND_PATCH_FILE_GLOB = "*.patch"
 
@@ -90,12 +84,13 @@ SRC_URI += "\
 SRC_URI[md5sum] = "1f5093bd7e435fdebad070e74bfb3438"
 SRC_URI[sha256sum] = "f72fda9ff1ea256ab911610ee532eadf8303137d431f2481d01d3d60e5e64149"
 
-OZONE_WAYLAND_EXTRA_PATCHES += " \
+# Variable for extra ozone-wayland patches, typically extended by BSP layer .bbappends
+# IMPORTANT: do not simply add extra ozone-wayland patches to the SRC_URI in a
+# .bbappend, since the base ozone-wayland patches need to be applied first (see below)
+OZONE_WAYLAND_EXTRA_PATCHES = " \
         file://chromium-40/0005-Remove-X-libraries-from-GYP-files.patch \
         file://chromium-40/0010-systemd-218.patch \
 "
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
-OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
 # using 00*.patch to skip the WebRTC patches in ozone-wayland
 # the WebRTC patches remove X11 libraries from the linker flags, which is
 # already done by another patch (see above). Furthermore, to be able to use
-- 
2.1.4


