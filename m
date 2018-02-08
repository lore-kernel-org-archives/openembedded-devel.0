Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 57A586E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 13:51:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 05:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,478,1511856000"; d="scan'208";a="29881123"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2018 05:52:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Feb 2018 15:44:15 +0200
Message-Id: <20180208134415.42347-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gtk-doc: fix build failures for libgdata and libunique
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
X-List-Received-Date: Thu, 08 Feb 2018 13:52:00 -0000

The failures appeared with recent gtk-doc 1.27 update in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb | 4 ++++
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
index c2157df0c..9b025128b 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
@@ -15,6 +15,10 @@ do_configure_prepend_class-target () {
     # introspection.m4 pre-packaged with upstream tarballs does not yet
     # have our fixes
     rm -f ${S}/introspection.m4
+    
+    # remove the pre-built gtk-doc files, as they're installed (or attempted to be installed)
+    # even if gtk-doc is explicitly disabled
+    rm -rf ${S}/docs/reference/html
 }
 
 do_compile_prepend() {
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index 9133cccb1..49ed07ad9 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -25,6 +25,6 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 
-inherit autotools pkgconfig gobject-introspection distro_features_check
+inherit autotools pkgconfig gobject-introspection distro_features_check gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.15.1


