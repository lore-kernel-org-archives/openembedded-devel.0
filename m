Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6D4C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 09:49:13 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.5389.1668592148374289690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 01:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=K2yObA3b;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668592148; x=1700128148;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jgjfKHlRxkG50g/o59j0Ow3hYBXC/yduFgyRufUUFaQ=;
  b=K2yObA3bLq05KMWHKQM7Z3InvXuZnQG82rhLEBfaLq+ebovnCLl8ZU0j
   +8ocQWuBg2N3PPNqTRUx8m3IgG9ipmQhW+HoN9fE8WV+hTnMTDS1CAK0S
   76U1yWY89veAnSn5iVLddUvlrCWgRZumh2FsnWT0R9CPnNY3RFqBJzgun
   1TgMLsS7zc1wB//B1w/3ptkasVcTwU723Om5rkerUzJg44rYyPeiS114J
   S6nYNpMX3nxAdqRMPl+O9fEJsQ6r8BbaPRd80aaSeVhANiOXhA205C8j3
   CvBV+4wwubFKIB4Gcz9c1lfCvMO+PWla8C1kPBCWYaZuyQK0vaXnlEuG0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398787925"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="398787925"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="764271083"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="764271083"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2022 01:48:59 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencl-headers: add native and nativesdk
Date: Wed, 16 Nov 2022 17:48:53 +0800
Message-Id: <20221116094853.2316681-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 09:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99594

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index 8bbee5cc2..6374f4597 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -17,3 +17,4 @@ do_install () {
 	install -d ${D}${includedir}/CL/
 	install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
 }
+BBCLASSEXTEND = "native nativesdk"
-- 
2.37.3


