Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 30180781A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:28:46 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id e1so6611835pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0WSvbcZfrvwclabWxzKu3zHOrbmDDtJVJAvvfNmFZsY=;
	b=jlrrNdlFO78hapm2dh7ZjLL5qFkN9Z0Nu7tZJkVSAYW2Rovc9mTXWfS1MMLaMl2w8g
	QNcb/vdjL4qPllPARL4hBZJuUoF9gKq7c0ioaDeciYbgJEFpYEnZRgRaB18fV3iDgrdL
	Rbfs6k/Y1jnOY936+31o122mRGuSk7N6WpkuCDkVnL6JIs4X+Ty0bhSDM34Lk46L0ak7
	hvirhpUx7xAWuoZz1YYGP/qHWZo5qzwGggWtnxdQHSv3PPMECNZomD2CZ3zKwS97ZF7G
	TcMyzA5vajhEC5Qt2DW62FAzNNmtI6DzxG+MnNOP6RTa5Phi/7sw4W54zYPyiTDu0t5e
	slFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0WSvbcZfrvwclabWxzKu3zHOrbmDDtJVJAvvfNmFZsY=;
	b=o1jI5lnaWn/Nd4fAFn1sEZIK1ViHxAauBtok0qyen+BW3qxjp7qNMN96BRpv/1zCKi
	h3CGSAjVetUBCOH59eUnnqVa/KdL8l5CVdkTO450qJtOY+6dNTeYeTyuEfD3EIKBDYoY
	0zJaamCFZ0hU0qQ77AwH8JDSTf+2UoNINquW40nfe4HGTY8gehG1MVGvirxVNYhjoY9T
	374W7aua7jMPiXAT1AnzdBIIOqmcOL3sYAxhc7Sme926ZKGUWZOPptSFIKElP1qrZWfI
	tQtPEPbeuhl3DHJ0uDAmf6/UO03d/dyOfakz5y0YsvIaYUNqOdl0fhtwDyHzz0JWEK23
	2nqA==
X-Gm-Message-State: AHPjjUgw3smtXiiq6K6ILq/gxD4HwzaxnvFGI/o5u1JuljxfU74G9rI0
	DoMCR8+Jmc6QCW1d
X-Google-Smtp-Source: ADKCNb5/jaJJ0qpRTZl7jQZ90HkKHyYmg6eDxbccPfjoh2w3bG+eVJ8DC5ZUJaXLU/lfxvqq39hfMw==
X-Received: by 10.99.97.148 with SMTP id v142mr4769537pgb.413.1504913327691;
	Fri, 08 Sep 2017 16:28:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	r11sm5684881pfg.180.2017.09.08.16.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 16:28:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:28:39 -0700
Message-Id: <20170908232839.1753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-filesystems][PATCH V4] xfsprogs: Upgrade to 4.12.0
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
X-List-Received-Date: Fri, 08 Sep 2017 23:28:47 -0000

Fix cross builds with hardening flags
Fix build with gold
Specify libtool tag
Add DISABLE_STATIC = ""

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V4: Enable static libs

 .../xfsprogs/files/link_needed_libs.patch          |  82 ---------------
 .../files/remove_flags_from_build_flags.patch      |  13 +++
 .../xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch  | 117 +++++++++++++++++++++
 .../{xfsprogs_4.11.0.bb => xfsprogs_4.12.0.bb}     |   9 +-
 4 files changed, 136 insertions(+), 85 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.11.0.bb => xfsprogs_4.12.0.bb} (86%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
deleted file mode 100644
index 1de634ed7..000000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-Index: xfsprogs-4.10.0/libxcmd/Makefile
-===================================================================
---- xfsprogs-4.10.0.orig/libxcmd/Makefile
-+++ xfsprogs-4.10.0/libxcmd/Makefile
-@@ -30,10 +30,21 @@ LCFLAGS += -DENABLE_EDITLINE
- LTLIBS += $(LIBEDITLINE) $(LIBTERMCAP)
- endif
- 
-+ifeq ($(ENABLE_BLKID),yes)
-+LCFLAGS += -DENABLE_BLKID
-+LTLIBS += $(LIBBLKID)
-+endif
-+
-+LTLIBS += $(LIBXFS)
-+
- default: ltdepend $(LTLIBRARY)
- 
- include $(BUILDRULES)
- 
--install install-dev: default
-+install: default
-+	$(INSTALL_LTLIB)
-+
-+install-dev: default
-+	$(INSTALL_LTLIB_DEV)
- 
- -include .ltdep
-Index: xfsprogs-4.10.0/libxfs/Makefile
-===================================================================
---- xfsprogs-4.10.0.orig/libxfs/Makefile
-+++ xfsprogs-4.10.0/libxfs/Makefile
-@@ -137,6 +137,7 @@ include $(BUILDRULES)
- 
- install: default
- 	$(INSTALL) -m 755 -d $(PKG_INC_DIR)
-+	$(INSTALL_LTLIB)
- 
- install-headers: $(addsuffix -hdrs, $(PKGHFILES))
- 
-Index: xfsprogs-4.10.0/libxlog/Makefile
-===================================================================
---- xfsprogs-4.10.0.orig/libxlog/Makefile
-+++ xfsprogs-4.10.0/libxlog/Makefile
-@@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
- 
- include $(BUILDRULES)
- 
--install install-dev: default
-+install: default
-+	$(INSTALL_LTLIB)
-+
-+install-dev: default
-+	$(INSTALL_LTLIB_DEV)
- 
- -include .ltdep
-Index: xfsprogs-4.10.0/io/Makefile
-===================================================================
---- xfsprogs-4.10.0.orig/io/Makefile
-+++ xfsprogs-4.10.0/io/Makefile
-@@ -13,7 +13,7 @@
- 	getrusage.c imap.c link.c mmap.c open.c parent.c pread.c prealloc.c \
- 	pwrite.c reflink.c seek.c shutdown.c sync.c truncate.c utimes.c
- 
--LLDLIBS = $(LIBXCMD) $(LIBHANDLE) $(LIBPTHREAD)
-+LLDLIBS = $(LIBXCMD) $(LIBHANDLE) $(LIBUUID) $(LIBPTHREAD)
- LTDEPENDENCIES = $(LIBXCMD) $(LIBHANDLE)
- LLDFLAGS = -static-libtool-libs
- 
-Index: xfsprogs-4.10.0/quota/Makefile
-===================================================================
---- xfsprogs-4.10.0.orig/quota/Makefile
-+++ xfsprogs-4.10.0/quotq/Makefile
-@@ -14,7 +14,7 @@
- PCFILES = darwin.c freebsd.c irix.c linux.c
- LSRCFILES = $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
- 
--LLDLIBS = $(LIBXCMD)
-+LLDLIBS = $(LIBXCMD) $(LIBUUID)
- LTDEPENDENCIES = $(LIBXCMD)
- LLDFLAGS = -static
- 
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
new file mode 100644
index 000000000..bba9a25c2
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
@@ -0,0 +1,13 @@
+Index: xfsprogs-4.12.0/include/builddefs.in
+===================================================================
+--- xfsprogs-4.12.0.orig/include/builddefs.in
++++ xfsprogs-4.12.0/include/builddefs.in
+@@ -164,7 +164,7 @@ ifeq ($(ENABLE_GETTEXT),yes)
+ GCFLAGS += -DENABLE_GETTEXT
+ endif
+ 
+-BUILD_CFLAGS += $(GCFLAGS) $(PCFLAGS)
++BUILD_CFLAGS += $(GCFLAGS)
+ # First, Global, Platform, Local CFLAGS
+ CFLAGS += $(FCFLAGS) $(OPTIMIZER) $(GCFLAGS) $(PCFLAGS) $(LCFLAGS)
+ 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
new file mode 100644
index 000000000..efc57e4f6
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
@@ -0,0 +1,117 @@
+From 21253610f9ef87db8e2a75b863b7fcfbd0cdb421 Mon Sep 17 00:00:00 2001
+From: "Darrick J. Wong" <darrick.wong@oracle.com>
+Date: Tue, 25 Jul 2017 13:45:01 -0500
+Subject: [PATCH] In patch 4944defad4 ("xfs_db: redirect printfs when
+ metadumping to stdout"), we solved the problem of xfs_db printfs ending up in
+ the metadump stream by reassigning stdout for the duration of a stdout
+ metadump.  Unfortunately, musl doesn't allow stdout to be reassigned (in
+ their view "extern FILE *stdout" means "extern FILE * const stdout"), so we
+ abandon the old approach in favor of playing games with dup() to switch the
+ raw file descriptors.
+
+While we're at it, fix a regression where an unconverted outf test
+allows progress info to end up in the metadump stream.
+
+Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
+---
+ db/metadump.c | 47 ++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 36 insertions(+), 11 deletions(-)
+
+diff --git a/db/metadump.c b/db/metadump.c
+index 96641e0..4e2f648 100644
+--- a/db/metadump.c
++++ b/db/metadump.c
+@@ -78,6 +78,7 @@ static int		obfuscate = 1;
+ static int		zero_stale_data = 1;
+ static int		show_warnings = 0;
+ static int		progress_since_warning = 0;
++static bool		stdout_metadump;
+ 
+ void
+ metadump_init(void)
+@@ -137,7 +138,7 @@ print_progress(const char *fmt, ...)
+ 	va_end(ap);
+ 	buf[sizeof(buf)-1] = '\0';
+ 
+-	f = (outf == stdout) ? stderr : stdout;
++	f = stdout_metadump ? stderr : stdout;
+ 	fprintf(f, "\r%-59s", buf);
+ 	fflush(f);
+ 	progress_since_warning = 1;
+@@ -2750,7 +2751,8 @@ metadump_f(
+ 	xfs_agnumber_t	agno;
+ 	int		c;
+ 	int		start_iocur_sp;
+-	bool		stdout_metadump = false;
++	int		outfd = -1;
++	int		ret;
+ 	char		*p;
+ 
+ 	exitcode = 1;
+@@ -2870,16 +2872,35 @@ metadump_f(
+ 		 * metadump operation so that dbprintf and other messages
+ 		 * are sent to the console instead of polluting the
+ 		 * metadump stream.
++		 *
++		 * We get to do this the hard way because musl doesn't
++		 * allow reassignment of stdout.
+ 		 */
+-		outf = stdout;
+-		stdout = stderr;
++		fflush(stdout);
++		outfd = dup(STDOUT_FILENO);
++		if (outfd < 0) {
++			perror("opening dump stream");
++			goto out;
++		}
++		ret = dup2(STDERR_FILENO, STDOUT_FILENO);
++		if (ret < 0) {
++			perror("redirecting stdout");
++			close(outfd);
++			goto out;
++		}
++		outf = fdopen(outfd, "a");
++		if (outf == NULL) {
++			fprintf(stderr, "cannot create dump stream\n");
++			dup2(outfd, 1);
++			close(outfd);
++			goto out;
++		}
+ 		stdout_metadump = true;
+ 	} else {
+ 		outf = fopen(argv[optind], "wb");
+ 		if (outf == NULL) {
+ 			print_warning("cannot create dump file");
+-			free(metablock);
+-			return 0;
++			goto out;
+ 		}
+ 	}
+ 
+@@ -2907,15 +2928,19 @@ metadump_f(
+ 	if (progress_since_warning)
+ 		fputc('\n', stdout_metadump ? stderr : stdout);
+ 
+-	if (stdout_metadump)
+-		stdout = outf;
+-	else
+-		fclose(outf);
++	if (stdout_metadump) {
++		fflush(outf);
++		fflush(stdout);
++		ret = dup2(outfd, STDOUT_FILENO);
++		if (ret < 0)
++			perror("un-redirecting stdout");
++	}
++	fclose(outf);
+ 
+ 	/* cleanup iocur stack */
+ 	while (iocur_sp > start_iocur_sp)
+ 		pop_cur();
+-
++out:
+ 	free(metablock);
+ 
+ 	return 0;
+-- 
+2.13.3
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
similarity index 86%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
index 046dea425..0202815c4 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
@@ -6,11 +6,12 @@ LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=102f7fec3d53c7c8f0b7baf9bf9d76a8"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
-           file://link_needed_libs.patch \
            file://0001-define-__-prefixed-version-of-intXY_t-types.patch \
+           file://remove_flags_from_build_flags.patch \
+           file://xfsprogs-4.12.0-fix_musl.patch \
            "
-SRC_URI[md5sum] = "f1f9b8c752347eefdb56483dafa0cefb"
-SRC_URI[sha256sum] = "c3a6d87b564d7738243c507df82276bed982265e345363a95f2c764e8a5f5bb2"
+SRC_URI[md5sum] = "e348b0e1d7bd1cd82d64b91ff37e727e"
+SRC_URI[sha256sum] = "b330ad8d737f4152ae511580102e2fc49212bb51dfb4b614084344abae46d0df"
 
 inherit autotools-brokensep
 
@@ -33,6 +34,7 @@ EXTRA_OECONF = "--enable-gettext=no \
                 ac_cv_lib_rt_lio_listio=yes \
 "
 
+DISABLE_STATIC = ""
 EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
 
 PACKAGECONFIG ??= "readline blkid"
@@ -42,6 +44,7 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
 export DEBUG="-DNDEBUG"
 export BUILD_VERBOSE="1"
+export tagname="CC"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
-- 
2.14.1


