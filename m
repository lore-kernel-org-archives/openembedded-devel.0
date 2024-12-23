Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408DCE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 15:57:25 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.42])
 by mx.groups.io with SMTP id smtpd.web11.15701.1734969438142430681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 07:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HWIDs3KQ;
 spf=pass (domain: siemens.com, ip: 40.107.104.42, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNdxDG6JstjH5ERhBJ+ZIlR8RzkQ/QFPNSaqbRugkgLAMnpZtdEfplmh2rVZRSjSIta0LF59/Vlus+HAzzxQFPqWobifI7nMfurvKArTv99VP5if+GCN9kg9UNY4aZsos/3iejAgrOEYgLeEw+z1DZfbiCq0FAxTz5Jy4WZV2TlU3Hz2V48fyN+GC1V+xAp15GLix+pbMf8vJjYtbjN7NtfUaZWWjfOhWDfKo4VrA7Meygc45zBKP66oYJZEtpoeCati98PS2l1DA7acPbVhAcaUOajMF4+L5XyvONraOdasyPSy1ErsH65fiuBo14cR6AMh2jcNEzpbpfdTTNiIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrZJ5zeEYS83/tACHtbN2cCu7M6h8BtzJqMD/yqFv74=;
 b=vGYoRJ+hR+sutKj7pcSoQPoEnrjudCTINBvh+pWMGi9tZ0xQvhd0EXqCy5U3yyDHGP9nc9cB6e8yD1RKrWKQz/HF22pnqx9sIxmQKUtpjLd4ks0zWL2nJyb1STg1amWvR6prbn+7Nflj7fZLJf2EmLVC1+AvBdo2xPC6V7YQPW+7TvdegdQJrNdW7Owq9drJR3ff+wM2vRqrigiN+s0pg9VQOld41+3hrLaKtup8KttKf/hFAeqMZ/wAbfNqmPpcyvHuL/W3ejoX1C8gTJ9PLuBeJCVCOw5iRC7mrO+F4zOpMJekTjhhnQBQddMoyFV8N6tbj0L/TpPCqs9LEAH2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrZJ5zeEYS83/tACHtbN2cCu7M6h8BtzJqMD/yqFv74=;
 b=HWIDs3KQ9IfGJOyb3XE0xJeCWe3tUg8dpDJxTdeCPfNbs5af7tt0CLsgGOy/oYd3ZvxtoOj9NnhlIb9eRgkqS+iZmkI2VO3oXsBFJNE9SJfPExzV25UnEvggBx62u0SRytSYk3XGr5v4SKXlybzfeNgudtJLrtW9faVKGvYQwONMltfeY78lJ0GZuWbgWnkZNBWm/ovl17fbItsJPgvpQsPqpMUfBBLBNVgi/Os3sIMr18aLMW/+KcZsalBlwxde2UPeBIA5LO93dO5OFAotZHjpLb1ztjR7wRFZsZlXTHB6SBZaURcGtLansOzq+ojbpUjElqXeptVsMOcETZwxNA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.11; Mon, 23 Dec
 2024 15:57:06 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8293.000; Mon, 23 Dec 2024
 15:57:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [kirkstone][PATCH] asio: upgrade 1.20.0 -> 1.22.2
Thread-Topic: [oe] [kirkstone][PATCH] asio: upgrade 1.20.0 -> 1.22.2
Thread-Index: AQHbVTAwN83mQbeZH0Chij7gMjAiBrLz+5lQ
Date: Mon, 23 Dec 2024 15:57:06 +0000
Message-ID: 
 <AS1PR10MB56976343BDC7755C46E2746EFD022@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241223114524.2164089-1-changqing.li@windriver.com>
In-Reply-To: <20241223114524.2164089-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0eea2c2b-84a0-4e75-8e19-8d48b218f4e7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-23T15:54:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3240:EE_
x-ms-office365-filtering-correlation-id: 642fc281-2b01-4a1f-8760-08dd236a7330
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?l3ZgeTC4dlg4HfqXsOljgvJGVhnNUgsJ/QBoe5dJeFWEF7Y8Zv38U1CUc3Z+?=
 =?us-ascii?Q?H+/BfRyQtVUz5LQuuvr/VzU7Cvo2rYzzY+UQ29TKy6041RKEsgT67B8Z2h/R?=
 =?us-ascii?Q?g45jxFdfZkmwt6a8xxkrciROAUBHEydtnnKoawPC5uaA/ztoU9OAI+8ccXcW?=
 =?us-ascii?Q?igpx83TuBu3oZCgauV0jaUCBPHz8Lo7GPj8nlI73+ksmszPCjdmZ9msKxbFu?=
 =?us-ascii?Q?PTwOCPCZLCVWyn05BFRUMBNsRhzpiwaDUdVQqCNxA4DNXIh2iN26DZEnPq9Y?=
 =?us-ascii?Q?lDCXNGMTIjC9tv+f7IRsEZd0KtFpJIWkLolYj2oY0LARgD53uMnvfVKKO7t9?=
 =?us-ascii?Q?EE3q46HwPavGLcRQxAidchWrKqmjqLdhI+gKtH/e7M0TnmZBbwoOwggCG6gI?=
 =?us-ascii?Q?yt5zi15EjsRvN6soJPbT+Q5jxN6QZQlb6LC6I/3rbNH/nZfy7V2XFBu7mOV3?=
 =?us-ascii?Q?/QMfBwOcup+YiTvxyVzGgIAGZ4XHOGg2ASa8PNcQ6jSbfcfZ4Cp4z8YLNVaW?=
 =?us-ascii?Q?y24kDdPpFwT4X6WwTCcaOm5XQZpD8SypiO68G+kOxrupokHtFyFj8TisGFfG?=
 =?us-ascii?Q?PK6L0NnB5vGLsON/IuHhVG/Ex3ALa+4FCDdn13uGUhxjKejK9zNkqx+snFJX?=
 =?us-ascii?Q?sVcV8jKqX9+FptP0O2BxPuUZXKqIQoWi2RoEJAErPi4RcmEW8cZ6SbWey6uF?=
 =?us-ascii?Q?9PaH/zcZDZAV/x6cawd9tUNIvFuvHrHYUL1QsrHRUDpsUgRQT2OQCcYw66Ms?=
 =?us-ascii?Q?1GqKrCxvSxB8wqpbftgYpjAvJfIZGmDwl77I1j9EwctIRzubJHuDQGxoEnxk?=
 =?us-ascii?Q?fOYlEsBctgKQT+3elxEfNo/s7XZIhPlBS86I/RCETWsKD2hvg9NhmY6ZvU6s?=
 =?us-ascii?Q?WLpOLmLIus/cQLddU4F2dAahMkWzAfIlwCX7tq4aWy/kHOzG1YOkZice/lCE?=
 =?us-ascii?Q?igqo4dMLvpzgAoppXLA8GRZTxnJWjOpktfxFlQzSH0KOToIqcLm0/KFLsJpz?=
 =?us-ascii?Q?/inowf7U+DA6/3U8UlBS2x61julfxVyJqetisLx8V+5GDKeUBpSicq5UpDsF?=
 =?us-ascii?Q?b9pMouvRaU+b5ZyKzFskePMPoIJ5mlRPNG1VU3fkMsxGv9GahEgxkGcSTOao?=
 =?us-ascii?Q?etJS/jCFNyTRTSA/8LpRXoa8f42qBqw24TGihacXtC+O3aNF24M6WEYnYiBG?=
 =?us-ascii?Q?wZTRHGFNMnC6SUh6gadc6fd2vyRU0sm3/5SP+xIVocteJODS93+1J5Idk2CI?=
 =?us-ascii?Q?VVyWWD6FKIl6pyjpQ33ezR/lTwTOm4xl9q0mEHg2OQtCwT2hyghtO5w1upTY?=
 =?us-ascii?Q?9/LfycWqhJ7Og+ZC8muDMNCFLW1nXeYbzGoD1pD88ufInvSLqsWTmrsHRT5P?=
 =?us-ascii?Q?qhKChXcKOVL2UdVf63gg8zzx3hUj?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Yygzb31YP7TlfnoDeWX2icKmtMaM8a7dKKemfax58acBEH+ah4wRK0G0k0aI?=
 =?us-ascii?Q?wSzle+IizXZPQnMcqbpuzbJBupxorG9t3RuXsUAu8pvjRrwjHspkRW9M36ix?=
 =?us-ascii?Q?0fdcJV+eRYQgPKXvis3am/+mjMBAsPry+3ppIzadWwMr5UH77BUG0CHOAysI?=
 =?us-ascii?Q?vbX0Q9s8J0d9g2q+xupTJlbUPz4yx4fWiU+ohRqS6S0dLXfem38QHAViTRtI?=
 =?us-ascii?Q?7+ZQ4iOLAyrzA2Xk3UiBbGlSMDe3MiaroJH3bjncI/PhBqhxN0IY1S8fqcoR?=
 =?us-ascii?Q?yaOcORV/UOpEA4dysoHJ2IRZVb1AGTnAUJCKfJotjTHnii9qnGVHx00F9Qr4?=
 =?us-ascii?Q?dOoWEmbOWaEj/z3eYtpGsTLnXJFq7MPwGBkhqC3Gs1JGuI7sBlZ0lXa1ys1K?=
 =?us-ascii?Q?1yEgjpDlHhg4QR+jmHTzATsiI9E8ETgoudIup0pNWsb4gU2jWr5kW766CqVf?=
 =?us-ascii?Q?11n/tmpUg0142S9K5ZBgy+2fxNT3gzOxUCFOwEgYVBTdytz1jTiCls9uV4vg?=
 =?us-ascii?Q?UJa0cIZojOSxSlgR1k4KIBZgr8IOIHxv/91MTDg0PcHXWqFYK00L65amOUD1?=
 =?us-ascii?Q?+HVtWbW2qlUNI0QbBW9HcAYyQoy1rjQlwIOsmw9OZxj4Y/QUeZBwWD2RebhK?=
 =?us-ascii?Q?zuchRG+lyCrzpIHQm/282KWiFZFhq1eb/Mq11dd8rvBXz7ZE/uDPg+2ifwKe?=
 =?us-ascii?Q?NdAs9B2T2uVEVfZETYicGA7L6RgcxGKDuXUScuB6Tl0c6nJZ0Q/lZ2WEb8rc?=
 =?us-ascii?Q?m712DBEjDosvS79pZ8K/WBJ1Fm5Yy2wL9gIDQgex3dNmJ+pMobeubRcZoFEb?=
 =?us-ascii?Q?fXKAoaLf2IDztsloi8qTzozx3j27Qs03sUliGdumIFu1Y51K2//m6/iAAR4x?=
 =?us-ascii?Q?V9P4Lj0/Cw1nudL5sxntGf+Cxz4TNdiN+MxyUwXPO6VVYV2pnW0S+F2AOLqp?=
 =?us-ascii?Q?XUptRZn4C+Bxt/x/0F0qJrbb3Wp5VKfgPWCKFpWUwdcp2CvBdnEV4ghOEUG0?=
 =?us-ascii?Q?QkBH5RAU7xCDzfiVGIJrpitWoE2puP/lUiUP79VtKRkCMuxsShRGedTVCezp?=
 =?us-ascii?Q?rcQftb0V3uMpE1LmYJk5jZJvbU4/K9OOPxZq7Wf0la0MV+sRoJ5gaDtTfTrB?=
 =?us-ascii?Q?EBAc23Lhu/qn1qHyT0tMEge5HAiS2WyvlmfsAcmni0cALyIgn2hXZM4suPzM?=
 =?us-ascii?Q?gb8ZJBq6IiVA8scR3ZP0f1v/xjTYoy7kzC42Nmtq/m/b5OGKQOyxiaeaouZk?=
 =?us-ascii?Q?jjNt+YSPk8wEwCXgd/lvRV2GyCiuj4y9P4UUxVOQSksaj58DcuqHUCKE8kem?=
 =?us-ascii?Q?JL0Xf2AId+myvEe5PIiXoCF1485s/aU0ie43+rGHtscRcdLEc6IlkMCDfiOF?=
 =?us-ascii?Q?/NBEp0eeoqqbUCTBBuDDyjWCMMQGsBYQs4NTHuD/zQROOOaIJRLW7RzKiD+a?=
 =?us-ascii?Q?aDf/f5GRLKII4oNxaoFbnD+3Kj5feoAVAuR+bRowAG+RHF3DMr+Wz7tADY+r?=
 =?us-ascii?Q?m6GA89WJa7lLUwwKTsfyzgcdJnLTPRiu7OkJjpiYhYrENWKyBHk8QEEoJV5r?=
 =?us-ascii?Q?DZ2H8ZWWeeW9sRB+mB6V1JuszbyqomIKS6Do8Ane?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 642fc281-2b01-4a1f-8760-08dd236a7330
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 15:57:06.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VdJECL17RMXI11hBIPme1spr4uLR/gxguZLQdCdYfHVhmRZ/g8TlL89chQ4Yuej+zmupGj64YJxYcBN2IRlZCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3240
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 15:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114471

Feature upgrade is not allowed in LTS branch.
Especially in libraries where interface changes will require to changes in =
code using them.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Changqing Li via
> lists.openembedded.org
> Sent: Monday, December 23, 2024 12:45
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [kirkstone][PATCH] asio: upgrade 1.20.0 -> 1.22.2
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> License-Update:  License Year Update
>=20
> Release Note:
> https://think-async.com/asio/asio-1.22.2/doc/asio/history.html
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-support/asio/{asio_1.20.0.bb =3D> asio_1.22.2.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/asio/{asio_1.20.0.bb =3D> asio_1.22.2.bb}=
 (87%)
>=20
> diff --git a/meta-oe/recipes-support/asio/asio_1.20.0.bb b/meta-oe/recipe=
s-
> support/asio/asio_1.22.2.bb
> similarity index 87%
> rename from meta-oe/recipes-support/asio/asio_1.20.0.bb
> rename to meta-oe/recipes-support/asio/asio_1.22.2.bb
> index 5e7a6e2495..92c43eb990 100644
> --- a/meta-oe/recipes-support/asio/asio_1.20.0.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.22.2.bb
> @@ -18,9 +18,9 @@ inherit autotools ptest
>=20
>  ALLOW_EMPTY:${PN} =3D "1"
>=20
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D416f4cc4f79551b690babb14ef1a5799"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6f4e83eac87b54ce7fe05f0bddd9cca6"
>=20
> -SRC_URI[sha256sum] =3D
> "204374d3cadff1b57a63f4c343cbadcee28374c072dc04b549d772dbba9f650c"
> +SRC_URI[sha256sum] =3D
> "776bb781eee8022a3eed71de28f05bf8ba09741db2e57ad8cc420aa0884cbc6c"
>=20
>  PACKAGECONFIG ??=3D "boost"
>=20
> --
> 2.25.1


