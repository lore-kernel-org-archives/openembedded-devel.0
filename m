Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF32C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 18:35:20 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1004.1784486112483987461
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 11:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=e9TguQHb;
 spf=pass (domain: siemens.com, ip: 52.101.72.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZN04DXs93Bgx7zcIgfotARTrHJT9GOkH3gT9KKlzHU0Q4zhOyNPUaG/XBpOREdAJhgW/fQrfvyeq6b4quYcYFWD8yxzMRM8j+oeFy4I1NkOCXZLJl/Kft0RuphPcJcAyQEmpCCNZvgYrkIQA76n0tqYWqQksz9QDcfxkok6xSlnhXF/uHuDYD0TK7Jgs2BFwYIAmZpzfqlDDv+dSOcp6lmOAJXtjPyb+nzfr9/cT1sywZjqv1BgM+18kQzIt7e6Xrjrqcr1g+khHDqWUHWxgOvGEHPQxg45uC3hlVKqt1lUAtThaG8cCRordpql5DwkLCsCFwQmfHPNJu47jIcaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Voao519hk+OK+Qnt8LCC8SBMiZPDoPDJZ+Rv82/j8Dg=;
 b=hpwrTyrM4moput+J6jNvKBhHTKN0NGw9oVVG6pzR19YEQUV0/9NZ621zytAKwWvvAZdQRxZsgCq5SxvYYqJA32YTR/dw8pYMZdTyUsFzJlc1pQ+t1977j0w5iLssSUWn2tirP5FLovT/pKdbyjEuvJB+yDmdrwBWuqIk8MxuxOrtgSN/UYHPIDLvfKsy68EAOtES6L8WE+hGpEvz2DD6dv3FFgq17dl7ZcBYob3IdhjER08GbojZGrtTHFXatjCy+xrT2dIR3ktSX3XnX/79MrjXzkiKOWfepvJP466rqV/OK78V+OHiLsqKDflc38OReIsyCrpl161ySz0hdfkv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Voao519hk+OK+Qnt8LCC8SBMiZPDoPDJZ+Rv82/j8Dg=;
 b=e9TguQHbkLYcL5fsnqfnObk1A3dYDpeBOf4DcWJNle+WhKfxcMEqKVvDrtgLvjitRWTxcC8m25/G0yMc5sgx/JDvp8xbT/CshelkglmCQAjTHgkB/aHUOqD8cVIXDpyRilI3gxLoVH9J3RqaXgQritKpi73E8o8If3SScuCEoai31HQ0lPoJo+O1rmCdlkOa+AG7vDdkffPWL1ZTbYj0M9Pe9PKquO5U/PEFxEv3FxLChRVP7RQ88WfnDph906iBB6vrf6W7V/Komc15IWI5ADJMKH01ClnbRa0f4PQyTQcVOQLa1ER+TVhD01CWpk9neGQr80pu2FJtAR/WebKEtw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU2PR10MB7908.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Sun, 19 Jul
 2026 18:35:07 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 18:35:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] protobuf: update 6.33.1 -> 35.1
Thread-Topic: [oe] [meta-oe][PATCH] protobuf: update 6.33.1 -> 35.1
Thread-Index: AQHdF41xWE8CF/8fH0KhV8qi1ljobLZ1Knqw
Date: Sun, 19 Jul 2026 18:35:07 +0000
Message-ID: 
 <AS8PR10MB5073A93245DCEC4AA6D6EFEDFDC42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260719144631.1408576-1-f_l_k@t-online.de>
In-Reply-To: <20260719144631.1408576-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c411e96b-3be8-437f-aa18-73e20603e2a2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-19T18:31:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU2PR10MB7908:EE_
x-ms-office365-filtering-correlation-id: 01e7992f-d895-4915-3db8-08dee5c47539
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|11063799006|10067099003|56012099006|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 5DNoT7UzVIU+MVyrMYtOldBxmeFrk1BzKUsprkAKoxnO88D5mNAGSnJnsAESfnnfDJ+CurztvN0WV6xlY0IWKDlIE6/HZQ8uUuYm1SVk/hms43Dim6Ns2cEaDUdCvknsaEx5ouLy8haI4bB/rVYwIJoEIB892SOT3yS986ZiuNZm/OTW8vEw2u/gcIZIpNMYr7qjTfrtutslkQda5d9icY4MXAe5Wyor3sdDv0ZP1pVti8O8nR1T7i+AfEBxmE/h6tL73GUFJoYoy5dbK6pwByxw+P4dl2HfSmnyWqNchKjTtRzLqbH8riq2ZpDTXXuwWJcCF0zGhE2dybDpxeodRKynCSc4vsLBw0hNJyuLZZo3DBoSRRQqllaSP8pdMDo2jNqqsuMbTyRJOz8AV/DAMbmQMyzFwVBXGnBYSxXJ1Ci4iC5ztRiDpD+WzuYQbRsWftV1fVV80Nsn9nylFBu6vAiqpmQB91mylqKw8f1KVEvcAbmbdxMxvTtx6V4Zhq8XsujQ/69jGFkYfZHFgICzMo0zXpuTXzUNeNOEQemI71GtzDiVxd4/5I5aoJs9XKIbusPcf1j8NBd8+qtvUkaodnv04GumKIwI+LKCpO7sRQy7isNPA1PexiMh5NQdHTPiWdjkaRuk35EUTgUifaWeQXAmyDs/IYFrR92Bm+H3E2Y0QtUQOUqtRywx60S4+BNZoq4l7y9zIgMY45bXgyP4lgpmu1P+G9zQD12NRhROo0c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F/ud58royBQlKbUaZCjPQycjc3fxLqRnoE7V7TReaOFpqpMWwq5nml+6T09f?=
 =?us-ascii?Q?npOjZRDqguir621SjTUXr0NJpOebfVN2wXpCDxxnxMHfORLox+DtpWit3frb?=
 =?us-ascii?Q?l9sIYXgBmc+TSCKG5ViaPVZXALjP42Ps/r1970l5ixTniFYBamhxbMqig7jY?=
 =?us-ascii?Q?XMAF0W9xGw4TVV28zsXgSs+/e7KKB2kRYla24JcdoZryw5hq4WYjG17GI/P5?=
 =?us-ascii?Q?7+e4hKdKQUhfG7DZI1I4nUkMsP+J8R459sy9y1SUAlTxfeOzEURzB3sbjbrr?=
 =?us-ascii?Q?FTAIX6HNjz4rix4qNGOxhZLX4S2/vCVIowqGWIUwFMIlA3w783ApYfStsHZV?=
 =?us-ascii?Q?D0dBIGZbJL225p4qnsN+ehZ/r6bfstAL8XigsNkw90lya1o6lAVzZUdxVgWB?=
 =?us-ascii?Q?k7IH6IcKhSdzaa7Rpvcm0yJnUBjNTKUCz1gWUm6ceDvj1OmImCnr+0vPfzbe?=
 =?us-ascii?Q?Cg9teqajQau/FAxIHu8ZkVX/HpEyVGIoR8zZh4ZXCQ+9Rsz7jNBu+POuBnvz?=
 =?us-ascii?Q?zw8+5xo7gQXVQz+UH1tXrV9QmydWfZOng7mOoTfyDVGVu2nd+3/6Sx8zii8K?=
 =?us-ascii?Q?B+p7D5LMwl8P687mvkaQ053Y68Sk896rLVgg4TCAlE5KxJk6szyf/3H48wpU?=
 =?us-ascii?Q?TOzMqs4p0XafLwkQRKJiR3aKldgo535rdHvcBBKAl6bpMWOURLiFhzjNilDj?=
 =?us-ascii?Q?NrRW0fTBcNwHgdgSmzk9NHyA/gI6Rd8juB620QeEyWZj/06CQK6BvtEJqJkt?=
 =?us-ascii?Q?0ic1OuABGnBghwVHWtfMQQRgB4uhDbozA+VmenAT5okW75FJPXslk+mtVIzP?=
 =?us-ascii?Q?mAofeHWxnGj5MpOkM7Ync5pvVBG2H2nQx/a6TpQjysnHiV6eUoRsjyxidKW8?=
 =?us-ascii?Q?qxqoGbOZfUqi4pEkg2M7/Q/BOixJIMhHCiOfStoby3isx0krBpFBFyf9TYai?=
 =?us-ascii?Q?A64crl4Ic/vDUGk4LIpwPdiby2dfcOi5aZ4iFj+0dIZghY/LzPMZjVCxyu3U?=
 =?us-ascii?Q?DdV4KTlomjCjeNwz8qgQiJg/Z76kASYQihWKa0V3yRFGDcXOlcnNuutfVWQf?=
 =?us-ascii?Q?nanJ33UsbHio/WlNCPpeZzZKHVZXvQZxvJStH7cQXlWofPlj3eeKEUNlUVxq?=
 =?us-ascii?Q?AjU5olZM/NecTSJCa3TmJ3IfsBS1CeAS7qbSuPGXF+iHT5DavyWOk+jFopwu?=
 =?us-ascii?Q?PZqGpGzDvNYbZGEW3ng9qXWhD6gWfFdf6rrWWFSyXafKmXVWbXms0cY/RK6K?=
 =?us-ascii?Q?mxOXsiYD5BXryc6KGNQwdOnO/tgYnLph5Kwk3t3x1+jAqVy9aUQiEXZgUZ4a?=
 =?us-ascii?Q?cqkIt9c6XeewmSpOxzcJuy5LJvO25BvkhMqAvqWs0uJyqv7+siE0ITAY0BLC?=
 =?us-ascii?Q?lhCEHInw0g8uJ3OvfZdnyjQWu4DWX9mu9ZX1UBafWmXU/hzh9GV4kJyn3o/5?=
 =?us-ascii?Q?RD34RRa5pOS4z5WToGh6+FIjtrQpFoLBERhUIM8i9jhMvy9TQd/q0Y2hltu+?=
 =?us-ascii?Q?ncoBVy30iBbzVNNOPSj/vvBsPFFO8CwuwUcvaX7bqy4a7IrKFGA3yYYMSqL5?=
 =?us-ascii?Q?XmRloZT6KWRaPt3EZyoCBTLYRh3c4UAHtedqhpXlu6OYBC8W0ncKfc8e+Nyh?=
 =?us-ascii?Q?oVJsbL4eHdhn3OmK/Tqnob7pxABOm0LblZHOVrjwaheCAp//nEwYtylZ5SHB?=
 =?us-ascii?Q?mr/ivH868oUVhDE8m8/RspksLSrf/LH3mq2dyaZ2+UjgzY20N5B/jnGr/Abi?=
 =?us-ascii?Q?0IFx75ZQLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e7992f-d895-4915-3db8-08dee5c47539
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 18:35:07.6189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6aGDn1/b89MBZQIWSHsZOEMpSwQxnDTGdRh3ErTAPkbr1P2TTgNgNkzFZ5jX16AZvRSCgK4l54wFddF4gH2mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7908
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 18:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128261

Couple comments on this patch:
* there is a typo in commit message (6.33.1 instead of 6.33.6)
* please upgrade python3-prptobuf recipe together with c++ protobuf
* the correct version for this upgrade is 7.35.1
* possibly add link to https://protobuf.dev/support/version-support/ somewh=
ere in the recipe to explain the versioning

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Markus Volk via
> lists.openembedded.org
> Sent: Sunday, July 19, 2026 4:47 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] protobuf: update 6.33.1 -> 35.1
>=20
>     - Remove PROTOC_VERSION. It now matches PV
>     - Adjust PROTOC_BRANCH
>     - Do not build with a custom configuration for protobuf-native; in pa=
rticular, do not
> build shared libraries
>     - protobuf-native only needs to provide the binaries. Do not package =
the library and
> includes to
>       avoid potential linking failures
> ---
>  .../{protobuf_6.33.6.bb =3D> protobuf_35.1.bb}  | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_6.33.6.bb =3D> protob=
uf_35.1.bb}
> (92%)
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-=
oe/recipes-
> devtools/protobuf/protobuf_35.1.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
> index 880dd82b1d..dd3f364de2 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
> @@ -10,21 +10,20 @@ LIC_FILES_CHKSUM =3D " \
>      file://third_party/utf8_range/LICENSE;md5=3Dd4974d297231477b2ff507c3=
5d61c13c
> \
>  "
>=20
> -PROTOC_VERSION =3D "v${@d.getVar('PV').split('.', 1)[1]}"
> -PROTOC_BRANCH =3D "${@d.getVar('PV').split('.', 2)[1]}.x"
> +PROTOC_BRANCH =3D "${@d.getVar('PV').split('.')[0]}.x"
>=20
>  DEPENDS =3D "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>=20
> -SRCREV =3D "6e1998413a5bca7c058b85999667893f167434bc"
> +SRCREV =3D "35cd01f9fe9afbeea38cc7b979a3b6bfcde82c03"
>=20
> -SRC_URI =3D
> "git://github.com/protocolbuffers/protobuf.git;branch=3D${PROTOC_BRANCH};=
protocol
> =3Dhttps;tag=3D${PROTOC_VERSION} \
> +SRC_URI =3D
> "git://github.com/protocolbuffers/protobuf.git;branch=3D${PROTOC_BRANCH};=
protocol
> =3Dhttps;tag=3Dv${PV} \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
>             file://0001-fix-protobuf-native-build-failure-with-gcc-10.pat=
ch \
>             "
>=20
> -UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d\.\d+\.\d+)"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d\.\d+)"
>=20
>  CVE_PRODUCT =3D "google:protobuf protobuf:protobuf google-protobuf proto=
buf-cpp"
>=20
> @@ -39,7 +38,7 @@ PACKAGECONFIG:class-nativesdk ?=3D "compiler"
>  PACKAGECONFIG[python] =3D ",,"
>  PACKAGECONFIG[compiler] =3D "-Dprotobuf_BUILD_PROTOC_BINARIES=3DON,-
> Dprotobuf_BUILD_PROTOC_BINARIES=3DOFF"
>=20
> -EXTRA_OECMAKE +=3D "\
> +EXTRA_OECMAKE:class-target =3D "\
>      -Dprotobuf_BUILD_SHARED_LIBS=3DON \
>      -Dprotobuf_BUILD_LIBPROTOC=3DON \
>      -Dprotobuf_BUILD_TESTS=3DOFF \
> @@ -100,6 +99,14 @@ do_compile_ptest() {
>  	export PKG_CONFIG_SYSROOT_DIR=3D$save_pkg_config_sysroot_dir
>  }
>=20
> +do_install:append:class-native() {
> +    rm -rf ${D}${libdir} ${D}${includedir}
> +}
> +
> +do_install:append:class-nativesdk() {
> +    rm -rf ${D}${libdir} ${D}${includedir}
> +}
> +
>  do_install_ptest() {
>  	local olddir=3D`pwd`
>=20
> --
> 2.55.0


