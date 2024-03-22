Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD2AC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 00:55:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2520.1711068943503418594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 17:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mgtfijlz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3811b56465=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M0thpk012787
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 17:55:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=ePu71hCNTdnD2cvQ2BS
	g5pF/0IAZENsXri+Z+n/kxsE=; b=mgtfijlzeXctbMA0U4uFWRfVAZyOKx21k9m
	Re8QXUd40sXVWEZ+nAxEfXzP7epUxy3M6xS09vJqHrbzQ+WBlshK7H7HtGUlnhKD
	vGCwqTig89Aa/hUDlq5Rfg/IJZ8PhVyAb0twRN/UIiQUE67oTopLL1nJRZnpIM21
	cdvY8be9R4PWbZfQWT1vMBhZWupT6ZTgFILfnA3t6oOc24mESwNsa4NDQIi3a8fk
	f3AXR3UIZ90/9XgdoH/FV651XaPwu4aTtznaFsJQmySf6uZPNENTm2J8syjdXcY2
	XZR+ofGujsqFe1zqMH0RSu7IiEMSAqo7J0ytPKHlVTweSY7srPw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x0yuj001c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 17:55:42 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 42M0tgWt012741
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 17:55:42 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x0yuj001b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 17:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyCdDQyCXY8N1Vt/4II/Wp8QPmwNmnlzd2nFoeYUWZYa2PKZuu7tUh9+twAK8hT4HNFByuOWy6ZevOFJ5Fd38OpnV+LX7Ngy0fMQ7tLiVsK7PpVRqiALo7EiEkD0XJ/KmCLiF53WpwI/6vBJMaFIccev5ZQX5rBQTFvHcWjVHHWELYzW915Pih+jsnTvVVM0a2hFE+fxjMIIPGrmUjjCSRoORVwx+Ywhulp7rVKgMIUuXmHFogJwUHVwSpVzoaPHRNk1RTNCmsrjYQW8Khsd0NUKuXdyYSwbd2HMBHT1epWZ1z3avM4pfZvea2ymX/5XTaCE6VC7NuOHTVRXOYM3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePu71hCNTdnD2cvQ2BSg5pF/0IAZENsXri+Z+n/kxsE=;
 b=FjJRrnw5mDtxl2eiJa1L2QYA5ZvK9VAcXuCHRFbk3UWBaJkVUbZIgysiyxQpf8RUKMEVQanjlzTQ9vCQGqUxREtJ1jiNO4kz4pF4fPAeoFOFAiG0KTERtMhd5/3SrUIkyW/DouC2sKNn9gPQp8KbwpQkJu5CfFzFZ8n/fclWIJbG8tSy7y51+8/SiiaAS1zpBjztCnbw606+Ku6g68SxyKGcX1JZLiNy8LCj9l7tVjH2J2AcdPlJRqoN+o+BZr5TQUiOzCGlqasWpBWiEuhvlCe6OAxhXhxFPnyjdO7FBlf+UU6Btna0UcN6ExjT1+pwqOqAVrK4Y2hppkKZFY/RoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Fri, 22 Mar
 2024 00:55:38 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7386.017; Fri, 22 Mar 2024
 00:55:37 +0000
Content-Type: multipart/alternative;
 boundary="------------UeTT4P2B83VXp6QZLK5pb4R4"
Message-ID: <32b9a223-6f69-4ddc-98b3-e5a94d70080b@windriver.com>
Date: Thu, 21 Mar 2024 20:55:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status ->
 LICENSE change for 7.4 and later !
Content-Language: en-CA
To: martin.jansa@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
References: <20240130103458.819774-1-martin.jansa@gmail.com>
 <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com>
 <CA+chaQcHdgbVOORRdeErRXT2FM+7QcOidaHEanskrqrocFN7xg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+chaQcHdgbVOORRdeErRXT2FM+7QcOidaHEanskrqrocFN7xg@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 11eb0e97-2534-402e-f028-08dc4a0ac9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9vn6Xt8E7FKW/ywAIeswkV5rPnOGRYuxeC6bksiYI52uSLcSNggEuQuN+P642BmyRKuV7OCaXmF45pibHHGbzApCeQzvc6EubrvYZQpusB4zeIbraEaBmfDvTHVeGgmy/yCJPvreB9VYfM3nTyw2DrXQ782MmS5q1YQ/y+atUGk4jYVfnsL01tP1tC9Zo+Bu/XqvuztHFoRSvMIm95lCepWHmngBtSBhK8IPWEbRGFkEXaBVLLjYmJxqDQAmXTGVKPwMTX1vlzoMQXaXkYznsBCfwIPtGGYyOyYOnvmqj8MWSNMrhIjZw/2XEWpG/1isylmzO19TWCkMaxeiWiQ9C3BSlhttj85AR+BdCJz3oZjrTOxy/vEnDqY0Zque+ES5l/bX2HZrX0U9fIscV+pcp17qyd4JwSPPMmXuqLGDiFqw2+8tkx2zt1ad9o+Pr7UAYMZfhuQ2br5LOyLIAB83PcLCx4qJDoEnVqNqtFgPbnku7f3/sfY1hBznPoMg1n32gIeyyZDsgjfyFlaNsHj744HGSwTbyQvtJkNIclf4ACncnf/Euitl31ysVsFoLMWwVGSuxTsxXGfVLXHW7Taqyyvq7irVAhE6Y2GkZnZrRFw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkNGR1AwSjA0cFBkV1BCbmNSUERGUU1wN2RxMzBqbmpYKzFNMU1QbVV3SjJy?=
 =?utf-8?B?MWhwbldJRHVqc2RadnV0eU1JMWN4WEFXd3pMWUlua2NaZWpxY1NON0pRdWhk?=
 =?utf-8?B?SjlHR09sNjV2YmQ4VmNlSjR1eEQ0Vng4cGdOWXF4SUllZ3VhM2tvVWlYNVFv?=
 =?utf-8?B?U3hJWGFwc21jRTAwNXpJc2E4cUJCY0FibTFMRElEUVB1aUdQeDlOUmt1Zmo2?=
 =?utf-8?B?MkdyNWRxaU1OKzljZlE4YTNacUcrM2ZmeGk5czJqaHJ2R3BjV2FlUXplSXRn?=
 =?utf-8?B?S1IydEx4U3pNbkFqVXh2YXpXLzUyTE5pY0VpZi91eVQ4bDZhZWdoaUtCd3JW?=
 =?utf-8?B?ZWwyN0Q2UGNvL3ZiYnlrV3lzTDZQUGtTa1N3dXhUcDcyRGd3d1dmeUdoQnF1?=
 =?utf-8?B?Wnp0ZFpIWExuVk1YcVhOQkUyNXZJenNMdDQ5OWJTZ3BvR1JQVjU5akIzZFJs?=
 =?utf-8?B?Z1BsQlRXNE9ndEpqUWpWV1ZNRVJOcm1TdUgzZ2lheGM0MDBkb3ZqNE5OeThY?=
 =?utf-8?B?c2sxbmc5YTBJbGt5NWZlNWNIbDlkM2ZPaURja01lcTdxNUhBRHZRVnZwMTVH?=
 =?utf-8?B?cGR6VFVQbFdQS2w5dGF0RGhnam82ejVDN21LeTkzK2VXYy9PUS9DbWpOajRk?=
 =?utf-8?B?VEtRMjM1NTdHbjdXRXRQNGl2M0J1NUFOTnlIR2Q5Vk1meFprSkZROFQvek9n?=
 =?utf-8?B?SHhvWmNEWG5Hd1FsajJMdlkvMk1KZGJYSnNYNEoxWlpVaEQycXVNK0hPY004?=
 =?utf-8?B?aEo5YU5XNmxvM3gxNmdUT01nWDhEUGd5VGZuUllSMHAyK01neU9WTTFuRnFX?=
 =?utf-8?B?a2hzK2YzYnhMWnRyeUFIZGx2MnMwNFN2TC9xb0FnZ0xEUzlTb2pDUVVUeElz?=
 =?utf-8?B?NTNhb0dyQVhXQWlpaGhET1lGTkQ3aERjbXFHLzQ1UGkrYTZ6c3d4OEFqYW83?=
 =?utf-8?B?T1RLeGNLRndJb0ZFejVCN0crTkU1VWRzOVYweXZuL3lwMm1VWFUyaGJQQ1Rs?=
 =?utf-8?B?aXNKWlVrQWh3VC8ra3BkQnN2UHBQR095SnBNYzB1dUY1SHpwamVkV014S0RQ?=
 =?utf-8?B?OW9pQ2l4MW5MRFBwMlJoTXByYVFkMUhsNXVLL2FZYTdobnp5QXdYc3M2TjBU?=
 =?utf-8?B?angvOVgvMkhnY2kyeHAxMlovRll4eWl5LzdtcHJYUmhRM1Y5T0RndUFZV1Q3?=
 =?utf-8?B?c01vbGdOVnZPelZZd0JRWFZXeS83U0NHQlordkNRWnh2aTU3M1ZGbWxZekI4?=
 =?utf-8?B?ZW1id0ZLd1dORytDRGpZWGZzeGlJSGltWmJ3dlV6TGhQWjkzRE1Qcnp6cmRy?=
 =?utf-8?B?dTJtalZkR1VrWU5rN1lyc3h3c0llY2Y0VVQyN0pZc1hwMmNxSitpTzlyQUd2?=
 =?utf-8?B?U0FFbmNvYjVwa0FjK3N5N21ra3lxelptejl4NGVuWkEvQkdMeFZmOTJKUTQz?=
 =?utf-8?B?dFJVOU1sQVdQWTBvTHBsYWhkcXp4UjNHMHVSRlFLUEdVSVlCYWd3SVZaMEg3?=
 =?utf-8?B?QzNUZ1FCN1k5aUZJN1JPSFp0TGdmZThJUDdmNFhqTlp4ME9GN1J0TUpZenEx?=
 =?utf-8?B?RXI2MnZqOWxIb2s1UUhsc216UDZqRzNXQ3ovVU5DMXFpbzZGcTBZK1M2UUJS?=
 =?utf-8?B?b2QvYjVyTUx5bWc2YU4wQUZYTXVGTC9lRmg4NGNnMnUyb2hLdytoZG5LSkNp?=
 =?utf-8?B?bStkang2aGE1alROdHkvcC9vNkZoOWNWSU5zK3lHaXNPQzFmMWZPSzA3S0N5?=
 =?utf-8?B?NW9RWjcxb1VNOHpsckZacWFpcFc5elR0Z3N2cUNqR01kNGs0ZlppcEhYUHdv?=
 =?utf-8?B?TzVLVGRoVlFDOGVlaHlZL1ZURTdnUVFQMlJDL09sRTR2NUE5WDc0dnZsczZn?=
 =?utf-8?B?dkZnek9vTDVDQ0xFc3UxR291WGdjTWx3aHdsd3BFU2RuNHcveFdkOGxTZitC?=
 =?utf-8?B?Nk9sYWxuRVdQS2pjRGlmeE1CaWI2K25wZDM1a25NOFAzZTRTNkZnN1BUSFRu?=
 =?utf-8?B?cjJkQTViaG40VlZsYThyN0hMcnJVaGowTldkRC9ta214RmVkZlR5V1JGVkJx?=
 =?utf-8?B?bG05aUVPdGxaQUNTcGZ1Q3ZtZm5YL0RyTTNQMTZLNldXUUJpRlZ0emNxMUdv?=
 =?utf-8?B?NzFCdlNNM2RZbHZidkI4aWt0cHNpZW5mdGFTejZHN21XTVJXRVdXdWNxR2g5?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11eb0e97-2534-402e-f028-08dc4a0ac9ef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 00:55:37.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJYTo3ClRn5vgcVCVx1/SvKACEuAt0gJ7jfzmNDAoz0YQrsotPbCAu3UlJ/SkntXnWCu3Q1N/32Xut/O+LXBfg4Y4QpLxT/UrPHmAL7fC/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
X-Proofpoint-ORIG-GUID: kriFmczc_RZvMlAPshTa_KQ0UdPrDbc8
X-Proofpoint-GUID: Mfa2lTjTFBkuJ9qeFOwB_BOnG-RoV47A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_14,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 00:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109507

--------------UeTT4P2B83VXp6QZLK5pb4R4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42M0thpk012787

Would the new license scheme described here:

https://redis.com/blog/redis-adopts-dual-source-available-licensing/

prevent us from accepting the 7.4 release? I suspect it should but I=20
need more time to
read the new terms.

../Randy


On 2024-01-30 1:23 p.m., Martin Jansa via lists.openembedded.org wrote:
> On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
>
>     On 1/30/24 2:34 AM, Martin Jansa wrote:
>     > * accidentally dropped in:
>     >
>     https://git.openembedded.org/meta-openembedded/commit/?id=3De91fa66=
8ed1dd4a3f6b06bcb099f70dbdd2a50b4
>     > ---
>     > =C2=A0.../lua-update-Makefile-to-use-environment-build-setting.pa=
tch
>     | 2 ++
>     >=C2=A0 =C2=A01 file changed, 2 insertions(+)
>     >
>     > diff --git
>     a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to=
-use-environment-build-setting.patch
>     b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to=
-use-environment-build-setting.patch
>     > index b562e2522c..48a8bb5b4b 100644
>     > ---
>     a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to=
-use-environment-build-setting.patch
>     > +++
>     b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to=
-use-environment-build-setting.patch
>     > @@ -16,6 +16,8 @@ updated to work wtih 6.2.1
>     >=C2=A0 =C2=A0Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>     >
>     >=C2=A0 =C2=A0---
>     > +Upstream-Status: Pending
>
>     I think it might be better to move it above the scissor to avoid
>     getting
>     lost in next devtool based upgrade.
>
>
> As you wish, resent all 3 as v2 with it moved.
>
> FWIW: in=20
> https://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e236c03b=
44cca5b38e9d9eb2fc=20
> I've moved all Upstream-Statuses in LGE layers bellow, because too=20
> often developers applied them with Upstream-Status into the component=20
> source git repo where it doesn't belong and then it was already too=20
> late to remove it there (while with Upstream-Status lost in=20
> rebase/devtool there is still time to get warning from QA check and=20
> once this check is enabled by default in all the builds it will=20
> prevent people overlooking this by accident).
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108499):https://lists.openembedded.org/g/openembedd=
ed-devel/message/108499
> Mute This Topic:https://lists.openembedded.org/mt/104051095/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------UeTT4P2B83VXp6QZLK5pb4R4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42M0thpk012787

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Would the new license scheme described
      here:<br>
      <br>
    </div>
    <div class=3D"moz-cite-prefix"><a class=3D"moz-txt-link-freetext" hre=
f=3D"https://redis.com/blog/redis-adopts-dual-source-available-licensing/=
">https://redis.com/blog/redis-adopts-dual-source-available-licensing/</a=
></div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">prevent us from accepting the 7.4
      release? I suspect it should but I need more time to <br>
      read the new terms.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">../Randy</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-01-30 1:23 p.m., Martin Jansa
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQcHdgbVOORRdeErRXT2FM+7Qc=
OidaHEanskrqrocFN7xg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
            1/30/24 2:34 AM, Martin Jansa wrote:<br>
            &gt; * accidentally dropped in:<br>
            &gt;&nbsp; &nbsp; <a href=3D"https://git.openembedded.org/met=
a-openembedded/commit/?id=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">https://git.openembedded.org/meta-openembedded/commit/?=
id=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4</a><br>
            &gt; ---<br>
            &gt;&nbsp;
            &nbsp;.../lua-update-Makefile-to-use-environment-build-settin=
g.patch&nbsp;
            | 2 ++<br>
            &gt;&nbsp; &nbsp;1 file changed, 2 insertions(+)<br>
            &gt; <br>
            &gt; diff --git
a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch<br>
            &gt; index b562e2522c..48a8bb5b4b 100644<br>
            &gt; ---
a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch<br>
            &gt; +++
b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch<br>
            &gt; @@ -16,6 +16,8 @@ updated to work wtih 6.2.1<br>
            &gt;&nbsp; &nbsp;Signed-off-by: Yi Fan Yu &lt;<a href=3D"mail=
to:yifan.yu@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">yifan.yu@windriver.com</a>&gt;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;---<br>
            &gt; +Upstream-Status: Pending<br>
            <br>
            I think it might be better to move it above the scissor to
            avoid getting <br>
            lost in next devtool based upgrade.<br>
          </blockquote>
          <div><br>
          </div>
          <div>As you wish, resent all 3 as v2 with it moved.</div>
          <div><br>
          </div>
          <div>FWIW: in&nbsp;<a href=3D"https://github.com/webosose/meta-=
webosose/commit/2c78e37ad9ceb9e236c03b44cca5b38e9d9eb2fc" moz-do-not-send=
=3D"true" class=3D"moz-txt-link-freetext">https://github.com/webosose/met=
a-webosose/commit/2c78e37ad9ceb9e236c03b44cca5b38e9d9eb2fc</a>
            I've moved all Upstream-Statuses in LGE layers bellow,
            because too often developers applied them with
            Upstream-Status into the component source git repo where it
            doesn't belong and then it was already too late to remove it
            there (while with Upstream-Status lost in rebase/devtool
            there is still time to get warning from QA check and once
            this check is enabled by default in all the builds it will
            prevent people overlooking this by accident).</div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#108499): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/108499">https:=
//lists.openembedded.org/g/openembedded-devel/message/108499</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104051095/3616765">https://lists.openembedded.org/mt=
/104051095/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------UeTT4P2B83VXp6QZLK5pb4R4--

