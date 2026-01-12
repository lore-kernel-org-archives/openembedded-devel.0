Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9713D25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:06:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27284.1768194404095454123
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=W8lQB6b6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5472b1c551=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C4h624457565
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:06:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=iRCTFtPhPouKVwe0pV2b+SO2lV3cMnQ7xItFgXlbdUg=; b=
	W8lQB6b6fBANVZY8Bpv0PTN4+Il2BWTvSAOT7grpXSyb1W4fz6n48rXb1UBCQM3E
	R75tH2E0D/eXG6SdL6Wz9hLwqbonFsggVlBWjbcTzSGsATwKQImgbW5cOOrj+yC6
	CiajM13LPzRiBgjvHyHIzPGA7Z5L/49yh0tF3SFAKAWzp7L7Z/M2l9ZvD/NRA9y9
	Pj+OUkV0Oimg4D3qvRoHFC3M96/IvEr38JyjxN6gLkiLRGjYJY/t15IDltswchrB
	grLW9PFXpN7QKmR3aZ/0NjCbR/EtvUacMzexUPhT/ku+hn1l/6WUtr03sEbp68lc
	mEE9dyKApACJVcqXcsE6Wg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fs3pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 21:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8yZ1P+FYDskQ3n8iTBOMfJ5RdM0fnZCGaJ9OkQenmf+NpLVh0vBEYKQXzdhNjzZM7L5ckCT78azQq7QbnnH9UfglfhAWbsoRD8Yb0sL619djoBvZ8aeqC0BF3y9Hmt4D9slaBYKhOe3o0QoVZRLednerhBnLlV4EgEB/dZyH2lFBrDE/8BSnXAWx4K57aFOMYWeHK55cquzo35/xhHh0Er1IMz7SYHHQRLn6lN238h0bXeV7aThJZcMPxEBtCgwsFCSmOsQiA8PrmbHMU7g6CsDvwX8yUW2SpOnUBOrVvgrdOb34Kj/D/CLkHIbQ4s3T90u/TBQ3prHkjPIUVnhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRCTFtPhPouKVwe0pV2b+SO2lV3cMnQ7xItFgXlbdUg=;
 b=J1O6fkxbjQnBbeWm24Lbq7YekL1JJJplDd3lBUEb/aCoXRICr8vVU3ibB7adBxfexuoHDGGP/yFfJkHFbRZkyNK2kOCh2n5j+zti20zooUzuMzIl8bhcD+jdgfcLLlSUnxc1R/351JHv7scDumiS4e+Iplp04p1mFAOsd3C9EjUT91x2QjXHgElpd/La9cZd3yGjCgzs4CoE8l1RyRA9U2rP2gZSiojhx6SGJRX++dQr+luEcPrxJtfo7lxnKoxd1Zbgm1fiB0mW6l8rlED5lSayg+qMHMAhmM8kBfO2BbqcO8RxbxbjA9Pg5oeYPT7u+DPmho2B2sNXugTLMp+2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by IA4PR11MB9297.namprd11.prod.outlook.com (2603:10b6:208:56f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:06:41 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 05:06:41 +0000
Message-ID: <1c1a7717-97f9-4177-b4e4-ae8902080002@windriver.com>
Date: Mon, 12 Jan 2026 13:06:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][krikstone][PATCH v2] python3-django: Fix
 '_lazy_re_compile' is not defined
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
 <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|IA4PR11MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: 8445de9e-230b-49bb-7a89-08de51985f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWtSU1AyTEMzRi9HUGx3UDZ6UzU3QlRnbWJXMjlYaGdmRlMxd3pCZEJNdUcw?=
 =?utf-8?B?dzU5STBoWTZIRUtEZGt0dHYyOCtLWEJtUUxpU2tyZkdrd1NWTGpUZ2pYWDdR?=
 =?utf-8?B?VVIyMUx5aVFWZEkrd2MzZ21VL0h1TStSS3F1d09xUTdKOXVPUHMyRWpFRWI3?=
 =?utf-8?B?YnBGOEZvdWp0QlNBSGl3eHQzSWhHdS95Kzh5djFBTCs3dDhpTk1TQXQ2bW5Z?=
 =?utf-8?B?V1pudmtpNDEzdHhMZjNZYTlpZEdYRitJZnpzQVZoaE9IU2FhemZpT2pwMm41?=
 =?utf-8?B?MkYwK2xtWWFaUW9JZXZZaXlyMjVtKzE3QThCOVk2c0l1b1lLNzRXeGV6d0ZW?=
 =?utf-8?B?QkFVWTNML0IxcnhWVS85WmVkWnFZeUtpWEMzYlFwVHhCVEt1STRqdzNiSjZM?=
 =?utf-8?B?RUNDR1dLMWNnYzJFandPWHlsZEJYMnZqQnBRNEowVG90cFp4bmtjY2xtVFo4?=
 =?utf-8?B?eDB0eXVhMlpENFlJMktudW5iUzFYSGJXSUNncURhYVVSV1hIczFlaWE0Qlln?=
 =?utf-8?B?aFRMTDhiMGFISlFNU2dQWTR4OXo5bWFGMkp1L0EvL3BNR1hzcDRKcnZOYlFW?=
 =?utf-8?B?QzVDU21wdXRpM2ZmeW1vcGlPL0UrMUx6UkoxUFJwcmtiVmo2emhYZzFBVTNY?=
 =?utf-8?B?bHVic292WnFUSXhWMHpjellPdTQ4ZThZQ2dTRjNwYUVRaG5vRy9nVDIxRWto?=
 =?utf-8?B?VDBKS0FnRi9nN2xvSW91U2VWRmVPbFNjbkpuL3BOVFpZR0M5QjhhK2d6ei8w?=
 =?utf-8?B?WHBiU2MrazhGeVByblVaenZ1Wmd4bVJ5ME9OTkEyRlhWZTdTVDJwd2syYTNl?=
 =?utf-8?B?ZlI2NzF4K1gySDN0T0lPRlcwdGh1aFZFYllIVTd2eHNhd3o1K0x4Y3U0ckps?=
 =?utf-8?B?a0pjQzlOZ2N4WmpsWjd5VHFFcEtzTUNURmNBTnkxeWp1RlVjRU1PVjkxTVFQ?=
 =?utf-8?B?eE43alpaa0p3OUZNU2Vla3VRVE1qL2R5Y0t5WmpXOXhvV0lQMVdUcFIxOGxR?=
 =?utf-8?B?akw0Ump3N1pJMUxlcGpCK3BMRlRqZ1VlREM2WkVJRmN2N3VpV1BuZ2pqVTEz?=
 =?utf-8?B?M2J2aGRycU9aQ2xtNHYyaHZ0TVNjTEhYaktVY2RyTzViNWl6UnM5YXR0NERt?=
 =?utf-8?B?M3l0VDFBdWwrbnZsbVFjRGFWVkU4RitzQURXVWdlSWZONkkwTENNMEtLaXg1?=
 =?utf-8?B?ZEEreEpoaWgwZ1VuZm5aQml3bWFneVl4NUlHMkpLb0RLY3hBeW5SQURTSjN0?=
 =?utf-8?B?SVpSM25DaCtxV1kyTUxILzhaaWtPZUpNdkVlUDJpQUhhOWFVeFBTNC9Ha2tv?=
 =?utf-8?B?Y1dNeC9odExmUjRwak5Cc1piclpiNVVUSHRCLzF2ZWZKTEE5SHVEaDEvUU9L?=
 =?utf-8?B?RE53WEpTVkRFeXZKSWIzZk5KeFBDdllPeURqUUpRVzR2Qmo3dG9lTWROYm1x?=
 =?utf-8?B?bmF0NEdXMUNJbnJJWmFLQkFaUU1sMkZiWldXVXVPRHZ4K0ZlUzF1OElKVjhL?=
 =?utf-8?B?dWczMmNqY0ZBb2t0Q0hlZWN1RVJibndsS2VqSklsTThSek1hQW0rUzhpdXk1?=
 =?utf-8?B?Ny8vZy94eUQ0cWRWUFZNY0JSTnAzaU9WTnlONHBUZTZIMzdHSjh4cW1nOXkw?=
 =?utf-8?B?REl6WTNTZ2hSWmlLMUs3bUVoZVlGM0RhdHkrYi9uMVBXTFFLODl2VzNZUUIx?=
 =?utf-8?B?NFgrS2FVcVFmR0NDMjhjdlJ1SEtqNWpvSWhramtjOHBFTG9BMVNPVE5DTEMz?=
 =?utf-8?B?WTY3Y0VFYW13N0g2SnF2aUkwcHVMQ0VRSGJUWWRpbitkTldhd2wvRGswU05u?=
 =?utf-8?B?MmpkVHFaYzM1bHFvZFRtUGErNUFiZm4xZmdtdnVxV3BjTDhya2VONjNNRXNB?=
 =?utf-8?B?TWN1TlFpTVh4bG1oNUlwZjI0T2E2Wll2Qy9TYyt2cENITUN6cUlzRHh6ZjZP?=
 =?utf-8?Q?qtVkFRtcshBePycB3CpU6QWtval7n3MY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUs5SW91OUMvUkxiVmJGWmNra0V6dEwwTWtnL2JvL0VCRU5hcDlGbFBITHlM?=
 =?utf-8?B?ckhwdEJYYWlvS3AzQnNmVXliTTB5ZG9CQmtaTFhyYnIzZmEyT2R4R0JEL0Nr?=
 =?utf-8?B?QTN2SlR2L2UrRHpWcnhzMVYxNFZ0Zy9sVkNlLzR4cVJaV1p1cHc1Um9ITFd6?=
 =?utf-8?B?OUtTSnU0WlB3N2tQWjVUUm5LeWZ6QlgvK09mcHlnejBSRDU4QjNldk15MUs0?=
 =?utf-8?B?UThBanoyNlptTStNYkNYc2I1UzYwa3J4MlEyREozdElaNFhaSG5sV2krSW1Z?=
 =?utf-8?B?cFJaZk1Ybk5HNEJmYlpVM205RWtXd1FHRXFsM2JlQktBR1A4VnE2djZzVTBD?=
 =?utf-8?B?RnFYQ3FoazVQYWNvSFVBQnVXeFhJMitxM2phRERFMVByUzkvRlhqNUtIZGIv?=
 =?utf-8?B?aUZraHl6QjdnUkRjS2FXMFBmNWUwU1k5M002ZXhCQ2kzQkF4aDI2UkR1L1Nm?=
 =?utf-8?B?Q21DQ05uS2w0UE1nYzZEVnd5MnJ6ZVdMUUZMSVE4Smt1eUJBQlJrd3B2MUNT?=
 =?utf-8?B?ZTlrQkdHQUhZaUFwRmk3SStRbVFzTitDNks0Y0hmWEpTUVdLYjJCanZrMjQ4?=
 =?utf-8?B?S08rMkxTR2YxU2ZUcmZYT2pyVVhmVzhwTytXb1JpOEcwejVUSko2NXB6bDVO?=
 =?utf-8?B?czRRdUtGdkhUOGFuZ0hyWUVtRXdMQXdKZEYyLzRZa1NuT2MyNGNWWTRtT2tW?=
 =?utf-8?B?N1FrbUZJbjkwTFZQM2kwRFF5NkRBRWFLdSsrSi9QSTJEMkExTk4vbHJNc2JI?=
 =?utf-8?B?ajlYVG5Qa0xJVGk5MVpndnJxQUdqb082QUJYcDVPNTJ0cjAyYXU4N25laDBh?=
 =?utf-8?B?L1JpejM4c2xoWUluNFNGUXliZ1JtNWZ3WU43MlFKZ0pKZGN3Q2xmWkNWbGs5?=
 =?utf-8?B?aXlabFNjS2NJSHlFZkMxblZQQWg5OWxPclcrdXNKNWtiajJDdzlVcnRCT1FY?=
 =?utf-8?B?TzdGMjhFR3YzczFTS2FGZ0V0Rm52azhQeXhBY0lpZ211STZ3T1QzR0hvcHhO?=
 =?utf-8?B?T2cyOXlJRkVibEFjRS9iOEFXQVZoZytqY0xjV01adGoxUzYwRGwzV0R1TEgx?=
 =?utf-8?B?UjFiQm9zdVIwc2tXZ0J5eUZTTXBocjc3WDVvNXlZQUlQbTVWOGVEKzZtbUtj?=
 =?utf-8?B?dkd5a0VKdmN5a1M5dDF0SEpxL3BMNVFhdHFyVXVsdG5EdG1TTzIvc1EydFVW?=
 =?utf-8?B?dGVwY0txOVhEZmpqZm51WmQ5ME5oZnZKaHp5RTh3LytFZkhUVUhrSFFRY3g3?=
 =?utf-8?B?T016TnBFUUlyVFBaK0JFSkVVUUtyYjR3V2xmdXJSby9QU091emhBbTEyamU4?=
 =?utf-8?B?QjNrcHVkUDBoaCtySVZDSHpGSXNndENsTlhta0xMRmdBU2F4NHFYQTVJc3N6?=
 =?utf-8?B?dHgwWW5mbUtJUGIzdGdOcnZOeCtETG9SL1FsZWRLem5tRGRTOHFGMkNlYXNp?=
 =?utf-8?B?NDZpVC8vc1NjVkJ2VW00VStRZkorTjFMc2c5enhHYjlZdjU0NGdUMlRNUW1u?=
 =?utf-8?B?NE1idW0wRnBSTDUzU002V1JTUW83dkowRUJWaFYySkMwZ3JqWnZLNTh3cDhn?=
 =?utf-8?B?a2tnNG95M3YrWEFSNGdvTTM0Q2RaS3FnTWdjMFJOd2JSY1NkOXZCRGFhZ0lH?=
 =?utf-8?B?YTF1L25lNk1KVkVxMGFHS1EzU25qWjZDQ1ZQT3prQ25sKzNmOFhsZTJ3MEEw?=
 =?utf-8?B?R1pKcGZRZnlGK2IrR0FZUzhlTmRkZHFoOXVzamZPdGNSOEZscDFJbWdPMTRH?=
 =?utf-8?B?Wmx0RjJMdzJrU0JMbDJ3eHQ3TDBCSE95cC8rUCtpQXY1V1dEQjdtZE1qMHpV?=
 =?utf-8?B?K0JTbUpZY0V5eGhtcDcvZUJZMkRoK01XWUM1VHBpcXBUOFdpbkN6QXhSVUd6?=
 =?utf-8?B?UThwdVBkclFRekRpN3RPOXBqZWE4YnFJemVYc211L1NtempwUlBiRHJiUU9U?=
 =?utf-8?B?ZHppamZyZ2Vuc3V2bXh4ME1WbHBOby9ieWw5MmcySUdtdGpBYWljMTRSRFpy?=
 =?utf-8?B?TDQ2NVlEa0VBNHB6VHBwQ29sblBaZzBVUy9pSm9LL3JQVlcwWmJWaUJRZTdG?=
 =?utf-8?B?Ny9CR21TNkovU1dtL1MxOSs5aVY5dXlLbml0dUordm1VMUpXcGFjU05sdzFY?=
 =?utf-8?B?cU5TTnA3b0xEb1BLRy83dGhnWnVPSDErMEJLZWNEMHQ3NVBmZ3htazRveVBL?=
 =?utf-8?B?dFcwM1VMNmc2eHl1SGJUbVQ3algxYS80dGQ3RnRWZWxRZ0VLU0VRazl2NnUw?=
 =?utf-8?B?TzNoTGVXS1VlMm9zNTM3N21wSjdoU2taMjd0N01UN1dZMmtNRlVSMkJOVWdm?=
 =?utf-8?B?TnhNazMyYWI4Ky8yMUpnSTMwQzJVYy9iZms4Q3dsa094V0x5dDlHQ2QxVFVa?=
 =?utf-8?Q?1SzFtM4Hyrwt6QLo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8445de9e-230b-49bb-7a89-08de51985f33
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:06:40.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVmceVJ2oSt5V7OjgcwofiCuIUfTRO0TYE5gJZsSo3b1Im6uKRyPDz5wFTW+xvgq9hrRFnmdDV/RGDiFPNAjVurUlwurTKVZDtehlt9G5oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69648163 cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=xKellj6U5vT9FVufQ3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0MCBTYWx0ZWRfX93hJeQyzjHMR
 VVoeewZBbsB/MP43oo5wsJshAPh8WAXue+LlCIhj8Ntn820qo9SoRDf4vt9Y8+Mrwq+z8xKS6/J
 /kw8hutW14rIlhnLcXIj4ghRRgmjga7xLXsZ6oAQ8Cp2wYJGMBtQbbNiuVBXBjf2Iw3wzRwlWA5
 MZoNXEXgzYZU5RVgbM2uA0MYxV/AUf1WAjyuki+HMlB+JBi1bBHcaJFLuXv5VdSlI3WG23Oodgg
 hFvuXSgg42dhfMfdo7dzmpT3ev6kikhc+lmu8biWkxa5aV0vc2DHJZ25pD29tJVBpjkpCuw/fyu
 zOJ338HnE4SedeD9g29CO0W5zDdNniAdbE3qe+tyJm0sKRgDkOT84T2uqg9cUSQwdjFKXmZ6RoF
 8dHoyddZ6g29Uo9jobCDdoF7l22a6/mqG+IGLJUZh62hGpGFreiZtrE8VgiqqfInlaxKpEKlKif
 28PKftam+Vgyu8Z8+ZA==
X-Proofpoint-ORIG-GUID: 6XfnAZhesM2iMntHa0OSt_7P2zvvafPZ
X-Proofpoint-GUID: bs170yqa0mzlv-rp5K3pJ--hhe-P9srU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60C4h624457565
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123349


On 2026/1/12 11:10, Anuj Mittal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sat, Jan 10, 2026 at 6:01=E2=80=AFPM Yan, Haixiao (CN) via
> lists.openembedded.org
> <Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>
>> - Fix:
>>    NameError: name '_lazy_re_compile' is not defined
>>    introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
>> - Revert the modification for docs/releases/2.2.28.txt
>>
>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> ---
>> v2: Fix a typo in the title
>>
>>   .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
>>   .../python3-django/CVE-2024-39329.patch       | 27 +++---------
>>   .../python3-django/CVE-2024-39330.patch       | 40 +++++------------=
-
>>   .../python3-django/CVE-2024-56374.patch       | 42 +++++------------=
--
>>   .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
>>   .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
>>   .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------
> It's hard to look at a patch patching a patch file .. Why are the
> other patch files being changed which didn't have this problem?
For CVE-related fixes, I don't think updating the release notes is=20
necessary, as no version upgrade is involved.
For fixing the issue '_lazy_re_compile' is not defined, do you suggest=20
leaving the original patch untouched and creating a separate patch instea=
d?

Thanks,

Haixiao

> Thanks,
>
> Anuj

