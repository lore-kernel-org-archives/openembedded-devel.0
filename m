Return-Path: <jeffrey.pautler@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66189E728CC
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 17:07:52 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.137])
 by mx.groups.io with SMTP id smtpd.web11.23258.1696007266230602979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 10:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=UsUZMKsX;
 spf=pass (domain: ni.com, ip: 40.107.96.137, mailfrom: jeffrey.pautler@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng+Yyr/aghAto2YAsANfQnzA7qIFgR25k0Cr81tj7d8JaH7/ONMq6tYGPYv2zk0I5anVOzHhACZ7CbQDteNcNCjSVGAXSTOdRsYQDowl3QjNB3dCaBQLzPm9wOnStab7x9Dc1p1JPK//mD40Rv00aureYA4bs2/EJ5UERIQeSjNBSkJbCSwFnSbC5Ehsq6Nceu6bgHv2w65+ghgEeAeio8vG0X46DdQnl+861lzmrSJGLO2fEO09I3JiOIlRyy3Zei0X3yFPBTCahrAimZy8Dl8mR5bx9Bb8tkzJvzbS/K4rFPcJCcBgDp0T3qCmKVgIsdSmwKgvasvoebEC5yUXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XZSPo+Itn9s0sjJE58sGPnU0ruGtAErgjFI7SeZL9g=;
 b=Msq/XjbN63tzalTzq78VR3DhMf819T6XtI3DglqLfYNqRzqZ8ExbqiKCkkcwgx5t9DddqIUiVW2A/aFCjgfIuAKPTOC/iGevTQzCRCEJYJkre1qWQmGqtAdoaClFsyevYTP6nuF4JuN6zFmczFmbX9e/9EgEbRjiCpeZUHuhG0Rrhfl7JhP4Z8cAOzZRNYrX8+zlUd0bM5BN0Ag6yaIhGy5EAuXkdm7jh8TLAi9y1l/+tOnzCDhye/pBGvuJ7EVCYR+1dzDqtKWNBqLrbajrDMxXwT3pG5jP8MU/CxrWKEVVitA275eM1uzapSAM36F6eVOpGoCJAjb9WaQnmGY4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XZSPo+Itn9s0sjJE58sGPnU0ruGtAErgjFI7SeZL9g=;
 b=UsUZMKsXTJfXlnQuYpusBzuUPAnmKwl3xB3MnebPmdD5Q2bX9M2rgBQq5papPfGrJjs6v2NiJbU/jqCZveLWGB/X+ABxaAFiEHXieJ+kzjE+OVkzASnhxxLUxszfuuZuUj4vAvtiQymizNLl4TvthFtCbar6rA9vrqKPwu9/0yM=
Received: from DM5PR08CA0053.namprd08.prod.outlook.com (2603:10b6:4:60::42) by
 MN2PR04MB6432.namprd04.prod.outlook.com (2603:10b6:208:1ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.12; Fri, 29 Sep
 2023 17:07:42 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::33) by DM5PR08CA0053.outlook.office365.com
 (2603:10b6:4:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 17:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 17:07:41 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 29 Sep 2023 12:07:40 -0500
Received: from jeff-mint.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 29 Sep 2023 12:07:40
 -0500
From: Jeffrey Pautler <jeffrey.pautler@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jeffrey Pautler <jeffrey.pautler@ni.com>
Subject: [PATCH] bolt: disable CVE checking for this recipe
Date: Fri, 29 Sep 2023 12:07:31 -0500
Message-ID: <20230929170731.749414-1-jeffrey.pautler@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN2PR04MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddef39a-9c1b-41a2-a688-08dbc10e9739
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6HN4DLfftdj4G+ulgSkwzsojONm7+Uihb2yYMISzswEAX2UmsljiO55LIGXZDSOz1tCJpZmJMuWVzuGW+Wjp7L3wXX86JWPflJXFY6ZudyeHgL7ktI1/A95wMUBDifx2C8u0+b+ez1Fi0NO9QzXtxpan5JyFGCi0xtEF+4O3fZvNxw11li3YXaOy3g6uEziRC+g7LMtooTosNd6SteQS7Z89Exvs4Fm/uzHp9rryPpa8x0vLLM8v41VuyGIs7FPrkXZl9kRCNKqm8IYVW/GkxgBy0sfxg3hTaQTke9az4L3ELMgz8cK0bwSWVR8micle3ViJXF5HIYJ9AseWggy9n19rx51Foi8efYNSEgAlCvsQsd78+X6IorKxjPhvJJWd8C0SIhGzsV7TWDjEFl7SeMO1cGkwHkep4FkAY1ZJ33qW6WTQpuYNK1tjPdN5InmnZ/I3YAAEUCT76cnUVWtM25g7Eok1gtEyarSrbQrlqTG+7LHQf79Vz9Kz3/b2EQF8m7e5iOlxfQ37uQUkBXY0b5eX6tk481YvXYP39iahuYsB3B3nMnFiVNMKJ3aS+A1PGYOwpnf50sjvcuStHl4Fo1Ab6i7w3DZAhliwSAUyjQrkj8/Zh3RYTTJzjrAEnP1FhzmxY5TFSUGT2aa7DfW0i64cO4JENvNefN2NOH9rGIcnote4f6pP1t9ev9bmIu+eAiostd/tLriW0QcKzcgDJEcJf7u3vS2eM9p/AqHt2iUs6TNDzwgyheeGp/rg/dsu2Kjl+BPd7Q9nLAke/ZgbEA==
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(1076003)(40460700003)(2616005)(6666004)(82740400003)(81166007)(356005)(86362001)(36860700001)(47076005)(36756003)(41300700001)(316002)(40480700001)(26005)(4744005)(336012)(44832011)(70586007)(70206006)(6916009)(2906002)(5660300002)(8936002)(4326008)(478600001)(8676002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 17:07:41.3272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddef39a-9c1b-41a2-a688-08dbc10e9739
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6432
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105252

This bolt product does not currently have an entry in the CVE database.
However, the default cve-check logic that maps recipes to products in
the CVE database is incorrectly matching this package to a different
bolt product made by bolt-cms. As a result, CVE checking incorrectly
reports CVEs for that product for this package.

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/b=
olt/bolt_0.9.5.bb
index b6ad6337c..583cc6378 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
@@ -12,6 +12,8 @@ SRCREV =3D "5a8a5866a847561566499847d46a97c612b4e6dd"
=20
 S =3D "${WORKDIR}/git"
=20
+CVE_CHECK_SKIP_RECIPE =3D "${PN}"
+
 inherit cmake pkgconfig meson features_check
=20
 FILES:${PN} +=3D "${datadir}/dbus-1/* \
--=20
2.34.1


