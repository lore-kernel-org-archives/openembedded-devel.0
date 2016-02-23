Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7A5772E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676864"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:40 +0200
Message-Id: <6fb2ad3dc38220c6105b9e34ca2f659bb8f941ea.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/34] evolution-data-server: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 426076f..a5664b0 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc pkgconfig gettext
+inherit autotools gtk-doc pkgconfig gettext gobject-introspection
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread"
@@ -42,6 +42,10 @@ do_configure_append () {
     cp ${WORKDIR}/iconv-detect.h ${S}
 }
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
+}
+
 EXTRA_OECONF = "--without-openldap \
                 --with-libdb=${STAGING_DIR_HOST}${prefix} \
                 --disable-nntp --disable-goa --disable-weather"
-- 
2.7.0


