Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA56D79779
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:14:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47697.1770016463125368959
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WzluSM90;
 spf=pass (domain: siemens.com, ip: 52.101.83.42, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smlzMZDreN2vQ9EFwWQ2oGuPXvu3ZwpWh573L0JlEhN8c/97xeca6slD9hnKLylRdiFlbc16eehdUHJKN+NRtQ9+8N1zfSjlQG0ebjDy/txNtrOoGyOTmJYDHGl+JxzqVc85V0UPKBGCh45KneBB+tx8LjADctW9IE8GM8GYpOpfHMhmJTvrI+qgn6aBytBRZPCmSfYb9MVHz/tbhr8A5hSIYV22dNvIhyBE8RK0ftkpkR+92KYXrQuRAQyiD56o6MHiGGGu6f4zC2N4DNIhIM0rsVB7EAEqrSqf169+u9n5yqDNbnlXm6aVCqytd4WP2dhyNl1Bki8qVDHvpkiPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvWlojjAE7Eo/rgo8df3BaierAWeZ6my9swIMfwj3MA=;
 b=OoTxhvUfmy1/FnWVFmklgg6/OENBy6ZpsgQcI4yPEOUoGBy7DJxvHtGJEVJZreHnYhVdMPEBa8/Hq/vL7H3+ytLjUbug6s+HLYrhhSkNpkGQYDDPCuaixzc1kPGEIfckagAygodnrUTA3EX70ntf7o5aTLAKUEIs2RbrzcpCQBM2uB3RdatXTurIG2hxRmPn98kAiNUoKPMXnw/IdQGDIaSq73zbVi/hrj52onRpQdLD6VV+Y/DIYERFqxJP9VcESOlKzTS5U+UgXa352ziT94mIEOjMIM6TyF32Q/e7mzdP8gw/xYVFmvnr/3IKddxnJXwmPUlAhD2/bBmEpNEIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvWlojjAE7Eo/rgo8df3BaierAWeZ6my9swIMfwj3MA=;
 b=WzluSM900KBgOgo5Hg5fZoNAyWua6vxEilmMqwEjzF2OQjUPtiw3Z0+oaYY9/IaLblrS2+jZNpWS/UcAZ2EKweI1d/6zJLr0XM58f4CImNqJrYzYiKzWDUdHlVrkYTnVzqSxOb0tftpxo0uS3GNdhXXwoz8XiQXm/zaVkInmi+jnNjJEe/CQqq0PNPBs2+4JvBxJaeG9qnnnptCyZt61MHYKuAky9fjPqKQgmjKhrlYQv9WxZsZtu5L8cfA9SKiMHcMq3Oen08GMumjkF9wkbPBR9NKGx9/ry5XSo/Umc69pKow/yNNe3mSBibDIVCX4/zGczV3o2AT91+l20Ae9tw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB5912.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 07:14:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.014; Mon, 2 Feb 2026
 07:14:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 ->
 6.33.5
Thread-Topic: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 ->
 6.33.5
Thread-Index: AQHckwBJstn6M2SGpUq1lvtyNCBwPrVvABGA
Date: Mon, 2 Feb 2026 07:14:04 +0000
Message-ID: 
 <AS1PR10MB5697DA543582C59199F7C301FD9AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260131222346.307600-1-peter.marko@siemens.com>
In-Reply-To: <20260131222346.307600-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3c1a7a46-ddf2-4fa3-b60d-4f03eef1de7f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-02T07:10:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB5912:EE_
x-ms-office365-filtering-correlation-id: f4450b6b-acfb-494e-e831-08de622aa61b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?N9IpTnwu1sW85kpJjuwp6HBc0lNRvoz7oXFaRb6gyLDYwwTSMp4I8LuW2+Xh?=
 =?us-ascii?Q?+UQcA/ZRjT1ALXq6Y53r2z7sfQJ1uxdYUxshb88nlKpIGtI0Swk1bj+wdphM?=
 =?us-ascii?Q?+IJefjNrgYcl3trubT5c+Qi5Fasa+/CCRUOev6BA5ZRdclDKb4S301B1C5Vr?=
 =?us-ascii?Q?ZQVa/nZAbrb1IdUykhy1LK/ACyZ8wAjej7ILy9ky9Bc8PE4gaPTitWPEYlow?=
 =?us-ascii?Q?m2VLp0C/oGXlhV82qKEpAgZ6aT3UCfA5+znohkmnyilUaCqjlawBm77WhnK/?=
 =?us-ascii?Q?3zn58kMRRfLE8mzg0tEyexQqFICM5qU6EOXzlv0siiD2RSTqT9aDZ/J/eSns?=
 =?us-ascii?Q?57U6IeBVrVWFYMI6ZCwUoyCjFhFR7wBGmTpKwSVmj4dvusd+VsfCQFHCtZjL?=
 =?us-ascii?Q?eHI/Lxh0d4FT+YLBjR7u7Z1O/UW10DsjkMaYatXO11kn2MONWZ84swaIrU+R?=
 =?us-ascii?Q?pF6jRpKifpMY12I3wUCrGBGq9tbHNWNbNsadidkKoGE23RctVeJjGD/OJWb3?=
 =?us-ascii?Q?pFl8t/fNIofNsDlbCqwjAg9kb5H8VJ6lcywqiRpBEmE7z5WaeFXKzyGo5IZz?=
 =?us-ascii?Q?2To+VX373VxwhTvgGhWprtbehFp8vQFH6Ol0qhheB50VeS+XUozNXB0agW/i?=
 =?us-ascii?Q?MbM6fLtG2i3YMYkRJHJCqhkua3Ul1Wyp5JHj/uYq8OHpLoxL8gql3fqW6CbA?=
 =?us-ascii?Q?BKjwacs3NeUo+XAXJgb1UGHHajySuxsdMAA67ofSeHIWJlQXlnMaNpMWxjxY?=
 =?us-ascii?Q?Ktgm/Uh0DtQ2UuqV+oRS/Lf/JKN8d6dIL4c6hzRbrBnWSQqNK+0GQlU2usT4?=
 =?us-ascii?Q?jgw7X1/VkB5GBbog1NCxnjxXgQwFNYVqQ/zdHh0vr6abjqWCSu0nJY1FWpD/?=
 =?us-ascii?Q?38rQ2dN1k1qFq0WHxTeKLBNzsW8KfiFEJnY8RPWM/CcaQ2YtOjuKtbKIlCgR?=
 =?us-ascii?Q?vk6akowSc7YuLYCZemOJ4PWRX+iG2JuMCQe8bvQ9ihv6Nl+qoegZIe671MCt?=
 =?us-ascii?Q?68IRD47F0zQ0Au3HuPare4UWPw3j4MSt2TkS61JgwHOOghCDMdILssH3dOaT?=
 =?us-ascii?Q?05UEzDm8kyrW7eeHIxB41hr1vnkKPA/dn3JgzRtezAt6djC9IhDvNKRniNIY?=
 =?us-ascii?Q?iGyyLEscSBmemDC3udYsb2xpMDztNpAty1gDMAZaFn0r1D1xQKHtpkSn+O5P?=
 =?us-ascii?Q?QnkzqPF8yUxJSdt92hOSHyqdlyRVh8jE9b96aoT1LEaiclqX+KN1pTvoyt3t?=
 =?us-ascii?Q?FJP4ABAQ8Shd75s7pD+BClVG7OQiU4/Nn5MNoX3xemE1Pajc1B3NmmzQxbPE?=
 =?us-ascii?Q?pWMOP/mmVViZIZ+Aw9KwZNvxDpxykcyW9AawYBdaoxh9zeqi9I2WVGLg0lNu?=
 =?us-ascii?Q?A9/NnbSgFy03cvWwQmghNKh30ICRk9mbxZiB0xXsVcNEiSewp7qqqMEm1qH0?=
 =?us-ascii?Q?pVfF+u1GmJQYHw6Ga587m7VzT7dQRL8AggyC/AW7T/p5zavfLJ2cqognJ2q7?=
 =?us-ascii?Q?tWqdDhxwgK/RhO0I/tI/he7S4PtwqJDjbXAANH+QhGROqa2EyEh/zIiaa/hn?=
 =?us-ascii?Q?wnqQ/banf/xKNytqbyTjcaU2zi0h4kQi9gVQ2GXEm/b2Qj6gSOe0w3Eqj0rL?=
 =?us-ascii?Q?yvMXChrKBaPkKDwF3g2sOI0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?698SOVehISCK4nzlLb8BVyU8xGzho8jWCtcm6t1CQ1Qoi9ABc82xhWH+8q5q?=
 =?us-ascii?Q?jS1J9HPLHe6s445/9UkAFDRyBat8YoujSb2cir5pQbjPe8Pd9NQvvPUMuNYl?=
 =?us-ascii?Q?uDfw7FcuKT7JgBVYhRphGqBCSZGpOQkcpImy5/PlBaZPIJfMjj1U5spEDXQJ?=
 =?us-ascii?Q?fHQUHAaXavHRQ5dzcrhdbxQf0UTR+YyU69db1OUGVwC0NiH0XbAW4GNLtwkS?=
 =?us-ascii?Q?6NKSYUZkBX+ooyOKelQFgVToYU84gJFNY7uOY9hRmlZ5aZbKJJ+jnh6JQURY?=
 =?us-ascii?Q?b15H9Yo+9JfX5ysQEbtayx2lJp9PX3pjEmtxoq0BDZNd8bbPI8SAoqBNs5+e?=
 =?us-ascii?Q?mYwcj9MFUi4s5AsiWHJ3RqHFaihxRQXdAEP4VcUxoMU9BXWq1tK2WLjc3P7q?=
 =?us-ascii?Q?YtUGL4uYppcMXrZfJUPwFpilC3apNjAiSO49sXpeiRyLxN8ZCOD9CwLxbLhC?=
 =?us-ascii?Q?Jcb8KqVR6A6EJPCLUIDoFJfEJ6x4CzkLFJrJzJ6XKeapORPuZ0w5ZVXi453f?=
 =?us-ascii?Q?YYTFfTinOxmbh/bI+aP19n4msgXx0FvVmTWpo0rwmeuGuecN70sY6THWCMc1?=
 =?us-ascii?Q?69sZK4ujE3xGeVryQ4q7lA+gT0KIGfJxRnpK0PHN+xkZ/lKjHYrHF2ntjI5q?=
 =?us-ascii?Q?OvntOaDIWZCxv1zIQvvS9yhSbJ0jfWb2WOxv2jQuqK8vykawiq3ee2fcvQgO?=
 =?us-ascii?Q?pBak5sssQCzD4uLYkuAKihAwPds+866yuHehEsVEbs7fsS9MzM42Pfd0RRia?=
 =?us-ascii?Q?Wyw6Mv9A2m6pCgjskvEOzT4DVwPEKQHrKVrTKGROiB5+Gosbbq1Z/1W1r7Nu?=
 =?us-ascii?Q?V9qmv2q5NPoTTP6DoIYC1f7a0eGAQkzUmZ7qd9AEqpI3L3tNjoXhGFbaalU/?=
 =?us-ascii?Q?mkPPnRRsMN1Bn2UCi1Sm/VWMs6/tH60OnTHyzyNCkO9YAxuS9qgjf6THBUXT?=
 =?us-ascii?Q?/KA1E8UQ12Q+1GVE8vBT2/k9geeVrk1uSf4tCll8cYeG4PH/dbu1qjUTN1B4?=
 =?us-ascii?Q?++3A6Rw6nDro8HUOfp8zSg7R0pJT56PhZe9ZsulAEDFLBuz6q826NhtU1VFV?=
 =?us-ascii?Q?TzCYLRj2vUOxHeLl/JISKV+kcnRi/S6fSYcIgwZ0SVcSoiIwfGsNZXVxRwHH?=
 =?us-ascii?Q?/Mu8ZTnw2zTeWzjuS6TlNrOoPdmVqwFmi6tfJ9QQW3Bs5M1zbjH4LkQyiLsU?=
 =?us-ascii?Q?aL4QBJz95wWDVF8fm9vqIk2Fn9E2ZZt3Gb7y2KAcBKHZMHWKiCqckjovLET9?=
 =?us-ascii?Q?MwAZjgpC+6KS10aiBiahuAoAcUtwXBmS2fyhpS8tlCFP+2JJswRRD6Uggdqm?=
 =?us-ascii?Q?5GgJCnEG6iPMg7vqUrPF/bK3GO2OuPoz66Dj122pKpMAoln6zjn6nMDP4T4J?=
 =?us-ascii?Q?8kkylKlby3cuVn+mZovDYSC5XNlbkJd72nnEoZG2WnktC5gJZTVmHqyV4bYE?=
 =?us-ascii?Q?nutjaqi3WlTS24DeFus5RoauUGHnnN8mZxcB1xN2JAQednWleDVvFcBWo/9H?=
 =?us-ascii?Q?d21MiTTWxxiF5kAC5B6o8YqYEhh1iQzGauT4yiore+MwL4d2FvFtLjIO4HVn?=
 =?us-ascii?Q?WrNr+2YyzGTakAwdws1IaVPpa+F0Ct6CyWnc032d8f0/RT+gyaVSfmoaW7Z2?=
 =?us-ascii?Q?kBLr1Ey/IwUMQjGIfuanrPIWZCdYRcwI4ECQMRyOLF8Romp4rThRrTwHOJmY?=
 =?us-ascii?Q?0lO/pYB9uF9JZaw4tiDrpgxBcWNIKx462ZHQ5S73+G3qXWsekkXsp0/6N4eR?=
 =?us-ascii?Q?DOhjMgJNEw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4450b6b-acfb-494e-e831-08de622aa61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 07:14:04.7971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFhLSoeng8heUCKADG0Ki2s+vsb/hSn/UTGaS1HNfQg8gMuQjW6LPeap/v6coLuMAh1nxuSvh3FymVQLvlxAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5912
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124049

Looks like I have created this on older version of master and when picked t=
o master-next this is now upgrade 6.33.4 -> 6.33.5.
I guess that included resolving merge conflict in sha256sum, so I'm a bit s=
urprised that my patch was not rejected.

Note that the rebae introduced a problem with commit message showing wrong =
"from" version now, could you please also change the commit message on mast=
er-next to reflect it?
I can also resend if necessary.

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Saturday, January 31, 2026 23:24
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 -> =
6.33.5
>=20
> Solves CVE-2026-0994.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: fixed "from version in commit message
>=20
>  .../{python3-protobuf_6.33.2.bb =3D> python3-protobuf_6.33.5.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb =
=3D>
> python3-protobuf_6.33.5.bb} (95%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.=
bb
> b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.2.b=
b
> rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
> index d0ef7753b0..af30165f81 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
>  "
>=20
>  inherit pypi setuptools3
> -SRC_URI[sha256sum] =3D
> "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
> +SRC_URI[sha256sum] =3D
> "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
>=20
>  CVE_PRODUCT +=3D "google:protobuf protobuf:protobuf google-protobuf
> protobuf-python"
>=20

