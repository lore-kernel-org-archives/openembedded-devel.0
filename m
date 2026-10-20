Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.109])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7895.1792504148947707967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=tqqtVIpo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.84.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnXdu3dSRoG6XeZ1ReAZrQ6fy3VPpugaCtucvNO0YXrM/CDyGgMHtW1gTeIVf98QB50F0lyHQsDYO5qR6Q46uOmXniG0TtPY1NVJP1t9ICKMUsMnum4v7D7/qkfYXTdvPEi4CqDCzTNJjFl4y9MJZFKFhj52NBJpi6LqBgG+jnE/vSojPAvRE3QRk7ndiA8YZrXrNa88AMKQygW4+WUfzHpTxw3kMtJdeeeivbDP0iA84zNxUxqm76NHdlV/YoZ0g5pwzKphuQEThgOPLbP+UqlvQmmPl98Bknxz3TzDO/Wtwsg+aFmOsMg4Y81BU1lwLUrer3DNdj2nfOANlHy/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDmnZ5lWu876Zh/TVjuKRcS91t4G4/aHh8ykbK+V+LY=;
 b=Xd4TR6OhFY6gqw4+UCQkeDpRP3frqvxpOBd0aTQt/5zof3AT9amZjleMMtcnlr1B+cH4fGrL/UHXh3IKOzCtZqCKFewjadYcb9uwh3KM7b599tvnbyid8PsT1uzLCBe5sKI1jTZ7qopC0yULRy2EXc4RzlOF+8H0+HKzh3K3ADhig+qVedjp8aYRncgZph6ZUHijkL8WzEh70Hwrtmjm2g0/d3RDRvOh/jzRt2JIZyawNd9kjUMDSgmf729vpoLQXt7+Ot+LMsRuOs3Kas02Fy7+lMKi1WI32Fei2rDhpDvOKMndlVq7G19qtRUof+xfDRJwSF9Nu500J2HqCVv73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDmnZ5lWu876Zh/TVjuKRcS91t4G4/aHh8ykbK+V+LY=;
 b=tqqtVIpoD6oRTAYUvwo81xL9lyahov+CUuuBNZEIvJQp7Lq8dSzD0Z2aiChxklcVrqKrCieMSFWU87956kNo77ZrDZZJv+CUiL5lvVA3N/8rcr9BSLwYmsV7rvyNw6XzTQba0KfKAAQyhuwWsiiPt2F4bL361M9IoJSJ7I/69x6+GRAfIfhOJI1Zs1/pLjHmc1PN34sLdgOIA3EgQcJe/SR/njNeUZZ6zOODGoQBD0cQ3hC55qziO+KuDL1xuyE0llcS4X/lfNf4WSFk36HTAyMiiPcno0zu6DynI6jxnHNb/fXaLMz2HKq/leoGp0FG1j5feGZhyq2aY70mEanPSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB8149.eurprd06.prod.outlook.com (2603:10a6:20b:3d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 13:49:04 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:49:04 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2] pkcs11-provider: upgrade 1.2 -> 1.3
Date: Tue, 20 Oct 2026 13:48:52 +0000
Message-ID: <20261020134852.1679078-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF0005F6A1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::129) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AS8PR06MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b951754-85be-4985-7503-08df2eb0e774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|261009223027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|3023799007|6133799003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: WFqdjX1YwTQS7gXhL9Xc539gd4Y6ZFVpc9BPemWFmzeBIJzOJxdP0HRimDR/WMjQC4bbxJ9BuVMn69cPhQhoQZDDf8S0Ud9YLvrJNq4IJ1tb0ul91Es2ieVt5lM2Krap3+1DN2eYh42yl/rw07Wb1Z6+wcKCBUWUNUFy+Fvx5iE10SxeQVlCNG+DqGpXFOQvgworfeXAjUgsVfr2Z5UkyQswr7Vr9JcMgMwGOjpBXMqUN9WntmiYKYvxqvM326W+WYqeJfTPyFz6ulWdJWkekLK+6YNAbMNIcpUUZVEFYrwj/4VUrUn6cqzgG+C48rgVcr/KGOqXmxUtjmFGOoAQaHY46E/sqwaw9FWBpzKptt7QC4cS7sGRNTL16iAOhhHFiLCBSUhI9FJtM8I2gvgQ9vq2EwYcGwOy05zWavRN3WUYlYmkWwHsQmfPbVz4/4bcYPzxtUsF1/D59kHrlnqzAQVsgXVYB2z/rHWGsE+m97KIzNNPWUOx9dUULPv02WSnZz6ihX7bApxFcHG6zgHZbk5uuIJbkv5yJ7/TENeLDmdo+zoVZ0R/S5JXOB34+z8OOxUo9XpRFFtHMVEhsQLudUCU6yUtATOhHIcYOSnhAGF0ZcppV73aHjpZkKjyMM575BjM+YIy0ns7sA2LgO12alW+Q6S6OO462530/IbduZRsA2aTtTVBjirZtXlnGhfeeOS+KMCmc13qls0OvzCmXRszIo3AOk21wlUHcVmFEqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hf2gvP3KeBqHqR2HaX+ioQou0xPEeow7q6s8n8rz8KcbaPXz87VSYXmXhpiL?=
 =?us-ascii?Q?aOjFpW/w6lBbXANYIrwHdNcwyv7WWxaQ63JJhZ9gJl3aOECVQ0yQV9vYdAoQ?=
 =?us-ascii?Q?FXcKOmiLpJSzE9XH+ARhWFcWRP5RPgqE/9QT/XloK2c7U7dPQbXPlsUn9wQm?=
 =?us-ascii?Q?4TYqYJQnl532X5P+f77XDE5324C2i7GD7EGedTC7YVeSv4cQ8cZcKB1REC51?=
 =?us-ascii?Q?tieiKnRw9ii9wS546QciWIGjzmvlvier2UiQDpfFPB7W0J2yEfYV7lb0m59H?=
 =?us-ascii?Q?LvEfpP8Tgr2oX8FWzEoX724fKhC/araZO7wLifJkxIVxT1HTozo1q3WTiI64?=
 =?us-ascii?Q?cWo9HWABMeynZ1NAqJkzcgEyg6OlItFjyvbzhTORA2N3mUSPT3J2dfcWvQdF?=
 =?us-ascii?Q?23MzuMx948+aBNxUioHdAB2MCmTagttL0UUlGyeEjl25N/LrxBF1A7h13Ezb?=
 =?us-ascii?Q?D7CH/RIAUmSC/y/o/ekFpOmrvFqlDi8sxEt3rJ8lUZpAgcwECkU9oMhYbJR/?=
 =?us-ascii?Q?/nMxcn63eD33u/RYC3TTyvReLrGfGf+6RJj8dnrnNO6mjBXz76475Fmj8TnZ?=
 =?us-ascii?Q?0wI/uv2zkmJNknLdaH6YQ3AKZdaU9lxZaNXhhXkQ9NALETmz4uinv9yrtx7d?=
 =?us-ascii?Q?wLgGTDOcalKd9a3Wsrkt26e6gcuwQqT2TGjZQKMZ76N3QbFd+e9+zkOHIZy3?=
 =?us-ascii?Q?DB9gVqe8yi+djm7MfZz7E8ObApb5TG4umFiSf9TSK9cWIHDpmPiS/vkWwKDY?=
 =?us-ascii?Q?vVjjznENLppa5c7vrPHqm00iuUsLve/2OlpMUZ+ga8EQJbCWrQP+uNw3kt2k?=
 =?us-ascii?Q?0dfw3MzmGU9SfmdqSN+9pcPxx0QGVwofkt2gq2q1V4dZC0HQUkfPxFNfhwmx?=
 =?us-ascii?Q?WcdntA1PwxeCKdzgVUrvw9aeYkDKbssn3uXsVyHZ7bVbXDS3QES/wnuNt5zx?=
 =?us-ascii?Q?I0ZJ0RWwfdShdIC2ZURnSHHaYViKbPB2y/2JXvM2cj0nrJe3YMoyd+C68D4L?=
 =?us-ascii?Q?9kPy6bHrCflvLh87a7y1hwwJ2Q9RwOauykXpTdZCIiygCSE6eN8ZMhPwQz1K?=
 =?us-ascii?Q?n3BPE0c0+GvVSqW0tx2JN7EVFEYm1LeGxF1LrxhnjJ+Bqio1lVQpgb6AypRz?=
 =?us-ascii?Q?s6K4WjO/+vBLSu23zhZRqNtKEEzOVL0T/bG/U2QBUxfwtSOOwmp9rKqNBQSc?=
 =?us-ascii?Q?ONgUQFqoM51nE4/AUg8uwOCv4H9nkLZfzIxs9yw/WMrZPJwm1fBT7/8P3L8y?=
 =?us-ascii?Q?h7UKt1674SG7JsIsyhVBFpIDAHIoSuuZuLk72szecS3eGIqJX7Untw7G3onA?=
 =?us-ascii?Q?+sXTtLBW5DEgkb7u8OxTK3bkG93ElIZ3carjfYINQKk9OaHbvX7jM4gFwG8L?=
 =?us-ascii?Q?QJ8dBazuemruxVaL/n68on545VFvOhpW/peyyxSQvKEy9kQsI4yTQFBbdIcd?=
 =?us-ascii?Q?+mZdJasCGmd7YoGmG5lBktBm5NrkdYEvjR5g98oJlFVQ/A6nFzWmyJFDSr3n?=
 =?us-ascii?Q?K76SOzO0jeXpRWbXudAZprdAdyfyBR0LM33tB0BeScWx8vkDSwoqMsNmndQ4?=
 =?us-ascii?Q?4Tv8AhapZ0PT8IwtFAJoFtHyr9UlTmsMV3jq7aUXgc4cb5J5ZZZ+YO+G8Ykh?=
 =?us-ascii?Q?8GhuUlFjdik8HQPUEZo86qMCoXVa9yAvoCp6Bn6BNTxGdW1ei6UGqneJZkXQ?=
 =?us-ascii?Q?M+J/NKX0LEdEtM9Ug8R4D1SB5yICSlhbVyi5QlgicHRLIUbpOjBgqYA34Rra?=
 =?us-ascii?Q?3B6NvaOm/g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b951754-85be-4985-7503-08df2eb0e774
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:49:04.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lU/weP0i2PZRyF92d08owt9r90Q/bGnATM2lVr/WD0B5CeclZvJwg0jzlTFGl4Ck/ymupwN/sKbHPDMsmOzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 13:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131174
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/openssl-projects/pkcs11-provider/releases/tag=
/v1.3.0

Here we also drop patch which is now incorporated in the new version,
and align the SRC_URI and HOMEPAGE to match the updated GitHub
organization for the component.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...-Fix-i686-build-failures-in-cipher.c.patch | 62 -------------------
 ...provider_1.2.bb =3D> pkcs11-provider_1.3.bb} |  8 +--
 2 files changed, 3 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-=
i686-build-failures-in-cipher.c.patch
 rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_1.2.bb =3D=
> pkcs11-provider_1.3.bb} (73%)

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
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
similarity index 73%
rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
index d95706d9e3..f7936d3756 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
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
otocol=3Dhttps"
=20
 inherit meson pkgconfig
=20
--=20
2.47.3

