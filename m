Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BF3106F300
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:28:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43425.1774513726350847451
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 01:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=F0iqZfQI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545fc33b6=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5Zbok2067943
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NG8kxf3fmymP4h6/YmTKuE7ay+O8lJV72Nz8xgeKaP0=; b=
	F0iqZfQIIDz3V2h7Pnv6nwnSDOpd3oZmaawURatc8felVrjDh3WkhrNZ/pkP9pO7
	uMeMqjhSHdNqIdZ7RO9tONwj1/Dru3da+A/KRz+WyFSZxGtDaggfFWOl6FUecRYA
	KuukGKdoks/Gt/QbR26R0qGPMRGdR+t1xkobk4fe9TCm7ajTBmXDCmg9Z+W3L26T
	XhDkvcmGu3XbCx4ICpkKry892IHkSxqYSSOefzwAyg7K5GPvFj7l8XbE/BqhILiV
	tN8n6KJ65su1v/9jF8OSIBV/eYsynKxLH2XmD3VkkXYOA006po52ust5xITvbEq4
	4PuutAkklrN0I6RNbGCCZw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj868b3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 08:28:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLkmJb7Z27Yqv6kOC3/9WMgzRLPigBHwsI57nm/OhuZPxQC5xkaJsNpj0eRe45Do9NRolH7nsVsVycaxZO5lJWH2SeOBCDo0xE7GhwhEFjvG6KFHW/WOZ4G9Ow8HdMLFVRonHwoUlQ7AwP2R5XQysDRPfH5ujb5HOsS+AibRm+IAL/t/46m247HsM5TSN9Ra3ZoT3iaKDtfobAIHFnmWUelOiSHL8C8jdnpgzBUl8QOJEd7Q2qG9QPkCUciPHDjBXWAbIoYiyAYs/Y+Acsr7IytAAPa5eY99enxQJ8exQKFrK55dxqBZqavId2q7lrMkbc2dQi75BhOei4FdkfcM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG8kxf3fmymP4h6/YmTKuE7ay+O8lJV72Nz8xgeKaP0=;
 b=XyQzWb4lmYf4N1Bz+ODSoBzBnN1tqLJrgldxX0najhBCZB/+5TB+02xWKD8Im1FPe3v47RlSP6pNEu/+W7rHphH5PzlsJcrey2ASsW6cPPGSNJDIcoixPYKYnuCf3/5aZ5sxo5bHMJZbLpzvtf6yOhDPaslfuouSjZrfJ+OMdTDLMnKeG35a+a4tIBWyEURtsp2NvJGpLm1XKkTmkrVJLK7IbcKmjT7Tm1Zn1I7JaCCB6juxXtKEm6qrLUorc9eOrpPLPAkJx4/1wajiMT1nmnfaUqvZJsxqHrip6Hnxqmen894qSuB1A54KmDvBnvkXtkDSdIbJWpnElR3a2YovRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 08:28:41 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 08:28:41 +0000
Message-ID: <12f04697-921c-4340-ad6e-c999d3463aef@windriver.com>
Date: Thu, 26 Mar 2026 16:28:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] openvpn: Upgrade to 2.7.0
To: zboszor@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20260325045056.18301-1-zboszor@gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <20260325045056.18301-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 874bd77f-9e60-489a-c64a-08de8b11af73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q4/yAQW1BHuKicGPlIFqPpRgTin3WA0He2Sr35Mnm3opq+sAj+pVCslsypt4lg2qPpDdeloY895MjrSbsuz1DBw+IBNbSbJtsfD2dRBY7KVBQ4ATntoL7A+fpF5+Ho0EHkWeMOan+TXyswbHpAB1x7GoT0hCVsLOZr0VyutRtZNRsnx6bOkEuCi018HcBL5jDC0oziiXDgHoeQPppsMX0IRyd0ez60bjnG87qss03Oz1dMwjxbdORamUhePNT7JhDh+6bJOkyvIW7+vf1CDzV+F98fVmIUZjvhPvMP0YFUPTO2C/FnT8XxAtgluMByHpUAROQh37rNxQ6LN4sP6ZwUkT1LqXgWbhWOfS3gVnvwIC79uAAN/vLv3xoz7zpd9yjbcT3N8JswpyRjiohRezGxGNf1sUv9mV2IjarEOZgAutDC8oc3oXdY1z9J0lAyG6ppPAoM/6vjn3avkBZsXRUFY4my5nPkoqNScUzZEER7SDWcSI472XzqggQvpZFrnc5thYgpsQqyJL4/pgRfRfdombJqMCS0HuwAnED04SaW1LyhJd4tdIyB2Z47RgSDwgRiMEqVWfxg39xXRsJW2jpycXjjLj9XZk/itnTT6PmAtErCxicVjLaWGgnDWBYbKxQ+AcG4d6metQpeyuB/27SFWWiHq++8t94taktrhpnago4Fd4HOUhjru17LO9iAke
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGpzYzdGTlcraU5OcFlLazlKU0Y2TFRJWUxpL1JDZGtVY3VyVVNra1dFd3FW?=
 =?utf-8?B?V2NsTkNEM1l4ZXZWTnNlbm5ldDIxYnRjTE8ya01DZGdDc250cENNTHB6L0NB?=
 =?utf-8?B?RjNEREhiajdTSHJUWUVBOUJqQTlPRVIyTW5rMGIyOGRRQng4RFQ4Wk1CRFM1?=
 =?utf-8?B?TDhaSzVid0JyV3pwTmNtRnRPcVQzQXczZHk4R2VpdGx5ZjNqUHlhY2MvYjJ5?=
 =?utf-8?B?VFQvdjFiU1JMdmFrQ2JzTlNTbzNnQ3RBWHpuZE8vNjBZbVhySGFFYTBlaTln?=
 =?utf-8?B?cHkvYVVTMlh1MTZKZklMZnNxR0RCY2tmSjFYVFVWSnNNWEZRMG9uRzIvdFFs?=
 =?utf-8?B?bFRrNkkxS1I3S0lBQnVTZWtzZkdEYSsrYU9jcGV6ekFrdTdBMkdJVm8rNkp3?=
 =?utf-8?B?TWo2Z2JKVitwdlB3RlVWTUYyT0dkejBsRG5QQmJ6bEFENk4venVVTGR4cmpk?=
 =?utf-8?B?dnkvQWk5R043dHF3RERlUXhQY0c5c1ovSjJyelQ2ZzNiT3dmZzVMYnZBLzlX?=
 =?utf-8?B?QWEyREQ1Rmw4cTJKZXZua1pOckNyTDdtUEVyRGpTeUxmajQrdG1hR1Rubjhz?=
 =?utf-8?B?cTJnNzd4SWQ3Y0wwbjBocVBUR2NZOGJyb0JWNUFhVTN4SDlxM01GYzR6bHQ2?=
 =?utf-8?B?VExBRERlQWYvME04OGJqOG1KRUt6Qk4wNVdFbzc3YVBxYUJHZUkrclBYSEZM?=
 =?utf-8?B?MGRmTUUxcVByY0hsRU9tcFYvMmtXd0lydlZTSk5PZmxTSUhvTmdKRGFCNEVG?=
 =?utf-8?B?Sm1zWGlUekNjVlBQOWdocTN6RzNQbllZNzd3OTE5am1WbFQxZ1dyWFlXSzBF?=
 =?utf-8?B?eVEyYTQ3MVc3aWp6Y3lTeW9RVzhSbk1GclZHRlB4SWo0eGRaWjh2bGVFSHNs?=
 =?utf-8?B?MTBTb3MrNEVpaGdlVk5DK0lzM09GWGlvTmNYTnY0eGpVR3VlZ1V5NzRWcGdY?=
 =?utf-8?B?OVBSQUoyNExhVVBtMDNhK0cxZWJMV2FFS1RRUlI5Umt5NEtKbEcyZ3dmOFNq?=
 =?utf-8?B?L3ZjS3RRRlFvU2VROWdaWkNvR25XamswTEF5c296SW9ZNFJldi9hWmhUYzQv?=
 =?utf-8?B?U2JZWk9QdUVvZlczMElmdjV4RVZNQXFsaUlYTTFnRXR6UEY3L250b2R0UUZN?=
 =?utf-8?B?enIvc3RUZ21sOUNTTTJuTHFCcTlSYkkvdmUrQkx6QkFWMEdUZkVOVWpWS2tC?=
 =?utf-8?B?QVlVbVY3QWExNWlQOEhHVDBlWkpYdDNJMzZWM1lqSTBmdWpKUGMxQmJaeEJT?=
 =?utf-8?B?YnVRb0tEK2V0V2pDNHVhRi9hOTk4ZjM5ZEpobm5HR2E2VnRyT3diK2Q1MHZL?=
 =?utf-8?B?bDRPdlQxWVlsZW5jNC9PbkV1UVlOZ3J2WnNFZTNDRE82MGhJVGJZaUFrWkRh?=
 =?utf-8?B?aWh2Rk9hWElxQ2JBM3pYMTExQ1laVEh5b2lEeTkwYVN0cVFZL1ZTc1RWWG44?=
 =?utf-8?B?aTgxaER4UGJYUGxPUUUyZjVLRHd5Ulhlc0w2K0FTaUc0RUNXMjhtL3dXYUJz?=
 =?utf-8?B?cVBZZjJVVUdJYnRwRkIxR0ZlZE94MWRDNVNNNDJoUTlSZytNNDNId1BrdC9U?=
 =?utf-8?B?OFQyV0pFeEtFaCtuazFWa1NodGN2WGEydGhUakZ6QWh2YmE0akVKZk5UaWRi?=
 =?utf-8?B?QW5xSEd0bmpXRERGWXBtbi9CeUMwV20zZ1ZhQVVoOVF2ZEVrZldncS8xMDJ2?=
 =?utf-8?B?QUliZkh5eWErYzdFWW1YNnp1eGFVTlowNXpzR3IrTCt2c0NnS1JHclRTQVJ2?=
 =?utf-8?B?Q1RwUEgweVB0SExaRndXNXdLTFFKLzBvdDdZajBUUnJ0WUZmc1YvV0RKQ2R4?=
 =?utf-8?B?dTBYUkNDdmRZKytHSTBHV2JNemhjQ3drV2o1VHBUYVJTSUUrb3hwMW55NDhl?=
 =?utf-8?B?bFBqRVdybE9NQXJFUUgyMGFNVFpUN1k5NC8vaDZhNE1QVnhXZkd2aDhxR2Y1?=
 =?utf-8?B?NkZkNmpUNVVGbUZrUE9zelNSc0xVY1dDb1YyaGlFamFRd1VITTJuMWZjRGRs?=
 =?utf-8?B?NG9PNFRHVnFSWVViRThEYXlITnErN3hpS0VRb28xM280cWZJOElwczEzak9o?=
 =?utf-8?B?N3pOb0NHVSt4WVZkZ0VGK1hHRmdzM2k0UEN3dU9TMkw3K1ZmUHM4RkY5OW5s?=
 =?utf-8?B?b3B0eWlXUjVwYk1iRENPYnY1c0NuNVBzZVRxUUNNVk5LUFlQWVJSaTdWNXVm?=
 =?utf-8?B?NWxqbVBzQnF0cGsxOUh2L1duMS9jMW0xS0FtWnNndWFGSEQyeG1aTkNmamVS?=
 =?utf-8?B?NFZDZGpRYWF4VVY0UEQ5MlMxSU15c1p6RXR5KzNzN3hMR2puMW00S1ZoUFB4?=
 =?utf-8?B?Yk5ncjNadVlrc1owVkEzOHZDa3B5NHAyYzRjTEU4VXBVWjFsMTUxVXhrVGZr?=
 =?utf-8?Q?6pNvNTX9KAdzdzsw=3D?=
X-Exchange-RoutingPolicyChecked: 
	l1FLGJkwsnI7q+D9bum8zOXIAsg+CgfHb4mGmxVQOq1/hmd3TynNEnQLnmoHC3gJXVHKux9lYAxTh/L8GaaiQfCcOsRAJN/Y0WDVJ/oAj38tf6vqHRXnkQWqo97w4JfpbbBc/dY2vKviICF0fGkWQ+9nYp3X7pofARRXWYvrZTiciwHViX9XXYtQCE32mxUZzUcQ1KZ3XhRtC+bQi1vbcGK1HGcpRV08a1L8B//KaSlJjlEJgy/N7VZI8kwp/uxivK+Cb3qcKeur43vis7mbogES77IUU8zHCIsku3WGIMuskm8EcZ7JLdRg+hW9bJLFKPsmm2QGfD7GMXgvlGbC7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874bd77f-9e60-489a-c64a-08de8b11af73
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:28:41.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN8iConijZ+Jwg3aXjevWhhkVzcte4I13R13fq9l22wovDvPVAdlMYabtn1mfk6qSWzxE4BhpzDAWyQkdv40Mry4X9g+DlC43mwzEW913HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: eO86PP2kn14KiB-jdWzMeR0hAX3QO0i6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MSBTYWx0ZWRfX/aIcqaGpk2kn
 62Ne2w0BxOzBrWH69SPQp7peAGfVxEDgFFUVzNCaauVmODZLC2015rKosII3EEGtecIxwy8eJgn
 hCpokRU1rTRhz7aV+yZdlgrFASgvu7sL9rHLpoFiG6clRK2yOdXfZsX2kTfUTKZ/cmJx6aG48NU
 6FAbilQltMDmPH7/jVIntG9/0Q7cxWYNyov/XLoNXDLINbHQR+YAWjX9zUly9V+u4hV8uBvrCP4
 xhckv9JGA9pUcjaS00cI2o+b+NKpph4uG3BireXJDzVHCZV2PYjjSCBRadf1fvF8nMkoAs4+xAc
 nmy6YsnzJywItggPQSxBtNPV+ObS6lB4K32A+lAwNcYSoXPB2JhSL3dgkuLxD2VnxEkiQ3IDQfw
 gVfVBGZhs4epQsb59NYrO1KYTPqH4GJu/6u6SAmCOf6/MLLLFNbGGN1RejtQV+9Jl02AN8OsvLD
 7a1ezIkcCD6ghUQr2oQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c4ee3d cx=c_pps
 a=25083kmBgh9d5ln0vqlIEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=uDo-SIiEAAAA:8 a=9dNbsytUAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=3ZU3LdYz__6gy5l6DnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Rkhf4GTZPwEC63LfVcCP:22 a=gPpeecpFUKP6j8iU7U-x:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t_PKtl2zutsesWWscVaA4hp27b7ksg55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260061
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62Q5Zbok2067943
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125637

tests/unit_tests/openvpn/Makefile.am is refactored,=C2=A0 which will bloc=
k ptest.

On 3/25/26 12:50, Zoltan Boszormenyi via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Release notes:
> https://community.openvpn.net/ReleaseHistory#openvpn-270-released-11-fe=
bruary-2026
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> ---
>   .../openvpn/{openvpn_2.6.17.bb =3D> openvpn_2.7.0.bb}          | 5 ++=
+--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.6.17.bb =3D=
> openvpn_2.7.0.bb} (96%)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb =
b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> similarity index 96%
> rename from meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
> rename to meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> index c454a93276..2567747121 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "A full-featured SSL VPN solution via tun d=
evice."
>   HOMEPAGE =3D "https://openvpn.net/"
>   SECTION =3D "net"
>   LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89196bacc47ed37a5b242a53566=
1a049"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D924af2c382c415a0a68d0d9e7b4=
83d23"
>   DEPENDS =3D "lzo lz4 openssl libcap-ng ${@bb.utils.contains('DISTRO_F=
EATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', =
'1', 'cmocka', '', d)} "
>
>   inherit autotools systemd update-rc.d pkgconfig ptest
> @@ -15,7 +15,7 @@ SRC_URI =3D "http://swupdate.openvpn.org/community/re=
leases/${BP}.tar.gz \
>
>   UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
>
> -SRC_URI[sha256sum] =3D "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37=
d93831e2fd3208b370"
> +SRC_URI[sha256sum] =3D "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef141=
8000c02290bd6dfa45"
>
>   CVE_STATUS[CVE-2020-27569] =3D "not-applicable-config: Applies only A=
viatrix OpenVPN client, not openvpn"
>
> @@ -46,6 +46,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,iprou=
te2,iproute2-ip"
>   PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d"
>   PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libsel=
inux"
>
> +RDEPENDS:${PN}:append =3D " bash"
>   RDEPENDS:${PN}-ptest:append =3D " make bash"
>
>   do_install:append() {
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125600): https://lists.openembedded.org/g/openembed=
ded-devel/message/125600
> Mute This Topic: https://lists.openembedded.org/mt/118496782/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Haixiao.Yan.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

