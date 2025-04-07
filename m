Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C35C369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 20:56:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.58767.1744059397688475335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 13:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6192cbf472=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374w73l021280
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 20:56:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1jxyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 20:56:36 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537KuaDK020585
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 20:56:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1jxyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 20:56:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOSQcGB0p/tZNM8mes2u16WvAvIGq0Vv7IbQnTAaM+ioUFrKJboKI5GvzdgPcJr6LwKHEftgTg5Gm1AWBPe+9hlYvuoWg+4goo+LlOA7fI242UZ+hA3tSSore7+opV5PhPMFOQN7NaMdWOZkv3VoZbFnBL+M4qSfc1ZMil/E4csjN8GDVQNW183Wmwq0qfDKbzlau8V92tIPV6sXNoU7CE2g5LfloxOAZsKZCqBsQtX7dAgrv5WhwS7QUunHRAaD0pjSQ51eD463IpU9QzLVZt9H0JnKDhWkYlBYvZoiODsbK1eNm9FzI2ymFjfyZvuFtlEo8mqJlQzoyo1tnv4sJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyzr33lp5+ndaErblEDim5V8rRZ7nVLhUbwYRlkr2Ow=;
 b=fK8ueqpeBrpq6gdplPycCnk+C/7eP6Lak1RdmOr4CJLTBlF7bEfvH3usR9UBEG10LP0x+9kMjSZIQph7t4d9gnG2kyneSasQ507jFRNpHXfEWXTm7fldavKIchvoghlZlRQW6eiEKSa1NjcTB0q/IyvGQ6scISiob13d2UJXYudk69WpVjVguqIceeAVyhAzrYPXPOTLsSDT+bibTVG20O1Ura8CfR0OgIYPdKG9lmt4VR/qC1k//+ID52FxtQkbBUDMO6BFNRvyuK7h2vaIbJXEFkjqtokA5NvSK8upIqnzIewBpq1sj9qRwcH1vpM8SPtyMZVZUUUhVpIDq40Dww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 20:56:30 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 20:56:30 +0000
Content-Type: multipart/alternative;
 boundary="------------DfNotZQTrseuzm8p2JgHuin9"
Message-ID: <d8e529cd-7e25-4f93-bdbb-466877ba08ca@windriver.com>
Date: Mon, 7 Apr 2025 16:56:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mariadb: upgrade 11.4.4 -> 11.4.5
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <20250407121547.2516285-1-changqing.li@windriver.com>
 <20250407121547.2516285-3-changqing.li@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250407121547.2516285-3-changqing.li@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e9d0a2-95bb-4258-c07c-08dd7616ac06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blYvejRDcU5Cbno5TjMxUXhGdTFSYklDMXV3Uzg5MkxiZHJkQllSMFBpQnAr?=
 =?utf-8?B?MUszTHN2UTFhUDFUcUdCSlM0RlMrMG52bjFvYm9KQVlSVjU4V3Z4bWlSWCtj?=
 =?utf-8?B?TE5SRzVGUTI5VTladEtkN3ZiSnY3T0N2bHpGR2JJdVIxTDdiSTdTTGI3V1Vw?=
 =?utf-8?B?Tm9DbzRlN3h5S0hUYndJaWhBRmZEaS96VkxjaWFnUWNJclJxaEQzdS9QQ01I?=
 =?utf-8?B?Qi92eWxSZVdZSmgzaHI5UnMxRUorZDhxMjNXbHVJODdTMHdlR1VRV0lsTVJG?=
 =?utf-8?B?ZGdxYWV2bDNmVWIzbUZyYXJuaHlyVjlhVjFRS3hvVmRESHptUzlUTWI4Qjhj?=
 =?utf-8?B?WFBCNytra2hUZFdTamowOHVQOXZTN0dTdjJ6ZTZ0WGJsMHd4TFUycld4M1E1?=
 =?utf-8?B?M2tvdGZCWkxwZ2thWjh0YmtKYjROSlM1QzRHdTFQSC9IaFdKMUwyZ1pFK0tx?=
 =?utf-8?B?aTRlemJJb2M0Y0dheVNTdmdKVHpaWHkvZjIxK3I1UnlhNlpWLzlZSGQ3N0tt?=
 =?utf-8?B?VWM5SUdsMXlvUmRPbnArRDlIa2Uva0ZRYnlLTDZyd0lRRU9OMkpFMGsrYXpr?=
 =?utf-8?B?em9KSGVRenA1TG41aktjNGFlZmZQVVE4cGtiakllMXZSNEUyNy9SL205dzRp?=
 =?utf-8?B?djJsMlN4SG5tVlRRVEJ2VmFiTUxSK3JYd3ZDYk5qZ3FRdFo2QzNmNzc0RW9S?=
 =?utf-8?B?c3BNOUhKS1NqS0ozdnJpR0pYKzJwMVRmY3RFOTNnTmczN210alAvd1dOcUFF?=
 =?utf-8?B?WkJycWhxUVpVT1JJTnc1MUJoT0dHT3MyKzJJMmpkSDlLUXlqNWx4dGRhbnRM?=
 =?utf-8?B?S3Y3QWIrZWlManVQczBmbmM3bHgvVGJieVNnL0FHczZIU0hYQXJwK2h0VzZU?=
 =?utf-8?B?VkIwdG5kWi9uWERxbURwN01PeHZ2MWFEY2xkMEdKQlRqS3laL0EvMmhsajcz?=
 =?utf-8?B?bGtzWVJSQm5zODRSVlY2ZTROTVl4a3dnQm5tL09JVGZIREMrLzJiV2J0QjBn?=
 =?utf-8?B?N0sxa3FjOGZhYWRjcDhYam9ITXdQci8xQndrbUxLdk13bytBM3c5amlubEtt?=
 =?utf-8?B?c1VjNGFZOTIvVEd4VWhXRkRMVFFzeUs2bERocFMxVGlxalVZZkN1QnQ5cHl2?=
 =?utf-8?B?YnRUNjZIZE8yc3VHU3FRcGtVYUdhZmdEVm15VWVQeXM5OHdPazN0WXorM2Uw?=
 =?utf-8?B?bnNGbzE1VzZRc1FweUFFZCtaWlQzQ0xoMGd3RGE4dkFVd1BSNGdmOHFvUCtL?=
 =?utf-8?B?dWZHNjhEY0tMaVpKQ25rTzRPakhXR1hhMVVNZ2htUlZzS2lQb2lVTCs0eS9C?=
 =?utf-8?B?Y0ltOWc2ajRXN1ZmYmVrZTFaS0pmUGtVNEFlQ0hUaDBMZWdtbXpxc25VRFdG?=
 =?utf-8?B?KzVTUmpzNU5idUFOYVhUcERtejJqY0N1U3hjMzNYV2lMYlZyb3pKZlFVazVa?=
 =?utf-8?B?TFNxRC9UWllMelR2VFQ4RkhITi9ZdHE2Wk43ekxLbjVDbkNiUi83OG5YeWVO?=
 =?utf-8?B?MnJwMzNscksxUEthcVFnVk44ZVN3ejY3WHhZV1N6c0ZLQVpkclNtOGdlVU9P?=
 =?utf-8?B?TDVJQS9sWU5yRzBWRTE3VnFveUIwS2V4RVFrbVA5WG5pWnRFMXh1bXpYeDNL?=
 =?utf-8?B?T2JqSkZvdEpkREsyK3VZSHB6eXFEU25CbTc5S0FtK1dBcElTeW9rU2dRTi95?=
 =?utf-8?B?dlo4RDF2blg5V1lRMVhxWVNUK3lBRE15SExBVTFIbGtYV3FxdldaVmZiYWRG?=
 =?utf-8?B?SHJxdW42QW1LZkRNUEsxUkpySFN0Q3lGeWEvcnd2VC91SXFPdVErREVYY3JD?=
 =?utf-8?B?Z0ZyTUFwTFpNOUlYM1ZoQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3NrdjNuNHB0ZGszQXJrZUZ3NXRBSGQ2dzJvYUkrVGZIN0dVYkRWbjE5RW5R?=
 =?utf-8?B?NWF0cmE3L21CTkVucXV4ZFBnRGU1Q2xRa090ZmgyeVdTdWxQL25GRTlaREpC?=
 =?utf-8?B?UWh3Uk9rSEZsL25ZVE5ncTI1ejF2UGtFc25yaXlRSGhKWk1CYVF4eW5KbU1h?=
 =?utf-8?B?eWZvNlM1dzNpT0tSbldOVGV5Q1Q3K0daOGxxbDVXWU9tN3VMU0R4Y0JwYzVF?=
 =?utf-8?B?VS9KaGtpMXVzQzJKNE9HTzV6cFNzbjJNMUFOdGw0ZDVGSElQVFVEcUVQRFhY?=
 =?utf-8?B?bnVkWmRGYlVBSytJWE5UNzNhNnZSTTJLTllaczlmcG1ETnU1Y0Fhd0hXMVls?=
 =?utf-8?B?bFpGS0dGZXVkMGFxSk9yNHdGS2RlWnNXMkZNZDlIMllPQ0wrZW5JRzMydHc4?=
 =?utf-8?B?MEFqaEVqRmxuMWd1VFl2ckRiMGFPTWI5b3VvYzZCeENjV3ppN1RBR1hOK0hj?=
 =?utf-8?B?RWpidzNQOFJZOEJvdFIzc2lkZXRYYnhNdWxSMDRYajRuY0VMTEpNOHJ0L0hq?=
 =?utf-8?B?SkNBKy9yeWJKdFVhQ2VlYlZsalVXNWZGUjdQenNvUFEzVzZOSGxSRFFZSVIx?=
 =?utf-8?B?VUxwY2NLZ2RIVmx5NHJCU1FBUnA3MjJ5ZGJGcTBzaWliZG1ucTBsc0Y4WnVl?=
 =?utf-8?B?ckRDRkJMWmRNR0lGY1Z4L21jNzF3a2J2ZStId1kzTzRIWURXbk9PZTZLYzNw?=
 =?utf-8?B?WEpSMkdKVHZJNjlNR0JiRlRGOSs0Vy93WmZzanFDcHIyRUFadXlYa0xPVUFU?=
 =?utf-8?B?dHR5eHcwaExrYk1rZzF3UHhiWTJUd1ZrU1o4RDRjQnpRR3BYc1NJSXc1NFJy?=
 =?utf-8?B?ckNsVEdNWFBIMUJ3SWdyN2R1MTk4QXRhL3lmaEkwZ2pKUU5Uc1h1SDQzQnVW?=
 =?utf-8?B?K0Y3cVhwdkMvWWoxUzdCa0lZNThpK3R2bkxwNnpGQWxxenluM1QxSnFSQ1p6?=
 =?utf-8?B?KytCQlE3ZHNPQktWdngyYTA2cldPQmQ5S2NmTy93V2xjNFYybnZZSDdlT242?=
 =?utf-8?B?L2l2ejc2b0NtS215WnY0WTBGaWJXanYxV0cyNkFJTFVXQkFiTHQxaTliWEZS?=
 =?utf-8?B?RXBBR1NUZXFaRzlRcHc2cVpReXMxbXFqeEhGUm9WcjFORTdJZFJydFgrUnVW?=
 =?utf-8?B?UlluOFZid2k1K3NDblFHQ3N4bFNBL21DcitFbTlKOStmWUxKRTI1a0l5Zy9N?=
 =?utf-8?B?Y2NCajhwM2RMdExYUnJkNWxVQllUY0tIdXl5bnNGQzRJdGcwbWwxdEhRQlgw?=
 =?utf-8?B?WC9nR2hIM3EyYXZJRldQMFg1UmVleWFnb1poQ3dqWm1CK2QzT0lpMG94eFdJ?=
 =?utf-8?B?N0F0QllCMTFaUnRWUk9VUTFxY0JSQmVlM1E0RnBOVjhjTHdsTm9KRzdxMEJO?=
 =?utf-8?B?OTRjbWtuOXlIZHpLbDhDSUxIS3ZKdWhROXMyZTI5OEwvQm1zOS9EcjI3WUpV?=
 =?utf-8?B?Q21hSTZ0K29PY09FMXJCNk05L3k1YlVhWmc5ZGNFWTUrTi9yNVN0Q1FZSU9X?=
 =?utf-8?B?OFlKOXVOcEt4WmMvNGlJeVpqL0tUY1RkaDF3c0NWdE02eTF3cjRtU2ZobWgr?=
 =?utf-8?B?bE96dUVGNEJISFpMZC9zTy9mQjNZTjg4elhYWWdJaVp2UjcvYlhpKzVLMVJK?=
 =?utf-8?B?L1Fndit4bUhGR0Y5cE95cDRqcU12bE1NUGVzSjdtSkJNWHd6dFVYaktveVU2?=
 =?utf-8?B?cGF5anRucFR3R2ZKaGRRckd0RFpFTE1vVjB0Z3lPVWg2ZTh3UE5qYlp0SVQy?=
 =?utf-8?B?TDVyaTNvOGlHL1loTk9kOWRiRE9IeENEelIvV1I1cGRoL1Z6NVU1SlF6U1NZ?=
 =?utf-8?B?azRlYVB1YmtnbDZhTEl3Qmw2dXUxQjgxcEthbjc5NytWS2JqRHR2NWxQbUhj?=
 =?utf-8?B?cWlmQzlFWUI4OWtML3ZkS2lBd3lsbHR5SEtWQlVtVi9uZ1U2SGZLZGxSMmtV?=
 =?utf-8?B?VG1oeE44R0dMbWFLb0x6QW4xMjhDU2gyYitSeGZKajRLckpZTlc5L3ZsVjNF?=
 =?utf-8?B?R1N0ZHpaeE1lbTZ4ZkdoNHpxRm1LN1JOTWxsLzdBejlBSS9tTmxxVUpOdklo?=
 =?utf-8?B?OTNjaFpnbVRDZ215clhzL3ZaY1FBM2N6czdBdlR0SjdBQzM2WEFiakpvWG9s?=
 =?utf-8?B?Y2puV0M3dTluUG9ZaTl1TUdIUm43MmlrVEs3NnR6Z0U3ak00THlxbjdwSWN5?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e9d0a2-95bb-4258-c07c-08dd7616ac06
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:56:30.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRtOE1D0SWCoUREKmM8h0ltMo2hQuE1zrCqiYrZmexWI1J6l89UMW4brIxnA6BlqbNntrwztTzfeppQ6IW/lawN0zI56WE5xiRHqVBWOSoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f43c04 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=lF_3ORTG3LF7VfY38tIA:9 a=QEXdDO2ut3YA:10 a=i6Z3i5LTDg-tdjQkDVEA:9 a=vudqOzWXx3v0_gLq:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=NA03pvyaApPJG5valX87:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9_PViAjSuD8XPdpd761QL7b1YR50wRTb
X-Proofpoint-GUID: vWbOPwW9yvARZuvs9rSj1aK5gLE-J7Wx
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_06,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070146
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 20:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116679

--------------DfNotZQTrseuzm8p2JgHuin9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-07 8:15 a.m., Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../{mariadb-native_11.4.4.bb => mariadb-native_11.4.5.bb}      | 0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
>   .../recipes-dbs/mysql/{mariadb_11.4.4.bb => mariadb_11.4.5.bb}  | 0
>   3 files changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb => mariadb-native_11.4.5.bb} (100%)
>   rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb => mariadb_11.4.5.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 66b46d2afd..f704ff6dec 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,7 +25,7 @@ SRC_URI ="https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \ 
> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \ 
> file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \ "
> -SRC_URI[sha256sum] = "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b"
> +SRC_URI[sha256sum] = "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354"
>
>   UPSTREAM_CHECK_URI ="https://github.com/MariaDB/server/tags"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb


Sandy, there's a mariadb build failure. See below.


Khem said on IRC:

... Changqing Li and report this build failure -
https://errors.yoctoproject.org/Errors/Details/851668/ with mariadb 
11.4.5 upgrade

I see the patch on lore.kernel.org but not in my inbox, mysterious world 
of emails

../Randy

> --
> 2.34.1
>
> pLK@tY:ATbOf1"dW
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116666):https://lists.openembedded.org/g/openembedded-devel/message/116666
> Mute This Topic:https://lists.openembedded.org/mt/112131137/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------DfNotZQTrseuzm8p2JgHuin9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-04-07 8:15 a.m., Changqing Li
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250407121547.2516285-3-changqing.li@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../{mariadb-native_11.4.4.bb =&gt; mariadb-native_11.4.5.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../recipes-dbs/mysql/{mariadb_11.4.4.bb =&gt; mariadb_11.4.5.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb =&gt; mariadb-native_11.4.5.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb =&gt; mariadb_11.4.5.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 66b46d2afd..f704ff6dec 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://archive.mariadb.org/${BP}/source/${BP}.tar.gz\file://0001-Add-missing-includes-cstdint-and-cstdio.patch\file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch\">&quot;https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           &quot;</a>
-SRC_URI[sha256sum] = &quot;96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b&quot;
+SRC_URI[sha256sum] = &quot;ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354&quot;

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/MariaDB/server/tags">&quot;https://github.com/MariaDB/server/tags&quot;</a>

diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Sandy, there's a mariadb build failure. See below.<br>
    </p>
    <p><br>
    </p>
    <p>Khem said on IRC:<br>
      <br>
      ... Changqing Li and report this build failure - <br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/851668/">https://errors.yoctoproject.org/Errors/Details/851668/</a> with
      mariadb 11.4.5 upgrade <br>
      <br>
      I see the patch on lore.kernel.org but not in my inbox, mysterious
      world of emails<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20250407121547.2516285-3-changqing.li@windriver.com">
      <pre wrap="" class="moz-quote-pre">
--
2.34.1

pLK@tY:ATbOf1&quot;dW
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#116666): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/116666">https://lists.openembedded.org/g/openembedded-devel/message/116666</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112131137/3616765">https://lists.openembedded.org/mt/112131137/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------DfNotZQTrseuzm8p2JgHuin9--

