Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 05C2760602
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:05:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 05:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092309208"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 05:05:48 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:06:36 +0200
Message-Id: <1486559196-22835-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] udisks: Make use of bitbake variables for sbin, lib locations.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:05:50 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index eec6933..81533a2 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -24,6 +24,12 @@ PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
 
 EXTRA_OECONF = "--disable-man-pages"
 
+do_configure_prepend() {
+   #Point to right lib,sbin directories
+   sed -i -e 's;slashlibdir=/lib;slashlibdir=${base_libdir};g' \
+          -e 's;slashsbindir=/sbin;slashsbindir=${base_sbindir};g' ${S}/configure.ac
+}
+
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
                 ${datadir}/polkit-1 \
-- 
2.7.4


