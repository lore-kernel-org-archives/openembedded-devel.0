Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBCBCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8940.1781674253999596491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NPh8C/So;
 spf=pass (domain: axis.com, ip: 52.101.69.7, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4utfK4VgE3e/of0WRWFUKg5GgkMrxB7fDfDEWvpSRt8BIFmQv3BVSPZ2CHt1r1teSDLPMUlT1QN21mNe61v2FL3eT+dUMhUiu4NHisjbHtx85y1timo0/nuid+DCwhVCUaw30g6Hc2onxZ46cyRdqoDQrd4Mfi4M08ahbA26qEJHylRQ0FJxFLLYwiyS0GDRu3uZEYi2WI/WeF9hmZHz7xrKbK8DXcMDemrxALFhFxZw4HzdxDgdcS09HlIWh6bG3F8geZJCaDdS7nhqRFRQ2xR8p03fQal3lD63QM02RZoSuX7nWZjOMNXxcfxshc4f1pzIOBqizgc4bmlf4Q+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYWdjMYXDyTTBuf8jJhn4ZmdU1Ps2OzHaKYH3FQiHZw=;
 b=X4nZlJX4q/+TmrElWa3z/M+yDxg3ITbXeFj+fjcyOEUiSkyXvj9VMHkgU5FWkIu1KJEUMg3VQPPXvnj/RcZQiEE3M0k9Rg4nU375RbwwcOrY9l5assO/zwXXMYmhscfMrTvpBFhrRmKiJ1awjFgmUjLpW2XylWCp7x+svSThEnCqF2Y1KfUj7pWYUU9T9NXukN4VtIXGCy8b9987zCQR7YzwdVZylo7CFQ431t8d0ZrNfZDSeUPfXngBtSBcBc4udikKgHzmnW0AM7Rf6amry8WSLZKvHJC9JET6Pb/pZ6yJ/oA1luNJoLTVf/j3iY3gMeYIY0UX98bWVJLh4XDBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYWdjMYXDyTTBuf8jJhn4ZmdU1Ps2OzHaKYH3FQiHZw=;
 b=NPh8C/SovEmmHHGWe8/rpPKLIctG3IY0gvCpog4CA8dTc9ONyQK5TJzjP+cHT/Yb43FM6nn5v7fBvTC4c/GeCIJkLutIKUaFBc5eh8F9Wu9D/lDubv9iedH2I5QElk+kUUQIW2AHx0aBQnk0I8AFjB+q5U5ztuMO46bMOh6zv+o=
Received: from DU2PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:10:3b::26)
 by AM9PR02MB7025.eurprd02.prod.outlook.com (2603:10a6:20b:273::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:30:48 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::33) by DU2PR04CA0021.outlook.office365.com
 (2603:10a6:10:3b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:47 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:47 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:46 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F0857551;
	Wed, 17 Jun 2026 07:30:46 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id EF2CD8461E6; Wed, 17 Jun 2026 07:30:46 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 7/8] jq: patch CVE-2026-43894
Date: Wed, 17 Jun 2026 07:30:39 +0200
Message-ID: <20260617053040.990143-7-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|AM9PR02MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 792eca20-442c-40da-fb0d-08decc319617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|11063799006|3023799007|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	rgmptkF3Zc85S4IPls1EdoC3eRzopilzPkj0Mk6rmBr9CHgTIOL6YK2t4i3RH7T/YyG6BlBcUr50hUMPhlASbR1KF48L/TPdD6dxKJQ9yUZV86BHnhZQTYoNAm6awfVmtiu0VXNtCpYIuuEcdDjX6J23T/Vnn3hNMNXEYADdrT83sxDj2y4ShWt3DxBwQnoWVJJE/oCJGf6vfcIUsqXOJqnoycMtmI5c1OJz/UITGnKZkJLJ3WfKLUVcb/4TEBjH0e/0XGCmakQNQI02q4LmpUrHsxSiQPJRroAIrCCqChV+jU0bA56UafGfoJLgrmc0en1ghQfK7+pMYR2GX4DmkLGP9MCix+gWjBIIKoi+AiUv+nFdfVde5D1HNt9DHk32BVv/DQTiuiqYtvsNUrCE7PJAYAVxozUx2JAKBOLX0vBqk+f5pHR66o+JQPfG2hfu2JApj02AKFzpM6d3is2jZ8FTBMZ5m3NbE9x1rr90KB876g1nA4ebPhaqM+BMl+ZcwrYk86VqmUrnm9m0VrvyNJaqa/Lf3qpIg4MGsjD5zuWuIUezRJhk25H2tkoQfgyUQxQZ/kQ18oeHkT3UCBzM/Yc6RPTFqfA9X3SiMFMY1Xeh+lu43KncuwBTXFW1WEfNazGJD/Md618qn3B8qM9ivjatq0XdpzUsTnnxTwjbBCLfLq8NocQANRreHsPiuMVvoMVev9FSnTueGmdaQVMljTcP6tKxnznmrTRl/NzMyfA=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(11063799006)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fPex/5LaPvWDYItoMM78vuNzYm5hv6FRwWEKXJqDdt1jMqI3tMolCd+jJ6gWoQ70sSJ3BsQ6NZGUNEE/b0dl3ygRVeU1AyDpA7IuUwof24EzexGuIXEdy3ZQiS4XiIWTpEYzEASGWZ3jWEJw7xFtBROX4zELIa+hCjkx0LGMkqMYnpknAVwKtaMIvn0pGi/UY2qyltiyRJfEVIlaOgcbcs4j/NsbIsCVvyGcPjmya5B+nBivsBXvdLSDPsBhRq7Dltailm20eAXmNewPBw0pGXJtA5q3XL20NXLIqXREj6N8JcYmrma+O8Vzp7ML92HeC3qjqhLKsX/0xlFXKLSCbMvWwnw7bymedglDMGKKsc8x5ci2y5EOVPgNplTOGNN0i5BIM+JZCkjzE18MctYSq1qbeuglzj5wROyJTUftvHFn64K3WTOEQXoe1lw7hn1q
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:47.6245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 792eca20-442c-40da-fb0d-08decc319617
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7025
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127633

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-43894

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-43894.patch                | 52 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-43894.patch
new file mode 100644
index 0000000000..3b73647de0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
@@ -0,0 +1,52 @@
+From 9761ceb7d6cc48c16b25f0ab1baaef0e701927e4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 6 May 2026 19:45:24 +0900
+Subject: [PATCH] Reject numeric literals longer than DEC_MAX_DIGITS
+ (999999999)
+
+A signed-int overflow in decNumber's D2U macro lets huge literals
+write attacker-controlled bytes past a stack buffer. Cap the length
+before calling decNumberFromString, and pre-slice long strings in
+jv_dump_string_trunc so the resulting error message doesn't itself
+allocate a multi-GiB buffer.
+
+Fixes CVE-2026-43894.
+
+Signed-off-by: Anton Skorup
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/9761ceb7d6c=
c48c16b25f0ab1baaef0e701927e4]
+---
+ src/jv.c       | 5 ++++-
+ src/jv_print.c | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 84fafef666..074ee310c5 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -570,7 +570,10 @@ static jvp_literal_number* jvp_literal_number_alloc(u=
nsigned literal_length) {
+ }
+=20
+ static jv jvp_literal_number_new(const char * literal) {
+-  jvp_literal_number* n =3D jvp_literal_number_alloc(strlen(literal));
++  size_t len =3D strlen(literal);
++  if (len > DEC_MAX_DIGITS)
++    return JV_INVALID;
++  jvp_literal_number* n =3D jvp_literal_number_alloc(len);
+=20
+   decContext *ctx =3D DEC_CONTEXT();
+   decContextClearStatus(ctx, DEC_Conversion_syntax);
+diff --git a/src/jv_print.c b/src/jv_print.c
+index 5c86c5d97c..bc251070f7 100644
+--- a/src/jv_print.c
++++ b/src/jv_print.c
+@@ -410,6 +410,10 @@ jv jv_dump_string(jv x, int flags) {
+=20
+ char *jv_dump_string_trunc(jv x, char *outbuf, size_t bufsize) {
+   assert(bufsize > 0);
++  if (jv_get_kind(x) =3D=3D JV_KIND_STRING &&
++      (size_t)jv_string_length_bytes(jv_copy(x)) > bufsize) {
++    x =3D jv_string_slice(x, 0, bufsize);
++  }
+   x =3D jv_dump_string(x, 0);
+   const char *str =3D jv_string_value(x);
+   const size_t len =3D strlen(str);
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index aff33589b9..87917b7c32 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-40612.patch \
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
+           file://CVE-2026-43894.patch \
            file://CVE-2026-43896.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-44777.patch \
--=20
2.43.0


