Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.122])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7771.1793603679689446556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 23:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=sjpziMxh;
 spf=pass (domain: gomspace.com, ip: 52.101.69.122, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsUpZsvgLqy/ZHpEMABlt/4wQ4TcFEsnTdltU6CmqvPPSjD5Rk8Co3THmFFSyrjHE3tq5dsDmjUPvD531yMCYwjxtZcBUyk54rbQhPp0SoZXn8AsCqsYAwD9C9jMyLxwsZk70s3jn1AYzb3zEof1zSKfil2kMTZPXM9Qu2B5zIY/Za8MJgbWFT63Dg+YO4PIWu3moVHiEUMxpO4nfGJ4A61gOedxGeGYfIHW1jxrtjrGj9sZ3DHNjPlbqrvq0j+ZBkzeazApPbwitXdzVTHjvIXw2N1mvFNaVkVLEMa1Usc6WDvksdv/ER4HhbQS2SP0OfaUr/xDmF1IIrJWa9ppyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+ZfNEfkFOPBlThN2PgNc+x8PzqBVBQwp0TeMkVuwhY=;
 b=tf833r5+vb/kyyToAaScp2lGIEERGwpF/Qc6E9HSUso8pb+vGqSNGtt8E4AtzQwJB2m5sj0G8UDm2uJcr6xHiVLOjHSEeXGJQ2j3sBoVMPOqSUu3ujUWh4maxJ9ulPFAZoEQ/SWYuAeAUwpIb9LDDrmAGC8xALj3OnIM+gNs77OgeU2QlT1YlKmNQPZd7ijgEIPUEtbUHigs2WXMUTdAO4H6wfMMN8GcsYxQq4IVqW0v10txd78+Gq9YI49hKhzY7o0c9A99u8/rDilu7iq1r8S1Fp0IRBI2cdLTGum4TUe7QtV7EOuDOInB7Lh/DvS1NeDE5lEhZW8WdY5a4VS23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+ZfNEfkFOPBlThN2PgNc+x8PzqBVBQwp0TeMkVuwhY=;
 b=sjpziMxhGfNar7EHV6HSlv34zeTlr0HTgBAdy5FoUlZxR6X+XZemNlJmzJ8pZiVHUSe5ZoFl9ebkTHsXtj7M+dlw0Rli5UNx1K6bYNuYhqkANiir03dBfUIMNAWSH9Q9cnINm0KQsoKIDWPLU2n1m5JJtFsZciPjbC5ILxXp5IA=
Received: from BE1P281CA0151.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:67::6) by
 DB9PR08MB9730.eurprd08.prod.outlook.com (2603:10a6:10:462::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 07:14:34 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com
 (2603:10a6:b10:67:cafe::82) by BE1P281CA0151.outlook.office365.com
 (2603:10a6:b10:67::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:14:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:14:33 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:14:32 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 08:14:32 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [PATCH 0/1] Backport of spitools 1.2.0 recipe into blacksail branch
Date: Mon, 2 Nov 2026 08:14:29 +0100
Message-ID: <20261102071431.2735305-1-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3E:EE_|DB9PR08MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d54e1e9-3bd2-4838-51a7-08df38b0f1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261022075727099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 5MnYBm0Dpx3vvWHorM6jy2U1MHoXUzvgp4/IOhk8psngNNoLEIZxLXTD3NMGEXNPoVdRJ7tb/QpHxeeKFR8oXhF+NcOvbSdKCKcfODrX/sV3TjepgqxNr0lOWJOTRJVh08sHCmPjnMUvvpesTWu+XDO3JzaC0WhVAyPTZD0WrnJVftVUnR2VgbLcRgtS2QkIQ+gha3KzoqKXFaRGdf4HVqENBkaxhEx9DV+I6J58JtsoERwVxfnJUSl5064ZLSqDiNFt5BBtdAmJlOk4znHYcNrAAFlFTAnNTu0sauArzLqkGR6uZChPjKzJix/4Erm8EU0TOEdnQSJpcHOEl4rrEei7GCVWxnaxexXRJ1kMspaFqz0w1A9x9MKLMudAWkXl18rKS7iN1tifhhws6QP7iE/XrhMRMoyHnmLnpOyeItwZAchxPZXCXcDBSeGpq0Tyu0Nu0MfGiv5HrCDsXbECa+pqQcaossmZTSymroqkK/6FpmHOdUbC0cIMtkzaB+4RUGYlcaImS+NODcC8DOCEV6UWe0mnJRCnSibmhFvsnWGBwn0AOWjisUaMrZDxLzti8JezbqCo/eGmYywpSS1vdYOZhgc6Ax2a/lV5cQ0WI8Q+1IIkin+41b2hZ8r2O+JXYLTUx8mlZH5yNodBYfA74HCG3jO80DHmZPulLTPWuUObuV7Lry1iHRJ/VZx3tk5hltvHjGocKqFQaTsaA05lzg==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tA8tlR3M5PDkfRUMVHIZEXaHHeUX2Dln3GQpTlpord3o2jp7HLJKMeazT5I3jlZYRkJaVGBpujGYy8XYRd+UvYmBMXnF80pyWAoaFBPSHYcmmOyIfSeg6gjo/vsKQyvop4eGn5eiyrwEbQIyt5nGWqfFWDDOB4VT/mXv50u2RRP/6N7pMfn2muBFb42/VfbMX0uGj0Jc1oqcUw3ZGuqcxLZi3rivR9vtrgWBlMQCxMG5f+r+nBL/tMtBKkfn5iGf0Rqj55GWl9SuF0ANZLa719kf22TaOaqUgd1L3WhYCYqPF2S7n5PvccJVNu2s59D79//dAaFIiVypdeHszkIOB1/ml/n2zqvtpzg5fq3zcj4BPyfgdJQBL2HyAOiNrlIQKB0Y8FZQWs57pauXWAqwU5bLiN3yoCR9PBI3rXWRRq48FRLkj5fQhMC/sjO5OEb0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:14:33.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d54e1e9-3bd2-4838-51a7-08df38b0f1f8
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9730
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 07:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131740
Content-Type: text/plain; charset="utf-8"

As indicated through https://github.com/cpb-/spi-tools/issues/36 a
regression was introduced in 1.1.0/1.1.1 breaking the very basics

Martin Siegumfeldt (1):
  spitools: upgrade 1.1.1 -> 1.2.0

 .../spitools/{spitools_1.1.1.bb =3D> spitools_1.2.0.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb =3D> spitools_1=
.2.0.bb} (86%)

--=20
2.55.0

