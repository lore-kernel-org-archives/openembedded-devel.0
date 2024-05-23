Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8C6C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:26:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web11.12013.1716452787557039324
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 01:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=W9RnNriN;
 spf=pass (domain: siemens.com, ip: 40.107.21.86, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaV6+8musqOXNbwyzoLh4HwLZj9BjQbbl+/P3wJgqDDQcjIj7zzzvaABK2n4tosacVPFUz55/OTeLfP4WwPb2/QnrMfVltAd2HUcqpfzYeU90nwVswlMjhNYXUifcLHQ4CC0PyocMWL9Stj6K2HQlfjJQeJYJpvBGPS+v0//BG/EMMbRusKz3z3ywK+h8WLv/713L5UybZMf6u4EBKt3bYu8FFZ+PDVKGJrfsKV18Bef24fUyqDJQmOnUngAWl9BcONf/Xq7AKPsSwD1yGkjbwRqIl7Jpy1hPkf5XE78diMQUSV5Adp4r3mh++nMnn+ct9dXwWjS5q2Ok5oAtZk1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA/rvKXBlh8ei//eR2MNu+a7wc3qpKboCavSZiLbHNI=;
 b=nqwbmvXcaDUE3U8h2LfQWfUMhrAvrQxpZCh6AIn2W0iiCvxQ3lf0hSjjmEoODS/fnR1K32yPwdqH2SXDMWw3PwE9GNWsdv5KAteF7OZOQrczwV2Pfcyxu3iidXEhhyqrkpseENQKVofADYezHlFkdUxHf9gcvpbyiPQxB2atL/H2pYMgWto2QzK4lVNRBPg/9Rz2LP+jAupaDYW0eteH57cvurIaptRFa8CkHjweFATdhLKrK0lG+NmqVELEtLXWYijHDky+nOgdO0mSn7WasVXx4IJ+q3Y/YmX1rdruam/LpxPRtBq+5K1uDXCl3XGMrLjWUbD55B+HTTOVWzoa3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA/rvKXBlh8ei//eR2MNu+a7wc3qpKboCavSZiLbHNI=;
 b=W9RnNriNm+wassvWCN/OCTsCoaO+sXREoQuCtZPp5c+BTP1UBEzjXwtcs5E1P6ZFDT3garTPYhSXLFjCDwkzpOWP4pwYkuKuuAX3hhu46vAW6irUto8GOYntr/fqRiylBLanXki1fpWnPkWI2qUx77gKCncb+lYT9T5yX39vy9nyE6uM6lU9ZjlAFIrM3D/AOqgFAnDJ8JDUoG74QmNnzlxnGs7sVI7aMsTXlA6yy0jmwi7vBpj1lpQZlwy7EOeYJwIn145byQguxaeayXPZsj0IMTB9XkEBZDBslo785AwEfZOnsCC+Xv7EeQmEAOWZ2HlsbATWnbD4JxnXAx1CYA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:319::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 08:26:24 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 08:26:24 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, Bruce
 Ashfield <bruce.ashfield@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [oe] [meta-oe][PATCH] libgpiod: update to v2.1.2
Thread-Topic: [oe] [meta-oe][PATCH] libgpiod: update to v2.1.2
Thread-Index: AQHapRqzimowxkk3DkGsNtRMe9b/f7Gki1Wg
Date: Thu, 23 May 2024 08:26:24 +0000
Message-ID: 
 <AS1PR10MB5697624DDB1ED8FC5801D136FDF42@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240513094814.152801-1-brgl@bgdev.pl>
In-Reply-To: <20240513094814.152801-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2abc8067-f310-482a-adfa-14b328ea9fd5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-23T08:25:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7089:EE_
x-ms-office365-filtering-correlation-id: 30d18ae3-4a2a-446f-e39d-08dc7b02086d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?An5aOT/iaajciAH8tjb/zQKGIh9avtSMuTDbUZHXiVVqEuCR4IpGgR+CtUbH?=
 =?us-ascii?Q?3EuIdGcjIC9C6WmqulAuXr6190JPUdmxhCtBALO+dB1T/gdLg8ACaxlaNU40?=
 =?us-ascii?Q?EEt90axWbfQL3nhZZMkcgwpAIj2p/JZjPehvcZGwDAiDjEbcDc8hCRbhidL4?=
 =?us-ascii?Q?J4jD399mps+1sBLQVDP8eH7XrMH19qudnTykThcKSUtJdMTqLzASyEbFmEwZ?=
 =?us-ascii?Q?QyCwKFz+Equu8St3hEKS99XdrC1lJa8Ibgh7wJzdOmUxrUY444PScLNx2d4D?=
 =?us-ascii?Q?WRMBFOIMlGyfd4kVCLwFlpbKeH+rGUX9wBPaJDW4JvfRYpQ5TL2EqGbJs9MG?=
 =?us-ascii?Q?QKvKnT2L5t+qIMGluwFzSQzrd7ir99L/x17vnSEvLk1RhaG68Egmbxt8K7uh?=
 =?us-ascii?Q?6I7C9zGQyOTjZERYgnbmsGABLEOUr+NWoMYb/Sofn4uz+qCu/4NoTmrs26E+?=
 =?us-ascii?Q?w4AmywbzQbOfviUp9Ho3ADf2bKSYIgJPWQsDhJqZmnUwWNHaH4vxNusyRak1?=
 =?us-ascii?Q?kAS6NxrxTmR+aKiUyYkVN4GmxXSACQTh3eHT2qyOMLiVELriq1Tj1NmrnqJv?=
 =?us-ascii?Q?LRHeorqq7EVtxom5s0pQPgDN1UR5mnQ/TD8QOAR/BDJ4O5E31N+a5X+zhjvu?=
 =?us-ascii?Q?SKKfl5Qb7QrDNib7u0PMIP16uekIovjFA6O2KQmjuaFqXcg+0oXpIc/Vmzn1?=
 =?us-ascii?Q?D4xVboydMrBsM1bQyVWBcl3/P+vwOAhIBb40X+uYzD9OEUPafVrAwa3CGsgq?=
 =?us-ascii?Q?ZGNxjcLlTx7qEy3m2fkn2zjXrp+eCzBuRR6u5wFx3EIXgI4qWFlh6iKQXK5s?=
 =?us-ascii?Q?alEEfH+E29Ey0z6tyBwUWEVvo/kI7A+XNauBCfld3xBARqYxD+5lWVU97JkY?=
 =?us-ascii?Q?1u6I/4IFLzx8SYB9qPPp22eRRY/ZtndLe9Uo9fs3FHuT9SEYA/RtICurm2aR?=
 =?us-ascii?Q?ENZK2aDJDnLOdFsERviu7TuMhh12Yf+NLD4BE9zP6eQiUlPpGw/1zm/+Jh9n?=
 =?us-ascii?Q?dgE6kKYGeFUKmOHErlGAck9oXh5bofbRnA77W6BpygJP1Si+VOxylNgkJ1WI?=
 =?us-ascii?Q?pqFt5QNjbXl98Du6/xFpXQ0Ou/XfbyucBcSJ7V+Ov0Daa59LDkPn6qblI5KR?=
 =?us-ascii?Q?NK3KZ9+tjQEraAlndNxoQ6wdsxP11YL5YJGvN1MM1LljL5BEmN5+1XFtpOTi?=
 =?us-ascii?Q?LecMcya5l/SBqb9zBG4jOXGhsdcF6VrjIXE7jOPKjmqO5Qa7iRpVor33dPEz?=
 =?us-ascii?Q?sWtyn503q5+BUtA/ajYrAy7lgEwggUmgdxvoezPBTqRsJ8J7KqqdJJ9SKKKT?=
 =?us-ascii?Q?i8j9RxPGYshlJolpX7JWmFIyDyR9XBkFhT+60JyjkhRXwg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DozYljRBlwBi32bnOjxNS/FVFvUHuZ1A9uT/0IvzcDGUuzYdfR63bbiZ8irY?=
 =?us-ascii?Q?LETYyurCIRUiSEavz4KuLBGB9CKdZ3SE1S4xhVOgMK8NXaRalvoqBTImB9iY?=
 =?us-ascii?Q?/g/Ywp1xcs80hi3IBZYmYDX3xZ0ytUzgh/vxqGEfFZxPjZ125yojojVWBbJo?=
 =?us-ascii?Q?Aw4mzZyChQlPz0UZk6ynHFUSwc5gomGWU816+RgUN6vV19VH4y6eR7MGNES+?=
 =?us-ascii?Q?tjRM681p6BO3ZLzauh+BZ9PcwdGrHX5J2h9YAN0kCMaRUFNQTcyS/RrYgk5P?=
 =?us-ascii?Q?ClPDcwygyo+etDlgB0KESYNNe6rf48Oytopsn01+2i7hlG8rJd7/m0SXLKPB?=
 =?us-ascii?Q?ndl3Z56JxxcMOHd1muVi8OkwJp+3RN2wdG3sGxv4ryvF1thcr4XSzBtAhuJq?=
 =?us-ascii?Q?GtuDhDtTyJppekJcg0J2wBqBR7PkEW1udExK7idnPNUxVO5tyd0JvT0GIqbz?=
 =?us-ascii?Q?Li9utlt9fT5neAcutgfIz0v9wQTK2wOyxpAF0LlD44GrTQykOXV+I0TxJay9?=
 =?us-ascii?Q?Eq052YsT+c4B6x19EZMsj5eSfFXMj2+5cQAbHu60bsvlk6iw6lK7+E6tkD0A?=
 =?us-ascii?Q?Vt0al4hPQwJn0H5L0Pgsik0AfHIXrbkGMHSdr9MvReH+JSRqnDMFLjGrF95l?=
 =?us-ascii?Q?0iHQXAkAywi1KR7DvSTwyA+ccBxzdhM9jXvDmp6FtWsIOS7+kGsrniFlsfKZ?=
 =?us-ascii?Q?g1hDxILrUhY8+mwv3mBh9QXKyRncvEJTFoHO+C++BDFuGXMqaJEpufqTiePS?=
 =?us-ascii?Q?oFVULYTV1Yxz3dE3RtLjg+TuAm5Jum67bdlav7RBaSpyExQtXriSqISeH27Q?=
 =?us-ascii?Q?sLI5XVT+syiohONJJMbavXHWUQELpCXDoFyrf4ZG5WVgLErpeQKQ2op3MGWp?=
 =?us-ascii?Q?/coj2fcTlwjsGABPzb1kdkrRsufmyoo0KenLz9LHDHVsfcFM7vf1VrK8y4Dk?=
 =?us-ascii?Q?CPoxLpHEltNYwemf28FCINmzJ7MUKDs5cOSdElgKTa7SvqBz9XymMIqq0895?=
 =?us-ascii?Q?2ZzJxGDdJV1yLsqeWCYkweDc6gsxk1jMgKi8IbEU5l5yrrRHaHabWp8V14i/?=
 =?us-ascii?Q?MRb0uRyhpJ5pGig1XI5IFi9Y1UyrJFqxXGXcB4DwbsxdUU7RFXizIl2S8FNt?=
 =?us-ascii?Q?R6Q9zPgpTmMWf4kM3tTeiROvdMq0U2TRoeNYf8dsun0l46yFxiWwilI/lfAD?=
 =?us-ascii?Q?Qe8ilWfZ2SDETeaPwowt2vLDmtIm1HFdVLUIg+fEP6AEUOwz776uhNU1JjOC?=
 =?us-ascii?Q?0ikmdIVlZ2FMbP536vwflWDqb633imIMm4yn2rwRTPKJOBe8LXtQR8QWMeIp?=
 =?us-ascii?Q?/RhErnzVIE6NxqRWMVCxK5HpCrf3Kkh2ALSSEmtooHIINUxzjdl3AiKSne8o?=
 =?us-ascii?Q?wh3KM4VlbvFkPg4Ie+EO/qGL5QMdf6v3I7PCku4oF73tV9SVJk8/XEwz9y7Y?=
 =?us-ascii?Q?F+25JjUVUd98/T2rV84ZOoasxjBxqdCgUi9SKqkk8zeZ82zE96Hnqby7nGYn?=
 =?us-ascii?Q?08+Zoukpumlk72R46LWbaO0IKnfUvtXNtnTs8epNihgnGlDVMUfOQt98loG4?=
 =?us-ascii?Q?pta0Nx9u3vcQPChUvpMdLXIzuN9lmdFKxCBdLIbk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d18ae3-4a2a-446f-e39d-08dc7b02086d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 08:26:24.1138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WwPN9t8jUm0azXhR2Y74T8qa4P9h6aaC9STmAoSFPYUADDQBkw9rhqfutoWxjNf6/VaLB8j1XlYWK3g9Z+pEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 08:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110499

Please pick this to scarthgap, too.

Thanks,
  Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Bartosz Golaszewski via lists.openembedded.or=
g
Sent: Monday, May 13, 2024 11:48
To: Khem Raj <raj.khem@gmail.com>; Bruce Ashfield <bruce.ashfield@gmail.com=
>; openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [oe] [meta-oe][PATCH] libgpiod: update to v2.1.2

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a small bugfix release that fixes a build issue with slibtool (no=
t relevant to meta-oe ATM), makes the licensing of C++ bindings less restri=
ctive and preemptively fixes an issue that will be triggered with linux v6.=
9 when running gpio-tools ptest suite.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../libgpiod/{libgpiod_2.1.1.bb =3D> libgpiod_2.1.2.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-oe/recipes-su=
pport/libgpiod/{libgpiod_2.1.1.bb =3D> libgpiod_2.1.2.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.1.2.bb
> similarity index 93%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
> index 4c13d67eb..6e4fbd2a3 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> =20
> -SRC_URI[sha256sum] =3D "b21913f469d3135680d5516f00fdf9f81d5e564e19ffb690=
927ea7f1d7e312cb"
> +SRC_URI[sha256sum] =3D "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7=
ff42cfba24308548"
> =20
>  # Enable all project features for ptest  PACKAGECONFIG[tests] =3D "--ena=
ble-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive=
,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
> --
> 2.40.1


