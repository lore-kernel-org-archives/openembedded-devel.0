Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31670CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 16:52:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.2])
 by mx.groups.io with SMTP id smtpd.web10.13830.1759423971753942428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 09:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=r7jcX19v;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=r7jcX19v;
 spf=pass (domain: arm.com, ip: 40.107.159.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CJ/z9T6cL0jFMis0B3YK1BFRdLl9/fim38+P/8u4ZAZd7uYbfCG84eF9JenppaZF892iA6A1K4i62dXWZBOyY5n5+eF16EjsIOMOKDY1ovvoj0+dckpaDZzBwJkhckKHDkgOXBfSey4Sko4rdQ+R6+T2eOVZPAae2suqHCuNE9wbfzbWqu/2bF2oxp6FhENGGphpElH6K5UmerC9GRat5KBjJsdgN6ifysHxlzEXpCDKHYH9RWv674pGZT6c5q1uDNYl0WXbYHX30/5QFAm/S6M+Bwljbvaf6VYi3G9j12B0mSWUaFsekMK9Mnu8ORHsVB3I7HfzkmPH5uLh1t1vIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQjHTaYCBTintNHc4IZLjQtfKbMaNaBaUa01zWw9z20=;
 b=WYrCC/ByrNIbekX2O6VYtqyrf1e3m0G7cPhZtN2gU4QzwVY2ii2VFSOTKd+86BGnTLT9OmbBizb180YtYR66c7GvAH6CDk8Ymhb+PlhH4ladX2JZ8mcfgUMnV/ioBakBcOGHgh3Dr/hVs094U3XxYRNTgVt+0DdIuOqQRkuPipe4pj5kDSU0HENNJICDsZKhK+ksQkhbImUAxaRBTCy1L1rzvVSUJKk+Ol1XnT04B85N96qa4OS63AYO+nQLgIe3PVaorXNz8z5HPdp1+/4QVgfP79djB9mMb/yYeSVEVb1jpcSVZkDQ+hX//SU38uTt8G3tGiyu2jwls1foyYqQng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQjHTaYCBTintNHc4IZLjQtfKbMaNaBaUa01zWw9z20=;
 b=r7jcX19vWMeL0yvvvHzwtpiYW7znB4k1tylxTC0qD1i6Nf1i8lQBhx2Lb9jWa6UowT/+XcNovCfdNH3mKa29aQZT4YNXWuTE9fRtAqPG27cO7X/uLq1ST0wbqUv/QQvsb6Ak0T9XUtrcop7YTK5OZJh7eO08PEwZSH48zsBgeiA=
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by DU0PR08MB8448.eurprd08.prod.outlook.com (2603:10a6:10:404::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 16:52:45 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::37) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 16:52:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15
 via Frontend Transport; Thu, 2 Oct 2025 16:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW95m3sOPvk4aV12fzN+cSLDZV4RzH5kILZ2jmrbnijAf4gaeXkissbCiYqkX3EYgQnRc9qpTd9gD4znI52XrMMPu0xam77ejGiur7eJCX4i2WeSJMQCK3WQwhHCW7LnYM5LdTaNbPNJ6Gr08JUF+VxXb3Ft/E+sndsCwlC2V4nqjmfuN4Vx/vttgyg4fjUs/0KOAm13nX9oYDfZp6k6/WaqFeQItdD+Dy/rC17FF4A+yiEs3MvvrbyiaNmKJHO2/xLX+MrcL1P+oFO+r/IhLMRZDLYzVb93bx8wbRW9HhfXyyx+JLVgDKVoTvzwRXByhZObJ9JdEsSzvfEMOtMMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQjHTaYCBTintNHc4IZLjQtfKbMaNaBaUa01zWw9z20=;
 b=Z46PD8FqvU2dFOvQS6vkZhehrk+JWF3gvTIaUaTo8Sa/6qt1cps12VSoTTU21a20RpARjE0gdMubSj+cjcvEgVpgD1XA97yx5o++WxSfpDoige4G11KdRmW7FpbzJ00wRdLLc5AT9z37IyzOj+LjGtKNpt/fh8ABziS01L1phS8XwFPKTXKm82+0+fz9RLtq7ughTz/ZRq2yYuHP7lefau5uoRszduopXnxEi+x/c6hyJ8VD7VEKZ+komzrOuPhaA7MYZ+5tVsgY5bNYPSSOnSU+RfhVaJgRPlvCzCElfbu8mBLq/i7Js7xaZxrkeRMlzkLpX5k4f5kIHo23Uk4VcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQjHTaYCBTintNHc4IZLjQtfKbMaNaBaUa01zWw9z20=;
 b=r7jcX19vWMeL0yvvvHzwtpiYW7znB4k1tylxTC0qD1i6Nf1i8lQBhx2Lb9jWa6UowT/+XcNovCfdNH3mKa29aQZT4YNXWuTE9fRtAqPG27cO7X/uLq1ST0wbqUv/QQvsb6Ak0T9XUtrcop7YTK5OZJh7eO08PEwZSH48zsBgeiA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5800.eurprd08.prod.outlook.com (2603:10a6:10:1a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 16:52:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 16:52:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
Thread-Topic: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
Thread-Index: AQHcMzgPNxsTfXicpEaFxd1EAEMqQLSuoCuAgABXtQCAABtsgA==
Date: Thu, 2 Oct 2025 16:52:09 +0000
Message-ID: <7CA45894-031A-4B69-803B-84614316CED7@arm.com>
References: <20251002010054.41854-1-f_l_k@t-online.de>
 <A6BC85FC-FDB0-47A7-A95C-3478460C6CC4@arm.com>
 <2NFI3T.SANECX5I50EZ1@t-online.de>
In-Reply-To: <2NFI3T.SANECX5I50EZ1@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5800:EE_|AM2PEPF0001C714:EE_|DU0PR08MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: ba20f686-ba4b-4c77-37c1-08de01d41b71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L3lqM3VRckV4Mzc0THdKNHNyREFzdEpPTFgwbFkzQm5lbUhVS0tGRExqSG5D?=
 =?utf-8?B?K3lhSE1SNnlnRVN3TWt3VTU2MzNnWFc0eDlETkp6TDJ2eEVidjYyY1g4R1p6?=
 =?utf-8?B?ZitRWTBzbmpNSCtBVE1Hb2d3ZGQxMXVmdk9YR2tHQkhuNUpVM3QrN1hKQjl0?=
 =?utf-8?B?R0VRaXVLY1NoVnJYRlFrMmQ5czgvZ2hqWEliczZobU4zVC9WUktwbHp2QTZX?=
 =?utf-8?B?THZDUlI3N2tuOFUyMGNNS3lMVTZ0N0REZEErZk5xZkVFa0tuWkFTNWx2NE9S?=
 =?utf-8?B?aStCM2M1ME9oQkFNS1krQWpXZzJySUU3ZlhGS01PaGFEYzFqMGExYTAyWnFV?=
 =?utf-8?B?MGxacVpMVHhGeVdkK3lUWDV6YmFUaitjazBMaXlHVDlKR3BOK0NZQzVtcEhX?=
 =?utf-8?B?ellkTzBpcUhXNit6ZFpyaEp1amZITjJtSHJERk02SkN0cUxCZmM2RTlnMytL?=
 =?utf-8?B?djRFZC9kaDFuZ2s4SFhuanNEVmZDeUtMZHZGKzNmdWRxdWFEbUN2TXQweXNw?=
 =?utf-8?B?VlhNMGdIbDlmTFlqWWpLc3Y0cDNMK2dFcnNnelh2Um9Ocm8vMUR0TkxkVjBr?=
 =?utf-8?B?ZGt5SkQ4cGRnSFh2YWhVUWJ4RUFXaU5maGtNQXRBYlE4V1hYNHhmSm9mNUZW?=
 =?utf-8?B?MXpNaWcrYmErSmVlK1JkcUhYbElHcXZ0UmY5b2NTclkvMG11NDE2d1paclJI?=
 =?utf-8?B?WjA0eGMxdUNMRkV6Q1U3Y2J0RHViREFKZVErc1dURHp1NEhuM2pRSk1FS1Nx?=
 =?utf-8?B?RzlmS3pFaThXdFFuZ3ZYcDJTZXVhU0I2LzJkZkdSaXJXa29MR3V6UjNZdVFl?=
 =?utf-8?B?Nm11bnV5d1dlTXJwaFY5NXpYK3JaUXprbWJaajRDRzdqSGRLSFUxUTRMd0Q0?=
 =?utf-8?B?QTJqNmNLdlhxV3RuZFlkd2lyTFNMSndyRzhDb2U0MFhISHZFaVcwaEdVTklC?=
 =?utf-8?B?Qy8xZXZoZjVKT3dqY1NkRElqNTNYRnlaYzlEVi9jREVNbWhDVXpZZUhiNWtx?=
 =?utf-8?B?TXJQbDlpaUUxaXQreS8rRkw5eUJNSTlmQlJaOUFrZnZuN1NPaWJyOW1PMC85?=
 =?utf-8?B?Ry80TDVGRzV1dTdqTUp5WWpReUxKa1RSUHlpNkZvaU5Rb3BJOTJZbU5ycGxW?=
 =?utf-8?B?dGU0QldSWllaaUJDMkphZERVNERmRXJaRE5zSlhzVEZobnk0MHBhQ2ZjejZr?=
 =?utf-8?B?RnRZTkJIcWZTYkFmUlc1Z0lOZ1VOTkd3Z2hRVU02bE9DNXFIbmVnZkMvakxM?=
 =?utf-8?B?Sng1Z2UySXc3WERpZmFYa3o5YlhGdGtJTXhObCtseFRLMUJLVE9ZelcrRUZa?=
 =?utf-8?B?ZzIzcHBveTdXQkJMN1EwdjNDeDBNZlpCcGRlRkFTZnc2NUpEQlB5R2VJUnln?=
 =?utf-8?B?YklwelVqUWJhUkY0aDVyc0FVZkFIMElUY3NSblpKc2Q3cHFGOTNVSTJCSm5h?=
 =?utf-8?B?ZDlDMkRwdldGMXJlVGp3azBFVGtUSkw4Z2x4OWdOVFBTV1BkdFlYL2N2RHNs?=
 =?utf-8?B?UkVPWEwvOFhHcE5pTml2VUI4OFR0L1gvVGg3VXVTbXcxck5FbURuU1RrOVpP?=
 =?utf-8?B?SzE4T01DdER2a3Y5MlRXbVl4Z1hoWGxHUWlCTi9PWENndkUwMjBUUFk4cmtX?=
 =?utf-8?B?a2hmQnovQytORzhzckZYU3lRZEFXbnRpNmNESDJBWGtuMzNKeHVXS0FGNFhu?=
 =?utf-8?B?aFhNQkhJT1BWZ3RXaU9JNXBrNEtOR2xQd09lcU1SREt0YnhPeElkVzZSbENv?=
 =?utf-8?B?WS9ReWFuY1NjSWpCcEVtdHB3aG1LeStiZzZRSkhKWTJ2Z3BOVGU1ZlBBbkxP?=
 =?utf-8?B?aVRqSHdIYkhIL1NVNVAxa1F5dWduT0dzOWgyWDNYVU52ektXRHlXWTc2dTBU?=
 =?utf-8?B?U0x4SXhEcDdKNG0wcDE4anlRdHY0dW0wYXovZy9VZkNlblVDUVZIaENwUmNB?=
 =?utf-8?B?SzZ1VGRBVnBpaGdrNXFwU2NNemJHL2ptSWZLa2ZmOTVaK0FjN0R4QTg4a28r?=
 =?utf-8?B?dStUYVltdjNBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <81168559B2163343940E003AC5F223EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5800
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	504736c3-f5cc-4fc5-9b29-08de01d40700
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDJrSmR4WTh5UndwSWZJM3FzcTNFYi9vZ3ZKVUNCUW15R05IWE15VzF5VTlY?=
 =?utf-8?B?Sm94ZnQ3cURWVnBhQWdiVlQrbG5RMGtTTGRkQVhpS3cvZzRLRFFjOUhvMDI0?=
 =?utf-8?B?aHRiTkxYMmdTQTk1QlpjaDBMUmtlWWRTdUtqT09nbDdPZ2NFWGRKOWVHMnh4?=
 =?utf-8?B?VmxtV1ZCWnJheWh3RFNTMHBSTG0vT2tMbkc2ZWM5cEJvMEVCcitFeE9Oa0pu?=
 =?utf-8?B?ZFhrNlVxZ1hFd1NZTkJRbjd4S1JLV3lUWTlDcTkyU1RlNVlSZzVuNXBOUlo4?=
 =?utf-8?B?S1UvUFNQREJzUFRwWTNWbEpSd1NNRTBnK21pb2FHak1wQms1MTNINys0OFln?=
 =?utf-8?B?ZFl3aDZEUm50VStSRGJVRkJNRHZVM1BqeWxhemZZRzBoekswSmc4NDZkbzVB?=
 =?utf-8?B?RmRGV0dGbERCWWpRRUoyWXI5NElGWFhUcEtuWm1zNm9RU1VXbC9rdzBaWnhC?=
 =?utf-8?B?ZVl2cHAwZHZRUks1c1BrVHVZNDVnZUdiSktQWHRmOHVLbytJNEk3QzV6NzVL?=
 =?utf-8?B?UUtPemNRS1RnTUdDSzRpQ0Y5dVdOZ3Q2L2VqN0hveGF4V3BxN25xTGZaWmJq?=
 =?utf-8?B?dWhxbktiTWwyWU56WkxnUVZyMjB6NGF3ZVZmc1VzWm5Jd2dZWFJqMzk4ZEJW?=
 =?utf-8?B?YjRUL0lwMXkzSXM3Z3NrQnc5V0g3bzNIUDdyY0ZtRE1hNy8wQWJzQllTdS9k?=
 =?utf-8?B?clJPWFRTajZvejNnTHpJTWdjdVhsd0hzdS9IQlNXRHRlRUM2d01CcmZ2OTFt?=
 =?utf-8?B?ZlZwNUhPeW14eCtGYk9FYXV4aENEZWhCVjNiS25yalVMTW55TWlPU1Y1TnI5?=
 =?utf-8?B?T2dhM3J6a2NCTlVndzZaVGQxK0VqQURRUGl0cm0vRjNKK2RGOXYzaitVTTda?=
 =?utf-8?B?bE5KNXAvR0tvV0w4VXFaUjQvVDJtWHd0M012U2h0WGF4SVZJeXRET3lWSWQy?=
 =?utf-8?B?a0UydU45MUpxR3I3R0ZDS0tERHpqZndvMEdIaC9JcFc2a1phVmFScUtYY2x5?=
 =?utf-8?B?UzRoendNeUVqcEE1akFUVkMvU3dHTkZ0b25jc2xyU2g5UEZOQXdUTTllN1ov?=
 =?utf-8?B?SnYzM1NxVnR2dDljUGo2VE9yQ3JvR2RGbzYydTcwL2UxWUlQZVpMSXJULzFI?=
 =?utf-8?B?T3BKdVNKWEdmMmM5RGpGTnoxcTZzQ1hNbzd1emMvK09VTmxFQ29MOCt4Q1VJ?=
 =?utf-8?B?dm1Ld0U5TklLWlJPbjB3VU1oeHYzTnhtbGpBUlRUZmhrMDNNWGxQeWpMcXJS?=
 =?utf-8?B?djFBZlRKT2prVGhiSkVZbDJhUjNSQUsyWDhOMUNSaEF1cXlQcnpEQkpIWW5Y?=
 =?utf-8?B?WER1QTZ4YlFVcmtkQVZGTFV5WWF3ckdpZlh3bWFJQnVtUmpTTFpGMmE3R2ZT?=
 =?utf-8?B?RDRBemVwWGJWRGQ0ZzIyL1VRTW42c0FQZ3pJN3ZBdGFibTJqZmttNm1adTFs?=
 =?utf-8?B?eGhQWTIxQzk1ZllyRVRncUpaNlpBZGN6OVBOV0t0cXU0UE5UWEVMYnRlbWFH?=
 =?utf-8?B?bXQxQmtkdlRWQjZ0ZE0rSldqUSt1cVJkZVRqZzA3b2g1YmN3T0RwVS9aNEl4?=
 =?utf-8?B?Z0RmRnFwd042Z0NVbkpKR2hiMVJ2bC9rbXdMTjBEcUN6bTMwNkRPU1JWNHlF?=
 =?utf-8?B?UnlXSkkrODZlTEVzbE1EMFNmOTBoVGQ0cFc4dmsySWZrZmJLSERQK20xSytK?=
 =?utf-8?B?K1o5cUUxVlFWcitxaUNOVTMzckdtTkw0UXdkdjZiOGFZVkpYQ3BJa0Q0WW9k?=
 =?utf-8?B?Y2tjdkl6NVUwbHRMdXhRMHQ0SHNkL0RkRDR2bUxTdlFhQXQ2amlsdW13WEd4?=
 =?utf-8?B?dlppUUN6Wm8wUVAzRFJySkEwSUZrL2I4aTgxZkYxZ1FyRnZubVBRdmd5Z053?=
 =?utf-8?B?dEpvWG5nUFRtTktydytUOTU4MVptckJobjhBVGNJbUI0UHZrY3JSQzlkNVYy?=
 =?utf-8?B?cHMycVR3TjR1dWMwcWtKM09Zd0I0UGo4Y3VLSE1GZnVHSStMWi9rcXMrZW16?=
 =?utf-8?B?MlZCRTNuS2NZdGlyRGU5NDZaSWo1aDcvVmRMZ1FYWFJtYXVac3Vad0RDUDhj?=
 =?utf-8?Q?W1DmEr?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:52:43.7891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba20f686-ba4b-4c77-37c1-08de01d41b71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8448
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 16:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120203

T24gMiBPY3QgMjAyNSwgYXQgMTY6MTMsIE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4g
d3JvdGU6DQo+IA0KPiBPbiBEbywgT2t0IDIgMjAyNSBhdCAxMDowMDowNSArMDA6MDA6MDAsIFJv
c3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IENvbnNpZGVyaW5nIG1p
c3Npb24gY29udHJvbCBoYXNuxIHigqzihKJ0IGJlZW4gdG91Y2hlZCBmb3Igc2l4IHllYXJzIGFu
ZCB0aGUgcmVzdCBvZiB0aGUgdGVsZXBhdGh5IHN0YWNrIGlzIGFsbW9zdCBhcyBvbGQsIGlzIHRo
aXMgcmVhbGx5IG5lZWRlZD8gRG8gYW55IG90aGVyIGRpc3Ryb3MgYWN0dWFsbHkgc2hpcCB0ZWxl
cGF0aHkgZW5hYmxlZCBvdXQgb2YgdGhlIGJveD8NCj4gDQo+IA0KPiBJJ20gcmVhbGx5IHN0dW1w
ZWQgb24gdGhhdCBvbmUuIEl0J3Mgbm90IHBhcnRpY3VsYXJseSBpbXBvcnRhbnQgdG8gbWUgZWl0
aGVyLiBJIG9ubHkgYWRkZWQgaXQgYmVjYXVzZSB0aGUgZXJyb3IgbWVzc2FnZSBpbiBHZWFyeSBh
bm5veWVkIG1lLg0KDQpGV0lXIGdub21lLW9zLCB3aGljaCBjb3VsZCBiZSBjb25zaWRlcmVkIHRo
ZSBjYW5vbmljYWwgR25vbWUgZGlzdHJpYnV0aW9uLCBkaXNhYmxlcyB0ZWxlcGF0aHkgaW4gbGli
Zm9sa3M6DQoNCmh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbm9tZS1idWlsZC1tZXRh
Ly0vYmxvYi9tYXN0ZXIvZWxlbWVudHMvY29yZS1kZXBzL2ZvbGtzLmJzdA0KDQpJ4oCZZCBzYXkg
d2Ugc2hvdWxkIGRvIHRoZSBzYW1lLCB0aGVyZeKAmXMgbm8gcG9pbnQgcGFja2FnaW5nIGFuZCBi
dWlsZGluZyBhIGxvdCBvZiByZWNpcGVzIHRoYXQgbm9ib2R5IHdpbGwgYWN0dWFsbHkgdXNlLg0K
DQpSb3Nz

