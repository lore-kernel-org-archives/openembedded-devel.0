Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F24CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148003.1781591289593908342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qclLbNoc;
 spf=pass (domain: axis.com, ip: 40.107.162.42, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlzPuCK1pWROqnYkaFj2sq/grj1W2zHwKl/sCkbqtb41aRVh3sbZUPQ5tEakmu2AVxl8KVFZK2/XKEqElXRrMyCtt52UoaBV1UdwTGsfCh3iT2ZQDCrZLsAEjSL7iYS9gb8wl5HxqX97lIjt3UE4Dst1NRYztAexq+qwyzLPX0CSIfS5qqj3QuXGJ0haI2JOkHV7LOcGJTIUlAlYojakKfNTaO5VtR6Yi1VLbCE2+mhMEx8IsxDYqP06DQWvvc5bgd6qKha5LHVlxL/wPpWOqa/yID/XfWy4W2mTpAbePCHAO9ioxbDoinYtt9hV4Z4ZUaf/zrXAUg556+x8VazcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bysg2t3A8XalXcxXb1b+ENIYsIxI3F5r05pNGHdBFg=;
 b=V6TpxUDwyocyB+PDeVAdXFB14FUVAqv+yekdZYm2hcwxRVAzeFBQiVxm8AOWshhjWuCRkculGBnN0nttoqLvjdMkovyDFq5M6mJLiCIJuncyAPsmfMz9D6NPvqRlT2hmYuCMxhjgKoKZD2xJ5kBO35LPJOb8VpkP/uKe3WGvmjVtd2113JiWfSyvhVYy48Vgywi3QaOugifsc2sNWOGGIxJPiNDNu+aJ5c3pFaGxiHmeL++ot1wEGqn7tbxYHidFeWy/xnrQqnpNAKPx559VyMzVcSob2WbzlEIY3L7zfCFPIHDD2GxOC1YShbmP5HqjfF3u7KqPza7x/jqJcdt3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bysg2t3A8XalXcxXb1b+ENIYsIxI3F5r05pNGHdBFg=;
 b=qclLbNocccrWhmklr77u29LbvXfITW+3gX3uXKpJMMnpBsQdC1T7dB3yvlYv0UHgEbf43I5AZJqMxCaBo9bxqP8lWv0YfMIqINUPbrSYWlPcBOxYCkSp5gBJdYawawlrWvFlLu37GAlQfCxAssbRx47iYrHVAorc4mJ/L9xWRAA=
Received: from CWLP265CA0432.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::11)
 by AS4PR02MB8766.eurprd02.prod.outlook.com (2603:10a6:20b:58e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:28:02 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::5b) by CWLP265CA0432.outlook.office365.com
 (2603:10a6:400:1d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:28:01 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:28:01 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:28:01 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 18BA42480;
	Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 154B78461E6; Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH 5/8] jq: patch CVE-2026-41257
Date: Tue, 16 Jun 2026 08:27:51 +0200
Message-ID: <20260616062754.748436-5-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
References: <20260616062754.748436-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|AS4PR02MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 471096bb-d8bf-4875-7e46-08decb706a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|13003099007|22082099003|18002099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	PJWqUX1AWjsobPeXa8N+03xavxIvjXnUKIPdu1+WyjIm/kCuriZpqJWf7ATD9oHRYQjCLpjsL2LoM8g4qH+rsLqiYRFMoglkmLg5sKZqy25YO72R3/hjtt/gRY8VTJWzGMAlP4WPZnL1sqowiBBrIdYqN4Ij+7gq/OD1sjrYVAAPydEfKqHBAObadJdti+8XFQUSVcTeCwLL42Q8HpCknu/YbjAXC8kE1koi+gzT4MLi/Apo53HGXQUY8vJg9ct4Fl1AuYm6IzB/q1GRp7rSK10OzuHB3egc3CxkZw8tggQvj+zRFY7vNuNaomd+CFCsX1aO3oflhoPs6mSFjdSlQxmkVs0MPM5TStU5vWmbrgSYGFCeYQMmwgd+QW8r9ipDbnSomLmv6x1UqC2BdRegJAJMW7MjL9IgHV11gM3KEZBmdJICbVY/kJ3wv6Pw7QWHBLUtyr+ysgDeEx6aI9LCeYM5JGf5qhYYwBiGiVGmDtsC84rckWYpWTEMdorEgUm41P9nxhdKhOEzwb1c8sYlLNpHG7S3N528WP/fU2DuTcQs3LQoVoYf3Ui6gNSeTuHxWNj3q4N9YopHsi5rA6fCXANHw+WSNohgnfACPtdM3HH5I2/sL8DcbQDa/gh5rnpD2CbjZwYU6feb++xFuwXkf8LheDxchDkvGeCc4DHXq1f8r+bdlW8w0GHZrZ0kCc3oJide3qkf/OIHrS5BmqYsWn+m6btr/XFfE7LSzHOQwBI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+EdtVqdgV2BJQ27LdqvIyyfELyWxEHVL1aEqkehRwv5jWoxO7IwUZRwppJ40kuhotil30j12bgPFRhP+kh2msyMb3e7h46D78RodDyoOYKXgsOcNRmeWHnOBI2Idm/NHG4uMYJIgnxp1aV4SmeMC8+TiJVnKRHeDKBFnMjWjam+ARQ7ir6wEwEs4iYNfOhxuPX2U+ZFl7IdJIqk1UZ4Sscq+MzTJ6trH0LqKqWHHPtgfR1YBKhmF6QtlgOKs/p4KdpoE1Hfswo4ZBkeuvh7laWBinI9PMCrVBRzAyP3tQJP2WLOPB2lhgFXpfukOk3GslHDIppjNBG/eg1CRSBKLSw7FgKsrkYFfNQaVFrUS6sAP+gLVPGwFJYCveQOZAYYEMR47eaPdSyww4i04egDA/x2vld+BNEdvxNVarbYNLaCEHE84cTBLCFoDjuL1CdV6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:28:01.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 471096bb-d8bf-4875-7e46-08decb706a9f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8766
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127611

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-41257

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-41257.patch                | 52 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-41257.patch
new file mode 100644
index 0000000000..8bf3ecd325
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
@@ -0,0 +1,52 @@
+From 01b3cded76daacbfddb7f8763700b0803bcb5c6f Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:09:44 +0900
+Subject: [PATCH] Fix signed-int overflow in `stack_reallocate`
+
+This fixes CVE-2026-41257.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/01b3cded76d=
aacbfddb7f8763700b0803bcb5c6f]
+---
+ src/exec_stack.h | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/exec_stack.h b/src/exec_stack.h
+index 2a063e8cf9..159c56e4fb 100644
+--- a/src/exec_stack.h
++++ b/src/exec_stack.h
+@@ -2,8 +2,10 @@
+ #define EXEC_STACK_H
+ #include <stddef.h>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ #include "jv_alloc.h"
+=20
+ /*
+@@ -81,15 +83,19 @@ static stack_ptr* stack_block_next(struct stack* s, st=
ack_ptr p) {
+ }
+=20
+ static void stack_reallocate(struct stack* s, size_t sz) {
+-  int old_mem_length =3D -(s->bound) + ALIGNMENT;
+-  char* old_mem_start =3D (s->mem_end !=3D NULL) ? (s->mem_end - old_mem_=
length) : NULL;
++  size_t old_mem_length =3D (size_t)(-(s->bound)) + ALIGNMENT;
++  char* old_mem_start =3D s->mem_end !=3D NULL ? s->mem_end - old_mem_len=
gth : NULL;
+=20
+-  int new_mem_length =3D align_round_up((old_mem_length + sz + 256) * 2);
++  size_t new_mem_length =3D align_round_up((old_mem_length + sz + 256) * =
2);
++  if (new_mem_length > INT_MAX) {
++    fprintf(stderr, "jq: error: cannot allocate memory\n");
++    abort();
++  }
+   char* new_mem_start =3D jv_mem_realloc(old_mem_start, new_mem_length);
+   memmove(new_mem_start + (new_mem_length - old_mem_length),
+             new_mem_start, old_mem_length);
+   s->mem_end =3D new_mem_start + new_mem_length;
+-  s->bound =3D -(new_mem_length - ALIGNMENT);
++  s->bound =3D -(int)(new_mem_length - ALIGNMENT);
+ }
+=20
+ static stack_ptr stack_push_block(struct stack* s, stack_ptr p, size_t sz=
) {
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 082a827041..bb4601b667 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-41256.patch \
+           file://CVE-2026-41257.patch \
            file://CVE-2026-43896.patch \
            file://CVE-2026-44777.patch \
            file://CVE-2026-49389.patch \
--=20
2.43.0


