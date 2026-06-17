Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA3CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9049.1781674251678268950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TQettzO/;
 spf=pass (domain: axis.com, ip: 52.101.69.31, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbIHYio1B21ASfUK3592oNP7Y/m636cHadldQK/06p95VSQLmvMp78MslVcZW4KJ8d3R4myM0bwI1hhb1vFcnTzVmFpvR4GC8pKthQH6OIwE5TNJem5ESxmea6ChdJOK9uHfkPJqu5zRy59b04BCw7NBtxuJAGZcdOjWeFGF+j94lJ75uk1q3kPQ2eJ71BdpBZsop917tCqT8/5VpnZ/qAqCPnYhB13LtfYQh0miNmdhzEDAL75+5mbN7Rty86NvDLqeP5TysZAGtUFnN7Pexd0l5+WAkGmPd4VaXjN4SGYwdJy/y37lYCSZv3/1EWwD2OMJZtYZerJ9cp+nLFL+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI+5cZC7PvKzNgl/khIA0SFMcb3eNggBYJPmEbDcf1Y=;
 b=vdkrQoCoSArSJ5fj/rEsbMyebJKtcO6enSRDasDsjLq+Wu0MeXTgNcWUVpVF5ccJvsIY2alYvBJIge4SDQNTRSp6StcJle9RT9UmdZ2WjdooQebXT8s10CkPmw5KJ2tsGCvMJmPRpkPJNKd07SxMlL4O/mmVv7gT8XndNYQP4SOK4tfeytixgF0vKAc4/vNrExZWbhQHQqQRYagqRF4xZnenQHzeaGmt2ENtdmQYGCuW3ygkVembH9D+pg0WwGLDEhHDvqnnz1WzLFR1CKAPPtHsk6jeBon2d8gALITM3BHJupKPH+F04wiiBmlLqbXuMXfZrvR/8eRCt8NBr78xEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI+5cZC7PvKzNgl/khIA0SFMcb3eNggBYJPmEbDcf1Y=;
 b=TQettzO/u4DTzDADB+OkCxnLIfKCDpprd8jMt8U2OtTRAzZIWu7mv1dFZZrr8a2gE0inG1qCTZqx0MAYHJeCZ3G0X1sHnTtfw/XRSJ8PGVKN9rISqDYmjnOKzVHyEXdG4/k5kqPvvY1TFv936YTgsbZcQRQwby10hyWD2aBTMhw=
Received: from CWLP265CA0494.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::13)
 by DB9PR02MB6602.eurprd02.prod.outlook.com (2603:10a6:10:21f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:30:43 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::5c) by CWLP265CA0494.outlook.office365.com
 (2603:10a6:400:18b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 05:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:43 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:43 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4E3E12ACF;
	Wed, 17 Jun 2026 07:30:43 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 493FD8461E6; Wed, 17 Jun 2026 07:30:43 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <antonsk@axis.com>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 2/8] jq: patch CVE-2026-41256
Date: Wed, 17 Jun 2026 07:30:34 +0200
Message-ID: <20260617053040.990143-2-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DB9PR02MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: aa72ce08-45ec-4a2c-82bf-08decc3193ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|13003099007|22082099003|3023799007|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	4fRANcK3hjpPmtXh9vEPGz4rDuzjdCmAou8dQJjp/eGeQ7W3lrRU4fmk+e49AqgYcb01RkjA3kXdEuXGuwSPxL33m32j+6/3xi9+aLYMNwJA/zMJN44oC5LSCsD/B/2NdrKW/5d2qSHFLwmslWx71oRhfvONrY/1SENopwSVYgHR+zS1U4DWW5MHs3i7iRHVyuI1MWZ3xCBdvEPuR62qUZ2dxs8r5CnU+C/O2K8pMhHlQdDgDn/8sfrOrXiPQvD6m6v20oYk6uiEvUDdPDSNPE3ZqzJm5a3MghOhpV7CqTyABw6G+fncL75+dST37ibtALfFoVy91XRW+1w1OvecK3AqKLBDq/VuCRBP4O0yfOsjnTpDmy9GdNqNdVpKiCdRLPjGoCp2PIV18vIBfhMz7ZqSeaageF+cQiVN9c+Tn97s8sgX2TByqdfMch0k4N0sEE6gWQ2X46POVJ24yqlkEcjwOlt9cmSNSiFVVkJZtH1wXt8caFvkgmsLtimZpLk/321+pDcjUW/vGGJcEQo/B/oqMM4irC9WuRTrVxPIcAiint8Fb9WbvPw5U6ecGJOA5a7W1Iol9fSArBdAnyG9m/NNhzwtf/jGkjjJr7ieOXAGSN7EDy984tsuffO2kZ7pkarA1hsq3LRO+dqkuBZx0cdaQoVza3IMYyZZYLfuoFFaQHkq3HqJOpEBDUmGgSjFjx8d3sxGGvh8Brup2BZftQMgmW0DgktyGPHStjPIWDU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(13003099007)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pTkBMiah1MEAKnqwGqWIMNtE37tksdd6mR45LIYmOWTEO/gzgIzXaR4KuKHCBtyMI787gxqDzxrJM70db+PP0th7gf9SUlbv+v5T+ABm8J6B2InQFAz6wZdwXDN7QywGIC6v7KkSKMw5ZS/6L/EwPbbapoW4wXTbnissQ7SwOauNa05JoO06WzxPlFO9szOFHFAUJbDeCjFkXc5F7vS0N8irp88b+A6G7lchrNo08QskRort7I45mATrcD1RnsEfOX5hpaFRCiMbyCppSPc4pQ3Wd9oP2dDjUHcgTA3f57K0P9FjZtryoogCf4Ynn5MBiNdsjhIa6TLqz3IcyoXf3Z7sr70gh8JJ3+txo+TA/qUT8qEwe9uBRuRPUytnPFW3Qn0mey5U36XnMafVM+oyEMn8DtCbfVJjbTEAzeqAHvqJZ3XaddoTJtNsF+aY9CBe
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:43.6642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa72ce08-45ec-4a2c-82bf-08decc3193ba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6602
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127631

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-41256

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
v2
 * Rebased to master-next
---
 .../jq/jq/CVE-2026-41256.patch                | 49 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-41256.patch
new file mode 100644
index 0000000000..738a359e6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
@@ -0,0 +1,49 @@
+From 5a015deae35d19e3ebbc65db6c157a80e76df738 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:15:08 +0900
+Subject: [PATCH] Fix NUL truncation in program files loaded with -f
+
+This fixes CVE-2026-41256.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/5a015deae35=
d19e3ebbc65db6c157a80e76df738]
+---
+ src/main.c   | 8 ++++++++
+ tests/shtest | 7 +++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index ce362607e2..fb5c7ab8e3 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -612,6 +612,14 @@ int main(int argc, char* argv[]) {
+       ret =3D JQ_ERROR_SYSTEM;
+       goto out;
+     }
++    int len =3D jv_string_length_bytes(jv_copy(data));
++    if ((size_t)len !=3D strlen(jv_string_value(data))) {
++      fprintf(stderr, "jq: program file contains NUL bytes\n");
++      free(program_origin);
++      jv_free(data);
++      ret =3D JQ_ERROR_SYSTEM;
++      goto out;
++    }
+     jq_set_attr(jq, jv_string("PROGRAM_ORIGIN"), jq_realpath(jv_string(di=
rname(program_origin))));
+     ARGS =3D JV_OBJECT(jv_string("positional"), ARGS,
+                      jv_string("named"), jv_copy(program_arguments));
+diff --git a/tests/shtest b/tests/shtest
+index 370f7b7c69..68705df255 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -886,4 +886,11 @@ if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; t=
hen
+   exit 1
+ fi
+=20
++# CVE-2026-41256: No NUL truncation in program files loaded with -f
++printf '.\x00invalid' > "$d/nul_prog.jq"
++if echo '42' | $JQ -f "$d/nul_prog.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for program file with NUL bytes\n' 1>&2
++  exit 1
++fi
++
+ exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index e1791ad099..2092fe962a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
+           file://CVE-2026-41256.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-49389.patch \
            file://CVE-2026-49839.patch \
--=20
2.43.0


