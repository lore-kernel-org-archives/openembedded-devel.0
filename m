Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCADCC61DCD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1809.1787856856359493811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jT6VlkQz;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAWdra5o4ALsCy8BnRPdjc0xfqOuYSxXUdLcjSABfL66k1r3Ix1uxm+d2RgRPiB+Ap6N849yqR/KaaFiDlVp2ClSVI9jfDNuTrS2TZOcqVqvhRq0qA79zfrou7jOXM7cF/SDFuSNTshhg9mvwd1bIcFgAJGaWRCJ7RLhf/ZcyxRwCCcd/Et+Rae1wRrfVcOaF1ZbgrbeioE+4TRKKdPSHUndqfT1YlUL4QMvkFi9QMi8pzUbF88i9W1AxM2SbJOGXJnuNc57MSPYvgU1wq0qxLV4rpZh9Sn/6zjiwERmM2efV7EmoEek6btEzn+5S0BTH8QYcqyoGSHpv7sWLfGHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7asEosE/LmtwwdPTchAGQOrLLrQN5TjDPCePjV/fCY=;
 b=EoZ65U8m39qLIvrwYyTYx3AB7EVk/bCE/5yqPBsZgIP9fmgd9/Yrl9VTS41U4AvZEqpSPyP8B5oppIMGrHw0g7JQDq/StU0FNhoA0a6GWvJmYGhx7menzBaB5GKt5Wm8EPHvXRcnfl6j4d7SsosJgJX/GVb6pRnePwtFdggsQEXF2gB7VXAgMEWH+nf3sIysPzdhEwRXfdI1jHw0gVgyDA8X83YoyIGIsDJj6xZp9x/ljehkyLXIS3peSYOfig4PXTJ5roqLtQCxylfIC1Z4LyPgRfoNaOmInV/35jQh3py7clOyMsQAfTK7GYdokg/KiBpZXsPMkuhyLCKElr549w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7asEosE/LmtwwdPTchAGQOrLLrQN5TjDPCePjV/fCY=;
 b=jT6VlkQzCV2Vq+PWdxmF0zOuQI2h3AaAsuzqSEkoUHrkLXSdFqlhcBaDJ2AwssHz3onMF+NFecZgtsMNfFnDfxuKwXM/GTfOc2IIrN4URcZByHTaXNpFV8zC6/KKhInA7THAfFjCt+oH9lIYhlAbSQ8Lr57JUMSv7Dp5Ch9VgTO9F81vEAZVD3DzSZte5I0tH6RPZhDNkbDIIvpzMAz6A6h3XvIpXuv4R5HMzAZwhzwGTAb/ork4x35AcZFhLADsqSlAIRhi+nQ2FbnuDCGB6Dnm2IXhfZLjnvm/0Op3snId/sIElqUOrL7V1CKnTyfopR96CVsAvFOumqBU3lo6Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 18/20] ntopng: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:22 +0200
Message-ID: <20260827185324.78997-19-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0245.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 85682b87-2236-4553-c325-08df046c968b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	KAEfN0izN3MnRFlZOM/U3gl+r3TYoNZaNvP6Y4g6/cCSjzrSK/+dQb5TST+sNtYZNFUvprvJcx6HY+DAfVdgZ7mDXNF4/VQWcODsAVRL1OMEhd2X2HWCZ2nU4cviFXsBdHk5g+C8ACaLX3SA0FL9CmaDSCX0DEg/6B7LGhGZAehLuS1f/T+pihlRn00yub6IDdeUsmw2UmPJ8S0/JtH0CzKks/cGHJf6Ga7tIrnYPxjzbDzNcksAWgRYPtgEAZBMGsvbncfyVxWkTLFpOxDzIlo++TCkptrIPtOWK9WSD1qIG99m2LCFQheXXcfbnBQMg+f//AnjO0DiCKn5gmudFSbrou267kTv3uOBoIado6VRAJx5xG8N7mylqjxKcUZYkWW/+N8Hc33S6WcnZPQ/A+yi2nb15B0vEItKixHhG0GeClcW4Dyzrt962Jua9hs+0CY3nSlM1L275GKcmB0Scq8QxexjW2VwpeYSQwl0fDxyceqkl/x6xJTJ4yCf/iklPYhnOa7CRDedpW3aP1fMwUUDhzmXiZ3jtNM2dL6jOv9OeAgySu/FmT1mzBR1RA9A2+DaARLUaj4VVXT+7Ns5nhahLMGM0Lmsdz+T/a7k3dRQbWAyJhTlRNbBqWsYfMtXi7509i0ZymTrERCcr6MRdA81BPg/3ai3ejLjYLkdse0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ECq80UpounujWgviOYihjHfJfZQyF3wg5nAJPZqKFS54ZIc2bctjoxqG/JTx?=
 =?us-ascii?Q?0jLbhI/b1b60M4MQ3kn0pa30a2EVNlitA8GNyxMZ/cF7U/XEri9qsNMzfM7p?=
 =?us-ascii?Q?Ru5tIUlCuaLlKhAes0nRo0LdclFXvyc5CY9WQ7xbyqLqblVYr4QiaUNoWK7c?=
 =?us-ascii?Q?iiRjPB8Ew4N0lChH3db7b0oMk+vAPvUKMSThWzNs08ol6cnWPZUxgaeqFmkw?=
 =?us-ascii?Q?48tOla7GLXgieN52woLwPFvk1lVHHnO4+OUfeAvpsJue4Bde17GZKeXauzxG?=
 =?us-ascii?Q?fQz7WfGBbID0VWS3Gw9kl4FkRXYb+q/HU8aXP4gOMx8hwqg2DeNDoCfWaQf5?=
 =?us-ascii?Q?CeGaoicpqXk4RjIvL8rsorEPNdvvZznQbUsav3ey/aHwQC7qf7j6y+gM5WhO?=
 =?us-ascii?Q?PfAvNXCOz3lB+JKGQc4QVFiePHesav+jlZQFivRBPFx5TE5DdsUTCIo4ateB?=
 =?us-ascii?Q?DuDh/7Vs9gUgnPrGIOloPX2rT14HWWSjvJoFOE5I/JT8wkwsFs/MD9iJFifE?=
 =?us-ascii?Q?jF3BT5JIoq1Rphd97IvTKLzFXlL2UiPO9qRImMMY9LdVr92zT80OR+5viC3+?=
 =?us-ascii?Q?vtKPDJ+N5lIYBqqYBgNCCqjpAjrt0Qt9Q/gXKP2RUcAldIBXuKjFpD0qPj6W?=
 =?us-ascii?Q?aqpo209/XLR0W7JbDX8YUzHsbELtqQeQ2u5HXHSeQ19rFCVfE7Jkf65S/2x5?=
 =?us-ascii?Q?3KPh9bgOcSAMGjYU8b7eXtINpjgW9s99K64IuVpKGYxt9K894+mr7jYObK/j?=
 =?us-ascii?Q?BnAFPPQeoSkRCBF+1KbBITAW4SDLidbN1jl2QQWn4bGCosEsTh8uKCh4GWlZ?=
 =?us-ascii?Q?nydqMjvThBEht+qDy30XWrl2sGhfbdX/Qy0w0KizLYO0HBbIIX+d06uDfBe4?=
 =?us-ascii?Q?g1seTko9lKp0HbiN5KEuY8GD5lrBiG9dU5FzGHsT3yRzef2CAbaiZpA63jRQ?=
 =?us-ascii?Q?dsUMp9jVsCWRGtexWNvAo8QxfRYct1F9/+e0bbcZp6x/O3U5hHhwI0DUFLaZ?=
 =?us-ascii?Q?tZ4MFvxhzlZimQYHiNNbjhBpZiJl77CL0tFwU6gp4EZDh2BRzvvkocfxPMd3?=
 =?us-ascii?Q?KcKMu3nuWgspwgB+oic0fnBRtC9hC3IilbXYhUP2BJkUJylqwGiQZGdwL5s9?=
 =?us-ascii?Q?0KI+bF5D9cLA1/4ze8IUHJrCbrLZdzDj8e8HWxSapO4/UUMKU/xDFz7iwAuh?=
 =?us-ascii?Q?e64YZqKVjRy4tzBkdnb3S4FgKKljj8QJf8TLfsJsiCFb+BcAywMt83nYFG4g?=
 =?us-ascii?Q?erPtto7iL8BYmWawIRTGWExTMdf96cdNd5muzLpH4AG28dGUlW5opGm7+3E7?=
 =?us-ascii?Q?kF0mItJuCLnXOf03aYMBw2I/hWeB9bHFXd10GakRzTrSpsL2vck0DwjtfE8X?=
 =?us-ascii?Q?V82UQbnmUoy5HlP8swqKpR4adIOKIBRy0J8cftGUY/DJeFrzVMwrV5sp6kYU?=
 =?us-ascii?Q?UOqR3JKv2ltXzGipgri9Uqoiz1SBvC41bUGLS8uUzHgRuS1ru3fs3ZrqeWOu?=
 =?us-ascii?Q?6zpfYVqTH7/JjxeC9YyWKiwdsaydUgActNhbvafst7+QYWMRjKn7eowa6byo?=
 =?us-ascii?Q?tpXEAdsn2U5dCMn1dnFSE7eB/7dcFAsTxS788v6JkxzfeySd8kdVZ+uXI2Jl?=
 =?us-ascii?Q?MyuI6JDmAiDoLn5uUWRTH57bwt82v6AiGdTtejvrLPjks44gVVZAyEI4maDU?=
 =?us-ascii?Q?QPqWGA4mFeNdbD/lVyjiJJc55dv8OFwNSNrSYQtyWwnB4AbbHU47x01sqsaX?=
 =?us-ascii?Q?UdaTc2SN1ZsO+GN7tdwLXy5FCwongOM+7E3z7BVfQBVp6ZWwSODEZ3HR3lXb?=
X-MS-Exchange-AntiSpam-MessageData-1: cqHbPbV8IjM3oi2r7PIikdkwGCwz+tqYLew=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 85682b87-2236-4553-c325-08df046c968b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:13.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFBXTYRCvtbLAGCutB9j0Yins4K7AAMoAon1Us671LhH+CYyemi54xaFcztdykZ1dt8koyA+xLxbk2Bu0pg1D7A3NGDjQteMmjs6VbDwwNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129553

OpenSSL 4.0 returns const X509_NAME* from X509_get_subject_name().
Cast where non-const API (X509_NAME_oneline, X509_NAME_get_text_by_NID)
requires it.

Upstream-Status: Backport [https://github.com/ntop/ntopng/pull/10830]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-build-with-OpenSSL-4.0.patch     | 42 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_6.6.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/ntopng/0001-Fix-=
build-with-OpenSSL-4.0.patch

diff --git a/meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-w=
ith-OpenSSL-4.0.patch b/meta-networking/recipes-support/ntopng/ntopng/0001-=
Fix-build-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4f142092c3
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-with-Ope=
nSSL-4.0.patch
@@ -0,0 +1,42 @@
+From 0c9dcc44df3592d8e08b46f5dfca664de5918bc5 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 09:13:35 +0000
+Subject: [PATCH] HTTPserver: fix const X509_NAME for OpenSSL 4.0
+
+OpenSSL 4.0 changed X509_get_subject_name() to return const X509_NAME*.
+Update the local variable to match and cast where non-const API requires i=
t.
+
+Upstream-Status: Backport [https://github.com/ntop/ntopng/pull/10830]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/HTTPserver.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/HTTPserver.cpp b/src/HTTPserver.cpp
+index 21895bf10e..f7b4164ab4 100644
+--- a/src/HTTPserver.cpp
++++ b/src/HTTPserver.cpp
+@@ -403,7 +403,7 @@ static bool ssl_client_x509_auth(const struct mg_conne=
ction *const conn,
+ 				 char *const group, bool *const localuser) {
+   bool ret =3D false;
+   X509 *cert =3D NULL;
+-  X509_NAME *subj =3D NULL;
++  const X509_NAME *subj =3D NULL;
+   char subject[256];
+   char key[CONST_MAX_LEN_REDIS_KEY];
+=20
+@@ -411,12 +411,12 @@ static bool ssl_client_x509_auth(const struct mg_con=
nection *const conn,
+=20
+   if ((cert =3D SSL_get_peer_certificate(conn->ssl))) {
+     if ((subj =3D X509_get_subject_name(cert))) {
+-      X509_NAME_oneline(subj, subject, sizeof(subject));
++      X509_NAME_oneline((X509_NAME *)subj, subject, sizeof(subject));
+      =20
+       ntop->getTrace()->traceEvent(TRACE_INFO, "Client X.509 certificate =
subject name: '%s'", subject);
+=20
+       if (SSL_get_verify_result(conn->ssl) =3D=3D X509_V_OK &&
+-          X509_NAME_get_text_by_NID(subj, NID_commonName, username, NTOP_=
USERNAME_MAXLEN) >=3D 0) {
++          X509_NAME_get_text_by_NID((X509_NAME *)subj, NID_commonName, us=
ername, NTOP_USERNAME_MAXLEN) >=3D 0) {
+         snprintf(key, sizeof(key), CONST_STR_USER_GROUP, username);
+      =20
+         ntop->getTrace()->traceEvent(TRACE_INFO, "Client X.509 certificat=
e CN: '%s'", username);
diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-ne=
tworking/recipes-support/ntopng/ntopng_6.6.bb
index 3c039781d8..03350f240c 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "gitsm://github.com/ntop/ntopng;protocol=3Dht=
tps;branch=3D6.6-stable \
            file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-=
3.patch \
            file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstat=
e.patch \
            file://ntopng.service \
+           file://0001-Fix-build-with-OpenSSL-4.0.patch \
            "
=20
 # don't use the lua under thirdparty as it supports cross compiling badly

