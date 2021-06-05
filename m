Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.7509.1622856609698164692
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZDAyC4Mn;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id t21so5541739plo.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1od947YjkRiOnH4EwUMsBNSGZ/WRWFxAf6sqWe6Vnk=;
        b=ZDAyC4Mn9F6kE7aUNC0MDet+9I5epJuPhmyeTmOYfMZBOOePkoT8m6xgIlA1lk/Y1q
         CHUIz+z3fMpa07Hb0TRI4M5lYv13YudxRAkVoDZpkDIA4xzAL/65QUb7oWr0xPPuOrt2
         1wUYGyEXtW4VWcCG4hIVbZlftnfGN02dwdKPI7BFT33HWvS0fR6GkWtpLB18Ppf+4EoZ
         ccrABE6r4Kr3kixm7Jc80FkcaJGj1c0zerRlY+Q7JnKpir8emwdQpDwCc2IuIk42k/S9
         4KZXCxZKlfBfFwb4bl8fjG08EPJxBabho+9bieMwQXUbT9aIsS0+tABvuHzayRCqYKT9
         tvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1od947YjkRiOnH4EwUMsBNSGZ/WRWFxAf6sqWe6Vnk=;
        b=kW33fsI4YC/4KOB3PJJJHRJLPm+OywBd1f3uPIAGTn6TaUZC8JmDOCtgCybGfzFo14
         4n6ZG6w89obkJDz++yodUpFAEBNY9v9vPH/IxLJKTTkuFAiCCmO/xyUIb0ahQmEmxfHZ
         yCc3GiyAYfFtFf2hExJTNW1B21CBvgsiB1k3Z+ywK1GqJF2fUk2177JODkHID3UheBJ9
         A+WZ3RJvGMuZCsK+f3OsIPGh8VxznPC0LWXR8iQm+1vv0iCn4OssELWcXsMUK2fw1jBr
         xZkUTGKbiHYxtQEsulSYjlxZ7lWk9lpxbCcSOXu6kBnnTAbQS20o8TYA1lyiuwD7HdEV
         BlTQ==
X-Gm-Message-State: AOAM530H8HSh8nzYeNnrd3wWB4iCFRy9h2R4DVkHg1dCrWHGg9otXy0z
	dJgGO6H92FAsTux5DWgbiT+Wd+ch1+Hghg==
X-Google-Smtp-Source: ABdhPJyMAcBkrFe7Vbh/ZQ3VYtZa1tnRpIL2MM7HvrhYjFt5YTrPgWyPHXzJRYtSPQacY+eJoX3r+A==
X-Received: by 2002:a17:902:bcc3:b029:ed:4637:fb2f with SMTP id o3-20020a170902bcc3b02900ed4637fb2fmr7067952pls.72.1622856608538;
        Fri, 04 Jun 2021 18:30:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q68sm5767188pjq.45.2021.06.04.18.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:30:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/5] memcached: upgrade to 1.6.9
Date: Fri,  4 Jun 2021 18:30:01 -0700
Message-Id: <20210605013005.976154-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Set but unused clang warning
sigignore issue is already fixed in 1.6.9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Replace-sigignore-with-signal-API.patch | 74 -------------------
 ...heck-for-NDEBUG-before-using-total_w.patch | 48 ++++++++++++
 ...{memcached_1.6.6.bb => memcached_1.6.9.bb} |  4 +-
 3 files changed, 50 insertions(+), 76 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.6.bb => memcached_1.6.9.bb} (91%)

diff --git a/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch b/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
deleted file mode 100644
index e4aa8fda32..0000000000
--- a/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From b9040acdba1245f8cdf5e94384830e3d04fde98a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Jul 2020 21:32:14 -0700
-Subject: [PATCH] Replace sigignore with signal API
-
-sigignore has been deprecated in glibc 2.32+ [1] and eventually it will be
-removed, therefore substitute it
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=02802fafcf6e11ea3f998f685035ffe568dfddeb
-
-Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/702]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac |  1 -
- memcached.c  | 16 ++--------------
- 2 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ffc98b2..4567b30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -630,7 +630,6 @@ AC_CHECK_FUNCS(mlockall)
- AC_CHECK_FUNCS(getpagesizes)
- AC_CHECK_FUNCS(sysconf)
- AC_CHECK_FUNCS(memcntl)
--AC_CHECK_FUNCS(sigignore)
- AC_CHECK_FUNCS(clock_gettime)
- AC_CHECK_FUNCS(preadv)
- AC_CHECK_FUNCS(pread)
-diff --git a/memcached.c b/memcached.c
-index 9cb778d..91ced9e 100644
---- a/memcached.c
-+++ b/memcached.c
-@@ -8292,18 +8292,6 @@ static void sig_usrhandler(const int sig) {
-     stop_main_loop = GRACE_STOP;
- }
- 
--#ifndef HAVE_SIGIGNORE
--static int sigignore(int sig) {
--    struct sigaction sa = { .sa_handler = SIG_IGN, .sa_flags = 0 };
--
--    if (sigemptyset(&sa.sa_mask) == -1 || sigaction(sig, &sa, 0) == -1) {
--        return -1;
--    }
--    return 0;
--}
--#endif
--
--
- /*
-  * On systems that supports multiple page sizes we may reduce the
-  * number of TLB-misses by using the biggest available page size
-@@ -9996,7 +9984,7 @@ int main (int argc, char **argv) {
-     /* daemonize if requested */
-     /* if we want to ensure our ability to dump core, don't chdir to / */
-     if (do_daemonize) {
--        if (sigignore(SIGHUP) == -1) {
-+        if (signal(SIGHUP, SIG_IGN) == SIG_ERR) {
-             perror("Failed to ignore SIGHUP");
-         }
-         if (daemonize(maxcore, settings.verbose) == -1) {
-@@ -10146,7 +10134,7 @@ int main (int argc, char **argv) {
-      * ignore SIGPIPE signals; we can use errno == EPIPE if we
-      * need that information
-      */
--    if (sigignore(SIGPIPE) == -1) {
-+    if (signal(SIGPIPE, SIG_IGN) == SIG_ERR) {
-         perror("failed to ignore SIGPIPE; sigaction");
-         exit(EX_OSERR);
-     }
--- 
-2.27.0
-
diff --git a/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch b/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
new file mode 100644
index 0000000000..2979552a34
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
@@ -0,0 +1,48 @@
+From d6294e9166e4875a0572349aabcc5e51acbd2e3c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jun 2021 11:33:12 -0700
+Subject: [PATCH] stats_prefix.c: Check for NDEBUG before using total_written
+ variable
+
+When using NDEBUG assert macro is ineffective which is caught by latest
+clang and reports that total_written is set but unused. Therefore check
+for NDEBUG to make sure assert is used only when its effective
+
+Fixes
+error: variable 'total_written' set but not used [-Werror,-Wunused-but-set-variable]
+    size_t size = 0, written = 0, total_written = 0;
+                                  ^
+Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/792]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ stats_prefix.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/stats_prefix.c b/stats_prefix.c
+index 62f0d04..d72e514 100644
+--- a/stats_prefix.c
++++ b/stats_prefix.c
+@@ -127,8 +127,10 @@ char *stats_prefix_dump(int *length) {
+     PREFIX_STATS *pfs;
+     char *buf;
+     int i, pos;
+-    size_t size = 0, written = 0, total_written = 0;
+-
++    size_t size = 0, written = 0;
++#ifndef NDEBUG
++    size_t total_written = 0;
++#endif
+     /*
+      * Figure out how big the buffer needs to be. This is the sum of the
+      * lengths of the prefixes themselves, plus the size of one copy of
+@@ -154,8 +156,10 @@ char *stats_prefix_dump(int *length) {
+                            pfs->prefix, pfs->num_gets, pfs->num_hits,
+                            pfs->num_sets, pfs->num_deletes);
+             pos += written;
++#ifndef NDEBUG
+             total_written += written;
+             assert(total_written < size);
++#endif
+         }
+     }
+ 
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.6.bb b/meta-networking/recipes-support/memcached/memcached_1.6.9.bb
similarity index 91%
rename from meta-networking/recipes-support/memcached/memcached_1.6.6.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.9.bb
index 2eb24db9a8..73e18a4038 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.6.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.9.bb
@@ -21,9 +21,9 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
-           file://0001-Replace-sigignore-with-signal-API.patch \
+           file://0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch \
            "
-SRC_URI[sha256sum] = "908f0eecfa559129c9e44edc46f02e73afe8faca355b4efc5c86d902fc3e32f7"
+SRC_URI[sha256sum] = "d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
-- 
2.31.1

