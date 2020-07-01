Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.10712.1593562044805038771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXFqHVcr;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k1so9170630pls.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6MQ9P2E3WytXOKMJzXrQvwO22RszVnOVo/7lkfsYFRs=;
        b=UXFqHVcrVXP/NsGU8LtVtMH0I4fiH5sEuKPdsRNwwHP8AMolgAxsAiykrah2HOTuwH
         eAmccRBf2UJ5MsYaQ2w0Z5jcWMrAcalDSgB2+CnMcj5yEVniUDpMT3tO+REQe6d5WZO6
         NHRQSYyGuhEidpP0fwNU9Rypas82Q10C1lzbQR2nzV2duRYORBegWBeR1XLdup60HFT6
         V17AFdnyOaPWaz6HyJfb+cQdES/ClfdH6mcadwj5gSx3596s4Do7vvrUsHUD/8VYkDWR
         LnQR0hhSKUwwlVNGWDZjTFLxtMMZePgSLG2AS5OJv1usEsK0/39l1Xhinx5gkECKswzY
         MmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6MQ9P2E3WytXOKMJzXrQvwO22RszVnOVo/7lkfsYFRs=;
        b=tAGReewXVT2Y/+ubMDJEftDp6POT1WyZ+95QSlKVenONI8EdbBIn7+jDC8LZOU6XW+
         M7M/hSS2tjqWJLfxGeqy+kJrUbJUdZchvoK8QgFra4NHvPEbsc2Rw/4saanwps9B8DnV
         LL29t5JLMxwLw2sbI3roevTUeJ379gXmCKbfBaEJOjlD4oy7MvzqVELmZ2G/EcRBRvtt
         G37yfjKfo/BtBnoKS208gipQADuwxOmiVz5AwPU6Ys/nf3EJs7ImWRTFKfeOjEsNuK6R
         ah1/AQxDdg5sxqBSoonUXPY4K3Z2WXmN2ptWE2XDQEpOGuoDGg/wnbc/diNiXpPZ9b42
         SW2w==
X-Gm-Message-State: AOAM533O1lDGLbDeq7kC6hMe4KOfJaEKEZVha1G/YnJdwjeY+SM3MM3b
	ct6be0WCqb6amY2OgT7RTS9vy8OLmxk=
X-Google-Smtp-Source: ABdhPJzCsYlFm9U/beSlCY4HKiKeHBridA3BjksG1ZHw5Ym/DHcRIiaMf/4QJyyViJqlLzL15DxZkA==
X-Received: by 2002:a17:902:9683:: with SMTP id n3mr19300417plp.311.1593562043997;
        Tue, 30 Jun 2020 17:07:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 01/32] zchunk: upgrade 1.1.5 -> 1.1.6
Date: Tue, 30 Jun 2020 17:06:46 -0700
Message-Id: <76110e9505882529827b614a6187435af8ca0b6d.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

- Remove patches already in version

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d3e33a705a0bf36fe2876ae59e1bfed0f52e27e1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../zchunk/0001-zck.h-fix-build-on-musl.patch | 39 ------------
 .../0002-unzck-fix-build-with-musl-libc.patch | 61 -------------------
 .../{zchunk_1.1.5.bb => zchunk_1.1.6.bb}      |  8 +--
 3 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb} (66%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch b/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
deleted file mode 100644
index 64e0e8ed61..0000000000
--- a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 78247d478cec254bad27f4ed97b532f4f54bf1b0 Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Thu, 23 Jan 2020 19:14:40 +0100
-Subject: [PATCH 1/2] zck.h: fix build on musl
-
-The ssize_t type requires the <sys/types.h> header. This fixes build with musl
-libc:
-
-include/zck.h:68:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
-   68 | ssize_t zck_read(zckCtx *zck, char *dst, size_t dst_size)
-      | ^~~~~~~
-      | size_t
-include/zck.h:81:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
-   81 | ssize_t zck_write(zckCtx *zck, const char *src, const size_t src_size)
-      | ^~~~~~~
-      | size_t
-      
-Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/23]
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- include/zck.h.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/zck.h.in b/include/zck.h.in
-index 91d2557..b847576 100644
---- a/include/zck.h.in
-+++ b/include/zck.h.in
-@@ -5,6 +5,7 @@
- 
- #include <stdlib.h>
- #include <stdbool.h>
-+#include <sys/types.h>
- 
- typedef enum zck_hash {
-     ZCK_HASH_SHA1,
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
deleted file mode 100644
index a1c95bf362..0000000000
--- a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 72c55e3da59eccdfea3778d11f83862b58af723d Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Thu, 23 Jan 2020 22:42:40 +0100
-Subject: [PATCH 2/2] unzck: fix build with musl libc
-
-On musl libc "stdout" is a preprocessor macro whose expansion leads to
-compilation errors.
-
-Fixes:
-
-| In file included from ../git/src/unzck.c:31:
-| ../git/src/unzck.c: In function 'parse_opt':
-| ../git/src/unzck.c:78:24: error: expected identifier before '(' token
-|    78 |             arguments->stdout = true;
-|       |                        ^~~~~~
-| ../git/src/unzck.c: In function 'main':
-| ../git/src/unzck.c:141:20: error: expected identifier before '(' token
-|   141 |     if(!(arguments.stdout)) {
-|       |                    ^~~~~~
-
-Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/23]
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- src/unzck.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/unzck.c b/src/unzck.c
-index 8d6c62a..002492c 100644
---- a/src/unzck.c
-+++ b/src/unzck.c
-@@ -58,7 +58,7 @@ struct arguments {
-   char *args[1];
-   zck_log_type log_level;
-   bool dict;
--  bool stdout;
-+  bool stdOut;
-   bool exit;
- };
- 
-@@ -75,7 +75,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
-                 arguments->log_level = ZCK_LOG_DDEBUG;
-             break;
-         case 'c':
--            arguments->stdout = true;
-+            arguments->stdOut = true;
-             break;
-         case 'V':
-             version();
-@@ -138,7 +138,7 @@ int main (int argc, char *argv[]) {
-         snprintf(out_name + strlen(base_name) - 4, 7, ".zdict");
- 
-     int dst_fd = STDOUT_FILENO;
--    if(!arguments.stdout) {
-+    if(!arguments.stdOut) {
-         dst_fd = open(out_name, O_TRUNC | O_WRONLY | O_CREAT, 0666);
-         if(dst_fd < 0) {
-             dprintf(STDERR_FILENO, "Unable to open %s", out_name);
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
similarity index 66%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
index f75412f49e..e041132b1c 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
@@ -4,13 +4,9 @@ AUTHOR = "Jonathan Dieter"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
 
-SRC_URI = " \
-	git://github.com/zchunk/zchunk.git;protocol=https \
-	file://0001-zck.h-fix-build-on-musl.patch \
-	file://0002-unzck-fix-build-with-musl-libc.patch \
-	"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
 
-SRCREV = "c01bf12feede792982f165f52f4a6c573e3a8c17"
+SRCREV = "f5593aa11584faa691c81b4898f0aaded47f8bf7"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.17.1

