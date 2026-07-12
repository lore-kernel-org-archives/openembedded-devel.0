Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BB1C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 00:47:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6682.1783817222641205251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2026 17:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UC8ZHMlc;
 spf=pass (domain: axis.com, ip: 52.101.72.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1fLLfXQ95Dh4wpXOZHqB8f7RlaMyZP7zI7eTQa06hYcgHQwBKbFm3UPSJ8gD65Fc8FKTOPmNRoQE+mU+ErAC1JLAyMMD6UJEaVu2mymd/0XmY25ZVzA02EbLXJauouOwC/JZ4/a68G404DR3fgib4IgZS4bnqyICrIZUg3o0dXtf+eJpK6sZE2Faa0TM5YCr38Mz3WGfUBUTYjoWBuVT2rsKI90LO9FVEmuzgWgvxm68KF8uz3BHrUC4N7MTdnGiAS9ow7SkFIfEpV1qpltS6zYiEeze6qKLF2F1q1bd5F0G+VSKeRMYZJsbPh7+ruio/adHs46MhzmRlJBzqc80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iOxu1yH1gvlm13p8HyH+85DQCETM2dbyl+xqXFuPzk=;
 b=rY39gR6UdKMf3vdDJ40QbBuhT8BtTZoiQy5Pqda9psTAsubSytjid+pfRk1r4e+ja1xlKHKP/fY14DpbzHwitgGIkKGPSHPEkj4JkaTvb5joNK9zOOmsY4YoHdV5Wj0FATHch5hw2/FoJOuo5vxRCNMm9M1FTIun4vrprmmpESyrD4EDtYMd8kEth/UG/CmhfSMfZkhgj6Jj22EBD9a+vtNehm0tXvBkFMiT3RJWfZqX8N+WBYHeC8KtX8hPJSQP/Yyo92MHV3r6qfFFzwpAJIkOZ3bCjZG7u1TmBevC6XurPMt82jq/9y4CLSa41QqWtBqa2b3rae4+2mMu0tE+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iOxu1yH1gvlm13p8HyH+85DQCETM2dbyl+xqXFuPzk=;
 b=UC8ZHMlcI3jmkmUgmKNG3SweBvHtzzvHtscdzgKbWGiRrd8tyL7FcgXRhGw5vGKc8bHrGnbsglFQfQgq+0omBSfLrfpUapsuyWzPsyVOCp5aFfXsoOW+TtzDdU5yUImw52kKJSLRRjw1NF2jy6IAn7baxDN9RyrIGCdQUTP7Syo=
Received: from DUZPR01CA0344.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::9) by AM7PR02MB5971.eurprd02.prod.outlook.com
 (2603:10a6:20b:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.19; Sun, 12 Jul
 2026 00:46:57 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com (2603:10a6:10:4b8::4)
 by DUZPR01CA0344.outlook.office365.com (2603:10a6:10:4b8::9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.18
 via Frontend Transport; Sun, 12 Jul 2026 00:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18 via Frontend Transport; Sun, 12 Jul 2026 00:46:56 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 12 Jul
 2026 02:46:56 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 12 Jul
 2026 02:46:56 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 12 Jul 2026 02:46:56 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2FC22199E
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 02:46:56 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2653412AC6C; Sun, 12 Jul 2026 02:46:56 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] pegtl: Correct the license to BSL-1.0
Date: Sun, 12 Jul 2026 02:46:51 +0200
Message-ID: <20260712004651.356661-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|AM7PR02MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3f4cb1-3b6d-4973-3efe-08dedfaf1336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|11063799006|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	N2CwNWtqfb0Ye0LLtE+IYMF64yGv5dj0+r7kBm4Ss/XG/i5E00+uy/tIMDxA9flFiVWQtQyLemvXkHIm0ti00Zz+N64nDd0IljTwSWbNqjKLY7tqS76LFKfgG5dPMegcB34Z2I6enezefQYeFPpUz5ftvlxrse49LOq1e6mdBmVIeKo+rEVeFRAz8EqSnZ6VOv810krxajHYxFgjWGlh81hOi1yts4AQ12lJrj0fSIAn/IRmd8UXu15AJS8t/KkL48vuoIX0eyofh3avHOoWrV7edonhaoz8tp2IydqaWT0KNbuSzFJB/QdCGKQ7GbFo8L4mCJ+wRCI5C8AkQniWkEjJyB1a7PFedJl+p0aSCymLVl8MZSCD43OP5dTgN2GPE4QHgz8DbsIpejpbyoDStgYMORm+mJSUXaOfc8jaTFupDcjzR5wox4k+/fMonH6Vxp/TrI1TvEJnjLCyng3OK/8BFgi2eITjbtguoaV3P7popvrlXW5cP/KhYH5rDG3ptTt20YJU21Na2S4V4q6CPUsKpdxqHx0yECz6m4MIKn+5EvIr3VKF5XVXOOKxqqcTVBXiQmHSz7sZws205A7S/LFwCiozIeR1iVwYlF2TUxDWNlQtYz3gKUVq1uytCYlABUWRO7QMW+BUJvf9Ynw2TAe8StgO+8pRqwU4EZCuBA1+YCP0r1M0pQNDT6gZO0hDIrz0OFKixHbmyCt9D7WUTg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(11063799006)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZiY/MEubg0p5iOkc1dhkCKvP61U9Eb+hQdyNiBqCgL7uU3i+jsjvuZ36YnfCuSav/ul0/NCTu4OLwzoldvuEa/ALpgJjtoXB4QK8AMjxwoLU4vAeOJImSGsukHkiiiVnZVf+YeZMJejoc6bfGtUBtGygM1WVnuZG4pwBv0mbj2qSf2vxc5PHBgY6HvSXa93UKwC0hXdFrIyGDudaQ67A3hVC4UgOOVfrcTkjalFIR+rPkD6/kVe69YkHq803OjZMJ8FPi+pmknSksaQO3Hd3EVGPxucUrPNa+xcdthsNeIhx2kEfbSEyleoAv2F487bF+XQay6W8bPlei6VLdJxU13iApt1/9V8a1lnbCNYdth3NSy8+z2rJIf4Mb8bYltPDlnfzGAr3xudBnmkbP7L88XoXD7a/yZSrw73UT/vMwUeA1k7LNoVi5Udt7a5ruUHa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 00:46:56.7276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3f4cb1-3b6d-4973-3efe-08dedfaf1336
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5971
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 00:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128140

The license was changed from MIT to BSL-1.0 in release 4.0.0.

Also set SUMMARY instead of DESCRIPTION, and fix some whitespace.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb b/meta-oe/recipe=
s-extended/pegtl/pegtl_4.0.0.bb
index 00ab23f025..898b161cad 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
@@ -1,18 +1,17 @@
-DESCRIPTION =3D "header-only library for creating parsers according to Par=
sing Expression Grammar"
+SUMMARY =3D "Header-only library for creating parsers according to Parsing=
 Expression Grammar"
 HOMEPAGE =3D "https://github.com/taocpp/PEGTL"
-LICENSE =3D "MIT"
+LICENSE =3D "BSL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31=
bef20d78c"
=20
 SRC_URI =3D " \
-	git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3Dmain \
-	file://run-ptest \
+    git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3Dmain \
+    file://run-ptest \
 "
=20
 SRCREV =3D "708de300144de0ec8bd58491facfc5f34d0d0559"
=20
 inherit cmake ptest
=20
-
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/src/test/pegtl/data
     install -m 0755 ${B}/src/test/pegtl-test-* ${D}${PTEST_PATH}/src/test/=
pegtl

