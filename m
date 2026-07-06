Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48086C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:21 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152673.1783351274179291127
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jvE8lHyo;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10480; q=dns/txt;
  s=iport01; t=1783351275; x=1784560875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MKtNSegBd9+uNCNvgM/kBlJ3jpDlG2unvX+mu75k/hs=;
  b=jvE8lHyoMuAjV2mn5DHazO8qNxb/7xBKfeIPgzc8223pJ7UI6sNoBCPD
   2wDaKkVg7Em5L7xMYAzC0Gt0R0jygVNiHtlMoGOHj8ESPu7vKgrZNvG2F
   iJhOMe/GL/vK8oWuHb5+kGfVWXP/e53LL83iFoGwixUjRsZilcpi2hjHb
   15CBuVGFbT3ZQhydbPIGzu1haSxNN2t0liso5ipTxcEgN2VR0kdvmLS0u
   Xhit3EiiW92J2NISGVm2S9NgphjTwbasTgLU4H8R3wRLdPVRFE6aRiMPs
   0nHr9mK6ojSK5I3PwcqaJROUr8GVOiPfbgOqBikpadGmdL+o7uEC+Cwwj
   g==;
X-CSE-ConnectionGUID: Fg6M6F9ORW+hazBQmiNWRA==
X-CSE-MsgGUID: X1Ypoti+TqWGKmbGW3JnGA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDSxktq/4v/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBgKNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCcwIBEQa5V?=
 =?us-ascii?q?4F5M4EBgygBPwJDUNssAQsUAQWBM4U/iB9bGAGEegInGxuBcoR+gQV3ZQICG?=
 =?us-ascii?q?IgLBIIigQyBWh6PJ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgWuBAoR5Ix8DOX+BMHVKeS2BAgESHgqBUoEpAwsYDUgRLDcUGwQ+bgeMe?=
 =?us-ascii?q?xcPgh0gAVIoEwEKCRgggSMOJ5NrCDGPZYIhgTWfWgoog3WMIZU6GjOFW6URC?=
 =?us-ascii?q?5h9izeCU5ZQhGiBaDyBWXAVgyIJShkPjjiCA4FohRPJRyQ1AgEBBzIBAQcCB?=
 =?us-ascii?q?w4DC4FokR1gAQE?=
IronPort-Data: A9a23:kL1MXa9f9k9q9ko1nxUlDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WZOCzqCO6nYYTf0c9kgPIy08B4AvsfWndNnTQA/qSFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTpKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kYMtM9pMgmJltxt
 vwROho0axGluNiflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+znmTkcyVboXqepLE85C7YywkZPL3FbYKIJ4HSHpsO9qqej
 lKfznz+HhBZCMWg5hmA+F2T3c3JsgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Rq9nkaGXVSgi8pa+pLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AOH6mwGgFQfxIkDJLQVdmd/BWMjJuXHKD6Sn+cmi?=
 =?us-ascii?q?CNiVpQa+/cFqR3pxeup87?=
X-Talos-MUID: 9a23:+TrIdgspcnqCwFzB8c2ntGhTLMB04ueSEX8ispAMlPbfFypfEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505550363"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:21:15 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 1A970180007D4;
	Mon,  6 Jul 2026 15:21:15 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id BC86ECBEF99; Mon,  6 Jul 2026 08:21:14 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 6/6] jq: Fix CVE-2026-44777
Date: Mon,  6 Jul 2026 08:20:20 -0700
Message-ID: <20260706152022.873284-6-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260706152022.873284-1-spushpka@cisco.com>
References: <20260706152022.873284-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128050

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-7. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-44777.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c71c

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-44777.patch                | 243 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 244 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
new file mode 100644
index 0000000000..3fe1a9beb3
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
@@ -0,0 +1,243 @@
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
+CVE: CVE-2026-44777
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c71c]
+
+Backport Changes:
+- The upstream src/linker.c patch deletes an `if (nerrors == 0)` wrapper
+  around the old library registration block. Wrynose jq 1.8.1 does not
+  have that wrapper in the same form, so this backport has two fewer
+  deleted lines in src/linker.c while preserving the upstream
+  circular-import detection logic.
+
+(cherry picked from commit f58787c41835d9b17795730cb04925fdba25c71c)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ Makefile.am                 |  2 ++
+ src/linker.c                | 57 +++++++++++++++++++++++++------------
+ tests/modules/cycle_a.jq    |  2 ++
+ tests/modules/cycle_b.jq    |  2 ++
+ tests/modules/cycle_self.jq |  2 ++
+ tests/shtest                | 23 +++++++++++++++
+ 6 files changed, 70 insertions(+), 18 deletions(-)
+ create mode 100644 tests/modules/cycle_a.jq
+ create mode 100644 tests/modules/cycle_b.jq
+ create mode 100644 tests/modules/cycle_self.jq
+
+diff --git a/Makefile.am b/Makefile.am
+index 76e35df..6fcc013 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -223,6 +223,8 @@ EXTRA_DIST = $(DOC_FILES) $(man_MANS) $(TESTS) $(TEST_LOG_COMPILER)     \
+         tests/modules/test_bind_order0.jq                               \
+         tests/modules/test_bind_order1.jq                               \
+         tests/modules/test_bind_order2.jq                               \
++        tests/modules/cycle_a.jq tests/modules/cycle_b.jq               \
++        tests/modules/cycle_self.jq                                     \
+         tests/onig.supp tests/local.supp                                \
+         tests/setup tests/torture/input0.json                           \
+         tests/optional.test tests/man.test tests/manonig.test           \
+diff --git a/src/linker.c b/src/linker.c
+index e7d1024..0c9c34b 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -21,9 +21,13 @@
+ #include "compile.h"
+ #include "jv_alloc.h"
+
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
+@@ -299,14 +303,24 @@ static int process_dependencies(jq_state *jq, jv jq_origin, jv lib_origin, block
+     } else {
+       uint64_t state_idx = 0;
+       for (; state_idx < lib_state->ct; ++state_idx) {
+-        if (strcmp(lib_state->names[state_idx],jv_string_value(resolved)) == 0)
++        if (strcmp(lib_state->entries[state_idx].name, jv_string_value(resolved)) == 0)
+           break;
+       }
+
+       if (state_idx < lib_state->ct) { // Found
++        if (lib_state->entries[state_idx].loading) {
++          jq_report_error(jq, jv_string_fmt("jq: error: circular import of %s\n",
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
+-        bk = block_bind_library(lib_state->defs[state_idx], bk, OP_IS_CALL_PSEUDO, as_str);
++        bk = block_bind_library(lib_state->entries[state_idx].def, bk, OP_IS_CALL_PSEUDO, as_str);
+       } else { // Not found.   Add it to the table before binding.
+         block dep_def_block = gen_noop();
+         nerrors += load_library(jq, resolved, is_data, raw, optional, as_str, &dep_def_block, lib_state);
+@@ -348,30 +362,38 @@ static int load_library(jq_state *jq, jv lib_path, int is_data, int raw, int opt
+       jq_report_error(jq, jv_string_fmt("jq: error loading data file %s: %s\n", jv_string_value(lib_path), jv_string_value(data)));
+       nerrors++;
+     }
+-    goto out;
+   } else if (is_data) {
+     // import "foo" as $bar;
+     program = gen_const_global(jv_copy(data), as);
++    state_idx = lib_state->ct++;
++    lib_state->entries = jv_mem_realloc(lib_state->entries, lib_state->ct * sizeof(struct lib_entry));
++    lib_state->entries[state_idx].name = strdup(jv_string_value(lib_path));
++    lib_state->entries[state_idx].def = program;
++    lib_state->entries[state_idx].loading = 0;
+   } else {
+     // import "foo" as bar;
+     src = locfile_init(jq, jv_string_value(lib_path), jv_string_value(data), jv_string_length_bytes(jv_copy(data)));
+     nerrors += jq_parse_library(src, &program);
+     locfile_free(src);
+     if (nerrors == 0) {
++      // Register the library before processing its dependencies so that
++      // circular imports can be detected.
++      state_idx = lib_state->ct++;
++      lib_state->entries = jv_mem_realloc(lib_state->entries, lib_state->ct * sizeof(struct lib_entry));
++      lib_state->entries[state_idx].name = strdup(jv_string_value(lib_path));
++      lib_state->entries[state_idx].def = gen_noop();
++      lib_state->entries[state_idx].loading = 1;
++
+       char *lib_origin = strdup(jv_string_value(lib_path));
+       nerrors += process_dependencies(jq, jq_get_jq_origin(jq),
+                                       jv_string(dirname(lib_origin)),
+                                       &program, lib_state);
+       free(lib_origin);
+       program = block_bind_self(program, OP_IS_CALL_PSEUDO);
++      lib_state->entries[state_idx].def = program;
++      lib_state->entries[state_idx].loading = 0;
+     }
+   }
+-  state_idx = lib_state->ct++;
+-  lib_state->names = jv_mem_realloc(lib_state->names, lib_state->ct * sizeof(const char *));
+-  lib_state->defs = jv_mem_realloc(lib_state->defs, lib_state->ct * sizeof(block));
+-  lib_state->names[state_idx] = strdup(jv_string_value(lib_path));
+-  lib_state->defs[state_idx] = program;
+-out:
+   *out_block = program;
+   jv_free(lib_path);
+   jv_free(data);
+@@ -409,7 +431,7 @@ jv load_module_meta(jq_state *jq, jv mod_relpath) {
+ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   int nerrors = 0;
+   block program;
+-  struct lib_loading_state lib_state = {0,0,0};
++  struct lib_loading_state lib_state = {0,0};
+   nerrors = jq_parse(src, &program);
+   if (nerrors)
+     return nerrors;
+@@ -433,14 +455,13 @@ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   nerrors = process_dependencies(jq, jq_get_jq_origin(jq), jq_get_prog_origin(jq), &program, &lib_state);
+   block libs = gen_noop();
+   for (uint64_t i = 0; i < lib_state.ct; ++i) {
+-    free(lib_state.names[i]);
+-    if (nerrors == 0 && !block_is_const(lib_state.defs[i]))
+-      libs = block_join(libs, lib_state.defs[i]);
++    free(lib_state.entries[i].name);
++    if (nerrors == 0 && !block_is_const(lib_state.entries[i].def))
++      libs = block_join(libs, lib_state.entries[i].def);
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
+index 0000000..30c1dea
+--- /dev/null
++++ b/tests/modules/cycle_a.jq
+@@ -0,0 +1,2 @@
++import "cycle_b" as b;
++def f: null;
+diff --git a/tests/modules/cycle_b.jq b/tests/modules/cycle_b.jq
+new file mode 100644
+index 0000000..3fdc360
+--- /dev/null
++++ b/tests/modules/cycle_b.jq
+@@ -0,0 +1,2 @@
++import "cycle_a" as a;
++def f: null;
+diff --git a/tests/modules/cycle_self.jq b/tests/modules/cycle_self.jq
+new file mode 100644
+index 0000000..8365eab
+--- /dev/null
++++ b/tests/modules/cycle_self.jq
+@@ -0,0 +1,2 @@
++import "cycle_self" as s;
++def f: null;
+diff --git a/tests/shtest b/tests/shtest
+index 505d45d..f5794fb 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -369,17 +369,40 @@ if ! HOME="$mods/home2" $VALGRIND $Q $JQ -n 'include "g"; empty'; then
+     exit 1
+ fi
+
++(
+ cd "$JQBASEDIR" # so that relative library paths are guaranteed correct
+ if ! $VALGRIND $Q $JQ -L ./tests/modules -ne 'import "test_bind_order" as check; check::check==true'; then
+     echo "Issue #817 regression?" 1>&2
+     exit 1
+ fi
++)
+
++(
+ cd "$JQBASEDIR"
+ if ! $VALGRIND $Q $JQ -L tests/modules -ne 'import "test_bind_order" as check; check::check==true'; then
+     echo "Issue #817 regression?" 1>&2
+     exit 1
+ fi
++)
++
++# CVE-2026-44777: Circular imports should be detected
++if $VALGRIND $JQ -L "$mods" -ne 'import "cycle_a" as a; null' 2> $d/out; then
++    echo "Mutual import should be rejected" 1>&2
++    exit 1
++fi
++if ! grep -q "circular import" $d/out; then
++    echo "Expected circular import error" 1>&2
++    exit 1
++fi
++
++if $VALGRIND $JQ -L "$mods" -ne 'import "cycle_self" as s; null' 2> $d/out; then
++    echo "Self import should be rejected" 1>&2
++    exit 1
++fi
++if ! grep -q "circular import" $d/out; then
++    echo "Expected circular import error" 1>&2
++    exit 1
++fi
+
+ ## Halt
+
+--
+2.35.6
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 9d98fd81c3..7585d0c5f9 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-41257.patch \
            file://CVE-2026-43894.patch \
            file://CVE-2026-43896.patch \
+           file://CVE-2026-44777.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


