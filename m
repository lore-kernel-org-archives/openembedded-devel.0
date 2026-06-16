Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D9FCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:11:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148000.1781591286357168447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=AMAm6k8V;
 spf=pass (domain: axis.com, ip: 52.101.84.11, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nS5dDD36YCp2zFwKfWctTP+KiUIJg2F08zaQWAFGv4Ujf4liGz0XCuFTJf8qQtnoXhjaYz9aKmsdH/0ooqE+47DPOhy2N8n4yj/g2IypCe6AvpcK3/H7XlsYRDuiXgYx8x3Siqjn2tGG68PHF8c5E0qpp6qQ9dyeJhTg98SXfER8jP4M8Owds7eFiVwkYkXXBQN2iN9EFJ41xf9aQETtBfO4BtDexa35z0y0zqSSoKYmzfDaMad7tnVffDT7wXNIJGqNR7HtxF8/v+LKtItPLEReUZJIXxhB9HqINqGeZDVDPEtGRWITebOhq8r0hA19ZoG06ChBvnnjGz1asuoeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81MyZJ35Bk9uu8QYVLLbGf9RBlyMbWTPrZSTa8wr1lQ=;
 b=jgcYzN/cd+y39N06c1ddmf8+8Fm9dO0mhQGjNLDQhxHSYtD0apA+z/l7hxHVl64sIvgoyvAH/8RgQZFIX4ZyEd5vWLObgwhhVJVlrURMy/qdlxIjNtStIlaXfQKqETEgBurQPoV5rf08c1DVs0BVHwy86uBQVQT+1xRBXLSQsY3ecdnN6+pMeF0ru9srOVNJJ9Aq3apvQyyLBt3zcX2iXFImsph3v6arrgBdaVXdVGdiiUX6ZOz5TbS7xVUfXNPPBK2ruxZVxzCVJlvAqZzisEqjn6T0OBiI2kNJA6giZ+VNNEDXsTheer8omocWJegZQpy+bEynyZXPXlY1c2K6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81MyZJ35Bk9uu8QYVLLbGf9RBlyMbWTPrZSTa8wr1lQ=;
 b=AMAm6k8VpIBOuQGHwRJhqZkZGrqycggOpAOLEfB4Mz9cJmyx8PYyDUVuTCOwdNN5s67exAUesaWNS8EA1WrQYlTcpo+dVss2vb1prtAPwoyEqc9R54ExFH3VB6GHdsshMcPAyHB+/ZzGyn3vcPRSG8pBImIZYPgQnpwIxSMTI4I=
Received: from CWLP265CA0428.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::16)
 by MI3PR02MB12486.eurprd02.prod.outlook.com (2603:10a6:290:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 06:28:00 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::a8) by CWLP265CA0428.outlook.office365.com
 (2603:10a6:400:1d7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:27:57 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:27:56 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:27:56 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E870728FC;
	Tue, 16 Jun 2026 08:27:56 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id E37538461E6; Tue, 16 Jun 2026 08:27:56 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCHv2 1/8] jq: patch CVE-2026-49839
Date: Tue, 16 Jun 2026 08:27:47 +0200
Message-ID: <20260616062754.748436-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|MI3PR02MB12486:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b33d25-054a-4cfc-70ed-08decb7067da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|18002099003|11063799006|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	JAdpWCW3WmQPR1G2Abyun7DZDgRx2amqu0U+Yimw2eV/UW1pLtZL9JJetgEIwjsVCerYSi5Yv+vm3mFRDKUON+1Gnr6Br3qwL3EZln2LhtOo4TDJw5Jl5Ol34aVdBF9+SxpivW7yqfAGUI53zPuN4ZkrsWCa5ce1uT9+6qfOtwm/B398eJfFv79xigL4taMoS9Xn8oJagjq1GVWNMbjZwnD2Nl/Q2snnElY9mCzUVy+XAbwCJSdWI1fx89zmImp+0ehrKF4WbJZ/8bhSaKZhd6A8mV3OP0M3ZnsOgRfjGYnvasT6bgtAU+IRU/RxEcSm9BEk7mYcZTVKcH6PXmewUtvu5MOJC7g8X3TFyMRa3lJYR6O6K6zPCADlEWhNGNgpkJaRPAsyvq/VjFbBqxCiLZCbmx94zkzYBS99tiB2FJKQVowpsg7VsHuI9gHF3BNe9nqPF/whO7FjlU42SdOXGxsVVZsDC6+w8N/V0yvPMZZM3Wn+whPWWDVrxj4v24YtV3kOzF9TNVQtIDGjZXF8sLvbK/EjymmIHl2fEJJnfSNRzzRK/Q0vFMb+safbLCgnHFGbdb5mGbTfTGT8SJVfkxj9CAA7fS/7RcSGkBZGGm0KRsVLlMs89nAaN2I0bDjgJa8B0vsy+Atq81q83O9VKSdJuJl3pPn+5XI5bIqHT44/Bl3Qj3GE8y08vFVnyHBsgAqD/iFJ1qrTeJayaMqUfzU9WPvCbvExY/QebtbRENY=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(18002099003)(11063799006)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cUpqpOublyS5WWQKNmJ+MhzeGudCjjHXoDqvklSuQ8qoELvbxBVlBA2LCO5/vTkAg/sTV12oJYYFQS8V8ja1IG+kpWUlsygISE8LTQm1Op8lt9i/p/Y0pP8yGcQKlrLCEIXwLaR+UKAoGE+aA8T5kdoniVQDqAIy7wXilUSOkkTZmrQc15O5kl4EZX0+1apdoBhTO5JRWE+xXBWns1j2KNPS/yUTNzbe9F822ZYokIhBdG8M+DzGfBEhhmQiA2v8ysBkkNgWDEqCnINsWVrj0WIx+Pk27uRsl+eaqptwgjax8a0jy/7o7FM04qj7fy3h1s8eQs2epjBJHwT5k8377AToNQtyuHEAcGmsqxXVfURaMxK/QUdXaa0hEE+USGGef4izYT/oA0c+3JvDjvlRUB8Jp8LpH7RMpfGHNC0EtnBqxYnBldKhRCpYuAGCSmgK
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:27:57.1932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b33d25-054a-4cfc-70ed-08decb7067da
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR02MB12486
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127606

From: Anton Skorup <anton@skorup.se>

CVE details: https://vulert.com/vuln-db/--4743

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
v2
 * Added patch to stack of jq CVEs
---
 .../jq/jq/CVE-2026-49389.patch                | 31 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-49389.patch
new file mode 100644
index 0000000000..3189158b4a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
@@ -0,0 +1,31 @@
+From e987df0d463d85fd70825e042a082427e8275b86 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 8 Jun 2026 22:14:48 +0900
+Subject: [PATCH] Fix heap-buffer-overflow in raw file loading
+
+When `jv_string_append_buf` overflows the string length limit,
+it returns an invalid `jv`; `jv_load_file` then re-entered it
+on the invalid value and overran the heap. Break out of the loop
+once the value is invalid.
+
+Fixes CVE-2026-49839.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e987df0d463=
d85fd70825e042a082427e8275b86]
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index 7706b0e06e..fbc1e4d653 100644
+--- a/src/jv_file.c
++++ b/src/jv_file.c
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
+=20
+     if (raw) {
+       data =3D jv_string_append_buf(data, buf, n);
++      if (!jv_is_valid(data))
++        break;
+     } else {
+       jv_parser_set_buf(parser, buf, n, !feof(file));
+       jv value;
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 026f6bfa71..0419ccd46d 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
+           file://CVE-2026-49389.patch \
            "
=20
 inherit autotools ptest
--=20
2.43.0


