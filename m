Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9CECD4846
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 02:03:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66489.1778551379366494632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 19:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sToBaVJX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9592267a27=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C1dWOq2667939
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 19:02:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xQMUJfSgbb9Ijh8YYQJjq9V/D++5v5QhqY/CLIuC0vg=; b=sToBaVJXvFQW
	tawLsigc6CKdI2wpAaD3rmIF4dKTWWCQ95EmJLanAL7TGApHS1wuqlu3vpbndvTX
	1y3VlVu5Lxo7oRDxZ02fmbGEDMa7KKtT6jXQAmKBTzCwSYv/0FqhDctUa28q+c2H
	BY4roT2WGZuNEtkxFPwBM6PGIj8e6i2Kav+LG35jr6Iddj72wOZBXoab/IIUgoou
	nN2Z6Zlu23CLyH2nTkA/YpHU5Ql6zqyM7ony1NfKuILkD0/eYnY6MC2rgfQ2VXUy
	XPe9FQWOOHaZauzt/SwRlytpjJOlTOXqEc87StrcmE/WFOk57e+Kw50MN3nfYkqF
	A4WPmunO6Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nv90a16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 19:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2rYqlKlOgThn2Hp9hZdm4D0T+sJx8FBxXTGNdWSLm2ANw/dDL1T2iy6v0emmMQlL+FFWj3oTUyTqtGXCQ75upq5PdqoIbYrYE22FM0Y8Tai5rHZXRD/kQ+3mB74jrZJPqPfDc60sWDN9OpjVUXzw9GGddoAFoEqnv8oDkHD+TXwozhmycRS/QaYAe3bgBOVtuy9woFuWJyGczjRxfuwzs9Gg6mr0lIAL4UwvkIk9wYbHEHz30tzTJjALgLjdiPVXnMSx7XIYrorw78XBQG8PCXwwfS97DFl0IC9TndLW2WjNMMu1VnqYrs1HJIMnwABb4Wb/5RyCaAQXlwqPhkdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQMUJfSgbb9Ijh8YYQJjq9V/D++5v5QhqY/CLIuC0vg=;
 b=Pu2Asi+oX2M0SzvAYZRb8Q7x6MfDKxxeyUkbTP9rXArlOA+PMEFp8bZdCJw0/6NTZ6osYFfagWYo6lHIxaxJyXB7+1t7Nj2D6ld1tT15d6VmoKZdSRERk/bjkRzrIWRJr4fWIiBKnEbwI8HVmrwRRkAQMlN/MwI2iMReKVIbCR10uWEsmXSTTnWc/LWj3Z8eoUxPmXOIPWnkkbvq9FcLo97NINGtFvBjgvuWJulLRrPRqywUXPEy+kDlk6+UCvKxwwp12p+DIII9d5kKSvVFRLtv5aMIqxaWN0SrTUQYn5+3erbAU2ntf4dlH0oX5/0WN7QwFNM5fa3RZ+MnBFBCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DSWPR11MB9955.namprd11.prod.outlook.com (2603:10b6:8:369::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Tue, 12 May 2026 02:02:56 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 02:02:55 +0000
Message-ID: <beba177b-c00d-4ecb-95d3-0b1b64a94dea@windriver.com>
Date: Tue, 12 May 2026 10:02:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] nftables: improve reproducibility
From: Yi Zhao <yi.zhao@windriver.com>
To: yoann.congal@smile.fr, openembedded-devel@lists.openembedded.org
References: <20260511142142.3620917-1-yi.zhao@windriver.com>
 <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
 <836eae13-2219-4e9a-82a0-660cd230e687@windriver.com>
Content-Language: en-US
In-Reply-To: <836eae13-2219-4e9a-82a0-660cd230e687@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TP0P295CA0016.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DSWPR11MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f0bb78-f70c-470e-be4f-08deafca954c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|12006099003|18002099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	9oqAxb1FWzecuYazGc2vN2bh6lBu3EUxnmxYCS63VlqsXJFdm13JCLbw3fNuxsOI1c/cxdL3hpqsnodhfpHa3TGMSjVcGm1mmsH8m3Ul3VQ9VAIWDH9KQsRzN8hKxmeWmGajsII1fcJ7LMDwVfjcHqdOyAk7cK3Fx+KG25WQUmHpfKO3MrzCVrGZMrqTw27/GTn0dXMMcdpcuval1jrVEqJFWjDApZBu96diWv1YzhayN7HYlnYZPxKLu1sLbNjBXR6MdPGVu+cCROJZBexc2G/Yu44s6bpCuwAATfu+RKC8UmLhU1z9uMqoPui6p+fZ3xBpx6v9QfufWD+xFegjlQBdOkcJIDoRvS/5r+HB2jRKESfYlcBUxmO9bB3sBxKHAIwNBM6OmyN1EanPxLAL8n5kVoUcfRFq7t2bYivuB8ZbMMyyikOjMeh0UiRdxe3jCqB5PDsSfophmKEItQ9XI/aG5vSpSlB0KzYGwdOpajGUZXUU1Lli3tuWlpOTNlhLmw9ZLcttF1iqLzuqF+jfyqYgfGH+kTEYHmWLYL1QZd5kwH3pnlWg4FRlxudaVB0mgj2xFFsdGIFdgAqPqjRLDJ0Bt2whOPKQsZbS9FcJZLTId+gZg//YobNgVEw+1WBfsVF1/sg8vQk4x7uCRufo0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(12006099003)(18002099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THlncmk2QkVhVWJQU1h2ZUhCZjNNYWdVTkNVMldBbkg0MnFCMVBnZ2tmVGI3?=
 =?utf-8?B?YnZnTExxRGZQKzN3NWlPRW41UGV4ekZtZlphdmxsODlDRlUxekxuU1dJWE1p?=
 =?utf-8?B?bFEzdTdKWlhVVzN1YlFxeHMwOVhiUm5mK0I5Y1Y5bENWTXNTSU1QeXorVE8w?=
 =?utf-8?B?SmluWVd0VHA3VWZDSnR6a3p2TG5Rc2dadm9rTHp5KzMxTy9pRytSR1drdHhQ?=
 =?utf-8?B?eGwyZjU4WEozd1AxZlpzd0lHZWNRS1FvbElyTGg4VGlJeHM3OCtVb2xTU0V1?=
 =?utf-8?B?K0hsVzdRem1HZFpqcGd6RGxMak9FVWhGYlBYWGY5aXpkY2lBNFVxRUtic0Ry?=
 =?utf-8?B?MkpWdERHZ1pZMjFSV0ZhZzJUdmQxVmNBNi8vckFHKzBSTmNnelc0SnV4ZmNn?=
 =?utf-8?B?L0l6U2huTmlNdG4yNHBpdHgvMlNwWXdQZUQ1YVlHcEt6OWpNTm1HdWdNV2VK?=
 =?utf-8?B?dmxZSlZVbVNzblFYZGxRbW53RTZhMnJBU09IQ1NqQlNpRmVrT1BEbHlhTnpW?=
 =?utf-8?B?VExJR1B1UHdsYmhUc2VZaGwrQThlVGNPUk1GWTBlQTdwUERrQkJBdXpYQ0Zy?=
 =?utf-8?B?K0kvQmdnVlA5RFhEdXdLSlNsSFZlcFNuWlg1K2ZIencvVkcrRWV4Q2p5RUJK?=
 =?utf-8?B?RU1uMjBkZHJqUDJMOEljWVZMNXNBeFRuS0JBQkFwMUsxSVY4UGR5bVFXVjhF?=
 =?utf-8?B?WWFTQ25YQzNnaytvMERuaUZEOHRIQkRjRlo2VGRISmhnNVF2SnkwMG1SYWlJ?=
 =?utf-8?B?d2tXcHRqZGMzOVdBd3pwZFZReHVOdzdOOHhEMGxvblZGWWVINlZKTVdDTXlB?=
 =?utf-8?B?YWhoMzU5R1R5UURUTUp2R3c5Y2FWNGlhY2JORksrRUlhdW9EZFpQbUdPVU5a?=
 =?utf-8?B?dzRyQ3dwazBCZGJXVHlzV2FwSDlLdUhMSTZ5RTFkTE1IZkZnbTdtUUlRb3BS?=
 =?utf-8?B?d1NSVGVneTZBYWRVTkxhMXBmQVJqZjNsc0pKL0N3ZVBoTHR2dVB4Vm9qb01E?=
 =?utf-8?B?Z0tVOG5uMlRveHc4QUIrVGFYbmFmaElXWjNGV2JYbVRPVjhrU1EyTCszcTh0?=
 =?utf-8?B?T25RKzhTMlVRdXdxcldLM09sRklsUDd2Y3QrT01tWForZ1I5c2xLNzQvTXBX?=
 =?utf-8?B?OVdUeGhKeTdkVlRJc0ZtMGRPNVhHR3hDUzJWcmU5a0JsSDYwSU0zOVJ0cDZu?=
 =?utf-8?B?ZXNNUjVYdnJCNGJ0WHNmdksyRG1hc1ZzT3NxWTdGcCs2alVVQ0FVL3Y4MThJ?=
 =?utf-8?B?MFRwVDNJY0xLVGRVeGFWZUQ3b1hNNjdQTFdwemh1K0FubEs1Snk0N1Z6cUxr?=
 =?utf-8?B?dFEyVjJTcFVTQ1NDaVdIY01ZMnhlemtlV3libDNUVUR2aE5xclo0NDhtRUkx?=
 =?utf-8?B?M0w2MWVHdGtEOTh0RkszWkg5MzNoNW9TUHlyZFFlZzNYK0RUajBWSXVpdUl0?=
 =?utf-8?B?RzdDb2FKQVo4T2ZJMnhUcEdxM2s2bW8zTFJMRy83WWFvVEoyVHNzL09rMU9x?=
 =?utf-8?B?dDdGeHNWd1lJcjV0eGNXTm1WRVFTWktVYjlUK0lURHZ6VXVkQ3F2Tlk4N0tT?=
 =?utf-8?B?YjVmWk51TyswditQYjVNbTl6VGtQeFFSelJrdEdvdlNMM01qQ0Qzc1BuUWtz?=
 =?utf-8?B?Q3ZLZ0ZHNVFpa2hFOFQxNVFGNEhQdGhaK0d3dkZURmNCNWFmOTg3YVZtR2Ri?=
 =?utf-8?B?L1owcnk5NVJ4Q2dsZU9oYzh0VEozV09NRTRsUlBvT083Z3NwR1pkY1NaV0Fs?=
 =?utf-8?B?VDh5aE5WVXg1Sys3dGRxWUNYbkVEU2tGWFIvbjEwa29nMjdQUGNTcDcyV3NR?=
 =?utf-8?B?dk1sakFXQXZETG5lUXFZVzQwWDFXMjlGVHJuV2xkbFFrTUp3bmZTM3RHUWVT?=
 =?utf-8?B?RSt4SUJiR3J6S3BIVzhDc21PSVpXR0ZnT3Qya3NPSUpVUGdnVVZ0RVJmT25R?=
 =?utf-8?B?Y3Jxbnd6SXVZZnk0Y01Ob3dZWVdQVWk1RWVRbjU0eCtyQlR3eGVuYkdXcUtH?=
 =?utf-8?B?YWdVaGdIa2xYWXBocjcvM0NIVmlnTGgxYm5rM3huYkN2T21xcFpqU2w1N1k0?=
 =?utf-8?B?VVIzRjd3Qi9PMzF4MUZPU3Q0czNRd01JK1JxeCtVbHF0K2Q3Qk9qV0Q1YlMw?=
 =?utf-8?B?eHg0QXo2T3NjUmZTWFRRaHlwMUptaWZiTmgxSnRYR1ZhVWhHNU5IVXpPUVcv?=
 =?utf-8?B?ZkdMZzFTbkpXbkovNjdLWFYwZG03RlMvb0VYS3Y3UXh2UEFVVXhVQzkwaHpI?=
 =?utf-8?B?NGRhTUc5TjlCeUZPTFNMMUYzbmNXdWlkTm0va3J1SFluMWZGRDlacnh2S0Rh?=
 =?utf-8?B?WDYySjdzNHh4VG1NbGNKVUZZdGk3ZHBnQVdDTmN2N3o2WW1PVVVIUT09?=
X-Exchange-RoutingPolicyChecked: 
	lBbC6bUqYIEmaYqUN11oy1zrn//C/VEMal3jcFgPcWRACVNhQRwMM6dTF4iNQ7CDUwHbno6vFOat5ab6npMnaeaTc8xXJm+QriAw8v/nZdcG/FIF0e2u1nouEyRVG8s9NF8KCqn5uubvdBE9lGWsIyqWHnFw4NjgKo5sqwiLyQYLxDq5W/tIjPf72xm/eqJm4BttNB/dte41lgLA8ZxrEZ8gFds/HLEKh1fCrS+YcgVOuVojS2+tvgbebjhX/uX5v/ycn6juD7CwqLNN0TR1D2M50y5zvYFG9CJulzoYvYvefftBaORX3sVQjZG3Ex7NP4i/iFoEwnaaIEYKiPaPdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f0bb78-f70c-470e-be4f-08deafca954c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 02:02:55.7684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5JJ6LyZ5YPSw6NjH28H1FvzwoXp7at2rorpMMKhuoM2nB+8vDaSv7J93QoDCoZSEZd5FgmwMfDkGpXMGCA8Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9955
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: spMZpcMGPa0BkjyfSSwWKCf4HGvOffXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxNyBTYWx0ZWRfX2MSVGJh3p4FC
 robQpYYaJczYxK/izm1y0utACCK+q8xS0wM1dkYpIWTg6YT4SVB8DQPW9yNG/FPSrez5QaUo5Ys
 tBrPd2GExBhnWdtAh51tNlVYgeHmfI5X3+GbYnOOWol5LeLZ/K5zNiwprVpbfOiklKa2D9oTlge
 9x6m4IM5xx6EzFrf29/Ync5F7QWYJ5ah9qw6u/f64X40n9WZ/mCnqE8b4MateECLM1X+D8VsJun
 Hi7wulPRtuoLSoL4uJomIC7L8GOnlZlAgsC/j7A6k+Q1pbkd68kyyGAXBuI+xaFsKQhH7LI2WeJ
 5djZZpIJVYYWTU4fH7nbIcDa79bPvLq3XPJS7+Hq4Ai0wVkg95WjUycdrzMWu1NkR3avEIk5puy
 cO6GVwAuc0qkelflc2olciycEvH5xE9WkFgZXNrmbTxdNxmYB/NTD0vM1n4GDOi2LjgcsnNdj0A
 VcctciG1X2NQguAq2MQ==
X-Authority-Analysis: v=2.4 cv=OaWoyBTY c=1 sm=1 tr=0 ts=6a028a52 cx=c_pps
 a=cAYAfY5XwGGlFG+HVYY7CQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=SsMK-6ewAAAA:8 a=3HDBlxybAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=auLIn29x5BNhK6Is0AYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=49hUO6naoDravHwzbBTq:22 a=laEoCiVfU_Unz3mSdgXN:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iVVaoIq3vv6fTmeRL4LTgWQMDJh5uhwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64C1dWOq2667939
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 02:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126854


On 5/12/26 09:00, Yi Zhao wrote:
>
> On 5/11/26 22:43, Yoann Congal via lists.openembedded.org wrote:
>> On Mon May 11, 2026 at 4:21 PM CEST, Yi Zhao via=20
>> lists.openembedded.org wrote:
>>> Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
>>> time, thereby improving reproducibility.
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>> =C2=A0 ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34=20
>>> +++++++++++++++++++
>>> =C2=A0 .../recipes-filter/nftables/nftables_1.1.6.bb |=C2=A0 1 +
>>> =C2=A0 2 files changed, 35 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-se=
t-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>
>>> diff --git=20
>>> a/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-=
set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch=20
>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-=
set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch=20
>>>
>>> new file mode 100644
>>> index 0000000000..7d2f9c0dfe
>>> --- /dev/null
>>> +++=20
>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-=
set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>> @@ -0,0 +1,34 @@
>>> +From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 20=
01
>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>> +Date: Mon, 11 May 2026 15:52:29 +0800
>>> +Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
>>> +
>>> +If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of the
>>> +current time.
>>> +
>>> +Upstream-Status: Inappropriate [embedded specific]
>> I think that this patch should at least be sent upstream.
>> Reproducibility is not "embedded specific".
>> See https://reproducible-builds.org/
>
> Thanks.=C2=A0 I will send it upstream.


I have checked upstream and found that this commit[1] in development=20
branch has already resolved the reproducibility issue. However, since=20
the changes involve multiple patches, backporting them is not appropriate.

Therefore, I think we can keep the current Upstream-Status in the patch.=20
It will be dropped upon the next release of nftables.

[1]=20
https://git.netfilter.org/nftables/commit/?id=3Dca86f206c92704170a295b8dc=
7a41f6448835dde


//Yi

>
>
> //Yi
>
>
>>
>> Regards,
>>
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + configure.ac | 5 ++++-
>>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 6825474..2b147af 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
>>> + ])
>>> + # Current date should be fetched exactly once per build,
>>> + # so have 'make' call date and pass the value to every 'gcc' call
>>> +-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
>>> ++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D"$SOURCE_DATE_EPOCH"],
>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D'$(shell date +%s)'])
>>> ++AC_SUBST([MAKE_STAMP])
>>> +
>>> + AC_ARG_ENABLE([distcheck],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AS_HELP=
_STRING([--enable-distcheck], [Build for=20
>>> distcheck]),
>>> +--
>>> +2.34.1
>>> +
>>> diff --git=20
>>> a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb=20
>>> b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>> index d27e60a18d..5ab31f9b0c 100644
>>> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>> @@ -12,6 +12,7 @@ DEPENDS =3D "libmnl libnftnl bison-native \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '',=20
>>> 'gmp', d)}"
>>> =C2=A0 =C2=A0 SRC_URI =3D=20
>>> "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
>>> + file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch =
\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://run-ptest \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> =C2=A0 SRC_URI[sha256sum] =3D=20
>>> "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126851):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/126851
>> Mute This Topic: https://lists.openembedded.org/mt/119256992/7283133
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [yi.zhao@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

