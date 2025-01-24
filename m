Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA894C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:09:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web10.892.1737745769042793372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 11:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DvJh6+su;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DvJh6+su;
 spf=pass (domain: arm.com, ip: 40.107.22.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k6DK0lBVD25kvubUO/5coufcpSN2gC66j3miR4QYda+ZoDPGgL2qma01cH7lMW1bNp5OGY46ionNEZn3dGS25y113nM7twBbMYxU9ovPlci1CCGHrwWmLl3Ll3ujNE5AglPZuzY3/wi5fdWPn3jFCzfKqumsiYc/TnfkPPS/606pykLkGg+iL3QPwK/DfXShnej9nJ72YW9mEPdKl1+ExeZwy71IAkiOKRsctfmJeJMi/gsZNNUCI7ATqt9k+71JOGGMimQZIf3LqSyUJ4Zb7FLY84GgeQFGVjXmo4lAuH8tgxoLdv4lHCRyE6dyrai0GqS+tNuAqEmlqwd9UGMnVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPSAyy64OnnJUycVXVrCnOR4bRjoLhuKtDTydMAGreM=;
 b=wQ0BVhZMy0U8MdkW2BJxmZRmOc7k1yamvZjdjzwAlUPVGpbmxasImlOYsyqE36O4ZfAyEhzrzMB/ircJCs1ut3muOWv61+a5IXbhEWguq9T98VIUTkpH26ixL3eEHhNBZiNMctwjCmcwsLVyBfT7IKiREyS0qtDLQuAdqsu+YLjyBIvEE4l44fGYiUiiiiXTLVXEULVQvD6t7VGEf2bcJS6ASP4Cj60eUjYUP+f1r1xHdhBY7WII86OFjSuhBoUa3JrSRd/46DS7LysYbVOznBTHSvNt5mpCZok3Ytx8KNJpkOof4jCKPnzutxJzetGself+dgwNDzhW65RqSeHqtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPSAyy64OnnJUycVXVrCnOR4bRjoLhuKtDTydMAGreM=;
 b=DvJh6+suQpDqy8+Fdl6jbyrUxPihLaZQMQco6Y3YrakqKP6h8AeaCfuaPCp8eozfktRuojKtX8hb+iplXzBKRFb5FTDqKgmpwt6cwAt8TifHvSXjFtUy3OaU5WexKx6UWAA4+36YErclM/xyxEtp0+RSMVwYr9WLsPmRtlQFKK4=
Received: from AS4P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::17)
 by DU0PR08MB9678.eurprd08.prod.outlook.com (2603:10a6:10:446::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 19:09:24 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::be) by AS4P251CA0015.outlook.office365.com
 (2603:10a6:20b:5d2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Fri,
 24 Jan 2025 19:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Fri, 24 Jan 2025 19:09:24 +0000
Received: ("Tessian outbound c45bfa2cc806:v554"); Fri, 24 Jan 2025 19:09:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 473fc8650cc06e1d
X-TessianGatewayMetadata: tVGY2QfDxBZPHg4bDmt3iEtDQQl8cwlSRQAdh1SAMXziiDOSt0LFCNfr4f+yJAmgUn2sg9GPGd4hMVW1znPqv9UEwkmLwNOf36rBJ7dmN3azU7RaX88H/oXZYSSUKHM+gYoiDHGSJnGg5gTusyE0CmLKyanZ5eJFaqdWH0e48wA=
X-CR-MTA-TID: 64aa7808
Received: from Lf3e9e183eda0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19CC51F6-3952-4C6B-8F73-1529B9D48912.1;
	Fri, 24 Jan 2025 19:09:17 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf3e9e183eda0.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 24 Jan 2025 19:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDCRmsb3mU1rdosCbTv8BPC0cgixJU7rDE1e4mILTmCGvCGXBWy9X8Cs4OkOAEUxc3XbPersBtO5gCqUSV0Lthpps5KdXpaEwircJ8s8R79xNMghDmVyi7LNGLearwakXPzvhnPlUBxzKuQbCY0v95die+T/u3HpwgBZ+1rC4xUtiMTurd5oeQrFcMSSMRoh8SZ9sRtf5WG81GbkM908XMF+DaGoohum5+KSg/hEf8DiSm4O2wDaQk3rTuud5zdMcSkIbOWJ1iQhK6NLjAKQZ48vBCHLwglSJwWzmqET/DiPq08NYLFsCacPMEO8OSmSKK0zYqe9pxB7tOHG1xsh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPSAyy64OnnJUycVXVrCnOR4bRjoLhuKtDTydMAGreM=;
 b=aYoa86LWuAK+ZDw2NehXRnbV+eT0YR3fz44JlHLbQbVRs0ZxpPJF2H2vczCtAMSAshTk0e3LnhatM7bWosHPYImmdpdqsnZhEawJM6e/VAbJzfJBnSTMI/oye8gHnhlTacOlHUtMz0MRrr4P5oMfAl/qy3KfIoOGRvmX6A83M5sk5k4xSFGapgUCHnxjEIpOrr1bBM1/8TSvCfKZ/mVJ46dvvhGup3hXxNwvEjgsI0f0D4yZxyZemU7SEpAn7Qp3dL4w2lxcfhq9ezkfnGD93AoMjPydL8c5XSsGC/uLpaMY+GsX69a0dcJy+kiGbaeRQR77T8ZtUA/PwnmfvbEBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPSAyy64OnnJUycVXVrCnOR4bRjoLhuKtDTydMAGreM=;
 b=DvJh6+suQpDqy8+Fdl6jbyrUxPihLaZQMQco6Y3YrakqKP6h8AeaCfuaPCp8eozfktRuojKtX8hb+iplXzBKRFb5FTDqKgmpwt6cwAt8TifHvSXjFtUy3OaU5WexKx6UWAA4+36YErclM/xyxEtp0+RSMVwYr9WLsPmRtlQFKK4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 19:09:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 19:09:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 4/4] ntp: set CONFIG_SITE in do_compile
Thread-Topic: [oe] [PATCH 4/4] ntp: set CONFIG_SITE in do_compile
Thread-Index: AQHbbm0ZxbjWzyYs90y9JdU1tlOwU7MmKWKAgAAgoQA=
Date: Fri, 24 Jan 2025 19:09:14 +0000
Message-ID: <0D798888-7AF6-422A-B132-650C60CB747B@arm.com>
References: <20250124143401.1635224-1-ross.burton@arm.com>
 <20250124143401.1635224-4-ross.burton@arm.com>
 <CAMKF1sqVG+O1-5M611OipKDkLB37XSfG3o8Z1d7tvWex-spQbw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqVG+O1-5M611OipKDkLB37XSfG3o8Z1d7tvWex-spQbw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8129:EE_|AM2PEPF0001C708:EE_|DU0PR08MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 498d5bea-9a1f-4797-c734-08dd3caa9dab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WGQ3dW4yZFEveGVuV3FjOEdWS2tVZkVJUnczam5OY0xuSlNaKzR0dlk0THZD?=
 =?utf-8?B?NGhzV1lLM252TWNXRWxLWllTTkZISFN5bDRXOW9LMjRydlZmUkRCUWtiblVu?=
 =?utf-8?B?TmNNZk52N2NObDYvNnQ2WE9LSGZCd3BSQTl0ZXR4OFIxQkMzTEdDTDI0N2FE?=
 =?utf-8?B?bi9JY3IzNkl2R2h0U3FQU0MwM3haWVRWellVZVZZZ3VubUdqUFRhWGJ3ajBI?=
 =?utf-8?B?cjFwOWhuejdPa3NYVFUzTzFnWkFmUzNVcTVVMi9VYUF4QTlnMWJqMVc2KzVs?=
 =?utf-8?B?ZmJTYWhmM3p1emhFOERoZTk1Q1hvU0ZZRURCOGxrR2NMcHNWVnRDQ3hzV2t0?=
 =?utf-8?B?OHhGWjRXeVFmM09jV09pRTY3ME9LWTJKaFJPTWwySW5NN0IybmlZTyszNWpr?=
 =?utf-8?B?Mk9tNzNTWUlBOXhOMjQ2K1pGcHpGcGlvbnprS3VSMEU0MEM5SjB0ejVFYjdV?=
 =?utf-8?B?c09aY0pzSWJRdlkwV1MxRXorNllmUnNDNERSZjJndzhvVURsTUcyQTVpQ21W?=
 =?utf-8?B?a0g0bmFDSU51K0VOMVMxQUxmUlorZCttNXlzRlVySHIyTUxGY2VtR2RjQXQ2?=
 =?utf-8?B?eWtBYWxkendWVVpERUY0WnJaZHRTTXRmK0JBSXcxSVo2YXZDT1M1aC80b3Nn?=
 =?utf-8?B?NTlpMVFnNVpEQzBQczVQTk90RFVremJaSWJOSnpxM1I3eFNKYWh0RThEc3J3?=
 =?utf-8?B?dG4yZVlwek85bnlvNDRZSVhFMTNlTmdXTFVnZHVnbmdUMElQTGlQbTg0Y1Fm?=
 =?utf-8?B?V3p3UmdDWWdGYWdjKzY5NEVvSC9JVStGeEV2NTF3MDRCZU5LNXY1cE8wYkcw?=
 =?utf-8?B?bWZKQ2s1WHZqMVlrS1R5YURLc2J1L2l2U2dYVDVCVm9wSTR6WUlpdkwvd3Uw?=
 =?utf-8?B?OGllYXZ3Q25RYlVTMmNoSFpPSkg5UVdpVzlWeFRCT2J0eDJuZzBVTXoxam1W?=
 =?utf-8?B?NTdyZk5tdFRGTExxNkdobnZMM1ZXaEFPL0xZZnBrTDRhS3p0OE1RZmtWYUVX?=
 =?utf-8?B?MGtTcXI2SlRqREtOTk1LLytoNFdHNEYxSUdnWVR1RFhVNDB2L0FCU0pxd2dI?=
 =?utf-8?B?SFhlSHh0S1d6cG05WjMyd3FwRzlvWi9KMmxZckhMTWNIc29RRmJpTXhianZ3?=
 =?utf-8?B?NWVZVXYrakVvcE5EZWIya3p0d0g3Vm9GY2hDSVlQMFFGdklFYkhBY0VYUjdV?=
 =?utf-8?B?VjNOdGdCSW9uY3dQNTRUWTNnVGZtTXE4Qm12YXM2Vk1oRzg1Nm9zYVpuZG1R?=
 =?utf-8?B?Z2tYcUdiK043NnY2ZjN4V1BtY2RUOVBneC9DblF3WVdUWm1TdEZaMkNabmNr?=
 =?utf-8?B?QnZUYzJPaDlhT0l3bXdLUm42WlBrNS9zU2QyMDFZcndSQjJxOGRYRlpiclVX?=
 =?utf-8?B?T2tEOVVTQXFyd0pkZDdWaEx5VyszOWsxRjI0cDhvbTI2bmpPdm4xTFdFMEF4?=
 =?utf-8?B?dm56TVRiVHZMekFzTGFjVnJmbm5NOG5weW8xOWpxTXNCVEthZ241NC9iY21X?=
 =?utf-8?B?TUw4cEhDZ01nRDdkbjNjSjhhUmlGQlFCQ0k0QU5FWDhpdjhiU0hBQmJFZnVy?=
 =?utf-8?B?NklzS3M2cG4vRmJreUhLYXd1WEpaeHpZcGNhTC9kaFVpblZCWkFlV2FkUFl4?=
 =?utf-8?B?OWFCSHc5QWV2V0FPWlRYK2s3Ry9MTUsvVE9PYkkwTzZvczFONk5qTTFyQ2h2?=
 =?utf-8?B?TDNyam9VNExZTjA2NlJvZnZiZEJ3MC8razkrTTJNMHBPS0J6VXd0ZDREU0p0?=
 =?utf-8?B?MEJVNWlwMy9yWDhtOVAzZkNDUCs3Y1ZBdjZvOStTOXpqRkx4WGFPRHZzSlhW?=
 =?utf-8?B?c1RlSUJSbVFvQzExK1cxNEc0a2cvUnB2c2JiQS9kd1VURzNOc2hvbk43cXph?=
 =?utf-8?B?aFJBZExiZlp4QUdnZU1vc2xxRUtqY0R0MHRieXMrVWZuVGJIbTJaYjQ4ak1I?=
 =?utf-8?Q?s+LYRM8ioE9IONiLscsraCYMlC/m5y7Z?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B024E33D9472C649A4A3F5667205A140@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2bae4730-ce24-4db8-90d3-08dd3caa97f7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjlLYy83R3paWG5hWHRWUFFSU2VtQlZrVDdFWnAyUnBzc1l2TDJ1Vm1TK2Vy?=
 =?utf-8?B?MlVTWEhGYnFjZ0tzMnY2WkY5SEdwV0RvME9zOEU3SVVsOUU5MkVYZVRMT29N?=
 =?utf-8?B?eUZwLzc1R0hMQlNPbElVck9rNzVLZU05T2g1V0s5Z2NQN3Y2WUI0c2U0bXZE?=
 =?utf-8?B?L2hZZ3pRMnA5OXhBUFFzSnV1Y2NIWkpXdnRtVlV3QVFKMnJrckVodFpoQUpk?=
 =?utf-8?B?KzBaUno2RDNyejNNNWFyd1RCaVdQQVVTVEZVY2lqTmQ1YTY3L3ZMVnVldWJR?=
 =?utf-8?B?eTF1K0tUSW11M0RaUlA5L0Uvc0tnWXh1VFRpZjZHLzBJNHlYNm55VGdCQ1Ir?=
 =?utf-8?B?RWk0VWwxelJkYnF6WjB4bE5tZFFKSG8ySHJsTEp1YUc1L1FuSUNmdno1V1Ur?=
 =?utf-8?B?UWtLbG13T1lreml5aXBUWTE1WC9OZXBlOXVYendXalMreGxxS1h1MnZtZGV3?=
 =?utf-8?B?ZUtBS295NHpMVEtDS2M4MFJrT3RsbmpPQ0ZMSWhhVkUxNlNMM0V6Y1R1NGRj?=
 =?utf-8?B?MVlMNkVadEdFVklsWjJqMkh5eFJXMnlqcWlHZEN3OE12WklrbVI4clpEdXpM?=
 =?utf-8?B?bk1TUDZwdVo5QWJXN3RWYnloSUdwY0I4dENDanFJNlBqL3R3SnRFODc3V3F6?=
 =?utf-8?B?ZXRZZTR3cTBwUWQ2eGV1UEdtbDZDZXlVREt1am85ZlQ2ZEI2ZEZ0VkRhcWhF?=
 =?utf-8?B?UEszY1p0OVk3dU8yTUdCSzdkcnlnL0RUaEk3NWdhVDBlZUp3N2dNUERwamto?=
 =?utf-8?B?R0dNeXN3ZDdFUDYzK0E4TWR4LzBrQzlrVHY1ZWloRGtiUXk1WVBidnNZdjgv?=
 =?utf-8?B?R1hySk05UjdteER0OEk3RjMwdGQ1RGY3dldUQUdvVFd2SVMwcFBnYkdXMktt?=
 =?utf-8?B?R1BtUGF1ZGZ3VFNzeTR0ODEyN3FNbjkxekVHRzZKZEVUUHRjaVE0MnNUek52?=
 =?utf-8?B?ZW1IMWZNYVlqS1k0bmRSWkpqbG1LaUs1ZUtoUnlhbW1oRFZZRDdDSm9rd25N?=
 =?utf-8?B?aXQxd1hQbEJqOG5TdnRKRmN3aEJZRmJqMTJCMVpjak9ZeFdubCtKRUh2Q2tT?=
 =?utf-8?B?NmYwWVFkQmZXUys2NGpPMXpSOHI5WTZrRVI0R2JqNGRjZUgzQ1dxeVVTYUg3?=
 =?utf-8?B?SVV6KzM1dVBwamdjNzgzSVp4ZEJJc0UwblV0UEhYOVcrTmFkZmhzbTZQc3Z6?=
 =?utf-8?B?eVlHMm9CdE5TamZQblZSanAzSnlSdzh6d2JhemRYL3I4RitpK0pydVZFa2R5?=
 =?utf-8?B?Q05EYlFVdnFtSFhYT2Rxbm1qZVo4NXFvbS9jZ2ZIL0FvR09kOWk2aVVISWJP?=
 =?utf-8?B?eGlIU3pmWGR0RlFzaitod0lLdHRBU0U1dENncWRWNW8rd1Azcm0wRWVyVUVo?=
 =?utf-8?B?SzRoSjBZTEJLZk1CUkRZYmdvbXNhSlNncmpVNGljOXhpNGw1SzcrdlZ4ZVlQ?=
 =?utf-8?B?UTVJK1JWU0tTN0JTbHV1eFFwaURoQ2xORzM1QW5hWEk1UllwazgrR1BUV2VY?=
 =?utf-8?B?cThtd3U5b05Nb1l3QkZTUGpnSGpzK2FHZ284VkJXMmpDVDNGUFkrMU5KVTV4?=
 =?utf-8?B?Slplbkh1THVyNmdvTWsxVjZmYm00ZUgwcEt0UXhIbUlZcDUyaDNHNTZBbmRH?=
 =?utf-8?B?UzFpVjVoeVk2Nm01bmRmcnlQNEl1RjBSWGxubFkrUXFkY1MwOVF6T2MycndT?=
 =?utf-8?B?Nm0yMVgweGdkOUVTbVNYQ0FveCtWRnh0azhjZ2UwL2c2NHdNNGlFbWxPR1E1?=
 =?utf-8?B?U0ZHVUp5L09PTE9uNitId3ZyQ0lqN0oyTExGMFJVY0xZcG5aOW9hV2FldHhl?=
 =?utf-8?B?UU5YSGVxbEVIaE12N1VROW14QlNnSSttM3J3cFppRUtCU2N5V1dhbHJ1dnpH?=
 =?utf-8?B?KzNZY0tBWGVpc1BJMUZBZlpzZDBJQTczQ2hOQWZjeFp6Z1dlR3ZoY2ZTcHNp?=
 =?utf-8?B?WTNaTEVjeURTVDh6azVIUHV6YkZ1OFJHanNEUzVjelh6Q2pIdVVJa0tzS2lr?=
 =?utf-8?B?RzU3M0ZIS0h3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 19:09:24.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d5bea-9a1f-4797-c734-08dd3caa9dab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9678
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 19:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115073

T24gMjQgSmFuIDIwMjUsIGF0IDE3OjEyLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gT24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgNjozNOKAr0FNIFJvc3MgQnVydG9uIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBSZWNlbnQgY2hhbmdlcyBpbiB0byB0aGUgYXV0b3Rvb2xz
IGNsYXNzIGluIGNvcmUgbWVhbnMgdGhhdCBpdCBubyBsb25nZXINCj4gc2V0cyBDT05GSUdfU0lU
RSBmb3IgY29tcGlsZSB0YXNrcy4gIEhvd2V2ZXIsIG50cCBkZWNpZGVzIHRvIHJlY29uZmlndXJl
DQo+IGl0c2VsZiBtaWQtYnVpbGQsIHNvIHRoZSBDT05GSUdfU0lURSB2YWx1ZXMgYXJlIGxvc3Qu
DQo+IA0KPiBUaGlzIGxvb2tzIG9rIGJ1dCBsYXJnZXIgcXVlc3Rpb24gaXMgaGF2ZSB3ZSBsb29r
ZWQgYXQgb3RoZXIgcmVjaXBlcyB3aGljaCBtYXliZSBkb2luZyB0aGlzIGVnIEkgcmVtZW1iZXIg
Z2NjIGFuZCBiaW51dGlscyBkbyBjYWxsIGNvbmZpZ3VyZSBzY3JpcHRzIGRvaW5nIG1ha2UgDQo+
IA0KPiBXaGF0IGlzIHRoZSBhZHZhbnRhZ2Ugb2YgaGlkaW5nIHNpdGUgY29uZmlnIGZyb20gY29t
cGlsZSB0YXNrcyA/DQoNCk15IG1haW4gcmVhc29uIHdhcyDigJx3aHkgdGhlIGhlbGwgYXJlIHBl
b3BsZSBydW5uaW5nIGNvbmZpZ3VyZSBpbiBkb19jb21waWxlLCB0aGF04oCZcyBicm9rZW4gYW5k
IHNob3VsZCBiZSBmaXhlZOKAnS4NCg0KSWYgeW91IGhhdmUgYSB3b3JsZCBidWlsZCB0byBoYW5k
IGl0IHdvdWxkIGJlIGludGVyZXN0aW5nIHRvIHNlZSBob3cgbWFueSBjb21waWxlIGxvZ3MgaGF2
ZSBhIHJlY29uZmlndXJlIGluLg0KDQpSb3Nz

