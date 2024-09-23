Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A193DCF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 19:22:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web10.247.1727119345553811452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 12:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=d6pQHTIX;
 spf=pass (domain: axis.com, ip: 40.107.20.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suVhAK3FbpHC/Bc5ekmliSEj5HtWePQyDjde3TIWa2IHF4HECtAHl7Z7N4LYkuzegECLAScMjhNYvI8tu7xeo1gcoOAYmWlimwjNJ2Gtqse/PMhGtfqYmoMVzgcs0Wj7LzfmKY7SgZeWUBZQiae/WD02MmaBM9f6vtsHPp2ccNB2K5ycUTd/Eg3koCQReIizUU9dvPUzbfqZDes3scZtA6rdpLMdPfBm2XJQUuqgFijSDAceiKikmRbP2bIp6DeJeSDPwLUwna52lwYkd+IDrgtKUgxJVa2DVxqT++mKdhnPZ8Y4vuOFZq2+7d6SCP8seexTxRSn9XCNoAabLuGa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BDnhqubDNz+YviKk0tifJITvHmHIMi5kpXauXL77K0=;
 b=i+hwAOgZhtH183uvhqtmM4CdoOMQUMJ4S+GxgtWkWtOwpS43CbSoEqel8iIccUdbyJ/sZ7kA/U0+8POPpBHipkc9LT0ghwiAn1VsWd1OYyA536ziVAxu2pH0bzj2/C6xwgWmNoTZAPpK57QbZnr+zhEKbdgoZ9OOtPqTBDhHBpAcVtG3U2/8Y2NNnANCPjdlUpEUqOJTXwKd7hI2a9YBqcExtX98PRlZX1yY/UfTNdbRnFUgOV5sRX4CcjJRwNavSm7A099ASUZWWjn+3ZxbXxY4rKTJOS6v7WJ1eaf0T09R45Pjb42fPLKhpkKQiHpuAZsYQPrOx4nFoXxj0RGkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BDnhqubDNz+YviKk0tifJITvHmHIMi5kpXauXL77K0=;
 b=d6pQHTIXSH8bm4/S9wu1IOOY3RvfT4sG4rayhuP4SQgvW7B5X/25V9TWv5FEqQzI3e1s0oGZ8M3Ql9vUs3v3MKIwl17yfIxaJN4zEq3r1ScNbL38158tnkJG51EWm6FlBYJB2PGhIX+g6hi7HtB0BZRQztcbiELheZylg6a8FMI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB6598.eurprd02.prod.outlook.com (2603:10a6:20b:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Mon, 23 Sep
 2024 19:22:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 19:22:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jan Vermaete <jan.vermaete@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 0/1] RFC: some issues with go?
Thread-Topic: [oe] [PATCH 0/1] RFC: some issues with go?
Thread-Index: AQHbB5gsgU3eftZAkUiJUw0uRs7XmLJlybpQ
Date: Mon, 23 Sep 2024 19:22:10 +0000
Message-ID: 
 <DB5PR02MB1021341EE5B7052C3CA68E533EF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240915175305.3390769-1-jan.vermaete@gmail.com>
In-Reply-To: <20240915175305.3390769-1-jan.vermaete@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB6598:EE_
x-ms-office365-filtering-correlation-id: 4c25939c-d2d2-4a51-265a-08dcdc0505a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?JMKXLXfkJwYjgoCXpUHGFZ7mCf874Onqea9lJjhoDMTnhVbm1z6az1C7JMqd?=
 =?us-ascii?Q?7EPQ4AeWfEMRd7asoPLwFNuM68fbHZdUg2YSewgALqH0IODwmzK2uzxGIpu4?=
 =?us-ascii?Q?7t+/8WlvnVxLxZn74REZya2r8ypzqzG/fzbAmusYL+iydJxVdM+kQVDbTlGp?=
 =?us-ascii?Q?3oE1zWH9uAsJOTh69mv/oOeihSiIWwmGQqCj6TeP5nU4RbTic2xKTBiwVK1t?=
 =?us-ascii?Q?oszfH537igZ3DbVo7iRh2cbSQnOKYucgZz4TnxUi1UYNQn+UMQDc4T5BDN01?=
 =?us-ascii?Q?9vwMkJoyCqcq0+Ona3iYmeQ4SRn14g12wg9o8rRN5rs8kTk4l/FBrfqspy0F?=
 =?us-ascii?Q?EANWa6zbZWgpanuvLHcvRIlJucb/ehd8LRhT05fy44fpy/EZLzCXUmfOgHua?=
 =?us-ascii?Q?KHPCwg7/4GQqj1W9LQKsP7F0ALBI1cMH2J6r/UnQgfwTbNAiUC2MKXILLg6n?=
 =?us-ascii?Q?o2q0fxkIb1VwJsuK1O1HiPJ+RNNdQJt30l4XtMRESHt5zVu53M/61ogldWaC?=
 =?us-ascii?Q?fS5jSkvfPyHGBicUx/OKcHt6x3TxZOi9Ock+lAEHaZGpbgPvHiGGKMbZ8h9Y?=
 =?us-ascii?Q?2sENHICrF+Az1vTepd06Vfv272w31eRu2GlAI1FM4b2lClD90vb6Gyq/5kcr?=
 =?us-ascii?Q?Rt57ETJNkfnsgzhN5JcGSNcYma5ZMNoplrAnUltf0T02Zr1UsdItloeZF/bo?=
 =?us-ascii?Q?Tn9yGirDf1SqoUUiE7/FHV4J0QrlXaGPGt63jeXzajuf2CZ2O/hIL0Ebt+PJ?=
 =?us-ascii?Q?7g00lQft8eHgSuH5Tx4i5+4SgoqK+oG/RzPR8MbzJ5QayFGzY1kPQ0cWox+c?=
 =?us-ascii?Q?ePkNlUHczu7J6JOoeiIBTB/JBTtsC6fqyK430LSXpD3nTRLF+QJGLBL8vzhr?=
 =?us-ascii?Q?0WpPo9JHrxvZxzlyn/wQXDTHWdcind1oU/jlJkoxaCVyTmnGXZin2sOCHoOr?=
 =?us-ascii?Q?clPJdORwODOKNC9bKaqpnioLQrZOhMVMHPt3SHidDx5IlFCqvgi3JK+oQCAP?=
 =?us-ascii?Q?5gS4a9uT3Ur80QMcGMHZjSqoabOa+cL5oG4T/5VkwKLp4oEjEjM/lA9BHa7e?=
 =?us-ascii?Q?oKrfZ1SktrJ7UE36MC1Dqutquw2u0rPGsjfAEABvUnbm6E5ozKdh8H0OW+oy?=
 =?us-ascii?Q?NOn1nRvC1azMvNrMjah+mSCS+TT58wshzYGO0HGiDQiVi0Kb8fiMGrAvGF+U?=
 =?us-ascii?Q?dS8RPUtbkTQehe72c144sy+SmaRB/9/8Esms5iUPeD/sJq1Lozi61stFLX5u?=
 =?us-ascii?Q?JpUG+23/io2tV2GFtLaMo5pN+Q9JXSt/0inmbKU6jeNDpMk43LsbbCpoOehT?=
 =?us-ascii?Q?sAdpxZQJQUM+Q71aYD1AC1niEPp9TG8rz+GeotlOOr820Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LlXhbNkcv46oKbiKVdop5KXwpmytdiJcgD+ij7+tT6ciu3c4z0oCI+R/f0xt?=
 =?us-ascii?Q?PTED5wcKm/1j5qjTBU2dqROMOFHsyhsaveaqCFKJcb2CCG5Xdaf0e/RpvwUZ?=
 =?us-ascii?Q?BWdOV1/Na0njJnF9IB1Yz4Q4d835V1VQa84K0nk3sCpvhzLQ+iB6n2rp3yDa?=
 =?us-ascii?Q?H3PKIdeEFukQms61z9Sl31H5LnV0G8ock+JP8+Z3Sqg0uKCsgcqsQxXny4L5?=
 =?us-ascii?Q?QElRphigx9mJwTO9gW9G3lKOdyKdnH3sThFO8uDhyh6WlgAdVgObyFcQrw/T?=
 =?us-ascii?Q?AAcIv9cLrcu/vqQQdSJNLkbmXXN6DD4IXvUOYM5TzO/wfQlD1vYl48v512yu?=
 =?us-ascii?Q?1zZtiVdD+7zmG+pgzSgwnFK/3NRnMXjNCy40jzinOTLXuj9T4R+VIvVTV8pm?=
 =?us-ascii?Q?8yZdQO1VORcpNZPDzkOulO2kWrkD7+AkOHO5FxFlxu9D9Dlo7soM3X9VQHeu?=
 =?us-ascii?Q?Fjfk64FIkSRX3RrHG2ZfKKrFKN2Eg9K1LBJH4tG9VjH47OMS4OgEKTgjsUnW?=
 =?us-ascii?Q?gMYS8RQXVIjYD+CgKzf6ZtADp7q6+3BVZYvTLJeo0dlaL0YsYu/GLAezwsGd?=
 =?us-ascii?Q?isBfDuX6Jj/NTyIkr3142RzkiASrxQUwVO1SC0KFqgnAcqUBptZkbsI746Bj?=
 =?us-ascii?Q?AXrQCRP/wkQyFN/6q3Z1EbDeXM83dWLgAqqdphDa9BT6/2UVQ74RlrsD6S+0?=
 =?us-ascii?Q?mfkUigL3sVeHT1ZHwoh43MDUoLEIeq36KPhHh+iuWRBexGs4Khs/5184n+zl?=
 =?us-ascii?Q?q/9gQlAkWpv+Odl1B4eykoRfNgyMGzWsyEFlOGTXkhb5+HQaYmqkKSdqQYEb?=
 =?us-ascii?Q?87obPSsHvhhEaMCTltpahAtZvlu8BLZzccHifyGxSaNnYHhpMu+xqYGXMxWp?=
 =?us-ascii?Q?sorW66XY8MEYUDrEBkKTHHb8Z1zzstW51QAM5VEZFVU4MqC2TIOBeYB+fQ7a?=
 =?us-ascii?Q?0F9d8HIJasRScO9W/9RBZgFraWslqk4epPhu2YqzuCZivaiyEH6DEnKLoKY/?=
 =?us-ascii?Q?37TZrfhpOanqXqWIz7xt7iUmNKVdn5mmfPMd2PuxEVkkIBlr0Jbwlh1s1UIi?=
 =?us-ascii?Q?unJ9JDAuyM0oXgNYsiLv9ZIQMeI2v+MN8/uCJUN/m8QD8rQiblYTJRjr7hfg?=
 =?us-ascii?Q?/0gkxN718EyjjgGpRJZyJ/kIcztPIMbOviAvr3kBhK9h0vnvWyvTDgQeR/DE?=
 =?us-ascii?Q?X4zVmceBC3dZvXMlYMyFY6uqERFrysqTryxH+XCA1bewHuJ4umcQ5QC4In1Y?=
 =?us-ascii?Q?RpkPGa79qBl2+u5ezXRZQOMYbq+Fj+ptMb7FocDaLL6ywTdwdIDvHQ+DGCl2?=
 =?us-ascii?Q?DBbsQE+Ng7MseithTHsg9ycXvxiaHCZ2hg9Bqfg8vouz0k8cpKi7OohmNXmf?=
 =?us-ascii?Q?7nKQCHZ3EfVRUSzKh9gyLhMitqm74eCLfV5mMpX/bwRAVt9wrgwnUlXfOqFt?=
 =?us-ascii?Q?MsHZzxV12P3geGV6wngpUTejA7BKMLN4r28VqQ/XJ5Z8zfWSj2HSvTXfgtkR?=
 =?us-ascii?Q?DZV5xGaeOJUABPzPvtdKYQIjoeG0574CTyKI/ePwYPvvZWsxdRjiufy3gaIi?=
 =?us-ascii?Q?uyRF1sIpiLKU3uva1OQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c25939c-d2d2-4a51-265a-08dcdc0505a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 19:22:10.7139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TI73ckbAKUQqRKEqujk9qyacOEx27hXVFUWrcQ5ui8pSWt12WpZ97q/g/JeU96kL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 19:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112464

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Jan Vermaete
> Sent: den 15 september 2024 19:53
> To: openembedded-devel@lists.openembedded.org
> Cc: Jan Vermaete <jan.vermaete@gmail.com>
> Subject: [oe] [PATCH 0/1] RFC: some issues with go?
>=20
> Could someone review this patch that enables the Go-based plugins of
> Netdata?
>=20
> I tested it in QEMU with the Go example package enable locally.

[cut]

> Workaround for network access
> -----------------------------
>=20
> I there a way to avoid the 'do_compile[network] =3D "1"'.  It seems to be
> needed to fetch the Go packages specified in the go.mod file.

A fetcher for Go modules was just added to bitbake and will be=20
present in Styhead. Unfortunately the necessary changes to=20
go-mod.bbclass to make it usable did not make it in time and are=20
only available on master. :(

I intend to send patches to update the Go recipes in meta-oe to=20
use the new fetcher, but unfortunately I am a bit backlogged=20
after having attended OSS + LPC + Yocto Dev Day in Vienna last=20
week.

//Peter


