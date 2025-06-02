Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2B3C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:18:16 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.69])
 by mx.groups.io with SMTP id smtpd.web10.49487.1748870292970743747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 06:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=esrXhZ36;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.247.69, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upl6AVR84R0VYYW5fiEobJqN9ZJY9qKmS6Yzu+Ri9NIia8WJRQHv8+1+YsfJr3q4YbzQpW8VqheKIrtTtUHII9u7ovmyZtaHTqst06rVME+cZpyh1vJKEn/u1omaiWTO8cibyDxQyokyMyjNpAN0LrqFs6XOZ2ZdSOzAaaW76osBsNJnndzRlw7uebTl/M99lNvmawaKk/Do9/+ApCaXn3PAlMdGqS61gsiSx2FNGQymAjB86KpRHqrSfzfyG2D6GyWOitT1xIFHqVp1mW7me4DICJxsE6x8hdmV+b3CQau7vkrPiQHPC1+YeEok5NpBj79YObAmo9YaRsy9JxqOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6YtCtFCqpaOMErSdcYiYjUwKQsU847NwPlmaJjNQ2I=;
 b=hBrAWKX+tE1u1tFASHxaVpVUTnQ9i9/0u76FCi7VJ1Zj+him68gBGNhyFviOl6BWkWFW0R2ZB/6ZxOHlZAgRfoaURJZlY+d4PAX+SDai/NfBB6ZPUy3jWZkkZeXHiZBdteXw/C3P/G6gGJH5gNSeJgx9YS+eUB6s6qD8VRWE6MWCFO4Qo2rhUflbKjzI+dCOCquX/5rayPIW74i8cIg63rsFGoaAv8uJEV0hbdCEPuk96OMZfT0OFalW3k+LO5ext9GUQYSI4aaUIk+jsCHNW3L+ij1VYFQZ8BNZl926cdtX6FPqsoUfoain2MA3D9GbLAC8XeZYVoqQNpL5WUM4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6YtCtFCqpaOMErSdcYiYjUwKQsU847NwPlmaJjNQ2I=;
 b=esrXhZ36CvSN/q5xbZkPLpFXGvnQKBGSE26n3ZMS/n4cN9UUTfsF6GHrKuvoqbfQm/T+VVILZ6/ut1WZt3ARnjePC5/etCCAUjv8+hjz1hApeXe+2z0Y3VfMH2X31CEKAWG5w3CNFRJBzabU84sdJ4plRpYTKQDiaRB4AstVQJ4=
Received: from AM0PR02CA0189.eurprd02.prod.outlook.com (2603:10a6:20b:28e::26)
 by AM9P122MB0268.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.38; Mon, 2 Jun
 2025 13:18:08 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::6b) by AM0PR02CA0189.outlook.office365.com
 (2603:10a6:20b:28e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Mon,
 2 Jun 2025 13:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:18:08 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id LvuPug47Y07hKM53HutrqL; Mon, 02 Jun 2025 15:18:07 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id M53HulhbrinGMM53HuLCRO; Mon, 02 Jun 2025 15:18:07 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.223.70])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id BB55818480D
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Jun 2025 15:18:07 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id ADBD67C020D; Mon,  2 Jun 2025 15:18:07 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cli11: Use the standard catch2 version
Date: Mon,  2 Jun 2025 15:18:07 +0200
Message-ID: <20250602131807.3748115-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.43.0
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|AM9P122MB0268:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6675f81-f654-4f04-7f8e-08dda1d7ea83
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7093399015|61400799027|48200799018|13003099007|35450700002;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d8MGWneAHJPkh3XzO7zS5RljLfGP7LwN5xrtRyoYOKZomaxzX4Xy+p83jtDS?=
 =?us-ascii?Q?YxUBNenhx65EGjeXrDtw3o/RYlJzJAqDuHSJEjt5eicOK6B6ct1/uNEIieav?=
 =?us-ascii?Q?95OePj2UBDtINtr+7/gcgjcrJh7YVT8KQ5xnjTYLA390KVwZUPCPEfM+k8WE?=
 =?us-ascii?Q?zE89PI7CgyFOWtcZp2OQ1DCzgWHVk1fDRp/rTYwWjhRxqlfIC3szb+T60sJE?=
 =?us-ascii?Q?Me4kCBhWyabsonceWeYLnYZ1Ho3RVkaxxlQ7Dg5Dm7OYzKRAy0SLmGYLAfKh?=
 =?us-ascii?Q?ihxaInhkIToMsE5hTtqmebeMN0QYWjo+X/qxjNrO+Uli+XhVQkR643J7abP4?=
 =?us-ascii?Q?+1UsMJmYixLdatvf+DHN/3AV+kkzIdQ/6RmazuoXH2wA+qVdVRGa9rqw18kY?=
 =?us-ascii?Q?SpPi//6JCRKR3BuczZvG97D8n0asCyhIQzAOLfsnl8zGbJ0B/XDNfRJsRQHK?=
 =?us-ascii?Q?PgcNYnb1DD4PFaxJ9dhnpbAtUXOEPhOG+u6DZOp0WkeC0rLoD0Jn5d0zQ2UR?=
 =?us-ascii?Q?raGBBZs9OO+7c5UG2TOL9VZgWrwDgcVOzcGZs8s8JsbtyOkKwgy2/gt+zY0B?=
 =?us-ascii?Q?GVBa3zd6HZ9qlLmw8ck8GCML5ORfscXuCKhuAbPzpolKgRCqczTATXFhhW1X?=
 =?us-ascii?Q?3ItzwAldGkWK1xBOmy0B831mnofEoV3D1abzcM1ngp3WMwZ4J2hM5iy49JSH?=
 =?us-ascii?Q?ifydvkVzTwH69yr8fd49+hyMRT8LhGJBqlO9pZbvnA2KSpNxnyHlC2zZbXnE?=
 =?us-ascii?Q?Y6Q9dK8LJ8mJFiOWTKCYCnG35Cen9DQTJr8MyyUOVjU+zdUFPpTn5GKAyWjd?=
 =?us-ascii?Q?GZcrYCm+iiX4lcEuiokGBjtJ+sjKxYxBA//sK3VT/vJmCjub9EoK2C6etdv2?=
 =?us-ascii?Q?f+XMhm/MeX5s92Yzwi0U1Jy6cGcXCbpYmUL3LKjLAWNbQi7wzQ/qnwL3SlVj?=
 =?us-ascii?Q?SzDhbQe8CjC3m0AD1R4JEVT6gbtVyD7RKjqgJQVOKCkxBMx0RfIHZ1r7+y4u?=
 =?us-ascii?Q?SQTOdi4Bae7hMkMbctBAsvZhzz6wiI3GyqV5rMd6Es7M7p7oeft6QMh8PjmP?=
 =?us-ascii?Q?Ho4dhu2wJcfBoiKD4bp7Yz6PTuMhNdEXLH1epLJWCnbgb2VpwzAjuYUInQuD?=
 =?us-ascii?Q?dQWwmuMVmtAxFgDNaxm5vCHjJOoIiJ70iM8fNsiECsGsgoqzcDbhyQNIOiDn?=
 =?us-ascii?Q?8FyQ+opOlsOwRsj2hSeXQ/8RrmXyEXvPDXQvkAZh+/nZLZ+yqj765yOPJxDn?=
 =?us-ascii?Q?9xnVJ6Ucp2viOSyC9iO4opDyWDSZV/Lvkw0zGXTy5idCaP1Ti9gWVCnrcc1c?=
 =?us-ascii?Q?54bm+N9vK7iy/jx0pPm7yGb0jPhVsSw/I1PKE4eVH6RZ6xtxA673J8awY4wb?=
 =?us-ascii?Q?yYIEZhZTgeOL4AVLq/3nCCXGzU8k0K4VG9uimHvQaZXqDQUAjoXynyLwM1Wq?=
 =?us-ascii?Q?CtKSQmLaIg5aTiCgVuViZW4OeYF9T27Ko/EoSXfaCsEdwj28Pb9mNw1EXy7H?=
 =?us-ascii?Q?aaTsKZz8t4DlvEY=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7093399015)(61400799027)(48200799018)(13003099007)(35450700002);DIR:OUT;SFP:1101;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:18:08.0481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6675f81-f654-4f04-7f8e-08dda1d7ea83
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P122MB0268
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 13:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117706

From: Julian Haller <julian.haller@philips.com>

The cmake infrastructure already supports using catch2 from the recipe
sysroot. Make use of this mechanism and add catch2 as build time
dependency. This allows us to drop the custom patch, the additional
catch2 fork reference and the do_configure workaround.

Also, cli11 does not use git submodules, so change the SRC_URI type to
git.

Fixes: 62db1c041f81 ("cli11: upgrade 1.9.1 -> 2.2.0")
Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes=
-support/cli11/cli11_2.3.2.bb
index ef3c951bbf..a247509c24 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -6,17 +6,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dafb20fe5f67e21=
074b10b864d9563c11"
 SRCREV =3D "291c58789c031208f08f4f261a858b5b7083e8e2"
 PV .=3D "+git"
=20
-SRC_URI +=3D "gitsm://github.com/CLIUtils/CLI11;branch=3Dmain;protocol=3Dh=
ttps \
-            https://github.com/philsquared/Catch/releases/download/v2.13.7=
/catch.hpp \
-            file://0001-Do-not-download-the-catch-framework-during-configu=
re.patch"
+DEPENDS =3D "catch2"
=20
-SRC_URI[sha256sum] =3D "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e=
24ee6b536bd9bc"
-S =3D "${WORKDIR}/git"
+SRC_URI =3D "git://github.com/CLIUtils/CLI11;branch=3Dmain;protocol=3Dhttp=
s"
=20
-do_configure:prepend() {
-    mkdir -p ${S}/tests/catch2
-    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp
-}
+S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
--=20
2.43.0


