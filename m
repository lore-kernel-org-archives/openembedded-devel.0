Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D43FF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18287.1777208650362984227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ncz1LSD7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2ea1b3962so53481845ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208649; x=1777813449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxUOvWEVG9kIcN9JhwvbfddG0jNqXRm0Ekf/Tr3qvak=;
        b=ncz1LSD7sRXwCjJa0RRaZLTE1rqtMlsUUXRYYdZxyAE3D6bmTuz9vhN/tipWBswl1j
         mhK9gZExLiUIzbSd+qhUhOeLzzjeDkYNL9DOyw8SXeiVRj0kgoHZiE576FopeT2NBPXJ
         N60yUgUjn8UCkRyCZqEm5+Z2GMsyeRVzZ7HDiWH4F8eyqxxpw7GlQGJ85s3e06kVOIbf
         3jZ0QcaA35ie3mRBK1H+Yo8plsYWQXW8TEYHeo2fu922UEPkhG7XBLv7xMSXbO5lbR0P
         rS9yqKP9n/zG/zIuMju7haIzXsQb0ab0ZCDcKgECBHNA23n8Txc8gEJWQ72aR5Y6m2P1
         8RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208649; x=1777813449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JxUOvWEVG9kIcN9JhwvbfddG0jNqXRm0Ekf/Tr3qvak=;
        b=qCVqhqLgISaZNqbvp1pKR5HeFpUz2hcHvLCfLjot6rmHShTy5ACSo2zlUSdxQ5+6GT
         94ZlmXWtQf5Y7bEajX3sMOXeeBAVTFTWzTayqjQ1Fn50Fzs8HulLZ6BtrK88YVA+6+lb
         hBJ2dSNQEdoxUqWI164sAV7FXm2gYDCITt4ATszu7GmxhQ8jc4Vm7Ns6x7OlkjQscYhn
         XqKvPHpnSb6MOZJmXUchRjqcwWsS3lfq/BOnr1m+AeHyrbJw61zIvTjHW/roOIsQIy6X
         LBeQgjIyKrbk1xOWCCu9DWXM9EFz7w/KOPRrJWlnXeQKTbuw5H9T2QCgBkLEmzPcDo2r
         cUQg==
X-Gm-Message-State: AOJu0YygNCP05+++J3JLj2/Mnzx0ukQV9FbZMZErqK0gcnZPLsBjUKUM
	NuqF8tsG3GSoQNleaGRWrx1dif6lNIpq4nqeqvkXEvxA2f5YgyttCTjt75zZ0NxJ
X-Gm-Gg: AeBDieti+Qf4Q9dtsE6SI/z2U7tFsqUp4kDWHYeh+YvtPO1XSyR5+NUq9LozlX6Z4sQ
	BAp/oVtmFPMzE2E04HbEkpw29F72CdyXY13k4/6EvqOFCjb0M8w0QEY9/nFMrtnHpIHlf09F25J
	zRxYsrEsHoPXHvdyJCDLa8N5JfBZgeTXc1ePP0xaKN6hsaED93q2m/DjR1BIUCWm5mP33jX4JiN
	nyZD5tA9FOXB20Cs6GaSpHoke9elKyG6ddLJhRIGt0JPjhIl+5LDE2YjuDiWsLOanqDW6DVOZ/o
	6Ne/xX/EpoI2V/SjmrRUrFuMkbbeDKnrDs3RoG+EV54W7ngXPLfFTCjsuEchWGprzpiSe8PAqej
	cAQpMjf5O2F2egJjjtijoeZ3ee1qEzeabHZzBXgyqfWXMU19CB0egMCvmwAuIOmDJj7FARamEfn
	riyofuZUbgopOcXz56IVQtS1Tf1ed2WIx4fgiVSNd8xnqjVzw=
X-Received: by 2002:a17:902:be10:b0:2b0:6f21:8289 with SMTP id d9443c01a7336-2b5f9f7d451mr285044645ad.25.1777208649321;
        Sun, 26 Apr 2026 06:04:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/9] jq: patch CVE-2026-33948
Date: Mon, 27 Apr 2026 01:03:45 +1200
Message-ID: <20260426130351.793052-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126619

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33948

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-33948.patch                | 51 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
new file mode 100644
index 0000000000..a2aabec059
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
@@ -0,0 +1,51 @@
+From 4676c3e5675ba6e8422b021375acbd7c0ba450b0 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:46:11 +0900
+Subject: [PATCH] Fix NUL truncation in the JSON parser
+
+This fixes CVE-2026-33948.
+
+(cherry picked from commit 6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b)
+
+CVE: CVE-2026-33948
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/util.c   | 8 +-------
+ tests/shtest | 6 ++++++
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index de44fa6..422a8b8 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -311,13 +311,7 @@ static int jq_util_input_read_more(jq_util_input_state *state) {
+       if (p != NULL)
+         state->current_line++;
+ 
+-      if (p == NULL && state->parser != NULL) {
+-        /*
+-         * There should be no NULs in JSON texts (but JSON text
+-         * sequences are another story).
+-         */
+-        state->buf_valid_len = strlen(state->buf);
+-      } else if (p == NULL && feof(state->current_input)) {
++      if (p == NULL && feof(state->current_input)) {
+         size_t i;
+ 
+         /*
+diff --git a/tests/shtest b/tests/shtest
+index a471889..0397ca0 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -609,4 +609,10 @@ $VALGRIND $Q $JQ . <<\NUM
+ -10E-1000000001
+ NUM
+ 
++# CVE-2026-33948: No NUL truncation in the JSON parser
++if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; then
++  printf 'Error expected but jq exited successfully\n' 1>&2
++  exit 1
++fi
++
+ exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 7b7910bc72..975d7d7007 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2025-9403.patch \
     file://CVE-2026-32316.patch \
     file://CVE-2026-33947.patch \
+    file://CVE-2026-33948.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 

