Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E1AC27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 14:23:40 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.6672.1719671015659558474
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jun 2024 07:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z91U02L0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so2107949a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719671013; x=1720275813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQn7zYVt8+2ercIlVt+JiPP0M+vd7p7Me/zw/0TwmhE=;
        b=Z91U02L0CVMBToNgD6SFGCYucKd0s5d5o4VHYcEqRoWIabnpFBxwdhR2hFEbdMZljh
         CGqH5w9+qOeUH7CpqEkXjtg202EbnU0bPRWlNhbSY+TdL8cHnmUlNlbuoxxCd6nVE9Vk
         MixppWBdAEEpSB6fo0FNuMcyT+SrjzL43RqKhUEvkbfkQuysVJ38bkzKe9WhkaGqSVkZ
         Yzveda+LDrzUcIcwBpSHjqGOeBkvNNRlJKulqmHpNG+O0GwelUwbgYVYxeAkjKdwm0Cg
         5OTHQTMOCzlUlqbgKfC1G7BwFEBQwZkc5wOosot2EAcURD0q7fidjuMKGbO+poeeMsU9
         WcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719671013; x=1720275813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQn7zYVt8+2ercIlVt+JiPP0M+vd7p7Me/zw/0TwmhE=;
        b=NayPWecGFcQ5Sm9mEG2udp/qzLRbub/o6UvW/VJDYRi26NAjNvFoeNNEVwSbV19Jst
         RuRf0z00EHAF2055SDd3MW1TLBQKr7Df8ldQVMbmBnKjvPoMEBMEdJ43KAlHgBI2+jep
         Ho2c3YCFGNUNtqsu4h3343zpugvbx2S1Jper3vqur4KXymmo0IGz17oVZs9RiSeKXvqE
         zkQMdyhKBWXl+Gm/aS/KcWIYNWCFFKO7uiKMl3W32WJN8AsgHv+Te9D1mvc4qBMwj3fe
         TkKz4m4qV3M8CL8zftYk2hJslGc5G6nij1A4W1u2n55RpjgeR1Qh2Nb6CEFUbm3xQ3Ji
         /Qxg==
X-Gm-Message-State: AOJu0YyN2ZIuEzaAEjhnAII0ckj6sxwY2KTnJIPo00SVyavGQnk+FzxE
	UHu5NNHLQxR887gh9hmyyU4dntfTr0yrWHgRTI2Zvn/i4F27N9a5fEyXJw==
X-Google-Smtp-Source: AGHT+IH4FTVC8pBFI2uyH2zS9onKkHPjIYp2rG2NcK1A9IAN9kXPAiNTKx9kGAzwraUiFeYxAoJl5w==
X-Received: by 2002:a05:6402:11c9:b0:57c:fe38:54c3 with SMTP id 4fb4d7f45d1cf-5879fa7b3c9mr851592a12.22.1719671012830;
        Sat, 29 Jun 2024 07:23:32 -0700 (PDT)
Received: from control-center.home (164-12-20-31.ftth.glasoperator.nl. [31.20.12.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58613816614sm2275376a12.54.2024.06.29.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 07:23:32 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-sqlparse 0.4.4 -> 0.5.0
Date: Sat, 29 Jun 2024 14:23:04 +0000
Message-Id: <20240629142304.873527-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 14:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111161

Drop patch as this version supports python3.
Furthermore move to hatchling build system.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...1-sqlparse-change-shebang-to-python3.patch | 41 -------------------
 ...rse_0.4.4.bb => python3-sqlparse_0.5.0.bb} | 12 +++---
 2 files changed, 6 insertions(+), 47 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.4.4.bb => python3-sqlparse_0.5.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
deleted file mode 100644
index 0c9f29a6b..000000000
--- a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f236a30dc8528b6f114201580f1efdcc1c447d43 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 9 Mar 2020 13:10:37 +0800
-Subject: [PATCH] sqlparse: change shebang to python3
-
-Upstream-Status: Pending
-
-Don't send upstream since upstream still support python2,
-we can only make this change after python2 is offcially
-dropped.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- sqlparse/__main__.py | 2 +-
- sqlparse/cli.py      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
-index 2bf2513..6a3a115 100644
---- a/sqlparse/__main__.py
-+++ b/sqlparse/__main__.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2009-2020 the sqlparse authors and contributors
- # <see AUTHORS file>
-diff --git a/sqlparse/cli.py b/sqlparse/cli.py
-index 7a8aacb..9c727e8 100755
---- a/sqlparse/cli.py
-+++ b/sqlparse/cli.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2009-2020 the sqlparse authors and contributors
- # <see AUTHORS file>
--- 
-2.41.0
-
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb
index c04971ee8..e10c97d77 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.0.bb
@@ -4,18 +4,18 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
-            file://run-ptest \
-	    "
+SRC_URI:append = " \
+    file://run-ptest \
+"
 
-SRC_URI[sha256sum] = "d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c"
+SRC_URI[sha256sum] = "714d0a4932c059d16189f58ef5411ec2287a4360f17cdd0edd2d09d4c5087c93"
 
 export BUILD_SYS
 export HOST_SYS
 
-inherit pypi ptest python_flit_core
+inherit pypi ptest python_hatchling
 
-RDEPENDS:${PN}-ptest += " \
+RDEPENDS:${PN}-ptest += "\
     python3-pytest \
     python3-unittest-automake-output \
     python3-unixadmin \
-- 
2.34.1


