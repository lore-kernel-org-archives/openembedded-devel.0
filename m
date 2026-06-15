Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A4ACD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 14:06:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.130442.1781532341755406470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 07:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dY2X99/y;
 spf=pass (domain: axis.com, ip: 40.107.130.10, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs/mlBiEi97RJPIsLJzyypieBdIIxVtiwWjjAM54g67w5pEzZJURi26tc0X24sekVF+0oCAyGWrB21u/buXKDshYdMl6gJix3JELvWWBVdDsTLXYnMHZMcZFUq0+6QCez6kJK7e5yhZTzQuhtBKvRRId14xzoRr9SVxh6K/Rx8EuNyA3IM2feETr7OZ4OY7Dcntt5ejfWC4ezcBg86sUMruoedyhiTO3PHAUqcs6VgWEWDxCWGGrmasJwKWidNp0ljvqtyDjyj18jK0lzElj+zuTZhmXBtlDYzN1s86OVMfDhoD9gEHGemp5437pZ1PDJ5QjV+bc5mE1xOPIlOKRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYNQenTP8uXvk1zpCpen0JXocKvzcWKCbC1fMHIhkFI=;
 b=VtpahaODn34WHFLS6cIZsn+H0ebpP1u9d6PrwZqv4aNjPVou6LnUDVuZpR36Y98hxPu+I4WsYjx77AwI+5D5GUNfXloDUfVZ5WmaIT17wWCFyRkrgzsbTDjAELkz+Qvb7dYYSzTb/bhg+bFl1qNELKD0exAgrY69O1boYk1ak4G5Zp48o5VnYXEJ51Xo9b7Y5U90+36N1+uLl9ZE2hyqLCgDH0K6xoE1OrLbjx8CprdGYP/YV1OcXPSE8hNnYLpsNr81LqeIpi9mknwFqN7q0gmxlHFBPsa1GlTpvl/825yeNePO+Xb86JZHdNNAnTjCfDtyeXEmk9DSXaivs1cN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYNQenTP8uXvk1zpCpen0JXocKvzcWKCbC1fMHIhkFI=;
 b=dY2X99/yBnDoVkf+VOW/XwsLrCOY2KdhpmVQRUX3mk4QOQNPZgm9/rT3v9H9b9jD9tiJZ4uiSntNDRKUeIR4ptadWtVWemfFK1I4beW+XHIsxYCw/O1I/pvOGvSLJYC3LZEi7GTTDkzB/4zSOyMbPiVJmcvArv+qvx5Lk1R3G4I=
Received: from AS4P195CA0042.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::16)
 by PA1PR02MB11449.eurprd02.prod.outlook.com (2603:10a6:102:4f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 13:50:06 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::80) by AS4P195CA0042.outlook.office365.com
 (2603:10a6:20b:65a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 13:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 13:50:06 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 15 Jun
 2026 15:50:02 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 15 Jun 2026 15:50:02 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 93BBB28AD;
	Mon, 15 Jun 2026 15:50:02 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 90A5B1149080; Mon, 15 Jun 2026 15:50:02 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCH] jq: patch CVE-2026-49839
Date: Mon, 15 Jun 2026 15:49:59 +0200
Message-ID: <20260615134959.10013-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|PA1PR02MB11449:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ad5764-0fcd-4b02-bc36-08decae501ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|56012099006|11063799006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	aUxVoBS2PdfNkeSW9xJFKRtbOOrVjpIdDBf7RUzSYPZfRSwEiY5LbR/U+R+Axgi7ZAL0+jQ47wykJrCqN2ThpvFH16T064wjJzF+e80rWtnWZzEWV6JpOs39vDbtN4qbQGGYI4sEZd3GK7IBC+f5Tjd/WDAFaX/+cUaUNecqIKcqeRK+rkk1O1vIeL1PB/iafs2yZErgEYqc/mQ1QVjpI8JU78w0vkLe0EPxOOj7dUTNG3JPElL78iZA4DzWHKBMGP8Zk6bf75qR1zryP/szw8XGmcUTWTXpU8oWl/Zjbb0iYvmPObfIJTQRBF/bYZ4W/MAlsOUPIy7oudS7nnnwJp2j3f16RFknbmtKbk+BG+s4fLAtfJ+G8uXLhqKFw4QaPtSHvLHEd5f1Y/Qfxd8eAxS9SLxU/2UVe52AtjnSVVz0feX/dt1TJCGH0g/toyFPqhN1AQdCHM4/oS7WIVClFJmOm3LHFLYuTcKQzz4ixNU80NMOplwlLL/qTCstIKdKnaCgGP7E+h4AKy3OyFziJd+7ONp9rBYlffhZiJnE8S8OZzUtkYEM1qayvbk0yDZ3hSaKa4ppJz1jSajLtzoipFRw+Koo+cqGptErDV/yzTtfygNgKalJMoAa8VVy3SOoTRCbnYUNq3YYupulLh+44DdCo9HHIiU4gZX48m19LgiXB7WzWULZzGqpvHBxrcv5evou2As8NVwDraSiUIsbkZyASiFCKgy+EBNiP2KfBo4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KAaKm3TM7+zys/cGnzFOjZZdU729981FCFtgdBb1SqE30N0mt1AEnZ+6ryvY7OysV+o2XGJ6/XSJgVBS30OpEysBkkMcxBrmypawxZCfsJHlUncYOZNoFqP30ad4BJZIV0VTtuucc1hSYBoWKUXaFoRqF90YlLGBWxWdes6YV9v1sGh7wRK13+AzIUrzhE5Q/2UOBYXfsyF8FWG/F8Eqe5KWSUvyjUaPpDhodn+8SQXkMdVs8qMpqBPkes1JHqfmf471Af18IS/yewrLAZBOGJXwVdn2FBd723p3J3OTKpup6hYQJnD9RUev1eHGe6AVhoFJ9sxuF8VjJvEe4HxJoXs/beZ2WVkr9Vekxe/BUsEEByDe67X0TKo2rxfZkCWobgptY2Fyldt+ZEZecHhDLGmry5D5/TrDCUNFGZ4tO8ii/qq7+EQvdp6xPQnGD92f
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 13:50:06.2671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ad5764-0fcd-4b02-bc36-08decae501ff
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11449
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 14:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127584

From: Anton Skorup <anton@skorup.se>

CVE details: https://vulert.com/vuln-db/--4743

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-49839.patch                | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-49839.patch
new file mode 100644
index 0000000000..bd4bcf8e37
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
@@ -0,0 +1,34 @@
+From 59fcd85066bea536f259b6396a7a0a939a4fb369 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Anton Skorup <antonsk@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e987df0d463=
d85fd70825e042a082427e8275b86]
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index b10bcc0..40137c3 100644
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
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 7665ba2511..14e77c1bc6 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-47770.patch \
+           file://CVE-2026-49839.patch \
            "
=20
 inherit autotools ptest
--=20
2.43.0


