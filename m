Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36049.1793161486811479880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kIZr7Ols;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso275761a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161486; x=1793766286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hjCoE3wqJAP1jVVZ5Q9Yzp8svxJ5C3ltuzwKYT1jxs=;
        b=kIZr7Olsug7vsqX2ECTtVzWW3a1m1WrOQkypRf58aJPSySecW00/rTC/nOD/sjdLFk
         i1fr0b6GdPlSw6FCwzZF+ekQ1dHv70ryhJn1mANiSS4UFPzc7QdrQFjnRYEuk/T7ORvO
         KoqfIDU5r2tlRrwcdbxdE66S58WnEP/cSjsPl/MCI90d+Med1s083q2QFou1p316UW7A
         2MNm/h7UkAoXsnJ0VV+73rK4MebEXF5o0iEZWHEbfP7lbuX4hyhLIEV1GvAebvGMUuyg
         mid3S6+5pmJevOIL3BPFescm8mCfdURuO235cgkHFXHaTMQ44ioFzvECEJ5tGnXe4FvZ
         KNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161486; x=1793766286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hjCoE3wqJAP1jVVZ5Q9Yzp8svxJ5C3ltuzwKYT1jxs=;
        b=tppN0DGoo3wbpt8z/9/BIw7HErkPHQMfXTkPCI990zZcH9LRKrkcJYJPr9nXsu/kWQ
         uv3gNRFP/8S/7Ss3YIQS7L1hQ7pli2KlJJpsVyOrZIoINF70VKQrDv20XUtyJBkfyGT2
         ztaUsbupoLBn/EeZIO4muN5PurB0io3eAMm4QGvvaiOo11wMcuHWKOccSHgPVsEXp4OQ
         QzFZKzoOwCMASR+CR0xPdufKATS19yKS2c6EKPn8mCWNlFluyHNlztPcoz8B338zuTB/
         3qXukrb/Xf0mlje7vS6wZe5kQFhQvZcfkRW/Ku1PjH4teX8nN5Bi7scBaIl2NqhRD41x
         6+GA==
X-Gm-Message-State: AFq9FYJ+/rObQbHNJLHK0RuZ0indcnQFeNndJ1wkqndELRiuOYLR9hRD
	NOqtRunaqvNPLe0TU34T2EyxjNzOGt3LK6ZqfFdoy19cWPQeT6yaILmjrIzKUg==
X-Gm-Gg: AYBFou0la0DixmqNC69N94dcMyI30DZXS9b1D3pncry13R9UAAaS20tzKGZNgiUdiyI
	+sl/Ce/fhUyZqd5j/JfC8jsgUo2XjZCqJTrjePd+gphwQTOlVtCbtOxbO7KD3ums8w86xbg3jYF
	11NCC01MCxUB+54wvLNwxxTl5KAwp4vFbS8lUR+QL2yTH5Gt1i/HLlKg9vAAqNq6L1hyqQuTdGO
	OaozHbK3UUHHnFuTbvMgYUzPow8z+Ufu8eGvlpj9z6JELCj43NikAwQR8mH8CcWp9k1ON22Lutl
	8gLIiiKlgGD3v7hBBc//AT01Evjf3ezLVJLPtKEC4L1QYRE8l6chu683l+InJghHooYYCvzoL4E
	lC9CuPvf34iNPvNQMu7+maTcixiBWLdeXq16RSUweKV/If7pah1d2T482MhYqzqiulhHIOY52jx
	JAFdMMdlc42Obwp+Pu4Q1G2cJfA9Ub5xDN4d2XzeoP7n9QBAUZzrMr57SwrQPqVcXO6LnvZZ9as
	YJpGzX4BUw1H9v/7Dp0/VlJM8c7SiX8Wls5qA595Zk2vDT0bOi3aSgGe9GMHsxB7/gR6p5KsH4u
	ePAX0SkXqenF93nIslM/ODxz4EPnvh1wRBPZm++qijiAIplIWzt3glZbv7c6OQ==
X-Received: by 2002:a17:90b:2743:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae57f629e3mr858351a91.17.1793161486023;
        Tue, 27 Oct 2026 21:24:46 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 17/60] psqlodbc: patch CVE-2026-109448
Date: Wed, 28 Oct 2026 17:23:15 +1300
Message-ID: <3e0c7af04774807059c67a62ef3c6a4faf584702.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131569
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-109448

[1]https://security-tracker.debian.org/tracker/CVE-2026-109448

PTEST pass:
root@qemuarm64:~# ptest-runner psqlodbc
START: ptest-runner
2026-10-17T09:22
BEGIN: /usr/lib/psqlodbc/ptest
...
DURATION: 43
END: /usr/lib/psqlodbc/ptest
2026-10-17T09:23
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../psqlodbc/files/CVE-2026-109448.patch      | 243 ++++++++++++++++++
 .../psqlodbc/psqlodbc_18.00.0002.bb           |   1 +
 2 files changed, 244 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch b/meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch
new file mode 100644
index 0000000000..12f6cdd1d8
--- /dev/null
+++ b/meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch
@@ -0,0 +1,243 @@
+From 5c9443fb0c8c0e263e1f8d0298987e91c4f5ccea Mon Sep 17 00:00:00 2001
+From: Dave Cramer <davecramer@gmail.com>
+Date: Mon, 12 Oct 2026 11:47:08 -0400
+Subject: [PATCH] Merge commit from fork
+
+The APD, IPD and put-data binding counts are SQLSMALLINT.  Binding
+parameter 32768 wrapped the count to -32768, so execution failed with
+07002 even though every parameter was bound; binding parameter 32769
+then extended the arrays with a memset starting at index -32768,
+writing zeros up to 1.25 MiB before the start of the APD array (and
+likewise for the IPD and put-data arrays), which corrupts the heap.
+
+SQLNumParams and SQL_DESC_COUNT are SQLSMALLINT too, so 32767 is the
+largest parameter count ODBC can describe.  PGAPI_BindParameter now
+returns 07009 for parameter numbers outside 1..32767, which also covers
+parameter number 0 for applications that call the driver without a
+driver manager.
+
+New param-count-limit test binds 32767, 32768 and 32769 parameters.
+
+Assisted-By: Claude
+(cherry picked from commit 86e4418e9553aa0891315db7531f8cd31eb1575e)
+
+CVE: CVE-2026-109448
+Upstream-Status: Backport [https://github.com/postgresql-interfaces/psqlodbc/commit/86e4418e9553aa0891315db7531f8cd31eb1575e]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ bind.c                              |  12 +++
+ test/expected/param-count-limit.out |  12 +++
+ test/src/param-count-limit-test.c   | 142 ++++++++++++++++++++++++++++
+ test/tests                          |   1 +
+ 4 files changed, 167 insertions(+)
+ create mode 100644 test/expected/param-count-limit.out
+ create mode 100644 test/src/param-count-limit-test.c
+
+diff --git a/bind.c b/bind.c
+index 3b566ec..b3e5ca3 100644
+--- a/bind.c
++++ b/bind.c
+@@ -16,6 +16,7 @@
+ /* #include <stdlib.h> */
+ #include <string.h>
+ #include <ctype.h>
++#include <limits.h>
+ #include "bind.h"
+ #include "misc.h"
+ 
+@@ -57,6 +58,17 @@ PGAPI_BindParameter(HSTMT hstmt,
+ 	}
+ 	SC_clear_error(stmt);
+ 
++	/*
++	 * The APD, IPD and put-data counts are SQLSMALLINT, like SQLNumParams
++	 * and SQL_DESC_COUNT, so a larger parameter number would wrap the count
++	 * negative and the next binding would write before the bindings array.
++	 */
++	if (ipar < 1 || ipar > SHRT_MAX)
++	{
++		SC_set_error(stmt, STMT_BAD_PARAMETER_NUMBER_ERROR, "Invalid parameter number for PGAPI_BindParameter.", func);
++		return SQL_ERROR;
++	}
++
+ 	apdopts = SC_get_APDF(stmt);
+ 	if (apdopts->allocated < ipar)
+ 		extend_parameter_bindings(apdopts, ipar);
+diff --git a/test/expected/param-count-limit.out b/test/expected/param-count-limit.out
+new file mode 100644
+index 0000000..623bcbf
+--- /dev/null
++++ b/test/expected/param-count-limit.out
+@@ -0,0 +1,12 @@
++connected
++APD SQL_DESC_COUNT=-1: error SQLSTATE=07009
++APD bind 1 after SQL_DESC_COUNT=-1: ok
++IPD SQL_DESC_COUNT=-1: error SQLSTATE=07009
++IPD bind 1 after SQL_DESC_COUNT=-1: ok
++bind 0: error SQLSTATE=07009
++32767 params, bind 32767: ok
++32767 params, execute: ok
++32767 params, result 1
++32768 params, bind 32768: error SQLSTATE=07009
++32769 params, bind 32768: error SQLSTATE=07009
++disconnecting
+diff --git a/test/src/param-count-limit-test.c b/test/src/param-count-limit-test.c
+new file mode 100644
+index 0000000..e9554cd
+--- /dev/null
++++ b/test/src/param-count-limit-test.c
+@@ -0,0 +1,142 @@
++/*
++ * Test the limits on parameter numbers and descriptor counts.  The driver
++ * keeps parameter binding counts in SQLSMALLINT, so SQLBindParameter with a
++ * parameter number above 32767, or SQL_DESC_COUNT set negative, used to
++ * wrap the count negative and make the next binding write zeros before the
++ * start of the bindings array.
++ */
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include "common.h"
++
++#define MAX_PARAMS	32767
++
++static void
++print_state(const char *what, SQLRETURN rc, SQLSMALLINT htype, SQLHANDLE h)
++{
++	SQLCHAR		state[6] = "";
++	SQLINTEGER	native;
++	SQLCHAR		msg[256];
++	SQLSMALLINT	len;
++
++	printf("%s: ", what);
++	if (SQL_SUCCEEDED(rc))
++	{
++		printf("ok\n");
++		return;
++	}
++	SQLGetDiagRec(htype, h, 1, state, &native, msg, sizeof(msg), &len);
++	printf("error SQLSTATE=%s\n", (char *) state);
++}
++
++/* SELECT 1 WHERE 1 IN (?, ?, ..., ?) with nparams markers, all bound to 1 */
++static void
++run_with_params(int nparams)
++{
++	SQLRETURN	rc;
++	HSTMT		hstmt = SQL_NULL_HSTMT;
++	SQLINTEGER	one = 1;
++	SQLINTEGER	result = 0;
++	char	   *sql, *p;
++	char		what[64];
++	int			i;
++
++	rc = SQLAllocHandle(SQL_HANDLE_STMT, conn, &hstmt);
++	CHECK_CONN_RESULT(rc, "SQLAllocHandle failed", conn);
++
++	sql = malloc(32 + 2 * nparams);
++	p = sql + sprintf(sql, "SELECT 1 WHERE 1 IN (");
++	for (i = 0; i < nparams; i++)
++	{
++		if (i > 0)
++			*p++ = ',';
++		*p++ = '?';
++	}
++	strcpy(p, ")");
++
++	for (i = 1; i <= nparams; i++)
++	{
++		rc = SQLBindParameter(hstmt, (SQLUSMALLINT) i, SQL_PARAM_INPUT,
++							  SQL_C_SLONG, SQL_INTEGER, 0, 0, &one, 0, NULL);
++		if (!SQL_SUCCEEDED(rc))
++			break;
++	}
++	snprintf(what, sizeof(what), "%d params, bind %d", nparams, i <= nparams ? i : nparams);
++	print_state(what, rc, SQL_HANDLE_STMT, hstmt);
++
++	if (SQL_SUCCEEDED(rc))
++	{
++		rc = SQLExecDirect(hstmt, (SQLCHAR *) sql, SQL_NTS);
++		snprintf(what, sizeof(what), "%d params, execute", nparams);
++		print_state(what, rc, SQL_HANDLE_STMT, hstmt);
++	}
++	if (SQL_SUCCEEDED(rc))
++	{
++		rc = SQLBindCol(hstmt, 1, SQL_C_SLONG, &result, 0, NULL);
++		CHECK_STMT_RESULT(rc, "SQLBindCol failed", hstmt);
++		rc = SQLFetch(hstmt);
++		CHECK_STMT_RESULT(rc, "SQLFetch failed", hstmt);
++		printf("%d params, result %d\n", nparams, (int) result);
++	}
++
++	free(sql);
++	SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
++}
++
++/* Set SQL_DESC_COUNT of the statement's APD or IPD to -1, then bind */
++static void
++negative_desc_count(SQLINTEGER desc_attr, const char *desc_name)
++{
++	SQLRETURN	rc;
++	HSTMT		hstmt = SQL_NULL_HSTMT;
++	SQLHDESC	hdesc;
++	SQLINTEGER	one = 1;
++	char		what[64];
++
++	rc = SQLAllocHandle(SQL_HANDLE_STMT, conn, &hstmt);
++	CHECK_CONN_RESULT(rc, "SQLAllocHandle failed", conn);
++
++	rc = SQLGetStmtAttr(hstmt, desc_attr, &hdesc, 0, NULL);
++	CHECK_STMT_RESULT(rc, "SQLGetStmtAttr failed", hstmt);
++
++	rc = SQLSetDescField(hdesc, 0, SQL_DESC_COUNT, (SQLPOINTER) (SQLLEN) -1, 0);
++	snprintf(what, sizeof(what), "%s SQL_DESC_COUNT=-1", desc_name);
++	print_state(what, rc, SQL_HANDLE_DESC, hdesc);
++
++	rc = SQLBindParameter(hstmt, 1, SQL_PARAM_INPUT, SQL_C_SLONG,
++						  SQL_INTEGER, 0, 0, &one, 0, NULL);
++	snprintf(what, sizeof(what), "%s bind 1 after SQL_DESC_COUNT=-1", desc_name);
++	print_state(what, rc, SQL_HANDLE_STMT, hstmt);
++
++	SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
++}
++
++int
++main(int argc, char **argv)
++{
++	SQLRETURN	rc;
++	HSTMT		hstmt = SQL_NULL_HSTMT;
++	SQLINTEGER	one = 1;
++
++	test_connect();
++
++	negative_desc_count(SQL_ATTR_APP_PARAM_DESC, "APD");
++	negative_desc_count(SQL_ATTR_IMP_PARAM_DESC, "IPD");
++
++	rc = SQLAllocHandle(SQL_HANDLE_STMT, conn, &hstmt);
++	CHECK_CONN_RESULT(rc, "SQLAllocHandle failed", conn);
++	rc = SQLBindParameter(hstmt, 0, SQL_PARAM_INPUT, SQL_C_SLONG,
++						  SQL_INTEGER, 0, 0, &one, 0, NULL);
++	print_state("bind 0", rc, SQL_HANDLE_STMT, hstmt);
++	SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
++
++	run_with_params(MAX_PARAMS);
++	run_with_params(MAX_PARAMS + 1);
++	run_with_params(MAX_PARAMS + 2);
++
++	test_disconnect();
++
++	return 0;
++}
+diff --git a/test/tests b/test/tests
+index 5074bca..c8af1ab 100644
+--- a/test/tests
++++ b/test/tests
+@@ -63,6 +63,7 @@ TESTBINS = exe/connect-test \
+ 	exe/descriptors-free-test \
+ 	exe/primarykeys-include-test \
+ 	exe/interval-overflow-test \
++	exe/param-count-limit-test \
+ 	exe/conn-settings-test \
+ 	exe/percent-decode-test \
+ 	exe/dbms-version-test \
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
index ae1d603e1d..9756bcfad2 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0002.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
            file://psqlodbc-donot-use-the-hardcode-libdir.patch \
            file://psqlodbc-fix-for-ptest-support.patch \
+           file://CVE-2026-109448.patch \
            file://run-ptest \
            "
 
