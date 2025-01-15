Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C75C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16079.1736927678214359266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4wSa8004016
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:54:37 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt73rhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:54:37 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50F7sbdL004557;
	Tue, 14 Jan 2025 23:54:37 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt73rhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 23:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI0smXC41I0l490c6km3eiwkcxLGF0Cdgk2wrzOUmztd21/r1hGYomSEEQT+YMWTA+mBT9Ov7YpQdSZwr+IbaDPge0oW6YOgBn55AmNnAICW/Ev8zKYVv0kteTE+r3XDvjgQ9dfMAFmQoTHVS8ucLBbCFp8+t5Kxl9c2uDGqUmS+00z7ejmZgnQ2QbGTRQEx0BNZrmw5Kl/t0iem6W5dmQZRFKLX84lRbzdEXi7eVLa0GmssGtQdHtar1JLxSW/WkcJTbZFwBZkgGUvkbmY7BjNEitAVjycR6G0zpdt21nRhNr6a6A7SsSBRuwQnxxuZiZMWg6Jra6+PQtezBdWpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7knAK36Y0GEOfmoCZRpUquaxF50SQMpAP5Z+nUB5p0=;
 b=Bpl1rlnhyolneegxOLaTcvr708UQGCpUGtAa7VpP7DETLRQA4f9k3kLqIqgCanbmFiVPdvpCZw070O1yL4sccHtZ3T7yR5ZexJqro/NFEqPi3oTLdSpMQiOeQEtNYmUdWS/tBReEjOvqdLPV739WRylLGdCja3IWXdrkBG31mvVmFcl+pbDO3bO/ax8vdpH3m9+NZoaWIySctlA4DhRQjYRpXwxZ+t1yNUOGCIgV3GPnZor4DVQEPlt2Hg0mce2LxmKjMeTS8g6hbn5TOTnbIr92r05GsNa29+kKvzJ8Aasaj0Ys2yp2YdPfrRCUMvAJSpPesrG74YAEwxlQMGgqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 07:54:23 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 07:54:23 +0000
Message-ID: <c1075931-f51c-432b-be74-87689bace753@windriver.com>
Date: Wed, 15 Jan 2025 15:54:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
 <5540bea7-e33a-4e2a-9429-71323d819deb@windriver.com>
 <TYWPR01MB11861397A8D3E76C13151E6E6DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <TYWPR01MB11861397A8D3E76C13151E6E6DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 38893a72-ad26-4434-f609-08dd3539d358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUEwTGRWU0ZwaFNZRE5BN0ZHVkg2MkNwWURiRU5IcE5QK1BFRUZ1SDl0MmNM?=
 =?utf-8?B?SHAreURRSkhicmV4SFk5NWt6YlNaeHVObE0raW9pWlNqN1U5Rlo3Z3VLV1VS?=
 =?utf-8?B?eTFMekpUQ3B0YVYyeGtqdmZjYk10bUZod3M4SjRHUnBXVWFwVDJhbWtvcEJU?=
 =?utf-8?B?OEczYStCbUlacy9rNGNkWStEQzc1WmtPQ1RVVVpLOVhGUmhFcVJtbEkzZTR4?=
 =?utf-8?B?RWZZcVdndXp5REhFcXA0WGg1ME9GZmN4M01OTFp2K2xQaTRQWVdCMzBtUXdp?=
 =?utf-8?B?ZHFhWkxRaDNySWVhRkxjaE40ZlRuOHZhMVJvdEFDRWlmbi92Z0M0Tk9xcERZ?=
 =?utf-8?B?NmIrRHNDN1laeHRaZ2pFSDVheEVqamFOTUpuYU9HMlRCTDlFcTk3N1JBSXBm?=
 =?utf-8?B?UEx3NkU3bCtTT2xab1BjbjhhSXhERXM2UXlwOUpGZitNM1M1aURLUW9jWU9F?=
 =?utf-8?B?OG9RM0FaUUM5T002OVlHS0JGY082Smx4QUU2QTduRHZVUFpBdHk4SEM5ODlS?=
 =?utf-8?B?b0cyR0UzWEgwQjgveFJRd2Z6L0s3WTdHdUtXZDdkeVVTbzZPT09SY09kUDJD?=
 =?utf-8?B?dUt2RTNkcWFsa1V5Mkw1ZWhOVjdLcDVNbGcrNXl6Q3gwTThZa0Q5UHVOaDY1?=
 =?utf-8?B?ak5BZ051Tm5GcXJrTDc1bmw5SWNWZkpZcGVqMEI2SVVDODJPSXNNeUVqMkFF?=
 =?utf-8?B?QWVueHczUGhZaXNtUTFLeERzVlVwYlhnU2xSQlhNb0Y0TnhJQUQzWGx3ejEr?=
 =?utf-8?B?cjFqTmVtTkdWYkRXN3Z4STc5SVVFdnpjTERVU2lNS2NQMmVkaWIvem8vT0wz?=
 =?utf-8?B?Y2lxeHFHTjIzZGJOWDJES1dCM2s1TEpRK2JqNEJCYVI2YUlRZzR0VWJkMENI?=
 =?utf-8?B?UGFQbTZZNFFYK0NibDhkVzhOMWVQc0M4bXpYcHlpR1lMVTFVclk0cHV6SHMy?=
 =?utf-8?B?MW9BcjhFMlZvdU4wT0RFUU4zNTM4bjFNNEdMY3hEL0IxS2xQc0tJazZhbXBP?=
 =?utf-8?B?WE1jSktJK0prRTRtYVZLb0oxNy9xNFRNaTZHaHREdlNPSGlSOVpUamlaRTRn?=
 =?utf-8?B?L3FmOU5lMHpjSGhXazMwKy9lUytidDAyMTdMbytvUUtVSjA2WUptUHpkTGo1?=
 =?utf-8?B?S0thc3hSNVBFQVpCQXZPWmxuZ3c4eW13U0p3YStGam0wZEl1WWtJNWNGWmsy?=
 =?utf-8?B?R1NoWWxCZnV5MzVka1pTVEJNTjVWNGx5a2h6ZU94ZytMUXp4TGJrZnErSDll?=
 =?utf-8?B?azJIM2dxVzYzamJ1WkFpaEFjZjluRGVRaVhyNzV5S20wNlNIWWxFcGxYUENl?=
 =?utf-8?B?R0FUSTJTS2tQZTIzRUdmVEdIeTRQMTQ0KzFBSmY3R1FXTXlMR1Q2eVhoZDkr?=
 =?utf-8?B?Nm4wMmdUQ2F0eFk5VkhrTzkzUGJ3d0x0Q2NYc25GRVZvaTVmYVVKU0xoNjVC?=
 =?utf-8?B?dDAxVlR4K2JMQTJTcmtvSjBPRmhCQW9vT2RleHNZdnFKUXVpWXRlM1NJM1Ew?=
 =?utf-8?B?ZUxuRXBhYndtWndQL01ocWtNZUkxZityYk1ZSlNBZU9sTGs5emRvMEc2S2Jy?=
 =?utf-8?B?WDQwN1pIMkVqZ0pWREV1RVB5Z1NPckMzaFdINktCZUZUbm5zRXlRS1JrZ1Jq?=
 =?utf-8?B?My9GSUt5R002bER6WlNvNmpoaEFEbmVGMEdqelJHR2hKVDlxeWFqUTdaTXNL?=
 =?utf-8?B?WWhHaXViQ2w4WkFzZmJFZm14TDZkb3V1dlk0ODJpakdPZE85SGYveDRJai9V?=
 =?utf-8?B?NW9tM015QlU2ajhSR1dXdXo3eFN0d29zMFRreWJ6c3VyYjZUeUgyZ2VFQTBp?=
 =?utf-8?B?VzdqaDg2WndsbHlnMGhEdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S093cVgvL0o3d0V5M0hJTllXY0Y5TlYyZ3pTb01vSzVvQzExMlVCUm43OHAv?=
 =?utf-8?B?UHAwcUdJN1pmN1ZDd21ibDBPOGJkUCsrbXdJMlNGYTloaEFLSmE0YUZOR1BN?=
 =?utf-8?B?MWxpR0RLWGRYR2gyOXJEbDRmNldZcE94c2lJSWNWc0dqUkZUVkh5TWczdkJ6?=
 =?utf-8?B?b1J1TTdCR2tuam1RMGF1TUpScCtpVzRDNU1QdGtQVTYxWkJMOXVHK1JPc1B4?=
 =?utf-8?B?cjVGRk9ZcUxIK3lMUUVEb3NlVzJSWnNVNFdBZjYvM3NrOEE4emE4Njl1T3lF?=
 =?utf-8?B?dkoyVTc4aVAvSEFzYldVeGJRRzhxZUovOWNud3I3Nmw2VHRIeG55SmlEc3NJ?=
 =?utf-8?B?TW5qV0FTcGNIU1VSZEVxSVZ0cVJibDFGRHpleXhYMXpIQkpoNnNyUG5vNlp0?=
 =?utf-8?B?YXhNVlB4VnZ6QjdmSjNIa2QvVEt2dTdBdjlxWHdsQ0kyV1dGalJvbEl5c0Q5?=
 =?utf-8?B?TjEzSjIvNFQ0MG5tSGpYQS9DZUxMdmlGSXNOOEwyUWRrM0FZa05qTUZleUpz?=
 =?utf-8?B?blFVYU5JVkZidE5UMVdxTlpNRXV2Vlp5b0tONlVkU0FJVVRSM1F4V0RKSWxI?=
 =?utf-8?B?S1NZcmJGOHg3alo5UjV1S0N0N2pxeVc5R29PNHE4YWRhMDJpYmoxa25ZRFpw?=
 =?utf-8?B?a0Z1RkJtdjQyblFVbXFBQTZ2NjBtQlU4ZVB5dWJGOEZYdFBHazFtUFF6MUsz?=
 =?utf-8?B?ZS9WTE04aTNqRFpCZm51TWJTS2RXUC8ya2wxU1hLK2Q1RHEzQUIwb2VMWjBw?=
 =?utf-8?B?OU5UYXM0dWRWUUlqNStsbDN6NU9COG5aQm9aNmxoa09Wc1lKd0dqK1RSa2xl?=
 =?utf-8?B?TmdFREpNcWZFbW5OYmc4UXZ2VmVSN3ZoMHJBNW9wanhZSmE1SGZxZmxXUitW?=
 =?utf-8?B?cElJM2tEaUVBUDVURmRGRHAzU0ttYTJjNnpUdHlpS01XZTlrZVN3NkZjbmNW?=
 =?utf-8?B?b01Tb0VGemRSZjNwaXA3T2xKMHBzRFR4UWVEVDhRMnkyd25oU2pDSU9CaEhR?=
 =?utf-8?B?ekNERjc4cXJSQjJleHNudnZRTjBOY0xiOWxpWmJhOGtFaFhCZDhRVVVkOUdj?=
 =?utf-8?B?N0dHc0dQMnFxQmxQYndVM0J0SEVQTVJOSnVsVGVLaUduVWU0c29CbktoYi9h?=
 =?utf-8?B?UVVLZHhXYlorY21NYXJPbUJncGMxYVlndnV1c2d2VHFjdDNINE1YK2thTUEw?=
 =?utf-8?B?YjBZdDM2ZzhuNXNqbHZ0MkVuRDB2a0lIVHgrM3JLeUM5QzczMUx3eFlmVnFj?=
 =?utf-8?B?Ti82Yzk4b04wK3FvYjFCRzlCSmsydk9tdHdMUDRaQkR2NUF1LzEzTTZIanhx?=
 =?utf-8?B?bmpnUjlEaHl5N3lKK21hRWdha0hlcTVOMWs5UWJIQnVMN0IxaEh6c252eHZv?=
 =?utf-8?B?VlhMaVhkdUp2bitZajVQL2syS0w1aytRb3E3OFd0VHgrekVWZ25oWThwSG1D?=
 =?utf-8?B?UWpNWEZhZHJtNEFuSkFMUHlKdU85a005WDJlcWtBVUZySHJodktBMDUvYnRD?=
 =?utf-8?B?K3JvemEyZ2djUk1neDFBVW9XZWdUd2FNY2NVeW54ZFFkci9ERHV1Z0lOQ1Bi?=
 =?utf-8?B?UlVpbENkODdJWUdoN1lwZEJhaHZRdm5BZEJUN0NPY01RajRyRXovWGM3RDZF?=
 =?utf-8?B?T1IzZ1R2cGZGTDdjQVVJQzVlR05lRlUxRW9WL1dEZ0wrS1RwOUlpRWJ2UmdC?=
 =?utf-8?B?eXJNNStRSHZLUFdTZ1RheGpKUnpBM2ZVSS9rajYwTU04UDlDY3hXczZNNUdW?=
 =?utf-8?B?S2hPcXJWdFNqTjY3am5iV1NuMUszYkt5b1FieXRGVElPT2sxbk8xWm5NNnlm?=
 =?utf-8?B?ZkJ4U29zbjU1ODhrM0ZVN2N0dXR6Rk03S0dNN05UNGxHa1loYmQxUWNLMW1v?=
 =?utf-8?B?YXB1WC9tMDFqUmJPcWlsNzY4c0NhN0VXZC8zM3kzem5vbS8yTUx2U0NTZ0xu?=
 =?utf-8?B?ZFJacy9ZRVNFTldGTnZOUjZmdFExeHZ3TkliRTVGZVN5cVlsU0VkU1RHMmdr?=
 =?utf-8?B?THV4Z05SR1JDL3k4R25iVkFzTlVvUWg1YUU0QkJUa2lDdnh5eXhqY3hpV3Qy?=
 =?utf-8?B?STNsQ1Fob1FlMm8zb3d3Z0xTbWU4TzZldWVXelV4ajV0bzExWVlLQ2dVcFFY?=
 =?utf-8?Q?ObNvYqaHgqitDcbKBag7U94xd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38893a72-ad26-4434-f609-08dd3539d358
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:54:23.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL98dtyvR6oq/lqPKwMn2YLe/SoOyQGkHZKUgxbNuursPpCSgXDwiX4MN+uMQH1FUc8jEXuHDldlmQR4K+FVpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
X-Proofpoint-ORIG-GUID: CmCauVq-5pJ-9nrnuu9afRL_fNP7dSzy
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678769bd cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=vK9oiJjV01NEt7rpXagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4NPjuUn_wiVVYX1k1wZY0lQOur2bDV7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50F4wSa8004016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114894

On 1/15/25 15:46, Mingyu Wang (Fujitsu) wrote:
> I searched and found that this setting is also used in other bb files.
> May I ask if this setting is not recommended and if there are any drawb=
acks?

The network flag should only set for tasks that really need network,=20
e.g., do_fetch. Otherwise,=C2=A0 the task, do_compile for example, could=20
possibly download things from network without any verification. This=20
will cause problems related to determinism, security, license, etc.

Anyway, I just noticed that Khem had already sent out an upgrade for=20
mariadb. And that version changes the way mariadb checks for libfmt=20
compatibility, so chances are that your patch is not needed.

Regards,
Qi

>
>    --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
>> -----Original Message-----
>> From: ChenQi <Qi.Chen@windriver.com>
>> Sent: Wednesday, January 15, 2025 12:32 PM
>> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
>> openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_=
compile
>>
>> Can we avoid doing this and use some other solution?
>> e.g.,
>> Add back a fmt 11.0 recipe with a different recipe name or add this fm=
t tarball
>> in SRC_URI and change some cmake configs if needed.
>>
>> Regards,
>> Qi
>>
>> On 1/13/25 14:31, wangmy via lists.openembedded.org wrote:
>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>
>>> fix the error when do_compile:
>>> CMake Error at libfmt-stamp/download-libfmt.cmake:163 (message):
>>>     Each download failed!
>>>
>>>       error: downloading
>> 'https://github.com/fmtlib/fmt/releases/download/11.0.1/fmt-11.0.1.zip=
' failed
>>>             status_code: 6
>>>             status_string: "Could not resolve hostname"
>>>             log:
>>>             --- LOG BEGIN ---
>>>             timeout on name lookup is not supported
>>>
>>>     getaddrinfo(3) failed for github.com:443
>>>
>>>     Could not resolve host: github.com
>>>
>>>     closing connection #0
>>>
>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>> ---
>>>    meta-oe/recipes-dbs/mysql/mariadb.inc | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> index d3192cc59c..982c82cd59 100644
>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> @@ -31,6 +31,9 @@ SRC_URI[sha256sum] =3D
>>> "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894
>>>
>>>    UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
>>>
>>> +# network is required by go to get dependent packages
>>> +do_compile[network] =3D "1"
>>> +
>>>    BINCONFIG_GLOB =3D "mysql_config"
>>>
>>>    inherit cmake gettext binconfig update-rc.d systemd multilib_scrip=
t
>>> multilib_header pkgconfig
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#114826):
>>> https://lists.openembedded.org/g/openembedded-devel/message/114826
>>> Mute This Topic: https://lists.openembedded.org/mt/110583044/7304865
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
>>> [Qi.Chen@eng.windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>


