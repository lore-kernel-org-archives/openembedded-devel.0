Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31971C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 04:32:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14074.1736915530390770592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 20:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4PWT8023989
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 20:32:10 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pketw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 20:32:09 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50F4W9AZ032290;
	Tue, 14 Jan 2025 20:32:09 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pketv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 20:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLnpEWDUSPnR88fsb4bTAPz8f8Ag+paCpbz1WqXncQG2OUc62vIbuQZ8kQBAF+IgixAOwcdO6l8xI4IAF102xzs3CeA+l7ln4EmYqkyPI/lvihQGbwy48TDxDbc3/Avgn7+KCKZJ9GBQhgS8zYzgv47HmXB86jXEgOxXJqXhZvunLTZWoKCidV3Oxt3Bv/uuaYMfWYVuTKyyA7aI/tblif8iAbAf0YNzP+f15GXEjDiCBt3ZXs67ZdM35cLIYhakPzNDwMaY9MK10ye2eq9HOSRpOKkvJEtcsmqYYo1se0AS0DVfg+wOolE4gbfV+gA2Np15/wpZW5z8xafimHYljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF/cimY/E96GTuS5XbAhoJvEyIaPhOa8SnQbZllBE9c=;
 b=GPm9rRRnCuaN/QSCkZ6Aa3Y364Atmo+a3j0vaWs2nGUzaNs550xg9/IzxeYvjNKgOlWyEIpklhqo4LdxHKYqQluXG1CAYJNiCOGEDHWTLJ5No4pHwjkZVUbyc+/fFWvobEcSdIGQzs6rh1czMndfn4LBRdGQLTz4+GtFrTp+9PnVPhzGiSuFunXKxgc3qaBwC0iavokWjCLreGZOnrwx6N5keent/xO8dhDRbqpH/RdD4bYgEZUDmDj88ZzGXxVm7bzMaUM1bovYuxBdSMR9avxrTLrSfE/GwotwvpRmSjnr4JiOw28lTaTKnR8h0dBS8JJEM616HQ9lam5JAX+ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 04:32:04 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 04:32:04 +0000
Message-ID: <5540bea7-e33a-4e2a-9429-71323d819deb@windriver.com>
Date: Wed, 15 Jan 2025 12:31:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:404:a6::13) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9429be59-4b75-4cb9-a6f5-08dd351d8fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGtHalRZZ0xsQXI4Y0lmSnoyWXNsMWh0QytYd1VQTG9wUDgrYmVEMWYrTkRm?=
 =?utf-8?B?ZkhrQnNkWTdjWXJRWWs2cXpLdk51R3l1akoxWDVaenBLdXdMNlpXKzgxZ3U1?=
 =?utf-8?B?bWFRRzE5SVpMOEtjZkhBWThxMjRZb0t4WEd4Q1hPUFVIVFdIOEZqNTdQekk5?=
 =?utf-8?B?UVo0UmoxOHNtd3BwNmlPVklEUFZ2dndmaXdQSktqY1lVZTVOdlVaN0FldENM?=
 =?utf-8?B?QjUrVnNTeFE5MkFLMW1DcXpQcE9CZnUxSXp5RWh1T1RmWFVIajF4cnlnNmgy?=
 =?utf-8?B?N0JqcGFIQjRvbG1GN2Z2UUY1ZkNSTU5GdnRZY0p3K1dqekxtR0FvV2FUeHhm?=
 =?utf-8?B?NXF0RVg3ZUNuTHhmNnE4QnZWMDNFRFpVNUdJbEJoOTJXWE14cGdBbWovZTA3?=
 =?utf-8?B?QkhIc3BZY0hGemhIbkJML0VNMGxiSDFNRXl2YzlZRkl3MzVxZXk2VEpEMDd6?=
 =?utf-8?B?SzdpdlEyT21IVDRqci94cG9vNjFYOFdTbmd5WGMvdFNPMDNvZFZsaEpxY3Jh?=
 =?utf-8?B?MWsweTBPbFRmUDFIRll6SzV5OVV6S05Tai9raGtYRWpkYVJYTlBLZjZwQUQw?=
 =?utf-8?B?Y2M5NHBXZXZWelVwMTlhdXRmVmZsRGtLemo3ZitWTW9FdnVwZEVEK3BsK1pa?=
 =?utf-8?B?SzZsSStSUzNKeEZoWnZtaDB2ejlucnkySEJkNnAvb0Y1UFhtT1l3M1pjV0Iw?=
 =?utf-8?B?RGR5UFo1T0phV0dZd01KM1JRWjU2VWloaHVMRzgxVUhEa2c1MnJIN1B5enRa?=
 =?utf-8?B?MURrbVhzK296cnRwVERpQUZvZVRXZGFWbk1JUnAvSXM2NTVreXQweFBWRXdp?=
 =?utf-8?B?SklqV1dReVlDaGh3STNxT2U0dm5ncUplV1YwZVNMcitMUnhvZlBpam9LTnpr?=
 =?utf-8?B?RzQ4QXhwcU5kZzhJTzRuakVGbFV1NVQyQVd3N3R4cU1uY1Y3TDg1L3hqZmdw?=
 =?utf-8?B?c21wOWhQQy9XREs4R2l4STdRamhsYUY2TWF4NzFvTmcvYzJibjY0RXZ5UnN5?=
 =?utf-8?B?eC9BSjY4b2RpT2dnUngyOEpVQlhQM0RHSFVYVmJqQVM0Q3lmNjZiS2JEL3pE?=
 =?utf-8?B?MDRaQUNsZHc4a3BJZzBvL3JSWHdNbW1XOXkvelg1dWR6Zks4Vk1FNlpVcWc2?=
 =?utf-8?B?V21SNVdmVUF4M29iMXMrL25GSFdzRHBsNnlzUzB4OTc3S2EwT00rZzZHbnNR?=
 =?utf-8?B?M0hkU1NocmJ4bFVZVkUrQU9PMTVNN2N5aVhGcGZBSDY5anM5eUZ6Y2oyRUI3?=
 =?utf-8?B?V0NRUXFlUVhCbTJVR2JsN1F3amdPODloR1VhNlliZUNrWGtpejJRMmZvSTRY?=
 =?utf-8?B?OHhXSGFqL2I5QkpyOXI4d3E3T3VnSk4vdm9aMDZwN0VFaUxyUU9IcVhoNi9u?=
 =?utf-8?B?TjU1M3FKaFFvVkV2MDhHRUdRN2lwQzBxV0tSNm9BZnpWWlZGV2lkYWN5dG1K?=
 =?utf-8?B?TGw3UHprZlBoRFhKUGJhY0pxOUVKdnVPRzFtRTV2Zm05NmE1VHFxdDQzRmxk?=
 =?utf-8?B?VHZOV3Z2K0tyZUVPUHliOUNIUW5ON2NXbENkNWdlckZJd29La3U3TkZjaDFX?=
 =?utf-8?B?SVpnK0hBOXVrZ1dwYm1nMWVZd1dtWDVSSlBxdVU0SGxBR0JQSGdGM0hCeWQz?=
 =?utf-8?B?L3M5Zm4yY1NKRTRMZ3VwQTdQU2xmc01wbURjYUJGNHROSitVTDVNcjBwYlRQ?=
 =?utf-8?B?empPWjBsTFhuQUhIc0F0V0hRb0tSZEJJWGRoblBZYkNzTExrNndXSmIzVXhN?=
 =?utf-8?B?ejdCT3ZMVGE4S3MwUTMwRWExRUhzQkdzVFQwOFJHaGJuamJOV3FRUTdBcUlr?=
 =?utf-8?B?UDBISE52Q0lCNmVpUFRZdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGNNbEo1NWoyclBzRG9lMlpKYXpDUEhjenNyMHR3bkJlbmIvelRYZmdxWTFt?=
 =?utf-8?B?NjNYYjNpUWxFdjJyUUo5RWJsSFJzbkN5cEZaTWtEa0VJb082M1pjNzAxMXN4?=
 =?utf-8?B?SEpRdWdqamYwdnJvaHN3cENJT1J5aU5ZU1ExdE8vL3pYNGFrekVta2I4UTVK?=
 =?utf-8?B?UWUyakxOTW1EYUNNN3dwblEraTluVTV0alQ4OWRQT2FkcHRBdHkxeWVZTFYz?=
 =?utf-8?B?L2JzYzBDK1krTUtaMWhJa1I3ZEhua0hkVUFNd0w5YmNKZHBBRUxOSk9HbUdP?=
 =?utf-8?B?bFFDcXBTS29kNXN0SnQ0R2JmdUs1QkdIRXYySFZjeVk1VXpHR3hEQ1ZoR0Jj?=
 =?utf-8?B?dGtvMVlScjV5V2JIYm56ZVBGb3Q4Umg3VXNKaWhJR1dXdFlZOFRQK2hBdlAx?=
 =?utf-8?B?MUhpa3hWcmVkdTRZaGlQR3IwMW0xbzE3WUptL0dTZkxqSEt3TGFDall2VitH?=
 =?utf-8?B?N1hna3pKZlp2TVZyRTJaVnBSSk1sS1grbEFYblpUaUZnOStCZTJWZlRuOHcw?=
 =?utf-8?B?N01nbE03RjZSdFJnOC9VQWFKVUZoa294ZmtXUmpxVGpQV3d2aDEyb093R0V2?=
 =?utf-8?B?U3lmT1pESitKOXVIVk84Rm90QWovcVFWa3NlT3M0MjJjSzlHbmM2bmZCL1cv?=
 =?utf-8?B?V3FyRnBOeE5ZMExEZ1hTK1V1c0E2S2lrYnJla3hqeDNhYmEzK3g4LzdVL2tU?=
 =?utf-8?B?cGZjUDRwUzhtS3czUk42enZWTStDdklQUExEYVNhWFpJUEVkUmVwL0owKzN0?=
 =?utf-8?B?YlZtKzZ2VnJIRWg1TnBiNzA2aGdMakMvdnVkOEJXbXVUWmNHTkJ2MlhCV3By?=
 =?utf-8?B?SDYrWFViU256d3A1ZitPSEJxVFQxNThTeDBnWDJubHd4czRJSGRZK1JoVnNv?=
 =?utf-8?B?OFYzYjE1ek1xVWQrNnE4cVFJZTVyU2NHMEZLTVNpZytlTW1KVkhVUFpsdWtC?=
 =?utf-8?B?VGlVMGZGbk5iblZyRXlIQVJPam0yUGYzL2tTTndSSE1ubnhseWNnK3NBR1FB?=
 =?utf-8?B?dC8xZENERW9vY2E4YlBnT0tVQ2FSZkNONEY5YS91bEVGV2xQQVRaN2dkZHRY?=
 =?utf-8?B?Z3o3S1FxVElIRDg3QkNQVWVzM2xvcWpBbDFaSjBzQ1R0OG1YaVZ6Yk1uTGhM?=
 =?utf-8?B?YXF2NWNjelUvT2FkUEFTSTVIdnNKaSs2STRSN29UWVFFemc0dXR1UW5Wdm1Q?=
 =?utf-8?B?QUJ0cG82L01XcjlINUdlbWZjMWJ3RnQ5TmxxQlVvWFJ0SXkyRVEzT1lDaUhL?=
 =?utf-8?B?K3lOQTRRV01tazIxc3Q2UjNJdVNFOWhyUFE2L09MSGN5cWozZkxzL2FhbG5R?=
 =?utf-8?B?MVY4M0lzRjZRbkFacmdDZi82aWkxOTAyYTR0emxoVCtBQzN6OXF1Mm9iSHVC?=
 =?utf-8?B?V0hUTjEvdmhHemNoWXRXZWU2c1RDMWxDeHRVV0hEQXlFd0lXT0cvTDNTdGFJ?=
 =?utf-8?B?MWlRRWVzbEVrcERvYWdUdW1UV0FPZjB0aVI3ZnBaWW16ZjNWNVRQSk5oMGxQ?=
 =?utf-8?B?NUh3ZTVoek92cWxHOUt3VFZzUzRITG0xcm1PRGczb0dhQlJLMzRMdTJiRElT?=
 =?utf-8?B?b1d5ZkJpNUpxN2J0bk1BQnBta3dXRjRQRy9EVkxFS0Z5Ky8zdGtlWndGMFZX?=
 =?utf-8?B?NS81ZlhTSWtUNCt2ZjVySmIycHF4azh2czhWUHZJcW9MMXJ5c3VlV2p2enpT?=
 =?utf-8?B?eHMyRTRNNmNLVy9ncGxyc3NYVmpycHNWZTJjSXM5djk3R3NzOEpxSyt1ZmFs?=
 =?utf-8?B?VVdzZzBGZzkrUnM5SXAvQ29CanZYQ3F3UngxMVVCRThnNXJUU25oRm82aE9D?=
 =?utf-8?B?N01zT0lGVU1heW1vZEVRUHYyU2VheWdicWQrUzJTMi81a2dEdE5zaGRjT1V3?=
 =?utf-8?B?bk55elFrWWlsMExuRmdEVWRpekxOWEcxUUlPZFQ1bmc4ZGFCaDF2ZnlSV0Vj?=
 =?utf-8?B?S0ErTEhLelpYZ0hiUUk5STVEWUdNWjNETGRHb3puWEZJdXh5L0pJeG4xV0o0?=
 =?utf-8?B?dHgwc1R3T0VETlA0c25DOGNLTy8vWXhhMEgxOGpiSVV1YWJyTnc0YVB4bmJW?=
 =?utf-8?B?M1EvMXdoSHFuZ2l3aUNjbDV0VDFYeWFobWFWbkZrNUlFajdzQVc4d1FQKytP?=
 =?utf-8?Q?UwY5PJh6UDt0tak/dZI2DiK+l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9429be59-4b75-4cb9-a6f5-08dd351d8fbe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 04:32:04.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfMZT9YVNSBmYjhxfoaVy+ogFL4idQu0HeKSRj8HvxxOVV2kklIWTRTUNSzYeaRNSX+O64YfNb3dv75+OHp9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67873a49 cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=svcA-R6tYFZ-C08x6O4A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nrwYvrbDMM2jKyYvLsIn8543XsevQKLb
X-Proofpoint-ORIG-GUID: rQY_3b_6Uz0yIvOSCjbeLOUkh9GpmOJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 04:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114882

Can we avoid doing this and use some other solution?
e.g.,
Add back a fmt 11.0 recipe with a different recipe name or add this fmt 
tarball in SRC_URI and change some cmake configs if needed.

Regards,
Qi

On 1/13/25 14:31, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> fix the error when do_compile:
> CMake Error at libfmt-stamp/download-libfmt.cmake:163 (message):
>    Each download failed!
>
>      error: downloading 'https://github.com/fmtlib/fmt/releases/download/11.0.1/fmt-11.0.1.zip' failed
>            status_code: 6
>            status_string: "Could not resolve hostname"
>            log:
>            --- LOG BEGIN ---
>            timeout on name lookup is not supported
>
>    getaddrinfo(3) failed for github.com:443
>
>    Could not resolve host: github.com
>
>    closing connection #0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta-oe/recipes-dbs/mysql/mariadb.inc | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index d3192cc59c..982c82cd59 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -31,6 +31,9 @@ SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894
>   
>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
>   
> +# network is required by go to get dependent packages
> +do_compile[network] = "1"
> +
>   BINCONFIG_GLOB = "mysql_config"
>   
>   inherit cmake gettext binconfig update-rc.d systemd multilib_script multilib_header pkgconfig
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114826): https://lists.openembedded.org/g/openembedded-devel/message/114826
> Mute This Topic: https://lists.openembedded.org/mt/110583044/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


