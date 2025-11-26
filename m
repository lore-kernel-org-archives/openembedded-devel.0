Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EACD10F54
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:59:16 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13379.1764165550791950315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 05:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=SA9MXOhQ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.193.57, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1kwLSNs+yL/Ng3eKMNGWTSRp1tHE5pgbRSUnT9ZxST4gBih5OjMEM9AilIVoCrPJZ4OdlMeiy7ddrei+Ba9v0jQXgNsrk9fu1q9HCAJ+FuadFiiTDSRy9+kbirq3blSOYFoqE3rWjnFbJCPO7NlsAnEcZkU5esbhb3wqWdPrmIjGonl/+2qo42rSjgjXNZFRKkC/doxgrs1mfMFB/aWmfMt7K3h6H+Gjq3p8cvY3KEw/Y6rZWYhpBEGXphAwPoXDlrMbrnOB2hKkB0Z1T3FbUy6saWiMdXdMpZi4F6ZW8E9sMEyce63v4MvmB6ybZNaquE6ffLy82+nrrDynuj3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUY+YbNsLyPfZHCb+rs1l6PDYKwvZtS6wxOQITNsAxQ=;
 b=D7h1clvghikpXaSQMBTp/iX51gvkIvZgW1vskFYNNBWv0Zu77sRFRWlXEp6EelpN4qPvW+q+Rc/Ll8umopo7yj9IR1ZNqBDmzXAHDH0NrXhlI69bjAxmDYtqel/quxAb1M22eP6qZcoIhzyHYis+gABPmN0voALRsHGid1VCnEBQ33up63ogcGzpSKUyk+XKyKjAFTJ6DhD/MEFQ5669j6+ZICkH5AAop/LaNM3TgueKn5OpwhkX4nEZ2/806gG1MAkNtisvhueK5xWUv2fo4is9v9WoHkdIKyI/DQVxrAZDFGJRzjSYgxNYSrUlaKlLMrxTdooB/Nh7IEgZbEsXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUY+YbNsLyPfZHCb+rs1l6PDYKwvZtS6wxOQITNsAxQ=;
 b=SA9MXOhQOTvu1Jrfc3fbCj/Gb29bs7AB2Qplo7xIA3fYWWWynuvxnvJfYyZn+qD6cTZ7mGYQ6HFgdFpxkQ3RhsfL7b7Q4Xcq0OR8d/Z0XYO5ejuMpt6XQ+fPqEMqNoiUkbHK9EYlfc1/2ahQu32KG0WWxZIUWIrE3X6s7MJlsotL6eRq2f/F5I2JgqWi47KHAxsN9qlOHvtBkQVErHJn7KT46Lyw3EQl7As6sc+6w+mKWoXtbkrFzTSHqpzGfBmaxqjVTpHRoyadNtZZG25YBV9aFNOlnYv8JKGVFd0rAmvUqlzFhxGvAzCAzk5VcsDkDqXEzllUtqDiVytaAjKVFg==
Received: from SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::28)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 13:59:05 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:3c4:cafe::20) by SA1P222CA0181.outlook.office365.com
 (2603:10b6:806:3c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 13:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 13:59:05 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.59; Wed, 26 Nov 2025 06:58:59 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Pavel Zhukov <pavel@zhukoff.net>, Khem Raj <raj.khem@gmail.com>, Chris
 Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][scarthgap][PATCH] fbida: Require opengl feature for pdf only
Date: Wed, 26 Nov 2025 08:58:30 -0500
Message-ID: <20251126135830.3363238-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd9049c-9087-4d26-3d05-08de2cf3f627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gmLcqIGGXVaeFdz0FplmlB+1SVPg88PoLolgL9IRgsdMTsRfuM3GTyyjG3A0?=
 =?us-ascii?Q?oRE2t+qNOMn/cYR8dNd4FfhVggs81EMC4MhEEzJhmT+dEee81Ii3NHZUqThf?=
 =?us-ascii?Q?MOYjaq6XA3T0qGOgluhpcZp+0f186xUwmViuX8PenNmNkAR9mE4OTpCjjFks?=
 =?us-ascii?Q?EQl5s9leXC2XzlqdNc2H8aAaxjpMl43mRghz3Yf5HwjmmyROC+hiQjim0/7Q?=
 =?us-ascii?Q?UXLAzWt708FEE7ZajflMXIKWqHFASTJhJsJHDe+58q7FKgGsRx4wYmThbWwK?=
 =?us-ascii?Q?7Dyu2tc0NoEbsl8ziGBEa4VFgrFn1WKvoidbrAmbNpdnODV5i4s+EmHWZZaq?=
 =?us-ascii?Q?8p3IuYXYrjqSebblcysm9fyvhVW9x4Gp9BDJ72GyxcbSd2tljn1kj2io336p?=
 =?us-ascii?Q?yZRosU35ETTvZ7OEIaxDI/5emLgRo2OaUsYDA+/VzAQ3hkCMS86++60uNRwc?=
 =?us-ascii?Q?DqJcmXUk251oZRoZ939QxSPV3OYZPNjJoe31UQ0p+1wd5CUmGFboHqE8ikin?=
 =?us-ascii?Q?3dGJW4lsEeWbPUqXLwcNLlMcQzBKo9wlQylk+W2exHL1S552h95OG/aNzLIA?=
 =?us-ascii?Q?9H7nyI2Cqe6QhJg7ezQryeXIDpeqaAY158LT6oh7wbxr9fSIfefpGYaGwHpi?=
 =?us-ascii?Q?RLrJhuIkswQX/4VTo85yL8eTCPOyk7TZc1i3+GtMS7C9BTYrnfou+ITqYGLs?=
 =?us-ascii?Q?T9pU/K27jcDJbQRZJI+qlUnvo0d3vsK9bHpA9PJeUZHjJumGOvRm4CQdGIqN?=
 =?us-ascii?Q?FCtekYWtSJx1Khz2Xj3+c8g9MjAjIB+bFB/NvGwVmBFzoPfCpvH1tyRuJX7x?=
 =?us-ascii?Q?/6u+TMQeeA9N2vOfjtk3Bb7amOuhsLs0qfumY26ANKjlb+YpxaUEYIvQ8Wht?=
 =?us-ascii?Q?ZozJY6ZBg3cCg6/mg3juCdgMIxpGWDzzhYcsIXCFUMWd+/5FPXBTf+39NJu4?=
 =?us-ascii?Q?WTEAuLjyWlBTXbXKJQxpBUXCct1zSH0c6W8yybw9UO0MHqKywWa/paQAPLHn?=
 =?us-ascii?Q?04qRFGihQUtdlGzYCiMsEtOI0LJ0AXILqBEgIyDrjkNlxUr+KRR80kQ5QdnQ?=
 =?us-ascii?Q?gz+V7rFzoZ4HNW+V/t28sEQ5B0Bbw4XzWhl90ljJe8kjaSEMexJNe50ZFg5L?=
 =?us-ascii?Q?tfItLYbvQRcPJvCKaKHE2J2luy3KuD4b/bVln8yZ4ALLh4a6Ok5+zQSXoCys?=
 =?us-ascii?Q?oScx6RgddbuyvP+xwJ3fSsfvPVpTJBm8uysrqr4JTTCSWyLaGLQosKECXbB5?=
 =?us-ascii?Q?bdX6nae/Ny8yXdF/jDy9TBv0SmNrI6RxqfTkYUEn/Q58+JdtXEjAbY+iSGBz?=
 =?us-ascii?Q?tcgKjkimuMoPGMjxh51kq0HfFELx//6Z3TX1+0HICRy9IYxFqSOtMYPhbDQX?=
 =?us-ascii?Q?9VlrXbLT3H4Dp7PQlJ/JDpDROSUiPWBR1vV6Cfly7TgY19oZccT0bZAVLtF7?=
 =?us-ascii?Q?BIZG2eTgDojC4ltPxTi4h5f7BV5XqHKXJfIg8iC0K/sJKxph1sQF9V4S85aM?=
 =?us-ascii?Q?I0UV29siD+dHydsJeMA1Ik5sAx5GL8fAQ0D1x0coR1hQA19S2WiQBoihck9S?=
 =?us-ascii?Q?aVeHF+DE8CWqxh26KIY=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:59:05.0572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd9049c-9087-4d26-3d05-08de2cf3f627
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 13:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122079

From: Pavel Zhukov <pavel@zhukoff.net>

Don't require it for entire distro if pdf package config disabled.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f22451b51bf668fbbf27b50744786c64316ef700)
Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-=
graphics/fbida/fbida_git.bb
index 247a1fcbb2..6c06748499 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -26,7 +26,7 @@ S =3D "${WORKDIR}/git"
 inherit meson pkgconfig features_check
=20
 # Depends on libepoxy
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'pdf',=
 'opengl', '', d)}"
=20
 PACKAGECONFIG ??=3D "gif png pdf"
 PACKAGECONFIG[gif] =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
--=20
2.43.0


