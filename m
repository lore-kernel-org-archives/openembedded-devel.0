Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4169.1606789027208057606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101913970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:17:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E3CD4CE600B
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:17:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:17:02 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] crash: upgrade 7.2.8 -> 7.2.9
Date: Tue, 1 Dec 2020 10:16:48 +0800
Message-ID: <1606789008-56595-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9E3CD4CE600B.A9CDC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
Removed since this is included in 7.2.9

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-gcc-10-compilation-error.-Without-t.patch | 54 -------------------
 .../crash/{crash_7.2.8.bb => crash_7.2.9.bb}  |  3 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.2.8.bb => crash_7.2.9.bb} (97%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
deleted file mode 100644
index c94644438..000000000
--- a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 0dddb4e1158705345b7f4f71635d42c89e1b0c8f Mon Sep 17 00:00:00 2001
-From: Dave Anderson <anderson@redhat.com>
-Date: Fri, 31 Jan 2020 17:11:46 -0500
-Subject: [PATCH] Fix for an ARM64 gcc-10 compilation error.  Without the
- patch, the build of the embedded gdb module fails with an error message that
- indicates "multiple definition of 'tdesc_aarch64'". (anderson@redhat.com)
-
-Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/e770735200c02ac2414c394ea6ec5f7f033efe64]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gdb-7.6.patch | 30 ++++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
-
-diff --git a/gdb-7.6.patch b/gdb-7.6.patch
-index f6c311d..f64b55f 100644
---- a/gdb-7.6.patch
-+++ b/gdb-7.6.patch
-@@ -2471,3 +2471,33 @@ diff -up gdb-7.6/opcodes/configure.orig gdb-7.6/opcodes/configure
-  #else
-  # error "!__i386__ && !__x86_64__"
-  #endif
-+--- gdb-7.6/gdb/features/aarch64.c.orig
-++++ gdb-7.6/gdb/features/aarch64.c
-+@@ -5,7 +5,6 @@
-+ #include "osabi.h"
-+ #include "target-descriptions.h"
-+ 
-+-struct target_desc *tdesc_aarch64;
-+ static void
-+ initialize_tdesc_aarch64 (void)
-+ {
-+--- gdb-7.6/gdb/aarch64-linux-nat.c.orig
-++++ gdb-7.6/gdb/aarch64-linux-nat.c
-+@@ -37,6 +37,7 @@
-+ 
-+ #include "gregset.h"
-+ 
-++extern struct target_desc *tdesc_aarch64;
-+ #include "features/aarch64.c"
-+ 
-+ /* Defines ps_err_e, struct ps_prochandle.  */
-+--- gdb-7.6/gdb/aarch64-tdep.c.orig
-++++ gdb-7.6/gdb/aarch64-tdep.c
-+@@ -52,6 +52,7 @@
-+ #include "gdb_assert.h"
-+ #include "vec.h"
-+ 
-++struct target_desc *tdesc_aarch64;
-+ #include "features/aarch64.c"
-+ #include "features/aarch64-without-fpu.c"
-+ 
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb b/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
similarity index 97%
rename from meta-oe/recipes-kernel/crash/crash_7.2.8.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.9.bb
index 6e2533635..4394b6fc6 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
@@ -25,9 +25,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
-           file://0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch \
            "
-SRCREV = "24f4801f8c8871a2e3e660fe9fa8fdd86bb29876"
+SRCREV = "a25aa4b649d339dd25c20d5413d81b851a77e0b2"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.25.1



