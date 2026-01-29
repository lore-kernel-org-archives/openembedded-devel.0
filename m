Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFA8D358FC
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:04:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12399.1769684645779509047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=no/Gmlpk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=no/Gmlpk;
 spf=pass (domain: arm.com, ip: 52.101.69.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KvgMzxqUSl6Bf9w0skYOVax/nc1UNxBcofCnkD1I1D87YI+PBZKYgAKkhlN9WsD2WCCjTfNVHa6b5QFgutQSWKWjs3ob90DF7Km5hhLmB8h3hSkfQJ13/jFpwKTTmWZYhSILR/n4YiSt3dK2kOy9IGEdUIO7WAWLDRtORG5L8gQ7I+tj3fxXpPxSMQqgv4unCvxUzU1Cn/ILJfWkTVuHwaVXa2778RNqFMm5MtMtmoIiBakvhqAO7zu0q8p//m998DpO3Cw34M9tuwwOBtvJCszKOk6DsBV6GeXFVUJmY5bVsLw1bPiFyb/LOgxoiq6Ns37cnKzIBCNI0OpdvfHpKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AGZtC/79Q3+/IUdSmy13n4jpRJ5oeWfVFSc8q18mqY=;
 b=fCYmtJO8S1E56vg37g21waFjJbl7Ocz921yGq32BQ1Kaoul4HMmkZceQ5Ztk6HOyMvnA14j7UVPOlwJsH5meat4VmrebhC1Y9EHr9L2TwPcREBi6LeizZxhq9/aD+QKcNdCL4CnWzHlqYQqqf+G21PMgB+Tkg8zcOyMNBqTJeOy295Y7Dcdb8+2Er0JPuJ/6xCm4LPn3Dx6eapkiPUenUurIuWdabvkxaFyJVN9Ac/OzlPL/dr+i3hdJ9+kSnZQfdwWOAcquYIE2uMbxk3q9qB72UCsMcp/UMI1dh8U5CCYPRZljVQhSXptQqZMFjyO4Fy5WWHdFEPfv6tUoOEFhag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=baylibre.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AGZtC/79Q3+/IUdSmy13n4jpRJ5oeWfVFSc8q18mqY=;
 b=no/GmlpkNdSe7jQK0v5XTyKUadwPecq0Rk3BVKU6WXOsmbRWwg6YOLK0eNCqcL93Kyr5o45469Nl3vhRqGmo4pAC6FgmPIxxhKOSmKcEhRrYAqnos3C3wbYQfJ4rC0spSDVtzht/+RRy78YA4AuB4zVOQbpZjnldSyruEOIzwwA=
Received: from AS4P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::15)
 by AS4PR08MB7712.eurprd08.prod.outlook.com (2603:10a6:20b:513::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 11:03:59 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::d3) by AS4P190CA0013.outlook.office365.com
 (2603:10a6:20b:5de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 11:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 11:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhTmojURExH/b0XUUDl9wFbkjNg5NycrEhJEpPtJYCQ6TEMOet2J6+LkdIusYy9GS35DaP+O28KVfSqavfysu4qp/VmyvWr852hJGfbeX4JRJKW6EuEQuAMzSCI7MYHb4wrzHeK95zks+tHTuhBBqOgsbfMFl12vSV25qzXZo771Ayi8mHpmht46/+Pvf8qy7yJ+k38x3LSVeyI0MApee0ycN+jFJmE1P6f10bPn+hq6qR9OJ774FEMqtpwwe4aL91K0BS7QgXtyY3raaUMNECyIr+bH2VhgqjHPua5vdy7aXPawdabkHPgaoBb9sVpk9NuFHerhSIVX/NTbSAJqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AGZtC/79Q3+/IUdSmy13n4jpRJ5oeWfVFSc8q18mqY=;
 b=UNABBItro55WglJBnSNpFks0gtDcSCH50hxt57qo6rEo93mOS/K0wjYMgLeLMeu5C/AV61HkRksgHBDGDq020pb3mslNr51t85djd6tcmIbRCD3HTimdD4XF4vTjS8aKS+shSPu/IqItC2qt90mEZ3vgLzRBiqxt9/wnG+sxmE1gpWPvkXU0JeyMJPN4oR7DnJQEsRjxBCCRv8iacL6BEtAo/R/1uUQ1N+YeQmFewnTnBHhbc0kql+9Qani/1hGF3RB7DFTg9ORrJk4RBSsOBMABMAXO09QGf5rx0qibjkyExRzCAxClvrskXS/cPm2Vu2SVGidaB4h+LpD430eJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AGZtC/79Q3+/IUdSmy13n4jpRJ5oeWfVFSc8q18mqY=;
 b=no/GmlpkNdSe7jQK0v5XTyKUadwPecq0Rk3BVKU6WXOsmbRWwg6YOLK0eNCqcL93Kyr5o45469Nl3vhRqGmo4pAC6FgmPIxxhKOSmKcEhRrYAqnos3C3wbYQfJ4rC0spSDVtzht/+RRy78YA4AuB4zVOQbpZjnldSyruEOIzwwA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB5899.eurprd08.prod.outlook.com (2603:10a6:10:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 11:02:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 11:02:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hdf5: fix shasum, downloadfilename
Thread-Topic: [oe] [meta-oe][PATCH] hdf5: fix shasum, downloadfilename
Thread-Index: AQHcj7m8AC5FoDXTfE2nmQm1xpQNr7Vo/iAA
Date: Thu, 29 Jan 2026 11:02:54 +0000
Message-ID: <A6278BEE-61C2-4DE8-BC2D-8DA92FAF6F2F@arm.com>
References: <20260127181629.702469-1-tgamblin@baylibre.com>
In-Reply-To: <20260127181629.702469-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB5899:EE_|AM2PEPF0001C70C:EE_|AS4PR08MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 694e75b5-85f7-474f-ada0-08de5f261a0b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?QhG3fEKtRBYBf5CaDrQpvHRe3pQ5gmjBoo1NyKUjkw3GICCSJ3WwDrGKtPWC?=
 =?us-ascii?Q?vzr8T6s4WX3K9acdK0W3hG0eOznHI+G1Vd7iRg6mGbYn3flkb0CTm489kbjn?=
 =?us-ascii?Q?dbrN9tmWzDci8gecByVuvmrwie02KPuBtFOzmNDbNvNyotCAgOXz8Yc11lWv?=
 =?us-ascii?Q?EkoaSeOk4WT35Kgr5cZ3JLeaENPRNuM3VB1olliDwdcrwZt+lrq0KPcwiCQZ?=
 =?us-ascii?Q?TNK4PvHjagwUHu4NOmyxFBuenfKpG07BRtZivG/OM+QChuG6AlPWaEOMETVi?=
 =?us-ascii?Q?y+HeQHfheIA40dsWnEbbsPKhnM2CUcXwsOomA6KtmWQr3NAveEqdyz7oZwHk?=
 =?us-ascii?Q?APP6GzgQiokeGCfR96maf/Y/T7unS9IQnbCzS60sAAfGHyfU0UDeSt5fVwZW?=
 =?us-ascii?Q?NsGkuq3y6fmEVbEdQ6QZF97NG+MbnFzxv/HJMNdEB4YagHaVm3aqYYC0csN8?=
 =?us-ascii?Q?l8qQKzZvxH6mwCCYUo6yyAtV3Xelop1sMfsGqLIWuCLr+ApJ/jj88dXE0lPG?=
 =?us-ascii?Q?BPnAfISrGGijO/DCiB/nfmVoAcR3q7Pg3jxorodE7F5Q/CTg24DulnF4I52G?=
 =?us-ascii?Q?yULrqxz+7yHC6K24Q52zMxx7yDTjYgKsJk+2F42y8uqL8LKs7KDio6Aw4E5X?=
 =?us-ascii?Q?cJfq+MuKmqU1jcKgxtBKBSoK72V2WFB3bErJasPBsyH38GAidfS/4mMXzWWy?=
 =?us-ascii?Q?vkA7gaIQbTY8VhtVVFrzDrPZhsuepsuml2bYP2tXVNArGYh3ppQIXoG9WSox?=
 =?us-ascii?Q?njy6NIoRr4CII9KV/f0q1ZgEnnf1B3LNAG7WBN1/CQdnZoUOeD/Jk4m+6nyR?=
 =?us-ascii?Q?UfU3kIcJT7wiVIPpkx1jDYUbWlr5NDDaQ2g4izWBtgaAuvIHhOQzFOtooFB/?=
 =?us-ascii?Q?xWk5z4gsWYCbw1SCl2dJjtmhgARco3zTaYg0HXRXdvuAgYsm6LN8FOGEAM8c?=
 =?us-ascii?Q?jU5gKols7pMKt4/MCA9HtbCZ84Q/C9F8OtxTmMhmsTZUYkbgCsSSXbDDyeLo?=
 =?us-ascii?Q?EdNvFZUO2dC0I2fgBoNecs34NPK23wzOY3jTmAtoIMdVZpiUCD134Y+wMEcb?=
 =?us-ascii?Q?nWbZePlj4tXOfGGEnJ705zVxvZLFxIgJ32z0Pk48XMWufDsIXgVz5/1hSpFE?=
 =?us-ascii?Q?Wnd0oItEaxqwMPrrZaQeCSPwhFcrWKIYeI7OdALL59hDhCvXZXjbW2fblHUz?=
 =?us-ascii?Q?YgOlbgc0JJCYfg/8KmKpz+T6SeXaj3mhA2HEoW52/BL6wa5q+nM89DHFOkDY?=
 =?us-ascii?Q?Y+fTMMN7mdGE9C4K7TqrjUgLoA6X961TXqLg+0E95PzPXVsJXRy9YV8Ofj+f?=
 =?us-ascii?Q?+3B8tv8dqAfZ6CeVBLh5TR7e2EXmUnycjhCxhSnVfaNsDhuKILhfha5BSkyR?=
 =?us-ascii?Q?YNykLf4zaY/fg3s9Nh2TwxtCWwRj7ELVFzC8VQD13pjnwPnAkk6y+7JU291C?=
 =?us-ascii?Q?tWK8Kx8gBhe9RdATF/Vom6HQbl820E5yecC+MdAiLENHvUz+qwLPKWYJTFGV?=
 =?us-ascii?Q?ObVoar3wuRfooN+G/csFSp18a/+vse05GHsG7F4QuP9qCIkQaBaA7PqrEgin?=
 =?us-ascii?Q?jzC41bUhJmqcIPrE4p7RnZcv+de4UgJlv22oMjR9t1SPGU8YcTo4lfl5BaeC?=
 =?us-ascii?Q?j//pM6bXjnbjXGm8urd75YUwkHjVhY/Yh6HXccLgrvHJYwilothU2go9/P2O?=
 =?us-ascii?Q?BnnWe0yyeeZdus2XorPFgh6ps9Udjt6dPeqRvce2x/oYtLkTbERydu9wu+iV?=
 =?us-ascii?Q?FRpBfPQXIfVqBWZxvahzTAisL/fG0ltQqEy3x0R9NBpmS2CKvCNoKk65EaUj?=
 =?us-ascii?Q?A7jZTJ0WX7J+/xLJpxhN/Hsz+d3H+5ZBDSIiD6rET+l9SpYWVfRIns+ynC9o?=
 =?us-ascii?Q?MiXB3sgMZcUMvdlr5p61RBrjlaL4Ki1DVgMMG5RKFD78hTgnzbLpTBVjxFuC?=
 =?us-ascii?Q?uJP/CetqO/6B3N4OHmDL7g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E98CF8F9FE9F94498B4F1F0058182A3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5899
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4947b04a-8aa9-4ce6-d461-08de5f25f3cd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7eGu0g2BHhx7POONxKA1V0ES7NybGh1mdOBM5Cp0oA4FQU0AMTX9yOxc+aWL?=
 =?us-ascii?Q?G3FwGMCf1YmaROhy922MCCkdFxsDWTOuhv9dxqsPyqrnGxIbHHzEm6Mk2Vt5?=
 =?us-ascii?Q?POo6ti1jxDKBjWBM/vt8w97C5hOy8UAo/rNPuRUvqlLndGBJEYt/7Mgnq86x?=
 =?us-ascii?Q?KVL0MNSXLN02aSsMOqz5yUF+DWgdfNw8k0btETkM3xmfWWw/KIKwe5LLblCz?=
 =?us-ascii?Q?qyQHel1SGedyX5tCmg9DNZY8pinZIRuhquK7tT4oj4byssAi5dKLdzyBGO++?=
 =?us-ascii?Q?F+xwqwfomkF9u5oFRFczZm+HJsPqcHLUEF3HbkBZEHxYNfUnuRSXC0xNFEHG?=
 =?us-ascii?Q?GaQ6g+HRgjvhB8u290qUd+eiGD0aPXd791lAWWIkWrrbGJwARiBFac+tjZhl?=
 =?us-ascii?Q?JflwOQLXKp2NKopMaoZdmXxNog40j+Jp4qSzdpFwERJ4slpq6eUxqBQmcrBt?=
 =?us-ascii?Q?Cx5/dNt+PjH4ZxMhjW6JKd7EZ7rupke+k4AVmBO9xuEcKmiP6ftHv0sdO/Vq?=
 =?us-ascii?Q?hrJdut+6wnJWeVOmXXHZN1CyeL1HX3vnmvhUJ71LYxLN0GfVGQ5RtGVlYHZR?=
 =?us-ascii?Q?oyWFaGULaGMJ8iiwXVDx8yTUWvm9Rnq9LO6PS6APu/QiPJ6estjySDPdUwBd?=
 =?us-ascii?Q?C8y4XWcgSEyvB/bTbuxX8zIk0AbhTQYFEJ4uiMSThNrIWNcZMU7MQmPyCYcE?=
 =?us-ascii?Q?UvxpdC+f9V3VM3J0YmUWw+UUIUB/7+Q4FrycxsN9p8k1Y01Ahh4U84e5Jw6y?=
 =?us-ascii?Q?Z4LXpflD2Scr2EgPwXoks8IlFh72YmmsUf/0WCRfGh1Gs9g/LBhn2RxaQsG7?=
 =?us-ascii?Q?/UJCIVS8MxW1UekiCNZCjS92DuuGkE5/eomEYcQF6IM+UbQimkVSYMsArvar?=
 =?us-ascii?Q?9uByQLvkRZVLlaO8VrMTlHJHuygkU0bRDNlLImqSzsKfAVADsm8GqtR9+aQJ?=
 =?us-ascii?Q?z3oSWMX9xsw6HdYqA3/qrYQDorYORINgRBU/u6182f2xWBeZqKEWsLn760tq?=
 =?us-ascii?Q?tpcfhZO68uhVxQxh2FDSsWDkuICD+WdpWl8jkO6WZEgPdMzrdTq9HKfiKyDQ?=
 =?us-ascii?Q?JULMsLYKli7h4q+fcITI0fH8sNJUzbnpvCoro3PNaAQJzqKvHxGEJIi+3UpJ?=
 =?us-ascii?Q?2OrFBXmXCbZgVPNCnpQst+CKGXN0fR/iCF3n18u/0zUp6wolPdBbf6VMXnuK?=
 =?us-ascii?Q?VBrfyevXWO1wRJ90XSJfe6nisSMh7GMFFC1flZ/RDHxC/tNuCiFJbcNnPyOC?=
 =?us-ascii?Q?ClXTC9XC46GZdTZuG9SX+Pf7sOAtXiDc4jyoRtTtrNq9VinAq2q1aQ7XyCY0?=
 =?us-ascii?Q?3BJt6pskmNXKx49QGWdikcquDkYsPMS+WXXdK96HcbGOHWKqIvreylB+B1iH?=
 =?us-ascii?Q?jWanjgj4wv4ADBbSnmHhs3wqvGQJ7WEDykm+Frgxo4G9hELdfMJDK5aQzjLR?=
 =?us-ascii?Q?PtdS5xuS6qvB6Ht5j0rXbKMxp0UfyPaoXL3dNi01deLwNk+VtlWGo6ZexNDm?=
 =?us-ascii?Q?oGwGT15DqRUbT/SWrp+WZzw9suOJ5yP58mxVgHB7k4qA7708rxNk8pIiV+s6?=
 =?us-ascii?Q?O4lpu24GOOw+pgE52fYY0/F9HET9dwrieMzikUKvjtIKP391icoDtxE6THVD?=
 =?us-ascii?Q?CqHPBn1aIm8uPqRTOEcqCda1sGMLiuf39YU7MU7SGBCZYOMpbtjKuOQWgdxY?=
 =?us-ascii?Q?3wQy8w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 11:03:58.3005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 694e75b5-85f7-474f-ada0-08de5f261a0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7712
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123986


> On 27 Jan 2026, at 18:16, Trevor Gamblin via lists.openembedded.org <tgam=
blin=3Dbaylibre.com@lists.openembedded.org> wrote:
> Upstream seems to have regenerated the archive, as the checksum no
> longer matches the one specified in the recipe:

Have you contacted the upstream here to verify that this was intentional?

Ross=

