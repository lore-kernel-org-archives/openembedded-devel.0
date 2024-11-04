Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9057CD132DE
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:15:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web11.59896.1730733325045908765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 07:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=BItpxugZ;
 spf=pass (domain: arri.de, ip: 40.107.20.46, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVI7nIBAK4I3LY93PuXDT1052e+JZhdZ0aDF4K7bzIK69M0TjattEI5cxaSst665O1dCxMPi6whR22COJkhmXJdrSg/U5EgWQ6/J4Ok9/SqOLi2PG5vP/G9m2RWqfN/ucECd5xrBUDnwRBP12FIlGpN7ZFcIv+v43gT4o48a0iWchk34TUEl0lOWeVONUDzrsr3TpTjBahnMc2ptTGPeG0GUsoSZH61SYfoD5S9FVyQ8mYHqJqFNjOkMAaRqzZrMVJocnQ7zlxHhYxBtdOI7jA7VzqrMSpQfflfB/n9inAHcxFzVLlQE3fVKQxgMvo4cqHo7r7juIqMQlnfTVyy4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkDTT2G4JLDVmSCEnzYEfoPtLn5UgYMiWQnwgJn52wM=;
 b=ucjYEF3FOTI63Gci1hkq6SdRRt4WYK7vTPlWpXG4ZMm4QSG8fGxnZdw8PQhtzCqOKvi3LBUYgY0SpFVwCtAbQbXDijraynJCvDikBtYiybp8ZA5MUYtYlodmEIajj30MLTAmU8Pqvr4boZhped+Iiix9QfqXrTgowHNu3ewx/vRSjcrl/e4IP9uxKVe8tEStq7yegZ96ST4DlUxWH8dEJbmrO2PLxovzVqlUXVjrjMhbE5tTEpKlv9zmsdwqbr0Ocz52XMhAPSwMxZEFvUdUEO3IAzYzkayamB/Rw8U39CTv9DdVRtzz5+czXjnysxkE6MvnGGqu0tRHB0MI66MR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkDTT2G4JLDVmSCEnzYEfoPtLn5UgYMiWQnwgJn52wM=;
 b=BItpxugZTaNLlBEOdYkr+rtx2K3/xj/tEgHmvByih9Y9SsOBjXlmbayp8iBfBqeqZGrpTqRvz70f+pl4K4kDxv5bBV3KGmAibxJL2nfzub0sR+/Or0N2GD7uvWJcBtAqU/2zbsftsHvBrZCD5hVkQyCmbKf+W5mR3Z8XQYQkF+k=
Received: from AS8PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:312::20)
 by AS8PR07MB7656.eurprd07.prod.outlook.com (2603:10a6:20b:288::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 15:15:21 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:312:cafe::cf) by AS8PR04CA0045.outlook.office365.com
 (2603:10a6:20b:312::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 15:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 15:15:21 +0000
Received: from N9W6SW14.arri.de (10.30.4.236) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 4 Nov
 2024 16:15:20 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] glibmm: use ${bindir_native}
Date: Mon, 4 Nov 2024 16:15:13 +0100
Message-ID: <20241104151513.26098-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.236]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|AS8PR07MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b301489-4437-484f-723a-08dcfce37fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cLQeXStb+EbZf9VUvKJxIpxG9sGdyvMG89BWrym4+giVQBYTzGaQ7dD3NIJw?=
 =?us-ascii?Q?rEaah56mvO9npl2PNPpPvwYQ7Iqc830DXA5p67LzOfkVe8qmY6G6OkcvwFpz?=
 =?us-ascii?Q?Bq6rxAdu2Np3+LXsmD/hte7aGkKyhfmQRIHQQDetkTW/FxoR+3ofpoGrIpDO?=
 =?us-ascii?Q?NDQfbnmFv+sZqXm6KUQQTcwWBSLviuRbVJAgfLAHHWLyP7OdN2KO+30DCO6t?=
 =?us-ascii?Q?dq/szSnm2e5Ym++Yw29r19+ZU6yUbcXbxvgglI2yojh3eIhz7qh4oByBgc6K?=
 =?us-ascii?Q?Fv6XrFeqjZSrBkr8+aLvhK5lVqA3lEVk5ub5yjC8xK660qpPdlI6j13nCax6?=
 =?us-ascii?Q?WmcloEN4ddp9QhGDWgAWnCNzNLZ5NuZ/wm2aLC3DoaqhKxnat4omWOJjagbt?=
 =?us-ascii?Q?dMAfa7sx5jEzB8jU/nXBXQKAvlJ4VfH49ccZbS3LqU59ValExpWmLyYBHmtj?=
 =?us-ascii?Q?RJ1TQ3EJCa7bU2bR2wldDoRxPzznI/HPhvvNQnzSFn1jhnLdn7xVUFH6Yaby?=
 =?us-ascii?Q?7tIT9ne+0/wZ0OeaeMlwbrjLlSheErTFHx7ywDd7kHMTLpHKWCvPwKcmoWTd?=
 =?us-ascii?Q?r9sT/JG96ZiCXx1w+kcIkFEhIKQNK+sPyk/VBuGpGzutoLmhsft1N6DNpDi4?=
 =?us-ascii?Q?M5eMgOBJOLkziAe9w4q5TGGmLczjczFF8YTxOwlN2W+lCHM7aqoPCPCcGTKu?=
 =?us-ascii?Q?HA0ZqJZDYDd8fVsKCBIb0YM8w2bMsFLm78w4reV0zgH8FEfa9phICPvVtbHt?=
 =?us-ascii?Q?Ff6dXwJM9qdkj98H/Ce/J9L+AniKur4uhA0xUcQdjsGQcDwV7yMu4jITV0U2?=
 =?us-ascii?Q?JUhHVtiBOkcTDzyixteSdEDwUrTIPALIM3tKKlG4MsvrZqhSanmF8kN40ipq?=
 =?us-ascii?Q?0ZRdztrgmm/q5VRt40ije6ty7grvRbZwU9GzqMhNZ8EUdoq8H+Q1t2T2Rakd?=
 =?us-ascii?Q?BuF9BvjqtHIiBu0Q9VIbCl+BZ5eVuc6DtO0Fvtv/v7q5ZWjXf5Rjb8KeTICD?=
 =?us-ascii?Q?1Jnb5EBM1Opo7wV1+JadPSAUKc0rlaaZntR+bVmX8awpp993sxXN8ZY2R+Sw?=
 =?us-ascii?Q?wxI994g4W3eChJRa+/slbV+4WTBLvjlKmp6U8n5iivRYppqWPsBgxlr+o5t5?=
 =?us-ascii?Q?8MOsz6Syl7XIQRcw+mVPIhDQwRFokPpnPls2zZAXGk2zZSC+PZQC1WdAcEE2?=
 =?us-ascii?Q?zn63VvMNHnt1qK/8kKbbBR0hhSU/7QErWKIcLujhQlFszyv1nGOAEGes24Rx?=
 =?us-ascii?Q?+bbwPBhGrCJM9PJWhb27f2DlyHJJPRHfv8KmLYqLc9Axr4Oz2q5sbkAwhw3f?=
 =?us-ascii?Q?dnV7rQH+aCzAfxunPVzYy7lime+nLx+FfAe+gqOq7JVIQcH3FH+ujjw5UbPz?=
 =?us-ascii?Q?Yyoy3WwgsOArPVzzQS+xVUeEW89sHh3lKO/t/M+iuD2VZmzx5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 15:15:21.3276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b301489-4437-484f-723a-08dcfce37fec
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7656
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 15:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113408

With the current ${bindir} the build fails if BBCLASSEXTEND'ing to
nativesdk and enabling maintainer-mode.

Fixes: 3d0279c18738 ("glibmm: fix reproducibility issues")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
N.B. Enabling maintainer-mode (e.g. after adding patches) needs further
packages in DEPENDS, but I think this should be bbappend'ed locally.

Resent due to missing [meta-oe] in subject.

 meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb b/meta-oe/recip=
es-core/glib-2.0/glibmm_2.66.7.bb
index 46519384998d..7c7a3fafb74c 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
@@ -24,7 +24,7 @@ EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}=
.cross -Dmaintainer-mode=3Dfa
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
 [binaries]
-m4 =3D '${bindir}/m4'
-perl =3D '${bindir}/perl'
+m4 =3D '${bindir_native}/m4'
+perl =3D '${bindir_native}/perl'
 EOF
 }
--=20
2.43.0


