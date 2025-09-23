Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46CFCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AxSL3F2P;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628696; x=1790164696;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0XzIifYzTLB6xlKoOn9yWVNz2l+Rpi8UGfqGwwSmhi0=;
  b=AxSL3F2PHaN6mLMTSE6I9RT71+LnTs40WTy9Y/rfzWOnQftEH/ldkqwH
   MLGn1CS0kFediZIn0JIFy8QBFasz1beVtEqqCt82WH4ecbXDiJzYVp4Qy
   lX4MEiLxIxvafkj4M81zUDK1+d+UpP2WOVLyncOGZlywM/rCNhIAdpMri
   uvC/IMS+cSysdhEV9glFH4R8LCaK/sIETh9r0bSxuvbHITdSKp3uuIQLz
   WqUu4xYLEd4xze2Z9TiBjdyZ/+SZkWOM9ytSQgXNJLw5znXaL68L6zlyc
   xQYl1u6QNMCzqyO8ucHTaGqPjV/Z/GtsBtB3rSBcHlwubX0HxTksglaOW
   g==;
X-CSE-ConnectionGUID: lUiqRz8wTHOpgU/Pr/FWJw==
X-CSE-MsgGUID: BS/yz/RBQZKkav/eEdBkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821837"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:16 -0700
X-CSE-ConnectionGUID: eIqiGiICSWuW7/3QDLbesQ==
X-CSE-MsgGUID: 6KEezSJAT+eP3+mkpizHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875257"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 23/24] mod-dnssd: update SRC_URI
Date: Tue, 23 Sep 2025 19:57:26 +0800
Message-ID: <293446bfa960962113ca22e184cdcbf7bfa545ef.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119712

From: Gyorgy Sarvari <skandigraun@gmail.com>

Upstream repository url changed.

Fixes unsuccessful fetch warning.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 10c13bf1fbe18ee51b27d6538df5058879ef1d3b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
index 5fac0a6ed4..6f2a2330ae 100644
--- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "apache2 avahi"
 
-SRC_URI = "git://git.0pointer.de/mod_dnssd;protocol=git;branch=master"
+SRC_URI = "git://git.0pointer.net/mod_dnssd.git;protocol=https;branch=master"
 SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
 
 S = "${WORKDIR}/git"

