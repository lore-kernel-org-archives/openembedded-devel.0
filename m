Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6DBC27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 19:50:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3132.1718221830443916076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 12:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4RD29i2;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f7274a453bso2544005ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718221830; x=1718826630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59KbvlAGCk59SgZcMhLXO/7z9osXPkot95UsytRugCs=;
        b=Y4RD29i2pNlo+dH8Mrt0SBgdzGO0YjtebvLNO8kJlXyGvymvY9JqnJEjA+W3r0YaGU
         1zL+QoESPD+mR1sQWWggj4xYt2tCr9b/+Qxv3NG02UKGK/kDr5xD7sUHC6nkV2uIJkS2
         dDCL+p6+RZLnVoCURAlDu2aMUvxuXVdx8X+y+jP7IsukDX1q5vSflTt0J/rT7g/pyrpe
         5QnfsrCze27fslDgrTI1vl91YPdbw/sOE1Mmz1VZSA29ue+Pr3VRbBiNaXzR/LtrtdVk
         gH35Gsq3ifAIa6B1cwJ45OhhtezqcwcK2YKrW0mHwALHglSHT7U0xLNfNzgTmIq0QO4f
         Fp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718221830; x=1718826630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59KbvlAGCk59SgZcMhLXO/7z9osXPkot95UsytRugCs=;
        b=TL3TQRG9Tab+H3RXk4WhnQo2XnVwnXdGk77wj7ShXtXoDTya4Ejk/tr+cw6Q9XA02S
         Lfy8/sOG511cHjEkdpq8OYAXJ77ptgXURS5if+aY6Kam1jNkxVBPryACJBThHv9seaxM
         CXHf0RqxAO9AHIpcR5Tn6muhQbkJB7XFfZE1lJCjNmzVdmBXccxaTRwStHNqUQ5xlTQ9
         U4nzmmuXgMdIY5coAD+N+UpYwlZJLU//l1ig3KFwysnfy72zMP6bUoLvbOIHLnGt4JLQ
         Yvq7xfO6LBiiniDAHyeufrNv8JzFpDIR2PMhLrr83hDsOdMvVYlcvViP8WTeRznYfcwb
         8uWQ==
X-Gm-Message-State: AOJu0YzNUeGaNeHbtn5le6o1I7dQlCOZMUzfbETNeYsDOod8Kin0ltT5
	7sI4+8LEzt7QL//Ejjd6GXUt9ZzJ2VRKIMhTVKUtfG33QU+8cWXS1fdlUQ==
X-Google-Smtp-Source: AGHT+IGeC5/ZGQ7TAvoaOh1Wf9LcVE5Zrt8rPHVi1RyZU19gI/6sgv7ELjU4bL+JgtdT4L7vMScASA==
X-Received: by 2002:a17:903:182:b0:1f6:e8ee:54a6 with SMTP id d9443c01a7336-1f83b7099eamr29555015ad.59.1718221829046;
        Wed, 12 Jun 2024 12:50:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f83e17e815sm18517955ad.29.2024.06.12.12.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 12:50:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic-core: Fix build with python 3.12.4
Date: Wed, 12 Jun 2024 12:50:26 -0700
Message-ID: <20240612195026.3806547-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 19:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110883

This needs to be upgraded to 2.19+ but until then
backport a fix to keep it building.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>
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
index f510645222..c5ce1ff110 100644
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

