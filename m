Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8F2C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:48:30 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56523.1790596101681104650
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=Xt9PQVca;
 spf=pass (domain: de.bosch.com, ip: 40.107.162.15, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOWbeage+DtXuZy9qbgX+DR97vhjltHwV6QgvOuXQuJE/4h4vUtPGWqNkapckeh6RCuLJCTXmD5jGBNI1JEMwGA3FJYNJLUu1y2JzhQv9Bt5pk4ii/BSXELlvlArtlCZiHvO0HQnQZz7BOgkm05aq7B2AK6CgEnR6uKsWfClqFh8cqm+OAWrcYSzaTtr8RWCbYh1IuKvqqY1QqKCKjHWf58vdEXM+JVjBL/i8qsC4jOu4b6FAnoX4zL2GsJz38y3eD+lUiaPq0uzW60mwVDYP9kustZhy6la8f7Fmzt0ZbD+AIJElsGl7K5jIfUtWpZ1oyIkXgYhGTaBxQRj65w4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdcmsjI7Ko8pJb9Wj5uvgx+51GZS7zwrRnUpOdZNaSU=;
 b=kp7mPs2TRO4iWY/I2h4PQO9FBYyTX6kDoC05Bv598DrXfGzNMgtE5C17vkUJFWFccvy2+wFYf/hMnwsIxSxY0OCkchR5Z1cyjh67XU7tdJXrOU0hQq30vaJGkjJFOJgJG5MogWoOKxQFX5qdjaNdXXQWm1p/zpTTqpqAqRzBQSBT87qCYgLyrzivlTruJ6QuWzpYqt7Z0iLLa7+1oNiShcwzLmmAD6jKbknJs7azUtNFcj/AHI4e4bND+Knse4ss5O53ITG637e1p58JY5DGf89U6ndN4Tf8NI0VSJ9OUBtX1OyDA2nOHVLLdDkqJHtxK/5W+hqBEpT5IAmO/kBVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdcmsjI7Ko8pJb9Wj5uvgx+51GZS7zwrRnUpOdZNaSU=;
 b=Xt9PQVca3cb3qzlYp4X3t48lz1XcEpz+9eKVn+2MTecMRrzRoKtv1BPZFQo8Dr23rHr/Yp5VVTMtXsXUChr6hK/AX00k+skk079bbhMFtzau4znQ/IYzB6vDoprGmnd2GZ8roOSKuIhA3OupJzFQmTeYOoz/uIRIPMaoYuTHJ0WjREwDHq8R3zQTOKIpFdSf38JrGEUSoTRSD0Cwnx+GtDe8MVMv+XqcWylD7pK5KGsZ7ybwbcba4wYCL9ALOjj5tcvf1o6VH7cZLAzIAoyw4iGZw5lnQrZ50yR/XYOb1A+5h6LPRNNoaVN4MtS5Q/5yLEFJZO1eH2X+gr/X6pMlHA==
Received: from DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) by GV2PR10MB079430.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:384::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 11:48:16 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::c) by DUZPR01CA0260.outlook.office365.com
 (2603:10a6:10:4b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 11:48:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 11:48:16 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 13:47:50 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 13:47:50 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v2 1/2] libgpiod: set per-package license assignments
Date: Mon, 28 Sep 2026 13:47:03 +0200
Message-ID: <20260928114704.2719-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928114704.2719-1-mark.jonas@de.bosch.com>
References: <20260928114704.2719-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|GV2PR10MB079430:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccc033f-f1c3-4332-4840-08df1d56625b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	9P0AfjkCtjp13CmYRfTcCJ9R++mU2fGUTpi42CRi9dNmA/JVCKGqmfuqEbCtpj0+m0/YfHD2TLItypIAHys40/eW5m9dpGhPeI/MJGpx87zjBvgJGLxVk6kEzL9Yn69FExxfZweNlPLc+NUlZbejT5csz3TZSmggx3uu/D6Lfa23uF5Ezk9MvGhT19PHd0uyDebHR0kpjdpxfHXamNmsljjAHS/5e48mcWQdQ8CNJX9Xa34J6NTu/Ps1BkgRRy/Yi+MYg46ftcZMZ17oE/mCgGPKtnP3KL+igYZ3KJP+gFoi0nceHvPZa5HULFa2LiD3O8fCUeFMw5jyX7Jwlq3qkrvO749JPOumVa/6RYlsodMCCysKzztYuwqNTXj/bqoSrl5p/9rmz+6B1WeMY6cF6GiyGr+A9MBcs1XQyi+yMsn/f5CBXtewA3GQfGkDNfnBhJaEeo+cXnVIMFwb64CNmEHe4UQYi5DDETMuYoqib3l2Bv75/jv11282tyZ1W+djjwkU/Iz2lY9X0jXf+DKi/DQ2MnlUJORM+Mo9M/4b2fF0HTTdcdUTWfec9AAwYg0pBnwKf8MhkRZPfB1WWLc8pkwLMgm6ksdYMVlPtUK+leClz6QiDpGcOAXM38aTooFJZviXdsinVG66eEPJ55VxY+AnXgZEsiNxyjuKrP5gDGcyqBjSwq2GDEFnOMZPqSLmrbaOVmVNnzyN9WOZ+eqgtA==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	i0FisuOFYh8Jkh4uyVyZn0Vdyqqdl0W0Qy5vZ8GaLWqKbvdCmZskWm+8iJrmszlpzYcNBZwy8YdIR9lqaNKPlyGtkrb+sLOPncQWYecwoqTK5RuBABWXFvn3uVSYVUAZzIN8RjB5GYHubIBd4V7OcQ9w2m2HUwUeGHcVXT0UN1wVKZCHKH8pIyMqEAqZXTi2dlgyOabjjDcRFx6YhhSjAfoJOB844rq/cGc3ZKfgq7tBIDo7GoHoWs0wCPl7PzN6Ng7Web6WW/iaBYJFi1YNAn7dFSuzZg55fjL4/ZoAClhgWVelG4bKf3jO0Xr2joFAJtgICGG+Af2sZVKlDVgf2R98E1tC+IVV9X+IKp8rvHErGDCfSOKIv3e3OyO/YfG5aqZKtyHqg6lAntVTxO0mE70pCaBbKRDjPOJD6nosHYeiBc2/zMwidFq4dw+c+mWm
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:48:16.3392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc033f-f1c3-4332-4840-08df1d56625b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB079430
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 11:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130430

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

libgpiod 2.x has more complex licensing than its 1.x counterpart, with
multiple licenses applying to different parts of the project. Because
the recipe has no per-package LICENSE statement, a user installing just
the library (LGPL-2.1-or-later) might be led to believe it is also
subject to GPL-2.0-or-later and the other aggregate licenses, which do
not apply to that package.

Thus, to make it clear which licenses apply to which parts of the
project, split the recipe-wide LICENSE into per-package values so that
each generated package reports its actual license instead of the
aggregate expression.

Additionally, the CC0-1.0 license has been added to the recipe to cover
the 90-gpio.rules file

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.3.1.bb
index b3cb33ac89..f804934682 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -2,11 +2,23 @@ require libgpiod.inc
=20
 inherit meson systemd update-rc.d useradd gobject-introspection
=20
-LICENSE =3D "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE =3D "CC-BY-SA-4.0 AND CC0-1.0 AND GPL-2.0-or-later AND LGPL-2.1-or=
-later"
+LICENSE:${PN} =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-cli =3D "GPL-2.0-or-later"
+LICENSE:${PN}-gpiosim =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-glib =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-manager =3D "GPL-2.0-or-later"
+LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0 AND CC0-1.0"
+LICENSE:${PN}-tools =3D "GPL-2.0-or-later"
+LICENSE:libgpiodbus =3D "GPL-2.0-or-later"
+LICENSE:libgpiodcxx =3D "LGPL-2.1-or-later"
+LICENSE:libgpiotools =3D "LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM =3D " \
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


