Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB58CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 15:08:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20068.1762268881906445912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 07:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=mVyuCR4y;
 spf=pass (domain: phytec.de, ip: 40.107.130.141, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAkHGJriWKyFxpmYXLxDLKvgGSqPtwXApah7jIvU8qz/rtARgY67DyjoRxg8/J/nk2A2Ub6AHvBMjCAw/9UXEK2oNUq8RcHoIAMA+ApifquuWfr14uM01EAdVQZvVeI+XGB6F5voVu7QNIitmR6k4ZibluS7AfwC3F1cvJR2c8kCvwOQ7qhZgPqsfmJHj/lRv73zEv5myn29kFLrCCLG39bsQ5FywlXeyFAuZJjMyHiSWn+sQzYnNhpH6w+vYVYMT+iudNsysDbA/FGlJlyVhCchUtd3F1UG3X3JeaiSJ+lvN+8QELzERi1iNFwNMKucUCZGny5y1ckCOC+5c6kphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlHvqc0RoqsUnRt4rCC3PQlk/8o11DCgwCMB80DGSIs=;
 b=u0AarooHTwdwXI5bhDk8eyiV/s9QZBS3mHvpINDno7wQn7U/qkFf4ItnSrg5wjNKsbTBr6gg0odK7ljUCkecv7R2pTfj8InkWiSsqIWVNxHLz2kdxSoDNfdAqWCx3HKKosZupT22TfyMdvlQKfEXLHh91s89mYGvtmojpO975Vji236fh/KMyckqiWUQSsZatstDsmUzElEG9pHFlQFXlM6t/H6jm4Znxf4uAyyJbXT8J64sNZe1koqOfGzY+IupWBnWwa3leICSTuVCwQ9WDzT5HzmuK0sRZt9AmU+YBryumZIqMdTqihAepbopxoeZ2vC5PhV/g4237eE7ECjMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlHvqc0RoqsUnRt4rCC3PQlk/8o11DCgwCMB80DGSIs=;
 b=mVyuCR4yQ0nUDEuq8yXqeeQ6B1qBgd+R/WIg00K+ur42OX02JGbJqmTQ+lPPulONG7axbm25H42LX5yunCVdbaJDouj8dhIbi7P0pySsNPhsK1nl5dkERl4DxT6HdpXFd+cSN5hjzqgbEyjgtuH6cfR4IQW5dqUfPHfPVtTQ4dU7KF9AO0paKpiLIljeqSePdGlTWTuCoCpijvHJksRl7aJyruTn29Ck1wCDhzu9rbqlzvxCVlgY1CrjnnUS4BeXxSlU0X31nP1l/08LKMMct0RbHgBWhkPabrac3/9h9XauuB2Q06ZbPuVc2vwRymXL3fxmqp0Nv9+baXCkHP3FBg==
Received: from DB3PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:8:1::27) by
 DU7PPFDEB1C1F40.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::be9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 15:07:55 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::42) by DB3PR06CA0014.outlook.office365.com
 (2603:10a6:8:1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 15:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 15:07:55 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 4 Nov
 2025 16:07:55 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][scarthgap][PATCH] kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS
Date: Tue, 4 Nov 2025 16:07:40 +0100
Message-ID: <20251104150740.3863983-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|DU7PPFDEB1C1F40:EE_
X-MS-Office365-Filtering-Correlation-Id: 96de05da-cac4-4461-8bdb-08de1bb3ef00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bnmtz4XMlpRKmUVa6+XZjIkp21lbQsWy7Ev4zRdteERLjOZB9vbK1zLcLA+7?=
 =?us-ascii?Q?87IL0ygez3t8hQQ4ToSs4rGrSEVOIFL9Zg0Wa1zM0cOTW2s+coXvDJeZU8bx?=
 =?us-ascii?Q?XiA+aum8vCEgTrYjp0k7Hzndy4Ou1ayMPV7JUOROK55rJ71HzCYgmqqe4Z9s?=
 =?us-ascii?Q?uSZIRAI4w5r9cSZLhjqud3ztKHdvF0C2sKzJAlb80R4VVdfuu4tDo0c0yGEX?=
 =?us-ascii?Q?324xpQdvkHD4a2YlWs9ncKRxEs/tw7pgQD0NZYIUcWaD/40+f6TWJYs8Tgd6?=
 =?us-ascii?Q?Y3Miyp+dwTVUjmfHsH06q58nCxEBbk9PKEz0xDH5GgTJnzrAdHwtjRid13d1?=
 =?us-ascii?Q?IgUJpGvqV8rmNpJBeTQmKHG0LIqdSd174+Dvo7t5rHr34svSF1ONTOXXL5ny?=
 =?us-ascii?Q?D7B6+awHcQDhjwbE29SExbwiFYC69SChiJkUZmLCUlLdDmZZFCPmuofBHdK9?=
 =?us-ascii?Q?Diw+kCuL+qcCJBQjn25UbSQqy1O1wth1hxsm4kA1vIASRTV1/2nJxpE6NWGi?=
 =?us-ascii?Q?0+bMsGluk6CaIqKEGG1kc9R41U/EuUwG1f5J/NUnfArZY4PZixwfwPUsnysA?=
 =?us-ascii?Q?hbUn+5X0bn3g1c7K5aPVtExbMSNdlrlowIcncKzG5Hk0aHjEiRbdWDC/bfkS?=
 =?us-ascii?Q?VTB9JDn/HzdpYziojrEGp15Q1DqfJlH+dkNewZE4oZMlTbpbzKg5lTif6jBz?=
 =?us-ascii?Q?EVf6NuctB62eRB5FbamuSEeOV+OS3ZGt/SQyeJM486Evb3VmsK/Xcag4DCHs?=
 =?us-ascii?Q?9ImD361+MZAFAkfjpBGf4O4PbIVcyokrj7CCqacltLJN5H3EKK3xPwZEAzhF?=
 =?us-ascii?Q?LFjBiq3Tn/OA2vwPFIEpQnqJUcGULcaen3RJglzNSJ4h67kUmxilVxzRY5pM?=
 =?us-ascii?Q?6QTH33e/f1kaijzbNmVFtY9noI4GPs3WQkX9nDuIvAvCA1snl0bunCB0mwbi?=
 =?us-ascii?Q?UM6d1XzRvFJntBZhbs4OF5uq/rkHc4hKx5tdK3gqSUTBArZJ1kHhZ+x+1trz?=
 =?us-ascii?Q?pW/uejWpq40CcnlOa6nWterXZih/pgFGOMwIqUyZxAmha2kx0Epw+aIR4jwN?=
 =?us-ascii?Q?X7sDitO7jAmj2jMtOv6rooJYD3vI/aptLOtPCx2oV1laQWD+0oUvMXhWKQzy?=
 =?us-ascii?Q?s/mhGjcz/gU2rN2jXGxUT31+YmclPVy6N+plQHg3LGnaIzrhmvdx0J+vMIbJ?=
 =?us-ascii?Q?vFTUhEvVSB8pSxVciblrtS49QgwfiSa3eJG6QNUny+06CLGRZNAJwIfekiMn?=
 =?us-ascii?Q?If6SsafGyC8Lrm9TUNUWAviINTLrYJXwmsOlQ3vxoZjuY88uImj0j9Tfj5Vd?=
 =?us-ascii?Q?s3m+wqfK3kQQD2X7BJ6dDjQs8+oK5iB5dU/NRgnWeUKiMCQ5OGztVFbicIlp?=
 =?us-ascii?Q?d1wpzAhEuKA1+qx0EM1cHAi1l+NDvgAr/8zW+xRk/3Ht+rmP9svkjyKGiiIU?=
 =?us-ascii?Q?skYrHD0XGQ16Xp0ybf1WKVc1vbLE8NNJMNKkD65zKvTKGWMIq5nfErPME+R3?=
 =?us-ascii?Q?45a58mJbaIxKlmwaTGooReDDm5UUXm8I+QVmNV/+x+QQGrW4LlcdqRiIgrB0?=
 =?us-ascii?Q?MLV2FM7l9UOZgjUabaI=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:07:55.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96de05da-cac4-4461-8bdb-08de1bb3ef00
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFDEB1C1F40
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 15:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121297

Fetch the needed Git tag by using BB_GIT_SHALLOW_EXTRA_REFS. This fixes
the following autotools configuration error:

| build-aux/git-version-gen: WARNING: .gitarchivever doesn't contain valid =
version tag
| build-aux/git-version-gen: ERROR: Can't find valid version. Please use va=
lid git repository, released tarball or version tagged archive
| configure.ac:22: error: AC_INIT should be called with package and version=
 arguments

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb b=
/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
index cbd5e7a0fdf..06807bef47f 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
@@ -16,6 +16,8 @@ SRC_URI =3D "git://github.com/kronosnet/kronosnet;protoco=
l=3Dhttps;branch=3Dstable1 \
            file://0001-links.c-Fix-build-with-gcc-12.patch \
            "
=20
+BB_GIT_SHALLOW_EXTRA_REFS =3D "refs/tags/v${PV}"
+
 UPSTREAM_CHECK_URI =3D "https://github.com/kronosnet/kronosnet/releases"
=20
 inherit autotools pkgconfig
--=20
2.25.1


