Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A48F36C31
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14175.1776666476881003607
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j6uY8agl;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so220115e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666475; x=1777271275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaEpieJu+vaqFFOSyAogw7oA/TpHvGyArX8NLlhATQg=;
        b=j6uY8agle3V+d/hp7lFHLQz16IJwa0gc4EW60lI+3AAUU3vDuH105AeBCmYrt6019Y
         iJWYc72Nwjzy4diYttAIyJRhr+InVe4kLzWyPvA1MR4HxeNKjh40QwMunygBwjGOYFeR
         8X/qjYJWQ0wLI1peA6Vd0o11bieLBEX87D2qfxerul/leSEsBBFjJQYgyJSwelA57AFf
         M3GttBkcJ6IIU5WBANOI0VkZOD0Lx3CgRCfRt/p+o+jGwAyvSaJoKTwG9c+hawpJdyrh
         Repqc2TMQuCzowtD0Co0OIankQShNZmHdAqNdjb+2zqsGRpo6m1crZwtTW5cY4/HhEQk
         M+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666475; x=1777271275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VaEpieJu+vaqFFOSyAogw7oA/TpHvGyArX8NLlhATQg=;
        b=JrgNwOT2MYUZrAoEhg8RpZbefZSEHMRBPpcV1Aj4H8XYcFCHC28da0qtrFiu0qGik4
         /Tu1eApq3XXgWOHDe5D9JI5PdW+pMocelR6zWGfxyCgozQmPzTzMHAsZGbGh1ReiD+Zj
         gvrQWagjJomN2pOR64Iwq4fcllHXr5UROmaf6lUJ3XrvrF4m1BaAJ201ITEv8IUu4Fp0
         wiFSWDrHUBt81CQWq6gIjc1dsteCBfzQJAcn3H2Iv3ovUymvhe9iLPPLE6/iaqhQEvy+
         kfKsLR9zJXWQIyA5QHANR9TI9xFiuv5KgDLvUGYZQdHbXQ+7cRVonnj2taQUzXKrlKgc
         wabw==
X-Gm-Message-State: AOJu0YxmGZ91kFaqO5mpeNS3NHRsudFj5QStx/YbUYaK1JjFafaAM9f6
	mYZyBl0ZTzd9IWhhlERk4FT/+EC7BRWlVLpt0BE5jJ4yqt6Z/2MjEZ0F25mwmg==
X-Gm-Gg: AeBDievXlpGkKpFsvBg2VqqxiDsKrTKeTtNg9CE8UyVS5s004aUv0oNkzpiB52JedcY
	kqbgdaljWKsGg0P2wAnesSuARgizXO6tTg3So1l+gnLTXCZjJGfzc9st9+ui7+/0FikkAt0Fryg
	yQxinHB4Z+MpFKVfK0OUoQ1TxKvJpSko3lo2R3eA9fWU03CqGzZU4HBt5u9LVOxmXbfSrib0Pla
	2ZYjgOGkmGAayeIDj8EBirbtBj+P6xzilFplwbpL4cCP53CbqFO/JNEShOdaqL1TuG2HEjCnmYS
	bM8SDJehTH+AsLvpfs2nnIITPBqHTSTLEXr85fIKEIbgjqggEwaUdsqYbysEJhsIX56LlrXjimj
	5IRkjv5HxDQB+KgXEzkvFZkuVbArlTegDX8n7FG4tMxrNjwh2Y0Cil7BCkydVSAg1rNCO7EwjpN
	k5Ev5cbcrlwMyDeIcTBoAQjkCSfYHHGf8=
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr4263575e9.8.1776666475042;
        Sun, 19 Apr 2026 23:27:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/17] jq: patch CVE-2026-39979
Date: Mon, 20 Apr 2026 08:27:37 +0200
Message-ID: <20260420062750.3795917-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126469

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-39979

Backport the patch that is referenced by the NVD advisory.y

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

