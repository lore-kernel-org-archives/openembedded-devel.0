Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FA7C27C79
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 01:22:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.76069.1718673736859334661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 18:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6899db8c63=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I10ND2026195
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:22:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w2d7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:22:15 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45I1MFVa023179;
	Tue, 18 Jun 2024 01:22:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w2d7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 01:22:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XABBiDHd3mJMzcrNiaM9OwZrMMwdCkOa4T9DRV4Eko9ocvKINyONPKLoEMERLXycQB1OFB0261K37RRohU4fXcomUGPe2nEgyYKynAbU0IpIOGUGIIJhC44AALiPKmfXoDy+t3YVRle/SIvdeVYZ234H+RS82ST0rCS3+xtChyNzJz2TTAQXAFRWMemm7pn/feqx5V4Dv3Zm5QThearKDqzQSKBDoSSUiC1zx8TYWg6AiEMd/WbQClNub8AT9lolfM5/Wu7tzh+RlLPv8YlpZPmFrEn/9xyE8hgf5QKcDAj/NkkMPsF2lmP75TbosQlJ+bQDHDOXk5+X0muy6gWLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTfkHny1f2+IfDnapHL37A3qDBJGLvwac+b4PGtAIw4=;
 b=H3Qp2JXOrWA1BrAXqfFGouCm48SuDMKjQA0vj4I3sZzn2uNkshH9HF/QU2ZPCJXBjX6exjThTOeI3QQCoFCS3jvX3WfW8QS+uqfs6Bg4IBPFmVdzku8QTpZzt77fHSwByILWXGAB9xeqW/QQWOYNL/VZJoWkhKFFv5wClJbnqbVhwhnY4G98TQNQDKf0YlU8Ff747Hza61ALSg9Yj1DMeWRUsxx2hdr6e7r0CkHjmwk3fsKEEZpaTI1YanOzGnqWd85OPGWx1Vm2Lrm4m5nAYBk2DU86RHdiWcVmyjvGaUf0h90jKpYm76zn6Zga/fl+eayu7fejV0wKrMpINERkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 01:22:10 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 01:22:10 +0000
Content-Type: multipart/alternative;
 boundary="------------ePFrt03mDWp447BJABsM3tZL"
Message-ID: <5f1edf15-1554-4d6d-a4cc-e1decd194da8@windriver.com>
Date: Mon, 17 Jun 2024 21:22:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pyyaml-include:
 support native and nativesdk build
To: Tim Orling <ticotimo@gmail.com>
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
References: <20240617191342.2360052-1-Randy.MacLeod@windriver.com>
 <CANx9H-DUPrkCGV9neBKQL+f-SkVyLzdooQnC2zt7BLPFA7bxwg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANx9H-DUPrkCGV9neBKQL+f-SkVyLzdooQnC2zt7BLPFA7bxwg@mail.gmail.com>
X-ClientProxiedBy: YQZPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: bb21b9fc-645f-4c72-ecf3-08dc8f351352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011|4022899006;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0FUSDNDeDJGUmhQbnhwdlFSWjhhYjltK0FyVk5lQVkvVm5sSVpwSEtjaG1p?=
 =?utf-8?B?akMxK2lxd2tXcm5TNnF5VXJ4OGVGQ2NQMy9RNjZiUW9JWERlYk5oZmhtaGk2?=
 =?utf-8?B?V2hCVlRiNGt3S1NQdWJnaHg2TFNoYnZ1andSbWRZV241U0dYa3B1QWlwNkZZ?=
 =?utf-8?B?eG5vUlB3aEgzTEhGZ0pjSExyTXA3MmZOVCsza1VZdjZsYURoeUxhR0xKenBS?=
 =?utf-8?B?MVVGL1ZCRG5jbDJxbzJCaXNET3BOZ1BkRzkyVzFQVEE5clNONld2UExkMG03?=
 =?utf-8?B?dmNZM25DampjMDBuN0ZXTVdSaTRtMzJrZDI2dGhtM1BmQ3VDNExaRzAvdENW?=
 =?utf-8?B?K1pXd0JFQVJWczQrU1pndCtjQ2N3bis1ZEZkVkxkOGx3enZKTWYxYko3OFh2?=
 =?utf-8?B?b25jdDJ1bGg2bXpoam1iTVUrSDJsT2FXbGtPTnZkTzVZV0xFVU5tNmo0VEhn?=
 =?utf-8?B?STNBZ3JHd1JJME1lRXA4VU1idGRNcWR2RTVsdExOMVRRY0RkMlltVkRjRHB4?=
 =?utf-8?B?Z1ZJNlUvWFowTm82T1c3Ulc0bktjdEt1RWdFUjdwZFdGRDZPUUlzR2VZREs4?=
 =?utf-8?B?NVJTV0Vtek1sYWJobHdDTGw0dFZiK1hKVVVSMHZnb3hqTFlqWUFJZVNFbWtT?=
 =?utf-8?B?TC9XZ2Y1RURZditqR3FnaTYzcVRhZkltOHZrZTJ1d2srQnFaaWFSY0MrWUpz?=
 =?utf-8?B?WHZCMnlBNDV3NVhEQ2NGTHJFZmtxWk9oV3hack83YlUwZlJhemdCckpiYjFD?=
 =?utf-8?B?M2VTTzVWNk91M3k1ZnloS1lGdzhDQjZqcEJLSFp4TDRlYlZ2ZUJmcXFKTFVp?=
 =?utf-8?B?Ykp6KzlZQTFWaTZoRW1obTdNdzN4MXlQYUVyYmZKUVlTWGw3TUVxSFJUUGMy?=
 =?utf-8?B?QjR3MjczK2w5bmhhNmdrdVI5WGlKNXQ3dW15VDVuMGN2bGtXVDVmMk52TVhu?=
 =?utf-8?B?QmloVjZpcG4raUxOR3BNQWRIZ1VRdmNFY2J1RWJybkVoU3NNT0o4K2orNnZF?=
 =?utf-8?B?ODNIeWVLOTRxenNaeWk4bGUzTU1UQXgxVGhWbTliNDZKaGJldWJZMksxNHpT?=
 =?utf-8?B?U2FBN2l5Um5PZ25NdVQ1cWJlWlBYK0hkZUx3ZlE0b1dYUE9CaVlpV1AyeXBY?=
 =?utf-8?B?bDR1REdMZi9JRjFmN2QxOEFlUEZEaTFzaHEwL3krQy9Ja2J4VHBDWDhseldw?=
 =?utf-8?B?azA0U0VIKzBsT0FPVTJ5cXd0d0V3RWJ4VUJWdmJZTyszVVczMldiZXBoODNi?=
 =?utf-8?B?dWtuaFZtcXNlcHRBZFc4QTNGSU9JMEhUbDFCSXVaSmJmOVE2ME4wVUpIeElR?=
 =?utf-8?B?blpHT3k5N2NYOHk1b25aQkVvK3FWYy9lcld6R0JLNWo5UytXbGtqM3llR0lu?=
 =?utf-8?B?YThiZHNFOWxKRGJndmVwVVUveG9yRlhBUVgwZElVNFIxMEdiMVJ0cnJmWVJr?=
 =?utf-8?B?QmR2VWFJUWRUN1NtL2I3cGhSZUdEZFpRNk5BRVhoZFdBek0rVTFMRWE5NzZz?=
 =?utf-8?B?bTR6SlpSUGcxNnU1cVRsNTFnTHlycXROUDFVVEozZmlzbHNQWEZZWFI3U1lH?=
 =?utf-8?B?S3pnMitnQlkwdHozUldaTmIxQ3pQYTdGeEI3UUFrMnpBMXY3Z3RCUW1yMmxr?=
 =?utf-8?B?czhtVkxzZnR2RThyclY3TUxxaVdmWkJNUmhpOUI4cjg5UEhhUkRKQ1grZnpy?=
 =?utf-8?B?N1pOdytmSk9GYWt5VW1KcTZzZk5INnFMZXhNcFV2LzY0a3RLOGY2eWd3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(4022899006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjQ5Nk5hbkd3NUdhMVUyeU9DdTJSMzBZN05mRGQxMzl0MSs1Z3kyV2xZL1Rk?=
 =?utf-8?B?b1Y0anVzcjV6dTFGRnRBR1lrQ1VUd0FlREdQTVp2UUdIVlZlelBNS3Viejcw?=
 =?utf-8?B?aWtRbHJ5OW5xM0NYdU1XTGYyU2ZyeGlXdmxBM29QZ2hPVUZ0VEovenV5Z3Yw?=
 =?utf-8?B?NkNleHlzYm5vTEtEYUZQZlZWL2E4ZGg3eG4zZkNYbFUxeldHSW5XZTUzMG9q?=
 =?utf-8?B?WU54czlQNk9VVVh5UTJQaEpyZEllTFBCUEJ3SnFETzBsK3BkbkViTjgxQUdu?=
 =?utf-8?B?Z3dmdC95MGNrL1BlbEZ3WHZjYmNNbnQxRmJodWtlVmZZK0NmZURpSkJKc2FI?=
 =?utf-8?B?WUowYmM3RHhaSWFPQzZ3K2JaTlM3a0I5MzBlaVRDL0hrUzFiRCtVaEFMaVpt?=
 =?utf-8?B?Qk8wZ25mNUl6S2JCSFRVVXc3aThsS0NETkJqMmxrTWNOQ2pNRlgvYmhXcCsx?=
 =?utf-8?B?bERQVVFTdW9WNVEyS0kzdzVhc2hERGlZckVzbk9wZktjZWlHQXZDL2x3d2po?=
 =?utf-8?B?U2xQMk1CYWNpZzM1bzlxV0V5a2RrMVI4d1pMTktkMVhjemRIQXQ0RG1uNzgr?=
 =?utf-8?B?K0NLbXJTRExrQUNTOFRsTENyQ0loZ2NoSDNldzJ0ckF5SVBranlBbW1FODZG?=
 =?utf-8?B?NklpcGozK1FwMHRKcWU1Zk9FNjBYczNsTlNRYWRPTVpSTklseFhoZUdUQWxG?=
 =?utf-8?B?RVlOeWpINXlGWnQvdmVkTUd2YitDUkptcXVybHFieFkrMGRsbnRmaGQvRldN?=
 =?utf-8?B?MVFRWkZhOWVTZmVoNURvbUQ5ME5jbWhYYzE1ZnNOT014ZlVXcCtuOUpJUVBH?=
 =?utf-8?B?ZkhLWXVUcXQ1WXBHZkpxTmFES0dueWtDaVpPNkpjblN2Ny9lc1Y4cHMrZXpp?=
 =?utf-8?B?OUVzUHViRXZtTlVpWXlOd0ZQU0ZtdVFlWXkxcS8yUGpTSjFDTlpZMmR5OHFk?=
 =?utf-8?B?TnVLbFdROG1KSlpqOWR2ZG8weXFiQUVTbnp3Sk5uTm9Jb2JZeWhMR0JSdWJM?=
 =?utf-8?B?eWFLTHFnUmw0aEtLZ3JLVXlNTXlpRUdtV3Q1bjFmQVJtQk40ejRTUklTZ1VJ?=
 =?utf-8?B?TlhMNitvT0w2OU9wMER1eG4rZjVtYzEzbEdFSWRDdi9XczFkZHUzWERWMXZu?=
 =?utf-8?B?QmloSTZSN1dVbFVrN202YkoyMThXZ3oxVFFGNFhHOFBBNDV4WWJOZTNSY0tY?=
 =?utf-8?B?dHFDMWM2SU0zMHBETkp0K1hKWGV2MHFiRjFtTlBMOGxwUlZMRGlwUHdJM3Yx?=
 =?utf-8?B?a3MwM2xXZ0dKQXRlMlI5emdTV094TFJiaUpuaGtnVi9EUGRFMGZQTUlURW1l?=
 =?utf-8?B?N0lvZFdWbkNCODI3NWcvL0djQlJCT1pycDYyVFgzSUF3WGZLaklrQ1UvUWpj?=
 =?utf-8?B?U2R5M1FENGt4OW1Fdk51Y3ErK1hxSmthaGNka0kzN2JkSDY2S0c2d2JuazQ3?=
 =?utf-8?B?THNUb2JidUJuLytjR1g0UGhocitKalB4eHlBZWVGOW1lS3NGTS9uTEV0SitG?=
 =?utf-8?B?cVF1c3JXeEhocWJ4Zzg4ZVZUaGtSSmNuTTVjRTNvY2Y1dnZlVVhjQTRNWTBP?=
 =?utf-8?B?aUFSeGJjcSsyaS90aE5TWkZOZjg2Y1IvZUZpalEwM3JwYXRiaVVnUTlJMWF3?=
 =?utf-8?B?SlFRNUtCaGdSTXFSTzFoWnVDYUJkMUFoU3liR2k2YjRxMG5ZSm1NRmlXYXUv?=
 =?utf-8?B?cFFOMW82NVVKelB4TFdTMUE4UDdmU1N6ZXN1YlcrNFNLWEx6K0F5ZWJXaTZN?=
 =?utf-8?B?ODB0SXVQUDdaVVFnTnhYMjk0YTVzQUdacU5LbFFUeE5xOXg3L0pXRnRENE0x?=
 =?utf-8?B?S2JqN0JTbW5xdmNRNVFMQXdDbWh2dURtT3BWaHpzU0xiNDZlYkMyRkVCd2xN?=
 =?utf-8?B?TEFMZVNwVjFjUHRxUjEyWG1NZ25uMWkwVWtyZUwxOCtieXRFUjRGdzVwWmh2?=
 =?utf-8?B?R0pFUW1pQlRLWmM3Y3JucUpCZ2FJVVlCL1Q4RnZ0VWdFcEhaeVNxYmV0M0Rp?=
 =?utf-8?B?aXdPaHo1NWZ1UGJUNWhhQjhQOEg3b0dDNWttamZMZGVKM084RG9OcXZUVHdE?=
 =?utf-8?B?WWcycnFTOEZBRG55bUpJWkhGZTNzVmFJTmJCUnFmWlhQMEphOFYxbnk0MXVZ?=
 =?utf-8?B?TkVudUV4Y09kZ3V1bEpKeEJ1cGhlVmlRazRYcVNYdzhwQWJ3N2xkL2IwT0pI?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb21b9fc-645f-4c72-ecf3-08dc8f351352
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 01:22:10.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5nFySHkXLdrxhub9iAh8w7R6fEa5GEs1FJ0cJe270NvJUGAMEYekw1Vhb+CcwGBy4gFTQYg9X7ykJEvknzcuBPGWyLRykPvBXPlTaCF3y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-Proofpoint-ORIG-GUID: o2UMiqxCXndkxFySVISwA05_mzZ_7kP6
X-Proofpoint-GUID: dhxzBxyVvZSMWsfMYqF3FhCZdtXXE07X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406180008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110947

--------------ePFrt03mDWp447BJABsM3tZL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45I10ND2026195

On 2024-06-17 7:36 p.m., Tim Orling wrote:
> Master already has this, so it is a backport request.
>
> Randy, I assume you verified both targets build without issue.
I did test on master but didn't for scarthgap since it would "obviously=20
work"!

Famous last words...

On my PopOS (ubu-22.04 - ish) host:

|=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots-u=
ninative/x86_64-linux/usr/lib/libstdc++.so.6:=20
version `CXXABI_1.3.15' not found (required by=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)
| ---------------------------------------------
| Error when bootstrapping CMake:
| Problem while running initial CMake
| ---------------------------------------------
| WARNING: exit code 11 from a shell command.
ERROR: Task=20
(/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes-d=
evtools/cmake/cmake-native_3.28.3.bb:do_configure)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn't need to be=20
rerun and 1 failed.


I'll try that on a supported distro and re-submit adding a comment about=20
it being a backport.
I'm busy most of the week so it may be a while.

Thanks for asking Tim and sorry for the noise.

../Randy

>
>
> On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Randy MacLeod via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkaz=
y3jSHZJsReCax2W-Q$>=20
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     ---
>     =C2=A0.../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>     =C2=A0 =C2=A0| 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.=
bb
>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>     b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.=
bb
>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>     index 3a5bd99a7..309d0ac59 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.=
bb
>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>     +++
>     b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.=
bb
>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>     @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D " \
>     =C2=A0 =C2=A0 =C2=A0python3-pytest \
>     =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \
>     =C2=A0"
>     -
>     +BBCLASSEXTEND =3D "native nativesdk"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#110943):
>     https://lists.openembedded.org/g/openembedded-devel/message/110943
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/110943__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLE=
V6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRdaJIdgGQ$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/106727475/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1067=
27475/924729__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1Z=
wM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd-fviFOQ$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4Rk=
eZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd659LC0Q$>
>     [ticotimo@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------ePFrt03mDWp447BJABsM3tZL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45I10ND2026195

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-06-17 7:36 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANx9H-DUPrkCGV9neBKQL+f-SkVyLz=
dooQnC2zt7BLPFA7bxwg@mail.gmail.com">
     =20
      <div dir=3D"auto">Master already has this, so it is a backport
        request.</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Randy, I assume you verified both targets build
        without issue.</div>
    </blockquote>
    I did test on master but didn't for scarthgap since it would
    &quot;obviously work&quot;!<br>
    <p>Famous last words...</p>
    <p>On my PopOS (ubu-22.04 - ish) host:</p>
    <p>|
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots-u=
ninative/x86_64-linux/usr/lib/libstdc++.so.6:
      version `CXXABI_1.3.15' not found (required by
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)<br>
      | ---------------------------------------------<br>
      | Error when bootstrapping CMake:<br>
      | Problem while running initial CMake<br>
      | ---------------------------------------------<br>
      | WARNING: exit code 11 from a shell command.<br>
      ERROR: Task
(/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes-d=
evtools/cmake/cmake-native_3.28.3.bb:do_configure)
      failed with exit code '1'<br>
      NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn't need to
      be rerun and 1 failed.<br>
    </p>
    <p><br>
    </p>
    <p>I'll try that on a supported distro and re-submit adding a
      comment about it being a backport.<br>
      I'm busy most of the week so it may be a while.</p>
    <p>Thanks for asking Tim and sorry for the noise.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANx9H-DUPrkCGV9neBKQL+f-SkVyLz=
dooQnC2zt7BLPFA7bxwg@mail.gmail.com">
      <div dir=3D"auto"><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 17, 2024 at
            12:13=E2=80=AFPM Randy MacLeod via <a href=3D"https://urldefe=
nse.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-=
N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsReCax2W-Q$=
" moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.ope=
nembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">w=
indriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">From:
            Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.c=
om" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">Randy.MacLeod@windriver.com</a>&gt;<br>
            <br>
            Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacL=
eod@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">Randy.MacLeod@windriver.com</a>&gt;<br>
            Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">raj.khem@gmail.com</a>&gt;<br>
            ---<br>
            &nbsp;.../recipes-devtools/python/<a href=3D"https://urldefen=
se.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!aw5nRq=
XmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd=
X0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">p=
ython3-pyyaml-include_1.3.2.bb</a>&nbsp;
            &nbsp; &nbsp;| 2 +-<br>
            &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a href=3D"h=
ttps://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!Ajv=
eYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELo=
Yvkazy3jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">python3-pyyaml-include_1.3.2.bb</a>
            b/meta-python/recipes-devtools/python/<a href=3D"https://urld=
efense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!aw=
5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZ=
JsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">python3-pyyaml-include_1.3.2.bb</a><br>
            index 3a5bd99a7..309d0ac59 100644<br>
            --- a/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8Ev=
Q!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3=
jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-pyyaml-include_1.3.2.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8Ev=
Q!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3=
jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-pyyaml-include_1.3.2.bb</a><br>
            @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
            &nbsp; &nbsp; &nbsp;python3-pytest \<br>
            &nbsp; &nbsp; &nbsp;python3-unittest-automake-output \<br>
            &nbsp;&quot;<br>
            -<br>
            +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#110943): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/110943=
__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_R=
MZ0yqELoYvkazy3jSHZJsRdaJIdgGQ$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-devel=
/message/110943</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/106727475/924729__;!!AjveYdw8EvQ!aw5nRqXmGOp=
Tn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd-fviF=
OQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:=
//lists.openembedded.org/mt/106727475/924729</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!aw5nRqXm=
GOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd65=
9LC0Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">ticotimo@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ePFrt03mDWp447BJABsM3tZL--

