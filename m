Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62288EE57D3
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 06:42:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34016.1694155313915122543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 23:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NZsBmOt8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761562b37d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3884rhVW011007
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Sep 2023 06:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=hMbuAyZaiXnv2EgVZYW8oX633OQG7B/+ZiGA29H7X18=; b=
	NZsBmOt8l1xhgRpmnzzZtIYQEvFPIYAatOKjwnP6s7/mB/jtXDHntVbIwLEC/ksj
	y2GNdS+q8DpXekUS4v12KjHkd3M37k8PIXoawN4bKJZ7bTlBv5oIK/pCbOBf1hEi
	7Gu+uwDpPdx0UBRU+4BdrkgjGKxp9PDnUOTPQzaHf94r/oTtI01hNtmKTzdpQ0Od
	Oae0JWpP5evBk4f47/2mKvHpaCKpoN9yTO6rdVseQi7q97BK9rels1uxYHYVcrDH
	0nYN6mKAVm/326eIfKhFTt2nQYHJrYw8EdS2eyusEXdBhIziVmuiYOmbUDDNYVT8
	IyFLgLkuEvZGLHUvSeaLUA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k46f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 06:41:52 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3886fqMe025472
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Sep 2023 06:41:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k46f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 06:41:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlJF7ThQ24ywtsC6JWGgJxekh9vbOHCXLQ7A1Y3wwKNvHAUHdbOJIFnPzdga8CmhMnr8HGVXnpoqHfexWZ9Ylagwn9qyLGmTjNseSxSoXeWzjUIkExPveiT+RNyWSGGE/6jqONTc8eNomavin59Pbpu6c3HhkdLPyDY9sVnuRpFwD6iCK3/3UGDLlywd06pfb6TMfgLWgueBM3DCGiC/1F/tDX3SU0DiMDv/vM4eSA0T87vUmbKXDrRNWbFoAB+7gUhidFYoXACPD5iQj1U0tu+g0scNVdgxdUPN1opxUPiHj0Khmh6SKslZRUM7q8WujQ2Y/5YS2p7+E06/yIluXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMbuAyZaiXnv2EgVZYW8oX633OQG7B/+ZiGA29H7X18=;
 b=HOXSKGKgrwrGMeaS9KLqm267Vc1Pb8RPTU7DC3OJu0ZTUUP/KAGazz9cCauBiQBBB2xbU7D46FX2Zx4q31v0xEP2PyYVlyv3nFrvrx7uQ+Loetv9ZpmMzcQuUgMTLL9sWYfMEXPkYMwzl6IgbxvujfI9nBhEtsnDvNSl+6n/arL/hLZKd8w8BWsn4e2zXaUeOw71kQn/9Xz2bhQKHf1Hi5qbuveEdSRLgqru+Cf/45FYtmzz49iXlOg65H8G60TE6D+d0g7G2TjLgq9P4Q0kX68p6y2y4o8rA9F5pGuCB6b4YlOOLQytyI4fhaOhmXOQKE8P+oVYiN2P+w7D4XU8VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:41:48 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:41:48 +0000
Message-ID: <d0e2bdba-c88f-f900-a9f4-0f4da59a5399@windriver.com>
Date: Fri, 8 Sep 2023 12:08:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <177DFD1376FBF60F.28529@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <177DFD1376FBF60F.28529@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: f7080a96-237b-4865-b41f-08dbb036ad2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EgOUF5Dgm0c4SuSSST2uZ/TUNP+QV2+gGyIASzW3SK/wl0No6AZa1NF40vEd7L0YOMwipHj8K2dgZpnsNBuVcfK/Zd8G7KLBCqCV0z9PY3JmshsZHUsJL6pIovwc/ExoCqIydhYYlI3Pmo6WhHiAmektO39sqGq1yScOjGK3Xm9ONXV52tUOV/2z62cXuWm/SxypEwYOVqrNCdCd4PL2Qs0G/ix3pMhkkUrjYpnMC7fNXMq6QrGtUouQmOm/xMkBUDRoQ+vIggwdkOs2OqZYHbITRtjSxhH2m33vW1UEdlDw7WmASjJtLoaXZDITeTLM6SR1Vtv0WPo1O12ZsYgLyy39gPS0ODk9eLuyAwo4Dv19JipGPDifPjnnVls/efHvB86Qv0qXp7IV31csS1XyF2BGNt1+tZ5oQwFuEKJHOTEqcKyUbUhpUz7D7OR2GdRP8dkUPzIs0WdXrqvt5SRbiVFfptCx4j6HJDcBrl4CQETcOq+cV87FgOYd7JsyRUmDFzP+Y1g+XnIbXVaPVy7m+jRmHmPV3WDy6kwi++rSJSiYL1BD/jTqhHoR82rJrp058xQsOmDpBOD0lmT4RpObEBP+m7DlGL4/M1McsLZe9sPeaj0OufxgBQbg/OCGqh9HAyxw0EkmcTfyRVujzO977Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39850400004)(1800799009)(451199024)(186009)(6486002)(6506007)(53546011)(6666004)(55236004)(6512007)(966005)(478600001)(83380400001)(2616005)(26005)(2906002)(66476007)(66556008)(66946007)(316002)(41300700001)(5660300002)(8676002)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnE2Z3FGN1pLdDdsQ21qNW4zZnNyK1BJRXFZd3h5Mm00RUFKcDI3bThLREVO?=
 =?utf-8?B?Q0FidENodE5CRk8rZUxpUnZXR1NRV2lIczhwT3QwcW9Wb1B0c0hSeEV3cHk1?=
 =?utf-8?B?dnBOcGtiNGJyVmszS25lT0FxWXVScWtncDVyOUxnb1lIZDBrNmxiQytGcDF6?=
 =?utf-8?B?QVRnN3poS1JQY1hVVlRwdkJZNTg4UkhBamxvaEpIcXpuRGFUdHdEdGZ2Y0Z3?=
 =?utf-8?B?YXd2T0FNRUg0RjRvYVBFV3hYU3JKbEZZNElRb3VkUkFuVUxsUm9HNk9BeTcz?=
 =?utf-8?B?SnJkU3ZDbWZyMTJsTHFXMi9FRE9YK2RlUUtKRWwwcERsUTVwRnZiT21SYVRF?=
 =?utf-8?B?ZHlkekR6Sllpd015WUUyMmk4dldxYzJrRjBpVjhEajBGU0F0SVlyU3VmYjVs?=
 =?utf-8?B?RlBpVVFwc292REpjb3FPVXZMYWsyM0l1cHpIYmx4L05iSjdhUWZ4ZjY5emQ0?=
 =?utf-8?B?TktOTFdudFdzbnNmcTVWTzlPb0h6WTJ4NGY1TEcvdDBXeE96aXcyc1l5TUs0?=
 =?utf-8?B?bEM2NkphekRpdlZYelVuK1NDQ1lzaEtnanlzcytrU2lLUlh6RW1ZdVoyWFhx?=
 =?utf-8?B?NC9ub1Z2dTluRXg3ZmxOV3g2ZERJZURDUWN2RU4vNlRjaFc0aDlZRlJzUjY1?=
 =?utf-8?B?MUJYdGFoUFdXZ0NNZGw0aEQzTDBndUhib21TV3RtS3VNTmcwSUVpa2pINnhp?=
 =?utf-8?B?OFI1ZGFXNHA4V2o4OXYrd0tPbWw1MGlOeXRlOHdnYktEUGFLTzlwZWdyNGhR?=
 =?utf-8?B?cUx3MUJ6dTRkeDJ1SXVpb25zSEl1cDNIcUwrTVk1TXdMdTlVYzB5dlhsdzlw?=
 =?utf-8?B?ZFJLY0V2SXV0Y2RLM3NnOHQrdUdzQXRxNDJhMjhBYTJhYlFIZEZ3bzlaSUJS?=
 =?utf-8?B?MTRKMTg1KzhnNEpIdXBZM3FYcE5HQmNvVVRxVSs5OU45UDVxTXo4S0l4Y29F?=
 =?utf-8?B?KzhhU053ZFYxN2ltdG1qZjRZQ2lGV24zTVd2ZGxmckNTMlZJY1dlb05jZ3Vx?=
 =?utf-8?B?bDhpNG13QmYwZ21pelo0aWpMcFoyaG5uWEtJSFk4VG5Rb0lwczRxV2hhRVlE?=
 =?utf-8?B?ZkltRjdmZmlDNkFkbGhnakd1SVhjTDU1Tmw2RWlJbXl4bTd3RStxSGszOXhJ?=
 =?utf-8?B?M1M2T1UrV1NRQXQrL0drQU85ektpUWIvVXBMTE9IQ05XSVZMVWt1eCtOVGh1?=
 =?utf-8?B?eFFXQkY1L0NBYVZzRzQxb1g3V1BRaHM3OTZwMXBzMExna01KQW1ZNno2R3By?=
 =?utf-8?B?akVMVEVmUGhFQnczSVMrR1RRMEgxV1RMM1BOamNwR2F5M3JsWmlycmk4QXZx?=
 =?utf-8?B?VWdwalhTaGtoTGU1dE04VEoxUFhQSENFT1RmVkdzWlRVN3g2VFNmRVdqODBm?=
 =?utf-8?B?LzdEaVJWZHJ3MFYrQ0duME5iOUxHdHRQbU5QRzZQbTg2anFBbEhqUy9iUHJj?=
 =?utf-8?B?YlpXUVhSaEpwYnh3RTZUVFlCUlJ4Tm1Tb1dzTDhqMzBoK0FBYldhVUpaZXA4?=
 =?utf-8?B?U0g3QmhwdnVlUGZFR0ZpRmZBV0wzNkxlcFBaekNFWFQ3WXRMWjFMVFozS2VC?=
 =?utf-8?B?OWFOTlRWdld3cWErUFRnWklkU3JZRkFUZDNmWDk0eDBVcXhObWtNZVFOc1R6?=
 =?utf-8?B?a3kxc2RSSFlobkZ0TFordmkvVkVvWGhvUk5qRFZHY3RtVGphRkM3WUlETVJI?=
 =?utf-8?B?ZWRtSnpCSWdHeHRreGlZZ0pNWElTMXk1L09nZkU5emVNaWNYQmt6THFTN09D?=
 =?utf-8?B?WjVwZ0R1K0t4Q0hrT2R2Z2NhaUxwWjNNVWs1QXNTTjJRRml3ODRUN0R4TGtR?=
 =?utf-8?B?c0VvUU9MK1RxSDBMMEN6aUl5MUlJWG5SOCsxNmVTSHNHZUI0eGxKa1lqeldS?=
 =?utf-8?B?M2QrejdPOWhET05IdE9USDNheVo0aTJNd0lZVnZOdFhpUllwcktPOWkrZ2p2?=
 =?utf-8?B?cDVNTjJHeEZjZWJwRUVSdkVYVTE5QmdZZFNHSDNnMnVUYTNDS0tUWHBSWWk0?=
 =?utf-8?B?SVVHRmpiWGFveU04Q2YzYkg5VjFuRzhRUllQLzlMN0x4MHAyRFhtSXBWOEdz?=
 =?utf-8?B?S091SDFsZnhMTTdwSHFKRXJ0SHdGT0JMMDl0RXZyYThtbjMydjdiNEJvNjRD?=
 =?utf-8?B?MmNMbXd6RlRrK2ppTm5QUGtIa3NidGM3eFBjbTNoRnZwRHdObGhiMHVhMDZB?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7080a96-237b-4865-b41f-08dbb036ad2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:41:48.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hssJhXMMFELoLy8C5unhMDbCZa7k4oNCD8wwWsdMisiTw2C9jxXNrH/bcYDoHiqSnx8bkpKpDLw46NTzPSyrlJEnESPBSyprlQ0dA/HrxAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
X-Proofpoint-GUID: mDjWv6rdMcofgjyXKlPpTDqLDjTW4qMV
X-Proofpoint-ORIG-GUID: meeK2wpwHrtDMV84bo1PdVJi-CxK-hmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 06:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104798

Gentle Reminder !!

../Narpat

On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> Changelog:
> https://pyup.io/packages/pypi/requests-toolbelt/changelog
> https://github.com/requests/toolbelt/blob/master/HISTORY.rst
>
> - License-Update: url of License changed from http to https.
> - Fixing missing newline in dump utility.
> - Add support for preparing requests in BaseUrlSession.
> - Fix urllib3 warning to only emit on X509Adapter usage
>
> Upstream master patches:
> 0.9.1 -> 0.10.0  : https://git.openembedded.org/meta-openembedded/commit/?id=a4f2646ef27a3f27bc607d57b8166071f307426f
> 0.10.0 -> 0.10.1 : https://git.openembedded.org/meta-openembedded/commit/?id=b5cd6f6164eb3ab0403f610236ac0cbbe5459671
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   ...abc-deprecation-warning-in-downloadu.patch | 41 -------------------
>   ...bb => python3-requests-toolbelt_0.10.1.bb} |  8 ++--
>   2 files changed, 3 insertions(+), 46 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>   rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> deleted file mode 100644
> index baa833b6d2..0000000000
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
> -From: Jon Dufresne <jon.dufresne@gmail.com>
> -Date: Fri, 1 Feb 2019 16:30:01 -0800
> -Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils
> -
> -Warning appears as:
> -
> -tests/test_downloadutils.py::test_stream_response_to_specific_filename
> -  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated, and in 3.8 it will stop working
> -    if path and isinstance(getattr(path, 'write', None), collections.Callable):
> -
> -Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
> -
> -Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ----
> - requests_toolbelt/downloadutils/stream.py | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/requests_toolbelt/downloadutils/stream.py b/requests_toolbelt/downloadutils/stream.py
> -index eed60a7..1d1c31b 100644
> ---- a/requests_toolbelt/downloadutils/stream.py
> -+++ b/requests_toolbelt/downloadutils/stream.py
> -@@ -1,6 +1,5 @@
> - # -*- coding: utf-8 -*-
> - """Utilities for dealing with streamed requests."""
> --import collections
> - import os.path
> - import re
> -
> -@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=None, chunksize=_DEFAULT_CHUNKSIZE):
> -     pre_opened = False
> -     fd = None
> -     filename = None
> --    if path and isinstance(getattr(path, 'write', None), collections.Callable):
> -+    if path and callable(getattr(path, 'write', None)):
> -         pre_opened = True
> -         fd = path
> -         filename = getattr(fd, 'name', None)
> ---
> -2.25.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> index 72ad7a6180..c39950ab5d 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> @@ -3,14 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
>   AUTHOR = "Ian Cordasco, Cory Benfield"
>   
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
>   
>   SRC_URI = "file://run-ptest \
> -           file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch \
> -           "
> +          "
>   
> -SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
> -SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
> +SRC_URI[sha256sum] = "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
>   
>   inherit pypi setuptools3 ptest
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104535): https://lists.openembedded.org/g/openembedded-devel/message/104535
> Mute This Topic: https://lists.openembedded.org/mt/100912004/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

