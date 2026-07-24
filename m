Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D3BC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11221.1784859284696946983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JaO0IVBC;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb85186d43so822248a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859284; x=1785464084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBfoSf5hUQn4bdaeDz1CFjGOCqV8j/E72ynHUdsQAS8=;
        b=JaO0IVBCFC0MA4+45tU4tuNwYdOiYTNS8o7dZllJrSt5FOryoJBnVseRFLyvxPwSeI
         UFLVs5j7yKiev08DHMUSi2UAy+rQcQs/ukvcFIzVhR014fISg19IrrAePb8P9gFC8Y55
         kc3qx7WTbde713NMe1c3q5OVPigYHsIz54jbVKGlBfcO2Q/fUInppmXoxN+lgeXPjyNi
         mdVZtURTV0lnLXoQYm2Fk79FaEF/1ZDEyqHkmpT5Bjb6Pa6sc7GvkCDb2gXQtf8J5ybz
         bI5zik8EzwMg50ZOk5e/RfY+PunIVoJHUGr4Yb7fqG+2MKqltjIfjTmIkA1dg/rQz+75
         pEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859284; x=1785464084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBfoSf5hUQn4bdaeDz1CFjGOCqV8j/E72ynHUdsQAS8=;
        b=FR6q50gc8gkbScvEJS8f6HQ1zlsTJEp9otr9LcCe/BmEmnH2zvlMNIXYmxwTuYCoVl
         h9l4s2Cvb3l7pEA//rEUwwcihBmQLb6VwZG7chawaMFJpxsQdsEdQPslu7pSP4ypqR4B
         UHl3r7Umf8e82wbIWXFr3dNkUxpfb3o6pPMNlKcYaHqtNsgs4UpjJs00F5d2IZTMm4F4
         tni3IsfmHHTormrIq/RDr2iCgoZL2QK0pYqyF/upcmsczQQmbh18bgXprmZaY/r62jbS
         0HOnvLpp5Les1T8gMQlzf8WxRzE2NUVKBN2Tizhdo8I0awONj/9N7X2JefYh9KgQbK/+
         lklg==
X-Gm-Message-State: AOJu0Yy8ld1/pmuhBu3o5671ou06b+eRAQyhOBoJEQcP/yKf5x49xzXF
	gRivOLwNK5yvoK34uHHoCwrp0AchNrl6aa+CEovCz9pjJT/lRbk32J9t72Iu81pH
X-Gm-Gg: AR+sD10Tdx/8tqIqKDT+6v/NTE0rTPfx8M0kdc06UBAzsdKx7U+OLhx59Kj7a5ahFKZ
	h1GT6z7+TrCZY5lXpk0eCjezlzmFZJCNvFD9XbICm9erBH0KUsxmlbZYZv4DeQ5vxXM90KUx0Rq
	2EtVMare4/ulbKpxGvy4iwoNQJiRSJali3QO+TskehRw2AR3htNw/cNelbebp0CbirNqHaiiZD3
	WTTPPVIRNg60M1tUylm2TYIAtOf2yjQ310izjmvU1a/1GKfoiZcDIQ6s7hH06VvVDJeFoHIPdfV
	Stc53h+p63X+Qz5s+iQZC9wLJnLvfZYO4YslnDXeCY6goftWRK+IJtaRUE3mku/WDSrl6cU5MT/
	M+9ODGZ+VFNZKOZJkXXEI6X6HilYDSK0jIelWpMZCy7vosDa4QzPZBMiP6py+Dgmxbn7WNkKMcV
	qu3z/SBPogx84YC54=
X-Received: by 2002:a05:6a21:7109:b0:3c4:1c9f:d7d with SMTP id adf61e73a8af0-3c44b155dd3mr6301399637.46.1784859283781;
        Thu, 23 Jul 2026 19:14:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/13] jq: upgrade 1.8.1 -> 1.8.2
Date: Fri, 24 Jul 2026 14:14:03 +1200
Message-ID: <20260724021407.2840261-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128431

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of this version.

Release Notes:
https://github.com/jqlang/jq/releases/tag/jq-1.8.2

PTESTS passed:

root@qemuarm64:~# ptest-runner jq
START: ptest-runner
2026-07-24T02:00
BEGIN: /usr/lib/jq/ptest
...
...
END: /usr/lib/jq/ptest
2026-07-24T02:00
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-with-disable-maintainer-mode-and-so.patch |  44 --
 .../jq/jq/CVE-2026-32316.patch                |  53 --
 .../jq/jq/CVE-2026-33947.patch                | 104 ----
 .../jq/jq/CVE-2026-33948.patch                |  49 --
 .../jq/jq/CVE-2026-39979.patch                |  31 --
 .../jq/jq/CVE-2026-47770.patch                | 484 ------------------
 .../jq/{jq_1.8.1.bb => jq_1.8.2.bb}           |   8 +-
 7 files changed, 1 insertion(+), 772 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
 rename meta-oe/recipes-devtools/jq/{jq_1.8.1.bb => jq_1.8.2.bb} (84%)

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch
deleted file mode 100644
index 12a64a75ed..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 27f417f4812e688a59fc5186b7768cec004cd6e5 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <peter.kjellerstedt@gmail.com>
-Date: Wed, 8 Apr 2026 05:58:49 +0200
-Subject: [PATCH] Support building with --disable-maintainer-mode and source !=
- build dir (#3518)
-
-If --disable-maintainer-mode is enabled, then the rules for generating
-parser.[ch] and lexer.[ch] did nothing. This worked fine if the source
-and build directories are the same as the pre-generated parser.c and
-lexer.c files would suffice. However, if the build directory is not the
-same as the source directory, then the rest of the Make rules expect
-parser.[ch] and lexer.[ch] to have been created in the build directory
-if their source files (parser.y and lexer.l) are newer than the target
-files, which can happen in case the source is fetched using Git.
-
-Avoid the problem by copying the files to the build directory if needed.
-
-Co-authored-by: Peter Kjellerstedt <pkj@axis.com>
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/27f417f4812e688a59fc5186b7768cec004cd6e5]
----
- Makefile.am | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 96d6038..acb9443 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -41,9 +41,14 @@ src/lexer.h: src/lexer.c
- else
- BUILT_SOURCES = src/builtin.inc src/config_opts.inc src/version.h
- .y.c:
--	$(AM_V_YACC) echo "NOT building parser.c!"
-+	$(AM_V_YACC) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(@F) $@
-+	$(AM_V_YACC) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(*F).h $*.h
-+	$(AM_V_YACC) touch $@ $*.h
-+
- .l.c:
--	$(AM_V_LEX) echo "NOT building lexer.c!"
-+	$(AM_V_LEX) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(@F) $@
-+	$(AM_V_LEX) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(*F).h $*.h
-+	$(AM_V_LEX) touch $@ $*.h
- endif
- 
- # Tell YACC (Bison) autoconf macros that you want a header file created.
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
deleted file mode 100644
index 1277b356d8..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 321e62b356df2d4ed47aba4f3818e447ec4d77fc Mon Sep 17 00:00:00 2001
-From: itchyny <itchyny@cybozu.co.jp>
-Date: Thu, 12 Mar 2026 20:28:43 +0900
-Subject: [PATCH] Fix heap buffer overflow in `jvp_string_append` and
- `jvp_string_copy_replace_bad`
-
-In `jvp_string_append`, the allocation size `(currlen + len) * 2` could
-overflow `uint32_t` when `currlen + len` exceeds `INT_MAX`, causing a small
-allocation followed by a large `memcpy`.
-
-In `jvp_string_copy_replace_bad`, the output buffer size calculation
-`length * 3 + 1` could overflow `uint32_t`, again resulting in a small
-allocation followed by a large write.
-
-Add overflow checks to both functions to return an error for strings
-that would exceed `INT_MAX` in length. Fixes CVE-2026-32316.
-
-CVE: CVE-2026-32316
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/jv.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/src/jv.c b/src/jv.c
-index e4529a4..74be05a 100644
---- a/src/jv.c
-+++ b/src/jv.c
-@@ -1114,7 +1114,12 @@ static jv jvp_string_copy_replace_bad(const char* data, uint32_t length) {
-   const char* end = data + length;
-   const char* i = data;
- 
--  uint32_t maxlength = length * 3 + 1; // worst case: all bad bytes, each becomes a 3-byte U+FFFD
-+  // worst case: all bad bytes, each becomes a 3-byte U+FFFD
-+  uint64_t maxlength = (uint64_t)length * 3 + 1;
-+  if (maxlength >= INT_MAX) {
-+    return jv_invalid_with_msg(jv_string("String too long"));
-+  }
-+
-   jvp_string* s = jvp_string_alloc(maxlength);
-   char* out = s->data;
-   int c = 0;
-@@ -1174,6 +1179,10 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
- static jv jvp_string_append(jv string, const char* data, uint32_t len) {
-   jvp_string* s = jvp_string_ptr(string);
-   uint32_t currlen = jvp_string_length(s);
-+  if ((uint64_t)currlen + len >= INT_MAX) {
-+    jv_free(string);
-+    return jv_invalid_with_msg(jv_string("String too long"));
-+  }
- 
-   if (jvp_refcnt_unshared(string.u.ptr) &&
-       jvp_string_remaining_space(s) >= len) {
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
deleted file mode 100644
index 69a8381f06..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 5fd935884a6f5b3d8ecdcacfc5d3982140f3a478 Mon Sep 17 00:00:00 2001
-From: itchyny <itchyny@cybozu.co.jp>
-Date: Mon, 13 Apr 2026 11:23:40 +0900
-Subject: [PATCH] Limit path depth to prevent stack overflow
-
-Deeply nested path arrays can cause unbounded recursion in
-`jv_setpath`, `jv_getpath`, and `jv_delpaths`, leading to
-stack overflow. Add a depth limit of 10000 to match the
-existing `tojson` depth limit. This fixes CVE-2026-33947.
-
-CVE: CVE-2026-33947
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/jv_aux.c  | 21 +++++++++++++++++++++
- tests/jq.test | 25 +++++++++++++++++++++++++
- 2 files changed, 46 insertions(+)
-
-diff --git a/src/jv_aux.c b/src/jv_aux.c
-index bc1405f..594a21f 100644
---- a/src/jv_aux.c
-+++ b/src/jv_aux.c
-@@ -375,6 +375,10 @@ static jv jv_dels(jv t, jv keys) {
-   return t;
- }
- 
-+#ifndef MAX_PATH_DEPTH
-+#define MAX_PATH_DEPTH (10000)
-+#endif
-+
- jv jv_setpath(jv root, jv path, jv value) {
-   if (jv_get_kind(path) != JV_KIND_ARRAY) {
-     jv_free(value);
-@@ -382,6 +386,12 @@ jv jv_setpath(jv root, jv path, jv value) {
-     jv_free(path);
-     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
-   }
-+  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
-+    jv_free(value);
-+    jv_free(root);
-+    jv_free(path);
-+    return jv_invalid_with_msg(jv_string("Path too deep"));
-+  }
-   if (!jv_is_valid(root)){
-     jv_free(value);
-     jv_free(path);
-@@ -434,6 +444,11 @@ jv jv_getpath(jv root, jv path) {
-     jv_free(path);
-     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
-   }
-+  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
-+    jv_free(root);
-+    jv_free(path);
-+    return jv_invalid_with_msg(jv_string("Path too deep"));
-+  }
-   if (!jv_is_valid(root)) {
-     jv_free(path);
-     return root;
-@@ -511,6 +526,12 @@ jv jv_delpaths(jv object, jv paths) {
-       jv_free(elem);
-       return err;
-     }
-+    if (jv_array_length(jv_copy(elem)) > MAX_PATH_DEPTH) {
-+      jv_free(object);
-+      jv_free(paths);
-+      jv_free(elem);
-+      return jv_invalid_with_msg(jv_string("Path too deep"));
-+    }
-     jv_free(elem);
-   }
-   if (jv_array_length(jv_copy(paths)) == 0) {
-diff --git a/tests/jq.test b/tests/jq.test
-index 4ecf72f..6186d8b 100644
---- a/tests/jq.test
-+++ b/tests/jq.test
-@@ -2507,3 +2507,28 @@ strflocaltime("" | ., @uri)
- 0
- ""
- ""
-+
-+# regression test for CVE-2026-33947
-+setpath([range(10000) | 0]; 0) | flatten
-+null
-+[0]
-+
-+try setpath([range(10001) | 0]; 0) catch .
-+null
-+"Path too deep"
-+
-+getpath([range(10000) | 0])
-+null
-+null
-+
-+try getpath([range(10001) | 0]) catch .
-+null
-+"Path too deep"
-+
-+delpaths([[range(10000) | 0]])
-+null
-+null
-+
-+try delpaths([[range(10001) | 0]]) catch .
-+null
-+"Path too deep"
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
deleted file mode 100644
index 8625429c74..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 19a792c4cdb6b91c056eac033ac3367af6e67755 Mon Sep 17 00:00:00 2001
-From: itchyny <itchyny@cybozu.co.jp>
-Date: Mon, 13 Apr 2026 08:46:11 +0900
-Subject: [PATCH] Fix NUL truncation in the JSON parser
-
-This fixes CVE-2026-33948.
-
-CVE: CVE-2026-33948
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/util.c   | 8 +-------
- tests/shtest | 6 ++++++
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/util.c b/src/util.c
-index bcb86da..60ec4d5 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -309,13 +309,7 @@ static int jq_util_input_read_more(jq_util_input_state *state) {
-       if (p != NULL)
-         state->current_line++;
- 
--      if (p == NULL && state->parser != NULL) {
--        /*
--         * There should be no NULs in JSON texts (but JSON text
--         * sequences are another story).
--         */
--        state->buf_valid_len = strlen(state->buf);
--      } else if (p == NULL && feof(state->current_input)) {
-+      if (p == NULL && feof(state->current_input)) {
-         size_t i;
- 
-         /*
-diff --git a/tests/shtest b/tests/shtest
-index 887a6bb..a046afe 100755
---- a/tests/shtest
-+++ b/tests/shtest
-@@ -842,4 +842,10 @@ if ! $msys && ! $mingw; then
-   fi
- fi
- 
-+# CVE-2026-33948: No NUL truncation in the JSON parser
-+if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; then
-+  printf 'Error expected but jq exited successfully\n' 1>&2
-+  exit 1
-+fi
-+
- exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
deleted file mode 100644
index 40c57a46a0..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ac09f274b6c029a23e3dffc38afac819b5daacc4 Mon Sep 17 00:00:00 2001
-From: itchyny <itchyny@cybozu.co.jp>
-Date: Mon, 13 Apr 2026 11:04:52 +0900
-Subject: [PATCH] Fix out-of-bounds read in jv_parse_sized()
-
-This fixes CVE-2026-39979.
-
-Co-authored-by: Mattias Wadman <mattias.wadman@gmail.com>
-
-CVE: CVE-2026-39979
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/jv_parse.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/jv_parse.c b/src/jv_parse.c
-index ffcf51f..e6b8aa9 100644
---- a/src/jv_parse.c
-+++ b/src/jv_parse.c
-@@ -892,8 +892,9 @@ jv jv_parse_sized_custom_flags(const char* string, int length, int flags) {
- 
-   if (!jv_is_valid(value) && jv_invalid_has_msg(jv_copy(value))) {
-     jv msg = jv_invalid_get_msg(value);
--    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%s')",
-+    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%.*s')",
-                                               jv_string_value(msg),
-+                                              length,
-                                               string));
-     jv_free(msg);
-   }
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
deleted file mode 100644
index 1d6664e842..0000000000
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
+++ /dev/null
@@ -1,484 +0,0 @@
-From 63ae676bc6e97635d8246c78f5947ec47eb85a26 Mon Sep 17 00:00:00 2001
-From: Yu-Fu Fu <yufu@yfu.tw>
-Date: Fri, 22 May 2026 04:07:16 -0700
-Subject: [PATCH] Guard deep structural equality and comparison recursion
- (#3539)
-
-jv_equal and jv_cmp overflows the C stack on deeply nested
-input. Cap recursion at 10000 with -1 / INT_MIN sentinels;
-operators that compose user expressions surface this as
-"Equality check too deep" / "Comparison too deep".
-
-Fixes CVE-2026-47770.
-
-Signed-off-by: Anton Skorup <antonsk@axis.com>
-Upstream-Status: Backport [https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787831]
----
- src/builtin.c |  36 +++++++++++++++--
- src/jv.c      |  46 +++++++++++++++++-----
- src/jv_aux.c  | 105 ++++++++++++++++++++++++++++++++++++++++++--------
- tests/jq.test |  40 +++++++++++++++++++
- 4 files changed, 198 insertions(+), 29 deletions(-)
-
-diff --git a/src/builtin.c b/src/builtin.c
-index ac56f9f..ac25f90 100644
---- a/src/builtin.c
-+++ b/src/builtin.c
-@@ -295,7 +295,15 @@ jv binop_minus(jv a, jv b) {
-     jv_array_foreach(a, i, x) {
-       int include = 1;
-       jv_array_foreach(b, j, y) {
--        if (jv_equal(jv_copy(x), y)) {
-+        int equal = jv_equal(jv_copy(x), y);
-+        if (equal < 0) {
-+          jv_free(out);
-+          jv_free(x);
-+          jv_free(a);
-+          jv_free(b);
-+          return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+        }
-+        if (equal) {
-           include = 0;
-           break;
-         }
-@@ -379,11 +387,17 @@ jv binop_mod(jv a, jv b) {
- #undef dtoi
- 
- jv binop_equal(jv a, jv b) {
--  return jv_bool(jv_equal(a, b));
-+  int r = jv_equal(a, b);
-+  if (r < 0)
-+    return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+  return jv_bool(r);
- }
- 
- jv binop_notequal(jv a, jv b) {
--  return jv_bool(!jv_equal(a, b));
-+  int r = jv_equal(a, b);
-+  if (r < 0)
-+    return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+  return jv_bool(!r);
- }
- 
- enum cmp_op {
-@@ -395,6 +409,8 @@ enum cmp_op {
- 
- static jv order_cmp(jv a, jv b, enum cmp_op op) {
-   int r = jv_cmp(a, b);
-+  if (r == INT_MIN)
-+    return jv_invalid_with_msg(jv_string("Comparison too deep"));
-   return jv_bool((op == CMP_OP_LESS && r < 0) ||
-                  (op == CMP_OP_LESSEQ && r <= 0) ||
-                  (op == CMP_OP_GREATEREQ && r >= 0) ||
-@@ -845,6 +861,12 @@ static jv f_bsearch(jq_state *jq, jv input, jv target) {
-   while (start < end) {
-     int mid = start + (end - start) / 2;
-     int result = jv_cmp(jv_copy(target), jv_array_get(jv_copy(input), mid));
-+    if (result == INT_MIN) {
-+      jv_free(answer);
-+      jv_free(input);
-+      jv_free(target);
-+      return jv_invalid_with_msg(jv_string("Comparison too deep"));
-+    }
-     if (result == 0) {
-       answer = jv_number(mid);
-       break;
-@@ -1136,6 +1158,14 @@ static jv minmax_by(jv values, jv keys, int is_min) {
-   for (int i=1; i<jv_array_length(jv_copy(values)); i++) {
-     jv item = jv_array_get(jv_copy(keys), i);
-     int cmp = jv_cmp(jv_copy(item), jv_copy(retkey));
-+    if (cmp == INT_MIN) {
-+      jv_free(item);
-+      jv_free(values);
-+      jv_free(keys);
-+      jv_free(retkey);
-+      jv_free(ret);
-+      return jv_invalid_with_msg(jv_string("Comparison too deep"));
-+    }
-     if ((cmp < 0) == (is_min == 1)) {
-       jv_free(retkey);
-       retkey = item;
-diff --git a/src/jv.c b/src/jv.c
-index f701b46..e079d08 100644
---- a/src/jv.c
-+++ b/src/jv.c
-@@ -912,16 +912,20 @@ static jv* jvp_array_write(jv* a, int i) {
-   }
- }
- 
--static int jvp_array_equal(jv a, jv b) {
-+static int jvp_equal(jv a, jv b, int depth);
-+
-+static int jvp_array_equal(jv a, jv b, int depth) {
-   if (jvp_array_length(a) != jvp_array_length(b))
-     return 0;
-   if (jvp_array_ptr(a) == jvp_array_ptr(b) &&
-       jvp_array_offset(a) == jvp_array_offset(b))
-     return 1;
-   for (int i=0; i<jvp_array_length(a); i++) {
--    if (!jv_equal(jv_copy(*jvp_array_read(a, i)),
--                  jv_copy(*jvp_array_read(b, i))))
--      return 0;
-+    int r = jvp_equal(jv_copy(*jvp_array_read(a, i)),
-+                      jv_copy(*jvp_array_read(b, i)),
-+                      depth);
-+    if (r <= 0)
-+      return r;
-   }
-   return 1;
- }
-@@ -1071,7 +1075,14 @@ jv jv_array_indexes(jv a, jv b) {
-   int alen = jv_array_length(jv_copy(a));
-   for (int ai = 0; ai < alen; ++ai) {
-     jv_array_foreach(b, bi, belem) {
--      if (!jv_equal(jv_array_get(jv_copy(a), ai + bi), belem))
-+      int equal = jv_equal(jv_array_get(jv_copy(a), ai + bi), belem);
-+      if (equal < 0) {
-+        jv_free(res);
-+        jv_free(a);
-+        jv_free(b);
-+        return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+      }
-+      if (!equal)
-         idx = -1;
-       else if (bi == 0 && idx == -1)
-         idx = ai;
-@@ -1828,7 +1839,7 @@ static int jvp_object_length(jv object) {
-   return n;
- }
- 
--static int jvp_object_equal(jv o1, jv o2) {
-+static int jvp_object_equal(jv o1, jv o2, int depth) {
-   int len2 = jvp_object_length(o2);
-   int len1 = 0;
-   for (int i=0; i<jvp_object_size(o1); i++) {
-@@ -1837,7 +1848,8 @@ static int jvp_object_equal(jv o1, jv o2) {
-     jv* slot2 = jvp_object_read(o2, slot->string);
-     if (!slot2) return 0;
-     // FIXME: do less refcounting here
--    if (!jv_equal(jv_copy(slot->value), jv_copy(*slot2))) return 0;
-+    int r = jvp_equal(jv_copy(slot->value), jv_copy(*slot2), depth);
-+    if (r <= 0) return r;
-     len1++;
-   }
-   return len1 == len2;
-@@ -2032,7 +2044,16 @@ int jv_get_refcnt(jv j) {
-  * Higher-level operations
-  */
- 
--int jv_equal(jv a, jv b) {
-+#ifndef MAX_EQUAL_DEPTH
-+#define MAX_EQUAL_DEPTH (10000)
-+#endif
-+
-+static int jvp_equal(jv a, jv b, int depth) {
-+  if (depth > MAX_EQUAL_DEPTH) {
-+    jv_free(a);
-+    jv_free(b);
-+    return -1;
-+  }
-   int r;
-   if (jv_get_kind(a) != jv_get_kind(b)) {
-     r = 0;
-@@ -2048,13 +2069,13 @@ int jv_equal(jv a, jv b) {
-       r = jvp_number_equal(a, b);
-       break;
-     case JV_KIND_ARRAY:
--      r = jvp_array_equal(a, b);
-+      r = jvp_array_equal(a, b, depth + 1);
-       break;
-     case JV_KIND_STRING:
-       r = jvp_string_equal(a, b);
-       break;
-     case JV_KIND_OBJECT:
--      r = jvp_object_equal(a, b);
-+      r = jvp_object_equal(a, b, depth + 1);
-       break;
-     default:
-       r = 1;
-@@ -2066,6 +2087,11 @@ int jv_equal(jv a, jv b) {
-   return r;
- }
- 
-+// Returns 1 if equal, 0 if not equal, or -1 if the comparison is too deep
-+int jv_equal(jv a, jv b) {
-+  return jvp_equal(a, b, 0);
-+}
-+
- int jv_identical(jv a, jv b) {
-   int r;
-   if (a.kind_flags != b.kind_flags
-diff --git a/src/jv_aux.c b/src/jv_aux.c
-index 594a21f..a39f1f1 100644
---- a/src/jv_aux.c
-+++ b/src/jv_aux.c
-@@ -16,6 +16,24 @@ static double jv_number_get_value_and_consume(jv number) {
-   return value;
- }
- 
-+#ifndef MAX_CMP_DEPTH
-+#define MAX_CMP_DEPTH (10000)
-+#endif
-+
-+struct sort_cmp_state {
-+  int too_deep;
-+};
-+
-+#ifdef _MSC_VER
-+static __declspec(thread) struct sort_cmp_state sort_cmp_state;
-+#else
-+#ifdef HAVE___THREAD
-+static __thread struct sort_cmp_state sort_cmp_state;
-+#else
-+static struct sort_cmp_state sort_cmp_state;
-+#endif
-+#endif
-+
- static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
-   // Array slices
-   jv start_jv = jv_object_get(jv_copy(slice), jv_string("start"));
-@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int start) {
-     int delkey = jv_array_length(jv_array_get(jv_copy(paths), i)) == start + 1;
-     jv key = jv_array_get(jv_array_get(jv_copy(paths), i), start);
-     while (j < jv_array_length(jv_copy(paths)) &&
--           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)))
--      j++;
-+           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)) == 1);
-     // if i <= entry < j, then entry starts with key
-     if (delkey) {
-       // deleting this entire key, we don't care about any more specific deletions
-@@ -606,7 +623,13 @@ jv jv_keys(jv x) {
-   }
- }
- 
--int jv_cmp(jv a, jv b) {
-+static int jvp_cmp(jv a, jv b, int depth) {
-+  if (depth > MAX_CMP_DEPTH) {
-+    jv_free(a);
-+    jv_free(b);
-+    return INT_MIN;
-+  }
-+
-   if (jv_get_kind(a) != jv_get_kind(b)) {
-     int r = (int)jv_get_kind(a) - (int)jv_get_kind(b);
-     jv_free(a);
-@@ -621,14 +644,13 @@ int jv_cmp(jv a, jv b) {
-   case JV_KIND_FALSE:
-   case JV_KIND_TRUE:
-     // there's only one of each of these values
--    r = 0;
-     break;
- 
-   case JV_KIND_NUMBER: {
-     if (jvp_number_is_nan(a)) {
--      r = jv_cmp(jv_null(), jv_copy(b));
-+      r = jvp_cmp(jv_null(), jv_copy(b), depth);
-     } else if (jvp_number_is_nan(b)) {
--      r = jv_cmp(jv_copy(a), jv_null());
-+      r = jvp_cmp(jv_copy(a), jv_null(), depth);
-     } else {
-       r = jvp_number_cmp(a, b);
-     }
-@@ -652,7 +674,9 @@ int jv_cmp(jv a, jv b) {
-       }
-       jv xa = jv_array_get(jv_copy(a), i);
-       jv xb = jv_array_get(jv_copy(b), i);
--      r = jv_cmp(xa, xb);
-+      r = jvp_cmp(xa, xb, depth + 1);
-+      if (r == INT_MIN)
-+        break;
-       i++;
-     }
-     break;
-@@ -661,13 +685,14 @@ int jv_cmp(jv a, jv b) {
-   case JV_KIND_OBJECT: {
-     jv keys_a = jv_keys(jv_copy(a));
-     jv keys_b = jv_keys(jv_copy(b));
--    r = jv_cmp(jv_copy(keys_a), keys_b);
-+    r = jvp_cmp(jv_copy(keys_a), keys_b, depth + 1);
-     if (r == 0) {
-       jv_array_foreach(keys_a, i, key) {
-         jv xa = jv_object_get(jv_copy(a), jv_copy(key));
-         jv xb = jv_object_get(jv_copy(b), key);
--        r = jv_cmp(xa, xb);
--        if (r) break;
-+        r = jvp_cmp(xa, xb, depth + 1);
-+        if (r != 0)
-+          break;
-       }
-     }
-     jv_free(keys_a);
-@@ -680,6 +705,11 @@ int jv_cmp(jv a, jv b) {
-   return r;
- }
- 
-+// Returns <0, 0, >0 if a is less than, equal to, or greater than b, or
-+// INT_MIN if the comparison is too deep
-+int jv_cmp(jv a, jv b) {
-+  return jvp_cmp(a, b, 0);
-+}
- 
- struct sort_entry {
-   jv object;
-@@ -687,19 +717,32 @@ struct sort_entry {
-   int index;
- };
- 
-+static void sort_entry_array_free(struct sort_entry* entries, int start, int n) {
-+  for (int i = start; i < n; i++) {
-+    jv_free(entries[i].key);
-+    jv_free(entries[i].object);
-+  }
-+  jv_mem_free(entries);
-+}
-+
- static int sort_cmp(const void* pa, const void* pb) {
-   const struct sort_entry* a = pa;
-   const struct sort_entry* b = pb;
-   int r = jv_cmp(jv_copy(a->key), jv_copy(b->key));
-+  if (r == INT_MIN) {
-+    sort_cmp_state.too_deep = 1;
-+    return 0;
-+  }
-   // comparing by index if r == 0 makes the sort stable
-   return r ? r : (a->index - b->index);
- }
- 
--static struct sort_entry* sort_items(jv objects, jv keys) {
-+static struct sort_entry* sort_items(jv objects, jv keys, int *too_deep) {
-   assert(jv_get_kind(objects) == JV_KIND_ARRAY);
-   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
-   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
-   int n = jv_array_length(jv_copy(objects));
-+  *too_deep = 0;
-   if (n == 0) {
-     jv_free(objects);
-     jv_free(keys);
-@@ -713,7 +756,13 @@ static struct sort_entry* sort_items(jv objects, jv keys) {
-   }
-   jv_free(objects);
-   jv_free(keys);
-+  sort_cmp_state.too_deep = 0;
-   qsort(entries, n, sizeof(struct sort_entry), sort_cmp);
-+  if (sort_cmp_state.too_deep) {
-+    sort_entry_array_free(entries, 0, n);
-+    *too_deep = 1;
-+    return NULL;
-+  }
-   return entries;
- }
- 
-@@ -722,7 +771,10 @@ jv jv_sort(jv objects, jv keys) {
-   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
-   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
-   int n = jv_array_length(jv_copy(objects));
--  struct sort_entry* entries = sort_items(objects, keys);
-+  int too_deep = 0;
-+  struct sort_entry* entries = sort_items(objects, keys, &too_deep);
-+  if (too_deep)
-+    return jv_invalid_with_msg(jv_string("Comparison too deep"));
-   jv ret = jv_array();
-   for (int i=0; i<n; i++) {
-     jv_free(entries[i].key);
-@@ -737,13 +789,24 @@ jv jv_group(jv objects, jv keys) {
-   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
-   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
-   int n = jv_array_length(jv_copy(objects));
--  struct sort_entry* entries = sort_items(objects, keys);
-+  int too_deep = 0;
-+  struct sort_entry* entries = sort_items(objects, keys, &too_deep);
-+  if (too_deep)
-+    return jv_invalid_with_msg(jv_string("Comparison too deep"));
-   jv ret = jv_array();
-   if (n > 0) {
-     jv curr_key = entries[0].key;
-     jv group = jv_array_append(jv_array(), entries[0].object);
-     for (int i = 1; i < n; i++) {
--      if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
-+      int equal = jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
-+      if (equal < 0) {
-+        jv_free(curr_key);
-+        jv_free(group);
-+        sort_entry_array_free(entries, i, n);
-+        jv_free(ret);
-+        return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+      }
-+      if (equal) {
-         jv_free(entries[i].key);
-       } else {
-         jv_free(curr_key);
-@@ -765,11 +828,21 @@ jv jv_unique(jv objects, jv keys) {
-   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
-   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
-   int n = jv_array_length(jv_copy(objects));
--  struct sort_entry* entries = sort_items(objects, keys);
-+  int too_deep = 0;
-+  struct sort_entry* entries = sort_items(objects, keys, &too_deep);
-+  if (too_deep)
-+    return jv_invalid_with_msg(jv_string("Comparison too deep"));
-   jv ret = jv_array();
-   jv curr_key = jv_invalid();
-   for (int i = 0; i < n; i++) {
--    if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
-+    int equal = jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
-+    if (equal < 0) {
-+      jv_free(curr_key);
-+      sort_entry_array_free(entries, i, n);
-+      jv_free(ret);
-+      return jv_invalid_with_msg(jv_string("Equality check too deep"));
-+    }
-+    if (equal) {
-       jv_free(entries[i].key);
-       jv_free(entries[i].object);
-     } else {
-diff --git a/tests/jq.test b/tests/jq.test
-index 5013bce..f35ef94 100644
---- a/tests/jq.test
-+++ b/tests/jq.test
-@@ -2560,3 +2560,43 @@ null
- try delpaths([[range(10001) | 0]]) catch .
- null
- "Path too deep"
-+
-+# regression test for CVE-2026-40612
-+reduce range(10000) as $_ ([]; [.]) | contains([[]])
-+null
-+true
-+
-+try (reduce range(10001) as $_ ([]; [.]) as $x | $x | contains($x)) catch .
-+null
-+"Containment check too deep"
-+
-+# regression test for CVE-2026-43896
-+reduce range(10000) as $_ ({}; {a: .}) as $x | $x * $x | length
-+null
-+1
-+
-+try (reduce range(10001) as $_ ({}; {a: .}) as $x | $x * $x) catch .
-+null
-+"Object merge too deep"
-+
-+# regression test for deep structural equality recursion
-+try ((reduce range(10001) as $_ ([]; [.])) as $x | (reduce range(10001) as $_ ([]; [.])) as $y | $x == $y) catch .
-+null
-+"Equality check too deep"
-+
-+# regression tests for deep ordering comparisons
-+try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | sort) catch .
-+null
-+"Comparison too deep"
-+
-+try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | unique) catch .
-+null
-+"Comparison too deep"
-+
-+try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | sort) catch .
-+null
-+"Comparison too deep"
-+
-+try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | unique) catch .
-+null
-+"Comparison too deep"
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
similarity index 84%
rename from meta-oe/recipes-devtools/jq/jq_1.8.1.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.2.bb
index 7b07bf0f99..c413391a7a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -8,16 +8,10 @@ SECTION = "utils"
 LICENSE = "BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
-SRCREV = "4467af7068b1bcd7f882defff6e7ea674c5357f4"
+SRCREV = "34f7186b86743a083a589741b6cea95293524108"
 
 SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
            file://run-ptest \
-           file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
-           file://CVE-2026-32316.patch \
-           file://CVE-2026-33947.patch \
-           file://CVE-2026-33948.patch \
-           file://CVE-2026-39979.patch \
-           file://CVE-2026-47770.patch \
            "
 
 inherit autotools ptest

