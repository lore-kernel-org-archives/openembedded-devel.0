Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7DCD2502E
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 13:23:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10023.1768137793637120231
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 05:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AjWXjrNY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5471b597aa=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BDKnIt2366027
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 13:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=qxR34mlJEPuuGIBhjaFoHh
	du0gnTsbTI71uXNuTwiec=; b=AjWXjrNYR6gXdlNa+OquqSAWCl7mvyDYiDl9Ww
	OO4XktDzIKFgsh+iCwVa8XBbYqk9RFIxIyxLTTbOmhYd4Jpb0FLteeQTYLQjyLqM
	0XrwTlgPQaNnNnErC0iEYtTEww/s9eV7n7MEMZX4xg8KyLJgf20q+bJdKusfD0Z6
	g51TCIMQIHr/G2Uza4PtIJqubdIgaV9Ril5/ccjSeonoR4gNah8mQW4tDrTDN9rM
	1L0HCHGccKa7xcNj3cNNVz4ycufs3hFxMTvkXG8Da9fBpiR3L6YVKJYlsjy43G/2
	yi9maFsDHbwGMgpbwnzLHnkr/SmB5MN7ivv5i6llIeQ1efIQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytgy26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 13:23:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk04nCOtCV0WpZsXw+AcUj6jbNfFZvOVFbNIveYHBzwkmTHyNLix/CK1cJ/GLNaOInrtRN53DpJfEWBHVfh2zFGgwCqqLtcIdzM2vYD1gfA5F08zbdSZqF0JDF0CcX/FOEI1M7kQXfcjMcH652hYsEaZ4Uutr0uqtVZbXSM0gxWzMhL0GJH9wAP7B0DG0Nijq6mHFAyDuoSA4564EkJcKlWHBzLdKlXbobdUSZms7qi8AHkjXdyQgNwLOPgPXEkySbRQNdi6nPG609VFlFnyoyOjoOKBFaHVzFO91twH2mU6NcZR5kiw+Y2aEOsGAzmi41CGQt41zU6Qa1UgOSOAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxR34mlJEPuuGIBhjaFoHhdu0gnTsbTI71uXNuTwiec=;
 b=zMCgJ/Y46Cva6F18SQoSy6KjW+p2IZGIYBcxjauwvymdhapSXdAj0WrbvH2Qiwy/MgpwQeCjOqUyUsePTdggrRY89uqdKA1cULqfmh0OXU6qOWHx+Nn9/TEqRbp1KySMmLY/DkNARbvml+tGGh9/6NxFbHaxwNnNyvlTRkwd9S4+w/OuwXVmfaYmzzw2tEWP60OOucCEr54fUeHOTdi7qVcnrVV2NupL/fT44uiQ2UarGY+YoreTrez8AqpzA2qa61pkpyCoGJw7x9mFV46DVm8B6tvPqHbOx+FsoPn2PmOCpbvqs9MD/bR0lm56d35VgxN4ln1NcUsA7c8J5QgqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Sun, 11 Jan 2026 13:23:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 13:23:07 +0000
Content-Type: multipart/alternative;
 boundary="------------4is5sA0W52AIo2zCSYx25d9l"
Message-ID: <0724c596-aebf-48a4-981e-054c72bee610@windriver.com>
Date: Sun, 11 Jan 2026 21:23:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 4/4] nng: add ptest
To: Khem Raj <raj.khem@gmail.com>, yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260110133810.515672-1-yi.zhao@windriver.com>
 <20260110133810.515672-4-yi.zhao@windriver.com>
 <CAMKF1soqyV0pSn7d1S3g35J4D=e5TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1soqyV0pSn7d1S3g35J4D=e5TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 003dc0d5-39b6-4630-bd82-08de51148f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2xqMlBJcVRXcVV0cXplWDZVUU9QSXpNbnBzMVV6RUpPaHpZc3FvSGNSWHRW?=
 =?utf-8?B?QktuSDJjelJvYzBnSXFYdUl3ejlVOGtLbkZQNUE4WHZBa2xyeHpIbFZXOWJr?=
 =?utf-8?B?QXh0Ynk3RGxKMi9vazdhdUdSakFEQW9BOHRCQmpVM1lMRTYwdkVlZE5UYlZv?=
 =?utf-8?B?QXZWWDg1WS9uUmNSZUE3WHZjdDg4T3cvZDlsZ1dWR1ZHZjZkd1Zhd0Rxcldj?=
 =?utf-8?B?cDJTNHhFdTUzbHo4RkdWWHUwZzlnOEJPNzdXOGZqbFhINk9VcVdQQWl6c0VR?=
 =?utf-8?B?S0Q2aTBPMERZM0RWTDluQ2ZJeHpGV2JLZ2ZYbEVaTGdHeFFkbmIrSy9iZWdx?=
 =?utf-8?B?UU9Jbnp1bFBEWGxEVXlBKzgwRUZkSkIyYzlyaWhWb0EyVFVpeGNQdmNyZ2M5?=
 =?utf-8?B?Z0ZJbmtLTlJ5SlRGYXlUa0x1RzR2ZXA0OG10V1ZxY29qVyt3MmFaRWtJT0ho?=
 =?utf-8?B?SXN2UVNKU2I0RHV3U0JvT2IySGx4WElPSkkrYmhlUHpGenNnZG43TWRJdFhk?=
 =?utf-8?B?V3lyV05odUl1dmRGZnVHNkdTTVV4Y0g1dGJ0NjZTK2tOVWFxS2NVKzl2WW9Y?=
 =?utf-8?B?blVTR3JhQitUNVdKeDVRYWpUM29weGk4UEVKNE5vczZxbjdqM1EvL3ZCNkQy?=
 =?utf-8?B?c1BINENiNWNjclc5NThtdG9tQU1DR3ZkUmd5R1FVMHZwY0JWbk1QaHgxSW9v?=
 =?utf-8?B?aDQ4a1R6Z0pQblkvcUpXYXgzcGp4WDMvcUpSV3NqWC91aTFxRlFSQ3V0bFF6?=
 =?utf-8?B?eEdSYWxCZUtLTDRZQnJSVVhHZldRVGhWV1FNSG1PbjNaQTZPQU1FbnpvNStk?=
 =?utf-8?B?bTRFQW9HRlZhZTdtZ3hlWDRvcXlMWXI4TU1OYmVkMjN2d3k2a2J0VWJQOElN?=
 =?utf-8?B?LytHbWtpK1lmNkttK3VHS1BpNFJyc1JaelM5OUFWT3h1UjZ3a0tGb0RJLzhD?=
 =?utf-8?B?dHlEclpzY2wrbVZpdzh5QTNDcno5Z0x0SVQ1bHJIYy9iZWJDdzNMVDhGRGgv?=
 =?utf-8?B?T2UwOFN4WGNYVDhES1ZXT20vY3FBZTZ1d0VLeksreEUwMjE4cGdyTCtqZ3Jy?=
 =?utf-8?B?NW5Sak1Bb1hwcnFjY0ZzaVBKSXFMb043Qll6T242K3Rjd2ZvR1gzWlAwTGpq?=
 =?utf-8?B?bGdxczB2aE82cDJMQVBaZEdoeDBuTkNmQWwvNk44ZHQxc1gzSTA4Rm90SEhD?=
 =?utf-8?B?OStVSVFsejlnS3FJeUVCblZyQldMbzJmbEpjVVoyNTdRa0RWaXZXc1RoTnRK?=
 =?utf-8?B?S1RGM1hNdHFwK0FXR01za1I5SUN6ZU9qbCtJN2Jnb2RNTFF5NFlTOFV0NUFn?=
 =?utf-8?B?KzA4Y2dOeHE2aVFkaFpmaWZmRWJNN1J6aC8yZUN1MEo3OHg4dHRFZWI3NlFF?=
 =?utf-8?B?SUNaa1VaSXNISXpOZE9hbENySXNmUGh1VFlWQU5uQ2hucFJpd24xY09aaE9Z?=
 =?utf-8?B?a2hmUGNOdkh0VUZVdGFlRXYyQ20vVlpsV2hIQU44NFp3YXNFRGhQbUZ1R0tU?=
 =?utf-8?B?UmhCeGN6b2tqZnViRlBpNU00VE44L2cvTERNbStVaUdzUk5NbFg4VGk3eTRI?=
 =?utf-8?B?VnJtOGNsRXFsTmEwQnc4NXhETldpUndXQ2xIQmlyaExMeDZVdmpnVnczZW5E?=
 =?utf-8?B?MHFQVE8yMkxMeGNRT2xnMExNNkZKbUpuUDB0MUZ4c25PNFBaN09kU1hQMytX?=
 =?utf-8?B?L3NTQnF3bmNOdWxCckpvUE12YVR5eGNCU1ByZlRvM3V4QlFEcWRxaGR1bzJw?=
 =?utf-8?B?VUFiZHFxcDB5VVdIMFZMYnNDRWF0WUJyd2NnTFVvVGJPYmRla3BnejhCQTRh?=
 =?utf-8?B?cHdDNWF1S09xc3hBSkNZN0RxOTN5dXRwWkh5OEJoV0FXMjRkRWNNOWNvVXV3?=
 =?utf-8?B?dzd3VnV1bnpiTXQ5QXpoazR2NGYyU2VmeDVoVkorNVNIcnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUc3RDAzQ3BlRmxOOGFUNWxpMlhFcVRsRGVlTWVLWFoxdUxQSHhHLzdxUEpU?=
 =?utf-8?B?K1dHOVgyMWZKTlBkdll2VnYwYSt1ZmVIMnVNSHc2SnMxWG1nZ0xDMURyMDI5?=
 =?utf-8?B?MTlxeWlUZDFyRzlnQkVpWG83d05IUkxBY1VHN250OXc0S2RFSWhGQnVBNWRt?=
 =?utf-8?B?VW9KeVNGeXNLY1J3eGozS2xtYllpVE1RbXU4VVpndUFDZ3R2UUt0a3ZZSHVF?=
 =?utf-8?B?am5oNkNzdUJTZWJxTkFpZWJVNi9JVGZsZU5rK2tTU2ExNmI5NVcyTENwN3py?=
 =?utf-8?B?cGx3L3c0aE83QnFQbXB4QnA3VkQvNk9IYUk1bHZMMFZPSS8zdjRpaHZLYVJt?=
 =?utf-8?B?QzBFZWprYm9sMndKRGF4YWwwZ21Wb2ZEdFowUjFhSHlGaEd1SFZDcE5mcU1j?=
 =?utf-8?B?N3c3bHoxaEkzMFFsTFZTdlZlYjN2a3hRQ3VRbEZtYjVCNUNqN01DY1MyMENt?=
 =?utf-8?B?TldHZ0I2QmVycUFLZTZhNzBOMHNVbkJCN21LWnpoTUwwc3p4YTZQdE8vclZL?=
 =?utf-8?B?MmhURzNnVlN3OVBiNkE0aDBLMnR6dGRvc0RkNGNrMllzZm9RTStueFQ5LzE5?=
 =?utf-8?B?UmxZM3pCSmhDbG9zU2pSU3FSZFN3ZGtNZWcvK29GK2cwSytCVkthWXJraENQ?=
 =?utf-8?B?ZFVCUkswQjRncGJoM2M4SUk1MzlRWDZOSE9nczRWUFZNQzNHaEhJdW8zYXV3?=
 =?utf-8?B?RUJLaGVaaFJJSGd5QWsvTThRQzd2OVNkdUo0RFJJSmlrMzQzbmN6WEJxUWIz?=
 =?utf-8?B?NGFCUjBCTmtkalA1MnN1d0sxRzFTdkIzOS9tZ2J1ZjFNQ0dycDRTME55UndO?=
 =?utf-8?B?aGhJTDYzU0tuaFgvVnlrZzZISkFObDJjSS9Obk5uMzlJaWRqK0FFYysvUlZQ?=
 =?utf-8?B?bUF5NFQ1YVdza1YvalZKRlRFQ2Y2aWRKMGV1M1hCc2RrOTVCaERQYWROUDFu?=
 =?utf-8?B?T2V0cmcyR2MyMUQ5VHhTSHQydEZnQ1VyQVRDQzRpZmplZzk4aHpEZlFRSFQ3?=
 =?utf-8?B?Sk5qVDNTR09wWm56WUFWK3c2TEZwdVZHNVJUNzFaK2lDQS9XNFdIWnBtRU8r?=
 =?utf-8?B?ZmZVQnJDYzdVNTNPVExaSUw4THBqZFFtZGhYOW1kL0dMOGN4aEJIK0J6aDBa?=
 =?utf-8?B?T0t0d21vNzdnR2FOeG9pUkt5ZXZHNFBwNzlBTEh4TmR3YVo2VlZrNTVoanFC?=
 =?utf-8?B?VmNwdm5qVCt6SFArK2pnSnF5aFp4ZDlGcy93a2piRkw4MXN2WWkxalFsV0dw?=
 =?utf-8?B?S2JGbE5ZaFZrSWMyU3dqSzZuUk5sbHdyYkRlcWc2aXkxSm9Dcnp5NWtOVlZT?=
 =?utf-8?B?ZnlNZUROa25GZlVEdEc2TGtheXhkUHlxZHZzUHltME4xcG5HSm9GWXcwT24z?=
 =?utf-8?B?R2dHR3lDQ2pPR3l0QkRQUDlMc044WG1nbVBDS3ZPYWxnU2IxSnZZTGV0VERM?=
 =?utf-8?B?RDNjeUVXQTJpRE91ZjRkS0FreFUxb1dvWkNwcGZzbmhHZW1LS0JsaDZFMGhn?=
 =?utf-8?B?Y28vN3RMOEtqNk8rTDd0d0VCcXZFTTlaemJFMUlHWXBjOFEzbWQxTUpIcFF3?=
 =?utf-8?B?YTVmbERUZEdNdEdXVSswN0FqRUJIdVRvemFybXBzZG9QY3I0bHdJYzVaTEdX?=
 =?utf-8?B?dDZvVU5MSnhCbHEwb0R1WTBrTWdidTZsNDhrSDdUSFVVNWcramFtcCtDMFV0?=
 =?utf-8?B?bFRQbytQalgyUDk3akthTHBzOG91cnZTdEMydUVwQlMraUVhN0c4WnU5TzlH?=
 =?utf-8?B?eG1FTU5IaE5lQTdaZkIzOW56cjdxNVdabXVkQThaR1BOblNEc2VNbTUrVmVX?=
 =?utf-8?B?N1k5MlZ1TjJTVVhxSUNnZGhpdGsvS0dWcDJvM3JoSVA0a3J3M1ZBeUVFZ0tt?=
 =?utf-8?B?QW00bmMxN0VHV0E0aDczYWhaUkJuVkduWkJGRG1PdVNWeUJLbVc4QXQ4K1B2?=
 =?utf-8?B?YkpkcXpyVTlqd0lFV21rekxqanBRRlRiSHZPSHcwRWs2Znk0SXFkNTJFN2Fk?=
 =?utf-8?B?dUF0Q1hUd1NZa1ZRWVVrL2VVWVR5TWtCbVNoT1J6d2xKd3JIZDdvUTM0cUdT?=
 =?utf-8?B?M2N0MXlUeGJqOXBhVEZoVnpDMEJzQ2lucFYyOC9kQk4xZmFyZjdmYU93SVZv?=
 =?utf-8?B?bzJseUp2YVpWMHNxRU5NWFpJR2l5ZVNmTzNaRGZuTXZtZENiUU9hMkk5djBQ?=
 =?utf-8?B?ckhlTHRDNnlRUiszWmV5dmpRWHJReGZvNkRONWREWjhOaXVzV1B2U3pMSXox?=
 =?utf-8?B?eTVDTkNjbTNzd2syeU9haHFHUmsyaUlVWS9MaWVZMHdPeXh1VHhsTjNsaTdY?=
 =?utf-8?B?NTc3ZmQ5OXAxM2FUWEN3TXVSNm5hbXBraFJNZHV0cWtJUlFyWkkxUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003dc0d5-39b6-4630-bd82-08de51148f38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 13:23:07.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jbGGpAx68JlbPxeyhGscLi4DT+kdMIA4FzPElmolIplboQuhFZGrN0zgovp/tJpC/qmD+Z9nnKCMer+vFRMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i9lCt2OV_fDJOO7BDQDiYn_Xu4M9v00g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDEyMyBTYWx0ZWRfX6dMh79Mw4ThE
 vpYsVbHzWbv4o6YoHXf5tDLbhzFeVKOdmiv99iIhhkGCaIIcyh4Vbot44h5NjD6kZmwIS+zIoic
 1mRssRo1fmkUuDFhmfGZgt8+LmFl8tphqyl5udKh/pFIhLrTgDhavYi8Qxy6mhKkN2PNGIfgpS8
 FuSlw8nt552zWt2HeKQF9elHxnZzwtKFoqaDHV8FKPji+pQLtEiGb/CHN3qJcSBdlL8TPb66UjQ
 hHsFC4osAGbBtWieIG8H/N1E5ECS1ZJZUdxEzgjY8saCDpKbCCWkrLeqhkQ5IXltS5N8h/7R0Zk
 c1bsSNWOEnldHqzxEahJZsHV3QyZ3PRfNokRYyfN4OgcleBnoeW6e0vA0U6IIAMx2LjzIiR/UJq
 wEiOfXDTJxjynOsBOHTHqrtxbSREYpf7t2mlnH/LIgKXueurW5+WazzjzmajX45Rl3e7PkHYsbm
 BSaQbm8LYF/O826aStg==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6963a440 cx=c_pps
 a=v7DXidBSvHT+GL4JoI7fUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=A1X0JdhQAAAA:8 a=9gK4UEqLAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=hN1FgU8sfaMn5XtByPUA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dT5_APJYaY3pgIIl9HMA:9
 a=iwwGdyrggLPMNiEm:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Q1RLv2d2K-DeJgb8p1rq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lIMoqRu1NaZF0klbCHqrs5EMZa3MujSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 13:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123346

--------------4is5sA0W52AIo2zCSYx25d9l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60BDKnIt2366027


On 1/10/26 23:10, Khem Raj wrote:
>
>
> On Sat, Jan 10, 2026 at 5:38=E2=80=AFAM Yi Zhao via lists.openembedded.=
org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9=
y71SmN6R-H_flajXg$>=20
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
>     Ptest results:
>
>     $ run-ptest
>     PASS: compat_block
>     PASS: compat_bug777
>     PASS: compat_bus
>     PASS: compat_cmsg
>     PASS: compat_device
>     PASS: compat_iovec
>     PASS: compat_msg
>     PASS: compat_options
>     PASS: compat_pair
>     PASS: compat_pipeline
>     PASS: compat_poll
>     PASS: compat_reqrep
>     PASS: compat_reqttl
>     PASS: compat_shutdown
>     PASS: compat_survey
>     PASS: compat_surveyttl
>     PASS: cplusplus_pair
>     PASS: device
>     PASS: files
>     FAIL: httpclient
>
This case attempts to retrieve the Content-Length field from the HTTP=20
header of http://example.com/,

but because the site uses chunked transfer encoding, the Content-Length=20
field is not present, leading to an assertion failure.


>     PASS: httpserver
>     PASS: inproc
>     PASS: ipc
>     PASS: ipcsupp
>     PASS: multistress
>     PASS: nonblock
>     PASS: options
>     PASS: pipe
>     PASS: pollfd
>     PASS: reqctx
>     PASS: reqstress
>     PASS: scalability
>     PASS: synch
>     PASS: tcp
>     FAIL: tcp6
>
This is because the ipv6 address for eth0 is not configured=C2=A0 on qemu=
 image.

It can pass on genericx86-64 BSP.


I will update commit message in V2.


//Yi

>     PASS: tcpsupp
>     PASS: tls
>     PASS: ws
>     PASS: wss
>
>
> There are couple of failures here. Have you
> Looked into them ? It would be good to document
> That for future if we get back to fixing them
>
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     ---
>     =C2=A0.../recipes-connectivity/nanomsg/nng/run-ptest=C2=A0 =C2=A0| =
16
>     ++++++++++++++++
>     =C2=A0.../recipes-connectivity/nanomsg/nng_1.11.bb
>     <https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD=
_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6=
R-G88JHhQw$>
>     =C2=A0 =C2=A0| 16 +++++++++++++---
>     =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>     =C2=A0create mode 100644
>     meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
>
>     diff --git
>     a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
>     b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
>     new file mode 100644
>     index 0000000000..57888a77c9
>     --- /dev/null
>     +++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
>     @@ -0,0 +1,16 @@
>     +#!/bin/sh
>     +
>     +RET=3D0
>     +cd tests
>     +
>     +for t in $(ls *); do
>     +=C2=A0 =C2=A0 ./$t > /dev/null
>     +=C2=A0 =C2=A0 if [ $? -eq 0 ]; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo PASS: $t
>     +=C2=A0 =C2=A0 else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo FAIL: $t
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RET=3D1
>     +=C2=A0 =C2=A0 fi
>     +done
>     +
>     +exit $RET
>     diff --git
>     a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
>     <https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD=
_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6=
R-G88JHhQw$>
>     b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
>     <https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD=
_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6=
R-G88JHhQw$>
>     index e59b7f34e2..031827a5c0 100644
>     --- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
>     <https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD=
_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6=
R-G88JHhQw$>
>     +++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
>     <https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD=
_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6=
R-G88JHhQw$>
>     @@ -5,16 +5,26 @@ SECTION =3D "libs/networking"
>     =C2=A0LICENSE =3D "MIT"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://LICENSE.txt;md5=3Da41e579bb4326c21c774f8e51e41d8a3"
>
>     -SRC_URI =3D
>     "git://github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps
>     <https://urldefense.com/v3/__http://github.com/nanomsg/nng.git;bran=
ch=3Dstable;protocol=3Dhttps__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3=
EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-FaSIM_Yw$>"
>     +SRC_URI =3D
>     "git://github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps
>     <https://urldefense.com/v3/__http://github.com/nanomsg/nng.git;bran=
ch=3Dstable;protocol=3Dhttps__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3=
EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-FaSIM_Yw$>
>     \
>     + file://run-ptest \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     +
>     =C2=A0SRCREV =3D "84aa701f42968bf536141a24e826da66963b571a"
>
>     -inherit cmake pkgconfig
>     +inherit cmake pkgconfig ptest
>
>     -EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3D=
ON"
>     +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3D=
ON \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@b=
b.utils.contains('PTEST_ENABLED', '1',
>     '-DNNG_TESTS=3DON', '', d)} \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0PACKAGECONFIG ??=3D ""
>
>     =C2=A0PACKAGECONFIG[mbedtls] =3D
>     "-DNNG_ENABLE_TLS=3DON,-DNNG_ENABLE_TLS=3DOFF,mbedtls"
>
>     +do_install_ptest(){
>     +=C2=A0 =C2=A0 install -d ${D}/${PTEST_PATH}/tests
>     +=C2=A0 =C2=A0 find ${B}/tests -type f -executable -exec install {}
>     ${D}${PTEST_PATH}/tests/ \;
>     +}
>     +
>     =C2=A0PACKAGES =3D+ "${PN}-tools"
>     =C2=A0FILES:${PN}-tools =3D "${bindir}/*"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#123329):
>     https://lists.openembedded.org/g/openembedded-devel/message/123329
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/123329__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3=
EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-EbZZaBRw$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/117190746/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1171=
90746/1997914__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLU=
kYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-E4QcInoA$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0=
sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-Edgf-LVw$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------4is5sA0W52AIo2zCSYx25d9l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60BDKnIt2366027

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/10/26 23:10, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soqyV0pSn7d1S3g35J4D=3De5=
TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 10, 2026 at
            5:38=E2=80=AFAM Yi Zhao via <a href=3D"https://urldefense.com=
/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX=
8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-H_flajXg$" moz-d=
o-not-send=3D"true">lists.openembedded.org</a>
            &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.opene=
mbedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">eng=
.windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">Ptest
            results:<br>
            <br>
            $ run-ptest<br>
            PASS: compat_block<br>
            PASS: compat_bug777<br>
            PASS: compat_bus<br>
            PASS: compat_cmsg<br>
            PASS: compat_device<br>
            PASS: compat_iovec<br>
            PASS: compat_msg<br>
            PASS: compat_options<br>
            PASS: compat_pair<br>
            PASS: compat_pipeline<br>
            PASS: compat_poll<br>
            PASS: compat_reqrep<br>
            PASS: compat_reqttl<br>
            PASS: compat_shutdown<br>
            PASS: compat_survey<br>
            PASS: compat_surveyttl<br>
            PASS: cplusplus_pair<br>
            PASS: device<br>
            PASS: files<br>
            FAIL: httpclient<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p>This case attempts to retrieve the Content-Length field from the
      HTTP header of <a class=3D"moz-txt-link-freetext" href=3D"http://ex=
ample.com/">http://example.com/</a>,&nbsp;</p>
    <p>but because the site uses chunked transfer encoding, the
      Content-Length field is not present, leading to an assertion
      failure.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soqyV0pSn7d1S3g35J4D=3De5=
TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">PASS:
            httpserver<br>
            PASS: inproc<br>
            PASS: ipc<br>
            PASS: ipcsupp<br>
            PASS: multistress<br>
            PASS: nonblock<br>
            PASS: options<br>
            PASS: pipe<br>
            PASS: pollfd<br>
            PASS: reqctx<br>
            PASS: reqstress<br>
            PASS: scalability<br>
            PASS: synch<br>
            PASS: tcp<br>
            FAIL: tcp6<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p>This is because the ipv6 address for eth0 is not configured&nbsp; =
on
      qemu image.</p>
    <p>It can pass on genericx86-64 BSP.</p>
    <p><br>
    </p>
    <p>I will update commit message in V2.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soqyV0pSn7d1S3g35J4D=3De5=
TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">PASS:
            tcpsupp<br>
            PASS: tls<br>
            PASS: ws<br>
            PASS: wss<br>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">There are couple of failures here. Have you</=
div>
          <div dir=3D"auto">Looked into them ? It would be good to
            document</div>
          <div dir=3D"auto">That for future if we get back to fixing them=
&nbsp;</div>
          <div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)"><br>
            Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../recipes-connectivity/nanomsg/nng/run-ptest&nbsp; &n=
bsp;| 16
            ++++++++++++++++<br>
            &nbsp;.../recipes-connectivity/nanomsg/<a href=3D"https://url=
defense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX=
8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-G88JHhQw$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nng_1.11.bb</a>&n=
bsp;
            &nbsp; &nbsp;| 16 +++++++++++++---<br>
            &nbsp;2 files changed, 29 insertions(+), 3 deletions(-)<br>
            &nbsp;create mode 100644
            meta-networking/recipes-connectivity/nanomsg/nng/run-ptest<br=
>
            <br>
            diff --git
            a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
            b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest<=
br>
            new file mode 100644<br>
            index 0000000000..57888a77c9<br>
            --- /dev/null<br>
            +++
            b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest<=
br>
            @@ -0,0 +1,16 @@<br>
            +#!/bin/sh<br>
            +<br>
            +RET=3D0<br>
            +cd tests<br>
            +<br>
            +for t in $(ls *); do<br>
            +&nbsp; &nbsp; ./$t &gt; /dev/null<br>
            +&nbsp; &nbsp; if [ $? -eq 0 ]; then<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; echo PASS: $t<br>
            +&nbsp; &nbsp; else<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; echo FAIL: $t<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; RET=3D1<br>
            +&nbsp; &nbsp; fi<br>
            +done<br>
            +<br>
            +exit $RET<br>
            diff --git a/meta-networking/recipes-connectivity/nanomsg/<a =
href=3D"https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eU=
D_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN=
6R-G88JHhQw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">nng_1.11.bb</a>
            b/meta-networking/recipes-connectivity/nanomsg/<a href=3D"htt=
ps://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD_F_6TrY4Cv=
i7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-G88JHhQw=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nng_1.11=
.bb</a><br>
            index e59b7f34e2..031827a5c0 100644<br>
            --- a/meta-networking/recipes-connectivity/nanomsg/<a href=3D=
"https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD_F_6Tr=
Y4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-G88J=
HhQw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nng_=
1.11.bb</a><br>
            +++ b/meta-networking/recipes-connectivity/nanomsg/<a href=3D=
"https://urldefense.com/v3/__http://nng_1.11.bb__;!!AjveYdw8EvQ!eUD_F_6Tr=
Y4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-G88J=
HhQw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nng_=
1.11.bb</a><br>
            @@ -5,16 +5,26 @@ SECTION =3D &quot;libs/networking&quot;<br>
            &nbsp;LICENSE =3D &quot;MIT&quot;<br>
            &nbsp;LIC_FILES_CHKSUM =3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE.txt=
;md5=3Da41e579bb4326c21c774f8e51e41d8a3">&quot;file://LICENSE.txt;md5=3Da=
41e579bb4326c21c774f8e51e41d8a3&quot;</a><br>
            <br>
            -SRC_URI =3D &quot;git://<a href=3D"https://urldefense.com/v3=
/__http://github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps__;!=
!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0=
pmgjIXDS9y71SmN6R-FaSIM_Yw$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dh=
ttps</a>&quot;<br>
            +SRC_URI =3D &quot;git://<a href=3D"https://urldefense.com/v3=
/__http://github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps__;!=
!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0=
pmgjIXDS9y71SmN6R-FaSIM_Yw$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">github.com/nanomsg/nng.git;branch=3Dstable;protocol=3Dh=
ttps</a>
            \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://run-ptest">file://run-ptest</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
            +<br>
            &nbsp;SRCREV =3D &quot;84aa701f42968bf536141a24e826da66963b57=
1a&quot;<br>
            <br>
            -inherit cmake pkgconfig<br>
            +inherit cmake pkgconfig ptest<br>
            <br>
            -EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON
            -DNNG_ENABLE_NNGCAT=3DON&quot;<br>
            +EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON
            -DNNG_ENABLE_NNGCAT=3DON \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;${@bb.utils.contains('PTEST_ENABLED', '1',
            '-DNNG_TESTS=3DON', '', d)} \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quo=
t;<br>
            <br>
            &nbsp;PACKAGECONFIG ??=3D &quot;&quot;<br>
            <br>
            &nbsp;PACKAGECONFIG[mbedtls] =3D
            &quot;-DNNG_ENABLE_TLS=3DON,-DNNG_ENABLE_TLS=3DOFF,mbedtls&qu=
ot;<br>
            <br>
            +do_install_ptest(){<br>
            +&nbsp; &nbsp; install -d ${D}/${PTEST_PATH}/tests<br>
            +&nbsp; &nbsp; find ${B}/tests -type f -executable -exec inst=
all {}
            ${D}${PTEST_PATH}/tests/ \;<br>
            +}<br>
            +<br>
            &nbsp;PACKAGES =3D+ &quot;${PN}-tools&quot;<br>
            &nbsp;FILES:${PN}-tools =3D &quot;${bindir}/*&quot;<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#123329): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/123329=
__;!!AjveYdw8EvQ!eUD_F_6TrY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQo=
leA0pmgjIXDS9y71SmN6R-EbZZaBRw$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-devel=
/message/123329</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/117190746/1997914__;!!AjveYdw8EvQ!eUD_F_6TrY=
4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-E4QcI=
noA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/mt/117190746/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!eUD_F_6T=
rY4Cvi7j2wUSX8ys_GZ3EQyn_sRf0sLMmLUkYRg-OCJ0iGQoleA0pmgjIXDS9y71SmN6R-Edg=
f-LVw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4is5sA0W52AIo2zCSYx25d9l--

