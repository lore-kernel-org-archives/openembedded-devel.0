Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F53F589B9
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18529.1776948543633672455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QJwwrnty;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b7adb38d65so5528215ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948543; x=1777553343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sAxLWYHMN/1KEFGUf+zBSxgWSUToCS60PPo6QWeoNQ=;
        b=QJwwrntyA6pAvDGgF1CSWveN2vFxqRxidns/ABs9PHTrY6Q8mvortWRm7TQWdk2ztx
         fnTN9Va/pfrbta+gJbkLM24pE/L5xXAIxiPLSUalbEDtKoCRUm+V7jite1B6vZdeUYwy
         9f03BdOxNLgyowkt1lRv1O3lBsS8tjK1l45+uGYMn1+3Pi/12T5eKw8hUf4IHdMmC+/U
         mEh2uq69QYBcO1CNIiOALm8wrnnIxx/kqfs2Wj9etholH3YLR0djtyt5bHTvItdfJK8/
         CkGP1thk5gy6ls20aAnbcRuygbPwD9vQezemFbOuAa5kiwv5nisFOFcSf1F/vMOZkN7Q
         hdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948543; x=1777553343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sAxLWYHMN/1KEFGUf+zBSxgWSUToCS60PPo6QWeoNQ=;
        b=kn90plKFiU8WBhXVFqaJyMVnKPeiJ+VBIwHgxUiP7n53sptO1m7C9Tze2mouXpqNk0
         FvAgO6hh5csc+R0po4BXFvxKHoTr9+o7p6OXTtvjjkk+/9ir1/JM7vpxuT2W8TbegpUI
         uoqqKY82S0yDNMkU6kWb6+wDVrp2rR9EOJ+eXwEeIpxKejhnEpv2JNglK7dJIM1mjHpf
         9NRzeaFFz5iSpMhImZs9pZIcr2KRkMbF1C4fLBhg86tvrxggmUiaFumATCMy97ey/ic/
         8W2qec0Tgm7kA6hCgnVGqyqFlnIMCrzkTMKyLErBUlTbZwWvglftHAaR7SFQN+uh7M5k
         1VBA==
X-Gm-Message-State: AOJu0YzVN+kRuyPjP1WCE6uzNfPvbJwNHCKri+LblX62e1qprTt7xKGY
	6HnjP0GsUXkOB/SJW9Lu+/SpIjHSZ4jI9IVSmlELGR4scEyN51zOkswNwvkZ60xP
X-Gm-Gg: AeBDietKUzxLLG7mgkVRM+qmjSrZG0NxpAy3iKE1NceKY8oDqn+zEwvkFdeCe2TCAdP
	caBT5YwbZ5dOoSGuEMZNNimVsmpctw328ifV30yraYJILDtAlpeGdnq2vLhev2yV4RwuLZBxpto
	f0lPUkGPbvwcuRiX1YWpAstN07wxHsmQAqbdCUSPpPnKwwSGK8pJMQrmIM8WxAwl/WlWV9WOX08
	M7Hj1I1g8FkwBFA78en5oB039GE1N7IAR90KxcxWTqGyWwp4KGc2hyWtXzMYWtnQqNhIdw7bmT7
	AnSKcULj7xpcTIxlqdXtT8aLTugHfLJc77Al0lNfhkdU6npYIi3SMx/K01ZRAmD7OfhNHjAjwnN
	GsGI8Av96UoSvYzMjbHJxnRtjyY/V42vzFG3qdaw8k2C+ubPPEKjBWS4rT5yn6GSmNizlz731BG
	kHmj2NXiNSev+YJKYhHYSg+4A2Z2zHd9SIGicb1kooiBZniyw=
X-Received: by 2002:a17:903:350c:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b5f9f8204fmr271498605ad.38.1776948542806;
        Thu, 23 Apr 2026 05:49:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 4/19] jq: patch CVE-2026-33948
Date: Fri, 24 Apr 2026 00:48:02 +1200
Message-ID: <20260423124823.1983261-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126580

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33948

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8d399af3337b25d71f8cd4308b9788ac4e88b730)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-33948.patch                | 49 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
new file mode 100644
index 0000000000..8625429c74
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
@@ -0,0 +1,49 @@
+From 19a792c4cdb6b91c056eac033ac3367af6e67755 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:46:11 +0900
+Subject: [PATCH] Fix NUL truncation in the JSON parser
+
+This fixes CVE-2026-33948.
+
+CVE: CVE-2026-33948
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/util.c   | 8 +-------
+ tests/shtest | 6 ++++++
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index bcb86da..60ec4d5 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -309,13 +309,7 @@ static int jq_util_input_read_more(jq_util_input_state *state) {
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
+index 887a6bb..a046afe 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -842,4 +842,10 @@ if ! $msys && ! $mingw; then
+   fi
+ fi
+ 
++# CVE-2026-33948: No NUL truncation in the JSON parser
++if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; then
++  printf 'Error expected but jq exited successfully\n' 1>&2
++  exit 1
++fi
++
+ exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 6df1d46f48..acea1e4b27 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
            file://CVE-2026-32316.patch \
            file://CVE-2026-33947.patch \
+           file://CVE-2026-33948.patch \
            "
 
 inherit autotools ptest

