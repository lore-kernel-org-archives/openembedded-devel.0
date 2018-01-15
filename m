Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CDE5F786D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 02:14:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35302332"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2018 10:14:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C9EA48AEA0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 10:14:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 15 Jan 2018 10:14:41 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:15:09 +0800
Message-ID: <1515982509-32353-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515982509-32353-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1515982509-32353-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 5C9EA48AEA0B.AA1D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] crash: 7.1.9 -> 7.2.0
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
X-List-Received-Date: Mon, 15 Jan 2018 02:14:40 -0000
Content-Type: text/plain

1)Upgrade crash from 7.1.9 to 7.2.0.
2)Delete 0004-crash-fix-build-failure-with-mips.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0004-crash-fix-build-failure-with-mips.patch   | 87 ----------------------
 .../crash/{crash_7.1.9.bb => crash_7.2.0.bb}       |  5 +-
 2 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.1.9.bb => crash_7.2.0.bb} (95%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch b/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
deleted file mode 100644
index 1e7ce6b..0000000
--- a/meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 423ebdce07aa9f398f32c0adf659353069d023c6 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 4 May 2017 07:14:13 +0000
-Subject: [PATCH] crash: fix build failure with mips
-
-When build crash with mips:
-
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-mips-linux-nat.c:157:1: error: conflicting types for 'ps_get_thread_area'
- ps_get_thread_area (const struct ps_prochandle *ph,
- ^~~~~~~~~~~~~~~~~~
-In file included from gdb_proc_service.h:26:0,
-                 from mips-linux-nat.c:32:
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This problem have been fixed on intel and arm plantform, we can use the
-similar approch to fix it on mips.
-
-Upstream-status: Submitted [https://github.com/crash-utility/crash/pull/11]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- Makefile                                |  1 +
- crash-fix-build-failure-with-mips.patch | 39 +++++++++++++++++++++++++++++++++
- 2 files changed, 40 insertions(+)
- create mode 100644 crash-fix-build-failure-with-mips.patch
-
-diff --git a/Makefile b/Makefile
-index 5496523..2ec3325 100644
---- a/Makefile
-+++ b/Makefile
-@@ -268,6 +268,7 @@ gdb_patch:
- 		grep 'extern ps_err_e ps_get_thread_area (struct' ${RECIPE_SYSROOT}/usr/include/proc_service.h; \
- 		if [ $$? -eq 0 ]; then \
- 			patch -p0 < ${GDB}-proc_service.h.patch; \
-+			patch -p1 < crash-fix-build-failure-with-mips.patch; \
- 		fi; \
- 	fi
- 
-diff --git a/crash-fix-build-failure-with-mips.patch b/crash-fix-build-failure-with-mips.patch
-new file mode 100644
-index 0000000..0c70c5f
---- /dev/null
-+++ b/crash-fix-build-failure-with-mips.patch
-@@ -0,0 +1,39 @@
-+From 615c802d9c73fad48723b6567042cd54f6795849 Mon Sep 17 00:00:00 2001
-+From: Dengke Du <dengke.du@windriver.com>
-+Date: Thu, 4 May 2017 06:14:47 +0000
-+Subject: [PATCH] crash: fix build failure with mips
-+
-+When build crash with mips:
-+
-+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-+mips-linux-nat.c:157:1: error: conflicting types for 'ps_get_thread_area'
-+ ps_get_thread_area (const struct ps_prochandle *ph,
-+ ^~~~~~~~~~~~~~~~~~
-+In file included from gdb_proc_service.h:26:0,
-+                 from mips-linux-nat.c:32:
-+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-+
-+This problem have been fixed on intel and arm plantform, we can use the
-+similar approch to fix it on mips.
-+
-+Signed-off-by: Dengke Du <dengke.du@windriver.com>
-+---
-+ gdb-7.6/gdb/mips-linux-nat.c | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/gdb-7.6/gdb/mips-linux-nat.c b/gdb-7.6/gdb/mips-linux-nat.c
-+index 61e83c6..d517e37 100644
-+--- a/gdb-7.6/gdb/mips-linux-nat.c
-++++ b/gdb-7.6/gdb/mips-linux-nat.c
-+@@ -154,7 +154,7 @@ mips64_linux_register_addr (struct gdbarch *gdbarch, int regno, int store)
-+ /* Fetch the thread-local storage pointer for libthread_db.  */
-+ 
-+ ps_err_e
-+-ps_get_thread_area (const struct ps_prochandle *ph,
-++ps_get_thread_area (struct ps_prochandle *ph,
-+                     lwpid_t lwpid, int idx, void **base)
-+ {
-+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
-+-- 
-+2.11.0
-+
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.9.bb b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
similarity index 95%
rename from meta-oe/recipes-kernel/crash/crash_7.1.9.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.0.bb
index d40937e..9bea48e 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
@@ -24,10 +24,9 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
-           file://0004-crash-fix-build-failure-with-mips.patch \
            "
-SRC_URI[md5sum] = "f3b44a151dbe7046462b9caaa9847ca6"
-SRC_URI[sha256sum] = "c48e1269443a6a8e8337e328b21b03e4e50248f607eed83fbb27eb0d833d6aa4"
+SRC_URI[md5sum] = "48899de3118e04cfa40a2364f5618193"
+SRC_URI[sha256sum] = "5d076e1fefb41aa178ad3e1cef6511670efc47de5cb04d4af9bdd4e8f2f18cbc"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.7.4




