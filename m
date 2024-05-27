Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C8EC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 07:59:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22803.1716796735064992182
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 00:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58778456ab=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R7fVa8018482
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 07:58:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb56x9p4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 07:58:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu29gym5sfGpudX0RyGHBVbgZfo9EvU2uJI2XiyOscf6Sb/7GHorgTotPpKcvMohlURVLWUHD/pPoDqHXRAbbOB8ePUcNTN76BuUvbB1JDvShbR0cFN4Csmze6+1PyJ0dzPzhnZsF1WktZCKjJZ76JFuRcONnW/B+XZswA7NG3u66naDYWriT4qpMcNE7hRsyvouWHQIb1lHjI3Wbpc8TKtPwpwEtLY9/8NekVw24iZpqONJuzdAcSf4/tSYnfluvZW0sZ95MOlFO1mkwHSBV2Q7Z9PVIVg5fAap45beurnXZJ5aShcnyD8JLxRxnf12p2HZF8QPBtZjq8wp8Sbhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf5G1pz7oAVYoGx9NjdNmO1QrOfCmbhqu3ZqL/APDlA=;
 b=cu0nexC/I7n5/ysfz8KZ6YOHo2GzlMDOme5LbzDqviOCM/xj02BSrTMl3/m/sVbaWCbtAlatThzsFsqKZjhRkFUtWF49dtLW+HtfAUY74Rzhd1LJ2wYT3teGk5jq/iOHTtw+Xmf16VYklCiqd1h75p7/aUPOp+QqwNy75qG+UozBZkSPKEATBa63BHVHnmgO/GES/KJ26FmXPD8J9M1Dsos6Ci8qAjjGUDT3vTW9CoAwOJZloikoSYtHsv9xmHKcKJkcwWv+in/EzM0hhXeI3NBuzL6XR1wkZmFad0nrvFiMdjKaLESExd30todgny4nKKllRAYDTWHYaXn0UjE4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW6PR11MB8367.namprd11.prod.outlook.com (2603:10b6:303:249::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 27 May
 2024 07:58:49 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.7611.030; Mon, 27 May 2024
 07:58:49 +0000
Message-ID: <a1886836-9892-ff55-4df6-7b658cd6c452@windriver.com>
Date: Mon, 27 May 2024 15:58:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-multimedia][PATCH] sample-content: Set UNPACKDIR to S
 to avoid a QA warning
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20240527073320.3472465-1-yoann.congal@smile.fr>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240527073320.3472465-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW6PR11MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c98faf2-f960-43a7-9e15-08dc7e22cead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dU4xNzZaaGx1N0Q2NnhjcVBJRE04dHFJeTlpTlBhTDN0ODZmbnpOYXpHWm4x?=
 =?utf-8?B?VUVNVlYwYWlHdlQxNGNKL2MwdXFLQlZyU1g0K3hUSVJNRXh2SzR6WjNETzBy?=
 =?utf-8?B?L1kyakN1by9Sa2RSSkJDaDJPKzBwOEFkV2dGUCtRaTR2R0o3TXFSY3krcTA3?=
 =?utf-8?B?TWMyTmdxdnlCbVJVZVY4eG4zNEZaWHJWWU5ZT2pjNHY5MVlEc2xLUU9hK09G?=
 =?utf-8?B?MzJBTDAycm9LWm4vMDlwZnJXSXRYNVRwQkVuZWpoSEh5UmRTV1Jib2lCV2xh?=
 =?utf-8?B?Q3g2Rmw3eTRZeDBXdmhqYUgrcHlhRGdaL05ENEd3RmNvVk10ck02N3FaNjNt?=
 =?utf-8?B?MFFoNEpWNjdoQVRjQ01HaThPM25OSStUT1RQcVJVODhyakZWS0dhUTU1bmpF?=
 =?utf-8?B?dmlrdVpTdSsxd0owRnJJVlRQTE5zYlZBanl0bXo2dHE1ME1SUVU5Y2xRcTc5?=
 =?utf-8?B?S2E0YW5RazFtbkNjenFoalB1V3lEaUdOOG8wbjZsd2U2bVMvdlZjaFc5K2FM?=
 =?utf-8?B?ZEZWUVRCTjlVSUhjVEtGb0t1OVNyVU1DZis0d29mUThPaHE0SDNLNjZ2T05B?=
 =?utf-8?B?emFtNy9lWnF1RE5PbEpHTHZjK1BBV0MvV2FlU2RheGk0L0RhTExnNE5VTVVa?=
 =?utf-8?B?U1RLdDVubHpJOEc0aEI0MmlBdWhJS0lqMXR1emdtRzZxMndnZWJUbmNHdE9M?=
 =?utf-8?B?bnBKQ0E4c2EzbHloWHR4OTljV0h0Y29qQVZYcElHcTNINjlWNFNwa3cvRThT?=
 =?utf-8?B?WHh2WFhDUWxnay9JM20zZk9WY0k3eThId0NmV0tjQ1VjYWdKQVRhamtzZS82?=
 =?utf-8?B?R21zblYreTVXSWlVR0FNd0FLTnhLR0ZwZElqUHN5OVZheFQwb0kzWTlrUDNm?=
 =?utf-8?B?MG52L0VqOGtGTVJ3S3drS3pnQkg1SElCVHZNZ0FVd2p4Vit4aytRdURzVDYx?=
 =?utf-8?B?YTRiTWFhaE1xQWpRWjdKek1JT2pkT0hSVmFDaUxUMkdpcFNNdVptRlYySWpi?=
 =?utf-8?B?cXlwQjd6MGE1N0FibjdpaUJlUnJEdHE3dHJTcVl6eXhXc1JqamsvVFI3V0w0?=
 =?utf-8?B?QUw1L3NVelJpK2w2Vk0vUytUcDhSQ28vOVRsalFGSXh4dDhaT0ZWS1UycElk?=
 =?utf-8?B?Rm42T3J1ZFcyYmpCY0oxTldsRXZTdHNnRGxVN1RBMDFIMjZBL1pIL2RXcGll?=
 =?utf-8?B?bFh1Y2E1QXZvRDR1cE03WWhVSk1YT0dmZklHaXE4a0picGdpYytKdVpkUTM2?=
 =?utf-8?B?a05UUkhnanQ2TzVmckZIVDU5bUhVSll1NDR2NDBnSjU3UFVTWm9IYmJoWUp3?=
 =?utf-8?B?M2ppdXRlQlNKUnlqWXZjRms0Q0JodWVzYnFDdW8xeDlKWklteGlyTzhMdzZL?=
 =?utf-8?B?Mktib0g3dDRSRFZMeXJobXRlYlhoYjRqYTNBSlp1RHpPY2Q5N3o5bytuUmRX?=
 =?utf-8?B?WWVqbC9wT1M3VFM2Nkk1YTZvakRNSUg3NklUL20velk3NFZ1SzJ1RzNieUlG?=
 =?utf-8?B?OFpTcWdWL3FxbGdMMmR3bkVua25vci85NFlzRXlXOFFWTlFZZlJ3V3ZyZlg5?=
 =?utf-8?B?R0ppOUdGdWFmQkJ3TitwcVFWL1hCaVNXWmRuUmFtMTNyMjdUSWNXaDBlZk5i?=
 =?utf-8?Q?R2o3vjDxgqOLmpBihU7UNUapFOKZu1UWhKH4gStFNchQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1k4VGF2dVRNVExGOHA0ODBFZEt2d1M4eGtWNXRRbG1YSHdHVVk4akhORmc3?=
 =?utf-8?B?WG5jdkl4Q0lZS1A4UEkySzNlMjVIeGJYK2Y2aytaR0ZzYjRyR2Q5Zm9lT2Nt?=
 =?utf-8?B?YzdmWnFlejhXMTQzZnlLcHhab20rcGRXbHZhUFNTbDZZU0pxL2tEUTN6MlJC?=
 =?utf-8?B?QlZFSnk2bWF0WlFWVExuQnVIVjVQcEpFMWUyWlBLUWNsdDA0YmlqRWRJanF5?=
 =?utf-8?B?Y2lMSmFTdjNEQTZnVm9nSWEyczJ2K1hhSjlTSU1xOElQRnFSYm0yanVFY0VS?=
 =?utf-8?B?aVNBS0xINlJ5aHhFcDhweXoxazVOaGJDbHJMNDAvYjE4SjUwbUpPKzV4Vmwr?=
 =?utf-8?B?UE81QXNraFhxZzltbWJ5ZmN0ZmtXQWNkUzhBY1EwUkp6bklQYk90WWJHU3Nl?=
 =?utf-8?B?UklKOGZneTZLdkdXVGc4ZVMvM1g2YlJ2L2JOak0xL05RZ1Q2OVczMHRNVHEx?=
 =?utf-8?B?enBrOGxYM1NQMkE5aHBkWk0zY1lNMVJIcDZtWnFNMEVYUExzaWd3VkcvSnRi?=
 =?utf-8?B?RUVCRkVtYThFbDZHbHdiT0VwellQQ1RoSmJ2TmdVcTNYaWYyc09UR21zTE5X?=
 =?utf-8?B?ODZkY3ZYMnR5VmszeGtncXVsM0VwdEdsNWdvcStaTmozcVl4ZUZrZFArY3J5?=
 =?utf-8?B?djZJbjNjQkhzNmM4SnhDMmFDYWxZa1h2RW1PNS81RTJMQjVjcVB5dTROTzlS?=
 =?utf-8?B?MitVMmM0WDBkMml3bjRDdjZGSnJ0UEdmUG1GTFpKdmdtRStIK1ptMmlHd21j?=
 =?utf-8?B?dktMaWNid0dYZWNaNk41ZGJWb3ArUXpabmhFd2ZWOGxIamFaSlNNSVQzR2RX?=
 =?utf-8?B?ajdYaklFWEl5cHl4UUxKWHBZM0hHVSt0bzRyZTVvMGYxNFI1L3JXZzFnRnY2?=
 =?utf-8?B?Z1dPTmdUS0N2RTRKYjM2NFhuQzVnVHQxaXZUZGpaRFFrTEdGRnlGK0hrOVQ5?=
 =?utf-8?B?SE1GenF5Um16amRYTzc0QWV6L3ZTeUNvWDJza21Hb3hRZ1lyVjdlMGJNVjRE?=
 =?utf-8?B?U1ZvSElTWW5welVhakVRNlFseTFEZWpVZ1Uxd0UybzVmdjdWa0l5R1dBVFdI?=
 =?utf-8?B?bjV0d3BKNXZVTDRNWmh1enY1TjYxenRNU0ZlSnRIckdBR3FZazFRQ2YyOU04?=
 =?utf-8?B?S1o0dHZTR0JSMjZscHlyU2Z3d0UyOUdwS05udjFSb05BaE5YRTdlUjJ2a1Fn?=
 =?utf-8?B?ckVTNmc3T2FycnJ2WUhnREQ3clgxT0JxenhRYXRxLzFqVXNsWWN6Q0hxcVRm?=
 =?utf-8?B?YTFDRUs5SlJLYmk4VkhkUlBZSFo0ZmtTSXRQdkdhdTVQRkNNeU5NaG95SjUy?=
 =?utf-8?B?NFNzbXVCajFuaHFHQUVBTlhuOVlZeUVsNG5ycDZDWG96T2daOEErUytJM1Q3?=
 =?utf-8?B?SGgwM21PRDFCaE9hNDFQQVk0SmI4d2ZXWjQ1emhOdEVIKzRUV3B3ZGMyaXgv?=
 =?utf-8?B?MXN0YXc2SVMrL1NlU1Q5TnpCY3kvUnhFd1NMQ1hnY0FUbFp2YTU0L1pHa1dW?=
 =?utf-8?B?TnBwSlZMYXgzSE8xWTEyUDVmOHZnOHVQM0tFVEl6VEhOUUVWTDhHYkVubGpB?=
 =?utf-8?B?N3JDd0pEV3J3TDVQWkR0dnpHOTVuR0lRczFiVG1zamNwTXU2SnZqVVlsSXlC?=
 =?utf-8?B?bGlnN2xZajBjZ1NpNE5vTFgxc2ZDbXVzUU9aMDF0QUZJVGxQQ2VqMDNzbHZu?=
 =?utf-8?B?Q3pLWEJtbHlrYTd0VVRrSGcwZDdJcThrN2pSQTh2aW1tUkJ5SWxUU3V6VUZU?=
 =?utf-8?B?ZU03R3B3bFBsaEJOOERYTFhPMWdiOU9GY05MUXVTUEVYeVdFdEtyY0liWFNt?=
 =?utf-8?B?QUVyamthaHlKTC9RQUY5dUR3dytXcy9BcjIxWThjNGVuRWdhNDFVY0w3QkUv?=
 =?utf-8?B?Z2Z1TlRQSkhlSU5LVHNTczJqcTlMbFlCZk1yUUQ3aE1MKzZyVUxrMzFSUXN4?=
 =?utf-8?B?SW51T2RvY3VqNisyM1BMSWJBL0JTcGNaSG1hSWFOUitObyt6L2dIVlZzMitF?=
 =?utf-8?B?dW5MVE8xU1l1cFhkSDRwZmljc3VGdkhjVnFwSnNtcFBpNzB4UUxoNHdNcVFF?=
 =?utf-8?B?ZWlmWStEY1lTUDVYTFRkZXVrV2xsZlRDQUlhVCtzOWpTTmdCbTRKNUYvbUR4?=
 =?utf-8?Q?YJcUBnj2PDIqJk/ilr+j5ztwP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c98faf2-f960-43a7-9e15-08dc7e22cead
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:58:49.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0auFZgcBJwmkhybIz7ZnEATGweGdNADw8OSZjMU02fZwknuLIzc0FSFU0ceaT3rXTjkRziQMw1+P0xt9qHN9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8367
X-Proofpoint-ORIG-GUID: OK5keRLDSF0TLrhIDerV8j46vo4BDNe_
X-Proofpoint-GUID: OK5keRLDSF0TLrhIDerV8j46vo4BDNe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 07:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110534

I think you need to do the opposite, setting S using UNPACKDIR.

Regards,
Qi


On 5/27/24 15:33, Yoann Congal via lists.openembedded.org wrote:
> Since recent UNPACKDIR work, default S directory is not created anymore.
> By setting UNPACKDIR to S, S in indirectly created in do_unpack.
>
> Fixes these warnings:
>    WARNING: bigbuckbunny-480p-1.0-r0 do_unpack: bigbuckbunny-480p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-480p/1.0/bigbuckbunny-480p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
>    WARNING: bigbuckbunny-720p-1.0-r0 do_unpack: bigbuckbunny-720p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-720p/1.0/bigbuckbunny-720p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
>    WARNING: bigbuckbunny-1080p-1.0-r0 do_unpack: bigbuckbunny-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-1080p/1.0/bigbuckbunny-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
>    WARNING: tearsofsteel-1080p-1.0-r0 do_unpack: tearsofsteel-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/tearsofsteel-1080p/1.0/tearsofsteel-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
> ---
>   .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 ++
>   .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 ++
>   .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 ++
>   .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 ++
>   4 files changed, 8 insertions(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> index e5a8f085b..83ad136b4 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> @@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
>   
>   inherit allarch
>   
> +UNPACKDIR = "${S}"
> +
>   do_install() {
>       install -d ${D}${datadir}/movies
>       install -m 0644 ${UNPACKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> index 37e519790..b054948e6 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> @@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
>   
>   inherit allarch
>   
> +UNPACKDIR = "${S}"
> +
>   do_install() {
>       install -d ${D}${datadir}/movies
>       install -m 0644 ${UNPACKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> index 2b233d3e1..4b80d110a 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> @@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
>   
>   inherit allarch
>   
> +UNPACKDIR = "${S}"
> +
>   do_install() {
>       install -d ${D}${datadir}/movies
>       install -m 0644 ${UNPACKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> index 34753fdb1..02b3c3048 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> @@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
>   
>   inherit allarch
>   
> +UNPACKDIR = "${S}"
> +
>   do_install() {
>       install -d ${D}${datadir}/movies
>       install -m 0644 ${UNPACKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110533): https://lists.openembedded.org/g/openembedded-devel/message/110533
> Mute This Topic: https://lists.openembedded.org/mt/106326666/3618072
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


