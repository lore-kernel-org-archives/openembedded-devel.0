Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9605E769A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443666"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:43 +0300
Message-Id: <1442233610-32279-4-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/9] gcr: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
deleted file mode 100644
index e9a837b..0000000
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A library for bits of crypto UI and parsing etc"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
-
-PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
-# e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
-#      sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pgp.convert
-
-inherit autotools gnomebase gtk-icon-cache gtk-doc
-
-GNOME_COMPRESS_TYPE="xz"
-
-SRC_URI[archive.md5sum] = "f5e66afcab19897a0de0590735329fb1"
-SRC_URI[archive.sha256sum] = "a1e615ce2cfd375f383bbdd289935a8e3e16901c3c6f032780847055e8bec2c1"
-
-FILES_${PN} += " \
-    ${datadir}/dbus-1 \
-    ${datadir}/gcr-3 \
-"
-- 
2.1.4


