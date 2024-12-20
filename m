Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D263E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:41:13 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.48])
 by mx.groups.io with SMTP id smtpd.web11.154202.1734709268202591349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wQ7qKWcX;
 spf=pass (domain: siemens.com, ip: 40.107.249.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4ZLOfKYdsRapVItUHkOVagEUCxz3i8Dsa3LOTiqoahNnmulzXcAVdYxH36wH0PwdgkC+8cdF6QpAuTae9JM9JEK+2J0g2yM2VCFaWtxEQO5hu/wAAsPG/eaWOWUu01EU7JyaSv/jLaqyqvkVjBRkT8otZdEzXpoWTvrVMjsYX5EAFiZc3cnY1SJ1+kKOfCAvSZTya52sxM+HtLBMnTcMZucnnHhsyYeqRO3ZE2abzX52omioUBzXbPNUlPp04IeB0VzZjLZ9upSFGQRXe0Z2iukLlHMKFCZfMdFU5zKds9O4Fd9mRolzYHtJdlX+a8rCw8oUx/y2DM6DWybsAidgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2tSPpjOtCznHBDDxeO3slwtwsKFJ8i1BrtJg4Vv28o=;
 b=PanUtmyoeJfLEU5MMcECP4DxQzS8C0CIIaBI/Rt3uUswL0I9OYOSjT1KNOIunL0gFVOdGdSInhPQn3h5EO3FrQXrmhxqNQltdSlY2zYm6TJN8f2UT2OsFu2SzUIC5S5rnGDLhQ4KUt985JSakLqJjDuxdKKbl4lJc+SrhWb1dMN5w0ElwZCimNEQhP6DQIsCvwct7SBueGFT7kkr84AawF6bFLihNjdqddXjJH5HJUQvOBxvC5cwM8PsR7Oug8+X3YlHWes12aUrdhBIDjLFcEU5tbx9Vygcks/qGrPCVBfd4TsxltsO8KmpeKpaqXeMP6LVSu50QEqlxQ+1z0ENOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2tSPpjOtCznHBDDxeO3slwtwsKFJ8i1BrtJg4Vv28o=;
 b=wQ7qKWcX4/EP9GOC11UjNozxYm7cH8DLOlZ7nIu2pgn0ZdD3D7puy4MHwnA6AmcZNukm2lhNxHMYobQgboKxA7SQ4AU3fxqY6o8ZcxCg2Z1k6oT5VykMJKgXaWHxge1qRAFFymrbVaDMxQaTMHardxNCVcDYjdEmXfrBkLClHkTA3y7/9V9CbjJHbctSrHxWNKpopteM/TO/Dz71zJJHp/3XvKKYsp+UkH+nssvFmSwn+hg2aLAH1McHsRV4tObNOgr/DoUm4hivT+KTdjgAgok/R8/O8uv7tYmQMYR5wgBfNSQVwJm/Ag5IvwktkLBYlhMlVFDYOz6qHkHvnpQUhA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VE1PR10MB3776.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.8; Fri, 20 Dec
 2024 15:41:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:41:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
Thread-Topic: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
Thread-Index: AQHbUtFG/qoreBEC6EGtkTgN6vFkCLLvRPywgAAAX4A=
Date: Fri, 20 Dec 2024 15:41:04 +0000
Message-ID: 
 <AS1PR10MB56975711B8DD243A5224B155FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241220112053.1866849-1-vanusuri@mvista.com>
 <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
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
x-ms-office365-filtering-correlation-id: e875bcbe-7c17-46b8-992f-08dd210cb691
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ErB6JkETpmCOmgeYdXDp4/3C6jUXG1BnZ44bedWB+EHv2rc340qjEVjX2Qtp?=
 =?us-ascii?Q?Ik83d0FoWGfAoPcsoqi6/r0KlgITtoAU83jiH9OHnCttlvv/Pf/4XTdzTGET?=
 =?us-ascii?Q?jGCPZmnBg0By1slOu3rgcd/jGzLLuLNsZyJi+iY/8M8zcQfQaqBF3IjZ6Q5z?=
 =?us-ascii?Q?bxzLOMyynII167wa09sE/WpT5CHcp6dg2ViG8cLZrgxnioHydOPuNNM7yfCC?=
 =?us-ascii?Q?zUcr33UQNENXjc5MjMUCl9JhXd1ta5E8WcLKHQcu6PwhYKgTqO2hUfc/kTN5?=
 =?us-ascii?Q?C7o2PVqAL8XN9FoL7U9lowxsbKE1XQXNbKWPZosBRt96dRk8adtU49ylXyPk?=
 =?us-ascii?Q?Oca0uPSBAwIIxTZcJCMJK1FnUQFbjO+Kfi/kKXCvI0HqRf3eJM35OULHcs5m?=
 =?us-ascii?Q?horu61kx+IgXukmIyxopjTlzkyNvQNuMUwqLWMgNk/+0nvLKGpsSVyBlXxqg?=
 =?us-ascii?Q?ifHiATsknfFnQ1Dch/CHt0js9gAMOnLyhA0ci1Y24QtMyt0uBmqUia378Esh?=
 =?us-ascii?Q?GrdFJbJCfsdNr2l+ctWFwAvykjkiu8L1LN3/3PClWF+jRAYb9fM1OQQMj8Y8?=
 =?us-ascii?Q?0RB0I4/etmPXvfPQm6BfLVDDRhrKGcEv/DIxLvMC2samg8cwRRyMqGaCu2gq?=
 =?us-ascii?Q?7XktoNBbaL8lD7vnAD5Lykp9Gji8RuOyI1MuHEOGY956augOhTrhwmmNTPUc?=
 =?us-ascii?Q?2x3Jy5xeltkkuHJN5VL6NFXGr0IFPeVudxkGXcd1G2fGq+Q8ErkeTyV6lQ1T?=
 =?us-ascii?Q?93I2tScBStksQybyBmQxJv0B3wV1Uqimg7CzCHPjBdg0ZKPKANPzZO7vscWS?=
 =?us-ascii?Q?MPv+Vv0HWh4dKQtulyiErKTmT6U1J1ncEmdYWN6YZvn9b87zchQvuFZi/zSF?=
 =?us-ascii?Q?2of3D+pNX6PsZ5gGZtGcneFFdhHDsUTMlSMDLMEtWD29/jiUEatHrkoC6jHr?=
 =?us-ascii?Q?XGU+3klV0lLFSrJnOnq/pH/nMPSN5n8fJmcb/B1KIso3E65M7vY+ZK8SwKBV?=
 =?us-ascii?Q?Aql7i+jdevhrBZ0IPC+wax7c61mB5imMJKEYHIxrZ5J42oAIQ5JkRDZxiG34?=
 =?us-ascii?Q?/uylAfx3kXr1ZCKVpFr6jgc19yYZoq3fLbOz5utIZ5PKNlnkXFET6DsR9JBj?=
 =?us-ascii?Q?+mlQMPvfUUXlju8Vup5lZGEtpNxV3n2jT3PoSZrRXGWJQg0F4F93v8UA5sF1?=
 =?us-ascii?Q?t++ZvZRshG3NMyK/QmpZ5NeweAZa4nUHZUghUTV4CL9ldVjpwpuBu+4yn6hD?=
 =?us-ascii?Q?d5ABWS+OMghb/gjHgdNHoLEViMEiDAUUEGd1kSLsyYSkkD8V44VUzJTKf92H?=
 =?us-ascii?Q?E217gnR7DYrbniH94K8Q/GxB2yTERBI2uXv/uvV/cHgP2gebl3PWjB4/cDZe?=
 =?us-ascii?Q?012NOSwoWHvFwMXhrfaVaIS29bOw?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b1bjbeunWoKrefT2/tHj+l456FT3c9/McdIveRhz00mLzIaODWss3zto3V5B?=
 =?us-ascii?Q?zoAEU1nPI/3Rwt4quQsjpqxiIPePVYhPMXXS37VfF/r6C0vW0Hn+SbBZGZGO?=
 =?us-ascii?Q?bLZBkWCc1ltEMX4p+gCgHvEkaeulJuZfUj3U25mI1Iv35hzVHd80zi/+BiWk?=
 =?us-ascii?Q?0/UvpdDnoGcC2OWAPS7OxF9sXgezXnw2jISAdCc02xONt63vT0y6g4+2DpRA?=
 =?us-ascii?Q?75iP4AC28bZeozdd54d5s8vg0VPv3ipmGnufJyTUk/bNA+vE4EQFmw5DMeAk?=
 =?us-ascii?Q?TtAxB5nNdKosPXVUSBHREoq3VKSyZb2Lo38Ra20Hx+Vr/qWtdBsxkET28UWf?=
 =?us-ascii?Q?NhKtRv1IXYulVbwuj4SfoOVK4F8Ng6DPa1fTp9FU29ybpUqzP2LWwuEGQHeo?=
 =?us-ascii?Q?kxi1LXWObMUdaQNnOxm25uGOq7wHDDvvjO7mXpeZSPAwVxVdlGT6JufkurII?=
 =?us-ascii?Q?xsd/6K0GGn8JLDnlFiXqPeKqL/258zKzRkloozts7GapFPXOksoKJ2mGAST0?=
 =?us-ascii?Q?wb60Th7MjyRdeEUHDevo3vetPNHXKF1Q4/tWAtffzREI0TgKqAv3pqFqWk0S?=
 =?us-ascii?Q?c/nau8jkY61tNCC2J2IiVXAWz06JB0mYVNlwA/ZqxPMX+cEgES5BGAed3ePv?=
 =?us-ascii?Q?OErfVO4JdD3XbXV32/gxl9MpOOpePFlBI75rsBPYv8dMtHSMUGLcAl7mfQnT?=
 =?us-ascii?Q?uYK7KGM36KLQsIGWUnGhZY1IRg5/2RPn4/XVv4YeJtO7v2OaaeCUlfOuz0Lu?=
 =?us-ascii?Q?zbFO9tNHBk8jZLXQzpRyukvtyYY7af8gljySGBYQ9sDh+V40GtBjp3wsEJxN?=
 =?us-ascii?Q?H64j9OCkYWA14osRsq3KfdY4ntI1ngt6m04aVN/jhaOjX5NZS5zGoIw5YKIB?=
 =?us-ascii?Q?Dlp/C8VEj1h9KllvquIvrUlBQIQhNo1oHlEixTnS/qvUCJgEoU1iKKhERmdB?=
 =?us-ascii?Q?z85EkJvcMm+IziC2QaAgqd6na2pHCS1hsuwZxpQzskZK/xzwhm9xPVdE+fAE?=
 =?us-ascii?Q?GO3G3uMMikdiGXoA5s5BdLPcRkx/50d9UH8ADSw5MSvhecqyqOyOGlCzEj+N?=
 =?us-ascii?Q?e8CDmx+DdwOU+DZGYlUBXDOZRESQtyXTbyzUCuWDfXvxA0W9uSAGyjrZBSW3?=
 =?us-ascii?Q?v5za+EuPLI4GdMjDmqTBHldRQBsdw4qozMda+cjVsKny2gc0JWdN/AXhkCA3?=
 =?us-ascii?Q?9cMwac+l9j+Bgvnd9FX9Ffhps+wQ8oc7/yHHQF5zjCTv/25IAalXcEnEtZ08?=
 =?us-ascii?Q?KOwDiEv/8LWhnxRXYef0ZNGb1TRc1oBoPHqNJwNXW5PJjIZHKqCBii4xUsA8?=
 =?us-ascii?Q?mr9NxYGqv601NTREoFvoxSOl9D9TQxgcx2etTDVH6WqdRk7e0qsjK+UcML8P?=
 =?us-ascii?Q?LWM+jQOZy9W5Qdy9sMuiO7P2ZGBHHCeyFFPd00fBKmA7CQSmef2nZgO6X3TN?=
 =?us-ascii?Q?ayMpwTL7NnG89tZG0EtMaTeH+rjRg4pVAjnuysS75SzQALeH0Gp7LIoyQheu?=
 =?us-ascii?Q?WbwStTdsQxfQ890x0+K3iXx8isngG6P07towGn6/EM0HU6VRTdl2nrVazTIQ?=
 =?us-ascii?Q?gzwYBvFxwQhlZr450yAN9tzmumTDjhNOkfGoy73s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e875bcbe-7c17-46b8-992f-08dd210cb691
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 15:41:04.2232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBV+eCKDGm+yo3fWQdOveYeVoBKAkpZemUo5AZIOeU6m0y7rWZvGiyOMwSHIF2J3CR+ee1TgZDBQwCsazYeDYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3776
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114449

Please ignore my comment, I have sent for master, not scrathgap.
Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1)
> Sent: Friday, December 20, 2024 16:40
> To: vanusuri@mvista.com; openembedded-devel@lists.openembedded.org
> Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.2=
6
>=20
> This patch is missing rebase of patches.
> I have sent this same upgrade including patch rebase in my larger patch s=
eries.
>=20
> Peter
>=20
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> > lists.openembedded.org
> > Sent: Friday, December 20, 2024 12:21
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Vijay Anusuri <vanusuri@mvista.com>
> > Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CVE-
> > 2024-11233
> >
> > Changelog:
> > https://www.php.net/ChangeLog-8.php#8.2.26
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb}
> (99%)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb b/meta-oe/recip=
es-
> > devtools/php/php_8.2.26.bb
> > similarity index 99%
> > rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
> > rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
> > index 034f3bef1..10ef2c36e 100644
> > --- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> > +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
> > @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D " \
> >            "
> >
> >  S =3D "${WORKDIR}/php-${PV}"
> > -SRC_URI[sha256sum] =3D
> > "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
> > +SRC_URI[sha256sum] =3D
> >
> "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
> >
> >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
> >  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product is=
 exactly
> > the same as github.com/emlog/emlog. CVE can be safely ignored."
> > --
> > 2.25.1


