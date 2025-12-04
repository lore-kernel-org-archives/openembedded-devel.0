Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE61AD1CDC0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 02:35:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33368.1764815716996440331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 18:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PzSyYv0e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4433fe26ec=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B42AtkL4193224
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Dec 2025 18:35:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6ervdatQ9oQ5oQWnSU32yE
	jPQbDhQRIJmApF6ol8lJI=; b=PzSyYv0evhSChDfirAS7MeESpH5mExSxCYksXC
	+KX8fwIOZWqH/LhQsbUAIXdPeydtpcA2qZgJWXjPV+M0UZAurUFRzeBuDnCIWCzO
	hybr7RmIBdy7fdecwV39lGA1XGMrYchmz1xV2TRhsit/v3gB1dzouYwGANzINXIU
	CM1VoqQaKLEyr9hKHv5sOK7Yw8I3ooOlOzeilLCpq2iCA7q7nviz1zCN8bz2RX2r
	A5iVz/PCG+6y2cBu6tudAWBHciB3nQPznq/p4ysMiKLoDgL8rQKasY8HcWCsyYVe
	7FoaqNi7yQyLT11CQs7LuwbgNVjtzlNFSEp1ivUvPLfqnCSA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05nrxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 18:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS+8U9gh2gskplJ34EjPTXUdFimWCmxARtxDL7+0270tXxmmglsHHqIUHy8f2rmXaQ9JRUH1Ewj+ag9Szqex0zhOB+Aq8XyjvaiIXa6EiXmrAAdY7qPSi1b0+KwgLJ1MlXQLnckOsaRH858hfBq1blmwQnhCWHMcgiWTueVy2aDeIdwDWCK5zZFb9933sANqwspgJw8rWJuleWON4iRaBLdKgYNmEMiASMcyPt9sRjugwXfTMCpJ4fDo3L4+x2XwYLDNmYyXpFmzn80FgiORfllXUuNvqynzc8RhyRLHsQoEf2Cd12deYsrhpO0PVoYUmC8gYKfiiwR6S8xe9jOnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ervdatQ9oQ5oQWnSU32yEjPQbDhQRIJmApF6ol8lJI=;
 b=I9GnSXWuzi/lKgUUkp/Ssfm2RtaafmwUhgo/mo87OnWmmX2t7+vRPqo9pOgII9Lcr8D79o2m7eBrDWGJ0GuVnojVHhBT+rnH8t3odIN6DWyIOgZbIhW//WzvGdimlna8z7HLVj0wRCySfWTfqtifPdB6lU7p7d6Y71Red+0LKEPfs7vsPu7qpPOpfxQMO691CcPmMRMvwnBbYw315Eov1QnyVwq5m7NlpPCjIMnWMGbZLBXfzrLPyWMIQdBig0Eyf49VlNRLEXUbmZazzJDk1PW/EpDiI8tqvWa+BAMzWXBXSVC4ycbVK0q2Cn8QKIUWNPWkE9rwvyr+piERwhqjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM3PPF49E43CAC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 02:35:13 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 02:35:13 +0000
Content-Type: multipart/alternative;
 boundary="------------wVuYIEnwC0nN2NR9Vm1pKrf1"
Message-ID: <fe857264-7b6f-4f2e-9bb5-582a57a5018f@windriver.com>
Date: Thu, 4 Dec 2025 10:35:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libmng: correct version of libmng
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251203090342.2024473-1-changqing.li@windriver.com>
 <FA59CAA8-D404-4977-A8A2-FF02AA4E9BD5@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <FA59CAA8-D404-4977-A8A2-FF02AA4E9BD5@arm.com>
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM3PPF49E43CAC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 830de9f0-71a8-42c3-925e-08de32ddc066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDZJeXhPV3M1L2xJUUhpbHg1NTRQY0pjbXZ0YU1YVEVzYll2aUQ0Tmt2V05C?=
 =?utf-8?B?SGpGMkhmaVFhYjd3YkJiWUZRcG5LVXV6ZnhuZGUxUW1CU0RMNU4rSWFUWm5u?=
 =?utf-8?B?VjJ5ZzFINklUVWxmdGdGWVhBbk9xd2V5YkE2YzVOOHF0Z2RaK3pVbGJoSmNK?=
 =?utf-8?B?V1NDdEtlTEZSTjRpYUhDVjh4SGpUdGRBU3RKcklubUxZMm1aai9LYVlIMlZi?=
 =?utf-8?B?VXRJSHlHMk50K3c2bkJpc0lTd0NkZWtBbllkN0I3MzkzMmZMdTJjTXZBbVdK?=
 =?utf-8?B?NXVSWVMvaCtUVUlXb0FEZkJoS1dOODFRa3I5NEwyMitHUXB6bXVqQitUbkkw?=
 =?utf-8?B?MDN6N2NnOWs2eUo1YUgvbjcyR243My9aWXMwY2UvTkpybTJBdTlPT1ZjOGta?=
 =?utf-8?B?cnBCNjZ0NWl1Z3pWeldQRFhHNEllMU5jNEJqTUFxeW1PVVVqWTQwMis0WlJD?=
 =?utf-8?B?MDl1bDBJNkROM1lmL0d3R1JuSDBlM2k2VEtvaUR5cWxiTUhIU1RPdXovTVl2?=
 =?utf-8?B?UWYweVhsWDFudlkzTktsb3NJSFE3N256WUh3ZjNHeDhQNGF4S0duSnNoenpk?=
 =?utf-8?B?R3d1UXA2Y05hRklMNmNkVXpMVHNTVmRqdzUrSjdBQzQvUGd5L29JbW4vOVJT?=
 =?utf-8?B?UGptNktxaUNPRlBQVVFXVEZLcHUwekttRm5BMzI0dE5mT29zMFhyM3V2cUpr?=
 =?utf-8?B?YVpEbWNDZHd1MG9QU2lyT1lnZkxIVjlLMTYxNmRlaWVRZlV5WFM4WWNDQjZv?=
 =?utf-8?B?M2JwbmFIeS8zVUhwR3FEV1N2ZHgyTGFTSlZLRmo0N3pJZWNuME9IV3JKa1J6?=
 =?utf-8?B?aGRxNVcwN293TTNvUjJGMjQ4REZicHJLVnRsangvd1d4cURmc1dhazRSZlhw?=
 =?utf-8?B?VmRxME9IQ2NKdUpEZUVkZGN2RnFMMkJQOGdHaDkzNFlJZHdCSnpFUTI2cUty?=
 =?utf-8?B?VFU4ZXdabldtZTFiNnZjUk1yekx3VU5qWXZGRXhTY3MrVWptVEQ5eEptTldD?=
 =?utf-8?B?Mkg3RVQzNUhnVW9XaVJEMVF6YjJ0cGZnbUlkNEovR1REN0hZdnlzWmVxTExy?=
 =?utf-8?B?WGlHRWxsb1FmTHFRS2tJdTNld0p4SDJGZ09sMngrei9rWm05cW9MZ0JiUE9p?=
 =?utf-8?B?Y1YwUmh6VkJaWjlBM29ZaHBLTUFuVHVCRFhDNWJIdHFpUVpOdGlydDFPbm5Y?=
 =?utf-8?B?OUt5ZXByYVlETXJqWlBiYVVGSnI4RU5xZFFVVm1EVlJVWnkyQ1VoVEZ6K3V6?=
 =?utf-8?B?NzFEU1l6cnVsdk9XYWdZRVh2Q1NkcW9sbDdjcmgyeFUveVc2cUhxYVE1OW9o?=
 =?utf-8?B?OVNQV2ZpRlRqZDF4NWtJVFcwY3UrOU9QaXY4ZTh4MWpVN05Rb1l4RDVGYVdn?=
 =?utf-8?B?ajNQMkZpTkVVWDNoM0JOYThjOGZwZW1mQkkwOWp2SjI4Smt2SHgrdVpXOHRu?=
 =?utf-8?B?c0FlZVNacFMzdGJqdzE2L0Zsb3htZmhDUVhqVG5lT0RKTTc0L1hmUURZQ0ov?=
 =?utf-8?B?SlZEWjN3MHYxSzAxT0xXaExqT05OUDFYNkJHd0g4TTdOSmN5TGJxR2xnRHFP?=
 =?utf-8?B?aWFXNFVnSkpveWM4dnJPUUZ5SFUvSWg1aTJtRjRyWk9sdHFXcTdrdHhIZ3hB?=
 =?utf-8?B?c0ZqU3NWRytRUGFmMHVmSDhwakU1WGhITG1kemg4WHEzeGc0VG1ieXVlc295?=
 =?utf-8?B?VVFYYzc0L3hEZEswM0thUVlndERxdm1qaUQ4SXByRGtsZGVINXdEMXkrdWZz?=
 =?utf-8?B?UE1XSWt0a1FjanRpOUdWT2pCYVI1Q0h6dm40bXpiT1EwRW54bXlXVXZNNDFU?=
 =?utf-8?B?d245OS8zSGZUbmgwT2VEZlhjdmJvWmNMcmUxNCtCMXE2RHBhZnZyVHZEWmpn?=
 =?utf-8?B?WEc1TVNzeWZwU0o5a3NtMlBlS1RzanhMRGtzSWRsUzR1T3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEI2bzlpMzFFczlDRjBRWHp0dHkvWTgycGNiQnlNK1ZudU9RdXZiY01pWmFh?=
 =?utf-8?B?QjF4M1dpQ0VZOU9QTDFOYXJrcUczUUh1bzUrQmlRUHU3RE16TmRXcVVzRzFY?=
 =?utf-8?B?d3Y3VmZXNmZmSlY0WTFxL0wraEE1OXFqdnI1NDByWE1Bc3BaL1FFUUo4SEJ1?=
 =?utf-8?B?VTF4WWFtWkhzR2drenplVmZMR3A3bFY3L2pmTXI3RG5uekRkcVlmbTl4OVVH?=
 =?utf-8?B?ZFFndXhNRDVobWhJMkZUdWpQampzYWtjRHhlcGRvYytlRXI5SHBRWFZuWnlZ?=
 =?utf-8?B?K0FJVXNmMlo2YjZad3FKeGJtb0ZTc201UW5iRXdmNTBRajNYWGFwYjI4VVo5?=
 =?utf-8?B?Z0VlNUFhRlg0ZFRGcmVhb3RPdi9YYUFnS2NJVGpsay9Qa0l3dVFGMUhIQ0dj?=
 =?utf-8?B?bTc5Q3M3NkE3Q2lKVVpTSzFUdmp6cGw1UTZPUUlXclRDTUt4QW0xMVJCYlZ6?=
 =?utf-8?B?dWZHeUxJR2dpd1A4ODE3RlpyK2Q4OUJqNWoyUXJYMkxSMFpqUUFkeFFEd1ds?=
 =?utf-8?B?OWgyNUwwMHE1SWFSVEprU2VvYTNnRnlaMXBlU01semk3WWpsbmptRjZXY2FK?=
 =?utf-8?B?RGZUOWx1SEJNY2lBNFp1U1QzemxheW81MldlY2ZjS0NhTFgrcStVd0pNSWNG?=
 =?utf-8?B?ZGhqZmpPaEJxQ1VNWW5iemlpUG1oNUUrUDI2VEpxMjVFMHRqclJWeFB5bHd0?=
 =?utf-8?B?V2QvUFkrbGk4OHhRTjAvVEd1aVlGYVFWSTRlSXk2RU1URjhDOS9rSmYrVFpP?=
 =?utf-8?B?NVduTzh3aVREbUdrVjRweDJCNVYyQVpDMmNGU1NoeUJqd25PZ0pEdzY3azdq?=
 =?utf-8?B?am5LbzhjQnNoMFE2b1VvSjJtbllVdDJZT1UxQy9PWUpUYzdMcXNPVncwRWth?=
 =?utf-8?B?L3kvbFlVZ29iR0NvYTVtRmtodmJnWGJ2ejRqT1p6QWJvTGNPUzlZUlZwa3VC?=
 =?utf-8?B?MUg1R1Jvb1JHTWtMOTNpMnhjSnNSNWlzRnF1YzRPYzYvb3NoQUJWUVRHVEVa?=
 =?utf-8?B?cXZEclFndE5MMnIvSWZKdXgrRElBTm55SlFkRVVpK0QzckY2SjJWdXZUZFdq?=
 =?utf-8?B?ZnhGNm90RkhJRDVnM2orTHNoYlNEbENFcC9jOTA2RDNpQ1BScE9ha1ZGNXJK?=
 =?utf-8?B?aXdRR25RNWpPS3c5VHVvZzVKRStncWNjb0h2R2ppOENGRUYxU3RBQVFnNlNQ?=
 =?utf-8?B?ZFRtQU5TWFB3YzFvSkZ4KytqblRtRXJ6VUxwTHB5QjArSUJlL1dFYUJnWEhE?=
 =?utf-8?B?UWZsYTFsMDNpVEkxN0piSG5pUjl4VCs3NTE1eS9WSDNLem1qeHJVaUdLU1JY?=
 =?utf-8?B?MjVYTEtJZi8veDVvQ0xzVitoUnd2QlM5ZHhnNkk4bkZERzdIWUxTMmhLVW9j?=
 =?utf-8?B?RWM1VEJWSUU1bzR6bFpWNHFiM1VWeFkvcDN1eW5YNHpJUUZ1VzVCb0I0TGRC?=
 =?utf-8?B?T3crcUlVU3JVbzNsRzRtYmw2b0JpVTlNUzhsWmdrbDV1U1BtRHhoSGVZOUZG?=
 =?utf-8?B?emt0V0xCWmVTSW1jY0ZnVHZiWGpIZTZoK1d1cWtZa3BWemdxWXErWVFJZmtQ?=
 =?utf-8?B?b1FXcGxZYXpJcWo4Vi9kU1BzQ3grTk9xSElUeVpYUmdmZjY2S3gxMVNpVjND?=
 =?utf-8?B?bW16aHJZT0xITWZyYnVCSXUwNU1melM3ME9ubStWYlJpcFpJd0pVM25DVUQz?=
 =?utf-8?B?amh0VnlLQXIzd2RkK1hTZisxaW5YMmJSSUpnMStJdWk0eEFVeUI2VWhDbTNy?=
 =?utf-8?B?S0FRc095d2hnSEJXSnFvSGJacE55NUtlWDdsdmI2Ym1BZ0NxeldMUjZ1ZlZB?=
 =?utf-8?B?NlRpakNoMzBVbSt3RGg4OVhSanovbENoVW8wVmI4UGJtSVhVR01YQU9LOU1Z?=
 =?utf-8?B?SWhJR256VjRYUEV5cVBFd3BMRitFTFlodG9MNE00b1duZjk3aHA0WWk3Y1pF?=
 =?utf-8?B?SUppVEFZTFdnWE5wUlZ2V3BFYUltNHg1a0liZCtlVUJvQTdUWmpRVDZabDlv?=
 =?utf-8?B?WmI4RzZDRmxYUkVQN2ZNNnRnV0RZRE9mZHNaM1JhdVIxV0FhNGV4ZnI0bnNj?=
 =?utf-8?B?U2JLdkwweFVvT09hZ0dvcGJtYjBSZEZYR3lvUy9TU1hIZ2E5cGVyZ2NvS3lX?=
 =?utf-8?B?UFExZWpxSGZKQXZsYlhaTnlFRjhESU9vZ1c2ZTFtVEgrMFBnenNhakgvZVhU?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830de9f0-71a8-42c3-925e-08de32ddc066
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 02:35:13.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsB2ldcF75nnhzteRQnp8tWQ6lOIhFWDbREyKp/3jTPF7T36jHkVpRlwEmPL+745buH9HaiaybWehEBeuaXkt+XmzXkHhbC6H2wtmLOszJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 5cCs6W1wWdZ_6JOiqckY6OxRJApYXEc1
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=6930f364 cx=c_pps
 a=NuF0lfjhaYRYFIRzorixyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=WNDY76dxAAAA:8 a=t7CeM3EgAAAA:8 a=U_KmwatvQz88Q-N-bKoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=dvNUojROFdaWIBhl:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=HFDSX3BADwN2sFIQuyTb:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: wbZZ4xhuynsOpBzjTHbzQm-psy0v2aKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAxOSBTYWx0ZWRfX6VozKJoRWsSe
 t8WYFilUEcgOVR+ggOOsF9xpTirL2vM5K1cVMVkKXQ2wrxOS2Bu2JFVIIXEAWHnZM8d+PJGWOCE
 PmcHV3Zw1i8eZrcYkosYlyl1wPMSKC0pPqoWnsIdI+Yhd80gRk8rX0vz2c/6STze2HxZ/V4H6rK
 TREg3Cfi1f//Y0n4y25cNF9NxFQAunUdXZf+/xK/gtltevWoUYLcbcoyJPa4PaBxS/mrlHIsDBy
 BfqUInfJry/y/xVSUYp5lZJJVHrTnRF39IV9ao6PH0SvpK7GhuRXM3Bpf8XgtxVMG/Zr+6iN1YF
 B6p8a42HyBYs+lq2ZCLdAuqx336oTQ5RYOPfTZgVt0bSbj77OuRXLBIw4L6lzIxX7ndSFRu/0sC
 +SkKJeqr9QgzQSBkRrwGUz+ZldMEZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122294

--------------wVuYIEnwC0nN2NR9Vm1pKrf1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B42AtkL4193224


On 12/3/25 19:08, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3 Dec 2025, at 09:03, Changqing Li via lists.openembedded.org<changq=
ing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Current version is 2.0.3, the lastrelease of libmng is in 2015,
>> add a patch to fix it
> Last release a decade ago, for a image format that was designed to repl=
ace GIF, but no browsers actually support, and has been superseded by APN=
G which is supported by all browsers and a W3C Recommendation?
>
> Sounds like the follow-up patch to this cleanup should be to delete the=
 recipe=E2=80=A6

Thanks for sharing the background.

I searched under meta-openembeded, there is one recipe might depend on th=
is.

https://git.openembedded.org/meta-openembedded/tree/meta-gnome/recipes-gi=
mp/gimp/gimp_3.0.6.bb?id=3D1d3c3ad93c962ee1c27d88076b63d08e53c8b318#n80

Another recipe that depend on this:

https://code.qt.io/cgit/yocto/meta-qt6.git/tree/recipes-qt/qt6/qtimagefor=
mats_git.bb?h=3D6.10#n19

Seems we cannot delete the recipe unless we don't support those=20
PACKAGECONFIG mng.

//Changqing

>
> Ross
--------------wVuYIEnwC0nN2NR9Vm1pKrf1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B42AtkL4193224

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/3/25 19:08, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:FA59CAA8-D404-4977-A8A2-FF02AA4=
E9BD5@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 3 Dec 2025, at 09:03, Changqing Li via lists.openembedded.org <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@li=
sts.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Current version is 2.0.3, the lastrelease of libmng is in 2015,
add a patch to fix it
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Last release a decade ago, for a image format that was designed to replac=
e GIF, but no browsers actually support, and has been superseded by APNG =
which is supported by all browsers and a W3C Recommendation?

Sounds like the follow-up patch to this cleanup should be to delete the r=
ecipe=E2=80=A6</pre>
    </blockquote>
    <p>Thanks for sharing the background.<br>
    </p>
    <p>I searched under meta-openembeded, there is one recipe might
      depend on this.<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/meta-openembedded/tree/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb?i=
d=3D1d3c3ad93c962ee1c27d88076b63d08e53c8b318#n80">https://git.openembedde=
d.org/meta-openembedded/tree/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb?i=
d=3D1d3c3ad93c962ee1c27d88076b63d08e53c8b318#n80</a></p>
    <p>Another recipe that depend on this:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://code.qt.io/cgit=
/yocto/meta-qt6.git/tree/recipes-qt/qt6/qtimageformats_git.bb?h=3D6.10#n1=
9">https://code.qt.io/cgit/yocto/meta-qt6.git/tree/recipes-qt/qt6/qtimage=
formats_git.bb?h=3D6.10#n19</a></p>
    <p>Seems we cannot delete the recipe unless we don't support those
      PACKAGECONFIG mng.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:FA59CAA8-D404-4977-A8A2-FF02AA4=
E9BD5@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------wVuYIEnwC0nN2NR9Vm1pKrf1--

