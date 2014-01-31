Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 643196E87D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 20:04:13 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id f11so6946745qae.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=liFZjXh/sJVrEv8FKhVydWQ6ufCNjIKkx69y9L3JGqY=;
	b=ukHT9UU/dBODNJOfk+EAizN0+Ydy+8iYE6lzxTASEmXU7tu7LTtnWm4WnHcaZ6SfvL
	zKyPJKDLAF3db8xZCfzEGuM/SJSTHvRHmKrrBotzBkBOAsj5abj8pLIuxFjLekvDv4hs
	ReWxpD6BFf8qPq2RVydF+367j0S2sXDggVKvrgw7v7s2g7P3nzIFVCWPQhJdEYxa+XfZ
	5WBzwNJduSDyLBv1SKyHsDl+wyBJs/nNc3nrRXxfvSd3mTjmp47Hi7AVA4LBa0AR6w8F
	AMoTfCG4EsxwT7xbnZ1PERMw4jwkc8OeDlmhxJ3VI2wVgMgrz4JRLAM3TSAFfL4eetYH
	3Oyg==
X-Received: by 10.229.139.199 with SMTP id f7mr34943216qcu.2.1391198654083;
	Fri, 31 Jan 2014 12:04:14 -0800 (PST)
Received: from localhost.localdomain ([187.106.25.157])
	by mx.google.com with ESMTPSA id g68sm14870676qge.7.2014.01.31.12.04.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 12:04:13 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 18:04:04 -0200
Message-Id: <1391198644-9408-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [for-dora] systemd: journald fix ignored disk space restrictions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 20:04:14 -0000

The upstream bug report can be seen at:
[Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=68161

This backports the patches need to address this in the 206 version.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 ...ournald-fix-fd-leak-in-journal_file_empty.patch |   27 ++++++++++++++
 ...urnald-fix-vacuuming-of-archived-journals.patch |   37 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |    2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch

diff --git a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
new file mode 100644
index 0000000..a83c858
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
@@ -0,0 +1,27 @@
+journald: fix fd leak in journal_file_empty
+Before my previous patch, journal_file_empty wasn't be called with the
+correct filename. Now that it's being called with the correct filename
+it leaks file descriptors. This patch closes the file descriptors before
+returning.
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+
+Index: systemd-206/src/journal/journal-vacuum.c
+===================================================================
+--- systemd-206.orig/src/journal/journal-vacuum.c	2013-07-21 19:43:28.146183128 -0300
++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:43:27.492343295 -0200
+@@ -129,9 +129,9 @@
+ }
+ 
+ static int journal_file_empty(int dir_fd, const char *name) {
+-        int fd, r;
++        int r;
+         le64_t n_entries;
+-
++        _cleanup_close_ int fd;
+         fd = openat(dir_fd, name, O_RDONLY|O_CLOEXEC|O_NOFOLLOW|O_NONBLOCK);
+         if (fd < 0)
+                 return -errno;
+
+Upstream-Status: Backport [207]
diff --git a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
new file mode 100644
index 0000000..7c59200
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
@@ -0,0 +1,37 @@
+journald: fix vacuuming of archived journals
+d_name is modified on line 227 so if the entire journal name is needed
+again p must be used. Before this change when journal_file_empty was called
+on archived journals it would always return with -2.
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+Index: systemd-206/src/journal/journal-vacuum.c
+===================================================================
+--- systemd-206.orig/src/journal/journal-vacuum.c	2014-01-29 20:43:27.492343295 -0200
++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:48:55.076356876 -0200
+@@ -265,18 +265,18 @@
+                         /* We do not vacuum active files or unknown files! */
+                         continue;
+ 
+-                if (journal_file_empty(dirfd(d), de->d_name)) {
++                if (journal_file_empty(dirfd(d), p)) {
+ 
+                         /* Always vacuum empty non-online files. */
+ 
+-                        if (unlinkat(dirfd(d), de->d_name, 0) >= 0)
+-                                log_debug("Deleted empty journal %s/%s.", directory, de->d_name);
++                        if (unlinkat(dirfd(d), p, 0) >= 0)
++                                log_debug("Deleted empty journal %s/%s.", directory, p);
+                         else if (errno != ENOENT)
+-                                log_warning("Failed to delete %s/%s: %m", directory, de->d_name);
++                                log_warning("Failed to delete %s/%s: %m", directory, p);
+                         continue;
+                 }
+ 
+-                patch_realtime(directory, de->d_name, &st, &realtime);
++                patch_realtime(directory, p, &st, &realtime);
+ 
+                 GREEDY_REALLOC(list, n_allocated, n_list + 1);
+
+
+Upstream-Status: Backport [207] 
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index a1a8bd7..e7d0f1f 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-use-CAP_MKNOD-ConditionCapability.patch \
            file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
            file://binfmt-install.patch \
+           file://journald-fix-fd-leak-in-journal_file_empty.patch \
+           file://journald-fix-vacuuming-of-archived-journals.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
-- 
1.7.10.4


