Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.35084.1591012314979139757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=gm6RRA0N;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id E6FB060057;
	Mon,  1 Jun 2020 13:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591012312;
	bh=ncR9PC9A4ezoroHDEqDgUQfxXASWqKh2Nh3EC5yWRg8=;
	h=From:To:Cc:Subject:Date:From;
	b=gm6RRA0NZ+gKBaoMRQJRvAV4m+2m+fCIRSwv7D9ALjQSZDypyPOaY3fLJMCA3LQgG
	 d4oQjgnk8EctgLDDXu/gGWw31iWRKcWw8esOnkwHJv6BrjB3Ht2G80QD6VuiXVPuUh
	 wr4mqoeIeFR1kHLFNbZ07gBvKlbOon4dBeE2qTIX74xH55EHLl77ol6wRPWj76yU/p
	 uSkRJSt8RhgiibMsdemkwuDdG2uTyPrT4e9/YhqdYhQ30kBnsjhLPlbAb3QBzTFAlM
	 +RmFoKf9YWAjKHO4yyL86CgZNDWZbMJv/6t71fdmhfc1C3+tBL1geaVKnBmKzQz0jF
	 XVpdbANi6PJNw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] zchunk: upgrade 1.1.5 -> 1.1.6
Date: Mon,  1 Jun 2020 13:51:14 +0200
Message-Id: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

- Remove patches already in version

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../zchunk/0001-zck.h-fix-build-on-musl.patch      | 39 --------------
 .../0002-unzck-fix-build-with-musl-libc.patch      | 61 ----------------------
 .../zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb}    |  8 +--
 3 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb} (66%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch b/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
deleted file mode 100644
index 64e0e8e..0000000
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
index a1c95bf..0000000
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
index f75412f..e041132 100644
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
2.7.4

