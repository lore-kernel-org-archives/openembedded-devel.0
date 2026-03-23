Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0672AEC01CC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:55:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14516.1774263337730098049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fUBEoMa2;
 spf=pass (domain: siemens.com, ip: 52.101.66.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDjTxO/G5JUzq57+sNxNbTtLuqhZbOBmMlbkZNtTvw6Iv5UtXPsxUMew16gHyiWQDkOH4zQX5h7fiJwRDM62iXlfWNyeyqKblCXeIpI/9C3lR8g0QtSVrLe4gDV63GpwCvLoLftDIMcYLitwiIlTbNBeyS8k+CJkKRm50eINEW4LqwaJ9cn6Afnikt3y8iv+LnCFfNidJLpOAB4E+nYicXFJeRgugWM98tI6CNv/+LrNk63A1vf6e7NzHnEGEP0+MaWRqSL2RMkVVeIACJ0mtzUECNfKkJqn6mUFL0+cWaYCgWw1NxNuqNBArK07er5AHxcJ/E9UTZ/+pcvrG5AKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOhiJSCgmXXjIBbjA1CQ3Qd0hW8bTvqNg6y7dPLZeGk=;
 b=MhvIPk1wDtjtRNEfk8R99/nv6/bvR0uirJm05GXD8IoM/uCUYbSNiCxB8tQ86YNdD7p4GdSi4F7zihP3vL9VjIy3oclh8lPpMlwixUV8SNFMBaRyXgIR3QuN5StdhcT2vYJDThWTc94PgxEMEj86s1F6zMBLFXXQhTyb4dmyG6lzbRC2pQF8reCrQWbbhLDunm+1YRE8aEqOqogX0lUnOQi7kuP7BCwv2JYKH1BlAPbEUzndiaAgl0ptPrHvjfc3r6gJDfopxKrtffjyQ3U+wrlIIJfMfOJNdDAi75QLWsTLfD6ZkWUFmgYrB6W5PCmvpX8VvgXkV1OXo/+w/DCmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOhiJSCgmXXjIBbjA1CQ3Qd0hW8bTvqNg6y7dPLZeGk=;
 b=fUBEoMa2x7L54UeUkU8K0fGM9oGlA/5J1uum7iJuDxE7Ld/0/AZ/oOp4XG7Em57UmWcQLtiTl3Lc/FnpLjVBpN4h11StoOeXwuIR72X2WPIc9Wc8k1tGv4VcfztRjWU9sDoALyDceoG3x/yaeEgpZZNHUIB7DhsJy3USTZfVVp9BBywMy5AD2pvNNl85MLNXlpKPhjTJJI58OntuB0+RlR/iOP4JG6XfDZzfAIETwzmd4Shp9PXs6FCUN21nKAiZO9iYhOxZyAj/CUJwtvtHckNUfhcV2TlHkqrONkBmXu7+Wo25A2RukSCJcp+WrW+ZbZlGGzyUamk+wKnPSrBgWQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:55:34 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 10:55:33 +0000
From: "Marko, Peter (FT D EU SK BFS1)" <Peter.Marko@siemens.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9.0
Thread-Topic: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9.0
Thread-Index: AQHcurEbTvrMYu3ngESyXo+lGnCozLW78XGA
Date: Mon, 23 Mar 2026 10:55:33 +0000
Message-ID: 
 <AS1PR10MB56972570AA535263AE8F173AFD4BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
 <20260323103724.2341742-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260323103724.2341742-2-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=526ad3ad-be2e-47ea-9e5f-d53e047fd628;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-23T10:54:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7460:EE_
x-ms-office365-filtering-correlation-id: 1d0ef890-df7b-4486-aa14-08de88cab541
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003|55112099003;
x-microsoft-antispam-message-info: 
 n4lGbag4bi5wJIyDaXppeh1uxNF2+KIIi3QEYOjmXkukthD3xYbfLZ0btIJxCk8/kUEsUKW/3zGnmIMY7fzopWGaiqcWG1NdfDAJ+1kYhdgu313dr0bTRh5KPQVdvLe4BaKlPzOxzsTA4lJoHaMaSlEfFiW84vDWz7kqv9tACczelg3TVpFq8u50qxQtL8FzzxS2oHH2OBZlEdWNTpHcxZPo/unglSg/vVt06LVcVRIUEovpyJg/slpiTJgtAgAfwwpYPxnMAj/DfmTRomZiFvtdnbPDDciRDpkEPUOvqu/NEMIvnZBxFkOfJYYSAxW6Fs4lstf62I0UOcIOpb+FZZAtLD0OBOrgY6RuS3yc8mKOUbqDHGSP8KUl6jiMas/f+HKs5bWBdF4+UHXKF0nBN8Dm8f2h9Z9kEBU4uJzmu1zXYzw3IPR/ycFcyONG27+ys2ozjr4pZN9kL49YgVQ/fq4nbIvKuBg1qFY+In1bMRt6h7wq26NtrcKTZMjQuTtVb4p5IesL4YMYj0lbqIvZgFLtu7hM8gS4jpUDMyCeNnuWdAxMF9e29ZCRWMjmLwvpvlhPYk0FfHPlMdHguxctZmbJfSl6cXi0p/21dM9jPUgQ+J9ye7rIMVy6i+34C6GWfcA7N+0oKC9aPLdtIn4nWgCtrx6zxSIX60ghu9dY8z5TrHH7+QibNfjFMhUhfzw0Yg2pvTFKkrt/7lIcoMfdECPo6bw/eZqTHUESsoTnCpNqwMKKhilqhpfY1BATuh+fDCu0SrZZQj5pdDUZqI/u35n+CkJjeh8xgwEwiCUjB1M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WOcB2ZuFuz830bkkvzGqjMx6Xd2zzAvDkZ/kApF/ELBLaaPFrS3zms+yMDZr?=
 =?us-ascii?Q?rETxcb9ZMNd8Ist9/GIvanVuZYZyNdg6tn38DbcKOjqdZPZA8qgIDWmTO5y7?=
 =?us-ascii?Q?OMka5uRFu3Lf09gO4bk6QbXc1fyKWCADIRIJ4NZfFiITFbcu7EKqNuAuqoKh?=
 =?us-ascii?Q?mSyEqXdytGQRNMVS6xwP+++WrXEQxxaPIdOT6kZrf02w+XKYWQ/Zk6aDafZe?=
 =?us-ascii?Q?uJfNmc0RRZyPtrT0aFCiMROoiYtXBRN2Wh411JqDDYyZ3lxpn2wiRpmBQo7B?=
 =?us-ascii?Q?h8ws68nGnVAyhF3ri1b/p9VM3V1XU90bg6ELuSUh7oqKS0SGJGXVBAqiylRC?=
 =?us-ascii?Q?8HzFpNqkiokxD1qJbMYldJRTsR+r/ek5z5ZtU2g5Lxi90apZHKTMKen7RpM9?=
 =?us-ascii?Q?7uOJB5VmL9Cbvv3AqzxVsvUms/Sds2EUOksTEnopf9GMtCZpF0zS/uCaWGz9?=
 =?us-ascii?Q?ZY6qtW5lH6PbsMBzpklNac+xhNbAktNHKFKpomG2rJyty3s/Nu9I2wkfFTDm?=
 =?us-ascii?Q?i7Agee/J5DwnzrPFXk1+teqKH42FMAr7V2ZmyezdWxyT5VAYvIbJNpYa29zA?=
 =?us-ascii?Q?0du0UL8ue/3Nxevcev5FxDUlTR/0LTioaBx3mFhnobpOZgoOKLnA24jgjEGn?=
 =?us-ascii?Q?jTzFEVZn0u3qGZw6bKe/oJktuvZSpzUTlWtLt+jFZUakog8ON7v2MYMqfCbm?=
 =?us-ascii?Q?RfcqHEzqGWeg582KXaGWOQ7VxwVe6reH9iNFl3fvY7jSNN0GY4QXoPv5KU6s?=
 =?us-ascii?Q?vRqJVIPbQPJrjNOGen8rc9EICcZJgR3f7WJLmgo0im0kT5cIdEOv1OEbU4sz?=
 =?us-ascii?Q?IooSPSEOJA5JpeSHYgVDO2QlZABqKC81KBVlDVuy03rRerD8rT62XfarJrZV?=
 =?us-ascii?Q?k8aulfUm5LlAS5D+DM7nDw/Cd6loSyGgFp5gK97kUF8wPfGvSMv8k+HWeyg6?=
 =?us-ascii?Q?8NgBlaByWH360FOm6j2vAPkfV19ugg/hKh9iLj6kEkmCR9+F1jsfS5fum1oI?=
 =?us-ascii?Q?QGo45cSArA5oZtBJNQRNiBOm7JT3dy/uNeVCHV56y7M6esNYKqj3lhkykPSr?=
 =?us-ascii?Q?jkRdJZxpyxTmuPHqACpeV/uU+zck8v54RUeX8vRicll6JPsK9cJTjga+5Zrs?=
 =?us-ascii?Q?YHJ9d9P0bLgA3JV25npX7jehK6+OvzudSdgS63fuWBWPWNSfX/kv8J9fbdfh?=
 =?us-ascii?Q?VN/tNikpeTWVI9goWriF1hZpfb7xuz+GPQlMqvk4wWKtZ6baZ4sMnlCpUNZT?=
 =?us-ascii?Q?j9+FNn+5fF13koQlDw9X7lX1q4iLoCyyGMjVgMr/QMQrzFRFnfJMIPTQeE6J?=
 =?us-ascii?Q?ADjuTJn1HxWCMj+puQ0r+9zlkJ+P6OgEZFX8gZBYBWs+tUvj4hqcLUpRpznT?=
 =?us-ascii?Q?/TCbBU/51qrUfm6EGQAcEjl3YhcUKY+erYeNJSSZ45lNQkCs3XsZov8M6dQE?=
 =?us-ascii?Q?SD8W1D94ovFbrz6ZonTbf9a4aMgBGcmdZyCOcYGlgFLACdQN3wHiyk2edPPi?=
 =?us-ascii?Q?r/GW8MJminGsPzEF15tQs94UiT5AumL8lexsEBIO9BKtsGMx3whcjklH+34v?=
 =?us-ascii?Q?AVKWWU1rhOdHozcnhwYOfRoR+bX3ijk+P4Xo4a1bCb33W65MFTorXTxhFRiM?=
 =?us-ascii?Q?k+uXapzVOEaLl2pGsfdQd4EAfw2UILPsTcufVDAbRYHOp61ckLWKSV2xL0/v?=
 =?us-ascii?Q?dBQLCwmiEvq+78PV7/EWXOtwYbST/2IGMUA4SZVfPBgGheoWYPv652KO6+Cg?=
 =?us-ascii?Q?HB0WCO2ErQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0ef890-df7b-4486-aa14-08de88cab541
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:55:33.8322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAnXCAjjgLWPeZt8kWwSnsPx0lCJfWTc2MI863AZlZvUcF+CccUUy7RgukSHSQy56aYVL3h1YMmqc4ChYgV6Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7460
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 10:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125502



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> lists.openembedded.org
> Sent: Monday, March 23, 2026 11:37 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Subject: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9.0
>=20
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>=20
> Conatins many CVE fixes:
> https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.0-stable
>=20
> Dropped CVE_STATUS for version 5.8.4 specific CVE conflicts.

CVE_STATUS variables were not updated in this patch.

>=20
> Ptests:
>=20
> START: ptest-runner
> 2026-03-23T10:28
> BEGIN: /usr/lib/wolfssl/ptest
> ############ Running Wolfssl Ptest ##########
> Wolfssl ptest logs are stored in /tmp/wolfss_temp.Y7VEJ2/ptest.log
> Test script returned: 0
> unit_test: Success for all configured tests.
> PASS: Wolfssl
> DURATION: 130
> END: /usr/lib/wolfssl/ptest
> 2026-03-23T10:30
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../wolfssl/{wolfssl_5.8.4.bb =3D> wolfssl_5.9.0.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.8.4.bb =
=3D>
> wolfssl_5.9.0.bb} (97%)
>=20
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.b=
b b/meta-
> networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> similarity index 97%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> index f16c8c1e68..625ee66609 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>  "
>=20
> -SRCREV =3D "59f4fa568615396fbf381b073b220d1e8d61e4c2"
> +SRCREV =3D "922d04b3568c6428a9fb905ddee3ef5a68db3108"
>=20
>=20
>  inherit autotools ptest

