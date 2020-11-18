Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.25668.1605712094073049909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HplHu3oZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 131so1577898pfb.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+r2CZ0AQxhBRn+bsAEl25sIgBtThvtI6opvpmxQZxiA=;
        b=HplHu3oZMTErleUrHx3+mz1qxpYozs+fVnkAreHFk5Spc9tAy48BJBlobot2KoH7wI
         2+BJjjxCkdQnAn8KY51joXMdOmp+KWcaf+3YCY1fds49boYkox16TihFlYbiqZz9v+2b
         CSG/zpJKAxUwy6cf03+iKxjhF6X8JHz01sVWmQAGJC/r1WNA3vER7ir9gFTOtchkVKmc
         KAsQtXGlyOVjjejcavAOPnsehYXrpHD1b6FS2xiBPTgUyzK4j3p/tefL1jCowTUdpnHB
         5ZV6to5DAez+28xjaYz8FsFnvSIubGe1RxKiBGw14VLESE3HxsqKHdKXT8DIJYIxkK+O
         oigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+r2CZ0AQxhBRn+bsAEl25sIgBtThvtI6opvpmxQZxiA=;
        b=uHCMOSKoD+sqVAw8+YKCp9cCsL2Yz5Df0Ie2j6VRI9E4xhDia24qw8qrCDQeMbuJQm
         lTvQjiwjcLZ3OEzemm8swSHQI23giR853WHNHbUBmcIfrGTPEOVdYumz+RZNYdXsxMK5
         Fxd6K1mtBOx82U3ZSvQVYhaE19NunJkVN1DZRjpR6macAMPAPhWaq75rU1MZL/Yc7eU7
         IKo3dYUWbo87iTWPN+FCcxHDG3GsrAlHBzeZ421cvB8lHfiDm80Vt+pyPLhPxdhAaZ4U
         D0wigHeTZNsuH0+cLLgXzX87RTl+jBBMzyOI7bBOYbVhD+W6sOqZXPvQZ+dI0r4+bH/W
         xJxQ==
X-Gm-Message-State: AOAM5302eB9q4VOINzZ0aTxNyVvVP2VOqVVoRuu8TEJXUAHYrwbZIxpg
	xPkFEV6cynyskxUYehTKmL22CV+aX3M=
X-Google-Smtp-Source: ABdhPJyXIEy2Oguuuw8RheI/sxjgiBH0eincxZdTZEA0MvcOvZZD/7aQ8tgoII8DOE9EUIsXf5mQ7g==
X-Received: by 2002:a63:1906:: with SMTP id z6mr8343127pgl.409.1605712093313;
        Wed, 18 Nov 2020 07:08:13 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:12 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/17] chrony: Patch CVE-2020-14367
Date: Wed, 18 Nov 2020 07:07:50 -0800
Message-Id: <24830d1492f8dc08059fc32f5d3542ea67b0ec2a.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Anatol Belski <anbelski@linux.microsoft.com>

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b4d7b1ee421d9ae75548ac0c0dd0ea9405a0571e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../chrony/chrony/CVE-2020-14367.patch        | 204 ++++++++++++++++++
 .../recipes-support/chrony/chrony_3.5.bb      |   1 +
 2 files changed, 205 insertions(+)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch

diff --git a/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch b/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
new file mode 100644
index 00000000000..79df1007e0d
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
@@ -0,0 +1,204 @@
+From f00fed20092b6a42283f29c6ee1f58244d74b545 Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Thu, 6 Aug 2020 09:31:11 +0200
+Subject: main: create new file when writing pidfile
+
+When writing the pidfile, open the file with the O_CREAT|O_EXCL flags
+to avoid following a symlink and writing the PID to an unexpected file,
+when chronyd still has the root privileges.
+
+The Linux open(2) man page warns about O_EXCL not working as expected on
+NFS versions before 3 and Linux versions before 2.6. Saving pidfiles on
+a distributed filesystem like NFS is not generally expected, but if
+there is a reason to do that, these old kernel and NFS versions are not
+considered to be supported for saving files by chronyd.
+
+This is a minimal backport specific to this issue of the following
+commits:
+- commit 2fc8edacb810 ("use PATH_MAX")
+- commit f4c6a00b2a11 ("logging: call exit() in LOG_Message()")
+- commit 7a4c396bba8f ("util: add functions for common file operations")
+- commit e18903a6b563 ("switch to new util file functions")
+
+Reported-by: Matthias Gerstner <mgerstner@suse.de>
+
+Upstream-Status: Backport [https://git.tuxfamily.org/chrony/chrony.git/commit/?id=f00fed20092b6a42283f29c6ee1f58244d74b545]
+CVE: CVE-2020-14367
+Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
+
+diff --git a/logging.c b/logging.c
+index d2296e0..fd7f900 100644
+--- a/logging.c
++++ b/logging.c
+@@ -171,6 +171,7 @@ void LOG_Message(LOG_Severity severity,
+         system_log = 0;
+         log_message(1, severity, buf);
+       }
++      exit(1);
+       break;
+     default:
+       assert(0);
+diff --git a/main.c b/main.c
+index 6ccf32e..8edb2e1 100644
+--- a/main.c
++++ b/main.c
+@@ -281,13 +281,9 @@ write_pidfile(void)
+   if (!pidfile[0])
+     return;
+ 
+-  out = fopen(pidfile, "w");
+-  if (!out) {
+-    LOG_FATAL("Could not open %s : %s", pidfile, strerror(errno));
+-  } else {
+-    fprintf(out, "%d\n", (int)getpid());
+-    fclose(out);
+-  }
++  out = UTI_OpenFile(NULL, pidfile, NULL, 'W', 0644);
++  fprintf(out, "%d\n", (int)getpid());
++  fclose(out);
+ }
+ 
+ /* ================================================== */
+diff --git a/sysincl.h b/sysincl.h
+index 296c5e6..873a3bd 100644
+--- a/sysincl.h
++++ b/sysincl.h
+@@ -37,6 +37,7 @@
+ #include <glob.h>
+ #include <grp.h>
+ #include <inttypes.h>
++#include <limits.h>
+ #include <math.h>
+ #include <netinet/in.h>
+ #include <pwd.h>
+diff --git a/util.c b/util.c
+index e7e3442..83b3b20 100644
+--- a/util.c
++++ b/util.c
+@@ -1179,6 +1179,101 @@ UTI_CheckDirPermissions(const char *path, mode_t perm, uid_t uid, gid_t gid)
+ 
+ /* ================================================== */
+ 
++static int
++join_path(const char *basedir, const char *name, const char *suffix,
++          char *buffer, size_t length, LOG_Severity severity)
++{
++  const char *sep;
++
++  if (!basedir) {
++    basedir = "";
++    sep = "";
++  } else {
++    sep = "/";
++  }
++
++  if (!suffix)
++    suffix = "";
++
++  if (snprintf(buffer, length, "%s%s%s%s", basedir, sep, name, suffix) >= length) {
++    LOG(severity, "File path %s%s%s%s too long", basedir, sep, name, suffix);
++    return 0;
++  }
++
++  return 1;
++}
++
++/* ================================================== */
++
++FILE *
++UTI_OpenFile(const char *basedir, const char *name, const char *suffix,
++             char mode, mode_t perm)
++{
++  const char *file_mode;
++  char path[PATH_MAX];
++  LOG_Severity severity;
++  int fd, flags;
++  FILE *file;
++
++  severity = mode >= 'A' && mode <= 'Z' ? LOGS_FATAL : LOGS_ERR;
++
++  if (!join_path(basedir, name, suffix, path, sizeof (path), severity))
++    return NULL;
++
++  switch (mode) {
++    case 'r':
++    case 'R':
++      flags = O_RDONLY;
++      file_mode = "r";
++      if (severity != LOGS_FATAL)
++        severity = LOGS_DEBUG;
++      break;
++    case 'w':
++    case 'W':
++      flags = O_WRONLY | O_CREAT | O_EXCL;
++      file_mode = "w";
++      break;
++    case 'a':
++    case 'A':
++      flags = O_WRONLY | O_CREAT | O_APPEND;
++      file_mode = "a";
++      break;
++    default:
++      assert(0);
++      return NULL;
++  }
++
++try_again:
++  fd = open(path, flags, perm);
++  if (fd < 0) {
++    if (errno == EEXIST) {
++      if (unlink(path) < 0) {
++        LOG(severity, "Could not remove %s : %s", path, strerror(errno));
++        return NULL;
++      }
++      DEBUG_LOG("Removed %s", path);
++      goto try_again;
++    }
++    LOG(severity, "Could not open %s : %s", path, strerror(errno));
++    return NULL;
++  }
++
++  UTI_FdSetCloexec(fd);
++
++  file = fdopen(fd, file_mode);
++  if (!file) {
++    LOG(severity, "Could not open %s : %s", path, strerror(errno));
++    close(fd);
++    return NULL;
++  }
++
++  DEBUG_LOG("Opened %s fd=%d mode=%c", path, fd, mode);
++
++  return file;
++}
++
++/* ================================================== */
++
+ void
+ UTI_DropRoot(uid_t uid, gid_t gid)
+ {
+diff --git a/util.h b/util.h
+index e3d6767..a2481cc 100644
+--- a/util.h
++++ b/util.h
+@@ -176,6 +176,17 @@ extern int UTI_CreateDirAndParents(const char *path, mode_t mode, uid_t uid, gid
+    permissions and its uid/gid must match the specified values. */
+ extern int UTI_CheckDirPermissions(const char *path, mode_t perm, uid_t uid, gid_t gid);
+ 
++/* Open a file.  The full path of the file is constructed from the basedir
++   (may be NULL), '/' (if basedir is not NULL), name, and suffix (may be NULL).
++   Created files have specified permissions (umasked).  Returns NULL on error.
++   The following modes are supported (if the mode is an uppercase character,
++   errors are fatal):
++   r/R - open an existing file for reading
++   w/W - open a new file for writing (remove existing file)
++   a/A - open an existing file for appending (create if does not exist) */
++extern FILE *UTI_OpenFile(const char *basedir, const char *name, const char *suffix,
++                          char mode, mode_t perm);
++
+ /* Set process user/group IDs and drop supplementary groups */
+ extern void UTI_DropRoot(uid_t uid, gid_t gid);
+ 
+-- 
+cgit v0.10.2
+
diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
index 7c6356d264e..182ce13ccf2 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
+    file://CVE-2020-14367.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.17.1

