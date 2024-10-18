Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEC9D3C556
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:19:17 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.120])
 by mx.groups.io with SMTP id smtpd.web11.17108.1729235952320920751
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 00:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=xE4msjMr;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.193.120, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwKffrlqT8EpVuIFEwzQ8N5Sf/todDCrLmbM5Nbq8zksqWtoZL6+DLV+S+UjEO+ROocCBr11O78Wbiui6lLtSxor7p0eYlLIjHxXcNERzx8WWD5w/b60tKu6oouJqmoMWtAnJIGHTeDH72GAdiWP6c7l3olXEsajTghoYlah+RThRAVDXGO+StQjXw8KpNF3qWfaEepJNOesIxXQFEQuzOZ05bMy0675T3KupghBIIEDfcmQ+LmJY56uT2fFl7SiZ2JT2D/jK1NVXE4EfvyNpaox9GdzG3sO7mxMohZsl24IUMlYHVlyQc8C2wgAote/w7KrMG21bBDe2rc9HxKv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viFQrVZRRuXMKE0c8H0aw9pLLYzAltnzafVg7fRAWmo=;
 b=cbdheeVv3W6sqp5fcW1y+ZOBdli5x95A55RaUPBiJD0qRDc0XGxaRddEPyUv+lI/pIPQSdKnynvdXQwBO8qzcgk7G8DYXu/QLhwbv9m9T79j7nf/VFM+rTgOBfxpb2HTGPYncyGfUI0wKUX0yTJs0V3vDQN5VIKnpsmky3tTIT2o0fuIY+Jb3Nv/cNMI60h61gB3yw3C/SuHj6cj9YukDze5H7xHsj3MIDreG/BqAMkMh8DPyNKKHt7BVW1eFtUx7WnY9XKO+kkVC2hflD2VZoYUbCQW4o+b8LXFc7HvhWUnx3IRhAgG8AjmdXPPAOTZ4ek0AQiMwa24f/NJwk2cjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viFQrVZRRuXMKE0c8H0aw9pLLYzAltnzafVg7fRAWmo=;
 b=xE4msjMrfx321ej0dY2bU9dhlkktiwbtJm3jdFcYZPls1a/T8TkC2/UIIzJZbI/4v8ICu3wXFSMUz8Nfs1OG6ry8CO4ygtm4u5iGbqNTA9cosTCWkQE4dUkNqaTH6BLsEoAITKpsha75jwc3ftP0cbuV2kuNKrRggUC1XRipFwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DS1PR01MB8848.prod.exchangelabs.com (2603:10b6:8:21f::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.23; Fri, 18 Oct 2024 07:19:07 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Fri, 18 Oct 2024
 07:19:06 +0000
Message-ID: <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
Date: Fri, 18 Oct 2024 14:18:58 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: raj.khem@gmail.com, Chanh Nguyen <chanh@os.amperecomputing.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TY2PR06CA0039.apcprd06.prod.outlook.com
 (2603:1096:404:2e::27) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DS1PR01MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: e86bb8c5-2ece-41cf-13a0-08dcef4526cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LC4U4uco9NohLxVlD8/SkfTUSFD7cjwp2NdKXEQLqrOcNJLOiTXvbEz4eSir?=
 =?us-ascii?Q?4o8v3WQpxIT0QDwZekzImXq5NhOVapgmbeFq/L7yAlLOtcY2PG6gBXieYGod?=
 =?us-ascii?Q?yOwQ/SUpmzfJSgNiegJEX/Ofmy4DMxVSztsr8Z5M9C1P6ct0rIvsOQPLDMIF?=
 =?us-ascii?Q?ZSNWHYNGmqrQr423PqS05I7bPCOebYSIqTce4A4v2AGbkDWR1fEzeEwaDYEb?=
 =?us-ascii?Q?2onLtE+9csKye9uhG4N4yAaDHtRc14VB6XIpGIToBbgTZz8dZD/LV41srXAu?=
 =?us-ascii?Q?O4j4xLHrv73k8tKCBY3ek5zui6dkplIjqqSfPfwCamW9r/Ubz+dgHEAGEYtn?=
 =?us-ascii?Q?3ORnJSLAAIatTgiNGsEhuclw2bUaS50kjAWa5VVMLBtYkSeYlcyjFVf5kaN6?=
 =?us-ascii?Q?xva/m4xxBhh84oMq008msIr4oumm6v3VxjcTAQ21OicUOENQQv8hB2uzjQgP?=
 =?us-ascii?Q?d9YOa5VJWkEHqL++qzlEfl4H7sPLri79T003CaZrd9J+MT2p3wsvCw8FVDfQ?=
 =?us-ascii?Q?N33Rig3J8onHyQlnl5L3vc++AWR5D51DSisiSrsh1tlIhUh81xooWRilKO9f?=
 =?us-ascii?Q?4p1TkH72fVMrV+0hf99JbQy6LuB64N+TdkNPq9rPdwzjNzz6W7NoZRKgbI3e?=
 =?us-ascii?Q?Y0anVLkisrZZw8yPfvyla7BlR3RMCE6wsRTl5S6oUtzNb4ya2V3an3KrK+ct?=
 =?us-ascii?Q?sh6Vre0Ix0feFV5f9O1udXIdgDmS9A4sfpSyOJJ2RPdk7pRTWMmkDCgLSkv2?=
 =?us-ascii?Q?36m/i8qW4EaG2xgW6CD1okcMlHk2h8FXWRmAxlA69PF/HZa8x2ogYXNKfEUn?=
 =?us-ascii?Q?a2lqZV5WsqBFMxpNF9GVs3ZcPeJnn109IYkJwKJMqWL788XMWfx48zhWl1vM?=
 =?us-ascii?Q?J+Yx8Uix5D1utQxRMagbCRSQyc/8N7gNhCmsX6/5KVE73SqackU5lr4gkscs?=
 =?us-ascii?Q?IO0VSFYXr6ItnpGv2h/3emaviU0VfUAlchqmmBRLRe+p0BQzYDXZcLPBkwdx?=
 =?us-ascii?Q?reFyKsut9Abo7r5NXK/AnXvjgk6JhVkWtWmZQOI0TE7E6UkmzGzl3dADO3Z1?=
 =?us-ascii?Q?RSmRjrdTB+D/m36yndy/t1Cpai73C4qDIMmg0UljVh4TQ1msO7Bcu6ak+O6G?=
 =?us-ascii?Q?CWj1z1JI3r6WM/3hKTYQ2DOckBtIMzKMO7QqB6ScoxAnSW1tckF7Got8t+In?=
 =?us-ascii?Q?yzZQ5iPQsmyUVR8qM+VV453UI9BECe2B0+WpEbU3kzI/u4QbFnqk76nIawpV?=
 =?us-ascii?Q?w5NkUf5goXSzPgmrCMX81PBU9m0ZrfMm8L7JgKY4qQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sIfFNBhHC4qJet1EHopOCOpX7+MlJVfwhArTwPac6awCrQo/vRYWbd6ziqHh?=
 =?us-ascii?Q?b9bxQEWR/UZK0lXmHSGfMB6nTN+xmPy5mMdETl2q9GXDHYbHSYMTo0z7gqbT?=
 =?us-ascii?Q?EEp2FI+HfwUyZ5pq3g0IH/jfTSulX0axhY378hS0n1qzVbwwtrLqqxDpVjnC?=
 =?us-ascii?Q?A5914HKbYr1x1gSD3XHna++siBsTdoIDF4oqKYhZNTfh5XIo0Bm0qQL16HvY?=
 =?us-ascii?Q?SOonsZ2QenKcgQ/s9kJEfs4CKefAPUMx233UUuG86TzUpRJwXHQ4z/CSj22W?=
 =?us-ascii?Q?ZZ7x6uKrEKMQ3pmLW15okKImUcnFdcQB3k3LzmaIfDjsWaUnQ/tG8793jcTt?=
 =?us-ascii?Q?p5B3xwLWjIQaBiDTw1El571IFEsLuken4Zzz+QJj7hf7pll7r16Wut0WYXlT?=
 =?us-ascii?Q?2jUk7ynt+0gA9muet2KYwUz3a5B8W7NizhG7M8dhNUaBXFHd7b9CzAHXWO/2?=
 =?us-ascii?Q?bf8pOf0JyPvnln8BdZSAzw0KXg4PZkQLDu7Zm9JsG9iuX+ZI2lCP892pWMZj?=
 =?us-ascii?Q?yo1hxkebvudaYDwJc8LZOFYUCec5l2DrKdmQj47kU2VEfpv7ZKFqhmMoo+vW?=
 =?us-ascii?Q?Wb7wmu9AFJanptIZp/WyPgpm38h8KLd2HYl1Z8fQO7VDoYs/lVFfGvj2EUV8?=
 =?us-ascii?Q?/tDvZP4CjC/IRAGrSThWubEF/44UFMO0YRjYlMUy33QaPhqpDhV2yhTIoSco?=
 =?us-ascii?Q?p8FGdGjTt1M/RGhD8Ah7be4Lz3nALCySmTVUbVP085Oej5R7I/ZNRPaeVsHY?=
 =?us-ascii?Q?nkagUDyZUdoqnkzgjuMOPSdjEs5UH1CMOs4UccfJIs5/pvxkTQ/5sDfHHtdp?=
 =?us-ascii?Q?E9OxcGyoNQZ/N2tIp9XREC2SY5mXTQiMk2QoIyjbnpgjt6Uhg4XR75FFAHei?=
 =?us-ascii?Q?V4dFfMTHpNRejvBV3BAQRFHQiatHJGQiZKFR/Za3m8aUH5W7QcyDLt291mzC?=
 =?us-ascii?Q?yXCPUWrJWki0IcmwAj/BhxH0zLL8TGvym7xFL5gr+JCiJ8JEh2ZdNeFULarS?=
 =?us-ascii?Q?Lzd+10H2Wa6fxsnQCbP3zDJAhKrHOkXERu9o0fmcKvKORBIbBjFuG35pJfsc?=
 =?us-ascii?Q?79kpea+Xyxf30ZD6AP4HNppa8Sar5AbBpXMXqELFSbhxZEsp4xier882UuKF?=
 =?us-ascii?Q?LtJ55G9I9oHDTjy8u/w1/cAa2pLFN6M24s9VKcolGA1fmJEzOgiiZTSDuYCQ?=
 =?us-ascii?Q?7IVdqUzyb3p5V1iKXLoFZEm/uMT5b+PCMeI0QdAvdpD1vB2+u1YKFQmVSiJc?=
 =?us-ascii?Q?7zHOQiKdX0RdoIYDLnoBqIe4XWL6pYsDTGlj5a64Sirgds582VVLXxLijDuN?=
 =?us-ascii?Q?YLfmmb2SWM89Xza7WSAqZGVWYZgSW/dUjPHTOE35lr+oNVU/ro8xbDSfrZoW?=
 =?us-ascii?Q?iuBhCMyrezTie9LysQ+cUArx2H/VYGR02diYRnAR1d0zJJpBrVul1C7fld95?=
 =?us-ascii?Q?lNw1X5bEW+l/qQ9jvKd9qJ9WfiMIRanWul3nnBBhXof7c2pxDaQgNuwXwB91?=
 =?us-ascii?Q?R9sbjLUgPLmEjanJjE1mxcOJrq4XSY85tBugH9u/I4QHzMpxEOccmqhPd71u?=
 =?us-ascii?Q?/o4urPe01qluSU8gNMD4+1MtZPV/bZgKnomxmCIcrCxMl+fWE4SK3JFmjOar?=
 =?us-ascii?Q?qtvYU0zwsAOXMqYfxY50LE0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86bb8c5-2ece-41cf-13a0-08dcef4526cb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:19:06.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGSU5i1PNKbbP16DoMn8rth0ggvAtfXynNKKK5sL4B8ewAGfCwRouuxGapF6XBI/9WBbbAoyCEGh7uWvGxyIRXy4wqOhUgpTiFKBx8Nu2lZG8ZyninJnoawieWdqw8Ji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 07:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112974

Hi Khem Raj,

Follow the error log, I tried to use the musl cross compiler=20
(https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp and=20
report error to mctp maintainer. Jeremy fixed this error by commit=20
https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805f647b=
f35f4bfd3b=20


Now I'll push the patch v3 with latest commit from mctp repo.

Khem Raj, How can I run CI on meta-openembedded manually? I would like=20
to verify errors from CI failed before push patch. That will help us=20
work on the patch quickly.

Thanks,
Chanh


On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
> ok, now it fails for musl target see
>=20
> https://errors.yoctoproject.org/Errors/Details/809802/
>=20
> maybe you need to include linux/socket.h to get AF_MCTP address family
> definition
>=20
> On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
> <chanh@os.amperecomputing.com> wrote:
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>> Change in v2:
>>    - Fix CI failed                              [Chanh]
>> ---
>>   .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 ++++=
+-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>   rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0=
.bb} (93%)
>>
>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-net=
working/recipes-support/mctp/mctp_2.0.bb
>> similarity index 93%
>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
>> index bf3961be4..62044e007 100644
>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>>
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc6=
1db21"
>>
>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>>
>>   SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protoco=
l=3Dhttps"
>>
>> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
>>
>>   inherit meson pkgconfig systemd
>>
>> +EXTRA_OEMESON =3D " \
>> +    -Dtests=3Dfalse \
>> +"
>> +
>>   PACKAGECONFIG ??=3D " \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>   "
>> --
>> 2.43.0
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112970): https://lists.openembedded.org/g/openembedd=
ed-devel/message/112970
>> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
chanh@os.amperecomputing.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


