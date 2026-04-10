Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCFDF36BBA
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:35:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150557.1775802904007911437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bk/hq7Ap;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4OUAh2642364
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 23:35:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=OJh0x6jWT6ZCifHS0DrfYb1rQOXR5V9Pp/Hp/LOrcDs=; b=bk/hq7ApU/EK
	nvhuc3h0/0dfvxGOohitarTqLsh3FFFLtYLSf6TnJ+YIXbDM5J8xJehcapI6CClq
	qifsrJSRCsumbaLfXaiaVKipKSES939N2bMhYdCUeOZCug6K7dtWcLa6qiWL8C/k
	Zr4+ACnyvdiya1HzWm6Psgk0+2hH6mNnvcCHnmTZ68JAcajr+w6MBNI91Ztx2TZw
	vXQN9tmMgiwMeR8HxO7HTZbUtNCPJuVbpY+J3cogYOjSQhW3prBwrcq8mAwDgEJI
	1Ka+a9lT8lTy6G6obT7Kvb9oYwop3yj4pr0girlhxqvG19Euqi7KbghM90yu3Yu0
	2XjpmEm7OA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryn3pu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 23:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO8AlyrySTxdC6V4ZNjz8UhoWPBKb8QtG/xu5YxljpDTaxOJsh6iT06paiXdl7eIFG1DhPLQLKXBsNNe0L1BbHmp2tl/E5or8NjUycYiIg5xE35OqK8rSj+xjuu9N1X2ZQbsHwtsWVR0oFz8MxacLUeSrf6FbDzhHF/4VL8fRvZVxmSxPdMwDdp0n6Ox/YZ3NJcS9+bqAMY8+HOuL54NqXfsNdjNd7HTMO78bvdCKsV7ZW75iZ5x1dMjyk+VGvznEm/S8V1w+w3/9ZUJpn9WFtBcmeLztBIQAcjMMsmsWZegbx7EYQCl2NQ6ZCI2umK6wsYKkEnRBMF8x66XvRLlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJh0x6jWT6ZCifHS0DrfYb1rQOXR5V9Pp/Hp/LOrcDs=;
 b=EkfSs+Qo+4++a7XeYLwX3Gj1PTLTDuPzsmBreXiLbhlYsOJSF0uYUTwG1HQPvzEhyk8Hcv8lEWJ8PTP56AIJ4r80N+6puMRFiqZ9Qm0c3j1MNKetKZUKfrp1coTrnNdtzWCmodJ5eWgN9K1Fp5S7HPPT1AZwovgskd/H4QKzq9s0zHARNLExuME/tARCTnPuU3Mvlhq0FmNRW4krqNGzaQNZE14KZMO7TnXVndwnQEJ4Lo5yTRK9wea7hnyl9DHor5vtqlbJd5Q/7Qz7vxTR9J/G6JmvG1scM+IMzf95WjCRMGLhOqvubXWqyRauepJcTDstVECYMUkVZ3FZDy/tcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DS4PPFD24E991EC.namprd11.prod.outlook.com (2603:10b6:f:fc02::52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 10 Apr
 2026 06:34:59 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::adfa:78c6:5522:cd26]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::adfa:78c6:5522:cd26%6]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 06:34:59 +0000
Message-ID: <a245029c-c726-4174-b841-9e4617ad5b9d@windriver.com>
Date: Fri, 10 Apr 2026 14:34:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 11/11] nmap: rename enum
 PCAP_SOCKET
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
 <20260409061904.1694992-12-jinfeng.wang.cn@windriver.com>
 <61a5591b-f7f8-4209-ad6b-cbb63d8bddcf@gmail.com>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <61a5591b-f7f8-4209-ad6b-cbb63d8bddcf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DS4PPFD24E991EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9a7e7a-f563-468c-88f3-08de96cb49de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	sYM/b8xDhdxvjgTZ4AoJPCDuvJFz7tXFGxFCYp2kpox3t+F9PDqEsFRvxn4GFeiFK3WVmRuVMRoGSxuEDAcLP/TNmoTQVr8t/UyVsqC1ZyZihdMyCgwvJIB96BWEa8nddTqICmqSupp9rnnYPe57UsH3bILmwmD2SUJKxQbc0vPrEbqydctvWrlo+bIrC5a0tuWG2sDEC/hMS9nvtdSQYvbipG+h1HKlD68t+JvPZxIqtwrQOvYfZ0bBMkmj7srsgXxiFORJbWHUbeVLAuDQA2Bvo3+jMc2hIgejrLv6US5BguN3TXHmXTdyffj+JBf1M/psdnXnHztEcvno/uDnoa3nSEwFpulR6Exp2hnP66n2GUCBkkF+7Fkw8xGltLJdVYllymsWRx3deADmEsflz8Ohkm2NrX+cexZNdT32ne2Tc9TZR2EyYAGn9yJw8xz2h0vtH/AMc2TvAnHZlRCQcgvw3FuMOau5Smh0Cr7KOY9S2GqpzULjF94gw95wfjUQ7a8YlImDJTAjiS1RIbliU2XxfsyioH2qRiQjdAsztTYXiByJd8p74L97pBgaMwSE3J/B9TT6kjJ0ZXEBVBu0LInUjJAvMuQhbJpAFBaLjxJOs2uH7jlLSIfXouwOxuXEaK/ZSGNiPKruHrG/xOTSE3OXqvQQ3Nh5+xRmhz3cCbcF0+47LtgSMefglAAXZKeE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3U0MlhiMWt2cHlEY1hpYUk5SVBSSmF5UkUwd0dkSFYzN0dCd2JlYjB2amZD?=
 =?utf-8?B?bHErNWF4Z0dSV1pTVmthZ3N3VGV6VGxReTQwUndRUnZGQmlBODA4V0YwWUps?=
 =?utf-8?B?STdodWdwd3ZQZDc5ZUN2ajZ5ZlZhSWRDTVk4WDcrWDUwSFlEdnk0UlBMLzNQ?=
 =?utf-8?B?U29lZjZIems2OCs5aU1yRXlyaFRScVZ3eWhlYmQxaEdmZkc0UDV6TEFvTy83?=
 =?utf-8?B?VlRhTS9oSlBCWEFlV2NHVUhzS295S2kxQzU3akd1czg0ZnRCRWhrRHo3eTlh?=
 =?utf-8?B?cHUyNWd4U3oxSDlhSmhVcnJTc0t3K1lDemhXSm94NnpjZlFpUXJXT0tvSkRR?=
 =?utf-8?B?bXdCbEdMNGd6SzBWN2lOK01hOFhmMWttb1o4c3VDL1FWYkN0VkRoTFZ5UFo2?=
 =?utf-8?B?VmdCbWlYMHQwZ29BUmdtajZ1TW9ETjBKa3hmQjBOeFgweEJyTG9ZbXIzKzQ2?=
 =?utf-8?B?OXVTUTFzak8vZG8rL3NiS0VJYVI4eFlVdXZNZWIzM1pjNVdxU2o5NFJGblhk?=
 =?utf-8?B?SitxdnR4eWoxVHFWczZKV0Nadm9KUm93OU5RMkxVNnJBQmJHbDF2SWdJT2Er?=
 =?utf-8?B?MFJsT25FelJHTnBBdHJLanFnNEQrV1NHS2VPanBJZk1XT2RRRk1YWXRraGRw?=
 =?utf-8?B?ZmlMOTRDRjNUZit4S1R2amwxTnlzWTZyeGl1VUY1SnNGaFBzOUpUTDZpTGtS?=
 =?utf-8?B?dzd1cFRIeno2TXM3Z1NxV0o1WitibFhNODFzQTVmY3Zwdy83YlJrL0JwU1JB?=
 =?utf-8?B?cmJUZWFENkxTSkJleUk1bHJMQlJTVUpEL3JvQWZIUnNVRFJsSTdwTGNLaTJB?=
 =?utf-8?B?UjU4bE1pUWM4LzJicERHdVErMTRHMlc2K0tuQ3RGWHdnaDhIekhLZ1dXbCs2?=
 =?utf-8?B?aFdzQU9pN09xWngxazBTejd0M01oSmhGS0pQbENjMkVsb2k5WDQyMnpFckI4?=
 =?utf-8?B?QXVkdzBxOFpXWlBDWVZjT0o4ekFnNFJCK3QyNGRCTW1CcEZENHhxNW5pamFI?=
 =?utf-8?B?Tk1oallzSFhPM1N4TFM4M1JhcHlydXBiRGdVOTcxNG4xWFhEZGZTc0tYYlUw?=
 =?utf-8?B?QUpvVDc3KzFzTXJ1amhzZ25Ea3dhUGM5RE5YcWxIcUNiVVYzdjdQWjlENldM?=
 =?utf-8?B?eEpJRGxjeHEvWmxCTmEvUDI4WXRGQ0ZxbVdzRTEwZnA3WDhDSWltWUx5d1ZJ?=
 =?utf-8?B?R05tQTlBQmgwOXJYSnFmTVdsM0tYNTV1VWlaak4ydGhFQTljR29uNmFtc1dC?=
 =?utf-8?B?dE1hRjZvZjZHVUxrN2M5NEJXbytreXVSaXloYkdjaEdiMVliemdWRlR0TjRq?=
 =?utf-8?B?ejJUbC9KU3NDLzh4SkZhMFZTQUlXSElhMHVSYno5Mkt2dnRpNGNOLzFTYlNH?=
 =?utf-8?B?TzhrTzBvSk5uMU0wKzVvM25adGo5UlB2Q1BFUVBiOXJoY1hsQ2NzTkhraE9T?=
 =?utf-8?B?Rm82QnMwZ1JYVUpUUDdSODBCL0ZQbzFGR0dQK01hL1g0VnFVUFN2ZHEwOXpy?=
 =?utf-8?B?YmFVbFZoWGt6ZldJbUJPeWxwOXhQQjVPaTVzWnNnTTROY2pRbGZxYnNGck5D?=
 =?utf-8?B?Y1BYaTZaZ0VIWUY2OXRxUDdrdkk2cTlHS2o5Q2I0WUhmZ2g2aFdQaFdrQUdr?=
 =?utf-8?B?QnBkR1hlcE5WWWpQWHlUWE1yQ2pmQkxpanJKMVRTNXBLR1d6OEFQUkE1U2ZC?=
 =?utf-8?B?eURSQUc4QjI4Q0YxTFlURHRNbFBMV1U1VFc3cjZYcTVPeG16dXBnZHFUZm9z?=
 =?utf-8?B?UUt2ZW1tdlY1TDdwNEF4UjZpVnVMdjBuNlVNTDFQZmtUZnBpeTV6R004VVRN?=
 =?utf-8?B?aWZMcXZRN3JyS09oeVBvQ09LQTVUcHpxSU5DS0V0VnhzcHdsYzJab3haYXpS?=
 =?utf-8?B?MmRMSE94ZUpsSjVTbUF3Rnd1N2JIRlc5dVYrQ2o0dlkrb2E2dWtGSjc1TmVl?=
 =?utf-8?B?NUVzSnk2UFZnb0E4R1Q3OVRCT1A4MnhHYlM2T3NQRjZrMHhOeGxQWDcwdmhn?=
 =?utf-8?B?Wmk5Z2M5WUF3U3QyMit6TnlieHlwK3UrSkFCWW1LdE5Vd0YvWjhqaE5LRWw2?=
 =?utf-8?B?ejN5NTZDU0ovV3ZrZ0pDMFhBT00rOEszTE5LdmxqVVhuSmt1a01mQW9nL203?=
 =?utf-8?B?RzdmenRNeTJHeGY1Tk5nSXdld2pvd3dXMTRHeHpQa2s2ZFNEVGpQK3RmbXZC?=
 =?utf-8?B?ekhQUVZoYllXM1lHamg5ZGxCbVRYQ0dVdStLNmh4d0NsVkFBNnpuMllUWDZF?=
 =?utf-8?B?Uk1EelUzZHhzalFObmlZRi8wQTdMUldRQlF1dGF6WTd4WmRobytIQ2ZGbXQ3?=
 =?utf-8?B?VHpOemx2VDA5SXpiRmJUTGh1bmprZEcvZmlCaGdJblNsSHdNcWlMVHdTRkZX?=
 =?utf-8?Q?kB4UpkT7W9W7YAmE=3D?=
X-Exchange-RoutingPolicyChecked: 
	bWrsIEVXN7hqzBKV9LUcY6HPzD2kixxhAh9rtgQIiA9Gv7zMHsTXDoY/wX4cp89Vb+lKVIVq/3GFAJjNL+U6g61viTdW/ud8vkLxtGPA8EhtpdqgBnQjPQWPh4V6YNSpxqH7Zrqzmok99VX0Gwe0VLxy5w/PxOe5FdAglhCYTnyOVLvryrpijo2aTJVP4m4r6nsN1rlQ+ptzAZjNtjkiuhXl0Y/wpMKfC6r6G34+iMATsEyvGtVZ71NEfrQSPUWL3OKmok4xrymc7P9OR3DZ3OXRhe5HG94Jl+BW9oGFowxr55vet/0LcqDDW3nr3mRxGDFbSly3RcIO7SbonuCM0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9a7e7a-f563-468c-88f3-08de96cb49de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 06:34:59.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDkz48IAs46cxX1aKd2INNv/ZOZc5UflvjRzBGbJJN36BLmO/BeogWylvs4r3p51GRYuy9ilvU20zWY0bOECv+w/9miZd4LyuIaMH0a/5BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD24E991EC
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KNGFIglsoaonHFFSAJpkpeOYV7Kes8kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1OSBTYWx0ZWRfX3wjHWfu/Nxpb
 isQlPAoXbfRF2qGAf2zT96vIvY0361VMFINOCRFSoETBg4PqdOOP0Pvzb+iftJoAN99XK57MO7w
 o0AxKuWWvlFe/E9uDHmj8JvQL/Rt7da4feWADqqmNlvgEk4tL+WUhy3J+0bO6w3E5/0VtEjuCGi
 KcLWAXxEHxq4GVFbt4/32IwHI/5iXuZ4llIAHyNA82NweoRuBoemr6ksVhAwOgNkMIf2Twzuvbm
 k63yd6BvLyTGJP75LVXsNfgsYcpFfB6yxs1M1LMwBCuBR6lWokYMKEfELJOYysuFd5pOC4OV+sk
 C5Q1fq023Hd/gKuH48J8e4pjcBNF0Rxp0z6NQhV5aaZ3iGkSjZHP3jKBg7AF2NLv0RmTQixSS9j
 A6KY4ebTY72KYWVBhghQhWTQbV0GTAfzadv+5Hq0O0u3AA9PmqMwPp12GCm3dj1VwJfhumLgV/e
 x1Eh74wc8Y5fwdDJ0jw==
X-Proofpoint-GUID: zTcFd3CmsvzPJ_3TTCbMOw-KLGKjva5O
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d89a17 cx=c_pps
 a=25083kmBgh9d5ln0vqlIEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=auHYCxwYAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Otl4QTzZrjsg54ptiP4A:9 a=QEXdDO2ut3YA:10 a=67XU6oJk2Lrwzah0vfu5:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126216


On 4/9/2026 5:40 PM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> This can become messy, because the layer revisions are not tied to each
> other (sure, there are recommendations, but not enforced). Yocto testing
> happens usually with a 1-2 weeks old meta-oe, which would mean that this
> recipe would be broken until the release of Yocto - also, it would be
> the broken when used an older Yocto Scarthgap versions.
>
> What if this patch would be extended, handling both the new and old
> versions at the same time? I'm thinking about ifdefs, something like
>
> #ifdef PCAP_SOCKET
>    NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> #else
>    PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> #endif
>
> (at all other relevant places also)
>
> That way it wouldn't have to be an optional patch, and it wouldn't break
> the recipe - at the worst case it would be just unnecessary (if the
> oe-core counterpart is rejected).
>
Thanks for the suggestion. I will update the patch and send v2.

Jinfeng

>
> On 4/9/26 08:19, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to build nmap after upgrade libpcap to 1.10.6 which defines the
>> macro PCAP_SOCKET already. Rename the enum PCAP_SOCKET to NM_PCAP_SOCKET
>> for nmap to make it work with libpcap 1.10.6.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> ---
>>   .../files/nmap-rename-enum-PCAP_SOCKET.patch  | 86 +++++++++++++++++++
>>   meta-oe/recipes-security/nmap/nmap_7.80.bb    |  1 +
>>   2 files changed, 87 insertions(+)
>>   create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
>>
>> diff --git a/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
>> new file mode 100644
>> index 0000000000..e6bf26ebb6
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
>> @@ -0,0 +1,86 @@
>> +The enum PCAP_SOCKET conflicts with the one from libpcap 1.10.6 and fails to
>> +compile:
>> +
>> +In file included from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap/pcap.h:130,
>> +                 from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap.h:43,
>> +                 from tcpip.h:140,
>> +                 from nse_nsock.cc:4:
>> +nse_nsock.cc:36:3: error: expected identifier before 'int'
>> +   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
>> +      |   ^~~~~~~~~~~
>> +nse_nsock.cc:36:3: error: expected '}' before 'int'
>> +nse_nsock.cc:33:6: note: to match this '{'
>> +   33 | enum {
>> +      |      ^
>> +nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
>> +   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
>> +      |               ^
>> +nse_nsock.cc:40:1: error: expected declaration before '}' token
>> +   40 | };
>> +      | ^
>> +
>> +The enum PCAP_SOCKET is removed in nmap later version. But the removal commit
>> +involves extra logic change, so just rename the enum PCAP_SOCKET to
>> +NM_PCAP_SOCKET to make it work with libpcap 1.10.6.
>> +
>> +Upstream-Status: Inappropriate [local fix to work with libpcap 1.10.6]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + nse_nsock.cc | 12 ++++++------
>> + 1 file changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/nse_nsock.cc b/nse_nsock.cc
>> +index df98666..9cecac6 100644
>> +--- a/nse_nsock.cc
>> ++++ b/nse_nsock.cc
>> +@@ -33,7 +33,7 @@
>> + enum {
>> +   NSOCK_POOL = lua_upvalueindex(1),
>> +   NSOCK_SOCKET = lua_upvalueindex(2), /* nsock socket metatable */
>> +-  PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
>> ++  NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
>> +   THREAD_SOCKETS = lua_upvalueindex(4), /* <Thread, Table of Sockets (keys)> */
>> +   CONNECT_WAITING = lua_upvalueindex(5), /* Threads waiting to lock */
>> +   KEY_PCAP = lua_upvalueindex(6) /* Keys to pcap sockets */
>> +@@ -959,7 +959,7 @@ static int nsock_gc (lua_State *L)
>> + }
>> +
>> +
>> +-/****************** PCAP_SOCKET ***********************************************/
>> ++/****************** NM_PCAP_SOCKET ***********************************************/
>> +
>> + static void dnet_to_pcap_device_name (lua_State *L, const char *device)
>> + {
>> +@@ -1026,7 +1026,7 @@ static int l_pcap_open (lua_State *L)
>> +       nsock_iod_delete(*nsiod, NSOCK_PENDING_ERROR);
>> +       luaL_error(L, "can't open pcap reader on %s", device);
>> +     }
>> +-    lua_pushvalue(L, PCAP_SOCKET);
>> ++    lua_pushvalue(L, NM_PCAP_SOCKET);
>> +     lua_setmetatable(L, -2);
>> +     lua_pushvalue(L, 7); /* the pcap socket key */
>> +     lua_pushvalue(L, -2); /* the pcap socket nsiod */
>> +@@ -1134,7 +1134,7 @@ LUALIB_API int luaopen_nsock (lua_State *L)
>> +   /* library upvalues */
>> +   nsock_pool nsp = new_pool(L); /* NSOCK_POOL */
>> +   lua_newtable(L); /* NSOCK_SOCKET */
>> +-  lua_newtable(L); /* PCAP_SOCKET */
>> ++  lua_newtable(L); /* NM_PCAP_SOCKET */
>> +   nseU_weaktable(L, 0, MAX_PARALLELISM, "k"); /* THREAD_SOCKETS */
>> +   nseU_weaktable(L, 0, 1000, "k"); /* CONNECT_WAITING */
>> +   nseU_weaktable(L, 0, 0, "v"); /* KEY_PCAP */
>> +@@ -1154,11 +1154,11 @@ LUALIB_API int luaopen_nsock (lua_State *L)
>> +   lua_pop(L, 1); /* NSOCK_SOCKET */
>> +
>> +   /* Create the nsock pcap metatable */
>> +-  lua_pushvalue(L, top+3); /* PCAP_SOCKET */
>> ++  lua_pushvalue(L, top+3); /* NM_PCAP_SOCKET */
>> +   for (i = top+1; i <= top+nupvals; i++) lua_pushvalue(L, i);
>> +   lua_pushcclosure(L, pcap_gc, nupvals);
>> +   lua_setfield(L, top+3, "__gc");
>> +-  lua_pop(L, 1); /* PCAP_SOCKET */
>> ++  lua_pop(L, 1); /* NM_PCAP_SOCKET */
>> +
>> + #if HAVE_OPENSSL
>> +   /* Set up the SSL certificate userdata code in nse_ssl_cert.cc. */
>> diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
>> index f9fe82a91d..18b1a50246 100644
>> --- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
>> +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
>> @@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
>>              file://0002-Fix-building-with-libc.patch \
>>              file://0001-Make-ndiff-support-python3.patch \
>>              file://0001-configure.ac-make-ndiff-depend-on-python3.patch \
>> +           file://nmap-rename-enum-PCAP_SOCKET.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126122): https://lists.openembedded.org/g/openembedded-devel/message/126122
>> Mute This Topic: https://lists.openembedded.org/mt/118738443/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

