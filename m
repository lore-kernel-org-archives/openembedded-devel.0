Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21E4CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:41:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.70])
 by mx.groups.io with SMTP id smtpd.web11.43922.1760362868803610118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OC4nWooL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OC4nWooL;
 spf=pass (domain: arm.com, ip: 52.101.69.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ENP9N1Ai/cMBMJYGumpI1efj23NxiWu4jENJvNAldJf4ewnq3Bn8S0qZDCynGHBgeAgtrJipIaYvRtYu/1VrJm4XlBUl7HP2hckfiugsQYRy47j6SmdVo1czfkMUcZSW/lsvl5MV7nJuYukwYZbn69cPUNaLVqml9Jh9+1HVw/e90U5TCjAGMCcZgtm91qtc/8J55sWH5IeuLRud6ULmeJvtME7Ii08alEAz/0ngLotIMwVmoIDD12rDSdKFHGBx5uuoZHR3zB8ZNnJxW2JcNG4mpnsoGSF5OCMOcCBNB4gqHDo0ULHjxYsdhbb0p6wCEbKDyB+3iLQD+NMFAg8inA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AREFVzmJbzjtQm6P0ORUO07QUMqCVh6cRvNL6dN95iI=;
 b=DjwPtTGjWmmIzpno7lvrCSLp1cPfHwucqKeplgkzSAwumtQzeOLzcvdF6bKX+NT9a2jzVV/NEAhGeceronxu7p4KJXy7K0PIQnXaERIvkXg1QOBj3XzrD7rrV55v29s9Sdl2ILthvRoSl5LyOsnRNQlIDnraWlnwkLYxSe6u70E2epcM1ZwUtyO0amsGn35o+aCFUTgbVC1cOUjxIypwNBog4Pq4q3Jgr7k0+H9LPTg28AJQ1hlSmk2/B3g61B8Jo54NjOQ4Qe/FiebV3FE80/J/e8mb7ZUAL9+PPREqHzhO03Tmk06Nd/Zta6eH4NPSlKxQxjOTLCGXgcx+uQfDjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREFVzmJbzjtQm6P0ORUO07QUMqCVh6cRvNL6dN95iI=;
 b=OC4nWooLStLKMbOWTRFlGHQaiVrw7uKdzAAZugFVCOoeMpZgRK9gbIjDl++OpdvSgduAZ+1fSRMxBoq2moSpKLB3KvwSHmyxTemY+xHsede89UJIjcffpwRubD+jem3DP60QpylcJpSLBXGdbGh/laKRSxKFCPChLUjyeDz/Fxo=
Received: from AS4P190CA0033.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::13)
 by VI1PR08MB5535.eurprd08.prod.outlook.com (2603:10a6:803:13e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:41:04 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::d8) by AS4P190CA0033.outlook.office365.com
 (2603:10a6:20b:5d1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 13:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Mon, 13 Oct 2025 13:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQxbMbNEfaE90w8LKhMQ+hNTFjNnmbF+mw3igm0EQNkr1nbQQW1W2jeghcPbisA55aTG9raC2EAj3t/vJKme9hyOPMMp4Zjxlmq+zB3kciEibZhoZAGtszYxkubwWbRguKwsReVrgbsObO8CWxSSkcUZK5p6UKzmJZD9KU5nY+k8/AhWsUIlo3qzB5VgGbCZqu2NoJrgwzB7h035ljDHuRcyljdIs5mm0EzMFwacgZISYsS7H53RSCgYNazbg/crprEa+40DsCFKX763m/TxMIz1k9dagAscBagtNKd4hgOZE4Jhdx+pqx2TlwzSafLnv65ehKcTQzopiyhIO+8/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AREFVzmJbzjtQm6P0ORUO07QUMqCVh6cRvNL6dN95iI=;
 b=wJCv4NWhcQJN6CBJ6E+VUTfkc4FiDvamasbkJwcei0pdvjpL7yGMdtSG6vpOGRkNh9sb8QvV2XgpDYuVs+el5X3rEOM8PJtqO/Wb8v8f/PVFdcp7tQB1bfoNBanq4IJRjXSXBak3oPpfLzNCMwVCxwprk4PaLxYFTleG2uCJbYZOWWXCJk9SxdGd1jAl/BwsgIb74JI1vSf6eipq4uanav923HLlJ1I2AkbN1kGRrJuCYWuQSOaVsQoBnmFv6tUQpUcgchPbqyISvdNyd5dzRC44TSkLLDP/QiSTyYWRfqymJCPP6f8Q75FP3UTnGtcU1WjfCzWUifpKNN3jyjOEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREFVzmJbzjtQm6P0ORUO07QUMqCVh6cRvNL6dN95iI=;
 b=OC4nWooLStLKMbOWTRFlGHQaiVrw7uKdzAAZugFVCOoeMpZgRK9gbIjDl++OpdvSgduAZ+1fSRMxBoq2moSpKLB3KvwSHmyxTemY+xHsede89UJIjcffpwRubD+jem3DP60QpylcJpSLBXGdbGh/laKRSxKFCPChLUjyeDz/Fxo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9683.eurprd08.prod.outlook.com (2603:10a6:10:45d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:40:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:40:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] CVE reports for meta-oe
Thread-Topic: [oe] CVE reports for meta-oe
Thread-Index: AQHcPEZPx67gaiCQKUuBLuY7/RjY+rTAFUeA
Date: Mon, 13 Oct 2025 13:40:29 +0000
Message-ID: <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com>
References: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
In-Reply-To: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9683:EE_|AM3PEPF0000A791:EE_|VI1PR08MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a2205a-6ee6-4a9d-b510-08de0a5e26dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SzBOUmU1ZmNnNUhKNU82di8yZWxkc2hXUExldGw1Y2sySElsMlZOSXpEZUNw?=
 =?utf-8?B?NWRoVVBQbmtyQ3A5SkVDc0F1Q2RxR0oySGM0aDdhM2liL0pHRjUycWJYMEQr?=
 =?utf-8?B?MDZRckZWZFFqbEJpeXhLR1RUenJEYnFrNXZhRzYxMWVxMERFaEliRVQrOVZV?=
 =?utf-8?B?c2NIa3BxZm1tWk9HMUx0d0tmNDFNdmRxQ2FYMXc3QzRRUEhOVXg0ektLL0Yz?=
 =?utf-8?B?R1h4TVlVSG0xWkJaTlFUUS9keEFHRGIvaHNWRk50U08rSDgyeWtlN1piZXRq?=
 =?utf-8?B?VUpiQ281RUdyZXZIejN1aXV5UlJVTEJ2TzRlZWNmNldOdTdEQ01JUU9vKzg0?=
 =?utf-8?B?RE1zeWlDb3BSVjREQ3l1ZHhPd2duZTA1a3VaOFNMLzlEOEJ4blo3cW9ncno2?=
 =?utf-8?B?OGh6N2JNVlV5ZC9XUFhXQVJLRS9xQ3dVMnQxQW00YzVFcmhQZVhYNXJrQ0x1?=
 =?utf-8?B?TEF2bXQrTktrdlZDc0ZQbGI4elhwUlgrYXp4c04vUWQxYncraDJ6d3pVVkxj?=
 =?utf-8?B?U0ZCNVZKMHdTakI2emJsSlVSMnR0cmNnUXU3ejJ0NzNYUDJZREduRlFVajZa?=
 =?utf-8?B?ZEhqdFJFQ0xOUUhlUXR2SmdSNFp0NUhpb3ROYWt4SDZtUVRIRGJOeEhEWm5p?=
 =?utf-8?B?R3N5QUlRTXB2K1M4dDhISzhFbWhXR0tKQ1pxVmpGN3NWSzRCSVBZak9rd1hZ?=
 =?utf-8?B?Y2J1RmMvUDlLWDBocUg5dkU4YWJxYTZMRHJ3WGwrQVloS1FjTnJpSEU5dU1O?=
 =?utf-8?B?aGF6NDcxZVRTOXRSN0JiREQyZFpSZS9TaDVPbmY2RzVFNFp0eTJFWFZBZloy?=
 =?utf-8?B?UGJvUlFrTTZneDZPSjUvOWk4alBOdlBzOEc5RkswSUkzenBYUDE3TG1NYWdn?=
 =?utf-8?B?R05HWklPQy9qUUk1MmJOcytBbmF2SGc2dExwVGNoY2htdjI2RmRybVRIRWlI?=
 =?utf-8?B?R3hZTVFoMy9GLzFieTh1T3FZZ2ExTXFZK0dFZERwdlRlcmRsQnlOYVlOSFFa?=
 =?utf-8?B?ek5LanduN3lzS1NZYzRERzVzeTFpWW9CdUZHdXAwcHJmZzhqNDhHZ3YzSTRD?=
 =?utf-8?B?L25lOWtNNnlpY3NlZk15Rkk1WVdIM3o0ZUU3SGFCWFFZbllsVHlLSXJBUity?=
 =?utf-8?B?OUdTSVVCUmw2dm9jWUpEYnYwUWNteWljLy9LejZwWjRjbCtlMHNVaTZkVVF4?=
 =?utf-8?B?ZTIyS1RmU2VvUUdYQU5XOGlNRHdOeEEwSkxWbWc1WTBrR21mLy91Y1l3d0RB?=
 =?utf-8?B?YkJRZFZBSnl6TUNYekFuU3d5RGxoWThya0hHVEYvZlFCaTl1RTBVTFlHcDNE?=
 =?utf-8?B?RldJR05POFE3b3ZrYmluZmxUa01CaFlXRU54dTRncDV0ZUpUeXNVQ1BIenhn?=
 =?utf-8?B?TEQ1bHR3Mlc0Um5ZZ3o1VU5UenphdXhoaE9ZaUVtNCs3ME50ZFdSWEdQVnZJ?=
 =?utf-8?B?RWFIU0ZIeXV4blBISzljTjNWNkpIQ0IyRXZiUit2cnBEeU9FTDRQcDN3Rk5h?=
 =?utf-8?B?TzdKZExqK1JHNzFVekJCREdRT2Uvc3Zxd1MvS2Zpa0ZDSlpsTlVhcHliNVJh?=
 =?utf-8?B?eFQ0dUtuZU5ENXplelJhQnpENHVvYUN6M3pIWlc5WE9vRjdSQ3hRaytSWmds?=
 =?utf-8?B?ZGErOUJyVERUSGJ6Q00yZFNoUnFvS2pVclNSWm96UFcyR2FJaVg3YjQyVWpU?=
 =?utf-8?B?emJjek1seHdhVHErM3pjUVZjWXVmRXNFRWtSZmtRcDR2aWRRVFRMTUM5Znlk?=
 =?utf-8?B?bnczcklxR01KTnBkQ2xlYXdsM09PczYydG5xbVdKbzUyTVgzd01EdGdkN0hD?=
 =?utf-8?B?cXI1NTRJa2l0d25TYm1IUWZJOUx5bFNuWngrRFhPQmplUWRkbDRadFVQQWl2?=
 =?utf-8?B?R2FmUWI5a2ZaNFlGN05VMFg3MUVrWHRCU0tYNk1HVDJQbmJTc3Q0R09FakRx?=
 =?utf-8?B?MVlOS0lsbFBXRHRFZzFXSTQwNlZmd25BUm9BTWpJVEtIWFo1SnZSUmpWZDVJ?=
 =?utf-8?B?U1ZkTmxxQXB3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A677B2A32E3A542B8ADF67EC42FA82B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9683
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	acd2979b-094d-4e5a-ad4b-08de0a5e1332
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2l3NkZJRHgrdHhJcFJhRnJ2cXg5OXQrakRUZ21TeVEwb2RGVmlOK3I2ZjI5?=
 =?utf-8?B?eGxRQTlkYnh5NHdOc1ZEaUM1VEhaRmJJNXZEYUxOVmpVNEFwNTdYRE9wTDNX?=
 =?utf-8?B?bFVSMkpiWEJiZVowV2Q3clIrMTJSYm1sUmltSnlhaUhuejh2Ty9lN2tJeEhk?=
 =?utf-8?B?Q0JYZzkvQjA4WjJNQjNzQlFlV0ZrcW1GeUdVcVUwTGZhdjg3RE9oRFRGOW1L?=
 =?utf-8?B?OUp2cUFJdkppNmxGamE0N1E3VFBmQ2Y4K0tnSklPTC9ET0FYcEpiSlBaMVl4?=
 =?utf-8?B?cWkrM3VERFlQTCszb0JIMVdCMllwZWN2VmNWVU1XVkZBcURzU0lKMllaNmFH?=
 =?utf-8?B?eTBQenFFK1pDOUtUdnprcENoMWprdUFwOXAzbVNXK0lxMDFoWlY4cWdDdzJq?=
 =?utf-8?B?ck1uT3MxS211Q0R1Qnl0TDVYbWFaQURsWVd4YkNMbWFsSTUwRXZyakwrSkxC?=
 =?utf-8?B?eVRTR3Ywcjdva2c0V3dMdnUwTk5yNExmTnYwWkdyK2tUblJXRHZXbEt5Z0Rq?=
 =?utf-8?B?SFJpa21ZV09HRTNMK0s1YXNCdVIwZStvZStMWm1pTmZFWWlmdU1XN3huTzB2?=
 =?utf-8?B?UUtSb1k2eHpSQXpCTnNkdzhDT3JGTGRWdTJNeVplc2l0am1TWnFIWTZmQVg0?=
 =?utf-8?B?aTVMb2hXMUVtdVgzcFl1OStxVzUvcDN6MnB4VE5Sa2I2YS8zekVaUUVMZlVz?=
 =?utf-8?B?c0VtTmhTYUM0WEpudC9RR1FBNEtqc2VWdzcvNUwvdmNBeHZCOE5MckRLQmc4?=
 =?utf-8?B?eVA4NUZsenZRam1TNVVmV1RsZFdOUGZmTVVnVlU5Qk5yS2JCK2lFQzB1ZHhx?=
 =?utf-8?B?bGhqTktRY0xjcnZlMGd6MVhlWktxdjY1S3o3RXkxVGIzUGJsN3NJUkJJNy9Q?=
 =?utf-8?B?bHY2OHpDV3RDNExCeVdhZUdUUE1POVVOWnpzRXkxUmE4MFFRazd2WnhhdDZW?=
 =?utf-8?B?WG13RFlBWjlzdFZnUjFvQ1hlV2hVSzlhTXc0N1lCWjZ3b1ZvNWJCbDNUTTBv?=
 =?utf-8?B?bmNoaXZUR3cwWkJKdVFKZUh2d3B2RTc4Rk5yd0NyRDU2SlRaVCtBRWQyV0RY?=
 =?utf-8?B?VEtHcDZsd0VpdGVvcGFPNnpLNGN3RTU4enJ1UzdiUU5BRTQ0SzA0VTQ2eGEx?=
 =?utf-8?B?Y2taNlNjY2FHcUY0cjNweWRhSnFaL2VLQWZkWlBLWnNibFZkV3kyWloxUW5F?=
 =?utf-8?B?bDZud3pOTmNKc0E2SmtvdlViUGNvL3JjTnRJWklqRGJtSkZoclVSTnA3WFhX?=
 =?utf-8?B?eFBMUjlVYmQyaTJKWTUvTkZtSldOTDd1aXNHa21veW9LSTVUUjl1ZDA0Mm4y?=
 =?utf-8?B?cGRGejlKVHA4dWp5bXQ4VE94bzdRTWk1Ui9TU3hZMndFZFVrdW9kK0p2SVYx?=
 =?utf-8?B?aWtrVjN1WjJSeWRDYWlockZQdm9sYWN2WndNWThtSzNZOCtBei9NbmdrY3Bq?=
 =?utf-8?B?Wno1R1B5dWttV3E3ZGRPb3dqTmUzMVVxeGxpNnJxc3RhaDg0NEZadUdsektX?=
 =?utf-8?B?b0NXNi9sTTdNcWJpcDBHMW5wMGVOSVlwbVloNUs4eVdITzR1N2NzMjI4SlRZ?=
 =?utf-8?B?NW9wUEJnVWRDeDhjdUlMc1RzaktyUkNIdEYxMXBhOHBHWFZoanBZZUsvVjFJ?=
 =?utf-8?B?SHhTdHN5aTJVTmNsRDZrOEsweGVVbkFwdGZNdWlpYVFwTmJFZytDdzdCaXJz?=
 =?utf-8?B?R0Exc1FaKzI2emN3U3BSb0ZIcld6RHF4NEYzMS9DUVNyWkR2S0ZWekljQTJj?=
 =?utf-8?B?S3lFdzhKWEVMb3ErdmxWQ2o0Z2FNTk5xcHV0N2hRTDdJbHRoZ1hHd0JWQ0R5?=
 =?utf-8?B?N0NYUm1TQ3EwcE1ib01kQVBhK3hrRXRQejZkYzFRTk9rQ3FzWm4rV3lKNGdV?=
 =?utf-8?B?MWxvSXVVWk8vUTh4VG5uT1JZcFkwY1dYQlV2b0thNTIrQ3QrOThZVzNiMVZU?=
 =?utf-8?B?Mm4rNzltTjY3bEZnOWlyVnBwWTFkNVJFU0xiSHYrWnM5eVduUTdiZ1BmcmRW?=
 =?utf-8?Q?+Sl/+tsDaAy9H0fzbQsLetp4fqGwxo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:41:02.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a2205a-6ee6-4a9d-b510-08de0a5e26dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5535
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120538

SGkgR3lvcmd5LA0KDQpPbiAxMyBPY3QgMjAyNSwgYXQgMTQ6MzUsIEd5b3JneSBTYXJ2YXJpIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxza2FuZGlncmF1bj1nbWFpbC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IEZvciBub3cgdGhpcyBpcyBraW5kYSBleHBlcmltZW50
YWwgdG8gc2VlIGlmIGl0IGlzIHVzZWZ1bCAtIEkgZmluZCBpdA0KPiB1c2VmdWwgZm9yIG9lLWNv
cmUsIGFuZCBob3BlIGl0IHdpbGwgbWFrZSBzZW5zZSBmb3IgbWV0YS1vZSBsYXllcnMgdG9vLg0K
PiBJIHBsYW4gdG8gc2VuZCB0aGVtIHdlZWtseSB1bnRpbCBhdCBsZWFzdCB0aGUgZW5kIG9mIE5v
dmVtYmVyIGZvciBhbGwNCj4gbm9uLUVPTCBicmFuY2hlcywgYW5kIGlmIGl0IHByb3ZlcyB0byBi
ZSBub3Qgc3BhbSwgdGhlbiB3aWxsIGZpbmQgYSB3YXkNCj4gdG8gbWFrZSBpdCBoYXBwZW4gaW5k
ZWZpbml0ZWx5IGluIGFuIGF1dG9tYXRlZCB3YXkuDQoNCkFyZSB0aGVzZSBnZW5lcmF0ZWQgd2l0
aCB0aGUgY3ZlLWNoZWNrIHRvb2xpbmc/ICBJdOKAmXMgaW50ZXJlc3RpbmcgaG93IHRoZXkgZGlm
ZmVyZW50IHNsaWdodGx5IGZyb20gdGhlIGF1dG9idWlsZGVyLWdlbmVyYXRlZCBtZXRyaWNzOg0K
DQpodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS9wYXRjaG1ldHJpY3Mt
bWV0YS1vZS8NCg0KKHlvdSBjYW4gY2xpY2sgb24g4oCcbWFzdGVy4oCdIGF0IHRoZSB0b3AgdG8g
c2VlIHRoZSBicmVha2Rvd24pDQoNClJvc3M=

