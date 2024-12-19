Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE528E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 16:38:04 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.78])
 by mx.groups.io with SMTP id smtpd.web11.133144.1734626278807183447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 08:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hl2PTE63;
 spf=pass (domain: siemens.com, ip: 40.107.249.78, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYwsgOj+MKDVYZMH6Qy9Y8X0SVXztbkRYVfyTH1HPNdOYeHDzihNuAKm5KJVZGjXS5rdcpIiFGySHMiTl3b1LLzUej+nppJj5tH6YDxej1NGNnAxB5efR5mX6karISJpEza5C9FLABIRvJmSLXqi1DzA7Z47lvv7F9Pl1Om5q1bM8R8+QJIa480vgsJfaIXMf8bAX9wV4rp/H5ww44n4J9JhKbTJg+ZuvhpB+4CeKzCqc/u3t9vtY9Jz73jlkACGmzXObEOeuvREOrRcRKa6dx2cunOpFxSTjUpcW/ok1QvglhwqKgCtES6hKtK36ggkn3n8AxqUcB/MJg3AM6fteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2KlQj3E/YCKcDrrUi9xRibnHIWI3VVO9NogFDyL6H0=;
 b=XfxWblMA0Es1tNqSgp4iC13D2+DXbjgIUnLZ7cLy7IeRWrQDXDluIzXO4poICbJY3nlTPT3SA2iFuksGTA23vVcFxpgfpnutv71ykPZuKt7fCu0+AHbh94co5MyjnH5pVvV3CRYiiSyiq5vgj92EzGMavp6skJ+8yuz3ux7546N500z2Sk7Dsg/aG8Li0SrBc1aiowfbJPp1Z9W8xb+ZisxmUV8wInfdHDSYgFChQZubYRg4xIxYK4p12nr/PTkMQ3+n+TOwAG/zXt3Rr8K/tFrBlaljkf1KonTBBgN/GIf7nb7934jQPDSKJQzIX+c83FVxR5eCBLo0PcD3Xj6qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2KlQj3E/YCKcDrrUi9xRibnHIWI3VVO9NogFDyL6H0=;
 b=hl2PTE63TTA9iAPmCe91hO13uDHwav8gRaO91TzCbdFA9fOt/IV5fB1EZ0ObfAXgU0W/zkOs19jQwjXX19P14LtD+tPU4Pgs/MPsWvajXFIGqVfk1gZipzLKzMtc6AfbkBw6oagpc9TTxijvpFOMam9HFh8B5eKqTMZ2kqq/GUswv/SwGDmgZith1YaPb4eQFKbnwUGx+EOjMFBgc2dR4y0XVDDogIRqlFZD15kjHSmEz9+COtNqVB30yHFcfxEkuxjsU4mVSA8ML1gSQtDoE6+KAD21NA15XvORQ+HJfrlEYgxKEFwpbWk2wLQCVJlwHLJysT1UqhHWa2c7UvpGpg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:550::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.11; Thu, 19 Dec
 2024 16:37:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 16:37:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Nagy, Miroslav" <miroslav.nagy@siemens.com>
Subject: RE: [meta-oe][PATCH] 7-zip: add new recipe
Thread-Topic: [meta-oe][PATCH] 7-zip: add new recipe
Thread-Index: AQHbT6/dQvNlCDKj802QuisHS4q5erLtyFQQ
Date: Thu, 19 Dec 2024 16:37:54 +0000
Message-ID: 
 <AS1PR10MB569793D31A8537F39634F9C4FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241216114349.125642-1-miroslav.nagy@siemens.com>
In-Reply-To: <20241216114349.125642-1-miroslav.nagy@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e6be7396-e909-4003-af01-93d4cbb8cd3c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-19T16:34:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6349:EE_
x-ms-office365-filtering-correlation-id: 3157eb30-9945-444e-7e49-08dd204b7d10
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?34sImUMfQ5xYpYMT2U3rGUGdhuVtqCYvoJrM5Alnm+164iZ8BYOmpDPtFKjH?=
 =?us-ascii?Q?n5+BeI5HLO65iCL7O7qCVO95JAErFxRkTJVo7A+73XadpHJVeKxtvmKuNB+u?=
 =?us-ascii?Q?RgnsVKcAh0dZdlRiAOchit5CgD1Kr/02aoN7KW47C7M9g3ORNSt1VDXCvjzv?=
 =?us-ascii?Q?u9rjivmjgcYk8ypoYvcbYGxbVQB6nwwm7zNYb4MKY7L+KPoWa0avQ1jShWSl?=
 =?us-ascii?Q?vzMiVsxVEGGxcDrDRJUFgtLhYH0WJPwJN9u2MqhptRYM7RitZwSPjBV5JXjD?=
 =?us-ascii?Q?Ngg7TK8t42jfNWPSsM7UFzlVcVdmdtfoNaHsT4PEV0WLLFn1akcgN6I+atNY?=
 =?us-ascii?Q?obBiKMZR+XnXC9m0ISYgSWWh1924H5RPOhs/GfyQdKKI+PXEbA96s+lV6Drg?=
 =?us-ascii?Q?yT3HklnAI4e5unUYil+IHh2So/ZzduEUYOt+4YUC3jaU1cc64o0X36FwehsI?=
 =?us-ascii?Q?rcfB+9Rb24IxpwL3+asHjMseHWlDrCYe2GTpW8gQhtT9ejfO6jj/ilnqkT7R?=
 =?us-ascii?Q?ea3zHlYHkR9DhltWjDf2w0OiYn6IH4AqubD/aOY9kdMogQhLnwJLEfHGT9Hg?=
 =?us-ascii?Q?OfcelVsoHxIm4hnabg5qratAe8Ky4UZz6jrfNi1YdFnCwfhg1UGUu+o3f5Fc?=
 =?us-ascii?Q?aQb8TZ/34fjNhnK0GsQObPDWEb8S/RMZnGHwG5yTmUXSwlcxPr6s3fEII1mZ?=
 =?us-ascii?Q?wA1Ms8cb5rNI7jwnQMskZBA3HA5dN4wHl6GG4GDAQd2bPGTNl37T/rjSUhmx?=
 =?us-ascii?Q?bKgHL/FL1Zc3eHQb5VomTju+w4xDVjBFy1p+/Oo1JKcSkrguiPg7GQr1iP1N?=
 =?us-ascii?Q?niJxPUN7l18hfueKSrR1rk4XnOSBwiKsum4Ige2QBkemdDtv5Scl9TJpjxYm?=
 =?us-ascii?Q?s/xZkJPRhleNSg8XfrnS4SikcoyAF+Aks9cgmghO3BH/5C8ongxTs2kLaaZs?=
 =?us-ascii?Q?x6PX/zA1vaAEfB/O5JRLzYeJ6Al44aoOy0oxgxjIudlXA0ArRNdg8kwsna47?=
 =?us-ascii?Q?D9gBjP4klLCboNh09ioipVFY998/lBBeUrnDPpBPF9ccTJXuiyO6/p42r5rL?=
 =?us-ascii?Q?8QZBgArTQlxAcYUG3TATwQCvOBhUKGZmGQYcprChIXDyFZfeIkouX0rrIS9j?=
 =?us-ascii?Q?9qcAaf0bmNjveqD/9oEaLMFPpqofvXGw3CKvQEMpUfT9NDbZOzYi78nedRkt?=
 =?us-ascii?Q?UbjjxrRANp4iKqRaOe0RpgXd4h7z5o0gDZCbwa0aqOPfiwVCgE2D4IEITdvr?=
 =?us-ascii?Q?kywMO84iQSKagFtD/TTz51S5OL+JBPbVxxj2yAh0SxY2ESepxLrq/p1Wh49v?=
 =?us-ascii?Q?QrmPxt51a4Fbn80M6kLYWbFZheA7MPaPocRYCUymryfS2REQHUNONVzrB0BP?=
 =?us-ascii?Q?AxGl6E/oDYVh40VV4yg6DdgdkmrO?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5iuo7MPt701/Lh+pWNjW5hsLEu0xHcz3ddAhOit2ogkUSO7FSOA5IC6u5hC7?=
 =?us-ascii?Q?ObmDpiDJYUS0EwZHodArIKVJTEbG9yz3JtP9DaAe0pZ2XOWFAdI72s1PYJLj?=
 =?us-ascii?Q?gN70RJMJZqm94kXiZyKrxQ5hHK/6MVF/MOYXi/XDyimDiGE7yDcFu2vTILMh?=
 =?us-ascii?Q?tfHR091pKMCGacxRPvXOCVLSwnzCEcBtLYxaN5iZeI68drdsFnT5mQIAGPTT?=
 =?us-ascii?Q?oyqGba3Hy6haGLcUyWNUySmFAwXQ7Oidgf9tJxllGxGgyn8bzttv2nHRy2V0?=
 =?us-ascii?Q?FCnF5tTATCoyIoFuid574h8PvYIgnRyFc1AgIvb6QVoSlXnik+q28JiNGnTL?=
 =?us-ascii?Q?vmJ44cC4/sAHEOdkVGWmRdlGKwpqWp6N/+typ+lj5r7uLUeIX85GZLffVfDM?=
 =?us-ascii?Q?w0/HOFbvQjRvpWJfmAiZ7Xc+j3YmRH68xQm6cii12Q9bgo682kev4m/HwoZq?=
 =?us-ascii?Q?GdMtmVO+T7+EMuJD2fndgWSm4XH2b3CdO5rviL/OrWpIcHBzI5geq4DsS6Je?=
 =?us-ascii?Q?tQwX31SZbuzxU5aOT9Q8dY1iy4ttHtvsXO1o9Dxg0CxhdDVJ3FxG11jDWGxT?=
 =?us-ascii?Q?jRGXENc1WOQjwWbQIeV133DfvfKdtFHHmBsvoKuW18nCTnFsBh6Z5Di9Dg8L?=
 =?us-ascii?Q?A/DmSfpqpYF90iJQzTEx5lYjf90w/6QtGaQBhqCtzDgCd1GNjYK21dkf9TG+?=
 =?us-ascii?Q?mMwoV+EqMlQZXPi1KQz0l8LKFQfIUki7bsP+2Dve2Iklut+3mcBTyb9oGSvP?=
 =?us-ascii?Q?j6rjo7B8zuw+oQx2dC1834yBF8qiPVID8ObvlvmsLCJKkRgjTJJvC8Lex2dt?=
 =?us-ascii?Q?VSz0kd+NB/0ftvVD1wnDGAKryL0EunlrrEOa2i1dNLDq6XY39Y+muwMoM6PD?=
 =?us-ascii?Q?0QZXqyPMq+/Qp4iiuiZ4r2VlATXfEl41qZJNc9AGntx24d2vz9rWMO9GQL/V?=
 =?us-ascii?Q?8xnV5MWouft15pmCU89Nzk7tQnCf+CWezEkTsbZs46JOKes0A/EkqAaI3y8S?=
 =?us-ascii?Q?HcmbyW5wuLaBKhq9jHbOviA0sNmG0M1jDZZtxPGJyJDaAkkf8XDXnah124kW?=
 =?us-ascii?Q?sI86gY4Ah6/cQnjBC+ePXgfNjzAVzlpnc5LQIZvG1j9JuAKp7jCJ0y65MXkX?=
 =?us-ascii?Q?y2VoqJbwtze31UvsCOC9PZfZHAI/QVC9s1XOrhM//NPxLWTFLOka5I/65G4A?=
 =?us-ascii?Q?xrFr5NpSpKC5eycovd78xeuOJc2ir+KH55YTYnjLLnIKXR9dR/HCkwPZ2Osg?=
 =?us-ascii?Q?SxJ0DiL/RzGNzmrkSOrtY1I1emkfHGVv1lY9HZJDWSmGBsDiN2+FfZ7Dhibq?=
 =?us-ascii?Q?fNtXivdgk4vawDB1g+VjtKfcH3qnm6bz9cqG9hTjvUr8iILSGb1vPTE+FZ0I?=
 =?us-ascii?Q?EkrVEWBfxY/4BFDx7c6qbrPA8M06kg2w/GORKsX0Yw1dcX3KAXlPR8m8axKL?=
 =?us-ascii?Q?h5NEEHdq/dlEtvgNHgqVxG8P5NXLDWVsssqr3neI5bDa2RbpRaQCXIPwe4C5?=
 =?us-ascii?Q?09QlnOAXvnV/r1RuZD8JV6ILw/DUCRJR3r8cri84hvMazwSBIqr6krROOvKJ?=
 =?us-ascii?Q?jgYSLKQbcSWRodTzkzTm+nl+8Lx15AuTNtyKH0F+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3157eb30-9945-444e-7e49-08dd204b7d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 16:37:54.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvUYDJMvYxyiTx8GlH+4hLZ1vP+279G9ZVESUEX5rKYtJVtB1LhEVox6p7S70ueob2yr1wYsUgiz6l+9TsfZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6349
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 16:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114399

Please drop this patch.
The newer patch from Hongxu Jia adds the same component under different rec=
ipe name and is more feature-rich.

Peter

> -----Original Message-----
> From: Nagy, Miroslav (FT D EU SK BFS1) <miroslav.nagy@siemens.com>
> Sent: Monday, December 16, 2024 12:44
> To: openembedded-devel@lists.openembedded.org
> Cc: Nagy, Miroslav (FT D EU SK BFS1) <miroslav.nagy@siemens.com>; Marko,
> Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][PATCH] 7-zip: add new recipe
>=20
> From: Miroslav Nagy <miroslav.nagy@siemens.com>
>=20
> This recipe should eventually replace p7zip recipe.
> p7zip is very old and not updated with unfixed security vulnerabilities.
> Using real upstream package should solve this.
>=20
> Signed-off-by: Miroslav Nagy <miroslav.nagy@siemens.com>
> Reviewed-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-extended/7-zip/7-zip_24.09.bb | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
>=20
> diff --git a/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb b/meta-oe/reci=
pes-
> extended/7-zip/7-zip_24.09.bb
> new file mode 100644
> index 000000000..6e8d0ba77
> --- /dev/null
> +++ b/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "7-Zip is a file archiver with a high compression ratio."
> +HOMEPAGE =3D "https://www.7-zip.org"
> +LICENSE =3D "LGPL-2.1-or-later & BSD-3-Clause & unRAR"
> +LIC_FILES_CHKSUM =3D
> "file://DOC/copying.txt;md5=3Db0d181292c99cf9bb2ae9166dd3a0239 \
> +
> file://DOC/unRarLicense.txt;md5=3D9c87ddde469ef94aed153b0951d088de \
> +                    file://DOC/License.txt;md5=3D8bfe22e0285a3043b61ea40=
8d234c55d"
> +CVE_PRODUCT =3D "7-zip 7zip"
> +
> +PV_WITHOUT_DOT =3D "${@d.getVar('PV').replace('.', '')}"
> +
> +SRC_URI =3D "https://www.7-zip.org/a/7z${PV_WITHOUT_DOT}-
> src.tar.xz;subdir=3D${BP}"
> +SRC_URI[sha256sum] =3D
> "49c05169f49572c1128453579af1632a952409ced028259381dac30726b6133a"
> +
> +B =3D "${WORKDIR}/build"
> +
> +EXTRA_OEMAKE +=3D 'LDFLAGS=3D"${LDFLAGS}" LFLAGS_STRIP=3D"" O=3D"${B}"'
> +
> +do_compile() {
> +    cd ${S}/CPP/7zip/Bundles/Alone2
> +    oe_runmake --file makefile.gcc
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/7zz ${D}${bindir}/7zz
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5


