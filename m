Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF32C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:44:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web10.17406.1691675050015625212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FlXHYy2F;
 spf=pass (domain: siemens.com, ip: 40.107.8.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDNFFDeBpD3Up6jD7OlXYMQwmaofZCSp6CY56x9+Oo6jryOwwHtPIGx/q0C8vlcFE+1dJVBPI1gOBC5sGxbPT9Jv91kVU4mBTzJrKvxgpu+VaNToBWCP1dbLmg55xWTtEa9dV4H2wqNrvzc57i77naU5t6nFugEalD1nA4KnEQmrfkwmePd3OG408ZlzLY9mL8UlFiqUUdv2D5wtdwqXCowkg16yo1IBJRLoG0xJvTh0O9hf1Skey6rFazRvxhKfzEkJSbwbqxa+9/IkswgC51667/CwCWBc0REwtzdGKBIQ6VtGrxnUHPQ5Gtv6zq4fnsTMVLwmIAWt8HYm29HTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45Xi/VdvHaQEHtlWUJxcVCzYPF3zDYCRCufPafgMgAA=;
 b=mtusBP72ilKlKvnl7+SKvJGetXQy4l4Hm18vL+NtgOdPUwMjFMeqCxpDIQaGFLVixLVn8uEmqM9IHsrjTQXd00sQeXXHx45mFtIi302sLS7OWUujjg16sDShgbCC74AU9qKj7uLlrz1O3sO80HEAg8p/Y9ILwZ3OwuGeob43he3yxR2/3Hp3c6xGuFQCNVz+ulQIYQ+L1XAkSgAyRzvsZP5kQUkQSK3bo5QGTf7NcyBRTT+NMnmrNrQZXEpPLbY/76tjszpX3tq7sNoeFXhgGJC2TAXq9rPZ4KtZ6rxliwAx2I8qvuE8VNd2CecDMZjS6xrKtuuDpdXaa6mUWE7d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45Xi/VdvHaQEHtlWUJxcVCzYPF3zDYCRCufPafgMgAA=;
 b=FlXHYy2FDGL97s9bptzEm3HwfzrrSZ6MH6Y3/TQyGHwfV+2NTVPNJIaixyUK8fne+losSXwW6X7Rd5LPczo7Kxp0josTNedCJ/6/7gOV8lbR2Cxr0+ueAGYzLmHWv4jG64kiZR9Ja0jFjwxzvyzcOW4eDmNAtabLIoTERTTw3euWVlSFcpIephlJ8Rlis1E//Yv8HWUDyXc80Rw33ZVexE0CfD65W6vnLw70RgYIo6KbCw1rua+qfrfD8LCtXkuB+KuyzD6qpxJQhIsaRPBaOvhfJwp9stKFarDwW6L9Vst2u0+D0SGVq/yu+elmZ67YCHIo3HHODAKjD0Chr4HYug==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB8029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:44:06 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 13:44:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "marex@denx.de" <marex@denx.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>, Martin
 Siegumfeldt <mns@gomspace.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [oe] [PATCH 2/2] libiio: Rename to versioned recipe filename
Thread-Topic: [oe] [PATCH 2/2] libiio: Rename to versioned recipe filename
Thread-Index: AQHZy4+GQy5kbDGhrEydjfw586Qs76/jiY3g
Date: Thu, 10 Aug 2023 13:44:06 +0000
Message-ID: 
 <AS1PR10MB5697788866BBE3D33DF0AEE0FD13A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230810133502.9821-1-marex@denx.de>
 <20230810133502.9821-2-marex@denx.de>
In-Reply-To: <20230810133502.9821-2-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c427c2de-663a-47f6-8955-7b50d25e0356;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-10T13:41:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB8029:EE_
x-ms-office365-filtering-correlation-id: a5ab9923-bf4e-48af-e39e-08db99a7de08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 USnzgWVuIPcE8XLTim7LCtHguDjgcYYHPESMH5TDO3326Ua5quqIoKJGsXyyKjFAQ9bAv5hZp999puN5+JYlbLpjIrAd+OiHbsrk+NFalEOlIo8kAqb7HzZf5ydZHn/gS+of7LtP+3PlAS4F3ANjTuE2BSledAoNYYbjIUd7PByuwupyAOLPb//3K4Y953N6YkcDSiGe/g72dn21Ub5HslNYmNpr0b9FZrI/Vz3Dba5FmmYuNhVJn6U0XT+HzI1Fq+fJ9UjhFI3MswbYWDV1U/QnGJQvU/F5epf6WIgEhkhEmQHqhfUQ8egOEmO2W4qiM6PtOFgH/OuvQO4sbN40UU2mOohqQDkebohHfA3v/7bJyi8JoM4LhepbYPOUKBlkLma6WNlXOpge6IwLB4/Nbzt494ixm1zCfxvGX5/tX7OnwShoWJ9+rT10T0n2l/Q685HwbrRrVpFbiMkWRop6DKYT7wSkRwgrApV3Q2UKOHXXOm82owHWWJnDLj0dP5umCwMekCDq2RQ+PjXTUX9VVF95B0nREpdGN2svXb7hw76bHFmHjNAbTYN2u21ZIElZ3VY5hQLl4HQbvYXo4I6reNI1Bx6y5LsGFQBgnLRs6+mWF6hIBAUM7ulScVdb26Yv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(136003)(366004)(186006)(451199021)(1800799006)(83380400001)(54906003)(110136005)(8676002)(8936002)(64756008)(66476007)(66556008)(66446008)(316002)(41300700001)(4326008)(55016003)(66946007)(76116006)(33656002)(122000001)(7696005)(9686003)(6506007)(26005)(82960400001)(86362001)(53546011)(38070700005)(38100700002)(478600001)(52536014)(5660300002)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ff1+lBz3mOMoF3Kq53VydiSOlwS0wuHhHFEwESGXE4Wj6CXQdUxq2Rqmc3ne?=
 =?us-ascii?Q?fFO5ybACJAupWTlaeFUVeeFPlintKmP/t/h6azS3VcV84bwUejKwToggfJyY?=
 =?us-ascii?Q?SwbQfu/HoIxkaKuntpFtOGE+lULZSomymbIe03vZlkz4duuzGY/zKjAVkhqF?=
 =?us-ascii?Q?XSrMRLEwBSlfR/zqF7cwzNz7BvICtH1S1rUf/cpUAvYYTNd/ehi4MHbQT4x1?=
 =?us-ascii?Q?6qsxazk9pNE/WisE2gp0MupsZ+/HgHzjHaXDnIdlzJtCRWTat+9L1F4lvCj1?=
 =?us-ascii?Q?/vlziL1Inj1aW0TXn/75Wagzgz/vB6Uax4YEce31decB2saaqClk8bAM6gih?=
 =?us-ascii?Q?JuaPiR8ikzRsijQ+QufP9sIn974wIFuennOoojI6J7BCsh9qjCfT8cBGAe4P?=
 =?us-ascii?Q?tfWyXxgpwH5Q2r5qI1aIVmUolvR4UQFcAo34axsaJFgeW8IvxKo2vH/Tjnqs?=
 =?us-ascii?Q?Esht6i6c/OYgpDd7NlBFqgQTVBQ32+VrKP+0J4c1rc5z4QsNoTPx+qef65nq?=
 =?us-ascii?Q?hKNGFcxNtd/y16mhraXTRXb8Eg8QNtvcD9agLRd/ZHJaglMFtsCrBMZmsH+6?=
 =?us-ascii?Q?3rFiqQbVPQURuyFaSuDrdWK2qQp4ANMgW+sems+ZGEoCqaIf2s/rDb8FVIrS?=
 =?us-ascii?Q?JaO5yAPDgSM+0JFJlfMyi0e+OQD+WctUVe44kvIFr2Fv3GGojRcA0RWv4RO+?=
 =?us-ascii?Q?FLKwlwO5l6ms6t6Je89De0qbm0h7GBEEfvBUwsYfKeX7thIaUwal9yu4npsV?=
 =?us-ascii?Q?p8oteJGhx1AdYd6Ew9MWdSTGZ34vvHxePAZvqhFEh3qDZmZUlmuTVJsmceHe?=
 =?us-ascii?Q?C22ainfNMV8waqVWtPCEjxzGgDRT46O34QkTqRlgT8T5Cxs/792lbbrllixL?=
 =?us-ascii?Q?PfIt3+KmgqI+5xp/9w/NwiuVUpq197pGDEkQqm4OfdlJ8q3O3x2lIvo2Qmst?=
 =?us-ascii?Q?pSjGvDLsFdH3AOgL6fRItTZp+N3RyIZ9uTeD6ALubuxnY0Oto9w1yl/gqMb/?=
 =?us-ascii?Q?vo/+Pd3k8eqErHD0rcXioxCDfKURxJjBpMEisOYBUsFtrhVx6ndtO53iCvO7?=
 =?us-ascii?Q?F7A1bOCOeRHH6kHT6RBNL4aGnQ24TB8khiN/uAx9hpEds5kMnU0yzjcpUTlb?=
 =?us-ascii?Q?rW+CP5tzyK05MU8gSLT7SbQWZsn1SKqD67UaHrTLUqWQUuQUUfQgthlInrVa?=
 =?us-ascii?Q?0Ic192IEVbAVUygVf7f4FNFXhDEI8sfRbuh8C8qZQSIwmCkm7BQX6OqnutV/?=
 =?us-ascii?Q?gNl3hUsHhS+HYYZqROV6+Ohz2KZF7C3lFJroeSpOLdyZW/O09QLvcJDwUB7Z?=
 =?us-ascii?Q?wO7r0hNhQvz8vIF0L8GR/w0cEtLZrptOjQ/NJF/Ebz0SE34eoPI8Htbe8QFU?=
 =?us-ascii?Q?1YQQ3r/jJ+OD+OHYukSIxMD/TW+VqaBrSQB0EpD2t9hjBDHB2nPsZp23KipJ?=
 =?us-ascii?Q?/38uDCv2pDukC13ZBVA0nDSHUljZDR7kPV2daS9Zmv9ogSLBrJsIzsTXNgHt?=
 =?us-ascii?Q?kjE1dq2nzIyEzyWJ9U8LFjLQslvkTjWZrua3HQW611n4fl3AZ1rwFlzeB3MY?=
 =?us-ascii?Q?hMLzXMMXp5IgfuxdwHioyDBDLXnr35yGhgdf60Ww?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ab9923-bf4e-48af-e39e-08db99a7de08
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 13:44:06.6430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtdwup/lVVQHyYrcxDcrOtV3W7MYbWWqRfRMxUGlxu7ujL6OgQ2YqHtj+n8f0nGx6VzHQEndjxFwW8/n9mGrRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104319

This commit should also remove PV =3D "0.25" from the recipe as it redefine=
s the version extracted from filename.
Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Marek Vasut via lists.openembedded.org
Sent: Thursday, August 10, 2023 15:35
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>; Christian Eggers <ceggers@arri.de>; Khem R=
aj <raj.khem@gmail.com>; Martin Siegumfeldt <mns@gomspace.com>; Paul Cercue=
il <paul@crapouillou.net>
Subject: [oe] [PATCH 2/2] libiio: Rename to versioned recipe filename

> The libiio recipe now points to specific version within the git history, =
rename the recipe to versioned one instead of _git one to match it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Siegumfeldt <mns@gomspace.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> ---
>  meta-oe/recipes-support/libiio/{libiio_git.bb =3D> libiio_0.25.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-=
support/libiio/{libiio_git.bb =3D> libiio_0.25.bb} (100%)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_0.25.bb
> similarity index 100%
> rename from meta-oe/recipes-support/libiio/libiio_git.bb
> rename to meta-oe/recipes-support/libiio/libiio_0.25.bb
	--
2.40.1


