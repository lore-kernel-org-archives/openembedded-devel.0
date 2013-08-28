Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3513C6BA72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:44:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 03:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649025"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:23 +0100
Message-Id: <2739ef0838eb19e2739afc8022a65300f6b22479.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 1/6] midori: remove
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
X-List-Received-Date: Wed, 28 Aug 2013 10:44:46 -0000

This is now in OE-Core as of 88d9d7e47dedd9bfa26da860e6ff77ee5206d9e8.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-connectivity/midori/midori_0.5.2.bb    | 42 ----------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb b/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
deleted file mode 100644
index f4f6221..0000000
--- a/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Midori is a lightweight web browser."
-HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
-
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.5/midori-${PV}.tar.bz2;name=midori \
-"
-SRC_URI[midori.md5sum] = "e2c1e0b617397ec9f9eef4fdb47b3565"
-SRC_URI[midori.sha256sum] = "a9c5cb4606e8e4967a2b980caa9ada25623c50d927a302b6bf73eeac5815c97c"
-
-inherit gtk-icon-cache pkgconfig vala pythonnative
-
-do_configure() {
-    sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
-    ./configure \
-            --prefix=${prefix} \
-            --bindir=${bindir} \
-            --sbindir=${sbindir} \
-            --libexecdir=${libexecdir} \
-            --datadir=${datadir} \
-            --sysconfdir=${sysconfdir} \
-            --sharedstatedir=${sharedstatedir} \
-            --localstatedir=${localstatedir} \
-            --libdir=${libdir} \
-            --includedir=${includedir} \
-            --infodir=${infodir} \
-            --mandir=${mandir} \
-            --disable-gtk3 \
-            --disable-zeitgeist \
-}
-
-PARALLEL_MAKE = ""
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-}
-
-RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
-
-FILES_${PN}-dev += "${datadir}/vala/vapi"
-- 
1.8.1.2


