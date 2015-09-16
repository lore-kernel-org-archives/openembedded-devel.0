Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9B17475F3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2015 07:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276873"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:24 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:54 +0300
Message-Id: <1442414158-15694-2-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 1/5] gupnp-tools: Upgrade 0.8.1 -> 0.8.10
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
X-List-Received-Date: Wed, 16 Sep 2015 14:34:27 -0000

* Icon theme is no longer a build requirement.
* RRecommend Adwaita as icon theme
* Depend on GTK+3
* license checksum change is not an actual license change

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gupnp/{gupnp-tools_0.8.1.bb => gupnp-tools_0.8.10.bb}     | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.8.1.bb => gupnp-tools_0.8.10.bb} (50%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
similarity index 50%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
index 178cea3..821b5a3 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
@@ -1,11 +1,12 @@
 SUMMARY = "Tools for GUPnP"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
-DEPENDS = "gupnp gupnp-av gtk+ gnome-icon-theme"
+                    file://src/network-light/main.c;beginline=1;endline=21;md5=2c39b3a000495dabd4932f231c7efed8"
+DEPENDS = "gupnp gupnp-av gtk+3"
+RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "cafc2a4f2d1a91a8c1228799073d1d7d"
-SRC_URI[sha256sum] = "57d5ca899f8da7e4ae69e5f98d75d1603aa7f388022f9ccb357f90abb22b75b6"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "ad8423d036e98bc6f877528d6b846f6a"
+SRC_URI[sha256sum] = "592c53289ff1cd70e676405c56ca87b28d2da37a385d34a3bb9b944ba9108d17"
 
 inherit autotools pkgconfig
-- 
2.1.4


