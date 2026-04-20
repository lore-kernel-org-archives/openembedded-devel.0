Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D25F36C36
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13765.1776666476039285489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NaPCH5f1;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so24494725e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666474; x=1777271274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8vCAKDjBfteapj4EvIIkTxzMUBifYBMD6tfeJJqBWE=;
        b=NaPCH5f1tUd16k/AdM6awyL02w4A81L/wyuZ36seFYIXzlpSRVKtPWcadGTIyAuqhp
         5il5nWG01b72UI/phL5KRMqzcxNNTyQrR7lVHmyaVPIk0E8MI/kTNQG1dyW6qCQfQQQr
         PoO0IP2odh+FPji2wfiQ8clIyOwymsfxnxIW7df0u8f1BHWfyC50ho8J6BFrOMSacmJv
         TR3Q9XqjWedMBQZRJvG1xayZpL1+WxWoK75AOPtvaQ93pbdNVrEHnnIlGvLE3qgeJNF3
         OZ+gtBwaDnf6VNFxr+37OQR60Wa6RW4X9/5nuu8ZUO570BnVrFBfCVgJr9YQiT2GiMTt
         ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666474; x=1777271274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8vCAKDjBfteapj4EvIIkTxzMUBifYBMD6tfeJJqBWE=;
        b=Xc9MKQXBmgKIkirSDIXYwQz/yNWj1uP7aiK0dJlrc8Zb+8dmemnf+BFw+VSKCfmbvp
         YiWWsY9Lro6HuAQz21uY87s2NncU9bWsAbrLzH8dyICGI0ADmo8w3VARpa5WST5851gs
         PJ3zUSd6k1oD1qucDnW8fNbcokn2iZOupiM6HlG1SKO4KVDH+SugpoSw4surFUmZQSgW
         g+mg/kuQEhPmdRynGXTIpP4hQE26V3UvD8lStCCEyQC4AphS4XfVJWEGfvuEP7LKVCzJ
         9A1mWgEZ7CE/7+zP1WYXXZvr5MEf74OO4RoAVIjqmbnUX2WvkksrbzJpG1uwrpNrWPtG
         uugw==
X-Gm-Message-State: AOJu0YyI+jzikiyyzTALvGIaulpEcNKl/7wMHkvURNcMnzqGfkLKzffb
	DYlJN1M94/inXtYXmTf5IvNG7EjAHoRAopCGAxH5qN55SoGxK22jO70fYJ07Bg==
X-Gm-Gg: AeBDiet7Jv7ozOk3G5nw+JWPd43QbwwPzY/NQWksm4orA38sdFqsilI84M8jmQnctOe
	u1guF4NLKFpFM2o+k9cyuwKy3ElolsbEvN4MAYL9yynhZub2YmZHiXm2E60ZETIgWbjUrMXri8/
	pXVc6kH4Pd/+r26JhIhcJ6Jku6bwO304HxeLUA3A7qdNxFYWwZ/9mc45RPyDfzJ69Vv247Z4ILm
	vdPCpfYWDZN+tVtsHGO3E1BCmsxdDtZQI9T1npvBxHz5jq+QI+XIms+Tkee2ZjnzhFsBshWFmNr
	aCxB6ReZdQKlNXP402wXSF8a5okvFBQvGYP7hpoary8cKKm/saif3ju2OG7maYnYj4q41EWo8KC
	TEnJAXsODPRznlVc1zEwTxzMRjvrJxSLWeapKeV0kN5WhawT0D72MeXPB9dzHf1r8E+UAtYSPna
	U67ay80TkvUN/oavRMGKxYKzydhlBqMK4=
X-Received: by 2002:a05:600c:4e14:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-4891f080a7emr19711185e9.16.1776666474325;
        Sun, 19 Apr 2026 23:27:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 04/17] jq: patch CVE-2026-33948
Date: Mon, 20 Apr 2026 08:27:36 +0200
Message-ID: <20260420062750.3795917-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126468

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33948

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

