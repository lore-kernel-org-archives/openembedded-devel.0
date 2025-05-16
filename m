Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17362C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 08:57:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.134])
 by mx.groups.io with SMTP id smtpd.web11.8861.1747385864512831093
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 01:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=aB2eBLFb;
 spf=pass (domain: gomspace.com, ip: 40.107.104.134, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sob4ywuI2hawFydI8gOi89meDQeAO7iRVVyQ348xQUXSM2uDF3IEBe0/jHp0QndEx+jYVcsqW045ix3A92fYxJD1WmofE0iOIrcHDA22W6TLZIzn55LPCPagJYwXbbornyTtc1H7rQYKP9BkxvDy1fPPoT1dKS36igYdRFztUEAIwaK5XK0OKAlB5Y3cxh4Ymv1CgBdJV6CCeoh5+gPwVCtsfDz70bXj4qA5ZoppUnl4DCBnHvL2OKidnZBCEIRh7Y8kLk9zPUBRbgK3NpF/0VE+j7ajN5r4zGbBA8uve8tlj3Q9JnVWfJP+Vp91HGUsLgISS9E4G4or2BNmZS122A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdAxh2D9x1czJ0lgPZMkKd/yLU2RhrxprhBJKBMF+34=;
 b=jCGWeGijC+X3cC3gBIGaW6u4fd2Alm9gKOjTmR3xOpK8LemkXVmw+1kNow9V48OS5zbL7DBm8lN/IfeclKjORmoqeMGkxDBpe8ZME7ntcSgk86DXuwnRvPwvF2+fWoVv6NzeImEdDRQogKvjMJXNSt/6a/RogzhukkFgIuNP1Or70rMDwF0nBvU/M98L0KFWoukKp55u/0FXfurVw9PVbV6L6n5LGZOof2FbU+93ujcP4pmj5l0JJhkkkOKpOBCZg4TqoKsdeJrXMQup1lcggYgah1SDnlKsYsritUQuDbcz7HhYI9zJ5TQg890XXyuSNErpK1eaybp5rLKp68ZYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdAxh2D9x1czJ0lgPZMkKd/yLU2RhrxprhBJKBMF+34=;
 b=aB2eBLFbqlCLQfFxegOzXZ8RiNz7B3/fB5WFcekdN0Tgb2qqOjvoZzboUEOp64JTrApTjsRGNeLOJxtRIMMNVOf7leJmM6PX6aWu90HsJJ7pXPN9BbECSMa2X8RnT/bJn19eW5w7cy46y+fnzZ45rawuTWPpmRxTuAggAWKYr2Y=
Received: from DU6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::25)
 by DB9PR08MB9466.eurprd08.prod.outlook.com (2603:10a6:10:458::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 08:57:40 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::5) by DU6P191CA0025.outlook.office365.com
 (2603:10a6:10:53f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 08:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 16 May 2025 08:57:39 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 16 May 2025 10:57:38 +0200
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1748.24 via Frontend
 Transport; Fri, 16 May 2025 10:57:38 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] libiio: update to version 0.26
Date: Fri, 16 May 2025 10:57:35 +0200
Message-ID: <20250516085735.2032481-1-mns@gomspace.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|DB9PR08MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: a03668af-8e13-4b8d-8797-08dd9457b5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DxXzFRQQG5/Lrk/hsCLtc0i9SCstIyw6yDoVpdHChIGuZpFRqowTMeu78aVE?=
 =?us-ascii?Q?GBme/3QOs6WlfEuUeTk2COu3lCeqSWYRvnpUz7d+2ROgJ37c70DFEAJ72ZYL?=
 =?us-ascii?Q?anFOJ+JEp3pVIzGTLJb3ncEqNRov53chjZv+Yib2qpRrtJvOjEeOYIFUuY/G?=
 =?us-ascii?Q?A9LF0k7XlZEfncHPbN3F6oRZq8889fOOr1Wzdsy2Ae41QP5nv84473Scw6yT?=
 =?us-ascii?Q?hh1UylvlMQXmSTHKKs8BQr9Eck2+uUWWo2YQTFtqStTAGgMAiKyNhUIpCZl7?=
 =?us-ascii?Q?ZiJjT3qQsGOWEzQD+xrvieo+Bm2gQP/f4wJvam/sdiAH+v5RPZncYQLb3aQ2?=
 =?us-ascii?Q?IalsCEWzcwv6/A1FwFlAUfWZO7Eo0omU6if9cFAclnP9gD2O/E0rbSihAP57?=
 =?us-ascii?Q?KozGX7tTa64uGE2DWp4gTqaJIV4KZpSe7YyymrCkdXWjibLAABVQMpNVK3/Y?=
 =?us-ascii?Q?2aaT92w7b8fiDDYRMh111+CGoFEu37Z01rMCjc167zVewUO0Vwka1VwbdCMJ?=
 =?us-ascii?Q?A/QIImtezUwLxSj5ft/Hiut7YY0VJ15PdeF0uQjeFqahQnj5ucdhen08r5KU?=
 =?us-ascii?Q?ZBZIlBp9pxX6jalxSzaOBrixH6JQIQVqwZ7OF1ikMw1YCcRPFguZQ20afQVW?=
 =?us-ascii?Q?Fp3K6N6meBiC9MSbNGK7SH4zMh8DJvqDrkqLYFVP/Te8qXIFfvu9DuTvAl4T?=
 =?us-ascii?Q?tK2EtMqLwzkribQiotOj6wSdGjfTHufLIpIe1Nlt81VVmT2IS+CC2RB9fKbC?=
 =?us-ascii?Q?QfjB4N+4ehl0Gdr/20CsGlZE3mgCauoZCd+0nmVmoBEdjCLMs6qkPEHcyuUo?=
 =?us-ascii?Q?Gw8MAtVq5trLfvRojNG2MYX3EHqj5cuYlH9/4LipngbGz4gTkrgpkxDEjP9e?=
 =?us-ascii?Q?3vvWrFB899eJjlsICFvQ6y1i9eLIaH8ODYRZvmpP4GNJ/HVDme7jjg+6u83G?=
 =?us-ascii?Q?G9I1IDCe+2ofAmbsdzGAZCW/MQkoE3gkgFsh1aLle4c5SJbJHgPPoHSR6FF/?=
 =?us-ascii?Q?TFBU3s0Fg8uZgxoDz2I6YM+49GTstFCAiRnszC4FLkuH1u+GH/keZFURmlEG?=
 =?us-ascii?Q?DObh6q6/ExF66MKFKChEzP6hDuzjL7F+O1gNHS5JHkeinpnrQtW894+3gzRX?=
 =?us-ascii?Q?EVLPYF5iw8HIlsasudyzdFkne1na3aakr0QcbdvptZYp/nTZe8mOCrdDqbe1?=
 =?us-ascii?Q?ePgMXBykWZflH0gwQ6cLxjCBUwGjHZ7x9bum914SEcF+L7A13x56lWhdRqdU?=
 =?us-ascii?Q?RD5aF38aRYG0moyRFTmCQg1OPpjjgL3i5Pn7cctyf4IMk7C4/RtWrliEubIH?=
 =?us-ascii?Q?0OdvjgeZ3sB3HsqFx/sGYQIAGEJyRdj9QkTQMYseE443O/6NpBVLoyQfnx5F?=
 =?us-ascii?Q?4t0kcTLd/XUO9hIttg76YwGwKdKKtaMegw0ARHTSf0HBIZtQCCBWVHyGV6uW?=
 =?us-ascii?Q?48wwejsO7NIyWyEDz+9R2cg2ZjOzYSVGdmq/JA4CuLoW8+2XaDUW73PpN0si?=
 =?us-ascii?Q?Ktu2JvoP+MjBqlTTrLhZoTnhgVPxUh7JE7q6?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 08:57:39.0463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a03668af-8e13-4b8d-8797-08dd9457b5e2
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9466
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 08:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117426

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 .../recipes-support/libiio/{libiio_0.25.bb =3D> libiio_0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libiio/{libiio_0.25.bb =3D> libiio_0.26.bb}=
 (97%)

diff --git a/meta-oe/recipes-support/libiio/libiio_0.25.bb b/meta-oe/recipe=
s-support/libiio/libiio_0.26.bb
similarity index 97%
rename from meta-oe/recipes-support/libiio/libiio_0.25.bb
rename to meta-oe/recipes-support/libiio/libiio_0.26.bb
index 2c6d2b5145..e8e6d5f683 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.25.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
@@ -4,9 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a1b=
3a72c"
=20
-SRCREV =3D "b6028fdeef888ab45f7c1dd6e4ed9480ae4b55e3"
+SRCREV =3D "a0eca0d2bf10326506fb762f0eec14255b27bef5"
=20
-SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmain"
+SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dlibiio-v0"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.2


