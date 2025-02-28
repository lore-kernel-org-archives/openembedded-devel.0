Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DDCC19F32
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 01:39:05 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6435.1740706743129739073
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 17:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vwok/ldS;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51S1d1ji1914781
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Feb 2025 19:39:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740706741;
	bh=A/rg5hR4R1PMxktVfK4xew874kTk3Apz8x85UQ0K6a0=;
	h=From:To:CC:Subject:Date;
	b=vwok/ldSW4JbpjlRKJBcqURWDVcV28B9+IHwwAYyPAPJ9gj8T71SVp+25m5/TS5a8
	 eDMsQlRl9nlwz7TOCFYpqnurgUY/J7tmanP80AkiaDMcyQA4sln/4/rkjY5tRB4++c
	 OEWMJTCKq70+FrOmK6sT+ZryqMNK3DRRBaEfCiT8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51S1d1q2049313;
	Thu, 27 Feb 2025 19:39:01 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 19:39:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 19:39:00 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51S1d047071306;
	Thu, 27 Feb 2025 19:39:00 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <a-christidis@ti.com>, <detheridge@ti.com>
Subject: [oe][meta-oe][PATCH] clpeak: add version 1.1.4
Date: Thu, 27 Feb 2025 19:38:44 -0600
Message-ID: <20250228013844.516873-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 01:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115706

From: Randolph Sapp <rs@ti.com>

As of right now there are no applications available for benchmarking
OpenCL. Clpeak is a simple synthetic benchmark for OpenCL that is
designed to determine the peak capabilities of OpenCL devices.

It's currently one of the more popular CL benchmarks supported by
OpenBenchmarking.org and licensed Apache-2.0.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-core/opencl/clpeak_1.1.4.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/clpeak_1.1.4.bb

diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
new file mode 100644
index 0000000000..8c05ad6d02
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
@@ -0,0 +1,15 @@
+SUMMARY  = "OpenCL synthetic benchmarking tool"
+DESCRIPTION = "OpenCL benchmarking tool to measure peak capabilities"
+
+SRC_URI = "git://github.com/krrishnarraj/clpeak.git;protocol=https;branch=master"
+
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRCREV = "527695de8393a3144863a0a07f9b92f1c734d1c4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS += "opencl-clhpp virtual/opencl-icd"
-- 
2.48.1


