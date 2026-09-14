Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E12C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12080.1789355609516069244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RJ/XPs4T;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86a25369f16so2122756b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355609; x=1789960409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=908ot6WUPZKuCm2e/SVoQqNpkxi2FPrdHUnkl8USOxM=;
        b=RJ/XPs4Tht861HqDD47x/hFzhQiSDjYuFXge9vvTh81eeO9FRxlca2O+qhdqd9i17+
         eHu7YSKFkv1MqJ+VH1KsF2NckBw2zuAqfjxbKHM6dH+ZDZ/DB3U1b+I2SkxcH8LgbdZG
         r6aPYezbYh7hDJRSuwubeP5AZmt8jyWW1DdIhzqSn1mDTOeL9zCRkGIQSXZ/FVVUa6/J
         NfGs0JNMv6JQohHz9sGE93wqVqQ46Pueab+cu0WHWS5NuMB3lI9Wifk9eLvHAS5hTLcs
         QsB2lAs/llaV72yQix8B3MvDKaoAKy02fGRk1GhAOkmjqF7i8VmwSE+MJjjTfbWuzmBt
         +Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355609; x=1789960409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=908ot6WUPZKuCm2e/SVoQqNpkxi2FPrdHUnkl8USOxM=;
        b=ADm3792uJav2N+bXf6iv+uUbbBVPYD35eBIwbL+ZIyKXWwknLONeqgeeBkfKPaCMoq
         k91I6zTKjlqEm0panzVn+DthNUpppSr63+co9S5SdAPOZ34p+GN9hvfSRHZHXL8kmIDU
         9GMXzbSzelYO+B2jhm3ihvvQZii6qZTYobBhitXwk9OngxHMaK249rSnz9rXBeXObi5m
         57Q+ATB/waJ7gST6t2jUZskBmAtfsXaniJTxv5RLV+eTto8NVtWzt532qdxseFEH7/xX
         4QR1XLzeREnxxi8NoYriRc/ClPw1XkvGe4J4em93Ol//n8oMaFb8I4y1M9qz8lk3sLKG
         kP+w==
X-Gm-Message-State: AFuF++nAjwYdfGppdJ4AU0Kg+0Rb1QAvUXnnuU1fj+VI6NsAa+sou8az
	T/F6cyoJ1j8VwmdZUdAlGfi3dlJlabCc7RBcIYM7ROTiRgl3O48juPQym9zR4QvJ
X-Gm-Gg: AYBFou1aMylven3ar2RXfvgy1/1CkWxFBgj7hl1SpXI1D1RDx+EjHzJVf5EokdulOFk
	Sij8tWJBmr3VQ5bLAs8YyWAefg4aRN+DblyIPhXa2Xkp+HuzxyV4ZP9+ZKaXOiCgCUcTG9AJx7x
	bDLf2Kfy8c+kNONunphvyejghoh4DUskBgwNy/TvxWvOCbMY20YcgcHDJh66cgf6OmCTwafqwVf
	MVIjQT5O/X7Kb7shUQdrs5J1Lv8RUASjOphvXvsECtVBbAEDOnkN/jqTYnH/gSZMueHiJQUVlVc
	SL6C5HP/kINdmfrdF8o4XQYuHpDFs4pK3yIL4Wjj/7nZ/tqEmRzPfSYY6mXTtV1kf59vutA8+Aq
	3dVBTyhDEqTqp4m0xy/quDwaGDbRPcU8g8nPxFnsvbQWl/JiQZFxMUhibUYqmzPswaUEa+7iPYP
	zcz9Z1GZvXmTvBPDzrvRBAtt0isyEo4KCLFjnLXMAGZgzNSzudByVVEEH/Afu7KMlvkH6QgCva9
	n/5IrSDgFaBqYs2lWb6
X-Received: by 2002:a05:6a00:92a0:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-86f855f5788mr1672971b3a.17.1789355608811;
        Sun, 13 Sep 2026 20:13:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 8/10] python3-sqlparse: patch CVE-2026-59894
Date: Mon, 14 Sep 2026 15:12:56 +1200
Message-ID: <20260914031300.3677365-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130016

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit associated with GitHub advisory.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59894

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-sqlparse/CVE-2026-59894.patch     | 79 +++++++++++++++++++
 .../python/python3-sqlparse_0.5.5.bb          |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch
new file mode 100644
index 0000000000..0bd7bbc967
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch
@@ -0,0 +1,79 @@
+From a1ce7931eda6262f0fe94a0b2cb25854f12d6be5 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Mon, 29 Jun 2026 08:29:32 +0200
+Subject: [PATCH] Escape backslashes in output formatters.
+
+(cherry picked from commit 53ff44b53e27cff78259acc1af015506fea60f63)
+
+CVE: CVE-2026-59894
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/53ff44b53e27cff78259acc1af015506fea60f63]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ sqlparse/filters/output.py | 16 ++++++++++------
+ tests/test_format.py       | 16 ++++++++++++++++
+ 2 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/sqlparse/filters/output.py b/sqlparse/filters/output.py
+index 253537e..697ebc3 100644
+--- a/sqlparse/filters/output.py
++++ b/sqlparse/filters/output.py
+@@ -61,9 +61,11 @@ class OutputPythonFilter(OutputFilter):
+                     yield sql.Token(T.Whitespace, after_lb)
+                 continue
+ 
+-            # Token has escape chars
+-            elif "'" in token.value:
+-                token.value = token.value.replace("'", "\\'")
++            # Escape backslashes before quotes so a backslash preceding a
++            # quote cannot break out of the generated string literal
++            # (GHSA-3496-9g83-7v6x).
++            else:
++                token.value = token.value.replace('\\', '\\\\').replace("'", "\\'")
+ 
+             # Put the token
+             yield sql.Token(T.Text, token.value)
+@@ -110,9 +112,11 @@ class OutputPHPFilter(OutputFilter):
+                     yield sql.Token(T.Whitespace, after_lb)
+                 continue
+ 
+-            # Token has escape chars
+-            elif '"' in token.value:
+-                token.value = token.value.replace('"', '\\"')
++            # Escape backslashes before quotes so a backslash preceding a
++            # quote cannot break out of the generated string literal
++            # (GHSA-3496-9g83-7v6x).
++            else:
++                token.value = token.value.replace('\\', '\\\\').replace('"', '\\"')
+ 
+             # Put the token
+             yield sql.Token(T.Text, token.value)
+diff --git a/tests/test_format.py b/tests/test_format.py
+index 0cdbcf8..9349506 100644
+--- a/tests/test_format.py
++++ b/tests/test_format.py
+@@ -689,6 +689,22 @@ class TestOutputFormat:
+             '$sql  = "select * ";',
+             '$sql .= "from foo;";'])
+ 
++    def test_python_escapes_backslashes(self):
++        # GHSA-3496-9g83-7v6x: backslashes must be escaped before quotes so
++        # crafted SQL cannot break out of the generated Python string literal.
++        # SQL  select '\foo\'  -> each \ doubled, each ' escaped.
++        sql = "select '\\foo\\'"
++        f = lambda sql: sqlparse.format(sql, output_format='python')
++        assert f(sql) == "sql = 'select \\'\\\\foo\\\\\\''"
++
++    def test_php_escapes_backslashes(self):
++        # GHSA-3496-9g83-7v6x: PHP double-quoted output must escape backslashes
++        # before quotes; a backslash before a quote otherwise closes the string.
++        # SQL  select '\foo\'  -> each \ doubled (single quotes need no escaping).
++        sql = "select '\\foo\\'"
++        f = lambda sql: sqlparse.format(sql, output_format='php')
++        assert f(sql) == '$sql = "select \'\\\\foo\\\\\'";'
++
+     def test_sql(self):
+         # "sql" is an allowed option but has no effect
+         sql = 'select * from foo;'
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index a1dc52db49..a23f5ec0e2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa9
 SRC_URI += "file://CVE-2026-54284-1.patch \
             file://CVE-2026-54284-2.patch \
             file://CVE-2026-59893.patch \
+            file://CVE-2026-59894.patch \
 "
 
 CVE_PRODUCT = "sqlparse"

