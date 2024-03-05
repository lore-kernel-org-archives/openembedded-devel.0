Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496C3C54E58
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:26:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.635.1709673981271950196
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tOUIkE0V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ9rb124928;
	Tue, 5 Mar 2024 15:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709673969;
	bh=DF9FGEa0wpzGZu7oMSWYbfV9rek9D7msAnwpLDGJQ+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tOUIkE0V562Fd3SqMjkzBF7ggUpFGt3phJTHHUaI5RtXN7lGS+w7eA8/h0+FlBP3Q
	 ZfNB2vOPvy2qTardUZcodFyVCJ9nK5Lq7lQBDiXLole7eLLEjRtf58PdV9gfktXlyD
	 ulV1m2msZ0Ht07yUNyIFD4FFgch2M0AA8m4Y8ryE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425LQ9ed112034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 15:26:09 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 15:26:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 15:26:09 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ9nI016733;
	Tue, 5 Mar 2024 15:26:09 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
Subject: [oe][meta-oe][PATCH 2/2] glmark2: add the stencil config patch to the package
Date: Tue, 5 Mar 2024 15:26:09 -0600
Message-ID: <20240305212609.2054938-3-rs@ti.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305212609.2054938-1-rs@ti.com>
References: <20240305212609.2054938-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 21:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109134

From: Randolph Sapp <rs@ti.com>

Add the previous upstream stencil config patch to the glmark2 package to
address issues with EGL configs being ranked unnecessarily low, and
another issue when the target config is below zero.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index a2d5b152f2..0b61d6ed62 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https;branch=master \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
+    file://0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch \
 "
 SRCREV = "42e3d8fe3aa88743ef90348138f643f7b04a9237"
 
-- 
2.44.0


