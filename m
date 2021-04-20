Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.92.41.91])
 by mx.groups.io with SMTP id smtpd.web12.6478.1618898110011094809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 22:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=JMie6SBf;
 spf=pass (domain: hotmail.com, ip: 40.92.41.91, mailfrom: mitch_dz@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib//CUf8SaQPfz4CxbUtF74CEXCIj08Qg7ePxqN+eppQNIFsqr6df2ox88TNl4tfpz8Ct+o2G+jtP1vNqcSTj3rH03JUy0oaxkR3CqSwRGlAbGk5gHvdDtgRrqUyr4BcheFCtCy3piXT27yvh2SpHtpfPH3XI3z9IeJVtQhGxpCoSSpMIKPDSpvFd5lQ/7hCvP+vL5P2jCaiL5ALpclH1BFfk+tLPVwPY2wfKUptFmmKXxDbMSFGVz8mNkUFRRrqBEJtxtXGaUF0CRcTSdUbZKdo+72lf01YXumaWeHwHQSm0RnSUBSHZ4GajRjPb1xeie2DA1UcxrG5OtLdgriHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EZel42xB5p5roscCcLEckqvYxDPeVp4RZyT9H9RVAE=;
 b=N5MSDWNF5slPvUhgSDQtDqr36eaGPE167smCSphHM2vAVyC7AEaazNgi0V5oTJZy62RtR5pzG+gpn41n+dwSDQXjH5xTN/OLl+vXqgYGzkNRUQGgppw0jNBsak52UxLXVhihMd30Ay3Suvb89GKOiMoVLCfG1ty5ztOaschaaOVyEZyulo/0WrHS9E6r/JWET5dscYyzN8Zkpe8VdTIzSWrJeotOqXFTEPcCFgQ8dvDB+C8a94xH8NHY7hxrJdJ2C97TS4xdnKTzYmuBqhlYJWC1hL+l0dVza51i6YoTNVo+i0vreGpQ0Z0Ypvs1/wTbDI23Jgoj+7gQIHZ3cKRwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EZel42xB5p5roscCcLEckqvYxDPeVp4RZyT9H9RVAE=;
 b=JMie6SBfvpe4/lY3qhTMQ1qN3ULKQTRh4hEQYnb17pD6WUlYhZSR4ASZj0n1HJSi66NfxYJzwdBWFjh2miMm/Hi4PurJI/f/fQMoSVAnDMxlvRpjxPbsR2ej6gwbA4gfJnaVP+6cE5AK57AszlRTgjkO00Zb8UB5WQTiZpnt6HdFxCuB5WXgvAEbD+tqaFO6BdOJuDEXePrxFp9y8KeOMA0A3I6uvY/+0JQ4O0gW2i3Sf/Re1NNh4b/9tg6cAxoJj1al9eeFrj2+y/mRfbZY0qxhvoiFE+X0Tl7WEzjUlQowzUm7UjCq4XV7+l3tXMe30MSvk/QDekOxtErPZCzeWA==
Received: from DM6NAM10FT028.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::4b) by
 DM6NAM10HT191.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::205)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 05:55:08 +0000
Received: from BYAPR04MB5208.namprd04.prod.outlook.com
 (2a01:111:e400:7e86::42) by DM6NAM10FT028.mail.protection.outlook.com
 (2a01:111:e400:7e86::240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Tue, 20 Apr 2021 05:55:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9BA12B742E487C2373525B43B28C1E8B53879F6C290B3AD88B44D38804090749;UpperCasedChecksum:128457EC689E814A3A4DB26A15702482F6F50307292CC99D4D30FF46B046F501;SizeAsReceived:7271;Count:45
Received: from BYAPR04MB5208.namprd04.prod.outlook.com
 ([fe80::185:fb9c:3187:8382]) by BYAPR04MB5208.namprd04.prod.outlook.com
 ([fe80::185:fb9c:3187:8382%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 05:55:08 +0000
From: mitch_dz@hotmail.com
To: openembedded-devel@lists.openembedded.org
CC: mitchdz <mitch_dz@hotmail.com>
Subject: [PATCH] understand-autobuilder: fix small typo
Date: Mon, 19 Apr 2021 22:54:33 -0700
Message-ID: <BYAPR04MB52088E8EDE6C00899D783BD2F5489@BYAPR04MB5208.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.27.0
X-TMN: [cT2SVursnMEurURH4phhO58nThLCMRUw]
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To BYAPR04MB5208.namprd04.prod.outlook.com
 (2603:10b6:a03:c3::17)
Return-Path: mitch_dz@hotmail.com
X-Microsoft-Original-Message-ID: <20210420055433.1155698-1-mitch_dz@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from light.localdomain (68.106.20.65) by BYAPR03CA0009.namprd03.prod.outlook.com (2603:10b6:a02:a8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 05:55:08 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9d082ad0-1393-4919-9ebc-08d903c0da5f
X-MS-Exchange-SLBlob-MailProps: 
	0RSV28T7LqRqj+ZmLEmwpgDcwgYvRzWJSEC9nB05KuUsU0hQP+VlrrmFOs6HHj6y3LfkiRCQcO2aNOGwRzc+3WE0bKpYtmGXP96sP1SCXmEstzgDFTzWveHLOWgh936UIzjur9nDtqTg+eWCNOoifLC8AxvsRCvDEZY5IZdPRIgda0E1cjb1ODqBfxRDRU5ugMHj3PI2YKYPAQ9FBtz37ixG6qPqCxHpYmGbvJ+7pVBQ7NLbvvc1L5t3m/1M7L84xBXBwv1OsdbBk5xNkgpTkQHzp+fLjVyP0rpMN0cfavOUV+bEe0/ITJ+kmPwjazY3kmCz768xLjMB4OzgHF9Ua6+jH++nQsiVUyCbx39gqnr2E07k1wSgnanQMK8lSjQ7gPQu6jObLXetzeIWGOYmZW4vg3QR9vIP7UMXdRjJl0KEyVzZgbIHBsMUc/iEGCwTR2UyAia6qLRNalSazgg2yN5HG5jL2LzFpb91Yb4X5tyEWEH7JMkhk138xlX/GQeYBWkKoNmmLg0RwY3EOzb5kfS1Of9OQQnP19pnTh/vmkQKaQQi97y/YiPWEYKFXFUVx+Vfuc4kD6oxSAvfVTi9PSdNZcfsnYIGNdm4PhrTxBwje/DEqtxd+7qw+g0z2Yj3FyJJNTc8sWmWXMDfb6RkoJg1I6saXJx8wqNB8EXAFklKeM0aE9fLMSEc5bFaYLjB
X-MS-TrafficTypeDiagnostic: DM6NAM10HT191:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5xCgfDsk8/vgN2zSuITlx7fBgIPBSbkgkkMUkUI2juTBfMK6MCLTE0gXsQoWQKJW7/hrrMZgCYdILwXiNwslamRpZq/sypr1zDy5FvkyTdqARh9r0D1pEg02e4HDzOJu/Edn0f1VL4RbouIEuo56Kp1tWu0vtd/LLHqc9Nvx1oVOawK/+BqctDsEyzUECkUOzULV5ktjZfEqpI7398aoyL/RSaF533AXkrW5SH7kRI7xiE8jqXIvRJTI5bWgBC1h4mjsQPtjC2ViHZfxeW/L2xk90h5H5+iYWrGpVcSdlNP8FjHVyziQiLAL46XytD3Z9RfbA0DyBdT66XWC7YEZa2HDGoS3PqU162KDtXyB0QJVT/vOjFgo2X4u0ed/anAOD2he3+5POSzacqn5GVWm0A==
X-MS-Exchange-AntiSpam-MessageData: 
	Fcy5BOK9Twyl8BweQAih9KBNpq1qin/VNOBkMcedX4ymZEDnyvfJpijEUDqDIH+62ccm8k1ydXTiGtHFNtmbHuq44qG6UOY/RdJbT19NGovQ+dyZyxbpV9DO8ChK0/0MzKwT0TzNm3qPJZLUNm4R9g==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d082ad0-1393-4919-9ebc-08d903c0da5f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 05:55:08.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM10FT028.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT191
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The documentation has a small typo where it has
"wo" instead of "two".

Signed-off-by: mitchdz <mitch_dz@hotmail.com>
---
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documen=
tation/test-manual/understand-autobuilder.rst
index c158d9ce4..da17968bc 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -258,7 +258,7 @@ it is inevitable that users will end up needing to heav=
ily customise the
 ``yocto-autobuilder-helper`` repository, particularly the
 ``config.json`` file as they will want to define their own test matrix.
=20
-The Autobuilder supports wo customization options:
+The Autobuilder supports two customization options:
=20
 -  variable substitution
=20
--=20
2.27.0

