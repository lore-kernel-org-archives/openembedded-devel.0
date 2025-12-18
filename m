Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F89D6ACD7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:22:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.96])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37947.1766049766869407252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=JhaazrPM;
 spf=pass (domain: phytec.de, ip: 40.107.162.96, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNlafqstIecBFwM0Lf2n28qeZLvhi6l3yqRqJHoyJvR+rqAllDXvabfX3+YPEEYRykKpQA3XyIRQOY7AbGrur4P0cHJe87QoFpvyw4CEfVGafO/f+ReBh2ag5pFGwJzMdS9C4lVzIR18N6RuQoa0VCmSkkF5aE8NauDxHqw5EckSniBPa4uzW/eAcUseDXBnL2bI5yNsf7QsdZSLaXSrWQvXr/4g5H0ty0XcTWF/JmpWFsUdOix7tGRzghX9wUC4DdGOC/ta8/lfjs6YnBs1hmcydTqnDHOutiiDfMyJ8wErtvbW6kwftCJeb6R4eg/6brwbclQGhoaMln+kpwigfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNXLHQd6Lml6PGPD17axGQikbOxqW0L3V9A8oKR4+44=;
 b=TEQLUwBrHIMy6EAQEeNNZqpkq7vscDP6qk3VF1kZCvqbkKJCHB0hbUmC2hlHUKCmi1nQsrjSsI2zObilPKrhutxnMip32D6Rf4RO3tYM1M67ZH8t7CaolV23ElL/i7YlsVTN6rfya7uWcp62Bye5bjgsNz1s01N6UZujLETmIy+VWP1UymIfb+Ot3yXiqLBmICwLdf+DRS/xgKn7DS8u9KuIjen9JsPXcpqYeCvJ9OGunKNyKf5rlN1NFF2/1j8+g4WAJOFDwHISHG6weWaNigG5goQ22IodzWwGXFhysXeZVnCrbEyUzSMNPSu26Q0inW9g29rtu6KmgmHtx+KMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNXLHQd6Lml6PGPD17axGQikbOxqW0L3V9A8oKR4+44=;
 b=JhaazrPMVXmJy16LPVIvHwI9hquIdyCgChZ+/8K0qlyFnNlDc9K1tcTEQOdBdK7NtOjh5vZo+ksm2uMjhyvrLVQSAKjGB7Law6pc0JoDqmEkNitumeo0G03f1Xtj6mRGjFJuDi2O1NxrsMEdpjHSD3Ar3P8gO056cas//Ty9qSOX6sG+Z7HGHS8VsKdC4NDBadtif+EFtXHkKbvu4UDPBcN/19rcrauKHTfsesGK9zma9pIXWK0XWF6kpELiRvNNWovDcPVRuYL9r5Ua7BzYw9UpcIzR8ADHuhCHCQyX1XmrDNj/ZIJwXE/+lsxkqGJfnUPv2eZTjuntAeGHxSi6Vw==
Received: from AM6PR0202CA0056.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::33) by VI0P195MB2763.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 09:22:39 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::72) by AM6PR0202CA0056.outlook.office365.com
 (2603:10a6:20b:3a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 09:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 09:22:39 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 18 Dec
 2025 10:22:39 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] thingsboard-gateway: upgrade 3.7.4 -> 3.8.0
Date: Thu, 18 Dec 2025 10:22:29 +0100
Message-ID: <20251218092229.892449-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|VI0P195MB2763:EE_
X-MS-Office365-Filtering-Correlation-Id: e88c194c-6bcf-4b8d-2a4a-08de3e16fd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ckLiCuDElijEap862w6WEYaDJlm/P+iO+3/9h1s4F3cHtol0Y+a2si32m6gt?=
 =?us-ascii?Q?KFWLDgYegR1DCmhVq5tkXkOhyCtEwza7S8KLFFukYXlEv94k5BVludHpcNJ8?=
 =?us-ascii?Q?gwcTLEfbfKa/0XG8CCmwHYL+blBCwMnBsj3aDdyvh4umY+xZBhJy2VyGYe/a?=
 =?us-ascii?Q?0MslSEayfclmLo7pr3fB3J6RGSMXtkNLZlEIV81Ewy4sfVpDHY1BUA28VDyV?=
 =?us-ascii?Q?Apd0+hKoykAy8v2psYeGFVqgdKpv35V3WdSgWYWAjnh+O9tHYUn7wc5dKgZb?=
 =?us-ascii?Q?mx0dSEHW4x+4TvvVdjCSnJYwKHNCyGE6mMHRp1PsD1ZrWLGwbD+x7AHsEoER?=
 =?us-ascii?Q?HM/hH7UcYBsWyuKJWV4rjtPQofX90TKupNhjFu79w7OxxqW5AHQzxvArY0xN?=
 =?us-ascii?Q?t7hsGs9L4ndKAY+iXYVUWo0n4592HuDfcrbLREvVlQgekUZzBeFsFdDi2o5l?=
 =?us-ascii?Q?aeLykOCLSAYdh7TlOtX9rmxSjVR0aFdXXWHaPvLRx4crJ/wuvqWjb415Kveu?=
 =?us-ascii?Q?h9/4Lp8Dma2dVzC+hjE6AEVQ+y8QahmVpzrgkY8ZzDsXCZFBJzHbIYnqeKCX?=
 =?us-ascii?Q?haEdOPK+fYFiihD9tfSHNYVBuprI16fqF7T3Xiw+Y7TihaD5tpkykcX8rNxl?=
 =?us-ascii?Q?Or9Z98RaG25IR8A+Jl5EktxOq33t2eNh4eujDVfbMzExruCL8pdRnOdZYq17?=
 =?us-ascii?Q?4gX2qozUNQ1cyqnzYKHHaTu0CRpWNMyPkm+5eb19YL7a5DvEi3MMYvvXzwO4?=
 =?us-ascii?Q?CBTuSEMcT3gWPK7S1guNQ6mdHHFNBrG/mMSimfJJ1c7yIC4tEMIAlY8vzpi/?=
 =?us-ascii?Q?HMlW/DUIvGfvGyomD58NKqiVUrQMCEqPt1jI9ubSzhJ+rd2HglnZULG18yX+?=
 =?us-ascii?Q?CzS7jCjntS6+QvWuOm+mIe9F/zFzrF4mfk2xpWZ3MGphpiewALR3Ei3/p0ww?=
 =?us-ascii?Q?l5Zlrm56qpUN1yw7YYIgL3slwvbsg2iVcZ0dLnhEFObuW4r68/RS5rLdGCp1?=
 =?us-ascii?Q?1rzlCOFr6x+DzGfz3Yha/RHInsMlCz38XeG3jBxb92NaQvtUBBUfRlwyN2EF?=
 =?us-ascii?Q?hCXx7Ki2UOct0JTVCnk4syCk2tKSadsObUfC4pZS3YUEFU6OsVqFgQ4//GvC?=
 =?us-ascii?Q?//4ajkeN/saY6pvg8KsFGyuD37CXbsWF9Kkn5glY02FnK+jxcSMYK7X0LMur?=
 =?us-ascii?Q?Ktj9I8TmfwSqqEzqgRElkL4A6PYxvBa1HtzsObwP90NKzgvGBPfaN9EOBHwv?=
 =?us-ascii?Q?29M9c6Xd/9il4rlopYbatqsjuMDdXXzQz9keGOWEZAB0rwU5eHn9RGf8vu7v?=
 =?us-ascii?Q?+BgZoDZIRcpIMQeszsd23J3qsyxE8pE3DlDjW4BmaBNVsHC0z+Cp+MfXcvmi?=
 =?us-ascii?Q?9hhp0tdhQ0CMsm0BS6DxQ6QsxuoNzoIAG9C14uKWUElpVHkkloKuzMuXOWTn?=
 =?us-ascii?Q?KQMgJdURLI3M4KtWovJfII8KgOo/lw1ryhJcEL3SBSxmVku6qB8nhFhGjXKE?=
 =?us-ascii?Q?fLGtMi2XvBXjQAU=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 09:22:39.5948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88c194c-6bcf-4b8d-2a4a-08de3e16fd7f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2763
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122755

With thingsboard-gateway 3.8.0, the source URI must be set to the
project Git repository, as source releases are no longer provided via
PyPi for this project.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - added tag to PYPI_SRC_URI
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
index 7a82414937..3398ad9361 100644
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
nch=3Dmaster;tag=3D${PV}"
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


