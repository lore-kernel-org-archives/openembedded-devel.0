Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B944E83070
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:05:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13269.1770113104084806663
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=b6Y0oQPV;
 spf=pass (domain: axis.com, ip: 40.107.130.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egrzs9jJbCnLFQShXqTzR658X2hynN7zAEwSQh0zFjSc8It83/uU4wVoyTkHZ0solVBz1TQq8hNJ+WgZkD+GTlgLyVAiOeQPCYLfGhmr0slaXX9g1nGa0UFB7cB3C5QYLQLJDUH6LX9DsmG7cwXBHDdjm+sYu1j3Mq5Xwqoc1FqDsyepXVf50PQ/pvIg2xjpX8pHdfrmThf2ENWlH2CaRi9bEnIF24FONvVsHJ/rjOagpkkbdfx9AyLwD97zoKL2QJZHbrOKLEB+VbQ+lj2Pns1lkr989/jMRpkmbe9nI47LMHOocIiod/I+bFDf3tXKLU77kZXQ1L4A8AtA60EWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+He4sqsiVOF1xXjc/cCYL3GfIz74kCgWRAcYm5ifWs=;
 b=KBy8ZneJoETbCG+eYCO8hncFbaVHzEpO7pLdT3P/W4xk8w4q+e6WePDY8knMq5dbH7bdXxC7wnjA/KIzemFTtZaF0jHpBJSDCR1WC/1B4QLM7CGfg0/GjrxbqZqjEYFFmk0iMh8UvmAlVjoa7DaHdDFCnxvTvH0Z5573/rX6vbODIUvBzdWJjW4pk08BhcSB/x+EzMlEk+V82DhhCRjKMpTXhFx02fcy1KSVA4gXjN9FT61dRpK9O+I0HhaS0/cp/evpN93gOfHOH/fuhCJziPjJsoIf3D3hKSk7hFStKQk+zClSkUruCbEdi3G/wKl3FcghZ2Kpp+RDWKWicdTa2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+He4sqsiVOF1xXjc/cCYL3GfIz74kCgWRAcYm5ifWs=;
 b=b6Y0oQPVPAXbWKT2YhPrQS4BFmvQx8DyLHbHpwsmEBZa3bH739vm+RZUOIYVhqu0FLtYmmtodSEPQyxiCuVerQ11iUM6WpL3ZI8r4DEwjn6AHB0/0ZBydNz2RJYYZLybb6HCW6kmKd9pwl9AOOORCXLa66LqV54mQhm7ghA1Eu8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10687.eurprd02.prod.outlook.com (2603:10a6:102:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:05:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:05:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "yogesh.tyagi@intel.com" <yogesh.tyagi@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Thread-Topic: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Thread-Index: AQHclHh0kRDrOvA/UES4XqUkTnb3p7VwvkWg
Date: Tue, 3 Feb 2026 10:05:00 +0000
Message-ID: 
 <DB5PR02MB10213CED496F4CF48E7ADF21DEF9BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260202192055.1588477-1-yogesh.tyagi@intel.com>
In-Reply-To: <20260202192055.1588477-1-yogesh.tyagi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10687:EE_
x-ms-office365-filtering-correlation-id: b679c742-bb53-4d77-cc5a-08de630bb152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?i+crWGwm68oT8lSTCljQd1hm59WRN7+yDxDubJ7pCKd9NtHdGnI+KSj4nGG8?=
 =?us-ascii?Q?3zOYMFVHeMT0+C3bMK+65+bX/7Eaj1DMcfRjMuZyTUUVie5GcKdr/hBI+DFr?=
 =?us-ascii?Q?FuA5G1DUVeXNi2BSsPQVPow09Zg6EFzcLBASpZrUNqg0PvC1GPKg1EnSYKzB?=
 =?us-ascii?Q?EE+UdZU4VHQJoz++zEAmVtaohVdCE7pjzD5OCeH6/EDJ7wUEuz6ZDWIcKEDO?=
 =?us-ascii?Q?xdT2xG6orNtkwd3qOM+2gdSIct+Drmdai7nuIB6nOqcVXaoqNdwXYvS/O6zw?=
 =?us-ascii?Q?uJrEPjmz1VxMI1yxLt2W3yu0t2Bq+laq3/fuHZ5JR8z6MBaDt3fcTVtZbT4U?=
 =?us-ascii?Q?1WJaQokf99lVLzEA1ccg8DqfLIu8XnVJ4BVRKTdu6JsLsRHauNcf73OfI0Bk?=
 =?us-ascii?Q?g4aKHAPf0IpAbw5BorBHrjUiKf0Oz2vsi1k9CRQ/xELRiTmYRTGBNz5DWiIi?=
 =?us-ascii?Q?PcNnIeLkTEmbP6I3q/44l31A0BeJwsRDNKzLMoGq4vmgADozgyVoUEEqRj7d?=
 =?us-ascii?Q?KG5HMEQOYEaYgMN1fxeuwRjTqYNvBnguwoTJm95BfqXTmOxe0UCWy+MzT5ON?=
 =?us-ascii?Q?CLNPGI+QAxJNfr0KhXU+t8nzDhE7AqtGPJ934iSVusEtlkrXH1c1EhEWg9Sw?=
 =?us-ascii?Q?UJFJEDsgaF6zqOskkW+kRN3x63o05bKkiEOHcfXpIQA8mKBU6esqPuEUxLCf?=
 =?us-ascii?Q?Z2gfoq5S1BNPzby4SjMLyfbRzIAnAPOSGvfLzN17WOQLHjvM7qibDF5F7jBC?=
 =?us-ascii?Q?tTas0rgWBQ+nhoDK5ir50IIpDfU5Ce8EINShYdA/M5X+Y3OihSlIp00ze+xp?=
 =?us-ascii?Q?COGU+K6rqDERWioWwrXIa6VSJOPgopCoSqJrXSNADJ6ivwexZ55Cm1wtrsry?=
 =?us-ascii?Q?lkE4N8GzJQCEYwmYE0pgDGNOBNsV8Y9KzMIo0Ds5vtuzNutDDXTuFJGQzsqI?=
 =?us-ascii?Q?tydrpe6djVzw29ahUcJBFXJFJG1yPlP9fqM9vyQz+jiav7AX7Zr/tuBbY5pg?=
 =?us-ascii?Q?yDXcdXiCiHfF7E4EfDWjZx/RyHQcRs9fC7DUb6NKZtHTayztsq6lbmE5tSjw?=
 =?us-ascii?Q?XBufapbnvoFbMLq2FDmDjMmGdAYutnJli1bOQ6RZRC5wuJyArDh19EP4ZkBU?=
 =?us-ascii?Q?ZlWr3s5lom97C6ZFPV5QWCYSdaoLMu76q2GjGq02GdyGNt4VnvpfrAWfzEDZ?=
 =?us-ascii?Q?vYel+fchuS6oZ7P39ziLewt3kADEmlqjv7ui3nHaBNDnuc2VFvhL+qaTptrW?=
 =?us-ascii?Q?E555UjFoKXOjnsfmN1ILySgD5ZGy/wZfcBXs3xm3DgAXg/nKM/n9kgInq1ZF?=
 =?us-ascii?Q?cNOB2UehtrC/Tm/xu/dtgRhZFWg6VhoAUMs+vpAflou1a5+xeLh2+sC4uPs6?=
 =?us-ascii?Q?cG8Lh6a481RbbjTqS0PwFfCnO1pDHEIdyUCVshIsnXhZI7OaJuDvFlfDUdeY?=
 =?us-ascii?Q?BDXWhDKtQUN+vfs6/iOJmgfOIlMBkNc9YzDvyLIvbLuLM+hR+hN4l4kFVP4Z?=
 =?us-ascii?Q?JOYu8k7lJhCY9O8EyvG22NYVZP5hxa17rNT4Vk+cEqk+s59DeSD+HM2tMC/X?=
 =?us-ascii?Q?tEWf6w+GIBIv8luj0YBA8yM4ytM0Sub4ixqNEQ37cwGNIPRlc+FiBjppmF6o?=
 =?us-ascii?Q?WE9SNgfGZgo6sF0i5zOoCbk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HKveS8t2WnIlSfCIeraP3s0FyPQQexmckkgj+OUnGwvY+NqJ8S3nn7q/oksA?=
 =?us-ascii?Q?dLb7JQPxT4XnUypMA8/hYl9VIatEJMkJUaZ4nHj/Aeu7Xu1vddycfqMd8zcU?=
 =?us-ascii?Q?401WXdosNkcGzduuJcFGl339AFG7IrUrnzTUg/36yurw+A2+cAkybELEQyuo?=
 =?us-ascii?Q?SDqufpDTV/yIplpWm9R8D91AQRRUTECQv/XdTdfm1cgfHLI3ib8WUVPZWIUX?=
 =?us-ascii?Q?Mh89RFDbkhBSC4MWVpfzdjOPzhjb+qCjqAmCnAgJl6K06IcfymqBFYyInV9W?=
 =?us-ascii?Q?Z4z2SC+LnnjEU8GF5QqbaahGgTguQL9y67T7Atnw/R6nUF6E/MDXmBUi3MJk?=
 =?us-ascii?Q?AZnVY5PqsyhlS0+8mv91o5WYKdGzL/L0j1Wx3mu/eZ9aB44dMukSDxKQOOCG?=
 =?us-ascii?Q?AXelOX5u3+GX0WXJgp7t2Z+GYKzoaFDmjFbuNYPp9FSWJ78UPSoHNNlxqmkq?=
 =?us-ascii?Q?Eq8+H2c79MnMq35EJOqG+WqBtCg6YeXEWnOPI8Nwz8PTkPn+zoFbZrRl4EcA?=
 =?us-ascii?Q?on4ZkusCPGAjmCpmmTZPW6q4Dn8nzDs/C/DSmM+1IFWeNd3RsQ3qan9DAT8K?=
 =?us-ascii?Q?dR6fJEllM/fz0WM3dyjJ5nyvXqCRsYCz6Ao0pvZWCWc3YOAn7cKXH97U1QkF?=
 =?us-ascii?Q?ND6EArXuaksr1cr5ZFrr7h4BIaUPWluZC1hFYArpsjavBCQK9otvmZt9Kfgd?=
 =?us-ascii?Q?Flwy3csp3LTLy8T8ZarzypaE778cqCjW1bof04WEHzb2d+9g/YEhlyl/Zhry?=
 =?us-ascii?Q?S5KAsp4WYmyO57Scrzxo2vl/O1lZ9B0yd/6wF6gHrKoyM5Ob1Sl3cxBUCtu7?=
 =?us-ascii?Q?D9RJwFL9pjuLpLqAdzZMglkTDiQ01a+wGhBknWP8tPh1RHXBUBpLNV2EoOcr?=
 =?us-ascii?Q?IrxXiGagSPrT07u8y2+s8lH/pmLvCvSHsZvrfN9xL3QnOGrRaVBm4bKh7lsL?=
 =?us-ascii?Q?4uHl5PzZJfHo0LP/YOL4FtrSUEXvY0BDRmAfUS3p7P9wNMaKnX45Kpj+DOw8?=
 =?us-ascii?Q?Z9ZLqOtqVkTsRTr+Lg5sD+cTQhNzocfzqQxsAmFw5U7h6lK4c5ONaUw+UMBf?=
 =?us-ascii?Q?K6N/UvpHn8zdFB6dR+t71M5o5QgSVEl6dCQV9hWpgvC+06s6zl9gDI2hvgdl?=
 =?us-ascii?Q?cfdtniU2wid2Q6xF2fqGU7LVf7CuLu/viY609ol6e+SPXaPHZHsNb22rc1ZU?=
 =?us-ascii?Q?gO+u2XxrQH06SfYzT90BCeFQanN9xtX+hEC5Vb9biwyFGGQgYohaUc5KuiBl?=
 =?us-ascii?Q?QlTJAJvgUdQSHTyo4oIo41QTHmdipYBYT2+q3BZxUjmtDN9tyOofb5c70HWA?=
 =?us-ascii?Q?x5Sc+Q6K6bJw6L7W9vzisR46IuCGx8rEbtv7r9jS1wshLG9U9r5SUYpAQUFG?=
 =?us-ascii?Q?ugGB7N50ZbHQUnnof5++z2mNaFKnhI0XZAuBZXoVA4c8iq4CrTge1gRGkhh+?=
 =?us-ascii?Q?ZlTOvSju22+2Silo+IA9SPeS1+T6Q929x6v/fTvbtuOq8Gwxc9q6uDedAa95?=
 =?us-ascii?Q?dOv9EQszRDBaaF0yHlnpGKNYGWDnv7MgqxQps16vU8b8hU31KV2sRM/i/EVR?=
 =?us-ascii?Q?f8/yyL+9Q02viKsIqO24FjVuDoOJh8afwSDDMmRZZBNXsq2f/OlyMyBmXyd3?=
 =?us-ascii?Q?HQR5oQxxk9t6dBpmVNN7Mv3QKcGUajpu2xvp39GVB9mWVmFhkam9A6CpOxb/?=
 =?us-ascii?Q?6aRIqNvTUKWJJcDQ03iKl+/HIZ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b679c742-bb53-4d77-cc5a-08de630bb152
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 10:05:00.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLY0xmeCHwXq5AW0e86/Sswt8OipS/rFLNFvG6EbolwYZCKs9GhmXUqW8fIAfWYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10687
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 10:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124099

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Yogesh Tyagi via lists.openembedded.org
> Sent: den 2 februari 2026 20:17
> To: openembedded-devel@lists.openembedded.org
> Cc: yogesh.tyagi@intel.com
> Subject: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
>=20
> The compiler defaults to C++ < 17 which causes build failures.
> Abseil requires C++17 or higher, so explicitly set CMAKE_CXX_STANDARD=3D1=
7
> to ensure the build uses the correct C++ standard.
>=20
> Error:
> CMake Error at CMake/AbseilDll.cmake:745 (message):
>   The compiler defaults to or is configured for C++ < 17.  C++ >=3D 17 is
>   required and Abseil and all libraries that use Abseil must use the same=
 C++
>   language standard
>=20
> Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> ---
>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> index e2bce0be11..d4475ee73a 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> @@ -21,6 +21,7 @@ inherit cmake
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>                   -DBUILD_TESTING=3DOFF    \
>                   -DABSL_ENABLE_INSTALL=3DON \
> +                 -DCMAKE_CXX_STANDARD=3D17 \
>                  "
>  #  riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_store_=
8
>  #  >>> referenced by <recipe-sysroot>/usr/lib/libabsl_flags_internal.so.=
2505.0.0 (disallowed by --no-allow-shlib-undefined)
> --
> 2.34.1

I am not sure this is the correct thing to do. This means that for target,=
=20
you will now downgrade the C++ standard when building abseil. However, as=20
it says, all libraries that use abseil must use the same C++ standard. This=
=20
will thus no longer be the case, unless all users of abseil are also=20
modified to use C++17.

I believe the error you are seeing comes from building abseil-native, i.e.,=
=20
the native compiler you use uses an older C++ standard by default. But also=
=20
in this case, just changing it for abseil is probably not the right thing t=
o=20
do.

The correct solution, I believe, is to use a newer native compiler. This ma=
y=20
mean that you will have to use a buildtools tarball unless you can upgrade=
=20
your host system.

//Peter


