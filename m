Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3E9060574
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 02:29:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3G2T9QV008549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Apr 2018 19:29:09 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 15 Apr 2018 19:29:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Sun, 15 Apr 2018 22:28:48 -0400
Message-ID: <1523845728-111656-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] php 7.2.4: fix do_compile failure on qemumips
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2018 02:29:09 -0000
Content-Type: text/plain

It caused by a new variable is declared after the label

There is a build failure on mips:
...
|sljitNativeMIPS_common.c: In function 'sljit_has_cpu_feature':
|sljitNativeMIPS_common.c:506:3: error: a label can only be part
of a statement and a declaration is not a statement
|   sljit_sw fir;
|   ^~~~~~~~
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...aused-by-a-new-variable-is-declared-after.patch | 45 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.2.4.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch

diff --git a/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch b/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch
new file mode 100644
index 0000000..6ab101b
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-fix-error-caused-by-a-new-variable-is-declared-after.patch
@@ -0,0 +1,45 @@
+From 0d88d735887c6f2fa00a743c27124c7a52006a41 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 15 Apr 2018 19:17:27 -0700
+Subject: [PATCH] fix error caused by a new variable is declared after the
+ label
+
+There is a build failure on mips:
+...
+|sljitNativeMIPS_common.c: In function 'sljit_has_cpu_feature':
+|sljitNativeMIPS_common.c:506:3: error: a label can only be part
+of a statement and a declaration is not a statement
+|   sljit_sw fir;
+|   ^~~~~~~~
+...
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c b/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
+index ee207fe..adfd342 100644
+--- a/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
++++ b/ext/pcre/pcrelib/sljit/sljitNativeMIPS_common.c
+@@ -498,12 +498,14 @@ SLJIT_API_FUNC_ATTRIBUTE void* sljit_generate_code(struct sljit_compiler *compil
+ 
+ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_has_cpu_feature(sljit_s32 feature_type)
+ {
++#if defined(__GNUC__)
++	sljit_sw fir;
++#endif
+ 	switch (feature_type) {
+ 	case SLJIT_HAS_FPU:
+ #ifdef SLJIT_IS_FPU_AVAILABLE
+ 		return SLJIT_IS_FPU_AVAILABLE;
+ #elif defined(__GNUC__)
+-		sljit_sw fir;
+ 		asm ("cfc1 %0, $0" : "=r"(fir));
+ 		return (fir >> 22) & 0x1;
+ #else
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-devtools/php/php_7.2.4.bb b/meta-oe/recipes-devtools/php/php_7.2.4.bb
index 04d9b16..2fd1e66 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.4.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=67e369bc8d1f2e641236b8002039a6a2"
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-acinclude.m4-skip-binconfig-check-for-libxml.patch \
             file://0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch \
+            file://0001-fix-error-caused-by-a-new-variable-is-declared-after.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.8.1


