Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F40D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 11:17:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5620.1765279069723245149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 03:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q0RWjVfp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4438979ad4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93po4r2987874
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 03:17:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=p5U0wK9xaR43KZPzBExRxbzgxX3VIRFb9v/5nJ/qerE=; b=
	Q0RWjVfpRpEbmQa7Lpu3vvUv98BCYyLvhZIkpP5kU6e7/0B1weSHKj+dkkR44kpu
	JvuVfk7CpVpC/JMqTqKtACDNulH0V/DwwVLIqyOGG7LRNcCK41ANDbaE/zrEEalg
	R1pbjsQIlTlDfIGP4H/BONzW7fWUbi59HrO0QWKkKNpj6jA54F9toaEq7Td9KeCx
	Kdi1uEs3Su6zr2e3v/FAP5NhZRHLqDJxp84EKi0Q2tIa6aIPaMyout/mcGArJ9LO
	T2dDVhUa6f2gBnSeLP5suxNjTcHVPAD8s4/hn4gYTRpyEyKGuYtyfk4chGLX59Y0
	ynU+CGB7+bzN/J50ACZVaA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avmvhap53-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 03:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDKrsFiEoJbh59rD8Y3OCuUO/sEif6f+utpm5QSbuqrnhbJMtcZVicGIYhlSWW2OYGOAxVBjwd7uVP4Ws7/XURu/6ohWYtmKHLVb9NhJhHVl2jSkl7ls1eHZmhQIOfxcuR2P+0q+kFMv3i39Sg6E/iQ1Myo6ONN4dnOTDZUL4Xf7OMtN9OeopVIWKyK6V42wO4yVHXwdScrVAM59qLcYErPA4MKtZ0eGsMSTF4hfrn/N97lxwK9EwmX0CsXWKmrpM6+ukHmdWR/8Klnk4rKhlX3kRAdOzL1S0aqkwitCgp+GLF0GYYUKagAZ0c2yLi3L0GMzqsqJX0ZvqH+OQE2dBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5U0wK9xaR43KZPzBExRxbzgxX3VIRFb9v/5nJ/qerE=;
 b=C7APWj6ss08s5rGmUKElx6AZdekV900taLfStXuDW4KnuNfG8ymeXopYjq+SA3E+K4noQUFiuECUDF5dVnQuSHUKZi3ZJB31MSCBcj4Z8C0Ch29JZ18bSFd6yuMbGsf4FYNerbxHFgClESlAUOqKVO1oSie2k07I7SgZ47WsD4j+/fD5g8MNM/fRW5EXUXVuvj4RL42L+Z7AXL6S0mggn5H/KwNPoGFNGZ38sICo19p91O2tXdLBZ8r6/rf4cWkxtN5jy7c5vMapGUuqx5AfDXXkvzJIhpgsJgHvifIBMiiOFyHfuROkkliSKoUVv61pjfULxYIbDeamBIxHV6ozDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 11:17:45 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 11:17:45 +0000
Message-ID: <5861fa66-9d6e-487d-aed4-20649adddb90@windriver.com>
Date: Tue, 9 Dec 2025 16:47:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] ripgrep: Add ripgrep recipe
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
 <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
 <CAMSfU+7cCap3EYCCSudr1uW7tDciisXJcDtXPEcXM5qAPbinmw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMSfU+7cCap3EYCCSudr1uW7tDciisXJcDtXPEcXM5qAPbinmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da0db11-b12f-493a-3c5f-08de37149309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHNWa1pNOWFyaVJ1c2JGcjVxSUFWbU02R3pBdWpoZy9YbXpGMVU2U2RjSUEv?=
 =?utf-8?B?a29ua2djNnk5Y3duUlpaUTJ4OTY1S3JYVzdzNzRzMlIrN1l6QVlJU3p2c2gy?=
 =?utf-8?B?aGtaVEJjclAwalFjRUd5bHBVbzBPc3hBcEpaaWdDQUl3dVRrR29DbDNKMWNS?=
 =?utf-8?B?Wk82SUJHNzhoSmJEbjI4WTZKUjBRM1FZbHJoQ3hUSWpXU2tyNHY3Um5rTk5T?=
 =?utf-8?B?TzVDdWxlVEZ5TE5YaVJpZmlvYVUvKzVFZnJkMld3TUlReWxUNHY0VkE0VHRE?=
 =?utf-8?B?WHpDTlFMcCtWVm9SdTE3R0M1NC9jVUVkWis3dEpQOUQvV1VPQ2JBc0FqQ3pD?=
 =?utf-8?B?TTlyOE16alpoWklvTXVvbW9YMXBIQWFjYzAzTW42ZVJ6T0ZLbllvcWQ4S0tD?=
 =?utf-8?B?Q2xJMUJMTjZYOWZrZnBLRDNzQ3BBTUxaa3pYbDVkeDdVVjJrUlJCVHdvTmNV?=
 =?utf-8?B?U2ZONXdwNzRuViswWVM0bEpEb1pLUUdONklKSzhlZXRHZjg1aHQ4RUdtWkk4?=
 =?utf-8?B?REdOL3QvYXJyL1VTY1IyaVJnM2V5REJoMkpkUHVJcHI5Rm5mZ3UweTJlcllp?=
 =?utf-8?B?WjQ2VytKVThnWnVZM2xFV0dCTFhtSWl2RDR1V2EwL2E5VHFtNUdxR3I0dzVZ?=
 =?utf-8?B?SStWTlZqcTdsSkRodWNZbkNhQ0daZjNNQUxrR24xdHhwL0xoMTJGTG5HeTVW?=
 =?utf-8?B?S0lWbFZCby8xaEQ5VE94UVJGTWMxZVNHZFpGOGxUc1Znall4SjQ1WEtMSkI4?=
 =?utf-8?B?REo3dUpvRjViQnJQRHVZUHR5aUNMTkFvbStuaU9hMkpyVjlYV2dSc1ZDQW5n?=
 =?utf-8?B?SU51Q1Rpd1UzMDkrYmlBR2g4SjdsRi9nSGNwdnVPdDgyWXRkOU9QWjdsRlNB?=
 =?utf-8?B?R3ZZajM2dlQ1b21zdFErTWZtT1ozc3llRURBOGY3a2xHay83cHBYTnUxeXNS?=
 =?utf-8?B?TDRGMnFaTkFBOU12aXJDZnF6UXpCTVU1dm1GSVd0YUxLb3FpdjdqeGdLRklh?=
 =?utf-8?B?eVFaazF2YVpud3BBdkNWZ2h6aGpNck9YRSs0bDBjdnNWcGRGcDYzZFJVMGtw?=
 =?utf-8?B?bzlkOHhBMmoyRFpBV1FCUjR2RGJXRHNmR3JJQ041THJnSTJxZFpzLzlXbTRS?=
 =?utf-8?B?Q0hjRVV1MkJBZ2NSOERiWFJkYmgxVE41Nk5BOXN5c3h4cjJ1cDNjbjdxSmJ4?=
 =?utf-8?B?Zlk4NVNVclVCMWVrNlJxbGU2eFJ5QmpLc0c5WWYxY3pJZE9HMlBTOFIrb2JD?=
 =?utf-8?B?N0ZrbTREVjA1OFpqWkYwQkQzWmgwcytyeWtSZE1WajhTOHFxUm1kR2RGTVlE?=
 =?utf-8?B?T0xGUjBxMjJ1VzdOaElKOWh4ZmIrZFRrd09BclMvSk9VK2h3ZXdkeU15eElu?=
 =?utf-8?B?WXhIY08zK0dPVDROVnJxS3hDK1prSUdoSU5yMFhsUXNWazJnTTA4TmhHNUFS?=
 =?utf-8?B?R25XSER5NC9YR0pjdHhhRVRrc1dTWXkzVXVlMkM1Y1BYZ1dRRyt5REFKMGlw?=
 =?utf-8?B?cHdhcTJPa0tzYWdBa0h4eUIvaW01RlJ3WlIyek5Zak5vazNqVDFSbC85d09l?=
 =?utf-8?B?bHF0WHFaemNEeEFhbzhydzNJV1A3MlR2QnUvTm9GUEpCREk2dys3N2RZNU0x?=
 =?utf-8?B?N21FYnpXRVNHd1RoRjJSTHVvQ3JhOTMramRMbDNHUDJKR1B6clpDSlIyNDNR?=
 =?utf-8?B?ZFZRZmt4NkNyZW85OUJRa2RQUk5taFgrZEVraFNySzF6ZmlqeGUzZFdDb0NR?=
 =?utf-8?B?TWhIaW5wSUtlMXlnNUMvSEdwaHlqOWw1NlRMbXVnZkpkZklpVUNtMXlTdU9m?=
 =?utf-8?B?MjYxbkt4clNuaEo2SFZUMHcwN3lqaEM3NUs2MVVMdU1yWi9ZYmRSbzBYU0Vw?=
 =?utf-8?B?cUpieldhOGE0TVlrQzZtYU83VEdzZnQrbHpYa3B5M2ExaXhLL3VVaWkxNDdH?=
 =?utf-8?B?UVdkbHpIVjM1NTJzRzZuRnJBQW9idGRHdW42YWtwUU5LMG00NC9nQmhlYUxH?=
 =?utf-8?B?QU1aUTIvR0d3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R213amh0dXJWN0hqR25vUDF3NWZRT09XSldoMFdvRDNOVVlXRzR1NzhENnRS?=
 =?utf-8?B?cTRqTWNZVTc2NWdoWjlXMEtoYWwraHJCMWZnY2xpUmpKNENZbU9nODhSZllM?=
 =?utf-8?B?cmtFTFl3K2lqcGt6dlB6dDBrZkFoRWhEZTNnQ2dnU2FHOWdiamd1SGd3cndp?=
 =?utf-8?B?a00xM2RVd1dZcnRVaDVKYmJ1eHhMOUFZOXFQQ1hZR3BvWXc4bFI2Ymt1ZDhR?=
 =?utf-8?B?cWc5T0NGeGxUMC8rYkc4aElpRFdwVk1iWVZPOGlabXRNM1JablJCMC92R1Rs?=
 =?utf-8?B?ZFB1NDJ0cTFKV0JFTlc2ZkxuRHRxVllQNjNkZzE0MEJYS2I1blBMSE5DeGw3?=
 =?utf-8?B?NnNYTTYxdHlwMlBQRlFmQzFsNkhYVXlKbUp5c3ZLM1NSUzZUb3Y1MWdHTzJM?=
 =?utf-8?B?M3JBMUFjY21DdHdUM3dyRkNHaC9vVVl4TVJkRzlhRGVIRkJqeGNGeTBndG1V?=
 =?utf-8?B?MWROQWxBRlRHZGxEL0cwNjBKNzV1QjkxTU5XUEwyRG9HN0xTK0QrVlUxdXor?=
 =?utf-8?B?ZDIydnVucGsrUTFKRjVCOUtBQ1RGRnhVbWlmdkVjZ3hneVIvbWNNdTBpS0t1?=
 =?utf-8?B?MlAxQ21GdHU3Y2V3VzNpeXB1QXRzV3FUUHE0bkE3bVB1U2dyMk5HYnU1M0VY?=
 =?utf-8?B?K3NpakNXZVV6bkNvVnNLaTN2UzVjZ0Y0dThWU2tZSkpDT1VzTTJ5UkMrOXlh?=
 =?utf-8?B?NUt3THNPdlVHU2hZcDExSDV0VjcxaDcvQ0U0NmN4YUtVQmdack53bWZyM2Ev?=
 =?utf-8?B?UEc1UUFNbm05SzdEa2RMazhpaVdiTXJoeWJQY1hzSEx3Q0tJMC9LUHBJOUNa?=
 =?utf-8?B?KzJkTEpUNGZnSytxRU0yemZDMjJzWlVqNTNvWkZGSjhlQTJPczJrRFV5ZnY2?=
 =?utf-8?B?R2JURjFCMldpTnFSZVlTcFMvNVV6SUNIQ0pxWWlLRXlXTUdwK05BNHlSRkdO?=
 =?utf-8?B?aVdzblNlVVhheDZEWFM0TCtTUE5HUlhSVUFNc0JoQ2FEV0ZNTEgyQXFpUmw1?=
 =?utf-8?B?YXRpTk9hOEFUQTBQM1VoYkJVUkdITnBxcVp4bUJkZmxOTE9NYTZlT2k1UFlH?=
 =?utf-8?B?Z0pVRkdTbmxVK3ZQQXlZSjdFMDU1bWhGeTN3TzBWMndJZkFXSGh4TklMdWxO?=
 =?utf-8?B?Y0pnbmxKQ1VISGZQY0sxMzdkWTRkcHFCYzN6QVVXMUtYN2pPWDIySmM0U0ZL?=
 =?utf-8?B?K1kyY3ZxdW9JRlQzb2Q2T1BYdU9VMHliLzdoTm9Qd2ZlNzNwYUh5eG9ZUWVT?=
 =?utf-8?B?eE1qZkx3MXVxTWU1dEZuSGJCWXIrK0duWDA5OENmdkV1S1NVbGk5YjV4QUZv?=
 =?utf-8?B?SVE3QUQrV2RReG03L085RkZOcmozOXVoRzNQTXFqY1BRUS9QZC9qNGV5SFlt?=
 =?utf-8?B?VHJ0ZysrZWY4UUwzS0Q1QXdRWldQeDkvZ3ZPK0liOFlmN0hucVoyUlRjODNz?=
 =?utf-8?B?TFVYT0FTOFBwZnZRQTYwRTJ6L0JzUXpVWGlSdHhhb1h2SGliRyt6TGNweVpO?=
 =?utf-8?B?aG11SFZkb29ZOFJJWFc2a3o2TDZaZWRQMitMSWo1RDQ3UktkZlRNM05STEFV?=
 =?utf-8?B?OUR5dFY5OHVQNFMxek0yalpoZTZiVXlLcUF0bGdHSHd4aTFnNzlGa1BrRnVE?=
 =?utf-8?B?NUFLQXNsV2VkT2s0RG5XM2NiTG0rT0ZaUXJWTjJNY2luQkJ2ZC9TdG5MaGx2?=
 =?utf-8?B?cUlPTmdnditDTXZFUXpwUHhMV0tFOEVvZWVVbWROTGJBdGJrU1lyb3YxOTE4?=
 =?utf-8?B?VUQzZW83eTU5clZWQkRLRTVKY3BIRDA1dFlBTSt5RUsyRUZIRm9xRCs1d05C?=
 =?utf-8?B?YXVFeDVwTmZQaVEyWXE1Z3ZNZXNnR0RrblJTRnRKbWUyTG9MNkRQNnM4VWVs?=
 =?utf-8?B?MHRZMkFqMmV6VkZmRisxOWRwY21BdllPeWhPL3F5Y00vd2RHSjdsYTEyWkMv?=
 =?utf-8?B?WmFPc0pSVEQ0ZFJJR2FTNjlyOFByVEJJTVFMM0VhYUhHeXgwTkk5U29vZ0FW?=
 =?utf-8?B?cDQyZXhZV2xwelU1WDRQYWFGQnlic1ZDSXVBMzNqaTVCaVZjcGROc09WcXEr?=
 =?utf-8?B?c01tK2ppdkp1N2xNaHUxM0ZrVVBmdm40aXBtOWI2WVFkQ2o2cXhqMnk1ak1U?=
 =?utf-8?B?cHQ0S21CS2FSWXFtS1R1UHhHSlQyVlFmeGhnRmpaVFBIMEFyRkViMzlReFAr?=
 =?utf-8?Q?hcZgQz2jZla8vKZzsFoaaoE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da0db11-b12f-493a-3c5f-08de37149309
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 11:17:45.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO8PD2K3VjgbeNqxVeWKn10DCIUCNunSt8iWhWNCXvFAsW5CJE7jKAvcHJ5ws8B3Fyocn1a72wGkvbmxM7PrcvDH6tdgjnTm1qXpSqlZNNKLxOCtT5rUpcFxrmrAB6T9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: JrokbmJ-qbIIEo6qkAklGEb1dtO4grh_
X-Authority-Analysis: v=2.4 cv=be9mkePB c=1 sm=1 tr=0 ts=6938055d cx=c_pps
 a=DSCxmJijwPVh9NBC5YRuGw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OcE5tU-iAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7BPmZysFQaJl62M1y68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=qwkNQZnGtIHGNKTLT1RO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XWfMDss-hII5abmS_LAjOcCx7AT4-vRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3OSBTYWx0ZWRfX4L4oOz0V4yy7
 XyEzSFBxhVvCgbsbf1uqL5vIotpNCXpNGC5cvPZ5ngoKdlzgmtbiWyLt5H8AtbIZ2TnlI5xbWxo
 IjCIcIZUNUSb9XTmQtr7I2Km/K1VS52t5u8GXdlGhhqZFFk9xWtpSP/cGXNg2Bz7u8CvF8Yq70j
 7uFQV5GbtYXVroJUhgFjwBEo59HgM+plKtdPrFgIBBHlATkBAuRJHrqM4GtBvV/jL0zhwAHG/+z
 BOcwp5UySILqiF70YPuW2UAbym4C5eLYD8zW7WwliXoPFSfQkiyhmMIXFQDxP5fQN7+Q0otbbYV
 QV0ZE9CPqDT5U+v4ErNjOlvJeYFYTB2Ax41oqKScSYL0CKqKSB3c1jSh2bTP8lEWeF0Q2Etopv2
 uIoA836ER9CAWreQRLnM266d3FuTAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B93po4r2987874
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122444


On 09-12-2025 15:00, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Le mar. 9 d=C3=A9c. 2025 =C3=A0 09:57, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> a =C3=A9c=
rit :
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> ripgrep is a fast, line-oriented search tool written in Rust.
>> Add recipe for the latest release (15.1.0)
>>
>> - Recursively searches the current directory using a regex pattern
>> - Respects .gitignore rules
>> - Provides first-class support on Linux
>> - 'rg' is significantly faster than grep
>>
>> More information: https://crates.io/crates/ripgrep
>>
>> Upstream Benchmarks:
>> Task                                 ripgrep               GNU grep   =
            Speedup vs grep
>> Basic search (Unicode)          536 lines, 0.082s       536 lines, 0.2=
73s       ripgrep ~3.3=C3=97 faster
>> Ignoring gitignore files        447 lines, 0.063s       447 lines, 0.6=
74s       ripgrep ~10=C3=97 faster
>> Large single file (~13GB)       7882 lines, 1.042s      7882 lines, 6.=
577s      ripgrep ~6.3=C3=97 faster
>>
>> Bechmarks inside qemu (ripgrep built from this recipe):
>> Tool & Command                      Real Time    User Time    Sys Time=
    Speedup vs grep
>> ripgrep (rg "printf" /usr)           0.496 s      0.511 s     0.604 s =
      3.1=C3=97 faster
>> grep (grep -R "printf" /usr)         1.533 s      0.633 s     0.897 s =
           =E2=80=94
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> Hello,
>
> Thanks for the recipes!
>
> We also started to work on those recipes but we wanted to have ptests.

Thank you for the update!

I understand the reproducibility issues with cargo-based ptests.

For now, I think these recipes can be considered as they are. Once a=20
generic solution
for cargo-based ptest support to is available to address reproducibility=20
issues, we can
inherit it in these recipes and enable ptests accordingly.

If you prefer to implement tests for these recipes now, I can look into=20
adding test support.

> We got stuck on ptests reproducibility, while we could patch each
> recipe, I would rather have a generic solution.
> I've created a BZ ticket to track the work on this:
> 16094 =E2=80=93 Generically improve cargo-based tests package reproduci=
bility
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16094
> I took the ticket but I won't have time to work on it soon (feel free
> to take it if you want!).
At the moment we don't have time to work on this bug due to other priorit=
y
work.

Thanks,
Deepesh
>
>> ---
>>   .../ripgrep/ripgrep-crates.inc                | 116 ++++++++++++++++=
++
>>   .../ripgrep/ripgrep_15.1.0.bb                 |  22 ++++
>>   2 files changed, 138 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep-crates.i=
nc
>>   create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.b=
b
>>
>> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc b/met=
a-oe/recipes-extended/ripgrep/ripgrep-crates.inc
>> new file mode 100644
>> index 0000000000..aa7e3f9dd2
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
>> @@ -0,0 +1,116 @@
>> +# Autogenerated with 'bitbake -c update_crates ripgrep'
>> +
>> +# from Cargo.lock
>> +SRC_URI +=3D " \
>> +    crate://crates.io/aho-corasick/1.1.3 \
>> +    crate://crates.io/anyhow/1.0.100 \
>> +    crate://crates.io/bstr/1.12.0 \
>> +    crate://crates.io/cc/1.2.41 \
>> +    crate://crates.io/cfg-if/1.0.4 \
>> +    crate://crates.io/crossbeam-deque/0.8.6 \
>> +    crate://crates.io/crossbeam-epoch/0.9.18 \
>> +    crate://crates.io/crossbeam-utils/0.8.21 \
>> +    crate://crates.io/encoding_rs/0.8.35 \
>> +    crate://crates.io/encoding_rs_io/0.1.7 \
>> +    crate://crates.io/find-msvc-tools/0.1.4 \
>> +    crate://crates.io/getrandom/0.3.4 \
>> +    crate://crates.io/globset/0.4.18 \
>> +    crate://crates.io/grep/0.4.1 \
>> +    crate://crates.io/grep-cli/0.1.12 \
>> +    crate://crates.io/grep-matcher/0.1.8 \
>> +    crate://crates.io/grep-pcre2/0.1.9 \
>> +    crate://crates.io/grep-printer/0.3.1 \
>> +    crate://crates.io/grep-regex/0.1.14 \
>> +    crate://crates.io/grep-searcher/0.1.16 \
>> +    crate://crates.io/ignore/0.4.24 \
>> +    crate://crates.io/itoa/1.0.15 \
>> +    crate://crates.io/jobserver/0.1.34 \
>> +    crate://crates.io/lexopt/0.3.1 \
>> +    crate://crates.io/libc/0.2.177 \
>> +    crate://crates.io/log/0.4.28 \
>> +    crate://crates.io/memchr/2.7.6 \
>> +    crate://crates.io/memmap2/0.9.9 \
>> +    crate://crates.io/pcre2/0.2.11 \
>> +    crate://crates.io/pcre2-sys/0.2.10 \
>> +    crate://crates.io/pkg-config/0.3.32 \
>> +    crate://crates.io/proc-macro2/1.0.101 \
>> +    crate://crates.io/quote/1.0.41 \
>> +    crate://crates.io/r-efi/5.3.0 \
>> +    crate://crates.io/regex-automata/0.4.13 \
>> +    crate://crates.io/regex-syntax/0.8.8 \
>> +    crate://crates.io/ryu/1.0.20 \
>> +    crate://crates.io/same-file/1.0.6 \
>> +    crate://crates.io/serde/1.0.228 \
>> +    crate://crates.io/serde_core/1.0.228 \
>> +    crate://crates.io/serde_derive/1.0.228 \
>> +    crate://crates.io/serde_json/1.0.145 \
>> +    crate://crates.io/shlex/1.3.0 \
>> +    crate://crates.io/syn/2.0.107 \
>> +    crate://crates.io/termcolor/1.4.1 \
>> +    crate://crates.io/textwrap/0.16.2 \
>> +    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9=
ba9847cc330696e02839f328f7 \
>> +    crate://crates.io/tikv-jemallocator/0.6.1 \
>> +    crate://crates.io/unicode-ident/1.0.20 \
>> +    crate://crates.io/walkdir/2.5.0 \
>> +    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
>> +    crate://crates.io/winapi-util/0.1.11 \
>> +    crate://crates.io/windows-link/0.2.1 \
>> +    crate://crates.io/windows-sys/0.61.2 \
>> +    crate://crates.io/wit-bindgen/0.46.0 \
>> +"
>> +
>> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19=
238d2df97c507009a52b3c10addcd7f6bcb916"
>> +SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b=
424b2c83db5eb3a0fead4a6c0809af6e61"
>> +SRC_URI[bstr-1.12.0.sha256sum] =3D "234113d19d0d7d613b40e86fb654acf95=
8910802bcceab913a4f9e7cda03b1a4"
>> +SRC_URI[cc-1.2.41.sha256sum] =3D "ac9fe6cdbb24b6ade63616c0a0688e45bb5=
6732262c158df3c0c4bea4ca47cb7"
>> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111=
825727b38d33286ef986142615121801"
>> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6a=
e361660ee5853c9af73f70c3c2ef6858b950e2e51"
>> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964=
f020e1402edd5753411d7737aa39c3714ad1b5420e"
>> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c33=
27b3aad3a4c4cd4de0629063962b03235697506a28"
>> +SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780=
965a8c7e8e285a5ecb86713e63a79c5b2766f3"
>> +SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D "1cc3c5651fb62ab8aa310399=
8dade57efdd028544bd300516baa31840c252a83"
>> +SRC_URI[find-msvc-tools-0.1.4.sha256sum] =3D "52051878f80a721bb68ebfb=
c930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
>> +SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120=
ecec138e4d395b459e5ca34f9cce2dd77fd"
>> +SRC_URI[globset-0.4.18.sha256sum] =3D "52dfc19153a48bde0cbd630453615c=
8151bce3a5adfac7a0aebfbf0a1e1f57e3"
>> +SRC_URI[grep-0.4.1.sha256sum] =3D "309217bc53e2c691c314389c7fa91f9cd1=
a998cda19e25544ea47d94103880c3"
>> +SRC_URI[grep-cli-0.1.12.sha256sum] =3D "cf32d263c5d5cc2a23ce587097f5d=
dafdb188492ba2e6fb638eaccdc22453631"
>> +SRC_URI[grep-matcher-0.1.8.sha256sum] =3D "36d7b71093325ab22d780b40d7=
df3066ae4aebb518ba719d38c697a8228a8023"
>> +SRC_URI[grep-pcre2-0.1.9.sha256sum] =3D "667bb90a3ee51f8f6e2aadf1d0f1=
06ea42efca4cf28f0e71f0fdec1137d7f9b0"
>> +SRC_URI[grep-printer-0.3.1.sha256sum] =3D "fd76035e87871f51c1ee5b793e=
32122b3ccf9c692662d9622ef1686ff5321acb"
>> +SRC_URI[grep-regex-0.1.14.sha256sum] =3D "0ce0c256c3ad82bcc07b812c15a=
45ec1d398122e8e15124f96695234db7112ef"
>> +SRC_URI[grep-searcher-0.1.16.sha256sum] =3D "ac63295322dc48ebb20a2534=
8147905d816318888e64f531bfc2a2bc0577dc34"
>> +SRC_URI[ignore-0.4.24.sha256sum] =3D "81776e6f9464432afcc28d03e52eb10=
1c93b6f0566f52aef2427663e700f0403"
>> +SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7cce=
fe71f97f96e50151fb991f267928e2c"
>> +SRC_URI[jobserver-0.1.34.sha256sum] =3D "9afb3de4395d6b3e67a780b6de64=
b51c978ecf11cb9a462c66be7d4ca9039d33"
>> +SRC_URI[lexopt-0.3.1.sha256sum] =3D "9fa0e2a1fcbe2f6be6c42e3422599762=
06b383122fc152e872795338b5a3f3a7"
>> +SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a=
53b802102b528163885171cf92b15976"
>> +SRC_URI[log-0.4.28.sha256sum] =3D "34080505efa8e45a4b816c349525ebe327=
ceaa8559756f0356cba97ef3bf7432"
>> +SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc862=
38e165017a493d1d5c8eac6bdc4cc273"
>> +SRC_URI[memmap2-0.9.9.sha256sum] =3D "744133e4a0e0a658e1374cf3bf8e415=
c4052a15a111acd372764c55b4177d490"
>> +SRC_URI[pcre2-0.2.11.sha256sum] =3D "9e970b0fcce0c7ee6ef662744ff711f2=
1ccd6f11b7cf03cd187a80e89797fc67"
>> +SRC_URI[pcre2-sys-0.2.10.sha256sum] =3D "18b9073c1a2549bd409bf4a32c94=
d903bb1a09bf845bc306ae148897fa0760a4"
>> +SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5=
c704c14cd949e5e9a1ec5929a24fded1b904c"
>> +SRC_URI[proc-macro2-1.0.101.sha256sum] =3D "89ae43fd86e4158d6db51ad8e=
2b80f313af9cc74f5c0e03ccb87de09998732de"
>> +SRC_URI[quote-1.0.41.sha256sum] =3D "ce25767e7b499d1b604768e7cde645d1=
4cc8584231ea6b295e9c9eb22c02e1d1"
>> +SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de9=
94f6657d83847bdffdbd7f346754b0f"
>> +SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b=
3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
>> +SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f53=
53c0535c1f58eec5336fdfcf626430af7def58"
>> +SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c=
5dd4bc44d8bb0c1c632c8d6829481f"
>> +SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb=
4baf7e3078b0bd1b4d7b6b0b68378900502"
>> +SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91=
436180c5bb472411e48b5ec2e2124ae9e"
>> +SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25=
c3983b67ac852c1a25000afe1175de458b67ad"
>> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f88=
5ab66608367b6574e925011a9353e4badda91d79"
>> +SRC_URI[serde_json-1.0.145.sha256sum] =3D "402a6f66d8c709116cf22f558e=
ab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
>> +SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd=
75ce3524c3cb8fb653a3023f6323e64"
>> +SRC_URI[syn-2.0.107.sha256sum] =3D "2a26dbd934e5451d21ef060c018dae56f=
c073894c5a7896f882928a76e6d081b"
>> +SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8=
a1cb24cd2c6c79397ab15774837a0bc5755"
>> +SRC_URI[textwrap-0.16.2.sha256sum] =3D "c13547615a44dc9c452a8a534638a=
cdf07120d4b6847c8178705da06306a3057"
>> +SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696=
e02839f328f7.sha256sum] =3D "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d=
1d7cbc1716405d852a3b"
>> +SRC_URI[tikv-jemallocator-0.6.1.sha256sum] =3D "0359b4327f954e0567e69=
fb191cf1436617748813819c94b8cd4a431422d053a"
>> +SRC_URI[unicode-ident-1.0.20.sha256sum] =3D "462eeb75aeb73aea900253ce=
739c8e18a67423fadf006037cd3ff27e82748a06"
>> +SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efdde=
a1dc06c5efe94541a7d6863108e3a5e4b"
>> +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c=
345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
>> +SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e=
6c3c3ee5c05081c9a00739faf7503aeba10d22"
>> +SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa=
9163bc891acd422f971defe97d64e70d0a4fe5"
>> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31d=
f61766145077ddf49416a728b02cb3921ff3fc"
>> +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586d=
e764dabcc06133f7f1d55dce5cdc070ad7fe59"
>> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta=
-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>> new file mode 100644
>> index 0000000000..7bb6be1cb6
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "ripgrep - Fast, recursive search tool like grep, written=
 in Rust"
>> +HOMEPAGE =3D "https://crates.io/crates/ripgrep"
>> +DESCRIPTION =3D "ripgrep recursively searches directories for a regex=
 pattern \
>> +               while respecting .gitignore. It's fast, safe, and writ=
ten \
>> +               entirely in Rust."
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://LICENSE-MIT;md5=3D8d0d0aa488af0ab9aafa3b85a7fc8e12 \
>> +"
>> +
>> +SRC_URI =3D "crate://crates.io/ripgrep/${PV};name=3Dripgrep"
>> +SRC_URI[ripgrep.sha256sum] =3D "f388c4955f85477c28a8667355819844a0661=
4b083c23517f0e86bd1d6d82b73"
>> +S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
>> +
>> +inherit cargo cargo-update-recipe-crates
>> +
>> +DEPENDS +=3D "libstd-rs"
>> +
>> +require ${BPN}-crates.inc
>> +
>> +BBCLASSEXTEND =3D "native"
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122403): https://lists.openembedded.org/g/openembe=
dded-devel/message/122403
>> Mute This Topic: https://lists.openembedded.org/mt/116691253/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> Yoann Congal
> Smile ECS

