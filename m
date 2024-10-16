Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627A9D1AD47
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:35:16 +0000 (UTC)
Received: from mx-relay92-hz1.antispameurope.com (mx-relay92-hz1.antispameurope.com [94.100.133.92])
 by mx.groups.io with SMTP id smtpd.web10.19735.1729074915242026557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 03:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=FGEYERZu;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=T5g8OYGs;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=bvSC/B1v;
 spf=pass (domain: aerq.com, ip: 94.100.133.92, mailfrom: alban.bedel@aerq.com)
Received: from mail-vi1eur05lp2176.outbound.protection.outlook.com ([104.47.17.176]) by mx-relay92-hz1.antispameurope.com;
 Wed, 16 Oct 2024 12:35:13 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=IN1UmehUs3MyzTsDT5xRjmPJY1C4iZpmXY1HUPGTIXogPiPygRVDALOOwJC4zAz5MQ31lLT+bz5S/2eUzEwzj1bBb8VK9RenAaJPevP8gNUSwAd1UF5QDSWAyHEQeF/SiogqemSw+y0UcXNw2xSpOl0FJCicKQ6FPMAD8a0FGSnlWvPxy/2FUvbi7/4zLR/kouUjlhEnJ8ppbYEROTt1Rrsc6PFto5PRLvNFaOu9mA5227awYjKtCgbV8LZAVQvszrg7SKpk4XVJ3TT7+1Gj99J85MkvEyG4CrXCMqmRhOS4aAa/idSPim/llMNK55VBFNZwMwpoTOTZG2bT66wY4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsqdNEoK5QZeXtNKEV+z9dBTQm57Tss65YhIvIe8zso=;
 b=EfMU+V0teeRITkRIofNVEUXAuTf49wH03xzYGn0C2+YgVKzseKI8hAxHpI75Q9EVB7JIuTFh2IIgN5oH+NreEQ4w5G37vGGSyxhoQBm8kTD8QTm42GB2GOf+ViJfC9YNHzBu0PRS5Q+C+DmlBPrHWDCjubR/gYT7o8g5UoF2TS0ptIiEAa68a4+1kkwswlYvOwwTQEzHiCuDf3zF6Cj7AFSayd/v9F4ld5e0b78pjXxFjKhiqlbLs2wWuEmjEzl9hgRic/V7rLm+WTwrDtvoXldlO9o0OtuCy/C77jjFNvECuzL2g9pjeyZQcMjDML8J+ZrSLTeEmjySBVKX7Ik5tQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsqdNEoK5QZeXtNKEV+z9dBTQm57Tss65YhIvIe8zso=;
 b=FGEYERZuhcbiIYRxb4NSFXWIAxmNPanWGECKBbOf1vrCFw+G4L1tiMNn5g3yB/VehzuLhdpZ96qum9G/AdSPq+RI4Se3EL3J4wJUAnAaxPRyNSIBElNlm33PfyLqffSqtX/02ehc7oHPr5cg5UGefBD2yeCvJk7j+xeUHVX9QhY=
Received: from AS4PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::19)
 by DU0PR10MB7335.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 16 Oct
 2024 10:35:03 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::2e) by AS4PR10CA0019.outlook.office365.com
 (2603:10a6:20b:5d8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Wed, 16 Oct 2024 10:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 52.169.0.179 as permitted sender)
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.1 via Frontend Transport; Wed, 16 Oct 2024 10:35:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.110)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Wed, 16 Oct 2024 10:35:02
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 7042377
X-ExclaimerImprintLatency: 741647
X-ExclaimerImprintAction: 1efa5540141c4dcdb0d1040afb7f1f0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDqgICIJW3uiffRH2DW0hnF+2inLoL5qsOyrFBqGDZdVffnEyYWYzqofHnHXbYFn92I3rOfx6xrEwCX/Ghmp2/0YbMiIbbkg7Bu7hyUcUvX84JAJ8AC/kH1iV5h4lfP/iQc15IZfPJGMZlDRgpvOa5QLrrew1BYxmBRdPNpE3NGCJVzaSO1s3TkdBzxyDteoAG+HBD2+6XD4vnmVwcSDKnDTEOAMSTNnG6MVMicRhOmWjCIeeUBsxeQTssoJ2i8IZVUUkqe9zCraRyL4w78AAcqcqS4OplwafY14PpuxRvIXqWUyd/wxcD4Lcq0wrX5Ojk1ibH7DP6wohxwyKOCNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5P9Cqv/Jlhgjizl0sEctldtAmz2J/Xa9YJP4N3M0DE=;
 b=D7grhZknbUjklLLYIEXAvRY8ZNhpGfrU3vFqFyOOGiJyhZrec5MhJMnMyg3+jbR8bRqqODUD3fM28m38ftOsa6uka3IIjJFIe+z5mnaIztwlW9qLeC8K2QyBfrGqRMV5xmAj4+Al2HQ3WiG1YtTrQvQ+OLUSuhC+g4b0XgmqLf3Ulqyg16KVLSbeceEDe8+WfqUsL6JVldwSvMfqmOCglTLrNblKJoos3ApTIrMt87Lz1taOL6/GbBFb9vkgDOSy2mn2ZxiJcOjhhi+bT9r4e/zuCioSC4sb/kMM/7aPfsTWy0mYEFGWBZZ37czQCXriADxVUI+1Ed0VksXLQYzeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5P9Cqv/Jlhgjizl0sEctldtAmz2J/Xa9YJP4N3M0DE=;
 b=T5g8OYGseab+rheJHKfQNz6iEwA92R36Rgi9761DontJmvGgTWunPPOs0izY0CoJE1wRDsNha4dvwGlL+p/fLOxqfNZDjp/4/3s3K8hrxiw/4zPVWJbS+Si+YdANWlOstqyAM7t2zGtuBJa9/AAzc+xXaaXIj51fk7DkiwRkgl0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:208::13)
 by PA4PR10MB5564.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:261::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 10:35:00 +0000
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4]) by PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 10:35:00 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-devel@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [meta-networking][PATCH] mdio-tools: RRECOMMENDS the kernel module
Date: Wed, 16 Oct 2024 12:34:50 +0200
Message-ID: <20241016103450.1568860-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:208::13)
X-MS-TrafficTypeDiagnostic: 
	PAXPR10MB4996:EE_|PA4PR10MB5564:EE_|AM4PEPF00025F97:EE_|DU0PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: a04f8dbb-043c-4124-adc3-08dcedce317e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|10070799003|366016|376014|52116014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?dWINhFXvuz7X44HHer6/x08m5osfrLbr5bCbkH38HikUMGibTmVyrxJfORTe?=
 =?us-ascii?Q?+DYI00L6e9Nr/TQnC6fLFZ0P+PzLPV7xQ8/jV892EnACkfnODERa3/wRDdW2?=
 =?us-ascii?Q?Vl/x1xE5Uw48Rn6gSKfdGbgbJ5WnnCo3tF6oi3Rnc2Kl/f65ltcZVvhxYSkV?=
 =?us-ascii?Q?fp1YcxMxfoDIcwTvaYtYO+dQphHxI7S0BPBULBhwKhLJd+YdNKB64ueT5uYF?=
 =?us-ascii?Q?qpg60a+/1mldISYIIib2ZeKVLV7suIJN94nMkx5n3cC4Gw2mPJA+96dF+GWI?=
 =?us-ascii?Q?xkKBocS6GXg02PQTRMYj3fev6lvd0TRuK5sn10Mw6l7NQXUT164cm9thG2Hp?=
 =?us-ascii?Q?aK4H2mGIK9X1tM4h/ua0hvDOocffkVL35FyRVbCUfrp4ZKx9RxjeaEZ0nM9C?=
 =?us-ascii?Q?boME1KCS5y1srHKWpVVso0dYoyEa3PUDlBDZZqVIxvmF/jNNAVY8vkRc3zI2?=
 =?us-ascii?Q?gk3ixuFNd3PtypgmK2X2rmA0uefvYIV6FTGlyw5MKgkvdZp/Ol1uOePacT58?=
 =?us-ascii?Q?87OWpAxiY5X19xUsmaOgmUmtiZePCcC4nTiKSJcG6rhNu0hi1dHbDMBOAfD0?=
 =?us-ascii?Q?uUVRCS61C2E9bcixDmWcyW0Gur2CJoVI9D+sH/3zugLmmlWQT+ETKYT5EvJr?=
 =?us-ascii?Q?IUvzsGbxXJ7MltfxmLCXvscFv6MnDt7KZZhDYV6QM6HwLq6Dop+2rv77N5pk?=
 =?us-ascii?Q?gTHj1/VP/92+Gh5LYLIWcHtitWmwTRaNmagaE5slIgpGh2YhWB9htUqehdtZ?=
 =?us-ascii?Q?sUrWMAvidYQlBUOMlWibfBqov4ghjvOliTmQVTJ+QMZew78W3RDlycBKxuL5?=
 =?us-ascii?Q?fKe27Z2oEYt9kU/p5PAFbbDsz8Ri3ndJia1mcNAPJZuRBL3sg1K9oNiDHggU?=
 =?us-ascii?Q?aw1TGpda6v9dncGrF2MCvBknhQxJZ0W8+ybNzZulVtNalU2W1JT/FK+PZe2+?=
 =?us-ascii?Q?iMLkVTHGNQblQdAQ5HNN56OFtYzNkf2ZYOkO3Vrm5Jipw7bXFMkuLFeAK8H9?=
 =?us-ascii?Q?amMg61/zFWTtoDNrxcpMLYpyG4YGPzBgi9o4hPOCQpYaUeDaI2i/7s32ch0q?=
 =?us-ascii?Q?KO9wPD8LQCKGVXMXWf7JYSA5+62a70pP75fk5r8dxD9knii2j+KDIgaTzB/j?=
 =?us-ascii?Q?/BIAcleonK1AKTl3jksG3AlKYRptwbnQ9zl+3PVtqj5m87wdcEk2JZzLsZdL?=
 =?us-ascii?Q?wBrp1t3uHpdrUnl2u5ZePx+gk0tpBZNwRxR46nEWXJ9BZ0+S738Wso+E2ybS?=
 =?us-ascii?Q?bAVN4OFTbUD/78fydnYWlicLvmEO8qDirl7wx/0egA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(52116014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5564
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b343cdb3-6b42-4589-af22-08dcedce2fc8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GGTunzBQS2vHRMuz2rP1u1N05pwdI+o06EJPSw9z+W5RM6TlwpSwcqEIGw4X?=
 =?us-ascii?Q?RiS01D9i1wpfjXmpNOO3Ncus60T00Y0sbtye7WdOOSuUopZFMIg9dY73FHfN?=
 =?us-ascii?Q?r8tk0UY7OWZXLScCt5OFTmpMq/nx1D7lXCXJqJgZLXrVofAecMugV86pgoR3?=
 =?us-ascii?Q?7rtOjFLPGuQy58I/JBCv4P8u3WTLIExHbIdivmgO6d0et7l0NBHIRBPIj6ZY?=
 =?us-ascii?Q?kQcShCWAXK8CnoDzJuEghJt2OAeguecPMgzRknzyTgjNpflM6udTBcKQp2QZ?=
 =?us-ascii?Q?AUwDudOrXYczOErPS0Zvh5sIGOQxnfL2QkfFt1tHNRp2AsAtB/+RaYm8i/Gn?=
 =?us-ascii?Q?eeY1G8fsjb7c3/iG97Xfsww/wyblMm4JCYUiseG33Dy6oEIL0+LGCmEN/Zf2?=
 =?us-ascii?Q?HXTy4iEaLwJI8P9u4yKdIAQ212A+Ad5V2sTwz399HTp6p2jH8X/i539kE3Wl?=
 =?us-ascii?Q?LbuFhF+245oKxh43Df7VHwcKBDhO1kQ8vdo4siMX9/tYI3JMWiM/Xffo0hJB?=
 =?us-ascii?Q?NUoyl3mdkZI3AOCl34xGR1wnF8+J9VpZIgds4f9cNaokbS3XCwAl3XwcWbxW?=
 =?us-ascii?Q?i6Mqcqe4Dg+rJh10+vf5iFeA4RC7VUXP//xIQRjjqB4lHF6Ez9LNyM6xI1aK?=
 =?us-ascii?Q?nW8l3lu2iflZEaL73j4o3gWSqjBXJUZXcRXfZ2u9IWNbgJi46JXYkyZFlBn7?=
 =?us-ascii?Q?nFJSZEtlAXFfMxEnTP0H+8rmYPkgVQDQFYD6cT7qT3DkYDLUMkAOM3JUVYrj?=
 =?us-ascii?Q?9GPSITk1revHiAdZts8B7wu7E9YKj73jEPeqYSBC8cHZTDwIh2PeoR7vi+7d?=
 =?us-ascii?Q?jkSl4tUuFnGp62kWSE4aWFp+pncbQXz8ivfKsqzLQvtJ8p7EqxV2OPpkq6j8?=
 =?us-ascii?Q?eIeFklbViYSjc+p/pQP/65W6ho7DQCnaQYeqdJQ1C3EazdeXdXCvZETClFwk?=
 =?us-ascii?Q?9NqRoYpiRo4y5RDCu25WGRUwcpYHz9kyxFCVpwEtuLIFmNkh8l8zblE2Qhtc?=
 =?us-ascii?Q?+qt7WXgpjEPuGtuerYfa8/mM1+DnjSV3JUaXL/lK63l4LESpF1B5gUAL6VJZ?=
 =?us-ascii?Q?8dIDMMnMHTEvLvolCeHoRnpqIv7o3wa/hGKKcBSBiAWyakIJVZiyAABrVC3U?=
 =?us-ascii?Q?0uhJbS0xOSbe17z9Q63ZJOjYkzy7YuFfwOX5F3NrsRoXvPGyYMtogdekfAAo?=
 =?us-ascii?Q?4A6+bSEnKIwtT0//ONTrczUmsDMiVDcrF6oXherElza+uoF2ws+Zv8QsTpzj?=
 =?us-ascii?Q?sY6RfHJWaD1jpeHMZ7deV44xnaBQ2kM8VBv+j+BT0iaxWyDEKYXWMQBpalJk?=
 =?us-ascii?Q?+llCN442gB3HW9ocKla3EWssFeLjL+tjaXbTPibXNb/ENjTVDTDc4W9zYjw4?=
 =?us-ascii?Q?vbIP/73bFdGSNAA1Gb3/z4rXs3Ns?=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:35:02.7636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04f8dbb-043c-4124-adc3-08dcedce317e
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7335
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----0E77E67074379161E25D74859906C4A7"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay92-hz1.antispameurope.com with 4XT6mV5298z4Bph
X-cloud-security-connect: mail-vi1eur05lp2176.outbound.protection.outlook.com[104.47.17.176], TLS=1, IP=104.47.17.176
X-cloud-security-Digest: 111b322ee1f3ea76ade2f9a11f51f8dc
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:2.091
DKIM-Signature: a=rsa-sha256;
 bh=x5o3hUzll8LtS6zwvl9u6zdhef+Cm8fJc8hvmybe1gw=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1729074912; v=1;
 b=bvSC/B1vGlpWKSl3+5+1UHXLDrHDbyOYb7kTM4YHMmJemGvDcUuWmQdyQe00slvKneZxz8sn
 intvFGoOTTf4GXebhdLa5UnKeOVkGeE2x6zodkboA7wDq6fSYDDVLhiqRV5+OUF+WteUzNnFp7d
 sPP6DhHhddsVEKAgtD49N9h7Jp8JHKKjISAFTOpwSI3al39hSAMHtY8D0Um02FJ7W7q2WRaABIk
 swFW+4LsDl/+zZ6omLg6z4KreM5igrF+wkxi9H8+3O2TjahpMIfM1fQC4iDqubr3fmrvjJfs4nM
 FKsXKDM1Fma3dx+p5yiAZgbzC6E4o3GifdV4Y/vWCCo8w==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 10:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112938

This is an S/MIME signed message

------0E77E67074379161E25D74859906C4A7
To: openembedded-devel@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [meta-networking][PATCH] mdio-tools: RRECOMMENDS the kernel module
Date: Wed, 16 Oct 2024 12:34:50 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

The mdio-tools package RDEPENDS on `kernel-module-mdio-netlink` but
this package doesn't exists if the module is built into the kernel.
Use RRECOMMENDS instead as is usually done with kernel modules.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb=
 b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
index 0c64889bc390..457064c0192c 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
@@ -6,4 +6,4 @@ S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
=20
-RDEPENDS:${PN} =3D "kernel-module-mdio-netlink"
+RRECOMMENDS:${PN} =3D "kernel-module-mdio-netlink"
--=20
2.34.1

------0E77E67074379161E25D74859906C4A7
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
NDEwMTYxMDM1MTFaMC8GCSqGSIb3DQEJBDEiBCBGRkzVw2RmwobJeSXPaIxkcvvO
J466EZ4e8AAq+a/IYjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQC27VU5jc/HIT/4RNvjQU4GcDm+O0+MXFOc5/m3yi2oc7QCupEf
XZL1EW0So5Rhq/6Smb47bhGFY3yW/4f0rC7k83jL6rJDuTmRxQ5CYYoueoLDRWI6
weNO94yqx1iME8NDfzuZRsHhnRrc+i6eVacdBxPg22sNOSS/Ay7KA6PM0EIa7HRK
t47tOUqMaqtJnV9rA/olcT1UsslzSxoZ2+P+fgcufzu0IgqZYecyQq4LfURXN4gr
eIXyUuhm3O+hOEp1RGfOsIPb6aSkgcPOuEXjIWSGThwQLh2xENImE1x976w773w5
UTMcuUwjkMMWM9gI0yeb01LiYauDGw2SAdVb

------0E77E67074379161E25D74859906C4A7--


