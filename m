Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E41CD65521
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:32:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10978.1765963970973644222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=EdO+aEGU;
 spf=pass (domain: phytec.de, ip: 40.107.162.93, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTPghAunJv2/rttjJKE7kCgGYpv0oTkbnmkOG+z09jjZCtpEnktRwQBKKlp/grNhIN9eSBNmOQCJaOD6i0uj8P4vrzrJvfgYq3oWkd5LRXZVqXfM8ET7IC7CzmGoCxNMzZeZoeyNoYtm8+sKKqgS6QEu66QJCPtNjxgpzcqcgdaWv3mAWAh7WEL1Ho6Cf80R/OJKh2d39PMVL9mlr4joHvcsBnYze42o2KfhawQiwu2aUoecSeb8VUng80XqGbgWYa7d7ouTl631lsH8rtZDdgPriU+Jlb3h89dpE6tfdeEECSlzc/lNEr0hSZAMjgVp2RRfLeRWVfwx8S9by0M33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eJtuV0yI6CWCakvOqdxFBMWxc1llTY4JX2SzCLD6Z4=;
 b=qOFSmemNrGfc81mYTBOQeqBqzEakZ1JwlIZnh6JrRPcGEl1gNw/9hJW3LEaio2XEbSJJs+oWqqP3baUe+M1t6fLxX+1K+1MDqo1HR4i239cwwXOJ5Dwn+c+A358nsEGUcTBbNIjNFjrFKc6kK3idXJqWs6FScf1d/4bgQu/Ouij9jb9+ytv4HBfSRD9D8lt2LBrqgIna7uBvjq7Cv8ZcNXRqTLIeBcJgBYkNAc25sGvnPioLCpjetihVGuT6pPAz0HV46QwxzvmIwRoH0LEfrYhF/hts4B1ZsMMywMgtCusz5+zYkUPna0DJqkCwDDJxOYxVR8K6afIVQyeuKoSWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eJtuV0yI6CWCakvOqdxFBMWxc1llTY4JX2SzCLD6Z4=;
 b=EdO+aEGUkesNieFbPTb8FaBTGAuKxcmY6uDNxhux6s0zjmPk2+aQkSCGrqTBS8PTBUWrM6usPcqqTkJM0ECr88K6RIaKkzieJ4DEkTlP9Ird32JtwSM1I8iVbHIMPjJ8gjPZgymbVYsf9/h7L6lkfhqtSlAy29mi5slFIUA5K1pKpGVfIuVw+7egnfnOJlQJohZ77nweUTTqzlMxfrm1bZYD7KPnCHTwdE6HNkwzeqwlSCneo2trI6+JwZ3pBe8s+zscv0WGV2v6VHpDe/IYzBcvNGZ7blqj8+kMB+mQqUqyHGW8e+DKZ/Ev6PoxcrTa7HAyV5qncMf0Ojoann0diA==
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by PAWP195MB2628.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:32:45 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::42) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 09:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 09:32:45 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 17 Dec
 2025 10:32:45 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thingsboard-gateway: upgrade 3.7.4 -> 3.8.0
Date: Wed, 17 Dec 2025 10:32:35 +0100
Message-ID: <20251217093235.3469955-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|PAWP195MB2628:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f3ea80-d7c9-4b33-d4bc-08de3d4f3c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HptdV3HBCzKJMc06+5cO8BNB2LxDN+VUCMDOvmp8+cH8wm4Ua93/FFZjhsHM?=
 =?us-ascii?Q?OGZih/O7dIR479EUyUTnjNyFKrj/fUyPMFVG/eN1AAQZhspG+dR4MvbXAvBy?=
 =?us-ascii?Q?Jk9p2yqXf2Mxb8O6HXWPSehmVPOUNqa1t5qGnbA+PyYSJU0+PhpVbLU27FT8?=
 =?us-ascii?Q?JH+dCwKDzdtDUpUwZWwVwQTx5qMxy6NXJO5unHAJJRoogX0tSuCRxvBx9/8X?=
 =?us-ascii?Q?tPHCy0UAvDFs8BWRrtLZ5Q5De3rqivtjqR1sDFwtpTjlaG8eyB5gcRuTWKZa?=
 =?us-ascii?Q?yekyV0GvcliK5Hk17tJEwExMcX/NLOPTtdOy4SV/Cehkh9WfV794UwmTDcTx?=
 =?us-ascii?Q?1rvfDQXywVxfTcZ4cLMCJA1Mf+Wcgo9o4eKzuM5EhdBJOcuJaZPAO2T1yae7?=
 =?us-ascii?Q?MbB8Uq7Mh5e89P9QYZ988i8wnNihJ/ZADV8Reo8fsOCSIXGunlQifBV9PioN?=
 =?us-ascii?Q?5F8lb0MWm3lXazUJ3DLaL7+FK3ROsAvubVZY6ZkKgVhAi0KnKW0BT9UONHfo?=
 =?us-ascii?Q?oGVgHrbdNuG++CtNgP4bSmsvGGbLF2A8eybvPVaQpbxOzeFxIGF7hnAMu8eC?=
 =?us-ascii?Q?/td3HD7xBvQpoUJFbJd+uFdNq9dyF0vxtFRcT3+Kn20/F51Ve7K5Z/8ketz8?=
 =?us-ascii?Q?HuABtzng22IXEBUjKHCetIIykzAuVgXj3i4bQbDXmq85xauEW2cH0l7yJ4ZJ?=
 =?us-ascii?Q?ta6rs+uY3m/6bCDAdxdAapaL0mbeVz9nncBXgGPv5+eS5nQ01WHbGfRQl8NO?=
 =?us-ascii?Q?DrDEPwi71rV9AGeyN+Um61y4zXF+CdzH3ecKqMPzhdG4Y2Ax8uVsqYFx23sc?=
 =?us-ascii?Q?dh1+yVoKuIQt7cD9QkYf9wIKfBYpvCSSVUvG84FtVYIbF4naTxi+3Isz7tQX?=
 =?us-ascii?Q?EwqIKfpzyeUcsY+9m4b3/r27964WOUaWx3wszWgl5UDX8uQ3Z6oInvNrmxOS?=
 =?us-ascii?Q?As+m1/Le4x49e8Ma+TDgrtKXoa02IuXcIl4/Fby0ERE03W2zaFV2XTPmsSo5?=
 =?us-ascii?Q?zITsBB6TBj+KK758TDFTdPXOQgVZpEExvenEPGiCuzv2rRgQAJxgQF003TlC?=
 =?us-ascii?Q?SuZ9Lq6jOKfCOlczDgRAGk8q2Y5htLs9n88Bh/usRDBcDQBuDcalmqnFieKK?=
 =?us-ascii?Q?kA/yJ9+1z6AZRHMLMWn1uvQi3Og5Sh2mzlvm24gBgp7Isg+rHxUo3BdzVBJ1?=
 =?us-ascii?Q?wrM2sKp9iksgHuyx0U7ehcDEKXmZcFeFX4YtZ0Q9TYsu5T2sD8BihnW8F+7R?=
 =?us-ascii?Q?rBO38RA+W+HCW8lIPnaR1wTeoIx75vXWXSVtgBYo7eoQ4LjRORMSOMUz0iNs?=
 =?us-ascii?Q?hMAu+8QjTgbqt691JgCFvL6FDS4J+Sk6WyXHIXH5dEWfp5V0fOqpPaQinrhE?=
 =?us-ascii?Q?VRSAVLjBm6VOHgPG9JWrq48JXrm1t2NYRfgcttOQul/MEl1N25B/2DSPEH3X?=
 =?us-ascii?Q?BLZmdKdpNZ686iPYnjuM+blQlTDmyOa7m3QJ6BOiGpH1fT/zMmQ9LUA52c2D?=
 =?us-ascii?Q?7E3yCWrBtQ5+I+M=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:32:45.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f3ea80-d7c9-4b33-d4bc-08de3d4f3c21
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2628
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 09:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122723

With thingsboard-gateway 3.8.0, the source URI must be set to the
project Git repository, as source releases are no longer provided via
PyPi for this project.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 ...sboard-gateway_3.7.4.bb =3D> thingsboard-gateway_3.8.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/{thingsboard-gateway_3.7.4.bb =3D> thingsboard-gateway_3.8.0.bb} (=
95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-py=
thon/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.0.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsb=
oard-gateway/thingsboard-gateway_3.7.4.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboa=
rd-gateway/thingsboard-gateway_3.8.0.bb
index 7a82414937..5ca57aba44 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway_3.7.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway_3.8.0.bb
@@ -7,12 +7,12 @@ HOMEPAGE =3D "https://thingsboard.io/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
=20
-SRC_URI[sha256sum] =3D "5811a3c5a2334e41776f249df20c1d6a0def62a6e11e77bf2a=
beaa02f2725260"
+SRCREV =3D "4215a302c649f8fe3739814e365b0d6af722b66b"
+PYPI_SRC_URI =3D "git://github.com/thingsboard/${BPN};protocol=3Dhttps;bra=
nch=3Dmaster"
+PYPI_PACKAGE =3D "thingsboard-gateway"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "thingsboard-gateway"
-
 RDEPENDS:${PN} +=3D " python3-jsonpath-rw \
                     python3-regex \
                     python3-paho-mqtt \
--=20
2.43.0


