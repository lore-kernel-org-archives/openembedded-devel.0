Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C897E7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:55 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.29])
 by mx.groups.io with SMTP id smtpd.web11.8724.1733297911534357437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 23:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=K8lrBA68;
 spf=pass (domain: outlook.com, ip: 40.92.52.29, mailfrom: akashyadav147@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1dZa4Mti7/GiannKwXXh2XKJrfaZXzKZd8d6xFFgmQ+n+5EIw65NfHhUjwSqGhsxDxTt8tsV+oamlG5n5bDdFvUSdbLMfIS42sugSBkfAEw4oLbJDNqb+CLHp7gq/KGl5uj5Vsy1bBp/5LOi9sxqP9SJG5Dap0rm8/XFHDHzFd5mrpEzRV58Ek9EuGBMALr/hwX+/KcD3175hH91C/lKLdAOgRo/Md1vZt5nPqtGit9A3Zqqb89VwwKGn3UBxtXERFuXEiBLdPG8Y4i6ZUXJjjfb4zF5ddwoBaam9QY/YyfxZnkb5qoyqj5n6WMxj9bN2DP+mECtBLoTYQi/P1RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLZibtpMpPbtKm3kBeQEenjP6g0yw4FyJtvdBcP8EmY=;
 b=AkqVPKWj4rlz/fs4jlU0Gtmdf3lsUG8buLnL8VA90Imrj1AE1X5AlRAuBlEZ325B8PQ0hCsdU2DuuZpgAiBcgQYs28nOXXMbiXybxPovbp8Eaa6GK7pWQiohzi4EZg6Ur2Za2e9FxAhuyjo4tCTtTyP+VKU8VRBr4DDFLuLV+GnIaeVOK4vC/A08FCrsczuP27djpQTt9VjWPZmf5Udv0vVsoMPBX86HxPVdg+GHIzZuyKdIIxqxAVkulVVgCPXLg11BvpsQAyoZMR13/wOhxLucbg+1OnOEs53alEwPutpGB/T/Cgpn68jSVeKaTlENjLKEADtxMQoOmim00Xac1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLZibtpMpPbtKm3kBeQEenjP6g0yw4FyJtvdBcP8EmY=;
 b=K8lrBA68ZPLm3ci82QixshBSZ4c2UZeVOXxHzA9oWDct4xLDQ0eEqCpFtrRyK6Q9QN8Hn83YucPonTCbqbXsEQ5BDfTMlHmIhmSgDVJlO/tmylMw0iGmtNwDrpVsBANccnxRHcrvOHt5AsExgYKyU9LESgLeMbCymec2QAfI3xXhkC+Mm5wb79VjOvEg6go08dt3dZPVY51LCwi7kPrgA06X+qW2tIlTRDRy4K2tgG0mvkqp9X9Phj8DBJ6rcZshfAwYs8RQkV+AGpzusfI9I8nG9Gc4QUTKDE1qC4IYA295YmTTUg4d9i7EiVP859vW4nwDCPj8tOwROnR+APwyvg==
Received: from PUZPR04MB5229.apcprd04.prod.outlook.com (2603:1096:301:bc::10)
 by TYSPR04MB7714.apcprd04.prod.outlook.com (2603:1096:405:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 4 Dec
 2024 07:37:33 +0000
Received: from PUZPR04MB5229.apcprd04.prod.outlook.com
 ([fe80::96d6:a058:f847:77b7]) by PUZPR04MB5229.apcprd04.prod.outlook.com
 ([fe80::96d6:a058:f847:77b7%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 07:37:33 +0000
From: Akash Yadav <Akashyadav147@outlook.com>
Subject: Site Design!
Thread-Topic: Site Design!
Thread-Index: AQHbRh9ghHTIVqGm0EeEmi892IzuMQ==
Date: Wed, 4 Dec 2024 07:37:31 +0000
Message-ID: 
 <PUZPR04MB5229374691E646F213DA4B10F5372@PUZPR04MB5229.apcprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5229:EE_|TYSPR04MB7714:EE_
x-ms-office365-filtering-correlation-id: a47299d4-3174-4d30-30b0-08dd14368407
x-microsoft-antispam: 
 BCL:0;ARA:14566002|8062599003|19110799003|461199028|15030799003|15080799006|7092599003|7071999006|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?vTrye7Ah41Sxmoi+/w0GDrq8/IQmD6uVi0tlUBlIhMPOIsmreoWrqrUF36?=
 =?iso-8859-1?Q?jbcaitlqAnmxF90QDKRiqMp/Ya7xCg0mTXqgZaR+o16GbiiClJ1VmgVMGX?=
 =?iso-8859-1?Q?C096tKpd+rgvz39Ri9BEt4ioIadUFkMyPqz+ba8OBP27vIOkOUt+CbhyC+?=
 =?iso-8859-1?Q?8X0SCimVlwqSkMbbvAUFzYEmrVp1EqQ0WbiYeefHxtHIMq81K7K8PnXOQz?=
 =?iso-8859-1?Q?XHWZp68LISOSeDDLSL+hSt/8tyrKWKbHcpE5xEJoykYIWXfLDvYu65x3FK?=
 =?iso-8859-1?Q?h5lXgIJQZf9w2P/ZydPl7OF5EEbBR7k/Vz5cW3MN2uhIw9lIbV4YEdGlJS?=
 =?iso-8859-1?Q?w83XpUarETWDwfXP27MaJvQPpCh9KuXvSEA4Fjl6/ae68VhHpk82Fmapyf?=
 =?iso-8859-1?Q?sWKxIen5862pTE091m0YJ8bLzKPEDMO89+jIcLlzcws5OZKqyZgssQVFDd?=
 =?iso-8859-1?Q?1lKYCy/VNi64ZIE60L7zok4QPbncDvA+8q3RbavcD2m2tqqAnWklOD1zI7?=
 =?iso-8859-1?Q?8iJlxDRNkZ7T0gt4zzRHLZ1m5zPOBPtgw3BBXKHmwLnZMp9tmJhk5uGqoN?=
 =?iso-8859-1?Q?HFiFT9sMxd7hnvcVcJp49r9WuyV0RA6zAIJzg2OuUJzx73z4itG5Wu6iXX?=
 =?iso-8859-1?Q?Ddvhb9flW8NGW91678YoGsTz/W6NwXmPCzoRT+XtP0E5Mn2G0GPdgchLhP?=
 =?iso-8859-1?Q?WGmzTqnlZquXwgWJ2ZUcNtt/rVT4FwPwsoc566pEtiaeNO8AhRMNpL1ALw?=
 =?iso-8859-1?Q?1tTIDcKAb4dzSHLPiEW5fpoiDXokdy/EtwoqgfSBXDKqCVeLUt1RfCFkyF?=
 =?iso-8859-1?Q?DakKWaZJE7RgdUWWdL1KbelJr+8og3X2MhSUSQ3751/sHZ4M6DvQAmhgtG?=
 =?iso-8859-1?Q?5wDwq8aVK/2kz85ie0hD4NEJ3vqbo5DkEs41IjP+aqqTl4fQWkOwnh3xi0?=
 =?iso-8859-1?Q?QUtZu7hUMGVzgONtIW82O+ZG8jbITyQsViZGH7xXe6UnSnUjbtvJliGp0M?=
 =?iso-8859-1?Q?670+bkMmLRxX7uIBsRv+QwiAdKz5LWuKH5qqgMK4sZVFP2igQU+vqnjx+t?=
 =?iso-8859-1?Q?eNPagccl7p0/ANk46n9yiBfBWs7OquDIPzQH08ykWkXJAiB/BWjXxysHqR?=
 =?iso-8859-1?Q?L0UJ8ISOu1JHDIlje4aAw4HHH8Dpg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?q+66RLeOZwZD8mMDhFoap1xnIaM7djhCkhG51YUIpzMRK898NFQAM2cBJ1?=
 =?iso-8859-1?Q?CSQry9QZkOD9l88RB/TinLA/RN5hKpyS1deSUMshuHBiJ/dkOeZnI6ykQU?=
 =?iso-8859-1?Q?oEyulxQLDLSKcQexoK4g4xFM/ZlHvNWmmOv1kiq0xHWKfqeCUkViEL/YxS?=
 =?iso-8859-1?Q?QQsgcf+QmKIc8HOQfUNRvQVFErSe/16GXQ6IrJ7t83XRguWKbd/3u5ZHr9?=
 =?iso-8859-1?Q?hWoZJ0z6yir6eWDlgydA4P0NXiPKoJ1os1mcgPtowTTAg2TNsbDRmE0DAj?=
 =?iso-8859-1?Q?d68Y3+eUw/+KNbe8R6/9HlxXLF65dPzm12/8ulcRi+GqzbJlB8ob9dp+Fk?=
 =?iso-8859-1?Q?kKfyscD4Hku8UiwLrMcyaL0L+RaQpKemHFNMu/jBZ/WoAYOYsOWbvkCac/?=
 =?iso-8859-1?Q?rUeSMZkYbQK7RRl1M2TP0GTUtdQ3pgieA6ffJcIAARQls3n9M7ayC5tTSe?=
 =?iso-8859-1?Q?cv8HKtSQfHCl6tSF0JX4UQEMgm86LgL0XPVulUu5oSmVFzSeqFavyfsiZj?=
 =?iso-8859-1?Q?fQ46Xo2X/vp76llqFRAQhloaFQn7A3hGWDe2Z7fj+32/NgurWE4j47iGsu?=
 =?iso-8859-1?Q?mO3XXfiXnQnmLoiGKFjcq7aMXd5VlBZgrLuDByW0OYeZHO9IX7hhBF67hI?=
 =?iso-8859-1?Q?kyx4pqze2jDEyJMYb/A1URitc3osuBE1C6ePeCOOXiv49T34d/zfOg4CBD?=
 =?iso-8859-1?Q?+wbzkJwxCfr6xKrADY7wJNNGXeXoUsCCKc3NpVBkhS/zg6yYcs5wrd4bN/?=
 =?iso-8859-1?Q?8dwSkIc1G+DvvvJefhvmI9PXHuY+wJbOJeYu+REyCpDn2MOtov17m0Gbcg?=
 =?iso-8859-1?Q?g0QZ6DFXJ2dEIB8KDmhN2XZMjq/NAzlCnCq2Fs5W9pzyj4Yewoj2N9jhJS?=
 =?iso-8859-1?Q?2G4ui7DXsYSomv6kTTAT7MtLDxt9vQn8SRn7bRCW2y/Tcn5jWk9U3bW6f+?=
 =?iso-8859-1?Q?nGvv20CU7sqWUnchgct9lZ2NeJJGZazzNzlEHrB882h2T00dLDQ170qMAm?=
 =?iso-8859-1?Q?u+vuLDZJzSyn3qSkDCB3fiGm/mvln8kjZLJAd5qhIaGrLyorwAURmW+4/+?=
 =?iso-8859-1?Q?lM7iwbMtZCSwCumo+q+X8LJRjFnOz0FINe1LLsKVAILsLs1ks4p1YdvpCH?=
 =?iso-8859-1?Q?0hY3nttqRw3m7nAWOQUyzPrqFmv2QhT72CEJnaARRW+2ZdJr702IbRQJWa?=
 =?iso-8859-1?Q?1gG5DHiEJp7UWwtRwuO2OCLE5YWcNh2OK5M1PrqKtTNnnybgeVPUYl9V7O?=
 =?iso-8859-1?Q?NQT60GkhPsvLyolH/7WrKNorKOR9Xrf2Nn5wqGE0s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5229.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a47299d4-3174-4d30-30b0-08dd14368407
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 07:37:31.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7714
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB5229374691E646F213DA4B10F5372PUZPR04MB5229apcp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114229

--_000_PUZPR04MB5229374691E646F213DA4B10F5372PUZPR04MB5229apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
For at least the past eight years, I have been employed online as a profess=
ional graphic designer. I create original, well-considered, timely, and eco=
nomical designs.
I work on e-commerce platforms, web design, and other marketing campaigns i=
n addition to creating new websites.
If you're interested, I can send you an email with a few of the websites we=
've made and the prices involved.
Regards,
Akash Yadav

--_000_PUZPR04MB5229374691E646F213DA4B10F5372PUZPR04MB5229apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
For at least the past eight years, I have been employed online as a profess=
ional graphic designer. I create original, well-considered, timely, and eco=
nomical designs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I work on e-commerce platforms, web design, and other marketing campaigns i=
n addition to creating new websites.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
If you're interested, I can send you an email with a few of the websites we=
've made and the prices involved.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Akash Yadav</div>
</body>
</html>

--_000_PUZPR04MB5229374691E646F213DA4B10F5372PUZPR04MB5229apcp_--

