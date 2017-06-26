Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1160F7780A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:35:07 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d5so16787933pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OApTND9s8+kQ/p6psNNAYtc699xvAJrNbJYzuO0bZmA=;
	b=SSFTWkTLCZRQOjdc5OhzgERMVmeaFCe2afnpW5PsRrlIvhPDA6lSM76Z/b0Bc0mrwt
	wx67cbXHWOD8tbY7W5ZBejE/chauRuY7yseMtQEHBgQQS/MQO13u+a0kQfiEkh70+mdC
	qHJUh7GWI2PTcYC/oNdmnPs7HYShP8zC2JkoddYY+Z/KFaQFUtQiROGa6nYR1Q9SY+jS
	mSQDt01srm4yKOfNeBMwpQ32PzugIOonWIsi59xFn/buLuMuAPDyPwAx+GixFPixGkkB
	tVV9aVXKD6U7nv9qVAzZAWDuI0eV2l2MzBvRduXO/pRC638kLZUlHFwHqWgrAZdiGDn3
	75uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OApTND9s8+kQ/p6psNNAYtc699xvAJrNbJYzuO0bZmA=;
	b=pX15/wjJ5bp49dtxKcGdKMLPXymt3nBOt3tBYaBBTCYERWN3XZQjBzp5a1qnowyg4F
	zyfV4rMs6GdluOLcupGDbT4CVpZMoZG+vZXWo60BCb6YfuvOdnHbzd6lBaMvelu7sTuV
	UzN3/S62TZq7xEL1WKpSMCqZfksay8pKFd+6K9EAOQmRrdmS52x8l28RyL4OOLNyR758
	AZfFoiyEhADMGduEpUlb2xdv0tbbSKGPeJknPwSKeWxoJ2oy+v06RxRNipEGZ5NRWds+
	xKsYWfTOcWPlWpBIeYOzfyF6qry9Dh1aD9F2w7ehoOZ+npE7XnC8txaMW7s76nKUvcRf
	bFAw==
X-Gm-Message-State: AKS2vOy0SJeio1DmtkAVzDEEF+wqMavkqe8cb+Hb18Y6L+eV7We+xduS
	16KRlynKvQqF4oWp
X-Received: by 10.84.229.78 with SMTP id d14mr22100662pln.212.1498455308260;
	Sun, 25 Jun 2017 22:35:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.35.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:35:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:46 -0700
Message-Id: <20170626053446.37959-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] crash: Upgrade to 7.1.9
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
X-List-Received-Date: Mon, 26 Jun 2017 05:35:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ompilation-error-if-glibc-2.25-or-later-h.patch | 112 ---------------------
 .../crash/{crash_7.1.8.bb => crash_7.1.9.bb}       |   8 +-
 2 files changed, 3 insertions(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.1.8.bb => crash_7.1.9.bb} (95%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
deleted file mode 100644
index 9434815d8..000000000
--- a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From b8c8fbe0a2481e97fc57dd596346827a692a5768 Mon Sep 17 00:00:00 2001
-From: Dave Anderson <anderson@redhat.com>
-Date: Tue, 28 Mar 2017 15:44:40 -0400
-Subject: [PATCH 1/3] Fix for a compilation error if glibc-2.25 or later has
- been installed on the host build machine.  Without the patch, the build fails
- with the error message "amd64-linux-nat.c:496:1: error: conflicting types for
- 'ps_get_thread_area'". (anderson@redhat.com)
-
-Upstream-Status: Backport
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- Makefile                     |  6 +++++
- configure.c                  |  2 +-
- gdb-7.6-proc_service.h.patch | 55 ++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 62 insertions(+), 1 deletion(-)
- create mode 100644 gdb-7.6-proc_service.h.patch
-
-diff --git a/Makefile b/Makefile
-index 202ef8b..b6b7e80 100644
---- a/Makefile
-+++ b/Makefile
-@@ -264,6 +264,12 @@ gdb_patch:
- 	if [ "${ARCH}" = "x86_64" ] && [ "${TARGET}" = "PPC64" ] && [ -f ${GDB}-ppc64le-support.patch ]; then \
- 		patch -d ${GDB} -p1 -F0 < ${GDB}-ppc64le-support.patch ; \
- 	fi
-+	if [ -f /usr/include/proc_service.h ]; then \
-+		grep 'extern ps_err_e ps_get_thread_area (struct' /usr/include/proc_service.h; \
-+		if [ $$? -eq 0 ]; then \
-+			patch -p0 < ${GDB}-proc_service.h.patch; \
-+		fi; \
-+	fi
- 
- library: make_build_data ${OBJECT_FILES}
- 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
-diff --git a/configure.c b/configure.c
-index d63cdd7..776defe 100644
---- a/configure.c
-+++ b/configure.c
-@@ -240,7 +240,7 @@ struct supported_gdb_version {
- 	    "7.6",
- 	    "GDB_FILES=${GDB_7.6_FILES}",
- 	    "GDB_OFILES=${GDB_7.6_OFILES}",
--	    "GDB_PATCH_FILES=gdb-7.6.patch gdb-7.6-ppc64le-support.patch",
-+	    "GDB_PATCH_FILES=gdb-7.6.patch gdb-7.6-ppc64le-support.patch gdb-7.6-proc_service.h.patch",
- 	    "GDB_FLAGS=-DGDB_7_6",
- 	    "GPLv3"
- 	},
-diff --git a/gdb-7.6-proc_service.h.patch b/gdb-7.6-proc_service.h.patch
-new file mode 100644
-index 0000000..49d18bb
---- /dev/null
-+++ b/gdb-7.6-proc_service.h.patch
-@@ -0,0 +1,55 @@
-+--- gdb-7.6/gdb/gdb_proc_service.h.orig
-++++ gdb-7.6/gdb/gdb_proc_service.h
-+@@ -115,7 +115,7 @@ extern pid_t ps_getpid (struct ps_procha
-+ /* Fetch the special per-thread address associated with the given LWP.
-+    This call is only used on a few platforms (most use a normal register).
-+    The meaning of the `int' parameter is machine-dependent.  */
-+-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
-++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
-+ 				    lwpid_t, int, psaddr_t *);
-+ 
-+ 
-+--- gdb-7.6/gdb/amd64-linux-nat.c.orig
-++++ gdb-7.6/gdb/amd64-linux-nat.c
-+@@ -493,7 +493,7 @@ amd64_linux_new_fork (struct lwp_info *p
-+    a request for a thread's local storage address.  */
-+ 
-+ ps_err_e
-+-ps_get_thread_area (const struct ps_prochandle *ph,
-++ps_get_thread_area (struct ps_prochandle *ph,
-+                     lwpid_t lwpid, int idx, void **base)
-+ {
-+   if (gdbarch_bfd_arch_info (target_gdbarch ())->bits_per_word == 32)
-+--- gdb-7.6/gdb/aarch64-linux-nat.c.orig
-++++ gdb-7.6/gdb/aarch64-linux-nat.c
-+@@ -750,7 +750,7 @@ aarch64_linux_new_fork (struct lwp_info
-+    storage (or its descriptor).  */
-+ 
-+ ps_err_e
-+-ps_get_thread_area (const struct ps_prochandle *ph,
-++ps_get_thread_area (struct ps_prochandle *ph,
-+ 		    lwpid_t lwpid, int idx, void **base)
-+ {
-+   struct iovec iovec;
-+--- gdb-7.6/gdb/arm-linux-nat.c.orig
-++++ gdb-7.6/gdb/arm-linux-nat.c
-+@@ -613,7 +613,7 @@ supply_fpregset (struct regcache *regcac
-+ /* Fetch the thread-local storage pointer for libthread_db.  */
-+ 
-+ ps_err_e
-+-ps_get_thread_area (const struct ps_prochandle *ph,
-++ps_get_thread_area (struct ps_prochandle *ph,
-+                     lwpid_t lwpid, int idx, void **base)
-+ {
-+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
-+--- gdb-7.6/gdb/i386-linux-nat.c.orig
-++++ gdb-7.6/gdb/i386-linux-nat.c
-+@@ -849,7 +849,7 @@ i386_linux_new_fork (struct lwp_info *pa
-+    storage (or its descriptor).  */
-+ 
-+ ps_err_e
-+-ps_get_thread_area (const struct ps_prochandle *ph, 
-++ps_get_thread_area (struct ps_prochandle *ph, 
-+ 		    lwpid_t lwpid, int idx, void **base)
-+ {
-+   /* NOTE: cagney/2003-08-26: The definition of this buffer is found
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.8.bb b/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
similarity index 95%
rename from meta-oe/recipes-kernel/crash/crash_7.1.8.bb
rename to meta-oe/recipes-kernel/crash/crash_7.1.9.bb
index 9cbb291f3..93208e398 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
@@ -10,7 +10,7 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "zlib readline"
+DEPENDS = "zlib readline coreutils-native"
 
 SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
@@ -22,14 +22,12 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
-           file://0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            file://0004-crash-fix-build-failure-with-mips.patch \
            "
-
-SRC_URI[md5sum] = "31787074f267a3536eebff008a0652ec"
-SRC_URI[sha256sum] = "9965dee9199d7e39764fbee7f21c7c45b1f7b6d17c8e92ad62f468f062876478"
+SRC_URI[md5sum] = "f3b44a151dbe7046462b9caaa9847ca6"
+SRC_URI[sha256sum] = "c48e1269443a6a8e8337e328b21b03e4e50248f607eed83fbb27eb0d833d6aa4"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.13.1


