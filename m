Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C6FC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 12:18:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.42])
 by mx.groups.io with SMTP id smtpd.web11.11950.1714652312112227053
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 May 2024 05:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=AZS85cvy;
 spf=pass (domain: de.bosch.com, ip: 40.107.247.42, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUNoyjq0a7yJE3xJRnB2odhYCAS9l6tbekKcLZgHwmZrlgqas+h8LvdMxRMDukD+NJpRQpwM7te3bYcNKgEODgMKwFUWEjoiytQD1PC3iahqVDsWuDdaSzzbcr9hPOKO1vV6lY/CgaatNGiJAoscBg1bghpZS/pkDcHdfF0vt8oITEEkDBeO3ZefUOAqAVFeY2NBouvsBrb5QPjcNugiXsloBMarE81S/qj0n394xRXy8E5r95O95rVFo9fY0FmjlchB4+MqIsfkUaTKCC5Id9uR1Zct3ZhZHhS9PzrL80/jemY4sl8oRf9FHrky4caMtluJmQTrp9LdJx+vdGeUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twO0jrqgXHT4Kob0EI+z+VFUYbRF7R+lo0iz+XlToAQ=;
 b=LJmBCS6dU4m+FmyPfLUN9im5HVvj9V8/7C6RwDEwI3nXCxAVdp5Wy9PyzWpLDzCXYoXf0z3tquQ3sdctfHQgZxykpL/rNRJ2D6rjxjXqnOlYyUABiJc8oD+Ik+0dmM/vMunMaeTbMepsMxVQmaIXXB0jviHy7dyxLUkgyclctlFWfj8OI3WAOOyutZvxRNQ9Ketiih8tOJl2wr2M3870Ra5+xLXwYe15K7QRFKpbdzMYyd5d5YZ5HlUH3yoTFzP+i0w6HAUvRcOzNRQk2G9nV+vCnsSChAYcas5t93QUQkqyMNxUqXEO83UuAMP2NrgtSvQSPp5Mn8S04X4t2hu7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twO0jrqgXHT4Kob0EI+z+VFUYbRF7R+lo0iz+XlToAQ=;
 b=AZS85cvyGsZpj1XARe26lAfSKakD261nUuMkUzpoI9kVzMlc64QpxPlT74iUutk69PoMsMYEULKynMygRAE/Lu9AqsaOU4u38SaoVujmSuqWgoMI6NhztIFqBLIPf4Ve7T4Isex4SS3ZT57CUljCM/Qsr9yKGaI/q8cYdsXUuFydI5NGo+pbGqscJTbv7rJTn/jhjFJDiIwN6EbG3iUEL/6y/ryEU1W+cb9kBymYr6osy4FiA1+e7jJoAEh7mVXnShVB2/bZYWOge7PcqcyrGM4//kyJOj1XNqAkklBf+ASHI5L40K18cMqOSxvI+jNGremFymH7U6gv02KQ/Ao/GA==
Received: from DU2PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:10:234::18)
 by AS4PR10MB6111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:583::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 12:18:29 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::6e) by DU2PR04CA0043.outlook.office365.com
 (2603:10a6:10:234::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Thu, 2 May 2024 12:18:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.19 via Frontend Transport; Thu, 2 May 2024 12:18:28 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 14:18:15 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.37; Thu, 2 May 2024 14:18:15 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <beniaminsandu@gmail.com>, <alex.kiernan@gmail.com>,
	<denis@denix.org>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-networking][PATCH] mbedtls: Fix warning for missing program
Date: Thu, 2 May 2024 14:17:58 +0200
Message-ID: <20240502121758.9982-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AS4PR10MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a60573-83a5-4689-20ef-08dc6aa1f93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jm1jn3LR5o9S9HT8l9OXax7vyjLiL439N+55qk1Zx1co0LuqiZlzN5ll2Qeh?=
 =?us-ascii?Q?eCt0RrGGurtzXzt5Wsu+UVyX/DhVaiBaQqbfljoHodiggBKumdQklAZNaSfz?=
 =?us-ascii?Q?DFdnsXRy3QrKRXhZNrZVeduXK3PwSnMv9cZ/jDVsQAuLExYD5p+q1TCPa7W6?=
 =?us-ascii?Q?DcO1vxs2m5V6bUiwdQP1GNpDAsfqPuiGw1uuk2mjX2svoC0h9668iMm6Ksdg?=
 =?us-ascii?Q?C0t+f8vtl8Ir5qm0RIRZcAmN3ZuD8ekreI5sqTi4cebnKGFals8/3aRZKe8q?=
 =?us-ascii?Q?r1ZTzOrL8B9EcGJUb2ymls6GMXEqLjee1HT1lDiA7nQSu5dmpMjjKAH+6Ncf?=
 =?us-ascii?Q?wy70di+kl4QCUxyaDWEno+XlCnZtY8LRp/VlsSgcfIPC3LYNXkNnoaif1q7w?=
 =?us-ascii?Q?L/C8gT9tNJSbu0c271xOuCo9x6OzuLRjIRuH3/GyEXJhftFvCU3yj8cribmE?=
 =?us-ascii?Q?uOSUAMBWszG3w6hahdcfj7Uv59GzhUpRoy8uF9nyfMNZ/a71tm9cjxPgE0G/?=
 =?us-ascii?Q?klKL05kIA5m9pAGA0WRuf1k/5uy5ErRSW5FRcGYGybCUd5VaY4F/dk/xjVL3?=
 =?us-ascii?Q?69vijrH6GRDi5c7akyqwXOZ6NTud0dHB8trmxLAmupmNsFyNygprKcDZHoug?=
 =?us-ascii?Q?sqoL52tPdOtchNavndvig0DhknMosOI9wnPB0g6ReUn9FLW9qeU4xHVHqEJq?=
 =?us-ascii?Q?8tM+NrshDMAOy8muhLbbXgvLvRAZHSY1duq7WRB179OP0Oo0WR12krOUCa+7?=
 =?us-ascii?Q?QJrosA2x1G4RdbGERVaimfqJ6eKtCFweP3U7X9zQIlX1Y2nRNmPKAaairZW9?=
 =?us-ascii?Q?6aQm34iqT/kv3TjgbHx8N0Yx+AKgsMgftcpVl9746/dO9gK28Kez5SaLjxEt?=
 =?us-ascii?Q?X6bX8uHQVAgeEJPR2iWOrYV+DMzqGULuwh8j5izFubsta+DGV+RV2+s0+W2Y?=
 =?us-ascii?Q?JEfZE1vqIFqqn2/Btx4wD4LAP04qmmW5F4LF2lg8vEsmMgzfkdSfSPYu1cvo?=
 =?us-ascii?Q?SEQ6O+b9CeaUOjcD9DHrGQ2OKw+XQZK3rIPBnDrMqykxWBRR6dSqVlBJhTP6?=
 =?us-ascii?Q?xDyUtrU4VOHQVTaIhblYvwc6lvOyLR4vGFlmo1ys8iVEsk7FOVkk4qvpEz+X?=
 =?us-ascii?Q?cqDJaCWCM2htLIYqMI9ugM+80OJqRxeQa8QbP/OKrY2UdxAeMYolj850+ufY?=
 =?us-ascii?Q?lA1m6LhAY2iyY6TjxmQ2b6G8GiDhRFGO5l4BLWkuSdJBmw89jlWYK1BpOP2/?=
 =?us-ascii?Q?6tmK9tHSej+fnnNcS/YyYN8VJZ8pSAvbbEFjhJqOUvBS6xbDsKo6KjuvuAko?=
 =?us-ascii?Q?nMgUB2KM496yAnBRMMCbSA+H8tNtkQLWLCsoUnOEK2ps51+UHrxDjIA5kfRk?=
 =?us-ascii?Q?cj34mVtkPG8ZSQkn/VlY261l4uuM?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:18:28.2420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a60573-83a5-4689-20ef-08dc6aa1f93c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 12:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110242

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

When PACKAGECONFIG does not contains 'programs', the hello binary will
not be generated, but the ALTERNATIVE 'hello' is still set, causing the
update-alternatives bbclass to generate warnings for the  missing
'hello' binary.

This commit fixes that by only populating ALTERNATIVES when 'programs'
is enabled.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb | 2 +-
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb=
 b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
index 301e65598..db79241f2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
@@ -50,7 +50,7 @@ RPROVIDES:${PN} =3D "polarssl"
 PACKAGES =3D+ "${PN}-programs"
 FILES:${PN}-programs =3D "${bindir}/"
=20
-ALTERNATIVE:${PN}-programs =3D "hello"
+ALTERNATIVE:${PN}-programs =3D "${@bb.utils.contains('PACKAGECONFIG', 'pro=
grams', 'hello', '', d)}"
 ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
index 92a2de82a..a10fce0ff 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
@@ -55,7 +55,7 @@ RPROVIDES:${PN} =3D "polarssl"
 PACKAGES =3D+ "${PN}-programs"
 FILES:${PN}-programs =3D "${bindir}/"
=20
-ALTERNATIVE:${PN}-programs =3D "hello"
+ALTERNATIVE:${PN}-programs =3D "${@bb.utils.contains('PACKAGECONFIG', 'pro=
grams', 'hello', '', d)}"
 ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


