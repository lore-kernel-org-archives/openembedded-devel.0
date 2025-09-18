Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9204CCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:42:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4745.1758163324462831530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MqH1BKK7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1356ab658e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I1et6H2077915
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:42:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=mHJ9F/oQKiCHwEDXbLFw4s
	s3hXxq4+d09zbgOQC1WgM=; b=MqH1BKK70Q1HwOKEVENDJIMEicySqAkb1MPz2D
	Xd04FLp5bT+2IccqiLODh+2rlqltwTMAGjo2puGxPaDd9ip22ateK65LeA4DeqsL
	j+iqQk31VGTlhBrSfXb4FV/c5afeUAUD8B3gDU1Af7e0N5ClOCbqoBvxbGjfM0x3
	I7aImJ0IW99RLo51/p5nA7NpO4hm+tGKRO2phhSbU0fc+cHPuPJ6FbVmrdbrjKDC
	CvOHmvBqFgtqOmuynyRJNPHTTg33lnNJm1PXK2mMT+DE/NZFmTJtUwPtvMXkJD69
	d3xR92h+FXGtMpFawVzreAo1BtomG/N5h+6lQ8ZogbkYKy9g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1h66-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 19:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEjoeZx9qvHZNXNsPvrNxxi5xQ3XBWnsgug/+OKwVx1hHbLZQg1HK75wM9Htl0SXWSRaTzTGdkDPG1rGEAg+yIuk6ZDvx35Ikfhvt+/p5rH/YXePxChnd9NKzrolmrMSwiedp5PIB9G85VSmpP4gv4f3R4KSzMfEiGiDJ7MDhaJb1cf5R9E8fG42RkcY6NhNqQFHXv8TZF34EEF/EmIrNlKXTm0rgptWmfjsRX4wpLjk0lueVMDWdSmdVYvMEPDjpJNY0cyp7MpfX+Crw+OaqOhHKfwVyinAIRUB6uvL1uOU4aQW3vYfCRoNqxH+skZAP/A7eRDraoC/59XOqs/nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHJ9F/oQKiCHwEDXbLFw4ss3hXxq4+d09zbgOQC1WgM=;
 b=tTTVd4Kr5CXyP/neGnqkF1APaEQGpzZvz9WSMjXdFqs4wtzkxVU9/DeD9boD+3i2RoRqwH6eHe2bDibw4sgktFw8NUULIh7ohZzDgUzHRIVp2142D8TcRGKmDqf0xEAIeH/kVTtAUrxYNQ5W74Q9MdqAsab9Flb8M1E72VvXIMBdunCkvioSmlMOTttPJ4YGxqp0lequ6Hb8mGxO2JxP769IiFi6px0ifGDSZRvNmQJ7g2JX88cQeFoThjl1vxQh+E1uWZ2bqYkhyE6YRjQJIIBOCjcGQsWX8rebKej7gIMqVkau8TOewoDGpPr73HZL69vsDxMnlmm/yvM6UcVYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 02:42:00 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:42:00 +0000
Content-Type: multipart/alternative;
 boundary="------------71vh7ZJsNa0vTsUpB801I5lL"
Message-ID: <ffeef092-12d6-4473-8919-12ae387333db@windriver.com>
Date: Thu, 18 Sep 2025 10:41:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] iperf3: fix CVE-2025-54350
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "skandigraun@gmail.com" <skandigraun@gmail.com>
References: <20250917054831.2884291-1-peng.zhang1.cn@windriver.com>
 <bc48b4bd3497a5262d07c576e1036142f0bfa7d2.camel@intel.com>
From: Peng Zhang <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <bc48b4bd3497a5262d07c576e1036142f0bfa7d2.camel@intel.com>
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb68f4a-6cc8-4fe7-aeb0-08ddf65cf138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OFJhYm41NWpGZnRsQjRORmNoSlcwc3k2dTNlZnNkSkpwb2FKaGVrMW9VY2Fq?=
 =?utf-8?B?Znp0Zjh0ejVDUklvTnpFZHNWWFBsSTdkMFVKSFc1dnhpQVQvY29vSkpOTFRS?=
 =?utf-8?B?a0I5c3JXSTBYUWs3ZTlNSit2V0pRb0FRT3FjaXVpamZva2FsMVlxbmJuUE1z?=
 =?utf-8?B?RWc4SldJTmFwTTJUc0hUR0ZKV3BHL3k4R3Fyc1Roc25ZZUx5c29hRVRVbTM2?=
 =?utf-8?B?MWJ0QiszSVVhNzlSazhXbFh4SjEvZFN4TXpBUzRUeTlzNlRVQm16S0x2bTcr?=
 =?utf-8?B?NTViWHg4SGt2cE1OdkxibVU0VUlBd3dOR3VIMGM5dDJUbjVyV0dvRnhGTkIr?=
 =?utf-8?B?Y1RlREw0a1BmNVV0Uk1KT0VZeThiVkM3WW9rajA4TjlvdkMrTkdTUmJ3Smpk?=
 =?utf-8?B?bWIxbnJORWVPZnJSTEg0VTZvbFNITW95b2JyaTdjNlZsVDhUNDhIV3VpTngz?=
 =?utf-8?B?MjVUQ3A5Tk1oUU9qVFZqcVF5UFppQ0NQR2MyeGZFSmpIdlNsVGNBWnR2OUp5?=
 =?utf-8?B?YVNFTGt3bkxES1hhNVBnNVJBVFJqK1M0bFMvVktxZU9lL2xKbmdEeUh0dUJX?=
 =?utf-8?B?Yjc1Uk1HQmg0MTYwNTc1TTF3eWtpQUU2dHFoWS9ZeW8vNk44N092RVFEOWZx?=
 =?utf-8?B?WXRpZlFRYkJDcTlrWXFnbE9CKzg4ZHBSc2xCaHY4TnVYdmo1WGtzY0lDWm90?=
 =?utf-8?B?Qm5Gb3N3b2kremdELzg2K1RJeEdYYTcrRlRNOWR4SmVVNndNVlU5b1RmQ25m?=
 =?utf-8?B?ZmpJdGFlVUYvN3F4aTl3dHc3TVlvMkh5SVQvV3FxMkQ3LzlLUktPTnNvbW4y?=
 =?utf-8?B?NElQVnlIcy9JRHRlRm1tTDhmQkpUYXU0ZVJDeWVtaitlVHl1bjU2d1NxTEYy?=
 =?utf-8?B?aGhQeGpBUnVaTFdSUTJ2NEovRWZtSHBGaUR2MU5zYWZhTEhXSU9EZWtlL1RR?=
 =?utf-8?B?TG56a2hmT01BbmE5ZmpQZ1lKMXI2V2pzK3FBdzZ1YkJUYUl0YVBOZER1NHE3?=
 =?utf-8?B?QzFaQ2VYWnQyd3psTnorRHZSUzVaNWlESFo0TE9CYlltMmN2OWxENDR6U0dW?=
 =?utf-8?B?clkzRXQ1bUU5MTdDMk92d3JHQzlmZ2N0TGxSbzEyS3pXaStlVFYxWXJSTEdu?=
 =?utf-8?B?UjdEeGN0czVEOW5CRGZNVVVYWTVDbC9ucU9DVDdpQXl4eXVEN1NKVGxWNHZS?=
 =?utf-8?B?TUFOODNoUU0zRkxMWEx2ZjF0RHdwc3FGWmRRN2xMRHJQSUpJVURwakpDZG03?=
 =?utf-8?B?WEI4aGh2aHdXYm1SYU1nWjAvZFBGKzFRbjlPN1pPWlVRMy9CQ0hHMTI0dU1I?=
 =?utf-8?B?NjNENDhHUjRyR1I2SDBsQ0hBaEpGdUtYSEZuRUNMdDgvM0FsNUtqSnR3YXBa?=
 =?utf-8?B?S0ttbDIvN21QQU95QmFKbnFyT2VBOGxzNXJRcFNZSkkvU3FVV3F0dGNXaEdM?=
 =?utf-8?B?cW8xZkRnaithYmdReDExUENLNzBuYm96ZEdNOG8zMHI5TFhSQ0JhN3lSRHZW?=
 =?utf-8?B?OGpkb2VPZC9lU0JJdDdkR2RDZVhMcFpKQlhteDB1bXJ5WVBYb3ZZZFllM0lS?=
 =?utf-8?B?aTkwdzNkejljc1ovRXB0bzltVVAwbkMrNFc1eFVOSDNDUlhoSXdRWDhtNVE0?=
 =?utf-8?B?SmUwRWNjNzVPV2dFWXZWdTBIakkvc1A3a3RvMXpZK0o1c3VmTGlId1JaTWM5?=
 =?utf-8?B?bFZWNG5qOWQ1ZE96WFcweDNQTUdRSGZyNGw5cEFUNDI3Q3E2aXBVWHVVVGtF?=
 =?utf-8?B?Q2xrVlU0NEpIV2Jsbmh0RHViVHRpSHZPditRNjN2RndnOFhCbytlTkx5OS92?=
 =?utf-8?B?aTl5K2c2VGI0R2dJdmNxWXlhWkM1c2lic1hBYTM1M3hBRDdQdmlJQWxLMXpL?=
 =?utf-8?Q?7vnTBZgJ9ijrU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1BQamdOVko0VW1pendKMkJWb21hNWNoZERmL2JLdm9BeUZtamNqZzNWaHFC?=
 =?utf-8?B?UTBHWHhXVnVpQXVtTWlJdmNnZGhZT3pSeUplbzFpL2FIWUhWeER5bWIwbzZ3?=
 =?utf-8?B?Y1VnVUx6M2t2NmdYLzYwOWwxTmZ0VnRPWUM5OW5DOENsRFRLOWsvQlZad2g2?=
 =?utf-8?B?UWtCT0d1OHZJUFFleW9IUm5iV0NQZ1hRN3YwTFVJcjVsaUtGZFdvcXZQMktk?=
 =?utf-8?B?STF3WFhibllXNWRGakI4OTZDdGdxT2grbmRQRjJUUEhiSEJoZFNWczVPSEZJ?=
 =?utf-8?B?cUorZ1lHZmwxaURKZWN4UGd0dzEwRU0yRkpad2ZHcnhMZVp0N2h0UVJ1L1ZR?=
 =?utf-8?B?RUk3N1VyaUc1RnJnUVliK3FPSVpuL1JJSngzRzNkVys1cXhrK3BTSkFXdXpt?=
 =?utf-8?B?YVZjcFlTNUpVMGFKWlZXYnZ6QldGUUgrd3BVWG5VYi96WTFhNGRBLy9EeDI0?=
 =?utf-8?B?QWQ3ZThKbU1pa0dHY3JQWTJhWHVZcTNhYUxqeC9XMG82N1ZGTVBmd2ZQVGVG?=
 =?utf-8?B?ZWZkUUdXZzdQdUc5Z053Q1lENFczaE1FQW01SXBOWG5kR1hkWGUzSVZoL2ow?=
 =?utf-8?B?UmppazJqYk0wNHZyMWFrQ0NBTm1pNjJqTk5hM3dQZkpCTHRBUVVMbENKQkxk?=
 =?utf-8?B?RE54OTZCeVE2Z203Tm1zSDd1VXJmYlR4dFpOcG9HR0RIYmVra0ZZWE1hazEr?=
 =?utf-8?B?QmFmdm9qbmU1dXRSMFVsUjVncWJUTlAvYnZxZjk0NE42TE1GcFBheGM2UG5s?=
 =?utf-8?B?WG51REFOQTNlZVdUcGVibVh4SUliakZQM1ZZaUkvMXoxQS85c1ljdG1rR2Fq?=
 =?utf-8?B?SWhTQUI5Rml4SkVRdHFaRkhIMFNlK3JMMWpJVjV4VUhnNVlqN25jMmNRK2Y3?=
 =?utf-8?B?MWprWjF2NWJnK1VWTDV4clFLVS9ZTW5WeTRNVmdaVXZPbkd1bGdhOHhMTWMv?=
 =?utf-8?B?dXN0UnVKSEs4bndXUjN2a0VKSHI2ZlRqaTJOZFV1a1kvMGk2YzdnRk9RQ2Zm?=
 =?utf-8?B?RjN1a1NYL3dtQlFJTHlFdy9ONkx0S2l2TzROaEk2VEZvMkZobmVka3lMeUJo?=
 =?utf-8?B?ODduY2JqcWt6WnlBM0dDT0RodDY3OG5pZHFNcHFubHV0MStmUndZTVd3VURz?=
 =?utf-8?B?elkrcUtHVHlTY2FpL2hxVStKVUpxeTJpNEUxQmVyWkRZUzFST09GVUFDSXhW?=
 =?utf-8?B?VklPWGtJdmhFelY5QmZHY2ZOTTJrSHR1QkthYVpoQnF6SDhCRFN6TFNYR0lz?=
 =?utf-8?B?OWQxVVA1ZmpXQjduN2cveEVnK1F0amkvaTI1VFFxYU5RYytGZWdFWFJtclFW?=
 =?utf-8?B?NUQ3TGF6MFphOFRQUG9YVDVaSUV2YmF6YjFDTTFQUlBqRlZWdTExdkkvVWdt?=
 =?utf-8?B?TFNYUzJTY1QrTHhxVnQ5QjYvamJ4RGltODZRbHl4RU5VVEVSZmRreUdrbGFa?=
 =?utf-8?B?ZHhFN2MzdkhWamp4TVNYQzAyNHlkOUk2NmpZT3cxRytEbHkzZk1CakNmY2tw?=
 =?utf-8?B?V3BYbVBwZVR6U0dCWnRmREI3K3VCd1prWnZsbDU3L3duc3lZWGZ3WXRyZDlS?=
 =?utf-8?B?T1lmV1lXTlRaSzV0TkVWbGtBMnZqTlg4V3BVWFQ2NEFnUHF6SUFmZ1lXSmJ4?=
 =?utf-8?B?V0I2R2RqOW9jSXNpVk45TEtycmFwWTJWWVQyWWI5RXhubmxBRThuR2xKNGhV?=
 =?utf-8?B?N1cxREUzZXplVGxhbGQ5eHJuNFZFVXJRNlA3d0txRkVlVUxNM3oxSlpKRXUy?=
 =?utf-8?B?bytManRzY2hHNmxBVXo4eW9Gd3pBWWErTlRWYVpKRVhJRy9zQ3JuVGkwRzNt?=
 =?utf-8?B?ODJodWgzdnJFanQ2Sy9kVFF3YU5NSmZvNlNCUWNFVTkrenVnMWFyaW13MjVo?=
 =?utf-8?B?YXZnR1JISHBlQ2tXQ01xcnFHZUZ4ODV1a0lHc3AvZlpYUGx0STh2Q3JJQVlu?=
 =?utf-8?B?N25iYVFOeVM2eS9YTDNuaFZOeFpLSDVucWpnQjJrai9tNVpFWEtvaVplZnlQ?=
 =?utf-8?B?ZCtNeWZtdEhnazhocWhGdlFUWTh1RG5VVWdhaDdsaDFKNFI1dWs4QW52RG5l?=
 =?utf-8?B?OWRXb0d4aDJ0b1RMdHZCUXdLMEM0SkZOMGowMmZ4Qm13VUJuYjhWMUo5L0RE?=
 =?utf-8?B?enh5MFBaN0ZkWkthdUlYZkVWejJSTDNicXlIN3laRzBUbEVQRWxkeG42TGpC?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb68f4a-6cc8-4fe7-aeb0-08ddf65cf138
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:42:00.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oT9IxB0xxxyShx+5dG6hS9+3eRsPwkPLYW6e5OveAVPMTHBRJHbr9wGZ5YwFpERi8zMMAf+ZRJEUnmSO2dBZUVpsa+0wVGnrQipIywXE1xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68cb717b cx=c_pps
 a=R7TnPQtMnhj+722GCxzAsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=vtXoPY2jAAAA:8 a=QyXUC8HyAAAA:8
 a=K9JKU8DADUk3AdRkLnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UBFVfQAFWYhimOpKR3UA:9 a=R-F1F3gO0hUsj_5e:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDAyMSBTYWx0ZWRfX3GnCF6WioqFd
 YqkQk3uGK2DtDOYctNlwOTlJqfadIom3nM/cqhL+tOQzwEkqazJ7mKilUKp98lCT8pp04q4yNht
 7738s+Eb9Eer0nMGHIK+e1eFPn0M9n57uEDEmjS2rJFaawpL/InAvK3pW1ytrpa9Nu+H6FCECdm
 eUL13mGU0VSKf4OWDzIKR7UuIzC1FFzTKcK12gVbq0u1TigTQczVb3hh0ZOBpfqgejpJYSoGJJ9
 68033dPeUCDv2xfUO607nV26ixaHJx5nfI69ctfGdiM7Eg7jzu8OEnGzWQYp/AIhQKfVwy66vJu
 AGq4ZHSIOp4Zxt6oyTpQcbnCWJwaZA2QBHEecC7c9FHTfigaTYR6JzgeFnTUkU=
X-Proofpoint-GUID: vbvGSyilNbhwd7_4cN1t7SKcBLjRZcQA
X-Proofpoint-ORIG-GUID: ubPfMsxgYK-5n6BsoyJt6Iw9xETmVYwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119500

--------------71vh7ZJsNa0vTsUpB801I5lL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58I1et6H2077915


On 9/18/25 10:02, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 2025-09-17 at 13:48 +0800, Zhang, Peng (Paul) (CN) via
> lists.openembedded.org wrote:
>> From: Zhang Peng<peng.zhang1.cn@windriver.com>
>>
>> CVE-2025-54350:
>> In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
>> failure and application exit upon a malformed authentication attempt.
>>
>> Reference:
>> [https://nvd.nist.gov/vuln/detail/CVE-2025-54350]
>>
>> Upstream patches:
>> [
>> https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c
>> 6df7934a]
> This seems to be affecting kirkstone and walnascar as well.

For *walnascar*, the CVE-2025-54349 patch has just been merged, so this=20
patch is now fully suitable.

For *kirkstone*, the iperf version is 3.14. This patch is suitable, but=20
CVE-2025-54349 patch has not been backported yet. It would make sense to=20
apply both patches together.

thanks very much.

//peng

>
> Thanks,
>
> Anuj
>
>> Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>
>> ---
>>   .../iperf3/iperf3/CVE-2025-54350.patch        | 39
>> +++++++++++++++++++
>>   .../recipes-benchmark/iperf3/iperf3_3.18.bb   |=C2=A0 1 +
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
>> 54350.patch
>>
>> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
>> 54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
>> 54350.patch
>> new file mode 100644
>> index 0000000000..e6de0e810c
>> --- /dev/null
>> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
>> @@ -0,0 +1,39 @@
>> +From 4cd6c8e85376a33bddd01fac143e27436d41f2b9 Mon Sep 17 00:00:00
>> 2001
>> +From: "Bruce A. Mah"<bmah@es.net>
>> +Date: Tue, 24 Jun 2025 15:58:21 -0700
>> +Subject: [PATCH] Prevent crash due to assertion failures on
>> malformed
>> + authentication attempt.
>> +
>> +Reported by Han Lee (Apple Information Security)
>> +CVE-2025-54350
>> +
>> +CVE: CVE-2025-54350
>> +Upstream-Status: Backport
>> [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e92
>> 8c6df7934a]
>> +Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>
>> +---
>> + src/iperf_auth.c | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/src/iperf_auth.c b/src/iperf_auth.c
>> +index 86b4eba..632f03d 100644
>> +--- a/src/iperf_auth.c
>> ++++ b/src/iperf_auth.c
>> +@@ -28,7 +28,6 @@
>> + #include "iperf_config.h"
>> +
>> + #include <string.h>
>> +-#include <assert.h>
>> + #include <time.h>
>> + #include <sys/types.h>
>> + /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration
>> */
>> +@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message,
>> unsigned char** buffer, size_t* length)
>> +
>> +     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use
>> newlines to flush buffer
>> +     *length =3D BIO_read(bio, *buffer, strlen(b64message));
>> +-    assert(*length =3D=3D decodeLen); //length should equal decodeLe=
n,
>> else something went horribly wrong
>> +     BIO_free_all(bio);
>> +
>> +     return (0); //success
>> +--
>> +2.50.0
>> +
>> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-
>> oe/recipes-benchmark/iperf3/iperf3_3.18.bb
>> index e96d5f084b..7fb2c52d08 100644
>> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
>> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
>> @@ -16,6 +16,7 @@ SRC_URI =3D
>> "git://github.com/esnet/iperf.git;branch=3Dmaster;protocol=3Dhttps \
>>              file://0002-Remove-pg-from-profile_CFLAGS.patch \
>>              file://0001-configure.ac-check-for-CPP-prog.patch \
>>              file://CVE-2025-54349.patch \
>> +file://CVE-2025-54350.patch \
>>             "
>>
>>   SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119478):
>> https://lists.openembedded.org/g/openembedded-devel/message/119478
>> Mute This Topic:https://lists.openembedded.org/mt/115286990/3616702
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
--------------71vh7ZJsNa0vTsUpB801I5lL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/18/25 10:02, Mittal, Anuj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bc48b4bd3497a5262d07c576e1036142f0bfa7d2.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Wed, 2025-09-17 at 13:48 +0800, Zhang, Peng (Paul) (CN) via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Zhang Peng <a class="moz-txt-link-rfc2396E" href="mailto:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>

CVE-2025-54350:
In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
failure and application exit upon a malformed authentication attempt.

Reference:
[<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2025-54350">https://nvd.nist.gov/vuln/detail/CVE-2025-54350</a>]

Upstream patches:
[
<a class="moz-txt-link-freetext" href="https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c">https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c</a>
6df7934a]
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This seems to be affecting kirkstone and walnascar as well.</pre>
    </blockquote>
    <p data-start="77" data-end="182">For <strong data-start="82" data-end="95">walnascar</strong>, the CVE-2025-54349 patch has
      just been merged, so this patch is now fully suitable.</p>
    <p data-start="184" data-end="356">For <strong data-start="188" data-end="201">kirkstone</strong>, the iperf version is 3.14.
      This patch is suitable, but CVE-2025-54349 patch has not been
      backported yet. It would make sense to apply both patches
      together.</p>
    <p>thanks very much. <br>
    </p>
    <p>//peng<br>
    </p>
    <blockquote type="cite" cite="mid:bc48b4bd3497a5262d07c576e1036142f0bfa7d2.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,

Anuj

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Zhang Peng <a class="moz-txt-link-rfc2396E" href="mailto:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 39
+++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |&nbsp; 1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-
54350.patch
new file mode 100644
index 0000000000..e6de0e810c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,39 @@
+From 4cd6c8e85376a33bddd01fac143e27436d41f2b9 Mon Sep 17 00:00:00
2001
+From: &quot;Bruce A. Mah&quot; <a class="moz-txt-link-rfc2396E" href="mailto:bmah@es.net">&lt;bmah@es.net&gt;</a>
+Date: Tue, 24 Jun 2025 15:58:21 -0700
+Subject: [PATCH] Prevent crash due to assertion failures on
malformed
+ authentication attempt.
+
+Reported by Han Lee (Apple Information Security)
+CVE-2025-54350
+
+CVE: CVE-2025-54350
+Upstream-Status: Backport
[<a class="moz-txt-link-freetext" href="https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e92">https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e92</a>
8c6df7934a]
+Signed-off-by: Zhang Peng <a class="moz-txt-link-rfc2396E" href="mailto:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 86b4eba..632f03d 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -28,7 +28,6 @@
+ #include &quot;iperf_config.h&quot;
+
+ #include &lt;string.h&gt;
+-#include &lt;assert.h&gt;
+ #include &lt;time.h&gt;
+ #include &lt;sys/types.h&gt;
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration
*/
+@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message,
unsigned char** buffer, size_t* length)
+
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use
newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen,
else something went horribly wrong
+     BIO_free_all(bio);
+
+     return (0); //success
+--
+2.50.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-
oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index e96d5f084b..7fb2c52d08 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -16,6 +16,7 @@ SRC_URI =
&quot;git://github.com/esnet/iperf.git;branch=master;protocol=https \
            <a class="moz-txt-link-freetext" href="file://0002-Remove-pg-from-profile_CFLAGS.patch">file://0002-Remove-pg-from-profile_CFLAGS.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-configure.ac-check-for-CPP-prog.patch">file://0001-configure.ac-check-for-CPP-prog.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-54349.patch">file://CVE-2025-54349.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2025-54350.patch">file://CVE-2025-54350.patch</a> \
           &quot;

 SRCREV = &quot;2a2984488d6de8f7a2d1f5938e03ca7be57e227c&quot;

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119478):
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/119478">https://lists.openembedded.org/g/openembedded-devel/message/119478</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115286990/3616702">https://lists.openembedded.org/mt/115286990/3616702</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe:
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [
<a class="moz-txt-link-abbreviated" href="mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------71vh7ZJsNa0vTsUpB801I5lL--

