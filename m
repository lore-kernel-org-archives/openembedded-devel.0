Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.107])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6236.1792568710469694684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=CLZdc+VF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.107, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah5uuonGtaM20EpGbV4aO3NYBgqcNxnrxWobR7QPv5qy3IoYvpvc7GosOi6uctiyOtXmRDoiwknXGA03+N8+rRcjWahoZzSpTVN6v1ViXC3V7AoG5RN1CaGK/ZU9HLXi29c1dIW0A8GEXcqT7QoUR8wHxis22JL67aXHJxXeACu71i9mU4QZN+aPJ+BIxpJK/eEh/6m5iUZlTSlNgvG1vRbO6gj6bGexNSpA2onNzP9J/sbXpV9Xid+zqWUCEspvg5lrjELoFirrajkESWrv0d6rzYurnTmSDAOBHCc4daII52POlet1qgrOSkODLR9zap4nHvoN1mWj5fBnlGcH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvtE1uqzxrqr/qUM60zSMZZhksZVGl+rkY4I0MXU9Gs=;
 b=Ss0StlOtCJsjVF5A+Z4h8o92C8yRrvaVmX9ruh4/vHRQjqNKJV264b8LfRXF9gIo2X2SSCucuXZkDWx8773BrhFuDmdC5AwwiKuUJ5YNSMO0E9H8cu3OB/xNoH4J2ruPRdyvAPLjGpR3IIvSLR6DOwEXHmx69sMX10GyxJYTppKOC5X/cFU1oh5E4qV8iT7sBZq+cDXDzCQn+CNndfwG+JCGqzQan6UgjGG40G4oLqAe+VtFN/4GnpuwbapR4zTQg4IG275wHNuQpewujuKyxTD0kJIyjxqDWW4hz5ct9GhfWRJSRnFy3uYa8lzeqgyPXWoN9f3EYkENAJfD+dAFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvtE1uqzxrqr/qUM60zSMZZhksZVGl+rkY4I0MXU9Gs=;
 b=CLZdc+VF924Am7eUPEik4EYgHLY7/VkGIGR4nGhCKhMHIaTF7vIqQB2zVNQk9gz8v0xbCy3WRnSNFkhtWos01OwDjFyP8650SwIFc6lUOeZwdEccPcq4mYW0huL+mlh6d3sxHix8yx/APzEw1KZL+NhBGyyq/TiO+hiMbjZiCkONdbmiIRimK8n3nrLGqujo40JywUUzt+X5204/nIrRcdib3IyZBmgz+xYVW2Lomb5nDKl2AufpQsfMLZSVoZAds+oH3MjHOYYNlwmS0x3c5wZQKwAiygiFZkhKDUoW3vm8JMgI8Wz78B8RhzFjyR5YJEpLzXU/V7fKMxos9lwZYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB8197.eurprd06.prod.outlook.com (2603:10a6:20b:3c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 07:45:05 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 07:45:04 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: ankur.tyagi85@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3] pkcs11-provider: upgrade 1.2 -> 1.3.0
Date: Wed, 21 Oct 2026 07:44:35 +0000
Message-ID: <20261021074435.2309360-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OS6P279CA0054.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:31::12) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AS8PR06MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: cad9d229-02c3-4a7e-4aa2-08df2f473884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|3023799007|260925021311599003|260925022911599003|260925021911599003|261009223027099003|10067099003|56012099006|6133799003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: tvC9MFMmnYGJZbiQfcIXqHjViTWW8U+eminweyyQKfQjOI3Ba5mOq3/J5nMWo1GmNmsX2PLk9TkbUs6vivTWaJZITkGpF93prqwqe84F7Pt4sQhlSvwS7eSD3RlGOtxXTDaiuR2ITIUA7A3eLnocqFFgqYDw0SHLQYcldFl4MXbVW6IZn0qwFjrCeCxgzd1iO2kDn1pJHbq1WZk/I1YJJ8r5BTB4VaR0IfctGVDAV123Ypm2hE7EsVvqYRM5KSTuguWNB0SyTh55aEkuHlJRoUKR9RDmsZDG0Xg4l9IjcVhtBDQyqOpao5o8oh/pFw2t7JKRpCQnrOutZj4tOjMLTNv1sPVUag/aWO1jHspQ06Xs0dWf4990jmDvQBAWtC+wdS6Yv5kItIn6Midb+xaGZFOgqx/vGHmxUiNUOpZo5Xd7LBuUFqGhgT0CNUFrn3m9W0RHRGeCwmy4LNlLGJb/LT7vpD3KkXSIU8nflHNcRe/n9q+6LKf2Mp+iMWQ6taIN/Tk5eP27T0r4TJ3uP4ItW13InxsPdBDa4pbeNOgbhiCkjAUuQF5j/s/qreoVIrgneJgsK5dnTqMzR74O/Q9l0x/ne71nCUc/jV+h5SBjoNqLgGq/lwOEsicLOt9bJlT8Xek0EiKWdgcx1XkzmWhRN1HgYzVdOPVxpVJxKZAF/5nawc752XPfTJx6faeqj3j0maG/1mR3/xsGNkDfwmkQejEuzaommlJkt0b5lVsQXSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(3023799007)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?494uHnMmIqm7FU3/KOOj31Nl0eqN2OMd01WQNU+LYmF1aAZpoccCY7n9015L?=
 =?us-ascii?Q?r/vgVtEfe7qMC9DkawtamzHOZEd8TMrdvkEqlWeZfW0MMXVvx03bMT+l/ENN?=
 =?us-ascii?Q?tMMzfoFqwWUw1uE/agih9vSrH7nNM8bcxioBHN6HlNc8EhdG8QQpTOTWIQNv?=
 =?us-ascii?Q?uuJPCFNcqZMcD6dXMghhom6J9Qs/feqvPkohDV1FtNF7Bw9C5Ktsdiuez6Tt?=
 =?us-ascii?Q?/aJuBxnTUBMlybrzs8t2Oe+k0csaXSdqklMzhLG1Ra3DhNZFn3YQGDb+RrRb?=
 =?us-ascii?Q?0++iqw/+2f9UNzQ65rBqzf0i44UaKL6Gp/PKpd1eDeXGcaWqHSTuvsJnhK8T?=
 =?us-ascii?Q?3m56BcgOT1AdW84nsGgwQzDm8vN5lcUZkRXNAZ4go/oS2zJeM/8nNi2ddIxh?=
 =?us-ascii?Q?9AaSb2iNtaeKaT6ST+fgZ3W+IKXsMB0F1qgEH0kFTK857fY1Agh+oR/Uvw/R?=
 =?us-ascii?Q?eCPKIvrFFaUfHDNMxC96VKCZtm1eMzQNZ2oDsssp0krZyRmOGHteiUDCx6Qs?=
 =?us-ascii?Q?hLJFHbCNCAKtEMKi4uPmGJPKJkZuJUCswGu+TZchPNakSLqDQMjacbxaBpYJ?=
 =?us-ascii?Q?NGNwG9d7sngfhDYXgYLRxs1CSNcniDLSXfXxlUg6brSEwLAc7xeZUZVM7m7L?=
 =?us-ascii?Q?lp6UTwB0Kf144gl1D3Fdm6c5gFqjDO9B2cBx3ghS2vfJpQJnROQv96/AMmA5?=
 =?us-ascii?Q?M+mPtTdJtiNtYc9NYYwf2e1FMVcUhlMX/5rwMK4aXPvePbvHrld0wt4ifkcu?=
 =?us-ascii?Q?pr5C2ZxjLTWIvoVQ4O7APCa7MgSRk79aqtuvuO/d46RbW1hLro5ogCBEtguY?=
 =?us-ascii?Q?fbOzEoVGhLNr4JuIKafvj3enCU/ZW1pnQxnJ9y6IGAKwwhWjo2NMKc72xYpx?=
 =?us-ascii?Q?QTl3TU5Br72uuQMqFkv0j8+u45qDWAIuzbQZKLu1qRfQ0XCRsPgY3lR2M+ks?=
 =?us-ascii?Q?3+Znc0Z8VmQjS98vm6pFGD5trw8fI7B8NRM9+D+Tmh+Il880/MCWp8jyn/uG?=
 =?us-ascii?Q?IgXSRnxKUY9U0CjY7Get/IO/NWRkh9jEUN1p0sDZVZDffbqdawi+C/f/ThLQ?=
 =?us-ascii?Q?V2bF0BfkznHHdVGG++1HkbY/N/HPhK+nLLnmSrmZBUkxIIKZSjOOZtYOPzNb?=
 =?us-ascii?Q?bd1Oq9RGrEjDCWzNsE+oqIp1lZR4/DwSPvena+ATXRZxevH+/yVzRBRSCbtG?=
 =?us-ascii?Q?rikJDrn3eQbEtv1NNKg1Wb0fdOAfx72p0VWhUPfkGUzsY7g4+Qa/a5ab0Jrw?=
 =?us-ascii?Q?xp+l/DxJ8+vM18OG0WHtukl8jQi8Defyq5s2z23zJtFmc/71yZdALFBCcteT?=
 =?us-ascii?Q?CbGrByRz4nFf0UO+/5tIb+5Ue6Z0c4OF+a6cMJn08JMny3eqtitHU1/E92Qo?=
 =?us-ascii?Q?grxxjLrgLXNwwNP06rixDX+/WorQQHv8XmNjaasE/aO5Z71jROYskyXx6nqV?=
 =?us-ascii?Q?bhxwT4IrK1GF47fCpV4N1lgbeZs3+t4aArim7Ec8drxtcI5klMTo9inKLRoj?=
 =?us-ascii?Q?I7ypXew3AwWH5prB3gMgzmAm8O3OWvABYgxiRMRUCCAxcNRtiTLpjQ/wxApp?=
 =?us-ascii?Q?8nT1Y4lwiUMvN69kvrm866rmVfEXpePyxiY3G13eSzHGm38BUf4jXYxceNE+?=
 =?us-ascii?Q?yuP9qY4xZ8MaqBahtHfF+ILfDx1fitrkUhWFXSZO7WjUfGTWPpPh0bsNcY2Y?=
 =?us-ascii?Q?3uU7sFksmKMS1sqIHlWy7GqOFyNpZaTedG2LTNYC7QfKcenUw7vqkrLvIZye?=
 =?us-ascii?Q?D4bGWl+r6Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad9d229-02c3-4a7e-4aa2-08df2f473884
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:45:04.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I3RqzEKcex/NQ2YfQ/Fw60C7nvxgK4eenA2uutGrgtHhKGztrMNI1nl54Bvo/oYoeRjNXVZLzGsJVcWhx6B/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8197
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 07:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131184
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/openssl-projects/pkcs11-provider/releases/tag=
/v1.3.0

Here we also drop patch which is now incorporated in the new version,
and align the SRC_URI and HOMEPAGE to match the updated GitHub
organization for the component.

The recipe version numbering is also matched to the upstream scheme
which changed to Major.Minor.Patch since 1.1.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...-Fix-i686-build-failures-in-cipher.c.patch | 62 -------------------
 ...ovider_1.2.bb =3D> pkcs11-provider_1.3.0.bb} |  8 +--
 2 files changed, 3 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-=
i686-build-failures-in-cipher.c.patch
 rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_1.2.bb =3D=
> pkcs11-provider_1.3.0.bb} (73%)

diff --git a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-bu=
ild-failures-in-cipher.c.patch b/meta-oe/recipes-support/pkcs11-provider/fi=
les/0001-Fix-i686-build-failures-in-cipher.c.patch
deleted file mode 100644
index 479608b8f3..0000000000
--- a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-fai=
lures-in-cipher.c.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From aec4fe7e3c4d18cd5d0f98168df5884a141c6b69 Mon Sep 17 00:00:00 2001
-From: Simo Sorce <simo@redhat.com>
-Date: Thu, 19 Feb 2026 16:08:56 -0500
-Subject: [PATCH] Fix i686 build failures in cipher.c
-
-Update AEAD functions to use CK_ULONG pointers for lengths and
-introduce a temporary size_t variable for OSSL_PARAM calls. This
-corrects pointer type mismatches that caused build failures in
-Fedora Rawhide i686 scratch builds.
-
-Upstream-Status: Backport [aec4fe7e3c4d18cd5d0f98168df5884a141c6b69]
-
-Signed-off-by: Simo Sorce <simo@redhat.com>
----
- src/cipher.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/cipher.c b/src/cipher.c
-index faaa51b..4ccd3ad 100644
---- a/src/cipher.c
-+++ b/src/cipher.c
-@@ -867,7 +867,7 @@ static CK_RV tls_aead_get_data(CK_MECHANISM_PTR mech, =
data_buffer *explicitiv,
-=20
- static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
-                           const unsigned char **in, size_t *inl,
--                          unsigned char **out, size_t *outl)
-+                          unsigned char **out, CK_ULONG *outl)
- {
-     data_buffer iv =3D { 0 };
-     data_buffer tag =3D { 0 };
-@@ -906,7 +906,7 @@ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *c=
ctx,
- }
-=20
- static CK_RV tls_post_aead(struct p11prov_cipher_ctx *cctx, unsigned char=
 *out,
--                           size_t *outl)
-+                           CK_ULONG *outl)
- {
-     data_buffer explicitiv =3D { 0 };
-     data_buffer tag =3D { 0 };
-@@ -1475,15 +1475,16 @@ static int p11prov_common_set_ctx_params(void *vct=
x, const OSSL_PARAM params[])
-                 return RET_OSSL_ERR;
-             }
-=20
--            int ret =3D OSSL_PARAM_get_octet_string(
--                p, (void **)&gcm->pIv, gcm->ulIvLen, &gcm->ulIvFixedBits)=
;
-+            size_t iv_size;
-+            int ret =3D OSSL_PARAM_get_octet_string(p, (void **)&gcm->pIv=
,
-+                                                  gcm->ulIvLen, &iv_size)=
;
-             if (ret !=3D RET_OSSL_OK || gcm->pIv =3D=3D NULL) {
-                 P11PROV_raise(ctx->provctx, CKR_HOST_MEMORY,
-                               "Memory allocation failed");
-                 return RET_OSSL_ERR;
-             }
-=20
--            gcm->ulIvFixedBits =3D BYTES_TO_BITS(gcm->ulIvFixedBits);
-+            gcm->ulIvFixedBits =3D BYTES_TO_BITS(iv_size);
-             gcm->ivGenerator =3D CKG_GENERATE_COUNTER;
-         } else {
-             P11PROV_raise(ctx->provctx, CKR_MECHANISM_PARAM_INVALID,
---=20
-2.47.3
-
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb=
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
similarity index 73%
rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
index d95706d9e3..e2ad7e7bad 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
@@ -6,7 +6,7 @@ the PKCS#11 Cryptographic Token Interface\
 This code targets version 3.1 of the interface but should be backwards \
 compatible to previous versions as well.\
 "
-HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
+HOMEPAGE =3D "https://github.com/openssl-projects/pkcs11-provider"
 SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2d4=
5"
@@ -15,11 +15,9 @@ DEPENDS =3D "\
     p11-kit \
 "
=20
-SRCREV =3D "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
+SRCREV =3D "b55b94344af87a058fd84d6e15390760a5585b1d"
=20
-SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
-
-SRC_URI +=3D "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
+SRC_URI =3D "git://github.com/openssl-projects/${BPN}.git;branch=3Dmain;pr=
otocol=3Dhttps;tag=3Dv${PV}"
=20
 inherit meson pkgconfig
=20
--=20
2.47.3

