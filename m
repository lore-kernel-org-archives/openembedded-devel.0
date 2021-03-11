Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web08.2932.1615447267757143856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 23:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=Vi4CC0gu;
 spf=pass (domain: spinetix.com, ip: 40.107.7.89, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEbAa+/FUUxtkoRUmjk2keWTSgB5afdkG9etlfVm52l/dbLmq3QVyPhMCtPpNuNr5ULV2icc100gxIEbxuynMfEhTSNMxb6L4PBHif0XU6vubWdynUBc4W7sRPYxLxEZVKTXuoGrkQOhfcNVkavbv6yT1z2ecTIE+CL1RMPF+UXJ1dWYVFYvef5NmGwAlkxTQAVribfris60Ze5A9kHdsf/T6HTIf6dZlawg1PTQ6jGLuyLybn0FzYgTx6w/xnYNNtBXPYIIvCj/GZeEFuxw+cA2kxF8s1Ap/RLkNRIyL37o01z4xNflOTwAjqe6NTnVnUGraPD1lu0Tv2nCbKz2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CcvhqqI4+NkulT5uET9KfNvFSjZDx3rPWWAPtZwaw=;
 b=FhenNTkxEXWFJlWgFjE4HIfrZ8UGYuZtJI2nwXHsUHdmlIfgujDtrjOk1Guf8haQ7UgMLtoITPfady+2/iqJpjstd10/dq2S6EzBu2j2UDaDbN9YNeLkXAHvQ+6md2GLYkFwsZJisFWMkEQ5uuPw+0zZgu9w7r3E/Oh6CXVPewnX+Uo8kJOw3UrK3UlLtJPQmc4RwhKoAixOQvTf8Q1ucgvo7kbO1ZyruGpNHwfmYAaIGRVIc1Cay8npXS6fK/7y694vWRZYnE5mReN3QTyq0ZlmG+1Q2IHZAuPIhqd87S56CamOzshSftkl1FkPhrg2fnSb0DVwUGnMJ1q2LZvdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CcvhqqI4+NkulT5uET9KfNvFSjZDx3rPWWAPtZwaw=;
 b=Vi4CC0gubnGUZaprIJVR/v2SCJnWJ3tZnvraQaOVopu+Ow6z7wQzxM1BpgaTlGYxfjiJrwcr6ERqzCqe11JQ9vzq/wLT+u8PAusMUSbLJq4Xi9nl58zs2uoRaUO2B0U8MX6k9Si39eyn6ypqkJTovGo9APdAaxnY+OtP1CSUNaI=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB3PR0102MB3402.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Thu, 11 Mar
 2021 07:21:03 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3890.041; Thu, 11 Mar 2021
 07:21:03 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] php: allow php as empty
Thread-Topic: [oe] [PATCH] php: allow php as empty
Thread-Index: AQHXFhFqXF3EQH5xv0aIigSd7Fm9N6p+YdXA
Date: Thu, 11 Mar 2021 07:21:03 +0000
Message-ID: 
 <DB6PR0102MB2630D49AD35C75DF3391763688909@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <20210311005627.35738-1-changqing.li@windriver.com>
In-Reply-To: <20210311005627.35738-1-changqing.li@windriver.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72e4c54a-32f7-4e7b-c234-08d8e45e3a89
x-ms-traffictypediagnostic: DB3PR0102MB3402:
x-microsoft-antispam-prvs: 
 <DB3PR0102MB3402C2DBFE6ED7032D049F2288909@DB3PR0102MB3402.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:80;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +OQDL6aoUd4Pqx+shc1/5yChdi+/8RAjyCeBXeh+R5/1sU3DhOQ6/GkKwZLJEdV+DQaUzphiI0mF7gna0+aohbviUDvJMjb5kpDAL17RFKvG5xiJHL5lci5NlWuj+0aof6dsOlHYBqdp9AnjNOHAY2nVY4MtkLeSH//eVwXkvVvFSPUU+NNlOB47XLhQ4aXtdlPN6YubjpC4U7k7rryBDOjRWH0IxEa6pnDJ+grX6DivCzRSZTqs9kg/g5+N+n53nhf+6stSierIiZJRYvOX+0L6SBFhmco0PNPfDwr/9IT9Qik+fNLQegdpUWuvspaRzOJEUNcx/kYAbhh0lHaV0jOvfrkFTPxFMK0eQkeQ5tHO297m5ZOaZA7B6excD10Di1TvhRdmWnyZNwJbsKxAkeT7QSOlcQqEOkBjluqwp1qqVbZwSUPKi+9kDbgIQmOi6NvFOjWFEeEv4IkMJPYRTc4qAmf0+wIN6sgk12XNm5ERrC7AfqgX/6+oOSxgWlWhAiBhgzR8MM+oJNKSwYMLmQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39830400003)(366004)(346002)(376002)(66946007)(64756008)(76116006)(66446008)(26005)(7696005)(66476007)(52536014)(9686003)(66556008)(55016002)(2906002)(8936002)(8676002)(5660300002)(71200400001)(316002)(186003)(53546011)(110136005)(83380400001)(86362001)(33656002)(6506007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?YKnDSww1nFscFsIFPTl6RGYe/w282u+CDydcbl90w9dc89n9V/uCBs1/EkiA?=
 =?us-ascii?Q?pJigwFpskWyn3ljtfy6jRcH2HloSpX9uoQNMRZT7p5tEgMdqNJb4VoXRNeQ1?=
 =?us-ascii?Q?yppRF7ioZVgfAPzBLL6yJNk+YOgNvrowj9HEIHwDfV7il13Y23EuNPI1zfF3?=
 =?us-ascii?Q?mHJSxmebP8+F583ILiBZm0xnQstntb9sUBFUVbqZ1jLU8qDa6E5BzqMMm1q7?=
 =?us-ascii?Q?N0OS3GtPR0JEH67pWIDahcB+uWluRk4QQdK/mWxKl55T6WDUbnhYSYYlmk5P?=
 =?us-ascii?Q?5LeuM1oY2IYDS/BedU4lmnjbnTOaaKDPmtlJBSIjEur9YDSgnLrv/2aLePhy?=
 =?us-ascii?Q?CZO58hYU6ojk/f7cI+A/p619rhU7Fa+2xX9Sq5VVpedYX2v018/vqU6RPcYY?=
 =?us-ascii?Q?iBPcjcWJjEqXOiuOom6Z/NHr0npKvXYKAqGQlqHDFLYe1P/Mog6QSpnX34RM?=
 =?us-ascii?Q?zXwkqCsZ8qB4jg5yDPH9nFbvzMiuSFfXL7eVc7blYK22V59UaCRYF0ITwgk5?=
 =?us-ascii?Q?jVzFKZHxMHw6Y6xhLGyaxPrWmAeydOv2VB+d2jlaOfD6PwU2GWJr76gFCLJ2?=
 =?us-ascii?Q?frhpjoKJqYE5aKJsaJ6V7dd/F0GBGgGkPRasqB9RwSGoDG7+VQPZaN+un4Bs?=
 =?us-ascii?Q?7+BJtf8tveadWcaiCk/o73JBGT8zhZGPcQ1jhhiFA3SdKJhLnCbMhdqm1XYI?=
 =?us-ascii?Q?mvRBl0ql7yQk4FiRK8fTvjPktf4LaDmru703GxMzzn03np1zC87dkD5Rz058?=
 =?us-ascii?Q?zeC6jOXjM5zQrJBUn0E+zrwM1qwjkEbKIu7EySFdOCgJaEUusSnjcYpHFGlq?=
 =?us-ascii?Q?dzwfkq7ERiZtH8eEwpeWMf0Fa0a+XWPFkEyW0Xa5jftl0CsGl+vjNNFijWJU?=
 =?us-ascii?Q?QcPoSAmu77vzpQ8nDxR1GSl0a0RXwmkeYXr/7mWxCIYu6yvrk9Li+LKw0BpX?=
 =?us-ascii?Q?lVbTxL737M/x+pEakFxZS404l82nvTMCP27treJpUB3EoXtMo3/qfQUozE7b?=
 =?us-ascii?Q?epg6RnU0YMsX0lLRrU+AaZtHKhL6eW4yFr0JcHlrYZx7RL3tKPiqZx5fjRqV?=
 =?us-ascii?Q?RsVVhi9dOGUTHTnuaSwfg3Nc2vvGZWsk4rfULNp3RShnDGdXGB87Ce09dhZe?=
 =?us-ascii?Q?BNn8ZBG2TzX1b/9vMPdE2Pj5pIt//jS2T4jCBtnKu24Ct8/ccOuKuLJ9u3gV?=
 =?us-ascii?Q?DwGJ2pRfP5XYXsccp80pPknxhZKNEWjFIk35JjPrNRY/emMDFkb7GB/qolvS?=
 =?us-ascii?Q?EUsF7LC11Bcci0fyTzWqj1HpvWxf6uLjrSwGR5f2O2rXOi36m/hSYUiEekLu?=
 =?us-ascii?Q?S5tc2rxj3lW0r0mSQ5fpp8Et?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e4c54a-32f7-4e7b-c234-08d8e45e3a89
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 07:21:03.1311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMqCerijEX6MtUB5mFrW75OKnOTYbqVbdFmHKXy6KvFkx7iIByzwmgGWOWZXjvOQcc6jrOFnoF6JjYu3ybuNc+7HWoNGHpSSNgzd67XM6CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0102MB3402
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Changqing Li via
> lists.openembedded.org
> Sent: 11 March 2021 01:56
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] php: allow php as empty
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Since commit c4ffcaa2[php: split out phpdbg into a separate package],
> package php is empty, we might met error:
> nothing provides php needed by php-cli-7.4.9-r0.corei7_64
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php_7.4.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-
> devtools/php/php_7.4.9.bb
> index f8a8755b9..e19d5dd21 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
> @@ -214,6 +214,8 @@ RDEPENDS_${PN}-cli =3D "${PN}"
>  RDEPENDS_${PN}-modphp =3D "${PN} apache2"
>  RDEPENDS_${PN}-opcache =3D "${PN}"
>=20
> +ALLOW_EMPTY_${PN} =3D "1"
> +
>  INITSCRIPT_PACKAGES =3D "${PN}-fpm"
>  inherit update-rc.d
>=20
LGTM

--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com

=20
