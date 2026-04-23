Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2695CF589B8
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18660.1776948549627584285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cv/3Jvil;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b4583f0a1aso41835945ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948549; x=1777553349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM5NaAAxIkcwrKTrrsoZYrrn0IhHdIYsfEKgXTEYSgM=;
        b=Cv/3JviljuNQEL3P3Dt5uCVtMTnBW8eGN4lkwMwoK9d2douiZrXyC+zjLndX066glA
         Efn41YPINIlvP0uW/MLpJYaTRp/jAElxL+BLhX3pEz05p7GO+DakpxYeGuw1sgu84ncI
         nsoXlTqyg5abwW62SM6MpwFYnJ8TxCcm/WuHkqwlZKLT+25QF1zFjlGFRqRoJhHB4HD5
         B9g+aD3HASp+DnGRch0Es9X/fUCIOA9aGz/WYHmJF0P7cGaEP6EcV+itdBFJ1uYPGWbF
         uTjkeWWx5zAQ+eKi3xUduV52SCIka4TVLkVn5GLvsyOA9JTWSo36dObb91VxyBWbYFqj
         uenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948549; x=1777553349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VM5NaAAxIkcwrKTrrsoZYrrn0IhHdIYsfEKgXTEYSgM=;
        b=s2u9eQNO8XTDWFeCUnSuzDCWPyIOlbfYDnRDKXHUpeB6FvKUjG8bjdLmoHFOeqnMyJ
         DmkJ7hGaEA65PPjJfw04GspI4qXkebX8AaxkkvPoRuCxIvn1h41jxgH2rE0/3/LadWN6
         BC7vyKIJJO9AonFQcvNJ1EQiCWEknee5HSjPpStp8r310aBF3ybY8ymBNgyYVJyDpbjE
         NQua4e11TlBQKif20YR4xxY1nRnnApNasmu61XeDOkKMKB9oIE8sg3bWXmTI43mAWpxh
         2lKXxPn7uHTrVGOQ4g2XwkVEmD72Z2EgdDT4HLiElIQIb87lgMQqMQrUtmKAj28rUb4K
         UD1g==
X-Gm-Message-State: AOJu0YzznhcpTYLfWMtJfx9ygm9ny+l0JsayTeFOMwJbtAiRK5TJwcjz
	gf4Is4gihB3bYrDySJrIU8UIdDyykGLm+Stt+6P5vysIbJ2zfT01eshUmmbIihD3
X-Gm-Gg: AeBDietZfQrTbRwTvQPH7QNW35iJXTVC4a04KEe8U+/Pk9Y2xJ41P3jVSjUIxY5tkDc
	yE42sYXtJPeyz3ZIk7TQ4nNT9+D2DqsSInh1W63CiOK6FsC7nE+gmJ0g2XtzZT0zxrGEPqrNA7c
	rETWWUwkqKl28B42SWX6ZGIgFzyA/wmSlCB0hd39MA4kMsFxbrSVUyIuVpWe6V3x8TV640Kunbu
	m8h82utUN8b0agnSVtHjmQaToLd8hOoMVvN9m7SulGZQ2bv+ODJab4lulS6kUkTrHm6SjUqqWlp
	wYAiCGbPnXBy7ZGEyZLomOWRPR9cvRTdUuAreMIuzpwPWhzYYrXjb/sh+yu3gE7+E5XgLOuFuZh
	v8/oOwopSeOlSkwOhX/LYbVsOOMZOMhIZSrGSX9qJZK2Cgp8HK1pc02Zip6GK8Vb95yiSMKxWt2
	1TJLNUOQeRCGEAqaYrU0/xipACRubdfllm2Mp/M4PEUQJn8bk=
X-Received: by 2002:a17:902:7003:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2b5f9fdfb9bmr196564885ad.37.1776948548754;
        Thu, 23 Apr 2026 05:49:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 5/19] jq: patch CVE-2026-39979
Date: Fri, 24 Apr 2026 00:48:03 +1200
Message-ID: <20260423124823.1983261-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126581

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-39979

Backport the patch that is referenced by the NVD advisory.y

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2b1e34f0f51b103fa37f163cdccdeebf821ac7c1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-39979.patch                | 31 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
new file mode 100644
index 0000000000..40c57a46a0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
@@ -0,0 +1,31 @@
+From ac09f274b6c029a23e3dffc38afac819b5daacc4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:04:52 +0900
+Subject: [PATCH] Fix out-of-bounds read in jv_parse_sized()
+
+This fixes CVE-2026-39979.
+
+Co-authored-by: Mattias Wadman <mattias.wadman@gmail.com>
+
+CVE: CVE-2026-39979
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jv_parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv_parse.c b/src/jv_parse.c
+index ffcf51f..e6b8aa9 100644
+--- a/src/jv_parse.c
++++ b/src/jv_parse.c
+@@ -892,8 +892,9 @@ jv jv_parse_sized_custom_flags(const char* string, int length, int flags) {
+ 
+   if (!jv_is_valid(value) && jv_invalid_has_msg(jv_copy(value))) {
+     jv msg = jv_invalid_get_msg(value);
+-    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%s')",
++    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%.*s')",
+                                               jv_string_value(msg),
++                                              length,
+                                               string));
+     jv_free(msg);
+   }
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index acea1e4b27..026f6bfa71 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-32316.patch \
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
+           file://CVE-2026-39979.patch \
            "
 
 inherit autotools ptest

