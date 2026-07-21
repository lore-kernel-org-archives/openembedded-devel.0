Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D67C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18883.1784626783067130151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dBKQpZxn;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8977; q=dns/txt;
  s=iport01; t=1784626783; x=1785836383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rH5FnoN9iNN4uY25lekZ6sdH3NyCJ44b0vGEBu2zaiA=;
  b=dBKQpZxnnL/fcUBmA7JL+UqEPCS4TpdMwx+1Wvw0++01zIJc2EtTa6OK
   ukUQVagGLemvadnRelhgtmrXAyU24cRpwrB92SgdfMGpYSQI9kM/zFSc4
   3qGIwa1xvp0y6bV6JdxeVQUOMcjIAtpskG+CY6jLL6T9xXXg45k2uF5gj
   jax+QIgJ/KbHEiHzYZ5nQuGdzRauOoOMubyTk6tcknQMZD6NyMy6mOoxp
   Qjbcf1pyqC5FcaM20iS21NPAKUNkznOnmv9dfUUI5bLAoNGMOeb/ow230
   U+e5B5vLSocftWsNGRWU9IamuAqPkm4rZW7m+LJc/blQZCaV/6sEru/G1
   A==;
X-CSE-ConnectionGUID: 3AlT9fIVSj2SK9tOD29GtA==
X-CSE-MsgGUID: KvwkCqVXQx+QhSs1kJ9/jA==
X-IPAS-Result: =?us-ascii?q?A0BFAgB+PV9q/5T/Ja1aHgEBCxIMggULgld0XkNJA5ZHg?=
 =?us-ascii?q?RadCIF+DwEBAQ9EDQQBAYUFjVkCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECASoLARgBLSwDAQJaIyGDAgGCdAMRvjoaN4F5M?=
 =?us-ascii?q?4EBgygBgVTbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVgnN2gQWBXAKBN4ZuB?=
 =?us-ascii?q?IIiehKBWh4yhD2LHkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6Ak4DCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41QI4FEXBkHexMBExgES0kIWAwoJJMbkBaCIaEPCiiDdYwhlToaM6psC5h9j?=
 =?us-ascii?q?gqWDkKEaYFoPIFZcBWDIglKGQ+OKg4Lg2DOWicyAgkDLwEBBwIHDgMLgWiQA?=
 =?us-ascii?q?AImB4FPAQE?=
IronPort-Data: A9a23:XotwvaPdHIr8s+fvrR31lsFynXyQoLVcMsEvi/4bfWQNrUp3hjFSn
 GYfXm2BP66KYWHyeYpzO9mw8BwEsZfXztJmS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWcsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj665HCH1nM6wmweQtOkIf6
 ds0cmEicjnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQtgei8a4qPIoziqcN9vViHp
 UnfwVTAElIjNOeEkDmnozWur7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:GCU3LKHVkqugViZXpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AdZUp9Go46LrFVrorP0l3wlfmUZsMdkGMwlbuGE3?=
 =?us-ascii?q?iMkU4VJq5Ew6/5Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:A4S3EwtDOTQE4zsKkM2npy99N+xx3ZSXGAM0ka4d4sqmZGtyEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,176,1779148800"; 
   d="scan'208";a="498938208"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 09:39:42 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id EEB841800016D;
	Tue, 21 Jul 2026 09:39:41 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 98421CAEF78; Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][scarthgap][PATCH 1/4] jq: Fix CVE-2026-43895
Date: Tue, 21 Jul 2026 02:39:35 -0700
Message-Id: <20260721093938.3983571-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128348

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/jqlang/jq/commit/9d223f153c3632a207fa071caaa6292da33ae361
[2] https://github.com/jqlang/jq/security/advisories/GHSA-7q7g-mrq3-phxr

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-43895.patch                | 206 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
new file mode 100644
index 0000000000..efde45c710
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
@@ -0,0 +1,206 @@
+From 5192a59c2c6ca6ab0667cbee608db29c0710f346 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 9 May 2026 17:08:43 +0900
+Subject: [PATCH 1/2] Reject embedded NUL bytes in module import paths
+
+jq accepts embedded NUL bytes at the language level but resolves
+module import paths through NUL-terminated C strings, so the path
+validated by policy or audit code could differ from the on-disk
+path jq actually opens. Pass jv through gen_import so the AST
+preserves the original bytes, and reject embedded NULs in
+validate_relpath.
+
+Fixes CVE-2026-43895.
+
+CVE: CVE-2026-43895
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/9d223f153c3632a207fa071caaa6292da33ae361]
+
+Backport Changes:
+- Kept jq 1.7.1 HOME lookup in linker.c.
+  The newer get_home() flow is absent from the target.
+  Only the jv-based gen_import() call was required.
+- Limited parser.c to three import/include action changes.
+  The newer grammar caused unrelated generated-parser churn.
+  Keeping target numbering avoids unrelated generated changes.
+
+(cherry picked from commit 9d223f153c3632a207fa071caaa6292da33ae361)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/compile.c | 12 ++++++++----
+ src/compile.h |  2 +-
+ src/linker.c  |  6 +++++-
+ src/parser.c  | 16 +++-------------
+ src/parser.y  | 16 +++-------------
+ tests/shtest  | 17 +++++++++++++++++
+ 6 files changed, 37 insertions(+), 32 deletions(-)
+
+diff --git a/src/compile.c b/src/compile.c
+index e5e65f2..27b2cfd 100644
+--- a/src/compile.c
++++ b/src/compile.c
+@@ -526,13 +526,17 @@ jv block_module_meta(block b) {
+   return jv_null();
+ }
+ 
+-block gen_import(const char* name, const char* as, int is_data) {
++block gen_import(jv name, jv as, int is_data) {
++  assert(jv_get_kind(name) == JV_KIND_STRING);
++  assert(!jv_is_valid(as) || jv_get_kind(as) == JV_KIND_STRING);
+   inst* i = inst_new(DEPS);
+   jv meta = jv_object();
+-  if (as != NULL)
+-    meta = jv_object_set(meta, jv_string("as"), jv_string(as));
++  if (jv_is_valid(as))
++    meta = jv_object_set(meta, jv_string("as"), as);
++  else
++    jv_free(as);
+   meta = jv_object_set(meta, jv_string("is_data"), is_data ? jv_true() : jv_false());
+-  meta = jv_object_set(meta, jv_string("relpath"), jv_string(name));
++  meta = jv_object_set(meta, jv_string("relpath"), name);
+   i->imm.constant = meta;
+   return inst_block(i);
+ }
+diff --git a/src/compile.h b/src/compile.h
+index c1512e6..bac65ef 100644
+--- a/src/compile.h
++++ b/src/compile.h
+@@ -33,7 +33,7 @@ block gen_op_pushk_under(jv constant);
+ 
+ block gen_module(block metadata);
+ jv block_module_meta(block b);
+-block gen_import(const char* name, const char *as, int is_data);
++block gen_import(jv name, jv as, int is_data);
+ block gen_import_meta(block import, block metadata);
+ block gen_function(const char* name, block formals, block body);
+ block gen_param_regular(const char* name);
+diff --git a/src/linker.c b/src/linker.c
+index e7d1024..4b15008 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -93,6 +93,10 @@ static jv build_lib_search_chain(jq_state *jq, jv search_path, jv jq_origin, jv
+ // in between).
+ static jv validate_relpath(jv name) {
+   const char *s = jv_string_value(name);
++  if (strlen(s) != (size_t)jv_string_length_bytes(jv_copy(name))) {
++    jv_free(name);
++    return jv_invalid_with_msg(jv_string("Module path contains a NUL byte"));
++  }
+   if (strchr(s, '\\')) {
+     jv res = jv_invalid_with_msg(jv_string_fmt("Modules must be named by relative paths using '/', not '\\' (%s)", s));
+     jv_free(name);
+@@ -423,7 +427,7 @@ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   char* home = getenv("HOME");
+   if (home) {    // silently ignore no $HOME
+     /* Import ~/.jq as a library named "" found in $HOME */
+-    block import = gen_import_meta(gen_import("", NULL, 0),
++    block import = gen_import_meta(gen_import(jv_string(""), jv_invalid(), 0),
+         gen_const(JV_OBJECT(
+             jv_string("optional"), jv_true(),
+             jv_string("search"), jv_string(home))));
+diff --git a/src/parser.c b/src/parser.c
+index 0599db7..c50f2fb 100644
+--- a/src/parser.c
++++ b/src/parser.c
+@@ -3081,13 +3081,8 @@ yyreduce:
+   case 50: /* ImportWhat: "import" ImportFrom "as" BINDING  */
+ #line 506 "src/parser.y"
+                                  {
+-  jv v = block_const((yyvsp[-2].blk));
+-  // XXX Make gen_import take only blocks and the int is_data so we
+-  // don't have to free so much stuff here
+-  (yyval.blk) = gen_import(jv_string_value(v), jv_string_value((yyvsp[0].literal)), 1);
++  (yyval.blk) = gen_import(block_const((yyvsp[-2].blk)), (yyvsp[0].literal), 1);
+   block_free((yyvsp[-2].blk));
+-  jv_free((yyvsp[0].literal));
+-  jv_free(v);
+ }
+ #line 3093 "src/parser.c"
+     break;
+@@ -3095,11 +3090,8 @@ yyreduce:
+   case 51: /* ImportWhat: "import" ImportFrom "as" IDENT  */
+ #line 515 "src/parser.y"
+                                {
+-  jv v = block_const((yyvsp[-2].blk));
+-  (yyval.blk) = gen_import(jv_string_value(v), jv_string_value((yyvsp[0].literal)), 0);
++  (yyval.blk) = gen_import(block_const((yyvsp[-2].blk)), (yyvsp[0].literal), 0);
+   block_free((yyvsp[-2].blk));
+-  jv_free((yyvsp[0].literal));
+-  jv_free(v);
+ }
+ #line 3105 "src/parser.c"
+     break;
+@@ -3107,10 +3099,8 @@ yyreduce:
+   case 52: /* ImportWhat: "include" ImportFrom  */
+ #line 522 "src/parser.y"
+                      {
+-  jv v = block_const((yyvsp[0].blk));
+-  (yyval.blk) = gen_import(jv_string_value(v), NULL, 0);
++  (yyval.blk) = gen_import(block_const((yyvsp[0].blk)), jv_invalid(), 0);
+   block_free((yyvsp[0].blk));
+-  jv_free(v);
+ }
+ #line 3116 "src/parser.c"
+     break;
+diff --git a/src/parser.y b/src/parser.y
+index 3d24689..2901cab 100644
+--- a/src/parser.y
++++ b/src/parser.y
+@@ -504,26 +504,16 @@ ImportWhat Exp ';' {
+ 
+ ImportWhat:
+ "import" ImportFrom "as" BINDING {
+-  jv v = block_const($2);
+-  // XXX Make gen_import take only blocks and the int is_data so we
+-  // don't have to free so much stuff here
+-  $$ = gen_import(jv_string_value(v), jv_string_value($4), 1);
++  $$ = gen_import(block_const($2), $4, 1);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "import" ImportFrom "as" IDENT {
+-  jv v = block_const($2);
+-  $$ = gen_import(jv_string_value(v), jv_string_value($4), 0);
++  $$ = gen_import(block_const($2), $4, 0);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "include" ImportFrom {
+-  jv v = block_const($2);
+-  $$ = gen_import(jv_string_value(v), NULL, 0);
++  $$ = gen_import(block_const($2), jv_invalid(), 0);
+   block_free($2);
+-  jv_free(v);
+ }
+ 
+ ImportFrom:
+diff --git a/tests/shtest b/tests/shtest
+index 505d45d..4a5978c 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -622,4 +622,21 @@ if echo '42' | $JQ -f "$d/nul_prog.jq" >/dev/null 2>/dev/null; then
+   exit 1
+ fi
+ 
++# CVE-2026-43895: No NUL bytes in module/data import paths
++printf 'import "a\\u0000b" as $x; .' > "$d/nul_import.jq"
++if $JQ -nf "$d/nul_import.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for import path with NUL bytes\n' 1>&2
++  exit 1
++fi
++printf 'include "a\\u0000b"; .' > "$d/nul_include.jq"
++if $JQ -nf "$d/nul_include.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for include path with NUL bytes\n' 1>&2
++  exit 1
++fi
++printf '"a\\u0000b" | modulemeta' > "$d/nul_modulemeta.jq"
++if $JQ -nf "$d/nul_modulemeta.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for modulemeta with NUL bytes\n' 1>&2
++  exit 1
++fi
++
+ exit 0
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 2fc47ef92c..2f08f583cc 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-41257.patch \
     file://CVE-2026-43894.patch \
     file://CVE-2026-43896.patch \
+    file://CVE-2026-43895.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


