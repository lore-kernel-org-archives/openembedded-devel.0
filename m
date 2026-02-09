Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C25E7E0BA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:51:47 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44470.1770630699741016525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AHBLgJF7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vr2njwEDKc76Rvq7TVfqXXKVRhKSJHKWqsuDkNZN/qcxby45oPzTdc2ihzTLsKpzl67kbz/cXxEfUv2xGc5ZHA96PVqzqS0a2OdJ2tawl4iU/km4gz3lqunw/aiAxLnk2bUHYyw9DQDgPPpCffDn76pCPRNgWxcZ1XQPCSCpfvqK/pcBZ5mz0qxK03d2eFnxBpIVXOnD2JGgw9RmBXkNOniYWl61N8n09Nn23WXdg+vcFqmUDTLxZMRWnImlhDhw6Gn+ia+gfcDMkAGVd9+1o3Z0I5N++Dj+y6gWSybeqyCPS1JTHRKHpgywmMf9RRl0FC0g/nIuRLW8gXm4mEp1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goGxrvYz5GxNycP630Dj7nt+Ep0sdaCsggRk/fXQkgI=;
 b=atMdnDjmjvA2VjYsjQ37mFKlj9hjcSPTBfz4iH6ZlRA2VPPrRgL1EP448P7EN/lw11TY4z4IWUJeBTur1D6Zk2b5byQFjTR294aNMntbUtMqr/HDL1AlGIp9qRRYhjvK9n0A+sOtSsUD3FTy31JzKxxuwaqtLPZTElvu57EXUGabn1vmMCrDTXMaA7HZr/ENt9DRheU9zsXmzaW8K68r25+/m2WGW92sHH7LQzkG5WtGuSXNIiN8dWOwMbo+xsRod7gpF3M3j+RcS8S4StBWqybVIgoRYi3m+IUe9+yxJmVzPDo6RBbenb0mK4ffDHZ+limS10HO9+6120Dgcpkurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goGxrvYz5GxNycP630Dj7nt+Ep0sdaCsggRk/fXQkgI=;
 b=AHBLgJF7r+tfLJGXRyvJXKWO841IQhQJuN6XvVad/tdkTkWg0DDsCJPgRVmDjkf189xb7qUmtiGJaZAjAFYj6D1wmRT8GUvR/+z+bAngiV0GYnYSb1DXlGi1kIyBE+gL7oG0I7EC92aQI+gBddOLb2CiZOkj47JKivrhnSfCZyCJ5AHXGvpegefWuC/lsyLPIrZkQeB4PSVAwGJAFg3I5LiiTPYpzPiWpBQHIUhUkXzgrVCcf6OWAblkh4pwPrHxHOUmerbOZSU5NHiiw9Ctursqog0GSvjtJDVfUzTEn1iXqYFsGuokMcfnEtdhKiWqY50UrmnTGsVPfY12c4lpkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7169.eurprd06.prod.outlook.com (2603:10a6:20b:2c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 09:51:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 09:51:35 +0000
Message-ID: <70b01cd3-89ed-42bf-a5e2-1902f7d6b666@vaisala.com>
Date: Mon, 9 Feb 2026 11:52:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-watchdog: Remove
 obsolete dependencies
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
CC: openembedded-devel@lists.openembedded.org, tero.kinnunen@vaisala.com,
 Khem Raj <raj.khem@gmail.com>
References: <188D031AC06B5E57.3547823@lists.openembedded.org>
 <9c9c6b36-6e25-43ac-9a9a-b209ac27ada9@vaisala.com>
 <CA+s=J=wVpbARJ0WSJP9tLVfJGyK5p3cBJGB=0BRQGO6FzSHdVg@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CA+s=J=wVpbARJ0WSJP9tLVfJGyK5p3cBJGB=0BRQGO6FzSHdVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF00003840.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: e160209a-f059-487d-55b1-08de67c0cffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ptn4bxdTMiYIFLBBztMoi5PLY5KaYvgvVzYkaXiE2tJhSCvvU1t0PBCHiDUr?=
 =?us-ascii?Q?swre3pn5oHGmlsHJJZbN5wdSh/jp7XAPVOfh+TbqXzWIKt0TTf0H6ie5PQLO?=
 =?us-ascii?Q?a2ZFskbUye4XhP3LmDx8ukF7OiLONmPVJrU5nqG9lh68Bfq8Y+Vaf9I7KoPE?=
 =?us-ascii?Q?FMVRuvbqEf6I9ERVsZvXZyxnMOkBfc3wmH0dM18Z89v8kK2NGmGdsIRTQymG?=
 =?us-ascii?Q?Ji3sQWsTifsoUA66CidPrurQYOThpYrt/+p5dUgEwVWwkt1027jxMrNYNPC+?=
 =?us-ascii?Q?nIfVSeIVmvMAVAF/7S/CMeT8jTocldNyOX0uWhWWkw31+jKN4F1KpktVyElE?=
 =?us-ascii?Q?RI85OAwMW+U1BYPJQHWST7iKoMNSIlcv6/q47jof8ho1bCXXzf3TSKj0Jgfg?=
 =?us-ascii?Q?meO0PmlLjZh7UPSIdrdJgcSQYV2HI5h5GxBWLYXWSRUCtyFFcZJuzrhjpRX/?=
 =?us-ascii?Q?g3NZTY6BySvhbR+5V5cG/1oifU0AeE3BIPnCtb9Eopx7SyT8Tv+IQrIwhc6i?=
 =?us-ascii?Q?6EDDMsXp51g1su+V1qPhP7UpJECwbHt79/2AaYqjDmkLH9ULiMWcjKo5cXdV?=
 =?us-ascii?Q?Xt7IGRvPfz4dZRx/9El1RkVpSLjp1JcX6cX5zawlE9cs/glAV9jHpVdGHBe1?=
 =?us-ascii?Q?98L98/XaYcNyZUS6ygTL539kwWpg+B0i9j3hiA4LIc19GjM0dISe0GvQnjWo?=
 =?us-ascii?Q?Bhs91sBoHzMmftajcfbw38Lwy0A/BSt4UFBYrKSCmPRTOjBA6uOLQ9Md4gqZ?=
 =?us-ascii?Q?C1tilcAjn+fmul4ApQ91t3hlmC0devb5ImND/GQSqkODMGUThVtlqgNGOek0?=
 =?us-ascii?Q?F8LhNDsrbozQg5y9ul3r8TNZXY6pt2QRxXbaVypYOaIg9VZGsY+T7kAIYQ+O?=
 =?us-ascii?Q?7jfuRFh8UB9gHoD6FCicRaXKn2UrYSzcL2Tq/YMOJge56SUKjwQPzuIrCBhP?=
 =?us-ascii?Q?zDqU2ObrR+aQ0HvlsjCxl9m3XoYSl7QyTh+letM1fCa/FmREbMND0mudSI69?=
 =?us-ascii?Q?eoexY1HMTJuCu1Vg8ERUgGr5DN/4ZpJShHHqIfRGu2KwZcNYJf+Uw/yepbu9?=
 =?us-ascii?Q?ivF6LZmleqXKk3ahAxySwq5wAy1vsaFaCJ4bF8FK5xCZI24Hu6WiEFevC4Md?=
 =?us-ascii?Q?Tf7qBwjuFxad+qbZWp4sDQTXv/lb4tPki/21Vwm+lybbCp+ZH9SwiNT+AOtt?=
 =?us-ascii?Q?Lfs55Tkirc/4KC/JVvdRE59Uoqac13LFxfiOAcgi2vLFJ43GxxLVwRiyAwwC?=
 =?us-ascii?Q?2UDysUTGrOSdNNtfkqNo5Kgt2il4a/5u9E8JoH09jnUxKxGDYzqM3sB3t4oJ?=
 =?us-ascii?Q?5ka7yxpqD0hZLO2xnn/CkqByD4ljY8Fld7tE0fBQClfR97Xu6UogFt4J5e2I?=
 =?us-ascii?Q?gkAlklcDBrkhgeQj9e8ZniZH72s5UJ33xPtzRWObEJ/niJvdg9NGQIVjXES3?=
 =?us-ascii?Q?lzrF3BxqLD00xHyVw4Td4XWn/ZpUEod8kSg3cO4I3+EYgobIsvYnK/GLDOHl?=
 =?us-ascii?Q?FtcIT+tctWdvFPQscjeI8WfvAYA3vouhFNuthWMFHF9FuxjU6bmcpZkWIeYz?=
 =?us-ascii?Q?vt1DOnjuOM48IscFu0M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZQgvJkkDsfOL/S8H9y6cdDRd9Y2lJgP+LN0IZ6cNgjdHbU52I39gKI+KIjOX?=
 =?us-ascii?Q?7wTN9yF6KQyhWF9oOxae/qxj0EuC/j2YMFMKjL0ocvalUZA1efsnkUlZtysV?=
 =?us-ascii?Q?LsFgPKN2fudszL5G+u+r4CmFms0GthPH4GTyEHdmjR3/POsK931U9MIYLRCi?=
 =?us-ascii?Q?e9WnspXURufg1WXdgqLoZntOhQ1SNQxGTldnGk2guW/AAOgb/iYf6Ch+ZARH?=
 =?us-ascii?Q?mOpXsf4rSODO2q+mH6+DHRA6YmFn/TX7UmeHa/JZr3m0/HCcEskcZiD4Wes+?=
 =?us-ascii?Q?QcRB0VrZltC3y5/hi2ViYt01np2/qG0QL/Wnp0goOuB5G23cDtvbzMWMULTc?=
 =?us-ascii?Q?E0Ai72V25Bjbi+dUSf2oWwjy89a/yceb0Mkcr5qr62BFttftEaywQsmwkiCw?=
 =?us-ascii?Q?+VeWexpSuj5u40FSlbedQvCocSHSA2Bk1K1WfruwxMROhyfXdZzJ5xkX3KVk?=
 =?us-ascii?Q?3hlmWvU65aEF8h7uBNnGK5NI5UQak6qDnvqPqctvj9I0j4PSGi0jyGX5JBf4?=
 =?us-ascii?Q?hZYqI7T799VuJhngzVeu/xyI+G4luYbyY1Wl2duIVBsptv2XMtU3Fe/Z6yX6?=
 =?us-ascii?Q?L7V/sBZhSrfwvJ9q4dDi4L1gKG7Gy+GMuxXmNrsFRu2zsEZDRiqCKwj813JQ?=
 =?us-ascii?Q?wlL+3pAdfzRyNzLOcH5S05UPAftPxjgR0klD4rlRQtYDbkAEawHVOIINF+py?=
 =?us-ascii?Q?qh6w4I1r+XTUcjQpiD/PgKxGVAPciKYDRMDR5DO3VuDsLLmUCgNKRIYMZZe7?=
 =?us-ascii?Q?SN2gNlAbWUrSGf9GC/0xl2Z3a7aqp6NtUgpIJsJeZ2uO88WFNTPQgdFiIeGv?=
 =?us-ascii?Q?mfj5aEALXpGyeNgttRIZCo6gy74Xd6eiGpNnB4es9BjhhbMmaMgNyCOSKa22?=
 =?us-ascii?Q?fOnfdZE3Vg1mUdsj1BMqxBny7ZMlRSA1aQG5Z0zdQ/Q8LTNL8Phqbte1NkMo?=
 =?us-ascii?Q?0ImpmReVD1irOlraZ9aQeshkX/W/tPn35lWVAMcfDBlpcKHOJLwrmugJ+tgX?=
 =?us-ascii?Q?aYBRYTfVNvqW5181tox+ZGozniIGQpPhYe+PuNPtX2r025EZ0vhufihNtUxl?=
 =?us-ascii?Q?EMv3wFl2kKbWht4AdCEhDehHWmhp5lvnezz/RbGByHMGtzVNfLt0uhcYT3c+?=
 =?us-ascii?Q?qb0HGultn1nrUiKfo7to83WjJmwPSig1ks1lCW5otxlu0cjE9EfXThNGoGwo?=
 =?us-ascii?Q?mB9lFX8rB4Zrjyo+7vNw3hG3+a2YuO02j52+V2CMF4pjitG3srGyTCbURh5k?=
 =?us-ascii?Q?gWCdyoeHYp/WHxh+ZTRU63mTErop+LcZNJOxfMOHHS5x7NiejxeF+6nM1Krs?=
 =?us-ascii?Q?N+oJnwfkKezf23TcA9O/xJUeYwfreHIjRUClUreti/DK8LpnUbB916W4gZ8r?=
 =?us-ascii?Q?Ye1CudArbOpJnNCD50NV7q3OB2+b6Iay6pDrAS/SgC+11fGn8R3/m+UFmPeh?=
 =?us-ascii?Q?ykbLHnIiK2M53xzJzVoZdftRBPy8LBErykm9Bbze7TJO/8VkTW8uIvWkzFeK?=
 =?us-ascii?Q?Hh83ZTcGIhsvk3cAmlHrK594XMErtbEi+Ldz1vL+RLC4v5hrxWpfdxzWMxMG?=
 =?us-ascii?Q?OhKByyo4OlD0GD1egAVFvVbZPwWUsZ4p0IKKe9FIv40fZyzteb9/AUY2ZoRB?=
 =?us-ascii?Q?hySL4ZvSNLiGzuToqUSsbt8PpaSAMdCbletsUTXoANO/BdsoJNt6fxvI9pz9?=
 =?us-ascii?Q?ZId6fPfoKolJcZGUPwwkfxPHWTx1qhsmSEcSN2xfVyd1cBqVU8p5gjN1jk/I?=
 =?us-ascii?Q?eQrDxSdxyVrvQD7uKz0kFgUFv06euAY=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e160209a-f059-487d-55b1-08de67c0cffa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:51:35.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0xJtw10jYqR/YSut0uSShaziZi/ORzZmmps5BbuYZhJcV7Lhw8c2n344KeMF2GhFCcMW1PkPiNr0vptij0gbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 09:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124295

On 2/9/26 6:32 AM, Anuj Mittal wrote:
> [You don't often get email from anuj.mittal@oss.qualcomm.com. Learn why t=
his is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On Thu, Feb 5, 2026 at 4:48=E2=80=AFPM Niko Mauno via lists.openembedded.=
org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>>
>> What the commit message failed to mention, is that this commit removes t=
he unnecessary runtime dependency to package which has LGPL3.0+ license: ht=
tps://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devto=
ols/python/python3-argh_0.31.2.bb?h=3Dscarthgap#n13 which we believe is a r=
elevant fix also for the LTS Scarthgap branch.
>=20
> Thank you, that helps. Can you please send this for whinlatter branch as =
well?
>=20

Thanks Anuj, now submitted for whinlatter as well.
-Niko

