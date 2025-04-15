Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F6BC369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 10:08:23 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.39])
 by mx.groups.io with SMTP id smtpd.web11.14318.1744700710355301715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 00:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=nqtMU+nG;
 spf=pass (domain: outlook.com, ip: 40.92.52.39, mailfrom: caagearup@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIpcQp8fBCX9IsHtrWpFIISXI7vcYkRX+VVp8+8GIYOXFly9LJqgq1TrOVqyIeTzCN9HQGFCZS0RreyTos7LQm6sHBWbsV3Z5usjibN2lm53sK5f19bHk4FHNBehKeD1KZ9yyzHhHrplPrO0S9vYh+ODFXkLUDs51NwnB1+I/BPCp3fYumyx0LrtSC77kVcEC5yx7kGfuaV1VTuiiQriPEJEznxrciMOP41kdz1+metp2NzeIt6b/iGHDIBImcnLMCcUjy/u4k7aurNjn5Xoiwn5Sfc9PdzXV4pwa8SXa43qpwy6MYY2Rmje2H8y9uAguyu3beohJMkGSIfUr4amuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmTaj8haS3hLUtVbtSrDxajEqz5HcSCrv5hB+AWSqrQ=;
 b=WKeppdSkfjmC24IXjK2h6urqLz0+piZAMKDLy5V803zWKyoxXfuikdyD58Q/jGloElSHxK+qTdT7NxqnQNLaHasd6+c+36xD1o5SlEzpaSsQdnX5jC1QkghHfi/mv3iLzmUpL87v7cfUjTDn4iTsYtXXE74D6tiHy2WRb7e6SoLjreRMlHIWIENvixPzf/+h46dT9xymcxFrY/d6rLPfgygEfEq4paxjS4N8PYe60n5+xr6yLsMWrSHfyudh76Iz4507CX/gne4ydwCZyY3ArbAhc8Cpv3+anoCweMoXvWeAnGvgiESFyv0UQp7VQ7WCSMeE/VKVfAX1GLM4TgSNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmTaj8haS3hLUtVbtSrDxajEqz5HcSCrv5hB+AWSqrQ=;
 b=nqtMU+nGK/nVVxvg5giuV32kExT5EwkYumk+XkP1Z4oG63J7enJLGbypwpzsqch+AKuOn7bZYaEyFgA453Cc3v+zIbEtyyKfg1oAvn7LR3I8d7PB46IpxgAs6rsgNvdSaFJx55GXl48WynrD/TI4nI2ej25U7NtyJErtGJ6HWOlar6k7hU/KuUdkHTGtdlV3DF5l/Ntu4/qLYvRp5rv1xPqmPko4yq61escfTcgZk8ZyDOMVjQhtEpq5CKDgxACXjDMidYrpGXxPYAbwAPwmfSMcGYj4qTg7N7aYBNTHPqzEqMiLrMNAwuuXu6ELOd7EjgHqj8G8cFPeUN/Pgmf3xg==
Received: from SI6PR04MB8223.apcprd04.prod.outlook.com (2603:1096:4:242::13)
 by TYSPR04MB7714.apcprd04.prod.outlook.com (2603:1096:405:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 07:04:49 +0000
Received: from SI6PR04MB8223.apcprd04.prod.outlook.com
 ([fe80::c6d4:630c:f500:2631]) by SI6PR04MB8223.apcprd04.prod.outlook.com
 ([fe80::c6d4:630c:f500:2631%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:04:49 +0000
From: Akansha Verma <caagearup@outlook.com>
Subject: Re: Social Media Pricing
Thread-Topic: Social Media Pricing
Thread-Index: AQHbrdSTa7wBk96iAkW4K1VelqXwzA==
Date: Tue, 15 Apr 2025 07:04:49 +0000
Message-ID: 
 <SI6PR04MB822336A0FBB3267EA3FD8B49ABB22@SI6PR04MB8223.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI6PR04MB8223:EE_|TYSPR04MB7714:EE_
x-ms-office365-filtering-correlation-id: ca85b0b7-4fe3-4a89-b933-08dd7bebcfdf
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15030799003|19110799003|7092599003|461199028|8062599003|5062599005|7071999006|15080799006|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?P5YUdmpQQg3VH9qMQfKve32Eh9pIllp2RX+AoJDMmeoLK8WYVhslyRNh?=
 =?Windows-1252?Q?ZMVGjLgKHL1ohUWkrrr+n7K3Cm3YF/GAQlAQwik0hNGClB6qU32GXgLu?=
 =?Windows-1252?Q?QgUJQG4ZUxQSgXmDPlmE43jYNT1FIDVcycjrud4HVh3SpvGiZbElge1t?=
 =?Windows-1252?Q?ojLcQ/PQc1+nDdMXw8wQDSdhvA3L/GB6DfilLwCfUcgjRNHBddzxV+MW?=
 =?Windows-1252?Q?GgWdKjTZYoowWRo1Ch336s6RNQmDKQSXD/iovzHhNpDovng5iCzfRSdh?=
 =?Windows-1252?Q?cmcp20CbkQpWmXyHGivpROcXw1JqziRmwewdFcdepGQupZIKyg5eWYRk?=
 =?Windows-1252?Q?AMHQGpCx7UyLD8jNEJSjfU/x1mjkknqKor81h6qo6tPIOC6xHDXKA4D/?=
 =?Windows-1252?Q?o1NmuZjVVy1+yAF/TpHq8rXRg3FZUdrXZdSLrV3dsa6eZhD1Sd2Q6ZhS?=
 =?Windows-1252?Q?ijddkC25Y/dxMakxyrjqowgsyOujPIdD8WZqv0rLshYKiuOPLciB+/p/?=
 =?Windows-1252?Q?NfIrK3DlsQbtZFsg82T4xeS7JtO8rmbByPg3xy71suu7Ho3XeiCLtwyV?=
 =?Windows-1252?Q?4C3JVc8skc8j0EZiqZ3N8xjxn8XVM129221tSKWP+Au38QsGGE57Am85?=
 =?Windows-1252?Q?L/Q+bfyuyF7YRe251UYqkAMD9TETMrG13/lXN+EKuaHj9TQI6E1lYkum?=
 =?Windows-1252?Q?6kPRybszRFqpXwoPL6IZylsQOsmwtPppOK6zVE74Ho2h2OhsJr4RgIBR?=
 =?Windows-1252?Q?o8/8j8pQNKvZ9OBmmsI6d/RmwfvDIVfE0/zZn9vWWI9I5JeSEU2P9VVm?=
 =?Windows-1252?Q?4vpiaAgpmXOAVoNZXvvIUE1tgIYaDGzRsWCDqrmFxXTe/Da7vCntjF8a?=
 =?Windows-1252?Q?cl/99gBYG+PJq0yAB5WUQfmSK4Qz1YK0NqGMuY7JPQLD+BPfFoFdhiaQ?=
 =?Windows-1252?Q?BiWxR9Pahgc6SkfqsSWoLW0GGznLUKGURNThimAuL1mWOx6y2yd7elbJ?=
 =?Windows-1252?Q?DmzoYPUOxBUn3zN3OdVUhzmB4unwzGvkQS3EQnugSWXlLctWyOdJ6hl0?=
 =?Windows-1252?Q?AEm0xrUXy/lWMRbpHoILCFrP/sT9fQNhbTtn7g7jM3geIg4hGrelwBn4?=
 =?Windows-1252?Q?NxTc/8GmUHsJ4008tfB/yxlj5YJsTq2xQeialQ6qV1pfvHrdBdj8XYSc?=
 =?Windows-1252?Q?bdhk5x2lPT4lSU2lYMEw8h/4cCM8MiTDIpB54pjp0p6oyUhy9upLOP79?=
 =?Windows-1252?Q?+ldgC8u+hnFuBYFDLOzXX/qVM5Gu65Z1fNQB/gYr?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?QgukwkSZeMmx3PLfW4doanCFfQySvFd4gous9l2M98YSI72I6F3W/o0X?=
 =?Windows-1252?Q?MUzx2BfRTlzQr0u1+OgFVwis6jEEG+TcXxvB3tu+1RpS8jqQzYr955s7?=
 =?Windows-1252?Q?wgbnItOKwjsrmYTUkTz2fILfOSeFx6wFngu6CKcwpU+PcvFrCzc4iPz2?=
 =?Windows-1252?Q?VEMC26mGwQVEnfk/Dz4I9T4cRbWeaRfVEnozii8Bi0lfG0pxC3fH3dsR?=
 =?Windows-1252?Q?xbov/7zwlTsTxfKBdkHctLtnxaptNLuDLshXShueksKy4Ts7PJevEcEz?=
 =?Windows-1252?Q?d6FRJuJ8SqoDJOXSTi0rtSRLGaHKj5WBUUT77rHn7nVFAtmte5h4WZxb?=
 =?Windows-1252?Q?a6sIdnJ14CDesUbcvOpd8qHAofyvWozwoTdgbGgD1mFQiP1PNYlRwvQO?=
 =?Windows-1252?Q?qhzl1QMETxIidIeCow3aMBqKT/A3T+qsvYQry7AgoPrLZ6RhyXbtZZOi?=
 =?Windows-1252?Q?fy2JA8nkhKZCB37TskVLEPKULCISdkB/czsKYta3NDInXdwiS7YesSTU?=
 =?Windows-1252?Q?RPMfctiU8wlHELXLT8Ydrgdcoe8B/VmW5Ody4+PUwp5gIRyPqwybGw3D?=
 =?Windows-1252?Q?nt0BipWMWlXN5OEdFUCRQRMn5nljPYULbsWWZjqeffBYZxoWILw3CzJh?=
 =?Windows-1252?Q?HB4N9iwUQrKimWmRbE6upqB15uP2Arp3NBXE80IsE72tMDezgvVEq5wc?=
 =?Windows-1252?Q?VablbUFH3UFJdjHYhWaKSlL0PZwFfCJ6wZOj/FUZYPReLlRRgr8nOao2?=
 =?Windows-1252?Q?XGPp4VXQ/G8wPDNGpq7r3zdj/6vEaxgMbgR3Zt/Rae+L4HiReXpSAZmK?=
 =?Windows-1252?Q?L1o8lp6bl+seLK/MIB3jDgVkIP1EtsrAacVHx9tqxBPwQB6uhzISaJ/q?=
 =?Windows-1252?Q?LY1SwElVHJY6rSGEXwp4brMK78XKBaa88eVpP0+gy5tptFoqpeZyILUI?=
 =?Windows-1252?Q?64OfaqabbdM7g1l6cGM+soD0r5GCwH1QGvYppsA8uJVER/GyE2ioxjAW?=
 =?Windows-1252?Q?tDOqjBcy/P/KK5R1WHDwHXOVDNq65coraE9zhIZu7T99RBENBb1MSQhu?=
 =?Windows-1252?Q?OeqWwx4Gb7LmorrKRYhrDA3THYOGgwI7F52VEVGAl753dTqH22raSvHC?=
 =?Windows-1252?Q?lVxU+I5rXEtXxP8DEQBBrTajxWcO94Ysq+a8SSmW693GPzf6omD/+PVw?=
 =?Windows-1252?Q?A/j5HP4Fr4zMHnnDQlqj5Wqxfdbo2ETW1C4QEX+cNe6Up5LBm/mXR2JB?=
 =?Windows-1252?Q?HwGyO8+r7sSHLCqgO16wUInvE7zF768R+D9ZSUkpVOU7jIKI6sUK/gtR?=
 =?Windows-1252?Q?vhQA82yCvhxKb6V90wvMkEgRa7nFQ0WBXLzKN9A7eh243H2NmA3oI51O?=
 =?Windows-1252?Q?Y+WmQR8sJ8jP7MifiGB+RoRe6SnHOq65QCk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI6PR04MB8223.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ca85b0b7-4fe3-4a89-b933-08dd7bebcfdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 07:04:49.1022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7714
To: openembedded-devel@lists.openembedded.org
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_SI6PR04MB822336A0FBB3267EA3FD8B49ABB22SI6PR04MB8223apcp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 10:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116858

--_000_SI6PR04MB822336A0FBB3267EA3FD8B49ABB22SI6PR04MB8223apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

I still waiting for your reply

Please let me know if you are interested. In my Social Media Marketing Serv=
ice

Thank you
Akansha



On Mon, Jun 6, 2022 at 3:28 PM Akansha < caagearup@outlook.com > wrote:



Hi,

We are an India based Digital Marketing & Web Development Company.

1. SEO (with plan & activity)
2. Google Business Profile (GBP) Optimization
3. Social Media Marketing (Facebook, Instagram, TikTok, LinkedIn, X=85etc.)
4. ORM (Online Response Management)
5. Google Ads
6. Website Maintenance

We aim to deliver high-quality services at cost-effective prices and withou=
t compromising on client satisfaction.

We always adopt the ETHICAL SEO process/White hat techniques we also follow=
 the guidelines of Google and major search engine for Organic SEO results w=
hich stay there.

We'd be happy to send you our PRICING & PACKAGES details if you'd like to a=
ssess our work.


Akansha

Look forward to hearing from you.

Warm Regards
Akansha





--_000_SI6PR04MB822336A0FBB3267EA3FD8B49ABB22SI6PR04MB8223apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello,&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
I still waiting for your reply<br>
<br>
Please let me know if you are interested. In my Social Media Marketing Serv=
ice&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
Thank you&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
Akansha&nbsp;</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
On Mon, Jun 6, 2022 at 3:28 PM Akansha &lt;&nbsp;caagearup@outlook.com &gt;=
&nbsp;wrote:&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
&nbsp;</div>
<p class=3D"elementToProof" style=3D"direction: ltr; text-align: left; text=
-indent: 0px; line-height: normal; margin: 0cm 0cm 0.0001pt;">
<span style=3D"font-family: Cambria, &quot;serif&quot;; font-size: 10pt; co=
lor: rgb(0, 0, 0);">Hi,&nbsp;<br>
<br>
We are an India based Digital Marketing &amp; Web Development Company.<br>
<br>
1. SEO (with plan &amp; activity)<br>
2.&nbsp;Google Business Profile (GBP) Optimization<br>
3.&nbsp;Social Media Marketing (Facebook, Instagram, TikTok, LinkedIn, X=85=
etc.)<br>
4. ORM (Online Response Management)<br>
5.&nbsp;Google Ads<br>
6.&nbsp;Website Maintenance<br>
<br>
We aim to deliver high-quality services at cost-effective prices and withou=
t compromising on client satisfaction.<br>
<br>
<b>We always adopt the <u>ETHICAL SEO process/White hat techniques</u>&nbsp=
;we also follow the guidelines of Google and major search engine for Organi=
c SEO results which stay there.</b></span></p>
<p class=3D"elementToProof" style=3D"direction: ltr; text-align: left; text=
-indent: 0px; line-height: normal; margin: 0cm 0cm 0.0001pt;">
<span style=3D"font-family: Cambria, &quot;serif&quot;; font-size: 10pt; co=
lor: rgb(0, 0, 0); background-color: yellow;"><b>We'd be happy to send you =
our&nbsp;PRICING &amp; PACKAGES&nbsp;details if you'd like to assess our wo=
rk.</b></span><span style=3D"font-family: Cambria, &quot;serif&quot;; font-=
size: 10pt; color: rgb(0, 0, 0);"><br>
<br>
</span></p>
<p class=3D"elementToProof" style=3D"direction: ltr; text-align: left; text=
-indent: 0px; line-height: normal; margin: 0cm 0cm 0.0001pt;">
<span style=3D"font-family: Cambria, &quot;serif&quot;; font-size: 10pt; co=
lor: rgb(0, 0, 0);">Akansha&nbsp;</span></p>
<p class=3D"elementToProof" style=3D"direction: ltr; text-align: left; text=
-indent: 0px; line-height: normal; margin: 0cm 0cm 0.0001pt;">
<span style=3D"font-family: Cambria, &quot;serif&quot;; font-size: 10pt; co=
lor: rgb(0, 0, 0);"><br>
Look forward to hearing from you.<br>
<br>
Warm Regards<br>
Akansha&nbsp;</span></p>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0cm 0cm 0.0001pt; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; margin: 0px; font-fa=
mily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; margin: 0px; font-fa=
mily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_SI6PR04MB822336A0FBB3267EA3FD8B49ABB22SI6PR04MB8223apcp_--

