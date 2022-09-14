Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F44ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 04:20:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.2545.1663129244887274897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 21:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=J1DiS2DY;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663129244; x=1694665244;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VQwH+rfjNsTpz1zFVY/gW0RF/xhJlcnQWraFdBRA7VU=;
  b=J1DiS2DYZB+uCINO+x5r9hXdd1nW4gk3rM3EO98bl7cpJemmYvR+ogeF
   M87eCdHrmytQYEzEuLy8ovBbzIstr41OGw4+6I5++D5T3Y3E6j4av8FS0
   niKZZH6vhXW467P4TB/791TSRMmgjRP+Hhg3sQ1Nu6FHzpxyhVVWTMVYS
   f0CGM6vqZAbC7hdasR246n+vCSrFvVZAxT5+GPjzvTPytfpacT8rt55jI
   LiFrUyDcUDzFlEQBBUWeLNLqQgPJza/lTqwGFckrRTilwh1NrB1lNE8Xi
   6eElEYvzeBwIo4qdxF6HKcLhddBHt0EJB7XNJr0mi85WQhkA7/zAHxHJ4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="285370154"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200";
   d="scan'208";a="285370154"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 21:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200";
   d="scan'208";a="647225726"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 21:20:35 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ocl-icd: add nativesdk support
Date: Wed, 14 Sep 2022 12:40:42 +0800
Message-Id: <20220914044042.402812-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 04:20:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98789

It fixes missing unbuildable dependency 'nativesdk-ocl-icd' failure.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
index ae9c5bc81..250cb6883 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
@@ -15,4 +15,4 @@ inherit autotools
 
 DEPENDS = "ruby-native"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


