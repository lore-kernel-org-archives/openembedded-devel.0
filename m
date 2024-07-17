Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8927BC3DA5D
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 22:41:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3081.1721256107749183375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 15:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JfKsUibD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HMfisZ012396;
	Wed, 17 Jul 2024 17:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721256104;
	bh=I5/oCAcbd0n90Mz8HRQHwI9Ov23k29V1pEnbhdeHpfw=;
	h=From:To:CC:Subject:Date;
	b=JfKsUibDJ+0bx0krlnbcTWZkl/3RhZK4xT/8kf5FUdvXiTxqrvzafla2haiCtelvD
	 1UW3t3ZMIDVjd0tOu56VGYpImXUf5Lnrg0feo12SLFdVGbpjT5UG2MnSu/ruPapRkP
	 LYz+gMOTEgwTaNcZAabsCm0a8mpVSGC8Gcg8YDho=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HMfhF2113387
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 17:41:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 17:41:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 17:41:43 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HMfhQ8063916;
	Wed, 17 Jul 2024 17:41:43 -0500
From: <rs@ti.com>
To: <akuster808@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <vijayp@ti.com>
Subject: [meta-oe][scarthgap][PATCH] opencl-clhpp: add native and nativesdk
Date: Wed, 17 Jul 2024 17:41:10 -0500
Message-ID: <20240717224109.2431130-2-rs@ti.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 22:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111385

From: Randolph Sapp <rs@ti.com>

This is a header only package. It may be useful to the native machine
but it is definitely useful for the nativesdk machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Backporting this since it's still relevant.

 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 7ae0362d3..23007d7cc 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -21,3 +21,5 @@ EXTRA_OECMAKE = " \
 
 # Headers only so PN is empty
 RDEPENDS:${PN}-dev = ""
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.45.2


