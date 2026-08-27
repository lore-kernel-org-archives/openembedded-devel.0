Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4877CC61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1797.1787856833544892600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DKWTzuvF;
 spf=pass (domain: est.tech, ip: 52.101.65.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xC/n8O223zPbgJipGJwZTOsdtk/lo/pe3/5r0a8x1GhdKDZC98i7AGFeNzPRmAzLZtHo7TPcq2RCQdv+sw8L+7EtOjL3iAy8PPBpX9hi5Gz+kYHtNS30aR+5V+yXo4Kc8BbBA9y4mGlKUpl8xwI/KMECCrPNtQzJd6KfuhjCJOxL2kB5DSXfMx/zCCv0NtoRu/hRK4ezqT7zT14/Rs3yU09QAhTXhdYeX+/oVM7LeQbHfJE2G11CIJwE60+zNsGGvi69vEViGalEu18jkUf82T1aZsfOfO5am0w/BjFRFY/iPGWwuCPOGgxgCOOm/+qD8ys3suRLbMrNDQyneoBq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir3box3ZQXJY0/CSJlB9OOdmfrtD2n0dmKhqOqaNVR4=;
 b=Pj9idFkQku8w8COUNGQufr37M/8H6xfM0+qfWTrM0YQTPu84dScnuwtjmQB5soWFWya8m3Gp/Y9wVusxk7nttgSyr1lvN/C/xqRFO4XCI2OLQNUlQNjCI12fhnvUZAU6eY1xNjYbbrxhvEg+9XS1vpHIVBghZ5z4YIJ3EkZlX0e2Cu5BWYPJgCAVGuiKd3YbF2USTxHjqEbKMT/0vBWcHGg6ReTbCV+g6dKOaD/bXZP0VXy2uVTbpF1F/KVANu0F5DavSWYoZE33HNJVJgivr5nsnKbmZedJQ0EXs0YdYkV7IWMXKeYc/gu8ZtoRRfeIYf9RS34YRBCoqkNBrawIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir3box3ZQXJY0/CSJlB9OOdmfrtD2n0dmKhqOqaNVR4=;
 b=DKWTzuvF6t9En8Z0zEr/sfp+1+c0yw4CJEo6sIqPuDfDr4+kbu84VAulPkFXaSvk21hNoUKYDFtO8DGjhHUBdtT0EsF9Js0mGN9DP+e3khj1iPPVkHcaF4BoA7+fd4e9JE2TOFVT2HTi2G9jyEw7eC312t1zTNPYPvGBUxus3aN0F5gkPp1AqztiWPCcTomDKLhXIU3ohm7JUKUgjaovccO2ITxRAZ4rYTO6Dnbi8nGHPSpmSCA265A/0iAtybE6nCzJo3HAOBUBLHBIf8II4Jy0oLtw6PSThcxW2J1l+pYjSi5DXC6PcGFOv1O3KdK9vfXkOb7zUsy2Lzchk44HXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 10/20] boinc-client: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:14 +0200
Message-ID: <20260827185324.78997-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd0a7ba-90df-4a61-5044-08df046c8935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	7L8mVcJ6p+y0gdQMkBzYkqHyIxau7dkfPMWbCm3NAtkDww3FcEakCDZqyQeX3MmQtCRrj8V32D5v9N6Lc2VHGTc12qsiG82SjiuuxkOe5KroWzPTHnaqC17uaIAinEFLK9RwwHBwzKgOgp5Chpvh3EmwsaInozry28KWbwbO2wRTgHk0aao/CRGDMVqVFkuWxmK2mWA/3lu5FdYsSXrGTW7oqaIbCQ9W2N65jahkaFbKRR+VWuzprNX1rrg0JkE8xCaUSC3RSUYoBnped9LZZ9tlB4DYW1O51j5H/6jtQZgZrTky151prVkFfnK+CHSuTtSd5hB2a9acI32SPc/G9u3ZmENJWRz4yfH1srI5llfRe8uFHWgSHqsTEWVbKFdb1kKnCXXbYH3dPyXnr1vm3rdObkQgulEKJw79qWJFsNKJJlg9onmYXdZTZ6oGCOuSqLRaZrLYtkCgE23NP22E4l7eDDGT00LR0qW+6DKrFwniEE7ydlx54Atsb/Q7Ctb5JfPVF1vkiKuuvNmwG6NUCmCK3J1ZoWbWRW/N16PNEiXW5RI0JdHnHaQm6P5DtgrennehWN9UONm4Vorh1t8wO6EOHVt+/wXqxZ+XIhiCDmPnIuPwsIdyCtlzYlhj7W2ddy4LdR7DCNJ0WDBky1Iyiq3VMIoDx6N8cQD1Kc6d5yw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q66lmKVvabB2xcRD7z7qBYxvkP8TQWcUb8VfGPf2nvj48vC9jG/sfji2LFB6?=
 =?us-ascii?Q?W0yr5iBWgbPNuDQdQ82LBkrSQnrBgidKwX8aVeLIjPneZc48H4ZKWPQt4HUv?=
 =?us-ascii?Q?W/jqoc8jAeBf1AkH9lP6cyOazuISoMKhFSRxxgQyAWZQYMQCZfMroZudfqd9?=
 =?us-ascii?Q?BUsOIiAJucP8JXvo4Jr4kixX2Y1o3qqiHNGodI3FUdaCtvXFhZ5U39FLgamr?=
 =?us-ascii?Q?6vbjUsiWleVoUbE9YcPPZ2D9N3I8U1sBY0jPlpLBzYiYDM7bB7uQDBkRpz/N?=
 =?us-ascii?Q?cEUtyxkbkrMYS8Da4YHaZ2s9VW5hZGkX9zP+CI1JL1E27A2Titi/pm6YTy3B?=
 =?us-ascii?Q?T6KPIN8tJhgmS7f9slofN2PFxlZ5hGCpM/aASwAE/eFqzjcrs/dPANBOkx4w?=
 =?us-ascii?Q?sst3+XI+BGOuB5FaUGgfMt5F/hLlfAqag2ulTOLF9v/BWLksVZPaMCLgWDC1?=
 =?us-ascii?Q?Hy4JKaxU/Ihzol4va8+Wp2JwrEXCVEIuA378BPbziJSgt5UP3mlPlkF/mzyc?=
 =?us-ascii?Q?mG6W1j+GuPCXhkO4+LuEhgHlqbnQaxFkIOi5ZcXJGRr0Sy7UOLmTh8vX1csX?=
 =?us-ascii?Q?Y0VF2AjkcLEYbZ1DgPtEN1Lm9WJp9kC92A6EB+aGu9VHCKkJ1CmZaTx9egEW?=
 =?us-ascii?Q?5lO2N8p6O7uwIUg+sGTXTRGm+V4LBd5drMs24X7SFT8eOubBXKItvc4I8Akn?=
 =?us-ascii?Q?6194v69VVUD8I9SdS1dIdV7xryDbEDmxVcy2DQipEiLyubctGPhOhzyzP+eD?=
 =?us-ascii?Q?0wOVnJf0kwRYiPf7Em3nhK4q38yYBl9P0aQAOcGLS43UpAboBH3tEttG5x9K?=
 =?us-ascii?Q?mZoXMeoYq8lHVwC7a/3BIenQJTUN5WDO/b7fHC0h7/RWajhzRnztZ1adez7D?=
 =?us-ascii?Q?GYDkUmi8toRCNW3648THyQ4B3ujrPIA1zi4CvIAwC50sMUv0VOoINfdpm9mD?=
 =?us-ascii?Q?r/yNATOYFbP6fa7H53+NYVtePkj5Ro2VoLN4oR5lI7ddDskEmdlGkq4gG4g8?=
 =?us-ascii?Q?XZVBcWW3KdWTEzdj45XrgZcRTsikbnnzRd5pfwWT/0EHpFmxhzRlBreiXk2J?=
 =?us-ascii?Q?GFxe04AAsfUNLKrj8eA15ER+iOPprR11u8s7Vd3KCDH73uq7mvGv7/3XUs8L?=
 =?us-ascii?Q?P93tKaNYVA2nbunW2zNIdQ3ahoxuor1LBOTJa97ahNIkM3XxdAmLyyYUVgyC?=
 =?us-ascii?Q?Mvu5gcugtiVEHk7irs+vKpRGpHRHcypoGyViZjjiKviZ2VW/TZXI4Ju8HbNs?=
 =?us-ascii?Q?kf/uDOlwxbA1SGD/siZ90nsoyV1NZ7ND+bD3p4Ll75Pb1tfunNuqcwg1Af8N?=
 =?us-ascii?Q?WylbXS50atRHz2/ChCP1jbJsSSLsoJf451meX9n2tQoVYlyJM5iuuNjhEQ5a?=
 =?us-ascii?Q?XKOOqVkXzP9GG+6/AxMsrJQDiz2iai+EN+YxskJJGJJ43KZJh3/st82jA8oa?=
 =?us-ascii?Q?rrYhTRs1O08b/lFaQc9y7Bxmh2Xd3wk5TwpFlwEtkUyyF78LoLYcbBBFJzXn?=
 =?us-ascii?Q?rpn90EHd+srL/JyboB/eomc6k7WGMfa69QmQgIB9Glxg1x0YOslZ1K6Wo7TL?=
 =?us-ascii?Q?dRq5cGNnKNmdz+FpCtIt353dQU5fX5tgxxn/uAZJ9aWGvt+TCegs4wJS/s9I?=
 =?us-ascii?Q?YA3qJwrRU6ylzPgz0gsA5i1RXl9f1k3glUPsGVLOP3d4nRzjMh6E9NQWMaRA?=
 =?us-ascii?Q?IqDxM5SPUFAUCU49x5z1IqjNpHAC8itj0qIryQTprmOUYzw+ht30BMoiIXLg?=
 =?us-ascii?Q?rzWxJQHFXfPctuEUKJ8nM2Sx3tevmYMpSc99hYiLmYT0l2wkk4gqCQmLGNfq?=
X-MS-Exchange-AntiSpam-MessageData-1: Zd3BEoxhL30yssAxrO563wUGFtzMS1lH5Y0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd0a7ba-90df-4a61-5044-08df046c8935
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:51.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUV5Di9oxyTge0HpGOLMfX9a4XIiEYIP6hJXbbVfCAZwzh/5QZODm4a/hnudgYDh1Ig/MaGLapQ8JJNCnIIAt746XhIBhRAGwjJOC/LP6uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129545

OpenSSL 4.0 returns const X509_NAME* from X509_get_subject_name().
Minimal fix for the const qualifier issue in cert_verify_file.

Upstream-Status: Submitted [https://github.com/BOINC/boinc/pull/7209]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-build-with-OpenSSL-4.0.patch     | 41 +++++++++++++++++++
 .../boinc/boinc-client_8.2.15.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-Fix-bu=
ild-with-OpenSSL-4.0.patch

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/0001-Fix-build-wit=
h-OpenSSL-4.0.patch b/meta-oe/recipes-extended/boinc/boinc-client/0001-Fix-=
build-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..71162ac3af
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/0001-Fix-build-with-OpenS=
SL-4.0.patch
@@ -0,0 +1,41 @@
+From 910aad27e06cf7180599c1dc5649a2dfadae6597 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 09:14:24 +0000
+Subject: [PATCH] lib/crypt: fix const X509_NAME for OpenSSL 4.0
+
+OpenSSL 4.0 returns const X509_NAME* from X509_get_subject_name().
+Cast where X509_NAME_oneline requires non-const.
+
+Upstream-Status: Submitted [https://github.com/BOINC/boinc/pull/7209]
+
+Note: The upstream fix is part of a large 29-commit refactoring PR
+that rewrites the entire crypt.cpp. This is a minimal standalone fix
+for the const X509_NAME issue only.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/crypt.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 904fe2736c..a06b453324 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@ int cert_verify_file(
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+=20
+     if (signatures->signatures.size() =3D=3D 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
+@@ -824,7 +824,7 @@ int cert_verify_file(
+             }
+             fflush(stdout);
+             subj =3D X509_get_subject_name(cert);
+-            X509_NAME_oneline(subj, buf, 256);
++            X509_NAME_oneline((X509_NAME *)subj, buf, 256);
+             // ???
+             //X509_NAME_free(subj);
+             X509_free(cert);
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb b/meta-o=
e/recipes-extended/boinc/boinc-client_8.2.15.bb
index 62aa757a59..2d386d066c 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
@@ -39,6 +39,7 @@ TAG =3D "client_release/8.2/8.2.15"
 SRC_URI =3D "git://github.com/BOINC/boinc;protocol=3Dhttps;branch=3D${BRAN=
CH};tag=3D${TAG} \
            file://boinc-AM_CONDITIONAL.patch \
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch =
\
+           file://0001-Fix-build-with-OpenSSL-4.0.patch \
 "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "client_release/8.2/(?P<pver>\d+(\.\d+)+)"

