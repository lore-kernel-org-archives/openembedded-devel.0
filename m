Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5A5D0BB5B
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 04:12:54 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.200.124])
 by mx.groups.io with SMTP id smtpd.web11.6890.1729743165139718754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 21:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=naZdj7wW;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.200.124, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoGuZiVTUgRLvgWBPSbYU0GJYCfX0COs1bWFA6mu5nmwpREfLfMeJvOhMY2Shpf8CkXUjTfmerpcaF7FaRflYmec+RVDd8rgd3GKZccgdR2EVvW17IV29P8CPWwYO0TbOzlKQmsc/8kzQKF9POg7xzzH6SeYl5jH9nQTwCKN4kMuMMXnQWRYn0cOkf7YJvYpT1XkqHQoGikMJQMLYNV5NkDazgmgn6AjVCBbayEI/MULGz+NUDxBo2cdbVvLO60NyoI2s9LjThYkqHXek2BW+0R03tQut7AgSaJHerBMllw3xXD1CNg2uwCZ+EbVWANQIk6NazMeiFgM2gpqbAWzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXBXbr5ukwRH6bB5sO5Z8Yl7LyQ9oj+cL9uwjMKfxpo=;
 b=cFkpJ23SDrB6r330tfG/eas7Vbba5KwzBWnQ7oQY+Eqe4qwWoXmyNtDFN+7l3FtkQusyUo6vkUrGoZPIWoe4cHdguqJ03wLSae7y/fwNRW/S2ZSnDJ9TLpyPlNN5wmaQrw1YWdC3QB7d9sK8WJauN0AUZ2T+S+gg0Y7mU3dTZntP/tvXZ1fYhoRXn27Y8yFMnZ6yhxh+DuRQ3viU0gkGXbpSWhzfX35p0KLQWPRLY4gNqMih4L9QqveirYouehy11Zwcz0qYdHcJPeYJMAKXVdM+bm115Gx2uG02wgYmSSQFAKA8EE2JL6yLMzRn4jsjCmCiXbBrMftJ7428o4PsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXBXbr5ukwRH6bB5sO5Z8Yl7LyQ9oj+cL9uwjMKfxpo=;
 b=naZdj7wWFOh6ThtOHlALvd2bHgC1lMP44yPLSLAgzzYX4prqCRjzS7iDBc2PyHTKxA67UQD4c8ahuyOpQKm+FMaAEAooBCVm6+z79Nv+qS6kyBm9GHAsiPiYoEozN7RnjUp5gLP4ZMaSbK6DJmlyWpvP2Mrlr1aEbS07O/jYHbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DM8PR01MB7000.prod.exchangelabs.com (2603:10b6:8:19::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Thu, 24 Oct 2024 04:12:40 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 04:12:39 +0000
Message-ID: <e594ca40-fdc3-47d6-966e-aad8afbc6877@amperemail.onmicrosoft.com>
Date: Thu, 24 Oct 2024 11:12:30 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Jeremy Kerr <jk@codeconstruct.com.au>, Khem Raj <raj.khem@gmail.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
 <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
 <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
 <CAMKF1soiY46pbuUF0tKYBdVh=NzP2BG0wp3+TssTwZ1LYa-jKA@mail.gmail.com>
 <3c4cb581f42351870fb443e10899909f657c00ba.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <3c4cb581f42351870fb443e10899909f657c00ba.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DM8PR01MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 632d1e51-1316-4d6a-d271-08dcf3e21960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGFtV0l5QU56Y0dINTIxdkJLUG9Dc20vbHpRaG1pd25ZVkgvNU10SlgrbDJn?=
 =?utf-8?B?WHJqUzRUNzZLOTU0L1RvUFN5RjZQd285MGV1Q3E0RE1GWUpYaE85aE1LS3gw?=
 =?utf-8?B?bWs1dEQyL1E2U1hrS3JWTDFEcGtxOWFDMjIyQkVURHBXTDJqVUdZdWtncTFi?=
 =?utf-8?B?KzNtZkxDaUFuOWFyeGpnQU90TGNESmZPTTVNcVhrR0xhVGx4bDVoUThMMjBS?=
 =?utf-8?B?UWRoMGRQdkN4RnNCMjNuU2FWNVdJbGY0OTRFQkJkcGl4QjZoV1ducHptVTdq?=
 =?utf-8?B?Nmo0MFFKdit3bnlWeUFuZGhlL3pna0NZY0ljYkpZVE5xcUsrcHNCUWp6SE5z?=
 =?utf-8?B?VTlLNzFySnBsVEdEMkhlV2szS3NzdVlNY1ZjeVNOQUdMLzU2QXlTQ29MRUNa?=
 =?utf-8?B?V0ZabVZ6d3YxRzA2NXgyeFJrdUx2dzJXSytYRHEwTzNrS05EUzRkV01IQXdK?=
 =?utf-8?B?eGlFOG9xNzU3Z2RBSlFjZXZIZk9hRks5aTl5RnJXaE1GVTdIMmxwY0k0eldk?=
 =?utf-8?B?b2szekdLakJnQWxiOTdYUk9veXIvZ3BYR1dBRUthN0hhTGhUNm15OENhVmVL?=
 =?utf-8?B?KzROZHpHRERNM2lsK2RnMFdBMFQ2bGk5S3hsZEFvMEZpMERKcXdPK3MvZHla?=
 =?utf-8?B?bnVLaytmLzJmWVlScEVjR3VHdDZ6UXRYYklxbkZmdVVkRE5uY0NmaGJpZ3Vu?=
 =?utf-8?B?aCt5OG81UGRFVkhGN0tGLzdKZURBQUZrSzZIdVRCL0RKNUkxMVEyTGc4TS9x?=
 =?utf-8?B?M2pzUitnWjBhOElsMFIyQ1gyMEovdXdrMm9JMnF0ZmNxN0ttbXF0TXozMm1i?=
 =?utf-8?B?NG9rTTA4OVZQcEpURFo1SFlkcExGYU41bDJqVzRNUjZmUEpyRmU3bUxXRXRC?=
 =?utf-8?B?VkdKbEV6dW12dmZaeTA0VGxWeTRiV3B3MklYTFAzdnlWZ0FGRk0xdFdualp0?=
 =?utf-8?B?MlhvRktudEEyV3Vkdk5kdzJhMkgwTlBKeEwyUUlFQ2dNN1EyeTlRWk8zbFh0?=
 =?utf-8?B?T3drYXN6SHJERjFLczV5dkF4S1VOTERJWjVvYXA3aHZCd2RGTER0ekI5R1RQ?=
 =?utf-8?B?cDc2eHRleGhwL3hsKzNzSHRsaVFMc0ZlRUhEMEZWQThSRzF2eHdRV2JtaWtZ?=
 =?utf-8?B?a09JeXVPY0YyaFgxV0djK1d0bEEweEQ2K0lWU1N3bW5SWDN5MGthNkRtRmhn?=
 =?utf-8?B?Qk80WFRSU2JBK1pCZWVaL3RYZUdvL01Qd21MaEFjc21DbkNuKzU1ZEtuTTFS?=
 =?utf-8?B?RzF0SE9NU1BSSjVTODhudTdKNHRuRktBdmlVUHFtaEx4SjROSXhsVVdsNkRj?=
 =?utf-8?B?NkF4cE1ORzAxZlhuZG4xNk1OVzNVR1hWajdQYXJTb1NCNDJoM1NpME1IQjJ5?=
 =?utf-8?B?ZnlqWXIvcm5HQkNONHoxSWFWZEtMWkFHbFJKdFcrbDJiQzZjWmxvREJ2ZUlL?=
 =?utf-8?B?ZDJwdnFzYjZZb2ZzaWR4dmVnVlRabFQzckVwc0VRMnRMNlVkUXYxUDMrdms1?=
 =?utf-8?B?OEtsRXM3dWhwM1Nmck5naHVSNEhQbEhZcld1ejl6bFF3UmFNTWpTUklySmx0?=
 =?utf-8?B?SGxuMDJtOWlzOEdXaEl3ZWtmdFNaVFI4VWVWSWp1U0ZhNExZOUN3V3BLemFF?=
 =?utf-8?B?WksrcmVEUUlDQjJkejRsMHlMQVF5L1M0RU8wTVl0MDV1a20wb1hnZlB4bjBG?=
 =?utf-8?Q?aEdrUSRW7dY+1I0kyzo3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dytCYWlVQjJpNGZ3YnVJTDRXRlkvV3hFWHJsVEhzY3pjMGhXd0JkYzU4akU3?=
 =?utf-8?B?R3VpMmNlNE5paFpMRGI5MTZRY2lyVHdibUF0cGVVVTY1UU84b3JLT2E1T3Ay?=
 =?utf-8?B?WUhRY0RUYlFPSFlKTk5jK1NiNDFETHNhSjVZaU4yTW1xK0FHLzk0MithQm1m?=
 =?utf-8?B?amVKY2R4TGRhR1VSaGpsQUQrV3BQRmNsaDJRS3Q2T3dqdkVWcXNMM1pva0Y0?=
 =?utf-8?B?OGdCcG5jZjA5NDczYXNDU2lNNkJGdU5aM2ZXWGhWZXI2RXZ5WGZERnJkU2hM?=
 =?utf-8?B?aU8vUUhHd2NKQlRHTmV6dGQyVmM3SGRvYXBYdUpNd1ZKTVNOcGV4dGI1LzRS?=
 =?utf-8?B?VXNEOFFGWitMKzdxOTI5NFpxNUgrWW1OZU1iOUdoL0x6WGdkSWVSMDA0dnVY?=
 =?utf-8?B?WExrNW4yYTBrTHRpaU1zUGVxaXEvam0rUytqMW94Z3JvbUh0UEg3VXU0MXgv?=
 =?utf-8?B?eTBpVWFNOVVwNHR4L0xOMUt2MTBQNHRBU0JLVk1kTzR3K1FlcitTTlZqVlh4?=
 =?utf-8?B?UllNd1lJdklONG8yMmxyT3YzZ1E3M3NtVFRQeDd3dW5CdWhHNk1DbjhBTFNK?=
 =?utf-8?B?c0wvdEljaGUrMXVxNDlMNnU3TEo4RjB1YlhSbkhGMEZpYkZEZnlrQ3NoS0Rw?=
 =?utf-8?B?ZTlVcWJNRCtpQmRITFM4YVcvaDRLLyttNXNZRnUyOEhDLzNLcWRhT3l4UmIr?=
 =?utf-8?B?VFhXS1B0SnZzNzFiUk9UVHE3Nm51bFJnNWNHODA1Z29zMzZJL1JRNDZLVDdj?=
 =?utf-8?B?K0xSa1h6Y0tycllpVjNiMEpBVkNsY1BDRmlaZFpvaHRWbGhqN3dSQUQwTCta?=
 =?utf-8?B?Y0VUV09yQ0VzeTUrdHd5RHFJUmhyc1NQYis5QXZsYk5FS0YrWm1lTjBzYjBY?=
 =?utf-8?B?Z0xRVjdla294RlF0NEdvOVZ4MGhNOFNKSnB3YmZ2ZEcrTlA2TXVVVEo4a3dB?=
 =?utf-8?B?dmd0MEVjY0c3OWs1M1g0d2EzQ2Z6ZHlWVTlBQk0rTFJnSGxhVjVXWEdFQi9k?=
 =?utf-8?B?ejY4dU9ZTUtyTEQ0N2R5cy9US1JsTlA1aHppVEtTeFQ5UzBBay9seklUTWw5?=
 =?utf-8?B?eTBWb3EwNUxiTThEN2ZOazFiNTNKdk1IVGNPZEZyczVVOWZ6OHFiVzU4Y1RU?=
 =?utf-8?B?T2dxcWRVcEFjeGx4L0dyQWNHa3FxT25pV2ZjWTVwcUpIWHI2Ky9saDF2cGFq?=
 =?utf-8?B?T3lhN0NzWVZ4ZWJwWTk1RHMyUjJwQ0l6QXZVdDlhNzF6Z2h6NDk5cEhNRE5u?=
 =?utf-8?B?YnpTVTd1MjNMa2JuOWpYQWZmd1lVck94bmJhbmRxSmFrdXN0ZlhJcTlCZjBK?=
 =?utf-8?B?ekVQbFlMUnNYOS9paWR2VXRWOWFZM0Yrend3SWo3cWxXWStuQjFOd0hUZjlE?=
 =?utf-8?B?LzVoYWVhSlZYMU1PTHFBRE9DaVpUalYvV05jL2RkSUQwdVA1aUtlK1VDdEln?=
 =?utf-8?B?YS9YdWZJb2gxalJyOFQ5elg1OTFjRTVSVW5yTjNzcXA1SWdDeWZQTGpNR2tq?=
 =?utf-8?B?aDBvQ1BsUDUrT3pobFBrWXNnM2MydWZmK0lpYmROZFBPaXhjdHp0LzFDZmtx?=
 =?utf-8?B?Ny9QNmhnL01laUhHNjNKZW95TDJoS2ZONjNuVWE3MGhPcjBnanNLeDM1MHcv?=
 =?utf-8?B?dGZZT1FnczV3M0VXdnFoUitpY1BFcEY4azZGRWE5bVJ5aGUySUpoR3lLaGV1?=
 =?utf-8?B?L2dMYXBqVmNSNGU0OE94Q0NFeDRXM2NseVdESUwyYzBONGxYR3dJeHg5OGhS?=
 =?utf-8?B?R1VmNkordDhjVEZHUTFudE01SzZQNC9hcUtSREVQQTY0cnBwaDFqSCtSQk5F?=
 =?utf-8?B?b01BRFBBbkdXRWFZSXZwbGp0cTdrM004ZFBzUDVkTVQwMWhrTzk2YUZ4TFg5?=
 =?utf-8?B?dE9PdDhFdGVtNW9oN2lTUzV1c2tCWXpvN0RZTHlkbUs3V1ZRVjRuanZCdWIy?=
 =?utf-8?B?OEU3MnU4aCt6VzlXR2czQUJxVkwrOSs0ZlRueEZHTGRiSWlwUHJuallEVHBW?=
 =?utf-8?B?a3dLSE9HSXRBb0xDcTlUbkZrQUVaQU51U21oY05IbWN2T3pWYXhGVFRYdGl5?=
 =?utf-8?B?eHVhckUxQmliQVlhaE5QdlZIcmMrcDEzUFNIM2VrYUNnV2dTOS9vT2lOcUkr?=
 =?utf-8?B?dkxVVmkyUTgweDhzTnhvUnVQNXhhQWt3WnN3c0drTGhXaWVmSStRMzBaVnNL?=
 =?utf-8?Q?e/ahELcF6dD3UT8UoZ+Nw7c=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632d1e51-1316-4d6a-d271-08dcf3e21960
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 04:12:39.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3I8kOJ5YWcSPCG70vrucZVrPBvQSQK6La5ko59bFd537KKOMA5l5cxGRk5+nb8+Sq4qA8B0LCxE/hpW6WUyr8Y7u/MZdNDLvBwHDSNJ+7iZZpMRCMDQYZ4eru0OaliS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 04:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113158



On 24/10/2024 10:29, Jeremy Kerr wrote:
> Hi Khem,
>> There is a new build failure seen with musl+clang
>>
>> https://gist.github.com/kraj/cf85e1d301b557c791ecb410f58298ec
> 
> Ah neat, thanks. I've added a couple of fixes, but currently untested
> for the musl build:
> 
>     https://github.com/CodeConstruct/mctp/compare/main...dev/cross-fixes
> 
> Chanh / Khem: if these look okay, I can merge to main.
> 

Thank Jeremy,

I think I'll create a patch that includes your fixing from 
https://github.com/CodeConstruct/mctp/compare/main...dev/cross-fixes . 
I'm going to push this patch to meta-openembedded and Khem will help run 
the CI build to check error.

Cheers,
Chanh

> Cheers,
> 
> 
> Jeremy
> 


