Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE97773A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677056"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:10 +0200
Message-Id: <adae99a62960b4c3f9de696210b43ef67eb5ab6d.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/34] poppler: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:48 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/poppler/poppler_0.37.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
index 59c477d..2c6b1a9 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "b89f9c5eae3bbb1046b0f767714afd75eca102a0406a3a30856778d42a
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gobject-introspection
 
 PACKAGECONFIG ??= "jpeg openjpeg png tiff ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
@@ -28,6 +28,10 @@ EXTRA_OECONF = "\
     --enable-zlib \
 "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/poppler/.libs"
+}
+
 # Adjust library names when building for QT4e
 QT4E_PATCHES = "${@bb.utils.contains('PACKAGECONFIG', 'qt4e', 'file://fix-qt4e-library-dependencies.patch', '', d)}"
 SRC_URI_append = "${QT4E_PATCHES}"
-- 
2.7.0


