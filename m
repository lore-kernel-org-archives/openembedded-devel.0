Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14690C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 08:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41263.1674117839903998209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 00:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=bvmdyK1V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0383abefc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J7go8m006328
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 00:43:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=SutHfn1DOEySlTDtiZKoIFdN8p+4yUoEwBFyZG7rH2o=;
 b=bvmdyK1VKyNwBDtM0YRdlcfcjqKtDEdrsI3xOSAEBTWLynhuZQDASl9+YdHUqGxFXpiv
 gX+7jCNcCcJAl8I98r/yEUUc37Y7jQgV32V/Qu2+OyEp+EWZD3bXfLEqToT4yXXPSc2c
 R0coW+L18G5mGSBmeos4H8zbHGcQV6H4qvukSgw3gpQLksk2ejbqL7d0wqzpuexIWfdn
 H+IDB7Y4UYYxr7BUEVXDi1vGpOy37JFUp9wNgPLPCgfNcP2XSg7H3YI5ZR+x77jWsipO
 MBCro+uPp79qeXxfb/3JuGp+ecnkO8/01C8dQJB2esBzTXzoPijsjoJq40I0hz/WrQpq sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6vut3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 00:43:59 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30J8hwXP015436
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 00:43:58 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6vut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 00:43:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NScmiQQg03LSDCbizue9OqC+nH9OP9mXMWMgSoQr59v0L2MrS3XywMGQClKeBVfc/7MhclqXqSDXyNahrdnaSmKbTQT3ujb23Llqjgpcd2HR32pRbC9SAlnjfx9mdrdq22Gp4Gbe9TtdDoI17gtONnIZ/ALt7nl/n/weJK2xQoOh0QeK+Aasx7nyeJFdzLUlV08qyv7v5l3X5ENJ2jMxlQ2XNbhnE3YOf8uqHo7kUyOCuvVGaGbvktmdFDy88LpCAx8h0PohdnlvZs6iWKXACv6wXrHVpCosvQgx0jmeqj+/RJN0QOod5v/jhLvcXObcPxVWmVmouovBEVMEfna3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SutHfn1DOEySlTDtiZKoIFdN8p+4yUoEwBFyZG7rH2o=;
 b=FHg7Et3JpMRF5IFZ3G7yUUhLMuTpcu+MRts8rUXAtYk8PN+4s6ZyOmUu1LMXUufqGQpnTW5/S7/gbhq8d1L4eesptWV4oJmjJlqDCczqDt0bJCK2fZqk2owdhJ7eqdlmqJkoxe3eF3Wr7IYv/JoBAVEBgxquH3lZLdR4QzuHYTaUGP1fVmLdo2dJoGl/kljkjSqCxygPS96UNdE2pETU6xK+mrted5YSObDiHQh2pyS8KTWQkAwwaHa8AJ9+4soCl5SnSK+1agXVmLGhtRU1fJS33n8iYz/eGkgD1iOTkj8Q0xDOpDj2g0Uxb9KTcm0HEXaoC8sMjgo/IYx8PugRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 08:43:56 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6%7]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 08:43:56 +0000
Message-ID: <535979e6-aef4-ab91-ca38-0013cc4ab3cd@windriver.com>
Date: Thu, 19 Jan 2023 16:43:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-networking][PATCH] crda: remove recipe
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Randy.MacLeod@windriver.com,
        troth@openavr.org
References: <173BA8F91BE6B347.24231@lists.openembedded.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <173BA8F91BE6B347.24231@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c0c23a-2f7c-402d-7408-08daf9f94ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	anqd1v6SwyXiTWPxM3B1IR69rXPUAWS44rusKkfz4/O50hzkp4/kQs96kIH+P+lPwMtfMR92az0iI27G+cN5D/VdXH2u1IHDaiuIsEUEI+WnpWXwAgsCMvYmrScblccE+pzav4+A22KYPq3LoJEYGLZtVnYXKMZO/swYDpDJH0Y58xjNqRtjZoICu7DmndnZPAoSFRbIorzpF2nfiGimreVANb0CsEAi6sXHMvmueXqPeF2zz33w/hGNKYQDOwsPDNIj0l1700J2hXwyctId5+gtCoE9vzJUebK5CbmQL6CA17UMcPGyYxdEQXwNZn0nZbxvQbMcm0X1CMIyItgfPqr3U+hZuN6TBN+N4Pa23w0cA4bPNlFQ6q6G/C7f3rD/cLHdYpNI+dmySuv6R26W0KFaahnEvv3kMo+qAjRELlNlgcuVAtQoeqmyhzmw7xA9HnH2zYeUq3eKXAWn4g599UHELxblf1O3D4XGRW3oVayuO5gnm4tpa2clVLz9oaVA1ms3Of1M4t5zc7jW6N77s75gWrCxNKckRz+Izrw76XtfWkcKMHP5bUU+QB03jsm07lHiYm0E8MqNAEVKWe0Dh75BsaCDNhMh6TykppeXWAcDln8hfkFG9pYmRluVnI5y1M2f4WVctEk2Ntf4UYFDXSNPGmI6qTiR09DPIdWVCNWcXERkA1+KEX0++4iP9IcB9Rb+o+M6jgBeCRZjt3rNpuS/zFTmGKvkseX3w3UE7jkEFVdLvD+lXoc3S+Aa3Z66j7QS04A8JMujoBVGvP8LcGBWK5khIX79WwRmOaFyFP+6bcFjAhr4yMbgVRhGuhQFOgN2oqoJs91Eq/a9uGaWZmLkcZHe3LNsLy7A8QRtx2Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(451199015)(31686004)(66899015)(86362001)(66476007)(2906002)(30864003)(66556008)(5660300002)(4001150100001)(8936002)(66946007)(31696002)(38100700002)(316002)(6666004)(53546011)(966005)(6486002)(6506007)(478600001)(36756003)(66574015)(8676002)(4326008)(41300700001)(186003)(83380400001)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TSs1eHRMbTZyUUdITUc3di9hRUw4RVJJZFFidCsxemVaVHpUUVlJUHBRclV0?=
 =?utf-8?B?eDBvM3NDUkNUVzBFTUdMdUd1cGMyUW1TUXNlUDFyazcrWFZVQk8vOTF2TmVO?=
 =?utf-8?B?MmdaSVZ4cjZHa2ZqS3JiMUg2dEplRFd0aExWMm9mT1JCUWx4bmpGZFRKVmlq?=
 =?utf-8?B?QWNaSzlvSy9TSzNXQlo1NS9ScjRTRG50UE5QbXBRbk9UYURUSnl0NEJOTU1a?=
 =?utf-8?B?Z2h0bUdrVWxQaDB3MSt4czYzclhOYzVpSEtKOGR5NWNDd0dQTTRLQUh2RGgz?=
 =?utf-8?B?eWVGWHV5Y0p1WktVcGkzWGxlY0hKRnBoNmlKSWJScnVPV2VDeU81SWZ5R2tR?=
 =?utf-8?B?bHNlSHRLaTVrU2VtcjdIeXk0YnZiVlJtakV6bGRsbnFmeS9hck41NWNZZTgx?=
 =?utf-8?B?Wm05TVI0ZTVuTDJMMGRLWnE4amg5NHNOUjc3QlZPY1FpczVnOUNoV1FRemUr?=
 =?utf-8?B?V0hPU29ZNUpULzU4VE5kZmJjRG9ZVnNvcjZiMTlBMTRKR3FvZ0lieHB5Yk93?=
 =?utf-8?B?c0JteEZRb3pkR0tKT0VvR3djQWQ5V2VRRUtYZXVhb3pmZENVdkU5dFAvZ3hR?=
 =?utf-8?B?R09SVHl5OVpFWjJTU2c2S2cwOGZFOXF6L0RLRVpNTTc0eXBYWi9wdDc0aVhH?=
 =?utf-8?B?NmdmOW95akxJQlh0YUcvRkE2UUxReDhoVlJVZjhmNWUrckJHTjU3K09YOUNH?=
 =?utf-8?B?TURNRnZta1dOQVdCWGNJSm9rRkFYV0RMWXhxbEVPZ291dXN2WDV6T2pKb3di?=
 =?utf-8?B?OGF3QTNDNWwvQjBGemt1V0ZaR29BNlhvVEo0UGRrbHVMaUpWbzB2MW9MT0pL?=
 =?utf-8?B?Nmt5OUY5ZUhxRUtnamJad0pNUGlEaTZBcDNiV084NnVLTE9EOHVvMEpkTTBE?=
 =?utf-8?B?amdzTW1EdUpEUXZMcjBHSDNaVlQvK1plNHRldG9ZZ3ljaG5YblV1OURoUWQv?=
 =?utf-8?B?cFk1b3k2SUNRZWFxL2Q3YW9XRmthdzc2MHcvZzRJWmV5NUF4SmF2dDI1U1JT?=
 =?utf-8?B?Y0NEWjMzb01TMkg1cHRNck9OV2V2WWhlcGZabjhNU1kycU1RSFBWNG45NlNp?=
 =?utf-8?B?eHV0dWFMUkU5Vm1iRmlCTkRGa1RyenBtbGk0d25yS00vRGRKcDNtMVhhMzEw?=
 =?utf-8?B?WThPNEltNVpoK25UL1R6VnVOcldJSnlpMVlJU1ZDTDFseVBITXlmYkY0elUw?=
 =?utf-8?B?cWVoUXJCaC9lK2lWcThSc015Skl2Y2ZhdUdHMHlIeSt6eDNSK3ZXYWNNRG5h?=
 =?utf-8?B?MzkzYXF4TlducWlidVB3V3RMSGk5cXpkNDZjVjJGUTlXVG9PckE5UjlGQ0JM?=
 =?utf-8?B?ckptdGtRSU1PZUlSTk9wK3lRczRGUUZzRTZrM0lRTHVBRmJFQlQ1b0o3R3JT?=
 =?utf-8?B?aHY3T0dYeG5jWkllVzJIT0xMVjI3ZFV3YUZPbWljQ3JjWmwySzZyRDFKaW9X?=
 =?utf-8?B?d2ZSNDgvTDdmazk3OFlVNS9BdlYxb1MwRjFOUDZxM1JrN2pBblFGaEFObXR6?=
 =?utf-8?B?L3ZtekIvTHE1NC8yYkcxSjdTM09BNEJhak1FbzVtbzc4b2RPaE1tS1d3dkoz?=
 =?utf-8?B?MFVSN0VkNWZnQTI4d2dWK2JXY1B3ZDR1MGp4RjdZZEFWVml5RkFzQ2U2dHJw?=
 =?utf-8?B?NXJHYW8wY2k1YVZtcnYvdk8rckxtWFV3SHZwbnRhTU55U3g0M09aYmFzQzdo?=
 =?utf-8?B?VGRCTlBvKzBzSjJPUVJoM20zbS82aHIxUm1ZWU4vRFNBenF0Yk9UQ0R1bnUw?=
 =?utf-8?B?eXVRTnhZSGthenhtOTBhRGI2TjdKUmJ5YUxGV2g5VFBrOTQrczhhSFdHOTRj?=
 =?utf-8?B?VnhMZER2b1BscENPMmxVbmp6WTZjWm5HSndqMFAvR1hxV0QxZ0pCdUh5SGNQ?=
 =?utf-8?B?NFcvajFqcHJDdWg3OTMwb3JzeDY5U2FnU01PZGpwNXNIc3NjMHVpdlRWVWsy?=
 =?utf-8?B?VGxFQUpscVhSVndyRlBBbm1kK25DQU9vWS9VS2t3VllncE92UzBTNEtZbXJr?=
 =?utf-8?B?N1RlVGZxMUI2ZzM5enhJcnpRUFRoK2l1U0o1SnN2bXQxK3M4UkZNOVhQNGJH?=
 =?utf-8?B?V2NxREdXbVI1b2RobFQ0YXArUFR1UjRFaHVPblhEY1lDR08ycWF2R2gwOW5l?=
 =?utf-8?Q?iy1DLqf2mtpr12mHHNdwCHKzD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c0c23a-2f7c-402d-7408-08daf9f94ca2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:43:55.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZnbD3+5JA2Dba4y2r1Jwf746LCuqEeXAS3uriMlsjgyqWDJgijpf9pbNxlI738Ki7tLsw2+9k5jK8dki525ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
X-Proofpoint-GUID: yFneApKGWtQHwcjuwVRXjlUZrnMyoKPq
X-Proofpoint-ORIG-GUID: 0AF-WOs4Pyui1ey3KpERhUe80jawMfVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_07,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30J7go8m006328
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 08:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100654

On 1/19/23 16:37, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
> ("cfg80211: support loading regulatory database as firmware file") adde=
d
> support to use the kernel's firmware request API which looks for the
> firmware on /lib/firmware. Because of this CRDA is legacy software for
> older kernels, remove the recipe.

add "Theodore A. Roth <troth@openavr.org>" in loop.

Regards,
Kai

>
> It could change regulatory domains with iw and wpa_supplicant.
>
> Refs
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree=
/README#n8
> 2. https://wireless.wiki.kernel.org/en/developers/Regulatory/CRDA
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...-Make-alpha2-to-be-3-characters-long.patch |  31 ------
>   ...-Makefile-respect-LDFLAGS-for-libreg.patch |  29 -----
>   .../0001-reglib-Remove-unused-variables.patch |  59 ----------
>   .../crda/crda/crda-4.14-python-3.patch        | 101 -----------------=
-
>   ...o-not-run-ldconfig-if-destdir-is-set.patch |  21 ----
>   .../crda/fix-gcc-6-unused-variables.patch     |  11 --
>   .../crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 ----------
>   ...-linking-of-libraries-used-by-reglib.patch |  57 ----------
>   .../recipes-connectivity/crda/crda/make.patch |  25 -----
>   ...e-target-word-size-instead-of-host-s.patch |  34 ------
>   .../recipes-connectivity/crda/crda_3.18.bb    |  40 -------
>   11 files changed, 466 deletions(-)
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/crda-4.14-python-3.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/make.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda_3.18.bb
>
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-net=
working/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Ma=
ke-alpha2-to-be-3-characters-long.patch
> deleted file mode 100644
> index f1d2cbc5a..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 078e962d345fd0536fe7ba797485ee1a4159c032 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 4 Feb 2022 09:18:30 -0800
> -Subject: [PATCH] Make alpha2 to be 3 characters long
> -
> -Fixes buffer overflow
> -reglib.c:969:9: error: 'sscanf' may overflow; destination buffer in ar=
gument 3 has size 2, but the corresponding specifier may require size 3 [=
-Werror,-Wfortify-source]
> -                      alpha2,
> -                      ^
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - reglib.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/reglib.c b/reglib.c
> -index e00e9b8..8565a0b 100644
> ---- a/reglib.c
> -+++ b/reglib.c
> -@@ -958,7 +958,7 @@ reglib_parse_rules(FILE *fp, struct ieee80211_regd=
omain *trd)
> - static int reglib_parse_country_dfs(char *line, struct ieee80211_regd=
omain *rd)
> - {
> - 	char dfs_region_alpha[9];
> --	char alpha2[2];
> -+	char alpha2[3];
> - 	int hits;
> -
> - 	memset(rd, 0, sizeof(*rd));
> ---
> -2.35.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-net=
working/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Ma=
kefile-respect-LDFLAGS-for-libreg.patch
> deleted file mode 100644
> index 16800d506..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 1e1a78b7b4fa1662b4447aa19c15b1e839b7e9db Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kl=
ieser@phytec.de>
> -Date: Wed, 24 Aug 2016 10:58:45 +0200
> -Subject: [PATCH] Makefile: respect LDFLAGS for libreg
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de=
>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 2879896..1650db8 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR=
)/*.pem)
> -
> - $(LIBREG): regdb.h reglib.h reglib.c
> - 	$(NQ) '  CC  ' $@
> --	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LIBREGLDLIBS)
> -+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LDFLAGS) $(LIBREGLDLIBS)
> -
> - install-libreg-headers:
> - 	$(NQ) '  INSTALL  libreg-headers'
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-reglib-Remove-unused-variables.patch b/meta-networki=
ng/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-=
Remove-unused-variables.patch
> deleted file mode 100644
> index c6c3c53f1..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-reglib-Remove-unused-variables.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 1bd6ff9d10c83afbc9954fc38b953e9167e6d4a9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 28 Aug 2022 14:01:55 -0700
> -Subject: [PATCH] reglib: Remove unused variables
> -
> -These counters are not used anywhere therefore delete them
> -Fixes
> -reglib.c:1015:15: error: variable 'i' set but not used [-Werror,-Wunus=
ed-but-set-variable]
> -        unsigned int i =3D 0;
> -                     ^
> -reglib.c:1062:15: error: variable 'lines' set but not used [-Werror,-W=
unused-but-set-variable]
> -        unsigned int lines =3D 0;
> -                     ^
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - reglib.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/reglib.c b/reglib.c
> -index 8565a0b..6c62c2c 100644
> ---- a/reglib.c
> -+++ b/reglib.c
> -@@ -1012,7 +1012,6 @@ static int reglib_find_next_country_stream(FILE =
*fp)
> - {
> - 	fpos_t prev_pos;
> - 	int r;
> --	unsigned int i =3D 0;
> -
> - 	while(1) {
> - 		char line[1024];
> -@@ -1030,7 +1029,6 @@ static int reglib_find_next_country_stream(FILE =
*fp)
> - 		line_p =3D fgets(line, sizeof(line), fp);
> - 		if (line_p =3D=3D line) {
> - 			if (strspn(line, "\n") =3D=3D strlen(line)) {
> --				i++;
> - 				continue;
> - 			}
> - 			if (strncmp(line, "country", 7) !=3D 0)
> -@@ -1059,7 +1057,6 @@ struct ieee80211_regdomain *reglib_parse_country=
(FILE *fp)
> -
> - FILE *reglib_create_parse_stream(FILE *f)
> - {
> --	unsigned int lines =3D 0;
> - 	FILE *fp;
> -
> - 	fp =3D tmpfile();
> -@@ -1076,7 +1073,6 @@ FILE *reglib_create_parse_stream(FILE *f)
> - 		if (line_p =3D=3D line) {
> - 			if (strchr(line, '#') =3D=3D NULL) {
> - 				fputs(line, fp);
> --				lines++;
> - 			}
> - 			continue;
> - 		} else
> ---
> -2.37.2
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers=
/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> deleted file mode 100644
> index 9125d0ab9..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/crda-4.14-python-3.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -Imported from Gentoo
> -https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D9c50acec16bc7c3=
3d6dc122c007d713e7fbecf9c
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -1,22 +1,22 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - import sys
> - try:
> -        from M2Crypto import RSA
> --except ImportError, e:
> -+except ImportError as e:
> -        sys.stderr.write('ERROR: Failed to import the "M2Crypto" modul=
e: %s\n' % e.message)
> -        sys.stderr.write('Please install the "M2Crypto" Python module.=
\n')
> -        sys.stderr.write('On Debian GNU/Linux the package is called "p=
ython-m2crypto".\n')
> -        sys.exit(1)
> -
> - def print_ssl_64(output, name, val):
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     while len(val) % 8:
> --        val =3D '\0' + val
> -+        val =3D b'\0' + val
> -     vnew =3D []
> -     while len(val):
> --        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], =
val[6], val[7]))
> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4], val[4:5]=
, val[5:6], val[6:7], val[7:8]))
> -         val =3D val[8:]
> -     vnew.reverse()
> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew))=
)
> -@@ -34,13 +34,13 @@ def print_ssl_64(output, name, val):
> -     output.write('};\n\n')
> -
> - def print_ssl_32(output, name, val):
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     while len(val) % 4:
> --        val =3D '\0' + val
> -+        val =3D b'\0' + val
> -     vnew =3D []
> -     while len(val):
> --        vnew.append((val[0], val[1], val[2], val[3], ))
> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4]))
> -         val =3D val[4:]
> -     vnew.reverse()
> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew))=
)
> -@@ -81,21 +81,21 @@ struct pubkey {
> -
> - static struct pubkey keys[] __attribute__((unused))=3D {
> - ''')
> --    for n in xrange(n + 1):
> -+    for n in range(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> -     output.write('};\n')
> -     pass
> -
> - def print_gcrypt(output, name, val):
> -     output.write('#include <stdint.h>\n')
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     output.write('static const uint8_t %s[%d] =3D {\n' % (name, len(v=
al)))
> -     idx =3D 0
> -     for v in val:
> -         if not idx:
> -             output.write('\t')
> --        output.write('0x%.2x, ' % ord(v))
> -+        output.write('0x%.2x, ' % (v if sys.version_info[0] >=3D3 els=
e ord(v)))
> -         idx +=3D 1
> -         if idx =3D=3D 8:
> -             idx =3D 0
> -@@ -118,7 +118,7 @@ struct key_params {
> -
> - static const struct key_params keys[] __attribute__((unused))=3D {
> - ''')
> --    for n in xrange(n + 1):
> -+    for n in range(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> -     output.write('};\n')
> -
> -@@ -136,7 +136,7 @@ except IndexError:
> -     mode =3D None
> -
> - if not mode in modes:
> --    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], =
'|'.join(modes.keys()))
> -+    print('Usage: %s [%s] input-file... output-file' % (sys.argv[0], =
'|'.join(modes.keys())))
> -     sys.exit(2)
> -
> - output =3D open(outfile, 'w')
> -@@ -154,3 +154,5 @@ for f in files:
> -     idx +=3D 1
> -
> - modes[mode][1](output, idx - 1)
> -+
> -+output.close()
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networ=
king/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run=
-ldconfig-if-destdir-is-set.patch
> deleted file mode 100644
> index 3ef35ee54..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -From: Ben Hutchings <ben@decadent.org.uk>
> -Date: Sat, 23 Aug 2014 12:27:34 -0700
> -Subject: crda: Do not run ldconfig if DESTDIR is set
> -
> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless=
/msg126028.html]
> -
> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> -
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -132,7 +132,9 @@ install-libreg:
> - 	$(NQ) '  INSTALL  libreg'
> - 	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
> - 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
> -+ifndef DESTDIR
> - 	$(Q)ldconfig
> -+endif
> -
> - %.o: %.c regdb.h $(LIBREG)
> - 	$(NQ) '  CC  ' $@
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynami=
c-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-vari=
ables.patch
> deleted file mode 100644
> index 747804d34..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-gcc-6-unused-variables.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- crda-3.18/utils/key2pub.py.orig	2016-06-18 09:54:23.671326113 -040=
0
> -+++ crda-3.18/utils/key2pub.py	2016-06-18 09:54:34.387326300 -0400
> -@@ -115,7 +115,7 @@
> - 	.n =3D _n, .len_n =3D sizeof(_n),	\
> - }
> -
> --static const struct key_params keys[] =3D {
> -+static const struct key_params keys[] __attribute__((unused))=3D {
> - ''')
> -     for n in xrange(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dyn=
amic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-US=
E_OPENSSL-1.patch
> deleted file mode 100644
> index 1bb5c638f..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-issues-when-USE_OPENSSL-1.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 8d2164a090f17286ea8291f30a123595cf447dc3 Mon Sep 17 00:00:00 2001
> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Date: Wed, 30 Nov 2016 10:27:36 +0800
> -Subject: [PATCH] crda: fix issues when 'USE_OPENSSL=3D1'.
> -
> -Fxed the below issues if configured with 'USE_OPENSSL=3D1':
> -a. keys-ssl.c uses BN_ULONG but doesn't include the openssl headers le=
ading
> -   to build failures:
> -   keys-ssl.c:2:8: error: unknown type name 'BN_ULONG'
> -   static BN_ULONG e_0[1] =3D {
> -
> -b. The large unqualified constants also break building:
> -   keys-ssl.c:8:2: warning: overflow in implicit constant conversion [=
-Woverflow]
> -     0x63a2705416a0d8e1, 0xdc9fca11c8ba757b,
> -
> -c. keys-ssl.c: error: 'keys' defined but not used [-Werror=3Dunused-va=
riable]
> -   static struct pubkey keys[] =3D {
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -Upstream-Status: Pending
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ----
> - utils/key2pub.py | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/key2pub.py b/utils/key2pub.py
> -index 401d58a..3ae00b8 100755
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -24,7 +24,7 @@ def print_ssl_64(output, name, val):
> -     for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
> -         if not idx:
> -             output.write('\t')
> --        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(v1=
), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
> -+        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (ord=
(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
> -         idx +=3D 1
> -         if idx =3D=3D 2:
> -             idx =3D 0
> -@@ -60,6 +60,7 @@ def print_ssl_32(output, name, val):
> - def print_ssl(output, name, val):
> -     import os
> -     output.write('#include <stdint.h>\n')
> -+    output.write('#include <openssl/bn.h>\n')
> -     if os.getenv('TARGET_BITS') =3D=3D '64':
> -         return print_ssl_64(output, name, val)
> -     else:
> -@@ -78,7 +79,7 @@ struct pubkey {
> -
> - #define KEYS(e,n)	{ KEY(e), KEY(n), }
> -
> --static struct pubkey keys[] =3D {
> -+static struct pubkey keys[] __attribute__((unused))=3D {
> - ''')
> -     for n in xrange(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-netw=
orking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-link=
ing-of-libraries-used-by-reglib.patch
> deleted file mode 100644
> index 812e98379..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-linking-of-libraries-used-by-reglib.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 890f5bf2654b695a866262d72bfa9750af921a3b Mon Sep 17 00:00:00 2001
> -From: Ben Hutchings <ben@decadent.org.uk>
> -Date: Sat, 23 Aug 2014 12:26:37 -0700
> -Subject: [PATCH] Fix linking of libraries used by libreg
> -
> -The math and crypto libraries are called by and need to be linked to
> -libreg.so, not to the executables.
> -
> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless=
/msg126027.html]
> -
> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ----
> - Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index a3ead30..da2dcc3 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -30,7 +30,7 @@ CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
> - CFLAGS +=3D -Wall -g
> - LDLIBREG +=3D -lreg
> - LDLIBS +=3D $(LDLIBREG)
> --LDLIBS +=3D -lm
> -+LIBREGLDLIBS +=3D -lm
> - LIBREG +=3D libreg.so
> - LDFLAGS +=3D -L ./
> -
> -@@ -40,13 +40,13 @@ all_noverify: $(LIBREG) crda intersect regdbdump d=
b2rd optimize
> -
> - ifeq ($(USE_OPENSSL),1)
> - CFLAGS +=3D -DUSE_OPENSSL -DPUBKEY_DIR=3D\"$(RUNTIME_PUBKEY_DIR)\" `p=
kg-config --cflags openssl`
> --LDLIBS +=3D `pkg-config --libs openssl`
> -+LIBREGLDLIBS +=3D `pkg-config --libs openssl`
> -
> - $(LIBREG): keys-ssl.c
> -
> - else
> - CFLAGS +=3D -DUSE_GCRYPT
> --LDLIBS +=3D -lgcrypt
> -+LIBREGLDLIBS +=3D -lgcrypt
> -
> - $(LIBREG): keys-gcrypt.c
> -
> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR=
)/*.pem)
> -
> - $(LIBREG): regdb.h reglib.h reglib.c
> - 	$(NQ) '  CC  ' $@
> --	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^
> -+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LIBREGLDLIBS)
> -
> - install-libreg-headers:
> - 	$(NQ) '  INSTALL  libreg-headers'
> ---
> -2.7.4
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/r=
ecipes-connectivity/crda/crda/make.patch
> deleted file mode 100644
> index 0b737852c..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/make.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -These headers are not related to any Make rule but they do appear in
> -compiling of libreg.so, specifying .h files in compiler cmdline is fla=
gged
> -as error by clang
> -
> -| clang-4.0: error: cannot specify -o when generating multiple output =
files
> -| make: *** [libreg.so] Error 1
> -
> -This is how we see headers in cmdline
> --O2 -fpic -std=3Dgnu
> -99 -Wall -Werror -pedantic -Wall -g -DUSE_GCRYPT -DCONFIG_LIBNL30 `pkg=
-config --cflags libnl-3.0`  -o libreg.so -shared -Wl,-soname,libreg.so
> -regdb.h reglib.h reglib.c keys-gcrypt.c -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed -L ./ -lm -lgcrypt
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/Makefile.kk	2016-11-15 04:54:53.338670000 +0000
> -+++ a/Makefile	2016-11-15 04:55:07.718670000 +0000
> -@@ -114,7 +114,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
> - 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
> - 	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
> -
> --$(LIBREG): regdb.h reglib.h reglib.c
> -+$(LIBREG): reglib.c
> - 	$(NQ) '  CC  ' $@
> - 	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LDFLAGS) $(LIBREGLDLIBS)
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-netwo=
rking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-targe=
t-word-size-instead-of-host-s.patch
> deleted file mode 100644
> index 100b765f2..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/use-target-word-size-instead-of-host-s.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c1c42513edd27c97341f2033af77c13a4724eb8f Mon Sep 17 00:00:00 2001
> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Date: Fri, 25 Nov 2016 16:48:01 +0800
> -Subject: [PATCH] crda: Use target word size instead of host's.
> -
> -In key2pub.py, the codes check the wordsize
> -of the host machine but not the target's, this fix
> -fetches the wordsize of target from the build system.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ----
> - utils/key2pub.py | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/key2pub.py b/utils/key2pub.py
> -index 3e84cd2..401d58a 100755
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -58,9 +58,9 @@ def print_ssl_32(output, name, val):
> -     output.write('};\n\n')
> -
> - def print_ssl(output, name, val):
> --    import struct
> -+    import os
> -     output.write('#include <stdint.h>\n')
> --    if len(struct.pack('@L', 0)) =3D=3D 8:
> -+    if os.getenv('TARGET_BITS') =3D=3D '64':
> -         return print_ssl_64(output, name, val)
> -     else:
> -         return print_ssl_32(output, name, val)
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda_3.18.bb
> deleted file mode 100644
> index 2f4d4dac9..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda_3.18.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -SUMMARY =3D "Wireless Central Regulatory Domain Agent"
> -HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA=
"
> -SECTION =3D "net"
> -LICENSE =3D "copyleft-next-0.3.0"
> -LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D8743a2c359037d4=
d329a31e79eabeffe"
> -
> -DEPENDS =3D "python3-m2crypto-native libnl libgcrypt"
> -
> -SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP}.=
tar.xz \
> -           file://do-not-run-ldconfig-if-destdir-is-set.patch \
> -           file://fix-linking-of-libraries-used-by-reglib.patch \
> -           file://fix-gcc-6-unused-variables.patch \
> -           file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
> -           file://make.patch \
> -           file://use-target-word-size-instead-of-host-s.patch \
> -           file://fix-issues-when-USE_OPENSSL-1.patch \
> -           file://crda-4.14-python-3.patch \
> -           file://0001-Make-alpha2-to-be-3-characters-long.patch \
> -           file://0001-reglib-Remove-unused-variables.patch \
> -"
> -SRC_URI[md5sum] =3D "0431fef3067bf503dfb464069f06163a"
> -SRC_URI[sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb194a=
fa7aa921b01e8ecdbf"
> -
> -inherit pkgconfig python3-dir python3native siteinfo
> -
> -# Recursive make problem
> -EXTRA_OEMAKE =3D "MAKEFLAGS=3D DESTDIR=3D${D} LIBDIR=3D${libdir}/crda =
LDLIBREG=3D'-Wl,-rpath,${libdir}/crda -lreg' \
> -                UDEV_RULE_DIR=3D${nonarch_base_libdir}/udev/rules.d/"
> -TARGET_BITS =3D "${SITEINFO_BITS}"
> -export TARGET_BITS
> -
> -do_compile() {
> -    oe_runmake all_noverify
> -}
> -
> -do_install() {
> -    oe_runmake SBINDIR=3D${sbindir}/ install
> -}
> -
> -RDEPENDS:${PN} =3D "udev wireless-regdb"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100653): https://lists.openembedded.org/g/openembed=
ded-devel/message/100653
> Mute This Topic: https://lists.openembedded.org/mt/96373850/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[kai.kang@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux


