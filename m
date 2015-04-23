Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB716AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:28:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2015 07:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="484699272"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 07:28:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:27:31 +0300
Message-Id: <1429799251-14057-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-systemd][PATCH] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Thu, 23 Apr 2015 14:28:04 -0000

bluez4 recipe has been updated with proper systemd
support, so update meta-systemd append accordingly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
index da01b05..260c02e 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
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


