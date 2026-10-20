Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6769.1792500854213824262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=dWk0rySA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.74, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKyvqR/4cmo9MDOmSxDfmWqDwxNdc7jPQI8CoQlwo5Wub2IHUSjj1jSDufEJ04x0Ex6FbWGXZAZGnd7BWCcev4WpyHoggkwDgFF9CLfYLlT2IwsVYwx63Xspt9p+Paj4vAWy5OsBAG3skYKeNL6RDBtWdjszhXOu4fEcdcIfvKsONZaMkpg7P5q1D52HgK58Ct+tRgI9Cbv0c181OYkaQ45mPYFLgnLVuTUAPi/EmhkLgnApYNGTorQS4cynPrNXbqfpkhqttnRNtg0NjA+0OPcwvipez00KLAiiqhBm4iA44kKS6dVJ1be9IGMaoQYErqMiKatrVh8EsSIR/1pouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPQp+GD6yvFB7C7QSdtm0jSoj0zDHStWj3qH3/tWV+o=;
 b=MpyCPDHqBvTNbliI0uuhm7dBMcI6buLTy0waMOEUlSM7JEtu+vDHa21PO2JI7DfqQo4F12+qbsFzvIYWHLiYngLXZsQH39mv6xMbzThAYTZeg+bhbzT+b29FeBPrYrqxdgVYJeFae4qXjbt0r/70oyVeF2mYtVXsCym5tH/s9DOgwEqs/7sA6Cas1JfCSfBMaPMita2WpdgTM7LHX1s8cZN3jIKL5Vy8AAPshzXQTaHei3Ady3sXQtylPqfzUL69CsFldfV+EJsZdttDdjDtImEiAB3LDZ01qtdAJAvooDLm9ihW4FEhWqhbi8p3qL85gVmgoCo7WGML3oeN/6y4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPQp+GD6yvFB7C7QSdtm0jSoj0zDHStWj3qH3/tWV+o=;
 b=dWk0rySAQ9bgNWLsWtyQIOFZVtuEct25r7jHtFoNmtW8bIhErT/x2bbw7CQXiqMbqJPnTLux5hDPKHIORt6X10S5bUjHA4enkT4AHh0hNRuaTepDJQrOjoyZ0cJafoCIhHDehSK92fcqM8cr1SgwSP2E5RK9WZn+x96LZy1df5oGsmE1cfnofkksvC5usR6U6JzumT8/jUfKFVwXBMDUedtwXwehrXNiAhNY3X/cq/Pwq03vm1I2HtwbuI3Bi6qo87aNXub7hy0RJd8rRD4rFioN80rfMTXIxr9JJqwcC5JumCSKWtzhtBEdasKU1VNBof8qHz9a76MzO1kN8Lg3fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM9PR06MB7267.eurprd06.prod.outlook.com (2603:10a6:20b:2cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 12:54:09 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:54:09 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] pkcs11-provider: upgrade 1.2 -> 1.3
Date: Tue, 20 Oct 2026 12:53:53 +0000
Message-ID: <20261020125353.1648547-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::12) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM9PR06MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e3ed52-f398-4499-f07e-08df2ea93b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|56012099006|260925021911599003|260925022911599003|260925021311599003|11063799006|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: tBqQHIeTQutAhbWTn4n17Dp+NO+9D9OrNXyB0NK89C/37yFcfx7PtDQWnQJMevT2+Sh2N+tNVrLU3PDsF1siaU3phCgrTEqtpJl5Duhk6EH+drt/FgKGEZhyn1dwQTl1FHn2fADID6CCOgXGShr+104saLV0+sBlIVDMfg7iHO4Zm4Fjw9BwzXcSupCrZbmSvB+bAAyF5dBIoLFR2SGmG1k10GPN1PuUM/6Z9sHvYgqgBfh7IkBL8dqjQPKHOQn7ZYox+g/LgjY3pLNWALEkGeehgRJbyo9GJGbJGpSwl85PDmFLlLXE8v44FH2O85KySMt/6nlAxH2LkyB8MBaEdCgbSO46amWuwXr6aCm0zkgik0vqUfkpjAUR/rn84A7ZLhbDow3KX/gkhJE1UeebKXjltT6XcTScK16nkUL0Bik+7uf30ANzVYZNzFCeEA/iJJUVJW68HOU8AcbF1T6g+zMGolwJPjzNGhPtx5YUU4LnncWxoFacZzTaB3jI42JTSn1lYbfc2WmxrPfHrYB5aZl2Fug4N+7q+fl18it8Ijtbal8/kZz7+vLnf7WsqdfBzEjWUp2cbM5fQCqkY63ZN/dRsCnrzXi71MFGgFKGtGYTemZBGrDyuXLt8HPuNdOr4Aofy1wapgqp5micHqatVxyDtYbeAZGKCmi8rDuyRq2RUX8qP1/0lB0zzTN08ecn72KPbGEnX/9Qlz1rzEfA/r5YLnKtg5JWDb6f6U+ubfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCSFDrjiV4sGM/yc9e8MpMtXQtys3qal3ycYAOhTUuwCG895keEKlyrqLDsX?=
 =?us-ascii?Q?BrYY2EdL2JPNSvQLZN7Sd55bQnXOp6ZGKWUpNQ8dox+lY36T/LcbNyHMpWqq?=
 =?us-ascii?Q?4rSN1i5H4J/kaZ1QPc+QTzBMOuD11rDUwG/swOVStsgyj0uPOC5YUru4/Nib?=
 =?us-ascii?Q?XZ6g6PndQoDz/Fk3JqDt+IsaFTotnhwgwIl864JCq78xjIoFFFCAFwASeYov?=
 =?us-ascii?Q?izXmh32/c0BY+Sh+80yoWM8ZdZn0WqswKuTQ37pZjr+TV2CYJkNVvy49oO6r?=
 =?us-ascii?Q?t5yWKLmFXULgTBX6CZ3LQ7h8Xy46jGm3FTmlsRLxFvYwTXLkcTZBkj9IWTzx?=
 =?us-ascii?Q?RfQ/oidI+ufBavez8jbMQbawpziwcWP3DYpb0FXder+HOa1Y4z8Hc/1clihm?=
 =?us-ascii?Q?TFJuIkosyQ3594WCH+hpMOaRY5kfx9BhXg/v78GmuVxzL6ivgYqQNu1S49RK?=
 =?us-ascii?Q?Pkgym9hCPoX40dVUjf5RK3yUpipVA99prALX/kcSAgli8R12l5QkIlD04DXA?=
 =?us-ascii?Q?0GcUt0Ry5g1C5xOU36B5Wkx0kv4kKxOZowwDqO2Z+aUCuLSbm8dk9N8Asb3b?=
 =?us-ascii?Q?WP76zy7D1/VcxMv91w0lRxesZk+ta9XAFdxQUjgTFbD/wRalVEod8ABUyGB+?=
 =?us-ascii?Q?3f95U4dgXtCKYyTCQ6Xjj1SXB906yhCJkkqsIHp8zOQtHPRqOnRdf0Qk2ola?=
 =?us-ascii?Q?w1zbjkMQW/MtHVQmuOScuZU2HCEuaEVHt8N2LO9jwa1lCGy84PLsPhi6bHOc?=
 =?us-ascii?Q?1mUmsf1pnqyoLs8oRL/j4/nzZJAZZBBM6l7Pj5Sa36qLI22fTFuG58WlifGr?=
 =?us-ascii?Q?V6SJej4gghLnCW0AC84IhdFMJHzNqfsUiw1mI8hIiNLqG6qePbmdVQD0jvb9?=
 =?us-ascii?Q?ODVmZIEMaFK0ErFAvybwwCjbsl1J9lAxjAsDQKJA5HjE+YeIRuP46PJ8Nlt8?=
 =?us-ascii?Q?K4wA+Jva77aR8iJcXwmXNkj+02G64Cx4uIHItO2vplH3HD8loqnLNI38N5Ow?=
 =?us-ascii?Q?rVCF4JaDxstOlYhCAWAvLHPCDsc81YHOFThxilfIiGN7d6fB4KaCKyviEiji?=
 =?us-ascii?Q?ShJlKdVb7QNOjL/SRJeh3/+gp++geo5HJ5dSaqJvL72a4LPam5wjcUQ700Cm?=
 =?us-ascii?Q?ysWRC6ijesWNpkF8fWIPtUNnj0bEtCUza1QZ5Q3VFniLr7cxKSArRIWYhifE?=
 =?us-ascii?Q?gs+w+/128I1f1IYh14+7d9K9CH2fId5Dh8/5JOcMfigQOn4SsqtkFJO3f7i0?=
 =?us-ascii?Q?LyyItTBOHV717p4HvoB6ImjEXHuhrbm2w2xALhrmK+sxtchMNpfKKN3VjqEW?=
 =?us-ascii?Q?OG/JPJB1nNu9x3iP2jTaOnZZkpiL2tydfyKj8Q11uHlfLshyJpouhLsR/oEU?=
 =?us-ascii?Q?gwFrpJ/jdIpJaHSMn+cJ/ShfqtJBAdLnFu+FKOZARUL7BbwALBhe1na9ZiLC?=
 =?us-ascii?Q?4H+BV50FShsYQ1FknMvEvkFviSHBeMPM9yaDXr8KupJIzrS0NIoL3Ab0S7z4?=
 =?us-ascii?Q?X1YPZmivGRI1m0HO6Z9W6cTkC+PwB5+r9pUvg4feaGgYMCB85mbFMCtkPjnz?=
 =?us-ascii?Q?5eqwOnvHVipDBosV0yXjy7AEAd7V9PtTRVzsLT4ATqUyk3ujPx1Oi4LXAsdq?=
 =?us-ascii?Q?y5Q3UXvX4h+yZxWJc/462wPRjwsDNcGptqhs2iD4R4XTpwkzONFfXXl9CJaO?=
 =?us-ascii?Q?fV1E4DbehKMYlmViecCAHVNEQ/ExTE7fuWa2bco1LlODzxKnPiiP7zZ4YvpD?=
 =?us-ascii?Q?ZCN7G31FxA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e3ed52-f398-4499-f07e-08df2ea93b85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 12:54:09.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8htdRDE2dECRw4c+sN7Dgk2+IBuDWDYetjS5CGsCuyXsk+Ws6/7dxJMa+G1W2Jtl1cqGcodMOs37pcjk2LzwSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7267
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131173
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/openssl-projects/pkcs11-provider/releases/tag=
/v1.3.0

Also drop patch which is now incorporated in the new version.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...-Fix-i686-build-failures-in-cipher.c.patch | 62 -------------------
 ...provider_1.2.bb =3D> pkcs11-provider_1.3.bb} |  4 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-=
i686-build-failures-in-cipher.c.patch
 rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_1.2.bb =3D=
> pkcs11-provider_1.3.bb} (87%)

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
similarity index 87%
rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
index d95706d9e3..8571be374a 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
@@ -15,12 +15,10 @@ DEPENDS =3D "\
     p11-kit \
 "
=20
-SRCREV =3D "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
+SRCREV =3D "b55b94344af87a058fd84d6e15390760a5585b1d"
=20
 SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
=20
-SRC_URI +=3D "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
-
 inherit meson pkgconfig
=20
 # Overwrite default pkcs11 module path
--=20
2.47.3

