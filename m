Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C327C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 07:05:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.37740.1691737545340634776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 00:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d+zfkBvd;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-687ca37628eso1535539b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 00:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691737544; x=1692342344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J65dr4Q4K+e6QAZUwAKfOIeFAdNDE4xaKuBsbSymV3s=;
        b=d+zfkBvdF9wV44kQm0vHjkExXsw2sb9nmkCzeQmXVzQPcFBXSojKb96u3yD6oFkYxo
         uwLhlahQyU8GPlHeEycTFn2dhJIMUZuWeyyeN/8CD0xV8zxFy/Mw8kUrz/EE2x8cTrqS
         jNABdJVuk/X8m3em49lLG8OX7pGW9jG2nmFpt/6NeI7qBfUr6FlLfePtIyQ5rRnL/LHj
         4Q5kL8U4omEViAmwCQj+nOx0OGRwbjroTQRI4Vanm3BXpHAguqX4LnKVMYrarQFFAK//
         PSPGhK+gzpCNYhqjuowsyA4pfu3EJ0j1WblJcINAvLAbv1xXYuAnlrNWZre4pN0LLp4M
         Sj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691737544; x=1692342344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J65dr4Q4K+e6QAZUwAKfOIeFAdNDE4xaKuBsbSymV3s=;
        b=GWDsnFuzao0nMQYnqnm0PyvpVElc9Fz7NSD15RKCI9H4ZtD5EEC2fxBJGWAy9eh3Lg
         SvUkfTjwo2QBXWxrSHMw2FDZM41lu+Iu0IcRCpDEvANjGy+KkXxUoWH4gQJcG5MhfA9o
         1czPstoMUHRJGXnFhrzRLetHQYbEkscbAnrROZnIwYB33aAypJQxqrgPM+EAfbjy5CJc
         nFBA/NREnGVYxS7Yx2OsZH2VRSr4HbcdniG5ALxiI9SSTvljvAIZLtid5Vo2Yg9oQzXq
         IYgElmUwZZ8cxUWhCbJc90OVxBup5oyh5FsO5//11bzJDDnYqe/Bj2kF2w9Q26SPcehj
         mhRA==
X-Gm-Message-State: AOJu0YySj73Eqv+5mh1onDvMA2tQCKRCyDGjBqCVZQ5Bp05ZW8ePElNF
	vW2GVL3FoOsE/pJOc/Xa9fccePKfgSAQEg==
X-Google-Smtp-Source: AGHT+IFhFmTR6+UUYlT3t63c0Aei8DAO8n/hWT5WQcoLknFi/Y6pnBPcUCxwJrFYRhiXItkqqPSXpA==
X-Received: by 2002:a05:6a00:2ea4:b0:675:8f71:290a with SMTP id fd36-20020a056a002ea400b006758f71290amr1392575pfb.34.1691737544205;
        Fri, 11 Aug 2023 00:05:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id a14-20020aa780ce000000b006829b27f252sm2705461pfn.93.2023.08.11.00.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 00:05:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] qad: Fix build with clang
Date: Fri, 11 Aug 2023 00:05:41 -0700
Message-ID: <20230811070541.709014-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 07:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104333

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Fix-warnings-found-by-clang-compiler.patch | 53 +++++++++++++++++++
 meta-oe/recipes-extended/qad/qad_git.bb       |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/qad/qad/0001-Fix-warnings-found-by-clang-compiler.patch

diff --git a/meta-oe/recipes-extended/qad/qad/0001-Fix-warnings-found-by-clang-compiler.patch b/meta-oe/recipes-extended/qad/qad/0001-Fix-warnings-found-by-clang-compiler.patch
new file mode 100644
index 0000000000..7a9937d685
--- /dev/null
+++ b/meta-oe/recipes-extended/qad/qad/0001-Fix-warnings-found-by-clang-compiler.patch
@@ -0,0 +1,53 @@
+From 2e871d6d6d13955ff363ff756adfdd257e72e9e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Aug 2023 23:58:43 -0700
+Subject: [PATCH] Fix warnings found by clang compiler
+
+Fix diagnostics found with -Wdeprecated-non-prototype using clang
+compiler
+
+e.g.
+| ../git/src/server.c:108:35: error: passing arguments to a function without a prototype is deprecated in all versions of C and is not supported in C2x [-Werror,-Wdeprecated-non-prototype]  |   108 |   if (backend->input_backend->move(x, y, event) < 0) {                                                                                                                              |       |                                   ^
+
+Upstream-Status: Submitted [https://gitlab.com/CodethinkLabs/qad/qad/-/merge_requests/33]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/backend.h                 | 8 ++++----
+ src/backends/input/input_common.h | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/backend.h b/include/backend.h
+index 8f4c7c1..4bfe510 100644
+--- a/include/backend.h
++++ b/include/backend.h
+@@ -41,10 +41,10 @@ typedef struct qad_screen_buffer_s {
+ } qad_screen_buffer_t;
+ 
+ typedef struct qad_backend_input_s {
+-  int (*move)();
+-  int (*button)();
+-  int (*touch)();
+-  int (*swipe)();
++  int (*move)(int, int, int);
++  int (*button)(int, int);
++  int (*touch)(int, int, int, int);
++  int (*swipe)(int, int, int, int, int, int);
+   void *data;
+ } qad_backend_input_t;
+ 
+diff --git a/src/backends/input/input_common.h b/src/backends/input/input_common.h
+index 8e099a5..f2ea73f 100644
+--- a/src/backends/input/input_common.h
++++ b/src/backends/input/input_common.h
+@@ -28,7 +28,7 @@
+ #define BTN_DOWN 1
+ #define BTN_UP 0
+ 
+-qad_backend_input_t *create_input_backend();
++qad_backend_input_t *create_input_backend(char input_type[]);
+ 
+ // int move(int x, int y, int event);
+ 
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
index e2a59139d9..056f28a0a4 100644
--- a/meta-oe/recipes-extended/qad/qad_git.bb
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -9,7 +9,8 @@ LICENSE = "MIT & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=402cce7fbcb6ea9ab5a0378dd7f40806 \
                     file://openqa/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
-SRC_URI = "git://gitlab.com/CodethinkLabs/qad/qad;branch=main;protocol=https"
+SRC_URI = "git://gitlab.com/CodethinkLabs/qad/qad;branch=main;protocol=https \
+           file://0001-Fix-warnings-found-by-clang-compiler.patch"
 
 SRCREV = "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
 
-- 
2.41.0


