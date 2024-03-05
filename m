Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ED8C54E4A
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:26:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.625.1709673981015005699
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=O0GkNbxb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ9MX089753;
	Tue, 5 Mar 2024 15:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709673969;
	bh=k29D38kmFi8Pa5yvEnQBtNj6kLrPNQYOIRZfsAyUaME=;
	h=From:To:CC:Subject:Date;
	b=O0GkNbxb+PamNw0Zzr4duoXvbZZUtIsdnok4vWnlUy68kb95yrYpAQ/yevOTSRtld
	 1llnOYDXQ5IhWtGyqu73aaYutxGQKBsJ4ADpCBIMAdfCCp4yf0XFIMhgkeOoSIeLLd
	 FFGwJnRzeKO8pLkmkUAjLO0lYzvcwAmd4h0MQeUU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425LQ9NG099159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 15:26:09 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 15:26:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 15:26:09 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ9nG016733;
	Tue, 5 Mar 2024 15:26:09 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
Subject: [oe][meta-oe][PATCH 0/2] glmark2: fix an issue with eglconfig scoring
Date: Tue, 5 Mar 2024 15:26:07 -0600
Message-ID: <20240305212609.2054938-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 21:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109133

From: Randolph Sapp <rs@ti.com>

Backport a patch from the upstream glmark2 package to fix 2 primary issues:

1. Configs with stencil components were ranked unnecessarily low.
2. If the target config was below 0 an optimal config may not be properly
selected.

Randolph Sapp (2):
  glmark2: add upstream patch to not care about stencil config
  glmark2: add the stencil config patch to the package

 ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch

-- 
2.44.0


