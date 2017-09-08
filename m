Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 938EE7757F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 18:29:26 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 188so6107464pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o2/qdGp0f60O/fL+y/a/YqgiSAhL6918XYK5//hsfSI=;
	b=PKjpG2qXbQtbOL9Ca7nsWNOXOB1HNDylOh8XW0vOUR58hguR/3ta/f8WGrV8ML5hf3
	IaFkX70lLP/LNgEybTS0glzuFCbt3R2nIJ/vp9egeuBsiIsgs2dNopGRG6zF5IGv5pPK
	uO7eG11zUOzc1CfS30lXk4BSwimwjiW6lWnNlPGwJ5S9MOJtTWzMmAjxkAQpX+dHAAUZ
	iitLNc6opYETau4v4DaFJ1nEPHqewPnM3ZIZcwD0Z4sS5v2qFUCQD5TlKt/+MFvA9rjS
	HIjLDuIdSybQfq4yDLkKLgLTE+5bQp+AXZ1V0m3L8nYSf2xZ53/3pKjF6tEKLoZuioE6
	2dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o2/qdGp0f60O/fL+y/a/YqgiSAhL6918XYK5//hsfSI=;
	b=G7jIubYcLMX4chBNf+evTo2QQEa3sNTV+hU1yXGx3NfipZbvrJ7AEhINhI77zjQWcc
	CitSKycx7H4Z+POMswjFndrqsQQdzW68h88Gs7t1KkTS4S0beE1iZcSlEQYtJTZ7Buln
	H5zgPt0ue5q2woeB2A7WemvKLBBBuKOkKPdmYQu1Mx5YDGM4UAWZsHn15xUOtfdct1bR
	z8dGdBEgHRKiuOQl5Znj6Fx/iTg1mHTvs5inVJvwMgXe3rNA6L0g76W9obLLkFIw4weV
	IWcbT70hGUo4DHVbe7z1gPAb8xJJi/rvvhKvbtI7HZqoGuZv1OJ8MZbIN/Tcon/wpS4n
	ObTg==
X-Gm-Message-State: AHPjjUhqJm7oX/SUlE04HLeTDdocxpX9i7QsghahzezhaUKv3W771x+E
	6fpQ6bDbgkq2U5LR
X-Google-Smtp-Source: ADKCNb5tLSW+WXnRP/M8PwxObue1gQyBbCyyJQyNIpwCBCjIel6vHLMI3jqUEIBsSYJoztnSzE0wYw==
X-Received: by 10.84.235.136 with SMTP id p8mr4332205plk.8.1504895367479;
	Fri, 08 Sep 2017 11:29:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id m5sm4993977pfh.35.2017.09.08.11.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 11:29:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 11:29:18 -0700
Message-Id: <20170908182918.39345-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908182918.39345-1-raj.khem@gmail.com>
References: <20170908182918.39345-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH V3 2/2] xfsprogs: Upgrade to 4.12.0
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
X-List-Received-Date: Fri, 08 Sep 2017 18:29:26 -0000

Fix cross builds with hardening flags
Fix build with gold
Specify libtool tag

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V3: Add -fPIC to CFLAGS and drop the progname rename patch

 ...0001-spaceman-Add-missing-link-to-libuuid.patch |  34 ++++++
 .../files/remove_flags_from_build_flags.patch      |  13 +++
 .../xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch  | 117 +++++++++++++++++++++
 .../{xfsprogs_4.11.0.bb => xfsprogs_4.12.0.bb}     |  10 +-
 4 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-spaceman-Add-missing-link-to-libuuid.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-4.12.0-fix_musl.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.11.0.bb => xfsprogs_4.12.0.bb} (84%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-spaceman-Add-missing-link-to-libuuid.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-spaceman-Add-missing-link-to-libuuid.patch
new file mode 100644
index 000000000..450c6454d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-spaceman-Add-missing-link-to-libuuid.patch
@@ -0,0 +1,34 @@
+From 39836217bdc41428b23a57bd70f2bfc8dddd8c60 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Sep 2017 19:16:04 -0700
+Subject: [PATCH] spaceman: Add missing link to libuuid
+
+When uuid is enabled then we see linking failures with gold linker e.g.
+
+libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_compare'
+libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_copy'
+clang-5.0: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ spaceman/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spaceman/Makefile b/spaceman/Makefile
+index 95ec3c0..060e0af 100644
+--- a/spaceman/Makefile
++++ b/spaceman/Makefile
+@@ -9,7 +9,7 @@ LTCOMMAND = xfs_spaceman
+ HFILES = init.h space.h
+ CFILES = init.c file.c prealloc.c trim.c
+ 
+-LLDLIBS = $(LIBXCMD)
++LLDLIBS = $(LIBXCMD) $(LIBUUID)
+ LTDEPENDENCIES = $(LIBXCMD)
+ LLDFLAGS = -static
+ 
+-- 
+2.14.1
+
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
similarity index 84%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
index 046dea425..bb84d2bba 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb
@@ -8,9 +8,12 @@ DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://link_needed_libs.patch \
            file://0001-define-__-prefixed-version-of-intXY_t-types.patch \
+           file://remove_flags_from_build_flags.patch \
+           file://xfsprogs-4.12.0-fix_musl.patch \
+           file://0001-spaceman-Add-missing-link-to-libuuid.patch \
            "
-SRC_URI[md5sum] = "f1f9b8c752347eefdb56483dafa0cefb"
-SRC_URI[sha256sum] = "c3a6d87b564d7738243c507df82276bed982265e345363a95f2c764e8a5f5bb2"
+SRC_URI[md5sum] = "e348b0e1d7bd1cd82d64b91ff37e727e"
+SRC_URI[sha256sum] = "b330ad8d737f4152ae511580102e2fc49212bb51dfb4b614084344abae46d0df"
 
 inherit autotools-brokensep
 
@@ -42,6 +45,9 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
 export DEBUG="-DNDEBUG"
 export BUILD_VERBOSE="1"
+export tagname="CC"
+
+CFLAGS += "-fPIC"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
-- 
2.14.1


