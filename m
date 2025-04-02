Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3E3C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:18:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web11.1596.1743574733094514790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=YysZqexT;
 spf=pass (domain: axis.com, ip: 40.107.20.47, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpGi6ccKxOpYIxacPWpusHREIYqDJMt63Wa5seM/4MhTwBF+nko23mFxM4hnBClT99GiOgPU7A98e0fTSEd/UytDppKjkAeGIrJ3v1Gl+lSk92n04jXfFrdm0u8NipPPAANA59YqXGCvf/hfrLmo+doBcQJpm552iARynwpCXhWNdnbmyx4PTIzgx4jEkthDcoloFowM6yZwvnPK69YQae9O+52D01dIGQsXFRMcDeLvYJIC/ivRaKhE7myef7JwaFRRoouj/cSaZqfdiEIpqZ3ayLBd6SFbEh0RBMKEULf26VDzbuXBhNWBmpxUFfI1/ZqoAVeReKaMao2hdymFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRe1Pz+4r7x0jKEp7ApjGp0w2m+lDBpnUKuoS2iEKjc=;
 b=H/2Fm+imSuJ1gaIz5EYmmK0w7i9pq7s9iEPS60ZXTKzlxY7qi53qKv4XwY3n31wTVybsJ884d5jDDCUR1zsP753KzPg9LUp7HuGHLG8iSzfriLoOUYOKKjCtNx1jd9K6oH7iZOjgSY54PLg79SflEZXlxeLISNLZ7IxQgLavAEr/C4sdCpsNKCCMPkCyorx9kJFSKVFjQg/AsRRpv6Nn1vAMlHq4PzRqCMpM0cUKxLdI1yxO9w3b+CxTEeOe9WxNrYBUZ3dcFwHsDLhnDg5Ba4yfAUwP3vJz92QP/1G9MPdTU7wFmDCToWzoSTDb9divWxPy3Kqno/I1C+6boNt7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRe1Pz+4r7x0jKEp7ApjGp0w2m+lDBpnUKuoS2iEKjc=;
 b=YysZqexT5sS/R2KezDXckJ1B+v2wduRvYCAKOJPGbZJQUCXgk9b0S7zG2A4jSJFQIYFEv3LSM54GA0j8TBQqDa0SS4wlKD6BR/WST5vvSO6e7MXlHA3Myy5S7ayyth6kZYft932x3Jzi+XzFUI5p4iAEvvXosytNwM1LUucWJEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by AS2PR02MB8952.eurprd02.prod.outlook.com (2603:10a6:20b:5e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 06:18:48 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 06:18:48 +0000
Message-ID: <bd65b4f7-b93b-4c84-8796-e82168decaf6@axis.com>
Date: Wed, 2 Apr 2025 08:18:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] Revert "crucible: Use go module fetcher"
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20250310202922.4072091-1-raj.khem@gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <20250310202922.4072091-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0052.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::33) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|AS2PR02MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 596e368f-494a-4678-cd4f-08dd71ae3ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3ZXSHVOSG1NWjVJeGJ6K0Fpc2tUd3NRelNiQndGTG9qWjlWd1NKWWVBVkVC?=
 =?utf-8?B?Um41VHQrZjZ4NWR0V3l2NEdEUzhTa1VBUGZ5eGpoVnI1aVVFaVdGbTRFYzE3?=
 =?utf-8?B?endjVWsxUnR1TzU3Y3EvdGliVXJyNis4azZ3SGVuSnFiUFB0VmZwZFNZMUxk?=
 =?utf-8?B?bnVERDVzZ1gyUEVGWU4rSThubnpTeUZjVW4xaVF1cDdXeDdjQWhEMy8zUHJw?=
 =?utf-8?B?SU1ZdVBMNU50UzRyYmlsVG5tenFyTTV5SzFBOXhhUDIrcjU3Szh1TUR6MHBj?=
 =?utf-8?B?N2c4NllQVnpoaktxSmsxeTdRNjFGSXFYTnF4cEE1MndsNmF5K1F4Zk5Wck9E?=
 =?utf-8?B?K0xMNnRDSXg0a0grRlZjZjBLa1J1bEJGNmRmSTU4ckJ1eFN3bW03WS9kYk1k?=
 =?utf-8?B?RjNjT282b0M4aWRZeUJlR2tDckoxREFBUncvZUsyN2hKNDczQXpjTDFER0l5?=
 =?utf-8?B?dGsxa3BpaE8wajYvcnlEWFl4aEVlTFdybG1QL0RmRWpFTkxiK21vRmYreXdD?=
 =?utf-8?B?RUR6cVR0US9MNUxVSTdsbHZYdlRuckI2VmNhN0JIMDFnZ3NrOCtoWXZFRFFX?=
 =?utf-8?B?b1JwK0NqMXdTZkF2Ukh4ZzQ1M3pTUDFabzU5eDltUW0zK1kvWkRTd3k0MGF0?=
 =?utf-8?B?QnVFbUtENFRRS0pXZDMrcERhbW5MMThVOGJoSkV5VjVSRElSckJJdk0wS1RV?=
 =?utf-8?B?Y3NJR2dOUnBRRGU4dkdubVlydzV1a0liUnFGVmdrWDBUTXhJeHZLbUdCR1dE?=
 =?utf-8?B?SkxKa0ZGMFE1bGxRMXFNS2ZPQjNPTVVZMGh1aDd6amtXYng0R0w2djJiME9s?=
 =?utf-8?B?N3FBL1FPajZIekJqcTZWQ2dnVmM1MllEdG1ObHE3NkdaZnhzSzhDRG5xdDIy?=
 =?utf-8?B?YnliSGJNRHdxYWFoSDBWZ1VraXNoMW53aHAvRi8xRGt4OHU2ZVg2WXVhelJE?=
 =?utf-8?B?LzhYNG1pakkyNmRma21YcnVwVlJ1MVNiVzNGYmgxQUFoN1JkbkRWKzk4Wlg0?=
 =?utf-8?B?Wk9kcTdaS3hKK0lMSUs2bWt2SkhiQi9ZMkxubW9nTmlWYXUrYXpNLzA3RUxr?=
 =?utf-8?B?cXVuelBxbHNNWWdheHRoRlk2RlZZbEdaNDdSK2NqVVpyODVZR2loTjgvclUy?=
 =?utf-8?B?TE84UVZyTlZ0azlNSEprazcxeVAyNlpPdHQ5Q0p0aDVsbG9wQStrZDZ4bVZu?=
 =?utf-8?B?SXlPYnBTRjRHcklEUHRlekZiTWdRSmN3bVRKVVBZN3RkNHRLYjFHclkyakpL?=
 =?utf-8?B?b0QzZ0VrbjZ4NUUvTnhTSlR4WTBZVW9pZE9TS2E2WVc1QTcwaGIzZkppcHFh?=
 =?utf-8?B?cHhCVUpNOXRKeWRiUi9QZnlaT3V0WGhHcW5JVkVZcjk4ekRzRlFLZlpkOWVF?=
 =?utf-8?B?M1JMK2FmMlpSZjR4d0tNTEU4UHhPT2REWHJvKzdFbzRWd3lRSE5qREZJRVRw?=
 =?utf-8?B?STRwNi9nSTI3WTBqRFFweXlHWkVodnRXT1BzQ0lvdXdvYk05TzhOU051ekln?=
 =?utf-8?B?R1dEUURBNkFCeDFDcUlaZXRrMC9pbUZEaGVsRFBUY2R4WHc1bVl3TDVyN2kw?=
 =?utf-8?B?bGk5WG52RmZOVFVNeVhWbVZRMzRzM0hxZDF6c2htYS8zTGIxOXN0cFBaZ3Rm?=
 =?utf-8?B?V0V4TmpWNk05VlFrWEt4Q0NLRSsrdTJka1FDeStqVjlMN05HY09ESDhJQ0xG?=
 =?utf-8?B?OGNkeE1vSWZKNG9vNFRYUGJ1TW02UFBFTm9vNkU5ajNZQlNaUkdIU21JeEFC?=
 =?utf-8?B?Zk1rcXJoUjRvY1ZBNGRwcGFqMmxsMERmc29QTXhxRFc3cjBpRmVNYnFJancz?=
 =?utf-8?B?U2RRQm1xTVY1UEhUaVZQZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TndHVlJNOGlPVEVsdlFHOElIbktGM21JNFMvNjlsQVFFYzJBaFJVZkgydW1L?=
 =?utf-8?B?UU1lclhZVS9UWWh6VWtNT2ZJeFpwc3hDSnZ5c2FxaEkxTy8zbVZGempjMnE4?=
 =?utf-8?B?VlNqdUNYNEh3UVdxUmd1QzJGcjdQQ1BkN1dxRjFoaFBIR2NDajNkVEZkMVJ3?=
 =?utf-8?B?R0Q5N1d2Q3lPb3dzdTJBRm0zZ1FFYktMMzlGWGt3UkN6bGM5S003UlRCVnNX?=
 =?utf-8?B?U3hmYmJ3WHYyYUptWTdJMk9HZW45cnl2Y25jOTV6V2V5M2ozbEVHeGdrdUFX?=
 =?utf-8?B?M3IyS0RlRS9HRGd2M0E5YTlkb09hb3QrNHRuMnVUSTk2YUhudjh1c1FCMHJv?=
 =?utf-8?B?Q3l0Y2h5dmtjcDRGcjFTZnZkWUlmaVJ4cmxFVGtyR2hYUG91djgwOEFDMXJB?=
 =?utf-8?B?LzQyVDl4VG01REtQWE5GMkkyOStINEtYRUdyNGJYZm1YSTY3S2pNb1dxNUtG?=
 =?utf-8?B?dTZncHhkR3FYRDMwdDUyY2N1cXM4cTJjdngrWUFrMjVNdkhnc3BUQzRmRHNB?=
 =?utf-8?B?K200cWlCZUJjUnl3eU55cWZuOXF3NFZyWDhYWlFLNE5LdmNvUFhsS0tlMXBU?=
 =?utf-8?B?M1hRazZraE9Gc0Q3QXpPTzVYSjRPWHo4cmxkZHI5Y2JkeFhzQlg4alB0RStK?=
 =?utf-8?B?Q2Myc0R2M09qU2FrSkxxbHlDU09qQ0l0ckcxYVNTVEdJWE10YzVyRDIvYWZL?=
 =?utf-8?B?U0FFWGdlRUx3MURQaTVZQ2RsaTdVeXBHcjB4ZG9SVzZpUkZMYUd2VjNBNWhX?=
 =?utf-8?B?Sk1MZUZnR3l6QURKZGY3UFdVVFhXb3NkNHlxaVBoQkNMTVNVeEhoRmQ0OVFo?=
 =?utf-8?B?UCtSeVNlRTlFRVRQaE5NMUxJWmpOVSszRkhma0lUeWFUUThKNmpyRFJOTU5R?=
 =?utf-8?B?TXVZMDcwUUw5WjdJQzVZcmpDaGxSRmxJN3JORy9yRUdSZzE5OU9nNEJBSDds?=
 =?utf-8?B?Y0JJek5qaFdEb1E5TzJubmJWOUpmVHJMYjVUWU81QWE2M2w0QndwUS9HRVBX?=
 =?utf-8?B?N1l2QldVZm93M0RTNFFEb1lMREFRS00wS0N6MFZwaGxNUUZsUzk3ODRvNnZW?=
 =?utf-8?B?YmduMkJ1TmtULzcxMTFRUXhNR2tBR2hnUEpoTHZKSldTVGlaU25EMVFSVTZq?=
 =?utf-8?B?N082NkJ2MnIrVmJMQUdjMExRMVE5bk9taFZmYUNySWpmamk5SjhseGJXbGMz?=
 =?utf-8?B?M29lclhTK2w5R25ONFZXaFgwa3Yyd3dVODBMdEQ2SEVpSlZuSkFYTE9qN3pk?=
 =?utf-8?B?T2dTSXBsMHEvZE1hWGtwbXMxa3NxZzZDRS9hWEhEZS9xRUdnSGh2WFVML1Nj?=
 =?utf-8?B?YTJMZXcrY3FZZ09uU2RPRkhabTZXa29FeWpncml0MnNjL0NaVExHOGZuUVNY?=
 =?utf-8?B?QndxS051U0J5YTFiQ2oxNGpCalZRRGdmOE1HRTl6RitJVXdqUjcrZFhDc3pI?=
 =?utf-8?B?NDJsTmlzay8xRmlRTXNXeVZIdzZ1ejBxenhjS0o5VWRWc0VLc041bEt0SnpT?=
 =?utf-8?B?WmwwWm41NmpFdFBlUlo4bitlVC9aUnNQcEx4cmx0VWlueUIvS2dsaTZMZVB4?=
 =?utf-8?B?QXRvcXZUTEtVQzZESTVCSzNETlZob1YrZlU4b0tOQjAybTFEc0RuLzVMdVpZ?=
 =?utf-8?B?VWFaR1hWK2lkYWFWTUIveXNkSjQrZDVIbjBLY1BkWXBPbURYTnczc2UxcFhY?=
 =?utf-8?B?TVJHYzhHQXVZT1lmTlpPN25ibGlwelcwSVRtdHB4aVl6ZDBtdHhZNUtObFVP?=
 =?utf-8?B?Vlo4VXUxWlR0Zm5KQlo3RTE1WlBRRjllbEdIY0I1Y1dpSThLMEtkTll3OFVw?=
 =?utf-8?B?a0kxSE1peTBON0VIMm9wdTlqaE43WmxCVUVydWl0Yng2cER0dEVRamRJVzRv?=
 =?utf-8?B?N2JPdVVTZ3p4M0c4c1JVN2xyT2N4Y1BPdlhmS3R6eXZCcWZTOE81SDdVZGNl?=
 =?utf-8?B?YmwybURQSmErVnkrbHFjUk5Ja1Y1M1BsbEFnMWpOZXEzWlUzZW5veFdyRGg5?=
 =?utf-8?B?QXY3V2NXNTBzYzFKYUFPYkxPRDdGK3hRbXNYVEN3NFZKams1ZFpqWnU2enBj?=
 =?utf-8?B?Sm02MkpnbEVUdlhsWDVyV3JTL3grVlBpQTh5RXIyMENVajZvdlcxbFlVYTVQ?=
 =?utf-8?Q?5dDBAo4lxu5lcf2bby29JjeyJ?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e368f-494a-4678-cd4f-08dd71ae3ad3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:18:48.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1rLsblhAJwmSlLAxTNiad7I2rRFl8CYqyGIGUw2hj8oJKqBr/bzdaVCHXDLMk/Y8IOrze3YKqF996lJaO2GHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8952
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 06:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116503


On 10/03/2025 21:29, Khem Raj wrote:
> This reverts commit 8d635b0510c86a80261a461f833142d2bdfad0f0.
>
> gomod fetcher fails for this see [1]
>
> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/211/steps/16/logs/stdio
With the fix for the gomod fetcher mirroring problem now on master, 
https://git.openembedded.org/bitbake/commit/?id=7762cea087597019460d66b04268757bd46befdf, 
I will send the patch again.


