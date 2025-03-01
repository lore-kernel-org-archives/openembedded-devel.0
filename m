Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0DBC282C5
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 00:58:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.928.1740790727142881757
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 16:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WVpy9H63;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5210wjtF2271409
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 18:58:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740790726;
	bh=RWcc/uqOv6yn6nBv5yRSzXdytWVrSjW3wUw5ztn2vy4=;
	h=From:To:CC:Subject:Date;
	b=WVpy9H63ioEPtzT5Z7YRK8Hilit4Fn1tA494BO1126HYk2jhOUyJ2XMja6svJuPt5
	 m69veDnzjUpFxGbV4o45spwb8YxJcLw9aJzVU0hIv3Qy7uKNJOvEQvLu70y3wGLDqa
	 vUJNUbn0RQkcNlZnwYEmVuoW96Ed1lfqUxg92Z8c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5210wjsk115526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 18:58:45 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 18:58:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 18:58:45 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5210wjXF036144;
	Fri, 28 Feb 2025 18:58:45 -0600
From: <rs@ti.com>
To: <akuster808@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <a-christidis@ti.com>, <detheridge@ti.com>, <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] clpeak: add version 1.1.4
Date: Fri, 28 Feb 2025 18:56:34 -0600
Message-ID: <20250301005633.824506-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 00:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115712

From: Randolph Sapp <rs@ti.com>

As of right now there are no applications available for benchmarking
OpenCL. Clpeak is a simple synthetic benchmark for OpenCL that is
designed to determine the peak capabilities of OpenCL devices.

It's currently one of the more popular CL benchmarks supported by
OpenBenchmarking.org and licensed Apache-2.0.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

I'd like to request a backport of this patch to scarthgap. It applies cleanly,
builds without issue, and runs fine under this LTS as is. Please let me know if
this is unwanted so we can carry this package under our distro layer for this
LTS release.

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


