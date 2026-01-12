Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB93C9EC82
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 12:43:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31756.1768221773061411704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 04:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HQI2m77l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5472b1c551=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9Wsri942877
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 04:42:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tYs8SdLu4GGPiIsx3K8gXwdRWAcw5oZEhC61DbXbABI=; b=
	HQI2m77lBrcLbYjWCa86QjtMcg+BDVCLUFyggUkZ0MOX81IVGBwIAfFCfsilziMd
	7mvOrap+iUaLNWnDjfbX15Pxrs5BnmSkKe9j+wvcB0/Q32CCtmTzcGkN4M0fPn6X
	7OXKWCTYqRURCP9hv+EE/s+ILN73WZa5/2gKeanXmKoGJgP+lWCmw/OgIT0Xn78i
	O0OQXP8L8FHeTlFnCS+F29W2WOSdrbA0BpA4D4Gcqt6uCXoB6V+VkL4prKF9NmOp
	I8wDLl6f+ZcjIvENgFmcxhboo6W0BU9l8RcVonenycu+GAuVtHHgA4sw6l52gJ90
	DOVOlLG6BxUuY/CwAJbbEg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fsg3r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnSSeGa9QdzzcgzgnL06f2kqJ7o8ndxcNesXO5eYneWMgAnCzh6mOaYgMg3cURqN99pXnHL93JpkHIRaq/9/wA4KilZPyQT0Fwb/AKrgfCSafTMYoV6+OewuOCqYVYEOW6l7i2eLUbPzUF2CYdYQPI3++nSCJZ14rikpLvNoKw8YQ6aosoXN1zbZJjyZJNBA5/n9DwB3y4vKwbzqEXyYGLbZg6gfuwqHz7Ure4URHUafkqUXWTihm50MSNHngNmUAJmahucLsqrUWbfqOxYJMw3gIR248fp+fZY/TZMMyezSd/qn7yKDloS5sj0Tba02Uz41otS599sf6kjyHvNU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYs8SdLu4GGPiIsx3K8gXwdRWAcw5oZEhC61DbXbABI=;
 b=G+VnDn3JnZOiE6E7bskIYgo48E/Pf4EMLHATXbyvO/lf97OD2gmlnxzi973R6/FXr071xk29+LWF8ieJ+fImLHhe1sYb6GyJUgx+SUVCe4vvviXsM71U98SOvh0yGyCR1c8Eh7DvLvmOvyg/y+SoTGsoTptvfkcRvK22bZGuAUtEvDJzjyRwpcPPZTJ+FxGaTwjXHGe3XuuMzqH+Xb1K01Pg/bAOdCApgv5/GLmAIwXsRzODCjSvjnsdLNbJ224gPEIml1epUX0PYVjZPzhl0kNQZmpEaCQaJ0lzF7AxaRaB/s9O9pX05XkPN3JK370kyiUyzCXuF+nFe4xA+sbQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:42:48 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:42:48 +0000
Message-ID: <56df02f0-fc48-4626-a6e6-0cb736fd5dba@windriver.com>
Date: Mon, 12 Jan 2026 20:42:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][krikstone][PATCH v2] python3-django: Fix
 '_lazy_re_compile' is not defined
To: Gyorgy Sarvari <skandigraun@gmail.com>, anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
 <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com>
 <1c1a7717-97f9-4177-b4e4-ae8902080002@windriver.com>
 <CA+s=J=yHdgNtdDWMyNz4fcF_d8vdrrR69uTe0vNUw3WNW6ABpw@mail.gmail.com>
 <d5e36eda-385c-4281-94d3-b15be15268f8@gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <d5e36eda-385c-4281-94d3-b15be15268f8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KL1PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:820:f::19) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf7968b-5010-4741-c689-08de51d8177d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUJLbHFVajM0YnAwKzk3WkMyMTZhZTJmNjJFT2lUaWlGRFBuSXhCQUhSL28z?=
 =?utf-8?B?SHJWTEh2V25XWXZ4VVlRTUJBSjhnS1NSNHZ3RUJqQ2tvMGlpWjlWdElUMTNC?=
 =?utf-8?B?aXBmcWZ4Y3Y2ajFvMXd0VU1SbTljbStUcmEwd3hzM29FR0p1TWYxMnZpd0t4?=
 =?utf-8?B?WHEwWFZOZ2NoQXNRV25VWGV5NFEydXBOWmRXRTQ1SW5aZTh6NXFiOHlMUVJr?=
 =?utf-8?B?cStya3NKVEdqYzZncVVGeHBmbFl6dVZFL2JJS0VKenZRaU92ZkxydnlmdGsx?=
 =?utf-8?B?Wmwrays5dTdMTktDYTUwRGMvSzk1ZXoyNzdlRklXZXB6M3JKdmtNbHVXaGFU?=
 =?utf-8?B?NXl2Z3BFODRHQWI3b09hUWdacDByTDdpUkxrM0RWWDh2aWl5WTc4VTZETk81?=
 =?utf-8?B?bG1VWlZ0eTg0Y0d3TGhLWitiWHNISTdjcERTTzZVQmh3MVllcGJWcllSdmF1?=
 =?utf-8?B?VndFUFdQbzZMVXpWcGN5ZVY1UWdkOWFBSjMxRmh5WTFKcXE1amU1TmgzSDBH?=
 =?utf-8?B?VjUzTnFEem9NbUVHQ21iMmJwOHNLVFpVckNFQmFSeDB5Y1B4VytOYjBMaDdE?=
 =?utf-8?B?UzFIc0svWndnNVlMVXd3NVhlRC9PVlBnRkFtQndRUjIzZUM4WUZCU0Q2MERB?=
 =?utf-8?B?MnoydEtlRkZ6S2Y2NVAzb0tWT3VraGY1YVdVdkNKU2dUTW1tdENPaWZhVkpH?=
 =?utf-8?B?TWZFL3V0N1NWdlJZMVFuSTZFM1FyZTNlMGxQcUFMK3VpZDlUWXYwTU16Q0Y3?=
 =?utf-8?B?OVhpSC95Vy9KZUFFYnViYm9VaEtVNjNPOXV1dWVoMzlDWE5JK05aT1VPblY3?=
 =?utf-8?B?Z3BQTEgyamZCVEM1LzA0SWR6czdaNUgzeFVMdkk0WldSZGFuZkYvYWZSY0JL?=
 =?utf-8?B?VnJCaXE3aHFjM3JkWjV0Um1KT3ZIdURLWjcycHhDbUlXcDVXSVV6V3M2dUwr?=
 =?utf-8?B?TVFTd3RLeHNaeDhHOEFzZ2NobDdpZFBYUmIyaS90WEFRblNYU2hDSjNjd1ZD?=
 =?utf-8?B?Vkx5aUVmWVlINDVGWXVXeEdBSVoxQ2RENCt6cWdiM3BLTnkycHIvWVhYRis0?=
 =?utf-8?B?YkJPcFhIall5NHV1TG01cXFDc1NqNkd6RUtpRW5xR3libGxwcTJIWTE4QlhC?=
 =?utf-8?B?SmZCekpCNWZDcnFqNlIzOFlZTkNIWHVROXlxdkc5cmN4cThwZkQ0SGRnUjNu?=
 =?utf-8?B?UWkvbUpuNkRoZnhaWTZvZ1ZpVVhPUDlJbGpVdmUzeVRjZVUyL1NHVTVrMUZX?=
 =?utf-8?B?SXBML21GNUJLRTNrc0tqajNHckM1VVV3b0lGOEl4ZkFVbC83RENmVVBrOG5H?=
 =?utf-8?B?VmFBK1BaUGUwM1V3dHRQNHE5MDY1Q0xpUk9LNitDeVowd3VlUzlXdEJYK0Ev?=
 =?utf-8?B?bnQ2ZjlmYjQ1eTliRDBnWjUvL21kTEpXMXdRY3Y5dWZVME0wR2ZwbVJpelBE?=
 =?utf-8?B?ZlhaM2tybmVNWkd2OWxYQ0Z2VTVwVEMrWTI0VUtyVW93aGkzdHlhMHNzMXBH?=
 =?utf-8?B?RFJwT1pLTE4zeThTc3FnTlBsVDltTE9oOTJKVnhSWGxLeGNkeHlrOWVLUWRv?=
 =?utf-8?B?MEt3Ykp6YkFtNXNUMUdHWFhWSmVRdjdPR0ZDaHVmSnVvMEZuWmlsaWErK0ZH?=
 =?utf-8?B?eU5xWDdudmYrdWpLb3pZOU8yZ0RFbGtHcitsTU9UZlZuOGwzZUt4MnV0MW02?=
 =?utf-8?B?UkF5Z0N2eTU0UUJWck5pVHNzaXNDa2tXam5RSDdUQThJTGs0cG1DQm5TeHJO?=
 =?utf-8?B?a1RiQW9oZlo3UmU4S3dLb1JzUTR1aG9RQ2lNT0ZNeU81ZTJjaFZ0QVFHTE0w?=
 =?utf-8?B?ejdZWjlobE84ZEVEa0tpem5aRTlpb056YS9USFdJT2RwUjBrQndXMWlxTVll?=
 =?utf-8?B?T0tJL29tYSsrTzNNb3c0VVcrQXpxczM1NUtzNkdaYUV5TG0rR3k4UGphZGww?=
 =?utf-8?Q?0/K/TL2q7Mkq15xLsQh8AVFhFgPzdWCR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sk9wcnZwNG9MckVOL1RuejhrL2wwSEtrYXJlVFJCbUtMclNWNkV4azFXcXRq?=
 =?utf-8?B?SEdWRUR3SWVCY08rc2lLSW02eWRPcG1KUCt4MTA5S3VXc1B3RUxydTcwaTJN?=
 =?utf-8?B?Z1dGelIzVEg0aFhvZTZzc01pVVkwWW1nUk1HakpqdEZtTUlueHA0UHp5YWZa?=
 =?utf-8?B?WDM3UzlVMXNrYnkvb0hKd05Xb2h4clkrUUhBR3BQR21ZeDlNTWd6MFl4NUdS?=
 =?utf-8?B?cit3MVMzRWdkZHJvclJyTXREdExWYWMyeGtWUDBVNVgxMk9KdzBIN21wYkF5?=
 =?utf-8?B?RFdDOWkxNmtWS2V1ZE5VYnMzZXU1ODNNU3ROdENBSlJWYm9MeTR4V0Z6d2JC?=
 =?utf-8?B?VkY5dWJrNE9Hc2FWSDVaZngycHB3S1c1eEgxcFVIUllGVU1NRjArQ0ZsK3lI?=
 =?utf-8?B?U3Z1MERPYkRtV0gybkRFWHFzaDFobXRtQklldytrZ2k4dFJ6V2pFZmd6ZUk3?=
 =?utf-8?B?U2ZmeDR0QU9acUM3YktOS2Y2REtXWHVDUDBLemlOZW1HMWxWWmUvRGQyWlJi?=
 =?utf-8?B?cUNBR0Y3MVAwbDc0V0I1TXNUd0NnRmlCbklQTXV2eHltUHhud1pUV2c2WFRP?=
 =?utf-8?B?V293U3pqUmJQcHNjcW1pM0xPSm1xUHVDNm1SVitOTm1VYXQ1S1Z4SkN2UnQy?=
 =?utf-8?B?OXhZbE5tOHZrd1FqMjVscUhuV3NzaTR1eGpzdUZxeEFnd01TTXZuTndGc2JD?=
 =?utf-8?B?WjFEaEZ1a2Q0RDgvWk8yUDRCVURZcGowSTR5M3hWcFlBZ3htQ1E2YlppUkl1?=
 =?utf-8?B?dFAyNy9HZUd2L2tCd2IxSFJGQ3U2bWhDTFF3NlgwRlE3cjkzOCt3aUQ3WlZJ?=
 =?utf-8?B?dlFyeEd4dUdFQ1U1bkNRUlNlTkhidjZ1K281cHdxWjQ5Vmk5eGlRZHFIZHlI?=
 =?utf-8?B?eGVOVTBjUTBlblN6T3JhSXA4RkJpQjBibjl0dGFXeWxmSnNBODZzcTRhc1Js?=
 =?utf-8?B?VGQ5a3RyT1NlY3BOMW9zQlM0cFhtQUtlYWxqMGpxZ1RZaElmM0xBalZIL2x1?=
 =?utf-8?B?VmhyNERwc0RiYlpxN1FzQS81QUlzdzFRYkVvNlFkQmNINko4T3h4czltdWVz?=
 =?utf-8?B?bG1jR3lpNjNNb1BpVE9zcjIxaFIyTlUreWVhTERRbDY1MUw1YlJNb3RpUVpZ?=
 =?utf-8?B?dm55N3VKRWJFVERGU0o3OTd6T0QrUFlHNDdrNWtXUXE0enZDc3A5QUxaUGhU?=
 =?utf-8?B?eGpIUCtIczB2bldRRlVZMllBU0pWa2lKa2hyNlVkWDRkVHdVbWFiaWZielF0?=
 =?utf-8?B?TnhqWldlZ1R3Y1BvdXBOYUo4aXYySjhqTW0rb1lQMjh2eU1BODlTMG1zQ2tI?=
 =?utf-8?B?eVM0Y1YyZGxUTXVSZW0vSGJNOTRTZmttcGgraUhBUGp0Smw4bjljOGYweHA3?=
 =?utf-8?B?dUZIQVdkaUNEN21WdXhBMWNVSnZmTjBGVS9DcTNtYko4MUdlYUNzTnlHUVl2?=
 =?utf-8?B?RzRCR2d6VTM0UEJLN3o3TGt3aEJwbjczN3Y0TW5rYWp4VThSVllZWVZqaTBE?=
 =?utf-8?B?Zk5CN3ZsalpaMnZ6SXNNM1JBR01vQnNxRzV4TnBtYzcrSHFvV3JKVkh5UVZp?=
 =?utf-8?B?Q2Roc25NWmRxUDhrdHJJTjY5WjdORFVBMHNIN1VYNFZZZzBWNmNGdWpMcnJP?=
 =?utf-8?B?YkN6N0I0cU1sQ3ZheFVCcUc4TitOSmhQYjZOSmhaR2hSV3ZndUZ4eWtoc1hX?=
 =?utf-8?B?NS9lSzJwbmVTNU01b2V2b2pTZ2MzbG45REJ5bkY3OWVrYnVvcCtQRllCRlUx?=
 =?utf-8?B?NDU2YzhrVkdLd1owS2pIUnRYR21DM2FLU2Ezd25TVWMzYXJLQkVHVnZldk5E?=
 =?utf-8?B?cHV3aWg5U01PanRsaXA5T0lITGpCZzlJejZrQkFHbHRwQk4vSjlUMi9WdXp6?=
 =?utf-8?B?cVdBQ01FaHFSSU5SNDdFQjNOS0orOWFkK0h5V0J2SHBQSnkvUmJ4aE9YNTdn?=
 =?utf-8?B?MGo0UnQ0ZTV2RlpwRHlqWmN0TVhYeFlpNVRmSmwzdC90QnNucFUyejhDblZI?=
 =?utf-8?B?VlhTL0hrYzJHa0VnejBScFl3QjdLTWg2T2I0NkJud21VNlBzbDk1RWdSWnIx?=
 =?utf-8?B?M21rS3Irc1F4dlh1Wlo0aEZSQlZMNzJJQWNjbUY0RkVaREVqaW9tOXJHN0g1?=
 =?utf-8?B?TFk2R205YWRoWko1NnlJcUViZzZHVjA3bSs4OHJOSVlQRjA1MFNUUU9MTTY1?=
 =?utf-8?B?anpQMTJwTHR5elpraGhwU1RudHYzN1MxNXVQZzFjRDQ3U056dUM3d3BldEcy?=
 =?utf-8?B?cC9oUyt2VENKQzk2TUhyZEI4SjBBRWp6NEcvdUplNDJvSHpVcjNDalJRNi9D?=
 =?utf-8?B?Vi9sMERJcTd3cklVM2owWXNaZnlhN25XL0pmRFBkMUJRdEgzUTlzaUtBVkM0?=
 =?utf-8?Q?tEtmxWk2YE21sAZA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf7968b-5010-4741-c689-08de51d8177d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:42:48.5107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icTrtx9rki8upo3PKFsB8G+Aa132Fy8NU8ckhkzkmJQNs/SX7c2EqJdG2125lLwOlg7Nlr87Btj34XqLL40RqxEwgosc3dkug5o25gblXW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=6964ec4c cx=c_pps
 a=bYEXqv4PBJnnT5HxTb2zpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=BG18aydIDsxPCScLxMoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEwMiBTYWx0ZWRfXyTRWiLHs/con
 /9QPuH81pcVZYKGf2NOQTP23/ZYtgtkquHxd0VWa2CI4G/ZKvW6uqOs5Vumvb3nQ/rH9Ay5N9nM
 YRgdAzeZU7l/eNfUc6FZ2tmiaE3Px1pLLmVY+hbokt1O/vFvkPQRwhiIDqhu76MtimP/tGdKgB4
 xtqFhQd7y67Pku1eT83er/c1NrSUWhj1B2C0fW6dnyC9gUZZtN1xRT66n0r4o8e1omXrcKqLUSg
 kQN7kJKFIUU0Xnxrbz4WeQkGYN2Wy1H+L9PV+YH2CElIarf774H7medhACws/eAMtcaEGVDPydU
 G1oXAMHDMwjD9W30LMUPNDAnJg8ZcJ01/D+9l8qmbivGHV890/7357iWn9GwrgFsw5Irc+fUysu
 1qulUlLGgZ8Zp3tOdS1gsQvyZlkNuD0Vmnt6m/ieJHBPuzVDfJhDTJ6rubRvhJ3i5lULygUc+6J
 e339E/zwKdoCNcYpl0Q==
X-Proofpoint-ORIG-GUID: NXR3lBE4QLIRlLnQm4rpVEREOntg6q1z
X-Proofpoint-GUID: JEdjamQc_NAEiYd6uewEbYvntqlJyS7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60C9Wsri942877
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 12:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123382


On 1/12/2026 5:25 PM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 1/12/26 10:09, Anuj Mittal via lists.openembedded.org wrote:
>> On Mon, Jan 12, 2026 at 1:06=E2=80=AFPM Haixiao Yan
>> <haixiao.yan.cn@windriver.com> wrote:
>>> On 2026/1/12 11:10, Anuj Mittal wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er and know the content is safe.
>>>>
>>>> On Sat, Jan 10, 2026 at 6:01=E2=80=AFPM Yan, Haixiao (CN) via
>>>> lists.openembedded.org
>>>> <Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>>>
>>>>> - Fix:
>>>>>     NameError: name '_lazy_re_compile' is not defined
>>>>>     introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
>>>>> - Revert the modification for docs/releases/2.2.28.txt
>>>>>
>>>>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>>> ---
>>>>> v2: Fix a typo in the title
>>>>>
>>>>>    .../python3-django/CVE-2024-27351.patch       | 35 ++++---------=
---
>>>>>    .../python3-django/CVE-2024-39329.patch       | 27 +++---------
>>>>>    .../python3-django/CVE-2024-39330.patch       | 40 +++++--------=
-----
>>>>>    .../python3-django/CVE-2024-56374.patch       | 42 +++++--------=
------
>>>>>    .../python3-django/CVE-2025-26699.patch       | 37 +++++--------=
---
>>>>>    .../python3-django/CVE-2025-32873.patch       | 33 ++++---------=
--
>>>>>    .../python3-django/CVE-2025-57833.patch       | 33 ++++---------=
--
>>>> It's hard to look at a patch patching a patch file .. Why are the
>>>> other patch files being changed which didn't have this problem?
>>> For CVE-related fixes, I don't think updating the release notes is
>>> necessary, as no version upgrade is involved.
>> Is this fixing any issue?
>>
>>> For fixing the issue '_lazy_re_compile' is not defined, do you sugges=
t
>>> leaving the original patch untouched and creating a separate patch in=
stead?
>>>
>> Yes, I think it'd be better to separate these two issues.
>>
> Personally I have no big problems with this patch - but if you'd prefer
> to update it, do you think it could be sorted on top of this, instead o=
f
> a v2?
> If you really need to do a v2, that's fine also, but then I will drop
> this one from the currently prepared PR.
>
Thanks, please drop this one. I=E2=80=99ve found another issue with=20
*CVE-2024-42005.patch*, and I=E2=80=99ll address all of the issues in a n=
ew patch.

//Haixiao


