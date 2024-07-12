Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EA6C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 23:33:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2213.1720827227698355526
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jul 2024 16:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gY123OAZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46CNXi0J030252;
	Fri, 12 Jul 2024 18:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720827224;
	bh=XzdIpZfAPRoV+tMAbUAHHjgDemYkm1tgxwxxFZBs9Qc=;
	h=From:To:CC:Subject:Date;
	b=gY123OAZ3YiFcnQbX73VQtoY3hKZRWrL2UPsAenQ4Y9SlVp1QinejSuXTp4Tatla6
	 X4H0NfarJU6AaMtWjByuGEfC4SzdCQ8WkiF7APb/PubJeFTOv0C51Y50wJcz5F16uJ
	 42qzaPvTgSFp54IgGnMdPsN+KJipnxleKm48lY3o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46CNXibb028520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Jul 2024 18:33:44 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jul 2024 18:33:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jul 2024 18:33:44 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46CNXiB8062318;
	Fri, 12 Jul 2024 18:33:44 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <vijayp@ti.com>,
        <detheridge@ti.com>, <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
Subject: [meta-oe][PATCH] opencl-clhpp: add native and nativesdk
Date: Fri, 12 Jul 2024 18:33:32 -0500
Message-ID: <20240712233332.245596-1-rs@ti.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 23:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111319

From: Randolph Sapp <rs@ti.com>

This is a header only package. It may be useful to the native machine
but it is definitely useful for the nativesdk machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
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


