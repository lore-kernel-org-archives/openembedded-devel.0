Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280DDEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 18:24:23 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.26160.1686853460700124748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 11:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=PVrJ0cCJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686853460;
  x=1718389460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6vBbdF0JHyyujjBE8zl6Igbr2RAMco0eSvlZVByvjN0=;
  b=PVrJ0cCJ47fW4VqlB+W8MloVAhAljtPteiafOQtJKOoq/u0nQ4Umca/m
   5+jZCSe5PwloH+HjnDPFjEQQsjI2aagzQYzMF3dQHKPSPQYlG3sbNet4d
   MRoogUJef/BTPqlwupd/g0+3e6TGxQUpp3hTT5Jm+t9IQ+XMcx9ZPitoi
   SuaDHM7PzOiOIXn8oNF3oAvK2b4Hxz6h3rYED8kntRErBv5b3+EjCy/J3
   X3BU9/O5QrQTsd1vQTKcf0DuNEILYnp6N7jnUewxIIIFPnuGoGxsjz3n6
   Px4jkiTMp0LHii6Pn/aTje+Qs2GYfvUGWOYUqw6/V/xE/IxNSURAZ3xyq
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7ftFP6lDueOoovG4+VV9adlbBoRnlmhgVD8G+GjXNqBIVcL0hLxP1xwVTLVrHcCV6pUxRwq23XEzcc4wq+rw59dbRv9ybN7/zrDjE0pLVBxAfYLw2qwhezT+Zeb4qN2rNDu5Y0u568YLTvMR7gYU4D1sqpLN2Irm2d6SGgfE71tUSuaFSqEPFjbPDIX55ldOZJ/iiFiskraK1ZCa23bZCmN7cTityGWvv5wzs82qZ7EwtEKs3fzBh8qB2tMiciwZ9Suz1vA42qSIqNEOupNldoPOxUyRt+0sipnFpS+T64TG5A+ZzRokbLphcuZOvCb4iCCQflFJKW1PLNrIaSjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vBbdF0JHyyujjBE8zl6Igbr2RAMco0eSvlZVByvjN0=;
 b=Zvi3BJ1G4jROPUtGRPyRTqfZx40EwZGk/sY36l65DRgm7yGxSiOm6k2EI/Qk5O9OgZBaIoMsFrin6trLH0KxIWa2QoWJ9YCmezUYE9fUyqUJcDvtqRFxpdflc6+svJacKs/V6u221pRKjQ3FMp4vYHp8Qme5sLc3ec1G85WHHW4kykWkVY/InG6Ln9PljN8hMa9hwY95L0HK5WBxvESLRRZ3VvENDwi3PErODcRU1O1qfEbSGVNTGyWXtvIz9qz4C4wWA6900U91UiRbqn0m5HmAvkEWFUhkHkAgOgU7WYU5Xo5E16EX3NcCmU4bFGIRfe588/ZshQkj1rdLrhgpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vBbdF0JHyyujjBE8zl6Igbr2RAMco0eSvlZVByvjN0=;
 b=Nu6rpH9b/fHS0O9lTV6oi32RKSNm7Nb1o85WpYmjV1o9qgiiZbCX4nGNNMUudHrrnlwm3o5jbURDLFTOXY4fx5Bu0w2S6c6zSdz3OP/6ZmOPVLKM6w6s+mRL7S3XokKR/EcbuZP1FT2DdZi9T5S2x/CAb7jLYT8YBBNBce7JKe4=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Remi Peuvergne <rpeuvergne@free.fr>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Remi Peuvergne <remi.peuvergne@non.se.com>
Subject: RE: [oe] [meta-oe][PATCH] zeromq: consider license exception over
 LGPL-3.0
Thread-Topic: [oe] [meta-oe][PATCH] zeromq: consider license exception over
 LGPL-3.0
Thread-Index: AQHZnrILkyQsRN+3jUqI6EL7DttXJq+MLkwA
Date: Thu, 15 Jun 2023 18:24:14 +0000
Message-ID: <DB5PR02MB10213A8BFE56387E149E976C5EF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230614073736.1648256-1-remi.peuvergne@non.se.com>
In-Reply-To: <20230614073736.1648256-1-remi.peuvergne@non.se.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB6751:EE_
x-ms-office365-filtering-correlation-id: c750040a-f14f-477f-0897-08db6dcdb92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XrE7HqT8ZABMuLc1FyblD9uGv7hKuBZWl6vm9kpM4OpuRYva1Peg0sWiTY1ggCK4cODp4iuMXuLVtelu7Ceg4wVuN9ocjEbIIj/VXRTD4BgLyc33Et3DNhkDFc1xDnqPt+epSC8IjkwjmYtHxuAlaMh4B90YAmSeAOuLkE46sPddlxkZj9qqqxQwKBmq4aq+tO4Q1ocf87Hp7BUoHLH0vj6RmunxdstriIDaJjC8ACK3Yl2aV+V32BY4wM/ajfL02gxH1eJVRPvBB0qAs/hynbtONvcpaSHVN/ynA7/tUEip2ICad9P7078sZq+J/el6LiDIX4+GOzb/vtP/PZu/ChsayqoaoHCwA3DGJ4Fy9MH2rK4OrgHyl1a9Viu41Av/KjsOvgQjI5ppWYRLIPYZ05UExgShC5aHshHbOcgr03lJxYe1c3pIjl+377v8KT4h3Qi38YbKIi7uJtl3RIkdPDsxIar3XoPdVHmAQdB4CS9LwJ3wqM2uD/rovHfXumy5UWY/d7P/EKSVljsphTKEIriIIg+qsYXqXXcGXHeXEbZwfILoHPxs8E7MxzcKbqYHpsEovGgQfYCCjUsjqJLNmC2NAErqxENjBlN0NnPXN/a6k6X1Z5eKppWSI4uAQw4+5o5js6CUAiVjKd/7FK91UQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(110136005)(26005)(9686003)(53546011)(6506007)(122000001)(38100700002)(38070700005)(316002)(41300700001)(66476007)(4326008)(66556008)(64756008)(66446008)(66946007)(55016003)(76116006)(33656002)(186003)(71200400001)(7696005)(8936002)(86362001)(5660300002)(8676002)(2906002)(44832011)(52536014)(83380400001)(478600001)(41080700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zRdHTjZiVh6WVCR7L41Tl8P1ZGQpSPTPOfniSERyDEqB7ioFy3PQGa4kbTNr?=
 =?us-ascii?Q?ogHrGgnorbY5UYahHvnfVPdN4JVKfjZIicLTdJ6UiBcNI+w3wj5Hd1E3l2YK?=
 =?us-ascii?Q?wWBMheFwbhZLnp4l+e/kAR2g/4uEDYD/p+HZln5gBNEnvey14ItO0l3DUZu7?=
 =?us-ascii?Q?fHQplIOULd5lF3YWOwJx9tv/YIv2x0YRyAEwtIcQOmsPJxdhXal4+2K0OCRb?=
 =?us-ascii?Q?9A+ZpaT+UIotw++YcsmIcf7x/pwI8z2v9cr60iaMsG0g4vwdaASgKnzVJUoa?=
 =?us-ascii?Q?lPkHDYQbOlMV/ZcZaH63c/lNiUwd5uxVEszTpaSeiIYuhZMgqzqEfCHKAJu9?=
 =?us-ascii?Q?CXX7kHPAIVNptypQYMG1cb/ccaBjtLidi2HhJDnk9sV/GJXr541EtHHQTUJR?=
 =?us-ascii?Q?M86F05dG2CER+IATgKnK/4iv4auHLFSyASnydbBok2MGQkVYy4KWidNm0xKv?=
 =?us-ascii?Q?5JXh1C1uRGMgsR48vIOgvjlP0cd5lAf5RGh46VWFgaggiquumn7FR8uS/U2u?=
 =?us-ascii?Q?DAVH+DnNeqs5hRNrmXghR4J6vsIEMS0kjhIiFYrsMRaOosHS4wDArrmwvg1N?=
 =?us-ascii?Q?55XxAcNBkXz9vHGLrV1cR7CRyzNka4QDFdtbNKwJ44irfzcW0691G16fEhnB?=
 =?us-ascii?Q?u8hkSJ8m4Y8cJ2jbiBaHHdPlS8MfSXykApN8E8difNK61szPt879Kl+oNUyq?=
 =?us-ascii?Q?MtnrkmzLkBQBx2WRf8X9igNcxiWfUVPRkjlPLp/WK//fQuZs+v20VoXmacn9?=
 =?us-ascii?Q?jN0uXHx7h7ZSHy6wV9t7LWPjgnxbm1e3ZwQHruhVKWfVgkqikZGM7Xi0u0jW?=
 =?us-ascii?Q?ssKYYncATkFovsZP+RZZ0i17Ee6S47ur7KQj6PRdYPDByNyyG24YAkgRQwLX?=
 =?us-ascii?Q?GXHnpuVqpxNXgQ+eHLLjzQUTaHEVNJQEnSrtkqn3f0aDnOwIuSSxYJxQM7Qr?=
 =?us-ascii?Q?7PrUf5Jv4QGGUIV1Cbl3nzLav+eEAsVAl018fm1nqusCV2YLwvQ1qCb4FMg5?=
 =?us-ascii?Q?RyzxsjtcLC+X3i4HHWjU1KuC3KuV1yBRN4AZdF7qKKJaTXf7seMibQKuvUAD?=
 =?us-ascii?Q?xb8FFXwbbUDUBXbukVMAxMhmcmV+9c1rB3czV6o0Bu27EmLMiAkXLW8XAm1C?=
 =?us-ascii?Q?/wgwoIjEHGhgzTUj7TjiKa3oH2zpiNILNboFg9ISmaTC9/oHMOdU1DCaRSHO?=
 =?us-ascii?Q?reukcpKYjd1pT7wCyMqv0vLddvD1SxsoRHA/BH1pefbWdomS6YXwKSBnkQ1+?=
 =?us-ascii?Q?qE5z+qQTIfE/7goPrWu4K5w/XrmQpSk3+UOhA6jabJt7iBTqKgVPDT7RK4g7?=
 =?us-ascii?Q?tmR1VRVzgU9MKKYp2AaA0DHV7PrXmghSHLFCf7V08gAJZ3GjU1tHAkwe3a25?=
 =?us-ascii?Q?17CRS5/5bAk0dYhJKWu7HSl12u1SPNhPf1YbNy6b7cDEujIyPpTYHZn0zlr9?=
 =?us-ascii?Q?s3FmBF0Wu82c30Inbh5SKF8jtOj3bwGq9008U9LsmsEQDU1B9ZGXlyeImxmc?=
 =?us-ascii?Q?muRTDu9mNKSE8qIovjwa7DKPj21kLut5XnGy0FOu2WaucftPwQBV6D1aRH94?=
 =?us-ascii?Q?f5HpftMQ8DspmJ35XTQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c750040a-f14f-477f-0897-08db6dcdb92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 18:24:14.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WLzKlaafbkhPFbnC/JbKsQxZezkic+OgJYP8IkRKU4PB0d4bYNbP3aF3xJcqvfk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6751
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 18:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103320

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Remi Peuvergne
> Sent: den 14 juni 2023 09:38
> To: openembedded-devel@lists.openembedded.org
> Cc: Remi Peuvergne <remi.peuvergne@non.se.com>
> Subject: [oe] [meta-oe][PATCH] zeromq: consider license exception over LG=
PL-3.0
>=20
> Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb b/meta-o=
e/recipes-connectivity/zeromq/zeromq_4.3.4.bb
> index bf25d56ee..1ed486df5 100644
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "ZeroMQ looks like an embeddable networking library but =
acts like a concurrency framework"
>  HOMEPAGE =3D "http://www.zeromq.org"
> -LICENSE =3D "LGPL-3.0-or-later"
> +LICENSE =3D "LGPL-3.0-with-zeromq-exception | LGPLv3+"

"LGPLv3+" isn't a valid license in recipes anymore. Please change it=20
back to "LGPL-3.0-or-later" (or remove it; I do not really see the=20
point of including it when "LGPL-3.0-with-zeromq-exception" should be=20
a more permissive license that does not add any extra requirements).

>  LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3Dd5311495d952062e0e4fbb=
a39cbf3de1"
>=20
>  PACKAGECONFIG ??=3D "libsodium"
> --
> 2.25.1

//Peter


