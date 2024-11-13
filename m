Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99A3D41C34
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 10:48:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9115.1731494882402718756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 02:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1047842519=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7D3wx024491
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 10:48:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv49vu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 10:48:01 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ADAm1vn019078;
	Wed, 13 Nov 2024 10:48:01 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv49vu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 10:48:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZ640n2VTdJSGUFBOKKB7Zvt1BEPIto7UoxeOdPRf8wzgw5oTuDMSP3kAhvLtRUZOGqrNAg6w2ehbgGfLH+sAK4EEvgQkJ9w1Qn2pnqbJTqKzm/xv0dsftE4uognZge6csH29CANaZqwc6or9OmpzzoKJVJJ8IrzzZ9GGmG07xMuF1E0VLVRtNhGHJj6ycmH9id9lSVfb5dwl0mVZrakxyzHE8NBMVdjVO4xUgShSUwXnQzlzHVHnskJ1roPv+xPg4ETKyENYyB++3NGKPWUnT8AJJ/oxJqT/CA3mVP64lycDySKX38N2ESlmr1yIwCAGOZeyyLI5hiXgOy8xWIsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa+2NTIZCS3AjBEa8r0gk/1q/Ad5cihyLwuGeOHgUug=;
 b=IWjw2rueoU4r2wOX8X6KuPaM7HNJTp+d2Uke1IVS5vZ6qutIp6WTbbC+Np2i+y5gdFO5I9H5ihwul6Yt+PA/agJ/30crqn5KY4rbdpqJS9H6W2eifyLLq20kMFV/ZpKxGUpdJVXvi4itfRMfJwj+4kM9LNUOHBseiwvb5LNtAxtept5oXgNZ7ByhQBbLaVmavSL3UCqAv0ldlumRBGXF5txRAeJGcdx18FjDCXioHyA3TpWBDSVKI+vQuz1QOctuMpyYpmRqLAIzAqVR77Im0IKTqSHIlsDnx0XM9OVl5sZ306WJrUrkqI40QtdihxVQtxmOOKNkicep6sqjJSJjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Wed, 13 Nov
 2024 10:47:56 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 10:47:55 +0000
Message-ID: <90f670b7-7a53-4048-a40b-d9da7df7bcf9@windriver.com>
Date: Wed, 13 Nov 2024 18:48:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][kirkstone][PATCH v2 1/1] openvpn: upgrade
 2.5.6 -> 2.5.11
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20241113093121.2520563-1-haixiao.yan.cn@windriver.com>
 <urka7yjk24traq7vlsurflua4hwd5muhvmgvd5el6nhxulvglg@caaulbuwj2jg>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <urka7yjk24traq7vlsurflua4hwd5muhvmgvd5el6nhxulvglg@caaulbuwj2jg>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd60280-9fd5-45d7-54d3-08dd03d0a1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXB3UXViTGlFN0xxVFdhRTRjd21wcjRvb3hocnR2UmFBeGpaMk5WaHdFUUR1?=
 =?utf-8?B?YWloT0pKaU92SytHaXVqbmFXR3NvWjVnNlEwS3R3aDAxdks4N1E4YjFJUFUx?=
 =?utf-8?B?TVFpMkpNT0V6VUg1VVRuVjgrdllYZmd6Z0tWR3NXUjFFbUJ3ZFZKQnpLM0tY?=
 =?utf-8?B?NHhGZVBwZnJncGRKUldId3hJeWdQanIxa2FDSnNmQ21jMW9FTGxSaG9IazdS?=
 =?utf-8?B?K3k1QUpLOTRjbHcxVUhQKzk2TFU2aUFqRnBDK3MvMmQxVndPWUFiU0lkYjFt?=
 =?utf-8?B?NXgzRkdqQVp1NnNCb3FONmZmQUZCNHVBbjEzWHdGYmZmS1ZpK2lDREd0MDUv?=
 =?utf-8?B?T2ZVMjRWMEdMcFRTTU0zckxraVpDa0c4TCtNbjByK2N3Mnh2VGcyVTJOL09D?=
 =?utf-8?B?SGdDZmM1YmNBUHF6YTJwZDVwU2JuWHczOVhkQmhCSkw5ZmRqZEJTa3VUcVgx?=
 =?utf-8?B?b0Q3YytRY0w3Q0VwU0FDYy8zVHZYS1Z0dm5uNFY1UFF0K0Q4UlBjMUxyNmhH?=
 =?utf-8?B?Nk42bzk0b0VCN2F2OXJkZlFOV3ZOTWR6V003OGhySlVQd2N4cEU3RmJzcnVo?=
 =?utf-8?B?SXhzRnBCZXJhd3ViT1E5aDBFZ2pVRHc2OVovbWwyN0U3Y2NNaE5HWVZ0ZkJH?=
 =?utf-8?B?bGJlMjlqeWF2UjhObDFyU2JhSTFOR2ZLQUp3ZlE5c2lQako0ZE9CL2VmL3p1?=
 =?utf-8?B?RXlpekhwTHVhUkdnWHFCWUdQcXlmRkRqb205b3VSazY0QmlXOFRnbk5JcVh1?=
 =?utf-8?B?QWowYTdHNlJaTjg1L3hiaWE1emI3RGd4b0pROFVzK3A2aXdFVHdTYXNwM1Az?=
 =?utf-8?B?MDFBZ01HOFp3VmhheWtmOEdSQnZMV2k1SDJzYkdyYXZOTXo1b1FPWGxXK2RI?=
 =?utf-8?B?SmdrS3FIMWNvR1VITmFOQ01xc3liTlpwN2YwM2plc1YxQnhTQkRuVno1c0Vp?=
 =?utf-8?B?OXVLSzYyWVoxNVV0ZTVvck8yQnFtQ2MrSElua1lmVTNXd3g2Vkd0d1R4Qloy?=
 =?utf-8?B?dlN3QkZ4VXgyM2NFS3ptb1E5bDViaXdBZ25ob0lXRWpORENSWXdKaEFBYzZ6?=
 =?utf-8?B?YzRHRVBPYmVYZWpsazM3aGt1aGFkOFQ0bi9rQjgwR1phQUV0V0F1bXdXODdO?=
 =?utf-8?B?OVRMQ1Q3RkxDQ1NmMmtDUTJCdjdMdStzbjFOaFJLeERSZFc5QytVRHordHVL?=
 =?utf-8?B?VmlKTm1Nc0VjcVdoTkVWMHBxSWxpWTQ4ekx2VG9BNHd4VDc2ZThHV3pTZ3Jo?=
 =?utf-8?B?Y21tRjdsZVR2OHhBazFPdmZoQ2FpbXJtNVRhcnlMSlNHc3RaSFI0WHFvQ3Rl?=
 =?utf-8?B?SjhaaDdaT01kODIwTVVyTWVuRjl3TlBQMVN5cjMzSVlLanVjVkxtcWV3OUpm?=
 =?utf-8?B?cWpYeDI0YlFmQUZxVTk0MWpSbXJnZElMSHdEZjFXdUk3bjlCeVZXYVdYWGNB?=
 =?utf-8?B?ZGIydVVtcCtiRHVrck5zU21lSGJFeDZvMWxidTU2ekFxcm01b3J3QW9JbVBF?=
 =?utf-8?B?TnRYTmkwb2RCQlR3M3RLdW94KzRISzNIbWRmMTNwTE5JaHNQTUdERVI4eVNX?=
 =?utf-8?B?RUFEZGJIUnBhWU4rZVh0MkF6MlA1VVA1QkxyRnpWay9keFFHVE9oOTZ4OFN1?=
 =?utf-8?B?WGlBZVJIZ3dlNUhGeS8xR1JudFkzUTQvbHVOZmZxMi83QmRrQ0JCeFNaLy85?=
 =?utf-8?B?YlNlZlhjUjZkejRSbzd4K2VVaDRXNkR3S29FNWJoWHFzTE5OdHZ5L1NVR0c2?=
 =?utf-8?Q?Gb36OPikOb1+fpU130kppUdbYgNnSSALdMa4Rjf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkY0NjdkTGYrQ0E0Q2FFODZ1RXk4WTBCZXFFblQrQnFxREs4RnJPV3VIanFR?=
 =?utf-8?B?Q2ViWFJDL0xiN0U0MFlQa05CV0RYc3RObmQ0MUo2TEhzSm8xdWJrVThTQllk?=
 =?utf-8?B?VHBuTDducHdVMmRuWEIyNWhad1dlV3pGRzQydWZmcVhBZGhJUEdDd3BieGxI?=
 =?utf-8?B?bitNa0dzRVNGY044ZEo2c2xwejdyaUo5S0dndENaUkRrRitQdEd1T2lJTWp6?=
 =?utf-8?B?eC8wdVhqTW1uM1gxajlMVTQxWklhT3ZNaG1pdUtkb0MwZXNRVVArcXgrdTFQ?=
 =?utf-8?B?aG1DV0dHdHkxd3dYdnhDdTRRN3RVVVlGWW5ndy84UXVtSjU0UVphUXI4WHd4?=
 =?utf-8?B?S2VnMU1HZHMwWVF0akpEU280ZWsyQWhPMURBUnJuSmFwV3RNRVpTOEJsWU9M?=
 =?utf-8?B?Y21SSTZsMWRGd00zL1ppNVorbXdXaVAxM2tiZkVRVGttYnk3OHZ6aEl0bkhB?=
 =?utf-8?B?UkdiMExsWkZvNnk0VGw5T3VyczNJMGEwMkY2VC9BOTk0SVVYd1FPWnBja1pw?=
 =?utf-8?B?cW1VSG93aW90VEFuZnFvKzhadTlBdmVCMWIva09hSkRRaCtQVUYzd0Fybm9u?=
 =?utf-8?B?UDcxT3dtZFJqMkJJRnRBdG55UmxhQmJWaXRHRklBU1lsZVRmM05ZbllDT2Nz?=
 =?utf-8?B?OExZazU5RlZvMkQyeXlscG1lcHNjTXQvdURHT3BWaVVBV0JZd1hxQUd3NHZa?=
 =?utf-8?B?MWc0YlJNVHRHQlFSK3l1U2l0TE1KQzk0TDhLcHBsaUVOTWN0aXRpSWMrUHoz?=
 =?utf-8?B?SjIzT2VFSFNlL20vRWovRzFDQ0I4TS9WUitNb2NpazhYZ2d5NWFBWHh6akpS?=
 =?utf-8?B?QWRTd3gxdFhmOHc3Ymp1cnAxY1BlT1p6MWRxdlBUWjc4b29mNEsxMjlhZUd2?=
 =?utf-8?B?Q3JKU2xaMTV1QS91M0xac1lTWjdSLzc2azlpZGcvTHhyY1NYUy9oL0hzVGdy?=
 =?utf-8?B?T2t3YndkMjZvUnJFZWk0M3k0YWcyYjlrTWhHbW82MXZpYkhJYWcvdThrM2NX?=
 =?utf-8?B?c3djMlN6bTZUb2ZjU05rMFdGa3RTaFgrVXM2d0w5dE5KZVE5MGU0aGxMcXJu?=
 =?utf-8?B?V3NzbG5iQ2VNVEhEa095a0htVHVaVWt4QmhxN3Q4SDdmYnF3S25VTHVVVVpP?=
 =?utf-8?B?RVZFWWZOOW1MZU1yQTRxYVlVdWV2Mnk1ZG9ZQ25NZW8yT2pYYUNWRG0vSThY?=
 =?utf-8?B?clFhM0E3UmxUV1dXbjIwNkR6TzRjRHV6eDVrbGVUQzVzU1l5M3RFanFQRW96?=
 =?utf-8?B?TmtFQlVNRDQ4WjdpWlFrQ00xUVdkeTYvRHlOSThPL0RvS1BQQjFoTUJPQkI3?=
 =?utf-8?B?ZlNBQWhhMUgrZ1FVYnlRd2RYc2VwMWdSeFFxbUh4bzkvWWNZMjRsNVVwbnc0?=
 =?utf-8?B?SlR5c2pSeVJwMFlHZTUzTE5pdkdBaFhmU3o0eDZBK3lwTjkxNGNqdEtNR3RQ?=
 =?utf-8?B?dnJMalo2RkZqei9KcmFubVArU1REMlMvcHYxTzhlRG9GZnRVa093OWJGRFdN?=
 =?utf-8?B?b3lPdUJEM3gxc2hQMEN2ZlJVQ2twOVppYmE0Zk9IbVFsazg5cE5TaGFUQzJ6?=
 =?utf-8?B?UE0wM2NYVVNDOG0xQWJ5QXhnUTJaUEtxbmx6S0psWm9GUFRjM3BydDhzQU1Q?=
 =?utf-8?B?ZXJESlY2VURTRHNlRVVPaXNFdmlEcEZWTEJCb21LWVM5VWJPVzI4Yis5Mk5p?=
 =?utf-8?B?RlZuQk5QblMrYTN5VGNhWFg1VEVXdmhvanFKMmhNM0RvUVU4Vmp4TVFqdXgx?=
 =?utf-8?B?UldIT1Q2ZnJkd1paL0ZtN0YxV2w5M2FEYXV6aXE5RUV4MkwyUXNnK0F0TDQr?=
 =?utf-8?B?REI0SllzcmpLMGJjUnBGWHVWNDlSUWswOURZSjg2VHE0T0gxeEc5U25rR0kx?=
 =?utf-8?B?aFpaSHhOT3dsbUhaMEprb3NEYnAvNTllWXdXd2RtRGNPSFd4MHBWVXNqeHpQ?=
 =?utf-8?B?emsrVGFUeVBwelVKNVVWeWZhRVRLbklSTmlvVHMvN05reWV2NlZSYU9selFV?=
 =?utf-8?B?c1NHVjZVdnRZQjJ4elUzUU94V2gvUnFtdXpYOU45NUsyNDhqdUFZdDJqNzNw?=
 =?utf-8?B?d0hTTEhBRmdYNGV2UUNCR0dmNmpORjNsbGhiMjNjejdtV3FpdUN3NSs0MDdT?=
 =?utf-8?B?UllZRjFpMm5oSWNyMTlCYVRQNGUvTi81Wm9aeUFmQjZhRWtXdlJFcjNpeGNn?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd60280-9fd5-45d7-54d3-08dd03d0a1ab
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:47:55.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq0YEtZUZY4bclx1r1FDxK2HTuRJBK2/XxZHi8MLdiao6YiYJr8KmHggDMaQQyOSGRaoDqo8wZILoJTjrUWCWfOiD2S1IhVDq7FE2nJdI8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
X-Proofpoint-GUID: 02rYSxzmIARqWpWwDRzIA1TENfGOVSan
X-Authority-Analysis: v=2.4 cv=Ke6AshYD c=1 sm=1 tr=0 ts=673483e1 cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=hr3FOmHRdU9cMmme2DkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eGgW26ivpx4LLkii4W-EZ6oeJ7_EM-w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AD7D3wx024491
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 10:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113806


On 2024/11/13 17:47, J=C3=B6rg Sommer wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Yan, Haixiao (CN) via lists.openembedded.org schrieb am Mi 13. Nov, 17:=
31 (GMT):
>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>
>> License-Update: Add Apache2 linking with for new commits [1]
>                                        ^^^^^^^^
>                                        Is this spelling correct?
> It's copied from https://github.com/OpenVPN/openvpn/commit/4a89a55b8a9d=
6193957711bef74228796a185179
we can change to:

License-Update: Add Apache2 linking for new commits [1]


Haixiao

>
> Regards, J=C3=B6rg

