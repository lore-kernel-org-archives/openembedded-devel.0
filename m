Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF597EDE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:54:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 20:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="249341790"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 09 Jul 2019 20:54:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 11:54:29 +0800
Message-Id: <1562730869-3214-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xterm: upgrade 330 -> 347
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
X-List-Received-Date: Wed, 10 Jul 2019 03:54:31 -0000

Install the resources in ${datadir} to make it consistent with other apps.
License checksum changed because of change in Copyright year.

Changelog:

https://invisible-island.net/xterm/xterm.log.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/xorg-app/{xterm_330.bb => xterm_347.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_330.bb => xterm_347.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb b/meta-oe/recipes-graphics/xorg-app/xterm_347.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/xterm_330.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_347.bb
index c2feb81..92d8491 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_347.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=f02ab9ebda87b770ecf711dbb3784a33"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7c0ad90e90c390d"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "9a6db7974aa4ccbb50eabebf72618467"
-SRC_URI[sha256sum] = "7aeef9f29f6b95e09f481173c8c3053357bf5ffe162585647f690fd1707556df"
+SRC_URI[md5sum] = "5d2c56ebd1d81ee40f23236d6e3c2e5b"
+SRC_URI[sha256sum] = "400f73e1277ef96dfcb3885388525e6a13a3657a4032b83c1203e812b710b908"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
@@ -16,7 +16,9 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
                  --disable-imake \
                  --disable-rpath-hack \
-                 --disable-setuid"
+                 --disable-setuid \
+                 --with-app-defaults=${datadir}/X11/app-defaults \
+                 "
 
 B = "${S}"
 
@@ -26,8 +28,6 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += "/usr/lib/X11"
-
 # busybox can supply resize too
 inherit update-alternatives
 
-- 
2.7.4


