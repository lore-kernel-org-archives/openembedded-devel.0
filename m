Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07783D5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:13:53 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16699.1765869224166736656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjO8MtSb;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo4906098b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869223; x=1766474023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmmxT3iRPUgyOhzW5YnajMDvaCuo8AWEiHqj4kU8yrI=;
        b=HjO8MtSb+6CnXeIVWvizZaIfvtCCCPVOzO97yyxOxQNzoV/drqJJ/W68fPl25tbZik
         BF2gHqk3JtQkYNFssw+UiG9YDYY7ZT09WC1p5NfgtiXIQ7CEuHq5WURMip6DRTbwN/xC
         CUzvbSi1XF1kVbdvFHulwtAiJHFI7IyK3eNIJc1+/T7tMOcKKhk/MmqYA7uzAcMMnA7u
         xgxwu7Y8tLTpJazMhPQ+nxNQB2OZYs4PFl7BfYwItDKDHZzrd3TDGMyfOPOR4uqrBnR9
         NuD8pYOzyQsLhHXw+jksoVaeJPBNsEa+KGOiLHUIqVkk4uCIJm4TctYU8/gGZY4dTyx+
         L6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869223; x=1766474023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmmxT3iRPUgyOhzW5YnajMDvaCuo8AWEiHqj4kU8yrI=;
        b=D4l51jtszm3sIyeqLXp/jk2kr70Q0e9oCXR1cjG32GiLzF56+YV1doteotRStDLWD9
         kIfHn1ssXJKfJoK1WmBYAUcr7r7yO8uAzU6Axw4zRF+++R0kC6i4qTVWlNrX3U2b46ks
         PTzmWQgCYLbDi6VmlQWe4MgKtCRY1zIb28Mgq2M22gBjV8N2Ksw9i1bsSm4qStyAWmNx
         7Z1wMTp9LGgWMObVC0mdUKtkijokwbQZYStoHU2ikWh6Hs+i4SCpzO2erevj/q4mL8XV
         rObhr+9F/DLgDZvLCo9bNg+2c59FRk3xYQm9DH5r4SSWM+IFIDR1Y1Xs52UbSC9IDoWK
         0mtA==
X-Gm-Message-State: AOJu0YygCKhT5Y3x1E7nCFopA8zx4bMr7IHkzJMWFzFIymzSH8SXC7Jl
	8/ymFmPWaV3O/O0TU47+0Rcx6hTutuq2l/yP7c28iJ+eJ2KzcyExLwcxR3lkGA==
X-Gm-Gg: AY/fxX7FWOuXkOkk+7rX4qYv1txyIyNcREUScmiYbyc5Q5u70S4DpGXPN3UlEfkcpo1
	R4z4a5yNbVdb9K1iVpUBXT6gQ1XwKduSOsS3Yb8BwAkqzFl7s0BRuFkLzxWXH47yT1oG9tFTgLB
	wOcfU37kr5/KGNtaxdhhU2NXI1UZi/pU9TRHRD7Vt2ZZVcZ/uFUqydauL3A3wYxqPvYb5sOtcNi
	vvJ4mpzli85Pnfui9H5M57mWyyyvUCTiZ+uUO0nbKVMJNbxdzj+Q4ejKzDE8sO1Y0BG/7SCx0ct
	okTjRDi/3hCKW/Glu558yc32qE2W8QBwcrf/3KWWsNu0ryFj9jFJlmC0W9SzKxJGaLeQ53WKLpx
	m0JITUvXNgxm34nq30MfzOeSHRdRXV5OJRJNBInZW4h872XXTYC0dFtCg4HgjKF8Fyodghimf3M
	NaSx5bWDNktn/O/M1Yfrpq18WL
X-Google-Smtp-Source: AGHT+IGs42dZRRRR/J+UsoXmN0advbZC5eEttYBMOemeb4HB4AiUZdMdJ+9KEazQlvTrQHe1Ep+nwQ==
X-Received: by 2002:a05:6a00:3694:b0:7b8:ac7f:5955 with SMTP id d2e1a72fcca58-7f667c20462mr11431944b3a.17.1765869223230;
        Mon, 15 Dec 2025 23:13:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm14225372b3a.49.2025.12.15.23.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:13:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/4] editorconfig-core-c: patch CVE-2024-53849
Date: Tue, 16 Dec 2025 12:43:29 +0530
Message-ID: <20251216071329.3172170-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
References: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122679

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-53849

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../editorconfig-core-c_0.12.6.bb             |  5 +-
 .../editorconfig/files/CVE-2024-53849_1.patch | 54 +++++++++++++++++++
 .../editorconfig/files/CVE-2024-53849_2.patch | 48 +++++++++++++++++
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch
 create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
index 976120b515..2d99ca50ca 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
@@ -4,7 +4,10 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f515fff3ea0a2b9797eda60d83c0e5ca"
 
-SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master \
+           file://CVE-2024-53849_1.patch \
+           file://CVE-2024-53849_2.patch \
+"
 
 S = "${WORKDIR}/git"
 SRCREV = "b7837029494c03af5ea70ed9d265e8c2123bff53"
diff --git a/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch b/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch
new file mode 100644
index 0000000000..b3b6c30e5e
--- /dev/null
+++ b/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch
@@ -0,0 +1,54 @@
+From d47a37a6186d98c6db308d467f822c438972bdbc Mon Sep 17 00:00:00 2001
+From: Christopher Wellons <wellons@nullprogram.com>
+Date: Sat, 17 Feb 2024 15:32:25 -0500
+Subject: [PATCH] Fix a few more stack buffer overflows
+
+Several overflows may occur in switch case '[' when the input pattern
+contains many escaped characters. The added backslashes leave too little
+space in the output pattern when processing nested brackets such that
+the remaining input length exceeds the output capacity. Therefore all
+these concatenations must also be checked.
+
+The ADD_CHAR was missed in 41281ea (#87). The switch can exit exactly at
+capacity, leaving no room for the finishing '$', causing an overflow.
+
+These overflows were discovered through fuzz testing with afl.
+
+CVE: CVE-2024-53849
+Upstream-Status: Backport [https://github.com/editorconfig/editorconfig-core-c/commit/fca7cf19e0fb800c2d38f173c1f69ad40bf2a2f5]
+(cherry picked from commit fca7cf19e0fb800c2d38f173c1f69ad40bf2a2f5)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/ec_glob.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/ec_glob.c b/src/lib/ec_glob.c
+index ea62aee..e62af1f 100644
+--- a/src/lib/ec_glob.c
++++ b/src/lib/ec_glob.c
+@@ -192,10 +192,14 @@ int ec_glob(const char *pattern, const char *string)
+                     if (!right_bracket)  /* The right bracket may not exist */
+                         right_bracket = c + strlen(c);
+ 
+-                    strcat(p_pcre, "\\");
++                    STRING_CAT(p_pcre, "\\", pcre_str_end);
++                    /* Boundary check for strncat below. */
++                    if (pcre_str_end - p_pcre <= right_bracket - c) {
++                        return -1;
++                    }
+                     strncat(p_pcre, c, right_bracket - c);
+                     if (*right_bracket)  /* right_bracket is a bracket */
+-                        strcat(p_pcre, "\\]");
++                        STRING_CAT(p_pcre, "\\]", pcre_str_end);
+                     p_pcre += strlen(p_pcre);
+                     c = right_bracket;
+                     if (!*c)
+@@ -339,7 +343,7 @@ int ec_glob(const char *pattern, const char *string)
+         }
+     }
+ 
+-    *(p_pcre ++) = '$';
++    ADD_CHAR(p_pcre, '$', pcre_str_end);
+ 
+     pcre2_code_free(re); /* ^\\d+\\.\\.\\d+$ */
+ 
diff --git a/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch b/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch
new file mode 100644
index 0000000000..304c8acd9d
--- /dev/null
+++ b/meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch
@@ -0,0 +1,48 @@
+From 8ac5af4bc4b6344442f11f35fdc48177ce570a13 Mon Sep 17 00:00:00 2001
+From: Christopher Wellons <wellons@nullprogram.com>
+Date: Sat, 17 Feb 2024 16:01:57 -0500
+Subject: [PATCH] Fix pointer overflow in STRING_CAT
+
+The end pointer is positioned one past the end of the destination, and
+it is undefined behavior to compute an address beyond the end pointer,
+including for comparisons, even temporarily. The UB occurs exactly when
+buffer overflow would have occurred, so the buffer overflow check could
+be optimized away by compilers. Even if this wasn't the case, the check
+could produce a false negative if the computed address overflowed the
+address space, which is, after all, why the C standard doesn't define
+behavior in the first place.
+
+The fix is simple: Check using sizes, not addresses. The explicit cast
+suppresses warnings about signed-unsigned comparisons, and the assertion
+checks the cast.
+
+CVE: CVE-2024-53849
+Upstream-Status: Backport [https://github.com/editorconfig/editorconfig-core-c/commit/4d5518a0a4e4910c37281ab13a048d0d86999782]
+(cherry picked from commit 4d5518a0a4e4910c37281ab13a048d0d86999782)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/ec_glob.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/ec_glob.c b/src/lib/ec_glob.c
+index e62af1f..c2b83cf 100644
+--- a/src/lib/ec_glob.c
++++ b/src/lib/ec_glob.c
+@@ -27,6 +27,7 @@
+ 
+ #include "global.h"
+ 
++#include <assert.h>
+ #include <ctype.h>
+ #include <string.h>
+ #include <pcre2.h>
+@@ -51,7 +52,8 @@ static const UT_icd ut_int_pair_icd = {sizeof(int_pair),NULL,NULL,NULL};
+ /* concatenate the string then move the pointer to the end */
+ #define STRING_CAT(p, string, end)  do {    \
+     size_t string_len = strlen(string); \
+-    if (p + string_len >= end) \
++    assert(end > p); \
++    if (string_len >= (size_t)(end - p)) \
+         return -1; \
+     strcat(p, string); \
+     p += string_len; \

