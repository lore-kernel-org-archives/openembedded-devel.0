Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A43C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:42 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1787.1787856812482800774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KBkLAZHL;
 spf=pass (domain: est.tech, ip: 52.101.70.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIFUxrGWmbGU6qn1zjEUW6tiwP7ULqJOrtwQlAG1NNp6cid9U8oQE29esCvndccx1fHq7Gu226mC5tTCfGTi1K7EKH2ZrbVxfC8dacaYzsoT2lIwVMPhUSxgvICGdfsvcKRaH8yw15QeZreOisWEVvmUgED1UBWOKqD0amryBAtsYmyPmLA8aOwReHGg1mp1c+rPUDbkGaZlxAjFjFsO8V0VW+fIH9gDkrTS5gwi6VVpMLU9VRCOJbNZ7a1mV8X1SZGnAqirnsslOETcvWpsMenHIugzAVDGzdhY83r65zCsqo42NNdu9p6Uebnl8N69/vPqTs0j2jA+Lpy7mpbV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RNk13OQ7BJvXXUbBozaZ+5BdguAywn18UpaEgV8T+4=;
 b=RuQWXEd6ePPweIptTXfMpQdVyyxcD+3QKiyd1BjFTLMxIHYc4/HsN2OHHVVR7g7NH5vOEB3i8W/+HxnCJPLouk43lt48nqk3ZsUX39migV/WtzJH5BQHGXGvO/dO03YTfDM+Uki99dA0s68dHjGb5SO44oo1hmwBEHRzDVoZQVwduk7pfh2LKzhZjpeOuO7ekRXSloINOgBWrVMBfLJeY2b5nzFOOcJir+khc9FwfKe+5mw641Lbj5wzmkMuRXRYsnhWnN3BseyIkHbeRlgUL2gJ254XxKtzBiZYjSazYQiGMuurclbBGudExmHwX5+ba1+Yhrmk1h94eS+MeOzDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RNk13OQ7BJvXXUbBozaZ+5BdguAywn18UpaEgV8T+4=;
 b=KBkLAZHLw1rSkg39l559mr6Ows5j+OZlwCXLTWPwRhnk7lxwVnsMDrLUjLmmSApW8dAWxwnA9AqupL9RHUUs9QONEiygPCOYkol/dhDM+82l4myh4FL8JH4PtpfbbgvXgNlhc/s3r1cF1m8dISrEr0eFjG5jY0YVvxVEUeq0QfvcxqEgXg9JPwYhOJRLMmY9Crh+080v0LjSpZXU89+JWoJo7Wbj6ScI0Aj9fFgy7mC4TYB7sCHfz0itdyBuIN9gLhqpiH9Rjxa6AaV0Bv4zS24tH+1d6fsQXJdqbX2if8WkeCEU5/t4yOFpMIqmFWfBuioJopjGzG/9J+4oeId4KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA2P189MB2706.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:424::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:31 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 02/20] krb5: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:06 +0200
Message-ID: <20260827185324.78997-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA2P189MB2706:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd2597f-34c1-4d8a-c973-08df046c7d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|29003799003|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|25016099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	ubjfI+IFbXYqq79hLMJ2RiKMx+td59QWdlb+rZFFX2xnPndBBDnhtTP5fFJhBfTeHHQEDxaXf6/wPGrDM6IYLI8ZsOLf9zQKGu68WuQyM8IDWZLVq8Lp7vC0nSeTrp14JHLpWTyODl70g9IBc7DwCcvqDGNB7q4XL5Ot7aB/bYfcP5qUkOy+eaj48/0IuLEJ/yxrYhzcle6v3X6f643yuVFg1XgNeYxprQUO+C8h3NbpZrcjgaMTqctOX9DMqP9zrxpZGSInMa4F2Zy/E6rmnZzyvRICDLZWtK7FHbwE+edk2trqnHcwREKJjSauTfgsthIy1rYGTh7dQIyPq0o5QFW8uuF0aFKvIIHxEtJEyChRlsVqiJDpHPSQtg+N7TWXiAUu24z3WOZ/MVwPWuKZQwy1dwgjFjcZGnCetbhDiAMz8cPcixswuIqnNvUNfxxscyKYhzZHqzaBJSBYy21H9BwnFjHBka85czFI+qA3eCuNOqkyUYSimL6zg7ViAqE1uCgfafLo7r8kyfoSyHSQrtY8rxFCgCSRUCOS0Z4ANAFuj0BA4FqojwYnxxzahAvUl3oxb9kP7eD5h0G50J8r2S4+GTeLTFXWZK+2SI0IOabOLFPn7GVKZpr7f/qI8MYpBppNemXXdi6kHHQKcowe1SkDfnwqKZejIJ7MM4Bbv2A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(29003799003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(25016099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GHkU3fPdsIv3PizN6YFIMNuVLx7VGIx8FTMI4sOMQGJ2AthAqMpKUXH+RzAI?=
 =?us-ascii?Q?KbJ8GlMgKsUoKT7r4XRvOr6Tf1TGy8/vJreRaIQbtj7JDCWjJ1ORAMz09RRW?=
 =?us-ascii?Q?KJ37DXg6V4DT9qkwNIZAPRvBffhEvd2MX3O2CEcKio2aPFcwIOhrVFw2M/5Y?=
 =?us-ascii?Q?tRamGOIGU4jkT2pMTVr6z4h1WkvrjadJHPzUM6fQIcq36Pmzg0yhCqVFmArV?=
 =?us-ascii?Q?Xe22ong7Z/QlIVO6zJZ903w1+L0mc3DHZBDstRAZXCtXz/H6nKfkP+7ee+tx?=
 =?us-ascii?Q?vWIG4FhGiCHC8nN52/9LlyFolbCH8SiHdEkzLTpDXD4cg854CqWg00TqDTfy?=
 =?us-ascii?Q?gbfoL+sXF4HxRcITKDORgyj9F+8bInKmIt1VwQHCSPjLaiB4UXdZHzjb/ViE?=
 =?us-ascii?Q?3jCctcYED++jNdkoZb3g5S5E6CPPPkihUFaGtT5hKnc+tU8vA4PE8EMqjk98?=
 =?us-ascii?Q?AFQz8s8UXKjP2fLt2fZY6Dup89ILuKbUcdOgiMRUmRfQxNKL2tdyhw2w5MlC?=
 =?us-ascii?Q?3+o3uVgemI64j3YkRGCjpMCGxlwfbq5bauVzqZ3jncVDJS6OSMI5hoKlJyCw?=
 =?us-ascii?Q?3XK/t2sSSF3hGwVgvGkJCoS8TL8dCMyxoERajQi+8rKIFWaVbQvxMffyWVqZ?=
 =?us-ascii?Q?Hgk2Ckf+Dg3dWw8vmGoiiUAO8ypeFxDLVoYVLCri7wCx2LV/3c6dSY7RuEOd?=
 =?us-ascii?Q?f2IINGZmwV+hO43rVxjprGgFfLRPhxUHbKaHTmNSfsV3PSLtoXyvhrJtOn1m?=
 =?us-ascii?Q?7L+OWCnrkPIK24VfIfL1TwRCbXWZVjdCG0eZ/3ne2CeUYxUo0js0M4fzyshm?=
 =?us-ascii?Q?Od2pm5B0w2RcHf3L9Qdjz6UmPx/K74LBYRuUkeFMgDHlp0pIxkIOQhhPNs7c?=
 =?us-ascii?Q?nBYiEyGfbbBb3N8dYAERq+1Igstju55zdID3I3Wr3QrQDHI1sMiS+LXeZZcq?=
 =?us-ascii?Q?Zraih9UEe87/FNqYk3lM5+t7kT61Dq9OCR4b2+7Eqd8pbm/hiQKdZsVK9HQI?=
 =?us-ascii?Q?MgkEms6mBbggm8wSGPboGt6Uufr8M90kA7dOA5ujHz07tLeOXAFgZEU4r9RX?=
 =?us-ascii?Q?aSRLZNK80HPN3Vk5cs4VI4Hf0P0CYnvBKYozxfaqbQTpYq2QlL/5GfpIb+nj?=
 =?us-ascii?Q?Urt4P1y7o6u27nZCsMxXvuvRi+kGlHjl+h4KaMvOX0KpVvUXFUcwNZEUnFK2?=
 =?us-ascii?Q?LbHIlAVAvKlTy0bgH7+82+YLOt7Vld+37RmWxRMebmn4VK6BPwF2B8hoA0+2?=
 =?us-ascii?Q?7NFZNF8OXyXfjXOP5mGYoDKFag+l4XjQ3wEm9b1CwnwYLDlHFU9v+SDhu0ye?=
 =?us-ascii?Q?5gkGSBYBA8CJdrpZNBPRu7YsUZ2qmRpJSzqOAbk/2h1PBMaPJiL3nHYph63n?=
 =?us-ascii?Q?NO41SNb8UJoc4vFyayY8ExXhAsh8cjtWX0vQLbxMbJmzDFwPVtgkXyI1VnCB?=
 =?us-ascii?Q?lsGd4f8bPl4acH35Ah0F4fkspn/Hr5FmS8Yt6hRh+CDKHsD1nu20jvqs5bzH?=
 =?us-ascii?Q?kCiYsfZBv77arlSDeICLPL/32LVISRYkAz39fqLP51He1367eHZMolLDYsPT?=
 =?us-ascii?Q?M4GhKkMuzvPZQMZIg6zx259uibafeMDw/zxEAREmqj8iJauylQhlT51LSgmM?=
 =?us-ascii?Q?FSKug8HR4VgbEYUwssqMi+yvGDIfyCKlnGhZgzHx79o0LX1Ioo7Fa8ay9mzV?=
 =?us-ascii?Q?SbMQRIGbUXY07xeQ9zmRjLD5G8HStsP/siWdpdcmV8E0Yb8RMc1Zm80oVll9?=
 =?us-ascii?Q?PH1EYYZSaTqz9OeFQulz+S2Cnbe0HDnidT9jjsks9AHMwPf5VFzP7O8FdpJ4?=
X-MS-Exchange-AntiSpam-MessageData-1: +i54FZLPf6hDX6JM5dWAqvNxWspvWQoNE70=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd2597f-34c1-4d8a-c973-08df046c7d6f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:31.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai3htFf9DM1uwJMKYHhohAGOK05PtCrub1IOOwAZkp0uybjZJhngAoqNXMlADLKXtsLOmFGvgJ9u/898jkdrBB9StXAjsu/9pDmHL12ztx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2706
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129537

OpenSSL 4.0 adds const qualifiers to X509 accessor return types,
makes ASN1_STRING opaque, and removes OpenSSL 1.0 compatibility
functions.

Backport three patches:
- Improve future OpenSSL compatibility (upstream 5e4e84523288)
- Remove OpenSSL 1.0 support (upstream f8a47bf037af, context adjusted)
- Fix remaining const qualifiers in k5tls for 1.22.x (functions
  removed on trunk, fix only needed for this version)

Upstream-Status: Backport / Inappropriate (patch 3)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Improve-future-OpenSSL-compatibility.patch | 285 ++++++++
 .../0002-Remove-OpenSSL-1.0-support.patch     | 627 ++++++++++++++++++
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch |  67 ++
 .../recipes-connectivity/krb5/krb5_1.22.2.bb  |   3 +
 4 files changed, 982 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-fut=
ure-OpenSSL-compatibility.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-Open=
SSL-1.0-support.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-r=
emaining-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-Ope=
nSSL-compatibility.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Impr=
ove-future-OpenSSL-compatibility.patch
new file mode 100644
index 0000000000..3ae23f0031
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-OpenSSL-co=
mpatibility.patch
@@ -0,0 +1,285 @@
+From 5e4e8452328804948d042235bbf58ca457795857 Mon Sep 17 00:00:00 2001
+From: Bob Beck <beck@openssl.org>
+Date: Mon, 16 Feb 2026 15:15:55 -0700
+Subject: [PATCH] Improve future OpenSSL compatibility
+
+Avoid calling deprecated OpenSSL functions when compiling against
+versions of OpenSSL where they are deprecated.  Add
+-DOPENSSL_NO_DEPRECATED to the linux-clang-openssl CI build to help
+detect calls to deprecated functions in the future.
+
+Use const pointer variables to hold values retrieved by accessors
+which will return const pointers in OpenSSL 4.0.  Define macros to
+make certain functions accept these const pointers in versions of
+OpenSSL where they don't already do so.
+
+Use accessor functions instead of direct field access for ASN1_STRING
+values, as the type will become opaque in OpenSSL 4.0.
+
+The PKINIT code is written to assume that DHX support was not present
+until OpenSSL 1.1, but it was added in release 1.0.2, causing a
+compilation error against 1.0.2 from a double definition of
+EVP_PKEY_DHX.  Minimally fix the compilation error.  (The custom DHX
+marshalling code to support 1.0.x could be removed, as 1.0.2 is the
+minimum version after commit f5bbfa4821cf590a4748f96d0e016bc0485e95c4,
+but the plan is to remove 1.0.x compatibility shortly.)
+
+Contains work by Frederik Wedel-Heinen
+<frederik.wedel-heinen@dencrypt.dk> and Dimitri John Ledkov
+<dimitri.ledkov@surgut.co.uk>.
+
+[ghudson@mit.edu: combined numerous commits; added compatibility
+macros; rewrote commit message; fixed 1.0.2 compatibility issue]
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/5e4e8452328=
8]
+
+Note: .github/workflows/build.yml hunk dropped (CI-only, not relevant
+for OE builds).
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ .github/workflows/build.yml                   | 10 ++--
+ .../preauth/pkinit/pkinit_crypto_openssl.c    | 54 ++++++++++++++-----
+ src/plugins/tls/k5tls/openssl.c               | 26 +++++++--
+ 3 files changed, 68 insertions(+), 22 deletions(-)
+
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plug=
ins/preauth/pkinit/pkinit_crypto_openssl.c
+index d1fe18e5ab..aa969aa37c 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -209,13 +209,20 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
+ #define EVP_MD_CTX_new EVP_MD_CTX_create
+ #define EVP_MD_CTX_free EVP_MD_CTX_destroy
+ #define ASN1_STRING_get0_data ASN1_STRING_data
++#define X509_STORE_CTX_set0_trusted_stack X509_STORE_CTX_trusted_stack
+=20
+ /*
+- * 1.1 adds DHX support, which uses the RFC 3279 DomainParameters encodin=
g we
++ * 1.0.2 adds DHX support, which uses the RFC 3279 DomainParameters encod=
ing we
+  * need for PKINIT.  For 1.0 we must use the original DH type when creati=
ng
+  * EVP_PKEY objects.
+  */
++#ifndef EVP_PKEY_DHX
+ #define EVP_PKEY_DHX EVP_PKEY_DH
++#endif
++
++/* Make X509_NAME_print_ex() accept a const name pointer by adding a cast=
. */
++#define X509_NAME_print_ex(a, b, c, d)          \
++    X509_NAME_print_ex(a, (X509_NAME *)b, c, d)
+=20
+ /* 1.1 makes many handle types opaque and adds accessors.  Add compatibil=
ity
+  * versions of the new accessors we use for pre-1.1. */
+@@ -295,6 +302,10 @@ compat_ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGN=
UM *s)
+ #define EVP_PKEY_get_bits EVP_PKEY_bits
+ #define EVP_PKEY_get_base_id EVP_PKEY_base_id
+=20
++/* Make X509_dup() accept a const pointer by adding a cast. */
++#define X509_dup(a) X509_dup((X509 *)a)
++#define i2d_X509_NAME(a, b) i2d_X509_NAME((X509_NAME *)a, b)
++
+ /*
+  * Convert *dh to an EVP_PKEY object, taking ownership of *dh and setting=
 it to
+  * NULL.  On error, return NULL and do not take ownership of or change *d=
h.
+@@ -318,6 +329,11 @@ dh_to_pkey(DH **dh)
+ }
+ #endif /* OPENSSL_VERSION_NUMBER < 0x30000000L */
+=20
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++/* Make X509V3_EXT_d2i() accept a const pointer by adding a cast. */
++#define X509V3_EXT_d2i(a) X509V3_EXT_d2i((X509_EXTENSION *)a)
++#endif
++
+ /* Encode a bignum as an ASN.1 integer in DER. */
+ static int
+ encode_bn_der(const BIGNUM *bn, uint8_t **der_out, int *len_out)
+@@ -1134,6 +1150,13 @@ oerr_cert(krb5_context context, krb5_error_code cod=
e, X509_STORE_CTX *certctx,
+     return oerr(context, code, _("%s (depth %d): %s"), msg, depth, errstr=
);
+ }
+=20
++/* Convert an OpenSSL ASN.1 string value to krb5_data, without copying. *=
/
++static inline krb5_data
++asn1string_to_data(ASN1_STRING *s)
++{
++    return make_data((char *)ASN1_STRING_get0_data(s), ASN1_STRING_length=
(s));
++}
++
+ krb5_error_code
+ pkinit_init_plg_crypto(krb5_context context,
+                        pkinit_plg_crypto_context *cryptoctx)
+@@ -1775,7 +1798,7 @@ cms_signeddata_create(krb5_context context,
+             goto cleanup;
+         X509_STORE_CTX_init(certctx, certstore, id_cryptoctx->my_cert,
+                             id_cryptoctx->intermediateCAs);
+-        X509_STORE_CTX_trusted_stack(certctx, id_cryptoctx->trustedCAs);
++        X509_STORE_CTX_set0_trusted_stack(certctx, id_cryptoctx->trustedC=
As);
+         if (!X509_verify_cert(certctx)) {
+             retval =3D oerr_cert(context, 0, certctx,
+                                _("Failed to verify own certificate"));
+@@ -2002,7 +2025,7 @@ cms_signeddata_verify(krb5_context context,
+         unsigned char *d;
+         *is_signed =3D 0;
+         octets =3D CMS_get0_content(cms);
+-        if (!octets || ((*octets)->type !=3D V_ASN1_OCTET_STRING)) {
++        if (!octets || (ASN1_STRING_type(*octets) !=3D V_ASN1_OCTET_STRIN=
G)) {
+             retval =3D KRB5KDC_ERR_PREAUTH_FAILED;
+             krb5_set_error_message(context, retval,
+                                    _("Invalid pkinit packet: octet string=
 "
+@@ -2058,7 +2081,8 @@ cms_signeddata_verify(krb5_context context,
+         /* We cannot use CMS_dataInit because there may be no digest */
+         octets =3D CMS_get0_content(cms);
+         if (octets)
+-            out =3D BIO_new_mem_buf((*octets)->data, (*octets)->length);
++            out =3D BIO_new_mem_buf(ASN1_STRING_get0_data(*octets),
++                                  ASN1_STRING_length(*octets));
+         if (out =3D=3D NULL)
+             goto cleanup;
+     } else {
+@@ -2118,7 +2142,7 @@ cms_signeddata_verify(krb5_context context,
+=20
+         /* add trusted CAs certificates for cert verification */
+         if (idctx->trustedCAs !=3D NULL)
+-            X509_STORE_CTX_trusted_stack(cert_ctx, idctx->trustedCAs);
++            X509_STORE_CTX_set0_trusted_stack(cert_ctx, idctx->trustedCAs=
);
+         else {
+             pkiDebug("unable to find any trusted CAs\n");
+             goto cleanup;
+@@ -2156,7 +2180,7 @@ cms_signeddata_verify(krb5_context context,
+         i =3D X509_verify_cert(cert_ctx);
+         if (i <=3D 0) {
+             int j =3D X509_STORE_CTX_get_error(cert_ctx);
+-            X509 *cert;
++            const X509 *cert;
+=20
+             cert =3D X509_STORE_CTX_get_current_cert(cert_ctx);
+             reqctx->received_cert =3D X509_dup(cert);
+@@ -2316,7 +2340,7 @@ crypto_retrieve_X509_sans(krb5_context context,
+     krb5_principal *princs =3D NULL;
+     char **upns =3D NULL;
+     unsigned char **dnss =3D NULL;
+-    X509_EXTENSION *ext =3D NULL;
++    const X509_EXTENSION *ext =3D NULL;
+     GENERAL_NAMES *ialt =3D NULL;
+     GENERAL_NAME *gen =3D NULL;
+=20
+@@ -2379,8 +2403,7 @@ crypto_retrieve_X509_sans(krb5_context context,
+         gen =3D sk_GENERAL_NAME_value(ialt, i);
+         switch (gen->type) {
+         case GEN_OTHERNAME:
+-            name.length =3D gen->d.otherName->value->value.sequence->leng=
th;
+-            name.data =3D (char *)gen->d.otherName->value->value.sequence=
->data;
++            name =3D asn1string_to_data(gen->d.otherName->value->value.se=
quence);
+             if (princs !=3D NULL &&
+                 OBJ_cmp(plgctx->id_pkinit_san,
+                         gen->d.otherName->type_id) =3D=3D 0) {
+@@ -2414,12 +2437,13 @@ crypto_retrieve_X509_sans(krb5_context context,
+         case GEN_DNS:
+             if (dnss !=3D NULL) {
+                 /* Prevent abuse of embedded null characters. */
+-                if (memchr(gen->d.dNSName->data, '\0', gen->d.dNSName->le=
ngth))
++                if (memchr(ASN1_STRING_get0_data(gen->d.dNSName), '\0',
++                           ASN1_STRING_length(gen->d.dNSName)))
+                     break;
+                 pkiDebug("%s: found dns name =3D %s\n", __FUNCTION__,
+-                         gen->d.dNSName->data);
++                         ASN1_STRING_get0_data(gen->d.dNSName));
+                 dnss[d] =3D (unsigned char *)
+-                    strdup((char *)gen->d.dNSName->data);
++                    strdup((char *)ASN1_STRING_get0_data(gen->d.dNSName))=
;
+                 if (dnss[d] =3D=3D NULL) {
+                     pkiDebug("%s: failed to duplicate dns name\n",
+                              __FUNCTION__);
+@@ -3094,8 +3118,10 @@ int
+ pkinit_openssl_init(void)
+ {
+     /* Initialize OpenSSL. */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     ERR_load_crypto_strings();
+     OpenSSL_add_all_algorithms();
++#endif
+     return 0;
+ }
+=20
+@@ -4766,7 +4792,7 @@ crypto_retrieve_X509_key_usage(krb5_context context,
+ }
+=20
+ static krb5_error_code
+-rfc2253_name(X509_NAME *name, char **str_out)
++rfc2253_name(const X509_NAME *name, char **str_out)
+ {
+     BIO *b =3D NULL;
+     char *str;
+@@ -5227,7 +5253,7 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
+     int i =3D 0, sk_size =3D sk_X509_num(sk);
+     krb5_external_principal_identifier **krb5_cas =3D NULL;
+     X509 *x =3D NULL;
+-    X509_NAME *xn =3D NULL;
++    const X509_NAME *xn =3D NULL;
+     unsigned char *p =3D NULL;
+     int len =3D 0;
+     PKCS7_ISSUER_AND_SERIAL *is =3D NULL;
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/opens=
sl.c
+index 42d72dc9ec..7763327b7a 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -38,6 +38,24 @@
+ #include <openssl/x509v3.h>
+ #include <dirent.h>
+=20
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++/* Make X509_get_subject_name() accept a const pointer by adding a cast. =
*/
++#define X509_get_subject_name(a) X509_get_subject_name((X509 *)a)
++
++/* OpenSSL 1.0 did not have TLS_client_method(); use the best alternative=
. */
++#define TLS_client_method() SSLv23_client_method()
++#endif
++
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++/*
++ * OpenSSL 4.0 constifies the result of X509_STORE_CTX_get_current_cert()=
 and
++ * the input of X509_check_host() and X509_check_ip_asc().  For prior ver=
sions,
++ * make the latter two functions accept const pointers via a cast.
++ */
++#define X509_check_host(a, b, c, d, e) X509_check_host((X509 *)a, b, c, d=
, e)
++#define X509_check_ip_asc(a, b, c) X509_check_ip_asc((X509 *)a, b, c)
++#endif
++
+ struct k5_tls_handle_st {
+     SSL *ssl;
+     char *servername;
+@@ -51,9 +69,11 @@ MAKE_INIT_FUNCTION(init_openssl);
+ int
+ init_openssl(void)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     SSL_library_init();
+     SSL_load_error_strings();
+     OpenSSL_add_all_algorithms();
++#endif
+     ex_context_id =3D SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     ex_handle_id =3D SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     return 0;
+@@ -72,7 +92,7 @@ flush_errors(krb5_context context)
+ }
+=20
+ static krb5_boolean
+-check_cert_name_or_ip(X509 *x, const char *expected_name)
++check_cert_name_or_ip(const X509 *x, const char *expected_name)
+ {
+     struct in_addr in;
+     struct in6_addr in6;
+@@ -89,7 +109,7 @@ check_cert_name_or_ip(X509 *x, const char *expected_nam=
e)
+ static int
+ verify_callback(int preverify_ok, X509_STORE_CTX *store_ctx)
+ {
+-    X509 *x;
++    const X509 *x;
+     SSL *ssl;
+     BIO *bio;
+     krb5_context context;
+@@ -246,7 +266,7 @@ setup(krb5_context context, SOCKET fd, const char *ser=
vername,
+         return KRB5_PLUGIN_OP_NOTSUPP;
+=20
+     /* Do general SSL library setup. */
+-    ctx =3D SSL_CTX_new(SSLv23_client_method());
++    ctx =3D SSL_CTX_new(TLS_client_method());
+     if (ctx =3D=3D NULL)
+         goto error;
+=20
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0=
-support.patch b/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL=
-1.0-support.patch
new file mode 100644
index 0000000000..b208c96e54
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0-suppor=
t.patch
@@ -0,0 +1,627 @@
+From 736397a909005913b09c1d84a32255de71aadeca Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 10 Mar 2026 23:06:59 -0400
+Subject: [PATCH] Remove OpenSSL 1.0 support
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/f8a47bf037a=
f]
+
+Note: Context adjusted for krb5 1.22.2 (one hunk in
+pkinit_crypto_openssl.c had offset due to earlier patches).
+doc/mitK5features.rst hunk dropped (documentation only, outside src/).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/configure.ac                              |   4 +-
+ .../crypto/openssl/hash_provider/hash_evp.c   |   7 -
+ src/lib/crypto/openssl/hmac.c                 |  27 --
+ src/lib/crypto/openssl/sha256.c               |   7 -
+ .../preauth/pkinit/pkinit_crypto_openssl.c    | 372 +-----------------
+ src/plugins/preauth/spake/openssl.c           |   7 -
+ src/plugins/tls/k5tls/openssl.c               |  13 -
+ 7 files changed, 4 insertions(+), 433 deletions(-)
+
+diff --git a/src/configure.ac b/src/configure.ac
+index 4325fae..9074a9f 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -1141,8 +1141,8 @@ enable_pkinit=3Dtry)
+ if test "$enable_pkinit" =3D yes || test "$enable_pkinit" =3D try; then
+   AC_CACHE_CHECK(for a recent enough OpenSSL, k5_cv_openssl_version_okay,
+ [AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <openssl/opensslv.h>
+-#if OPENSSL_VERSION_NUMBER < 0x10000000L
+-# error openssl is too old, need 1.0.0
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++# error openssl is too old, need 1.1.0
+ #endif
+ int i =3D 1;
+ ])], k5_cv_openssl_version_okay=3Dyes, k5_cv_openssl_version_okay=3Dno)])
+diff --git a/src/lib/crypto/openssl/hash_provider/hash_evp.c b/src/lib/cry=
pto/openssl/hash_provider/hash_evp.c
+index f2fbffd..2269daa 100644
+--- a/src/lib/crypto/openssl/hash_provider/hash_evp.c
++++ b/src/lib/crypto/openssl/hash_provider/hash_evp.c
+@@ -37,13 +37,6 @@
+=20
+ #include <openssl/evp.h>
+=20
+-/* 1.1 standardizes constructor and destructor names, renaming
+- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-#define EVP_MD_CTX_new EVP_MD_CTX_create
+-#define EVP_MD_CTX_free EVP_MD_CTX_destroy
+-#endif
+-
+ static krb5_error_code
+ hash_evp(const EVP_MD *type, const krb5_crypto_iov *data, size_t num_data=
,
+          krb5_data *output)
+diff --git a/src/lib/crypto/openssl/hmac.c b/src/lib/crypto/openssl/hmac.c
+index 799d700..6e91017 100644
+--- a/src/lib/crypto/openssl/hmac.c
++++ b/src/lib/crypto/openssl/hmac.c
+@@ -63,33 +63,6 @@
+ #include <openssl/hmac.h>
+ #endif
+=20
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-
+-/* OpenSSL 1.1 makes HMAC_CTX opaque, while 1.0 does not have pointer
+- * constructors or destructors. */
+-
+-#define HMAC_CTX_new compat_hmac_ctx_new
+-static HMAC_CTX *
+-compat_hmac_ctx_new(void)
+-{
+-    HMAC_CTX *ctx;
+-
+-    ctx =3D calloc(1, sizeof(*ctx));
+-    if (ctx !=3D NULL)
+-        HMAC_CTX_init(ctx);
+-    return ctx;
+-}
+-
+-#define HMAC_CTX_free compat_hmac_ctx_free
+-static void
+-compat_hmac_ctx_free(HMAC_CTX *ctx)
+-{
+-    HMAC_CTX_cleanup(ctx);
+-    free(ctx);
+-}
+-
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
+-
+ /*
+  * the HMAC transform looks like:
+  *
+diff --git a/src/lib/crypto/openssl/sha256.c b/src/lib/crypto/openssl/sha2=
56.c
+index 855ebd7..6f2c5d9 100644
+--- a/src/lib/crypto/openssl/sha256.c
++++ b/src/lib/crypto/openssl/sha256.c
+@@ -36,13 +36,6 @@
+=20
+ #include <openssl/evp.h>
+=20
+-/* 1.1 standardizes constructor and destructor names, renaming
+- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-#define EVP_MD_CTX_new EVP_MD_CTX_create
+-#define EVP_MD_CTX_free EVP_MD_CTX_destroy
+-#endif
+-
+ krb5_error_code
+ k5_sha256(const krb5_data *in, size_t n, uint8_t out[K5_SHA256_HASHLEN])
+ {
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plug=
ins/preauth/pkinit/pkinit_crypto_openssl.c
+index e70106f..2dd34dc 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -201,100 +201,9 @@ static krb5_error_code
+ create_identifiers_from_stack(STACK_OF(X509) *sk,
+                               krb5_external_principal_identifier *** ids)=
;
+=20
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-
+-/* 1.1 standardizes constructor and destructor names, renaming
+- * EVP_MD_CTX_{create,destroy} and deprecating ASN1_STRING_data. */
+-
+-#define EVP_MD_CTX_new EVP_MD_CTX_create
+-#define EVP_MD_CTX_free EVP_MD_CTX_destroy
+-#define ASN1_STRING_get0_data ASN1_STRING_data
+-#define X509_STORE_CTX_set0_trusted_stack X509_STORE_CTX_trusted_stack
+-
+-/*
+- * 1.0.2 adds DHX support, which uses the RFC 3279 DomainParameters encod=
ing we
+- * need for PKINIT.  For 1.0 we must use the original DH type when creati=
ng
+- * EVP_PKEY objects.
+- */
+-#ifndef EVP_PKEY_DHX
+-#define EVP_PKEY_DHX EVP_PKEY_DH
+-#endif
+-
+-/* Make X509_NAME_print_ex() accept a const name pointer by adding a cast=
. */
+-#define X509_NAME_print_ex(a, b, c, d)          \
+-    X509_NAME_print_ex(a, (X509_NAME *)b, c, d)
+-
+-/* 1.1 makes many handle types opaque and adds accessors.  Add compatibil=
ity
+- * versions of the new accessors we use for pre-1.1. */
+-
+-#define OBJ_get0_data(o) ((o)->data)
+-#define OBJ_length(o) ((o)->length)
+-
+-#define DH_set0_key compat_dh_set0_key
+-static int
+-compat_dh_set0_key(DH *dh, BIGNUM *pub, BIGNUM *priv)
+-{
+-    if (pub !=3D NULL) {
+-        BN_clear_free(dh->pub_key);
+-        dh->pub_key =3D pub;
+-    }
+-    if (priv !=3D NULL) {
+-        BN_clear_free(dh->priv_key);
+-        dh->priv_key =3D priv;
+-    }
+-    return 1;
+-}
+-
+-#define DH_get0_key compat_dh_get0_key
+-static void compat_dh_get0_key(const DH *dh, const BIGNUM **pub,
+-                               const BIGNUM **priv)
+-{
+-    if (pub !=3D NULL)
+-        *pub =3D dh->pub_key;
+-    if (priv !=3D NULL)
+-        *priv =3D dh->priv_key;
+-}
+-
+-#define EVP_PKEY_get0_DH compat_get0_DH
+-static DH *
+-compat_get0_DH(const EVP_PKEY *pkey)
+-{
+-    if (pkey->type !=3D EVP_PKEY_DH)
+-        return NULL;
+-    return pkey->pkey.dh;
+-
+-}
+-
+-#define EVP_PKEY_get0_EC_KEY compat_get0_EC
+-static EC_KEY *
+-compat_get0_EC(const EVP_PKEY *pkey)
+-{
+-    if (pkey->type !=3D EVP_PKEY_EC)
+-        return NULL;
+-    return pkey->pkey.ec;
+-}
+-
+-#define ECDSA_SIG_set0 compat_ECDSA_SIG_set0
+-static int
+-compat_ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
+-{
+-    sig->r =3D r;
+-    sig->s =3D s;
+-    return 1;
+-}
+-
+-/* Return true if the cert c includes a key usage which doesn't include u=
.
+- * Define using direct member access for pre-1.1. */
+-#define ku_reject(c, u)                                                 \
+-    (((c)->ex_flags & EXFLAG_KUSAGE) && !((c)->ex_kusage & (u)))
+-
+-#else /* OPENSSL_VERSION_NUMBER >=3D 0x10100000L */
+-
+ /* Return true if the cert x includes a key usage which doesn't include u=
. */
+ #define ku_reject(c, u) (!(X509_get_key_usage(c) & (u)))
+=20
+-#endif
+-
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+ /* OpenSSL 3.0 changes several preferred function names. */
+ #define EVP_PKEY_parameters_eq EVP_PKEY_cmp_parameters
+@@ -371,8 +280,6 @@ decode_bn_der(const uint8_t *der, size_t len)
+     return bn;
+ }
+=20
+-#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
+-
+ #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
+ static EVP_PKEY *
+ decode_params(const krb5_data *params_der, const char *type)
+@@ -442,195 +349,6 @@ decode_spki(const krb5_data *spki)
+     return d2i_PUBKEY(NULL, &inptr, spki->length);
+ }
+=20
+-#else /* OPENSSL_VERSION_NUMBER < 0x10100000L */
+-
+-/*
+- * OpenSSL 1.0 has no DHX support, so we need a custom decoder for RFC 32=
79
+- * DomainParameters, and we need to use X509_PUBKEY values to marshal
+- * SubjectPublicKeyInfo.
+- */
+-
+-typedef struct {
+-    ASN1_BIT_STRING *seed;
+-    BIGNUM *counter;
+-} int_dhvparams;
+-
+-typedef struct {
+-    BIGNUM *p;
+-    BIGNUM *q;
+-    BIGNUM *g;
+-    BIGNUM *j;
+-    int_dhvparams *vparams;
+-} int_dhxparams;
+-
+-ASN1_SEQUENCE(int_dhvparams) =3D {
+-    ASN1_SIMPLE(int_dhvparams, seed, ASN1_BIT_STRING),
+-    ASN1_SIMPLE(int_dhvparams, counter, BIGNUM)
+-} ASN1_SEQUENCE_END(int_dhvparams);
+-
+-ASN1_SEQUENCE(int_dhxparams) =3D {
+-    ASN1_SIMPLE(int_dhxparams, p, BIGNUM),
+-    ASN1_SIMPLE(int_dhxparams, g, BIGNUM),
+-    ASN1_SIMPLE(int_dhxparams, q, BIGNUM),
+-    ASN1_OPT(int_dhxparams, j, BIGNUM),
+-    ASN1_OPT(int_dhxparams, vparams, int_dhvparams)
+-} ASN1_SEQUENCE_END(int_dhxparams);
+-
+-static EVP_PKEY *
+-decode_dh_params(const krb5_data *params_der)
+-{
+-    int_dhxparams *params;
+-    DH *dh;
+-    EVP_PKEY *pkey;
+-    const uint8_t *p;
+-
+-    dh =3D DH_new();
+-    if (dh =3D=3D NULL)
+-        return NULL;
+-
+-    p =3D (uint8_t *)params_der->data;
+-    params =3D (int_dhxparams *)ASN1_item_d2i(NULL, &p, params_der->lengt=
h,
+-                                            ASN1_ITEM_rptr(int_dhxparams)=
);
+-    if (params =3D=3D NULL) {
+-        DH_free(dh);
+-        return NULL;
+-    }
+-
+-    /* Steal p, q, and g from dhparams for dh.  Ignore j and vparams. */
+-    dh->p =3D params->p;
+-    dh->q =3D params->q;
+-    dh->g =3D params->g;
+-    params->p =3D params->q =3D params->g =3D NULL;
+-    ASN1_item_free((ASN1_VALUE *)params, ASN1_ITEM_rptr(int_dhxparams));
+-    pkey =3D dh_to_pkey(&dh);
+-    DH_free(dh);
+-    return pkey;
+-}
+-
+-static krb5_error_code
+-encode_spki(EVP_PKEY *pkey, krb5_data *spki_out)
+-{
+-    krb5_error_code ret =3D ENOMEM;
+-    const DH *dh;
+-    uint8_t *param_der =3D NULL, *pubkey_der =3D NULL, *outptr;
+-    int param_der_len, pubkey_der_len, len;
+-    X509_PUBKEY pubkey;
+-    int_dhxparams dhxparams;
+-    X509_ALGOR algor;
+-    ASN1_OBJECT algorithm;
+-    ASN1_TYPE parameter;
+-    ASN1_STRING param_str, pubkey_str;
+-
+-    if (EVP_PKEY_base_id(pkey) !=3D EVP_PKEY_DH) {
+-        /* Only DH keys require special encoding. */
+-        len =3D i2d_PUBKEY(pkey, NULL);
+-        ret =3D alloc_data(spki_out, len);
+-        if (ret)
+-            goto cleanup;
+-        outptr =3D (uint8_t *)spki_out->data;
+-        (void)i2d_PUBKEY(pkey, &outptr);
+-        return 0;
+-    }
+-
+-    dh =3D EVP_PKEY_get0_DH(pkey);
+-    if (dh =3D=3D NULL)
+-        goto cleanup;
+-
+-    dhxparams.p =3D dh->p;
+-    dhxparams.q =3D dh->q;
+-    dhxparams.g =3D dh->g;
+-    dhxparams.j =3D NULL;
+-    dhxparams.vparams =3D NULL;
+-    param_der_len =3D ASN1_item_i2d((ASN1_VALUE *)&dhxparams, &param_der,
+-                                  ASN1_ITEM_rptr(int_dhxparams));
+-    if (param_der_len < 0)
+-        goto cleanup;
+-    param_str.length =3D param_der_len;
+-    param_str.type =3D V_ASN1_SEQUENCE;
+-    param_str.data =3D param_der;
+-    param_str.flags =3D 0;
+-    parameter.type =3D V_ASN1_SEQUENCE;
+-    parameter.value.sequence =3D &param_str;
+-
+-    memset(&algorithm, 0, sizeof(algorithm));
+-    algorithm.data =3D (uint8_t *)dh_oid.data;
+-    algorithm.length =3D dh_oid.length;
+-
+-    algor.algorithm =3D &algorithm;
+-    algor.parameter =3D &parameter;
+-
+-    if (!encode_bn_der(dh->pub_key, &pubkey_der, &pubkey_der_len))
+-        goto cleanup;
+-    pubkey_str.length =3D pubkey_der_len;
+-    pubkey_str.type =3D V_ASN1_BIT_STRING;
+-    pubkey_str.data =3D pubkey_der;
+-    pubkey_str.flags =3D ASN1_STRING_FLAG_BITS_LEFT;
+-
+-    pubkey.algor =3D &algor;
+-    pubkey.public_key =3D &pubkey_str;
+-    len =3D i2d_X509_PUBKEY(&pubkey, NULL);
+-    if (len < 0)
+-        goto cleanup;
+-    ret =3D alloc_data(spki_out, len);
+-    if (ret)
+-        goto cleanup;
+-    outptr =3D (uint8_t *)spki_out->data;
+-    i2d_X509_PUBKEY(&pubkey, &outptr);
+-
+-cleanup:
+-    OPENSSL_free(param_der);
+-    free(pubkey_der);
+-    return ret;
+-}
+-
+-static EVP_PKEY *
+-decode_spki(const krb5_data *spki)
+-{
+-    X509_PUBKEY *pubkey =3D NULL;
+-    const uint8_t *inptr;
+-    DH *dh;
+-    EVP_PKEY *pkey =3D NULL, *pkey_ret =3D NULL;
+-    const ASN1_STRING *params;
+-    const ASN1_BIT_STRING *public_key;
+-    krb5_data d;
+-
+-    inptr =3D (uint8_t *)spki->data;
+-    pubkey =3D d2i_X509_PUBKEY(NULL, &inptr, spki->length);
+-    if (pubkey =3D=3D NULL)
+-        goto cleanup;
+-
+-    if (OBJ_cmp(pubkey->algor->algorithm, OBJ_nid2obj(NID_dhKeyAgreement)=
)) {
+-        /* This is not a DH key, so we don't need special decoding. */
+-        X509_PUBKEY_free(pubkey);
+-        inptr =3D (uint8_t *)spki->data;
+-        return d2i_PUBKEY(NULL, &inptr, spki->length);
+-    }
+-
+-    if (pubkey->algor->parameter->type !=3D V_ASN1_SEQUENCE)
+-        goto cleanup;
+-    params =3D pubkey->algor->parameter->value.sequence;
+-    d =3D make_data(params->data, params->length);
+-    pkey =3D decode_dh_params(&d);
+-    if (pkey =3D=3D NULL)
+-        goto cleanup;
+-    dh =3D EVP_PKEY_get0_DH(pkey);
+-    if (dh =3D=3D NULL)
+-        goto cleanup;
+-    public_key =3D pubkey->public_key;
+-    dh->pub_key =3D decode_bn_der(public_key->data, public_key->length);
+-    if (dh->pub_key =3D=3D NULL)
+-        goto cleanup;
+-
+-    pkey_ret =3D pkey;
+-    pkey =3D NULL;
+-
+-cleanup:
+-    X509_PUBKEY_free(pubkey);
+-    EVP_PKEY_free(pkey);
+-    return pkey_ret;
+-}
+-
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
+=20
+ #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
+=20
+@@ -673,7 +391,7 @@ set_padded_derivation(EVP_PKEY_CTX *ctx)
+ {
+     EVP_PKEY_CTX_set_dh_pad(ctx, 1);
+ }
+-#elif OPENSSL_VERSION_NUMBER >=3D 0x10100000L
++#else
+ static void
+ set_padded_derivation(EVP_PKEY_CTX *ctx)
+ {
+@@ -681,12 +399,6 @@ set_padded_derivation(EVP_PKEY_CTX *ctx)
+     EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, EVP_PKEY_OP_DERIVE,
+                       EVP_PKEY_CTRL_DH_PAD, 1, NULL);
+ }
+-#else
+-static void
+-set_padded_derivation(EVP_PKEY_CTX *ctx)
+-{
+-    /* There's no support for padded derivation in 1.0. */
+-}
+ #endif
+=20
+ static int
+@@ -809,29 +521,6 @@ dh_pubkey_der(EVP_PKEY *pkey, uint8_t **pubkey_out, u=
nsigned int *len_out)
+ }
+ #endif
+=20
+-#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
+-/* OpenSSL 1.1 and later will copy the q parameter when generating keys. =
*/
+-static int
+-copy_q_openssl10(EVP_PKEY *src, EVP_PKEY *dest)
+-{
+-    return 1;
+-}
+-#else
+-/* OpenSSL 1.0 won't copy the q parameter, so we have to do it. */
+-static int
+-copy_q_openssl10(EVP_PKEY *src, EVP_PKEY *dest)
+-{
+-    DH *dhsrc =3D EVP_PKEY_get0_DH(src), *dhdest =3D EVP_PKEY_get0_DH(des=
t);
+-
+-    if (dhsrc =3D=3D NULL || dhsrc->q =3D=3D NULL || dhdest =3D=3D NULL)
+-        return 0;
+-    if (dhdest->q !=3D NULL)
+-        return 1;
+-    dhdest->q =3D BN_dup(dhsrc->q);
+-    return dhdest->q !=3D NULL;
+-}
+-#endif
+-
+ static EVP_PKEY *
+ generate_dh_pkey(EVP_PKEY *params)
+ {
+@@ -845,11 +534,6 @@ generate_dh_pkey(EVP_PKEY *params)
+         goto cleanup;
+     if (EVP_PKEY_keygen(ctx, &pkey) <=3D 0)
+         goto cleanup;
+-    if (EVP_PKEY_get_base_id(pkey) =3D=3D EVP_PKEY_DH &&
+-        !copy_q_openssl10(params, pkey)) {
+-        EVP_PKEY_free(pkey);
+-        pkey =3D NULL;
+-    }
+=20
+ cleanup:
+     EVP_PKEY_CTX_free(ctx);
+@@ -900,33 +584,6 @@ cleanup:
+=20
+ #else /* OPENSSL_VERSION_NUMBER < 0x30000000L */
+=20
+-#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
+-static DH *
+-dup_dh_params(DH *src)
+-{
+-    return DHparams_dup(src);
+-}
+-#else
+-/* DHparams_dup() won't copy q in OpenSSL 1.0. */
+-static DH *
+-dup_dh_params(DH *src)
+-{
+-    DH *dh;
+-
+-    dh =3D DH_new();
+-    if (dh =3D=3D NULL)
+-        return NULL;
+-    dh->p =3D BN_dup(src->p);
+-    dh->q =3D BN_dup(src->q);
+-    dh->g =3D BN_dup(src->g);
+-    if (dh->p =3D=3D NULL || dh->q =3D=3D NULL || dh->g =3D=3D NULL) {
+-        DH_free(dh);
+-        return NULL;
+-    }
+-    return dh;
+-}
+-#endif
+-
+ static EVP_PKEY *
+ compose_dh_pkey(EVP_PKEY *params, const uint8_t *pubkey_der, size_t der_l=
en)
+ {
+@@ -966,7 +623,7 @@ compose_dh_pkey(EVP_PKEY *params, const uint8_t *pubke=
y_der, size_t der_len)
+         dhparams =3D EVP_PKEY_get0_DH(params);
+         if (dhparams =3D=3D NULL)
+             goto cleanup;
+-        dh =3D dup_dh_params(dhparams);
++        dh =3D DHparams_dup(dhparams);
+         if (dh =3D=3D NULL)
+             goto cleanup;
+         if (!DH_set0_key(dh, pubkey_bn, NULL))
+@@ -1083,8 +740,6 @@ static struct pkcs11_errstrings {
+ };
+ #endif
+=20
+-MAKE_INIT_FUNCTION(pkinit_openssl_init);
+-
+ static krb5_error_code oerr(krb5_context context, krb5_error_code code,
+                             const char *fmt, ...)
+ #if !defined(__cplusplus) && (__GNUC__ > 2)
+@@ -1164,8 +819,6 @@ pkinit_init_plg_crypto(krb5_context context,
+     krb5_error_code retval =3D ENOMEM;
+     pkinit_plg_crypto_context ctx =3D NULL;
+=20
+-    (void)CALL_INIT_FUNCTION(pkinit_openssl_init);
+-
+     ctx =3D malloc(sizeof(*ctx));
+     if (ctx =3D=3D NULL)
+         goto out;
+@@ -3114,17 +2767,6 @@ cleanup:
+     return retval;
+ }
+=20
+-int
+-pkinit_openssl_init(void)
+-{
+-    /* Initialize OpenSSL. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-    ERR_load_crypto_strings();
+-    OpenSSL_add_all_algorithms();
+-#endif
+-    return 0;
+-}
+-
+ static krb5_error_code
+ pkinit_create_sequence_of_principal_identifiers(
+     krb5_context context,
+@@ -5834,13 +5476,3 @@ crypto_verify_checksums(krb5_context context, krb5_=
data *body,
+=20
+     return 0;
+ }
+-
+-#ifdef _WIN32
+-BOOL WINAPI
+-DllMain(HANDLE hModule, DWORD fdwReason, LPVOID lpvReserved)
+-{
+-    if (fdwReason =3D=3D DLL_PROCESS_ATTACH)
+-        pkinit_openssl_init__auxinit();
+-    return TRUE;
+-}
+-#endif /* _WIN32 */
+diff --git a/src/plugins/preauth/spake/openssl.c b/src/plugins/preauth/spa=
ke/openssl.c
+index f2e4b53..fbaa65e 100644
+--- a/src/plugins/preauth/spake/openssl.c
++++ b/src/plugins/preauth/spake/openssl.c
+@@ -41,13 +41,6 @@
+ #include <openssl/obj_mac.h>
+ #include <openssl/evp.h>
+=20
+-/* OpenSSL 1.1 standardizes constructor and destructor names, renaming
+- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-#define EVP_MD_CTX_new EVP_MD_CTX_create
+-#define EVP_MD_CTX_free EVP_MD_CTX_destroy
+-#endif
+-
+ struct groupdata_st {
+     const groupdef *gdef;
+     EC_GROUP *group;
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/opens=
sl.c
+index cc8fc70..bbfa37f 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -38,14 +38,6 @@
+ #include <openssl/x509v3.h>
+ #include <dirent.h>
+=20
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-/* Make X509_get_subject_name() accept a const pointer by adding a cast. =
*/
+-#define X509_get_subject_name(a) X509_get_subject_name((X509 *)a)
+-
+-/* OpenSSL 1.0 did not have TLS_client_method(); use the best alternative=
. */
+-#define TLS_client_method() SSLv23_client_method()
+-#endif
+-
+ #if OPENSSL_VERSION_NUMBER < 0x40000000L
+ /*
+  * OpenSSL 4.0 constifies the result of X509_STORE_CTX_get_current_cert()=
 and
+@@ -69,11 +61,6 @@ MAKE_INIT_FUNCTION(init_openssl);
+ int
+ init_openssl(void)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+-    SSL_library_init();
+-    SSL_load_error_strings();
+-    OpenSSL_add_all_algorithms();
+-#endif
+     ex_context_id =3D SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     ex_handle_id =3D SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     return 0;
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remainin=
g-const-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-connectivity/krb=
5/krb5/0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..261c8387b5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remaining-const=
-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,67 @@
+From 29a6ab9be8a5af0a683eb0e89ce9b094b74ae8cf Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 26 Aug 2026 11:30:58 +0000
+Subject: [PATCH] k5tls: fix remaining const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_ext(), and X509_STORE_CTX_get_current_cert(). Update
+function signatures and local variables to accept const pointers.
+
+Upstream-Status: Inappropriate [functions removed on trunk, fix only neede=
d for 1.22.x]
+
+Note: Upstream fixed this by removing OpenSSL 1.0 support entirely
+(commit f8a47bf037af), but 1.22.2 still has code paths that need
+these additional const qualifiers.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ plugins/tls/k5tls/openssl.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/opens=
sl.c
+index bbfa37f..6efe613 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -146,10 +146,10 @@ domain_match(const char *presented, size_t plen, con=
st char *expected)
+=20
+ /* Fetch the list of subjectAltNames from a certificate. */
+ static GENERAL_NAMES *
+-get_cert_sans(X509 *x)
++get_cert_sans(const X509 *x)
+ {
+     int ext;
+-    X509_EXTENSION *san_ext;
++    const X509_EXTENSION *san_ext;
+=20
+     ext =3D X509_get_ext_by_NID(x, NID_subject_alt_name, -1);
+     if (ext < 0)
+@@ -163,9 +163,9 @@ get_cert_sans(X509 *x)
+ /* Fetch a CN value from the subjct name field, returning its length, or =
-1 if
+  * there is no subject name or it contains no CN value. */
+ static int
+-get_cert_cn(X509 *x, char *buf, size_t bufsize)
++get_cert_cn(const X509 *x, char *buf, size_t bufsize)
+ {
+-    X509_NAME *name;
++    const X509_NAME *name;
+=20
+     name =3D X509_get_subject_name(x);
+     if (name =3D=3D NULL)
+@@ -175,7 +175,7 @@ get_cert_cn(X509 *x, char *buf, size_t bufsize)
+=20
+ /* Return true if text matches any of the addresses we can recover from x=
. */
+ static krb5_boolean
+-check_cert_address(X509 *x, const char *text)
++check_cert_address(const X509 *x, const char *text)
+ {
+     char buf[1024];
+     GENERAL_NAMES *sans;
+@@ -234,7 +234,7 @@ check_cert_address(X509 *x, const char *text)
+=20
+ /* Return true if expected matches any of the names we can recover from x=
. */
+ static krb5_boolean
+-check_cert_servername(X509 *x, const char *expected)
++check_cert_servername(const X509 *x, const char *expected)
+ {
+     char buf[1024];
+     GENERAL_NAMES *sans;
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb b/meta-oe/rec=
ipes-connectivity/krb5/krb5_1.22.2.bb
index 89e5502847..7666ec5671 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
@@ -24,6 +24,9 @@ SRC_URI =3D "http://web.mit.edu/kerberos/dist/${BPN}/${SH=
RT_VER}/${BP}.tar.gz \
            file://fix-strchr-conformance-to-C23.patch;striplevel=3D2 \
            file://crosscompile_nm.patch \
            file://0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_IN=
I.patch;striplevel=3D2 \
+           file://0001-Improve-future-OpenSSL-compatibility.patch;striplev=
el=3D2 \
+           file://0002-Remove-OpenSSL-1.0-support.patch;striplevel=3D2 \
+           file://0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.=
0.patch;striplevel=3D2 \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \

