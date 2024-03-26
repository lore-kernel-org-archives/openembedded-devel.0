Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D309EC54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.9271.1711417854770455562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ph0fRG1u;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dff837d674so39213615ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417854; x=1712022654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDYTEHgS6Wlg5HqhB7RB1mSNgGt+KRyGZPWqnbDl+8k=;
        b=Ph0fRG1uG7x+0WVBgFpsKVWr3enJErQndN9Z9yAIx/wraIxLmdeKGUzXuj81Vg2Jgx
         Xu0qMbhQRI7GrXuagdcRLbX/wpF9ctmgqT4LLRVgerrhLlNf8nJWdqdibg9xYsfC2OfY
         TotpKA2B+OxfoGf6XH9JtVCVx9wAvdURF5vLg+L729fXg2pY9eUpEM/9AN3a7L+ZeHhN
         IsAHeW02YxqNtl+EWO1gQuWCQZOhSC11YJRPWXLK9oFEztrp8RzCMe66GXwur52pnT3A
         wkJsABpQf2GK0XT5vSUuqfe2j5eOEN6elRUjcT3/UCwBEfiXkQYlHmjrSUQ1Vpc2a73Q
         RVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417854; x=1712022654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDYTEHgS6Wlg5HqhB7RB1mSNgGt+KRyGZPWqnbDl+8k=;
        b=r8YQN4aEbUyQ+rve9gCPvm1fvil94k3ZAveZdKDx7Qe68/iKyX5KmKpWLVw/VcBGIM
         Q8eKug1PZ1D5dj5mULHhev/y4qflx3/JlGyIfSajFgUKkR87rpbI0j+VTjZ9fXj5JOp8
         XKg6+MhX/ONN96tU9RpUOQ/GCQAOvtyer923zxQLRxdx8/DvVjjZdTnefTT6Ny1ibT1C
         OgRm76TiQJqMYSe31ZeZiUoaf67+0sa+aCI1cUSFpkgm1UBCy0W5RZWZpGpdscF2467N
         2jCjbFnIMUqaHnuvuMJtXeDBd/eRi0cVK20vx7Q8FxKPEc+cGdP2vBmYdDn+oYbp7JDA
         jO3w==
X-Gm-Message-State: AOJu0YyUrNUmXvTYXpfH7ey1Z8oJEVu7uN5SLpTtqNrsjvUBSk1bm8iW
	dYMUVJ2HoWl3A8tWaSEjXy0enNGpgqD1CplXn2rForEp/DpGFlZw1jRqR7RV
X-Google-Smtp-Source: AGHT+IFdr5dvTFrYXNtUUFunxcQ7fdn+1geZjyaaNPgqeGbKZXvByH1bWS/Kk9W5sla3lp8DDpnEug==
X-Received: by 2002:a17:902:e841:b0:1e0:cd8b:1352 with SMTP id t1-20020a170902e84100b001e0cd8b1352mr2906296plg.57.1711417853912;
        Mon, 25 Mar 2024 18:50:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/10] wtmpdb: Upgrade to 0.11.0 release
Date: Mon, 25 Mar 2024 18:50:40 -0700
Message-ID: <20240326015047.543274-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109614

Brings these changes

wtmpdb last: support matching for username and/or tty
last: add support for time-format option

Drop lto patch as it has been fixed differently.

Add a patch to fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 ------------------
 .../0001-include-libgen.h-for-basename.patch  | 32 +++++++++++++++++++
 .../{wtmpdb_0.9.3.bb => wtmpdb_0.11.0.bb}     |  5 ++-
 3 files changed, 34 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
 create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
 rename meta-oe/recipes-extended/wtmpdb/{wtmpdb_0.9.3.bb => wtmpdb_0.11.0.bb} (90%)

diff --git a/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch b/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
deleted file mode 100644
index ef188e7a15..0000000000
--- a/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-error-of-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9840939789dec9153150e8f9ae34de4171a5c15e Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 19 Jul 2023 07:31:32 +0000
-Subject: [PATCH] remove lto to fix link error of clang
-
-error message:
-| tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format not recognized
-| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Upstream-Status: Pending
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 6fe8045..166a15b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -28,7 +28,6 @@ add_project_arguments(['-D_GNU_SOURCE=1',
-                        '-D_TIME_BITS=64'], language : 'c')
- 
- possible_cc_flags = [
--                  '-flto=auto',
-                   '-ffat-lto-objects',
- 		  '-fstack-protector-strong',
- 		  '-funwind-tables',
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..766865e27b
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,32 @@
+From 32f99ce7e890a457af50606ea7b577659a2a790a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 17:35:07 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/thkukuk/wtmpdb/pull/11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/wtmpdb.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/wtmpdb.c b/src/wtmpdb.c
+index aac7b5b..eaffae6 100644
+--- a/src/wtmpdb.c
++++ b/src/wtmpdb.c
+@@ -30,6 +30,7 @@
+ #include <time.h>
+ #include <ctype.h>
+ #include <errno.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
similarity index 90%
rename from meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb
rename to meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index 6d23c00707..785ae50e9e 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -5,11 +5,10 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "8ef2677a13d19aee3a834500f9c8a4dac9d68ef7"
+SRCREV = "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
 
 SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
-           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
-"
+           file://0001-include-libgen.h-for-basename.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


