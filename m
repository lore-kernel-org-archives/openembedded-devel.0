Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B14C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 16:30:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web11.73353.1701707417100714550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 08:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Yt8cGVmR;
 spf=pass (domain: axis.com, ip: 40.107.20.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoDqsG4wI/ySMQO4Jyjo+rDOxpgwNobUbzJbVIz5opTH0oVNL823s++SCabQ/omh2nVdiecBljUFLP0rFdSm066u7G7vu+ckoiSZu8mPWKAg0SX2u45gS+MObi+t9nUPuEd15zXPPYzuHVtTQ5h8XSUV+bvy75h9cB+xDSKDDW7PXMiqpNGM0SBtr7OE8Xbfm3q7IrtA5E/DGkAVqymrRcLMR9g178hC2ImyLpxs7fEwC6+aPuvrJ1vY5bDYGM0ZFG3N8BnKv3J6NlbreGSwHO9apHOiU+8MMrK+oFsvp1vVdMZ6pXaSFGr4MT8+p7db70H8ejU+SZuO+HMHstJAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=532RWAKjkPaKgHIO5h+rO6ysU8hohsn3LoTJYc4u8Zg=;
 b=oNU7uFsS7cvwY7thnUt4JU4X8QKgME+jpe3fcl4ndirrwFITRkfFN5Q83r9Fx7QYvstKMHJurwvSA3qTQXYuBBvU3ONhJbpzYfNaK2FJnBWnKBRZl3hPZPTFsyHmVBwrK8NRRIBvBKMRYNZFzRQVHpSXV5p1iPAajo8gKKf5FdNYXPfjQNCbRvoaCJDqN6MbgnJ6IskRmkjpf67dVMhsUfSC+2uI1GxRaJIOtoF5exwPZiXVutH7N92AcAu2RGEBZBEddsR6KFpEzksEr9CPysShycH9J5/7O2Ii58nOKGCQhFCJEYPQyMgc0hxcs2xN90VU8eC81XLBskvtT0Xxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=532RWAKjkPaKgHIO5h+rO6ysU8hohsn3LoTJYc4u8Zg=;
 b=Yt8cGVmRXTylaXHdst7GdPk75ZkKCyM8xKkH3DE+vBiSCzuNKLCNmp2krntEhXhrULd92JisPSA9aRlWJHiI5o3Ek9ODsWjO502sRj5OqfUG9iPxak6Csp1wHrphCk4yVE2TjIYB0WhGX4qKqM8nmQaGgkTFoxCw9YvCDr6Dzho=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9053.eurprd02.prod.outlook.com (2603:10a6:102:336::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 16:30:12 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 16:30:12 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] basu: Update to latest master
Thread-Topic: [oe] [meta-oe][PATCH 1/2] basu: Update to latest master
Thread-Index: AQHaJC38ESSyeTYptUWt/9sycJy5I7CZVaIg
Date: Mon, 4 Dec 2023 16:30:12 +0000
Message-ID: 
 <DB5PR02MB1021315669766EA6DD45585ECEF86A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231201081117.569210-1-raj.khem@gmail.com>
In-Reply-To: <20231201081117.569210-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9053:EE_
x-ms-office365-filtering-correlation-id: 6a05edc9-ce44-4367-7835-08dbf4e64a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4JSfJsrX7YQ9sUUicTdasO+KbYWWDkNz5oqMC6KwiajQ58qDd+n33KOzvGMhY6DqoVefUhL7hHhqe5hUMbzZRg2OxWIwoMMT1d2rrYkGV6FsvYmTyS24gPA84MufJ4sn8IKaOPegmBXQggeFWYPM7/VfYI+7LdCcyHT0luvBEDJsxkB5HXn1jRQHnszINXUClHHHD3IqigE2unXXc5T2cfm3DPxU90C60TYmONzlnIPpTFqt1dyfWbLfnmCmQtaK2qvxONmOUgz2lRpPAtMBCvEvvaCjPY3gBbdBabMfUkzOMGsRYOVJJKHEGs6CMF8jcqopLYvesKFxnYaBpd1Ves+KQCstD0s2775oFkUa6DJcaWfwwXdfU4PTfnmiECIPWMy8ivo+eiqYA8Ecsdg15lGnD0Htpj8SIlDzYejAT5NBd4txgk6iqajKESwDE6wXHc1R/tb8AZUaapTnJzCdeZt1dBZ6fLXv8WuT3cTXdKa739rSePB0fIpMXMO8OKkrsTbtcfsjcD+iKazmprrxUZx/kN9hMbtia7Jmi6MEs+i5SMbvw27LYPS5JZ7QGEQegh26yAxPpeGbApjTteuHat7733yynf6unphNdb1y6TY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(122000001)(478600001)(9686003)(8936002)(8676002)(38100700002)(66946007)(64756008)(66446008)(110136005)(76116006)(66476007)(316002)(66556008)(26005)(83380400001)(966005)(55016003)(7696005)(71200400001)(53546011)(6506007)(44832011)(86362001)(52536014)(5660300002)(15650500001)(2906002)(41300700001)(38070700009)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9JQMNLJG5NZoNR/5GWenyZnnvGSFSaH+J4ACx6ia0sJPjilkUVCs5QY6PARB?=
 =?us-ascii?Q?jPGYDHKQIpH68kSKQ5/l1L7habRXgRKQZyr0qn3GD3ifYHpB16n6LW3D6gp/?=
 =?us-ascii?Q?FvK5oJ8kaeDevTLXVPYLC4K/InowKQgXxkYZhwIVufIn2mluhEdIvJasEicL?=
 =?us-ascii?Q?+pIUIgROmjsWBH2y8aTx8XQce0kvDoLtU33dm7dsS3ydEF99DLcFSS6Gc1tM?=
 =?us-ascii?Q?WU0d8lXspNn1dTKaN3zR/CxJKQ0iA0F+9xdVHO1EwX9mS5W2aBhu4YfqmW39?=
 =?us-ascii?Q?ieUaRbv4ndKRyGZsNWQE6meJ2gNqL2rQ0d7ZHog2Ocf1fZP36g0nfb/XHBPP?=
 =?us-ascii?Q?DQBgB2DYsnppOHd4/EFaFNpzlMPqoCAz21h6ipJHL2TX7GQaqyJgi4k/8T0Q?=
 =?us-ascii?Q?76uUYWMp88fszhew+Up164pP1VXKbq64hv2EHVAS0fy5Jcqtl/O3/xTYMBKI?=
 =?us-ascii?Q?LZclgIJOIIAWlkCB+/2zUiq5gGEcvSRXAZ8ROhqBjpDVs/gNvXRb+0TkPbb0?=
 =?us-ascii?Q?J9IINyWA8fqriTFQuJNWQjuWOFLrnnpABrNuqh4PxmnPBaZnhFCE0NWhcdI6?=
 =?us-ascii?Q?Y2a/KbsZUnFZo6HvSXnnpYrP6+Cf9k3Yvn0M429qh1ry3bFwgo3GVwrwvd2p?=
 =?us-ascii?Q?MIKBQNvCUJ31tEydAdMSRkYzIYgJTYXO2d5EspG1IXltnIfpiMyKJqOwI3q7?=
 =?us-ascii?Q?5qmIWZJYn/nbGqZnGrS8TwUxRqUJ7ZvDJKD8mvlaGryCDVhZYsJjsyPFajvB?=
 =?us-ascii?Q?wPUul4Bx9ij/hlOszJJ2i3zhYbWjnELL2ebbyKybSTdF9K0ZMbR6QbwGxibT?=
 =?us-ascii?Q?dtnUH4O+79DuH9ZTEW3/KKL+/nIO7iuo/voCtqVElIrjCpEXn83AujDFBUtZ?=
 =?us-ascii?Q?FYwFVzY+ccbC5DEQxef03qAObUZM+RBmkrlD2OZE1DVUOXkFFEuLB9WimSZd?=
 =?us-ascii?Q?YgurSoJ3dBnSBxjNq8EWVcb9EwMVof1P2VM8wu5x/RhTPajc+KKTGOYSpsiT?=
 =?us-ascii?Q?TAjL8fMAC588X631cX9NtsF97nd00BNUOXSzKuwmelQkoLZvV90RsTMpT1Dm?=
 =?us-ascii?Q?adBHt7pCsmKpFsPWA4Qtr8PvbqftrlssNLyVR4eD/8Swrcvt3+gyRYLfafxs?=
 =?us-ascii?Q?s3hj48rToaeIG4WaiaxeG20UKBElgDQaRJsxqlhJJn2APg1zhsyGBdAqD6ZO?=
 =?us-ascii?Q?iY8TKFNSOXFfKlPrjb0SizXXQ050CL3kKqk0y3yzbgy1J0dlTfxqPmbfdV6K?=
 =?us-ascii?Q?a/G8pZD495tOHrNy3VJ64JvgWeTZR1ir2piFMVL4iHfPtuIjM7lEQ31Hs/bC?=
 =?us-ascii?Q?nZcSf8RycPMJhGUOS1iz29uoTW12jhMTpvYr1mQCgFN/viili+Gn5npWClW6?=
 =?us-ascii?Q?Ea6XVuiU2z+5kA7eTj2zD6WBqXrvTNbCF+idUFyuTs5GlpYLYgUQfzs7kM6E?=
 =?us-ascii?Q?rYnOleTWKtr1PUPJsHgnejYENWzpo/KqWO9cTRgeEAQpa1hB+hfjA0OFEu4N?=
 =?us-ascii?Q?E777e4P3guEJoowqsDwoxS77g8DUcWmpgXVQ7o45S15CnQGBVg0dka2DAJPH?=
 =?us-ascii?Q?FB/R4SXYUcgOIv28hKc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a05edc9-ce44-4367-7835-08dbf4e64a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 16:30:12.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvAQwShhqdlbEs5fceDSbE04ybi6SEGdlfh4LBt8BcdtFoWnV2zC1B3hU5CSScgN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 16:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107209

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 1 december 2023 09:11
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-oe][PATCH 1/2] basu: Update to latest master
>=20
> There is only one commit after 0.2.1 release which is to fix build with
> lld.
>=20
> https://git.sr.ht/~emersion/basu/commit/a08cf5a575325435040d35710dbac3d0c=
32b1676
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/basu/basu_0.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-
> core/basu/basu_0.2.1.bb
> index 500408e11e..56c25f5f1b 100644
> --- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
> +++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D
> "git://git.sr.ht/~emersion/basu;protocol=3Dhttps;branch=3Dmaster"
>  DEPENDS +=3D "gperf-native"
>=20
>  S =3D "${WORKDIR}/git"
> -PV =3D "0.2.1"
> +PV =3D "0.2.1+git"
>  SRCREV =3D "684a41d68cfbb05e38aacb60a8548e21ddfbecdb"

You forgot to update the SRCREV...

>=20
>  inherit meson pkgconfig
> --
> 2.43.0

//Peter


