Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187F8C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:17:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9538.1741853860500139204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51675baf6d=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7BF9r019120
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 01:17:40 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4spkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 01:17:39 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52D8Hduu020106;
	Thu, 13 Mar 2025 01:17:39 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4spkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 01:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhBXXy/rQ+Sk0VukV2v8uV/E2abdv0cWEjMLLDMuOYzG9fSTspOoEiuV59CKJHI9cTYhsNazB1pKOMDWQewOKqOqLEiA9UjXCoM53gQ4TX0D5wr6yi5P1Lxvp2A472DNRzwTvz69eZjKO/BbHpPvI2yO+9m0zHvYbuaibD444WyXH7954Bppe9R6q0rlgLT/kXcRQe1/RZunniYjDHVVisOkfqIt+6AXxqi1+r2JC07E8kHggT8086dmlPqK5o65V1I5OVuH217+cvc6sxu0Vk1uSWtP5xtRqwX18Dv8kK0h/jWVIWvsLfjvmVZhnqXZ+Th4y/amBdmQJqA8kbGXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P080c27fZXoPTPvitH0NuztWT1f1QSygANCtzsq5c9A=;
 b=Wutp+d1vF6pl5efXUwJyimsGxGLpIqLpcoPP5vc22zd7qmD2f7RTxEVcNC2PNu/ZwW1W3F5eAG8XdBPJ1TF0an+kHBwKf5mvtZXDJzMqLbAKRc3sGAHmUKORUkgTecdCfwesTgMU0k3sN3imBUc5f0Bap2dYl3TXhDpfzM30J8Ul+jgeXEXvWaUAjaW/9AYcSvVqMb7scBSKkUfEPEN74l6Mr3U/UecVODlLjfSt8iudOTO94Lbvr624FX6U6GYKrScXclO6q/6OsSJhQNtnVMVSntiC63ndlRIPq/mFKIO7jz0erTxPVXSJdj4PKoQFWje0nJhNLqh/3yLqDLRgUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 08:17:36 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 08:17:36 +0000
Message-ID: <7453d268-026d-4f71-b8e7-6f0b84f449b8@windriver.com>
Date: Thu, 13 Mar 2025 16:17:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][master][scarthgap][PATCH] python3-pykickstart:
 fix options parse error
From: Kai <kai.kang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250311085756.1136319-1-kai.kang@windriver.com>
 <CAMKF1srN0CvRNrfA4bm=jMbLwTN5va3kb9Nt-8KqVv7oYDWAVA@mail.gmail.com>
 <fe3b373e-8e1e-4343-ba80-0b49920bcc29@windriver.com>
Content-Language: en-US
In-Reply-To: <fe3b373e-8e1e-4343-ba80-0b49920bcc29@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|SA1PR11MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 83387d75-0a01-4bef-67ae-08dd62078328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVRkY0p2bTZ3N05HNE9QaTZzU0p6WGsyenZocHpneDNjaVcvQlJxRC92cmo1?=
 =?utf-8?B?RzNvNlhHTGRWV3Boem1kSXdIK00wSXdmQXJCRTFESFk1b0s2OVBFMUFrT3FN?=
 =?utf-8?B?OENFdE42LzZya0tycUFmb3RDSXZRemhEVDZBZzBOQWFBZm9hWUFpVjI2cTNs?=
 =?utf-8?B?eHBtd0hpZnZoaEZZc3NuSHg1UVIvK2lQM0ZLUXQvQnpBc0ZHVVVlRmxtd3Q4?=
 =?utf-8?B?L09YT0JMMDRCNXUxUlV5bWZSeXNUM25aa2Q5UnVhd281MFFKaU9IUnJpRDZF?=
 =?utf-8?B?bG4xTHlNQ2xsSWgwejJsV3lpalUySTVJS2hpSnZXdmJpa01TN21GYTZFSE80?=
 =?utf-8?B?YjJTMllXSjEwd0lQMkdEM0lYaXhQOEdCZnN0NVN0OHVLdkdVWVBEUnRPTnZQ?=
 =?utf-8?B?RmdxM095ZjBVOHVNV0t4blUzU0JMOXlHMWZoZVp4SWV4dVNJM21tMzRFczIz?=
 =?utf-8?B?MnkrZTNDT3NrenZXaTdDQVEwNFd4WHNnQmNzOFpPa1Nhdmo4RThveEFiMWI4?=
 =?utf-8?B?RVVGNVo4bTN6T0pBRFlSdjZpV1B3blV6VVBrRm0wU0JiSGx6UGxjMzUxeUI4?=
 =?utf-8?B?TUdNMXJvb0d2LzJaUzVzcEQyUFJtNHFzcXM1Yk0xUTVDc3pjZWtvSEhHY21J?=
 =?utf-8?B?VWh0U3JGWmlYUUNjaTd1SDVUeWVGT1hrT0xPYVg5MkEwMDB2dHZLQ3UyUWsv?=
 =?utf-8?B?cGRFNEhVQTZDS0hka2wvTkFEY3NzMFNjbHZmODZ1a1djUnJaZ2xnM1BFMFBV?=
 =?utf-8?B?cmJyMWh3TEpDR2k3V1lJZTRuVEFCSldHQmpPTGVDZmtwaGREWnNldnZWZTkv?=
 =?utf-8?B?RUVMbjhBNTlId2pJU0t6Y0prUjJYR2txcklBYTRzYUVQZTRUc1BwTkZTZHhp?=
 =?utf-8?B?NWdTM1N2RTVuWkV1RWtqRkJ4RlR6OU1zNUJ6elE4emhBM0sxMDRVQTlMUzJU?=
 =?utf-8?B?RGpvKzR1ZXBCMzVkR2hUTDRyc08vamhEdDNXVEh4VDVDZkxHRnRHR2xiNnBj?=
 =?utf-8?B?VzRLNUlNelp0UENSTEdGaUVDb1pucnRTYkR2NDc4M1VZcSthTDJSSHRzcUo2?=
 =?utf-8?B?QjVKNkJZTHF4RlpYT2VnVTJUQWY0YWgvQ2JmR05ZQ1BPVEs2L2ZVbk0vTHJz?=
 =?utf-8?B?K1hwcGM2Nm5wWUo3QmtUZUM2M0dBR0Y5bDVoK3FWMDd4REY2RWsyYzNBeEU3?=
 =?utf-8?B?UHU5dkZTcWJwUnNkY2lrSjc5UjM5L01lM2hLUVJGWE9TMElkYjBTVmpxRGRK?=
 =?utf-8?B?bERkbm1vM2xMSEU1emNjVk9pZGNYWDdLOFdrelVPN09TUjJhUzd4bGM2S3kx?=
 =?utf-8?B?ZVRIWnFRZVpKZnlPcS93eWlIWWVQRXFjNGVRVWY2MVAydWFhc0QyQXpGbWl5?=
 =?utf-8?B?dUY1NU94RTBvdlRxREpKUmZFS0JkOGJXcWJwV3hGWm00NkRORngyNDYyNUhG?=
 =?utf-8?B?ZXJ6Z1ZNQlBFVDZmbTVYdWtrdEkzdkdEYWlvd0xDWHAxRHkwVWhCRDF5UW83?=
 =?utf-8?B?czZ4eWNITElMUzUwaDBCMWh6bWVWeUVaQWpQeEN0amV2MWNmVWxHMFRnb3Mx?=
 =?utf-8?B?VTFObzQxU1pla3hvQWtNTlk3VDdDVVpTekJSa3E2T0pDZkNDVGR2QzRpUU1B?=
 =?utf-8?B?LzdiWWQ1Nlk1ZjYxT3E0d2JMandlaUU3WWVjQ2NZdjJjVy9OYlJYc3pRYVdV?=
 =?utf-8?B?QTJjZktITEl6Zmc2RmVpTm1TQXRCT2IxRUpPSnVBZHRwaEJwRXViOFczZkQ4?=
 =?utf-8?B?MG5HNGVuL3owKzRadzl5VCtWa2xzRkNoNTRXS1VGck5HYkxab0ZPb0VDZUxF?=
 =?utf-8?B?VUE3SGh4V0tVTHc0d3Fua1lNU3dIZkNXZjJOZXpxUlByMllGYnFYajN3cjg0?=
 =?utf-8?B?OElNV3ZheFBENmorcnNqejNWUmVLb1N6eEdJSUZlaGJRL0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXF2c05wTDRwU0Zod1J2ZnI0UVFYNU1qYkl2aHpiZVQxS0RhS1M0aDR6WTgy?=
 =?utf-8?B?SVdRZG94L1ZCd1M5VlBieXpEcU5mNkVhdXloVnd6amh5aEFPZUVJQ1JldGZG?=
 =?utf-8?B?OVVTMVk5Y1RCODgvNG8wd3VpcTdEYnFCVTZ2VVV3Y3lDSFF6SlgzWUR6MUdV?=
 =?utf-8?B?ODJ6ZldRM1Y1RnRTVzZXd2lZK1pDTkM2eHRKMEF0eFVjVjkrWmZCVjI0MGNW?=
 =?utf-8?B?OWRyKzBidFJrRDl1dkR6MTVNd0YvdFJBSlN5VGZwRC90QlJHVVg1NmxDYmlU?=
 =?utf-8?B?S3J0MmtnKzZ2ZTVSaHlmdERuWEREWFloR09SSk51NHFOUlFOcVdkTGdNYzJi?=
 =?utf-8?B?UW9ML0krK0h2emFuckpKVUhwQ2NBR1EyRDVDZ0VyNmRlQTJrWGFJUW1lOG4z?=
 =?utf-8?B?N2dpdnlGc2tvbndWQUppSUdRUTl1OEhMcnJVSWRpS0FZR3cxdG9UUFZXQlNs?=
 =?utf-8?B?VW9aK3lJWWVtR1VRaHdYdUxXZUxxQytsN3poQjhrWUlJcWJpNE9TcTFrcmtk?=
 =?utf-8?B?OWh6a2E4aEtWT3I3RVZZQ2wrSFhyZmVaSC9iY1ZyRENpQ0RaVGtlTFRLVk1n?=
 =?utf-8?B?L25COWI2QzBvTmVocFpnVDBHQTUzVHkwRmVncVU5Sm9ocGlLM21xeURUVG1E?=
 =?utf-8?B?OEd5dWprcHNsQU5qd0ZaWEh2QzR4K3p4ZmdlOXVSc3lEWnVQWHRuZVk3RDdF?=
 =?utf-8?B?dkRORjA4WUx5bWszaUROd1QrU2NaWmJKeHMwK252T0s1RlRoNTJzS2FTK1Z4?=
 =?utf-8?B?Mkd0Mi9kQ3ZJQ2ppdmNXbHhEKzVUNlNRS0VPand3dGZBczVzK3IwcXlBTzVO?=
 =?utf-8?B?eXhraUppRE9TSXZpWi9LY3hsakFvck9LWVVPL0owV0V2NmhLYm9qZm5XaGVF?=
 =?utf-8?B?UWlnakpSS05VQ2JieWFnVElWbWRzaDVUMnZzV3Q1T041ZEh1am10dHhGM1E4?=
 =?utf-8?B?RjZ1WHoyak1tZlFZbllBQUlqZUkzNlRKYkRZbXJJUzhWaC9wQmxFMnpzL0hs?=
 =?utf-8?B?YUhOWEVDcUowVCtWQ1FWeU1taEhCRWlQTnc5UGl2TWNGUW5wZ1VRQ1pCOUpD?=
 =?utf-8?B?WEx2QU9RRUZFZXFyMHBSdGl3bW14ZVZ1Vkl1YnRYUDJZalJPOFJ4UCtVb3dF?=
 =?utf-8?B?K3c3Um5FUjRtQnpXVzJUcng5UEFmaGovNTduZjhRMjVuNnBOODdNcVpWeTds?=
 =?utf-8?B?UmNVcUVCbW1hclNSK0E5RzQ5dVMzTm8xRmxLWmx3cUFORGRPUVdQbkRKWHpB?=
 =?utf-8?B?WURDTVdnK1liY1pGUVdJc1dySTA3OUp3NU9zUWtZNVJjdkNNdDl2czVVQjcw?=
 =?utf-8?B?OUZBRkRYc0FIUXRKVGgweTR3bHZ5UnZlUjZuTUR4R1NzbHZpcmJjZ2REOXcw?=
 =?utf-8?B?K0FSeUYyalVpa2lPRE5aekFYZXVBU2k2Uitrd09MNjFqQUtwTHFraVd3QjNt?=
 =?utf-8?B?TXEyeGc4aGNHRERqRW1UUVJUQkxkRzdyaGVJKzZ4NWsrK1Zac3hyYk12UzZk?=
 =?utf-8?B?Z0RTNjFSa0JET3ZEcTdEd2thMUtqblBjZFd3Q25vYm0zcGgza3lZckM4UDBs?=
 =?utf-8?B?TmY0WXpGeVEwMDlXMlV5Y2k1SzdWdi9MazQwaTI3UjAzcWJYaVJWYUMvTy9F?=
 =?utf-8?B?c0Z6ODF0K0pZRzBnekdvNmpkZkJoMldrQU1CWWJSamxNeTVtZWVQd3VxNXUz?=
 =?utf-8?B?dUJxeU9jQTQ2a3M0QnJZa1U3aTFVM1RFVmkyY0dTSlhObU5LQVRDK09ETzZo?=
 =?utf-8?B?WXRkU2xCZ2l3ODVyYVR4dHN3WFFhZUU0c2ZXOU1zdTkzOENodjJKVEk3bnBO?=
 =?utf-8?B?b1FXMFVxcEZhUXM5KzdYbVNxdVo1UW13d2htaXRZWENRR0VDdmNPaW41N2k2?=
 =?utf-8?B?aXBsQ0ZZREEwYlZmK0daZGhpRHh5cGxqZVdRakRtNmFUdlMwdFlTVXloTFhn?=
 =?utf-8?B?YVNPczhnUTlxL3pud0hydXJ3TmJqZDl6d3ZBWnpvbzNCSDNzNHpLZ082MURB?=
 =?utf-8?B?QVh3bHdPS2xyU3RhUEhUS3kyRXlWTnd3UE5YejAwUy82SmZscDg1UHdPbm04?=
 =?utf-8?B?Yk1WOHdqUkpTcS9YMVhCZjkrMmp3WFRUb0Z0V1pHTjUyejRmd1BtVmVBcmRr?=
 =?utf-8?Q?xyFiNGEzdrAu7lHiqMAeXJwt4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83387d75-0a01-4bef-67ae-08dd62078328
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:17:36.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfBnc08r3KSes5AfXAEtwL3ARIjeNfejDBYfYXVOsciKlCTsy6tfbvfjLtIqAGcMehtmIXjehx2tApFq1o8Cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d294a3 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=SjUYxHJq4ELpU7d-9T0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IMEoOo7cmqZvIsiIhL8vGWGvk1mGpRL_
X-Proofpoint-GUID: 0AQROwMCKMQz5yLWciahAXNWRExXHLrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D7BF9r019120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115961

On 3/12/25 09:41, Kai wrote:
> On 3/11/25 23:44, Khem Raj wrote:
>> This is needed on master as well. Please add [master] to the subject
>> line as well in future, else I might end up ignoring such patches
>> accidentally thinking they are backports to stable branches.
>
Hi Khem,

> I didn't verify this patch on master since I planned to upgrade it on=20
> master. And I'll consider master first next time.

It seems it will take more time than expect to upgrade python3-pykickstar=
t.
Please apply this patch for master branch too.

Thanks,
Kai


>
> Sorry for inconvenience.
>
> Kai
>
>>
>> On Tue, Mar 11, 2025 at 1:58=E2=80=AFAM Kai Kang via lists.openembedde=
d.org
>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Backport a patch for python3-pykickstart to fix option parse error:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 File=20
>>> "/usr/lib64/python3.12/site-packages/pykickstart/options.py", line=20
>>> 185, in _parse_optional
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option =3D action.option_strings=
[0]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^
>>> =C2=A0=C2=A0 AttributeError: 'tuple' object has no attribute 'option_=
strings'
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>> =C2=A0 ...o-behavior-change-in-upstream-_parse.patch | 71=20
>>> +++++++++++++++++++
>>> =C2=A0 .../python3-pykickstart_3.48.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 2 files changed, 72 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-python/recipes-extended/python-pykickstart/files/0005-options-ad=
just-to-behavior-change-in-upstream-_parse.patch
>>>
>>> diff --git=20
>>> a/meta-python/recipes-extended/python-pykickstart/files/0005-options-=
adjust-to-behavior-change-in-upstream-_parse.patch=20
>>> b/meta-python/recipes-extended/python-pykickstart/files/0005-options-=
adjust-to-behavior-change-in-upstream-_parse.patch=20
>>>
>>> new file mode 100644
>>> index 0000000000..e2b34ab937
>>> --- /dev/null
>>> +++=20
>>> b/meta-python/recipes-extended/python-pykickstart/files/0005-options-=
adjust-to-behavior-change-in-upstream-_parse.patch
>>> @@ -0,0 +1,71 @@
>>> +From f753d4d6ad1f4846d14735beb3d1b157b9914b51 Mon Sep 17 00:00:00 20=
01
>>> +From: Adam Williamson <awilliam@redhat.com>
>>> +Date: Wed, 2 Oct 2024 09:48:39 -0700
>>> +Subject: [PATCH] options: adjust to behavior change in upstream
>>> + _parse_optional
>>> +
>>> +In Python 3.13 and 3.12.7, the behavior of _parse_optional has
>>> +changed. It used to raise an error on multiple matching actions
>>> +itself, and only ever return None or an option tuple. Now the
>>> +"raise error on multiple matching actions" code was moved out
>>> +into consume_optional, and _parse_optional returns either None
>>> +or a *list* of option tuples, which contains more than one if
>>> +multiple actions match. See:
>>> +
>>> +https://github.com/python/cpython/pull/124631
>>> +https://github.com/python/cpython/issues/58573
>>> +
>>> +This adapts to the change in a way that should work on both older
>>> +and newer Pythons.
>>> +
>>> +Signed-off-by: Adam Williamson <awilliam@redhat.com>
>>> +
>>> +Upstream-Status: Backport=20
>>> [https://github.com/pykickstart/pykickstart/commit/f753d4d]
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +---
>>> + pykickstart/options.py | 20 +++++++++++++++++---
>>> + 1 file changed, 17 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/pykickstart/options.py b/pykickstart/options.py
>>> +index 2e3a0721..ca0e18af 100644
>>> +--- a/pykickstart/options.py
>>> ++++ b/pykickstart/options.py
>>> +@@ -177,9 +177,23 @@ class KSOptionParser(ArgumentParser):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.lineno =3D Non=
e
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 def _parse_optional(self, arg_string):
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option_tuple =3D Argumen=
tParser._parse_optional(self,=20
>>> arg_string)
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Before 3.13 and 3.12.7=
, this returned None or a single
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # option tuple. From 3.1=
3 / 3.12.7 onwards it returns None
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # or a *list* of option =
tuples
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option_tuple_or_tuples =3D=
=20
>>> ArgumentParser._parse_optional(self, arg_string)
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # all we want to do here=
 is a custom warning if the action is
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # deprecated. we can onl=
y safely do this if there's exactly
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # one matching action
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if isinstance(option_tup=
le_or_tuples, list):
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if len(option_tuple_or_tuples) =3D=3D 1:
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 option_tuple =3D option_tuple_or_tuples[0]
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
else:
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return option_tuple_or_tuples
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
option_tuple =3D option_tuple_or_tuples
>>> ++
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if option_tuple is =
None or option_tuple[0] is None:
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return option_tuple
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return option_tuple_or_tuples
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 action =3D option_t=
uple[0]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option =3D action.o=
ption_strings[0]
>>> +@@ -191,7 +205,7 @@ class KSOptionParser(ArgumentParser):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "kickstart. Please modify your=20
>>> kickstart file to remove this option.")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 % {"lineno": self.lineno, "option":=20
>>> option}, KickstartDeprecationWarning)
>>> +
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return option_tuple
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return option_tuple_or_t=
uples
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 def add_argument(self, *args, **kwargs):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "introduced" in =
kwargs:
>>> +--
>>> +2.47.1
>>> +
>>> diff --git=20
>>> a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb=20
>>> b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb=20
>>>
>>> index 953068f7c3..657d0df539 100644
>>> ---=20
>>> a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb
>>> +++=20
>>> b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb
>>> @@ -17,6 +17,7 @@ SRC_URI =3D=20
>>> "git://github.com/rhinstaller/pykickstart.git;protocol=3Dhttps;branch=
=3Dma
>>> file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patc=
h=20
>>> \
>>> file://0003-comment-out-sections-shutdown-and-environment-in-gen.patc=
h=20
>>> \
>>> file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
>>> +=20
>>> file://0005-options-adjust-to-behavior-change-in-upstream-_parse.patc=
h=20
>>> \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>> =C2=A0 SRCREV =3D "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
>>>
>>> --=20
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#115888):=20
>>> https://lists.openembedded.org/g/openembedded-devel/message/115888
>>> Mute This Topic: https://lists.openembedded.org/mt/111636553/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:=20
>>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>>> [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>

--=20
Kai Kang
Wind River Linux


