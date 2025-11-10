Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82B6CCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 05:59:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41772.1762754379153849107
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 21:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=avm2kcs2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3409702c7c=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA4ssHi2892822
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 05:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=NwMO4KBhL7LMr+p98MNM/+gfTUyhrrwD2PihoJR1CFs=; b=avm2kcs21gcI
	tOdRDSSsqHUK8q/7JjfcxpKVSzvJpn46ci9qtJIxUUqtPbPUOYwfySRWo2Mo/bPU
	6ggK1HD7IkobHn5BgjATtJ8NGjmShyvPOCwoVREztFjadRgz2tHJainlRTgmzcT1
	jhZy4ORMVOiKLzA3Kyjw8HJ0qArSfF99WEC5jbp8huImAIAkFYs2VR7Xt59ZU1is
	K0xzhUcc/5bPiNI9u+oq8lAc7ZvOEskts0+UUBmobX/xcym6d2Sy9kigfaml0DA9
	Az7FdPrDPBXI72isynLKQpYUfeF1TSA65tzDgA6gTpzokjI/+6wj6B7yaUnbY2j3
	lGMz/zBBTQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x1kqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 05:59:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSZVryGFVqEaRvUBAhXOtvXhX3RVQ5qBi/5sBV6X9VLVgedlieQ8hP62htstNCU+8Zx3787ask8JeNnWrZHsFuDYgm1tt+IWKZ7UMelU/JkBGhpFr4WnROaRdDXT0IQGizMACdIFq5Qpco4nHgftmWYUITrul/FH7wiFScU3UGbbWh+5C9fawe8bciG98sT5U83pWJ/KwyHZc3Xp7J/Uy6A9ZYdOth59NC8ps1Fd/r6rx7bnOI6gt/hzXqIg89c2vWjwnSNGOAhw4vBmBN1omYrpZIp6Q/6+elobJyIUiQxfOP2jqLg0Mm3H2VD+xQ2CJQ4CJr0LC3mlR8ggM+/Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwMO4KBhL7LMr+p98MNM/+gfTUyhrrwD2PihoJR1CFs=;
 b=jF22WtaH2ms6ye+zWB1YCXzrY7IDHwnR5H8280vdGOnXSYFm89veh8hzkgQCAJOkZdcuXROWozsEtIjQeajQbET/k32+2awEaQgXijma38TZmiYtc7I5ATgfWAplNMg9f+5+GvNSVqnRQszVOITvIesere3zJZYB+B8RgrPW9qnnlJxaVgr5FQ43O5iFAvhSQ4iL6qd9USpozbV9fyNORqMBq33WsvpNg+NwoGcnqeNjYmFwat514sJIHn+3Ini0Q2QU1DOQjrMu2StgzKqvIG0Pv2aKnEx2hhyfgxxWnEmwzeMzc1aP8qwOye16nsmlVLaB50y+7WlgHFViVCI5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 05:59:35 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 05:59:35 +0000
Message-ID: <21fec570-0453-4252-ba74-ef3fd45352e2@windriver.com>
Date: Mon, 10 Nov 2025 13:58:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: update SRC_URI
 branch
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251108112738.1968029-1-skandigraun@gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <20251108112738.1968029-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: bbebf579-5de0-45b4-717a-08de201e5359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVhkVlVtT3hPS0FkT0l6cG1PbXVqVGhKMmR5Mm1NU2FpNTJMMEFHeWc0QTFP?=
 =?utf-8?B?c2FhVnNCRDNjWkJXMHZSSDZjS3BpaDNmMWVLYjMvWGh1OTIxL0FPc3FTY1Zm?=
 =?utf-8?B?UVVNWWJPL0QyNk5pc2JUQjNDaHJoWjh1TkIwbm9HVTMxR0pPWGZ5NEdHQTdu?=
 =?utf-8?B?a25yMG5aYm12NVlPU2dQM2RaTUNIY2FPRGNMZEJKMlV0SDZwc0t5cTdEcjlx?=
 =?utf-8?B?MnExZy9ncDVEQ0pNVnoyOHI5RWt0ZlJndVR3WEZSSTRxYUpVZysvcVVPS2Y1?=
 =?utf-8?B?TURoRkxWSGhaTlovOVdCOXN4SWFLUlpOWERydTVjZE12Z1FGOXNVbHNMVmJr?=
 =?utf-8?B?RjR3dzNEeDJOVWExMW1hM0YreGplRm1ZdlFHRzVMSEVmUU9Cb0NxMXd4b2Ry?=
 =?utf-8?B?WkRXTTRndm9tUnVaYUo2MmtkeTB2dEdITFNLQm50dzVUNHVqbG9GWDhkMUxl?=
 =?utf-8?B?dEJSaTdGTVNmL2M4V0Z3bFRDZTcydi9oSzhnbDY0blhicWdaMjJ0MjFpMy9r?=
 =?utf-8?B?TmhMd3MxV0JvRnBEUWp1ZENVcTdHckFMSCtaL3I0NXcxY0FwZGFiOHlLN3Ix?=
 =?utf-8?B?amtla3hyV3lJS00zZnJ1RUtCOTRRZzBmdnVXQjZSMzcxcDBLZFBPMjFZS2ZZ?=
 =?utf-8?B?N0hNZm13WUdVUjROSzk4bm9aTnZNZWFBSXlZRThIUmlYV1VrNDN2NzB6K2or?=
 =?utf-8?B?ajlMOUc2UWxjZy9VdjFpb3pVVThheDZEeUJyd3lPUGxTSDFvRHloaHk3dTNE?=
 =?utf-8?B?UlRqNlI3MFVmQ2hGS01ZaHdXWjNOUE10bDBsWHQ1b2VCL1JXNHl5d2lmd0h0?=
 =?utf-8?B?WU5CTEpCRTRKKzNpY0VzaFNUUDR5eUMvajhsbm4rakhmKzlORnpxRDR3TVd3?=
 =?utf-8?B?aTN3Y0tuL2NkSDV2QVlBTlF0Wm16bHVXVE1iTGRCcFJlUWNYZnRPWTcyMTIv?=
 =?utf-8?B?RkRzb0JLeFMrNVZjSDBHMVBSbFRwSVNBVjllMzhxY3RGVWJFNFFPTVNTLy91?=
 =?utf-8?B?MUtIN0pOOTFNUktsemZUemE3dGVOejFHOWx0NXJhVXVnNDU4Nmt1N3Rzd1U4?=
 =?utf-8?B?Ky9rUUo4U0FnUkNHNHplMkZQeERIVHNPUnZYWGx0cC8vZnFuWDBVbm8wODRu?=
 =?utf-8?B?TjdoaXVuRzVNMWVkbnU1OUsyakc5SmF6YldIUDM1VE9pUWUvbmVkeDcvUUFY?=
 =?utf-8?B?QTFOc0NjY0F4MWt3ZTlkL29aUWJFMXo0cVBNd09iTHZnNERoS1hGQmxSdHcv?=
 =?utf-8?B?R0VHUjJ4ME56ckVLeUhEb1VCSHIvbXdFZFZNZEgrV0lDSVVjRThWekNUa1Zs?=
 =?utf-8?B?RE1BZHlmTDBRUFV6NUNubm5mSUcwN2FNbkVFYkNIZC80UWw4WksybVdoaTM1?=
 =?utf-8?B?djVrT2dEc1h1ZGIxYzhNMkRoVTRMRnBZZi9UUXpLZnhIajRDMnI5dzZuSzRP?=
 =?utf-8?B?UjI3d0UwZFZTNDJGdmlxdDNMTXRTMUFJTWpObW5DUzF3cFVSalZ3cWtsbHM1?=
 =?utf-8?B?R2VDNzk0TUFNajRWaXVKdWhvb3VGZnYwZGF5bk53ZDdyL0V3bW1yS2ZjVWFs?=
 =?utf-8?B?UTlPWldoVlI3YzZ3WlkxWE9zaHVWV1lRVnZuYmZ2WEU4NDlIL1ljV2hCcVJp?=
 =?utf-8?B?ZFJKWmNWc2MzSGJqamJMR05rekxBZHNGd3ZIYTlCUGhxeGVXRlBDSTBOWmhm?=
 =?utf-8?B?U2ZxWW5MNW4yajJlTldEZlpUM3NGaFNkUUUxeFA3TDE3SVBlN3ptV0NXZXAx?=
 =?utf-8?B?L0VaN0FabUN2UTc2WElmR0NlS2JhQ3htenk2MXE1dmJJUXhBSDBsbXJWdzZs?=
 =?utf-8?B?N2pXUGJBUFdHVmNXTDVMbXM5bmJCa2ZHbFY1aWNQL0gwZ3NvdTV2YUtUekd0?=
 =?utf-8?B?UnhMTm9BSU4wWXQ4cld5aXdzcmh0ZVJiY3gxMnhBd3hUdUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RFZObUVFTlN1cWJya1hOV2VKQjcyNTZFNkQzY0JkUG5uaUZNK2FYRXFPLzU1?=
 =?utf-8?B?ZW5JdGR6Q29jVW5OUGVYVnF6ampReWl1YURHVzl5ZGZJNTVrZlZ5K1hTMnRT?=
 =?utf-8?B?VENSQzZHTWNxOTUrWDNVSUR5aXY5MklTa2tPU2cwbWd4eE0rSU4wWUhCTUdl?=
 =?utf-8?B?M1ZNeEgyRkE1SmFOUlVoT25Db0ZKd0x4QTIwcUFja1JIVWpsVmFySkRPeTFV?=
 =?utf-8?B?L0FMMFA2VDNRenRaT0xyeUM3ejNnOHR4OEg2N2IzZ2RFTWN4dWFnUmFOZXla?=
 =?utf-8?B?ZHJOZzFRdHFpS0NocGRzYnY1dzZEUHp5SVJzbytKZ3NEb25LMEF0ZFpkRWxG?=
 =?utf-8?B?WEZxcjNadW4vMjNIeG55LzhORlEzY3dRVnhaM2VwUjdJclljeVdKaTJBZWY3?=
 =?utf-8?B?WXdPb1lob0VFSk12M0ZzZzN5NlZoOGxETGp5WVgwZGVtMTdybW0vVTJTMkhI?=
 =?utf-8?B?MkZXZ2ZIc01CcHA3ZEtqd2JDOUw4MHM1bUJMaEJMc292ZjdxR1l2ajd2Mml3?=
 =?utf-8?B?bndHWEJ0a2FaK3VRWW9ZWGhjRDdMNnB4VG9GL1MydDQ1S2dkMkdLbUoybWdL?=
 =?utf-8?B?TFdYTjFNR0Z6TEcxVnp2YWdhcm1QUW5KRm5Cd1FBZG92aDdCa0pDQzJKa1Vw?=
 =?utf-8?B?ZUZ2dDhNcW9ocTZDeUJSY1R2dDhQdGhIenJkLzdoZ1JHVkU0SGZZOEFCUzVO?=
 =?utf-8?B?S1lIbTY4c2x0WFEzSGtoWWlLN01vZnJmR0N3UTZZMGk1RTJtb1A0Q0R1cnM5?=
 =?utf-8?B?SDNNRENwNERiY0NzaFJwMFpmdVlWOXhMdysrRzE0eGQvQzgwS0xEbllUQUdm?=
 =?utf-8?B?bnBXV0NmWVBKbmJaaE4xbkx3Y3U2U0FCWDhuTWM0ZUJPSWY0VkhiWWdjakFt?=
 =?utf-8?B?ejE2SUtmbE5JdSt3MGsxY1ZVR3lqYzl4YjRESnNlQitGZ1c0WU1haDZROWUw?=
 =?utf-8?B?ZDE3a1Z2N2doUDR0b1BaMkordWZTbUp6UStCekprSWRqYTRYeHkyVEJiWUFT?=
 =?utf-8?B?REYvS0V6ODA2TldGbnV4dzFXb1l3Tk13Y05waDhzK05HM3YwdU5DMkQ3cXUx?=
 =?utf-8?B?Z1hrdGo4WXlhRjNhQkNBOWRmaFkvckpvazZoQW8vNTQvMUNmMGhsN2o2aWs5?=
 =?utf-8?B?VWorUGhic2pDK3VVYkdkMkFiN283dWRlWVg0RFZWUnpsMzFRRmtWQ0hTOFkw?=
 =?utf-8?B?b0o0ejNJOVVBbEorSWNRTm9BcXNKL1lsRUR0MmlzY0haeElrWjB1ak04ZkN6?=
 =?utf-8?B?Smlsb2VZVjhxOVdqcDNTOFNhMVpjZWFnaFk3VUU1dVpsZ0Vwc0UrekxIRGNr?=
 =?utf-8?B?NksyY1ZrNmJGa1FyTzh1M2QwVnZoZm5aMVBxc2VNMXV3SjdlRTk4eTIrbVhj?=
 =?utf-8?B?clJ1V1pMYlJ2c0ZBMEdnN2Z0K2k2M0ZMZlpRMlpLeFAvTHBGTWpGK29QbnlS?=
 =?utf-8?B?OEc0NmVESWhqWDR5TW5CamhWd3RlaVRkWS9Kak5BZlc0enlVWE1rZitMVlR6?=
 =?utf-8?B?MFhxYVRTdlBmMW1aRk11cG9udE9JN0Qxanc4V2F1Zy82NlBnbGVwYnBjYXRQ?=
 =?utf-8?B?eUp2N2kvRk5CbWgwMFBjVlJPbmxsN1BsSUJRN095RzE5bWYyZlhwVURRbHRU?=
 =?utf-8?B?VVpRUHVpNlM2T045WGNXdHRMUytJOUpsYVV6RDIzZkcrOGw4MWRTWTBEK0pv?=
 =?utf-8?B?cDdGV2pLUXZXeEd3VmxrVXZVTUNyYXZ2NFYyUGtqQzRVSWhaU091cXBmN0ph?=
 =?utf-8?B?RFZFZVhnbllKUGo1S3Blc1loMzA5aEdLVVM2T2Yxc3E1Y0cydVgvYkQrZmZJ?=
 =?utf-8?B?ZWhWamJodzZZY0I1NUhlSFhCU3kxUHRRN2FCSFpCeDh2dmRaajRxQ2NuWHRG?=
 =?utf-8?B?K0JkTUtMWFZUUlpEbVl2Tlg5WkZFNU1vT3ZPZHY4S296ZGZEWDV3YVAxTG9R?=
 =?utf-8?B?Z3BVL1plT0NwZFovN1lVR1F0TFJ4WEwzUmtUelNBQVI3WGN2Y1RYU293WUdp?=
 =?utf-8?B?aG4wa0taMGxSeStlaEVMRDdpZHZGTzhTY2FYd2MxbDVOK0szMDRrdnYzTVZH?=
 =?utf-8?B?NGRQVTVvdFN1bFN1L0lEWks0WEJ3M09UOER2d3JQSllSRFBQTFFqN3M5MHRv?=
 =?utf-8?B?OHRvbzMxRjdpNmVGMFZyWk1QcU80bzNwZ0p4Q3Y1c3hmblYvWjJBRnZEMXcx?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbebf579-5de0-45b4-717a-08de201e5359
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 05:59:35.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ABs0iUWtBszUMeUBRbcJuxhsv9k7vlZqz+b1ayWv3Od/6/88e+yNdR7QovSQM7b/yzGDr6FVH6KT7FzNNHSij2ckzUZt7Byeirb+B2ZChs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1MCBTYWx0ZWRfX3FoXdpq2IjH/
 LMqz90be4d/+H6KS1wYO4fqQgnmd3diERd0vwJnh9gNkmQm+2PNxvZeuqNuUsXokgHZn2bZn+a2
 rfW/b/L7tsDcncW5H2I0qDhLn1euTo660ncJybf3OdOcBHonQSSBzf8MLebmHCFqMx//bLlSZkt
 c8ytl95dO6HtiHnwGXejkoAC8iaqbu04Ai8T9123GMTZr/KUr8yXbpPOXpsPi7r6zuf2UTEdm7s
 JBidEQi0e4tGYiZfwrrkcQCN4W0moYGL/6woJnTxIGzRnkkjGE0AmmiUgwWz0AqGB83g+S8mpwb
 dfACwjjLVEq8AW/yzuwfhBdMc/Ol+kn74ycAONtXPsUl15BVJ62x8wFSIjjKKukdZi2B2Qm2cDQ
 1qUf0cYO2+HDkmWfe4txr2D8tPIbJg==
X-Proofpoint-GUID: CJVmscopW6DBJlFNzS-FJ0qj4GuvWlOP
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69117f4a cx=c_pps
 a=EOla4jo+ZS3aUDydQNalYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=NJuWnAnK2s-WiZUJ1b8A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aaxn2yk21Zxwsdnb5g8Tt7xKS1peNUhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 05:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121446


On 2025/11/8 19:27, Gyorgy Sarvari via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Branch was renamed.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> (cherry picked from commit 8d5baf12df3cf8a178bde5f11e0c8b28f2f6dcdb)

I was unable to locate the commit 
8d5baf12df3cf8a178bde5f11e0c8b28f2f6dcdb in the repository. Could you 
please clarify which branch it was cherry-picked from?

Thanks,

Haixiao

> ---
>   meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> index 610fd0af5e..62e6c90f63 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> @@ -24,7 +24,7 @@ SECTION = "libs"
>
>   S = "${WORKDIR}/git"
>   SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
> -SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
> +SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
>              file://run-ptest \
>             "
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121381): https://lists.openembedded.org/g/openembedded-devel/message/121381
> Mute This Topic: https://lists.openembedded.org/mt/116186077/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Haixiao.Yan.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

