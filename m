Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C2DC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 12:41:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42209.1785760901067370472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=b7LEbxgx;
 spf=pass (domain: est.tech, ip: 52.101.83.49, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmF8NL64V7wf3RMKVRkWpez0SqmI7GlQQq13HpIuMwpf0TnWgrtM/3onClF4ytjNtQrbK9W8zu5AtZHEW6ubeVBAMzu+M90r0qk+NFxkp3i/ooafNUUcX7dmnl5YXFSqXFq3Pfq+LcOpM/Cpc2mgkFzKp/9sumvAiF8k4In0asvhlg3bTidjWXeCCFE5ggDARMj2n9wy+D9vD6uUUY9HKuEdTi9hIEVQPUvK9QjBYIJzJervcux9cKQVjtT19yTJ86Yx4gkwyNt1cCh4tX7vriX6O5tzVKaLx7JZUA5ay/v91cMD6KC2ZISLTM8BVk16HCdfRFp5Ohn0L2L3WvRP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx8n3n6LICnRZLwj5TZTLd0XiXpUD4DRuhB2gipjoVM=;
 b=tgi6+l8UHVaJBtsE8jVIXOaEarnpKib9zJ8myKNjYHhI5XFUK+SNNsF3hmWf3hxk6jfBEXtoi3XQ4ENQbOIgZbHnV0QXqQpmDYVVdsM9iujyq6QX2dsCmAat5UbDSF/jt6LHA5ylfy7NzXVtXYGMYGscmxq1CmbXcfZ5AJaf9qcjwJ5/ljPbB+YSI6QrndTKYFvk7jkY9onKUww9WgjYs/MMhWmfFoO5F9dPlcEU4EABuOv3YjsQEMibOVLJPx5p8bDa0MpgF5iWqCkhMMFMNCryewkVd39Z/EdkBaVeHwX97J2tll5QFhv5Amhzfwzquy9xi/DQX9y1lJa5hnupZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx8n3n6LICnRZLwj5TZTLd0XiXpUD4DRuhB2gipjoVM=;
 b=b7LEbxgxFWJmM172novk9TeTNxOTF1LVxtebCAyKPGgYVO3RTnGTS75BSzmte1BzDbNkVSaSlQQBEGdpeiW8OgmvLw3lljeCexgOCvfTh5CQIfzcUyYTFhrLu4s2TCHTt5NRBlJU8Jkiy8WSH+UK4n6bp+IN83Z7CjEaRSXBfvO7r0Gj8RNvRGx8bh+nL1+bvjKx66NOLM1kYMCPkGndEF0LsC7yBqUBedKF3Yfv7D58iL/MghybFJQEpPVtch18L4i9Jo3D7fPWG8pfWU+UVYfZDMXNaA6uJQBwS6g/+lEw1gwu8cp3l2eW2+LwqF8QeMidwNUNGBcf6l0+nQx3Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 VE1P189MB0848.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.13; Mon, 3 Aug 2026 12:41:35 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0292.013; Mon, 3 Aug 2026
 12:41:35 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] jq: fix CVE-2026-44777
Date: Mon,  3 Aug 2026 14:41:25 +0200
Message-ID: <20260803124125.68754-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0325.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::22) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|VE1P189MB0848:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2b4d59-8cd5-4100-0d28-08def15c8dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	thWK4Yio+gD/xs4OwRbevxYO8uhSGzBAqvmaOutpw7CFVFHWJUxbCXajvxCqdeORcmqrUaevPeqJbBivsGRG7lKrq2z+B2snvhpKD9MfptO+P0ALHvjddPZzptnts0cLAAbCCtekOPLr9dHwrKWyPSkgyWy6qfFtg1iGnJvL2y87KtbEBIMFKPNNPKvEBffe8oFisLY6PlUSc3PnAuMJXrkn/D7dJt6b3x9Js60910jvzmL3AHMnWpGN1OWiqlUId1CUvYDfK6OuqDG1xCMNc6OFObCCdwCjEZJdrLsHjxN3eyvl0ijZ4rzkDkWP2JvMHkMtAv/8Xr6JJjtOM2yJLTG7JjWYI6dXWf7D4jvCjjezGwgMSJGEZWobOU7UV0+oDqCUvDAHNMevNG0+AO8Ad9JDgNxhamSLwlEYv8S+tJXK5slT1LxKUIvVmuO9eZdr+J/0zfbffc0vgRGBxIPIH/QKDWnYFG5dAy/ha0Yq7bLHWlRl+vKI6opZAieVh6hGzudRe2YliJtb2YfiNstjVRvc+dY18WU4Xa2+EOp2IHmMKb1e6XlIn2l8SJmeJ+xR79bjnZNWJ0gFYx4g5waXqd9Y/brRGxDw158AaJZd81Vi1SGR08e5tEUOqhfQ4WFrXQmvNuoD+3j3N7RksoYG08bXOYE5e5Ps5BleD4+NSgg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NHbRGd79iryUw2UhiaC9zAbhSRXl9BrUFoG5AJiUQ59aaXNDQlX7xHCccD2W?=
 =?us-ascii?Q?WX/sA/to0yB+Z5lm/aUE2e71jqUmcQj36ZFbZNj5JIX5zkEylXisJuw1qKJ0?=
 =?us-ascii?Q?vb6kKIb9ydxtwCkPQcsfPmORLuwUKwQwpIJDOZ1K8u1u6gOfo0WCiXRUbn0m?=
 =?us-ascii?Q?d7FL2YR7ONo73VZWax16VIK84VnqZ6nIGLN9zQv4h0U0fuQaSm2RFPd2h3hg?=
 =?us-ascii?Q?bad5Q8ZBYfzeCxXRTRoTPHdGfnq4RV9lCoY7WUDl74woZgmWl4ML2rWke6qM?=
 =?us-ascii?Q?juPDDZ6mElBvYYqMARl7VuGu7AOqCm8a6pphczaFaEUyGWa2il6ZOTBXTpix?=
 =?us-ascii?Q?b+nVLMlsleTfAtTbihe9bkEGoIDBf+kADIwuO4edja4rVq68wv8LmuPwwKVX?=
 =?us-ascii?Q?vsu9dsDHh0GejQoTwayGY0KDhCl6VSzeE21/sJMbNhSDJWs+pU4XcsA5J2L+?=
 =?us-ascii?Q?KI/bXfC7CoMZ27tGU4lFRT467p3cRnqx1vpemXNEiADUZ+RlkI1nfa+Jo5O7?=
 =?us-ascii?Q?fl9pg+EOsahQGFTWDl8YzQIb6kdWLLDMQ3snKT/CEo8QKJ/F4ip1Zg5EZy6k?=
 =?us-ascii?Q?v+Qb+wfM63DMxj0iW+qACTtl2G9XJfmAkBrU1P8GPgx/8tVXxbcNp4R+OZUU?=
 =?us-ascii?Q?LDlEFmDRK5eh88fn2mgwYnz10KnnnU4w+mBM9VAuqk3dW5Mq0iNDLlPZd7Kv?=
 =?us-ascii?Q?RuCBwtGi4y+7AUUESWbtMqyjnxIz1uJUEhFo71NqKaSn28Rah3MWKyCzkDz0?=
 =?us-ascii?Q?JfVgLGVwydFQVCJCJOdYlGQFulskjEph+6Wf5zbxeuCzuhqw68FOsw6lVE98?=
 =?us-ascii?Q?OB8EVq9cSQFnJ2T6/49d1vz6F/eaYmMRM+QQRSsns30RgOxSIbj8X3nLiT09?=
 =?us-ascii?Q?U0wH3zA9k5RFXAleTyf9j5XkDWfXfijzyyeVdNPELvLSlmQph1COdRRNhlUK?=
 =?us-ascii?Q?FQVv8/qvdLoR6Ud9ATLy19gcpbS5XNsousyCrE4SobNwxz8mrRrDq/s3/n4f?=
 =?us-ascii?Q?Bf1GJu6YojzBFRDXArwujHap01hDnnqlSTReI4y5uXLhDlGVF98u7xFxGIfF?=
 =?us-ascii?Q?J4YHSNn++xK4A+9Zn/wq1uHmDRkSD3nuAm307f/ZXbz6/GSnk+Xxa2VAl4H2?=
 =?us-ascii?Q?eX6IwTAER4PL160Vqijkay+cGz16ZjU9ap0rMj+MW+nMDGzdM0ecWuCF7qpj?=
 =?us-ascii?Q?887B/AIpRzpHMctlI0ILObzl9duZZuGN/Jm3vlTcLkfkvI8kJJ6vBuWnvEVf?=
 =?us-ascii?Q?4I7TJrkBHde3nsxsfjNCAzTmzPJPBe7r1icUrxFx201lj1e94i9dS/6XOYsE?=
 =?us-ascii?Q?3KoonfUijN/4YlhP3hNqBz6Kuf+aLGmFF24E4soADcw6+1oC2vUW9V8Qw1cq?=
 =?us-ascii?Q?MIKyIt6yKMVEbtGQXFhundJsAfwlCgreXxcu1v1LpZLNVX/ce/nYuAFoyU12?=
 =?us-ascii?Q?uxNujtXZUctpogmkhF3xAXYJ/4WkgsPwXkaDA7RVvcTdoGjvm/mO0UwWbTc9?=
 =?us-ascii?Q?L4UI275rZSnlmld9HN1S2kmuHpRIU7V2derO4PWxOs8bRq5EDJu85OWMvWNv?=
 =?us-ascii?Q?Fuu6vhP+yX3Onrpcqb5Nz1QlHu5UhS6BuQZejS6aR94xbiMR3C8PPrKdOU5C?=
 =?us-ascii?Q?R5/0QXR21qwhK/iT76U/smVoTT+vmxCYdX6v3XfjfRQunnBOBODCiWOfMHc5?=
 =?us-ascii?Q?O2OGXqWmPvgX6OyodqJHAgTMa+5CTkpFz1VO3vVW+qaon2989ZGFYipDbJNM?=
 =?us-ascii?Q?AxuHH+FYoA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2b4d59-8cd5-4100-0d28-08def15c8dee
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:41:35.4796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2mOfsoG8iLiwL0TKhNFdF8Oh+hxmi4WINGitcCEjqQiOxooTMOdreP7UBaKaUUjz7u0Tz8CagOxdspXBkjstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 12:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128683

From: Tugrul Kukul <tugrul.kukul@est.tech>

Backport patch to fix CVE-2026-44777.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-44777

Upstream fix:
  https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c=
71c

Tested with ptest:
Before: PASSED: 7, FAILED: 0, SKIPPED: 0
After: PASSED: 7, FAILED: 0, SKIPPED: 0

Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
- Backport note: jq 1.7.1 has no `if (nerrors =3D=3D 0)` guard around the l=
ib_state
registration, so two fewer lines are removed; otherwise identical to upstre=
am.

 .../jq/jq/CVE-2026-44777.patch                | 233 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-44777.patch
new file mode 100644
index 0000000000..44bc8ab976
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
@@ -0,0 +1,233 @@
+From eb43485d873139ba45317709a5d9b6ff0ed0926c Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/f58787c4183=
5d9b17795730cb04925fdba25c71c]
+
+Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
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
+@@ -223,6 +223,8 @@ EXTRA_DIST =3D $(DOC_FILES) $(man_MANS) $(TESTS) $(TES=
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
+index e7d1024..0c9c34b 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -21,9 +21,13 @@
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
+@@ -299,14 +303,24 @@ static int process_dependencies(jq_state *jq, jv jq_=
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
+@@ -348,30 +362,38 @@ static int load_library(jq_state *jq, jv lib_path, i=
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
+-  state_idx =3D lib_state->ct++;
+-  lib_state->names =3D jv_mem_realloc(lib_state->names, lib_state->ct * s=
izeof(const char *));
+-  lib_state->defs =3D jv_mem_realloc(lib_state->defs, lib_state->ct * siz=
eof(block));
+-  lib_state->names[state_idx] =3D strdup(jv_string_value(lib_path));
+-  lib_state->defs[state_idx] =3D program;
+-out:
+   *out_block =3D program;
+   jv_free(lib_path);
+   jv_free(data);
+@@ -409,7 +431,7 @@ jv load_module_meta(jq_state *jq, jv mod_relpath) {
+ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   int nerrors =3D 0;
+   block program;
+-  struct lib_loading_state lib_state =3D {0,0,0};
++  struct lib_loading_state lib_state =3D {0,0};
+   nerrors =3D jq_parse(src, &program);
+   if (nerrors)
+     return nerrors;
+@@ -433,14 +455,13 @@ int load_program(jq_state *jq, struct locfile* src, =
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
+@@ -369,17 +369,40 @@ if ! HOME=3D"$mods/home2" $VALGRIND $Q $JQ -n 'inclu=
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
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.7.1.bb
index 2fc47ef92c..279e7e281f 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${B=
PN}-${PV}.tar.gz \
     file://CVE-2026-41257.patch \
     file://CVE-2026-43894.patch \
     file://CVE-2026-43896.patch \
+    file://CVE-2026-44777.patch \
     "
 SRC_URI[sha256sum] =3D "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df70=
3873deeee580c2"
=20

