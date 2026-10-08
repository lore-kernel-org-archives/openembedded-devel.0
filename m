Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCA2CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.119])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11943.1791454010557389975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=JD465E0A;
 spf=pass (domain: phytec.de, ip: 40.107.159.119, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cutpVZDRLvtuz8J7qOKRXnmzCIqATXGEROiPOV4wOsRWQIIOKSD6pe/m8SlT96nIgqEO6pu77O4xjLo2POwmRJp2qWNfDQpFZ0hevLVymmq6+qFSNvDXG8hSL6Av/tVZYQmS21QroqqDDu8vMLklm2elRdPStqFBMDWw3VgumUfGSnbUA2/rjkwlJiTQwoQkSvNZn+U96NEYMwxNXc+k3GHQb6wyZyeXp8eNixjZjibW8kFD8BeidQo4OATuItMr8xnq38jAIULpeov2l7bq9mHMDZxKgwdU6ZhraMPLcdNTcIx1xXsfJv3WRw0cXTN8eyrhjlMknXXNsM7VvXm5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZw6B9q881bIgr0tt0sFebER8IgraM/n5RhTzjOxoZg=;
 b=KU9KCoGBPs3RvND75ZK77RrjwKilyHpsBjpPdyNiTZCVjDWYs5qqXzDt2yuzxn19RGjfFV1Ck1BE9sRtyr2xdFYs7iUdCSKbXY+gdkHb7sJIA5f3FpKZzQaith7edFQOY+uoCZ0jzg+74kmTroLBVgOj/R5J1X003Tjly0vZwfLg9NlPHuSE9Xlal+SqyFLiAMqN3Z7QtpXLduEayz+nIDvqxDKm5Kjoir4CV0oTsVbxKcCrRgcu+D9Hm++Hh0JaP3PDTICiiC44PdblNGh4CThkOQSh5yuYwgeEjQji5gnHnInnghsTn6Cz9O4VaGejsZELdnr2SMrdi2a9MnGi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZw6B9q881bIgr0tt0sFebER8IgraM/n5RhTzjOxoZg=;
 b=JD465E0ADdRYknqD6IgApJbIk/PSZfN6cjNLEMGxIdnTDo3z5QEBcnDDguI+mc6MKumb3g8adSQ3fj3mS8HmUNnQSAUInRZ/dTaV8lLXWPYT+FE8BtiyVK4k5tvV4Ry+x4g8brbSpmNzkuvzV6v8R/KzyH7f/k7+fByuMPF0Bl3x8etdZGFwdssU+2zxl3+FuZKVe0wG/n4Xy7Q8gIkOiFP5VNhqcCcxItbcWiEignzLBaxDabjtoX28Wf4As7LNqplsRLudOVfez1n+yKDessdI5nGC9Xg+wpamziGO+pENHgIrx8bheL34CM0ip+zQn+L3k9hp0ShZvDNlD+vOvw==
Received: from DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) by PR3P195MB0927.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:a4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 10:06:42 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::2c) by DUZPR01CA0351.outlook.office365.com
 (2603:10a6:10:4b8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Thu, 8
 Oct 2026 10:06:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:41 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:40 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 0/5] lvgl: update 9.5.0 -> 9.6.0
Date: Thu, 8 Oct 2026 12:06:21 +0200
Message-ID: <20261008100626.2259941-1-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|PR3P195MB0927:EE_
X-MS-Office365-Filtering-Correlation-Id: b692bb0e-7876-4260-f0ba-08df2523d9af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|42112799006|82310400026|376014|1800799024|36860700016|23010399003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	OcrIOdO0MSAuQHoWaNEhjB7pj99B65g80lm/0j5kq48Or29YclzB193cv2j7avyxBAJETLysMbaK1FP7S/uFp76snRmt3LIY9lDgGFj8wLCtUt8S8rhxfXJSpuJ24ueOedM1o/QQJByu5X0s1yVfk/L1IGzvT8CP0wbWhrIVJn7PnJFvoXe4W0swsT6b7a1xN9JsVQNE0Znd8ffL86MCD964ncWItK8zTHCRUhtOm1dQRRUl9ruGpTFvr6GROQnj44dBoD3JDfpEUB+7lHu4WKdvNjZ76YK9yt4FrgVE/o8Imdhq2qFoAkT6rOnTXH78YZl/ouPz3JtkyQ+zQk6oLbYCpf9o8HWt94bP0A16hNkWAmMCWFC4tlCrYKYs54lHl1pqgyylPabZeSwhuyMJ701WzR6k8O+tgMt0Xlkmx2Jx2QXG1IOhmHlVW8Aw2FUdY403MzlBFRUU1EanKHixYkE3OfBo7yomsclmLfhI+SpLDUdaZnZ+V1zTG0Dw+wp07Qj+EwV4ED8va0qSjanAgiwpj9u5LEKdUF9Gf5e2jY5OYrNXmyajUGhobOfliFrigt57O0seAC3O8XgS/ugSrfDfwButaJ7X2MFJhfaYsZGC+yDLEUeLZqvPNoY4D0mbJQFTfyvh2Qs2VDE+2jmrxUCc0jKxj8wsPiqCtrEfrMklYkL2krgRK8mDvwI7ZD5Ta17crRSUYsMPVThEuSunxQ==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tyNnZPjZp59k7bM/pUVleE53n/n2JIj08JQLQ8x442sNhkUu6aglCxQeOXY75o1BFQNJPfrwkjq2dK/rhoNN9FJPO1mL0UDKIYZ6xy2DaZP31gKT9+ynGHPFj41Rw+5CxX/Caqd6vVdzGJ2E4XycnPZWYR6y59rMjK2IWUinWhcXjh2DX+oGCcNryTPgaT9cIw9UPrcmXpGv7lwmfZunIlZ3/FAvTACjTdMCAM73I6uj6eU3xznsuzhKYzNI2jUyvPHkSNH/ioSkqqMY1WFI2ecS2HwDJDYmevTCOTLs3KygmG+lWthJ9FbziOkeXMOqlxOZiVFWBrNuoL9Va4RDi5EJjFTpVC4g5LdUQFPHF4R0FypJhyd8g7mHrqxrbMxHokDGT4CNnBaOf4kCr2Hgk88iZ56tYQcWzzQ3dnu9KBaQSMoa6nZp5qK/efGE/WX2
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:41.5415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b692bb0e-7876-4260-f0ba-08df2523d9af
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130665

This series updates lvgl and lvgl-demo-fb series to the latest 9.6.0
version. The defconfigs for both recipes are also updated and a
wayland packageconfig is added.

Thorsten Schmelzer (5):
  lvgl: Update to 9.6.0
  lvgl: Update defconfig
  lvgl: lv-conf.inc: add wayland packageconfig
  lvgl-demo-fb: Update to 9.6.0
  lvgl-demo-fb: update defconfig

 ...rate-proper-.so-links-when-installin.patch | 71 +++++++++++++++++++
 meta-oe/recipes-graphics/lvgl/files/defconfig |  7 ++
 .../recipes-graphics/lvgl/files/wayland.cfg   |  1 +
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     | 11 ++-
 .../lvgl/lvgl-demo-fb/defconfig               | 33 ++++++++-
 ...demo-fb_9.5.0.bb =3D> lvgl-demo-fb_9.6.0.bb} | 10 ++-
 .../lvgl/{lvgl_9.5.0.bb =3D> lvgl_9.6.0.bb}     |  8 ++-
 7 files changed, 124 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-build-cmake-ge=
nerate-proper-.so-links-when-installin.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/wayland.cfg
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.5.0.bb =3D> lvgl-demo=
-fb_9.6.0.bb} (79%)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_9.5.0.bb =3D> lvgl_9.6.0.bb} (7=
1%)


