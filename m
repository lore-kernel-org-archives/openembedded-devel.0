Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51196D49C71
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:57:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6019.1769759846109966151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pHjALOtk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64906aa8b1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U6haTv3933642
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:57:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Hc+HNh1MVF8Hj7NGQQYSwo
	Gfb/GAiRHgOAQxi3kYbCE=; b=pHjALOtkBg3YJIIKMr2rPG7RG8SWlohLcXNpIT
	c/hMV9AQUCf+UbDQn+/LC96qK0hMtVVnVrt0CyL5MISKdRWYl5j/EUghrOtGosUH
	jzMHwutao2w+Qb8m9NLvUfKNwouUvdiX+/Av7XwvyNncKeVGMnS13TCpQyy4whav
	ii87Iwks3nne2CA6Ea0LCRqfNWlUV/Omu0ojCQdMVyfcUK5lwbb8Og9toVlW0y/J
	in6xQuXZeD+SzlpRIjCZprL7KU3VyBYo/bK5i48P6XR/3JGEKIn7SqKs3fmq+TNg
	YIky7KT5vXqiFr97aqY0bIE890QfSEJZshj8PCDaI5iPk8GA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrj0sf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 23:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+OoBg9zBk/MeKtVbXfd00sA1LXbALgy6DzcLlz65hmFciUn8RL4jHaneyuOMCEvOkoezFpaXcRtwtQW18v3Lf9meJgG2ii/qKYLMhml02vkmf1XJBmFvtnTuV3GUPo6VdWNi+8/33QWX2LcOPwWRetnPnj5C7oxGHJSYzw/opZFsau2rfJN8kAdE2G9p4pTPVonkW5NR+m0rrqxgvr7Ga9XreMONO9I7dc4hkMiuhMsrJpGg2j3NYAyYVGGa4IyW8oz5KK7WBGHRAXHCl01u6xO8gWt6LPBf5LIoafBob8R1wP2thN1aUo72zBXnlZeuREnkxcRAbAh6LIEXjudGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc+HNh1MVF8Hj7NGQQYSwoGfb/GAiRHgOAQxi3kYbCE=;
 b=TNYMPKPdyZll8xBbaFSTDbrz3zNXYSyRQgrsj5n8zOlAVIcDK5/SlqUQYBf3HnYg9YvLPQTerwh1mRiAIPSxJ7sgtnoSvcPPxlqkZrLVsY0OywzlgpKpXcGB/W8njbK/x+eovW3ZPVq8u3m2U3834d0T2qx+wr2aeNZKnT1x+zuBeYPaSQhChqcAEz4rjwNWz/lsUaG2b7qIwTV2Z/fO1nnVMlRrFqV+N/nmVsadIGEfCwCE2IaRxYSgbvvXCpIKZnSjy7baoRIU6LTa+Hihz/Bm9h2C2+bJmn/ZIXZxHz1d8N+OGmHp3x4b6d9mh63KbxgyJ4SuQz0s3tupxCDVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 07:57:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 07:57:22 +0000
Content-Type: multipart/alternative;
 boundary="------------0wb1RT6NMNgZLYLoaERlXye7"
Message-ID: <4d870ca4-20ab-4cf3-b2d7-737cf26f0c3e@windriver.com>
Date: Fri, 30 Jan 2026 15:57:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] pavucontrol: update 5.0 -> 6.2
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20260107173104.211861-1-f_l_k@t-online.de>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <20260107173104.211861-1-f_l_k@t-online.de>
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: f593922f-4922-41b0-91cb-08de5fd532f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|7053199007|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDE3VzFQSHJXaGZDb1IxbFFqcHg1WnFNM21xR2hIOVRiNUErbTcrUVNQdnpi?=
 =?utf-8?B?SlBFMElPbzBReU1nMExOUEpKSXdTNmV4S0dHQ0d4Mi9xWHE1WHZVdmVzbVJI?=
 =?utf-8?B?dUl4L2tLMWozSDYzb3F6OGhQbkllQXBWYjF4NFRRSExMRFdSeUp6a2Y3NmJ5?=
 =?utf-8?B?M1UxZmVxVFhmaXdLd1JMa2tPcHZERjhacTk0ZGJLazd2VExjcVdCZEtFdGZ6?=
 =?utf-8?B?U1NsSHdLZUJQa3VjQW9BenAvaEZHMC9aWG8zcUxaZkxuQUh3eTNSNHBGa3Av?=
 =?utf-8?B?ZExTSWRmbytkV2syRzdKVU4zbGhNQ0F2QVQwa0FManRReElocitKRmxjb2Zr?=
 =?utf-8?B?bytaMStPWitIUjRvaXpKSHJ6bHF0R3Y5UkNZcUVrSmgvNllEM2I0YWhBcVQ3?=
 =?utf-8?B?S2FMblk3REtwcFZXNGxGUTRWS1lkNFlnaVMzdHczR0RPWEtPTEJCbE9mZVJX?=
 =?utf-8?B?eW1malVjL1RZQ1cxQlBLSW1Xc2xqMmMxZHNhZDRWTWJvSDZaMHZWNU9MR0tp?=
 =?utf-8?B?KzdTWHgwaWJOTmtzNnJ4Z213ZUxKclNGTE1vcEVuV3NBVVlLVUY3RkVpODRF?=
 =?utf-8?B?cm9tdGNFT0Q1amRuWUJRVjhBR3B5NU9SRFF1TW5sQmVaWmZEZ3JVRVQzV283?=
 =?utf-8?B?akx6NFp3UlRyUXpNUGdCYUp2Ym9nbmJScVozRXVySGtwRXg1SGN2Z3BLL2tL?=
 =?utf-8?B?V081WEp2ZWRCbFRxNW1TTDRwdm04ZU52aCt1YXJjQzhmc1phWk9LZ2x3WkVk?=
 =?utf-8?B?VS90SzhHcGxUZ21icTMybERmaHNLSGt4NXo5OTBhZU1ZTGNzMUV0bkxkNUMw?=
 =?utf-8?B?Tm5EOTZBOXhrTjlQb1U5bGZ2TlJPNHJQUjNsQVZlK2VkeGxvRCtJcXZ6eHFN?=
 =?utf-8?B?NzJYRVNnU2JtQkE5V014QWpSaG5KVy85MEQzV3k5aUh6UjMrK1d6bU1GNTJG?=
 =?utf-8?B?alhzWWJIK2N2OXRGNHZ4SmttUU9hYTJzMkJGak9HYk1GejBRcjdMaUxDS1l3?=
 =?utf-8?B?eDlHRDlTOTYyUGNRYTU0TVFyTHpoYzRNeVhIcWtXNXgySlFZUFVBS3owd2la?=
 =?utf-8?B?UjZ5YVpZdG5pdFd4NXRBbkI4T2FFRkZscEFjRjB2Szc3SFY0OHRkd05Ia1lF?=
 =?utf-8?B?WEhLWjJHRHBacFpnN2ZkdUZTMW0wUXhMdHdlOTlvQm5WbnFtcUVCTmVhM0h0?=
 =?utf-8?B?ME00TGJVdEhlWncrTXhaRkpJM09CMXplTjZMWmgrbEdhVUEvSGxvaS9FR1Ex?=
 =?utf-8?B?V0hwVGFmZk5IVCs3cjhiOW04SU4vR0wwSkh6c1RCcUVyY3JPVWhrcGhvazRw?=
 =?utf-8?B?YVhVYjRaQk9TdFpsUTZ5MXhpN3VkYTdaSXNiaC9DZHh2VHNxQWlTL29LblhN?=
 =?utf-8?B?b2RLbWE4c2F1eUVDZXRpeDE2QnRrcmV3aEVGSFlTbGYvTlU0QlhlUjFmTEpz?=
 =?utf-8?B?OUpzdWVGZTZQZWhnS1NKRy9VSFNCcU0zZTBFRE4vTjhJSkhHcFRnTzhYTzZQ?=
 =?utf-8?B?M2piUS9uZ0RCWnE2QThWTkhuL1ltZUJXSVBna1lZeUNlMWZkalU3QXpnNTVp?=
 =?utf-8?B?YnY3VXJJSGZNN0tnbDJNWUlMOCtGcDRnc3dSUEZtU2lqZnhXWU1yMWd3Y1Fr?=
 =?utf-8?B?K3Bqakd3MFlNYUY5bGVCZ0IydTJva3VFaGlzMlpRVkVDbjl4Z2ZnOVlXTVNR?=
 =?utf-8?B?MnpUK3orNzBXa0M0M1lhRndCbXF5VWdjam51QTh3OUFpbXhJZHdGbllqdXNj?=
 =?utf-8?B?aFRIRGJjbzBZVjBUNGpObW4rRnpjVzRBUXZvdTRNK1p2b2s2OTN4YTlndGda?=
 =?utf-8?B?a09uV2Z4ZituZ29yZ0toWU80Q0RLc3Bpdyt5a3N5USt6NGc5WjU0Wk80OG9G?=
 =?utf-8?B?QU4ybFJMV1FFanhQQmxhUzRsVzdoN2x0cmUySStJTGRPbUpyNFVBc0ovLzZx?=
 =?utf-8?B?SnRwREtSV0pOY2ZyeXBuTmNTaUdWdDlwTGZvUFdsd0FuU0Rxd3V6UmF0akJV?=
 =?utf-8?B?MkRSRmhWSmQ4TDRNd0hrS2FtcEFpVlAwVXEydFU2Y1JGSFVmK3NOeGhuR21q?=
 =?utf-8?B?SVk0OHpXSklENklsM3h0RXk3bXRlcnpqN09SQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(7053199007)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZE5zYjBlVktkMHFMb0V4bHUwZ2JaQ2dTbVU2K0Q2M21BR0pWREM0cklyTVpD?=
 =?utf-8?B?L1V5U3ZTS05JYkoxU1Y3bFd6YVNNWkVWbXBWYUU4Rzl3ckJaSDlHUzl4MVA1?=
 =?utf-8?B?QWUzTVhvYWF1S05Fc0c1RFF4Q3Brc2gyYklqYTlIaU80bVpiYXFTc09WdEtH?=
 =?utf-8?B?bGROSlMwK0pBRGRNcXRPdGJqbUkreHV5Nm42eG5wSjNVdUpib3MyV0NXdk5v?=
 =?utf-8?B?aFQ1THgrTW9mVG5Wa244RnMzWGIzTGlNZjR2Q0RMdFVGZUR3ME1KdUJJdkI4?=
 =?utf-8?B?QmgzRHRUMDF3WndJbEJQeHlSc2VtZUFLNm1tTW83Z3lTWEZlRUNjS1ptNEpG?=
 =?utf-8?B?T3pXWUlWZGk5dlZqRkFGRFhTT1JQQkhVc2c1V3lHeXhoRjNVeTBlM0VEaDdr?=
 =?utf-8?B?aUwzQWdEN28xalhjYzZvajZkcjVvak5mUzFIeWVMWk5BekN1L1M2TFpRazAv?=
 =?utf-8?B?Qk4zeHVpelJNMUZhOWxHWlVvMlBYZC8wZEh5ZEVQZVEzSlUvakdNRXRwZWtH?=
 =?utf-8?B?VWw5SnAxaVNhMnhYL3BNZ2k4NlN0aklQejI5Mm91N0xCdFF2SzVvZlRCWlBm?=
 =?utf-8?B?VnF0Z2UyT1k0cXQwMHA3c0RoK0RRV2Q3SFJKdEVqT01LUjRrOEhTaDVKRGRu?=
 =?utf-8?B?enpGVkdndEFsemc4Tko2THM1bXRtWm95TkNUQVdHb015WEVJdUdGZ0FUdWJx?=
 =?utf-8?B?b0N0UGppTVFhYTk5Y2FCNWJJaXhTSy9YOHp6d01Yekp1RU1RZHg0ZzB3WWRK?=
 =?utf-8?B?N3FLTkhUbTFyc29RM2YyV2xYSHhRaHNyMjF4akZ2dVFUTU9LRVBHa3pZeXlt?=
 =?utf-8?B?THF5RU1jek80eFQwb29yd1FCZmVVSDk5WkVuc0lkWHlPblFTSnliVkcxczF3?=
 =?utf-8?B?S2dnc0pSbWZ3cjUycVBvamxmeFlSRFhiR2VFc0VVR1BmL2tPY0J2VmhLRXBN?=
 =?utf-8?B?dG1CUGwyenRqYWprcTc0bHMrSjJ6ZlpQMzhhYlFuSGNJRFV6RU1HRytZU1J4?=
 =?utf-8?B?WXFvVVk3eWF2Z1E1U2hvM1h1TysyM2M2V0s0WTRvQnErRTJDeGJJNUF1dlRR?=
 =?utf-8?B?SlRoNjhjUDFnOGF3ZWU4V001NG5GbkF0SnVHN1lHQ3d3a3pqMU5nbGFnNFl4?=
 =?utf-8?B?MUxaZGVvTjlNUTFPNVZxcVJGKzQrSm1nbi96enFGM2pVcWw2ZG5ndzJoRldD?=
 =?utf-8?B?Y0VOSkY1Y09ZS0gxMFNncm9pZkNRQktpMVZLbUVObmdrdWxNb0kxcHRpdnBD?=
 =?utf-8?B?MUplcGIyTlBjZ3VSVmhKOWo0NmdXWmhrMHp5bDRMdkxvSXJIaG5ESFV6YkR0?=
 =?utf-8?B?amFIVUtyQUs0V0I1bCtnVkJ5eEhlZjNQNWhEcDhFdjF0VkJWckpBMzBYT05D?=
 =?utf-8?B?Rjdlb1lYVTRoMUZJcU5ib21JZHBSV2ZKaG1idktWNjVpRkxMeGpTY0creUhG?=
 =?utf-8?B?MC9DQ1hIZFBQVEVtdGVxWDZzSFA4Zm95cXdUaTl4bk5hQXlQQXcvNjhJTkNU?=
 =?utf-8?B?ek4xUDJqdVoxU1U5OEpUNWJPU2ZEZk51bUxpeFk4RWt4ZFhxNDR0ODQ5QzNu?=
 =?utf-8?B?S21pRkJTME4yYWRPNmcvbjUyRUZIK0FWWHZQRVBkNHp3TkhaNHFudVNQNGhI?=
 =?utf-8?B?bU1VZENaaE1iUUY5ZjBZZXVGVHl4UlZiR08vM1NnL2xOQkVzQ3pqd3Qwc3hG?=
 =?utf-8?B?cGgvYmNIYjVyUmlUdER4SnRVK1FZWndyeG9oR3ZjTmdLWWc3MG1KcnpESkUy?=
 =?utf-8?B?RkxxV05vSDY2ckRsYmZQL3hhSytuWTZ0SURNZWFIM3Nmb3BCK1hES1dBbHgr?=
 =?utf-8?B?T0lLR2N2OHNQMFBDaHNoWlFLYi9WMUlMVlQzSGdXajFNQTJNWC9zMStRcy90?=
 =?utf-8?B?Qy95Mk5vd0lIU3p1S3hOU3BsSXR0YWxWL0FQMlE3NTlUOEQ4RE5vVHhCN0Jn?=
 =?utf-8?B?NU5LZ1B4S29BYkJtTWdCdUsrL2ljbmQ5NkVSa2ZXMDhYQU1HVU16UFlGQmJi?=
 =?utf-8?B?U2RBbW83eDBmRThqcHdZVC91anBtZDNOYjFqZXJqVm01VXQraXZ1VlZraWtC?=
 =?utf-8?B?Q0ZTcnpuRVFyczVMYkZnazFOR2I3eGdPdnk4R0VzVVlFR1Y4aUVGeS9kNUFL?=
 =?utf-8?B?QlBodHE2VHl1bHp5ZTlDWDJXKy9ndE93ZmtTVjNLdXNQY3hSenpsT2RQZkpE?=
 =?utf-8?B?cmx0ekJVVng1bU9ZQnFLc05rSkVJSCt2VnkyWWEyNWplZ2tTQVArUVRBcU5w?=
 =?utf-8?B?dVcwVHZpb0VyL2REQytEQmpsWmQ4a2NPaHY5QytGbk5PT1pRNzRzMUVGMnZl?=
 =?utf-8?B?L2lnazdqemNOVDJFZUdpM3dhdVJnYVY0M05xaXJRSy84cGlDL1BWNEhoVHJN?=
 =?utf-8?Q?GEtXpGyzWGwHvPXg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f593922f-4922-41b0-91cb-08de5fd532f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:57:22.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkkuDqtxDvMv9uxlBaYU2D+Yux8E6HnKnB76MV4XaWg8rfIugv5Rxv85VIMR+aS7kKDg8YOGgD5qncfouqio05K8ZlBeutkeH6+suo+giGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: RCOhwL6wsqgb7Ww_Ucq74eea9uleGjMx
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697c6465 cx=c_pps
 a=ZPdQqRLVVCQ1wmWelBHSvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=03PB093ixkRWodV9TAwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=E3k6eB6KuMJFupH31GoA:9
 a=sqjoPa5V-CgzdWvP:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA2MSBTYWx0ZWRfX73EiGy9vDIuO
 sOJgPSc9dMRtD3WrNck4qubfVPumgwJ0s+yEzPHCCu2mWUwa9ayOuQHtkk5V6wC1e9auESUSqYb
 MC5N1/Ct0v/Rr5+YBc8lmr54lAf2EQN63pnW+xyMXwsF+yV0pdgWeDfF2gCrGCVpxLEA4oLTOUs
 eosJgZFtksttDzN7l1mWrBafEQZ3AGYwyywGhFjh09cQ1rXoDrMsWIDq4z1ilQVwMVzac6VN2dZ
 oHdAICxpSz3uu+57ph3yGZG9tQMx92QfaHAZmXXpRmwGa20qWf+DrI+QQzLzaug8LGlHTahnAhp
 HRTqlTnQqge9AhVBuKuFFjwX87Gu8OZ05YYBRuxyfuXl+WUE5DFBex7yKq2GPLFj7hI8W4myrQy
 8axBSe7Y7pdD7iBnUus4nuR/wfV+a5mmbSHP6x4ERuLVbTH6014lKg2/4wfFrTfag9GS1k+shz4
 wftrsVxZ4Vrz1raQpmA==
X-Proofpoint-GUID: QIlgYTMgt4212J5LkWI2_tMVqw7hjZVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124002

--------------0wb1RT6NMNgZLYLoaERlXye7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60U6haTv3933642


On 1/8/26 01:31, Markus Volk via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> - switch to meson buildsystem
> - pavucontrol now requires gtk4 and thus requires gpu acceleration
> - remove patch. Meanwhile libcanberra is optional and build doesn't
>    fail without anymore
> - pavucontrol was migrated from intltool to gettext
> - add packageconfigs for libcanberra and lynx to have both disabled
>    by default
>
> Signed-off-by: Markus Volk<f_l_k@t-online.de>
> ---
>   ...ucontrol-remove-canberra-gtk-support.patch | 112 -----------------=
-
>   .../pulseaudio/pavucontrol_5.0.bb             |  27 -----
>   .../pulseaudio/pavucontrol_6.2.bb             |  22 ++++
>   3 files changed, 22 insertions(+), 139 deletions(-)
>   delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/=
0001-pavucontrol-remove-canberra-gtk-support.patch
>   delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_=
5.0.bb
>   create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_=
6.2.bb
>
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pav=
ucontrol-remove-canberra-gtk-support.patch b/meta-oe/recipes-multimedia/p=
ulseaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
> deleted file mode 100644
> index 44169240c5..0000000000
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontro=
l-remove-canberra-gtk-support.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001
> -From: Markus Volk<f_l_k@t-online.de>
> -Date: Fri, 27 May 2022 18:37:53 +0200
> -Subject: [PATCH] pavucontrol: remove canberra-gtk support
> -
> -libcanberra-gtk3 module isn't buildable for wayland.
> -Remove its dpendency.
> -
> -Signed-off-by: Markus Volk<f_l_k@t-online.de>
> -
> -Upstream-Status: Inappropriate
> ----
> - configure.ac           |  2 +-
> - src/pavuapplication.cc |  2 --
> - src/pavucontrol.cc     |  4 ----
> - src/sinkwidget.cc      | 17 -----------------
> - 4 files changed, 1 insertion(+), 24 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 056ba5e..e857563 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL
> - AC_HEADER_STDC
> - AX_CXX_COMPILE_STDCXX_11
> -
> --PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 libcanber=
ra-gtk3 >=3D 0.16 json-glib-1.0 ])
> -+PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 json-glib=
-1.0 ])
> - AC_SUBST(GUILIBS_CFLAGS)
> - AC_SUBST(GUILIBS_LIBS)
> -
> -diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc
> -index 6773b53..60c016c 100644
> ---- a/src/pavuapplication.cc
> -+++ b/src/pavuapplication.cc
> -@@ -24,8 +24,6 @@
> -
> - #include "i18n.h"
> -
> --#include <canberra-gtk.h>
> --
> - #include "pavuapplication.h"
> - #include "pavucontrol.h"
> - #include "mainwindow.h"
> -diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc
> -index 18d5400..10ab646 100644
> ---- a/src/pavucontrol.cc
> -+++ b/src/pavucontrol.cc
> -@@ -29,8 +29,6 @@
> - #include <json-glib/json-glib.h>
> - #endif
> -
> --#include <canberra-gtk.h>
> --
> - #include "pavucontrol.h"
> - #include "i18n.h"
> - #include "minimalstreamwidget.h"
> -@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloo=
p *m, bool maximize, bool _ret
> -     tab_number =3D _tab_number;
> -     retry =3D _retry;
> -
> --    ca_context_set_driver(ca_gtk_context_get(), "pulse");
> --
> -     mainWindow =3D MainWindow::create(maximize);
> -
> -     api =3D pa_glib_mainloop_get_api(m);
> -diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc
> -index f30bd37..482fd1f 100644
> ---- a/src/sinkwidget.cc
> -+++ b/src/sinkwidget.cc
> -@@ -24,7 +24,6 @@
> -
> - #include "sinkwidget.h"
> -
> --#include <canberra-gtk.h>
> - #if HAVE_EXT_DEVICE_RESTORE_API
> - #  include <pulse/format.h>
> - #  include <pulse/ext-device-restore.h>
> -@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow* mainWin=
dow) {
> - void SinkWidget::executeVolumeUpdate() {
> -     pa_operation* o;
> -     char dev[64];
> --    int playing =3D 0;
> -
> -     if (!(o =3D pa_context_set_sink_volume_by_index(get_context(), in=
dex, &volume, NULL, NULL))) {
> -         show_error(_("pa_context_set_sink_volume_by_index() failed"))=
;
> -@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {
> -
> -     pa_operation_unref(o);
> -
> --    ca_context_playing(ca_gtk_context_get(), 2, &playing);
> --    if (playing)
> --        return;
> --
> -     snprintf(dev, sizeof(dev), "%lu", (unsigned long) index);
> --    ca_context_change_device(ca_gtk_context_get(), dev);
> --
> --    ca_gtk_play_for_widget(GTK_WIDGET(gobj()),
> --                           2,
> --                           CA_PROP_EVENT_DESCRIPTION, _("Volume Contr=
ol Feedback Sound"),
> --                           CA_PROP_EVENT_ID, "audio-volume-change",
> --                           CA_PROP_CANBERRA_CACHE_CONTROL, "permanent=
",
> --                           CA_PROP_CANBERRA_ENABLE, "1",
> --                           NULL);
> --
> --    ca_context_change_device(ca_gtk_context_get(), NULL);
> - }
> -
> - void SinkWidget::onMuteToggleButton() {
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb b=
/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
> deleted file mode 100644
> index 29500bdb94..0000000000
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "PulseAudio Volume Control (pavucontrol) is a simple G=
TK based volume control tool ("mixer") for the PulseAudio sound server."
> -HOMEPAGE =3D"https://freedesktop.org/software/pulseaudio/pavucontrol/"
> -SECTION =3D "x11/multimedia"
> -LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D751419260aa954499f7abaabaa88=
2bbe"
> -
> -# glib-2.0-native is required for glib-gettextize, which is used by th=
e
> -# AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated,=
 so the
> -# glib-2.0-native dependency may go away at some point (something to k=
eep in
> -# mind when doing version upgrades).
> -DEPENDS =3D "libxml-parser-perl-native intltool-native glib-2.0-native=
 gtkmm3 pulseaudio json-glib"
> -
> -inherit autotools features_check perlnative pkgconfig
> -
> -ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -
> -SRC_URI =3D"http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP=
}.tar.xz"
> -SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
, 'file://0001-pavucontrol-remove-canberra-gtk-support.patch', '', d)}"
> -
> -SRC_URI[sha256sum] =3D "ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a=
36d20536af2e8f4e7a"
> -
> -PACKAGECONFIG ??=3D"${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG[x11] =3D ",,libcanberra"
> -
> -EXTRA_OECONF =3D "--disable-lynx "
> -
> -RDEPENDS:${PN} +=3D "pulseaudio-server"
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b=
/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> new file mode 100644
> index 0000000000..b6b9a068a9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "PulseAudio Volume Control is a simple GTK based volume co=
ntrol tool for the PulseAudio sound server"
> +HOMEPAGE =3D"https://freedesktop.org/software/pulseaudio/pavucontrol/"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D751419260aa954499f7abaabaa88=
2bbe"
> +
> +DEPENDS =3D "gtkmm4 pulseaudio json-glib"
> +
> +inherit meson features_check pkgconfig gettext
> +
> +ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"

I met an issue,=C2=A0 when DISTRO_FEATURES opengl is enabled,=C2=A0 but x=
11 is not=20
enabled,

ERROR: Nothing PROVIDES 'gtkmm4' (but=20
/layers/meta-openembedded/meta-oe/recipes-multimedia/pulseaudio/pavucontr=
ol_6.2.bb=20
DEPENDS on or otherwise requires it) gtkmm4 was skipped: using DISTRO=20
'poky', which is missing required DISTRO_FEATURES: 'x11'

@Markus, could you help to have a look?

Regards
Changqing

> +
> +SRC_URI =3D"http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP=
}.tar.xz"
> +SRC_URI[sha256sum] =3D "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd=
90e89ed52fd4f15d32"
> +
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[audio-feedback] =3D "-Daudio-feedback=3Denabled,-Daudio-=
feedback=3Ddisabled,libcanberra"
> +PACKAGECONFIG[lynx] =3D "-Dlynx=3Denabled,-Dlynx=3Ddisabled,lynx"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> +RDEPENDS:${PN} +=3D "pulseaudio-server"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123226):https://lists.openembedded.org/g/openembedd=
ed-devel/message/123226
> Mute This Topic:https://lists.openembedded.org/mt/117138237/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------0wb1RT6NMNgZLYLoaERlXye7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/8/26 01:31, Markus Volk via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260107173104.211861-1-f_l_k@t-online.de">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

- switch to meson buildsystem
- pavucontrol now requires gtk4 and thus requires gpu acceleration
- remove patch. Meanwhile libcanberra is optional and build doesn't
  fail without anymore
- pavucontrol was migrated from intltool to gettext
- add packageconfigs for libcanberra and lynx to have both disabled
  by default

Signed-off-by: Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
---
 ...ucontrol-remove-canberra-gtk-support.patch | 112 ------------------
 .../pulseaudio/pavucontrol_5.0.bb             |  27 -----
 .../pulseaudio/pavucontrol_6.2.bb             |  22 ++++
 3 files changed, 22 insertions(+), 139 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
deleted file mode 100644
index 44169240c5..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001
-From: Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
-Date: Fri, 27 May 2022 18:37:53 +0200
-Subject: [PATCH] pavucontrol: remove canberra-gtk support
-
-libcanberra-gtk3 module isn't buildable for wayland.
-Remove its dpendency.
-
-Signed-off-by: Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
-
-Upstream-Status: Inappropriate
----
- configure.ac           |  2 +-
- src/pavuapplication.cc |  2 --
- src/pavucontrol.cc     |  4 ----
- src/sinkwidget.cc      | 17 -----------------
- 4 files changed, 1 insertion(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 056ba5e..e857563 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL
- AC_HEADER_STDC
- AX_CXX_COMPILE_STDCXX_11
-
--PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 &gt;= 3.22 sigc++-2.0 libcanberra-gtk3 &gt;= 0.16 json-glib-1.0 ])
-+PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 &gt;= 3.22 sigc++-2.0 json-glib-1.0 ])
- AC_SUBST(GUILIBS_CFLAGS)
- AC_SUBST(GUILIBS_LIBS)
-
-diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc
-index 6773b53..60c016c 100644
---- a/src/pavuapplication.cc
-+++ b/src/pavuapplication.cc
-@@ -24,8 +24,6 @@
-
- #include &quot;i18n.h&quot;
-
--#include &lt;canberra-gtk.h&gt;
--
- #include &quot;pavuapplication.h&quot;
- #include &quot;pavucontrol.h&quot;
- #include &quot;mainwindow.h&quot;
-diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc
-index 18d5400..10ab646 100644
---- a/src/pavucontrol.cc
-+++ b/src/pavucontrol.cc
-@@ -29,8 +29,6 @@
- #include &lt;json-glib/json-glib.h&gt;
- #endif
-
--#include &lt;canberra-gtk.h&gt;
--
- #include &quot;pavucontrol.h&quot;
- #include &quot;i18n.h&quot;
- #include &quot;minimalstreamwidget.h&quot;
-@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloop *m, bool maximize, bool _ret
-     tab_number = _tab_number;
-     retry = _retry;
-
--    ca_context_set_driver(ca_gtk_context_get(), &quot;pulse&quot;);
--
-     mainWindow = MainWindow::create(maximize);
-
-     api = pa_glib_mainloop_get_api(m);
-diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc
-index f30bd37..482fd1f 100644
---- a/src/sinkwidget.cc
-+++ b/src/sinkwidget.cc
-@@ -24,7 +24,6 @@
-
- #include &quot;sinkwidget.h&quot;
-
--#include &lt;canberra-gtk.h&gt;
- #if HAVE_EXT_DEVICE_RESTORE_API
- #  include &lt;pulse/format.h&gt;
- #  include &lt;pulse/ext-device-restore.h&gt;
-@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow* mainWindow) {
- void SinkWidget::executeVolumeUpdate() {
-     pa_operation* o;
-     char dev[64];
--    int playing = 0;
-
-     if (!(o = pa_context_set_sink_volume_by_index(get_context(), index, &amp;volume, NULL, NULL))) {
-         show_error(_(&quot;pa_context_set_sink_volume_by_index() failed&quot;));
-@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {
-
-     pa_operation_unref(o);
-
--    ca_context_playing(ca_gtk_context_get(), 2, &amp;playing);
--    if (playing)
--        return;
--
-     snprintf(dev, sizeof(dev), &quot;%lu&quot;, (unsigned long) index);
--    ca_context_change_device(ca_gtk_context_get(), dev);
--
--    ca_gtk_play_for_widget(GTK_WIDGET(gobj()),
--                           2,
--                           CA_PROP_EVENT_DESCRIPTION, _(&quot;Volume Control Feedback Sound&quot;),
--                           CA_PROP_EVENT_ID, &quot;audio-volume-change&quot;,
--                           CA_PROP_CANBERRA_CACHE_CONTROL, &quot;permanent&quot;,
--                           CA_PROP_CANBERRA_ENABLE, &quot;1&quot;,
--                           NULL);
--
--    ca_context_change_device(ca_gtk_context_get(), NULL);
- }
-
- void SinkWidget::onMuteToggleButton() {
---
-2.25.1
-
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
deleted file mode 100644
index 29500bdb94..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = &quot;PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool (&quot;mixer&quot;) for the PulseAudio sound server.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://freedesktop.org/software/pulseaudio/pavucontrol/">&quot;https://freedesktop.org/software/pulseaudio/pavucontrol/&quot;</a>
-SECTION = &quot;x11/multimedia&quot;
-LICENSE = &quot;GPL-2.0-or-later&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe">&quot;file://LICENSE;md5=751419260aa954499f7abaabaa882bbe&quot;</a>
-
-# glib-2.0-native is required for glib-gettextize, which is used by the
-# AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated, so the
-# glib-2.0-native dependency may go away at some point (something to keep in
-# mind when doing version upgrades).
-DEPENDS = &quot;libxml-parser-perl-native intltool-native glib-2.0-native gtkmm3 pulseaudio json-glib&quot;
-
-inherit autotools features_check perlnative pkgconfig
-
-ANY_OF_DISTRO_FEATURES = &quot;${GTK3DISTROFEATURES}&quot;
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz">&quot;http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz&quot;</a>
-SRC_URI:append = &quot; ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '<a class="moz-txt-link-freetext" href="file://0001-pavucontrol-remove-canberra-gtk-support.patch">file://0001-pavucontrol-remove-canberra-gtk-support.patch</a>', '', d)}&quot;
-
-SRC_URI[sha256sum] = &quot;ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a36d20536af2e8f4e7a&quot;
-
-PACKAGECONFIG ??= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.filter('DISTRO_FEATURES','x11',d)}">&quot;${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}&quot;</a>
-PACKAGECONFIG[x11] = &quot;,,libcanberra&quot;
-
-EXTRA_OECONF = &quot;--disable-lynx &quot;
-
-RDEPENDS:${PN} += &quot;pulseaudio-server&quot;
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
new file mode 100644
index 0000000000..b6b9a068a9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = &quot;PulseAudio Volume Control is a simple GTK based volume control tool for the PulseAudio sound server&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://freedesktop.org/software/pulseaudio/pavucontrol/">&quot;https://freedesktop.org/software/pulseaudio/pavucontrol/&quot;</a>
+SECTION = &quot;multimedia&quot;
+LICENSE = &quot;GPL-2.0-or-later&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe">&quot;file://LICENSE;md5=751419260aa954499f7abaabaa882bbe&quot;</a>
+
+DEPENDS = &quot;gtkmm4 pulseaudio json-glib&quot;
+
+inherit meson features_check pkgconfig gettext
+
+ANY_OF_DISTRO_FEATURES = &quot;opengl vulkan&quot;</pre>
    </blockquote>
    <p>I met an issue,&nbsp; when <span style="white-space: pre-wrap">DISTRO_FEATURES</span>
      opengl is enabled,&nbsp; but x11 is not enabled, <br>
    </p>
    <p>ERROR: Nothing PROVIDES 'gtkmm4' (but
/layers/meta-openembedded/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
      DEPENDS on or otherwise requires it)
      gtkmm4 was skipped: using DISTRO 'poky', which is missing required
      DISTRO_FEATURES: 'x11'</p>
    <p>@<span style="white-space: pre-wrap">Markus,  could you help to have a look?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <pre wrap="" class="moz-quote-pre">Regards
Changqing
</pre>
    <blockquote type="cite" cite="mid:20260107173104.211861-1-f_l_k@t-online.de">
      <pre wrap="" class="moz-quote-pre">
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz">&quot;http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz&quot;</a>
+SRC_URI[sha256sum] = &quot;e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32&quot;
+
+PACKAGECONFIG ?= &quot;&quot;
+PACKAGECONFIG[audio-feedback] = &quot;-Daudio-feedback=enabled,-Daudio-feedback=disabled,libcanberra&quot;
+PACKAGECONFIG[lynx] = &quot;-Dlynx=enabled,-Dlynx=disabled,lynx&quot;
+
+FILES:${PN} += &quot;${datadir}&quot;
+
+RDEPENDS:${PN} += &quot;pulseaudio-server&quot;
--
2.52.0

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123226): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/123226">https://lists.openembedded.org/g/openembedded-devel/message/123226</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117138237/3616873">https://lists.openembedded.org/mt/117138237/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0wb1RT6NMNgZLYLoaERlXye7--

