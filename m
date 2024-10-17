Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47678D2F7E5
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 03:39:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40849.1729136349794183851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 20:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0020234d96=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H3WBW2012149
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 20:39:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a397hf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 20:39:08 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49H3d8fc020784;
	Wed, 16 Oct 2024 20:39:08 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a397hf98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 20:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyONNjaJXk9t3AkTBilHHens1EshI8q8MA32vtOME3iWfo9Tp7o+U3eF5ATz9Y6op8e+p/wpovyxmuDyc3fzrOESvpeOK8+BKiaqw5MhmLKqVc0FeGa7vOWSt9/F92g6Jyb6edLtp9fjU3sc7ztumCvY0lqFhIFqnJE3ZwjdUaSJIU5IydjbLR25w0UO1jIjOBlK3b6aFm2l6w4dnmQljgtOYnEOag1p8iUVlWZnzAQWp0daqGoG5Y7HaZmlgndFX/Hj7Qd0gm1P/fDqoGGicrAc2vufd1fdC7lPX5dBDOHUqPGcunzdJuKeLYDI8pJVyvfSXFzfOx0gP5A+EDqcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm7TbE0JihCapTkMShLM5i19Cuyhx5zad6JflTxNjUE=;
 b=ylv2D8F6u+XbWe5tiV4guDoMP2eWheHnwOp5mLA1U4S/pmZ1DUAQl6quaGSQfi4UFqZduvPwUkGz+DL7VKUwkvMrtZ3q/FW6Q6OgYWMpeCDMAFgayrmZ/mBWNGWqn9RsevtXImgFjHIzsZjIBdMwKCplq3dV3fJXBzy1qI9IbEPUg3jPOLeaLNd1bInA7GbMpRsCrQy1gmDiOu1Kg0wNdTCNde36W4Xe+RPcdBbHjV9cosbveeUExuB1udNNhV/Y7nqXM7R+Yr8ieadC7eltvq+sySFcRnF+gCk+qrqPVRTU6WVoi+8Lq2/3sNFiz3oNzrS9acnPQsCRrOm2OU9Mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 03:39:05 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 03:39:04 +0000
Message-ID: <fb90d2fd-b348-438e-ab7c-c7d08e1a045b@windriver.com>
Date: Thu, 17 Oct 2024 11:38:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-python][PATCH] python3-setproctitle: Add
 new recipe
To: akuster808 <akuster808@gmail.com>, mingli.yu@eng.windriver.com,
        openembedded-devel@lists.openembedded.org
References: <20240929072744.1929825-1-mingli.yu@windriver.com>
 <e91c9820-4710-41da-ac05-aac03a124d88@gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <e91c9820-4710-41da-ac05-aac03a124d88@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: d8946428-5f57-41b8-e479-08dcee5d3f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUcrczNRczhxNUFxZC94ZmI3Sm5pVXErS0JselVUSjgyc05mNDFkQU9nL1ZH?=
 =?utf-8?B?c1RXSWFRK2xnaFNZM3hWeFdEWFBPYXRlM25mN29yMEc2WXV2NnlwQnhCMHU1?=
 =?utf-8?B?clExWnM0YkQvS1FjOHZpUzAwaGZ3cUNjNC9JQmlXYWdMVTkrakQwSWtscXAw?=
 =?utf-8?B?c1FGNGlLRStCNVZNc00wVU5rbzVtekg0S0hpZDMyd0NZTWhuSmF0WXpqdzUy?=
 =?utf-8?B?RWdvbXc4dlU2WkpNWVNuY2wycGhpSEVZdkkzOGg5L1lJY1ZpdDcvSTF4T2xz?=
 =?utf-8?B?NEtJWDBFMkUyNmY4S2s1OFpCSEpXcmpzUkY3Ui85T2FOS05SVHJ4VmxnNE9D?=
 =?utf-8?B?SEUrUVdQT29VOFBTV09iS1FmbDdaL2tsRDRUaENweVY3SmFsOHI2VEp6N3A2?=
 =?utf-8?B?TG5OUS9YUnIrcTJhYzFjNFhjYlkxZlFpRzBCbzA5MTc3QlVmV0FPS0VZVnM0?=
 =?utf-8?B?a2ZxQ3pvVzM5YW1JRzFoRmJGUUVGYzdUclBLSUh3L2ZtVW00WUJCNGJVNFpH?=
 =?utf-8?B?N0ZUcVZUYThZVEMvcS9BVEFNQXlJRjRid0toYXVpLzlSa1ZRV3l2bW5uR25m?=
 =?utf-8?B?eERaQUU0a3ZLNmdTTTQ0VmNoUUZYZnZvbUhQZmoxOW8zanZNaEFoN0tvOEF6?=
 =?utf-8?B?RzJhN3RjMmRvaU5GWmg2eHNsWlNKUWdMMG1WSUtSOFlORXp3NE9OSjMzWDl1?=
 =?utf-8?B?WWh2bVdGVGNiVy83NGhNa3l0ajdLTm9tdmg2QzNhSUVDbWJ5OFNXNlFMZERi?=
 =?utf-8?B?OFVIcXZZdnJUdEh4UTk4Rkkrdmo0aTBxRzljc0krVFkxblRobk8zNXFORmoz?=
 =?utf-8?B?cEpDckZyVjQ3REZIaVN1WGttcFZ0VTE3QUIwV0hUQ0xFeUIwU3BuTHNOTXVT?=
 =?utf-8?B?OUlvZU11ZUM1Vy9iam5iR3lreTFFdGhqVUtDNTVQckxMbm4wTzZlUnZXM3JB?=
 =?utf-8?B?RGY2OFNzemhBcHp3aFU1bDQ5ZEszT2tOYTdnU1I3SjFUNjMrSHcrS0xtUnk0?=
 =?utf-8?B?aTZlWXNUVkQ4MHFhQlVKYXBWelhSNTNTNStxU0U1WEhJVlpEdkF3ZXlwOVhF?=
 =?utf-8?B?aGhTUW9lQkZwZ3lkV095c2JWNis2MXBaRnpzb0xXNnhXR0xyY3lJdGV2Sisr?=
 =?utf-8?B?SFh1Y3dqZGNkYnBETktVd1AzMXlnT214WWx5NWtlazFhU0dtUnZUcGw3WEQx?=
 =?utf-8?B?NytzMEhuNk05RXJHUHMxK24rbGgwSGtZTmVFTUY2RDZKN20wNkFtZm94V3Fr?=
 =?utf-8?B?K3J4N29yVFZGNzNLcEVKbjBwM0pmVm9uVjlwdHNEUjVjRnRwdmo2VHJ4UUhI?=
 =?utf-8?B?ZHhldXUxNXdlS3YzbHF4YUcvc3l5cC9hM05yaUN0aUNlVTdQUmRadmJOZ2FB?=
 =?utf-8?B?VXlCM3pMa0ZDK01wWXJrUEdoZlFUb1JTT0tiQkFMQWI5REw0UGNWbkVKRmFq?=
 =?utf-8?B?SU8rUzZTYi9GNm4xMWU5ZnQwLzFWY3FIT3E4SjhuSTd2SDZtdnE4cWxtWFVC?=
 =?utf-8?B?NlpKNXhrTmV2dG1obm1FbjFOdndtMXcrWWVLTm1rQ1FkZElMM2dmei9rTVc3?=
 =?utf-8?B?cHRNMTZUbHh3NG1vSHdTVGJZNHlGWXpVYVhXZWJZdUdPYlVMVlBMSkR1SStw?=
 =?utf-8?B?NVRqNksyTFprMmhhMEVwVEtJSVdlV3pQVmpEWVh3WjBPZEUrSGc4SUlwZUZH?=
 =?utf-8?B?V3dEN2s0ZHNUVnBVT2tNSDdOaWpiRXBkTmk1ZzRNSkI5bi9wSlRLd2s0QUR4?=
 =?utf-8?Q?Sr9CytYgUqa/zteTKsKReUkSX4etTfEA9wswWNJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWtvSkRHSmdtQzlDVDFlcmR4NHZ5RkFNbU5kUnZ4OHZMZUg4cEZaTTdxT09k?=
 =?utf-8?B?ZGdvSHRiOVJNMGV1bHpPRndHd1Badk1rUktUUktFekdCQ0hqcXVzekxXUTQ1?=
 =?utf-8?B?WnNXQXlnZXJNRXd5VktPT1pwdXJmTUt4R29nWStXdVlDRnVvb0lpZFFZVllU?=
 =?utf-8?B?N1JhWG0xYXM5SEZJM01yL1hUUFcxZmJRWmJFUVVXNlVka0ZQYWdTZ3VXS0FW?=
 =?utf-8?B?ZmcxQkpRM1pYYkJCc2Frb0hid0I4dk84a2NwbUh0dEd2RmZTV2VCeSswNm1V?=
 =?utf-8?B?WXhXcjBJNEdZNnB2SHE3T2tVYU1SZEtoMEhrMlBYdkhrdm9yV0F3VXJxbncv?=
 =?utf-8?B?RktVaDJxRGZBZWF1SWVUekwzWVFJYVRmS0MrYk9DUWY5QVl5VzQ1SURtRXdO?=
 =?utf-8?B?UXd5Mm9maFpxWHU4Z0ZHV0F6WW5rS0VXQnUzVU00bDNGMFpmMGZqSk0zbE5F?=
 =?utf-8?B?NnRITnp3dTdiMG1EcExaWHZXYWd5VmgvREIyejR2OC8xQU1jMnNMcmxLYmZl?=
 =?utf-8?B?c2cvQ0tESnJSVnQzNjVmRlZnSTlpQkNwNVpESzVsNUFGN1ZuclBJWS83S3dj?=
 =?utf-8?B?djQvZjMveEp5WmY4ZmVDSmtLYm1ta0lyZXZJTWpDOER5cUpnZkp6b0RaYkdv?=
 =?utf-8?B?U1hXSGRFMm00NklpNCt2VlhTZWMrZThXQ2EzQlkyS200NkF2WncwSzZ3dGZk?=
 =?utf-8?B?dUdsVnEzdkxtcHZOUkJRTGwvOUR1NmxvTEpLWFBIN2t5WktUaGNhUlR6ODFm?=
 =?utf-8?B?MkN0RlJzdmhxTiszZ29ZQlVPQTJycmJPbkVlbXJ0OXBEbFBuZ00zNnVBRXRK?=
 =?utf-8?B?a3Z4WEFyKzhOTDdBUGZQajgwUlM5UG4vVm56di9TVGdmUCtMQzdwY0x2U2d5?=
 =?utf-8?B?b1lDM0FrOEE0aDZuRTVMSVlXdDlocENzWm5aQWlFa2l3UlQ5OUZLL2xnUEpj?=
 =?utf-8?B?YmN4SmpXaVljdFh4K3BPMVZ6T2FxU0pHcW81SkpCMzVzdXVUZ2ZENEl1NXE1?=
 =?utf-8?B?bndYTGJoekNWazdsL2dlZ09RSGtwTDh2QytVNHZBTFVhTnNYYkk2TnFUdDVh?=
 =?utf-8?B?alo2Q2MxTW5CVzBUY0hDK2hkNCtQc1JGTzdzSEJVWGY1WmV5OUdzOGZKUm85?=
 =?utf-8?B?MTFIV1dKZlh0RTlQMXNCL2hua0JkQ2RxWXhjUVZ1OUJVUjc2aGNjQjY3OHhN?=
 =?utf-8?B?ZGVwK2xrb0hBUlZTdDFlbVE5QlBUTXE1aE9iVFlLMHRtTzBSdENLVHJZVVpn?=
 =?utf-8?B?TEg5WmZEcWdheit1OUdpZGVrL20rT1dPSG5FVEl4V28xZ3k2c1pvNGJtS3E3?=
 =?utf-8?B?N2hDYkM3YStJc1Y3bm9ZOXF4ZGhIMXBiWXFYQi9QQ3gyOFgrMnRva1pMN2FJ?=
 =?utf-8?B?clFlUkVsNTZxY09kczlkamJ2Nm9DdE04ekwwNDczdmFoWlVwQjY2cjNBVnVO?=
 =?utf-8?B?SmZBdGJ1cElOT1JPd0xtZCt4QmViSW84UTcwVk1VNE1xWnlRdzBVY3dpOFBw?=
 =?utf-8?B?L1hhNTFiUjM4TUs1NnlCeFNoV2xBZU5nWTVmV3dxTk9YRURDNkxYSlczV3pW?=
 =?utf-8?B?bkU5ZnlXeHBFdndHWE5UQlFLRmhCVWQwS3lhWUw1b0FIN0dmWS9TTmU2Rmhs?=
 =?utf-8?B?SDFXeWxLd3MyUHhqOHpSRytQeERhYjMzSW4yWkdQRjhFUkxZVlJjekc5T2d5?=
 =?utf-8?B?eldlWVdFMnNORVFlTWRpd2dJNzVyQ3RnRWs2MzB3TUJPZnFJWmNNSFoxb0JY?=
 =?utf-8?B?MEZXTTVoYkdCS2dKYWNwWTVlbndoYnBQa0dPVzdUcVN6dFdvWFBMdkp6VWlO?=
 =?utf-8?B?bEtudjZhNHRjNVBjSWQ1cDdZS203R3RkRzBjUEFUbDBHMndsTTF1RmowblJE?=
 =?utf-8?B?b3ZtN29zTzhNSzN6VmF6Z2UxTzBCcjVuanFhWmRBV2J2NVluWmMzeGorUkhV?=
 =?utf-8?B?Qk1pUnBBZWtPOHNmUlhHMWk5Q1I3VnZDeDVYVkVnUGRqaDRkZVZWd1ladEN1?=
 =?utf-8?B?OWw0d05BUnI0bVZsOWpBVVdyQmlDTzltVWVpYUYzQWYwdVJPaWRyKzc3WXhP?=
 =?utf-8?B?dm0zS3Y4ZW4yU0lUbVZLbUJzNDRZMmlQUnZ2MzRQVUNKcG81ckJuWUQ1Mk1t?=
 =?utf-8?Q?5HAiRxf3u53V/G54nldjR3RfM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8946428-5f57-41b8-e479-08dcee5d3f99
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 03:39:04.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p34bV0P5voDLKNHnzjXzlx7040vZZDSxvXhfSak/oaQ38w4G72eW5DUmRL0NxiDSaj9YI+KsXaPr2FapFNCYbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-Proofpoint-ORIG-GUID: dF7YQGFUpUbpFlMleMGAvfw_nmYHj50z
X-Authority-Analysis: v=2.4 cv=Fc1lx4+6 c=1 sm=1 tr=0 ts=671086dc cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=0qorYmtGUB9RxfX42U0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TLbCr_tg-klqHMuX902DsJuKGURFYat-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_02,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410170025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49H3WBW2012149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 03:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112956



On 10/6/24 18:53, akuster808 wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
> On 9/29/24 3:27 AM, Yu, Mingli via lists.openembedded.org wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> A Python module to customize the process title.
>=20
> Adding new recipes to a stable branch is outside the policy. Is there a
> reason I should?

That's okay.

Thanks,

>=20
> BR,
> Armin
>> =C2=A0 # ./run-ptest
>> PASS: tests/module_test.py::test_no_import_side_effect
>> PASS: tests/module_test.py::test_version
>> PASS: tests/module_test.py::test_c_extension_built
>> PASS: tests/setproctitle_test.py::test_runner
>> PASS: tests/setproctitle_test.py::test_init_getproctitle
>> PASS: tests/setproctitle_test.py::test_setproctitle
>> tests/setproctitle_test.py::test_setproctitle_darwin SKIPPED (Mac on..=
.)
>> PASS: tests/setproctitle_test.py::test_prctl
>> PASS: tests/setproctitle_test.py::test_getproctitle
>> PASS: tests/setproctitle_test.py::test_kwarg
>> PASS: tests/setproctitle_test.py::test_environ
>> PASS: tests/setproctitle_test.py::test_issue_8
>> PASS: tests/setproctitle_test.py::test_large_cmdline
>> PASS: tests/setproctitle_test.py::test_weird_args
>> PASS: tests/setproctitle_test.py::test_weird_path
>> PASS: tests/setproctitle_test.py::test_embedded
>> PASS: tests/setproctitle_test.py::test_embedded_many_args
>> PASS: tests/setproctitle_test.py::test_noenv
>> PASS: tests/setproctitle_test.py::test_large_env
>> PASS: tests/setproctitle_test.py::test_clear_segfault
>> PASS: tests/setproctitle_test.py::test_fork_segfault
>> PASS: tests/setproctitle_test.py::test_thread_fork_segfault
>> PASS: tests/setthreadtitle_test.py::test_thread_title_unchanged
>> PASS: tests/setthreadtitle_test.py::test_set_thread_title
>> PASS: tests/setthreadtitle_test.py::test_set_threads_title
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 ...0001-conftest.py-Make-embed-avaiable.patch | 45 ++++++++++++=
+++++++
>> =C2=A0 .../python/python3-setproctitle/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++
>> =C2=A0 .../python/python3-setproctitle_1.3.3.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 34 ++++++++++++++
>> =C2=A0 3 files changed, 83 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest=
.py-Make-embed-avaiable.patch
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
>> =C2=A0 create mode 100644=20
>> meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
>>
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-setproctitle/0001-confte=
st.py-Make-embed-avaiable.patch b/meta-python/recipes-devtools/python/pyt=
hon3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
>> new file mode 100644
>> index 000000000..5de07de03
>> --- /dev/null
>> +++=20
>> b/meta-python/recipes-devtools/python/python3-setproctitle/0001-confte=
st.py-Make-embed-avaiable.patch
>> @@ -0,0 +1,45 @@
>> +From ce7430f6252ce69af0699dc376662b5b1dc00b96 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Fri, 27 Sep 2024 10:56:32 +0000
>> +Subject: [PATCH] conftest.py: Make --embed avaiable
>> +
>> +Though --embed exists in the help message as below.
>> + $ /usr/bin/python3.10-config --help
>> + Usage: /usr/bin/python3.10-config=20
>> [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extensi=
on-suffix|--help|--abiflags|--configdir|--embed
>> +
>> + # https://github.com/dvarrazzo/py-setproctitle/issues/142
>> + But has_embed which indicates if the help includes "--embed"
>> + provides a wrong check as beow.
>> + >>> import subprocess
>> + >>> subprocess.check_output(["/usr/bin/python3.10-config", "--help"]=
)
>> +Usage: /usr/bin/python3.10-config=20
>> [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extensi=
on-suffix|--help|--abiflags|--configdir|--embed]
>> + b''
>> + >>> help =3D subprocess.check_output(["/usr/bin/python3.10-config",=20
>> "--help"])
>> + >>> has_embed =3D b"--embed" in help
>> +
>> +So make sure --embed avaiable to fix the gap.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + tests/conftest.py | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/tests/conftest.py b/tests/conftest.py
>> +index 6e15988..b01e2bd 100644
>> +--- a/tests/conftest.py
>> ++++ b/tests/conftest.py
>> +@@ -84,8 +84,7 @@ def pyconfig():
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def pyconfig_func(opt):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmdline =3D [pyconfe=
xe, f"--{opt}"]
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if has_embed:
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
mdline.append("--embed")
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmdline.append("--embed")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bout =3D sp.check_ou=
tput(cmdline)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out =3D bout.decode(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sys.getfilesystemencoding()=C2=A0 # sounds like a good bet
>> +--
>> +2.35.5
>> +
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest=20
>> b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
>> new file mode 100644
>> index 000000000..8bedb66d4
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-setproctitle/run-pte=
st
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +# https://github.com/dvarrazzo/py-setproctitle/issues/141
>> +pytest -k 'not test_unicode' -o log_cli=3Dtrue -o log_cli_level=3DINF=
O |=20
>> sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e=20
>> 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" =
||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS"){printf=20
>> "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PASS" ||=20
>> $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XP=
ASS")=20
>> {$NF=3D"";print $0}else{print}}'
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb=20
>> b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
>> new file mode 100644
>> index 000000000..01e9d21cd
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.b=
b
>> @@ -0,0 +1,34 @@
>> +SUMMARY =3D "A Python module to customize the process title"
>> +DESCRIPTION =3D "The setproctitle module allows a process to change i=
ts \
>> +title (as displayed by system tools such as ps, top or MacOS Activity=
 \
>> +Monitor)."
>> +HOMEPAGE =3D "https://github.com/dvarrazzo/py-setproctitle"
>> +BUGTRACKER =3D "https://github.com/dvarrazzo/py-setproctitle/issues"
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://COPYRIGHT;md5=3D86d2d41b5f4f023f43466f8cb7adebaa"
>> +
>> +inherit pypi setuptools3 ptest
>> +
>> +SRC_URI[sha256sum] =3D=20
>> "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
>> +
>> +SRC_URI +=3D " \
>> +=C2=A0=C2=A0=C2=A0 file://0001-conftest.py-Make-embed-avaiable.patch =
\
>> +=C2=A0=C2=A0=C2=A0 file://run-ptest \
>> +"
>> +
>> +RDEPENDS:${PN}-ptest +=3D "\
>> +=C2=A0=C2=A0=C2=A0 packagegroup-core-buildessential \
>> +=C2=A0=C2=A0=C2=A0 procps-ps \
>> +=C2=A0=C2=A0=C2=A0 python3-dev \
>> +=C2=A0=C2=A0=C2=A0 python3-multiprocessing \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pytest \
>> +"
>> +
>> +do_install_ptest() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PTEST_PATH}/tests
>> +=C2=A0=C2=A0=C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> +}
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +INSANE_SKIP:${PN}-ptest =3D "dev-deps"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112549):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/112549
>> Mute This Topic: https://lists.openembedded.org/mt/108715471/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

