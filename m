Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5017776417
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443636"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:41 +0300
Message-Id: <1442233610-32279-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/9] gnome-desktop3: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gnome-desktop/gnome-desktop3_3.4.2.bb          | 26 ----------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
deleted file mode 100644
index a056e15..0000000
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "GNOME library for reading .desktop files"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-BPN = "gnome-desktop"
-GNOME_COMPRESS_TYPE ?= "xz"
-
-inherit gnome pkgconfig
-SRC_URI[archive.md5sum] = "efd11d3841c34cc1709d0ea1d3f83cf1"
-SRC_URI[archive.sha256sum] = "7565e0a822132ea7b699cb8c64d42b57081ddefd0b5d911f4f4209be0c755952"
-
-DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification"
-
-EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
-
-do_configure_prepend () {
-    cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
-}
-
-PACKAGES =+ "libgnome-desktop3"
-FILES_libgnome-desktop3 = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop*/pnp.ids ${datadir}/gnome/*xml"
-
-RRECOMMENDS_libgnome-desktop3 += "gsettings-desktop-schemas"
-
-- 
2.1.4


