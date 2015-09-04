Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF16877045
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 20:30:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 13:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; d="scan'208";a="638750836"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.17.204])
	by orsmga003.jf.intel.com with ESMTP; 04 Sep 2015 13:26:21 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:26:13 -0500
Message-Id: <1441398373-21244-1-git-send-email-alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH]] toybox: upgrade to 0.6.0
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
X-List-Received-Date: Fri, 04 Sep 2015 20:30:37 -0000

Change SRC_URI since patch is not longer need it.
Update the checksum for package.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta-oe/recipes-core/toybox/{toybox_0.5.2.bb => toybox_0.6.0.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.5.2.bb => toybox_0.6.0.bb} (90%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.5.2.bb b/meta-oe/recipes-core/toybox/toybox_0.6.0.bb
similarity index 90%
rename from meta-oe/recipes-core/toybox/toybox_0.5.2.bb
rename to meta-oe/recipes-core/toybox/toybox_0.6.0.bb
index bcd6a72..da03200 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.5.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.6.0.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Toybox combines common utilities together into a single executable."
 HOMEPAGE = "http://www.landley.net/toybox/"
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-    file://0001-Match-paths-with-busybox.patch"
-SRC_URI[md5sum] = "b5d1242767c411b69dcd717da1c218b2"
-SRC_URI[sha256sum] = "dec7f6433ee0e130f224fc63760b347ad0572280c4de32f1aaefbee813a79a00"
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7f4a6c89e56c48e3350e611f5b36c2cf"
+SRC_URI[sha256sum] = "b6e2694d19ac08f1c3416d5b2a02a31d445db2ed98dec89761430cdff2c9710d"
+
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
-- 
2.1.0


