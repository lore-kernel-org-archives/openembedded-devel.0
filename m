Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAA2E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 03:49:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2959.1733888960035930604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 19:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2075067bc5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB1xgQ1028659
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 19:49:19 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1uqt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 19:49:18 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BB3nIor029608;
	Tue, 10 Dec 2024 19:49:18 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1uqt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 19:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjPL8Mcb+l9WHqJQDp50/vJ9DOQ5T3KRQcGSF5E1GyhNKxFmj/miU9YGmrMqRUgJils38CneMJhuLnp7Pgj7gnx1pOoHX8GaHFbZnO0cYJcFCzXzmKOF07rtu40ajleKLaxVTgprtE8WmJ1don89FDe9sFnuErNHxWo/ptqfWWFyguk7uysJS3aXnMEMU6mUuGfao5brt76MIiQLfo92I+41v1g7Dj/9nQraYcpWPVciNPJ55OsssVyxgnhwOfwWBHDkdv00xqDqsKEc8NeMSu2saGddLybV5KtVi5LvtQ81pECUq4UcuXg4f6fuEmHjXuc2BQKo/ahrCwvC2anBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mlb3YFxcY5+4XhedM9Wpums6cA3ondU3pE0UT/CIAw4=;
 b=EkrhJgGVAnuXgY7D0uDi4PGDElwN/o/KQjAMzrLu+d8M6GZ20lWvjL2gduYGcuOG7crsEM6Z6pE6eOMjv5NcDoasmN9mfXZTa84DW2jNNcPHjEUyFo92Ji5fjOebfm6WDxtcwMJdNJta+unL6TCObmfstXyRELCTsQkoWEQiQnxwtFa1w39bHSwXtj/mKVm6bEGPkm7RwuOU47wQw/yFs3HyD0MUwm4oe89GYPvDLJeYuZvCzHVuf+h2PCIW8K3QSGpeQmhzQfeyt/VHV28eE7CfXYdWcGsOb/vsSMLozGmlFyNjq7H+lKs+C1IzrrOm9Vs/Ktg5Lvz7v52dYt65Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 03:49:15 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Wed, 11 Dec 2024
 03:49:14 +0000
Content-Type: multipart/alternative;
 boundary="------------9ZpTTFQ67X1RAkgwxQ07h043"
Message-ID: <34fde8bf-eeee-4900-b5ee-24849eebce9e@windriver.com>
Date: Wed, 11 Dec 2024 11:49:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: Martin Jansa <martin.jansa@gmail.com>, schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20241204045407.2978-1-schonm@gmail.com>
 <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: b0580786-1099-4e68-f457-08dd1996c7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0k1emlMNjB3em5CMTlSTXp5N3BUODc1VDY0eWtWdUV1eE0wcGhqdkRLUVdE?=
 =?utf-8?B?RVBxcDlIOFV6cDFyMjlxRkE5ZmhSWDB0UjY5SjlSRHFxcE9SQnJlYzBmVk1s?=
 =?utf-8?B?cVZsZ3RJR3lHb3d5M01nM0pxR2FXL0QzS1ZoeC9samZKa2NST040TzlrUEpt?=
 =?utf-8?B?cWhWeEw1WTZWK3pHWS94djl3ZHFSMjlYZitoL3h2M0s2YUFHd3Qvak41M1ZL?=
 =?utf-8?B?cEgwOWVFMU1JUW5uRHNHN2hpMGVNL3JPRWRWeFJCNUIzU09DWXVrRmJjL1l0?=
 =?utf-8?B?S2JOMGtnYUdLQW0zcC9sdkZiZmQ0emtJRmpnSithRHZHOGtzdWhGdmszeFFk?=
 =?utf-8?B?NE9uUEhDK0VOak5HOUtqMFlSOEs1R3h1TXl6cFVYUUpCU2EyY3hpdXhFaklx?=
 =?utf-8?B?dVY5dVYzUERoTXp1RkNRamNOUHNrZUU0QU90TWorTitSTytGWHpkWDYxY2p0?=
 =?utf-8?B?TjAyUzZvUFVoQ3Voa2xSaVlkbEV4T0dTTlVqaXNvblRyQ2FMekk3OEZ0aTU5?=
 =?utf-8?B?OEh3MEh4cFNnVnprV3EyN2dvVWtFZnpWeGVYejZOZjVINy96M1h5ckFUeGUy?=
 =?utf-8?B?QTA4aGZJc05SdnZYK0pDN3k3MEZveVdpOXFHWDd3MWxpQS9kZ05nK3ExbmRy?=
 =?utf-8?B?Q2x2Q0RPSEZnUUNUdk9LSnRvdjN4NER1WE42Vlk5bnJxc2JCVEZYMXpXV0tK?=
 =?utf-8?B?bTM5amRxNWpxK0lhdDkvcTVINi9rTUsrai9TZENrcFZJUitPejFIU0dGbUJl?=
 =?utf-8?B?VTVZU21pWkNMaWx4MGg5M09RYW9HalpVWTNXRjhwbnNvV2ZSeHpXUDlQV3h6?=
 =?utf-8?B?NDhVY3Z5a3A0RmpRS2NiYlBkSWtZeGRDa3ozSnFOSC9NNkFqNmN5Zjl5T1JO?=
 =?utf-8?B?VFZtQ0lhaU1jdTN2QStnNEJNZlZpbXZibXRiVGZHcmlUMkpyZkluQzU2V1Ay?=
 =?utf-8?B?Y25SR1lHY0hxRjlOT2x5VkROUmVTZWVDdWUyODZqUDlPODBjNWNZN25hL1Z4?=
 =?utf-8?B?bjBCZUJpN0ZXYmdxQnhiLy9vZFVnUVdMOVFzQmlUQXA0ZzRYYVRiZzdvV25W?=
 =?utf-8?B?UUJJdTgyYkE5Uk1pVXJlWDFEbXVVY3AxdnNKQWVkVE9WcTlhbmd5QitZWDBu?=
 =?utf-8?B?UUZNSGNJd2JCUkM3WEM3SjUrYU1RUERQcURNUCt1NGxkaitDVFdPYmd3eE5C?=
 =?utf-8?B?NnpyL1FIYWk2UTNJT3JDRERBWkYveHhoU2xhQWV1dHVZVEIvZksxSXo3aTFV?=
 =?utf-8?B?bHlDMVRJYXRkazFuTVFzTnZ1RHQwaUhaeDlGeGx1K2lBT1RLeHZxbFNUK01I?=
 =?utf-8?B?VzBMU3M0KzBleWNBWnJ0eFlrWU1HZnJuYThSV2dYUUkzNzZqNXpkZ1h3bDNj?=
 =?utf-8?B?NytORklzbnZ4SGlXcXVIYVoyMWpVY2Zrc1VQKzFIbmVRRVprd1RMZ0ZmZllE?=
 =?utf-8?B?aGtZaFlncUhhakVNOU1ldlA4Y01nRmhmdU02eSttWjJrMHVGekN1eWRDNHlL?=
 =?utf-8?B?L3BLZDRlaTNCdk50akU2SmZGVHlOSFY0WmwxTVpzVGtrSWhjSUR4MHN6dTZZ?=
 =?utf-8?B?ZENJL0xoWHVPNlBrSWF2ZVpoSmpiU2ljTVljelhRYnBiNW5vVTRXSDc0bkJ1?=
 =?utf-8?B?NDZ0bHdKOGNMeWdpMDVSaHhPM2l6eFhzWTVjeFoxVjJDQUFjemhLLzl6bkxo?=
 =?utf-8?B?SVY4VUNGOGluUWtXc2hNeFFWSEtrQU9HVjhqSHpVTmVvZHQyaUNnQnN4L284?=
 =?utf-8?Q?u79TtaMd3PQ+c4p9FI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVFrcUN0WEpCZHdGNTBNSWdhbjVzcWI1bUpzcXFaa05IZ2FYZHdobWZTeWFo?=
 =?utf-8?B?RGxldjJwZmxreHpSdFRzK1pkNCs1TEZzSGowRkg2SUNQcTUzZG5URlhNS3pn?=
 =?utf-8?B?a2lHVGZoL2NVWTFFNmlyelFuREVqVldzamRoR2VEaURJOXFLellGNkJSSHZV?=
 =?utf-8?B?K2Urd1dyaG1tU2dTU1NVU2R6S2FLOUNVS0VESE1oR3B3SUFRdDZzc25HVmJz?=
 =?utf-8?B?RjNEdkNnOXFYWnVnRWdDWEJQZHpkNkZKNUw4NFJqUjFFY05wWGliVlhaU3Ry?=
 =?utf-8?B?cXBVdUN6SGJrZ2RJQWJUYit4SWFqN3NsREdXTllJQm13Z3pnczQ3WTFWLzNM?=
 =?utf-8?B?VjZzMURWUG9nbG9kam5uZUJHUWxFb1Q1US9yT0FNdVpiMWprZ0hNaFNBbGI5?=
 =?utf-8?B?Mi94RXJSc2xPSlJtTTlwcEJvbHVnK2dRbXJwbnVkMEg3WTBhbjM2OXpSWWwy?=
 =?utf-8?B?OVB1MzNucDIzYzR2TXhsSWQwMVZFR0wyZFZOelhuY25uMUdDdzA0NjNBTVVG?=
 =?utf-8?B?M3VNa1dHZWREZGgrUHhYVjU4bm4yRGpSL0J2RE16WXNVSDJhaSs2bU5wUE4x?=
 =?utf-8?B?UWdkclkvQmppWHJieTV5NkcvUEpIallHN29qZ3c4aUlxUFZhcXJhRDYvVkJx?=
 =?utf-8?B?NjYwSEY5N0NaeU83T3VXc08rQk9LQXR0dVJVRkFqRWJtM1B6Uzg0RWw4QUt6?=
 =?utf-8?B?ME9jZnJjYWVEeWUzZHBLZEJ5LzlObUJkMGY4aXN2NWVJS09VUEZVclBrZWpv?=
 =?utf-8?B?Vm5LSW9OQk5QYzBtN1E1NEk0YUlZSDdobUIvOHBWUmNyZWNwNEV6SjYySWRM?=
 =?utf-8?B?SC9YQ01XTHpIbDkzM3EwU2s1KzdaOW1ZeDNSNDh0MzYzVGpEa3JOZExzdTZw?=
 =?utf-8?B?M21tNFl0cUxCckltemlFZmJjd1lReGhuaXVlOFNBQ1RPV3U5V2Q3VkI5RjNS?=
 =?utf-8?B?Y3Y4RlhpVVRSNDFEVCtPY05MTEdQR1VkL1BNdEZiYTB6NGN5ZW9STThTcm1u?=
 =?utf-8?B?Qm1vbHNxa21yR0JxM0RCU3lOZFpta1dxQ1NNZW5QVlJydjBMbEg0YnRDdC91?=
 =?utf-8?B?OTJ5eXpkb3FOdzhUaC9nUytyMlp2SHk3Y004UTFsQmZxbVpFYVBsa2Zwa1NT?=
 =?utf-8?B?RjF6a2lPZ2N4M1paQzFuakJMV3NDWi81d3hEcUtjRDlUZFptNW5lS3JhRzRP?=
 =?utf-8?B?VTh3N3BXVWtYdnJLMm9TZ0FlRmFnL0JXUUlaNk04Wk5PN3AzVExlV0UxUEtq?=
 =?utf-8?B?WjcvbFpTWTE4OWhDRDRvZDRqK1FEVXgxYnZBUlNoTUpsdHk5TWVOME9DMUtN?=
 =?utf-8?B?ekt0RXc3aWpCOEtrSVQvb1hKajlqbGYxZjZObThybDdnK3ZRYndUdGJqNXdy?=
 =?utf-8?B?c1Fqc25kWG9IUnd3VDJzSWN6UW5taUFFNDRzclhjTmJxeVpFMkxudGtGOFVk?=
 =?utf-8?B?bTZjakVrUDhvc1grTmt5SG1oN2IzOGNVNmdXY1pnSFUyK1lEMUNrTXhCSFlX?=
 =?utf-8?B?UFF0RzZPNEN1KzRaY0pmRUJOWEpJVVV0Q21pWUUwWjZnV2NRWkdXTXIyUk1P?=
 =?utf-8?B?S0F6UFlmMGpjRys3WUJmSjg1RXkvRVhpTWtIZW9BT0lXZ0NDdGFlY0pyUFJa?=
 =?utf-8?B?SnNnOXcweFNJa2IxSEZFNmZJZTJsSWRSUzFMbUlDd3didGg2MTVRdThodmFT?=
 =?utf-8?B?aFg0UFlDODdraUVSNFFndDdxK0xZdDBnQmRQbGhSVHVBaEMycnd3VEkwZUJL?=
 =?utf-8?B?bUJQdlhsMmFuRytoTE5jTEFMaXd3ZW5KcWt1alNYaWgzWTJiWU9ya2hwQmd6?=
 =?utf-8?B?YXlyWm00OXhJeUpYeXpVeGpVdnJ0Q09FZy81NTBiSlMwWlY5MnFHeWFpK3lL?=
 =?utf-8?B?VzNpRG9JNEFkdUtTYVpsMjdwSTNFREpyWVFBTlJnMWovNnBSWTk2VXZ1WmlQ?=
 =?utf-8?B?dmtSRWRNa0EzR2FwamY4WnY2eFZOVzhDMWppa1IvaWQzbDdkVVptc09lS3hx?=
 =?utf-8?B?WGJhQm5nVUxBY2ZycXBsOUVSdXo4N3czeXJndmZzTVRWSTc4SlNRMU0zNG1w?=
 =?utf-8?B?L0VlcWV4Y0tSd3FoWWw5VllHWllpQWU4MVlZNDRCWm9NTDFhNjZyRDhJSkRF?=
 =?utf-8?B?NStqQmhDM2hGVDRWK3pMbXhidkowbE16Wkovc1cxekp1TzBwK1dTNkRDWkdw?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0580786-1099-4e68-f457-08dd1996c7dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:49:14.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M8uB0uQ8k5EdDlUp7419UKCveZ6/vZJAaMGQyRtJRpJwz7VQmGUSDkdte1w0Vt7T+Hg7icYfYoblB52bwNZ9s2mBrLxTl87LvfoscBkpYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-ORIG-GUID: 3xbMdrJ8JoJ4c6Y3OT3ulTJUguGAN6X-
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=67590bbe cx=c_pps a=QfxD4CzqCnNUzUqh5S/TIg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=-LCu6K_DAAAA:8 a=pGLkceISAAAA:8 a=kps5DjfMiZ3d5VSdEd8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=E3k6eB6KuMJFupH31GoA:9 a=XQRU7gjdkByMGtC-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: g2QXM48IOzZoslTP3CG1XJXA3sA4j39y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_02,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 03:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114267

--------------9ZpTTFQ67X1RAkgwxQ07h043
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BB1xgQ1028659


On 12/7/24 22:08, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This seems to reintroduce io_uring support in embedded libuv from:
> https://github.com/nodejs/node/pull/55114/files

I cannot reproduce this issue since I cannot even compile nodejs=20
successfully,

poky master qemux86-64,=C2=A0 do_compile failed with error:

g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=80=
=99; did you=20
mean =E2=80=98-std=3Dgnu++2a=E2=80=99?

>
> which leads to the same issues as previous nodejs upgrade in:
> https://lists.openembedded.org/g/openembedded-devel/message/105583
> https://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978c3=
1ee41d28206c6ff198d7d9d701d88
> https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e9290=
f6750e44ab52536bbe9268d5afac3
> https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb28628991=
ec9be9610540401f7c6cc4c19997f
>
> pseudo still doesn't support io_uring:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
>
> calling chown in hundreds recipes to work around pseudo limitation
> doesn't seem good work around.
>
> The UV_USE_IO_URING variable still exists in code (even after its
> documentation was removed in:
> https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb313491=
4653d2e1

I think the problem reproduces since io_uring support is enabled again=20
by default in above commit, which is in 22.12.0.

for now, UV_USE_IO_URING should still work, we can use export=20
UV_USE_IO_URING=3D0 to disable io_uring, but as the doc

said maybe UV_USE_IO_URING will be removed in the future version. so=20
another option is to add a patch to disable io_uring like

this:=20
https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-devto=
ols/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=3D=
0d9351e9290f6750e44ab52536bbe9268d5afac3

> ) but it doesn't seem to work.
>
> It's failing because the
> 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
> https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-dev=
tools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=3D=
6652b031d7d4d9cabf16d481f3b82115f7d8e15a
> is wrong (it adds
> meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-suppo=
rt-in-libuv.patch
> inside nodejs source instead of patching deps/uv/src/unix/linux.c).

Yes,=C2=A0 this patch is added wrongly.

//Changqing

>
> I've restored the patch properly in:
> https://lists.openembedded.org/g/openembedded-devel/message/114222
> but it still isn't enough and recipes fail in do_package or
> do_package_qa (depending on UID used on host).
> Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
>
> +Changqing Li
>
>
>
> On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org>  wrote:
>> License-Update: Add JSON parsing library under MIT license.
>>    https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb=
8d03ac37052bbd4ccb6d239
>>
>> Drop backported patch fix-build-with-icu-76.patch.  It is already
>> integrated in this versionhttps://github.com/nodejs/node/pull/56040/co=
mmits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9
>>
>> Changelog:https://github.com/nodejs/node/blob/main/doc/changelogs/CHAN=
GELOG_V22.md#22.12.0
>>
>> Signed-off-by: Jason Schonberg<schonm@gmail.com>
>> ---
>>   .../oe-npm-cache                              |  0
>>   ....11.bb =3D> nodejs-oe-cache-native_22.12.bb} |  0
>>   .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -----------------=
--
>>   .../{nodejs_22.11.0.bb =3D> nodejs_22.12.0.bb}  |  5 ++--
>>   4 files changed, 2 insertions(+), 32 deletions(-)
>>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D> n=
odejs-oe-cache-22.12}/oe-npm-cache (100%)
>>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11=
.bb =3D> nodejs-oe-cache-native_22.12.bb} (100%)
>>   delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-=
with-icu-76.patch
>>   rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D> nodej=
s_22.12.0.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-=
npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-=
cache
>> similarity index 100%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-n=
pm-cache
>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm=
-cache
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
>> similarity index 100%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.=
11.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12=
.bb
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu=
-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.=
patch
>> deleted file mode 100644
>> index e8501bcdb..000000000
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.pat=
ch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 200=
1
>> -From: Michael Cho<michael@michaelcho.dev>
>> -Date: Sun, 27 Oct 2024 10:08:07 -0400
>> -Subject: [PATCH] build: fix building with system icu 76
>> -
>> -ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no long=
er
>> -add `icu-uc` when linking to shared libraries. This results in undefi=
ned
>> -symbols/references when trying to build with system ICU 76.
>> -
>> -[^1]: unicode-org/icu@199bc82
>> -
>> -Upstream-Status: Backport [https://github.com/nodejs/node/commit/8151=
7faceac86497b3c8717837f491aa29a5e0f9]
>> ----
>> - configure.py | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/configure.py b/configure.py
>> -index a5f47af1748903..a4e210261e2e76 100755
>> ---- a/configure.py
>> -+++ b/configure.py
>> -@@ -1879,7 +1879,7 @@ def icu_download(path):
>> -   elif with_intl =3D=3D 'system-icu':
>> -     # ICU from pkg-config.
>> -     o['variables']['v8_enable_i18n_support'] =3D 1
>> --    pkgicu =3D pkg_config('icu-i18n')
>> -+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
>> -     if not pkgicu[0]:
>> -       error('''Could not load pkg-config data for "icu-i18n".
>> -        See above errors or the README.md.''')
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>> similarity index 97%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>> index 8cbf53978..194df4c33 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>>   HOMEPAGE =3D"http://nodejs.org"
>>   LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 =
& Apache-2.0"
>> -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D25e89142a2f4b075904a9986c45=
fbdb2"
>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0bd28a461eccad39f85a29e33e8=
f879f"
>>
>>   CVE_PRODUCT =3D "nodejs node.js"
>>
>> @@ -28,7 +28,6 @@ SRC_URI =3D"http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \=20
>> file://0001-deps-disable-io_uring-support-in-libuv.patch \=20
>> file://0001-positional-args.patch \ file://0001-custom-env.patch \ -=20
>> file://fix-build-with-icu-76.patch \ file://run-ptest \ "
>>   SRC_URI:append:class-target =3D " \
>> @@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D " \
>>   SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>>              file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patc=
h  \
>>              "
>> -SRC_URI[sha256sum] =3D "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad=
4fea9cb29006d8e1d35"
>> +SRC_URI[sha256sum] =3D "fe1bc4be004dc12721ea2cb671b08a21de01c6976960e=
f8a1248798589679e16"
>>
>>   S =3D "${WORKDIR}/node-v${PV}"
>>
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#114193):https://lists.openembedded.org/g/openembed=
ded-devel/message/114193
>> Mute This Topic:https://lists.openembedded.org/mt/109914816/3617156
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------9ZpTTFQ67X1RAkgwxQ07h043
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BB1xgQ1028659

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/7/24 22:08, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdXHkju6U1355phTU64K6MMR+=
DrwBbXjyGTsiH+w-j=3D+A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

This seems to reintroduce io_uring support in embedded libuv from:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/node=
/pull/55114/files">https://github.com/nodejs/node/pull/55114/files</a></p=
re>
    </blockquote>
    <p>I cannot reproduce this issue since I cannot even compile nodejs
      successfully,&nbsp;&nbsp;</p>
    <p>poky master qemux86-64,&nbsp; do_compile failed with error:<br>
    </p>
    <p>g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++=
20=E2=80=99; did
      you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?</p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdXHkju6U1355phTU64K6MMR+=
DrwBbXjyGTsiH+w-j=3D+A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

which leads to the same issues as previous nodejs upgrade in:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105583">https://lists.openembedded.org/g/op=
enembedded-devel/message/105583</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3Dd08453978c31ee41d28206c6ff198d7d9d701d88">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978c31ee=
41d28206c6ff198d7d9d701d88</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e9290f67=
50e44ab52536bbe9268d5afac3</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D7bb28628991ec9be9610540401f7c6cc4c19997f">h=
ttps://git.openembedded.org/meta-openembedded/commit/?id=3D7bb28628991ec9=
be9610540401f7c6cc4c19997f</a>

pseudo still doesn't support io_uring:
<a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15244">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D15244</a>

calling chown in hundreds recipes to work around pseudo limitation
doesn't seem good work around.

The UV_USE_IO_URING variable still exists in code (even after its
documentation was removed in:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/louwers/nod=
e/commit/2b298e132d2f681270e9f3d5eb3134914653d2e1">https://github.com/lou=
wers/node/commit/2b298e132d2f681270e9f3d5eb3134914653d2e1</a></pre>
    </blockquote>
    <p>I think the problem reproduces since io_uring support is enabled
      again by default in above commit, which is in 22.12.0.<br>
    </p>
    <p><span style=3D"white-space: pre-wrap">for now,  UV_USE_IO_URING sh=
ould still work, we can use export </span><span style=3D"white-space: pre=
-wrap">UV_USE_IO_URING=3D0 to disable io_uring, but as the doc</span></p>
    <p><span style=3D"white-space: pre-wrap">said maybe </span><span styl=
e=3D"white-space: pre-wrap">UV_USE_IO_URING will be</span>
      removed in the future version. so another option is to add a patch
      to disable io_uring like</p>
    <p>this:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/diff/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-di=
sable-io_uring-support-in-libuv.patch?id=3D0d9351e9290f6750e44ab52536bbe9=
268d5afac3">https://git.openembedded.org/meta-openembedded/diff/meta-oe/r=
ecipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv=
.patch?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3</a><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdXHkju6U1355phTU64K6MMR+=
DrwBbXjyGTsiH+w-j=3D+A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
) but it doesn't seem to work.

It's failing because the
0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/m=
eta-openembedded/diff/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-di=
sable-io_uring-support-in-libuv.patch?id=3D6652b031d7d4d9cabf16d481f3b821=
15f7d8e15a">https://git.openembedded.org/meta-openembedded/diff/meta-oe/r=
ecipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv=
.patch?id=3D6652b031d7d4d9cabf16d481f3b82115f7d8e15a</a>
is wrong (it adds
meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support=
-in-libuv.patch
inside nodejs source instead of patching deps/uv/src/unix/linux.c).</pre>
    </blockquote>
    <p>Yes,&nbsp; this patch is added wrongly.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdXHkju6U1355phTU64K6MMR+=
DrwBbXjyGTsiH+w-j=3D+A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I've restored the patch properly in:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/114222">https://lists.openembedded.org/g/op=
enembedded-devel/message/114222</a>
but it still isn't enough and recipes fail in do_package or
do_package_qa (depending on UID used on host).
Reverting to 22.11.0 avoids the issue. Anyone else seeing this?

+Changqing Li



On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:schonm=3Dgmail.com@list=
s.openembedded.org">&lt;schonm=3Dgmail.com@lists.openembedded.org&gt;</a>=
 wrote:
</pre>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdXHkju6U1355phTU64K6MMR+=
DrwBbXjyGTsiH+w-j=3D+A@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
License-Update: Add JSON parsing library under MIT license.
  <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nodejs/no=
de/pull/56040/commits/27bcd103e775e00eb8d03ac37052bbd4ccb6d239">https://g=
ithub.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb8d03ac37052bbd4=
ccb6d239</a>

Drop backported patch fix-build-with-icu-76.patch.  It is already
integrated in this version <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/nodejs/node/pull/56040/commits/c3ca978d9c73d1a96f4d5c7bfa=
3c10ce786b8fe9">https://github.com/nodejs/node/pull/56040/commits/c3ca978=
d9c73d1a96f4d5c7bfa3c10ce786b8fe9</a>

Changelog: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/=
nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.12.0">https://gi=
thub.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.12.0</a=
>

Signed-off-by: Jason Schonberg <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:schonm@gmail.com">&lt;schonm@gmail.com&gt;</a>
---
 .../oe-npm-cache                              |  0
 ....11.bb =3D&gt; nodejs-oe-cache-native_22.12.bb} |  0
 .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -------------------
 .../{nodejs_22.11.0.bb =3D&gt; nodejs_22.12.0.bb}  |  5 ++--
 4 files changed, 2 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D&gt; no=
dejs-oe-cache-22.12}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11.bb =
=3D&gt; nodejs-oe-cache-native_22.12.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with=
-icu-76.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D&gt; nodejs=
_22.12.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cac=
he
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-=
cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-ca=
che
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.=
bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76=
.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.pat=
ch
deleted file mode 100644
index e8501bcdb..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
-From: Michael Cho <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mich=
ael@michaelcho.dev">&lt;michael@michaelcho.dev&gt;</a>
-Date: Sun, 27 Oct 2024 10:08:07 -0400
-Subject: [PATCH] build: fix building with system icu 76
-
-ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
-add `icu-uc` when linking to shared libraries. This results in undefined
-symbols/references when trying to build with system ICU 76.
-
-[^1]: unicode-org/icu@199bc82
-
-Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491aa29a5e=
0f9">https://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491=
aa29a5e0f9</a>]
----
- configure.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index a5f47af1748903..a4e210261e2e76 100755
---- a/configure.py
-+++ b/configure.py
-@@ -1879,7 +1879,7 @@ def icu_download(path):
-   elif with_intl =3D=3D 'system-icu':
-     # ICU from pkg-config.
-     o['variables']['v8_enable_i18n_support'] =3D 1
--    pkgicu =3D pkg_config('icu-i18n')
-+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
-     if not pkgicu[0]:
-       error('''Could not load pkg-config data for &quot;icu-i18n&quot;.
-        See above errors or the README.md.''')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.12.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
index 8cbf53978..194df4c33 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D &quot;nodeJS Evented I/O for V8 JavaScript&quot;
 HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://nodejs.or=
g">&quot;http://nodejs.org&quot;</a>
 LICENSE =3D &quot;MIT &amp; ISC &amp; BSD-2-Clause &amp; BSD-3-Clause &a=
mp; Artistic-2.0 &amp; Apache-2.0&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D25e89142a2f4b075904a9986c45fbdb2">&quot;file://LICENSE;md5=3D=
25e89142a2f4b075904a9986c45fbdb2&quot;</a>
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D0bd28a461eccad39f85a29e33e8f879f">&quot;file://LICENSE;md5=3D=
0bd28a461eccad39f85a29e33e8f879f&quot;</a>

 CVE_PRODUCT =3D &quot;nodejs node.js&quot;

@@ -28,7 +28,6 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz\file://0001-deps-disable=
-io_uring-support-in-libuv.patch\file://0001-positional-args.patch\file:/=
/0001-custom-env.patch\-file://fix-build-with-icu-76.patch\file://run-pte=
st\">&quot;http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
-           file://fix-build-with-icu-76.patch \
            file://run-ptest \
            &quot;</a>
 SRC_URI:append:class-target =3D &quot; \
@@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D &quot; \
 SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-ppc64-=
Do-not-use-mminimal-toc-with-clang.patch">file://0001-ppc64-Do-not-use-mm=
inimal-toc-with-clang.patch</a> \
            &quot;
-SRC_URI[sha256sum] =3D &quot;bbf0297761d53aefda9d7855c57c7d2c272b83a7b5b=
ad4fea9cb29006d8e1d35&quot;
+SRC_URI[sha256sum] =3D &quot;fe1bc4be004dc12721ea2cb671b08a21de01c697696=
0ef8a1248798589679e16&quot;

 S =3D &quot;${WORKDIR}/node-v${PV}&quot;

--
2.43.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114193): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/114193">https:=
//lists.openembedded.org/g/openembedded-devel/message/114193</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109914816/3617156">https://lists.openembedded.org/mt=
/109914816/3617156</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9ZpTTFQ67X1RAkgwxQ07h043--

