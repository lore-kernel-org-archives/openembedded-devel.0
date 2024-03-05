Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88694C54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 22:41:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2394.1709678486849888777
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 14:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wz0a05+9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425MfNBQ037174;
	Tue, 5 Mar 2024 16:41:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709678483;
	bh=uZ7USPrEUn/OTOj9v/3406jdZs7TV5oRCE9pxEzAj88=;
	h=From:To:CC:Subject:Date;
	b=Wz0a05+9AzLpRG+DrwmxkAdxqGB9E6BCAtusBcNg8Cq04Zm+TYpNWFeSQOxZkk3WF
	 wjTxacmaevF8DRD+CtFPqo6ICgLwkv2B1eDpVwAd7d2gtb8d+GiDSqHvXiQpgVcpf7
	 i2BzJTrG9L6AzSYkR8+TPd4IpdBQ2HftZ/QS1naE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425MfNvv049607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 16:41:23 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 16:41:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 16:41:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425MfNUN105994;
	Tue, 5 Mar 2024 16:41:23 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
Subject: [oe][meta-oe][PATCHv2 0/1] glmark2: fix an issue with eglconfig scoring
Date: Tue, 5 Mar 2024 16:41:22 -0600
Message-ID: <20240305224123.2063013-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 22:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109138

From: Randolph Sapp <rs@ti.com>

Backport a patch from the upstream glmark2 package to fix 2 primary issues:

1. Configs with stencil components were ranked unnecessarily low.
2. If the target config was below 0 an optimal config may not be properly
selected.

v2: Fix upstream status and squash commits

Randolph Sapp (1):
  glmark2: add upstream patch to not care about stencil config

 ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch

-- 
2.44.0


