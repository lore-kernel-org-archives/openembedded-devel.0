Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 339D877359
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677012"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:03 +0200
Message-Id: <a703d0fde178c406982cd0add4961bb83d6230dd.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/34] gtkextra: fix gobject introspection support
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index 8ce6e94..926eff7 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -11,9 +11,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gtkextra/${BP}.tar.gz \
 SRC_URI[md5sum] = "486cea93666020f85f101ed8341baf41"
 SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53969e65"
 
-DEPENDS = "gtk+ gobject-introspection-stub"
+DEPENDS = "gtk+"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection
 
 # | ./.libs/libgtkextra-x11-3.0.so: error: undefined reference to 'roundint'
 PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
-- 
2.7.0


