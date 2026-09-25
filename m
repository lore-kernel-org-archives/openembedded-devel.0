Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBFDC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:40:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8332.1790343626192372712
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 06:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=S7zwYcvY;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.0, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SajaZbXZ5qpZWr7Xrz85EA0VmFN0b3s9wYRKIoofmEy6DQNCDl362YrnRVx7ld2Bnqs/4nR7YGGpPIvy9TVbDd/lWtdWes9qqcwBFQyi2oXgQWrWNMk0a4Vj4JCucd4V/2Pm+wuU3WxQRICGqlfHO4tu0bs/URcCYpquC/c6XZCtNncqAHJo8yjLkQI7mCB2hlzPLGjHF/5Xl4zpnFH8pxZMu/ljdh9c6tLMh+W1anhisL9tHB5dx914CPQbYjiqnrmx1hH7IKarJy+vrC9UT3c07jcGBWJlOaz+BrehLNhIC4tgBg/oarZTk9Ez5OVEfaXUCUP2IKoR7LE/VPVyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsDxQ7Eo2I0ly/E5qkvNyV5aaA6L3mkIAuyuFqndthc=;
 b=lGotMNNmzv/ULxhRzAr/e2IRUHP68REtVIm4nlfq1JXfTmbZpfepnvPHxi+XK6rLlen9t5xrX1JpGHNjzWYEHSIrAgykKjheREvL7vcGN2n4hNbz/nSvRrrJo7fsExmyRWs3mpN1dIpSikLtqU2iCs3wa/RebUWjfmGNqWLIgKj3pnMEkLQY2E6WD8BJrSS0W2zbGi3lt9WLZPjMrXefhaVeWsjaJdV7ZQFrE0YN/qb4voq37vs6eUP8PVH6Jou2CNaqmM2Sey2+pem4GS7t9+BzJl2yPZOP6n/w/yQ5k/fw5a4BvOLNEg3fiznhYq9KjGlXWME1ALA62X4hQ5lGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsDxQ7Eo2I0ly/E5qkvNyV5aaA6L3mkIAuyuFqndthc=;
 b=S7zwYcvYrhillx68+bI5fF7S8oQy7ZZ2VM1ny5Du4hjJMn7zsvm1Uqa/d+t6fpkkeKIqRNoLv03Tg8i4qgzhMbckQkc96i7zpeP+91NavkOsF0nCHdydCvuLce6vs0dGIRLFpGUkYpKlfx0T57VZtOGJPiX7N2uV+3ArWK46fG4qqOOYabxzccmspsvQhS4CQhPcoUvHpIiZvGg++zi5Bx5SJAp+6o3XbnN1htM4YsC0M3uq/A48tK/fOtv3ra6vkda/C5l9STYFm3T+7n1AS9vDU4Qc2KRMnCrM0duK8v/3RUCeBtyhSB2Vgb1uTrURpy4hUDws2GmH1EL60j9BsQ==
Received: from DUZP191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::12)
 by VI1PR10MB3200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:40:21 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::af) by DUZP191CA0002.outlook.office365.com
 (2603:10a6:10:4f9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:40:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 25 Sep 2026 13:40:21 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 15:40:17 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 25 Sep 2026 15:40:17 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
Date: Fri, 25 Sep 2026 15:39:29 +0200
Message-ID: <20260925133929.1991-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133929.1991-1-mark.jonas@de.bosch.com>
References: <20260925133929.1991-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|VI1PR10MB3200:EE_
X-MS-Office365-Filtering-Correlation-Id: db9d1dcb-df10-441f-71de-08df1b0a8b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|11063799006|56012099006|22082099003|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	VxWUlt86qjnvq3ipYtBE6pzj6YHjxx8KYlL0bXuiZFrwh1fdqPH91SEGKVjsf2b35eCOMAI+mKvmI2aKL5Tm2CI+A4o8FHFOEYFhCOP5/oTwP5pti/oDBV1AcXXhiGmJVQAsg+JJ/GjkJ9bwbRn+nYLjb6Rkr8WMuCEz3CLIHewtnQsOttjg7tTVYTr1efm1qdfE58E4n4vGMS/gVC/9uCOnFYJQr/N3VHC5DXPewOtJ4idm8isovjz8X8Y5U3f0TwqJWKM0BnJew9xyt6EQfvQYXAea7AMI3nOCwM3JIgH7H3hAG2UdhPA74mJBR1aJ4gHorji18aEv0Ag5zno+y95lIIWoevdISSIDzJ/mh/DOeOPgrQWOSQ81RAjTMWy4DaZQC1GpXpEj2l0QW216gPC5/AbwzM0NvMlgB+HqRiajpXNrhV2GYyJR1P+xOqTztJtcRNYzxaZfLRQI8mgEBI4Sxcd0gQzApvLjeauqTtvfHPHQeCx54UEbEUkRfFyvxxZJ+kY+wVlEK14Frq4eMPQ4DfNS1BUldpusPo+D+Q5htBudP/WcdevGr0Zk1Te6lsxLviA+UbcfH4f8unD/g9g0OWcgy4j6kirKAY1L4TTyo/jZe395+wk+pHBfkYTeuK037JmgKAkvrPUnTGwgwcGgh1C26d3BDfrL0DxJzLjk0aSywGQpcsNO2C+QoPr+mSyp0Wu0FtZvO68C9lay+A==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CL/38vBRWpyo81Srq4Yz43XRHhiFXTUYGZXftyt5GG3XZu8qrCA4VdVMtsGsnoqzgSJmbW+i5dRvKj/QoMO3FqpEft5ccWIeUyJDlUeBO53vNfC7Fl90dKQhcMbItk37PSdgJ4p7upPOho58qCV5jyISGyolDJHGUELVhWTNLKiRMZLq+c459TwJvh9zqyvnRKopAWm7vR3khOCexs5qYuT9dnNgdKFA/PFSbGhROl4QoLtHpChlJofPegG3kExM+HN2C/b+8X2rbhNWRK6vTQdt/ZvWrmyZcQk/7jrnfkR8RUAzaKInPc8IwfTmWu1pwzNUeFYUalQUCxpa6S3aKDRmN+/lKMGbQsBR6ZqRyWZB6eA1PCa/+DbvcGw6nUO9DvH68kvPrCEW2SJVFYvUxMvOGFhyB/k4rqiIEvaX68bySUftg4vgjSFf7QVgZoPV
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:40:21.4959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9d1dcb-df10-441f-71de-08df1b0a8b9f
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3200
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130300

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The package PN-manager-cfg is shipped with the file 90-gpio.rules, which
is licensed under CC0-1.0.

Thus, include the CC0-1.0 license to the recipe.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.3.1.bb
index 977405c2fc..f804934682 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -2,13 +2,13 @@ require libgpiod.inc
=20
 inherit meson systemd update-rc.d useradd gobject-introspection
=20
-LICENSE =3D "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE =3D "CC-BY-SA-4.0 AND CC0-1.0 AND GPL-2.0-or-later AND LGPL-2.1-or=
-later"
 LICENSE:${PN} =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-cli =3D "GPL-2.0-or-later"
 LICENSE:${PN}-gpiosim =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-glib =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-manager =3D "GPL-2.0-or-later"
-LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0"
+LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0 AND CC0-1.0"
 LICENSE:${PN}-tools =3D "GPL-2.0-or-later"
 LICENSE:libgpiodbus =3D "GPL-2.0-or-later"
 LICENSE:libgpiodcxx =3D "LGPL-2.1-or-later"
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM =3D " \
     file://LICENSES/GPL-2.0-or-later.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
     file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4b54a1fd55a448865a0b32d415=
98759d \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a20=
f \
+    file://LICENSES/CC0-1.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
 "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
--=20
2.34.1


