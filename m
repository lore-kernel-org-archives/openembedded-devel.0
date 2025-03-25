Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A39C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 13:50:22 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.64809.1742906731801106432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 05:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 25 Mar 2025 21:45:29 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.127 with ESMTP; 25 Mar 2025 21:45:29 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] jq: fix build with gcc-15.0.1
Date: Tue, 25 Mar 2025 21:45:24 +0900
Message-Id: <20250325124524.81338-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 13:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116277

From: "mark.yang" <mark.yang@lge.com>

* to fix: http://errors.yoctoproject.org/Errors/Details/848776/

* If upgrade the version of jq, the build will succeed when
  https://github.com/jqlang/jq/commit/0b82b3841b05faefe0ac18379bdb361b7e4e3464 is included.

I'd like to backport it, but It have to backport a lot of patches.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-gcc-15.0.1-compile-error.patch   | 46 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-error.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-error.patch b/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-error.patch
new file mode 100644
index 0000000000..fe7c5d2f40
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-error.patch
@@ -0,0 +1,46 @@
+From d40319093e517aedc6de610215bf571698a5e60b Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 25 Mar 2025 15:20:15 +0900
+Subject: [PATCH] Fix gcc-15.0.1 compile error
+
+* to fix: http://errors.yoctoproject.org/Errors/Details/848776/
+../jq-1.7.1/src/builtin.c:1705:4: error: initialization of 'jv (*)(void)' from incompatible pointer type 'jv (*)(jq_state *, jv)' [-Wincompatible-pointer-types]
+ 1705 |   {f_ ## name,  #name, 1},
+
+The function pointer in bytecode.h is ambiguously defined.
+   struct cfunction {
+     jv (*fptr)();  // function pointer with no parameters
+     const char* name;
+     int nargs;
+   };
+I think that previous versions of GCC allowed casting between function pointers with
+no parameters and function pointers with parameters,
+but GCC 15.0.1 treats this as an error.
+Changed to void *fptr to make the function pointer not bound to a specific signature.
+
+* If upgrade the version of jq, the build will succeed when
+  https://github.com/jqlang/jq/commit/0b82b3841b05faefe0ac18379bdb361b7e4e3464 is included.
+
+I'd like to backport it, but It have to backport a lot of patches.
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+
+Upstream-Status: Inappropriate [oe specific]
+---
+ src/bytecode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bytecode.h b/src/bytecode.h
+index 1501985..c8ab39a 100644
+--- a/src/bytecode.h
++++ b/src/bytecode.h
+@@ -46,7 +46,7 @@ const struct opcode_description* opcode_describe(opcode op);
+ 
+ #define MAX_CFUNCTION_ARGS 10
+ struct cfunction {
+-  jv (*fptr)();
++  void *fptr;
+   const char* name;
+   int nargs;
+ };
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 6b12335513..9d762f6660 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=488f4e0b04c0456337fb70d1ac1758ba"
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
+    file://0001-Fix-gcc-15.0.1-compile-error.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.34.1


