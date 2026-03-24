Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF5EF54AA3
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19078.1774357203758674247
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Y6BOURKX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9vu8n2436690
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9XmMjvycv6ki583FTyRtrYvurqHHGYkdqqpN7cbej1I=; b=Y6BOURKXtZ5p
	3ikUeX1SyPWyw5I6q7VGYakaNSAZFVUOtQMd91jJpMVGWbICHFXmNzW1t8X/8Pv6
	+OC0S3cWLXa6QbvzH+0UUc9GHq7egKTi8O/wytd1bkm9KSkLQKLDiU+mBk4i72fJ
	OITkKmTtr6M83Bby/FsotPCcxGuPAF+A2pQKko+yoHQa1FAsGurtifSIvpelnOLc
	aA1bCssHzEaTmyt2nJA4HTwYzIca7vyNeDt2pqO6Voz5SMvjbOMttOZz+2vzLCrr
	LHJaOUDG2BG9pDS9kZqAr+rT2FErjGJAt8ZQMuq+B66Vl/CornmbtzvJLWg4hs9x
	CL1JsnUEbQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyb5qm-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuN5NjeVr3xMnF3EPuZXLFB0qOSv9k139KWqjQkIyzdzk9pwS8TMAUpWKC+uvktk36QUwDu18IlC107lmI0z/J+yfK9tZQF+LYWSRPO6UJ0APV6ESk48JWHKeIONZ+Bw1DRjjD/Bn2a2Fm4EKtPXq/DgRGcVmx6ZG7Tei6+D8STxQqq0hVxoilyrrsUjIqHI2dJW2kRBMHzOk+6HW1M24jRr+ELHRYzTEFvH3dme/Jhst0pEpsWrSk4AcPYmzUah6zlbODPGFdyUwrpym+GQES2ogyiwbt5M1c93pOVgn5peubCwtAzz1TZhwtIkDGJqtD8ZuzzPyLfzjhGErcbW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XmMjvycv6ki583FTyRtrYvurqHHGYkdqqpN7cbej1I=;
 b=ji/vmOkLbKoTFKprM89UawFsEVLp9lwD66g+GdduhGeR333wnFdQ6k8xxLUcXp+dYXIo550XGf8HZLsH7urEzuLnsD9n+fHSSoIhYLa5grBMGFzZXMO828S+aRgCVZHvnC6u/8YWzEcxCPNIf4Q1//XYwsSo9tveIPSvLAdI9GSRqgOeE/pWni8WYC05QmYSyCx8SJ4nztSqwGje9jvmLOoxHrr17bkz5JKxA/8XCXlo4tPvWmaaHjFE6Zbk9l8h+QwtKCRVydz4ib610oM23dQKHS2e8Q+FkRb63+mcNSv3MZ01T+hzaZ+RaNw37S0Ax5T2KtuX2zvLuJgb3I1XnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 13:00:00 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 13:00:00 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 13/15] xfwm4: backport patch to add missing libxfce4util build flags
Date: Tue, 24 Mar 2026 20:59:25 +0800
Message-Id: <20260324125927.1070644-14-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a57337-1dc7-4fc0-13c2-08de89a541b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XJ+/oUVGnkEUHNYQnDHJ4Cqg+YpSxCYTXuJXdmRX99Ab8HAaubDH47NG/4r0PywOVnP3q4pU+EqQ0u1zGkG9aNhtJnS1dDl+rUiPDjJmJkgscWRlYLJ1FdSlKg25OJ0RLudQ+uacQwEaEevxFV0xNgNkGb7EuSP7brQWiUVnwnt560Ev8tR3s6GHCYsmIsR7HOcw75SX/wyqwe2fCkWjTlLJthQV8XlbRnZV6OqJoQAQIHfhf2m4LRAfxmyiKaJ09a6z9819CbHnv8l9aIA7JP/XFJ44lYICWIfPw7iJNths9iKzYkp3Ncrz7sIf5EohXPCpPzCKnIrlMKX+F7S3NGB1snwp8/WMhYG5YG8AxGAl3/6Lf7wxtFNhhC9+Jrf9ad3BdRaU5h9jx7/Rf4osLK/sAnGCIN7T1L75rBleqVpSiUnIdGCywgIWN+Gdw2gpyG01yD39Os7M6CJA1/GGY13i60Rji9/FnHOzWn2aGKO/6w8CH97yJ9NY+ccxhtSoDDmdMLKjV7dmuOS0d4ptgK1xQOHqMV+CdazRU8lmZY6pE1JRapCCyeaHzOTiK6TYn5UZMeAEdSfEZikxjdxyLuNq6Ao7YBi+3RcpIA01oGYcN96zbDadHUEgOa7YncsjnrdexsergXxs5klgsNr/3ENcPxPMg2l7WpAUwf6Dw5sPxAEBN8W2hrKHQiXsBxktXQoyUP+59xeltGDcmg4NHAuS8zgN/z7ChvCcJFRigtsmnY5pFBWqIr1Q0/d9ZyzJesx18Nuo/CeP2FY2FBg/UOm36Mz5FcZh5cYZDm4cuD0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dURIZGxwMkhYdGNUZUVETTBseUl4dnJRQlpNa2dDY1Vwek55UmVwaWRGeWNV?=
 =?utf-8?B?NTRmRVN4Mi9SVFBMRlNpTEVRY1ZHN3JGNmZGaTBrVTVyTXJzU0tFS1hkVVNw?=
 =?utf-8?B?eEFyQitXR2t3MGJIL0NaTHBRSGhJR0Z3YmtpKzEvWU5uZ2hSS0pIcjBTUDUy?=
 =?utf-8?B?MWxlNTdDdUpOWnhyVDFwR25IY2EvV1lqbVp4SHdhbXhuOHgvbUVlNHBTdTUy?=
 =?utf-8?B?NGtBMzYwT3BJdkdvTVdYY3grQ3JDVjRTczRva1Y0SUsrS1k5RmNvNWh0UHZN?=
 =?utf-8?B?VUxHdHlEYWRXamc4b1FKM1pNclZwd0RqWnZoaG50WUNBWnRvUzJrZm04SHh5?=
 =?utf-8?B?QXJPM1ZhekMyeGlZUEd4QUlWUjk5dHJoVjB0bStzcUZSSStDMStCaVJkRW8v?=
 =?utf-8?B?d0pVVUlIRFN4cWoyTitCdCtqUk1EMUdzUXl1UlFIblJwTjE3SmNTYUNvTjVk?=
 =?utf-8?B?cldwWG1CNkozSHhoM1BXOGViT3ZpbWpCbVJ0WGtXZ2o3YU1Mc0xMZjR0bmlG?=
 =?utf-8?B?YkhHQ0pTdWNWTkZsN2NTbDUzaXRSeDVBN3ZRTGM0azZMSHVMUDFiUTVlOVY4?=
 =?utf-8?B?NXVTYzNBbHBPUHlBQnpQWC91Yk15RlNRSDlPVmY0Mk1rVGptQUhZWUZVbmtz?=
 =?utf-8?B?QzZha20zUGFMcW90UWk4T05Cb1Axc3MzbWpFOFl1VEtwWGtFVThlekxPRGlv?=
 =?utf-8?B?L0FDK2FPUm9IK292TUk2c2tsUmI1Z3MzM2hDMlc1OHZVK21Id0FRR3kraU1y?=
 =?utf-8?B?MGZTV3E3blVJeExIQWoyUDRpVUpBeU1pb282WmIzcGgvaXRlQk9lSzFBY3Uv?=
 =?utf-8?B?b2RaOVRXZFpZdSszRklNc3FjU1FBblJkenlIek1hTWNQeVBzc0ZKTlh3cVdz?=
 =?utf-8?B?VTV5em9zRmJ2THkvQ3NtUjltSjIzdG5VUkc1TmJDZjlCSVd5cUxIdHJ3U3dq?=
 =?utf-8?B?WXR3dWZOT1dkWm9RNTAwVnJrRjExSEFGd0F1Q0lPT0NadnlhQlBBdy9TbHF3?=
 =?utf-8?B?MGVHUGowOUduZTRySjhZemxad2RxU3VLQ3NtS01HWFRZbjRZUGg1cDlYWi9l?=
 =?utf-8?B?WklNeDdVNHF3bzNJeXllWmw0SU1uOUptek0yUmpOVStIVHVLV0o4cjVueDdY?=
 =?utf-8?B?OHU1VHZqdWRJek1EdkZkRHFleWdrM29DSjRxNEx4dVFVMXdXWDcxS0NpZkZY?=
 =?utf-8?B?QzMwVHVPUW15aC9FYUZTM3kzYzFvSUpLOVBuOENVRWIzY1F3SC9IV1R2OUhW?=
 =?utf-8?B?Zk81V2tIbElacERsMzRPcmx4bENrK1ZSaXN0aENYY21pQnpIOEdvSllMbG5a?=
 =?utf-8?B?TXR4UWV4RGpzeDVPUWs2VWp2SHJPTFVjREVjT09ZS3g0NWFuRmZsOGc0bUR4?=
 =?utf-8?B?ai9yZ24vYWVROFhGR1AwREN2c3A2WFM5NW5OMWNMTXNyTUtsNTFiSm90b1hn?=
 =?utf-8?B?K3cvZVlISHBmeGl1U1VHdEdzVzAxR0FEa0EyZ0tUZlRkcGNLNk9FL29sdjk0?=
 =?utf-8?B?bVJkZE04eHhQSi85WktGSHhhT1lid3RxRWxEblNtOHE5TEcrajhNN2QyNlho?=
 =?utf-8?B?SnBLSVJMSkNrWTkxd3BoN0hULzNVZ0NoU3EvZUFiSzhrODNwZk5KL1FKRndF?=
 =?utf-8?B?cmdGRVBvN3N4MjNRdW9JcUhjeUl6SVFBOXpIVmlUb1c3TXVnNU9LOHd6QVJn?=
 =?utf-8?B?RjYxS0ppZ2tlcmNvK3Y1RlgycHVjSHovd1FheUZhOUhmaDRvbnJkUEtqbC9I?=
 =?utf-8?B?emRuRm96OStBR05UYm1pU2l3QW1PcTBvNWg5K2VmRHR5QU5kR2RFWEpjS3RH?=
 =?utf-8?B?aVBuM0JDdnpLMkt2YUpvRURaT2tORUZNWktkM1plczhrQ2E4RWk4YzlwNndq?=
 =?utf-8?B?R2FpNFJERVFrMjdtVy9OZklkYnBnYlhRUEM2V24wc1hPYUEyR1drZGgxQVhR?=
 =?utf-8?B?ZGFYRDlMSlZKaEtiV0o5Z0ZtSUM5Qnh2dXlyYnJJQTVKT2Ivc3lzeUhDVU93?=
 =?utf-8?B?QkRBaFZvL2YraW5jZmI5YmhJS0pNL2IybkE2V2ltZk5YdHBmTGpPNk9BcWxu?=
 =?utf-8?B?c0xlbE80dXUvMG91d3VNUlZwbWxUNXFzb1IrVkwzZ1c4T2w1ZnZiUUxiT3Vh?=
 =?utf-8?B?ME5STFNUT05IdzhSK1FuRDREOXR2Y05IQ3FNeTFjcUpkM2U1c3E1aW85RVUz?=
 =?utf-8?B?dkRvOTRWVHpNQWlTSVpNR1FkZ1JvVW5NRXJZSzdJWkVDQ2phK2lLRlZuZk1C?=
 =?utf-8?B?d01YdGlUcWpxQnY0RUhzNzVaN2x1MVNlTjh5dFA5SUIzYkdNOTRiNTZCdG1l?=
 =?utf-8?B?TkxqUjBFWi94L3RHWGgwKytzekNxR1RqaUNsaUgxZ1VZeTNEZWptOGRveFY1?=
 =?utf-8?Q?ZHKoaKHCwvHep/Nw=3D?=
X-Exchange-RoutingPolicyChecked: 
	j8fLSl9ApvdEYcju7VSV8/pPyaxFp1sNmmIVQWvMpHc3XZwnnNLc9Bjs4uhQhH/U29DRFhH8kQeNLAP8xj2Qe5YgTOD0DfEApsVmg/K+mizrSV6LHB2NbVB/L2/l6+3e/yNnuvlDbJvA/jXub0PmJPMLMdGXQ8XyryUR72E0RM0/DG7OSx+W9bwZcKh3SXGX08tu7VkagqOETKIYRtlMXZFtIVqSTupLrXUKt4gq68zpFNzPJ8ZOXDXCC+oMJOmp9bnh5IhtIrOEHwFJi65DQygPOXCRgYSgZXd3wS8Aw9K1uLbGhTtjpG3V8XpfcU2q4pAu7VGR5xsNXpIttgLwnQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a57337-1dc7-4fc0-13c2-08de89a541b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:00:00.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi6yVau5zKgp5srdKpRR2mVE7fV9lh4+olAdRcuVEd/a0BMijL69Ov+l9+i8idVikPYY9xUUMfMbzlazeHTJado3bQakz4GxuIQFwORPPrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXwBQfnWFFbWxg
 QDK6Jcwx6z8NjiRqFHCGFaaktTpmXhznJJSzQvP0C7wpw91TW9WuLCclQ3rG1314k0X5SzC6PYS
 VdyNN3GQV9oIHLOxbOvuiEi7iJR/hHgfY+Yy91Oz0xrsknVgVw00ZE6N2WDKyhHctuE8xnj6U2r
 qq60oq+32uSAgPJrKfjVregvisCLPrbwUYu/NGM74YwGJr7SUU2qyp5ehSzNxpWas61uaKLb72O
 TD0V4EL4xwHj93JwyDebVIFS4HGLrXKHWHLg6KdRHZLsryQb52DgZifLL7FVS+u62Fekl+MlkfT
 y4gHk6Q3p+hJyazLOuo+ybJ4UyQdHM2uyRwaU3UhQMxnbeduCqZP1qEcHre584cNwHVf9OpfoJ8
 Aof2C7C64aWyvoE9q7EvPtqyKO1wvFyEsIe4OinKNT3BatEQnVmeSM5MgBvrFA4zHC5UxMK5qzP
 C/Jiym8SC7Inmwo49NA==
X-Proofpoint-ORIG-GUID: pTk2pwwLD_hzLCyaJH5vmDSgow2xeNSi
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c28ad3 cx=c_pps
 a=PAMLMQMbhvWzs0jC4PJDBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=yTkn3-2k8kfTEQFiIg0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pTk2pwwLD_hzLCyaJH5vmDSgow2xeNSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O9vu8n2436690
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125572

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When libxfce4ui is upgrade to 4.21.x, pkgconfig sets private flags by
default and no longer exposes libxfce4util flags. This causes build
failures in xfwm4 settings-dialogs due to missing CFLAGS and LIBS.

Backport upstream fix to add LIBXFCE4UTIL_CFLAGS and
LIBXFCE4UTIL_LIBS to settings-dialogs/Makefile.am.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...build-Add-missing-libxfce4util-flags.patch | 59 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb  |  5 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-mis=
sing-libxfce4util-flags.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-li=
bxfce4util-flags.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Ad=
d-missing-libxfce4util-flags.patch
new file mode 100644
index 0000000000..8fe8386f11
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-libxfce4u=
til-flags.patch
@@ -0,0 +1,59 @@
+From 6468f80ee9283c03fc18f67361b20c6efdf3df50 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Ga=3DC3=3DABl=3D20Bonithon?=3D <gael@xfce.org>
+Date: Mon, 3 Feb 2025 11:09:59 +0100
+Subject: [PATCH] build: Add missing libxfce4util flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This will be necessary when xfwm4 is built against a meson release of
+libxfce4ui, which sets private flags by default in pkgconfig (and
+therefore no longer exposes libxfce4util flags).
+
+Signed-off-by: Ga=C3=ABl Bonithon <gael@xfce.org>
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfwm4/-/commit/6=
468f80ee9283c03fc18f67361b20c6efdf3df50]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ settings-dialogs/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/settings-dialogs/Makefile.am b/settings-dialogs/Makefile.am
+index 3a1d2a510..86c6ab9be 100644
+--- a/settings-dialogs/Makefile.am
++++ b/settings-dialogs/Makefile.am
+@@ -44,6 +44,7 @@ xfwm4_settings_CFLAGS =3D \
+	$(GLIB_CFLAGS) \
+	$(DBUS_GLIB_CFLAGS) \
+	$(LIBXFCE4UI_CFLAGS) \
++	$(LIBXFCE4UTIL_CFLAGS) \
+	$(LIBXFCE4KBD_PRIVATE_CFLAGS) \
+	$(LIBXFCONF_CFLAGS) \
+	-DDATADIR=3D\"$(datadir)\" \
+@@ -56,6 +57,7 @@ xfwm4_settings_LDADD =3D \
+	$(GLIB_LIBS) \
+	$(DBUS_GLIB_LIBS) \
+	$(LIBXFCE4UI_LIBS) \
++	$(LIBXFCE4UTIL_LIBS) \
+	$(LIBXFCE4KBD_PRIVATE_LIBS) \
+	$(LIBXFCONF_LIBS)
+
+@@ -70,6 +72,7 @@ xfwm4_tweaks_settings_CFLAGS =3D \
+	$(GLIB_CFLAGS) \
+	$(DBUS_GLIB_CFLAGS) \
+	$(LIBXFCE4UI_CFLAGS) \
++	$(LIBXFCE4UTIL_CFLAGS) \
+	$(LIBXFCONF_CFLAGS) \
+	-DDATADIR=3D\"$(datadir)\" \
+	-DSRCDIR=3D\"$(top_srcdir)\" \
+@@ -81,6 +84,7 @@ xfwm4_tweaks_settings_LDADD =3D \
+	$(GLIB_LIBS) \
+	$(DBUS_GLIB_LIBS) \
+	$(LIBXFCE4UI_LIBS) \
++	$(LIBXFCE4UTIL_LIBS) \
+	$(LIBXFCONF_LIBS)
+
+ AM_CPPFLAGS =3D \
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb b/meta-xfce/rec=
ipes-xfce/xfwm4/xfwm4_4.20.0.bb
index ef5a682b77..2c0ac1d39c 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
@@ -9,7 +9,10 @@ inherit xfce update-alternatives features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI +=3D "file://xfwm4-fix-incompatible-pointer-type-error.patch"
+SRC_URI +=3D " \
+            file://xfwm4-fix-incompatible-pointer-type-error.patch \
+            file://0001-build-Add-missing-libxfce4util-flags.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "a58b63e49397aa0d8d1dcf0636be93c8bb5926779aef5165=
e0852890190dcf06"
=20
--=20
2.34.1


