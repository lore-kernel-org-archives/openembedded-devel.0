Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B94C4332F
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 16:25:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.14213.1672590299030306937
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jan 2023 08:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=CjW3O8OW;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672590299; x=1704126299;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JUbPnvYqerE7Nq+21N5ck4GUm1ara2KoeqMZKnxUmjk=;
  b=CjW3O8OWGB/hi76DFOCeclI8eEIpIZo5cYEg3PRBEdGsfoqvSHdcO2Zh
   494DavLmzpXDB/s27JUdeGj79kbb1ZZRrCMuumRl30+F7SE/Qfz+OIu4n
   aATJRRDzLzDqTlA9fgqKS1m426T1vl6UwmgvOzo5XoaMAtP5vn4k8xE+I
   AjyFwuRTxq8q9JygbL6PivRECHqEXTyYgGnQMSyEnGtzUL7tbF8iK0jCv
   Y0s+3iDzi1FGEVnYJEaykDJpFcCkh4qdgs1Bla0w2tu/6bk2dz4yUuCjp
   B6EiUrjhF1aaMxfu2spqP0tFQ4CsHc0PmkqfQE5haSM3WDRdPOWDH80WR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="301085129"
X-IronPort-AV: E=Sophos;i="5.96,292,1665471600"; 
   d="scan'208";a="301085129"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2023 08:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="899694219"
X-IronPort-AV: E=Sophos;i="5.96,292,1665471600"; 
   d="scan'208";a="899694219"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jan 2023 08:24:57 -0800
From: preeti.sachan@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] fluidsynth: update SRC_URI to remove non-existing 2.2.x branch
Date: Sun,  1 Jan 2023 11:24:07 -0500
Message-Id: <20230101162407.2992276-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 16:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100335

From: Preeti Sachan <preeti.sachan@intel.com>

Remove branch 2.2.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 14d09e5f0..a4590d61a 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.2.x;protocol=https"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
 SRCREV = "8b00644751578ba67b709a827cbe5133d849d339"
 S = "${WORKDIR}/git"
 PV = "2.2.6"
-- 
2.35.0


