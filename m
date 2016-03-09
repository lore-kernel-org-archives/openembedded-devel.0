Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 62A566018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869201"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:39 +0200
Message-Id: <cb55ef190b3ae218d7068d0073ede08a2e6dde44.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/38] gtkextra: fix gobject introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:17 -0000

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


