Return-Path: <amarnath.valluri@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5365360602
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:16:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 05:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="222795513"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga004.fm.intel.com with ESMTP; 08 Feb 2017 05:16:19 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:17:05 +0200
Message-Id: <1486559825-23389-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking] ebtables: Move files only when src != dst.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:16:29 -0000

While moving files from ${base_sbindir} to ${sbindir} check if both are same.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index d24b81b..f5e2871 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -70,8 +70,10 @@ do_install () {
 
     # The script ebtables-save refernces perl in exec_prefix, so
     # move it to sbindir to avoid QA issue
-    install -d ${D}/${sbindir}
-    mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
+    if ${base_sbindir} != ${sbindir} ; then
+       install -d ${D}/${sbindir}
+       mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
+    fi
 
     # Install systemd service files
     install -d ${D}${systemd_unitdir}/system
-- 
2.7.4


