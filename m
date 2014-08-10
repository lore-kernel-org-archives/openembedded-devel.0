Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DEE2370B3F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:14:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134163"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:14:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:43 +0100
Message-Id: <32663648efc0855795de7cf8cf090f5277eac7ef.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 3/5] avahi: systemd support now in OE-Core
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
X-List-Received-Date: Sun, 10 Aug 2014 16:14:58 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
index 5b6e559..181b878 100644
--- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -1,9 +1,4 @@
-inherit systemd
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "avahi-daemon.service"
-SYSTEMD_AUTO_ENABLE = "enable"
 
-FILES_${PN} += "${systemd_unitdir}/system/"
-- 
1.9.3


