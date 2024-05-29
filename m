Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A149C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 02:06:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3962.1716948371541703581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 19:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68793fadca=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T1fj8e005046
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 19:06:11 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfggbb92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 19:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/tM90QbbMiagOBSC7rK/OM2B20NUIr0UROUehJGx1qYju+Mw43t1SyX5lZuTo9bHRo6trPRI4JEFCsZAyPS+4fSbGDKbQGL+sej7qXrjdh2ZGQJsvY+2sketHdKvuv73hQ7J5R46Vs8fU7D28zPfS+OF7KE7rNC181zcKUmW0gQmwLfIcdcm7g/lEVlMagb5RrRwaLHmoLRYBJWrTBplmPtOEM6fe96YKOe2v32eT3jsMoW2peBZZ848qI5lyDHRgVCulVp2VT6g6M9+W4j2PCPfWXDKtbAgyCqCWuRzI6z5Ynyzctf+BSqNJ3zBxWkkK4YbxA8D+7YdKBJbjSBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxZqaSkxXXUlThfLRwWDCerl1j5z04A7N3H2uTTxcPk=;
 b=OjF1vdhezXisKwIr3upYhnEhzoyuVZiPGfH3JNm7CcuxXNf52CX9riHsphl2SpL2SFR8ACrdnkweCvd4Z0BdYXazQBOSgJfMkDFPZP2mW0xSROtnWnrVDy0s3yMG+R66ZMnkBwWm6UVBuI0PpyRDysBdO+oR1PfmPgCMOMc5keUiFtFQ76mT28dJ1SSyVIl2ymh+4e4oa88hmHFC0rDV8Oey2bS1Xe0qFgV1XjYX/rf5fOWIYUMm5JhhnLN/spc+UbruuLQb0cHy/kg9KqM3UwNDVi4qzvUEefTg3Ia5oz9NwQ5NFzFGrweVAzaUFbDQRbToPAFD/t4LX6HASmBcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 29 May
 2024 02:06:07 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%4]) with mapi id 15.20.7633.017; Wed, 29 May 2024
 02:06:06 +0000
Message-ID: <fc753f36-a0bd-45ac-848b-71e9a01cfd84@windriver.com>
Date: Wed, 29 May 2024 10:06:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <17D39E8F83C96086.24533@lists.openembedded.org>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17D39E8F83C96086.24533@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e449e7-c16e-4128-4959-08dc7f83e66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFd0TmVlRm1LMVgvUVpCNGczNFVrZThmSXlHVEtkWjAxVUlwMGNnZmRmbTk0?=
 =?utf-8?B?bzZOU1FBZEpNV1VKMkxpTVFzQlFqcWIzbFl3S3Q1L1NEUVVnaVBYSUNQNGNY?=
 =?utf-8?B?bjdrS0VnUUJNQ1dwQmFUTTljbE90UnhrNlpyNXduSjY4QlJLaW83QXp2bW43?=
 =?utf-8?B?UnBZU0hxZ0l0OEJpNEJNVTIzN2FOcGtITys2cWdHTFh0dk1selY1Z281S1Q3?=
 =?utf-8?B?RHM2SGh3WDVTMm1iNUl6bXVZWnRWczIzcitaVHdGOG9NZTVBMWFVZG1Hbkxy?=
 =?utf-8?B?SkZjQ3YyZnZHOGVFYUlHMTNkMW5vcDY2SVVQa2k1VEhMdmhYTFhLNGlGN3I5?=
 =?utf-8?B?K0J1VENOR3Q0UWpJNWhKaE9LYWI5QzRZQ09TSEFCYnNGTGdIVTVhZDNUdkI4?=
 =?utf-8?B?Zk45SkpGR0c1TFQ0ZzBiRUZKZSswRHVUdnpFZ3JLM2xqalQrQ283TTVpVENn?=
 =?utf-8?B?NDZJNFdrcmprbUlrdFhuZEp1Qm5IRk53RUlUcWQyY0tUMXRNSElENU1mcVYr?=
 =?utf-8?B?bDBXZmxSdTR1b3N2VnN6RDNNSGFRWWdJUlk3YUUwMGRLejRJTlFINjd1c1lY?=
 =?utf-8?B?cHZYK0d6emxlRThqTEpNb3pRQTcwQmtNK3c5YUp2MTFzejJTNlAwSzE4OEVC?=
 =?utf-8?B?QjlwamJmbGVlTWtUMHhNWnhuOVdsbWx5cnkrL2ZNanc1bE9ORkVCNXBaK0xY?=
 =?utf-8?B?TVllOEswS0VDdmp1VjJYV1g1SzdkNXJMd2VraGMyTXVMaVdsNnVMcW41S3N1?=
 =?utf-8?B?aTdrMi9WamZGN0ZXS1NNVWNIY1VHOXMrdVE1bWo1eXVxaWNaQlNob1o0eFBy?=
 =?utf-8?B?NFZieXlBNU9jeDB2cUNkRGcrOGRoWWtIK1ZGSncyS2t6OW9VRlRHTTZJMlVu?=
 =?utf-8?B?RnJtYXEybGNPZTMwRzZUeW5YS0ZkdEhBVXdyV1VBM2RqOEo3Z3FCNVpDNmJ1?=
 =?utf-8?B?WDRsK0VBNndSK3gvOGRRaUhHU3lJU1ZKalZ4VEJUNUxWVmJpTHZteHdpN0R0?=
 =?utf-8?B?Q3RKSVV6Z3RzbVRHS2JIN3JibndkSzk2ejc0c3QzeG9RcjA2Uk5QR1BEb3dD?=
 =?utf-8?B?WlpXWmNmWDlOdW5QQVFjWGdEcTF5TTByOVdlK3NHQ0lZYVFQYXFzblZ6aVRI?=
 =?utf-8?B?aFdWbEg3WDVmeXZROG5jaHJUYmZJVlJubFlGQjZhZnlqZWEvSFdaaWtWSmR4?=
 =?utf-8?B?eUkyeFBUMzNJQU1JU0tjNEtvTkR4eElPVk83aDk1K3JqdUZDZ2o0YnRGNGx0?=
 =?utf-8?B?UG1hYzMvcldRTnkwYzlkcEgvNXc3djZMM1JTcWNHLzFSNlhpNjZieEhQOXV4?=
 =?utf-8?B?OGk0MlJEVGNreTNrRlVXaS9KUHhmUkM2WTFMMTBBZGdxOHZzSEtsMHA4cHNM?=
 =?utf-8?B?WTQ5OVRTQ1Y0TFRmU1h5YlZiZHpjK1FzWk9ERFFwNk1rWklOalh5OU5kajdl?=
 =?utf-8?B?RkRpYjlUTDZrYUxHSjUwS0VjNjhaUzFoeEs2ayszTTBUMUM4SG9qR284Ulda?=
 =?utf-8?B?Vkp4ZFJyQm1uUDVMWk9xaTYzbll5blBac0FrSVRuejZESmJQL0Q5R2tDUHRw?=
 =?utf-8?B?TEpkWFdYQlNsTTFGM1NuNE01c3lyaDRxbDNFaWc3SThYL25FWmNxNGhLbkZo?=
 =?utf-8?Q?kEE+298k+rjxebAOW+e65kRSL71kdBwaylN6xJrlmTpY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFJxYjRjSGRsWHBlamY4ZCtzNnBmWDNKNk9xOTE0RlFkbFNJTHN2ZThoU2hm?=
 =?utf-8?B?ZDZXWG10NU9UaFR1dnM0bFl6Vk1yS2J4WE1WYjNjb2lJTHdCZWRlQWNLQ2FW?=
 =?utf-8?B?enEydW5iV09CcXArUUZOeDNzRzhpOTFLS0tGMStSY2lNaEliczk0Tm9MdStV?=
 =?utf-8?B?UU9EaGUzelpaZWcyNTBLUEpUczZuVll1MldHOGdYd1E2bVZURkRPY1ovbEZs?=
 =?utf-8?B?T1pWY2Uzd2xaTWdyRXJWejRSR3dFRUFjNnozeWUzQlEzZkFzYUJrTDJSc1lE?=
 =?utf-8?B?RVZacS80S09BeE8waFlLc05VdUdxaTcxWjFiVEtMTmNsL3J4azZobS9NaS9t?=
 =?utf-8?B?NHkwa3RoK0NJSTRPdERZL3FLUFBYNEhKeWIxcFRFN1ZYbDdFMGIxM29NUEll?=
 =?utf-8?B?Z3hnY0FEQUJFUVI4VEplM1JmZlpBMG85eTF6Y1ZKVHFMcjcxa1lFNWlaNWtq?=
 =?utf-8?B?TzFFckhBc0VOeUowM1REcmR3Qks5MWx4bkpXdWZQVFRZVmlLZXY5cnBGK2J4?=
 =?utf-8?B?ZkVUZ0xMN3owN0R0M2QzN3FJZllXQVpla3duSmNWL2VJM3J6dnkwZWFPUTlU?=
 =?utf-8?B?dmp2aVFDcEc1WVVGYUhyR2thcjJqRS9PTEVpbzh4U0t0alNsZ2RITVA5a0xQ?=
 =?utf-8?B?WGlGYUdWWmsrTWwvaFUxYzFCNDJ1TEl4MkthSjFuaHdZS3FBMFp6Nkt6WTdm?=
 =?utf-8?B?bVJFWnUvOE5zRnRKSSszY3NpWlZGRDF1OE9QQ2tjRlVZSkE5b2ZaM2lJdytJ?=
 =?utf-8?B?VUtmL2szbUVwQ3VkRGhnQkxRTis3RXlPMXA5NHJvU1I0VWUxYytVMkh5UTh0?=
 =?utf-8?B?TEZKSXMzZVJIWTd4UlRta25OT3draEJYeXJXTzI0NmJ3NU1VUDgyV2lSR0lN?=
 =?utf-8?B?TEd2U0dBVER6UXlKVkF5c1NZd2lEYjQyZDAvREFjeURuNitENndKVlY3WVND?=
 =?utf-8?B?bnVPVmhjcmFvWFkyQmFkTVdWNTBQbUdkR2lSaWNnVEdaaXVtb2ZseFU4M3Bu?=
 =?utf-8?B?bFdUeWQrRmxpNkFPaGRpSlNBNTN0TnJ6OUo4c3FHeXZIelRhVW1aZWpDL21H?=
 =?utf-8?B?Ky92OGpYMmpoZDVrME9hSTVYamIvd2EvUC84ZzQyV2gyR25MaGQzZGV3U2pP?=
 =?utf-8?B?b09mTWs5aXJqa2tBNVhxZXh3MXpBck9mV2NZWHhBZjhzS3ZLQTZiOUhFTXE1?=
 =?utf-8?B?NWkwcU00U0tVc2FQSXBDOHloWGNpMnlVUzV4Z2dtQ3NVNXVhMEJnOFlrTUxT?=
 =?utf-8?B?OGErUFRqR3RkZmhpaTNJcHMyaEpxREY5Q3dnU3FRV0JLdW5KajM2S0pHZzJW?=
 =?utf-8?B?NlVLMy90THdzV25IMXF3ZHhseDZlVlR1RGtWbmdJOFh3b0YxcXhGRUw1LzE1?=
 =?utf-8?B?czRyTHprTEZUc2RIVldLMUlzYzNXNkk5M1NHeFlXRFdqRUM0M0xvSHBJR1lZ?=
 =?utf-8?B?c2orbFA0azc4UTJIam1jbUl3dnN0d2hnUG5mcG9oWXFqRUZCN0hRM2dvQTcr?=
 =?utf-8?B?WTZxTnIwNUhYemtPUkpsMzE2WUpIbkhIc0xDTXhjdGZORHp2WDhOUHNYdWJB?=
 =?utf-8?B?aWNPTDJVUHJlbHBjK0pRQ3N3WUxOOXpLdVFxMGlnVGpKY3RNb0xScG0yNFJP?=
 =?utf-8?B?NWZhL2dNVGZNWlFQZ1BWakZFQi9tL0ZtTTJCZ1hIWTdYamZDWDN2b1RPNjkv?=
 =?utf-8?B?MnpkMXlyWWg1OG1SRUV2WmU0aGNibGpGc2tidDBpM3lqeE1xaEVwU2FwVzlC?=
 =?utf-8?B?MzllVGYrSnFXVElFOGJLZlZ2VCtlM0NwSnpPRmovMFlqWDlNdGRqbGcwMWFG?=
 =?utf-8?B?OHk1MUUyWG92OHJzKzZkeFhvRkpWa0lFaXRETVBrQ1pTS1JEQXVaVkxxYzEr?=
 =?utf-8?B?OEdldk0wdmN5MVUyc3NOeEM3c2xKMHEyZXZpSE5helV3TG5ZQ0VQc1ZzZk9p?=
 =?utf-8?B?RGRISVQzaHV1R3VnSUp2LzJaenVObkl2d2NJOTR2a3VSeURLRzVkN0tmdElj?=
 =?utf-8?B?WTh6SVFzalhuMXBaSk5xSW5GTm9abFNqTWVIYmpUZ0NJZklCYnZ6SUJTMVkz?=
 =?utf-8?B?VEVQWC9HRFVLWkFQNExpS01rbUJtajJOS3FBYjFDOVhEQWVscmQxSzNUWGhZ?=
 =?utf-8?Q?GEUPzZl0hcaNhWV8lF/ZgB23B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e449e7-c16e-4128-4959-08dc7f83e66b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 02:06:06.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HsvFoiCLOg3tiTKvf8PGF452T8KZ04lE1Qg2l7+wDul+JG4M+rK9zUz1IXUbrmrDVGa3GSrnSM0UR2nX5uB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
X-Proofpoint-GUID: zXFluc1bKhiWuQBQZypej6RTf7t08fx7
X-Proofpoint-ORIG-GUID: zXFluc1bKhiWuQBQZypej6RTf7t08fx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110599

Will update the LICENSE field in v2.

Thanks,

On 5/28/24 17:56, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Dasbus is a DBus library written in Python 3, based on GLib
> and inspired by pydbus.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../recipes-devtools/python/python3-dasbus_1.7.bb | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> new file mode 100644
> index 000000000..c07464210
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Dasbus is a DBus library written in Python 3, based on GLib and inspired by pydbus."
> +HOMEPAGE = "https://dasbus.readthedocs.io"
> +SECTION = "devel"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
> +
> +SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
> +"
> +SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} = "python3-pygobject"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110580): https://lists.openembedded.org/g/openembedded-devel/message/110580
> Mute This Topic: https://lists.openembedded.org/mt/106345708/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

