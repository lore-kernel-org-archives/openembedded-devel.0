Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E53D6AFC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:31:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 07:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="367414784"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2013 07:31:48 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:31:18 +0300
Message-Id: <1377268278-2292-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] midori: upgrade to 0.5.5
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
X-List-Received-Date: Fri, 23 Aug 2013 14:31:50 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../midori/{midori_0.5.2.bb => midori_0.5.5.bb}    |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.5.2.bb => midori_0.5.5.bb} (83%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb b/meta-gnome/recipes-connectivity/midori/midori_0.5.5.bb
similarity index 83%
rename from meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.5.5.bb
index f4f6221..e545753 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.5.5.bb
@@ -4,10 +4,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
 
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.5/midori-${PV}.tar.bz2;name=midori \
+SRC_URI = "http://www.midori-browser.org/downloads/${PN}_${PV}_all_.tar.bz2 \
 "
-SRC_URI[midori.md5sum] = "e2c1e0b617397ec9f9eef4fdb47b3565"
-SRC_URI[midori.sha256sum] = "a9c5cb4606e8e4967a2b980caa9ada25623c50d927a302b6bf73eeac5815c97c"
+
+SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
+SRC_URI[sha256sum] = "ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
-- 
1.7.9.5


