Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD045CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 01:42:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.141234.1781560967834130191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 15:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f/5U8ZAY;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: colinmca242@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6b571750bso3254150a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781560967; x=1782165767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7T1Zj0G7jl+wOTgeYFtHB3/9T0B/ymiue1nv3CaEcU=;
        b=f/5U8ZAYlCANJOoS9MMKdlU9r+7IqWftra1k4R3Zem+b1/IZEmnnRXPAaA0MvZOFff
         29Yrp9HfTkwtyTAQHLOp7Mrun76xWLxfaFHPmjyniZw8WqkGypIGEEaTLJ8Q3+tliSKj
         o+WNSbcXujERSuU6wpj/og8p0Y30LIJnLQAVf0Mkc/eGOWfoYlSxxojjxgF17oOZM8WB
         ZBWSWPXDn1XM9/2ieUlx7/h9RT8j1b2kpuW6rzFH0fj9Ko4+3QY/jaNlUDkeqsp5dqhL
         PFpxsrfHOmxKkDzIkbcrzhIWDC3/Arv10ohDB2mUNlXrdMsORm3anmCi2rYZHnXI57YK
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781560967; x=1782165767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7T1Zj0G7jl+wOTgeYFtHB3/9T0B/ymiue1nv3CaEcU=;
        b=qp9lvSLibV18eXWgFNNwDw8/iLtR+7bf214nhqedypa3TDAvAhpXxQ5W1SlwmECVA0
         dS5Zfsz0lE0kzpctvsLIn9oqxWGuYpFFIH1cNySo3YzfXuEa62nT5PsrgqcL2aj1Eiis
         AA2ZW41At0jfBXGieK/g5Y9REQr/aDgcMYaks5Ex557P1TfQJ4Q9rgoZ3R0oj0DG5mX4
         I4x+loNYQ8pK0rrvqq+vMp3xhknA1OcnpmSjhx0j6CHPumkN7P5nUosnBISVGQ/Htez4
         Rr+H2i9k+94mTIcWPSQXlfl6dc3NENAAobX6NeJgS492qgkxjmhPzKox2kW/DNcx9uOW
         HO3A==
X-Gm-Message-State: AOJu0YzIuhro0n++/PnOFbB+cfgUsOAs4tEZlrT99sOcnjhsWXA9rO0Z
	I6GnwIrGDC+xsp1zD4ZMEEmLXirKXTUK5mbFsx43X0uAL+ibdrK0knMAYLfaQKThCGg=
X-Gm-Gg: Acq92OE9hhKMSflOumM3K3FeB1+6DJ3ZEPDzx9wUa0YV0liutRcEBpebzWJCBDlP5kg
	TjDMnxj9yLpfr90awZeVMBP+2WyhSSudkfKcTiDXYeLGpBcKUvirTQu5J2SdilmsHzaYNjrH/1P
	lz/j6oEsv8y6yKDnjCeFfoYa0Slt2yvR0b4ZlgHnCxkRDA1pJHj9QP6x9t5DAJnsKBbt54QBrqP
	kgMcr/+qiDke3m0CUJ9z7hGULXQ+C/v8FJC7ay8tDnfvxzLJzzAmHjc77sFFVDkftHIMuSnuMlU
	WkZ5BCAwVWfl6tkcMug66gTJEi2ZAMPnZ/5aA58oY9qGPY5jiyLyw1s7y8jC6BPSGwkZyDNs50D
	6zGJGS+kgYoFFUcfDEUj3a/9I0I1IumOu+0wePE5wcqjAXWW3mEYQiT5aUglitX6TO6QNKthl26
	/UWnEFElR14BUg5qLZLOM=
X-Received: by 2002:a05:6830:3103:b0:7e6:f9e4:539b with SMTP id 46e09a7af769-7e8fc378f0emr1167718a34.9.1781560965002;
        Mon, 15 Jun 2026 15:02:45 -0700 (PDT)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5bb9c3sm5213280a34.10.2026.06.15.15.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:02:43 -0700 (PDT)
From: "Colin McAllister" <colinmca242@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [meta-oe][PATCH 2/2] libsoup-2.4: Remove recipe
Date: Mon, 15 Jun 2026 17:02:13 -0500
Message-ID: <20260615220213.604463-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615220213.604463-1-colinmca242@gmail.com>
References: <20260615220213.604463-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127597

Libsoup-2.4 has been deprecated and is no longer receiving support or
security fixes. The recipe can be removed now that no recipes in
meta-openembedded depend on it.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ------
 ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 ----
 ...-Fix-possibly-uninitialized-warnings.patch |  43 ----
 ...-http-and-https-aliases-support-test.patch | 145 -----------
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ------------
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 ---
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ----------
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 ---
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 ----
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ----
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 ----
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 -----
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ------------------
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ----------
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ---
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ---
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ---
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ------
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ---
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 ---
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ---
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 -------
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ---
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 -----
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ----
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ---------
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 ---
 .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 151 ------------
 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   |  31 ---
 .../libsoup/libsoup-2.4/CVE-2026-1760.patch   | 153 ------------
 .../libsoup/libsoup-2.4/CVE-2026-1761.patch   |  36 ---
 .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 126 ----------
 .../libsoup/libsoup-2.4/CVE-2026-2369.patch   |  33 ---
 .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 135 -----------
 .../libsoup/libsoup-2.4_2.74.3.bb             |  97 --------
 39 files changed, 2793 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
 delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
deleted file mode 100644
index d75594bb4f..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 30 Apr 2025 14:59:55 +0800
-Subject: [PATCH] CVE-2025-32911
-
-CVE: CVE-2025-32911 CVE-2025-32913
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c | 13 +++++++++----
- tests/header-parsing-test.c    | 15 +++++++++++++++
- 2 files changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 39ad14a..78b2455 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
- 	 */
- 	if (params && g_hash_table_lookup_extended (*params, "filename",
- 						    &orig_key, &orig_value)) {
--		char *filename = strrchr (orig_value, '/');
--
--		if (filename)
--			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
-+                if (orig_value) {
-+                        char *filename = strrchr (orig_value, '/');
-+
-+                        if (filename)
-+                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
-+                } else {
-+                        /* filename with no value isn't valid. */
-+                        g_hash_table_remove (*params, "filename");
-+                }
- 	}
- 	return TRUE;
- }
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 946f118..752196e 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
- #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
-+#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
- 
- static void
- do_content_disposition_tests (void)
-@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
- 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
-         parameter2 = g_hash_table_lookup (params, "foo");
-         g_assert_cmpstr (parameter2, ==, "bar");
-+	g_hash_table_destroy (params);
-+
-+	 /* Empty filename */
-+	soup_message_headers_clear (hdrs);
-+	soup_message_headers_append (hdrs, "Content-Disposition",
-+								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
-+	if (!soup_message_headers_get_content_disposition (hdrs,
-+													   &disposition,
-+													   &params)) {
-+			soup_test_assert (FALSE, "empty filename decoding FAILED");
-+			return;
-+	}
-+	g_free (disposition);
-+	g_assert_false (g_hash_table_contains (params, "filename"));
- 	g_hash_table_destroy (params);
- 
- 	soup_message_headers_free (hdrs);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
deleted file mode 100644
index d867e5bc17..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Nov 2023 18:49:10 -0800
-Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
-
-Fixes build errors about missing function prototypes with clang-17
-
-Fixes
-| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libsoup/soup-xmlrpc-old.c | 1 +
- libsoup/soup-xmlrpc.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
-index c57086b6..527e3b23 100644
---- a/libsoup/soup-xmlrpc-old.c
-+++ b/libsoup/soup-xmlrpc-old.c
-@@ -11,6 +11,7 @@
- 
- #include <string.h>
- 
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- 
- #include "soup-xmlrpc-old.h"
-diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
-index 42dcda9c..e991cbf0 100644
---- a/libsoup/soup-xmlrpc.c
-+++ b/libsoup/soup-xmlrpc.c
-@@ -17,6 +17,7 @@
- 
- #include <string.h>
- #include <errno.h>
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- #include "soup-xmlrpc.h"
- #include "soup.h"
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
deleted file mode 100644
index fcd442c13a..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Mon, 20 Sep 2021 15:41:31 -0500
-Subject: [PATCH] Fix possibly uninitialized warnings
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 2 +-
- tests/samesite-test.c               | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index 65c1492..585d45c 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
- 	GByteArray *bytes;
- 	gsize frame_len;
- 	guint8 *outer;
--	guint8 mask_offset;
-+	guint8 mask_offset = 0;
- 	GBytes *filtered_bytes;
- 	GList *l;
- 	GError *error = NULL;
-diff --git a/tests/samesite-test.c b/tests/samesite-test.c
-index 0b081b2..60c9b8e 100644
---- a/tests/samesite-test.c
-+++ b/tests/samesite-test.c
-@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSameSitePolicy policy)
- 	case SOUP_SAME_SITE_POLICY_NONE:
- 		expected_count = 1;
- 		break;
-+	default:
-+		g_assert_not_reached ();
-+		break;
- 	}
- 
- 	g_assert_cmpuint (size, ==, expected_count);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
deleted file mode 100644
index 0d4139ec08..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Thu, 11 Feb 2021 10:47:09 +0100
-Subject: [PATCH] Remove http and https aliases support test
-
-Upstream has removed the whole function of http and https aliases
-support, this commit partially cherry pick it, only remove the test to
-mute the warning:
-| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliases_test':
-| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
-|   180 |                 g_socket_client_set_tls_validation_flags (client, 0);
-|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/server-test.c | 104 --------------------------------------------
- 1 file changed, 104 deletions(-)
-
-diff --git a/tests/server-test.c b/tests/server-test.c
-index 8976103..cb7e815 100644
---- a/tests/server-test.c
-+++ b/tests/server-test.c
-@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_data)
- 	soup_uri_free (star_uri);
- }
- 
--static void
--do_one_server_aliases_test (SoupURI    *uri,
--			    const char *alias,
--			    gboolean    succeed)
--{
--	GSocketClient *client;
--	GSocketConnectable *addr;
--	GSocketConnection *conn;
--	GInputStream *in;
--	GOutputStream *out;
--	GError *error = NULL;
--	GString *req;
--	static char buf[1024];
--
--	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
--
--	/* There's no way to make libsoup's client side send an absolute
--	 * URI (to a non-proxy server), so we have to fake this.
--	 */
--
--	client = g_socket_client_new ();
--	if (uri->scheme == SOUP_URI_SCHEME_HTTPS) {
--		g_socket_client_set_tls (client, TRUE);
--		g_socket_client_set_tls_validation_flags (client, 0);
--	}
--	addr = g_network_address_new (uri->host, uri->port);
--
--	conn = g_socket_client_connect (client, addr, NULL, &error);
--	g_object_unref (addr);
--	g_object_unref (client);
--	if (!conn) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		return;
--	}
--
--	in = g_io_stream_get_input_stream (G_IO_STREAM (conn));
--	out = g_io_stream_get_output_stream (G_IO_STREAM (conn));
--
--	req = g_string_new (NULL);
--	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
--				alias, uri->host, uri->port);
--	g_string_append_printf (req, "Host: %s:%d\r\n",
--				uri->host, uri->port);
--	g_string_append (req, "Connection: close\r\n\r\n");
--
--	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &error)) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		g_string_free (req, TRUE);
--		return;
--	}
--	g_string_free (req, TRUE);
--
--	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		return;
--	}
--
--	if (succeed)
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
--	else
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
--
--	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
--	g_object_unref (conn);
--}
--
--static void
--do_server_aliases_test (ServerData *sd, gconstpointer test_data)
--{
--	char *http_aliases[] = { "dav", NULL };
--	char *https_aliases[] = { "davs", NULL };
--	char *http_good[] = { "http", "dav", NULL };
--	char *http_bad[] = { "https", "davs", "fred", NULL };
--	char *https_good[] = { "https", "davs", NULL };
--	char *https_bad[] = { "http", "dav", "fred", NULL };
--	int i;
--
--	g_test_bug ("703694");
--
--	g_object_set (G_OBJECT (sd->server),
--		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
--		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
--		      NULL);
--
--	for (i = 0; http_good[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
--	for (i = 0; http_bad[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
--
--	if (tls_available) {
--		for (i = 0; https_good[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
--		for (i = 0; https_bad[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
--	}
--}
--
- static void
- do_dot_dot_test (ServerData *sd, gconstpointer test_data)
- {
-@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
- 
- 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
- 		    server_setup, do_star_test, server_teardown);
--	g_test_add ("/server/aliases", ServerData, NULL,
--		    server_setup, do_server_aliases_test, server_teardown);
- 	g_test_add ("/server/..-in-path", ServerData, NULL,
- 		    server_setup, do_dot_dot_test, server_teardown);
- 	g_test_add ("/server/ipv6", ServerData, NULL,
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
deleted file mode 100644
index 04713850e1..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Mon, 8 Jul 2024 12:33:15 -0500
-Subject: [PATCH] headers: Strictly don't allow NUL bytes
-
-In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
-
-CVE: CVE-2024-52530
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c      | 15 +++------
- tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
- 2 files changed, 32 insertions(+), 45 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index eec28ad..e5d3c03 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
- 	 * ignorable trailing whitespace.
- 	 */
- 
-+	/* No '\0's are allowed */
-+	if (memchr (str, '\0', len))
-+		return FALSE;
-+
- 	/* Skip over the Request-Line / Status-Line */
- 	headers_start = memchr (str, '\n', len);
- 	if (!headers_start)
- 		return FALSE;
--	/* No '\0's in the Request-Line / Status-Line */
--	if (memchr (str, '\0', headers_start - str))
--		return FALSE;
- 
- 	/* We work on a copy of the headers, which we can write '\0's
- 	 * into, so that we don't have to individually g_strndup and
-@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
- 	headers_copy[copy_len] = '\0';
- 	value_end = headers_copy;
- 
--	/* There shouldn't be any '\0's in the headers already, but
--	 * this is the web we're talking about.
--	 */
--	while ((p = memchr (headers_copy, '\0', copy_len))) {
--		memmove (p, p + 1, copy_len - (p - headers_copy));
--		copy_len--;
--	}
--
- 	while (*(value_end + 1)) {
- 		name = value_end + 1;
- 		name_end = strchr (name, ':');
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 752196e..c1d3b33 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -358,24 +358,6 @@ static struct RequestTest {
- 	  }
- 	},
- 
--	{ "NUL in header name", "760832",
--	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
--	  SOUP_STATUS_OK,
--	  "GET", "/", SOUP_HTTP_1_1,
--	  { { "Host", "example.com" },
--	    { NULL }
--	  }
--	},
--
--	{ "NUL in header value", "760832",
--	  "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
--	  SOUP_STATUS_OK,
--	  "GET", "/", SOUP_HTTP_1_1,
--	  { { "Host", "examplecom" },
--	    { NULL }
--	  }
--	},
--
- 	/************************/
- 	/*** INVALID REQUESTS ***/
- 	/************************/
-@@ -448,6 +430,21 @@ static struct RequestTest {
- 	  SOUP_STATUS_EXPECTATION_FAILED,
- 	  NULL, NULL, -1,
- 	  { { NULL } }
-+	},
-+
-+	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
-+	{ "NUL in header name", NULL,
-+	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
-+	  SOUP_STATUS_BAD_REQUEST,
-+	  NULL, NULL, -1,
-+	  { { NULL } }
-+	},
-+
-+	{ "NUL in header value", NULL,
-+	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
-+	  SOUP_STATUS_BAD_REQUEST,
-+           NULL, NULL, -1,
-+	  { { NULL } }
- 	}
- };
- static const int num_reqtests = G_N_ELEMENTS (reqtests);
-@@ -620,22 +617,6 @@ static struct ResponseTest {
- 	    { NULL } }
- 	},
- 
--	{ "NUL in header name", "760832",
--	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
--	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
--	  { { "Foo", "bar" },
--	    { NULL }
--	  }
--	},
--
--	{ "NUL in header value", "760832",
--	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
--	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
--	  { { "Foo", "bar" },
--	    { NULL }
--	  }
--	},
--
- 	/********************************/
- 	/*** VALID CONTINUE RESPONSES ***/
- 	/********************************/
-@@ -768,6 +749,19 @@ static struct ResponseTest {
- 	  { { NULL }
- 	  }
- 	},
-+
-+	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
-+	{ "NUL in header name", NULL,
-+	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
-+	  -1, 0, NULL,
-+	  { { NULL } }
-+	},
-+
-+	{ "NUL in header value", "760832",
-+	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
-+	  -1, 0, NULL,
-+	  { { NULL } }
-+	},
- };
- static const int num_resptests = G_N_ELEMENTS (resptests);
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
deleted file mode 100644
index 9de0310c8d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 13:42:08 +0800
-Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
- soup_header_parse_semi_param_list()
-
-CVE: CVE-2024-52531
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/header-parsing-test.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index b811115..cfcc003 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -836,6 +836,17 @@ static struct ParamListTest {
- 	    { "filename", "t\xC3\xA9st.txt" },
- 	  },
- 	},
-+
-+/* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
-+	{ TRUE,
-+	  "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
-+	   {
-+		{ "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
-+		{ "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
-+		{ "foo", NULL },
-+	   },
-+	}
-+
- };
- static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
deleted file mode 100644
index 740c28c016..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 13:52:37 +0800
-Subject: [PATCH] headers: Be more robust against invalid input when
- parsing params
-
-If you pass invalid input to a function such as soup_header_parse_param_list_strict()
-it can cause an overflow if it decodes the input to UTF-8.
-
-This should never happen with valid UTF-8 input which libsoup's client API
-ensures, however it's server API does not currently.
-
-CVE: CVE-2024-52531
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
- 1 file changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 67905b2..39e8d34 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
- }
- 
- static void
--decode_quoted_string (char *quoted_string)
-+decode_quoted_string_inplace (GString *quoted_gstring)
- {
-+	char *quoted_string = quoted_gstring->str;
- 	char *src, *dst;
- 
- 	src = quoted_string + 1;
-@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
- }
- 
- static gboolean
--decode_rfc5987 (char *encoded_string)
-+decode_rfc5987_inplace (GString *encoded_gstring)
- {
- 	char *q, *decoded;
- 	gboolean iso_8859_1 = FALSE;
-+	const char *encoded_string = encoded_gstring->str;
- 
- 	q = strchr (encoded_string, '\'');
- 	if (!q)
-@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
- 		decoded = utf8;
- 	}
- 
--	/* If encoded_string was UTF-8, then each 3-character %-escape
--	 * will be converted to a single byte, and so decoded is
--	 * shorter than encoded_string. If encoded_string was
--	 * iso-8859-1, then each 3-character %-escape will be
--	 * converted into at most 2 bytes in UTF-8, and so it's still
--	 * shorter.
--	 */
--	strcpy (encoded_string, decoded);
-+	g_string_assign (encoded_gstring, decoded);
- 	g_free (decoded);
- 	return TRUE;
- }
-@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
- {
- 	GHashTable *params;
- 	GSList *list, *iter;
--	char *item, *eq, *name_end, *value;
--	gboolean override, duplicated;
- 
- 	params = g_hash_table_new_full (soup_str_case_hash, 
- 					soup_str_case_equal,
--					g_free, NULL);
-+					g_free, g_free);
- 
- 	list = parse_list (header, delim);
- 	for (iter = list; iter; iter = iter->next) {
-+ 		char *item, *eq, *name_end;
-+		gboolean override, duplicated;
-+		GString *parsed_value = NULL;
- 		item = iter->data;
- 		override = FALSE;
- 
-@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
- 
- 			*name_end = '\0';
- 
--			value = (char *)skip_lws (eq + 1);
-+			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
- 
- 			if (name_end[-1] == '*' && name_end > item + 1) {
- 				name_end[-1] = '\0';
--				if (!decode_rfc5987 (value)) {
-+				if (!decode_rfc5987_inplace (parsed_value)) {
-+					g_string_free (parsed_value, TRUE);
- 					g_free (item);
- 					continue;
- 				}
- 				override = TRUE;
--			} else if (*value == '"')
--				decode_quoted_string (value);
--		} else
--			value = NULL;
-+			} else if (parsed_value->str[0] == '"')
-+				decode_quoted_string_inplace (parsed_value);
-+			}
- 
- 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
- 
-@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
- 			soup_header_free_param_list (params);
- 			params = NULL;
- 			g_slist_foreach (iter, (GFunc)g_free, NULL);
-+			if (parsed_value)
-+				g_string_free (parsed_value, TRUE);
- 			break;
--		} else if (override || !duplicated)
--			g_hash_table_replace (params, item, value);
--		else
-+		} else if (override || !duplicated) {
-+			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
-+		} else {
-+			if (parsed_value)
-+				g_string_free (parsed_value, TRUE);
- 			g_free (item);
-+		}
- 	}
- 
- 	g_slist_free (list);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
deleted file mode 100644
index cb1f096110..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 11 Sep 2024 11:52:11 +0200
-Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
-
-Otherwise we can enter in a read loop because we were not
-validating the data until the all the data was read.
-
-Fixes #391
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index a4095e1..65c1492 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
- 		}
- 
- 		pv->incoming->len = len + count;
--	} while (count > 0);
--
--	process_incoming (self);
-+		process_incoming (self);
-+	} while (count > 0 && !pv->close_sent && !pv->io_closing);
- 
- 	if (end) {
- 		if (!pv->close_sent || !pv->close_received) {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
deleted file mode 100644
index dcadafe944..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 2 Oct 2024 11:17:19 +0200
-Subject: [PATCH] websocket-test: disconnect error copy after the test ends
-
-Otherwise the server will have already sent a few more wrong
-bytes and the client will continue getting errors to copy
-but the error is already != NULL and it will assert
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 5e40cf3..1ec9ff6 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	GError *error = NULL;
- 	InvalidEncodeLengthTest context = { test, NULL };
- 	guint i;
-+	guint error_id;
- 
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
-+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
- 
- 	/* We use 127(\x7f) as payload length with 65535 extended length */
-@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	WAIT_UNTIL (error != NULL || received != NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
- 	g_clear_error (&error);
-+	g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
- 
-         g_thread_join (thread);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
deleted file mode 100644
index ab6af72291..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Wed, 13 Nov 2024 14:14:23 +0000
-Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
-
-This is the same change as commit 29b96fab "websocket-test: disconnect
-error copy after the test ends", and is done for the same reason, but
-replicating it into a different function.
-
-Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
-Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 2b19a7b..0699a06 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	GError *error = NULL;
- 	InvalidEncodeLengthTest context = { test, NULL };
- 	guint i;
-+	guint error_id;
- 
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
-+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
- 
- 	/* We use 126(~) as payload length with 125 extended length */
-@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	WAIT_UNTIL (error != NULL || received != NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
- 	g_clear_error (&error);
-+        g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
- 
- 	g_thread_join (thread);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
deleted file mode 100644
index 7815dba55a..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 4 Feb 2026 15:08:50 +0800
-Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
-
-This is a simplified version of my patch for libsoup 3:
-
-!491
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472]
-CVE: CVE-2025-14523
-
-This patch is a MR for branch 2-74, but not merged yet, maybe it will
-not be merged.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c         | 3 +++
- libsoup/soup-message-headers.c | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index ea2f986..6cd3dad 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
- 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
- 			*p = ' ';
- 
-+		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
-+			goto done;
-+
- 		soup_message_headers_append (dest, name, value);
-         }
- 	success = TRUE;
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index f612bff..bb20bbb 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
- 	}
- #endif
- 
-+	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
-+		return;
-+
- 	header.name = intern_header_name (name, &setter);
- 	header.value = g_strdup (value);
- 	g_array_append_val (hdrs->array, header);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
deleted file mode 100644
index 106f907168..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 12 May 2025 14:06:41 +0800
-Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
-
-CVE: CVE-2025-2784
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304;
- https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
-
-Test code is not added since it uses some functions not defined in
-version 2.74. These tests are not used now, so just ignore them.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-content-sniffer.c |  9 +++----
- 1 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 5f2896e..9554636 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- }
- 
- static gboolean
--skip_insignificant_space (const char *resource, int *pos, int resource_length)
-+skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
- {
-+	if (*pos >= resource_length)
-+		return TRUE;
- 	while ((resource[*pos] == '\x09') ||
- 	       (resource[*pos] == '\x20') ||
- 	       (resource[*pos] == '\x0A') ||
-@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- {
- 	const char *resource = (const char *)buffer->data;
- 	int resource_length = MIN (512, buffer->length);
--	int pos = 0;
-+	gsize pos = 0;
- 
- 	if (resource_length < 3)
- 		goto text_html;
-@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- 		pos = 3;
- 
-  look_for_tag:
--	if (pos > resource_length)
--		goto text_html;
--
- 	if (skip_insignificant_space (resource, &pos, resource_length))
- 		goto text_html;
-
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
deleted file mode 100644
index 64e87cb1ec..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Feb 2026 16:20:02 +0800
-Subject: [PATCH 1/2] websocket: add a way to restrict the total message size
-
-Otherwise a client could send small packages smaller than
-total-incoming-payload-size but still to break the server
-with a big allocation
-
-Fixes: #390
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
-CVE: CVE-2025-32049
-
-libsoup2 is not maintained, the patch is backported from libsoup3, and
-change accordingly
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
- libsoup/soup-websocket-connection.h |   7 ++
- 2 files changed, 107 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index 9d5f4f8..3dad477 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -85,7 +85,8 @@ enum {
- 	PROP_STATE,
- 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
- 	PROP_KEEPALIVE_INTERVAL,
--	PROP_EXTENSIONS
-+	PROP_EXTENSIONS,
-+	PROP_MAX_TOTAL_MESSAGE_SIZE,
- };
- 
- enum {
-@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
- 	char *origin;
- 	char *protocol;
- 	guint64 max_incoming_payload_size;
-+	guint64 max_total_message_size;
- 	guint keepalive_interval;
- 
- 	gushort peer_close_code;
-@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
- };
- 
- #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
-+#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
- #define READ_BUFFER_SIZE 1024
- #define MASK_LENGTH 4
- 
-@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
- }
- 
- static void
--too_big_error_and_close (SoupWebsocketConnection *self,
-+too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
-                          guint64 payload_len)
- {
- 	GError *error;
-@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *self,
- 	emit_error_and_close (self, error, TRUE);
- }
- 
-+static void
-+too_big_message_error_and_close (SoupWebsocketConnection *self,
-+                                 guint64 len)
-+{
-+	GError *error;
-+
-+	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
-+				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
-+				     self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
-+				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
-+				     "Received WebSocket payload from the server larger than configured max-total-message-size");
-+	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
-+	         self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
-+	         len, self->pv->max_total_message_size);
-+	emit_error_and_close (self, error, TRUE);
-+}
-+
- static void
- close_connection (SoupWebsocketConnection *self,
-                   gushort                  code,
-@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
- 		switch (pv->message_opcode) {
- 		case 0x01:
- 		case 0x02:
-+			/* Safety valve */
-+			if (pv->max_total_message_size > 0 &&
-+			    (pv->message_data->len + payload_len) > pv->max_total_message_size) {
-+				too_big_message_error_and_close (self, (pv->message_data->len + payload_len));
-+				return;
-+			}
- 			g_byte_array_append (pv->message_data, payload, payload_len);
- 			break;
- 		default:
-@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
- 	/* Safety valve */
- 	if (self->pv->max_incoming_payload_size > 0 &&
- 	    payload_len >= self->pv->max_incoming_payload_size) {
--		too_big_error_and_close (self, payload_len);
-+		too_big_incoming_payload_error_and_close (self, payload_len);
- 		return FALSE;
- 	}
- 
-@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *object,
- 		g_value_set_pointer (value, pv->extensions);
- 		break;
- 
-+	case PROP_MAX_TOTAL_MESSAGE_SIZE:
-+		g_value_set_uint64 (value, pv->max_total_message_size);
-+		break;
-+
- 	default:
- 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
- 		break;
-@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *object,
- 		pv->extensions = g_value_get_pointer (value);
- 		break;
- 
-+	case PROP_MAX_TOTAL_MESSAGE_SIZE:
-+		pv->max_total_message_size = g_value_get_uint64 (value);
-+		break;
-+
- 	default:
- 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
- 		break;
-@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
-                                                                G_PARAM_READWRITE |
-                                                                G_PARAM_CONSTRUCT_ONLY |
-                                                                G_PARAM_STATIC_STRINGS));
--
-+	/**
-+	 * SoupWebsocketConnection:max-total-message-size:
-+	 *
-+	 * The total message size for incoming packets.
-+	 *
-+	 * The protocol expects or 0 to not limit it.
-+	 *
-+	 */
-+	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
-+					g_param_spec_uint64 ("max-total-message-size",
-+					                     "Max total message size",
-+					                     "Max total message size ",
-+					                     0,
-+					                     G_MAXUINT64,
-+					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+					                     G_PARAM_READWRITE |
-+					                     G_PARAM_CONSTRUCT |
-+					                     G_PARAM_STATIC_STRINGS));
- 	/**
- 	 * SoupWebsocketConnection::message:
- 	 * @self: the WebSocket
-@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
- 	}
- }
- 
-+/**
-+ * soup_websocket_connection_get_max_total_message_size:
-+ * @self: the WebSocket
-+ *
-+ * Gets the maximum total message size allowed for packets.
-+ *
-+ * Returns: the maximum total message size.
-+ *
-+ */
-+guint64
-+soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
-+{
-+   SoupWebsocketConnectionPrivate *pv;
-+
-+   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
-+   pv = self->pv;
-+
-+   return pv->max_total_message_size;
-+}
-+
-+/**
-+ * soup_websocket_connection_set_max_total_message_size:
-+ * @self: the WebSocket
-+ * @max_total_message_size: the maximum total message size
-+ *
-+ * Sets the maximum total message size allowed for packets.
-+ *
-+ * It does not limit the outgoing packet size.
-+ *
-+ */
-+void
-+soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
-+                                                      guint64                  max_total_message_size)
-+{
-+   SoupWebsocketConnectionPrivate *pv;
-+
-+   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
-+   pv = self->pv;
-+
-+   if (pv->max_total_message_size != max_total_message_size) {
-+       pv->max_total_message_size = max_total_message_size;
-+       g_object_notify (G_OBJECT (self), "max-total-message-size");
-+   }
-+}
-+
- /**
-  * soup_websocket_connection_get_keepalive_interval:
-  * @self: the WebSocket
-diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocket-connection.h
-index f82d723..d2a60e9 100644
---- a/libsoup/soup-websocket-connection.h
-+++ b/libsoup/soup-websocket-connection.h
-@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
- void                soup_websocket_connection_set_keepalive_interval (SoupWebsocketConnection *self,
-                                                                       guint                    interval);
- 
-+SOUP_AVAILABLE_IN_2_72
-+guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
-+
-+SOUP_AVAILABLE_IN_2_72
-+void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
-+                                                                             guint64                  max_total_message_size);
-+
- G_END_DECLS
- 
- #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
deleted file mode 100644
index f9c894aaec..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Feb 2026 17:19:51 +0800
-Subject: [PATCH] Set message size limit in SoupServer rather than 
- SoupWebsocketConnection
-
-We're not sure about the compatibility implications of having a default
-size limit for clients.
-
-Also not sure whether the server limit is actually set appropriately,
-but there is probably very little server usage of
-SoupWebsocketConnection in the wild, so it's not so likely to break
-things.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
-CVE: CVE-2025-32049
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-server.c               | 24 +++++++++++++++++++-----
- libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
- 2 files changed, 35 insertions(+), 12 deletions(-)
-
-diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
-index 63875f3..a3f8597 100644
---- a/libsoup/soup-server.c
-+++ b/libsoup/soup-server.c
-@@ -216,6 +216,16 @@ enum {
- 
- G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
- 
-+/* SoupWebsocketConnection by default limits only maximum packet size. But a
-+ * message may consist of multiple packets, so SoupServer additionally restricts
-+ * total message size to mitigate denial of service attacks on the server.
-+ * SoupWebsocketConnection does not do this by default because I don't know
-+ * whether that would or would not cause compatibility problems for websites.
-+ *
-+ * This size is in bytes and it is arbitrary.
-+ */
-+#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
-+
- static SoupClientContext *soup_client_context_ref (SoupClientContext *client);
- static void soup_client_context_unref (SoupClientContext *client);
- 
-@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gpointer user_data)
- 
- 	soup_client_context_ref (client);
- 	stream = soup_client_context_steal_connection (client);
--	conn = soup_websocket_connection_new_with_extensions (stream, uri,
--							      SOUP_WEBSOCKET_CONNECTION_SERVER,
--							      soup_message_headers_get_one (msg->request_headers, "Origin"),
--							      soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
--							      handler->websocket_extensions);
-+	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
-+						          "io-stream", stream,
-+						          "uri", uri,
-+						          "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
-+						          "origin", soup_message_headers_get_one (msg->request_headers, "Origin"),
-+						          "protocol", soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
-+						          "extensions", handler->websocket_extensions,
-+						          "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+                                 NULL));
- 	handler->websocket_extensions = NULL;
- 	g_object_unref (stream);
- 	soup_client_context_unref (client);
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index 3dad477..e7fa9b7 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
- };
- 
- #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
--#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
- #define READ_BUFFER_SIZE 1024
- #define MASK_LENGTH 4
- 
-@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
- 	/**
- 	 * SoupWebsocketConnection:max-incoming-payload-size:
- 	 *
--	 * The maximum payload size for incoming packets the protocol expects
--	 * or 0 to not limit it.
-+	 * The maximum payload size for incoming packets, or 0 to not limit it.
-+	 * Each message may consist of multiple packets, so also refer to
-+	 * [property@WebSocketConnection:max-total-message-size].
- 	 *
- 	 * Since: 2.56
- 	 */
-@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
- 	/**
- 	 * SoupWebsocketConnection:max-total-message-size:
- 	 *
--	 * The total message size for incoming packets.
-+	 * The maximum size for incoming messages.
-+	 * Set to a value to limit the total message size, or 0 to not
-+	 * limit it.
- 	 *
--	 * The protocol expects or 0 to not limit it.
-+	 * [method@Server.add_websocket_handler] will set this to a nonzero
-+	 * default value to mitigate denial of service attacks. Clients must
-+	 * choose their own default if they need to mitigate denial of service
-+	 * attacks. You also need to set your own default if creating your own
-+	 * server SoupWebsocketConnection without using SoupServer.
-+	 *
-+	 * Each message may consist of multiple packets, so also refer to
-+	 *[property@WebSocketConnection:max-incoming-payload-size].
- 	 *
- 	 */
- 	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
-@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
- 					                     "Max total message size ",
- 					                     0,
- 					                     G_MAXUINT64,
--					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
-+					                     0,
- 					                     G_PARAM_READWRITE |
- 					                     G_PARAM_CONSTRUCT |
- 					                     G_PARAM_STATIC_STRINGS));
-@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
- {
-    SoupWebsocketConnectionPrivate *pv;
- 
--   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
-+   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
-    pv = self->pv;
- 
-    return pv->max_total_message_size;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
deleted file mode 100644
index c032846ef0..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Mon, 28 Oct 2024 12:29:48 -0500
-Subject: [PATCH] Fix using int instead of size_t for strcspn return
-
-CVE: CVE-2025-32050
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 9707ca0..67905b2 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
- 		     const char *name,
- 		     const char *value)
- {
--	int len;
-+	gsize len;
- 
- 	g_string_append (string, name);
- 	g_string_append (string, "=\"");
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
deleted file mode 100644
index 34bc8113a4..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Sat, 16 Nov 2024 12:07:30 -0600
-Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
-
-Co-Author: Ar Jun <pkillarjun@protonmail.com>
-
-CVE: CVE-2025-32052
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-content-sniffer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 9554636..eac9e7b 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
- 			guint index_pattern = 0;
- 			gboolean skip_row = FALSE;
- 
--			while ((index_stream < resource_length) &&
-+			while ((index_stream < resource_length - 1) &&
- 			       (index_pattern <= type_row->pattern_length)) {
- 				/* Skip insignificant white space ("WS" in the spec) */
- 				if (type_row->pattern[index_pattern] == ' ') {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
deleted file mode 100644
index 0d829d6200..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 12 May 2025 13:58:42 +0800
-Subject: [PATCH] Fix heap buffer overflow in
- soup-content-sniffer.c:sniff_feed_or_html()
-
-CVE: CVE-2025-32053
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-content-sniffer.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 967ec61..5f2896e 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
- 	       (resource[*pos] == '\x0D')) {
- 		*pos = *pos + 1;
- 
--		if (*pos > resource_length)
-+		if (*pos >= resource_length)
- 			return TRUE;
- 	}
- 
-@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- 		do {
- 			pos++;
- 
--			if (pos > resource_length)
-+			if ((pos + 1) > resource_length)
- 				goto text_html;
- 		} while (resource[pos] != '>');
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
deleted file mode 100644
index c33ebf8056..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Wed, 12 Feb 2025 11:30:02 -0600
-Subject: [PATCH] headers: Handle parsing only newlines
-
-Closes #404
-Closes #407
-
-CVE: CVE-2025-32906
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c      |  4 ++--
- tests/header-parsing-test.c | 11 +++++++++++
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index e5d3c03..87bb3dc 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
- 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
- 	 * received where a Request-Line is expected."
- 	 */
--	while ((*str == '\r' || *str == '\n') && len > 0) {
-+	while (len > 0 && (*str == '\r' || *str == '\n')) {
- 		str++;
- 		len--;
- 	}
-@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
- 	 * after a response, which we then see prepended to the next
- 	 * response on that connection.
- 	 */
--	while ((*str == '\r' || *str == '\n') && len > 0) {
-+	while (len > 0 && (*str == '\r' || *str == '\n')) {
- 		str++;
- 		len--;
- 	}
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index c1d3b33..b811115 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -6,6 +6,10 @@ typedef struct {
- 	const char *name, *value;
- } Header;
- 
-+static char only_newlines[] = {
-+        '\n', '\n', '\n', '\n'
-+};
-+
- static struct RequestTest {
- 	const char *description;
- 	const char *bugref;
-@@ -445,6 +449,13 @@ static struct RequestTest {
- 	  SOUP_STATUS_BAD_REQUEST,
-            NULL, NULL, -1,
- 	  { { NULL } }
-+	},
-+
-+	{ "Only newlines", NULL,
-+	  only_newlines, sizeof (only_newlines),
-+	  SOUP_STATUS_BAD_REQUEST,
-+           NULL, NULL, -1,
-+	  { { NULL } }
- 	}
- };
- static const int num_reqtests = G_N_ELEMENTS (reqtests);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
deleted file mode 100644
index 41dd3ff3f4..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Tue, 15 Apr 2025 12:17:39 +0200
-Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
-
-It had been skipping every second range, which generated an array
-of a lot of insane ranges, causing large memory usage by the server.
-
-Closes #428
-
-Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
-
-CVE: CVE-2025-32907
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
-
-Test part not applied since test codes use some functions not in this
-version
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c |   1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 78b2455..00b9763 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
- 			if (cur->start <= prev->end) {
- 				prev->end = MAX (prev->end, cur->end);
- 				g_array_remove_index (array, i);
-+				i--;
- 			}
- 		}
- 	}
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
deleted file mode 100644
index 2f5366348d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e6e088e62c10ab91fa2f2ad5c122332aa7cde97c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 12 May 2025 16:55:37 +0800
-Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than
- 4 bytes
-
-CVE: CVE-2025-32909
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-content-sniffer.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index eac9e7b..73d2245 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuffer *buffer)
- {
- 	const char *resource = (const char *)buffer->data;
- 	guint resource_length = MIN (512, buffer->length);
--	guint32 box_size = *((guint32*)resource);
-+	guint32 box_size;
- 	guint i;
- 
-+	if (resource_length < sizeof (guint32))
-+		return FALSE;
-+
-+	box_size = *((guint32*)resource);
-+
- #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
- 	box_size = ((box_size >> 24) |
- 		    ((box_size << 8) & 0x00FF0000) |
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
deleted file mode 100644
index c1dc6860f2..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 12 May 2025 17:02:55 +0800
-Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
- header
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth-digest.c |  3 +++
- 1 files changed, 3 insertions(+)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index e8ba990..0ab3499 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
- 	guint qop_options;
- 	gboolean ok = TRUE;
- 
-+	 if (!soup_auth_get_realm (auth))
-+		return FALSE;
-+
- 	g_free (priv->domain);
- 	g_free (priv->nonce);
- 	g_free (priv->opaque);
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
deleted file mode 100644
index 019a35e3be..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 13:19:38 +0800
-Subject: [PATCH] auth-digest: Handle missing nonce
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
- 1 files changed, 28 insertions(+), 10 deletions(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 0ab3499..10a8591 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
- 	return g_string_free (out, FALSE);
- }
- 
-+static gboolean
-+validate_params (SoupAuthDigest *auth_digest)
-+{
-+	SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
-+
-+	if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
-+		if (!priv->nonce)
-+			return FALSE;
-+	}
-+
-+	return TRUE;
-+}
-+
- static gboolean
- soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
- 			 GHashTable *auth_params)
-@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
- 	if (priv->algorithm == -1)
- 		ok = FALSE;
- 
--	stale = g_hash_table_lookup (auth_params, "stale");
--	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
--		recompute_hex_a1 (priv);
--	else {
--		g_free (priv->user);
--		priv->user = NULL;
--		g_free (priv->cnonce);
--		priv->cnonce = NULL;
--		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
--		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
--        }
-+	if (!validate_params (auth_digest))
-+		ok = FALSE;
-+
-+	if (ok) {
-+		stale = g_hash_table_lookup (auth_params, "stale");
-+		if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
-+			recompute_hex_a1 (priv);
-+		else {
-+			g_free (priv->user);
-+			priv->user = NULL;
-+			g_free (priv->cnonce);
-+			priv->cnonce = NULL;
-+			memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
-+			memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
-+		}
-+	}
- 
- 	return ok;
- }
-@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
- 	if (qop) {
- 		char tmp[9];
- 
-+		g_assert (cnonce);
-+
- 		g_snprintf (tmp, 9, "%.8x", nc);
- 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
- 		g_checksum_update (checksum, (guchar *)":", 1);
-@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
- 	g_return_val_if_fail (uri != NULL, NULL);
- 	url = soup_uri_to_string (uri, TRUE);
- 
-+	g_assert (priv->nonce);
-+	g_assert (!priv->qop || priv->cnonce);
-+
- 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
- 					   priv->qop, priv->nonce,
- 					   priv->cnonce, priv->nc,
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
deleted file mode 100644
index bdf4d64ca3..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 13:21:43 +0800
-Subject: [PATCH] auth-digest: Fix leak
-
-CVE: CVE-2025-32910
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth-digest.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 10a8591..6d965d2 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
- 	g_free (priv->nonce);
- 	g_free (priv->domain);
- 	g_free (priv->cnonce);
-+	g_free (priv->opaque);
- 
- 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
- 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
deleted file mode 100644
index b3ce9d8bc3..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 13:25:32 +0800
-Subject: [PATCH] auth-digest: Handle missing nonce
-
-CVE: CVE-2025-32912
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434
-https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth-digest.c | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index 6d965d2..f1621ec 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
- 	guint qop_options;
- 	gboolean ok = TRUE;
- 
--	 if (!soup_auth_get_realm (auth))
-+	if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
- 		return FALSE;
- 
- 	g_free (priv->domain);
-
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
deleted file mode 100644
index 9f3bb21a25..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 12 May 2025 16:17:20 +0800
-Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
- libsoup through function "soup_multipart_new_from_message" in
- soup-multipart.c leads to crash or exit of process"
-
-CVE: CVE-2025-32914
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
-
-Test code are not added since some functions not aligned with version
-2.74.3
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-multipart.c |  2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index a7e550f..dd93973 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
- 			return NULL;
- 		}
- 
--		split = strstr (start, "\r\n\r\n");
-+		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
- 		if (!split || split > end) {
- 			soup_multipart_free (multipart);
- 			soup_buffer_free (flattened);
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
deleted file mode 100644
index 874f62e7ad..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 16 May 2025 14:16:10 +0800
-Subject: [PATCH] auth-digest: fix crash in
- soup_auth_digest_get_protection_space()
-
-We need to validate the Domain parameter in the WWW-Authenticate header.
-
-Unfortunately this crash only occurs when listening on default ports 80
-and 443, so there's no good way to test for this. The test would require
-running as root.
-
-Fixes #440
-
-CVE: CVE-2025-4476
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth-digest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
-index f1621ec..a2dc560 100644
---- a/libsoup/soup-auth-digest.c
-+++ b/libsoup/soup-auth-digest.c
-@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
- 			uri = soup_uri_new (d);
- 			if (uri && uri->scheme == source_uri->scheme &&
- 			    uri->port == source_uri->port &&
--			    !strcmp (uri->host, source_uri->host))
-+			    !g_strcmp0 (uri->host, source_uri->host))
- 				dir = g_strdup (uri->path);
- 			else
- 				dir = NULL;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
deleted file mode 100644
index c970661694..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Thu, 26 Dec 2024 18:31:42 -0600
-Subject: [PATCH] soup_header_parse_quality_list: Fix leak
-
-When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
-
-CVE: CVE-2025-46420
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e]
-
- Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-headers.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
-index 87bb3dc..9707ca0 100644
---- a/libsoup/soup-headers.c
-+++ b/libsoup/soup-headers.c
-@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
- 	GSList *unsorted;
- 	QualityItem *array;
- 	GSList *sorted, *iter;
--	char *item, *semi;
-+	char *semi;
- 	const char *param, *equal, *value;
- 	double qval;
- 	int n;
-@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
- 	unsorted = soup_header_parse_list (header);
- 	array = g_new0 (QualityItem, g_slist_length (unsorted));
- 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
--		item = iter->data;
- 		qval = 1.0;
--		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
-+		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
- 			param = skip_lws (semi + 1);
- 			if (*param != 'q')
- 				continue;
-@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
- 		if (qval == 0.0) {
- 			if (unacceptable) {
- 				*unacceptable = g_slist_prepend (*unacceptable,
--								 item);
-+								 g_steal_pointer (&iter->data));
- 			}
- 		} else {
--			array[n].item = item;
-+			array[n].item = g_steal_pointer (&iter->data);
- 			array[n].qval = qval;
- 			n++;
- 		}
- 	}
--	g_slist_free (unsorted);
-+	g_slist_free_full (unsorted, g_free);
- 
- 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
- 	sorted = NULL;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
deleted file mode 100644
index 3318093400..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Wed, 5 Feb 2025 16:18:10 -0600
-Subject: [PATCH] session: Strip authentication credentails on
- cross-origin redirect
-
-This should match the behavior of Firefox and Safari but not of Chromium.
-
-CVE: CVE-2025-46421
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
-
-Test code not added since it included some headers not in version 2.74.3
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-session.c |  8 ++++-
- 2 files changed, 85 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
-index 83421ef..8d6ac61 100644
---- a/libsoup/soup-session.c
-+++ b/libsoup/soup-session.c
-@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
- 						   SOUP_ENCODING_NONE);
- 	}
- 
-+	/* Strip all credentials on cross-origin redirect. */
-+	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
-+		soup_message_headers_remove (msg->request_headers, "Authorization");
-+		soup_message_set_auth (msg, NULL);
-+	}
-+
- 	soup_message_set_uri (msg, new_uri);
- 	soup_uri_free (new_uri);
- 
- 	soup_session_requeue_message (session, msg);
- 	return TRUE;
--}
-+}
- 
- static void
- redirect_handler (SoupMessage *msg, gpointer user_data)
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
deleted file mode 100644
index c9fbdbacc8..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 8 Jul 2025 14:58:30 +0800
-Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
-
-Reject date/time when it does not represent a valid value.
-
-Closes #448
-
-CVE: CVE-2025-4945
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-date.c  | 21 +++++++++++++++------
- tests/cookies-test.c | 10 ++++++++++
- 2 files changed, 25 insertions(+), 6 deletions(-)
-
-diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
-index 9602d1f..4c114c1 100644
---- a/libsoup/soup-date.c
-+++ b/libsoup/soup-date.c
-@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_string)
- 	while (*end == ' ' || *end == '-')
- 		end++;
- 	*date_string = end;
--	return TRUE;
-+	return date->day >= 1 && date->day <= 31;
- }
- 
- static inline gboolean
-@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_string)
- 	while (*end == ' ' || *end == '-')
- 		end++;
- 	*date_string = end;
--	return TRUE;
-+	return date->year > 0 && date->year < 9999;
- }
- 
- static inline gboolean
-@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_string)
- 	while (*p == ' ')
- 		p++;
- 	*date_string = p;
--	return TRUE;
-+	return  date->hour >= 0 && date->hour < 24 && date->minute >= 0 && date->minute < 60 && date->second >= 0 && date->second < 60;
- }
- 
- static inline gboolean
-@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **date_string)
- 		gulong val;
- 		int sign = (**date_string == '+') ? -1 : 1;
- 		val = strtoul (*date_string + 1, (char **)date_string, 10);
-+		if (val > 9999)
-+			return FALSE;
- 		if (**date_string == ':')
--			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
-+		{
-+			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
-+			if (val > 99 || val2 > 99)
-+				return FALSE;
-+			val = 60 * val + val2;
-+		}
- 		else
- 			val =  60 * (val / 100) + (val % 100);
- 		date->offset = sign * val;
-@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
- 		if (!parse_month (date, &date_string) ||
- 		    !parse_day (date, &date_string) ||
- 		    !parse_time (date, &date_string) ||
--		    !parse_year (date, &date_string))
-+		    !parse_year (date, &date_string) ||
-+		    !g_date_valid_dmy(date->day, date->month, date->year))
- 			return FALSE;
- 
- 		/* There shouldn't be a timezone, but check anyway */
-@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
- 		if (!parse_day (date, &date_string) ||
- 		    !parse_month (date, &date_string) ||
- 		    !parse_year (date, &date_string) ||
--		    !parse_time (date, &date_string))
-+		    !parse_time (date, &date_string) ||
-+		    !g_date_valid_dmy(date->day, date->month, date->year))
- 			return FALSE;
- 
- 		/* This time there *should* be a timezone, but we
-diff --git a/tests/cookies-test.c b/tests/cookies-test.c
-index 2e2a54f..6035a86 100644
---- a/tests/cookies-test.c
-+++ b/tests/cookies-test.c
-@@ -413,6 +413,15 @@ do_remove_feature_test (void)
- 	soup_uri_free (uri);
- }
- 
-+static void
-+do_cookies_parsing_int32_overflow (void)
-+{
-+	SoupCookie *cookie = soup_cookie_parse ("Age=1;expires=3Mar9    999:9:9+ 999999999-age=main=gne=", NULL);
-+	g_assert_nonnull (cookie);
-+	g_assert_null (soup_cookie_get_expires (cookie));
-+	soup_cookie_free (cookie);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -434,6 +443,7 @@ main (int argc, char **argv)
- 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
- 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
- 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
-+	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
- 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
- 	g_test_add_func ("/cookies/remove-feature", do_remove_feature_test);
- 	g_test_add_func ("/cookies/secure-cookies", do_cookies_strict_secure_test);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
deleted file mode 100644
index b15b8c763d..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Thu, 15 May 2025 17:49:11 +0200
-Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
-
-It could happen that the boundary started at a place which resulted into
-a negative number, which in an unsigned integer is a very large value.
-Check the body size is not a negative value before setting it.
-
-Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
-
-Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
-
-CVE: CVE-2025-4948
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-multipart.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index dd93973..ce2fc10 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
- 		 */
- 		part_body = soup_buffer_new_subbuffer (flattened,
- 						       split - flattened->data,
--						       end - 2 - split);
-+						       end - 2 >= split ? end - 2 - split : 0);
- 		g_ptr_array_add (multipart->bodies, part_body);
- 
- 		start = end;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
deleted file mode 100644
index 7bc3e8da99..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Mon, 19 May 2025 17:48:27 +0200
-Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
- members
-
-The boundary could be at a place which, calculated, pointed
-before the beginning of the array. Check the bounds, to avoid
-read out of the array bounds.
-
-Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
-
-CVE: CVE-2025-4969
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-multipart.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
-index ce2fc10..a29cdf0 100644
---- a/libsoup/soup-multipart.c
-+++ b/libsoup/soup-multipart.c
-@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
- 			continue;
- 
- 		/* Check that it's at start of line */
--		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
-+		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
- 			continue;
- 
- 		/* Check for "--" or "\r\n" after boundary */
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
deleted file mode 100644
index a1a130ee3a..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From b4f1dcb89a552fc03bfd0e65830b4f76fdc4a232 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 21 Apr 2026 17:10:37 +0800
-Subject: [PATCH] Fix CVE-2026-1467
-
-CVE: CVE-2026-1467
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6dfe506618d2d5856618e5c0f85bd93386dc8012]
-
-The original backport patch targets libsoup3. This patch has been
-adapted accordingly for libsoup2, refer the openSUSE patch, see [1]
-
-[1] https://www.suse.com/security/cve/CVE-2026-1467.html
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-auth.c    |  2 +-
- libsoup/soup-message.c |  5 +++-
- libsoup/soup-uri.c     | 60 ++++++++++++++++++++++++++++++++++++++++++
- libsoup/soup-uri.h     |  2 ++
- 4 files changed, 67 insertions(+), 2 deletions(-)
-
-diff --git a/libsoup/soup-auth.c b/libsoup/soup-auth.c
-index 1896aab..e205fe3 100644
---- a/libsoup/soup-auth.c
-+++ b/libsoup/soup-auth.c
-@@ -535,7 +535,7 @@ GSList *
- soup_auth_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
- {
- 	g_return_val_if_fail (SOUP_IS_AUTH (auth), NULL);
--	g_return_val_if_fail (source_uri != NULL, NULL);
-+	g_return_val_if_fail (soup_uri_is_valid (source_uri), NULL);
- 
- 	return SOUP_AUTH_GET_CLASS (auth)->get_protection_space (auth, source_uri);
- }
-diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
-index da32b42..cc4f22b 100644
---- a/libsoup/soup-message.c
-+++ b/libsoup/soup-message.c
-@@ -1044,7 +1044,7 @@ soup_message_new (const char *method, const char *uri_string)
- 	uri = soup_uri_new (uri_string);
- 	if (!uri)
- 		return NULL;
--	if (!uri->host) {
-+	if (!soup_uri_is_valid (uri)) {
- 		soup_uri_free (uri);
- 		return NULL;
- 	}
-@@ -1066,6 +1066,8 @@ soup_message_new (const char *method, const char *uri_string)
- SoupMessage *
- soup_message_new_from_uri (const char *method, SoupURI *uri)
- {
-+	g_return_val_if_fail (soup_uri_is_valid (uri), NULL);
-+
- 	return g_object_new (SOUP_TYPE_MESSAGE,
- 			     SOUP_MESSAGE_METHOD, method,
- 			     SOUP_MESSAGE_URI, uri,
-@@ -1676,6 +1678,7 @@ soup_message_set_uri (SoupMessage *msg, SoupURI *uri)
- 	SoupMessagePrivate *priv;
- 
- 	g_return_if_fail (SOUP_IS_MESSAGE (msg));
-+	g_return_if_fail (soup_uri_is_valid (uri));
- 	priv = soup_message_get_instance_private (msg);
- 
- 	if (priv->uri)
-diff --git a/libsoup/soup-uri.c b/libsoup/soup-uri.c
-index bdb7a17..d781ff1 100644
---- a/libsoup/soup-uri.c
-+++ b/libsoup/soup-uri.c
-@@ -1342,6 +1342,66 @@ soup_uri_host_equal (gconstpointer v1, gconstpointer v2)
- 	return g_ascii_strcasecmp (one->host, two->host) == 0;
- }
- 
-+static gboolean
-+is_valid_character_for_host (char c)
-+{
-+        static const char forbidden_chars[] = { '\t', '\n', '\r', ' ', '#', '/', ':', '<', '>', '?', '@', '[', '\\', ']', '^', '|' };
-+        int i;
-+
-+        for (i = 0; i < G_N_ELEMENTS (forbidden_chars); ++i) {
-+                if (c == forbidden_chars[i])
-+                        return FALSE;
-+        }
-+
-+        return TRUE;
-+}
-+
-+static gboolean
-+is_host_valid (const char* host)
-+{
-+        int i;
-+        gboolean is_valid;
-+        char *ascii_host = NULL;
-+
-+        if (!host || !host[0])
-+                return FALSE;
-+
-+        if (g_hostname_is_non_ascii (host)) {
-+                ascii_host = g_hostname_to_ascii (host);
-+                if (!ascii_host)
-+                  return FALSE;
-+
-+                host = ascii_host;
-+        }
-+
-+        if ((g_ascii_isdigit (host[0]) || strchr (host, ':')) && g_hostname_is_ip_address (host)) {
-+                g_free (ascii_host);
-+                return TRUE;
-+        }
-+        is_valid = TRUE;
-+        for (i = 0; host[i] && is_valid; i++)
-+                is_valid = is_valid_character_for_host (host[i]);
-+
-+        g_free (ascii_host);
-+
-+        return is_valid;
-+}
-+
-+gboolean
-+soup_uri_is_valid (SoupURI *uri)
-+{
-+        if (!uri)
-+                return FALSE;
-+
-+        if (!is_host_valid (soup_uri_get_host (uri)))
-+                return FALSE;
-+
-+        /* FIXME: validate other URI components? */
-+
-+        return TRUE;
-+}
-+
-+
- gboolean
- soup_uri_is_http (SoupURI *uri, char **aliases)
- {
-diff --git a/libsoup/soup-uri.h b/libsoup/soup-uri.h
-index 8015e4f..64099c3 100644
---- a/libsoup/soup-uri.h
-+++ b/libsoup/soup-uri.h
-@@ -133,6 +133,8 @@ guint       soup_uri_host_hash             (gconstpointer key);
- SOUP_AVAILABLE_IN_2_28
- gboolean    soup_uri_host_equal            (gconstpointer v1,
- 					    gconstpointer v2);
-+SOUP_AVAILABLE_IN_2_68
-+gboolean     soup_uri_is_valid             (SoupURI       *uri);
- 
- #define   SOUP_URI_IS_VALID(uri)       ((uri) && (uri)->scheme && (uri)->path)
- #define   SOUP_URI_VALID_FOR_HTTP(uri) ((uri) && ((uri)->scheme == SOUP_URI_SCHEME_HTTP || (uri)->scheme == SOUP_URI_SCHEME_HTTPS) && (uri)->host && (uri)->path)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
deleted file mode 100644
index c6b813a98f..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 285faea567e1e2a95226201175dbf745a64a2439 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 20 Mar 2026 15:04:22 +0800
-Subject: [PATCH 4/4] Also remove Proxy-Authorization header on cross origin
- redirect
-
-Closes #489
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/98c1285d9d78662c38bf14b4a128af01ccfdb446]
-CVE: CVE-2026-1539
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-session.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
-index cc0d04c..0361856 100644
---- a/libsoup/soup-session.c
-+++ b/libsoup/soup-session.c
-@@ -1190,6 +1190,7 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
- 	/* Strip all credentials on cross-origin redirect. */
- 	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
- 		soup_message_headers_remove (msg->request_headers, "Authorization");
-+		soup_message_headers_remove (msg->request_headers, "Proxy-Authorization");
- 		soup_message_set_auth (msg, NULL);
- 	}
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
deleted file mode 100644
index a5547132a2..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 0fca37e0fce479284e62091ffb9b7d6caff1c7e4 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Thu, 29 Jan 2026 16:43:28 +0100
-Subject: [PATCH] server: close the connection after responsing a request
- containing Content-Length and Transfer-Encoding
-
-Closes #475
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6224df5a471e9040a99dd3dc2e91817a701b1bf6]
-CVE: CVE-2026-1760
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c   | 86 +++++++++++++++-----------------
- libsoup/soup-message-server-io.c |  8 +++
- 2 files changed, 49 insertions(+), 45 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 535cf14..06d9600 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -666,38 +666,13 @@ clear_special_headers (SoupMessageHeaders *hdrs)
- static void
- transfer_encoding_setter (SoupMessageHeaders *hdrs, const char *value)
- {
--	if (value) {
--		/* "identity" is a wrong value according to RFC errata 408,
--		 * and RFC 7230 does not list it as valid transfer-coding.
--		 * Nevertheless, the obsolete RFC 2616 stated "identity"
--		 * as valid, so we can't handle it as unrecognized here
--		 * for compatibility reasons.
--		 */
--		if (g_ascii_strcasecmp (value, "chunked") == 0)
--			hdrs->encoding = SOUP_ENCODING_CHUNKED;
--		else if (g_ascii_strcasecmp (value, "identity") != 0)
--			hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
--	} else
--		hdrs->encoding = -1;
-+	hdrs->encoding = -1;
- }
- 
- static void
- content_length_setter (SoupMessageHeaders *hdrs, const char *value)
- {
--	/* Transfer-Encoding trumps Content-Length */
--	if (hdrs->encoding == SOUP_ENCODING_CHUNKED)
--		return;
--
--	if (value) {
--		char *end;
--
--		hdrs->content_length = g_ascii_strtoull (value, &end, 10);
--		if (*end)
--			hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
--		else
--			hdrs->encoding = SOUP_ENCODING_CONTENT_LENGTH;
--	} else
--		hdrs->encoding = -1;
-+	hdrs->encoding = -1;
- }
- 
- /**
-@@ -730,29 +705,50 @@ SoupEncoding
- soup_message_headers_get_encoding (SoupMessageHeaders *hdrs)
- {
- 	const char *header;
-+	const char *content_length;
-+	const char *transfer_encoding;
- 
- 	if (hdrs->encoding != -1)
- 		return hdrs->encoding;
- 
--	/* If Transfer-Encoding was set, hdrs->encoding would already
--	 * be set. So we don't need to check that possibility.
--	 */
--	header = soup_message_headers_get_one (hdrs, "Content-Length");
--	if (header) {
--		content_length_setter (hdrs, header);
--		if (hdrs->encoding != -1)
--			return hdrs->encoding;
--	}
-+			/* Transfer-Encoding is checked first because it overrides the Content-Length */
-+			transfer_encoding = soup_message_headers_get_one (hdrs, "Transfer-Encoding");
-+			if (transfer_encoding) {
-+					/* "identity" is a wrong value according to RFC errata 408,
-+					 * and RFC 7230 does not list it as valid transfer-coding.
-+					 * Nevertheless, the obsolete RFC 2616 stated "identity"
-+					 * as valid, so we can't handle it as unrecognized here
-+					 * for compatibility reasons.
-+					 */
-+					if (g_ascii_strcasecmp (transfer_encoding, "chunked") == 0)
-+							hdrs->encoding = SOUP_ENCODING_CHUNKED;
-+					else if (g_ascii_strcasecmp (transfer_encoding, "identity") != 0)
-+							hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
-+			} else {
-+					content_length = soup_message_headers_get_one (hdrs, "Content-Length");
-+					if (content_length) {
-+							char *end;
-+
-+							hdrs->content_length = g_ascii_strtoull (content_length, &end, 10);
-+							if (*end)
-+									hdrs->encoding = SOUP_ENCODING_UNRECOGNIZED;
-+							else
-+									hdrs->encoding = SOUP_ENCODING_CONTENT_LENGTH;
-+					}
-+			}
-+
-+			if (hdrs->encoding == -1) {
-+					/* Per RFC 2616 4.4, a response body that doesn't indicate its
-+					 * encoding otherwise is terminated by connection close, and a
-+					 * request that doesn't indicate otherwise has no body. Note
-+					 * that SoupMessage calls soup_message_headers_set_encoding()
-+					 * to override the response body default for our own
-+					 * server-side messages.
-+					 */
-+					hdrs->encoding = (hdrs->type == SOUP_MESSAGE_HEADERS_RESPONSE) ?
-+							SOUP_ENCODING_EOF : SOUP_ENCODING_NONE;
-+			}
- 
--	/* Per RFC 2616 4.4, a response body that doesn't indicate its
--	 * encoding otherwise is terminated by connection close, and a
--	 * request that doesn't indicate otherwise has no body. Note
--	 * that SoupMessage calls soup_message_headers_set_encoding()
--	 * to override the response body default for our own
--	 * server-side messages.
--	 */
--	hdrs->encoding = (hdrs->type == SOUP_MESSAGE_HEADERS_RESPONSE) ?
--		SOUP_ENCODING_EOF : SOUP_ENCODING_NONE;
- 	return hdrs->encoding;
- }
- 
-diff --git a/libsoup/soup-message-server-io.c b/libsoup/soup-message-server-io.c
-index 71e943b..df5eafc 100644
---- a/libsoup/soup-message-server-io.c
-+++ b/libsoup/soup-message-server-io.c
-@@ -80,6 +80,14 @@ parse_request_headers (SoupMessage *msg, char *headers, guint headers_len,
- 			return SOUP_STATUS_BAD_REQUEST;
- 	}
- 
-+	/* A server MAY reject a request that contains both Content-Length and
-+	 * Transfer-Encoding or process such a request in accordance with the
-+	 * Transfer-Encoding alone. Regardless, the server MUST close the connection
-+	 * after responding to such a request to avoid the potential attacks
-+	 */
-+	if (*encoding == SOUP_ENCODING_CHUNKED && soup_message_headers_get_one (msg->request_headers, "Content-Length"))
-+			soup_message_headers_replace (msg->request_headers, "Connection", "close");
-+
- 	/* Generate correct context for request */
- 	req_host = soup_message_headers_get_one (msg->request_headers, "Host");
- 	if (req_host && strchr (req_host, '/')) {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
deleted file mode 100644
index 573e3e1dd0..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 07757b7feacfc660c6c463ff2b773c13bc42d2c9 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 19 Mar 2026 17:21:32 +0800
-Subject: [PATCH 3/4] multipart: check length of bytes read
- soup_filter_input_stream_read_until()
-
-We do make sure the read length is smaller than the buffer length when
-the boundary is not found, but we should do the same when the boundary
-is found.
-
-Spotted in #YWH-PGM9867-149
-Closes #493
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]
-CVE: CVE-2026-1761
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-filter-input-stream.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-input-stream.c
-index 2c30bf9..c34510b 100644
---- a/libsoup/soup-filter-input-stream.c
-+++ b/libsoup/soup-filter-input-stream.c
-@@ -272,6 +272,6 @@ soup_filter_input_stream_read_until (SoupFilterInputStream  *fstream,
- 	if (eof && !*got_boundary)
- 		read_length = MIN (fstream->priv->buf->len, length);
- 	else
--		read_length = p - buf;
-+		read_length = MIN ((gsize)(p - buf), length);
- 	return read_from_buf (fstream, buffer, read_length);
- }
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
deleted file mode 100644
index 5f445f7354..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From f9c933e258e9ef2f221cca6395f8092a1c4b93dd Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 19 Mar 2026 17:10:36 +0800
-Subject: [PATCH 2/4] Fix CVE-2026-1801
-
-This patch merges 3 upstream patches
-
-Chery-pick the first two patches to make the context is the same as the
-third patch that fix CVE-2026-1801
-
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e32b5e123aa1689505472bdbfcbd897eac41977,
-https://gitlab.gnome.org/GNOME/libsoup/-/commit/8a2e15c88512ae4517d2c2c887d39299725b22da,
-https://gitlab.gnome.org/GNOME/libsoup/-/commit/b9a1c0663ff8ab6e79715db4b35b54f560416ddd]
-CVE: CVE-2026-1801
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-body-input-stream.c | 66 ++++++++++++++++++++------------
- 1 file changed, 41 insertions(+), 25 deletions(-)
-
-diff --git a/libsoup/soup-body-input-stream.c b/libsoup/soup-body-input-stream.c
-index 6b95884..25d9312 100644
---- a/libsoup/soup-body-input-stream.c
-+++ b/libsoup/soup-body-input-stream.c
-@@ -159,15 +159,18 @@ soup_body_input_stream_read_chunked (SoupBodyInputStream  *bistream,
- again:
- 	switch (bistream->priv->chunked_state) {
- 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_SIZE:
--		nread = soup_filter_input_stream_read_line (
--			fstream, metabuf, sizeof (metabuf), blocking,
--			&got_line, cancellable, error);
--		if (nread <= 0)
-+		nread = soup_filter_input_stream_read_until (
-+				fstream, metabuf, sizeof (metabuf),
-+				"\r\n", 2, blocking, TRUE,
-+				&got_line, cancellable, error);
-+		if (nread < 0)
- 			return nread;
--		if (!got_line) {
--			g_set_error_literal (error, G_IO_ERROR,
--					     G_IO_ERROR_PARTIAL_INPUT,
--					     _("Connection terminated unexpectedly"));
-+		if (nread == 0 || !got_line) {
-+			if (error && *error == NULL) {
-+				g_set_error_literal (error, G_IO_ERROR,
-+									G_IO_ERROR_PARTIAL_INPUT,
-+									("Connection terminated unexpectedly"));
-+			}
- 			return -1;
- 		}
- 
-@@ -180,9 +183,9 @@ again:
- 
- 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK:
- 		nread = soup_body_input_stream_read_raw (
--			bistream, buffer,
--			MIN (count, bistream->priv->read_length),
--			blocking, cancellable, error);
-+				bistream, buffer,
-+				MIN (count, bistream->priv->read_length),
-+				blocking, cancellable, error);
- 		if (nread > 0) {
- 			bistream->priv->read_length -= nread;
- 			if (bistream->priv->read_length == 0)
-@@ -191,16 +194,19 @@ again:
- 		return nread;
- 
- 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_END:
--		nread = soup_filter_input_stream_read_line (
--			SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
--			metabuf, sizeof (metabuf), blocking,
--			&got_line, cancellable, error);
--		if (nread <= 0)
-+		nread = soup_filter_input_stream_read_until (
-+				SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
-+				metabuf, sizeof (metabuf),
-+				"\r\n", 2, blocking, TRUE,
-+				&got_line, cancellable, error);
-+		if (nread < 0)
- 			return nread;
--		if (!got_line) {
--			g_set_error_literal (error, G_IO_ERROR,
--					     G_IO_ERROR_PARTIAL_INPUT,
--					     _("Connection terminated unexpectedly"));
-+		if (nread == 0 || !got_line) {
-+			if (error && *error == NULL) {
-+				g_set_error_literal (error, G_IO_ERROR,
-+				G_IO_ERROR_PARTIAL_INPUT,
-+				_("Connection terminated unexpectedly"));
-+			}
- 			return -1;
- 		}
- 
-@@ -208,13 +214,23 @@ again:
- 		break;
- 
- 	case SOUP_BODY_INPUT_STREAM_STATE_TRAILERS:
--		nread = soup_filter_input_stream_read_line (
--			fstream, buffer, count, blocking,
--			&got_line, cancellable, error);
--		if (nread <= 0)
-+		nread = soup_filter_input_stream_read_until (
-+				fstream, metabuf, sizeof (metabuf),
-+				"\r\n", 2, blocking, TRUE,
-+				&got_line, cancellable, error);
-+		if (nread < 0)
- 			return nread;
- 
--		if (strncmp (buffer, "\r\n", nread) || strncmp (buffer, "\n", nread)) {
-+		if (nread == 0) {
-+			if (error && *error == NULL) {
-+				g_set_error_literal (error, G_IO_ERROR,
-+				G_IO_ERROR_PARTIAL_INPUT,
-+				_("Connection terminated unexpectedly"));
-+			}
-+			return -1;
-+		}
-+
-+		if (nread == 2 && strncmp (metabuf, "\r\n", nread) == 0) {
- 			bistream->priv->chunked_state = SOUP_BODY_INPUT_STREAM_STATE_DONE;
- 			bistream->priv->eof = TRUE;
- 		}
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
deleted file mode 100644
index 814672caca..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5c4e65fd99ff4e3ae76c7985c5e160bb07ea0f92 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 25 Mar 2026 11:24:36 +0800
-Subject: [PATCH] sniffer: Handle potential underflow
-
-Closes #498
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/b91bbd7d7888c85b17a8b33173caa806dff51681]
-CVE: CVE-2026-2369
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-content-sniffer.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
-index 3edc568..b091bca 100644
---- a/libsoup/soup-content-sniffer.c
-+++ b/libsoup/soup-content-sniffer.c
-@@ -504,6 +504,10 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
- 		if (!sniff_scriptable && type_row->scriptable)
- 			continue;
- 
-+		/* Ensure we have data to sniff - prevents underflow in resource_length - 1 */
-+		if (resource_length == 0)
-+			continue;
-+
- 		if (type_row->has_ws) {
- 			guint index_stream = 0;
- 			guint index_pattern = 0;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
deleted file mode 100644
index 99d42acb1e..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 7bb3115a296154e3f465900ea5c984a493385a7f Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Fri, 19 Dec 2025 23:49:05 +0000
-Subject: [PATCH] Fix CVE-2026-2443
-
-Upstream-Status: Backport [
-c1796442 soup-message-headers: Rework Range response statuses to match Apache
-191ef313 soup-message-headers: Fix rejection of Range headers with trailing garbage
-be677bea soup-message-headers: Fix parsing of invalid Range suffix lengths
-2bbfdfe8 soup-message-headers: Reject ranges where end is before start
-739bf7cb soup-message-headers: Reject invalid Range ends longer than the content
-]
-CVE: CVE-2026-2443
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c | 62 ++++++++++++++++++++++++----------
- 1 file changed, 44 insertions(+), 18 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index bb20bbb..535cf14 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -943,10 +943,16 @@ sort_ranges (gconstpointer a, gconstpointer b)
- }
- 
- /* like soup_message_headers_get_ranges(), except it returns:
-- *   SOUP_STATUS_OK if there is no Range or it should be ignored.
-- *   SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
-- *   SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
-- *     is %TRUE and the request is not satisfiable given @total_length.
-+ *  - SOUP_STATUS_OK if there is no Range or it should be ignored due to being
-+ *    entirely invalid.
-+ *  - SOUP_STATUS_PARTIAL_CONTENT if there is at least one satisfiable range.
-+ *  - SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE if @check_satisfiable
-+ *     is %TRUE, the Range is valid, but no part of the request is satisfiable
-+ *     given @total_length.
-+ *
-+ * @ranges and @length are only set if SOUP_STATUS_PARTIAL_CONTENT is returned.
-+ *
-+ * See https://httpwg.org/specs/rfc9110.html#field.range
-  */
- guint
- soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
-@@ -960,22 +966,28 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
- 	GArray *array;
- 	char *spec, *end;
- 	guint status = SOUP_STATUS_OK;
-+	gboolean is_all_valid = TRUE;
- 
- 	if (!range || strncmp (range, "bytes", 5) != 0)
--		return status;
-+		return SOUP_STATUS_OK;  /* invalid header or unknown range unit */
- 
- 	range += 5;
- 	while (g_ascii_isspace (*range))
- 		range++;
- 	if (*range++ != '=')
--		return status;
-+		return SOUP_STATUS_OK;  /* invalid header */
- 	while (g_ascii_isspace (*range))
- 		range++;
- 
- 	range_list = soup_header_parse_list (range);
- 	if (!range_list)
--		return status;
-+		return SOUP_STATUS_OK;  /* invalid list */
- 
-+	/* Loop through the ranges and modify the status accordingly. Default to
-+	 * status 200 (OK, ignoring the ranges). Switch to status 206 (Partial
-+	 * Content) if there is at least one partially valid range. Switch to
-+	 * status 416 (Range Not Satisfiable) if there are no partially valid
-+	 * ranges at all. */
- 	array = g_array_new (FALSE, FALSE, sizeof (SoupRange));
- 	for (r = range_list; r; r = r->next) {
- 		SoupRange cur;
-@@ -988,30 +1000,44 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
- 			cur.start = g_ascii_strtoull (spec, &end, 10);
- 			if (*end == '-')
- 				end++;
--			if (*end) {
-+			if (*end)
- 				cur.end = g_ascii_strtoull (end, &end, 10);
--				if (cur.end < cur.start) {
--					status = SOUP_STATUS_OK;
--					break;
--				}
--			} else
-+			else
- 				cur.end = total_length - 1;
- 		}
-+
- 		if (*end) {
--			status = SOUP_STATUS_OK;
--			break;
--		} else if (check_satisfiable && cur.start >= total_length) {
--			if (status == SOUP_STATUS_OK)
--				status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
-+			/* Junk after the range */
-+			is_all_valid = FALSE;
-+			continue;
-+		}
-+
-+		if (cur.end < cur.start) {
-+			is_all_valid = FALSE;
-+			continue;
-+		}
-+
-+		g_assert (cur.start >= 0);
-+		if (cur.end >= total_length)
-+			cur.end = total_length - 1;
-+
-+		if (cur.start >= total_length) {
-+			/* Range is valid, but unsatisfiable */
- 			continue;
- 		}
- 
-+		/* We have at least one (at least partially) satisfiable range */
- 		g_array_append_val (array, cur);
- 		status = SOUP_STATUS_PARTIAL_CONTENT;
- 	}
- 	soup_header_free_list (range_list);
- 
- 	if (status != SOUP_STATUS_PARTIAL_CONTENT) {
-+		g_assert (status == SOUP_STATUS_OK);
-+
-+		if (is_all_valid && check_satisfiable)
-+			status = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
-+
- 		g_array_free (array, TRUE);
- 		return status;
- 	}
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
deleted file mode 100644
index e588e60cd5..0000000000
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ /dev/null
@@ -1,97 +0,0 @@
-SUMMARY = "An HTTP library implementation in C"
-DESCRIPTION = "libsoup is an HTTP client/server library for GNOME. It uses GObjects \
-and the glib main loop, to integrate well with GNOME applications."
-HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/gnome/libs"
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch \
-           file://0001-Fix-possibly-uninitialized-warnings.patch \
-           file://0001-Remove-http-and-https-aliases-support-test.patch \
-           file://CVE-2024-52532-1.patch \
-           file://CVE-2024-52532-2.patch \
-           file://CVE-2024-52532-3.patch \
-           file://CVE-2025-32053.patch \
-           file://CVE-2025-2784.patch \
-           file://CVE-2024-52530.patch \
-           file://CVE-2025-32906.patch \
-           file://CVE-2025-32914.patch \
-           file://CVE-2025-46420.patch \
-           file://CVE-2025-46421.patch \
-           file://CVE-2025-32050.patch \
-           file://CVE-2025-32052.patch \
-           file://CVE-2025-32909.patch \
-           file://CVE-2025-32910-1.patch \
-           file://CVE-2025-32910-2.patch \
-           file://CVE-2025-32910-3.patch \
-           file://CVE-2025-32912.patch \
-           file://CVE-2024-52531-1.patch \
-           file://CVE-2024-52531-2.patch \
-           file://CVE-2025-4476.patch \
-           file://CVE-2025-32907.patch \
-           file://CVE-2025-4948.patch \
-           file://CVE-2025-4969.patch \
-           file://CVE-2025-4945.patch \
-           file://CVE-2025-14523.patch \
-           file://CVE-2025-32049-1.patch \
-           file://CVE-2025-32049-2.patch \
-           file://CVE-2026-2443.patch \
-           file://CVE-2026-1801.patch \
-           file://CVE-2026-1761.patch \
-           file://CVE-2026-1539.patch \
-           file://CVE-2026-2369.patch \
-           file://CVE-2026-1760.patch \
-           file://CVE-2026-1467.patch \
-"
-SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
-
-CVE_PRODUCT = "libsoup"
-
-S = "${UNPACKDIR}/libsoup-${PV}"
-
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-
-UPSTREAM_CHECK_REGEX = "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[brotli] = "-Dbrotli=enabled,-Dbrotli=disabled,brotli"
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
-PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
-PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
-PACKAGECONFIG[ntlm] = "-Dntlm=enabled,-Dntlm=disabled"
-PACKAGECONFIG[sysprof] = "-Dsysprof=enabled,-Dsysprof=disabled,sysprof"
-
-# Tell libsoup where the target ntlm_auth is installed
-do_write_config:append:class-target() {
-    cat >${WORKDIR}/soup.cross <<EOF
-[binaries]
-ntlm_auth = '${bindir}/ntlm_auth'
-EOF
-}
-EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
-
-EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-# When built without gnome support, libsoup-2.4 will contain only one shared lib
-# and will therefore become subject to renaming by debian.bbclass. Prevent
-# renaming in order to keep the package name consistent regardless of whether
-# gnome support is enabled or disabled.
-DEBIAN_NOAUTONAME:${PN} = "1"
-
-# glib-networking is needed for SSL, proxies, etc.
-RRECOMMENDS:${PN} = "glib-networking"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.54.0


