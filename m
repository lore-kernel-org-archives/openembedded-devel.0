Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2D277D55
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 14:09:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 07:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="1165061555"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2017 07:09:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 May 2017 17:09:09 +0300
Message-Id: <20170505140912.8205-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
References: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] portmap.bbappend: remove the file
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
X-List-Received-Date: Fri, 05 May 2017 14:09:16 -0000

portmap has been removed from oe-core; the upstream is defunct and
rpcbind supersedes it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend        | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
deleted file mode 100644
index 6ce6e70d9..000000000
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-- 
2.11.0


