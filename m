Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6938C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 17:37:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.100])
 by mx.groups.io with SMTP id smtpd.web11.5104.1747849049220579136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 10:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@victronenergy.com header.s=selector2 header.b=o6Kp44my;
 spf=pass (domain: victronenergy.com, ip: 40.107.21.100, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLMxFu4ka0PyQjyB1j5MZ8KEB8PIPcq1Ee600vbNPFHME4CMs7Fs0l1XjAP5g0m33nSNVaBLX5VxU2qLP5QiXlBkcF7T8+rmi7O4AovPb1t7QXkDkxT9d3QYf1kycpkxzm5j/PJ0tYFts5ZGvPfMIsdtGfe32L0NmEP7xUxmxoXL5BfcZiI8Snmlub3svwxNgqyxtJ34Rj1TGaRMMRW1bQjuegmymXpvy+Gv6YVKFW1lhiRTFB04bHD/YD3iMUKoAJ1vuEt352+dCYWQhSBX4lQ+hpdwKQOKVntd/kDs6JYhE94zlNp5LGWosS1pkCJC0PBnWz+OTMzZpz647yy1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwrBtWb7IInSRBu8yd0iB2+292AiEmKZXyeV3TAQbSY=;
 b=sXghQsevjzDUNWSB8fNsCeM6hWUWB02Qu18xd3nzYeU1yBKLToOnGnxMVj2uk0TnblaHFJuso6i7+RodeGeEZup8PNx9dtJCa4j8vF7jGn1KiNOA/WtuKaq2ihVJ2b7voaaxCtHftD4uBQlMIrakog5eH+eSukWgUsSxQWyzvNEE8wObVfA5XvzpElyvfHtWaZWM/6V2CnVPN2HrNR4eICz2WEjZoECKqzNhHHVrdPoFbATlo/LlTSyNF9Vge6D/CHnglBhbvhOHd22IOgsWO1GuT5Hy84hslEQWEZSjA4FhQWnOSAaXajOzMQFDLPuks48tfG3ao68IykOMk8B6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwrBtWb7IInSRBu8yd0iB2+292AiEmKZXyeV3TAQbSY=;
 b=o6Kp44myX3p9AXzcBYEu4JDIVdqjgIv7K/HEp3f9nDlPCvCPW+xFi1HI6Ul6WzlXGEx3pGD9Bg5kFAVOEX4aZFA7o4awBlgb+FrRDDE7jeySkIOA3gmz6o+yArqCWWoDOkFbVK4JUwWq2ns0AjY+GF1CE/FjyHfJYfIPMg7Zhzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by AM8PR07MB7395.eurprd07.prod.outlook.com (2603:10a6:20b:237::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 17:37:25 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 17:37:25 +0000
Message-ID: <bded98e7-4576-49a4-a17b-5fd9e092f9da@victronenergy.com>
Date: Wed, 21 May 2025 19:37:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 2/2] socketcand: add recipe
To: Jeroen Hofstee <jeroen@myspectrum.nl>, Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org,
 marc Kleine-Budde <mkl@pengutronix.de>
References: <20250519141525.3708957-1-jeroen@myspectrum.nl>
 <20250519141525.3708957-2-jeroen@myspectrum.nl>
 <CAMKF1sr_Ss+P2XnuwnJZ+5ZoJY_68+q-5Q0UwJfpR6XBaxsEbw@mail.gmail.com>
 <4568b2f3-6231-4bc4-be50-184bdef4050c@myspectrum.nl>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <4568b2f3-6231-4bc4-be50-184bdef4050c@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::28) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|AM8PR07MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 797ca809-c7ce-4b77-2160-08dd988e2639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|4022899009|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hJKPmO+BvyPzVEkRghKkzgM25qegLFgU0LbiRKq0EJwOKLNJTOqTtxiJRMZS?=
 =?us-ascii?Q?rtAFcyDmFo88jlSbdTphrVgG/hHwcQS6raMgPh2sT9NbjPH1zS06HxK4ZajY?=
 =?us-ascii?Q?Jm/tRXBJ2NJ1GK1oqMrNlRFDMj+SkaLPtknRgyfE/65fE+775NSRs1TPeXn/?=
 =?us-ascii?Q?Czl0PwqRNSQ5Ng0Z6lOb0KZdH1N5tcSimQ4KqIFXsnGmzM3KrJQXtmfYFuC/?=
 =?us-ascii?Q?w2PqOTl3cbwM6Cx/+zA01HiWJE6Cm85aKi6NlltM5PQ3zT5O5fd5Zlcuxha4?=
 =?us-ascii?Q?p9Nmvo7ZSPuaWLtoStEgsCSByRw+HsmxqW3VchYkgScckbsdDoKtQYhnGJI/?=
 =?us-ascii?Q?9JzB/zjp8npYsqx8/8OZi5iizoH8OBmlcyH0ml1ZDXoSZyEMe6pmUsSnxcYG?=
 =?us-ascii?Q?UuWNCw4p+l4Qzs3/DXTQI+Hrp/rGRycmsm8hGRT4TRWGYxC4s6JzJk50xXk5?=
 =?us-ascii?Q?w60RH9fgXyhY7yeetHHnGHhku5PSfLidNf9ZTr/JvU4yk5G0yZi9nMcmKe1s?=
 =?us-ascii?Q?CdblRqhFte3bUKQwCrLwukAab7M+A/FeiezDhbnlh3iPoJBxwBaPH5Unt/Zm?=
 =?us-ascii?Q?CUBt46A0r1eDhakaqxYVgtApXd8R4ovsn3ZVWalArcTT7vSGWfrzArbXO5hm?=
 =?us-ascii?Q?GktoSkNkaGNcTwEXdNW2QTYQubZYxSTsEiaQN3Zb8KACr6kvr546jn4ZpTW8?=
 =?us-ascii?Q?DtjoikEide+cqwsi56GLDwUrtUR4nsVxCsWNN0Pt8/XG9rBll9ZOihy9Ez+B?=
 =?us-ascii?Q?Jcq1QmC2u1nhUiIway/lCWxIghHNaoauCIBC0pQ5EchDXC1Bq7wquT5ow1np?=
 =?us-ascii?Q?L5XNohEtLZj0CA+gjNFOchNDx88X8vw61lNgSWrW9tYsSN6nM8s01+qTFva5?=
 =?us-ascii?Q?8/CXMMK9IMpD3+3IWgi4lIc2IKttKlPKUtWPr10EKVdz0APBx1qkGHdZfiTl?=
 =?us-ascii?Q?qBpd9iLpQ+vVtSGH3KkRrYht8dz0h1cm9BKou9Mb3/hvjJFP/K0fciNZL3AJ?=
 =?us-ascii?Q?b9bh0N52IHv26daBPO+5eV9maKNpykCQAQ37z+XTIp7bOz/NDZVWJP6ATlTW?=
 =?us-ascii?Q?IT8Vkf9xLyBwwIyPvz+GAFvU985we+SdmlK3SyNMCpa+rObHNXQBuEm843CM?=
 =?us-ascii?Q?eRBKEBdf8jtZcaM8vhR2vGOfUjwhU4SSL1i8wND+orQG8BLmbIobAOTbOdi5?=
 =?us-ascii?Q?tQVm0FbhBu1tMQD6QQhzTA5rGgUdI+S77wvDhr9AO+wnETUQPcn5po4dQZEb?=
 =?us-ascii?Q?G8uGclVQcNJXIRih+DL0Wh/64J9rseNwStpy1p2y1nTKLoVsvIEEggZquWd2?=
 =?us-ascii?Q?3VXPmiPUJhxOeziqPdaZvy7h2kVzIQtBOL9lI3emhqqxHqRijQTiLihgB569?=
 =?us-ascii?Q?8fIUh6w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(4022899009)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3eA2E8mI+nCnNoZ85Cn2k+qvgVIf3dC8vravwfdCQqMouFBCRoTUwWTjVPYb?=
 =?us-ascii?Q?6SZaoxYloDdjX44rYBl1aUcbxtSsy0bSw9SK+Pc21EG2EobFPf28aE8OQF5R?=
 =?us-ascii?Q?4zMhCLd4drlZBrpRYZSBji0jiZzcFNvpT+/FAI4VXIIAPQ0fP/RC/PdMR6la?=
 =?us-ascii?Q?TsIrNlgcQFxB5zJzk+jlmDYM+QCqucZNXyMy0Nvl1Zfc8B210JVo1kO6K2D3?=
 =?us-ascii?Q?gqBDui1Km3QeZH3WJUX5dYOV/uK3CedsmpHRzbeNa4kCvK+HAYPFxrdOp1bl?=
 =?us-ascii?Q?V79uwqr+VGB5/PPcJM6ZbLku8Jx+RXdrD0gZrrB2MWTJZe0/aGR2yKr4a1ty?=
 =?us-ascii?Q?ZbRFsHIgiulL/2brxzjB3CAXk2XithDFsKeqxwSPy7s4OU42UMqoKTyAv2Re?=
 =?us-ascii?Q?my3G2iKccijX7hGYXhbmFpdMQImmGC4E34UazfZ+iD5lseP6ZOz6kD4TCp0n?=
 =?us-ascii?Q?j052McGhLGyAZVGhLQZ//2HFV/HLF/D/nqf8og5khqjnlg7FIhgx6wdNbUHQ?=
 =?us-ascii?Q?rca93mRZrOP+h2c0TcEgV9dwGR8RAzr86ee36lOgxxUIx9+yVyIGff2PRat7?=
 =?us-ascii?Q?qhrKuDpZi3dO01MQmR483Ps2RtIOfbNgDYccDK58HcNnZUp3eAZZi9Rzdl8Y?=
 =?us-ascii?Q?0I4v1GFsiXgZXsZn/j9Hxs/gNyWr5uYhuQmJQ7eFXYAbEgy7queu4p7WTH6i?=
 =?us-ascii?Q?VEZI0iWUODBB/70LdrhXWtkGdfk4p1QENB15WXaEjNfyGOlBYzC/feH8XjRx?=
 =?us-ascii?Q?W9d6vEwDWSkGxlAFnKJJDRDOaEJq/6SjMt0AtuTTulglQbfkqcB5h0sZQwaj?=
 =?us-ascii?Q?GgztQLIc4w/92GYT9xw0bZ8MKIwgEEnLbKh1MYA5jy0wF7ZB3ZKz17t3Z41Q?=
 =?us-ascii?Q?LU9xQL5abPtcUcx0HKmM79p02bJHZfPQKKboQhoAWPEyz6PN7bcrG2z7+/gb?=
 =?us-ascii?Q?EzMcm/BghDXeqKtwAh+JuwZBZIxe1ExLQLF3WqIyxMgdmE6UVeydNfsLzPWa?=
 =?us-ascii?Q?4aUIcWduHNUxN24J0lrerXXXZzQs+QNTqH+DwxeBKm1rEcOf2vqOPWtLbBMd?=
 =?us-ascii?Q?RWgUCUlgpoVivw6k4/cytbe6J8j8/818xWjH07aByuvDTwnF3Jpe4apMaxDj?=
 =?us-ascii?Q?0cY4L7oplDCPhdlZddSze4UdstKc3yr/XdYEEcfMg6w9By4GKOEDpN4XQKCr?=
 =?us-ascii?Q?r5Z0FYabwHBGjmHuuFb8DEV6QOUmldUuLgI50q7UoKfj6ASHvXJ+2gIrZ7ph?=
 =?us-ascii?Q?ZWxZNU9BxFVZC44pPl+T0PTJuk08Ise3eiz7opPzEls8X5CVMg3zfrBsj8Bi?=
 =?us-ascii?Q?3TuFd6yPt/wRHIWJfCG5RDiXS/xuSBd0nJohvW0+9zUl+tt7/yibEWw/UYHu?=
 =?us-ascii?Q?8XBh5Nr8tld8WL26co3gtB+aEQGYPZPdU7lmieAYsOQzzrHcPOJBImUy5MqI?=
 =?us-ascii?Q?0C4z8VjxjnZAtkxzJhc4T58RMYBIDj1dAwvx5rjzGOz4KwHRO5l/yZ6hh1BY?=
 =?us-ascii?Q?kZoXgGjge4OmPySM1+DVw6m9nZJcgKyS0ZJFHp8gnCLDTgy8AihHvJXS8miU?=
 =?us-ascii?Q?g6JzTTLoGCmDAb31J1A2ETEQXeQiXJNrejXqCz8KiAkq7GGPRbLw/RBpRm3R?=
 =?us-ascii?Q?LzPi8Qjy4bCWNxFeZ4tjIgRVOsxH8AuUquI2/YY6d+g5M1ffp3wqyshGrlVt?=
 =?us-ascii?Q?RPgdgg=3D=3D?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797ca809-c7ce-4b77-2160-08dd988e2639
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:37:25.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ5CFjd82mUiU18YLes2PhXIZVhChxP0enNazXkE57rHK1lV4LHo6z3ImNwziwU5uqEfQfScIPXrMFC6Z7yvcTeh6cor53E3i24yJpVM81w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117575

Hello Khem,

For completeness, this should be fixed by=20
https://patchwork.yoctoproject.org/project/oe/patch/20250521091721.2622210-=
1-jeroen@myspectrum.nl/
Marc fixed it before I could send the changes to him.
A bit odd I didn't notice this earlier, but so be it.

Regards,

Jeroen

On 5/21/25 09:39, Jeroen Hofstee wrote:
> That is odd, I will have a look what is happening there.
>
> On 5/21/25 09:17, Khem Raj wrote:
>> Fails to build with gcc-15 -
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2442453/raw_in=
line=20
>>
>>
>> On Mon, May 19, 2025 at 1:34=E2=80=AFPM jeroen via lists.openembedded.or=
g
>> <jeroen=3Dmyspectrum.nl@lists.openembedded.org> wrote:
>>> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>>>
>>> Socketcand allows to transfer socketcan messages over tcp/ip.
>>>
>>> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
>>> ---
>>> =C2=A0 .../recipes-extended/socketcan/socketcand_git.bb | 16=20
>>> ++++++++++++++++
>>> =C2=A0 1 file changed, 16 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-oe/recipes-extended/socketcan/socketcand_git.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb=20
>>> b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
>>> new file mode 100644
>>> index 0000000000..764a87f874
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
>>> @@ -0,0 +1,16 @@
>>> +SUMMARY =3D "Socketcand, socketcan over tcp/ip"
>>> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
>>> +LIC_FILES_CHKSUM =3D " \
>>> + file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00 \
>>> +=20
>>> file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da2c37=
 \
>>> +"
>>> +
>>> +SRC_URI =3D=20
>>> "git://github.com/linux-can/socketcand;branch=3Dmaster;protocol=3Dhttps=
"
>>> +SRCREV =3D "7b5e91ec656b33c325db2f9136daebb9e357bb65"
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +inherit meson pkgconfig
>>> +
>>> +PACKAGECONFIG ?=3D "libconfig libsocketcan"
>>> +PACKAGECONFIG[libconfig] =3D=20
>>> "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,libconfig"
>>> +PACKAGECONFIG[libsocketcan] =3D=20
>>> "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=3Dfalse,libsocketcan"
>>> --=20
>>> 2.43.0
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#117480):=20
>>> https://lists.openembedded.org/g/openembedded-devel/message/117480
>>> Mute This Topic: https://lists.openembedded.org/mt/113200001/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:=20
>>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>>> [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

