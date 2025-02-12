Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C78EC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 06:00:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8912.1739340040091535599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 22:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4138cd7834=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C4E1Av008514
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:00:39 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6hd7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:00:39 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51C60cgA002638;
	Tue, 11 Feb 2025 22:00:38 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6hd7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 22:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7IdZ2Q5zhboP6xOYMhzxmQWVvSjn7Mpq/cyvpaNC9F8F6riy4UZXlJUzPpYsZ5DYVE40njzRwKCaZRiIZrS5hWBNv3t9MPYss+wQMYqSQtIHgRuDFfZOZPhAAflt+6PDfmJdLL1nPH7YbQYoTF5fmZndtJbU+/BNG1vKYEK702PY6SdkOT+Et2hauiQWwCrMmL9bx1atvcdVHKPGebARMN47H2d8EV84Yjh0kgEhY1zqX9c/klHl7oblZUAPt0uCK3GI4URdN7Ch9r24+oOjhBvM8AnFcjiSGm3iyUAnSI0fj1cmWr8zdTlcHAhHe4s5cPAnaNBVusODyYc5IcdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URPfs3V+Pu+2p2CqUk6tgNgYZS9T9Lwjz04M1t6pC6k=;
 b=cWEXH3blih4+2nCSWK9iG+xUMS1SpY0FMfmADyUHsm9wID/rEOafEuALfKz5vUp96AZTXYSX1i4zeQ4DVdNzqZ4Ex+1C+Ctb+C57qSWRtm0nn3Nx8JAAvoCBJID8z6/Di75H9JVzhus2KLMlUNHN3/M31c9Y2ynlsRMQXjQe2DaKkpaoTIwT8hUskSaB/AdzL2ZGbhkMxItPmRKmM5dPAi+Lb+rHG5JO2cao3naCRVHFE9tG0pWgQjjezIlQabp+A+J+9A3eOMhWpfsDUsu3BEMYFOkEITC+/YjFJC26R0Ca1Fg3VjqTqQe9DKxzOVf30PxzsFMKdFEd15ydUdXEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Wed, 12 Feb 2025 06:00:36 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:00:35 +0000
Message-ID: <378d336d-7c88-4ddf-a791-a131a0dbcc0c@windriver.com>
Date: Wed, 12 Feb 2025 14:00:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] opencv: fix build for ppc64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250210071226.1880278-1-yi.zhao@windriver.com>
 <CAMKF1sqHBDmaQVAuSOcML_cQ8nU-NcMEiMzSQ_3KCP76sHvRFw@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1sqHBDmaQVAuSOcML_cQ8nU-NcMEiMzSQ_3KCP76sHvRFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: c1de8d55-0a1a-47ba-e084-08dd4b2a90e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clh3TW5EM29pQ1FTd3RxcTdUQjhPUEdvdGRQUkFCN2tvbnNOdWZyREpNM2VY?=
 =?utf-8?B?aERqaTVqckxRVlYyZFNRM3V3enFUeEVWemJZVGpRUkp3eG1OTzhaTkFUTkNt?=
 =?utf-8?B?Y1A5eDUwQ1YrbGJoR2t6eXlZS2cwZCt5V3FtVk80VitpYjlHdkp4RjZTcUwx?=
 =?utf-8?B?Q2hwakxKcHhUTERzK0FYY085SCtGTUtnRUZHME12eTYzM3FMT3dMckdQbG9D?=
 =?utf-8?B?MFdWU1hYUWRBS3BMN0ZtZGsxcFUxVkhneVcyMEY0Qnh2eFNlcjRCNHF3b3BC?=
 =?utf-8?B?TTZCdHFoT0NobjJtSGw2Z2ZURmExQlJiSVhDZDlDTG1FNExPS2MvRU52QlY1?=
 =?utf-8?B?T2JENFJOWkZLMVNMaERYQTYvRDJ3K2EzOUtTbktXOXczdmVYR3pDQnRsSXc5?=
 =?utf-8?B?WmJ6cnRiOG05aE0rcDY4T040d3NKNVduUmQ4UXMzZE5ESWZ1REJGRkI5WEhu?=
 =?utf-8?B?L1F6OFEzRXFpY1JuS3dHTFdnR1M5d0dGOVpRaGRuc25ZMkNKZkU0a0Z1TG40?=
 =?utf-8?B?cXhHNHQrRkRuMHg2K2dTUVAvaDNvdkxGR3g2RGU5dTJnaHVOYmlWbmpzbGJv?=
 =?utf-8?B?UHZmQmFiWDJyUzgrV0FWU3Bzc3M1NEFTdDlTbmdlYlBtSHBoUGl3SFZaRFUz?=
 =?utf-8?B?bzh6L3hSYkF5OUNjeE5CYmMrV0NNU1hKek9zaVc4UmpKMGNjZzNRYlQrRzVR?=
 =?utf-8?B?QWhvc2VzbFRXdU5DUmxwT09pOU40SXl2NHh2QThiN2d6azExYzlmTFVDeWVt?=
 =?utf-8?B?TDhINjB0a1Z4TlA5ajM4T201S2dJcVU5K21pZkNSSGQyZ2pESzVuajd0SDU2?=
 =?utf-8?B?aXJRWXprODdMSTNTa2FZZDRhTkx4Vlhhc1J1WXRXZ3pTTWdzMzNFeFpuOGk3?=
 =?utf-8?B?MHBwVWUvZ0dBbVlwOWFkT2dSeGt6Y1RxMXlKbVZ3a1ZGdWc2Y3FkcGR4RXVM?=
 =?utf-8?B?ZkNrN1BBMjZMcjFNajg5bWVLajdwNVdIUmhiejhncG4vZXpuVVlDVCtOZXcy?=
 =?utf-8?B?cjZlaEFEVmlvbVdSMS8xSittajNJN2pKQlJmcXdpU3hyRzI2WGxEdWpkbHRE?=
 =?utf-8?B?S253eWttU09vUTVna3JIdzRwbmwxb3lFckI4aEVDRVRZcjNIRmdFZnYxM1hy?=
 =?utf-8?B?bklFdTVoWjlWUEZGVHhDbWlXS2Z6WmtOWnFtNzZ2S2ZwMWpyY3F5ZTJydlRW?=
 =?utf-8?B?a3dzRzh3VDl6ZWt0MEo0SFg2Wlp2WmxvcXV2bnZoa1RIa1FkTWswMVF5blFy?=
 =?utf-8?B?UmxHOGJvLzFrUUR0RDRBb2d3azlkMnF4YTJpd1BTRHhPdVpMMFFlN29JTmI4?=
 =?utf-8?B?R09CRTZvNXN5TFRrTFV1QlFUVUp1Ymx1OXBFVTFva1Qyd0t6TTdMV0lFVFFh?=
 =?utf-8?B?ZmhDREpPdllsam94bEsyR3ZpNHIrdDZlRmRhWmtXcnhGclQ3QnZWazJHVTlv?=
 =?utf-8?B?VS83TFFWRTYrWG13SnBnZm4wK1JSZmtpYkE0b0ZQYnVnNkFCVDkyWVhlTWtx?=
 =?utf-8?B?MVROUlNHVEp5Rm1qYWV1NjVZMTk5a2NpSFJib0JKenVXNWdJVGRKWVpudXZP?=
 =?utf-8?B?VWV2eHNGVy9XMnN6N294Z0lNNU1WQXhka21LVWxKUzltRXpPMlFHdG5veVB0?=
 =?utf-8?B?S0V3c3AxMzFCL0JYM2gvWFBVK3crZ1FBQm9ENnlYWGFTY1VQWUUrMU9hdTB3?=
 =?utf-8?B?S2Fua1p3anZDcTQzUEx4N0tpb2FoYmg3bnV3Um5FQ3ZJVS9hdWhjUktZOGM5?=
 =?utf-8?B?cmQxaUxraTZweW9qblNnQ2M1VjYzQkplM01jbFFIc0l4Y21GODA4d0ZoT3VZ?=
 =?utf-8?B?RU9aQWNIc29SbW5NU2prUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SG4rd2NybWNBREthVlY4ajduN3NGcDdiV3grVXYvNHdzU0lpalVObGVhOUxG?=
 =?utf-8?B?Mll0d0EwNlMvbm8zNUkxaFR5VWt6ekw4bGFiNFNiUFZBb0lQTUZNZm1xZ2lq?=
 =?utf-8?B?UjVmMXZxUVkyY1dWNnMvUU1wQkRRMnRNdTRZRnYvOEtqaHllTkFWcGQvWVRB?=
 =?utf-8?B?SGhMbWdLU3VrL1phNndpZVFocFNoL3FnMjVvV1M2cUgzU29KczNYU1JSSHZy?=
 =?utf-8?B?bFIvTDZBcTJTbTRNdkU5ZjRmQ2pEYTFrb05HamU2RFdKSTM5dGRvbUJCYWI1?=
 =?utf-8?B?STVKVGtSQld6NkhaYU9nWXFhbklnTzlXc04zckdab1Jzc1BxTDEwazFGQUdk?=
 =?utf-8?B?UlR0Qzlya0Q0VitidjE5RkpONC9YODRRQkdORSt4c0F6ZmNuWXh0RDBGM1RS?=
 =?utf-8?B?bktraUhCL1JncGZuWHhwTC9vYk1BKzlXdEc3TVR6UDFRL2Y0VXhhenFWbmxE?=
 =?utf-8?B?K1RKVGJiakZYWWJaQjU0ZWsxdjdGcERZRHByUWpyeDl2UWNuSXVndjRZdjJk?=
 =?utf-8?B?dEtha3Y0MFg2RExkU1VDYVFqS3FMNnFVQ2tRdFpRbWkzYkd1Mm5mMk10ay8v?=
 =?utf-8?B?dnZvaFdOWTR1b0hKZHFiMHpyOGxaaUFTeG9MN1U3VTJ6b0RQQVZNakNiM3gx?=
 =?utf-8?B?Z2xjeXVPTlpDbGs3RlQzQ0EwMktSOHBhWFIwRTExeVVvMjZ4K2Y2MzRyZWVj?=
 =?utf-8?B?WDFDRWczYk5Ba1lTSk9QSXpiemxJaVlkVlBsV2ZSRmQyaTNwaWY1YnlxRVVv?=
 =?utf-8?B?S1I1OXFvamFaNS9iY2ZlU0wyeTU2NzBiK2JRLzQzaTVYb0E1cm1GL25vQUJX?=
 =?utf-8?B?UmE4TEFYM1EvTWFaM3hmWDBBREl1WGo0SVZSVWtFSWY4RzdzVHBGckpOUE9N?=
 =?utf-8?B?SXovY0VsNGdpNURQNnBzNHdkYzVsMGY1cm41QUcrb3MydHBKbm5HN0x0VUZp?=
 =?utf-8?B?Q0NxVk9oQXVMTGJYYWl6Nmgvc3d3Tm5yRHhlK3ZHcSsrZjR3K0VIdENYc3lV?=
 =?utf-8?B?dmtJLzRUQytUYmNXQkRON1ZRcEdNa1NtcExGVVloVkJ4cmlnY0NIRzVNWXgr?=
 =?utf-8?B?c3dDZWRKSVlrN2tHQ1pRdFlxbmFKam5RLzlGN0c1cTJqQUdzd0xsMzhXL1Yy?=
 =?utf-8?B?ZVRUYjczNW1LQm1KUmdxYnBvWUZBaWFGc2gxWjZxMTN0MnRaV0ZlODFWNlBq?=
 =?utf-8?B?MFM0WXRSTkVlcTFRbW1JZDFmUzdueU95amszQzVTNkQrSUxoNkpycjIzcEc2?=
 =?utf-8?B?WFFRZ0dSd3crT0h0VTJVcDU4R1c0NzZsQ0R1RzQ2bUZIclVDdVJZNmxvbEMy?=
 =?utf-8?B?OXVVUWluRi9DUGx2aWN2MVhPRENrcjlCcmtiYWdmYzZRTE1IMlBERzhKTHFk?=
 =?utf-8?B?SHhTSVBLVEpqR1loMG9aUzU2UGxQZ2I3azFIbUpiK1BoM3huaDUxeTQ0MzVN?=
 =?utf-8?B?WjFSSkI0c0grSFVWOTJzdDB4NWNUTXN3RHA2Tzh4RUZOb0dOL0FMVzZCQVJr?=
 =?utf-8?B?MUJ4SHRTdUhaaTVDQ3dXSGt6UUo5UmFQdWVWa3RaVlBLVWMrR0dpSWgrelAr?=
 =?utf-8?B?NDVSMlFuY0xiTXoxNStkVUljVEgwUUpCSG5MVW5McCtTeHFRa1JrZlZCdUpU?=
 =?utf-8?B?bUE0c3lGcG1PaktkcGJ3ZU1yVklRc3BnN3FxcUo1WFgyMXczTlZjYUdTb21G?=
 =?utf-8?B?WDVLUUFjeXd5NVhTVWo3aW84ckNFUUM1dzlWRit0b3BWZUlTcnVjT3M0UHlB?=
 =?utf-8?B?d1FJVnQ4VXQwcmMrQ2R3SGZNVkNMK1g3aXg1RlNoaXovL2ZkK3JPWHpiTU1U?=
 =?utf-8?B?cVVsMEdEQWdFak9aVjNDRHZTdEtlVmVqTXFvK3VFVFp3UHg3eUUvMGdnajIy?=
 =?utf-8?B?TExXTU1VQ0ZWK21UTlRkRFRCeHZKamF4UzRDaFJCQi9HanJEeUFsOGIvRWp2?=
 =?utf-8?B?Um9QSk1meFJucEVLTk5WcStmK3A1eEZrTXI2WmNDb2J5b3JvclVhZ0IyT1RC?=
 =?utf-8?B?S3R1d2dDU0pxM3d4bjZQeTh4NExLbHczTXJFVEFOU00xWHdEaGNCZHJqZGFE?=
 =?utf-8?B?ekQzU0RxcEpydFdEempzWWVhQUEwMnBLZWNEUlRMSE55enIrTHVWei95Zkpu?=
 =?utf-8?Q?STGRelDQSzIKUBtOjH4SQt7UZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1de8d55-0a1a-47ba-e084-08dd4b2a90e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:00:35.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTeNXAJjYbgzG/QoKod4diS9Lb0esrChliM0VZOBWZshoE+wpTUMjx3vS9TojJosjTd2KkbeFa+gytlhsFuD4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
X-Proofpoint-GUID: sByXYBdGxO9VB5Gfik5s8NaNRpwZpUWh
X-Proofpoint-ORIG-GUID: H_21m603S7Qet796ChHjam71KMbrj9X5
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ac3907 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=rGyGEfxzYieEyzBWqqQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51C4E1Av008514
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115436


On 2/11/25 01:19, Khem Raj wrote:
> On Sun, Feb 9, 2025 at 11:12=E2=80=AFPM Yi Zhao via lists.openembedded.=
org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Backport a patch to fix build for ppc64:
>> modules/core/include/opencv2/core/hal/intrin_vsx.hpp:265:75: error: ex=
pected primary-expression before 'v'
>>    265 | template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_=
##suffix(_Tp v); }       \
>>        |
>>
>> Also fix QA issue:
>> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/arithm=
.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
>> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/conver=
t.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths=
]
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...-fixed-VSX-intrinsics-implementation.patch | 61 +++++++++++++++++=
++
>>   .../recipes-support/opencv/opencv_4.11.0.bb   |  7 +++
>>   2 files changed, 68 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-f=
ixed-VSX-intrinsics-implementation.patch
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX=
-intrinsics-implementation.patch b/meta-oe/recipes-support/opencv/opencv/=
0001-core-fixed-VSX-intrinsics-implementation.patch
>> new file mode 100644
>> index 0000000000..9fc89e4244
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrin=
sics-implementation.patch
>> @@ -0,0 +1,61 @@
>> +From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 200=
1
>> +From: Maksim Shabunin <maksim.shabunin@gmail.com>
>> +Date: Fri, 10 Jan 2025 18:34:11 +0300
>> +Subject: [PATCH] core: fixed VSX intrinsics implementation
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b89=
eb4383ce8528]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b/m=
odules/core/include/opencv2/core/hal/intrin_vsx.hpp
>> +index 2157e1e870..0a0915a22f 100644
>> +--- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
>> ++++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
>> +@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, double=
)
>> + inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp)0=
)); }             \
>> + inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats((_=
Tp)v));}          \
>> + template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix()=
; }               \
>> +-template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffi=
x(_Tp v); }       \
>> ++template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffi=
x(v); }       \
>> + template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix(c=
onst _Tpvec0 &a)  \
>> + { return _Tpvec((cast)a.val); }
>> +
>> +@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_bdw=
ord2_c)
>> + #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
>> + inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
>> + { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
>> +-inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
>> ++inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
>> + { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
>> + inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
>> + { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
>> +-inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
>> ++inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
>> + { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
>> + inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
>> + { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
>> +@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_int=
32x4& a, const v_int32x4& b, cons
>> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8&=
 b)
>> + { return v_dotprod(a, b); }
>> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8&=
 b, const v_int32x4& c)
>> +-{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
>> ++{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); }
>> + // 32 >> 64
>> + inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4&=
 b)
>> + { return v_dotprod(a, b); }
>> +@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32x4=
& a, const v_int32x4& b, const v_
>> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v=
_uint8x16& b)
>> + { return v_dotprod_expand(a, b); }
>> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v=
_uint8x16& b, const v_uint32x4& c)
>> +-{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
>> ++{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c); =
}
>> +
>> + inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v_i=
nt8x16& b)
>> + {
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe=
/recipes-support/opencv/opencv_4.11.0.bb
>> index 07b3a9d9e6..1613b6a3ed 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
>> @@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=
=3Dopencv;branch=3D4.x;protocol=3Dht
>>              file://download.patch \
>>              file://0001-Make-ts-module-external.patch \
>>              file://0008-Do-not-embed-build-directory-in-binaries.patc=
h \
>> +           file://0001-core-fixed-VSX-intrinsics-implementation.patch=
 \
>>              "
>>   SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.=
cpp.patch;patchdir=3Dcontrib"
>>
>> @@ -208,4 +209,10 @@ do_install:append() {
>>       if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
>>           rm -rf ${D}${bindir}/setup_vars_opencv4.sh
>>       fi
>> +
>> +    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
>> +        if [ -f ${B}/modules/core/$fn ]; then
>> +            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modu=
les/core/$fn
>> +        fi
> Do we know why the absolute paths are being emitted ?


arithm.vsx3.cpp and convert.vsx3.cpp are wrapper files generated during=20
build to include other header files with absolute paths. This is because=20
VSX3 feature is enabled by default on ppc64 cpu.


//Yi

>
>>   }
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115326): https://lists.openembedded.org/g/openembe=
dded-devel/message/115326
>> Mute This Topic: https://lists.openembedded.org/mt/111098421/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

