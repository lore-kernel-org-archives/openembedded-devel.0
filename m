Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A49C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 08:28:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28605.1723019323995446216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 01:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8949aa9b73=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778Lpo1009858
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Aug 2024 01:28:43 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv86u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 01:28:43 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4778OOeQ012302
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Aug 2024 01:28:43 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv86ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 01:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SueJ7oX/pdaIdNicn9ximSLDaquqc+WMelQ4+WwsbvpDUxoB8nWYoe1sHO7AkmShQiYUlHUkPaNYVQlEfmjUI0Tb9XTQsVKVfNZKm02zzVtQ8G4v2fJ52RI7zbKB2Y/ZggYrx468xGB5I+OPangWrYADPbqTtqq9K/K+gyeuM2IIYFPXfC1BEpLTVH3f9QQCbsBP6dRMphcgY8k0BT6TGG0MC5pmXyLmU5VRy3g5W7LUnAqyaURgmVu+j9ok+NbMMts/KUzOleI5ccb2ci5d5ilN59qVs1Qe7tD3dsJbJCGeUNUj14ill8RVU2QH6CyfK/bApHZ20JDxtFQjmsBlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UuBHD35mIhCn+K/6TaVaRuiWg5bdJP5zQPyh/E436g=;
 b=tUKuJJIBv1vKqRu5GyOcjjBRfHRy9euA0k4h3puZufV7dJiZ1c4ebRm3fMqC5jnlXEo2d+K1r13D3EW2KAjHcopAE0ANDacjyAh3lfM55Q6qqcBAgzQSu0gFfpcZXp3yxVmTotefuhArDW8abCjQwkVT5NWjMyvi6u6yBIR8eAPnieBH0BcjyQFSHt+XMDCyacY5LjWNNO1bs5Ccp+WNMTq0FsFfMmdZkduOF0bTgD3CYEZhfBzcu5lKEFYPO5sd+txOyijPi9uKZe9meNIYnqgG2gkV57GSAgMFXsH86+r39tIz6J4Tmyb5atVI8CrPOpGbMHPGWFeqdsz5TBkKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 08:28:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 08:28:38 +0000
Message-ID: <2c1328fb-9fc6-6d9b-dbc5-eef93a874037@windriver.com>
Date: Wed, 7 Aug 2024 16:28:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-networking][PATCH] blueman: skip buildpath error
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20240806203423.993216-1-f_l_k@t-online.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240806203423.993216-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: a86c6e1f-fbf1-4d0c-2997-08dcb6baeff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWJGcUFodlNnSWM3cVAxbGw4eXNPMXhMNzdLbHZmakxaYSs4WXVERXZCS3Nx?=
 =?utf-8?B?QVNhS0xTS2hoMlF6SGNlQk5iU2I4b1Z6Qm45K2VIeDh2MFJnM05FQ2NoTFlF?=
 =?utf-8?B?dWl4aTlPV0xmb3lPZmRVUFBoNnRQZ2ZlQnk4NjhkNHFLYjdVVy9sUUtCZGtZ?=
 =?utf-8?B?TjBVbGNHRlJQN3k3Rm9vc0c1RDZ0VlpLdzRoWnBCdlJZUm1xUHpFM2MweXVE?=
 =?utf-8?B?NUUvQWxyTUlpWm1OcHYweHZBR20zZ08wT0xML1h3eXN4RFNTQ0V2WGRuUFV0?=
 =?utf-8?B?WGk1dWtKRE5wSDBWbWFTMStEQW12Q3k5Rit2a2RnNW5Zb2FLRWhiUWNPeFh3?=
 =?utf-8?B?NEtoUnhlZ1BYWXRFaGtVRFltSmp3cU5RL1pESzA2cndVa2ZPUS9na0Y2MUQw?=
 =?utf-8?B?WDROd0R3OHVETlRyZVNWK05uemxQaTMwVExzY3hCN0VuL3ZrZTVwa1BZNVpn?=
 =?utf-8?B?M0VWNGtheEsrRVgwbGxjR0hueEpnWW01T3pYRnRJa0sxVm9Rdlc1K3ArVXV6?=
 =?utf-8?B?ejRkYkFLYS9JSjFWWkgvRmlLL1pXV0NhYmIxR0hhSC9rdnVSOUkzL09Zd1VW?=
 =?utf-8?B?Z00wdUMyb3hUdjUyZjZEaXNMUGszdkFXQmdCNUlqT1k5c2c5eU1xcVdiNFFk?=
 =?utf-8?B?NDFzQnpyM09tNitraENRdE1QUTZhUlpmbGJQWHZBV0lUQnBsaCtUTm8xSlQv?=
 =?utf-8?B?ZzlqUS9jZVNtb1lMQVlXRUFHZkllMFNBMzJYNzJ2YTBUdjlQMmt1OVkrVWR0?=
 =?utf-8?B?RzFYOXNhVmNQcW5VMzJhYjVxUXFTcFViTTQ0VjJJMzJWdDFWNmJ2TmlpNHNK?=
 =?utf-8?B?aXFvMXQ4ZGpEd0Z0dHRnVVJ3RDZuUEViSFZ2S3lNRUozaXZRMzdjbFY5dHBF?=
 =?utf-8?B?T1NCOWZkdE5GVWJrV1pYSzViRTkvY1ZaVDZJWElsc0JvcExIaHY1ZEY3NW1z?=
 =?utf-8?B?V1NBYVRZK2ZvVWRYZHV6RE5NNDErRWUvZjdpbGZVYXM1SWNYOS9oZUhqMDZi?=
 =?utf-8?B?ajl4elR6bll3c2FQbU14SnNuRjhrZUxCcm9MbGgyVkIzMnhsSVNwWlFvRGhS?=
 =?utf-8?B?TzhIUWFxZ3R1RENYY0UvQmVaMDZLSjBqYi8ycWpleUZZZ1pteXlwZ2tTN3lD?=
 =?utf-8?B?RUZLeENEUGExWXRSazZpTEVsV2N6UnJFd2lNQzFuczYwYzUvb1AzOHRadnFh?=
 =?utf-8?B?UVl1eTVQYWdva3F6QWUwYitPdldyOXVIM2pvdzFoMitUQjdFYmhQM2FzNDFM?=
 =?utf-8?B?dnlqdENWSUl6dFh0dmlMamVkQlNTR3ZkRjQxT0YzSThCTDZnMTNMNWdOeTVt?=
 =?utf-8?B?SFF6b2p3YTlObmpSNi9XeVk3d0xlRzgvSXZlY2NTZ2tLcHpuSWNLRXI2eXNX?=
 =?utf-8?B?V0J6V0R5RHZYaEhYRCtidEFBWWV6dUFvbzAzcmZpRkhPN2dpczJrU2EreVBo?=
 =?utf-8?B?V3QyTUVMOEpGaXdKZ0EzRjI5V080SUlhTkhONGhJcE9xWTJ0alJwV1FFc29Y?=
 =?utf-8?B?VEgycmQvWjFkMXZzQituczlsK1BHRHNVNTdEbWJsekdJWWswNkVhM2pXbWFx?=
 =?utf-8?B?SjREaStnK1ZSQmlrNmV3elpJS0RMYkM2ckZpdlNkUHRzaEJGUEZ4c1daWWRh?=
 =?utf-8?B?RTM5TWVrd2FGVFNmTWN1MDNUZlJGemNuSDdUUUw1N3lSMCs3K3lMaU9Xb2pv?=
 =?utf-8?B?bUtUbTlxM3oxSFJoZVhOQnR1d1JKMmZZR0hYNFNta3NIc0o0cEtublE5azU4?=
 =?utf-8?Q?d0ASwCm9dkCPmiF55M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTBCTlk4dENKTXB3KzEyWDlLS0pzNzJadWphTDRrVmFlUVU3THpNbnRaeWpF?=
 =?utf-8?B?ZlZFUWtsTFN3elZ2dFpPNGtoYm9taVQrQWp5aGkvck5tdjNSK3NkcEtuT1ZW?=
 =?utf-8?B?S0tjTEt3RjNuYUxWaldzU0Y5a1pzNHlUK2hBcWZ0NDZnS3VNUms4UFNLeFFa?=
 =?utf-8?B?MmFyNll5VnF2SHBSdlZDNmxXRWtrZ0QyUzV4QTVnMmhJa1FVQXFPOGh4OVdy?=
 =?utf-8?B?VmJ3dFFnKzVDQ0FUZU5lVkVIdm9rRkxqZkFsckx1dkFiOVFYUXNWeURrZUti?=
 =?utf-8?B?Y3drMlljT0prRjBlZmczZkFrcGFCYmc3WDlJL014YkFFUDJGazRtSFU3RFJV?=
 =?utf-8?B?ZDZqWTIzQXVLREh5LzBISmhLQ3ZGRWZKSGd0U0ZJc2xjMFNKR3gyTHoxdGhK?=
 =?utf-8?B?d0lOWksrZWN3S011Nm5BanFpZ01CMXk0ZW9KQWg0bHgvTkhUaEtXSG5INHl4?=
 =?utf-8?B?NmpZdE1Tc0hVS3lndjNxQTIyZ01Mbzh4TEN6QVJKVjRvWHdVZDVYL2NxbzdJ?=
 =?utf-8?B?Y0l3ZUdVZ3R1ZW1OaFJxT2Zmenk5dWZkTXhOYmpiY1ZwdlhNOGw1VnZpOVFh?=
 =?utf-8?B?Wk5ZTEdJekNIUGhKL29QeHRDWnJZdEhqMTZvbUJyMDNUSEZkR3BZMjVDV0xU?=
 =?utf-8?B?clB4djhIcTJMWGRFSzZXaDdmR3JaemFRQW9xVXJabzhZNUg0TjlxdVFFS3JM?=
 =?utf-8?B?MUZ4TnBHNlF1OGVzaUJISlc5RTdpZG0zaXZQU1JJaTkzL1cyTVFJdytreTU0?=
 =?utf-8?B?UXFoa1hwTUFyWUw4NTU0WTRwMWpHOGhVL05qNXZYQ3gyOTNjbTdjQmNLVlJS?=
 =?utf-8?B?V3BodDhSMU82VjBweDY0UnZrWW9jMkJDVTNoVldYbHJ2b3VJOEF2R1RXSmhD?=
 =?utf-8?B?Y0M4NFhKeTZXQTVsT3hhMjNabVliem9TOGsxeHVFMEpLZnFWeEtkVzcwQVZx?=
 =?utf-8?B?bU1VdGhiS0UzUVhtMHJIUFRxMjNmOTBoWUFCZTVuTXZiNDl4eXFrTFdUdUJy?=
 =?utf-8?B?ZVE0ZEY0TU1HNjNrMmwvQmROSXVUL1BUTG5jazZSd3lrOHV5V0VndUl6czl6?=
 =?utf-8?B?aUxXZWtsd3QxejczQzJVK2g4WkphL1BZTkFqUmthbTFXRWJGa29odjliZnVi?=
 =?utf-8?B?eDQ2ZFhYd25BV2RkQjkxMFpjdjJ1R2FJS2swVXR6RzJReGcrQkRTektoZFVk?=
 =?utf-8?B?YU0zampPMk5URUVCWUN3QXFtU3k1WE1hazJNU0h6eXJvcXdZVXNrMUhpNUVO?=
 =?utf-8?B?VnJtUGZHKzdHdTZwczZHTmhObjFBQXVMQjB1WWlvZS96c2dFUGhDOVNSNlpr?=
 =?utf-8?B?S2pCek1zODluK2xTYmZHd0ZqMzNCSEtrN2VJc1pxK2xWdCtNWG4zZCtRLzJt?=
 =?utf-8?B?UWQ2RXVhMDFjZE5KaWRTWHRhbmgrOUZOTzduZWFCNVhBdXBWOUVNQlJOem1X?=
 =?utf-8?B?N1VwcnpHVktkcG9vdFFKNEJmcFRXSCtkNWhPZmd4ak93WDZKb05BZzFBeHE2?=
 =?utf-8?B?VEpkTHBOMFNRZURTQnYxSzZhUXJoSkVpaWhmeE1yeEl2QWlvT2V3V2RXc2Vw?=
 =?utf-8?B?cEdSMUcrM1BHdXhzYitybzhLZmJ5VEk2Y0JwcXBMbGpXR1lxalBiZ0M0cUIw?=
 =?utf-8?B?YkdQWWVici9zT0NaVS9IYTBGWVhVYnplbllWT2FUZWczUFkyVC93em0xaDRE?=
 =?utf-8?B?cnBENVlsM0owdVhGWS9iRXRUbjBzUTB5ZmYrZFBhMjNOSGI2SHk4K1NZTUgx?=
 =?utf-8?B?Q0dBcTZlcmJkWVZnMW5xMWdtVThQY3RiLzhRVXJNbU9Cek9ONllaY2tsMTBU?=
 =?utf-8?B?MUVFeVNDOWpsUVJvY0NRZ1ZPUTRPMEY3dVo1VkdYMnA2bGVyQml0S1YxRVdy?=
 =?utf-8?B?dzNhWVN2Ri9QK1JzTWN2d3JWK1lJMjNxS05JNG53RWxvOFBpaHJ4U3M3ZzFL?=
 =?utf-8?B?ZG5tRmhDSytSTWoyY1psK1BGVlVwM0drSzdoRU9EVzh2SWNrUUlRNFNTSHA5?=
 =?utf-8?B?WWVaUGU3ckVpYlRNZkVmTG96MFQ5RTByeis5d0dqTHdhd0EvSW50Mk5QanYv?=
 =?utf-8?B?WDlacVNIQUhRQW4xQzE1bEx5VXB3UEdyVFhOQlgyUkVBSVpaSWdURDZmNjF6?=
 =?utf-8?Q?VPFzc/ryAT4b5jORE6CVf4RPi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86c6e1f-fbf1-4d0c-2997-08dcb6baeff3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 08:28:38.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVYphggAWCTWG1A8IkjoRMXQK9Nv6TAjccp3a9I+H+UBc+f5ne5tcihbiXQBLFuqf4dPakUvV+7qmHNM9lxuBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-Proofpoint-ORIG-GUID: X0KGnPs-4mMOQWvE7HTjqbnDCWMj7pYI
X-Proofpoint-GUID: QQg9etc5Kv0cM4ycmfVsb63RV8AzFr_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_05,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=994 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 08:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111603

INSANE_SKIP is usually set on a per-package basis.
e.g.,
meta/recipes-support/vim/vim.inc:INSANE_SKIP:${PN}-tools = "file-rdeps"

And following the link you provide, it does look like a blueman issue, 
because otherwise all projects using cython will have the same problem. 
I'm not sure about it though.

Regards,
Qi


On 8/7/24 04:34, Markus Volk wrote:
> Blueman has compiled the buildpath into _blueman.so.
> The underlying issue is related to the cython compiler, so theres nothing
> that can be done from the blueman side.
> [https://github.com/cython/cython/issues/5949]
>
> Disable the buildpath error to keep blueman usable until the problem is fixed.
> ---
>   meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
> index 0374d23f0..afb97ee28 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
> @@ -86,3 +86,5 @@ do_install:append() {
>           chmod 700 ${D}/${datadir}/polkit-1/rules.d
>           chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
>   }
> +
> +INSANE_SKIP = "buildpaths"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111598): https://lists.openembedded.org/g/openembedded-devel/message/111598
> Mute This Topic: https://lists.openembedded.org/mt/107758090/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


