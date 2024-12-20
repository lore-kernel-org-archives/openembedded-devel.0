Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81985E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:40:23 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.78])
 by mx.groups.io with SMTP id smtpd.web10.154536.1734709214876116925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RxVBhiBc;
 spf=pass (domain: siemens.com, ip: 40.107.249.78, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEY04Es/e4okxIxDIqxj0JFgVkS+wVGkqOHBOL8lh4hhBnfMu6W7nh/PLhq3doOaJTy4vjmkbiV20IXzRNSTDBRAk/37pwoX0s3X4WrxL/qp6Y5Gw0mjeuFQylbJAOciQLNH9xxGKr7Fx89OqT78zTp8ovjAE7CXnVtCw5YDhAFjhzaGk7nOj2rZuiSftZ+pXzhFRqwVKm+E7vx6Gi/HvwIk1qmpGA6CksxkTSR5M9nUzqRv7F28neqtQmJDEMV6Fw44AyskaurVm4uCxIbS9nVcwYeV2MdTTShnrKdOTsEtmxIDiGEt2c++c2G++Uz167ONSEpzhVkHwkTZzm33fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b2+XLOB7cSYvVzTqvN9ZTNgGzohNQm4KMOUps9/OPY=;
 b=emGSzwOrCvO/nZjbNnKMz8kOaRsjVpIKYfKtkvDOE5Mzd7wZ3GJWMcbtWXuASR+utGHStq1fBWzpAxjaxRolBHGqMY5jBdXEAZKYifpfBDwRUB0yNSM/k56L5izKbtLHVBbod8aGzLTVi47d8pNryKH2xTv+ayZXz5Uzr/d00wJeu5olW47A1c3PIDw8f99QbvrtuPrcYVrlgVCmh0TRxn9TJ2oFxnAPJyj51yGVkiwIP0C5FQ0EGxTNH67KZySxKlq4OdKni/BE7vJ1pcuHcA+6ZQWCwvluVfZRxUZz2HvLhOeVE/NvvO25rKBB1Fq5VCqe5M8RldQ0PbfDHQYMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b2+XLOB7cSYvVzTqvN9ZTNgGzohNQm4KMOUps9/OPY=;
 b=RxVBhiBcPqyNHpNXBuJyyEHEdMtBY+RWg2fPW0472hzh+NNS8HORGqkH13eEGNWdBjwhd2tLeGwQJwC0ptAvvQ7Z3JEwP3ZhZcis1XQIIKLRJlTGMyon66tqmdDwJRrYYbOtBvvtEiIMO58JjSEH5qzQjoTsjq8TSjvrVjIszFIJiOGKeBVZjmxwWRqaRSq8e0sBxg8nS11uQrD7Xcz+AFwbQoY+xQzqsL+pa9sf+7kVTk/rOCff9GGrc2xwKuVhwyio7xCwfx6e07nStF7Q7s2+ApC27YuW4koDQDMjhGSM7CruF2ifCRUsViBdpkjgzBWKIk0pIJOgbkLIQpP4fg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VE1PR10MB3776.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.8; Fri, 20 Dec
 2024 15:40:12 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:40:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
Thread-Topic: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
Thread-Index: AQHbUtFG/qoreBEC6EGtkTgN6vFkCLLvRPyw
Date: Fri, 20 Dec 2024 15:40:11 +0000
Message-ID: 
 <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241220112053.1866849-1-vanusuri@mvista.com>
In-Reply-To: <20241220112053.1866849-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=14ea8bff-b762-4458-81ef-9c6ef3c83441;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-20T15:39:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VE1PR10MB3776:EE_
x-ms-office365-filtering-correlation-id: 340114f2-69ee-4e79-5991-08dd210c9765
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XR+uuznrCttf/Lc0k1Pj1S15xO2z5YRVjkf/5Tamnyv9NYv4T3Gj+SWYfUDf?=
 =?us-ascii?Q?wUrXiBAXJ3l4IeRxD6CRHVBhrynCI0crxVJUEWRnHCbhvNbFTMUtDm4mkU8n?=
 =?us-ascii?Q?HQZ0mSNNIkeZM5qbMt1/LeRBSNbOX7Mz7RjFs9A+/FWb9pME91PnvBUHQLMz?=
 =?us-ascii?Q?vi8XEqqWiJmPd8iYsEeCVeEkSgKAYRx0KkKMBRSz+tA/pOtZ+z5PwgplTuBM?=
 =?us-ascii?Q?eN8SoQFp0nENWzwYdrGFvTwPLBf314Cr9ZhhJdXdq1C4A8bpYQ4UYpWcUIho?=
 =?us-ascii?Q?BvfRSt37pzMiKh92xu8wYYRhLKnq7y4i3ZGXsjYolS6C2gc9NKA0ytVU5v1C?=
 =?us-ascii?Q?IBktksysHoUvpemuX82+gtuEWyyAxXus9nelsljyNuoN+ggfP8PuTDuy0G8n?=
 =?us-ascii?Q?Uk2gzEP2z88Mgrv8jpgsaBYVFuRuAFYe5LZJisV036K6VkTT0+M1fJxTjf4w?=
 =?us-ascii?Q?o5sDcxBK4Fg19gdIcxto7H2QLuaFwGmlVQu9b3HKguExHM+Ip8pZHiHJg9Bb?=
 =?us-ascii?Q?VZFjf6D0t91u1AJt1NN3X6oKBrGFQYekKbtcsgN4vG5I7+zXbql5a5b0BYSG?=
 =?us-ascii?Q?27mzqMitprPiMsB5nOhp3yOgoNdLTShKsPOALyXxLDQ6uL1ZEzq9mfu5RHJX?=
 =?us-ascii?Q?RzSrMva3JzwQJstBHo4ohcL+pvfxsTaLS0+IjcgQ4HXgFG3YXlKgoYvjaVAu?=
 =?us-ascii?Q?rFNVmyPH9/u2fr2ALMiY2XH1qyXvNSmlMctuCIr+XIEJ/+AEaQPqU9naynNO?=
 =?us-ascii?Q?AXbezeV7QXV3BvwUpF+OuOXSu5tJvzY4fPbTA0wPOj8arWndtwWEDYImWGgf?=
 =?us-ascii?Q?v9nGBeZ6tQMOJd0SqgWtWZluRGLV9k5KQWrouLS+MvqD4aIsNsK0ZEIVsPOR?=
 =?us-ascii?Q?iCLOyc3YUvxGGcK0c4C4n9g0QT2E7Au9pYKn0fV2qiwipEM+GZMT9I8v5XxJ?=
 =?us-ascii?Q?RAczez6WrRm6Rb9Un/pqsOVErhSMC0yVC2vI7YZb6mugnaXn9Zgk1iYHXydN?=
 =?us-ascii?Q?K8ceu/r0ItFlVRSZyQ14IBxiPB4ZlIUTwNCKLvqI0HHQ5rE8upMHXyWUZ9iC?=
 =?us-ascii?Q?MoLjoyo2rhc8UojEBWn80GJmqQvDqvP0EgwiYqztCvdZTTPfxd8evvsk3jrB?=
 =?us-ascii?Q?2HYF0zgJALf5B6A3BRADPSmdXymB/wfPfnw/DtNNobP4O7oHIJmefNYd1uGs?=
 =?us-ascii?Q?nphHC2JPi/C8MOnvywlcOqbFz117b1QOslizH7NZqEBi0spJMSUg/drqUVtX?=
 =?us-ascii?Q?GHUPCnKI8F7Lkk90qvFdAFtk6JYJXtfCFzlSqttYvwXPl50MDc45Rt9s7srf?=
 =?us-ascii?Q?kUrEuOidBVsImpGqG/XBE/fdsvGK9unc552n/+OSm5j4RC2ZPULh57TPLGQZ?=
 =?us-ascii?Q?wp+OnxqYoJTNdIOpeLyjTSR4Iiz/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lqzsKSYSFzlCgfVO/E579Jp8wX6OhPFDJPxHzfuTO/qEviA5Y2KW+RP+8gHN?=
 =?us-ascii?Q?xBZ5X+B4+DmVku1Y0fhM8kO0dvxsLqQWSRDruNImbCOmSRpUlc1FJTiVaCFR?=
 =?us-ascii?Q?MHUMdG/eAxy3ZoZNeU5SMVLcXWQ5G7zFxMx/v2jBoNjnNb7kdGBWW7CIgaZN?=
 =?us-ascii?Q?juKQL7U0mtosLpk8cCzUApurtLzF7r3ML544hjQp6eRMsFqyO+zHDc0n3MCZ?=
 =?us-ascii?Q?czAqtZMMXn8hNtIDcCNvn1DDexiPqxrCnE1hQzFC1gdbOWbcApVXi3RBBxRJ?=
 =?us-ascii?Q?NMKQcrBF24s9Rxgn89Y4FiLPQKSsZJySwCVrGM+r9IHCrMI6LOaYXajk5ZMK?=
 =?us-ascii?Q?/bSK0g2EP8xrVzhQm7nCiY0PDbkxZxOCu1tU5Hj2C9b++KiMUHp1G8rMtV+q?=
 =?us-ascii?Q?dkdCyObrc9TkLAwKfFZf07NCcpXRg5kRez9gDU0OlLgHGKbQ3nOhRs96SfFk?=
 =?us-ascii?Q?BvXBljdww4YRRCeFzEbSTJM2/nyP75VadfCkkMVXq2coklwPOaQv5JMkvjRM?=
 =?us-ascii?Q?KTlDcF1yzeCdNc29b+ABurKqN7/f/rHqFei/H+dglzyLJ+BYym2nwXGwOgm9?=
 =?us-ascii?Q?vLvxfCBaNYT4Uf4USrLUDaFlS8/5W68QqnB5cG/ucIt7vwM2V7EG1IlktEiv?=
 =?us-ascii?Q?IsdI2LeErYeFOVF7sOPsQfU/1f9Eu0dXUKqb9dtc9fAOCaEsFRG4gg5VrEf8?=
 =?us-ascii?Q?77WI3b766+w66EgGN5MlGtbt2GjrWR6asgENAovIw2L8lb0MYQGW5wc+zdT5?=
 =?us-ascii?Q?2ZKLc8b2Am4Xaq5DBjRs9G4mkMQ9PReNbRxkpGHBQN/VqR2rerq9J1eG0HW7?=
 =?us-ascii?Q?yDR05vkBHL3orNcBDseWXUg8F8CsOsEK1EwQHhu+7jxUmN6TaKfpW460mSo+?=
 =?us-ascii?Q?oHIXmL/ocfOOckhTZ5bgBC9TUSWiOFNXHNt0SWtyOeZEv6IK6M1tXUdUSmHm?=
 =?us-ascii?Q?BJBtC3wYW/b6oeRYFbRRS6xvHtCURn1THyX5uDHXIQWZ0WMRB3ezxnPeornI?=
 =?us-ascii?Q?mWF6eIM5rbayNOZo/TpFRJLf8LzNTheJIXa1pbRZC7V8ZSYzuLy0US8tjEKB?=
 =?us-ascii?Q?E8ySG8JtW5H06At1TBK35Z1Z8iE02RjjR8XYzaw8ZdhSggKbF3W4C4NqCC4y?=
 =?us-ascii?Q?UxXXzP1ciTnsDWG3QTOSVNgQJjMm5wLmqtS9v/N2zjWytLMKpgB9krYTc+EN?=
 =?us-ascii?Q?rSPCx6WheO2Uep5XI+maQAWZYgEPSHemjc/97o9u2iAo3k6sKVhmK2rf5kGh?=
 =?us-ascii?Q?TjaiHBCdhM3aezxXwhmszULNaq9Cl00m9XWTiT4Ccwvn/29bxxQFCW4VneCP?=
 =?us-ascii?Q?tyJch4rc6Q/JUpFMXk1ZD3a9cTgFC5TXh8AtXeOQD3gIoEibVgDYie31GYvo?=
 =?us-ascii?Q?ljVT9VVDNqWQjvoWVwEMm1ni0ugvr3rUNtnwhtNwTVOJXbfT/XsY+VX6AQTX?=
 =?us-ascii?Q?MgqpzrlQ4/EsrPJcP23C23G1ygXOrzSSYM/m5sf7lzSQHKZM5lMNeXr+E0oT?=
 =?us-ascii?Q?4Q9EzLUPAS8owV4asOMrH2DQ/Us4rrt324Eaq5Z1Mf7k6PuLy/w/cy0WID7J?=
 =?us-ascii?Q?UceSvtY2oGjCG7Zt6cuprhIRal2RTUZAB8saF7xM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 340114f2-69ee-4e79-5991-08dd210c9765
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 15:40:11.9744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syrLBO34l8+U+3I4TRWkrdWa5bjXKnAP3sxSash5kB6QV4vWAqRkrtz4R40pQ9rtzhyRav+X9Cjp/4lSShTyZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3776
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114448

This patch is missing rebase of patches.
I have sent this same upgrade including patch rebase in my larger patch ser=
ies.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> lists.openembedded.org
> Sent: Friday, December 20, 2024 12:21
> To: openembedded-devel@lists.openembedded.org
> Cc: Vijay Anusuri <vanusuri@mvista.com>
> Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
>=20
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CVE-
> 2024-11233
>=20
> Changelog:
> https://www.php.net/ChangeLog-8.php#8.2.26
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} (=
99%)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb b/meta-oe/recipes=
-
> devtools/php/php_8.2.26.bb
> similarity index 99%
> rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
> rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
> index 034f3bef1..10ef2c36e 100644
> --- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
> @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D " \
>            "
>=20
>  S =3D "${WORKDIR}/php-${PV}"
> -SRC_URI[sha256sum] =3D
> "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
> +SRC_URI[sha256sum] =3D
> "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
>=20
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
>  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product is e=
xactly
> the same as github.com/emlog/emlog. CVE can be safely ignored."
> --
> 2.25.1


