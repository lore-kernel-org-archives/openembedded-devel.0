Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A97C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 07:40:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3455.1741678823930927413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 00:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165a5991f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B6pPcf010931
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:40:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4134q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:40:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiDTNihVCV6kf5YJ7p6AIA5wCcURxHI3Kk1buUuEi5uvbTibhsA9wFMVQ7N827EoAVANNltL5vP4iyHfscixtDkHZj9M/XUMdKMNKQP4kM/c2fOxHzgGhrHFFVRJe5bSfjYPqfbSiloDUs6/BJ9rCuBIIRZv5D7xhB6o8A6d+/0eJ6TAcT822FuGF7DDhDpNZQ0uLkBDqkR+6PbkT/bKxdlV+T/y8wrYDZcjiQGuyP6hUSOD4iWRLI8mFCUeKa3oKdYEH970W3kjzurNnwX7wsV9SmDkLzliWc5/GVB26XGhq4RYEHxvU1deP2fW/VuIxrsOc7uNu3hodcRwvBTDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sz12n8tvhiGNO+1hhOfLPfXFkU+wn8LvWiR/X8AoHU=;
 b=nRxh1EnZvzIQTS296rI5Wbo0UCOmg5qPASqSGxCtnyBZUBeUpwa2nXu+GN1XbWJsWy5RQSwbN2Kt4UrpDsJGDsc2kV+pr1SCKm3h9/uPEYp7KJLTHt/Sda93k4n9dbY3vH9LL2F7/XPK0rNNwzIA8N3sLwD3p6zbFJeV/Lynh5kZgPhzwU5AbJ5DB582C3Dhl9tuyYXodYHUiBxtFxj+i3jbimV1XK1Nz6TtMfoyTF/+fcX0mAc7a7/Nz/GnryMVkfgVEPak2FrUsnEMkTH9AFYhyDjGJMOGUbmTBcrpc/SIwcvfCDJkDwjumqRqsS8oyu4PbX3VspaTRUIxcEAY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 07:40:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 07:40:18 +0000
Content-Type: multipart/alternative;
 boundary="------------XmX102dXJf5Ihk0b5Ye9uujy"
Message-ID: <4355e4f9-9e39-4e23-8f49-c4cf34c60b6d@windriver.com>
Date: Tue, 11 Mar 2025 15:40:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250311073553.2173455-1-hongxu.jia@windriver.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20250311073553.2173455-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf8e0a7-6b20-45da-a41b-08dd606ff890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlhNa1BFYjhqTmtwRGxpckhUZURVSFlTTysrUUN4V3pzVC9xZldDM3Bqcmlz?=
 =?utf-8?B?eXAzMzJvLzhiU2lHQ3djeGRJQnVyWFJqeHBmT1g4QjN1dkw1clU5U1FvakJN?=
 =?utf-8?B?Qnl0ZE0xRnN6QklxYWdqMlRLM1Z2N3VnZW1ZWFJRQlFiSnhoZ0g0cjJGYkdT?=
 =?utf-8?B?OE9PTkZRV29UT2NuQ3FKQU85WGZFL0FoeXU0U3A2VkNVT0NUMXBLRElQMDJS?=
 =?utf-8?B?eGxYaXluVmZZN2xNSDhCS0g4WUpSUTZYdUM5aEZoY2g3bzhMTFBBVWpkcElW?=
 =?utf-8?B?NjkreTU3cXBEWHBKbHV6U05uQzFIWXdONGpQeDNoT1RCaUltQzdmVkdvbG43?=
 =?utf-8?B?L1lnOXhGRDFOeWR0TjhTSVQ5ZzYzZU5JODFxWmxJQU0zOGxpbDBnVVhMa0pF?=
 =?utf-8?B?ZWNGanJIREtBMTBCVFZsYVVpZEx0V0lWYjVmZkJBTjRIczB5OHpYZ0cra0Zx?=
 =?utf-8?B?aHpPZ29KUkRqdDRKamNBQjFZT0Z1L24za1E0QmxoU2NxbmpOM3BneENTNnhH?=
 =?utf-8?B?akVNb1dxVTVuTWtmdjNCS0FpaHorTzd0aHpFTmRFaVA3eHlNU0o2amZGd3FI?=
 =?utf-8?B?MUVacEoxRC90bWFTUnBvTVgwS3RCS0YyMGFlZmxGa1NRUTc4eXAxRmNQU3VU?=
 =?utf-8?B?R25tWVZFbmxxMkpzcHl5aERFV3hOOXgvdFRZcU9HV2FlSnNVV3VUcTI5ck1V?=
 =?utf-8?B?RDA1MjBlS3R2STd2Wm1EYnUramRsN3BFcDl0ZGlqTW1JZms1SzZJSDNIT1Rw?=
 =?utf-8?B?TzZsR1dzeW1Xb1RZS0hpVVRKRUN1RnNabmFkNWxPS2l6Mml0bU5oOUEzMDJp?=
 =?utf-8?B?blY2VHhrVEZhYkpQanB2ajZxWmhVQTZvdVZxZmxSdW0vallSNlc0cThRMmVE?=
 =?utf-8?B?UUhEdUhWSnMySUJILzJrZWRaL0V4YjM5US84QTB5bFFKWTM2eU9YdHlLVi94?=
 =?utf-8?B?N2tmeEtsbjh6OXkrRDNKN0NoWEJhaUYxUnRRVWtBV3MzK09KRFVUdElXckpt?=
 =?utf-8?B?U1ljTy9OTzBRdCtMMjFQTytuenRUcTE2VFdVMzhWejBWZnZOUm1vVWRiblRI?=
 =?utf-8?B?bXJrNWZzYVRUK0l5aWdJVmQwNnFYVXJWTVdEZHpvOEtvVlZLUDV1aGppSCtl?=
 =?utf-8?B?UEpSbktPUlZ0RzNYanJZaGdiUDdYUWdsY2daQTBCenpISkZtKzVqSWxIMkU4?=
 =?utf-8?B?TS90SUlxSHkvYkswNUQzaTduNkdvVFJlQWY1Tjk5akVtMjJpdWE5SFQ4cTND?=
 =?utf-8?B?Tjh6RVAvN2oxRjVlV3ZmaEZHYjRWYlhxTDZoRzdmZzdtc0p5OTMyRTJ3WDdH?=
 =?utf-8?B?ekFNaWpQZFpRODA4Q3BMS2lGYWRHVkQyTzFKby8vQlB6dEZrMjVXeXZwS3Yx?=
 =?utf-8?B?MldyUm1HWEtiUnovUFg0Ni9iVndzcG80L05WMEpXVk9FKzNqYTQ2Vm5mWDRM?=
 =?utf-8?B?U1ZsbmZmbm04QVN0YlE5eU5rek83Ymh0RlkrK2pyT2pHTnFWSVp3b2VjU01B?=
 =?utf-8?B?ckQzbWNoNGtkMkw0Z1lSZUdab1J2S1AyNUF2MXNqK0tmS3EzaXh5Q2ZVaC9F?=
 =?utf-8?B?UUxSU21aVE5aYmlSNjFzZzJkUllsSFV5WXI4THVROHg5U2JHZmFLS285bXJh?=
 =?utf-8?B?TXNPbHR6ZUFsMHNwTC9jNkFSaTJyaEEyYkdRYi9wNXRVKzVzN01FbFlyVTMw?=
 =?utf-8?B?T09kcFVqcVMwc0ZsV1VReklFbUYwN21HaitOdHh0WE5kMnJjRTdXQ2hSYXBG?=
 =?utf-8?B?ci90d1M3eVJmTFJhaGh1NGxlYVlYT2pna3JNNlJtZG96ZVgvMjAxNElEY0Yv?=
 =?utf-8?B?ZnhHSDc1TEd2QkpiMVFJdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXBNTStvNzZsMDA3VGV1Q2ZyMlYydWZ6UVdVK1V0N0k2NmZ2YVl3d2hGeTFP?=
 =?utf-8?B?RE1ZS2wrd01YV2dzcjlRcWJKbGJXRE9aSFh6UjdUekd4eE1VbjExWlFSd1d3?=
 =?utf-8?B?OEpIamJSQjI0SWtzcDRidXdDWjAwd1dUbHgvdUp0MDNLTVNMMVZqc1RUbDM1?=
 =?utf-8?B?SVNZS1NnYzBoWHY2d29rQm5YbmwwYU16eG5sTFlhQ2hkdEtodFRFUFFkWlM2?=
 =?utf-8?B?TVpBSnBubU0vUnNKRzF0YUJ4NWw0bFRPRVFwSFQyaVNwWjZ4YUFEeWhuakpD?=
 =?utf-8?B?TGZmeUw2T2pGY1NwU0hMZEZlTEJlWDh6U0pubFRYNzg2bnlJQkxPeGkxaStr?=
 =?utf-8?B?ZWxDYjJZTmswR3NVM2Z1SzgrUkhUZ2tDc3YxRE8rVHZTTkNqT2NLTWNMTlVm?=
 =?utf-8?B?eHMxYVVGZWo2bERQc1FoR1dnKzgxVHo1N3c3SnliV3k4S3BGbDB1REJBa3pj?=
 =?utf-8?B?djNBMnB4OGFUSFhTOW0xSTJRWm5hMDZrYXhjUWFvanJSVDQxT3g4L1IyOXI5?=
 =?utf-8?B?SWoybVIyT3dGY2hHV0QvaTZ4Y3c3N0IyOGErSUFNOFF3NGZzWmlNOVBHY3I2?=
 =?utf-8?B?MlFUWkpMcnlHMEdla09jRWpCUHpkTmZEZDAvVERzNG9hcWFtTDc5ZUtzTkp6?=
 =?utf-8?B?TDJpWHltaTlkTVg4akVyR2xTaGUvTnhQcnBjUU5DdE9BN0t4eTV5Y1gvWjIz?=
 =?utf-8?B?WkFQaGlMUmNUVVVkd3pENDZCRTM3ZTFvc0Ntc1Nid1VBODBJeFJtRk5KNElk?=
 =?utf-8?B?RHFnVHZqa2lJUU0wTmdNV2xJWTdaQnUxYmExbXZwUThEQnYxYmFNZUZLU1d3?=
 =?utf-8?B?S29DcmFKSElwVE5kSktZaDdrM3c2MzY4aEFIb2RqZjFVU005K2RDZ1p5UlJw?=
 =?utf-8?B?bEZlaGtNVGQwM3hSSXVzOWluRlFiNHhTMXhrK0lvSzhmb3A5Y3RTelpBV0ZZ?=
 =?utf-8?B?L3NILzlJOVo0MGhNQVdLS0s1QnNQWXBTOEJyckNvMmtFRzUvUmxSeG03QkV0?=
 =?utf-8?B?N1NoM0UxeTRSeVc5eTZBSGhSbis4emI3R3pMMENsREhoTk5MTEwzZ2c5VEdR?=
 =?utf-8?B?OWJCRGxNbkNZeDY0SGZRcGgxK0EyZlBRNGRsWTNuY2piL1pRVjRXYnN5SzRR?=
 =?utf-8?B?Z0prYzk1eDFqUGtxVGtGenF3T0FhNExLekxIQWx2ZnFIWDdGekFZc1RIcU5X?=
 =?utf-8?B?ckh5QktGMFRyUWVkRlErQVhuQXM4MUdYeVdWb1BuZDBvWnRTai9SSHFCRjg1?=
 =?utf-8?B?aWx5cWkvejVZckpidzFHWHp3VmRibFZUMTRhRk0vMTFOdC84aFdNSytacitY?=
 =?utf-8?B?MlhrKzR4NGs1YXNYRUFXcXZRZ09SWG9DLzNpUWJBKzFiY0JSZHpvZjZDSFVF?=
 =?utf-8?B?anZFczhVN1hWdDBoT0xpdENwczlqYnhyYXo2ejYycFo3S1ZlTitnV1hRcmlF?=
 =?utf-8?B?S1E5cSsycXZxNW5PaUZ1YWN5OXJTdmxITE9TMGM4TTZ0RVNlVzlRY3Y3OFIr?=
 =?utf-8?B?OVNvbE5KanN0YXFXUEZGc0RPR2k1RlY2Z1pTbDlDRWR3eFhsUkJISHNlWTlW?=
 =?utf-8?B?NHdKNkZvVHdhLzk0THE1eDAxNG9oNERNSjVzMVliZmhMV3hQNms2cndCNUE0?=
 =?utf-8?B?dzZlS2Y2TVJOY25EQzA5bDZVcGtnQmF0ekxvMnl1UEE3TC9OQkNTcFo2UUdu?=
 =?utf-8?B?VFI4OTBiT1ZFcTh5WkpKbTRjajE4NFk2OGQ5cFdqODJadlA0aHRSSkNsN08y?=
 =?utf-8?B?MVB5TTlmNXV0M09Lc0JZZXJsOTd0dHlZa2hGMmZ2Zjlyb2pPWGI3bHpmUlRN?=
 =?utf-8?B?MkRJelhUOUFySkhQSVlrNStYcWR2VWVXRXFxS0FFRlRFRWNkTExCYjdabGVS?=
 =?utf-8?B?NWIrVjRIVGEvYTBKRVg0aXZ3cnd5bEI4cHRaMTVCMEYwbzUzeWZFSnlDUkUy?=
 =?utf-8?B?NU1TOGhsUFRteGFsZy9iSUV4Qk5KUzFCWGNwSFpENFVrYXZYWFp6ZGk4aVAv?=
 =?utf-8?B?dVhxNjJiTVpobCt2S01rc053eE82ZTAvWHRkeXdBNm9SM0RGRzlkWGthM2VV?=
 =?utf-8?B?N29SaHo5Yi9PMWZBZ2NDVnFobXZGV3BSV0NnWGJyUnoyUTJYd0ttUEhFSzhR?=
 =?utf-8?Q?BpymeuLlRl+F5q1KJKbSglt7a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf8e0a7-6b20-45da-a41b-08dd606ff890
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 07:40:18.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AVOGBPu84/+aeXVWwdBpxtiL1W2ryqr7ag+IVVrt3RVkEAr1+zmEG8sPaCTrTv9p7s9yZMeH+f1sXXDU99EgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cfe8e6 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=Zd_Rnar4rnmMSs5DnosA:9 a=QEXdDO2ut3YA:10 a=NbgBM54gC2aFTEyWLUkA:9 a=2aEpDMbFFYwzTxU9:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=-74SuR6ZdpOK_LpdRCUo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: GKuLRzPzh8wRaNV49TKHK4yANGibJ90t
X-Proofpoint-GUID: GKuLRzPzh8wRaNV49TKHK4yANGibJ90t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115848

--------------XmX102dXJf5Ihk0b5Ye9uujy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/11/25 15:35, hongxu via lists.openembedded.org wrote:
> Refresh local patches
> - 0001-Fix-build-on-mips-clang.patch
> - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++++++-------
>   ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 27 ++++++++++---------
>   ...{protobuf_4.25.5.bb => protobuf_4.30.0.bb} |  4 +--
>   3 files changed, 33 insertions(+), 24 deletions(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb => protobuf_4.30.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
> index 9f6116c4c4..6db22c26d3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
> @@ -1,6 +1,6 @@
> -From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
> +From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
> -Date: Sun, 31 Oct 2021 23:39:44 -0700
> +Date: Mon, 10 Mar 2025 19:59:19 -0700
>   Subject: [PATCH] Fix build on mips/clang
>   
>   clang13 crashes on mips, until its fixed upstream disable tailcall on
> @@ -10,17 +10,25 @@https://bugs.llvm.org/show_bug.cgi?id=52367
>   
>   Upstream-Status: Inappropriate [Clang workaround]
>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>   ---
> - src/google/protobuf/port_def.inc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + src/google/protobuf/port_def.inc | 1 +
> + 1 file changed, 1 insertion(+)
>   
> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port_def.inc
> +index 35f49afb4..e9597af0d 100644
>   --- a/src/google/protobuf/port_def.inc
>   +++ b/src/google/protobuf/port_def.inc
> -@@ -255,6 +255,7 @@
> +@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
>    #error PROTOBUF_TAILCALL was previously defined
>    #endif
> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> + #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
>   +    !defined(__mips__) && \
> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> -     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
> + // Compilation fails on ARM32: b/195943306
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> index 7c4bf260eb..95a48017b1 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,6 +1,6 @@
> -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
> +From fe2d9a1df45fd2082fab717f21557fcdc0cab082 Mon Sep 17 00:00:00 2001
>   From: Martin Jansa<Martin.Jansa@gmail.com>
> -Date: Fri, 28 Jun 2019 13:50:52 +0000
> +Date: Mon, 10 Mar 2025 20:05:47 -0700
>   Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
>    with gold

The gold linker support has been dropped in oe-core[1]. Is this patch 
still needed?

[1] 
https://git.openembedded.org/openembedded-core/commit/?id=a4addb9ab63011e7c604fc5daff95559e7d214e7


//Yi


>   
> @@ -25,12 +25,14 @@ Upstream-Status: Pending
>   Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>   Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>   
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>   ---
> - examples/Makefile | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> + examples/Makefile | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
>   
>   diff --git a/examples/Makefile b/examples/Makefile
> -index ef7a4ef58..7206e14e1 100644
> +index 5290fdb03..523532f35 100644
>   --- a/examples/Makefile
>   +++ b/examples/Makefile
>   @@ -2,6 +2,8 @@
> @@ -42,20 +44,19 @@ index ef7a4ef58..7206e14e1 100644
>    all: cpp java python
>    
>    cpp:    add_person_cpp    list_people_cpp
> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> -
> +@@ -47,10 +49,11 @@ protoc_middleman_ruby: addressbook.proto
>    add_person_cpp: add_person.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
> -+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
> + 	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
> ++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>    
>    list_people_cpp: list_people.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
> -+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
> +-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
> ++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>    
>    add_person_dart: add_person.dart protoc_middleman_dart
>    
> ---
> -2.34.1
> +--
> +2.25.1
>   
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> index a470a7c643..f899a1dc07 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> @@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = " \
>   DEPENDS = "zlib abseil-cpp jsoncpp"
>   DEPENDS:append:class-target = " protobuf-native"
>   
> -SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
> +SRCREV = "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
>   
> -SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=30.x;protocol=https \
>              file://run-ptest  \
>              file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch  \
>              "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115846):https://lists.openembedded.org/g/openembedded-devel/message/115846
> Mute This Topic:https://lists.openembedded.org/mt/111636013/7283133
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------XmX102dXJf5Ihk0b5Ye9uujy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/11/25 15:35, hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250311073553.2173455-1-hongxu.jia@windriver.com">
      <pre class="moz-quote-pre" wrap="">Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Changelog:
<a class="moz-txt-link-freetext" href="https://github.com/protocolbuffers/protobuf/releases/tag/v30.0">https://github.com/protocolbuffers/protobuf/releases/tag/v30.0</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++++++-------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 27 ++++++++++---------
 ...{protobuf_4.25.5.bb =&gt; protobuf_4.30.0.bb} |  4 +--
 3 files changed, 33 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =&gt; protobuf_4.30.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
index 9f6116c4c4..6db22c26d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
@@ -1,6 +1,6 @@
-From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Sun, 31 Oct 2021 23:39:44 -0700
+Date: Mon, 10 Mar 2025 19:59:19 -0700
 Subject: [PATCH] Fix build on mips/clang
 
 clang13 crashes on mips, until its fixed upstream disable tailcall on
@@ -10,17 +10,25 @@ <a class="moz-txt-link-freetext" href="https://bugs.llvm.org/show_bug.cgi?id=52367">https://bugs.llvm.org/show_bug.cgi?id=52367</a>
 
 Upstream-Status: Inappropriate [Clang workaround]
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
- src/google/protobuf/port_def.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/google/protobuf/port_def.inc | 1 +
+ 1 file changed, 1 insertion(+)
 
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port_def.inc
+index 35f49afb4..e9597af0d 100644
 --- a/src/google/protobuf/port_def.inc
 +++ b/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__arm__) &amp;&amp; \
+ #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) &amp;&amp; !defined(__arm__) &amp;&amp;  \
 +    !defined(__mips__) &amp;&amp; \
-     !defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp;&amp;                 \
-     !(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;&amp;                  \
-     !(defined(__NDK_MAJOR__) &amp;&amp; __NDK_MAJOR &lt;= 24)
+     !defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp;&amp;                      \
+     !(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;&amp; !defined(__i386__)
+ // Compilation fails on ARM32: b/195943306
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 7c4bf260eb..95a48017b1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,6 +1,6 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From fe2d9a1df45fd2082fab717f21557fcdc0cab082 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
+Date: Mon, 10 Mar 2025 20:05:47 -0700
 Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
  with gold</pre>
    </blockquote>
    <p>The gold linker support has been dropped in oe-core[1]. <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Is this patch still needed?</span></span></span></p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=a4addb9ab63011e7c604fc5daff95559e7d214e7">https://git.openembedded.org/openembedded-core/commit/?id=a4addb9ab63011e7c604fc5daff95559e7d214e7</a></p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250311073553.2173455-1-hongxu.jia@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 
@@ -25,12 +25,14 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
 Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
- examples/Makefile | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ examples/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index 5290fdb03..523532f35 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,20 +44,19 @@ index ef7a4ef58..7206e14e1 100644
  all: cpp java python
  
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
- 
+@@ -47,10 +49,11 @@ protoc_middleman_ruby: addressbook.proto
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
+ 	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
---
-2.34.1
+-- 
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
index a470a7c643..f899a1dc07 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
@@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = &quot; \
 DEPENDS = &quot;zlib abseil-cpp jsoncpp&quot;
 DEPENDS:append:class-target = &quot; protobuf-native&quot;
 
-SRCREV = &quot;9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014&quot;
+SRCREV = &quot;d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e&quot;
 
-SRC_URI = &quot;git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
+SRC_URI = &quot;git://github.com/protocolbuffers/protobuf.git;branch=30.x;protocol=https \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
            <a class="moz-txt-link-freetext" href="file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch">file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch</a> \
            &quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115846): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/115846">https://lists.openembedded.org/g/openembedded-devel/message/115846</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111636013/7283133">https://lists.openembedded.org/mt/111636013/7283133</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:yi.zhao@eng.windriver.com">yi.zhao@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------XmX102dXJf5Ihk0b5Ye9uujy--

