Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760D6D6CFA7
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 21:40:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49459.1769117996883152345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 13:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=VddLU2Nr;
 spf=pass (domain: axis.com, ip: 40.107.130.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8KbutEx8CmRYVZvQCawTP0hAtAf/AKNly5TlfS+XhKYJSxtWtxo1bNOVVYWhEpTNllN1g7gmOL5yjsP2LeteKzuMjQN2TQZ5immamSW1sdHyZcHs2jkGdRJeuCp9XHUM/jFt/LdwORSxi5KXlsnpwYZVHNC0cUjHd2Zc6N5J8xty0uzkMOEFRb5IhQ1rhZqo0r4Qo4H3dSI3Gl6+6YoCfwV/7/3u+Po6mPUFRjcrMEbHHSKMeQIJQltUbocKmX5z097FKID/Un4IXbPINSstUO4D7SDSZPtFFHRgdqZqxFJ4ZhRnSFvR3vKFD9eEx3jeqwVjO+lqt6DFcycea4wAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS5zmon48AQMcaCQ0xuAprWVNJGsqOrUc4oqF5cODMY=;
 b=dR53siqcM85FgOeo50zjNR1X193RKKLRgFoUV6QB1ZUbHIwsTu1g7H3qXKSwSSavcX0jCcRxz+lBowt9QWAA12XR31ReqboGfe6k+d6GQBy0RPKB9gGKQtZaY7a5tKtajswoQfU0ogYk/1D+6Tteum3MJ++9c6WMTJ+nXiSUncpKlN6Jv45J4dNkxC7Y7kP2J1RM0+6BH6ze7C8R0FwqhP/3IVclBevE9Y2DhL9UdnJwerO9kbRmK59e+JP+iS52Uxn4kozjmvhRK9Vys17An+cps9VVwz6teWltYtWx5uaY636LXh/QdkIBvbF3KAlmT084Yi4KtCmQckDs2YFRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS5zmon48AQMcaCQ0xuAprWVNJGsqOrUc4oqF5cODMY=;
 b=VddLU2Nr/7TwRHq4w9RL1Ci9AGxh3a19r2AIS0NB4zb0k+F/EOAAoSVO9bYaD8LBPY7qX2VERcaFwLLfllvSAY9e04VG0yctQ+ErN+y9kaRqbn+aOW40K95eWA8ySHUpBSgYeSIbZeZ1FBsqJrLD/AeJ2isgZpmqb/wFwQEs6tQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB10574.eurprd02.prod.outlook.com (2603:10a6:150:16b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 21:39:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 21:39:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-gnome][PATCH 05/11] libnma:
Thread-Topic: [oe] [meta-gnome][PATCH 05/11] libnma:
Thread-Index: AQHci7YR+Q89dqaKbEG/VK7HbqdDNrVet2Jw
Date: Thu, 22 Jan 2026 21:39:51 +0000
Message-ID: 
 <DB5PR02MB1021380FF1F91AAB473597659EF97A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
 <20260122154334.1872038-5-f_l_k@t-online.de>
In-Reply-To: <20260122154334.1872038-5-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB10574:EE_
x-ms-office365-filtering-correlation-id: 92673fc4-2fd6-4623-b9a2-08de59fec613
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?q6oFSxPvSutfUrKs48h/ykpdDbSigV7FUzOT9n6X5dDRkQJEYEmqwSSpW6Ay?=
 =?us-ascii?Q?4gMYJbavKVDRzMRCsL96Zn4Raq3ToL8tnAipE+3dfyBDshmdqnSdbwDVqW/v?=
 =?us-ascii?Q?MUBE7b429WpM4nVZO6MPZ6TbzdKvmca4Zhqrt47U71yFtRY2bbs8iQaYd4Tw?=
 =?us-ascii?Q?T54ygKt9BRjEedtvAe+6WsCUtOlaYoY5/5hVBl8Y/GZQaAu9tFon5jGEQ43R?=
 =?us-ascii?Q?kpfUW1lKdiH1RbSnHiC6raWOp+r8etT3ut4baplGWlRylHEOTeW4qpXvG/ac?=
 =?us-ascii?Q?p36YWA+cZIXQS2vFAimfsRB+awkwoBxGJmJl4VONsC5xmYkvgzH6cCyiADyy?=
 =?us-ascii?Q?dkPgoRmW+KEItW9zxFUEjK9agDL3rxNCrs+9qvnan6lSDzxRItqXab00IIre?=
 =?us-ascii?Q?L6cLFWHac1dfcfsmybFmgJXjQT6EPbzuJ6XAl5c/CYKvtkNISceP1SVWkTSu?=
 =?us-ascii?Q?BKNjhZmxel+Ww+f41jMVxTX/vbgVqAsY3SxTO3Lz3s8VAvv446vPJzSoDN8h?=
 =?us-ascii?Q?ijfAvGWnH8vsWYAMr6Qcx1I0DbbYjRFYEogc6xUQbTFFDYZKd2TIek1yV2c5?=
 =?us-ascii?Q?pti0BJTeqbxkMjAWVJq5J8DhrKeOROxC2fzjQQ3QRkcyuZQXUct4UfeHZAdt?=
 =?us-ascii?Q?JBLz/ERIxC43YWw7dmcY/xQ9ttC9scxdenah8g3TxllwBIoeQqokquvV3z9c?=
 =?us-ascii?Q?+R7kK1H49hRMxgJ1Ur3ufqnz41PPYCtUQd0bNePHeBLZMGPe/oipTdM2DCCt?=
 =?us-ascii?Q?oKXJ8RATqEXofLAR1kYAWEhT95sjMTH+GjKfEjhj9EVBS9fJDkYjt7szgUxD?=
 =?us-ascii?Q?lBSukUts/79kt6ieZTNodGCBxtMZBUX3Kqw0nF0RWEFu8ldioZPbN5weXMmC?=
 =?us-ascii?Q?kmKYcTyCKk2dSCKpPHkqRS6WrbbGomJs/007WQCX3fFt8NbCpzxjHGrOVKjT?=
 =?us-ascii?Q?bn/Tb9Dx5tFHnyUIgvOoQCVvSilyyF7nAnAsVerNbp8bThrzP97iea6RpOso?=
 =?us-ascii?Q?D6I59MoCA9Dbmae0S5CMRLR1EkzZ2+6uVbALQbyKwLixl/UvexBby5sRDVOT?=
 =?us-ascii?Q?ubgb1hSHVSqgd9l9kBq2JTMz9xWy+IjSBUBSQrrHJN3o8lCTyOj1K8/pZZQm?=
 =?us-ascii?Q?2Wb6E/a/bQCLqSFinZEWCTiTKaj9VQf1yALx5ypAZgGVlMK54S7xgJxBPrNK?=
 =?us-ascii?Q?KX3E32X9HcvR5byi8wroh2tAI/At0HF1QeYJgal2Uk+3SDDq12h5zDiC5Ord?=
 =?us-ascii?Q?3Ow/+54RDSZ8peJNNFBvq3Dvez5781sT8+FS8Mjnsn/PUTHpxUmflpMWUElZ?=
 =?us-ascii?Q?ZvtT7SumseA7joQr98ra9JYWzcG1pt77YAXC7b0RuvXMgeSVagKL+VxMOTrq?=
 =?us-ascii?Q?cZVXWCm6+wIQMUKMqTS17xZx5m/FtbNmM8ofP4R+WWJDzfJq2/BTSmwpujJx?=
 =?us-ascii?Q?BasW9vQAztV0GF7z41lnuidnvjGVqllkLssoKG9OHw5jY7F5TwcceQFcC7/n?=
 =?us-ascii?Q?qXgtSPJMAJuchqt6K/3cA/R9zZYD04NJfHXGTXYOPFdRkIj3XuMvy7Vy77lT?=
 =?us-ascii?Q?nOVr/rv1tUKT9FADVLmr0MJ4F6GGweW8eC9aRZxnnV7gn04/KBA7mpB6+Bz+?=
 =?us-ascii?Q?9n/oIOuvMnG8JS913FyKgfY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mOWy2UnYVpOneoSo2hYAE1d8gaB6j8pN++FcPflBw5duaBxJzkke2gLY2KK3?=
 =?us-ascii?Q?zVz/buLjjHpGL317AsJ+AOf8qh9FQKjZYZqScf9w3Ce4e+xjb3wEYiPU+BWQ?=
 =?us-ascii?Q?FavamUm4V6+9/++P5CiDkYJkotRMivh+H0WPhAuY7v1uUE6vdoZBvW6DnTSy?=
 =?us-ascii?Q?WVmWXhaTpYnaw0BQzjwhOWk/VSnhoF97gY+aBrRU4805uC0ITcsWiG2ayEFz?=
 =?us-ascii?Q?qoyUoojGNyI3pzz02l+ELt7v+gNun4QgWKv4q0cEicdvjjADAcgcDkqE6nel?=
 =?us-ascii?Q?RYGu4I8bxFslaZtLa8WCKPBuuHqIxf5utIm1cgbFSl5mcGjElEU8c0kebXiz?=
 =?us-ascii?Q?BoLMJ9P8S1/3xRd4TjrVEJqmFiNJrjHkggdsPCRY8evDuRluFtWVFXjMspsP?=
 =?us-ascii?Q?LtcwaP44/bdFYBhLsMhJ9nYOwbkXYaMWuNotV2Oo5A5N1wakzKgIuvLtpNc6?=
 =?us-ascii?Q?z3aFkWcJcrzEBCTWFNhxlS+Rq54JNkl1bZXx5yiKPgP7FzBI9O2L9lYnRtas?=
 =?us-ascii?Q?VTs2c1PkMMYi+gA80HryUJBH8srE85TOhxuxg79na2yvbacHsGOjpVvg1+RD?=
 =?us-ascii?Q?9ap1zpE/KNwURya2vI/zfKHOl7CMQsRU9lp2G6MlmwG/IXiQ3qeRNAnACI2g?=
 =?us-ascii?Q?PqXXrWt3suMvHT5m5Obu4gumJaORGj9gEbog5nLw4bi1eg5MOTCkR5BC1ZwG?=
 =?us-ascii?Q?WaPfQwoM4L//9C94kDYPorpSTdwy1dNRTRquZTM/alPUvtTXhmm9lmAGqF8e?=
 =?us-ascii?Q?2tFx/XJgoizUkxy3Ond67nEgMAqwI9xcYNw3lelxtAB9fGzyCr6F7VF7EXuT?=
 =?us-ascii?Q?MbvhT8Nl1S0QbY7d0Y+Umep/LMyWQN1EDLSScstJtzVI+v/aKsChAOA6vdim?=
 =?us-ascii?Q?ld26MxH6umJrVtou4yKXrf9h03b2n80aZ6TD/m/xzrve897T8FZau8yPEwOY?=
 =?us-ascii?Q?XRvJTjqhIgMHcHItGCwQmaoyNZG7h2vOOK1H5/SC5ztfOvxNLpsZAeS8AK2h?=
 =?us-ascii?Q?xb+4OCTF4Tot5aUG5OSJWMMEkUuP/XXT5H/DVI1+4RwpKpAMUxMLElSZ+6ch?=
 =?us-ascii?Q?T+WehO741grVQMhbd+6hoICQzMxrovmYO78fdlJop+0gDTOLaY5lVWK2ILZ3?=
 =?us-ascii?Q?lr4qy0jw3DgC5EoDFtfXxooQMxT1dedVSB/83G4dIym+O9t9EvhBZrTXw3xY?=
 =?us-ascii?Q?giJ0mHW/XVChm2/j6rHF+39X6EIRqZlTbK0ebd6jesiD5o4NCXdGkeMuD7zJ?=
 =?us-ascii?Q?Fq6PzA3fUybA7mGx+rF9kBUT93ywbpv9VR7P+OdxoDzuyZw4QxFGiJB3lLGG?=
 =?us-ascii?Q?F8B/zcw9ywvAR5sX/HR6kq1iGaQ6sd/FCpmLoOXCfFxprfCaJQXOwgkJU4Oj?=
 =?us-ascii?Q?pIbAPkw6wn6h4RaaZfoI/oDrls4wwa9d7Qa+3wkZdUIAmyjZXymt6pWLWErI?=
 =?us-ascii?Q?CP5FNSmpEAOKNvmetkDws6kSNtNfYIfsiw8hrUZZiAVDQdJ/pJBUrNBets5j?=
 =?us-ascii?Q?XpagapA/mgM5KVVv7xj7J7C/8bP5zaCsl+R8rt+54x8c1LT2mjWxb4Ixa/7X?=
 =?us-ascii?Q?MSmozqprGHLDV3K5sbryvObzItVjJFFSStIwj61/r8Q+wVxF6NuszCzbpirB?=
 =?us-ascii?Q?ErNtGGC/gPLAWhKyZSh/agpW7BAz3aaj3jp2YgGk9dceQtVMUV4mOay17ifj?=
 =?us-ascii?Q?ttM+XfmgaHdzPIIFjlDFlzYayZ8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92673fc4-2fd6-4623-b9a2-08de59fec613
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 21:39:51.2699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKX3cNZPtSR/L1YEUGnow0yx578Yhs1whUys7RE9x08IKQ/G4KyOeG2d6yiURkK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10574
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 21:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123753

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk via lists.openembedded.org
> Sent: den 22 januari 2026 16:43
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-gnome][PATCH 05/11] libnma:

That subject is a bit on the short side. ;)

>=20
> ---
>  meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/me=
ta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> index 9a4dad35d1..502dfb5ce2 100644
> --- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> +++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "glib-2.0 gtk+3 gtk4 networkmanager"
>=20
>  inherit gnomebase gobject-introspection gtk-doc gettext vala features_ch=
eck
>=20
> -REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG','gcr'=
,'x11','',d)} opengl"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>=20
>  SRC_URI[archive.sha256sum] =3D "53a6fb2b190ad37c5986caed3e98bede7c3c6023=
99ee4f93c8fc054303d76dab"
> --
> 2.52.0

//Peter


