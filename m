Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A54C52D70
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 17:06:04 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.12259.1722704763583986405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Aug 2024 10:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWtam+6b;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-690ad83d4d7so557617b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722704763; x=1723309563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj8vFz/pyixXaawXvS0UW5icU1ruZzUdog92jSiiHCw=;
        b=XWtam+6bNyB8k5gFF+99FOqpNuYnC1ou6aUR3ZLChyK0g7b+XoSE1vXss1aEmoyMvY
         BKdYAJO4jJcnLCgyTGKrxD7kvO4Ec6pq9VNAFutdBYgLNyFw+ObrrISVRxjZtKZf1qHu
         F0pkzkUmSqo92NocgzYKgG7C0bIhqrCst8M//lKWRW6j4yhe949sx2ea7889OtS/hcUW
         Oj2l4BVpJnuRKNxAY8UapL3rGDlayKo6l6jYF92Ik+0YssNafGDRpEhrYTwvM1WPGquH
         LaBqfdbKuL2tqjbyrLR882skB2ahC3i5l5qIOQeXUBjk5iaXnNJ3LUUX0H/qBs2Oz1hz
         AjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722704763; x=1723309563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj8vFz/pyixXaawXvS0UW5icU1ruZzUdog92jSiiHCw=;
        b=kV54fgHUjBA+yT19Vgeb3T8hXyqlPJcTmQH8VyNO7YsQdlPUf5RaFwMSmokBaLX4sM
         olqUQneeDc8m3eBNrBSINBQdo9n1cmLTqO+XHz3rO/3AbVF6v6MZCX5/thOR6LMv0rAs
         7bTmuFhJ6gGVfuC4QEGCkSlAf8nk75RC/e01+9SAYJp49ttAh+Qy876JBrs0WAYyUVTf
         SzqoGo5wLREh65asCMn5LI+9iYOWCIHMNJp9uWMhqGNs/uQ8V2vV0OmAdjva29ef5bQu
         qiGhcK4TJKf0hJhKzmIFjA22h0DTTXgYVGzuaGGG1K5SH/Be38mj0nWdI78p5Vo2uQPd
         7qkA==
X-Gm-Message-State: AOJu0Yw7S9BQIKVtk6AiXRtodAP7KB7UPbcLEiCx6bYpIldYXK0K3RZo
	bz/XQof+Te+pJUzoDYwg5B1Qn8qCR+goUANxVz+kOh+C4l7bIXDV0A9ryg==
X-Google-Smtp-Source: AGHT+IHE99Pxjvev0/5H5jrt+cE1d6My5SJC/CK+TzAk295fQ3jIWFiCYbGkUffOsBQVY8bASC4zSA==
X-Received: by 2002:a5b:b4f:0:b0:e0b:122c:46b6 with SMTP id 3f1490d57ef6-e0bde50eb7cmr7438468276.53.1722704762620;
        Sat, 03 Aug 2024 10:06:02 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:233c:fb4:252a:b2a5])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0be530434esm634024276.5.2024.08.03.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 10:06:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/1] python3-pydantic-core: Fix build with python 3.12.4
Date: Sat,  3 Aug 2024 13:06:01 -0400
Message-Id: <20240803170601.2119579-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240803170601.2119579-1-akuster808@gmail.com>
References: <20240803170601.2119579-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 17:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111506

From: Khem Raj <raj.khem@gmail.com>

This needs to be upgraded to 2.19+ but until then
backport a fix to keep it building.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>
(cherry picked from commit 39d164f0c33d24f40e676aac152dfe50f2c00695)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ate_self_schema-for-Python-3.12-1299.patch | 29 +++++++++++++++++++
 .../python/python3-pydantic-core_2.16.3.bb    |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
new file mode 100644
index 0000000000..f6aa18e303
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
@@ -0,0 +1,29 @@
+From 0dcca2ed6a83ebbc944ec8cbd2f67ffec8043461 Mon Sep 17 00:00:00 2001
+From: Jelle Zijlstra <jelle.zijlstra@gmail.com>
+Date: Wed, 22 May 2024 07:44:10 -0700
+Subject: [PATCH] Fix generate_self_schema for Python 3.12+ (#1299)
+
+Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/commit/a7620419383a69bd2b28ab953c9a17f6ed35bb9a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ generate_self_schema.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/generate_self_schema.py b/generate_self_schema.py
+index 8d27247..109fca0 100644
+--- a/generate_self_schema.py
++++ b/generate_self_schema.py
+@@ -189,7 +189,12 @@ def all_literal_values(type_: type[core_schema.Literal]) -> list[any]:
+ 
+ def eval_forward_ref(type_: Any) -> Any:
+     try:
+-        return type_._evaluate(core_schema.__dict__, None, set())
++        try:
++            # Python 3.12+
++            return type_._evaluate(core_schema.__dict__, None, type_params=set(), recursive_guard=set())
++        except TypeError:
++            # Python 3.9+
++            return type_._evaluate(core_schema.__dict__, None, set())
+     except TypeError:
+         # for Python 3.8
+         return type_._evaluate(core_schema.__dict__, None)
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index faa291ea6d..455df8e4e3 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -8,7 +8,8 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI += "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch"
+SRC_URI += "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch \
+            file://0001-Fix-generate_self_schema-for-Python-3.12-1299.patch"
 SRC_URI[sha256sum] = "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
-- 
2.34.1


