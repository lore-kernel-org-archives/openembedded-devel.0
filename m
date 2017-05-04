Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DED3777A2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 07:45:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v447j8dv022780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 May 2017 00:45:09 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 00:45:07 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 May 2017 03:45:06 -0400
Message-ID: <1493883906-160713-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] crash: fix build failure with mips
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
X-List-Received-Date: Thu, 04 May 2017 07:45:09 -0000
Content-Type: text/plain

When build crash with mips:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mips-linux-nat.c:157:1: error: conflicting types for 'ps_get_thread_area'
 ps_get_thread_area (const struct ps_prochandle *ph,
 ^~~~~~~~~~~~~~~~~~
In file included from gdb_proc_service.h:26:0,
                 from mips-linux-nat.c:32:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This problem have been fixed on intel and arm plantform, we can use the
similar approch to fix it on mips.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../0004-crash-fix-build-failure-with-mips.patch   | 87 ++++++++++++++++++++++
 meta-oe/recipes-kernel/crash/crash_7.1.8.bb        |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch

diff --git a/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch b/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
new file mode 100644
index 0000000..1e7ce6b
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
@@ -0,0 +1,87 @@
+From 423ebdce07aa9f398f32c0adf659353069d023c6 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 4 May 2017 07:14:13 +0000
+Subject: [PATCH] crash: fix build failure with mips
+
+When build crash with mips:
+
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+mips-linux-nat.c:157:1: error: conflicting types for 'ps_get_thread_area'
+ ps_get_thread_area (const struct ps_prochandle *ph,
+ ^~~~~~~~~~~~~~~~~~
+In file included from gdb_proc_service.h:26:0,
+                 from mips-linux-nat.c:32:
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This problem have been fixed on intel and arm plantform, we can use the
+similar approch to fix it on mips.
+
+Upstream-status: Submitted [https://github.com/crash-utility/crash/pull/11]
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ Makefile                                |  1 +
+ crash-fix-build-failure-with-mips.patch | 39 +++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+ create mode 100644 crash-fix-build-failure-with-mips.patch
+
+diff --git a/Makefile b/Makefile
+index 5496523..2ec3325 100644
+--- a/Makefile
++++ b/Makefile
+@@ -268,6 +268,7 @@ gdb_patch:
+ 		grep 'extern ps_err_e ps_get_thread_area (struct' ${RECIPE_SYSROOT}/usr/include/proc_service.h; \
+ 		if [ $$? -eq 0 ]; then \
+ 			patch -p0 < ${GDB}-proc_service.h.patch; \
++			patch -p1 < crash-fix-build-failure-with-mips.patch; \
+ 		fi; \
+ 	fi
+ 
+diff --git a/crash-fix-build-failure-with-mips.patch b/crash-fix-build-failure-with-mips.patch
+new file mode 100644
+index 0000000..0c70c5f
+--- /dev/null
++++ b/crash-fix-build-failure-with-mips.patch
+@@ -0,0 +1,39 @@
++From 615c802d9c73fad48723b6567042cd54f6795849 Mon Sep 17 00:00:00 2001
++From: Dengke Du <dengke.du@windriver.com>
++Date: Thu, 4 May 2017 06:14:47 +0000
++Subject: [PATCH] crash: fix build failure with mips
++
++When build crash with mips:
++
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++mips-linux-nat.c:157:1: error: conflicting types for 'ps_get_thread_area'
++ ps_get_thread_area (const struct ps_prochandle *ph,
++ ^~~~~~~~~~~~~~~~~~
++In file included from gdb_proc_service.h:26:0,
++                 from mips-linux-nat.c:32:
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++This problem have been fixed on intel and arm plantform, we can use the
++similar approch to fix it on mips.
++
++Signed-off-by: Dengke Du <dengke.du@windriver.com>
++---
++ gdb-7.6/gdb/mips-linux-nat.c | 2 +-
++ 1 file changed, 1 insertion(+), 1 deletion(-)
++
++diff --git a/gdb-7.6/gdb/mips-linux-nat.c b/gdb-7.6/gdb/mips-linux-nat.c
++index 61e83c6..d517e37 100644
++--- a/gdb-7.6/gdb/mips-linux-nat.c
+++++ b/gdb-7.6/gdb/mips-linux-nat.c
++@@ -154,7 +154,7 @@ mips64_linux_register_addr (struct gdbarch *gdbarch, int regno, int store)
++ /* Fetch the thread-local storage pointer for libthread_db.  */
++ 
++ ps_err_e
++-ps_get_thread_area (const struct ps_prochandle *ph,
+++ps_get_thread_area (struct ps_prochandle *ph,
++                     lwpid_t lwpid, int idx, void **base)
++ {
++   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
++-- 
++2.11.0
++
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.8.bb b/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
index 012ef1a..9cbb291 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
+           file://0004-crash-fix-build-failure-with-mips.patch \
            "
 
 SRC_URI[md5sum] = "31787074f267a3536eebff008a0652ec"
-- 
2.8.1


