Return-Path: <ismo.puustinen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C3E6B77F6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:36:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2017 03:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,368,1493708400"; d="scan'208";a="1162981895"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2017 03:36:50 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jun 2017 13:36:47 +0300
Message-Id: <20170621103647.21137-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIXSBsdm0yOsKgbWFrZSBsdm0yLXVkZXZydWxlcyBkZXBlbmQgb24gbHZtMi4=?=
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
X-List-Received-Date: Wed, 21 Jun 2017 10:36:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The udev rules use dmsetup, which has been recently moved into lvm2
pacakge.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
index 84881e7..1451ba0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
@@ -45,6 +45,7 @@ FILES_${PN}-scripts = " \
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
+RDEPENDS_${PN}-udevrules_append_class-target = " lvm2"
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
-- 
2.9.4


