Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA3DC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:54:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web10.18920.1714391687927579438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=draANjwH;
 spf=pass (domain: siemens.com, ip: 40.107.21.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcKcB2cr0BgA8SB8HJQqFs6PJ5WHw/3Bp0iGSmA1+fH5C/BehATXJGLa8fBVL2o/e8kVWemP0BQIxGEgB9+eWGOsRIWdjrAN36TaHhZQaQ6s+BWyJOIr/hhoMv1qxJzAKjF2Xjli+G/7F5NQv087Gkma78jMlkjT9E0K162pTM0717hyku2YvpQrT+xgDlgIBz0JYb93k4vDG4420OLaK1qu5+yU+HRarh+rMTytsewPfyjKq5TY5A0LsF0OmbQBFcHVZThWrCUZ5bWrJqCUAjR9+SPP/RIp/yazLcrFb13F4TSgwGnCWqVsycd1WkTZ/iRWm9MG/gwwvLe+kXvjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghezlGAou47EgYd38ylbrJjAyaMWb0HAHkepNUjD8Hk=;
 b=NQg3JftTMzc3qJT80ZXay9bK4owoqBO2Vo4935Vmah0w3i2SwmE8XLU0yJNIcDENurZwHsPjzH14fq+XpYCInqE7m9Be4UCc0A41tc8jAfrb5D7pPj1VjaCBP75suFpcHmArUBo9ob5Wgwn6p/6Y+M8TiVeq3C0QIMyzh6vvzts48l8O3zvbemd+qO6hEZQ4fSIJ0twBd0gLsRKs86OU2+eXXMdhYLdJ7argaYdiqFCeMoColbBfwRX4IFQiNgTWHn90tIbQpzLROxX/+T9yZcJxJpQTPhiKQKl+jiHCN//rRzQElE1GPaCQyiSkWUOOEVwyLrw4m1QTxUxoatOFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghezlGAou47EgYd38ylbrJjAyaMWb0HAHkepNUjD8Hk=;
 b=draANjwHYFOrmd5lcZ01E1a9JwzipOubnDsxmKCzLKKnsfFv0fxUhdH4NJZEiiKxLg5c8fKodQ6hjr+kbTllRN29v0m5XySBzpePqrzBqvMTSTkqyX8kc5QdTOCyqsRRIA5vsCqST/MpLVaa/NOYd0smHnXUkp+PF3thaWVgwRBAPc8PIMNnOevBo92SlNanTjzcuAUkL1oQHSDxM1GV/PJTArnmLZj7ABpxw9210S8aZ51qVsaSxqBF/+f3AUIyleADbtZhq3QPL2RFs9uncBotXTP035ZfwgGdvpcbhNz402LHmfQdKriULkQGx6H9t4/jBW/tqQtuU9TWT68tJg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 11:54:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 11:54:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>
Subject: RE: [oe] [PATCH 1/1] st: Update status for CVE-2017-16224
Thread-Topic: [oe] [PATCH 1/1] st: Update status for CVE-2017-16224
Thread-Index: AQHamiS7hOZvF6aZgUKWw4Q6Bv1Ka7F/I0KQ
Date: Mon, 29 Apr 2024 11:54:44 +0000
Message-ID: 
 <AS1PR10MB5697E74837D812C45331A8C0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240429110207.50187-1-ninette@thehoodiefirm.com>
 <20240429110207.50187-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240429110207.50187-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=03dc99c2-87ad-4c80-985f-ee31755b2b1c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-29T11:52:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6693:EE_
x-ms-office365-filtering-correlation-id: 6bbaf54c-d134-44fc-b181-08dc6843291e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?CvsRbs1DsjnmjuLnoxeNNcGQTZqa63t+9TWiucN/Oucq6lwrEVWTOoyLh/jl?=
 =?us-ascii?Q?2N2WviQIILAYsmuUEneT+utYxO51Yskm+6ma6a89Z3kGp5muJUu2kHj+cQBx?=
 =?us-ascii?Q?a+9fageigmHePsiUAQQo+z72/aSdGUqc3IXre2KeAOtIepAhT81qW9XwH4bC?=
 =?us-ascii?Q?TyzH8X1i1T+yDh1/7xoineKDpMePrlmKpq/TOXe4dSvjQ0RM18dDhfVrOZFi?=
 =?us-ascii?Q?I0QXeflH1AJbXeBr7xDqZfrjtc/xKT1pre4sVpYUXzPFNmGK8aEqDlPM8EMJ?=
 =?us-ascii?Q?LHga9A4v+4GZkZCKLMAtnomR9DXxMl66ZRdMfFOGeKMlZpjhEjUPlBouPIqP?=
 =?us-ascii?Q?c3t69aSIu6Gm1d6oASLynsQIAXc/pc3T7HCdAWIvxIRQG5XIozSiN5XVpPqi?=
 =?us-ascii?Q?yyVL47DyO81Kzt78zonr2J5c0YjsszWwlVGOLzDrclL8NSDR3jy05sc5ey/O?=
 =?us-ascii?Q?gB7JNFzU8+tGRxPkcT2z3f6Vh4GPmNo3DKlsH6aXcxyhgOoa6JbqgHp2wkXD?=
 =?us-ascii?Q?rXJj4pGoLsGlAb5JaJfHkY5gzX5+mcFAybQHri9WqLnUdpzsCTU+rL7P5yLU?=
 =?us-ascii?Q?hh1/If5nakPQNeM2gqArfEwDkBSeRlhSeWyCMkt5WPDxFTDpCmV/6FQsc53R?=
 =?us-ascii?Q?roKTuLMswEylik7p7G7GnfNk9wD+D6/ImX2ZK3jOHkhKZSkJJ2r5+6f22IOo?=
 =?us-ascii?Q?YvMA95d3ro0ykGaJ5BqAfbJ/dszZB4jqUnK8LGgekKxXdUZcZuMjaWYqHVUp?=
 =?us-ascii?Q?tfnQbaBfLKHvfXbcHUatR9n0NNOXHa33LLDg4sVeKZDxn12boJKQ/qEm/r97?=
 =?us-ascii?Q?6kQYLB28FXFegm09+h13hNQLR2pb+zyBzSoBs3+GY+eIafXyEs0OPnJ7KkAd?=
 =?us-ascii?Q?YmpgPH2zr6D/q19Gr46ANVDv7kbwrQIYxzBjKaI4yayrc17ogkINsT5z/6Si?=
 =?us-ascii?Q?aFMpn9teC9RqEFXrqVpRrCGPq9U5kbhaeTf1WLFSpmK9/iHKBEAUMkYvI67L?=
 =?us-ascii?Q?RV4Gl+pn0cHgns0fNv/7vepTXq9Ud7usHVl3ECgF38MjPHdk7Oi8qFa50d8R?=
 =?us-ascii?Q?Gdwww9Dn/9X4nFA828shPCKrg8ngLAhDAVk2RFyTm4YOC+qVzRLFVlbfa1S2?=
 =?us-ascii?Q?EV+93556ITvAIUz9rrd87KPXjfra1XSNd47SBwIhv2feo1LhCuaBIXiyOny3?=
 =?us-ascii?Q?FlCOQGfr/opH0PlLSk5njFSeGuY2qvnLA3IT8j9twXfEODFpifif04sLYZ1y?=
 =?us-ascii?Q?PaLWTLmhXqnKd+gJAAdL5uTEh97ZTFPhi3SD0vavoA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oXRjVufUtD51kHyysqz2ED/pOSZvzF6jY1kKXf0Fz26L9cysb6Uy05vH/UX7?=
 =?us-ascii?Q?Tau+Ijf0d6ovFe/hacy5rMcvAGZvQx0MQGm/DlLLiRB7qV/IST5Fn3dv7uxD?=
 =?us-ascii?Q?TE1szW6MhAWb1rLG4pBJ5XlrQ7Z2Zxe/sM1HVDD69EznsBR5+oAkNwXuY3GC?=
 =?us-ascii?Q?hTFwm21U20OZUpUHVWfjw7SGX6+X41B2rL0GTWSjlmMkLRl5j1f1L705SFVD?=
 =?us-ascii?Q?n7r9qtWtDrXzZxSbJfn+qvfPE7eAfZQVRCiJSxYIu36ZXdp0vIUUx/SeD0nx?=
 =?us-ascii?Q?XxETLnCY00/7w2CWqHpCTskM5QmsLw/u5Gjmds2sO1HJekCCsP4Q9/OwdIUi?=
 =?us-ascii?Q?iw7WTI227fgNulru9JoHwtLcsTtSnFok3p4zkJOX0r+y6GqE2QTaGIv9NgSL?=
 =?us-ascii?Q?H0ftr6tRhzlUqBk4kX8N/KuXt9KQohXOL/BSsuIV7SdZz4paCwUmHvmVVmhr?=
 =?us-ascii?Q?483t0cX7JUEIi7B2TF6whhPRqOMksQfT1APdaUzoVTMSjdzhh0XOEoeVRQ9r?=
 =?us-ascii?Q?I1BKOypFJZYdRsaTdBRJXjFlpKIsDqeFUuO+D9HwvxjssrzlJ8HaJYhIBOFj?=
 =?us-ascii?Q?rqb5Gdkg2vvSesSiOA4RE3GOp8JrOjlFe5gxdTDdU3Pj7r3GApP2EBntmyBa?=
 =?us-ascii?Q?BkQurtXSVSHb6QQgtQf9zplpbr0EbDJ/cBW4x1ymxR6xVFlCEO6nn7czDOq/?=
 =?us-ascii?Q?bzM2EQU23yQTpeuZ8MkEdhgXST9BJFWWlliryVHoLrotDiU+wDsPlqoBLN6n?=
 =?us-ascii?Q?SYcQzOA52+viriluFnMVFswfukC/VhNwRwqQfWnSSK/ZTtZMhVluMzxWuY+0?=
 =?us-ascii?Q?VaEncRzL+8sAigSiSivfsPaXUuvcbtcaqh0ZA/hs8NPMamHXJcmBnnCJgNv/?=
 =?us-ascii?Q?HpowHsuCA3z9+Y84hYjII5VdKxECr0tRy99PFa5ISHanTuw9GcSDc+WZ8TR0?=
 =?us-ascii?Q?YVAxb1f4aHZ7e378QprYUrT+i0ZZ2JfHn2bflQVibY3Be2xlyRZkwsogvmtA?=
 =?us-ascii?Q?vd9pFu8JfqB1VMQ+qCjRZDrwMXORUgjIj1YpruPz8X3FpToQkPkDovQcJuQ4?=
 =?us-ascii?Q?ijlizwfkb577y9eMlSzzIf6n1ACszecSSC5ncG22d65omEzTYvf9DLvX0dF+?=
 =?us-ascii?Q?sJqlWYlE4aSbKtzSc42A5q3XhQ8PCfSj3p2D3DnIT2Pd2X/OnlajpjyX+izh?=
 =?us-ascii?Q?2TABtIJV4ktFmTk/5uBlmcdcrD23UbXvI8vUigd6QlGsBRhBfOsZSPBjvt5K?=
 =?us-ascii?Q?hxWWTBjkeLtvwCBo11YBaNaWAl5LVJmZ9ggqCnOofhlbieEQ7D6rAqW7bP1q?=
 =?us-ascii?Q?TgxsXEmvhBFIKKVg5GF7sKC0/8To0BgOahf/YsDkfOb2o37Isc56zu7MXkWl?=
 =?us-ascii?Q?5p7zNm1RlBxGjCuV27AbcBgsb4a9FwnDZo7XQUTAx1pnCqPvWqVbfZ6Le+iX?=
 =?us-ascii?Q?lW1Xvr0dAl1md0+r7on1IJ1uEDWBwXsu/fTlRHNpCZmTgbOZiUCENBT0F/Pu?=
 =?us-ascii?Q?RxwiAA6CBMjPSp0vNPbXxO9q9ZEeQ71iF7anAB153k6hbbZPBAM3eF6o8QQ4?=
 =?us-ascii?Q?nXQ+FFSjJxUQwJLQsxVpbCACjx2IKmprSy7vnpK4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbaf54c-d134-44fc-b181-08dc6843291e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 11:54:44.1143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: spQ3kK/5QmWw2cHi6SQDpBj3tw7MCW3mpiDWiJ0fMrMW/CTEEE8rub03zDF8UDBZLhK7eNudYCPKupy3TjdXDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110180

"ignored:" should not be used, see https://git.openembedded.org/openembedde=
d-core/tree/meta/conf/cve-check-map.conf#n17
When CPE matches wrong component, then use "cpe-incorrect:".

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Monday, April 29, 2024 13:02
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie; Ninette Adhikari <ninette@thehoodiefirm.c=
om>
Subject: [oe] [PATCH 1/1] st: Update status for CVE-2017-16224

> The recipe used in the meta-openembedded is a different st package compar=
ed to the one which has the CVE issue.
> Package used in meta-embedded: https://st.suckless.org/ Package with CVE =
issue: https://www.npmjs.com/package/st No action required.
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-oe/recipes-graphics/suckless/st_0.9.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb b/meta-oe/reci=
pes-graphics/suckless/st_0.9.2.bb
> index 5e0f2e71c..984695a31 100644
> --- a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
> +++ b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
> @@ -33,3 +33,5 @@ ALTERNATIVE:${PN} =3D "st st-256color"
>  ALTERNATIVE_LINK_NAME[st] =3D "${datadir}/terminfo/s/st"
> =20
>  ALTERNATIVE_LINK_NAME[st-256color] =3D "${datadir}/terminfo/s/st-256colo=
r"
> +
> +CVE_STATUS[CVE-2017-16224] =3D "ignored: The recipe used in the meta-ope=
nembedded is a different st package compared to the one which has the CVE i=
ssue."
> --
> 2.44.0


