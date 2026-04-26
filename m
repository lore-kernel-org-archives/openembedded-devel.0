Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC93FF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18123.1777208644507457521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cN4k+3Hk;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b2589c26e3so87656685ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208644; x=1777813444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVRltIeADG09vYG7bqOgxREwOvWV0aIIfA0dP1iXb9A=;
        b=cN4k+3HkBhskC5lXjNNkMFG35Te48+CI4gVKJp7R2SFsGS4V8/FQe5lBUCfD2OsNz8
         GrUsjmZ5CjMDbKIBbcJesL3BKjD4K33HeM5C8bmdvEg2757YyATzP7J/q8klpf/erLsq
         8mZ5S3LuksyJiZSS64xssKHCw3f0pM/Zcy7mLgDj9BsarrQE/XTB77mgqlwNM11asYJp
         smqREtq4PHfTmKHTWgQF/beYsKBovDz0FGgPgNpPndFr5tNq34upISquGBrGclB8o99H
         KyxYFZiSQImOB5H1ETah6ZLH8J/r4RDUR/fkUHARUhCm+GI0FWaOzABF9Xpf+8IOJRli
         Hwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208644; x=1777813444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVRltIeADG09vYG7bqOgxREwOvWV0aIIfA0dP1iXb9A=;
        b=RSFWCNWWNrpGmW7E/nB0i56M+fE4CDf0l8ACDKoVgtPdsiTmBy7ntC3r40bJgO8rIW
         7SL7hWneOz5y5uBEN1uClaFjYcQYJOLafYA3MUYhK2fv4ym1N92XNiwHlZiFfYjwfdu+
         UUywJIkY2S21lsSrTGRwt9FCPf4hynGyC1o7XPzlthnGutO9mwQUUJ4fbYDAfgjniafC
         +GH3zx5wcUl/HdzRpDpfKjAav5KGUqtbEM126Kf0S17O7zDNSGEUDBKr+wdJW21tmnFm
         le/dVZZTaVq60R5GebypAYYUrbpUsgCqUM41rF4vxgDeBvEH9ol6CTyM+KuRZ+gXFqCf
         RmyQ==
X-Gm-Message-State: AOJu0YynPWrSRyMzeady0ZS6IrTQ9KTLp2RhoFKVqYMsnDQi73V0lTl4
	1HYNv8wh7bf0ifHd2p6yVQJFIrmrOLdD1fzoVXcocwyxVNoJaPVn9Ps+twBFdGoY
X-Gm-Gg: AeBDieswAzfwWfd38MAsxwayhNpkFNIzt63E4/GG6rtXyZ5kdYO/VTYKxgR/EsJHcjj
	8gMSXR0Zrn+Mvmb6jpvxOX2n5cxzLAbH1jOpmzc2vwEW3KvsznJdjYcmi9mLaaQQuHiEEYClx7O
	MXRFRc5QNf4zfx08TB3rvqnkBp0W9YWXyUm3ZAgla9N8FZACnXizt1DKDFBymkANkjZcTAmWGDS
	f9BGACuNvxfFAWvSeNkp/9flH2olpqSCj0FRD0O7kr5fqmItV/9/tvrucmNQjh0feyLKlawvVL4
	OPK2s6Js5WgLSiQg+jyRxEmg4Cu26Ks8E/Ex8t78xtk+Se4jcWnShBG0KGToG/r/mpyI5ALMz2R
	mNy/IQYNGEU0B7rCq4Xlq1So9cpKyrfz1UMXbZHv+tiZ4rEEoOBCQ8JWiSSbhwQSL4LDOyzHrwd
	kO27calk9vQEwzUmGCJZhQUcproEBZieHA7xpNQkiOHsecnlc=
X-Received: by 2002:a17:903:1987:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b5fa01a8admr419155525ad.41.1777208643501;
        Sun, 26 Apr 2026 06:04:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/9] jq: patch CVE-2026-32316
Date: Mon, 27 Apr 2026 01:03:43 +1200
Message-ID: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126617

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32316

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-32316.patch                | 55 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
new file mode 100644
index 0000000000..2f2ff2145f
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
@@ -0,0 +1,55 @@
+From 0814c321b08415c18165deac419f0d60a4a7664f Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Thu, 12 Mar 2026 20:28:43 +0900
+Subject: [PATCH] Fix heap buffer overflow in `jvp_string_append` and
+ `jvp_string_copy_replace_bad`
+
+In `jvp_string_append`, the allocation size `(currlen + len) * 2` could
+overflow `uint32_t` when `currlen + len` exceeds `INT_MAX`, causing a small
+allocation followed by a large `memcpy`.
+
+In `jvp_string_copy_replace_bad`, the output buffer size calculation
+`length * 3 + 1` could overflow `uint32_t`, again resulting in a small
+allocation followed by a large write.
+
+Add overflow checks to both functions to return an error for strings
+that would exceed `INT_MAX` in length. Fixes CVE-2026-32316.
+
+(cherry picked from commit e47e56d226519635768e6aab2f38f0ab037c09e5)
+
+CVE: CVE-2026-32316
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/jv.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 18dbb54..73387d8 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1091,7 +1091,12 @@ static jv jvp_string_copy_replace_bad(const char* data, uint32_t length) {
+   const char* end = data + length;
+   const char* i = data;
+ 
+-  uint32_t maxlength = length * 3 + 1; // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  uint64_t maxlength = (uint64_t)length * 3 + 1;
++  if (maxlength >= INT_MAX) {
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
++
+   jvp_string* s = jvp_string_alloc(maxlength);
+   char* out = s->data;
+   int c = 0;
+@@ -1151,6 +1156,10 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
++  if ((uint64_t)currlen + len >= INT_MAX) {
++    jv_free(string);
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
+ 
+   if (jvp_refcnt_unshared(string.u.ptr) &&
+       jvp_string_remaining_space(s) >= len) {
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index dfc8dda7ee..c3b547383d 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2024-53427.patch \
     file://CVE-2025-48060.patch \
     file://CVE-2025-9403.patch \
+    file://CVE-2026-32316.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 

