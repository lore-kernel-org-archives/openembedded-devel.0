Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA66D3C938
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 03:02:45 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.122])
 by mx.groups.io with SMTP id smtpd.web10.38231.1729479760401043249
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 20:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=8efsx3BH;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.193.122, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI2Li2lIZ7yE3kHHfuYKAHUsUG+f2gHoVEMDsuFdjIuEpr4zAsiFn0tWh5kTdXOeKlG8sof+DnYUOazsAikLfmyctmQourYU5uup52wWYdVhsH1Ke1kBTaMyImO759TKcZwfsUgVSq/F1ximL/Hb7bgA/QDtIgq2W8QYsPIsrTfSO2jJPpkZ70lGoWRx3pfLoNEj/1CBYb1PYiaENs6V9UIfqCARBAsJ+KrSaC/fr5SjK0nmTvlqb+11PdJXSe6eJBGBcirSxPDWnOQ+3BgBHqQuumDRdH7L8HQb7PldeWrJ46JgYIzJyOJ3N+Z76+pTo+hFyjZgRMaCOPztcaPpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y8rgc4R7RwxjNeH+W+92sxGMbkWLYu7cPegTCryiT8=;
 b=HVO3fc1b88CQ5caqH8UXn974xJqJMoT8PbYqEcVcA6AZhHdqaBhK8g+EZytxa6GWr+oV+zncA6Gjdw3ZsxEDkTcrr1klM2w1B0SeWZWF7345T60q4gH0SgdbjwZl3Qz8YnGvn4iGYKHAe5ZKvfsrIO/ATXUKeBV779JxSjXpjETddMRz9IMKokLO6R5waV5ZXdpf7E8C0u+Pz+tfU82OkjfzHXO+Ryx/SvUOEbm6Fu75CB5Ymfq4Thv6KXvR/U6pxIVI8cXgjiss1pgKxtq/2OU9zp1H/5tzlgTOK/n/latfuDO8K7OMu0pA87qJzv+FxaW2i9Vf6Rg0wI1nv/lmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y8rgc4R7RwxjNeH+W+92sxGMbkWLYu7cPegTCryiT8=;
 b=8efsx3BH8qbfzhvtHLQ7wC4MVdeT2uhcKPSR3M9P8I4dOGr+2ei/Bpjknr74KfRNcKmKI5ya3P2IlvXOtkAdldJDJfpxzO1+YvmnltHtL0z4vMFnmnnm8hnmoNT2fxWHNt/4HswlM5QRA38Kzf/KiB5WvfYDJUnSaBxiUu4UJig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH0PR01MB8190.prod.exchangelabs.com (2603:10b6:510:291::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.13; Mon, 21 Oct 2024 03:02:34 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 21 Oct 2024
 03:02:34 +0000
Message-ID: <7eebebc1-6c64-49e2-976d-247c8c0fd22c@amperemail.onmicrosoft.com>
Date: Mon, 21 Oct 2024 10:02:26 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: raj.khem@gmail.com
CC: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH0PR01MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 84263519-f0c4-43dc-eb37-08dcf17ccf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kENybuhX9Il8C3XOc58ejaQnjWmJz8RrU5KsRkN5MYN3CIn7P80t2ltuF3OB?=
 =?us-ascii?Q?wbioGm9fi0Zp3uGReip7GLEdMa8UXoSTlreDH7IaG/mKyFfuPAOx5GcvxWAK?=
 =?us-ascii?Q?0lHHWg+Q4aZxOhJnoWMFb1obLzlIfhnlh5ptt/TMepTycsO2HEHbKkeHcQj9?=
 =?us-ascii?Q?cnvYit1JkuP5S7uty/3Rd35LHh3EW409Qo+lHtm2qoH7Y1MBZiDRzjWvi/k3?=
 =?us-ascii?Q?M3FkZH2AdDp8WUfH1qgpP6qE09TADGcTnGQo3qioDSJMl1rThtEAmMtY5A7V?=
 =?us-ascii?Q?9FAEHAQxpdLbj7o71MBXsU7PYqqBvsLMm+FsAW8PQKkvtv68q5syDAQpGHZI?=
 =?us-ascii?Q?+F+D0lRaNFzLun5qWljHig7uAGl6516htDXGYQsAX1oan5aLEC21YNwwQuB4?=
 =?us-ascii?Q?p0LAuOB6btfEsBfsIWrCKopHPo9CwTu49uGqoFT1QaO3zdtFaqKI31DimZ2c?=
 =?us-ascii?Q?+vg75qEbKW4tufHV6dr7O6iRPWzIybbJ4x4LFmKAcAxwmEOJdGlXefJ3NHGQ?=
 =?us-ascii?Q?9twtDbbP/SvE4htFLHqNQYQzePf+a8o2XUPA8Nm3Au7n36sr/dgYdAxtmG8Z?=
 =?us-ascii?Q?HOENr2MaGyPKSpdLmVFvycSIg109dNZBOJQ5cbvIeUrk4Es9aceW+A0HK8+G?=
 =?us-ascii?Q?qxjvunRXHw2cW+/iEHPhyKxWZeKKuQadDqjqto2J91PgjLpcm2qC84J0gNgr?=
 =?us-ascii?Q?4K6eTUyVk3tc5I03+NsmFwUlYGL2QqVU+aFytoRu6ZFc/HxCqnOgiYuDvOLV?=
 =?us-ascii?Q?8no4MUK8RvucVPURzYmhX8NisiUqIgy2rbnV1eBStHCRMpTkewsrpM3WLlC+?=
 =?us-ascii?Q?pSQrR3t57GAMik0p7yuVO8T0+jvdarOqkYS8sz2+phPt6X0uUx9W6X2Hr3aw?=
 =?us-ascii?Q?sSO04O2Eh1oMr98LXU8DvaT0Al0eK8OvBeiVNL+7Hs9PRHrYgiDxUVRegb/D?=
 =?us-ascii?Q?MNWY2JHNAnXUXYNB1yPDeKYfdCYbQfUFWyeFmIjvAEQrGmHU3wouHXaW9deb?=
 =?us-ascii?Q?VNbJ8TGjyBT4875MQF2L7ORH601NTJx1UTsPDDkDBwLXYfw1jcSwBqXbjrtL?=
 =?us-ascii?Q?RFq2mOhnTUgmvqsReIfy106BfjKBmr+ijbGVWMPt84ZTWrVAX1rAG8SJwXe3?=
 =?us-ascii?Q?ZwdkIk/60yr7l2hcoBA3AnzYQk9/EU9ZBMeQgQJNgZPWksqVoZFbT2+CiHDe?=
 =?us-ascii?Q?YZ8rP12UBK37ijHoOXv0hmdQzCkkej08UkFLutEqEablM+JywEHt/txMl+ep?=
 =?us-ascii?Q?/a3zWmwA9011catbKgg35x2H4nQX8jB2JdsKs/nM3w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sZlmYQ/NoTAPcgbzRjomZg4ZcX6FfggEHk01/aZHXK8ToppkmSi/BE8r8VFN?=
 =?us-ascii?Q?4trsRxHQ9eSMD2tCb/vtbX0o4VloyneM8TpMaWYyyVn5W6IqwnEH0kiqpPfM?=
 =?us-ascii?Q?Ti4ivrKxFGsAzBAMHs9JsbETbiXBndqIbP8TIOy4+Lu/MswX9JmyPiql8kV2?=
 =?us-ascii?Q?rFFoA5Pw5E5+mWZv+7e6FFCPQI/735nNptU/bnoF6dnER1SXNA4BBy5jrQHC?=
 =?us-ascii?Q?9OgqMu+dd8dRPU8vJ5IRh4u1j3a0bINhbEWYNarug9Z4lSixBpM4N8Oq8OBo?=
 =?us-ascii?Q?+0quAdKwUT9LXXBL4vzkTtvfEq+NngT69aLXKMpUsut5iUCzaDBaSrkdrUR1?=
 =?us-ascii?Q?bbjiF/vXIB0t9y4FyPsAmtZaSdTvd0sfMz3/DrvYwuvvUZHv2zs3LBOA/4XQ?=
 =?us-ascii?Q?JmWALE13+1FeGJFQ9D3+ZcTrDYRVdL3lZFAgFH6/+bgTqU0gbUQpTiXEnjF/?=
 =?us-ascii?Q?2iRZqQk5gX3biW7Inm0FgwXslSOCDop0Upp1UXcChcmQJjxCFpy+5UOR5MLz?=
 =?us-ascii?Q?ucjO3eShcI0DMi6W5bdo1Prt1rojJ+Qb/bQM2pUuLajZq/jlEQzATesU9y+N?=
 =?us-ascii?Q?fUyLtGouQ18HS8UDJXQtk3g6Dy6LOYotFoacA7YTVWoufp3oSKPZIqAbo+51?=
 =?us-ascii?Q?SEBVpZgy16GtXMDMUYnpWh2Ei+XQ+nJuJ6s0EOVdDHlNLaB3fdeZhc4ATuIJ?=
 =?us-ascii?Q?V6sH084w8ZoTW++jIw6enBz12bY+7g3xQ4b2qltBesFj3i1sl1fwP2sw3sJ9?=
 =?us-ascii?Q?fgiEZGAevGmF+QPIpNhQFWhcTctRw6oZUjVfDZlYPzcFotsnz30545VWFaXb?=
 =?us-ascii?Q?wdU7lC92USdfBPOxXEFG8W/+cVv3whK3yC9J4L6lhxeuuaOBPeSMD780nfDH?=
 =?us-ascii?Q?7EUwnAD4b2G3NCq7Zbm0jZGlTWGVCUKI3GlyDWihwkyrgIBNCuBsGTyPyHbL?=
 =?us-ascii?Q?r0vUV9zRU5fMGQ5ZVoWJHxaHwAE9E2awMsQSSHq2iJ5xU+jxJcDBvP+3AeRs?=
 =?us-ascii?Q?55Kq2g0e3PBBiBeTZ530uVQhx9csgct7BNQh/+k3qSJ96arEzjUkWu/rZEmx?=
 =?us-ascii?Q?lwXcG1zBUKSIblazZg8gAusqhNRliWcFxu4SEpqf6Ln+BS7dI3u/L3hpGdmY?=
 =?us-ascii?Q?MKYgX1qcF18pTU+M20xlEvIxJ38ogGvw9L9k5+r5x623NB6Ta2zm+2FYlCCU?=
 =?us-ascii?Q?aRaN4/2WrvyNz8iYBXHd2N4A8DqFcdwH5INrc5qCcTh8N4uAjkqnmzf6a2ke?=
 =?us-ascii?Q?YpXuoqQJJNxhAgga2YZki2/EwIZI4op/5yMThOLE1iWPcUUqo6vcJgD34g8u?=
 =?us-ascii?Q?0Qtb2lIovy/BrMJf6Ek5JyS/lg6NB+HRnX5ZK7PzAeavvr7nV8CqGSJ29V5B?=
 =?us-ascii?Q?5hFQ2T06hfJgDvgDDe9qP8Vqy6yDNQXtKAeI0v68PXomjwWbP6sIgZDMd/t0?=
 =?us-ascii?Q?3c8VwNw1nrbUGqmHD0q6/esfYdny8VILR55gJt2aTiAMXZACxag5BmsoM2cD?=
 =?us-ascii?Q?Kq1FjeWDn3qBRcl0yiljmlrFG6JsayjcdNv1i7EN3AMNxAbY/hfaBJa85hmY?=
 =?us-ascii?Q?48uhMf3hu8L7QiD+/Y8wrnxLkajlIYoSniJYJZcAITPqtGoDvotdF5edwJJs?=
 =?us-ascii?Q?F3mFwiRAHwyX2318Oca2sMs=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84263519-f0c4-43dc-eb37-08dcf17ccf7f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 03:02:34.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbC7GtVjdO4hPfUfkZcizrlBiRWJtiTMgb3SuCcGw/b+u2DJL63xztz0oE4L4By9Za6VggTRfZ05qvlyV7yLPGJRJkaaNPrue45DtrnsAy3/RMd93NXqvbcbz4g+qQLS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8190
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 03:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113071



On 21/10/2024 09:29, Khem Raj via lists.openembedded.org wrote:
> Chanh
>=20
> Can you send a patch on top of the latest master, I have applied the
> v2, so please send delta which fixed the musl build as a new patch.
>=20

Hi Khem Raj,

I saw my patch was merged to the master branch of meta-openembedded=20
https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a97467b=
1d7dd77b4fab537bc311e3=20


I haven't understood your comment. What should I do now?

Thanks,
Chanh

> On Fri, Oct 18, 2024 at 12:19=E2=80=AFAM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>> Hi Khem Raj,
>>
>> Follow the error log, I tried to use the musl cross compiler
>> (https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp and
>> report error to mctp maintainer. Jeremy fixed this error by commit
>> https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805f6=
47bf35f4bfd3b
>>
>>
>> Now I'll push the patch v3 with latest commit from mctp repo.
>>
>> Khem Raj, How can I run CI on meta-openembedded manually? I would like
>> to verify errors from CI failed before push patch. That will help us
>> work on the patch quickly.
>>
>> Thanks,
>> Chanh
>>
>>
>> On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
>>> ok, now it fails for musl target see
>>>
>>> https://errors.yoctoproject.org/Errors/Details/809802/
>>>
>>> maybe you need to include linux/socket.h to get AF_MCTP address family
>>> definition
>>>
>>> On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
>>> <chanh@os.amperecomputing.com> wrote:
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>> Change in v2:
>>>>     - Fix CI failed                              [Chanh]
>>>> ---
>>>>    .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 +=
++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>    rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_=
2.0.bb} (93%)
>>>>
>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-n=
etworking/recipes-support/mctp/mctp_2.0.bb
>>>> similarity index 93%
>>>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> index bf3961be4..62044e007 100644
>>>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>>>>
>>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29=
dc61db21"
>>>>
>>>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
>>>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>>>>
>>>>    SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;prot=
ocol=3Dhttps"
>>>>
>>>> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
>>>>
>>>>    inherit meson pkgconfig systemd
>>>>
>>>> +EXTRA_OEMESON =3D " \
>>>> +    -Dtests=3Dfalse \
>>>> +"
>>>> +
>>>>    PACKAGECONFIG ??=3D " \
>>>>        ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>>>    "
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#113070): https://lists.openembedded.org/g/openembedd=
ed-devel/message/113070
>> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
chanh@os.amperecomputing.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


