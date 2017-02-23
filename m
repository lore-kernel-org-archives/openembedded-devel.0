Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53CED72FE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176359"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:30 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:37 +0200
Message-Id: <1487840743-23198-4-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 3/9] ebtables: Move files only when src != dst.
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:30 -0000

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


