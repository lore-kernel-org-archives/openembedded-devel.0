Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15289FC590C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 08:18:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65859.1772093906939654566
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 00:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yaNXlg5f;
 spf=pass (domain: siemens.com, ip: 40.107.159.9, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSktaPBs/hVrUIDBnH2OYGY3WJ+w7UWvclxlvA340KqHsda9h+0j8QJxD2i47W+CFwK/6fatZDpewQFPQDVTovcaMVSzjULPN82kSQq6SxkWfWLX53pTujjb4pqIPig91lYHuYNwYN6i1z65f7/oZVXPqk70M3o/P3rfqxmSEVxSdPi9HjHU7WxfEeuHCguTU8c8KwPcf+iSeN4EbDNl8/P5pIFx3NDGWuvSwU8HMWiKCHcCMzAJZK7mP85awODf9VgpKF2ZQYttXJnkF99ivy5fJ4WUZwvDIvYKV9n+XcsiMqIiRUgfJ+udPPRkaU7c62r94vVAqJsgKYrN/t6yTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGa8L4ZMCpp5g1opSUabYmjHH9P7/mekxD0KkpG3Po8=;
 b=tK5yInIRMRbDjT2g1UjCC73L4vQx6PBzLLniwbuPyXs6um7L2FBIbyYuUBdh+ng5VsRI5rkmv5DiWhtTYC3IDULMccPxxvb1FogWOA1uWghxZtaTtihbAAh6FItw0RG7uhoi2W/bRrG2Dw4+fE7i1MwyRgJ7DYRrTyeRNj+uyiNsWjXx/GD1gl7+0prkxjX/FkTsO8YAykpPNg5InmNdFUGCwCj/+raBbnwu0urIvmYrp5oW7PHaedqUddS4fhJkPAnmaXVQKmyrk+Z591qGsrHFEnMofCA9+lhPvnbaqmf0x65EYMATMtIuetAbA9/xBYQtgaI+41hIoYpfZr56qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGa8L4ZMCpp5g1opSUabYmjHH9P7/mekxD0KkpG3Po8=;
 b=yaNXlg5fzx2dZKfDPVOTUes8gPSdZXXaE2M6W4LXXJZjOV9Q+lN9aMXynEpYd4d9kwt3W3n2EZcnvHnQptnbpPoOhyqPBcpRu7RjiXDAKhBFV/uIrb7Xij4fBP1TE+vryZ7lAu2mrOxAl4kz8uwu+IzvvxKQrXJL1cXujQ7+1PbMwZtXgRj60XpSWK+cNz/US4ocMyYSB7i0eYOQVqXTLV0Z9tFDTnM7qnn9A7AvJPTGm9tqX5GPs2QMcuv2uE68e+zilC5DkvlAdgZm6fwavefb5magXsLU/gMxLWd8Wvl4i/a1QJIY1JxyWPQKYYAEphB7rA9C6pcvr0u5FfS1NQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 08:18:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 08:18:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-oe][PATCH] bit7z: upgrade 4.0.9 -> 4.0.11
Thread-Topic: [oe][meta-oe][PATCH] bit7z: upgrade 4.0.9 -> 4.0.11
Thread-Index: AQHcpvW+2jrP7LxQqkGBHFtm4G1w0bWUogUg
Date: Thu, 26 Feb 2026 08:18:19 +0000
Message-ID: 
 <AS1PR10MB5697A023DCE95A3A159FD214FD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260226075831.2968-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260226075831.2968-1-liuyd.fnst@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2c11d37c-2f44-4314-b864-8169b204b37b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-26T08:14:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7235:EE_
x-ms-office365-filtering-correlation-id: 46c211fc-fb2c-42f0-420a-08de750f99a7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700021|7142099003;
x-microsoft-antispam-message-info: 
 EIKxrF21IZQ7BesctXUcHAJI/+RSSC02bg2xQS/plvdr45rS1G5n76oo+ncZASpLxh2AziiLujv+Nzo8OXwTfwcY9R10uL494FFn+JkXF807pfDeOM7pZfDYPPyWb5w8mLehR1CwjSJju5WPZEr9lmeWVcTVLI88wFc2/tNvkwsHkhmhsUcYdWVbd+YY6vg+6xTdiFOzWCjQ/Iyi77evU4Z0s93B295npEeZ+kUofMHFG/80V1RGAoJnM/fsrYtVztEL/4Q7gcns7wR/4AtcG8Ct1sVMmS/8mXEH+pJn1z7BfGad4h3hinqNYy3WanaSiFMtXAHgMVsICfvRCa9Ba71NE6z5w8p45NtRkru2jOvnw8JWyYVLjQ3PEwfZo/xr4G5PvDrJz4H0A2OdLQb+5UbHIYWJZlbDncPzqfmBp0fF5MYnocUKwhFd2h4M1gUxk33K56mW2saDIyw1kyEC3dUrSPu195JkBNArVfr2AgXSx0aaGsf4ab6szXQfKBE4PsdxLma9wLNHUB2tpvBHsRD0MDwbf+AfAa6Oe5rMN690VyC2t2nJ/FXHniIwbUmfcEDDjMUcYiDdVVmnj7xo+dRohMNptgrJLaobISamgHR8NEw57mhNdsdZyFpbihRwPHBrW41eCVuNGZLpAIPMAp6cGYEqTxrb/dIQukA4KYGTaeP/rAv4ToIDnyVLIkGG8uS3v6+zDUy1G8Nh951+uBEQN1beDrxbK/fY0w/0LxMLsXDfC0osMWEYC4Ri5G/8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oJvtA/acOnTJAvTfTjiJ5h3izwq7tjxUMjJ3+ztIIcT8WtbA+bdlI99rnIJO?=
 =?us-ascii?Q?fhtAmu8GJf1chChqHEyBfygIX/OYGutZE5f+7b+KcD8KTcP0SnhIQWhBtN8x?=
 =?us-ascii?Q?8ANpHLgWzQQ30wmy7PBLpeMgqbq0Zg32Yrqq6zQkwalmUlJUG/wxmqAmMlOX?=
 =?us-ascii?Q?2qCX1JvAxL9mkSbChOv6/4LsDsYxj8Edk0fcXNUwXminHzf8dVD1/+nefQpO?=
 =?us-ascii?Q?OD3hK5ztWXuM1LHxRyq+comAMGPLTM4s+CILqVEWlPK14ZV38miO3fsx4Rdf?=
 =?us-ascii?Q?QYs9o3GIO+ub2dLEKge/Amc0P2Tl+ZzROBlMtUdkWZlBDZLDttGYJzdqIGuF?=
 =?us-ascii?Q?ltwcZbNhXmUgH9XmPTsLjky5zuUuQBcmA/udTNeuLmw8uifgLJ+xa4/lBvsB?=
 =?us-ascii?Q?hVbQUx+BCqZmJX3qztyUzj4RXWxvNVVEOnXib1SGvp6DwHH1BT3ELzPMgh2D?=
 =?us-ascii?Q?bQX+ZQrBlxdRLifnIB5GbtpnB1jYcIRYKWS9vAYxelL2qhMKCAh62R7L9WjT?=
 =?us-ascii?Q?JpM6RfX72zBoaRkuuUuIw5/PkGyOwbaau1rMNnSr7SQZmzJaoJQca8+zbTSV?=
 =?us-ascii?Q?Fq0P7uNkIdzFN4cIbgnDkwNru2uohQLGfnV9c2S5dQga5Ug3qRLpC2CJkNFb?=
 =?us-ascii?Q?UOU0r45Npsc2JqWVXAQyBoesZiDbYNM+720P7WFAuQmwNof9Pb9JEGsxRdBw?=
 =?us-ascii?Q?6MiB+iHHH+LzDkgiwPpV1HkVuBM8QDHN3rP6fgBDIXEDpFkMD0x1eE2Keoig?=
 =?us-ascii?Q?kb/0zlD57WxQLNMC2ugXQ6nCO+oNfEgX8F0KBNWoVAe9M4xMbdRm0o+yaz6q?=
 =?us-ascii?Q?yFz5miaeb1WwTRjB9mmtRrOnXHHf1yqTy+zdmsuAyxsplLoxOwek/oAQjTxC?=
 =?us-ascii?Q?B94+1ap6q7O3c4DvwrfOjf51Lu9X6iGSpTvtuIW1JxDIkveWL8cjSg5NUbBn?=
 =?us-ascii?Q?Kvbg7XqpsHH2tnuxS+9ejiHaVypiyJv6vriHQKInsnQ48WLjKeTD7xuXSpWJ?=
 =?us-ascii?Q?ijma7WqsX2bo84NgGjoHH7ZQ9gTobv6qrbXq4R7dht4XNNug0AisLdc14Rds?=
 =?us-ascii?Q?6bBDGPKjeZDPBVbDzd7sFNXeDY/udp1i9l7Dsh0O09kpu41XfNT5J/p4NJ61?=
 =?us-ascii?Q?vl3rWW2iyc7FT27dvTWmFtZBLymSjvP3ZrW0KHRj+AGUw7oE3VlP0OfbtkD1?=
 =?us-ascii?Q?EwIfOIl1x2d97HmppEpoDEPOfNlJm6+5TmyIlh7fk+GeN7AkXASvZnpxh2On?=
 =?us-ascii?Q?MAKxowfwAPITRa3NDtVegnaLZ/7aad2AFfVbYxEswkRSHSEgpDBB6U8bb6Hw?=
 =?us-ascii?Q?ROwwC2y9ZxQuKSr/QzvOquTz/QkiWaPZQbCtTfzhCAImwCfWiG+8ET9nfLBj?=
 =?us-ascii?Q?WoaKjdHNYXIjOgxMZDCJYaAIs5u85mB73v9seJMfcJkGRtxttdS57qeptIjX?=
 =?us-ascii?Q?dfD0ml6+eKd4iEHPCrTfXgCudjdFcGlKHH20Xhk9PWPXtR9HjH2miKoVbTDm?=
 =?us-ascii?Q?SnAYOyp2mBlRvmcAGw5jRqiEz5R2swxkcxa89gECJgP0J9SjOjU/PV+/sJO/?=
 =?us-ascii?Q?e56+HDPyE5a9accN9MxUBDa/qxBpPGKUVflrvGiEr22esM4S62Qg/hR8r4lr?=
 =?us-ascii?Q?ZC/3k764/INWcgyNu/tl5iPDCQCqUKdzCiPYw2iw7rqIT9PErTZvsrbSBKSz?=
 =?us-ascii?Q?wCuNN0QmVcUp6F6CJt4Wsx6IAfVpElC02gQ10l0RG5Vw7pl9tMSOx/XfIJUQ?=
 =?us-ascii?Q?MvXR5xo1ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c211fc-fb2c-42f0-420a-08de750f99a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 08:18:19.3426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgSwjKT1m+CdGYSOvKZm26PuluWi07IGVkF08XREWxFAq5cJvrvlGY/li1CMDE0g4Q+R4gZ4L4/mGtUdQJiCOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7235
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 08:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124667



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Yiding Liu (Fujitsu) via
> lists.openembedded.org
> Sent: Thursday, February 26, 2026 8:59
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe][meta-oe][PATCH] bit7z: upgrade 4.0.9 -> 4.0.11
>=20
> 1. Changelog:
>   https://github.com/rikyoz/bit7z/releases/tag/v4.0.11
>=20
> 2. Drop following patches as they were merged upstream.
>   0001-Fix-reinterpret-cast-compiler-errors.patch
>   0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
>   0001-Allow-running-tests-on-target-when-cross-compiling.patch
>   0001-Allow-specifying-path-to-7z-library-in-tests.patch
>   0001-Fix-tests-with-musl.patch
>=20
> 3. Adjust Ptest SRCREV to adopt to latest bit7z
>=20
>   SRCREV_filesystem refer to bit7z-4.0.11/cmake/Dependencies.cmake
>   SRCREV_catch2 refer to bit7z-4.0.11/tests/CMakeLists.txt
>   SRCHASH_CPM and TAG_CPM refer to bit7z-4.0.11/cmake/Dependencies.cmake
>=20
> 4.cmake/Dependencies.cmake has redefined to check and download
> CPM_${CPM_DOWNLOAD_VERSION}.cmake file to
> CPM_SOURCE_CACHE, so it will show error in do_configure as
> ./build/cpm_cache/cpm/CPM_0.42.0.cmake is empty
>=20
>   | -- Downloading CPM.cmake to
> ...bit7z/4.0.11/build/cpm_cache/cpm/CPM_0.42.0.cmake
>   | CMake Error at cmake/Dependencies.cmake:15 (file):
>   |   file DOWNLOAD cannot compute hash on failed download
>   |
>   |     from url: "https://github.com/cpm-
> cmake/CPM.cmake/releases/download/v0.42.0/CPM.cmake"
>   |     status: [6;"Could not resolve hostname"]
>=20
>   So change ${B}/cmake to ${B}/cpm_cache/cpm/ to fix this issue.
>   ./build/cpm_cache/cpm/CPM_0.42.0.cmake
>=20
> 5. Add 0001-cmake-disable-filesystem-gitclone.patch to fix filesystem git=
 clone
> error
>=20
>   Fix error log as following:
>   | fatal: unable to access 'https://github.com/rikyoz/filesystem.git/': =
Could not
> resolve host: github.com
>   | Had to git clone more than once: 3 times.
>   | CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-
> subbuild/ghc_filesystem-populate-prefix/tmp/ghc_filesystem-populate-
> gitclone.cmake:50 (message):
>   |   Failed to clone repository: 'https://github.com/rikyoz/filesystem.g=
it'
>=20
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...tests-on-target-when-cross-compiling.patch | 45 ----------------
>  ...ecifying-path-to-7z-library-in-tests.patch | 48 -----------------
>  ...ge-in-BitPropVariant-on-Arm-architec.patch | 41 ---------------
>  ...Fix-reinterpret-cast-compiler-errors.patch | 52 -------------------
>  .../7zip/bit7z/0001-Fix-tests-with-musl.patch | 51 ------------------
>  ...01-cmake-disable-filesystem-gitclone.patch | 37 +++++++++++++
>  .../7zip/{bit7z_4.0.9.bb =3D> bit7z_4.0.11.bb}  | 28 ++++------
>  7 files changed, 48 insertions(+), 254 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-runnin=
g-
> tests-on-target-when-cross-compiling.patch
>  delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specif=
ying-
> path-to-7z-library-in-tests.patch
>  delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-s=
torage-
> in-BitPropVariant-on-Arm-architec.patch
>  delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterp=
ret-cast-
> compiler-errors.patch
>  delete mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-wi=
th-
> musl.patch
>  create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disabl=
e-
> filesystem-gitclone.patch
>  rename meta-oe/recipes-extended/7zip/{bit7z_4.0.9.bb =3D> bit7z_4.0.11.b=
b} (76%)
>=20
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests=
-on-target-
> when-cross-compiling.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-All=
ow-
> running-tests-on-target-when-cross-compiling.patch
> deleted file mode 100644
> index b6e24a9519..0000000000
> --- a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-running-tests-on-tar=
get-when-
> cross-compiling.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 9f0eed91d32ec2f310bd5c23af187f888394fcb4 Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Wed, 2 Apr 2025 09:33:03 +0200
> -Subject: [PATCH] Allow running tests on target when cross-compiling
> -
> -When bit7z is Cross-compiled, target device does not contain
> -source/build directory anymore and thus path to test data is different.
> -Make it possible to pass the new path to cmake.
> -
> -Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/289]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - tests/CMakeLists.txt | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index 60da280..dbdff1f 100644
> ---- a/tests/CMakeLists.txt
> -+++ b/tests/CMakeLists.txt
> -@@ -49,6 +49,11 @@ add_executable( ${TESTS_TARGET_PUBLIC}
> ${SOURCE_FILES} ${PUBLIC_API_SOURCE_FILES
> -
> - if( BIT7Z_TESTS_FILESYSTEM )
> -     set( BIT7Z_TESTS_DATA_DIR ${CMAKE_CURRENT_BINARY_DIR}/data )
> -+    if( NOT BIT7Z_TESTS_DATA_DIR_TARGET )
> -+        set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TESTS_DATA_DIR} )
> -+    else()
> -+        message( STATUS "Custom test data dir on target:
> ${BIT7Z_TESTS_DATA_DIR_TARGET}" )
> -+    endif()
> -
> -     include( FetchContent )
> -     FetchContent_Declare( bit7z-test-data
> -@@ -61,11 +66,11 @@ if( BIT7Z_TESTS_FILESYSTEM )
> -     message( STATUS "Tests data directory: ${BIT7Z_TESTS_DATA_DIR}" )
> -     target_compile_definitions( ${TESTS_TARGET} PRIVATE
> -                                 BIT7Z_TESTS_FILESYSTEM
> --                                BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_D=
ATA_DIR}" )
> -+
> BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_DATA_DIR_TARGET}" )
> -     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE
> -                                 BIT7Z_TESTS_PUBLIC_API_ONLY
> -                                 BIT7Z_TESTS_FILESYSTEM
> --                                BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_D=
ATA_DIR}" )
> -+
> BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_DATA_DIR_TARGET}" )
> -     if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
> -         file( MAKE_DIRECTORY ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/em=
pty
> )
> -     endif()
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-pa=
th-to-7z-
> library-in-tests.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-s=
pecifying-
> path-to-7z-library-in-tests.patch
> deleted file mode 100644
> index adc0d67d97..0000000000
> --- a/meta-oe/recipes-extended/7zip/bit7z/0001-Allow-specifying-path-to-7=
z-library-
> in-tests.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 60137ec132951f941f2fb98cd6353717b322cbf1 Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Wed, 2 Apr 2025 10:17:38 +0200
> -Subject: [PATCH] Allow specifying path to 7z library in tests
> -
> -For instance to override path to library on Linux when using real 7-zip
> -instead of pzip: /usr/lib/lib7z.so
> -
> -Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/288]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - tests/CMakeLists.txt           | 7 +++++++
> - tests/src/utils/shared_lib.hpp | 4 +++-
> - 2 files changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index 60da280d..1307366a 100644
> ---- a/tests/CMakeLists.txt
> -+++ b/tests/CMakeLists.txt
> -@@ -103,6 +103,13 @@ message( STATUS "Use system 7-zip for tests:
> ${BIT7Z_TESTS_USE_SYSTEM_7ZIP}" )
> - if( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
> -     target_compile_definitions( ${TESTS_TARGET} PRIVATE
> BIT7Z_TESTS_USE_SYSTEM_7ZIP )
> -     target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE
> BIT7Z_TESTS_USE_SYSTEM_7ZIP )
> -+else()
> -+    set( BIT7Z_TESTS_7Z_LIBRARY_PATH "" CACHE STRING "The path of the 7=
-
> Zip library to be used for running the tests" )
> -+    if( NOT BIT7Z_TESTS_7Z_LIBRARY_PATH STREQUAL "" )
> -+        message( STATUS "Use custom 7-zip library for tests:
> ${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
> -+        target_compile_definitions( ${TESTS_TARGET} PRIVATE
> BIT7Z_TESTS_7Z_LIBRARY_PATH=3D"${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
> -+        target_compile_definitions( ${TESTS_TARGET_PUBLIC} PRIVATE
> BIT7Z_TESTS_7Z_LIBRARY_PATH=3D"${BIT7Z_TESTS_7Z_LIBRARY_PATH}" )
> -+    endif()
> - endif()
> -
> - # Avoiding linking unnecessary libraries.
> -diff --git a/tests/src/utils/shared_lib.hpp b/tests/src/utils/shared_lib=
.hpp
> -index 41435a9b..8bc02939 100644
> ---- a/tests/src/utils/shared_lib.hpp
> -+++ b/tests/src/utils/shared_lib.hpp
> -@@ -20,7 +20,9 @@ namespace bit7z {
> - namespace test {
> -
> - inline auto sevenzip_lib_path() -> tstring {
> --#ifdef BIT7Z_TESTS_USE_SYSTEM_7ZIP
> -+#ifdef BIT7Z_TESTS_7Z_LIBRARY_PATH
> -+    static const tstring lib_path =3D BIT7Z_STRING(
> BIT7Z_TESTS_7Z_LIBRARY_PATH );
> -+#elif defined( BIT7Z_TESTS_USE_SYSTEM_7ZIP )
> - #ifdef _WIN64
> -     static const tstring lib_path =3D BIT7Z_STRING( "C:\\Program Files\=
\7-Zip\\7z.dll"
> );
> - #elif defined( _WIN32 )
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-=
in-
> BitPropVariant-on-Arm-architec.patch b/meta-oe/recipes-extended/7zip/bit7=
z/0001-
> Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.patch
> deleted file mode 100644
> index b1bf6923f2..0000000000
> --- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-int8_t-storage-in-BitP=
ropVariant-
> on-Arm-architec.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From d504abaf2b0a514193f52df42098bc16de4718b2 Mon Sep 17 00:00:00 2001
> -From: Oz <rik20@live.it>
> -Date: Fri, 17 Jan 2025 21:23:59 +0100
> -Subject: [PATCH] Fix int8_t storage in BitPropVariant on Arm architectur=
es
> -
> -Upstream-Status: Backport
> [https://github.com/rikyoz/bit7z/commit/d504abaf2b0a514193f52df42098bc16d=
e47
> 18b2]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - include/bit7z/bitwindows.hpp | 4 ++++
> - src/bitpropvariant.cpp       | 2 +-
> - 2 files changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/include/bit7z/bitwindows.hpp b/include/bit7z/bitwindows.hpp
> -index 5849b956..2f29a989 100644
> ---- a/include/bit7z/bitwindows.hpp
> -+++ b/include/bit7z/bitwindows.hpp
> -@@ -126,7 +126,11 @@ struct PROPVARIANT {
> -     WORD wReserved2;
> -     WORD wReserved3;
> -     union {
> -+#if defined( __arm__ ) || defined( __aarch64__ )
> -+        signed char cVal;
> -+#else
> -         char cVal;
> -+#endif
> -         unsigned char bVal;
> -         short iVal;
> -         unsigned short uiVal;
> -diff --git a/src/bitpropvariant.cpp b/src/bitpropvariant.cpp
> -index 1e7f094f..642e1268 100644
> ---- a/src/bitpropvariant.cpp
> -+++ b/src/bitpropvariant.cpp
> -@@ -157,7 +157,7 @@ BitPropVariant::BitPropVariant( uint64_t value ) noe=
xcept:
> PROPVARIANT() {
> - BitPropVariant::BitPropVariant( int8_t value ) noexcept: PROPVARIANT() =
{
> -     vt =3D VT_I1;
> -     wReserved1 =3D 0;
> --    cVal =3D static_cast< char >( value );
> -+    cVal =3D static_cast< decltype(cVal) >( value );
> - }
> -
> - BitPropVariant::BitPropVariant( int16_t value ) noexcept: PROPVARIANT()=
 {
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cas=
t-compiler-
> errors.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-c=
ast-
> compiler-errors.patch
> deleted file mode 100644
> index 08b64f4999..0000000000
> --- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-reinterpret-cast-compi=
ler-
> errors.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From bedeec4d57d29be7de91697277ace00ba87d3e75 Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Tue, 1 Apr 2025 15:23:51 +0200
> -Subject: [PATCH] Fix reinterpret-cast compiler errors
> -
> -Building on 32-bit arm, following warning/error occurs:
> -
> -src/internal/windows.cpp: In function 'bit7z::OLECHAR*
> AllocStringBuffer(LPCSTR, uint32_t)':
> -src/internal/windows.cpp:79:6: error: cast from 'unsigned char*' to 'bst=
r_prefix_t*'
> {aka 'unsigned int*'} increases required alignment of target type [-Werro=
r=3Dcast-
> align]
> -   79 |     *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) =3D byteLe=
ngth;
> -      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -git/src/internal/windows.cpp:83:19: error: cast from 'unsigned char*' to
> 'bit7z::BSTR' {aka 'wchar_t*'} increases required alignment of target typ=
e [-
> Werror=3Dcast-align]
> -   83 |     BSTR result =3D reinterpret_cast< BSTR >( bstrBuffer + sizeo=
f(
> bstr_prefix_t ) );
> -      |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ~~~
> -cc1plus: all warnings being treated as errors
> -
> -Fix it by using the desired variable size right away and thus avoid
> -casting to an array with different alignment.
> -
> -Upstream-Status: Backport
> [https://github.com/rikyoz/bit7z/commit/b2789ea9b0fbb2a74dbf6764ddb72d606=
59
> a3bce]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/internal/windows.cpp | 7 +++----
> - 1 file changed, 3 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/internal/windows.cpp b/src/internal/windows.cpp
> -index 9304aed7..7bee5959 100644
> ---- a/src/internal/windows.cpp
> -+++ b/src/internal/windows.cpp
> -@@ -68,19 +68,18 @@ auto AllocStringBuffer( LPCSTR str, uint32_t byteLen=
gth )
> -> BSTR {
> -
> -     // Allocating memory for storing the BSTR as a byte array.
> -     // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, cppcoreguidelines-ow=
ning-
> memory)
> --    auto* bstrBuffer =3D static_cast< byte_t* >( std::calloc( bufferSiz=
e, sizeof( byte_t
> ) ) );
> -+    auto* bstrBuffer =3D static_cast< bstr_prefix_t* >( std::calloc( bu=
fferSize,
> sizeof( byte_t ) ) );
> -
> -     if ( bstrBuffer =3D=3D nullptr ) { // Failed to allocate memory for=
 the BSTR buffer.
> -         return nullptr;
> -     }
> -
> -     // Storing the number of bytes of the BSTR as a prefix of it.
> --    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-reinterpret-cast)
> --    *reinterpret_cast< bstr_prefix_t* >( bstrBuffer ) =3D byteLength;
> -+    *bstrBuffer =3D byteLength;
> -
> -     // The actual BSTR must point after the byteLength prefix.
> -     // NOLINTNEXTLINE(cppcoreguidelines-pro-bounds-pointer-arithmetic,
> cppcoreguidelines-pro-type-reinterpret-cast)
> --    BSTR result =3D reinterpret_cast< BSTR >( bstrBuffer + sizeof( bstr=
_prefix_t ) );
> -+    BSTR result =3D reinterpret_cast< BSTR >( bstrBuffer + 1 );
> -     if ( str !=3D nullptr ) {
> -         // Copying byte-by-byte the input string to the BSTR.
> -         // Note: flawfinder warns about not checking for buffer overflo=
ws; this is a
> false alarm,
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl=
.patch
> b/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
> deleted file mode 100644
> index b1f3d0f2ec..0000000000
> --- a/meta-oe/recipes-extended/7zip/bit7z/0001-Fix-tests-with-musl.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From bc5f2e5af90854c8f84b5829493dd01facf9af84 Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Mon, 7 Apr 2025 16:29:32 +0200
> -Subject: [PATCH] Fix tests with musl
> -
> -Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/292]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - tests/src/test_bitexception.cpp | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/tests/src/test_bitexception.cpp b/tests/src/test_bitexcepti=
on.cpp
> -index 7161fcc5..d85d430d 100644
> ---- a/tests/src/test_bitexception.cpp
> -+++ b/tests/src/test_bitexception.cpp
> -@@ -49,6 +49,8 @@ constexpr PortableErrorTest hresult_tests[] =3D { // N=
OLINT(*-
> avoid-c-arrays)
> -     { HRESULT_WIN32_TEST( ERROR_OPEN_FAILED ),
> - #ifdef _WIN32
> -       "The system cannot open the device or file specified.",
> -+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
> -+      "I/O error",
> - #else
> -         "Input/output error",
> - #endif
> -@@ -67,6 +69,8 @@ constexpr PortableErrorTest hresult_tests[] =3D { // N=
OLINT(*-
> avoid-c-arrays)
> -     { HRESULT_WIN32_TEST( ERROR_SEEK ),
> - #ifdef _WIN32
> -       "The drive cannot locate a specific area or track on the disk.",
> -+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
> -+      "I/O error",
> - #else
> -         "Input/output error",
> - #endif
> -@@ -74,6 +78,8 @@ constexpr PortableErrorTest hresult_tests[] =3D { // N=
OLINT(*-
> avoid-c-arrays)
> -     { HRESULT_WIN32_TEST( ERROR_READ_FAULT ),
> - #ifdef _WIN32
> -       "The system cannot read from the specified device.",
> -+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
> -+      "I/O error",
> - #else
> -         "Input/output error",
> - #endif
> -@@ -81,6 +87,8 @@ constexpr PortableErrorTest hresult_tests[] =3D { // N=
OLINT(*-
> avoid-c-arrays)
> -     { HRESULT_WIN32_TEST( ERROR_WRITE_FAULT ),
> - #ifdef _WIN32
> -       "The system cannot write to the specified device.",
> -+#elif defined( __linux__ ) && !defined ( __GLIBC__ )
> -+      "I/O error",
> - #else
> -         "Input/output error",
> - #endif
> diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-files=
ystem-
> gitclone.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-
> filesystem-gitclone.patch
> new file mode 100644
> index 0000000000..917b70f58e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-
> gitclone.patch
> @@ -0,0 +1,37 @@
> +Subject: [PATCH] cmake: disable filesystem gitclone
> +
> +In Yocto we don't download filesystem, it is satisfied from source dir.
> +This Dependencies.cmake file would try to download filesystem even if it=
 is
> satisfied.
> +
> +Fix error log as following:
> +| fatal: unable to access 'https://github.com/rikyoz/filesystem.git/': C=
ould not
> resolve host: github.com
> +| Had to git clone more than once: 3 times.
> +| CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-
> subbuild/ghc_filesystem-populate-prefix/tmp/ghc_filesystem-populate-
> gitclone.cmake:50 (message):
> +|   Failed to clone repository: 'https://github.com/rikyoz/filesystem.gi=
t'
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + cmake/Dependencies.cmake | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/cmake/Dependencies.cmake b/cmake/Dependencies.cmake
> +index 110d9c2b..dc1dead8 100644
> +--- a/cmake/Dependencies.cmake
> ++++ b/cmake/Dependencies.cmake
> +@@ -39,10 +39,9 @@ if( NOT USE_STANDARD_FILESYSTEM OR NOT
> STANDARD_FILESYSTEM_COMPILES OR BIT7Z_BUI
> +     CPMAddPackage( NAME ghc_filesystem
> +                    GITHUB_REPOSITORY rikyoz/filesystem
> +                    GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
> +-                   DOWNLOAD_ONLY YES )
> ++                   SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem" )
> +     if( ghc_filesystem_ADDED )
> +         message( STATUS "ghc::filesystem source code available at
> ${ghc_filesystem_SOURCE_DIR}" )
> +-        add_library( ghc_filesystem INTERFACE IMPORTED )
> +         target_include_directories( ghc_filesystem SYSTEM INTERFACE
> ${ghc_filesystem_SOURCE_DIR}/include )
> +     endif()
> + endif()
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recip=
es-
> extended/7zip/bit7z_4.0.11.bb
> similarity index 76%
> rename from meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> rename to meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
> index 033461d614..4e9a958422 100644
> --- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> +++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
> @@ -6,30 +6,25 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D48a3fe23ed1353e0995dadfda05ffdb6"
>  SRC_URI =3D " \
>      git://github.com/rikyoz/bit7z.git;protocol=3Dhttps;branch=3Dmaster \

Please add ";tag=3Dv${PV}" to SRC_URI

Peter

>      ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST')=
,
> 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
> -    file://0001-Fix-reinterpret-cast-compiler-errors.patch \
> -    file://0001-Fix-int8_t-storage-in-BitPropVariant-on-Arm-architec.pat=
ch \
> -    file://0001-Allow-running-tests-on-target-when-cross-compiling.patch=
 \
> -    file://0001-Allow-specifying-path-to-7z-library-in-tests.patch \
> -    file://0001-Fix-tests-with-musl.patch \
>  "
>=20
> -SRCREV =3D "386e00ad3286e7a10e5bb6d05a5b41b523fce623"
> +SRCREV =3D "82f359371fda5c16c037ac0659b969334816a9c4"
>=20
>  # ptest dependencies and their revisions
>  SRC_URI_PTEST =3D " \
>=20
> git://github.com/rikyoz/filesystem.git;protocol=3Dhttps;branch=3Dglibcxx_=
wchar_stream
> s_workaround;name=3Dfilesystem;destsuffix=3Dfilesystem \
>      git://github.com/rikyoz/bit7z-test-
> data.git;protocol=3Dhttps;branch=3Dmain;name=3Dtestdata;destsuffix=3Dtest=
data \
> -
> git://github.com/catchorg/Catch2.git;protocol=3Dhttps;branch=3Dv2.x;name=
=3Dcatch2;des
> tsuffix=3Dcatch2;tag=3D${TAG_catch2} \
> +    git://github.com/rikyoz/Catch2.git;protocol=3Dhttps;branch=3Dsingle-=
header-
> v2.x;name=3Dcatch2;destsuffix=3Dcatch2 \
>      https://github.com/cpm-
> cmake/CPM.cmake/releases/download/v${TAG_CPM}/CPM.cmake;downloadfilena
> me=3DCPM_${TAG_CPM}.cmake \
>      file://run-ptest \
> +    file://0001-cmake-disable-filesystem-gitclone.patch \
>  "
>  SRCREV_FORMAT =3D "${@bb.utils.contains('PTEST_ENABLED', '1',
> 'default_filesystem_testdata_catch2', 'default', d)}"
> -SRCREV_filesystem =3D "983650f374699e3979f9cdefe13ddff60bd4ac68"
> +SRCREV_filesystem =3D "b99c2aebd5ddd6fb2f190731ba80b949fc3842b5"
>  SRCREV_testdata =3D "077e407b1c07b7443626b5902eeb4819388bf656"
> -SRCREV_catch2 =3D "182c910b4b63ff587a3440e08f84f70497e49a81"
> -TAG_catch2 =3D "v2.13.10"
> -SRCHASH_CPM =3D
> "c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d"
> -TAG_CPM =3D "0.40.2"
> +SRCREV_catch2 =3D "27d8db1770dd5cd3688656095f242474431584a1"
> +SRCHASH_CPM =3D
> "2020b4fc42dba44817983e06342e682ecfc3d2f484a581f11cc5731fbe4dce8a"
> +TAG_CPM =3D "0.42.0"
>  SRC_URI[sha256sum] =3D "${SRCHASH_CPM}"
>=20
>=20
> @@ -51,15 +46,14 @@ do_configure:prepend() {
>      # verify that all dependencies have correct version
>      grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cmake || bbfata=
l
> "ERROR: dependency version mismatch, please update 'SRCREV_filesystem'!"
>      grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfatal "ERR=
OR:
> dependency version mismatch, please update 'SRCREV_testdata'!"
> -    grep -q ${TAG_catch2} ${S}/tests/cmake/Catch2.cmake || bbfatal "ERRO=
R:
> dependency version mismatch, please update 'SRCREV_catch2'!"
> +    grep -q ${SRCREV_catch2} ${S}/tests/CMakeLists.txt || bbfatal "ERROR=
:
> dependency version mismatch, please update 'SRCREV_catch2'!"
>      grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfatal
> "ERROR: dependency version mismatch, please update 'SRCHASH_CPM'!"
>=20
>      if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; =
then
>          # use cache instead of download for CPM (CMake's missing package
> manager)
> -        mkdir -p ${B}/cmake
> -        cp ${UNPACKDIR}/CPM_${TAG_CPM}.cmake ${B}/cmake
> -        mkdir -p ${B}/cpm_cache/ghc_filesystem
> -        cp -r ${UNPACKDIR}/filesystem
> ${B}/cpm_cache/ghc_filesystem/fbcc9a9e94e6365273cf51294173f21ff5efdb4f
> +        mkdir -p ${B}/cpm_cache/cpm/
> +        cp ${UNPACKDIR}/CPM_${TAG_CPM}.cmake ${B}/cpm_cache/cpm/
> +        cp -r ${UNPACKDIR}/filesystem ${B}/cpm_cache/ghc_filesystem
>          # avoid buildpaths issue as unpackdir is not in prefix maps
>          cp -r ${UNPACKDIR}/catch2 ${B}
>      fi
> --
> 2.43.0


