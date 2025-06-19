Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C104EC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:09:21 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.web11.2032.1750345754490810875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=hxC8B7tG;
 spf=pass (domain: axis.com, ip: 52.101.66.30, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ0nAqxvH/7L7LPEUlZkfIhkO9+lsTEqBAWlVUgYVpbXjBfe+IMmeTDUiut+8jb4uUqXTa7KT1eFNkfFE5sYYk2Or9irFViB1M9QgYgL4ofjo8MzRUmNbWpf+MtoduV6x6Y0l0k5HiIpb6SA42iT8kDXS6oJWrxNJY/1hbvrBfc8yQRjrQ18ksxo/tkBr05aKnDdMv4pMjPp1fRNwtussL+6jaLz4xgzykqdOicfHF2BkOsHYM3pfRLs7g0Fpk9xhAAGWIcSbQpmjiyQCkiKgxOa2V4jbGMSPXReXJgn8IzkhMDWK56wm1TOMEf5eNKdSGhXMnpMv+/iZ16yYiu4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkhM7a8WdK9QXxSowrTdI8DoI1SnAkDCaHw2BAnLZGE=;
 b=Q5q5R7EK/eUSypQKOnt6OvWXHq8y4w+crKOv3Zl5BdT0NyMFqxQSipYfoGs4tU9UQadLnBfbcGwYRsH6uV9VJEofg8DF3lQGB9361mvblZHXDrWp4/7/qkuXc6EH8s28gTFKnf+rT2KxdPFqanh9FpUwUXS3db+KSF8Uxc3yGV7WDyQSIA2w5k6PBbnItOg337x4/kzP4tjVRyFsNJvEC3/Qg1HZKDpaRUFY71x7KJkisRnzkEz0TK7DjbN2FgY94MzCUIoNqJXp+Gm08FX5UFqOU3DQuIzRMOHxJX81D0HJRs7V71m2Ejrc2H7Iixnxt2Hr6M+yMqEXq5JwyXSW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkhM7a8WdK9QXxSowrTdI8DoI1SnAkDCaHw2BAnLZGE=;
 b=hxC8B7tGQxSYxrWZNMpPgDs9eSAjpAbsMzGrTNu7NJ43dqyiUQq7sFe1Kf1Lxw8cNbyHzhmN/unFCWsfZgA9kT/9zL36fuCkp/LqH26ugRMrOByIt/lf/ZXEsHfSJrOYhBusL6vPBFg6xIVMoHoYivU1aCbDYH9O1Ug+gHInn7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by AM9PR02MB6756.eurprd02.prod.outlook.com (2603:10a6:20b:2c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 15:09:10 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8835.018; Thu, 19 Jun 2025
 15:09:10 +0000
Message-ID: <25e57cee-5944-494c-962d-a40f03b429c5@axis.com>
Date: Thu, 19 Jun 2025 17:09:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Use go module fetcher
To: openembedded-devel@lists.openembedded.org
References: <184A7990B9D77B61.3832@lists.openembedded.org>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <184A7990B9D77B61.3832@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0073.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::23) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|AM9PR02MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: e1073057-1d96-45ab-5109-08ddaf433e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VlJlTUJBVEsrSTZYckRoWnVYeG5La2drQW5PR1BLcDI3Z0NJbDFTZy9tS1Vm?=
 =?utf-8?B?d0tWNldMMmFtSGc1ZWlPNXpuN2hoeVlTYzU3cll1NmxtdkpqekJEYVdvL254?=
 =?utf-8?B?bEIzY3R0ZXFKVGl5TEpJbWo0WTIyRXErSEdvNUpYRmQrNzJGbEovNTB5UTYx?=
 =?utf-8?B?aHpRemk1ektOaWpTcjNmMFdkWitwcTFUczI5Q1VNam0yMGNFVCthY2MxRTNq?=
 =?utf-8?B?UmtiM25hMnV0ajNnSS95ZXdWL3I1azJMMUd3RUN6eDZkekpTUW1LL2pQckFQ?=
 =?utf-8?B?cG8wdjd5K0luNnRuSHZ5WEZqRk5kN1FyVWlJT2ZuamgxVTdKNEMxbjJ5RkZF?=
 =?utf-8?B?bHpNZE1QQVBiamVHWG1vMDMreGgyVXpGVWhrZTYrdHZqVUhpc1RsQmlRUEU3?=
 =?utf-8?B?VWNxam5saE9tSDltNk1Pb1kydmJBWW9EQ3BhV09Za3piN3RJdWFESGdUVVdm?=
 =?utf-8?B?a1pzSHBoeUJGWW1RNks5YytEY0UzMTY0cDR4em55TThUVHA1M25KYlZlTHlK?=
 =?utf-8?B?ODgyOERiVGlXbVdCUVZyQVh3ZzJXNmFBYWc5REpPeEJTUW9pUFJDekYwUHN4?=
 =?utf-8?B?R1RzRWc2SWptSHZkd01JcUdibVA0OEtNM3F5MVVCd3JnWVBpVmZFMGtoaFhS?=
 =?utf-8?B?S3ZoTmEzSjYzTEJtTHk0WDFXR1JSMThuU1ZsM2RRbTJ0d2YremE4bUJpdGJC?=
 =?utf-8?B?ME5oVmViMG9HS0RDWWcwRjlCeEROUE5RYStRa0tybVBVRGtwdnRmTjNXZUp5?=
 =?utf-8?B?RWVTaDJBWDRJZnhxTmVQTDN2NWlXS1JXNXF6QTZiZVl5OWNSdWpRc3NLM3Z4?=
 =?utf-8?B?Nm9XdDZpVE1XWFNMeVhZMGRsNFJyRlVXZGticGdNVE1aeVQ2czQxRC9QWWsw?=
 =?utf-8?B?Ry8xalNwelZTZE5CSnZ0aDQ2WnVzMUVmUHhFcVhVdTdGREpDaVVSM2lFTklL?=
 =?utf-8?B?WUNrZWpKVDh3UXNtWFBkRCs0V01LbXRva3pjNFpxVU0rZ2RpN2p6MnJ0RVEz?=
 =?utf-8?B?RWx1S01VcW5ISHpJR0hsOGI2YjdNZzhoVFpjM0xNNFZqMUNjMzFCMTdteEk0?=
 =?utf-8?B?bEZzZmtlMFRocDVxVGlhUmNXRFlYZHFSOS83OUNOOFRRaEtpeTl3Qkl2SVFh?=
 =?utf-8?B?YkUrMjE1K284eURHRFNld0J4eGNtWGRxK3lVclpDSnJaUHVINncrVk9XUDdM?=
 =?utf-8?B?enFMdGhZZEhKVHRyYTd4VWFENGJ3aEEvek50eEJ0UkFIbTRCT2FNTk44V1pZ?=
 =?utf-8?B?VGdLbE52UXVveUp1a3hRUWpHN1pPRkZESWY3WTl5KzJtcGROZEg3SHdtM2Yx?=
 =?utf-8?B?U05hUTVhMkNOb3RKSDBaQTJ6blJvZmVPbkY5czBzQmE1R2JWNEpFTDl1YTZi?=
 =?utf-8?B?TjV3MzJvdWVKMzZicm95bjFycGNqZ1ByVU4yc29LZ09RazV5ei9reU42NXVv?=
 =?utf-8?B?MWZ3aTFVdTRYL2VuWnRqWVBxTDI1b1VGZ2J6bXI0NzV4YWFVWktiN0phRFUz?=
 =?utf-8?B?RW5WRUtsZDYxTDEwVHNQZkFwWUdtK1VCVFBYNXYrcXFKTHFKUUtROGR0Zlo0?=
 =?utf-8?B?TzZzd0owRFRxYis2eGNNeGF5Wk45b0x0K2tSV1JHK3FVRGhpVlBvaFZ2c09F?=
 =?utf-8?B?dC9LeUp2bE5Xc2E2R29TRjNMaEdzVDkwK0hZMWlscytEQ3RYY0h3YTBjVUEy?=
 =?utf-8?B?NHc4UjF0TEJmcnE0M2tmVjJ3SDVKL3ZIZTlBZk5VckViQ2pwdVZ6TGcwY2FZ?=
 =?utf-8?B?bFFDWlR2SU1rTDFrTXRFNGpFMVhjTGxTckdtSXR4alFGdmJ0RGtkMEgwcndw?=
 =?utf-8?Q?pYImQazt5uABCfMq1By24NA4x6enuAe6Qdl6U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVdKTzZVbmJDOEgyNEN5U2o1UEJpK3BvaHlILzIxbldGcGk4UmFpc1hyZWI4?=
 =?utf-8?B?NVJBM3lmYTNwQ2sxQUNkanZoZnNUZGxPSzIxUzNPZkJRTVFVSVA3bC8xQ2hl?=
 =?utf-8?B?SVdpdUh2dER5dUkrbzBOMWVyL04zam1pMmhzQVArdHlTaUg3TllxMEQzWFAv?=
 =?utf-8?B?TFV3aG8vdlMwaWVvZ3J3ekIvcVlSWWFUeGtQY1crWGZvdXFsenZlQXZsYXpk?=
 =?utf-8?B?WjIvcjZ2SEY4TnFaUVljaTBvZDBmblpNaWoxZEk4K2drL01BZHN3S1daaHh5?=
 =?utf-8?B?RURRcVgzbE5mWEJITjU5d282cmlHYWkwM2FwN3crQitVa09yMEVoUEFGdHRU?=
 =?utf-8?B?MldyQ0ZZaEcvWmhzS3YzNWxjUjdQczZ0LytObE9zT2tSQnFaSE0wUUEvektF?=
 =?utf-8?B?RkN0eG5JMnFjS1RWSll5cHdtMEVxcjd0aTRrblhDM20wVnRqZkFMNkJra1dJ?=
 =?utf-8?B?RG10VXE0c0JkMWtTRFBqZ3ZPVUg5RG9UYnU4THVkL05rclUvUHNuWjMwck5a?=
 =?utf-8?B?VmltNndyRFpVbkNKa0EzeWJ6VHNtSkp4eW54alBTTTQzUFFYRHdERERCS2ky?=
 =?utf-8?B?UjN2RTlEOFN5Nyt4Mjl5bzdNeHdKaUNWZG9mTmhIUkFXY2oyZ0J6bi9rdy9z?=
 =?utf-8?B?RUR2TlNjUFVZTzdpRWd2SDRPUlllQ1EwbU51Q0xYRm94dlEvRXFicWFBbSs0?=
 =?utf-8?B?SG5aNlJhQUVYbjI5aXpkZml5MVQra0VGKzBqeHYxSEgzRHNTN0xIWktNVFRa?=
 =?utf-8?B?Z3lhclBVYmZyTmpKYXRZYjhaeGM3SlJHTG9HTG5WNTJ1cldrSU96a2xYSSth?=
 =?utf-8?B?ODFObjYzVWV3SEgza2N1c3lzRFF1YUV2MFZ6TDdsNTBaV3ZZMXVxMG05SVlJ?=
 =?utf-8?B?VldlZ0VsS2czRUg1UFpGdjVFdlplbXdpekg4R3pYaXBSVXV5QytHZk15cVR1?=
 =?utf-8?B?OVQxdHQxRkJsWDNYd0ZRNlZhcHJ6WXM1M1k5Q3FjODRpaE1oNC9FYlJVeFdl?=
 =?utf-8?B?RjEvRnoxcFlDcDJSbGdIdTFnKytITm5QWEN2M3lJMmE2OS9hSHIvNWRqVWsz?=
 =?utf-8?B?ZkNTc3ZkanhqaUZreUw3RUhtdXR1b0ZzYkZsZ1JSd0w4ZWhBTGF0K2RTV2xJ?=
 =?utf-8?B?RUpHV051bGRMYUpLRXpqRFBFem13SS9KUUJUaU5Jay93T1FUVER5dEkveDBz?=
 =?utf-8?B?eFJ5azRGMHNtZjlLWVByR1VRTUprdTZkaU0wTm8vMmR3VEcrb05iUUh5TSt6?=
 =?utf-8?B?S2laMk1YOVRCbThaQW1EbGl5eCtaYi9CSUFXQzBFRDRvT3c5MngzM1Y0UEtL?=
 =?utf-8?B?cXdLb2Z3a1haQXlBL240VlVCMCtFc01xU1hWRWFnUE0rWm80QmZ4SUZueUdt?=
 =?utf-8?B?aTZDeFRabmptak91RXlYUXorNmRwT3d1cDNNL2VValBGUDJCdVdsMTFzbmNW?=
 =?utf-8?B?YVROV2h3VzFZVUgvbUpYQkltS0NEanI5YlkyNmtxWmNPaXlBY0QzdnZUS20z?=
 =?utf-8?B?YmV0QURFK1RwQkhoY3ZnQ204aHdjZDducU9uVnZiS0FzcTFzZ1RSOWVtRlNp?=
 =?utf-8?B?d0R1elhhRnF0KzBGTUdwOURZSkIwWm8rcFdqU3J5ZUY1MEZoaTN6eW9CbTBP?=
 =?utf-8?B?SUF2MjVRamtPSDM3blZ1STQ2dERQVUZsT2Y3SWg2MkNkK3QvV3g3OFhjdFlE?=
 =?utf-8?B?aFh3K0xKYmRmUytvU1RobG1nM2xlY21OVllVZmNNOWUvc3B3cm5vUHZNY3hP?=
 =?utf-8?B?OUptb1c4Qm9tR1lxVk9SOVlWRFZ5cnlDUDdweU1WeG01SzU4MU0zUVRIcG13?=
 =?utf-8?B?Vm91cVZyQnphRXJiQldNSktYQWlzVk9oQkt1Q0liWnVGRFNDcVhHZUZsbWRh?=
 =?utf-8?B?MzNmYXhtczJyc1ludm9CSGgyVFlWVUFUb01aZXpaaWZiaThzM0VTS2R0ZExY?=
 =?utf-8?B?aDZlR0s2QkRGNlJTb1N1bzRMRWd4U2VJUTlCY0xSZWlMVFNlYW96NG95WlBX?=
 =?utf-8?B?NjZHbGRGZjBaajlxVncvQVU0RjhzYktSTnpGRWtpd0lyL0kvSGdaOEdJeFlC?=
 =?utf-8?B?UHhpTWhJMkh5L3pIV09jTVBYWTVYWkNlbkZrOFF1NUdXaUF2aWN6di80Mkxu?=
 =?utf-8?Q?zF+F58xJgrVQQDMKGhp4MusdH?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1073057-1d96-45ab-5109-08ddaf433e82
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 15:09:10.6102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrgZatH7aNB7sBBhZISFCq6mBL4O9MbQWg5jUyXz2aN/JAZgLTteAoe+U40tGeV43PSpSOFhIY7g8nz/kJPUEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6756
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 15:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117948


On 19/06/2025 16:57, Christian Lindeberg via lists.openembedded.org wrote:
> Apply patch to replace github.com/pkg/term with github.com/kraj/term
> unconditionally to avoid conditional module dependencies.
I suppose the conditional replace could be handled by a 
LIC_FILES_CHKSUM:mips
override instead adding some more complexity to the 
go-mod-update-modules class
to support it there.

Christian

