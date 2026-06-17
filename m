Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A943DCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:08 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9050.1781674251731018729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QtlLQKfW;
 spf=pass (domain: axis.com, ip: 52.101.65.64, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWkiefXdx7eCaZ2ZqaQsmy4MjFpCcKG5xZ7nxbxyJg462IjKYDIbZK5x+N4YV7m6mX7YndYj8FeFVVqODoTFwXAarPHfIF6aIevBHLDUdfgsWuaPv0OH7iXDIetPVPK435Xms1smj3G791wO33Z+5Bs6RwFwAv4rFBvI5gtFhz1ztlB6S/4BE19YrW2ZyGQj9Nt1HMrzTbeTfs3K+B6jnK4o7+EAc62X1DhDviy/1OpgmDIAQm6/3NODQzpBVsVHVLOLokoVaVXkOERg60kXa/potFHOYNOC8PpepAcX0MyI0snnAtJ3jQJjXy9x6ULlzBIMn4MIGvi7Bkn691AoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te6njP09JnzNU9y7kzVeikD3LfudAhnLMghjsJ8xkZ0=;
 b=e1i3iGWRYXht1yipQ67NowcYVtGmESB0x+MXgguuQbywABo/BE3Hmn2DSVv406nLU0kGy1ObJEDFe3tGrK3SDzBLoH1KFEFfIorxDyn/oLhcaPraUGfcSXv6NnaF6UU4Y4E/zEO2QBEYKfay6KZOnOEPOSo704oQ91HJ6bVzTfObkWOaubU5UhnAX2Af13J8e3CNu5wOUwbHHCgAUG+fjBZ76FEF1pN878cgu1cifjXYDtMBz0XUL52QlrWi6JYUCOnbEohTeXvitkOGg3X9TJQjQ5Kfrbwo0PcyC2P3plelYs2WESfJtktBc3Uz29UXXdi3OzZS+8d6n7CSUBJ5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te6njP09JnzNU9y7kzVeikD3LfudAhnLMghjsJ8xkZ0=;
 b=QtlLQKfW6uruNXBtcf0dbPv08Cuzy94frknoX6mIKXK9cYlDmkJzGshsDuW9BMWJLs9CzS7JYoy7pTnukmXwfOu3Zkm0H1LltzAfSp/7uMdKDpOX9eCfxqKNklDrkfscdebUTKAYH+LdJTVtZqmrkGipgV2QU+VD5Ed0JPsvMtI=
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by AS8PR02MB10202.eurprd02.prod.outlook.com (2603:10a6:20b:63f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:30:46 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::1c) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 17 Jun 2026 05:30:46 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:45 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:45 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id A8C72551;
	Wed, 17 Jun 2026 07:30:45 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id A77068461E6; Wed, 17 Jun 2026 07:30:45 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 5/8] jq: patch CVE-2026-41257
Date: Wed, 17 Jun 2026 07:30:37 +0200
Message-ID: <20260617053040.990143-5-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|AS8PR02MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b90d3f-f770-4465-7c31-08decc319525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	5uFGTlutfvmDYWn0zEr27qSgCmK0f3/yrL/qUkPVZV9FE4Fx4r7uK6WbvXBf1xhL5l+iEf7XLMetjhWN4vAKpaVzhVR4I/1pyO2TBTXRqyD6Bjcs5yloSJ+GAoXOJUB8Eys2PIPSBHFgl58xrHAB6vTLVmJw3XI6Qr+yLW3MVCoPZQGpQpuIk/4UXqPhX+e/S6rslKdUo/snajPdEBlhWh6sFVgFr4MLifgj+O6S2zrM5555AgiLYALYycy+fr76Z0PyxvDdPy2UyJRn69ETe8T0BrecXyGxs19QsK70UvPxQYBqUIUqDTk4/RBeBESQmmzNNLklAqNM2FedOvfLQsoDUdORVP9RBE/QZc41Yj5aMQCr8CaLrJDV8SAyt5GNw+rlRF1PcCNhOd2oj2iOd2iqXe4c4nDqJbzObjuCdjv6ygUNnYCHcAhxm/ChpmuTidH4TZpjXwgB+Ml6C/n0lFS5VWUDZk98GD+stzwbac2aPpjNvUiE4C4TW0Cz82UC5REc71X03KzYPjwH7D8DB1vqCHQAcSb77iWU6MTijd7jRz8hSj6o6/+kC9vlmku04DOSuB+X5Crqvw7Cn1Mvpi755vJY9WRE3uQEOGzylT0XqaeiPv35Q3o1lhBN3sbudTUVGK54Ukooh/06tMS/Jl3sNmBgNMS6XoxksECdZScC2sK8OKp1YFdXWzUY191G4JF8Bz/wosj/hVH6yjRIHxNiOBUSqig6h1tgFNtsjd8=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dfx1Kt83km5utvGbqjYzUvbX57iN1VrLlv6kfuVIKLdjyBru47Z8LVirC8qAOpoYpmiNXHWlEnsunGa2KZKa82+fE10i21FaGLA2NzsrnOe5R/ugI0wM+uD9n0qHH/VMpLumFoHyEoKFgNtTnvEBC1Ol9c8lYvIs5MB7lPDJ0kPOM9j+wTw5m9gSllz73q7hT1QmUsU1wZQMyLXZgOHi2gGZ51aIPXJ6dAF4ewAOr4y5BHG2CDKkMDTTSl7XbGLRmCfPrdI7y7EItx/aMX9CUIt1IBFYE9Nld0Y7JxWbNIHElrATIB9w5Mb3HAuitJMqUpS0jv47s6cFX/LdqYJ36tNIWngtEd+sdJ+kApGxaihHw5x8ZEaEW4fSjlBiMADGzViEss92AKUj2LuTOzi4nIARvvYrCLRV+qg+0cOKuLbeWb/RqTbtGPtc0YsEjcvS
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:46.0400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b90d3f-f770-4465-7c31-08decc319525
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10202
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127630

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
index b0779b389e..9af7e00f3b 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-41256.patch \
+           file://CVE-2026-41257.patch \
            file://CVE-2026-43896.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-44777.patch \
--=20
2.43.0


