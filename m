Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7705FEA824
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19353.1774434400921689458
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 03:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AmnQe7RR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75449cfe7a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6W6vk2152221
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0zba5f+ia/bop/X6PwBwZ2LJB9v4ul6iT7PKsSrlJQQ=; b=AmnQe7RRzR+N
	doCh5UKdNBsiT9uSn4OdOuAsxU2KCwh+epCWA4+gjvfGD81GjWcbnOgALc7i+l6K
	oOehcB/b6XTr4fVGxMUnMimiYH1qp6jvmU8+jyUL36vWiWOsrFTRnuuo4c5yVU+C
	ISuMrnv61Nxu1Gfl/sEO7sK1dQTUiO9iN4nKcF2C/suIiI5+HNO//pEPmtCAPKRc
	yVgFJ46UEcfqFK5wZR+LnjuQHt5zW0/wXn3TUpsOy1pYIzAI+STSjgmwwQMxl5M8
	8hNSRdsE6/Wjkp314O+KIo4K9mWCy5j8qLrSFTfPU5IvH4hpPEVlLSoxZ/tjFUF+
	yO7JoxCnuw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6vt5f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLnWeZt7vlth4Rs2WUm/2qOVhzoUNe+53S84BteecCQLxgudmg1APMSF5MA2v+cbz3KfAr4gnJMQGeAVaUnEEEBb2dRQtQfmAxuYK1T+y4Xh4KIfmmVijnTzGnghFA/ES/+UhNAvqDQHv3osYpyyLd1rUHNYcFyk3iQ22jcFcvoNoUH/it8pUsyns32qGIrBMOzQMAjvDJVZFZ281zIlJJJpVaJDwfWXCo8NJA1NfZRUK1MYLGwieRw8ttIEVoDbGSagbY8YRITytxaAqg1mAhQ26Ta2HCSsbtesBsNLtSCG+h5wKP2+l/S7Tkv2aoAsV8BmVuyijjehSEeALId0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zba5f+ia/bop/X6PwBwZ2LJB9v4ul6iT7PKsSrlJQQ=;
 b=KP3iut6uiK6JJFX1xYaXBnwqXzMbzcJwIoz8b/qNPVeyP/y+JP384NdPYpYW+mB+AnxPjblsUHzcwrDTA4FLAoWdPq/AKaMLJYgBwh8JYxtV4UEvxyG9FpHlcDNj67vRy5lkhhFQMfw7WYj/yiWHZCE9XcnAY/jK1m6YsOOM2FjxnsaoPU31lIbemq9f2udemFh+XFBAgS27oDaASeTObEL+olAFiDw2tOLcasgs01+dVTvg0JShNnzNC+PDIO4JrPMqZ5GAq1FU2IvSzMF0JysADp0LJPBHHI4OsA2MzHuyhapFT8r0GqLM7fgSRXUpjOwLvpgFomIxpWHRdRezZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 10:26:37 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Wed, 25 Mar 2026
 10:26:37 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gvfs: upgrade 1.58.2 -> 1.60.0
Date: Wed, 25 Mar 2026 18:26:19 +0800
Message-Id: <20260325102620.1901081-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325102620.1901081-1-peng.zhang1.cn@windriver.com>
References: <20260325102620.1901081-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY4PR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:370::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 638c40e4-fc20-4bab-31d8-08de8a58fc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	PLN4r2yzcFJ4Y4bWjTfXwsWC91ktrkARCGB9Yd9YMdQwtwH0TTXS2C7KdT/z3BKoj9ldDdTq+vB9wld+pFOfV9FE1ez1rqztvIPNgS/9adGxwz0p7dYKwUUSc8IWKMxs/ibtSvnFUkZmNgvlLo2pcNP9duZHYbk2fZug2dgbEZXwBYkHma/x/4v6A3fHGNvqx5edA5xyRUKyUqv/4gnrvhrcfynGa9CKtNKnTwPqALLeDDxnKVY38FNNC03OpUcqlmFfs9QE9PV+FcNYzu8SYfBxkkyPo0qiZGsEhIcksNPoeocBgNCQibbjrGcpK+gsRPLYD74+kW6p/wPFq+ooCu8e8vb1Ew/jVVZdWXmo3Jei/+CTkCa6A3gqjYdvqfeOaxVZfaaTGVAwfdT5QCiCysNpi0CGuhLd/VoszsxefdDv9U8FQGIWNTit1UV7RZ5XeaCWJkH+6EZy6awPsiraY8g5QDGB9SSZw9vxWvs7OyndQkeOE+1eJomMHyZpsp5bE1mvBqJMR5nKwrbz/pLtZSCBqkzgxENHS5y2Q6jtv5qJoKBn15quB0/am+58ZDa56LAdS2RG6xkX/7ntP43CfyN1CVCvrcv3Q2J9/8R/ipvWWGjGsuHrFh0PFpzEmlumOalhOmrrluAcR+MxZLdAR/OGC23Npv72duyyiGJDUW7ZNnZy4OWPVr0RLL8sZkVwgLAjSp/kO6qZr5ovlIL9S7vhdeBN9PXEMuAd8UrgSaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmllU0ZjLzRKbVZnU0JmT0dIM3FjRlJiMDRjVkNhamU0VkNNZk9QY1V1RHU5?=
 =?utf-8?B?YTg4aGVtNXpzR0xFa2c0bnFoUG1xcStnNHpaWWdyaEd5N2tiMEdqa29Zakwx?=
 =?utf-8?B?QUVTeHlGbXltZnJMc0IvMmVkYkZmNEoybWIyR2t6NUk2ZDN1ZEF2VElOYXV2?=
 =?utf-8?B?NUp0QlVnUVM2QTlUTmUxMXNoZ0oxdVhNck5tQXVOOG5mekdWbEhTZ1ByazFt?=
 =?utf-8?B?aXFmb3A3RkowZ0NNVHFvc0xmbFJnM0h2bkhYZjlabkZSMEdjMUtJditGVi9Y?=
 =?utf-8?B?V0RUendXNTZic3hnZ3dyTDdldlNiVWp6Q2hYcDdCTDJpbVVuSXJkSU9XVWRx?=
 =?utf-8?B?S3FValdDZzJjaFBzdVltY2pDZ1RydTcyZzkvUkNMbnk1OWwwSHhhTnRyMXdO?=
 =?utf-8?B?NTZGNEpra0owc2NHRWFhTWQ1WjdWMkVzZ29RNk9Fako0b1UyQWtQTWM0QktI?=
 =?utf-8?B?Q2RxNW1vUkk0SmVRSTZLMG5xb1BIYXhReXJ1aWtnMXN2clBVYUtCK1M0MUsw?=
 =?utf-8?B?elVKcm1LdTVWZng2cWJ3bDVFTEFmT3JCSU9DUE1ZUFhTK2Y4eXVaOEFKV1Va?=
 =?utf-8?B?dnBiWXhXOUo3QVcwYWtDNG1EclAydGVCSEJDeExzTnZIbUpsU1pvN2l2bVFz?=
 =?utf-8?B?UjVBV0RGb09DUFNuTGxkUExrUnVENVdXN3B2WWtqU3pmdVEvUFJsK2QxZm83?=
 =?utf-8?B?ajNkcXQxTUxYV1pSZjQxcmhUbTVCRUNLZS9WRnBSQUNjNit6SGNNT0xTSDds?=
 =?utf-8?B?L05oZGE4ZnpScFVJRzN5R3U1TWQ5SnpmRzZnanloaVI1Y24rV29hYVJNcElw?=
 =?utf-8?B?TzE1WHlDUDFpZkxHUFpSTk12N3R5VEJUT1N3aUpVS2VLM3lzK3RhT0FKZzJ4?=
 =?utf-8?B?U1ZoL3prWWRtbmtUVStkaFhROWQxL1BuK0dESGJMeEpLM0VDQ09KMDhMNGtK?=
 =?utf-8?B?N2RvbDNZN20xNStscDgxOU1MZjVYT3VZVEpEY3RvQ2RaMUV3c3dqNkduTU4v?=
 =?utf-8?B?dDQyRUlUaVkwU2pkczNCVXRjRTJUeHhmSjRSRklKU21zK09qc0toYVh4UW9u?=
 =?utf-8?B?VGFsV3dYRnpUTXVjcmtTNXRacjMwUG1BSm9EYzFyRk1nVUpET1U0SGxxWXlp?=
 =?utf-8?B?SHRZRjZOTXBucHhmdFBuRm1KOTREMlpRUTJJUXcvc0xwZHNVV1NEQUUwVkQv?=
 =?utf-8?B?V2VtMkFya2Y2aitjMWt1VmtBWEpFdFR3K0pLd2dUUjl5MHM1N25SNWI4UTdU?=
 =?utf-8?B?dS92Nk1MNFFYUFZEMjdoUnV5OGJtcjNzQ3hJUFM1WnpROHA1alcwNHJtQ3Js?=
 =?utf-8?B?L3dQWTZqWXh4TFh4ZEdoQlo0K1pLb3VGMytjbHErZjNxdE1aUEFoVGhyU0U0?=
 =?utf-8?B?LzZ3ZlVNUHBlYzRRR2VqQTI4VDFlWG56Yy9taHBpR0pnSEpPMm0wY2hnZnZl?=
 =?utf-8?B?NEYvMHdMWlF6Rlh0WlNhNmFqYWJhVm5TRmQrbzFxSFNTWkZxMko0SncvdE4x?=
 =?utf-8?B?ZGlFVXBSSmdqczB3UTRWbFdsSjloUkR1WkJyanZYWkxrTUs0SU9kcER2WUJW?=
 =?utf-8?B?NThLRlliL1NOdmhUWFRMbkRHc29vUllNcFFGMXY4NTlXNVVuL2Q1R1J5Umpp?=
 =?utf-8?B?ZG1qMkEweTV0b0xvU2RUK0ZSZis0QyswWnozVXIyZ3NTMk1EUkZnK0pMVXk2?=
 =?utf-8?B?a1o0UzNteTJFWmQ5TXVoSXVWRXd3djRHY3ZLT2pUeHVyRDFqZHZic1dsdVBH?=
 =?utf-8?B?dFRjTTJkdmxqTGpSelpxUkpxc1dudTVmUFRyL0V6aEtmUnd5Snd3K0Z1SERG?=
 =?utf-8?B?MEUwTm8weHRWZlFhNmM4MUs2NmJtZEk1TDhlQ0ZITFVPNnpMbWFUNmZTSXE3?=
 =?utf-8?B?dUk0bnFYQkI3bUJNRytyV2NLb3ZNdXRHMWY5QTg5OEowV0VQSFBhMXNKZXhU?=
 =?utf-8?B?Z2VBSjdPdkEzNXJZcm40eHRNMk1td2NmeG5uNHo5b284WjdMV2Rka2tFYzQ0?=
 =?utf-8?B?MktMTGVwZURHS0FuLytUTVlUcUpuTndWdWQrQTIxOWU2bHVaSm5FVnlGM1Bs?=
 =?utf-8?B?VEU0M3RjejVtQ0lWUkVtYkNqZzJZbzNjVWhacHdzampKdDlCN0oyTmpBZHhP?=
 =?utf-8?B?aThsTURmYVVCYTQ2MmEzaXNhdmdPZkJsSXRJYmpwTGxxL2lzUS9SajhXdnVn?=
 =?utf-8?B?TjZGQ0RERU5lUldsU010K0Z4UzdUOExpMUtXR0w3QTQ3UXI1b0k2eG9yYlZo?=
 =?utf-8?B?ZkFlcjZMRngrYmRlbjkrcENYUUpvWWd5MzU4RXRnVFdIdld3NG9PRWdMa0Ez?=
 =?utf-8?B?L1kvYnRtRUc2L2pSUHI3N2R6VFB2ZjVTR0pFaEVsYTNZZER2cmI4am5yYUJQ?=
 =?utf-8?Q?HNOkM03fEQKsrQmE=3D?=
X-Exchange-RoutingPolicyChecked: 
	aInI6+GYAZ5s5kBp7TefaQ9Sr0JAFSMY1BBzTwyjpVXJuvlbtt20XhLI87UVPHtAgb6Q673Cv6q0X+D2s56DFbzgvuNRYycG9dKl0Ck6IchCJyDIHmargto7SsAUCdYpIyGmrm1XS6gRh14Qk046zrGPDwlMi6RRLALnECnYkkmOXX49LWhf1a+xCVdTDpMqahQRxwb/PiKv0qmzcFAstABWA8sl2AEWAddVRR1MTo4YMhBEW83RV2Knk2x5cfgj0qRnR8vkq+EJD9NAiDv3JWWi/JemGoS4vrvfEsWKJJaClUXGrxgYWvSayv953G0vbDs2Tv7m5EYGXtEVs4UpAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638c40e4-fc20-4bab-31d8-08de8a58fc21
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:26:32.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1faQKCuDiNxkci0cOmmncrD2kyvNd1lGbSjr0xgQ6s5P2Z4QEkwa3iL4kWXqfJkuxpmjl+psCgQiy3RzsvIBiinF8+F0xoeYIV1VALy9KIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NCBTYWx0ZWRfXw4eglqNEiJKR
 O3gX0iKyK//TrN/LxZuh6pzHHsr5aCqWDWU4E7OpkX7BWn2l+LSwLhr8htfgqYZ+sfTNuIbFkYo
 D2vm0R0S83lLpby/+Ah/IBzoIUKfHwDuQMeYj3N71hi7DgM1iMra7mALDfK/kuywwBeiywZAYj6
 RRLG0Vv+7qz63vrZTZ1EPy1fjfAF64/VNk3NJnom88bAnaO+K50PHV06K09UkzBmoWPb7ed3/p/
 e1QVGMdMGtAaaIh+OJZ/jEqC8uQbvCVcAuDriX2ht0eaBjyTDAHFJLdVx4/l5dXM/w9VEZvf6EA
 t5hwhrQR6K43lXd2uvjcJqTx3nyH97L0O+SNPvkErNTocaFrlpg9TjX20wqV2/m9AxUdCE8o/X/
 rUiBzFLcfnqVlzwlgFJHEyehZYipzYfM4VM2Mo2z5huPXHiuRqnPx+JX5/yKRtscpx56i91ykKT
 lJbsqNwTX1HgCCqubcQ==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c3b85f cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Z5getJ8MAAAA:20 a=t7CeM3EgAAAA:8 a=-UhNeNjPSa6KGmH_Rj4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6_AOd6NlURBQgtx_cb6cPWdjMC1t3mms
X-Proofpoint-GUID: 6_AOd6NlURBQgtx_cb6cPWdjMC1t3mms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62P6W6vk2152221
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125604

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Major changes in 1.60.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* CVE-2026-28296: ftp: Reject paths with CR/LF in g_vfs_ftp_file_new_from=
_ftp (Ondrej Holy)
* monitor: Do not load monitors when GIO_USE_VFS=3Dlocal (Ondrej Holy)

Major changes in 1.59.90
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* client: Fix use-after-free when creating async proxy failed (Ondrej Hol=
y)
* udisks2: Emit changed signals from update_all() (Ondrej Holy)
* daemon: Fix race on subscribers list when on thread (Ondrej Holy)
* ftp: Validate fe_size when parsing symlink target (Ondrej Holy)
* ftp: Check localtime() return value before use (Ondrej Holy)
* CVE-2026-28295: ftp: Use control connection address for PASV data (Ondr=
ej Holy)
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters (Ondrej H=
oly)
* gphoto2: Use g_try_realloc() instead of g_realloc() (Ondrej Holy)
* cdda: Reject path traversal in mount URI host (Ondrej Holy)
* client: Fail when URI has invalid UTF-8 chars (Ondrej Holy)
* udisks2: Fix memory corruption with duplicate mount paths (Alessandro A=
stone)
* build: Update GOA dependency to > 3.57.0 (Jan-Michael Brummer)
* Some other fixes (correctmost, Ondrej Holy)

Major changes in 1.59.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* mtp: replace Android extension checks with capability checks (Raul Tamb=
re)
* cdda: Fix duration of last track for some media (Bastien Nocera)
* dav: Add X-OC-Mtime header on push to preserve last modified time (Lawr=
ence Murray)
* udisks2: Use hash tables in the volume monitor to improve performance (=
Milan Crha)
* onedrive: Check for identity instead of presentation identity (Jan-Mich=
ael Brummer)
* build: Disable google option and mark as deprecated (Jeremy B=C3=ADcha,=
 Ondrej Holy)
* Fix various memory leaks (Milan Crha)
* Some other fixes (wangrong, Jan-Michael Brummer, Simon Poirier)
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.58.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Re-release of 1.58.3 due to incorrect release tag; no code changes.

Major changes in 1.58.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* CVE-2026-28296: ftp: Reject paths with CR/LF in g_vfs_ftp_file_new_from=
_ftp (Ondrej Holy)
* monitor: Do not load monitors when GIO_USE_VFS=3Dlocal (Ondrej Holy)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.2.bb =3D> gvfs_1.60.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.2.bb =3D> gvfs_1.60.0.bb=
} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.60.0.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
index e3b90950d6..434002e440 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
@@ -18,7 +18,7 @@ DEPENDS +=3D "\
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-SRC_URI[archive.sha256sum] =3D "ad9d5bf0b45caf232520df0adee51eb650200b03=
70680f80a350ead9d1d61ddf"
+SRC_URI[archive.sha256sum] =3D "648273f069e92c7e3c013b92148e82c901f08044=
e2b3b14c6cfbd52269f6b646"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.34.1


