Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 681FE605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 15:44:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 Apr 2015 08:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,641,1422950400"; d="scan'208";a="485192634"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2015 08:44:01 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 18:43:52 +0300
Message-Id: <1429890232-20762-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
Subject: [meta-oe][meta-systemd][PATCH V3 2/2] layer.conf: add detection of meta-oe layer.
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

bluez append has been moved to meta-oe,
so add detection for that layer.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-systemd/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index 0563f44..06c2ff1 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -15,6 +15,7 @@ BBPATH .= ":${LAYERDIR}"
 BBFILES += "\
   ${LAYERDIR}/recipes-*/*/*.bb \
   ${LAYERDIR}/oe-core/recipes-*/*/*.bbappend \
+  ${LAYERDIR}/meta-oe/recipes-*/*/*.bbappend \
 "
 
 BBFILE_COLLECTIONS += "systemd-layer"
-- 
2.1.0


