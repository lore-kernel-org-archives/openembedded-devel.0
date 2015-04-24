Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0A44A605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 15:43:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 Apr 2015 08:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,641,1422950400"; d="scan'208";a="485192623"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2015 08:43:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 18:43:51 +0300
Message-Id: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Fri, 24 Apr 2015 15:44:00 -0000

bluez4 recipe has been updated with proper systemd
support, so update meta-systemd append accordingly.
Also update to the right directory structure.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5 -----
 1 file changed, 5 deletions(-)
 rename meta-systemd/{oe-core => meta-oe}/recipes-connectivity/bluez/bluez4_4.101.bbappend (51%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
similarity index 51%
rename from meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
index da01b05..260c02e 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -1,9 +1,4 @@
-inherit systemd
-
-EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "bluetooth.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.1.0


