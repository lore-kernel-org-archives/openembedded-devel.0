Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B2CC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:41:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.web10.15871.1750671715551305764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=iZlk9++a;
 spf=pass (domain: axis.com, ip: 52.101.69.67, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCvvicIQLvqnQa8CA4JQiU0L+iVbXz6/5BsdOMpIuvYw9H2CQr8wy5wyQDOVkkBKa2SwTXuLEpGpjXTLSvjXJOoKblN9yMSbUchF49N0iUUXaQHXwtzWH8ZvaKTDJDYRF1bSJ32y+qOnqDUEJFET4HBV4R6mGxWXkF7qkIvlzgLEKezdLU0us2g0M+O9JJIORa/JloQuM2hZenQ4o/I4XdZrr9dZ+Ss1z5QhZ2GG2nbsumDbSzZQ/mC6yD6rfktItIb5YyfeQPLPiKQs91qaYK/qgdM2WXstDxJrEZsJC52Ss2TwTs8B54SikF0VQNfM+dBe/YR/0JJoCJHKvncweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btGr011H2aJTCXpoJ9KK9ebLQKG75hT7XiWnm3td6uI=;
 b=UFLwG0CXvUTMpOH7ynR791vwlzNW/4IHB6CFphwKV69EZWcdD4G03aTYp9nTUsefOhXP3lAH+V/TWeuhBLUGr7ZXXuqMGidulZGj2/kA4qYOXI0Com40TLkRyR5otwApu8q45oXyThOG6neg7jYJpu+h2mp6yrq8yHuZGSRorlIqXZMhBpJ1VaEUZHtj4nHntMtoA8eyJL+0a4DSkFBuKALG9m4N4j0R2g/c2vvSJaRaUJ8T9CoJDWNZU1RP1xuRFqYXzyIf0Sv4Iz+2U0L4utVK95ucMoI8Z5RcNA4IgB2wSpkFq3Shj5BE7k1o8GqxVJtRM7VvgNfPLx/zWAEK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btGr011H2aJTCXpoJ9KK9ebLQKG75hT7XiWnm3td6uI=;
 b=iZlk9++aLQMAKpZ5jTR30V/936fl5UfNZBT9VxBp26lcFvDWUA3v3E2+T8BbPCE6DdNzUJsPWGLXWyInkuza55k55gkKO0TkCGu/JUTjc9du1qKyk46xCjPDfwS1dZbc2iSBHwqdJcAxlQf3RL0IfiZWLFa5Kju7H0PvmSH32ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by GV2PR02MB11348.eurprd02.prod.outlook.com (2603:10a6:150:2b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 09:41:51 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8857.022; Mon, 23 Jun 2025
 09:41:51 +0000
Message-ID: <bbf27aa5-9607-4a54-89d4-68cd5d01acd7@axis.com>
Date: Mon, 23 Jun 2025 11:41:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] influxdb: Use GO_SRCURI_DESTSUFFIX in SRC_URI
To: Qi.Chen@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250623091243.2256836-1-christli@axis.com>
 <c4987087-78dc-48a5-a322-ef5c14ff731d@windriver.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <c4987087-78dc-48a5-a322-ef5c14ff731d@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0034.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::15) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|GV2PR02MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: cc897eee-a1f5-4b91-b29f-08ddb23a2e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1N6RGp4djdncUtSTllWNXpjbFZRU1JsOHhJR0ZJb1F6czhZK2djSHVzdnp2?=
 =?utf-8?B?YmNnYTRsRUFnOGhhL2UxQ0VLbFUyYitrelJ0M0xyUmxTUHJkc0Z2UlgrT1FH?=
 =?utf-8?B?Nm5oMEJySUdoM0ZMdWRvc0U0WWRNeDhYVmFnVy9UdC91SkU2Z0tLU3pTVnZS?=
 =?utf-8?B?bEsvRFFnblM4Unp2MzBLK2oxTUczVCtsU1N5TkpxS3M0MjBNazdVV3VSdTZ6?=
 =?utf-8?B?RWNXam5yd3ErZnVkVnFFVUpYU0x4UVF1OWkwdDZRNDdubnJSOFpMZzFTR1pN?=
 =?utf-8?B?ZmdEbzNuY1czMzlId2VYV010aWF4QXk2bEVkdi95YTJiTHh6cjRrVEhXanBw?=
 =?utf-8?B?NDJKSEt3UzJ4YklHaWRtT0JSUjVTLzVEZ2ZKTXhjQU9JbXBDU2VtU25LVVFn?=
 =?utf-8?B?UjFvNW51eXhLL3VKeEVpY21SN20vV1FYVk1ud2c2MTlQckI1Q1Z2cklnVHJ5?=
 =?utf-8?B?aEE3ZXM4dVB3QzBXaXBZa29WT1YrN2s1KzAxNEYwQTBYOUhaMEhOR2JSWitP?=
 =?utf-8?B?UUdQZENqZjhFc3ErL3BmMEE3R1BMemwveTdqZUNFZUJyZThUMW5BSVRvaFBP?=
 =?utf-8?B?TDZyejhaODByU1lpcFlDNkdVSmE3eC9LMFhtRmoxVS9WUURpalpZdVRlWkIv?=
 =?utf-8?B?dDlxbjRxeXhzNlhKUStXR2lzVDVoV3FzTVRESlRKY2hsVlpIcDAyaWxrYzR2?=
 =?utf-8?B?QXN5T1p3YVhPa2FWTVhob2ZOOVhpajJZVmFmbG9GMzk5WFd0N29rUzVjMGND?=
 =?utf-8?B?N2haTWZFZldqSHNMdzNncHdjN0haWEI2TXdZUloxWCtwNjIzYzhNRjQ3bXJx?=
 =?utf-8?B?Y1FuTjdtUldLdlBJMzZkT09CV3ZSYUR4UDg1cWVTOW9peWw1V25tejRNQm5V?=
 =?utf-8?B?enlCSDkzUnRpRjVjWEk4dmlXYjJ5TUhsUW9tZmp2QVBQa09PZE5TRjIrb3pj?=
 =?utf-8?B?Kzl3VlF3M3VOdzY4dE11cU1zOGovbDZiTmtJd1l5eUJtNkFUMGJSWWNvRXFu?=
 =?utf-8?B?cGUxSmdYd2NISldyb1RpVkhNbElWTkFOem5rTlNjTEovWHlFTUlCWG96bnJL?=
 =?utf-8?B?RWVYMlRQaFo5TE5ZdVJBNjNmYVE4dTU4QjdIS05KRW9ONDZPNVRmMXdTMHJw?=
 =?utf-8?B?akx1eEZ5QkhJcjRhM0dJMFNRRWNHb3duYVdQcWJjdHpHZitkYlVvYlFuZVJO?=
 =?utf-8?B?ZlVrdEVRMVFZTE9PMGhQbWU1RnpDVGdSNWt3RDM4R1dtUytkK05nVkZaK1pw?=
 =?utf-8?B?cjh3QnRvT1dJcllWUnVaNi9zMFNiWmtSWVdmeVM1V0hsM1pWY0pCL2dZclJq?=
 =?utf-8?B?bTN2bVBOeW1QNFRrNUUycGVlNFlRSHNGVHhLOUNPb21QNk1lTUlKSXM0U1Z0?=
 =?utf-8?B?eFExYXhoYTZwRUhQMklIWjJFSzdTeXhSKzl5bW02ZHUwUDd4eHI0Ni9kNkho?=
 =?utf-8?B?bXVqdjc3OUdOYlVTUm5JYUtFRjFRUVF0Smxwb3dZTS92cUZkZE1hbjZ4cThl?=
 =?utf-8?B?Q21qZmI0THpVODFqbzdiS01IZ09DWWZaQk1ER1FzNENqTmN6a2tJalpwY1Fa?=
 =?utf-8?B?elpaUVhRTk5IVWYxSGdQRVBYbVBHY21uRXE5VjIyMG03N2xlZW1YWXlPMi9n?=
 =?utf-8?B?ckt5eXVpL00yOUx6WkVqZHlGdEdwd1lwSWlwM1RYRnZybWRENGVleUJkM2dl?=
 =?utf-8?B?WndCVHlHbFcvcjRaNXdzcTk0WGJVRlMrdHllbEVtMjhQN0YvWHlqa2hkc0tG?=
 =?utf-8?B?dWZUdlNWYndLREUrZjBOSi9uWU5nSXUwVmFCKzRCS1IvYk5zZDUxMmdqODEz?=
 =?utf-8?B?TlMzSEQ3OXhMRjMra0NQdVMvYmovMFRUenNlWjIxWWY3dzllZWEwcDUyYVNE?=
 =?utf-8?B?a0p6THMrem1rdi9zSU5OazZGcGpuR3g5WjEvOFdIdndCcEo5dEswZmtHK2l6?=
 =?utf-8?Q?IyrEgBIUwYw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkxoNUxRQStyVFBNcTRBVmJnY0xMYmR1cThRSEJpa2lJQnlqVWhYZUlBNVJF?=
 =?utf-8?B?cTJkdzJ5c3oyR2lyZ1hzMU9EWklwV1k0TXJuNm9IcytONlpCZloyNmp5RGZv?=
 =?utf-8?B?SG1BbjZZcE1qUS9XbGdydTZhbUZkYkZYTG54Q21Zek96M1lwZWhsYzh0bm13?=
 =?utf-8?B?d1VickVEaFJ1dy9vRStPSjhETmRtQXB4UWNwNVpTUjdGbUlzb1BrUFlQMnM1?=
 =?utf-8?B?ZVFUa0p5ZUVYd3Nld3VEdXk4Q2RGekJwVmdyNDlMV3JXOFZWVk5GOHNKbVo1?=
 =?utf-8?B?QWZwdis4dHc5SWM1SHVUa2ZFTkpaMTJmTnFDQUV1aVpKNUEvTEU0VXVxQUdI?=
 =?utf-8?B?NGF2Y1NQTWVWSmRhUFA1WFJtUndybUcyd1VjTjQzQXR2UU4yR3FWcDhpT2FX?=
 =?utf-8?B?ZDVtRkt4dW5zb0FXdGJ1VklxZFJtY3hKUytrQ1A1QzNOQ3FOSGxpQkdNZkpO?=
 =?utf-8?B?VHpuOURxM2E5N3p2Q1lJakg1QW5IdFhjWDBGQlhCVlMySkNxT1RaUlFrby94?=
 =?utf-8?B?aWtrSDBiWk1vNWV4TmxSRWY3amx4TlpKY0hSVzQ2WGw1SDFBNlpldllobnht?=
 =?utf-8?B?L0huL3UzalRTYWlMWE5xRHlSeGRuK0tOa1BvK2xKMzNWS2F2ZHNuWnZNdm16?=
 =?utf-8?B?a1d2dXczeURYSmdBMThmMlNyVm1hQXJqaHZtRERRcUxRR2d0UUcvenoyTEN3?=
 =?utf-8?B?dUdROXIwWlBkR3F0S2F3Nk1SSFhIeWRQVDVuTVVJTmtlUnJMM3RFSjNzR2wr?=
 =?utf-8?B?Vi9ydmFTajFUQjBJNldqaTEvQU1TVVl6YSs2Uy94SGE5dnZlMGtQL0ZRcVNZ?=
 =?utf-8?B?Sk5lbXQwNEhaWU5idHp2SjNsZWlCOUhCTitIVnRIQzhIdC9DN3BaU0lzT2ho?=
 =?utf-8?B?WWk3eXhVU2JQVE5BbXcxZ0crNWU4YUIrNWN0TWx6b20wandYMFZNWVN6eEFa?=
 =?utf-8?B?SmVYRU1ZR1ZncWpZanFmVkkwMjVOVVM2UzkvK0RqNXZ5ak1kc2o5Qk9Xejla?=
 =?utf-8?B?clBySzdvNTdiMFpxcmVUQ3J2d2VmYmtxM05kZEpCb3BnaDNuOGVPWDM5TjZE?=
 =?utf-8?B?ck9oUTE1c09xa0J0RzZTcFd0SDMyMU5VQ3JQeFBtSG1OeE9qSUVQcjA0NDRW?=
 =?utf-8?B?ZVVkSTlDM2xBeFllWThqdTJkK2thdmd1RVR0bWl0a2k5NlN5cGVUSkVvajd0?=
 =?utf-8?B?OUlvdlZiVTNZT3I5OWNML0xCZTJvSHg1OENnT1NwbjdseVd6T1NIaUF0Wm5r?=
 =?utf-8?B?U2FCSHhubmpPdG9MMHVmcENvQ0FBeG9mS0F3RmcyT1NmL0F1YWh5QVFXVUdk?=
 =?utf-8?B?RmFxc3ZuRkpINWYvSVdoVVhPLzgvRWRoYlc0cDFCUUN2dVRxdnZHZTdxNEVY?=
 =?utf-8?B?VnA2T3hxbGh6eG1vcXBXNkhaVDg2azdDSlRYanFGSWQ3OVBTWTFSK0Rjc0Vz?=
 =?utf-8?B?TmJtaFpjMFN2L2M5ckpOMVRtTXJUYkNUUHJLQU5ndnEyM01FMm9hUU1GZ1p0?=
 =?utf-8?B?WjJLZldrVlN0eUdoVkt4YjlLdzZ0a2Z5TzV2VWFTNDltNGlYSnBscGM0bjVu?=
 =?utf-8?B?UFJyQWRkT3dPWVF3d3drWjZ2c01NbHlvV3ZLVUhPSWFLQjFBT2FscGJJclFY?=
 =?utf-8?B?bFVJN2IwdkN5NXVYYUFFK2h1RzRXcWdWSmpNYVRFcHEzN3NWN1puRllpVVpv?=
 =?utf-8?B?T0o4a2NlNnpNUDd5T1hMTm4waW9Kd25ObmV3YnEvcmczSk1rYjFMQU1PVFJk?=
 =?utf-8?B?OXQ2NjEyQnZNcXdpa0VxdkZoRy9ML3JZa2Y1V1dnMFFDRlQ4ZVpGNkFJR2pS?=
 =?utf-8?B?UWpqOXlGbGlzcmROWEtHaHFKOUl1bHpuZ0RkR0JYcnlwZFBHY0RsOVBlU255?=
 =?utf-8?B?YjdrZ1Y5OU1PTkZuKzNjekVhb0dRWG5ZUWlCL3F5SWIrT2hjVEtJWXB3RUZm?=
 =?utf-8?B?WGtjNElkYzRhVk5sa1U3U2grRExKTHJtTmF4cVpTS1NmdUlrbmI4M3ZXWU5i?=
 =?utf-8?B?bU8zOUpzUkhWM1RNNkhZckNNQy9xUHdRbitEamkvb3JJOUxtUHM3MHlBRFBm?=
 =?utf-8?B?YzZNS2xRb21ZWVVuSnM4VU4yTlpXeWZhRE91UFhYV1Z3bUZYSjUwVGlRdEZr?=
 =?utf-8?Q?rC1y7iQsgfVYGst1HphnCSjFp?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc897eee-a1f5-4b91-b29f-08ddb23a2e2e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:41:51.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cBRJ0nndTdrT/gu9MUCHzE1dNPPEr6eqp5N4XTMpqVPHMzKxisgnj5SStWUscQgz5HBeWM2DG0Gnw64CwssLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11348
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118070


On 23/06/2025 11:18, Chen Qi via lists.openembedded.org wrote:
> On 6/23/25 17:12, Christian Lindeberg via lists.openembedded.org wrote:
>> Use the GO_SRCURI_DESTSUFFIX convenience variable for the Go main module
>> in the SRC_URI variable.
>>
>> Change-Id: Id7a1f476c880b92b6e1eab057a9fc22875f0114c
>
> Where does this Change-Id come from?
Oops, my bad. Missed to replace it with a Signed-off-by footer. I will 
resend.

Christian
>
> Regards,
> Qi
>


