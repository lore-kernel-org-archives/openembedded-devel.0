Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E22C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:22:02 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.105])
 by mx.groups.io with SMTP id smtpd.web10.6541.1743754920749650202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=vux2z30b;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BveHr0pXaqQJBBZS3FcpEFEoJBxGVLGAi1yM2kid0EpJ5FfWGRKyjh51R18ClRbOb6ogiYHZEzIcghJDPnVEOCfxU93r/iKIGCKzP1BLT41kBvPfH7GRt9nc4DiKvZM5qjbgZWeZYY+3MvQH5jX7xPj/DSEHWjkXFk59t8evANXIfoofXv7TxBopeEOMTsLCmE/2Jvrna2rCayMzlEnKHpE2278cL9PEOT07AMLZIStrRtN+lXrbInEAF/FzoiGejNec1NstDX/44jh1tYhXsVBdoeqTU1FMW9iAhkHInQaMiY3G+Y7BQ/Oo+CMGkDZvsn/MYyXsRDNJSfPC8t7yMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwA4KvGfocG4Zuw/qiQQ6au4mlVfiq7+GK0tz03VIpU=;
 b=dUglHwJpIl8ZYeeFzwCDbLf0SczF31/VoZU32bfeFLs+Ej1B6NgaHzFhEDwZGJx1I2J94XUClPnSmZSLa8x3QD68g9Xo18YWbkkgzi0Uc+lmrLaEQOyS7DBjyCkeETvgwU9JVQTmROhet1hO1z16G1CbK1ztVgJpiEXp5nWnvBzPIFSq8wnGt2ma2xgBtW/+5oB/a/BO20oBmyU1OuMxL3Is1HUYiuwXFm4EYWG5ezMz4BAocfL/2EUZwd0PQfZ6VpYGnJ/IXykjr0F+j31YADyudvdUeGOfFX2zS56gaVohzZc5kQ+d3YB7fD4Xtb3Yg+KomWU+hxp3Z4kAPjj7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwA4KvGfocG4Zuw/qiQQ6au4mlVfiq7+GK0tz03VIpU=;
 b=vux2z30bg5KvHrcPOv9cF5HjY0pbEBt+SKVchpIqgasaUx5/T0gq6szQeGTZ6FXiDTyomwEgq4JoBaNERiZHoA96AM4kwJLG1FsIfiEtSaKEFz0pUP5cmKkjDOetFD3C7xia36Z1WA6m8NpulexiPqPYD/RmQFzWB0auUx6lusBgnNPlXhAEoB++un/cYKMyOv6nnMjj9NRhUaajVKleB6b8fBUSjqs1QE5Ou9QfS+YxIrTjy/qN06oNcBbJilB9HEMUbhnrXfy3Ae4MR3EXOFYkjIh+l38Uk1kTZIAL1JXzpicoem7Ybo2Ns8/fdc4JF4UMCbVA8KblZgUIQD4iew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS5PR06MB8919.eurprd06.prod.outlook.com (2603:10a6:20b:681::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 08:21:57 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:21:57 +0000
Message-ID: <64506919-9b47-4e4b-84bb-e0877a5e9938@vaisala.com>
Date: Fri, 4 Apr 2025 11:21:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative
 runtime D-Bus
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
 <20250402112901.3804235-2-niko.mauno@vaisala.com>
 <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF00006639.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cf) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS5PR06MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 36931535-227f-4ce9-2b4c-08dd7351c423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6tlhcg6X9DxRDmoGYAzKpHT4ldp0y4nhVkJ/NVV2QKmBAQezdvLHmZtIJTvb?=
 =?us-ascii?Q?noCaKuI7FZbnruWRvPs/wjcadhEq46un9AiHY6bbkaeKZGm0poRIgohKtdlO?=
 =?us-ascii?Q?43lu4gHKS2CFWykvlHUa3lqQBI8ebMszo0pT658Eq+WnTrCoZ+Gkghd8c0k2?=
 =?us-ascii?Q?CphENuPxta3S1XC6dm5S1ddvLRGwE5v0JKGjEW0m1VVLxt13zrTPyChCuQLd?=
 =?us-ascii?Q?HzATg2UxrX79yZdhKt48xtt+xnVSyL5ZUY5qCDglJ8HYh5rCiJ2iegsXSudB?=
 =?us-ascii?Q?KEZFCnN2+RldCDO1TTWOldvK7rBVLWsECiFHPdgij71s+ZGLZDOMN7oxTYRd?=
 =?us-ascii?Q?4ile2uZWj5wu638hg3Wn3+Jt3I54fD1DL1NOp0AjYzkdCt6sUxCkUwQbLYqi?=
 =?us-ascii?Q?17iN/BNkh3WrebeBKmfKtgu8RezyAlO+wditSyb4zm5UPWJC5rJ6P81LQX4Y?=
 =?us-ascii?Q?ia6IxPktX3hWD0DCcka2hThlaHfMq07TXyNQNlnbNrOzPU2uBfgXTyghWMSw?=
 =?us-ascii?Q?NUcrar2uc6mr5PjAQaipLcnBO3n05kGBzOSJjqJ8vycPqxjXi6R6i93jDYdV?=
 =?us-ascii?Q?m/63ivDBTrpOYzjjaQaR29DLo7eWL5mGpKoBh0GB+2E/RJ3fD42y9w1Wclum?=
 =?us-ascii?Q?Y4LRBS0An9T74DStjZuOALu14Mo1Lu0dSqap3cMvH25rQpzFpL68fUzHbBq4?=
 =?us-ascii?Q?R+o1cyTZX8ohIMzxObDbHZrlKRc/eq5mKlLJo+0A3jm/XQyse2+m66uJuXV/?=
 =?us-ascii?Q?znp6eLUbgudSMkz4gWrOtu2u2DEyzysmEcqLhCU3bAMsNzP5JZ4IMjNZWQFy?=
 =?us-ascii?Q?2x8ppn5OXKvlz54nPMTPt8Th6h8ZcucBzcFEuTLsyLzwbAlRtIHSWvcVVIGL?=
 =?us-ascii?Q?iIu3hodNOQiHYL+ONekCkURU+/cCJK3qVuFBlvhN7l8lt3rzIUHKMS8jCopt?=
 =?us-ascii?Q?sXlyZ7KFvQMzL0baKQmFgEKfgIFNefPSbzod15nQsFudMLk80OkW/nfFt0Zp?=
 =?us-ascii?Q?efDqykKxS+cmBr3ZVxGcScwMxy0cGC0jYR+Lg1ODG4JcDLec7GmmzUm8NYef?=
 =?us-ascii?Q?dDJ4d2PTXEf0/QBjGjGDHVc+All7x+9If3TJSlGjQ6duKrd+zE4MJKOT5fUE?=
 =?us-ascii?Q?fQEVG1QvcFg1XOeIzy30qJrNtus9OZOJSaoyvdnEmXTUV6xLEfizUfKY7xbS?=
 =?us-ascii?Q?TtYqaT0SwBKQ0VmHpeb5Y8SnXJGB2DWyinJkD882gWRjlUR6rgPzL3f1hdaU?=
 =?us-ascii?Q?5t50wZAZYeT9n+ZLLpUnELIMGnw0+liGwM6OnB/IOl29HBPgdv9b9me6h2UQ?=
 =?us-ascii?Q?suo6GP5IxpiPD4DPIE9NW5Xs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xMPbxJqLJhV/becjtAWX53rTBktZuJqln6r40H6yigQH9KnYVMxlC7GG84K6?=
 =?us-ascii?Q?wPrQAIW+ko9+PtoOc4oxP9bS1ARd9SGBOOvDoPxZ+6T6XwgjCHyqlDGMriIZ?=
 =?us-ascii?Q?doRgvqP89YJefgglXmTn0YbxHufpOO9MUhDlIAKVI03bhWAC5Y7neADygW2P?=
 =?us-ascii?Q?fxiw0RGkAHB1571cV59HuQl6GkQv1SrujL4I338RHFb4CWDmQxYkdhYYHkrr?=
 =?us-ascii?Q?fIzWs1C7LBAvK7aStXG2GrWedhtesQSNgq4093vJX1oMc63fTyrW5uqhFYU2?=
 =?us-ascii?Q?0LGmUd7ApYHWLqTD/L7nQivP2DxlxaxH4t8QIXZKXlx2E7Rfkxesd8bDuU06?=
 =?us-ascii?Q?OgjcnVoBb2p0BsJawwNFahdHR8asddt+Y/3Ec/sbZLZ430/8v/7arB5dwYwG?=
 =?us-ascii?Q?kQFasAzS6D15/fnD3VGtJCWSPZdsR21t30WM+HuOdB25dI3EsTGdC3fsbjJ9?=
 =?us-ascii?Q?hXd5VbJ4Ptxrh/Qo5mCh6qUAdazUyvDb0CtXrOU9HRRe6j9PW5DZvRTLIrV1?=
 =?us-ascii?Q?6Btxqj3ErQEFMLkOCrnHgnpuH0/FErJr/lqtjD6nfICaGAYmLogSMCF426kR?=
 =?us-ascii?Q?RLOY/ZS+bR9OWWDbaaZsfUcJ4qATHIQNuuuf325dcQXDb68tLaSQoAoIoUZI?=
 =?us-ascii?Q?Cu7AJnOFYzx1iiKeMIOCoDu7D43oYoqpDGBhfRdR6cZ2gbus2b2XVbJ5ryVj?=
 =?us-ascii?Q?NAem60POCaWSna/9WiJ2RaqgCCk8yYFcn61SY971b7WxwrOWXl1dzCekJwVn?=
 =?us-ascii?Q?jex7Aitqvtb28eku9g8NgSjm57Zt68fSIOcrfbJGROOHT2/PydCgFfida5no?=
 =?us-ascii?Q?fTtYTcBw1Q1j17x+qy9gNZ4+iw8bwOI6LQ/D9dQfEJ7oHzHqPQFlLG7+X+Ua?=
 =?us-ascii?Q?ESZVtNQwogcA8iThXo9oHLSxaMLpee8s5grKiQx0FvHJ2NMnKcDpauvZOn5r?=
 =?us-ascii?Q?m0ybHUOyt3qo/1VQ9c1QzfoDN8BGWeCM6M/e47J3VjNwx+8fSxMoOp+xOqfu?=
 =?us-ascii?Q?/uX1Fzp0rMlYfO8DCvVtooPwWnCPXHCNRtl2VBarWOH6p3CcRkz8g7xR4Sa6?=
 =?us-ascii?Q?VHgyDP9eBqGDKPO7YU1GjcMk7wayKwRi0zOXrDQxUb9VPr2jtbuzB7+CJ/Q/?=
 =?us-ascii?Q?sbwEiIRlZ/9oYgs9fGaJIuVx+PYSEsPdUsWzHMIv53apENccLCIvaQco9UK6?=
 =?us-ascii?Q?MGdK26sFu+TZQk2jR6hqQFbsFFhEpz1tZCicvY2N2avOs+zQaRu9nJaB7oRC?=
 =?us-ascii?Q?zPDvwbn3GyvmvdztBiQDQhOz+LmLYSbSRFRu6Xon4teDr/ZI0U70xd4758A5?=
 =?us-ascii?Q?1+xTZYObmbwGIDmaYBSqiIOkcUeywoIb5e/U8Wu9uenNkOsSak3jjmStMWGW?=
 =?us-ascii?Q?eK3MpEa2kuEm6pQ9sim8icT+J+TSw1q9VcYrzxcrg9ktifv+ecIhtJtFb30y?=
 =?us-ascii?Q?+76SMQ9YhF96JxR0KknZBiXgBjs9jFB+6uk+rQdsRnEciQFPnIgG26mx1+NB?=
 =?us-ascii?Q?ZtCowfupaVhaYg+hhZEOEiWQusngDri3miGZxaHCCTdBapzTU5JGVwOx1aYC?=
 =?us-ascii?Q?IXJ07W95QPcqVLsRnF42QOjzpmqkI+u2QhUapuWrEpoPZusFMYtw5H1FXI9V?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36931535-227f-4ce9-2b4c-08dd7351c423
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:21:57.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOvlxgROp4LkiNowQJeARZUP14jXsYJl+jv4JPJ9aQNpT6bLChmJNcn07YIKYQEtElwauxHD6/EdTcttRnApew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8919
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116570

On 4/2/25 17:27, Khem Raj wrote:
> On 4/2/25 4:29 AM, Niko Mauno via lists.openembedded.org wrote:
>> In order to facilitate using e.g. dbus-broker as runtime D-Bus
>> implementation, change the Freedesktop.org specific D-Bus runtime
>> dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
>> variable.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>> =C2=A0 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-=20
>> oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>> index 2b6bb1011a..a3e7c9ab54 100644
>> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>> @@ -46,6 +46,6 @@ do_install_ptest() {
>> =C2=A0 FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
>> =C2=A0 FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
>> -RDEPENDS:${PN}-ptest +=3D "dbus"
>> +RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
>> =C2=A0 # It adds -isystem which is spurious, no idea where it gets it fr=
om
>> =C2=A0 CCACHE_DISABLE =3D "1"
>>
>=20
> Thanks for these patches, as I understand they depend upon the changes=20
> in flight for oe-core, so do me favor, consolidate all the patches=20
> needed in meta-openembedded layer into a single series and send it=20
> together and perhaps send a reminder once it gets merged into oe-core.
>=20

Hi Khem,

the last remaining patch related to implementation of the new=20
VIRTUAL-RUNTIME_dbus was integrated to poky master yesterday.

The associated commits now in poky master branch are:
https://web.git.yoctoproject.org/poky/commit/?id=3D0ecae4c6333de30802cc468d=
699289ddc65e7aad=20
("default-providers: Add VIRTUAL-RUNTIME_dbus variable")
https://web.git.yoctoproject.org/poky/commit/?id=3Da39bb35ddf484fd8160dc2eb=
1fabb6a92b07ecf0=20
("dbus: Allow using dbus-lib with alternative D-Bus")
https://web.git.yoctoproject.org/poky/commit/?id=3Dc4b1070d55fa69821c5a274d=
bbcca9e23e016aa8=20
("systemd: Support using alternative runtime D-Bus")
https://web.git.yoctoproject.org/poky/commit/?id=3D84bf6e7e430d1c61ff400b81=
7530fd54b410a85c=20
("glib: Support using alternative runtime D-Bus")
https://web.git.yoctoproject.org/poky/commit/?id=3D9286f1e4aaa4520bc75ea776=
4c5cbbbeb6a67d4b=20
("recipes-connectivity: Drop dbus from RDEPENDS:${PN}")
https://web.git.yoctoproject.org/poky/commit/?id=3D340d9e28e1df2e0d4a8c351c=
8742064268f8ad87=20
("dbus-glib: Revise RDEPENDS:${PN}-tests assignment")
https://web.git.yoctoproject.org/poky/commit/?id=3D34b7b0f86de95451f00ef117=
459ec403770e3cad=20
("packagegroup-core-x11: Drop dbus-x11 in REDEPENDS:${PN}-utils")
https://web.git.yoctoproject.org/poky/commit/?id=3D5dfca64b78375de279b6ce7c=
9bffcaa35db5dc17=20
("dbus-glib: depend on dbus, not dbus-x11")

As you requested, I have now submitted the related meta-oe changes in a=20
single v2 series:
https://patchwork.yoctoproject.org/project/oe/list/?series=3D33314

Please note that there are also two individual commits to different=20
meta-openembedded sublayers which I submitted on 2nd April and which are=20
also needed,
one is for meta-networking:
https://patchwork.yoctoproject.org/project/oe/patch/20250402075935.2165902-=
1-niko.mauno@vaisala.com/
and one for meta-xfce:
https://patchwork.yoctoproject.org/project/oe/patch/20250402075322.2162189-=
1-niko.mauno@vaisala.com/

BR, Niko


>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116523): https://lists.openembedded.org/g/=20
>> openembedded-devel/message/116523
>> Mute This Topic: https://lists.openembedded.org/mt/112044576/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


