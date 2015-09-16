Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F69276FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2015 07:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276931"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:57 +0300
Message-Id: <1442414158-15694-5-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 4/5] gnome-themes: Depend on adwaita, not gnome-icon-theme
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
X-List-Received-Date: Wed, 16 Sep 2015 14:34:29 -0000

RDEPEND on adwaita-icon-theme instead of gnome-icon-theme (as latter
is removed from oe-core).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 90bc63c..2da92b6 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -6,7 +6,7 @@ PR = "r3"
 
 SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
-RDEPENDS_${PN} = "gnome-icon-theme"
+RDEPENDS_${PN} = "adwaita-icon-theme"
 
 EXTRA_OECONF += "--enable-all-themes \
     --with-iconmap=${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-name-mapping \
-- 
2.1.4


