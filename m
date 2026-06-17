Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7ACCD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:13:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9048.1781674250728004182
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=KA6GZs9E;
 spf=pass (domain: axis.com, ip: 52.101.84.71, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTYQAcAaGzeZtNrvXXagIV3Xk0AiDRJNXO+QaqwVoGjGViluNPbC5CZV/72PuhdLvhshIzEEfdO/Pb76J/eU1QBMebtaVCqWmS6RA47ctVlsT6nfnWPD1gDlYbJkJ6j8kT8oboaiUfzRDaJL3Uq3RfhZFeTdcRFSmdwbNLSJTtcyzhJ+Fon2vlu7M4xlrxFgfZOdicg1rhsIIS9KOscqMoYT87YiT1RGxYhiOWVeTug46akm6SrYYg/jIEEZTySKWABTHN4HY9zi14UcLkJDStzhMsfx/FWpUZb956MCaNL1jmXhHfF+EW1Uav4Bw20Fr5HZTezTk0H0dV691t/rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRqLzmSZr/eOi1s2oWy4jJAriqUS6lE/YMWIic8bQYs=;
 b=wGUezLpTjh3l67qpqpyLgngXEJI4iNQbZ9X2sDi+AN+DfK3TogaXKmSKb5HHTchyosLCOrKnPWprovjlzAYWgo9YFWN7/fnXcTWoIKqZ4I3m0shjHlC+w0jA/Edv7rMZOxkM9D4ep7iKMnng0nX3U5d3nnCYKAFwVSJMDBrvSh5GT0HzUI2pNhS6tlTPVtLlGE59kgSZ8kkNzTnKiVdWLs826C8EaKVm3leQtHR/RFzUQbFL5IbMWMfDbNT/fFuptuE+4s4Q41zmrI/SP0GKwhJmIJ0cylHYiMGvdNQxyIRfwDg1G/cLWk0CrxRlDLI1dLEMrQsUkNl8VD1JMRy7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRqLzmSZr/eOi1s2oWy4jJAriqUS6lE/YMWIic8bQYs=;
 b=KA6GZs9E+Lp3MzcHarurCacZkJqEmGuzcFCuA66yQARjlUH+hrK50L+0a63fl2mG+sHhEwEvTzZ4HvBbHPY++NnuIMxEHaYZ/zfqYwrNSqSD7epZDmBYdbH2LXK9CCaUZPCFuC+5Ejq+XRAhRCoceD+0feNrNRtTHyaDHyCphng=
Received: from DU2P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::12)
 by AM9PR02MB7060.eurprd02.prod.outlook.com (2603:10a6:20b:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:30:44 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::74) by DU2P251CA0001.outlook.office365.com
 (2603:10a6:10:230::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:44 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:44 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:44 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 270952ACF;
	Wed, 17 Jun 2026 07:30:44 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 2219F8461E6; Wed, 17 Jun 2026 07:30:44 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 3/8] jq: patch CVE-2026-44777
Date: Wed, 17 Jun 2026 07:30:35 +0200
Message-ID: <20260617053040.990143-3-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AM9PR02MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: c235f109-4f03-499a-60d9-08decc31943d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|11063799006|6133799003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	PazuteOBt/EsTECVX1b6jec6ih2z78sJHmEBYyTGmTmjdN770NTmFzIILsIbW4zXmfYKqejTzQBTnJDm3vG42+h1AEbpNaUo6vLX1QPIuOcrIIGaslwJHjXB32MQNMQDkHlt2/6rEwgUkkWumYphBh1RZXfVAQoRLftjCidB4AM0I3JqK5rOEZyB6LMvAuA4h6KOUD5Pnzt3ZB9yD33rMlStCHGjcfULgO/AVWfi6bqoTxK4KaIachpAhx0E59XDUPvpTEF57Y10ffQQpZv21tPBdEpdjKBLHDZoFFAaz0pKwlC6+T4Hye7Khmih9mpYGrdYTIIp9hvmGVxnWxwe6X7qAHzJpWS3BAGf92KZMtXgRTtXYvRl1W4ztFz8Vauxr/5Tr0hIoKIlp0ciP5XY0n4gjcPOsCNfOP+vt6JcJQcxeu4HwZESFhqhJ7H3G8bLxKpgyOGug+2UEXoBKJQjk4xz4KdzH5ySTGv2Hp9FDZhndsmTJtz+UXqwoelWJYiteglvrcRIBi79xvJAQyDLSlCkuyUXUePmlLsy3dcXT+1s6J1XbX+oRsRolXQS/lkDyBtvYCTLflWpgzsJvoTS35Xske6OLlfVz2THAkSgf5mxjmFhJx2rLVc/eLDcUA2/5Izq1PsN1FqPuXBT/S0tROHMEvLRwypkkCB3WrajQeRuBqfRzIL6XypQ6+RNuetUudcpMllsNjQZl+YULc2AI1A2g7Wn4EWX+/6rNajJHYM=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VlGmrmao5q2yL+9TRBeEgzNQfdy7PBkXkZDuzMwDijGpMUUwSOhcu4tgA6bAC9RCGMHe7JpG8w+W1rbc8rjvqDxaCYW1hxZNDCfD6HdJcTKe2793M0y+ugeQt9Gj6bul5D01g4+qwj8PTtGZCuHf4UM246srRX6Itf2fGlot2mzsqVzEB0yeRMPtkHJMaYXviEy1YcGUjcylWozvvQ+9NKeSdWbuWsrjTM798z2y60e9NmjJ7DzuA0LmnNfncEWk8M736HSDoz/zqI4gGrcN2o0EMWexgv7ffsnJr52MknOZ49mwrWSw/bZx692Gvjlhkkasbc3CoJOW+F3GjBi0F6GOCc/rxZa4AZDkhl8tVH7tYuvEQY1+qIeDz3LSsyLyr9FifZy/xeG4bQz/4jfQzjojzMPl91RC2EpYuMOVcduLIQosi2bqIPGRuE40mWKg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:44.5212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c235f109-4f03-499a-60d9-08decc31943d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7060
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127629

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-44777

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
v2
 * Rebased on master-next
---
 .../jq/jq/CVE-2026-44777.patch                | 233 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-44777.patch
new file mode 100644
index 0000000000..f6bf926a0a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
@@ -0,0 +1,233 @@
+From f58787c41835d9b17795730cb04925fdba25c71c Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 11 May 2026 20:41:38 +0900
+Subject: [PATCH] Detect circular module imports to prevent stack overflow
+
+jq used to recurse without bound on mutual or self-referential
+`import` declarations, exhausting the stack. Track each library's
+load state with a `loading` flag set before its dependencies are
+processed; a recursive reference to an in-progress library now
+reports "circular import of X".
+
+Fixes CVE-2026-44777.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/f58787c4183=
5d9b17795730cb04925fdba25c71c]
+---
+ Makefile.am                 |  2 ++
+ src/linker.c                | 59 ++++++++++++++++++++++++-------------
+ tests/modules/cycle_a.jq    |  2 ++
+ tests/modules/cycle_b.jq    |  2 ++
+ tests/modules/cycle_self.jq |  2 ++
+ tests/shtest                | 23 +++++++++++++++
+ 6 files changed, 70 insertions(+), 20 deletions(-)
+ create mode 100644 tests/modules/cycle_a.jq
+ create mode 100644 tests/modules/cycle_b.jq
+ create mode 100644 tests/modules/cycle_self.jq
+
+diff --git a/Makefile.am b/Makefile.am
+index acb94435f4..e2321bb196 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -232,6 +232,8 @@ EXTRA_DIST =3D $(DOC_FILES) $(man_MANS) $(TESTS) $(TES=
T_LOG_COMPILER)     \
+         tests/modules/test_bind_order0.jq                               \
+         tests/modules/test_bind_order1.jq                               \
+         tests/modules/test_bind_order2.jq                               \
++        tests/modules/cycle_a.jq tests/modules/cycle_b.jq               \
++        tests/modules/cycle_self.jq                                     \
+         tests/onig.supp tests/local.supp                                \
+         tests/setup tests/torture/input0.json                           \
+         tests/optional.test tests/man.test tests/manonig.test           \
+diff --git a/src/linker.c b/src/linker.c
+index e9027004cc..03f46db05c 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -20,9 +20,13 @@
+ #include "compile.h"
+ #include "jv_alloc.h"
+=20
++struct lib_entry {
++  char *name;
++  block def;
++  int loading;
++};
+ struct lib_loading_state {
+-  char **names;
+-  block *defs;
++  struct lib_entry *entries;
+   uint64_t ct;
+ };
+ static int load_library(jq_state *jq, jv lib_path,
+@@ -303,14 +307,24 @@ static int process_dependencies(jq_state *jq, jv jq_=
origin, jv lib_origin, block
+     } else {
+       uint64_t state_idx =3D 0;
+       for (; state_idx < lib_state->ct; ++state_idx) {
+-        if (strcmp(lib_state->names[state_idx],jv_string_value(resolved))=
 =3D=3D 0)
++        if (strcmp(lib_state->entries[state_idx].name, jv_string_value(re=
solved)) =3D=3D 0)
+           break;
+       }
+=20
+       if (state_idx < lib_state->ct) { // Found
++        if (lib_state->entries[state_idx].loading) {
++          jq_report_error(jq, jv_string_fmt("jq: error: circular import o=
f %s\n",
++                                            jv_string_value(resolved)));
++          jv_free(resolved);
++          jv_free(as);
++          jv_free(deps);
++          jv_free(jq_origin);
++          jv_free(lib_origin);
++          return 1;
++        }
+         jv_free(resolved);
+         // Bind the library to the program
+-        bk =3D block_bind_library(lib_state->defs[state_idx], bk, OP_IS_C=
ALL_PSEUDO, as_str);
++        bk =3D block_bind_library(lib_state->entries[state_idx].def, bk, =
OP_IS_CALL_PSEUDO, as_str);
+       } else { // Not found.   Add it to the table before binding.
+         block dep_def_block =3D gen_noop();
+         nerrors +=3D load_library(jq, resolved, is_data, raw, optional, a=
s_str, &dep_def_block, lib_state);
+@@ -352,32 +366,38 @@ static int load_library(jq_state *jq, jv lib_path, i=
nt is_data, int raw, int opt
+       jq_report_error(jq, jv_string_fmt("jq: error loading data file %s: =
%s\n", jv_string_value(lib_path), jv_string_value(data)));
+       nerrors++;
+     }
+-    goto out;
+   } else if (is_data) {
+     // import "foo" as $bar;
+     program =3D gen_const_global(jv_copy(data), as);
++    state_idx =3D lib_state->ct++;
++    lib_state->entries =3D jv_mem_realloc(lib_state->entries, lib_state->=
ct * sizeof(struct lib_entry));
++    lib_state->entries[state_idx].name =3D strdup(jv_string_value(lib_pat=
h));
++    lib_state->entries[state_idx].def =3D program;
++    lib_state->entries[state_idx].loading =3D 0;
+   } else {
+     // import "foo" as bar;
+     src =3D locfile_init(jq, jv_string_value(lib_path), jv_string_value(d=
ata), jv_string_length_bytes(jv_copy(data)));
+     nerrors +=3D jq_parse_library(src, &program);
+     locfile_free(src);
+     if (nerrors =3D=3D 0) {
++      // Register the library before processing its dependencies so that
++      // circular imports can be detected.
++      state_idx =3D lib_state->ct++;
++      lib_state->entries =3D jv_mem_realloc(lib_state->entries, lib_state=
->ct * sizeof(struct lib_entry));
++      lib_state->entries[state_idx].name =3D strdup(jv_string_value(lib_p=
ath));
++      lib_state->entries[state_idx].def =3D gen_noop();
++      lib_state->entries[state_idx].loading =3D 1;
++
+       char *lib_origin =3D strdup(jv_string_value(lib_path));
+       nerrors +=3D process_dependencies(jq, jq_get_jq_origin(jq),
+                                       jv_string(dirname(lib_origin)),
+                                       &program, lib_state);
+       free(lib_origin);
+       program =3D block_bind_self(program, OP_IS_CALL_PSEUDO);
++      lib_state->entries[state_idx].def =3D program;
++      lib_state->entries[state_idx].loading =3D 0;
+     }
+   }
+-  if (nerrors =3D=3D 0) {
+-    state_idx =3D lib_state->ct++;
+-    lib_state->names =3D jv_mem_realloc(lib_state->names, lib_state->ct *=
 sizeof(const char *));
+-    lib_state->defs =3D jv_mem_realloc(lib_state->defs, lib_state->ct * s=
izeof(block));
+-    lib_state->names[state_idx] =3D strdup(jv_string_value(lib_path));
+-    lib_state->defs[state_idx] =3D program;
+-  }
+-out:
+   *out_block =3D program;
+   jv_free(lib_path);
+   jv_free(data);
+@@ -415,7 +435,7 @@ jv load_module_meta(jq_state *jq, jv mod_relpath) {
+ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   int nerrors =3D 0;
+   block program;
+-  struct lib_loading_state lib_state =3D {0,0,0};
++  struct lib_loading_state lib_state =3D {0,0};
+   nerrors =3D jq_parse(src, &program);
+   if (nerrors)
+     return nerrors;
+@@ -441,14 +461,13 @@ int load_program(jq_state *jq, struct locfile* src, =
block *out_block) {
+   nerrors =3D process_dependencies(jq, jq_get_jq_origin(jq), jq_get_prog_=
origin(jq), &program, &lib_state);
+   block libs =3D gen_noop();
+   for (uint64_t i =3D 0; i < lib_state.ct; ++i) {
+-    free(lib_state.names[i]);
+-    if (nerrors =3D=3D 0 && !block_is_const(lib_state.defs[i]))
+-      libs =3D block_join(libs, lib_state.defs[i]);
++    free(lib_state.entries[i].name);
++    if (nerrors =3D=3D 0 && !block_is_const(lib_state.entries[i].def))
++      libs =3D block_join(libs, lib_state.entries[i].def);
+     else
+-      block_free(lib_state.defs[i]);
++      block_free(lib_state.entries[i].def);
+   }
+-  free(lib_state.names);
+-  free(lib_state.defs);
++  free(lib_state.entries);
+   if (nerrors)
+     block_free(program);
+   else
+diff --git a/tests/modules/cycle_a.jq b/tests/modules/cycle_a.jq
+new file mode 100644
+index 0000000000..30c1deaedf
+--- /dev/null
++++ b/tests/modules/cycle_a.jq
+@@ -0,0 +1,2 @@
++import "cycle_b" as b;
++def f: null;
+diff --git a/tests/modules/cycle_b.jq b/tests/modules/cycle_b.jq
+new file mode 100644
+index 0000000000..3fdc360fcd
+--- /dev/null
++++ b/tests/modules/cycle_b.jq
+@@ -0,0 +1,2 @@
++import "cycle_a" as a;
++def f: null;
+diff --git a/tests/modules/cycle_self.jq b/tests/modules/cycle_self.jq
+new file mode 100644
+index 0000000000..8365eab1a4
+--- /dev/null
++++ b/tests/modules/cycle_self.jq
+@@ -0,0 +1,2 @@
++import "cycle_self" as s;
++def f: null;
+diff --git a/tests/shtest b/tests/shtest
+index fa972de870..aca82790bc 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -382,17 +382,40 @@ if ! HOME=3D"$mods/home2" $VALGRIND $Q $JQ -n 'inclu=
de "g"; empty'; then
+     exit 1
+ fi
+=20
++(
+ cd "$JQBASEDIR" # so that relative library paths are guaranteed correct
+ if ! $VALGRIND $Q $JQ -L ./tests/modules -ne 'import "test_bind_order" as=
 check; check::check=3D=3Dtrue'; then
+     echo "Issue #817 regression?" 1>&2
+     exit 1
+ fi
++)
+=20
++(
+ cd "$JQBASEDIR"
+ if ! $VALGRIND $Q $JQ -L tests/modules -ne 'import "test_bind_order" as c=
heck; check::check=3D=3Dtrue'; then
+     echo "Issue #817 regression?" 1>&2
+     exit 1
+ fi
++)
++
++# CVE-2026-44777: Circular imports should be detected
++if $VALGRIND $JQ -L "$mods" -ne 'import "cycle_a" as a; null' 2> $d/out; =
then
++    echo "Mutual import should be rejected" 1>&2
++    exit 1
++fi
++if ! grep -q "circular import" $d/out; then
++    echo "Expected circular import error" 1>&2
++    exit 1
++fi
++
++if $VALGRIND $JQ -L "$mods" -ne 'import "cycle_self" as s; null' 2> $d/ou=
t; then
++    echo "Self import should be rejected" 1>&2
++    exit 1
++fi
++if ! grep -q "circular import" $d/out; then
++    echo "Expected circular import error" 1>&2
++    exit 1
++fi
+=20
+ ## Halt
+=20
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 2092fe962a..2634fd52a2 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-39979.patch \
            file://CVE-2026-41256.patch \
            file://CVE-2026-47770.patch \
+           file://CVE-2026-44777.patch \
            file://CVE-2026-49389.patch \
            file://CVE-2026-49839.patch \
            "
--=20
2.43.0


