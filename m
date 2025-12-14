Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02125D3E787
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 10:44:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23416.1765709082975349850
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 02:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cGUC4WRQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0a95200e8so5301945ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765709082; x=1766313882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Gj/sdzlJ2JhZ84qd+dGH6sCe5vdBq7OyNByM0t4ixE=;
        b=cGUC4WRQjR6VuSYlNZ7GJys6d+VjM8I4IbAkrSeauHU5PjdCS0/Miwg09fMGsI/A1Z
         UvfVKFmxPSxU13HiK5TYYrnJb78Pi92bEbJDUzgGyRlq6TYRtCUtVH0AJvUYLHSun/zR
         7jwhTGKmdKr6B/KXp5WGNKx9Zh2IGq0B2A0Iq/OwziVEODxN7JJ99L+s757ugLi19NyO
         6WyQzSDABuBiQF47PBvQlacP0F92jym68cyRaAdCQxgojPh74a0E+kutJndgzCb+pVoQ
         gED9yE37rWxbc3Zmlq8f0dHgQi2sDxOZ2Be2bQAbKZQjF7gfMfeH31UyRESmo9eboiMy
         /kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765709082; x=1766313882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Gj/sdzlJ2JhZ84qd+dGH6sCe5vdBq7OyNByM0t4ixE=;
        b=kWA8z+XX6D/VSc6XCFdsPHkBTconOBw0p7rOna/VusZSWLMWHCxNf/wJETZEYtMiaM
         GhbxcY/nmmuaEGfSpbwU4c17Z8+UxXLzG06VyJxiIleBoAKRkHnZ8Cuwrp4N1eXBk/Zr
         bPkzZKuyCXtJmPKpJZNX+0oalaqFfHEEom/4HtqpblQb/Llv6CqYJezB8TyVJsO9QGE7
         2IWSVqM6p0JGddckbRcOrTP/QI3hatTAgD5LfbEqNCZDfz7yCzp2qTNOZe1ZejlaaJQd
         sv6oIpTCtvd83zNFuwvXmTOQ18dtuW+KoDAlcCI3N7iKVhm+PfF0wl95R2f/9beCLkDp
         nVBg==
X-Gm-Message-State: AOJu0YyvexFdSqNiKS6WduR0g94hsuHUf1ZY8hgqf847GwhEXfoytRd2
	7iAFo9dssV2QvTtP7h3SsAslhQTzVKq5Jg8z45Eb8KU1PHxbxXDcQYzRh619csRh
X-Gm-Gg: AY/fxX45WiV/WjWNPgTGxo28Kmomj415kRPC4knMARCKWDC+Sv+0kMpSZwWYOd1l7CJ
	RVw9fjvJ2LxX6sipQEI3r666VfYeuUuCRSsHE078ENR8DBknQ3QZlcLfJvILUD2Zlm862/3RQdd
	ucmW8lrfs63ffL4JwZC+co0kvLgud/dSwvxc+a0SwPDBrs3d/8IxhPoOTRFBn3ltDlv2lWGUk/0
	c8Emd3aEKVm0CWW1OOnXHKlLYvhmzehcM9v7g6Ra5VI02AVK0YSecShLIxpGT/c3/kgtb243Zx/
	QmYIh3Tfe+mybhptjLhIsJEMB+17o9WZm4ovke5Q77DOfEAQXgkXvqWCuZEz28wabH1cyVPbuKG
	6twGKlhR9quh4J9E2bas7BBvgPKXZd2zNiXBd3IMHR/zyaDpCmXoWeuEIRoMMU08wBzd1cnoW3U
	3pBXB40GNc1DJJaIVDsGeqjSZZpPONookDzPoNX31nUqOn0HGRQUGO2CIeCQDMYSsFUxPQS813c
	Rz15ckQTCGrwbVlvmb8T4zgLrx2fWoA
X-Google-Smtp-Source: AGHT+IFG+STmDZDBhSm6nVq1rYbeEs+HTsxk+E2BaolX6qfPIUb8BhmIS2nM0LeUZ5cjsaCKVB21Dw==
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11f34bde21bmr5169242c88.8.1765709081701;
        Sun, 14 Dec 2025 02:44:41 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm33026160c88.8.2025.12.14.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 02:44:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] geany-plugins: Delete unused patches
Date: Sun, 14 Dec 2025 02:44:36 -0800
Message-ID: <20251214104439.1085235-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 10:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122647

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-tinker-with-pkg-config-paths.patch | 32 -----------------
 ...bar-Adjust-structs-for-libgit2-1.4.x.patch | 36 -------------------
 ...e-Use-0-instead-of-NULL-for-gboolean.patch | 34 ------------------
 3 files changed, 102 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch
 delete mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch
 delete mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch
deleted file mode 100644
index cd417e0d7b..0000000000
--- a/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b2187b45f61ce362a9d58d9081d66daddb4e577f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Mar 2022 15:54:14 -0700
-Subject: [PATCH] geany.m4: Do not tinker with pkg-config paths
-
-OE sets up these paths correctly w.r.t. target sysroot
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/geany.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/build/geany.m4
-+++ b/build/geany.m4
-@@ -32,7 +32,8 @@ AC_DEFUN([GP_CHECK_GEANY],
- [
-     AC_REQUIRE([PKG_PROG_PKG_CONFIG])
-
--    GP_GEANY_PKG_CONFIG_PATH_PUSH
-+    dnl GP_GEANY_PKG_CONFIG_PATH_PUSH
-+    AC_REQUIRE([_GP_GEANY_LIBDIR])
-
-     PKG_CHECK_MODULES([GEANY], [geany >= $1])
-     geanypluginsdir=$geany_libdir/geany
-@@ -40,5 +41,5 @@ AC_DEFUN([GP_CHECK_GEANY],
-     AC_SUBST([geanypluginsdir])
-     AC_SUBST([GEANY_VERSION])
-
--    GP_GEANY_PKG_CONFIG_PATH_POP
-+    dnl GP_GEANY_PKG_CONFIG_PATH_POP
- ])
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch
deleted file mode 100644
index fe2d9f54ba..0000000000
--- a/meta-oe/recipes-devtools/geany/geany-plugins/0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 90c46235ad69a411d83a5e978492421e8e378934 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 18 Feb 2022 23:35:58 -0800
-Subject: [PATCH] git-changebar: Adjust structs for libgit2 1.4.x
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- git-changebar/src/gcb-plugin.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/git-changebar/src/gcb-plugin.c b/git-changebar/src/gcb-plugin.c
-index f8ce20c..4488b22 100644
---- a/git-changebar/src/gcb-plugin.c
-+++ b/git-changebar/src/gcb-plugin.c
-@@ -216,7 +216,7 @@ static int
- gcb_git_buf_grow (git_buf  *buf,
-                   size_t    target_size)
- {
--  if (buf->asize == 0) {
-+  if (buf->reserved == 0) {
-     if (target_size == 0) {
-       target_size = buf->size;
-     }
-@@ -234,7 +234,7 @@ buf_zero (git_buf *buf)
-   if (buf) {
-     buf->ptr = NULL;
-     buf->size = 0;
--    buf->asize = 0;
-+    buf->reserved = 0;
-   }
- }
-
---
-2.35.1
-
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch
deleted file mode 100644
index bb03fa63de..0000000000
--- a/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9ee9388bc66e6cf68db96b2014dca2115f745dc9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Aug 2022 22:33:46 -0700
-Subject: [PATCH] scope: Use 0 instead of NULL for gboolean
-
-Fixes warnings with clang 15+
-
-scope/src/stack.c:168:11: error: incompatible pointer to integer conversion initializing 'gboolean' (aka 'int') with an expression of type 'void *' [-Wint-conversion]
-        gboolean entry = NULL;
-                 ^       ~~~~
-1 error generated.
-
-Upstream-Status: Submitted [https://github.com/geany/geany-plugins/pull/1191]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scope/src/stack.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scope/src/stack.c b/scope/src/stack.c
-index b03909fe..041dd415 100644
---- a/scope/src/stack.c
-+++ b/scope/src/stack.c
-@@ -165,7 +165,7 @@ void on_stack_follow(GArray *nodes)
- gboolean stack_entry(void)
- {
- 	GtkTreeIter iter;
--	gboolean entry = NULL;
-+	gboolean entry = 0;
-
- 	if (gtk_tree_selection_get_selected(selection, NULL, &iter))
- 	{
---
-2.37.3
-

