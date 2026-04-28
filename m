Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29D6FF8870
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:01:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5617.1777352486853560894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 22:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n5/fMMpq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so6418269a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352486; x=1777957286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+eYkv5dzZz3kt8eqixM+1vKGBSXnEQeFxZQYRIg5v8=;
        b=n5/fMMpqLeNemOvjFNsi0ktqVyzuq7HbYERhVyWoEGzuHj2JLhRL6AFol3wXoVEKAF
         VdBgZ0wPrAcanAT0rYnAtbERUajVynTJSceGpnLYWwt0hsInhs9kOM9fiLbEtb/nXdPS
         6vy5F+LOZueFn+I0M/qGKh5X0t7rrLv19ILpBRMmmxJUbEVOnReawx6o3xVDgm6rljOg
         NgAEQ6G8xOeno7Y2PBwHSlT7jccwNSIAW+vE1kPKg2NdCBg/ZcxS+AHsK5/g14HbLQbm
         1BjW0vn9x7MDefwN+6uLAzgHbWI6lLGQfIq54Q/QRBxcLFtUbYCwKg8eWgaL94/BpzN0
         mShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352486; x=1777957286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+eYkv5dzZz3kt8eqixM+1vKGBSXnEQeFxZQYRIg5v8=;
        b=ZVkE8wPCldSjrgEmmyy7+VLF2+W/l3rUg9+7fCR5kBMYVWI78OhVZxcmMg7LVcJxWM
         llmZysQu6b1nKet9Jf64QeZq0YlcBNCx8YlfUBWMAiCWTXkCSPNnBFW3iVkgPIfNWOtW
         f0/Qb5JO45/nk/gOqog/VwVDCpWO5xeVdOfkA4i49Pk7tBMlE9WOd3mbOzh4yMFJCbA4
         TYocoEN/B9AohwK5zNKejLUbBpg5Crtzdl0xRlasB6f7kNkqPzOoR6wXcJtHkc/2VFRa
         hZ+hGNzGhInoA0iIeYkdcsmvtUHrVLLPmCi48lc3Eo6gRHw8a6htA3H++L34GqNI1Bun
         LnTA==
X-Gm-Message-State: AOJu0YwrKvV3xk7SATCjldiLcYtzQLH/BsDddZUDMIrMRuhzIeCP7L7h
	w96rElCOBNSXFBz+qeJlD5aRCPZG4O8VB4GnI5YJAd6etGjciZVMPLnIxsUERPrf
X-Gm-Gg: AeBDievB+ZsCmAcB9MfKH3q39tiy+CSsfYwxJ9ELfoc0WsqSefb7KENQeOYOFNALJPb
	NSOtX8KW/XVkT8yim2R5Q9/oajbk/A+m5QRRCkF6mJB1V8aqVvHx8BCPFS1Z+hHfSImJGGk6TsX
	PCkbJnHCPgPQG1uUYcXVbzSFH4f1M7pK0MDqrgB9bL7GK/Gss3pWgAXFo8+fBIoL4wpEjzZnDI6
	HwBRj9YALeiEYksDPLIDltwQ33q9/2M6aFHL5kKtw9+xhQOnW04FA6y4YZ6qnKhmVhyQF1CNfrm
	cXqR+u0V+iXAWlwmQm1azRgmGxEuHTofuY/6UYsITWRaX+CYItks1qRxrVpnGwGWP5LAGHCvRNm
	cLW4c1VW3FvBRsBtU/E2KXCRxlf6v94RTWD1BKM5Z2f501oVMXlvQw7NZe8yndctc0+lyVFuce3
	kWKAdKU4V+o9qbwPHRENTEVzWzi4F8cO+vFKv4sAh4cWHQYJu6otLofnXyVA==
X-Received: by 2002:a17:90b:57cb:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-3649207ddc9mr1620101a91.24.1777352485631;
        Mon, 27 Apr 2026 22:01:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d619sm11798385ad.70.2026.04.27.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:01:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/5] libssh: patch CVE-2026-0968
Date: Tue, 28 Apr 2026 17:01:06 +1200
Message-ID: <20260428050109.2099228-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
References: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126643

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patches [1] and [2] as mentioned in [3]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=796d85f786dff62bd4bcc4408d9b7bbc855841e9
[2] https://git.libssh.org/projects/libssh.git/commit/?id=212121971fb26e1e00b72bd5402c0454a4d84c03
[3] https://security-tracker.debian.org/tracker/CVE-2026-0968

Certain functions from sftp.c were moved to a new file sftp_common.c
in version 0.11.0 by following commit:
https://git.libssh.org/projects/libssh.git/commit/src/sftp_common.c?id=c3e03ab4651e4f3382e3a51c0273ade894f0c48a

This is the backport of the changes using the original file sftp.c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libssh/libssh/CVE-2026-0968-1.patch       |  64 +++++++++
 .../libssh/libssh/CVE-2026-0968-2.patch       | 136 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 3 files changed, 202 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch
new file mode 100644
index 0000000000..5ed1a4e940
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch
@@ -0,0 +1,64 @@
+From 9fd388141c973ba6fb7d45966c25d1fad9e1d419 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 20:59:11 +0100
+Subject: [PATCH] CVE-2026-0968: sftp: Sanitize input handling in
+ sftp_parse_longname()
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+CVE: CVE-2026-0968
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=796d85f786dff62bd4bcc4408d9b7bbc855841e9]
+
+Certain functions from sftp.c were moved to a new file sftp_common.c
+in version 0.11.0 by following commit:
+https://git.libssh.org/projects/libssh.git/commit/src/sftp_common.c?id=c3e03ab4651e4f3382e3a51c0273ade894f0c48a
+
+This is the backport of the changes which fixes the CVE in the original file
+sftp.c
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sftp.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 4a77141b..2194a9ef 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1289,13 +1289,18 @@ static char *sftp_parse_longname(const char *longname,
+     const char *p, *q;
+     size_t len, field = 0;
+ 
++    if (longname == NULL || longname_field < SFTP_LONGNAME_PERM ||
++        longname_field > SFTP_LONGNAME_NAME) {
++        return NULL;
++    }
++
+     p = longname;
+     /* Find the beginning of the field which is specified by sftp_longname_field_e. */
+-    while(field != longname_field) {
++    while (*p != '\0' && field != longname_field) {
+         if(isspace(*p)) {
+             field++;
+             p++;
+-            while(*p && isspace(*p)) {
++            while (*p != '\0' && isspace(*p)) {
+                 p++;
+             }
+         } else {
+@@ -1303,8 +1308,13 @@ static char *sftp_parse_longname(const char *longname,
+         }
+     }
+ 
++    /* If we reached NULL before we got our field fail */
++    if (field != longname_field) {
++        return NULL;
++    }
++
+     q = p;
+-    while (! isspace(*q)) {
++    while (*q != '\0' && !isspace(*q)) {
+         q++;
+     }
+ 
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch
new file mode 100644
index 0000000000..42642ee1ed
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch
@@ -0,0 +1,136 @@
+From 04cd54c7302195055d208e0ca00d6e519d674bb2 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 21:00:03 +0100
+Subject: [PATCH] CVE-2026-0968 tests: Reproducer for invalid longname data
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 90a5d8f47399e8db61b56793cd21476ff6a528e0)
+(cherry picked from commit 212121971fb26e1e00b72bd5402c0454a4d84c03)
+
+CVE: CVE-2026-0968
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=212121971fb26e1e00b72bd5402c0454a4d84c03]
+
+Certain functions from sftp.c were moved to a new file sftp_common.c
+in version 0.11.0 by following commit:
+https://git.libssh.org/projects/libssh.git/commit/src/sftp_common.c?id=c3e03ab4651e4f3382e3a51c0273ade894f0c48a
+
+Updated unit test to include sftp.c during the backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/unittests/CMakeLists.txt      |  7 +++
+ tests/unittests/torture_unit_sftp.c | 86 +++++++++++++++++++++++++++++
+ 2 files changed, 93 insertions(+)
+ create mode 100644 tests/unittests/torture_unit_sftp.c
+
+diff --git a/tests/unittests/CMakeLists.txt b/tests/unittests/CMakeLists.txt
+index f85da72b..41f25830 100644
+--- a/tests/unittests/CMakeLists.txt
++++ b/tests/unittests/CMakeLists.txt
+@@ -101,6 +101,13 @@ if (UNIX AND NOT WIN32)
+     endif (WITH_SERVER)
+ endif (UNIX AND NOT WIN32)
+ 
++if (WITH_SFTP)
++    set(LIBSSH_UNIT_TESTS
++        ${LIBSSH_UNIT_TESTS}
++        torture_unit_sftp
++    )
++endif (WITH_SFTP)
++
+ foreach(_UNIT_TEST ${LIBSSH_UNIT_TESTS})
+     add_cmocka_test(${_UNIT_TEST}
+                     SOURCES ${_UNIT_TEST}.c
+diff --git a/tests/unittests/torture_unit_sftp.c b/tests/unittests/torture_unit_sftp.c
+new file mode 100644
+index 00000000..8cdaba8e
+--- /dev/null
++++ b/tests/unittests/torture_unit_sftp.c
+@@ -0,0 +1,86 @@
++#include "config.h"
++
++#include "sftp.c"
++#include "torture.h"
++
++#define LIBSSH_STATIC
++
++static void test_sftp_parse_longname(void **state)
++{
++    const char *lname = NULL;
++    char *value = NULL;
++
++    /* state not used */
++    (void)state;
++
++    /* Valid example from SFTP draft, page 18:
++     * https://datatracker.ietf.org/doc/draft-spaghetti-sshm-filexfer/
++     */
++    lname = "-rwxr-xr-x   1 mjos     staff      348911 Mar 25 14:29 t-filexfer";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "-rwxr-xr-x");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_OWNER);
++    assert_string_equal(value, "mjos");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_GROUP);
++    assert_string_equal(value, "staff");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_SIZE);
++    assert_string_equal(value, "348911");
++    free(value);
++    /* This function is broken further as the date contains space which breaks
++     * the parsing altogether */
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_DATE);
++    assert_string_equal(value, "Mar");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_TIME);
++    assert_string_equal(value, "25");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_string_equal(value, "14:29");
++    free(value);
++}
++
++static void test_sftp_parse_longname_invalid(void **state)
++{
++    const char *lname = NULL;
++    char *value = NULL;
++
++    /* state not used */
++    (void)state;
++
++    /* Invalid inputs should not crash
++     */
++    lname = NULL;
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_null(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++
++    lname = "";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++
++    lname = "-rwxr-xr-x   1";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "-rwxr-xr-x");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++}
++
++int torture_run_tests(void)
++{
++    int rc;
++    const struct CMUnitTest tests[] = {
++        cmocka_unit_test(test_sftp_parse_longname),
++        cmocka_unit_test(test_sftp_parse_longname_invalid),
++    };
++
++    rc = cmocka_run_group_tests(tests, NULL, NULL);
++    return rc;
++}
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 30f68f87ce..e0ade7f67c 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -28,6 +28,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0966-1.patch \
            file://CVE-2026-0966-2.patch \
            file://CVE-2026-0966-3.patch \
+           file://CVE-2026-0968-1.patch \
+           file://CVE-2026-0968-2.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 

