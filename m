Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF32C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:53:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58762.1723499593911437493
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8954c110e7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C4oS24032027
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:53:13 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g024e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:53:13 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47CLrCYb003450;
	Mon, 12 Aug 2024 14:53:12 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g024dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPuVkNqrb31+TZ/CymnbAutfwwdX3h0r1gs3wLKW39X2B63+x0hLe8TXEgbLiY2gmY5MtwJ2ve35deuKu+Rw96efuubQBW/K6V0nFnNnS/PG/IvbPyLXWNSfYi8GQy/JhhXGi4M6o5gQNaJQ0ySseDURld2j7l3asHGm+qK27l+JQXxKK50ID6rFr6nBuvtplEQefskN9Ee6xXGiCgPvYqdfj+sBrtqnxZlP+BrpiTOiFpicJCuVFVrD1eeU1visWMeCfm92aH/pwYCoW3qSnxWeR3dAgonBrjEW6AdVSam7u6dvUPYBD2uyuDVviygpHXgdDlvMye1L9ILODhUAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN0OHwalVQcWmFS+y2I29yqIvJ7bTipNyImgodaCrno=;
 b=NWJoLNIoosvuxdea3VOUob+jPip/6t4s1QVjd0C7Cseba5ulcc7Adfb6SJTOQVls0jhOuKjGifj0pW+LpwKjcQ1oF0L+WsFv4vcJ3y1gHj6yHQOr+cJLpCtX5EvY07tha+kq7IsdaAc44KzO9kWIqBQqxjd7UUJsyz/e6Kymy+nIbqz4tU5qKIk/e8QNlhcqIGXdrei+rg49izff4R+3Cnn1g/BtG8aHtHVLDpL6hd3NWJIjXuUcQwaFUhPhP5d2nPu9PTMo0YattX8bHU4/kXvBiCDQLEwj8Tt/Za0NBVylhYfzsWlaUqNnVN3dwfiG8pXs7GdUFfRlWWk7+8QLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 21:53:08 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 21:53:07 +0000
Content-Type: multipart/alternative;
 boundary="------------gzkC43xqmPOD3zi0pb4dA4Jz"
Message-ID: <3df02a33-05b2-4fe6-855e-20797b66d257@windriver.com>
Date: Mon, 12 Aug 2024 17:53:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][v2 PATCH] liblinebreak: remove obsolete library
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240812211207.1450248-1-Randy.MacLeod@windriver.com>
 <CAMKF1soZsRJwVE6wYbHjCGh_UvUXzxNNUT0D-+yGDNRLx=ASmA@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1soZsRJwVE6wYbHjCGh_UvUXzxNNUT0D-+yGDNRLx=ASmA@mail.gmail.com>
X-ClientProxiedBy: YQZPR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: cb26b185-601f-45c3-f9ad-08dcbb1926a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzAraElxMjJSa3hVRVNKVnoxeU44RVBabnU1MzV5WUFNc0gwdUdPQnBlUHJp?=
 =?utf-8?B?eGVpbThPalljMWtSZHF0TFNCbTNMbUtTQlRmVGRkODB6RHVNWElKKzc3Zi9n?=
 =?utf-8?B?SitXSUt3RzBCVWkrY1FIT1FudGhhRW5GUDU1cmtsYk9lSDYzeXlDU2VuVk92?=
 =?utf-8?B?em95RlB2cXBrTkJsQUMwTGFZSDI1WW9YeUZQTG42cVpaSURFQzI0QVpZSlM4?=
 =?utf-8?B?T254Yk9KTkQzaVMvNXVaSWlpdkNKVnVERFRva0NFMzhJS0hPcEVwSFYyeDRr?=
 =?utf-8?B?eVVXb0tKb2RPNCtTclpyLzFkZVNIUWFrZ1ZsOERFUktZczVzR0p4RzhBcVJr?=
 =?utf-8?B?NHZmY3pibk5uMFRjUFVsc0Y2N3hObTlOVlk0aC9obi81d1craWRCVnZ1Ulpp?=
 =?utf-8?B?RUhtc08rcTA5NVdHK3FiOGQrUUJVNFNoL2hiTWNyL1hXS0k0dmJDYTBzUzJm?=
 =?utf-8?B?OENCSmZ4N0p3ZExDL09wc21RNHlHajJ4K0JTL2tBZk11NnFhK3k0blFnTkhk?=
 =?utf-8?B?c1lVeGNRNjZXb2oyM3FrZXdjeUFmalBlaVpNemJYUlRtOGlSbDFPay9INjZM?=
 =?utf-8?B?emk1ZEFESTh2L01WTStOajlTN0NpajJJQkRKa09hOS9hTWljQ0RIQ1gycUk4?=
 =?utf-8?B?TGNCSG16SjdRMEUxNDduMjZiQmk2SFpaT1dwanRjK3hxZElPbUJVVC9KU3Yv?=
 =?utf-8?B?MXczMHM3TlVadDZMM29JVUg4RjVxZkh6dWNzSE9LUFhvQzhIUGJyMkZBWnVM?=
 =?utf-8?B?Z0o0Qm14dFErTUFVN2wrUHdzbTNSbFhkMWNGRi81U1Q3R0VPcWlYL1c1dkZP?=
 =?utf-8?B?cTBKb3VEVlQwTTVEcjAyNC9MRlF0N0ovOXVvYWZjWUFYTDRtWXVvcG1BSWpQ?=
 =?utf-8?B?NFBEbGFiQWtSKzBPVUx1N3l5RFlxVWlSam1HY0p2OXpsaGE4enZKc3VsaHRQ?=
 =?utf-8?B?R0JsV2wvMnpXQzdVczd0Z24wS2tqQ21mazJOL0t3QWVXRjVyRXlURDVBdy9y?=
 =?utf-8?B?a2tlL2FFVE5Ec3oxM0RwdjkwbFNmY1I5RzVxM2RBZ3k3UFhONzdpK3d2b0RX?=
 =?utf-8?B?Tms4QzcrVUNZTS93Q2xjUnNkb3R4Q2RKV0tFUDZFOER0bVhwSE5vUlRqV0Fu?=
 =?utf-8?B?ZTVSR3NnZXNDajBIc05aei9vU1pXSVJnejRKM09EcjQ0NXdYU3g0V1dGR2xm?=
 =?utf-8?B?c1l4TTlBNTVTM3lnOHJFazUwM3o5alp1QllXWXBNQUJRMXFuTVRhTGFJTG5j?=
 =?utf-8?B?NTZDclkydndNK2FTTm83MFhFcm1OOUk4VmM5R202Y01Cd3YxcGtQN1pYN0xp?=
 =?utf-8?B?OUwrQXhPcWh0UmVGK0Y3dmUzeTFIeWRGMi9USnIwRTFIRGlaTVJnM1hBM2Ja?=
 =?utf-8?B?bU9vS25KQzRKS2hGbE5rY1JBNVlNVmREeEdzNU80YTBYV2sxaUN4a2xWZmcr?=
 =?utf-8?B?MlMxa0luRlJSd2JvL0dQVXVqOEdtajNlM245dWZyZElCcmpRR2V2NncrYmQy?=
 =?utf-8?B?QWJlNEIveWZDVmlzeWhaNllDVmtCelJXajkvaUpRejhkbWVQVzNGa2l4am5l?=
 =?utf-8?B?R3B3ZHphY1cyYmVqOVhtNXExRXk3NS9SVStFSXpFcGtuOXJKTFNhcnpVa2xa?=
 =?utf-8?B?YzByNU9sbllTaHVKOEtyQ0JIcjRPNG5nWXU5dEpzajZ6dko3TG51YkYwNXVi?=
 =?utf-8?B?aDk5OTJTZ3FlRStWTGhKSVVEN1RqSDgvWUtvOGR6T3grcHNiMTFONEFsMEpT?=
 =?utf-8?Q?mJjirqrHq/PvuzmylA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVltenpuS291WVpLQ0l4cXN4dmJIa2NpWkEyUHBhVWcyNlg3SjVWbW1CRS9R?=
 =?utf-8?B?SjNBazQ2MXZuL0JaT2hWRGlqaTlJME1XQVFKSVlLVFd3bmFVeEdBeW5ZaWln?=
 =?utf-8?B?bXFoZEJxN2Z3aVVUZ0QxejhIYUdlTlE2UGI3U1JhVzNGTk9WTEFtRnZPcmtu?=
 =?utf-8?B?RlRCYUJCYjlYUFBORitDbmswWXVVY1pvMXRaMHFVa09hdjlieFcyNEpwS1ZO?=
 =?utf-8?B?ai9MVzkrbHRzODBudXpFMHpnN2EwV29LMXdtd1p4SllDZ1g0TndPS0FHUFNC?=
 =?utf-8?B?cWRlRVNLUnhobnpoSmNMMjFzSUlTN1hvRFFZRWdjeWl3MTZCbjN3VGNPdGs0?=
 =?utf-8?B?NXZzZXpqeFZ2SHpHU0xkQ1RnTUhMWjZuM1hmVVVMUEdsd2NoRTE4WnBPSThJ?=
 =?utf-8?B?cFlSZnVPMmdabm42eTVwTVQ4U01oaVVFOWpZVjlsbC84T0JucGsvTG5peWJP?=
 =?utf-8?B?cnpweHBlRTBPQWdva2UwekNLcHAyaEg5UXF0WDArZEl1RmdDMVNMaEhnclFq?=
 =?utf-8?B?ZS80NXFjRjcvVnNQNDBIenNGUm0zNlNGbkJpbk1COERPMU5JYW1ORFdqM2p6?=
 =?utf-8?B?eklmQ2hwY0dGZER6RVNwei9aZVNJanRtK3BRbmozZmRNZGdleEtGL1ExdW10?=
 =?utf-8?B?TWJydXZpdzYyUW41OXkxeVFCUzFvNGxlUmpCQkNKMk92Z0FZbXlQcWM5MmtT?=
 =?utf-8?B?VjhaUDJvKyt6MmgrYmJPN3M4VFFlTTFZZWdwcVBoaGU5bHhKWVBGZFF5clNv?=
 =?utf-8?B?aXlnZW1QRk1PMnZ6YVZNcTRBM2tQTXQ4elVuOTRReW55aG40NjJaVTcrenJQ?=
 =?utf-8?B?b0lITEdiSlhUV2liTnZpR080enpoeWhIRGk2RTkrdUlnczRoNHVOaXpMTGJh?=
 =?utf-8?B?ZXhnK1Z1QU1tWWtTMXFOZnNYN2laa0tvQ0ZMeFdSMFI2YmxTVnA2SEpYaTIx?=
 =?utf-8?B?RXVCU1ZVT05tQzlncmNlSWtQb0FmTERGMGVackw1WHhaVloyNkgwTVVsN2pl?=
 =?utf-8?B?QU9BOElwb0pPenBjc2pIQVZTV2w0TmlJbm9RT0hGNzdaOEpIUGVHVXBnS3hv?=
 =?utf-8?B?N08rZ2Q5cDNJajFxYVlselJMZ1J0SFNhVjk3UDBMUjRNWUlMTTBrdDBDeVFR?=
 =?utf-8?B?QlczU2dZZHplUzREVzF1WXVuSlAzVlNZWkhiMllCd0ViNStjSEVIdkRWT2lm?=
 =?utf-8?B?bjRGQ1FZakc0WVdVay9oRGRtbzFwN1UzWG5vVDFFMnhjVWlMd0c5NHFTdng5?=
 =?utf-8?B?ZVY5cGVEMW5XRGk4eWhlbmU2UVUrWTFBMDdPT2lUTU00bVp3bU5oeUdkbTBS?=
 =?utf-8?B?RDJpTVFoWEU4L21keW96M2RQZkNmQURrQ29PTHMyN0hHb0M5WUFMRlM0MGlY?=
 =?utf-8?B?NFNCWTMvQndIaFZSbDV5UmtLejJsdTNEakNsN2lGTVNtQ2ZaSnJZS0tqWS9X?=
 =?utf-8?B?WjVzaGVjTTFyTUQrRms0RDA2ajNlY0tMaEpua25IQkdYRzRYQ1FHZnc4OXpi?=
 =?utf-8?B?aFMvYTZkSUh5MU9ndXZ0Sm1aS2RjOGx4bm94RWdwV3hpZXErSVNKTUJpZkNi?=
 =?utf-8?B?SXFlMi9IdlI2UG5xakN5aG5VLzE4L3hyZHozTkJ0M0RmVThaNDJoeGVkdk5H?=
 =?utf-8?B?ckhFbE1RdFlKMmtiTHUwRzJQbTB5dmRBVzZXSklrMUJzNDl0MDRESVFhQ0lx?=
 =?utf-8?B?eGpQaTVNMzI4STVPQ3psa213NTdZbFVBb0lYUEtibitWMVFTWDlIWjVUVmpL?=
 =?utf-8?B?N1M4VTdoeXZCZlQ3enVvTU8rWFRmZWtoVXFNenNpd2o0WVNGa2hMTG5uR1dh?=
 =?utf-8?B?VGMvWXQzemdsQmlWeVRNRnh0OGVzcjRJT3FkYW10WDBUeW0vR0ozWjd0MTlP?=
 =?utf-8?B?Qzk5UktiMGxQUy9CVlNCY01oak5laTlPL0daSEVJV2dwdExCWHRVbkxxNDdu?=
 =?utf-8?B?elBMWlB3RVh2NUR1NUVoWm51R2F1R0o4N0I4Ny91OGRad0RhVUZuclIzOFhF?=
 =?utf-8?B?TVd6amhHdXBzMklDS1ViTk1hMzNoWi8rL0U0R1Y1R0tPNnlseTRad3BTWkxl?=
 =?utf-8?B?QlgrNElyZDc2LzIrT2xLVzIzTjU4bEJ3NDJtN3A4cUprQUgwcVBadWRTNGdH?=
 =?utf-8?B?SXdUcXkveHNYeDNWeCt1bk9wK2ZQem5CbFkvdUlSS0hORWp2M1pyRU9DdElF?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb26b185-601f-45c3-f9ad-08dcbb1926a3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 21:53:07.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdWaSJyB47GRc7dcuwf3hodVKxwBxFTCd3qFhchecEISiMDs0CVue0sVh0t8p+XZfRE/tZ9ynEpMA16zVcgJ6EvoUU0nRb26Dl+TP1UzPl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
X-Proofpoint-ORIG-GUID: sz36CPaKpLhxzFb_fh5ze6GC3lSxs_rS
X-Proofpoint-GUID: q85fEcH7nMWjN9AFd168BvWkNJmtH_MB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120161
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 21:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111784

--------------gzkC43xqmPOD3zi0pb4dA4Jz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47C4oS24032027

On 2024-08-12 5:13 p.m., Khem Raj wrote:
> I have rebased it on master already, please check master-next if its al=
right.

LGTM.=C2=A0 Sorry for the noise, Monday and lack of sending patches latel=
y!

../Randy

>
> On Mon, Aug 12, 2024 at 2:12=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> liblinebreak has no users in meta-oe or in the layer index:
>>     https://layers.openembedded.org/layerindex/branch/master/recipes/?=
q=3Ddepends%3Aliblinebreak
>> so remove it.
>>
>> The upstream is has not been maintained for some time:
>>     https://vimgadgets.sourceforge.net/liblinebreak/
>> and they say that liblinebreak has been superceded by libunibreak,
>> an equivalent library that works in more languages:
>>     https://vimgadgets.sourceforge.net/libunibreak/
>>
>> Since there are no users of liblinebreak, libunibreak was not packaged.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   .../liblinebreak/liblinebreak_2.1.bb                | 13 -----------=
--
>>   1 file changed, 13 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak=
_2.1.bb
>>
>> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb =
b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
>> deleted file mode 100644
>> index c6caf450a..000000000
>> --- a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -DESCRIPTION =3D "Liblinebreak is an implementation of the line breaki=
ng algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22=
"
>> -HOMEPAGE =3D"http://vimgadgets.sourceforge.net/liblinebreak/"
>> -SECTION =3D "libs"
>> -LICENSE =3D "Zlib"
>> -LIC_FILES_CHKSUM =3D"file://LICENCE;md5=3Df89a1ce02e2dba48c1c0a8e6038=
464c2"
>> -
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${=
PV}/liblinebreak-${PV}.tar.gz"
>> -SRC_URI[sha256sum] =3D "dd8cba554d260cf686865cc53d0c6be98102a80f56f81=
52ca5e7307bf06a66b8"
>> -
>> -UPSTREAM_CHECK_URI =3D"https://sourceforge.net/projects/vimgadgets/fi=
les/liblinebreak/"
>> -UPSTREAM_CHECK_REGEX =3D "${BPN}/(?P<pver>\d+(\.\d+)+)"
>> -
>> -inherit autotools
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111782):https://lists.openembedded.org/g/openembed=
ded-devel/message/111782
>> Mute This Topic:https://lists.openembedded.org/mt/107865398/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------gzkC43xqmPOD3zi0pb4dA4Jz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47C4oS24032027

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-08-12 5:13 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soZsRJwVE6wYbHjCGh_UvUXzx=
NNUT0D-+yGDNRLx=3DASmA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">I have rebased it on master =
already, please check master-next if its alright.</pre>
    </blockquote>
    <p>LGTM.&nbsp; Sorry for the noise, Monday and lack of sending patche=
s
      lately!</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soZsRJwVE6wYbHjCGh_UvUXzx=
NNUT0D-+yGDNRLx=3DASmA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

On Mon, Aug 12, 2024 at 2:12=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Randy MacLeod <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:Randy.MacLeod@windriver.com">=
&lt;Randy.MacLeod@windriver.com&gt;</a>

liblinebreak has no users in meta-oe or in the layer index:
   <a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded=
.org/layerindex/branch/master/recipes/?q=3Ddepends%3Aliblinebreak">https:=
//layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3=
Aliblinebreak</a>
so remove it.

The upstream is has not been maintained for some time:
   <a class=3D"moz-txt-link-freetext" href=3D"https://vimgadgets.sourcefo=
rge.net/liblinebreak/">https://vimgadgets.sourceforge.net/liblinebreak/</=
a>
and they say that liblinebreak has been superceded by libunibreak,
an equivalent library that works in more languages:
   <a class=3D"moz-txt-link-freetext" href=3D"https://vimgadgets.sourcefo=
rge.net/libunibreak/">https://vimgadgets.sourceforge.net/libunibreak/</a>

Since there are no users of liblinebreak, libunibreak was not packaged.

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
---
 .../liblinebreak/liblinebreak_2.1.bb                | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_2.1=
.bb

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb b/m=
eta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
deleted file mode 100644
index c6caf450a..000000000
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION =3D &quot;Liblinebreak is an implementation of the line brea=
king algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision =
22&quot;
-HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://vimgadget=
s.sourceforge.net/liblinebreak/">&quot;http://vimgadgets.sourceforge.net/=
liblinebreak/&quot;</a>
-SECTION =3D &quot;libs&quot;
-LICENSE =3D &quot;Zlib&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENCE;md5=3Df89a1ce02e2dba48c1c0a8e6038464c2">&quot;file://LICENCE;md5=3D=
f89a1ce02e2dba48c1c0a8e6038464c2&quot;</a>
-
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/=
${PV}/liblinebreak-${PV}.tar.gz&quot;
-SRC_URI[sha256sum] =3D &quot;dd8cba554d260cf686865cc53d0c6be98102a80f56f=
8152ca5e7307bf06a66b8&quot;
-
-UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https:=
//sourceforge.net/projects/vimgadgets/files/liblinebreak/">&quot;https://=
sourceforge.net/projects/vimgadgets/files/liblinebreak/&quot;</a>
-UPSTREAM_CHECK_REGEX =3D &quot;${BPN}/(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
-
-inherit autotools
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111782): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111782">https:=
//lists.openembedded.org/g/openembedded-devel/message/111782</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107865398/1997914">https://lists.openembedded.org/mt=
/107865398/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------gzkC43xqmPOD3zi0pb4dA4Jz--

