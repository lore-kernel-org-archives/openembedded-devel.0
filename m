Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.48710.1606200682539070468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 22:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b85ns7ui;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t21so16611315pgl.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLReMUEMikEfIqqXi84VsSBrfPIMPcTSvlqHDpIhGHI=;
        b=b85ns7ui1mlFSeM+em/ew2NgVc83LSvgfsr9NlpdLz9dkg3jayfrsvlr9aDqoQAkSh
         OFKM3iv7vad7suA/tL+Oslb/7mPje4RrsyU+bHg8ak20uihtZpfwdBfanolftgfFWOZX
         /t6woI0izATkpQ6Vpqki8DMltUgVKNlgRb18Q8pqq9wIkXYgAyGnxK+M1ibFX0+wlwL8
         vHN4YldMHZvo011yZOXe6tWFdI1cV2x49DSX9yurfQ7jiCp12cm+l3L+5cME1MVJrjQJ
         lcVNH09NOl8Kou30kbSRd6MWGZl0F9N+6IKruCXGGBo+ITp3wDt6rBRGs04DxToTD11G
         61Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLReMUEMikEfIqqXi84VsSBrfPIMPcTSvlqHDpIhGHI=;
        b=iZCJXoBu53bgJxLA9zUsdmnxPfP7F2R6GMhYnhvYBNvjYetUmVmpa7XJCNcM5zmVyC
         O2Pc1f9CuapY6SROvliD6DnGPqbmh4ie6ZfT8C3BxOUjP6ni1E3e8E/hnPSazuvpRdAG
         Xi09kb1CyD1+QBZWkZgNfcC7uPqtZk9W0OaR15uZUQbFLcyAYUXr6F2cJhsW6+3/B8Ik
         MoWUCCf0ZSlRb1xqPZTnx8bkfEfwy2Oat6uE/JUzlik6cz6rM+32YoBFSbKI9O4kBphM
         xWyhOvgbP5T2zl3ziYXVOOUxLqgNbq/RWPZpvYok1yQDAUxreexDynhnoai2e75GBazL
         0enA==
X-Gm-Message-State: AOAM531Fzri55Y2qhmC9cDCIanvF8QYxgYVdsyx3COISvsrIFrvQaymy
	UtlSydkP5iHVSO/X6YNYL/8kX0vbiDMlWA==
X-Google-Smtp-Source: ABdhPJwUsMYyklif9+7m0qhajKZ6NfOQMZcugpF8tyu9nKJsOw1F+JIaKBrBo4CAyKBTf9Nfk/HVhQ==
X-Received: by 2002:a17:90a:460b:: with SMTP id w11mr3206622pjg.12.1606200681363;
        Mon, 23 Nov 2020 22:51:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id m18sm14411069pff.144.2020.11.23.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 22:51:20 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] chrony: Upgrade to 4.0
Date: Mon, 23 Nov 2020 22:51:18 -0800
Message-Id: <20201124065118.2113725-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ChangeLog is here [1]

Do not install /var/log as it conflicts with basefiles package

Collected errors:
 * check_data_file_clashes: Package chrony wants to install file /var/log
        But that file is already provided by package  * base-files

Remove CVE patch since its upstream

Forward port arm_eabi.patch patch

Make builds reproducible

[1] https://chrony.tuxfamily.org/news.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../chrony/chrony/CVE-2020-14367.patch        | 204 ------------------
 .../chrony/chrony/arm_eabi.patch              |  77 ++++---
 .../recipes-support/chrony/chrony/chronyd     |   2 +-
 .../chrony/{chrony_3.5.bb => chrony_4.0.bb}   |  13 +-
 4 files changed, 51 insertions(+), 245 deletions(-)
 delete mode 100644 meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
 rename meta-networking/recipes-support/chrony/{chrony_3.5.bb => chrony_4.0.bb} (94%)

diff --git a/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch b/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
deleted file mode 100644
index 79df1007e0..0000000000
--- a/meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From f00fed20092b6a42283f29c6ee1f58244d74b545 Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Thu, 6 Aug 2020 09:31:11 +0200
-Subject: main: create new file when writing pidfile
-
-When writing the pidfile, open the file with the O_CREAT|O_EXCL flags
-to avoid following a symlink and writing the PID to an unexpected file,
-when chronyd still has the root privileges.
-
-The Linux open(2) man page warns about O_EXCL not working as expected on
-NFS versions before 3 and Linux versions before 2.6. Saving pidfiles on
-a distributed filesystem like NFS is not generally expected, but if
-there is a reason to do that, these old kernel and NFS versions are not
-considered to be supported for saving files by chronyd.
-
-This is a minimal backport specific to this issue of the following
-commits:
-- commit 2fc8edacb810 ("use PATH_MAX")
-- commit f4c6a00b2a11 ("logging: call exit() in LOG_Message()")
-- commit 7a4c396bba8f ("util: add functions for common file operations")
-- commit e18903a6b563 ("switch to new util file functions")
-
-Reported-by: Matthias Gerstner <mgerstner@suse.de>
-
-Upstream-Status: Backport [https://git.tuxfamily.org/chrony/chrony.git/commit/?id=f00fed20092b6a42283f29c6ee1f58244d74b545]
-CVE: CVE-2020-14367
-Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
-
-diff --git a/logging.c b/logging.c
-index d2296e0..fd7f900 100644
---- a/logging.c
-+++ b/logging.c
-@@ -171,6 +171,7 @@ void LOG_Message(LOG_Severity severity,
-         system_log = 0;
-         log_message(1, severity, buf);
-       }
-+      exit(1);
-       break;
-     default:
-       assert(0);
-diff --git a/main.c b/main.c
-index 6ccf32e..8edb2e1 100644
---- a/main.c
-+++ b/main.c
-@@ -281,13 +281,9 @@ write_pidfile(void)
-   if (!pidfile[0])
-     return;
- 
--  out = fopen(pidfile, "w");
--  if (!out) {
--    LOG_FATAL("Could not open %s : %s", pidfile, strerror(errno));
--  } else {
--    fprintf(out, "%d\n", (int)getpid());
--    fclose(out);
--  }
-+  out = UTI_OpenFile(NULL, pidfile, NULL, 'W', 0644);
-+  fprintf(out, "%d\n", (int)getpid());
-+  fclose(out);
- }
- 
- /* ================================================== */
-diff --git a/sysincl.h b/sysincl.h
-index 296c5e6..873a3bd 100644
---- a/sysincl.h
-+++ b/sysincl.h
-@@ -37,6 +37,7 @@
- #include <glob.h>
- #include <grp.h>
- #include <inttypes.h>
-+#include <limits.h>
- #include <math.h>
- #include <netinet/in.h>
- #include <pwd.h>
-diff --git a/util.c b/util.c
-index e7e3442..83b3b20 100644
---- a/util.c
-+++ b/util.c
-@@ -1179,6 +1179,101 @@ UTI_CheckDirPermissions(const char *path, mode_t perm, uid_t uid, gid_t gid)
- 
- /* ================================================== */
- 
-+static int
-+join_path(const char *basedir, const char *name, const char *suffix,
-+          char *buffer, size_t length, LOG_Severity severity)
-+{
-+  const char *sep;
-+
-+  if (!basedir) {
-+    basedir = "";
-+    sep = "";
-+  } else {
-+    sep = "/";
-+  }
-+
-+  if (!suffix)
-+    suffix = "";
-+
-+  if (snprintf(buffer, length, "%s%s%s%s", basedir, sep, name, suffix) >= length) {
-+    LOG(severity, "File path %s%s%s%s too long", basedir, sep, name, suffix);
-+    return 0;
-+  }
-+
-+  return 1;
-+}
-+
-+/* ================================================== */
-+
-+FILE *
-+UTI_OpenFile(const char *basedir, const char *name, const char *suffix,
-+             char mode, mode_t perm)
-+{
-+  const char *file_mode;
-+  char path[PATH_MAX];
-+  LOG_Severity severity;
-+  int fd, flags;
-+  FILE *file;
-+
-+  severity = mode >= 'A' && mode <= 'Z' ? LOGS_FATAL : LOGS_ERR;
-+
-+  if (!join_path(basedir, name, suffix, path, sizeof (path), severity))
-+    return NULL;
-+
-+  switch (mode) {
-+    case 'r':
-+    case 'R':
-+      flags = O_RDONLY;
-+      file_mode = "r";
-+      if (severity != LOGS_FATAL)
-+        severity = LOGS_DEBUG;
-+      break;
-+    case 'w':
-+    case 'W':
-+      flags = O_WRONLY | O_CREAT | O_EXCL;
-+      file_mode = "w";
-+      break;
-+    case 'a':
-+    case 'A':
-+      flags = O_WRONLY | O_CREAT | O_APPEND;
-+      file_mode = "a";
-+      break;
-+    default:
-+      assert(0);
-+      return NULL;
-+  }
-+
-+try_again:
-+  fd = open(path, flags, perm);
-+  if (fd < 0) {
-+    if (errno == EEXIST) {
-+      if (unlink(path) < 0) {
-+        LOG(severity, "Could not remove %s : %s", path, strerror(errno));
-+        return NULL;
-+      }
-+      DEBUG_LOG("Removed %s", path);
-+      goto try_again;
-+    }
-+    LOG(severity, "Could not open %s : %s", path, strerror(errno));
-+    return NULL;
-+  }
-+
-+  UTI_FdSetCloexec(fd);
-+
-+  file = fdopen(fd, file_mode);
-+  if (!file) {
-+    LOG(severity, "Could not open %s : %s", path, strerror(errno));
-+    close(fd);
-+    return NULL;
-+  }
-+
-+  DEBUG_LOG("Opened %s fd=%d mode=%c", path, fd, mode);
-+
-+  return file;
-+}
-+
-+/* ================================================== */
-+
- void
- UTI_DropRoot(uid_t uid, gid_t gid)
- {
-diff --git a/util.h b/util.h
-index e3d6767..a2481cc 100644
---- a/util.h
-+++ b/util.h
-@@ -176,6 +176,17 @@ extern int UTI_CreateDirAndParents(const char *path, mode_t mode, uid_t uid, gid
-    permissions and its uid/gid must match the specified values. */
- extern int UTI_CheckDirPermissions(const char *path, mode_t perm, uid_t uid, gid_t gid);
- 
-+/* Open a file.  The full path of the file is constructed from the basedir
-+   (may be NULL), '/' (if basedir is not NULL), name, and suffix (may be NULL).
-+   Created files have specified permissions (umasked).  Returns NULL on error.
-+   The following modes are supported (if the mode is an uppercase character,
-+   errors are fatal):
-+   r/R - open an existing file for reading
-+   w/W - open a new file for writing (remove existing file)
-+   a/A - open an existing file for appending (create if does not exist) */
-+extern FILE *UTI_OpenFile(const char *basedir, const char *name, const char *suffix,
-+                          char mode, mode_t perm);
-+
- /* Set process user/group IDs and drop supplementary groups */
- extern void UTI_DropRoot(uid_t uid, gid_t gid);
- 
--- 
-cgit v0.10.2
-
diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 187898a6ef..97b44dc7aa 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -18,45 +18,60 @@ Subject: [PATCH] chrony: fix build failure for arma9
     Refresh patch for new upstream version.
 
     Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
+    Refreshed for 4.0
+
+    Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  sys_linux.c | 20 ++++++++++++++------
  1 file changed, 14 insertions(+), 6 deletions(-)
 
-diff --git a/sys_linux.c b/sys_linux.c
-index 898dc7a..b268ad1 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -479,14 +479,14 @@ SYS_Linux_EnableSystemCallFilter(int level)
-   const int syscalls[] = {
-     /* Clock */
-     SCMP_SYS(adjtimex), SCMP_SYS(clock_gettime), SCMP_SYS(gettimeofday),
--    SCMP_SYS(settimeofday), SCMP_SYS(time),
-+    SCMP_SYS(settimeofday),
+@@ -499,14 +499,12 @@ SYS_Linux_EnableSystemCallFilter(int lev
+ #endif
+     SCMP_SYS(gettimeofday),
+     SCMP_SYS(settimeofday),
+-    SCMP_SYS(time),
+
      /* Process */
-     SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group), SCMP_SYS(getpid),
--    SCMP_SYS(getrlimit), SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
-+    SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
-     SCMP_SYS(rt_sigprocmask), SCMP_SYS(set_tid_address), SCMP_SYS(sigreturn),
-     SCMP_SYS(wait4), SCMP_SYS(waitpid),
+     SCMP_SYS(clone),
+     SCMP_SYS(exit),
+     SCMP_SYS(exit_group),
+     SCMP_SYS(getpid),
+-    SCMP_SYS(getrlimit),
+     SCMP_SYS(getuid),
+     SCMP_SYS(rt_sigaction),
+     SCMP_SYS(rt_sigreturn),
+@@ -519,7 +517,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
      /* Memory */
--    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap), SCMP_SYS(mmap2),
-+    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap2),
-     SCMP_SYS(mprotect), SCMP_SYS(mremap), SCMP_SYS(munmap), SCMP_SYS(shmdt),
-     /* Filesystem */
-     SCMP_SYS(_llseek), SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown),
-@@ -499,14 +499,22 @@ SYS_Linux_EnableSystemCallFilter(int level)
-     SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname), SCMP_SYS(getsockopt),
-     SCMP_SYS(recv), SCMP_SYS(recvfrom), SCMP_SYS(recvmmsg), SCMP_SYS(recvmsg),
-     SCMP_SYS(send), SCMP_SYS(sendmmsg), SCMP_SYS(sendmsg), SCMP_SYS(sendto),
+     SCMP_SYS(brk),
+     SCMP_SYS(madvise),
+-    SCMP_SYS(mmap),
+     SCMP_SYS(mmap2),
+     SCMP_SYS(mprotect),
+     SCMP_SYS(mremap),
+@@ -573,8 +570,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+     SCMP_SYS(sendmsg),
+     SCMP_SYS(sendto),
+     SCMP_SYS(shutdown),
 -    /* TODO: check socketcall arguments */
 -    SCMP_SYS(socketcall),
+
      /* General I/O */
-     SCMP_SYS(_newselect), SCMP_SYS(close), SCMP_SYS(open), SCMP_SYS(openat), SCMP_SYS(pipe),
-     SCMP_SYS(pipe2), SCMP_SYS(poll), SCMP_SYS(ppoll), SCMP_SYS(pselect6), SCMP_SYS(read),
--    SCMP_SYS(futex), SCMP_SYS(select), SCMP_SYS(set_robust_list), SCMP_SYS(write),
-+    SCMP_SYS(futex), SCMP_SYS(set_robust_list), SCMP_SYS(write),
-     /* Miscellaneous */
-     SCMP_SYS(getrandom), SCMP_SYS(sysinfo), SCMP_SYS(uname),
+     SCMP_SYS(_newselect),
+@@ -597,7 +592,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+ #ifdef __NR_futex_time64
+     SCMP_SYS(futex_time64),
+ #endif
+-    SCMP_SYS(select),
+     SCMP_SYS(set_robust_list),
+     SCMP_SYS(write),
+
+@@ -605,6 +599,15 @@ SYS_Linux_EnableSystemCallFilter(int lev
+     SCMP_SYS(getrandom),
+     SCMP_SYS(sysinfo),
+     SCMP_SYS(uname),
 +    /* not always available */
 +#if ! defined(__ARM_EABI__)
 +    SCMP_SYS(time),
@@ -66,10 +81,6 @@ index 898dc7a..b268ad1 100644
 +    /* TODO: check socketcall arguments */
 +    SCMP_SYS(socketcall),
 +#endif
-+
    };
- 
-   const int socket_domains[] = {
--- 
-2.17.1
 
+   const int socket_domains[] = {
diff --git a/meta-networking/recipes-support/chrony/chrony/chronyd b/meta-networking/recipes-support/chrony/chrony/chronyd
index 04f1b681c4..8c7c167b3c 100644
--- a/meta-networking/recipes-support/chrony/chrony/chronyd
+++ b/meta-networking/recipes-support/chrony/chrony/chronyd
@@ -15,7 +15,7 @@
 PATH=/sbin:/bin:/usr/bin:/usr/sbin
 
 DAEMON=/usr/sbin/chronyd
-PIDFILE=/var/run/chronyd.pid
+PIDFILE=/run/chrony/chronyd.pid
 
 test -x $DAEMON -a -r /etc/chrony.conf || exit 0
 
diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_4.0.bb
similarity index 94%
rename from meta-networking/recipes-support/chrony/chrony_3.5.bb
rename to meta-networking/recipes-support/chrony/chrony_4.0.bb
index 182ce13ccf..c8987013bc 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.0.bb
@@ -34,14 +34,12 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
     file://arm_eabi.patch \
-    file://CVE-2020-14367.patch \
 "
 
 SRC_URI_append_libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[md5sum] = "5f66338bc940a9b51eede8f391e7bed3"
-SRC_URI[sha256sum] = "4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5"
+SRC_URI[sha256sum] = "be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625"
 
 DEPENDS = "pps-tools"
 
@@ -82,6 +80,10 @@ DISABLE_STATIC = ""
 do_configure() {
     ./configure --sysconfdir=${sysconfdir} --bindir=${bindir} --sbindir=${sbindir} \
                 --localstatedir=${localstatedir} --datarootdir=${datadir} \
+                --with-ntp-era=$(shell date -d '1970-01-01 00:00:00+00:00' +'%s') \
+                --with-pidfile=/run/chrony/chronyd.pid \
+                --chronyrundir=/run/chrony \
+                --host-system=Linux \
                 ${PACKAGECONFIG_CONFARGS}
 }
 
@@ -107,9 +109,6 @@ do_install() {
     # Variable data (for drift and/or rtc file)
     install -d ${D}${localstatedir}/lib/chrony
 
-    # Log files
-    install -d ${D}${localstatedir}/log/chrony
-
     # Fix hard-coded paths in config files and init scripts
     sed -i -e 's!/var/!${localstatedir}/!g' -e 's!/etc/!${sysconfdir}/!g' \
            -e 's!/usr/sbin/!${sbindir}/!g' -e 's!/usr/bin/!${bindir}/!g' \
@@ -120,7 +119,7 @@ do_install() {
     sed -i 's!^EnvironmentFile=.*!EnvironmentFile=-${sysconfdir}/default/chronyd!' ${D}${systemd_unitdir}/system/chronyd.service
 }
 
-FILES_${PN} = "${sbindir}/chronyd ${sysconfdir} ${localstatedir}"
+FILES_${PN} = "${sbindir}/chronyd ${sysconfdir} ${localstatedir}/lib/chrony ${localstatedir}"
 CONFFILES_${PN} = "${sysconfdir}/chrony.conf"
 INITSCRIPT_NAME = "chronyd"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.29.2

