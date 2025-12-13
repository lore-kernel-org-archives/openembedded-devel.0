Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E58D59F75
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 04:33:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2849.1765600388093775651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 20:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Q+SSx/Lj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44421a18bf=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD4AvOY473811
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 20:33:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rw2/aSkr+RnGmjXLDXSePYZGzxbefNzfRxsPY8UseXw=; b=
	Q+SSx/Ljq/CrZSrB/OBT+n2N4GZMlpzFxpwYqw/azpu7sOpX2J8CKmWHYitUGzaA
	HxuSKudhNaLVoOfsBYgKVLTNBl6kk3cXTdNfQdZxmYU+jyZbViEb5vzJsbosOPiP
	Npl2Y0Z8LxrBWCPR7amVDxkQ2WFm1FRegRv4w3dTdCwcgfagCPzyK1nCWjsj/WUZ
	nA9olZr88zoerQ1tI0iKCDKaG8XC68dn2SQJkd7f3A2iFfGhidyRJ2b0L1qVYfsx
	E7ZBm41Ap/fCIj4GVJqoPc7bNdhOJDYV9j6dImPKEifMYjWtSek9o0JoRYSZ7B+U
	QAZHi7eW7RMO7Rop2l+WDg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0sx4r9eh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 20:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf0CuFW4xSu4lVQ/KJnGdsn4lidQokHT5iRnnCchPIIl5+ZTmZzSmXZvtAaZgGQ6yEh+msb5psJkw8vpZaG6L/7/DGopiGZW9WU9xMpmNuY0s3opMpLC0BiKVr2zfdQHWfSFIGihGa34vmstpDah55dXmgboYwxXLAEVYZh0mApeaRY7MgL5l+zbcSqX9GVCkkm30CTY145+sQHJsM/ZGOesDlZtakBGrUQyIPGN8r77ULXQtnb+mAzdk9auC4AtfwcMpdogEckyQpK/GxvePTEP7UWN62lQyb1pm1EC64PYxRM/MdwKQsa70zouW3521TeEVhQidum96uwMXgyoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rw2/aSkr+RnGmjXLDXSePYZGzxbefNzfRxsPY8UseXw=;
 b=CNQQIgqqRwfxZxgndGneHpPkxI1rmz0VQnE7/OlDUbz8WQYFrEEO+cpG/B8hmVzV5UISEeAncs82YNUDJdM6rLwapmzyzX/0dEdETCuSVpp6rwlWAQlHGpSXybo/B+woi57/ZYp773RLO4B2IjsDD4IKss1lYf/V3LLhOP+50Quvjmsr3CHaU28cm2RJWjFwAHBZBpN3kDGsSUNGSq6uaHp0VJheWmt0a/YyFyfKzS0/Ir7jZ9injDka3qH6N15D+nqOvmoGYisvCny8S7+E/AkFiYXtlU95Vvl6cNHvaHF1PU8g1uZ/NiGLGgknc3Yfry/nk4KS6N0XZ4453bvK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Sat, 13 Dec
 2025 04:33:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 04:33:03 +0000
Message-ID: <fc30a0b1-66c8-4551-a8f4-1b7c99e889c2@windriver.com>
Date: Sat, 13 Dec 2025 10:02:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] ripgrep: Add ripgrep recipe
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
 <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
 <CAMSfU+5zhRGA56u6=zVMXOiOxV7vZ46ytoaYw1o-bHf_t_FoHg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMSfU+5zhRGA56u6=zVMXOiOxV7vZ46ytoaYw1o-bHf_t_FoHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0250.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1022dcf4-8ef6-4071-ed04-08de3a00b245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|10070799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2pWKzZadXB0QndzblAzVG5IZEpuZk1zUWd2dldCVVc2bmNRd3N6RE8zdjRo?=
 =?utf-8?B?ZGM2OFQwRWh0Uzlsa1RpU3dKVmN4aGttL3Q2WVlsdjBzaVhGQ1pieEJGTHVT?=
 =?utf-8?B?Z3pNWlVjbVA2RjBad3pCUEtmQTRKODVwQWE1aVA4aXo4TFczVlpab3dLZmt0?=
 =?utf-8?B?dWJLeUx3RkczbjhFOHVJbmx4aHFLL21CcWdPRFlCR1ltMWE5RDhFb3N2UGZy?=
 =?utf-8?B?eWF0VGl5M0RUOEhGSEJSY0lQTWhiR3RLeThzZUljaU9FQ2tyam9QS0c5T0RJ?=
 =?utf-8?B?TG5OUi9RbWkyME5XYS82K0hXdGhkQ1RncWpnNTBkQUYreGNFTjhjZWRoVVI2?=
 =?utf-8?B?amFYaGdOczFDZ29td2dwdzRYVGlSZzhQdmRrc0owK2RRaFFyZUNYWmtraERu?=
 =?utf-8?B?MmxDd25JZVFIY2o2STFNYVVQbFU2MU5JY0FnTXZBRmhZaGhTUkxxVmd5eWFY?=
 =?utf-8?B?YlB5ajk5Zm1PMmVzV2J4akdydzNzYUlPOEJndzhLSnJtVlRlVFhoU3VqTkl4?=
 =?utf-8?B?cVBua3JuY3dHQ3RZK1BSNGl5MXN2c3pIajBLZ2Vad1BXSDFiOHRnMGJWRWJu?=
 =?utf-8?B?QUVzMjZodjVpUGRhY3lTT215aFlWclcrbUgyeHdUVnlMaVFuRHlvY3NscjNw?=
 =?utf-8?B?TjhjUTJVanBNd3IraTlvUUVhYzlvVDF1NENPaFVNa2xTcU9pd2hkZGt3YkE5?=
 =?utf-8?B?TTgyTXVXSWxSZENwVGovQlZlWlR3WHJFM2RZVnQya0RPSFFQZ0dtMTVDdkNl?=
 =?utf-8?B?bHRIU2V0R3lUYzRPSHNCUS83UzdyR2RpNUQyY0ZVSmxzdEdNT1hsaGNraVNx?=
 =?utf-8?B?TW5wOERQODFqcmUzbGNLK3ZqQWx1NnNORHhqdzMzNjhLemRuTUMxQ3ZETHBV?=
 =?utf-8?B?bFpOVTBIV1NIb0RxeXc0QW5sOWp4dEs1TU9FOXVMdVlUdCtrcU5SQ0VGMnJL?=
 =?utf-8?B?dWhkbmQxU240bytsWXYwWnpOYm1KWUpWL2FoNjJhU1MwdE9oMVJQNnJjcnpV?=
 =?utf-8?B?VkEvTGgwemRCVlJ2dkNWaHo0alNWMkxDVC9aUU9ocTRRT2VyQ3M0Y2pMUndP?=
 =?utf-8?B?QW05RnVzN0tUSWFiNTB3M3d1OVd5eGFDaHozTEtlUjlWaEZEZzRjbjF2bjFz?=
 =?utf-8?B?L1cxYk00NWxuV2JzRTFoK3RkKytyeUZ0em1QVE1nbi9oMkpISXRsV3V5OEVQ?=
 =?utf-8?B?SXdKbk9NREFXaHBjaG5mMVVqenBZN3YwdktMdk0vOUNXRDkwRmNiRUlZRDFo?=
 =?utf-8?B?Wk5ORnFRR3ZQeVlzVE9nSFkvWFprMWphZXhnZlZwZ2ZsbTluaXJia25zQ1Zh?=
 =?utf-8?B?VHk1MmJQYnZ3LzF2WVpwTjhsbHdsdEl5WXdSWVNGdnJBRHJCcm5LdjU3Kzgx?=
 =?utf-8?B?VmhmRW9VM2N1MU40Qm5McEFmY2FldHFjYjAyMytNM0pYWWtQcmJQbDJwc3ZO?=
 =?utf-8?B?c1cyUkRhVHZ3WEROWXJzbXUzRVNNdWFDb2NrREp1OWw3b0h1c0NRUGRkR0t5?=
 =?utf-8?B?UEw2MHlMM294alZyeFlLbnJrZ0FOU2ZCWis5TkxkNFFJdXhqaW1jQ2VGcU9E?=
 =?utf-8?B?KzR2VnJXREJaSVNrV1A3cWFVQzdTZVdBK1hjbXdLbFdnWTNROXdkVWx5bUUv?=
 =?utf-8?B?NTA3TVIwWUphK1U5QWRIL0c0SWs0dXVZUUZpaE83UlVnODArN2xYdWI5TjRN?=
 =?utf-8?B?aVRQSTR0Vk1HUndNOWNmMStDZlNmNW9IeFhiZ2NVK3RTVkxkZER3NHA1T2h5?=
 =?utf-8?B?WFRVZlBTRUR4VGpwbFNPbWswQ3dJSzNFTy9vTEpiRUVZL0d0b0tqMHRhL244?=
 =?utf-8?B?N3JKQXkxUEhTWnRNUnVqUEp5OVhTL0l4a0JxdmQ0NjZmK29Dalg4SUZvci9s?=
 =?utf-8?B?OUZEY2hMOWxQNXZJUUNBbktpeUozb3BzN0owS2FmQXFUYkU4aURoZk9udVlK?=
 =?utf-8?B?eXpIaEhYdEtXK2tSUXJEcHQ2QXFWVU56aHNKa1ZudXdrTWExY2k3U2VNUUxy?=
 =?utf-8?B?djIyTFM4R3B3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(10070799003)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TncyUG5WbGVoeGhqalVxREhHSFRBTWo5UUIwdDdZeW1iM0pMb0Vud1U3MW5S?=
 =?utf-8?B?ak1xcnF2QU5Ec0tNNUpaUGlIS1ZYdGVQMnVsVk5hTGNSWVRNUTNsL3dNNVkw?=
 =?utf-8?B?SFpNc0RnQ001OEtNbnRiQ0hscXQrZTNGdjNQd3RJd2kxTE85L1ZNc1hiUndJ?=
 =?utf-8?B?WFpzZFlWM0hTWWJoSjQvOG1UdlNzTHJxM0JSV2xLMWJCNzU4cXFPUVVrY0Fu?=
 =?utf-8?B?Vm52OWtwTXNnOFViL2RRcVNlODlzeFF1TW9aN0ZXWjc0ZWRhWDZoQ0NyTVdR?=
 =?utf-8?B?aEZNRkRCZFF1bktTRVVRaHZ0ZnE1dDltVnMrb2QxbUtoT3AzQzNON3JtUGIx?=
 =?utf-8?B?eC9DQUIyZU81eVRRWHgwZkZwN3V2QnFuUnhHK09nanJJMHM4YU9UalYwQ1JB?=
 =?utf-8?B?a0txRjRhbzRrcnYwU0xYTWxjWVl6dE9pZk94ck56VkdlamljRlhUWHZQT05L?=
 =?utf-8?B?b1doeFhlKy9sb3NtVFc1Z2tEaGQrditNWWU2b0xWVk9mSjlLaldBZzhPYllZ?=
 =?utf-8?B?d3VNVmhJT2hnRWR6ZGp2eWNIMHJ2c0RnYkduWE5tZkg1ankxOCtJQ0NzOUdT?=
 =?utf-8?B?Tk02czJLOG1ZQ2lpRm1TQnc5UkxxSGw0UERuTnZCU2ptT2lmL1JILzZTS3Ay?=
 =?utf-8?B?bkVxMU41Ti9hNk5vU2l4VGZHUDFscDViN1JrdFVIRnVQNWJ3bmtjVXRYMUJ4?=
 =?utf-8?B?U1htd2JQUVp2MERJMWhZWmdpS2pHbVFmdUd3ZmRSejJYS2pQaWlSdC9GVk1P?=
 =?utf-8?B?WElSa0d2RmZyNlJsbEVLV1QwSVpCMTVFVkw5cjRPUThibVg3dTlJL2pYOXVw?=
 =?utf-8?B?VTlVTHR6QnhwL1doQ2pBSm5zcDMyRmFTWUd1c0lQUlJCTXM4Q1lYN1l5SHJw?=
 =?utf-8?B?bU5FTzRIQlpnQVd6S2pmNDkvTExHeHZHeGV2dldYZG1QckZXYzZuTHFEWjZs?=
 =?utf-8?B?aU5zL3ZOL2h6ZnVKazVwa3o3UUFtVTJUOW5NaU1PM1BpK1NqYUlobjBkZDZT?=
 =?utf-8?B?b1FDY0VDeFVSazZGQkJLaEt2QytjNlNzOHZsWFBJZ3pqSkRMWHE2U1pScnVk?=
 =?utf-8?B?NTMrdXpGZnFQdUlOVkNJTnREaTM4dkVzN0thUnlVejlybDE2ZC9wWkJGSDQ2?=
 =?utf-8?B?RW1mQy9vOGQzOHY0d1RaRTRxQndYcDk1N0h1M2F0TU5GdHNlaERiQW1LSEtv?=
 =?utf-8?B?a0lWMEVFeHFvcW9iREd3QTg1Y0dJU2x1L25iMnV6cFlWY21yZEt5Q3phZlN1?=
 =?utf-8?B?OGdRN2VMaDUxUmhQcm53ODBwRHBUc3VIekNuekFOUGZwMDVMVzNoeVpSRkcv?=
 =?utf-8?B?MFhoRExVMEhyU1FQWEJUMFFqdkdNenJNVEY1TGxNRlBJVWh4anVkTUNJbTBY?=
 =?utf-8?B?NHM2N0NYZm1LMDkvNHMzNGwwTkhabFVIdzZPMmVaQm5HaUxMaVlORktZN25X?=
 =?utf-8?B?ODNFdzd2M2MzVkpUK2xZOE8yMFlWRnZQQkR0WDJjTVhuSGdJQU1uM1ovT2sz?=
 =?utf-8?B?Z0RZMU00Tlc1NFJRTFJaaXlGMytOeWNubStlZEdpQWhSRnZKaFVicStTVHZY?=
 =?utf-8?B?b2YzcEJ0WUl5Y2pSZEgxeWJPblNraGpMYUNzWTJIRFNtN2RLaGt0VnBSdzFD?=
 =?utf-8?B?eWw4bXFjckRMMFdpQ1IvT1JLUVBrZWI2OGw3eVhkNSt0TXMzTjlOcDBiVFlt?=
 =?utf-8?B?bUpwNS80S1JwREl5dkVkdWdJMVZJaHJ4YURzUHNoREhIbHBnSjNBYlBPL1Zh?=
 =?utf-8?B?OUhqU0lqTkE0ZUhZNWNob2ZVMS94cFpuV2JkWWxpdVFzNGxzb0lwQUFJa3pN?=
 =?utf-8?B?WVdUalJsMHRZQXNrYUY5VmtrU2ZqajJQZDltaFFCS0tMVDBZMmZYTnpFTlQx?=
 =?utf-8?B?QUZGSTl0S3dweTRrc2hoTzI5MWx4dlM2b1Z3VDMvL1J1WVByWHZ3MFpBZE8w?=
 =?utf-8?B?TUcxNEh5aXBFa1NpK0xaUWptUW9NUGU3Qzl3S1kxck5pb2dkQnhlUTMrUlh0?=
 =?utf-8?B?dnFIbHlmb1RxTkpjeTdEeXZJczF3c0EzSzRJanFwclZQSnpJcEpWTUNWNUN1?=
 =?utf-8?B?VDBrZXFUSG9rKzdaMUhkMlVJSlZDanFhQ0xGOTRxeFJJT0NIajlCVTZyWjNK?=
 =?utf-8?B?VGZ1ajBrOG5qTTdPV2NtVXVzcDFUZ2twRFVoOXFuUEpVbWJlZjBURUpKS3FM?=
 =?utf-8?B?MTdrdlNQL0s4SWVKUmY0UlNBNkpvbmM5WUxKS0EwWEE2TmNiM0prcmc0eXRq?=
 =?utf-8?Q?/f6dywjJ3DtvAM/9gqcIDyT2rM4/VICyhf/nI8o5yE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1022dcf4-8ef6-4071-ed04-08de3a00b245
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 04:33:03.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfY35I8jVnX2yLOO8DfONNY8MI4H2ye5f1CpieYf8iWF93BeXI7qnllR+ukH1Y4/Gp0XevwwQ5rorcXf7zeuRuE1Pgwhdif2FSAjvekJaRW4IhMl8V6nUXPys0Ukg9ul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: oJw3S1bo4SDQ3SmKOcQiswX1U6I6CUw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzNSBTYWx0ZWRfX0lQptYFHaqMy
 Uk7ZTCGpP4xZZ2HK6etPNpbHEPrnrxCP6+K53smkB9kg9Z9ZA//8/zrI8BR2VEPrJKrlMI6CBMX
 GxTZG43cd8TLAy1yjz1e+UBQwUkjPU4ZwEcNc+6puwf9KqBpmTxZCf/YK4Aku7NLcxJCSB1qy6V
 SC8OFnNuTLQpsbxZktVXMTAChkKWcw0QPuKma0+5413umARtQ0FIvi7kbKhmcbUHxdksuOJNkPB
 qEY0GVUiMbsUgax4qeDP9wJmwfNTe9vYG+5L1Ge5PoNT8QrOwjb5Bp10PnzQlqbwyLVb0rwK7mN
 bM2MMYhD2OCGMfSbMPM1zQ2dR54rHKLd1W7faR3SZXMHEDFDtxNx3Jutz4V7HneSF75iLw5qEz8
 1FcNQcYl3+4K+xCuncjAbaB6C9rnuQ==
X-Authority-Analysis: v=2.4 cv=O7M0fR9W c=1 sm=1 tr=0 ts=693cec83 cx=c_pps
 a=Pvk2fBMKoGc+EtVHRePnOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OcE5tU-iAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7BPmZysFQaJl62M1y68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=qwkNQZnGtIHGNKTLT1RO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _PuqLNxPUEpJ86MA2I4v0ZWw0Lj-bcv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BD4AvOY473811
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 04:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122630


On 12-12-2025 16:29, Yoann Congal wrote:
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
> This BBCLASSEXTEND creates warning on AB[0]:
> stdio: WARNING: Nothing PROVIDES 'libstd-rs-native' (but
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-op=
enembedded/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> DEPENDS on or otherwise requires it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'ripgrep-dev-native' (but
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-op=
enembedded/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'ripgrep-native' (but
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-op=
enembedded/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> RDEPENDS on or otherwise requires it)
>
> Can you look into it?
>
> Thanks!
> [0]: https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/build=
s/546
I=E2=80=99ve sent a fix addressing this issue:

https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_r=
ipgrep/116758522

Regards,
Deepesh
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

