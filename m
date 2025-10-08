Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E6FCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:45:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.web11.2298.1759956357008203210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=iqJ8UMhV;
 spf=pass (domain: axis.com, ip: 52.101.70.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM/IMUuAoltk2e+uIiFiVdH/tZttEs69pgUXDY3gOTE2MdEz+jCjh+dqAw6siYg0SIhgL3f0PKzgNQ4wVE0LMV5L4f0QLkbEYdYiQwxzGISw9A6HgpJhIb6PBQC6kz5LeUS5V5QEBOuNm1vUeO8uLpS139pDU/vEYBGqcYfVZzIV9jTZNAvbnvlUfLAFS9oUJzcWpjSS9kbhkeeWUoHmAia3t+crCoyDijCny4JHpgSpg7aS8OkMGGg6JCeWJMz7cIrKcBCNce9VnP73gdiUsReDn5+ilxC2jZmiqGl+1GXIvYI8FJZNuiMJUamcVXMd6GHHNmIj8S3iyDL94KHIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UV9srNiXvh4g1fGR2MJlrRgpia6ZjzT0W4izaxB0HFg=;
 b=jzHl1xjTD/H7H7mH+HS6sArVgpushjsGklFkiecFNyD4WpaoT1wc7KYKbNqn6e7GIAAuBf5UFo4hEf2KMwrA806oi+5ddFr8he9z/1jWgQdz1Orhvpo0r2LHO3bxh0jNZjHf6KlIOgR8A17D1nEhzf9aKPqkBSVLD9mNrlhTCI1R5QLiwDUDf3VH1QL79D6N+zh+7Orvy143o9TUR9I9+PW5MtjVmRm8if6/TWkk+v55CRXz4DLoNyKNo7JCf8C+39UTkM0YwYwEflee6xZ1CWzNlALFLh0OdLoVyUWaT3fA6hb8hK7p9J/otUWnY3erT7vIuHOVepTpnzpcnmaNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV9srNiXvh4g1fGR2MJlrRgpia6ZjzT0W4izaxB0HFg=;
 b=iqJ8UMhVP0WO8Oj4I/JJB2cqYDx/LBWJysPFXYfpoydM3gFPg9YYDbRlJnLemky2pst2REXl+N8EMS1vYS0c2bi0OIFdDnUTAr+V0f0O+ZlvDPBszBSyNSDSR9Q2hnDYRxLJhcHnVLrsk4G6qnYjW31Gvx6JKRcBw9zPuYStI7o=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB10730.eurprd02.prod.outlook.com (2603:10a6:800:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 20:45:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 20:45:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Sana.Kazi@bmwtechworks.in" <Sana.Kazi@bmwtechworks.in>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][master][PATCH] cryptsetup: Update the license
 field
Thread-Topic: [oe] [meta-oe][master][PATCH] cryptsetup: Update the license
 field
Thread-Index: AQHcN2vGnGOCIy9qxEuQTwdvyt4pA7S4rEWw
Date: Wed, 8 Oct 2025 20:45:49 +0000
Message-ID: 
 <DB5PR02MB102139054D3AA841EA36F2221EFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251007092107.18392-1-Sana.Kazi@bmwtechworks.in>
In-Reply-To: <20251007092107.18392-1-Sana.Kazi@bmwtechworks.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB10730:EE_
x-ms-office365-filtering-correlation-id: db5694d6-8a48-423f-3023-08de06aba9da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?k5xCS0S/gaZq7YEZoOyWsylDvVPuv1kTqPwabds2qxPJ3yeVdj/ysHrpVvQo?=
 =?us-ascii?Q?2h//+VqEsAqbEQbNtVzS++WZ5y0qkv3/rGev7dn3JahZ7ctg188YzOqf2VaE?=
 =?us-ascii?Q?zv1yIvJBt6fyr9axOMu3QIzgsSo1x0F3rrF++lCBwW0jvLKJ88iazMKpwz9B?=
 =?us-ascii?Q?b07fdir6RTofHfRDZhO2UncFRqJteckNNtnFQm1ynNd/XHbIMPPedo8kFHQ7?=
 =?us-ascii?Q?7WhcfLzTyGfxdoOU2gQ0I6QY8jfxU3YrrwKwy2lF1HyoWtxqn969fkBRJh5l?=
 =?us-ascii?Q?HOTCrmleMCq0k7enEdpi/qibWtSqa+Fm865/dCTAMo1P1WOAa7/de5FcyN8a?=
 =?us-ascii?Q?k1t5laJRHaFSQiotqd6I8W5bBzsKKsKRJAKy9ug+vTYR6WS9hMrLpKbokxbJ?=
 =?us-ascii?Q?AOkN6DRmOfyJ+9D28m4a/N00h9eaMAqDME/rNHM1767UwAFDvvcT6rVA1fVM?=
 =?us-ascii?Q?3k8NZI62j4zgcJaTfQS1WlKUnJpcPwd4T1PyeDPnrSUq12ydx9Mvwy2ddBsw?=
 =?us-ascii?Q?UxxkBjvIkMJZP7h4TrxJ5QZk+kGYQsh2gpsxqfR9663kRNjvXdzDO/x20B5Y?=
 =?us-ascii?Q?4LOFb5L5zfOAfGWpq6ghmpLYm6Fon3WFtGiJMp3F+g/vJ5I9jG2umkxSQSi+?=
 =?us-ascii?Q?nGg8G4L0omu1pBhJnqppt7pqihJUCx8/tYgQBRfFpAFgY5hE+FcKmHtqmTCh?=
 =?us-ascii?Q?KjlAxsnD9lg3NjXCyOrM7ti98AmTW/0qMg/BgOkg809fPWMGaiT2PW9y1fls?=
 =?us-ascii?Q?5hLYNO2DDcQDKFC65ABZpR/ElEOmIFk39sRHTobAZqXTBK8rWgPj8iPbGZcu?=
 =?us-ascii?Q?KtBFHkpFhdhpL7reLwUAoSGYbMytKxpb8MTvMmuz7eCQKRaA2EMe8UWYZNA+?=
 =?us-ascii?Q?iZyWfxhch3Qk4eMq+IdUiHWpALzxAuMqtoCPxF3mW4R56mj/2QJw8g7T8sSa?=
 =?us-ascii?Q?xBWKDVQWo1EWh7/ApTN8ZB7qOa+wRwrWl7IPfRyEgpxyL0gbprMoMB5ZMJvg?=
 =?us-ascii?Q?62saJaEnDjSWq2D59R6JqKgHDTUrn2sERp1PSv08oHZSDf54SIRGgJ01cJQS?=
 =?us-ascii?Q?MGfRrey5QodZNp5E97qFZZR18NnSROLXIjY2YX/Z2Xf1k5sqoCSLpR6AAGGD?=
 =?us-ascii?Q?fZLqie5WVKBrUHuVBLYpszOUR5WIF+Bez8SMUXQiMingexVpnt8dEhBRK14l?=
 =?us-ascii?Q?L1XunveHW1XNRNiUMt0HJdeYoZ4nLodxWiv6+04GgbdFsOp121wTs8UiJQCn?=
 =?us-ascii?Q?ueJ9n07p8oEBcqqxNJSaOUSGlF+OQUA5HbwIpwGs3jbiAs6CQlTVtK4pLphF?=
 =?us-ascii?Q?IpuFvpy+9VPCt1iCovAUl09IoouAFv/lOg46jsKZ80vrLSFPxrkkESGrZvRi?=
 =?us-ascii?Q?3QDmsi16keUyP+8jeM1C5oi+fvPuJ2qN8cqYRSZA6XCJFOfDa+ao5cyXrCEO?=
 =?us-ascii?Q?1dyF23TrrCTKlO7omzhYk+fHUfxEokwTKTf6RJvIhjNn1SH0WnpNMQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rzhQNO3K7tB7Mj17WCNi1nRUI+RoTlTil/RBjTFWrzgybXVcSm5JjlkL+mdH?=
 =?us-ascii?Q?qOC7k9QqaIcMmmlQYvnw49M7mHeJ/tszrHWvX0Zap88GSd3ss7H6kB6Yl3ai?=
 =?us-ascii?Q?0Os5z/xfieZAH14tTW7pIVR6d7xO2oK3etslRZ5uS6yhBseHblnq196Miy3x?=
 =?us-ascii?Q?s8XGFwPTJHZLw1bIYQObIUtI6340Dct9KpuC2J5c8Zh7xStFRIy3XgrYXp43?=
 =?us-ascii?Q?3N+F/0w5TgxXElb52CrZTtWUcuA7kQo1WiNJllJsUf4qZm7KqHlbXmRDw9rN?=
 =?us-ascii?Q?TK2wbyAMty200vOR0MrzRA0piW+Eclrt9S7ws0xQ7IkQ/8RE8Cy8hwZ89uQs?=
 =?us-ascii?Q?0SzuipepXPqm4Mu9EVyrf//AHMhs1+/sTCflhsn/4w3vczhHou5KIhVd8PxK?=
 =?us-ascii?Q?ZR21BysSlkJfIW+0/Y4dhsHpkoNQYBtEXMsaaHtFXGqhVn9b2nRcxzmqfVEH?=
 =?us-ascii?Q?xF6Td6LqLCnbk9yLuSdSOKHDahmicLn7jlTDtdmGRxNYc3hjlO9PqWL6MQow?=
 =?us-ascii?Q?+ZKGwOMhHZo+Vo9nRFInGisfbsGtKOr+7EgJDdGoNU7mh4t4yslEhIztbo8q?=
 =?us-ascii?Q?sZNqLCAoRBhd4wiXeV7Rl1LdJEfMUjtYJQ7qw1Ylg8sr04MfW/MxvxSLHvb6?=
 =?us-ascii?Q?whUAgyUtjgbUh59cFuvIP7Ge+pxKR3MI43HOakoJpLJG0M7eR5dT++A7tkoD?=
 =?us-ascii?Q?GnUgf3N4L/lTyL6AnX7+PNEM3kUYvcXKhMt4v2TDLObsvFJ9KC3WvUqa194q?=
 =?us-ascii?Q?pntM9YeL/yVAr07VNUIZpBXZF21uP7NccsJ3XdqXQxBLBPbFSyzYK3BCk0VK?=
 =?us-ascii?Q?QP2VzEF2upIPfx0oACMHGPYPBLa6y7z568kADK2ptDdeJhHdKAM3T9z4oV9F?=
 =?us-ascii?Q?yl9J/uLVqEZGdguIwlwda39chkkwtvMyNxfrViKN68H/exNOdExDUBWThqBz?=
 =?us-ascii?Q?FhGcmwu1DL9KGhbDWSMaU/6kr6bzS7+j0+2ug3Yt8i7NLugvduTa8CvDOfm5?=
 =?us-ascii?Q?LRmPZuOHjn4vkQJET6tB/MjJTZ+VssSL75CAB20OAi5SEsQTGTpAmP+oOcRG?=
 =?us-ascii?Q?HIeKCkfmV4Oa7Pyr8LGguqC2xSn6qOfFiOKL7g3g8hmPBfLxYbHT3uLvASST?=
 =?us-ascii?Q?iNPZDpkOvcskxYxcpfhl9oa6733SXT9aC6VGAvjI+MfHbynVBNKVqVY+7S04?=
 =?us-ascii?Q?r8UV+F511IoW2afCGnOU6tejRuD20VK8Yhn5v55J5rksHQvq4q4pdF8F4ody?=
 =?us-ascii?Q?87ij7Kn2LXiQKMgsUVQrYToxi4h+PZZn+G9BQB1nJHR8sWBPTFrOvPFzmb+K?=
 =?us-ascii?Q?WiyOsCxxchH6G0DO30v4cwdVx8xYC/5pJB3KeV71j3LAsdPi5ov05RjbtmMc?=
 =?us-ascii?Q?azeC9SJBBY0kB2WvwRpILsvx+LiLWHd0eew6MMTlMoiZxkmubzLmqAKGhksr?=
 =?us-ascii?Q?+jiCizA/Tz4OsKPP3vdeJn3CKQsq6GV4vP9vuW/qd7agcu4H8Vgs8rzAtOau?=
 =?us-ascii?Q?98ImI+ZRXnbq97//F2RskwD4Y4QZtOEunC0DwoaLXvPOSH4bHCL2zGlB1A?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5694d6-8a48-423f-3023-08de06aba9da
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 20:45:49.1980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhcabTfqFcuZF82bWM9cVEuKe01HpnfnQ7C3FtLrZOppzU2Fo+91S2Adu+XAMkK7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10730
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120383



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Sana Kazi via lists.openembedded.org
> Sent: den 7 oktober 2025 11:21
> To: openembedded-devel@lists.openembedded.org; sana.kazi@bmwtechworks.in
> Subject: [oe] [meta-oe][master][PATCH] cryptsetup: Update the license fie=
ld
>=20
> The below reference clearly states that GPL-2.0-with-OpenSSL-exception
> is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
>
> Therefore, update the correct license.
>=20
> Reference:
> https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14=
a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7
>=20
> Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> index b5be30cbb2..c297de053d 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> @@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On
> the other \
>  hand, the header is visible and vulnerable to damage."
>  HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
>  SECTION =3D "console"
> -LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL=
-exception"

There is also Apache-2.0 code in there:

LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-ex=
ception & Apache-2.0"

>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312=
326"

You should also include README.licensing and the actual license texts from=
=20
doc/licenses:

LIC_FILES_CHKSUM =3D " \
    file://README.licensing;md5=3D... \
    file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312326 \
    file://docs/licenses/COPYING.Apache-2.0;md5=3D... \
    file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-e=
xception;md5=3D... \
    file://docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-=
exception;md5=3D... \
"

>=20
>  DEPENDS =3D " \
> --
> 2.34.1

//Peter


