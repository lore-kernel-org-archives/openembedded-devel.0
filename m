Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.5744.1595479447152046296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 21:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F86VEkBk;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id o1so2004558plk.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 21:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eB1AAgNDra+drwiQsSOXSivXRKya/ygQQ6wUx/H9LxI=;
        b=F86VEkBkOeRD0vah8BxVyBBmZD7nOK5mUKmUiI5EtrgGZtkH1EKGO6jiEfYHjQJ1Lj
         ODJE9YxLvSk8rCyP2NKzL+j2YNfBdDeusih3v5Ll+QuFgvNnkoKZjbSQF7vrj2raMl2Z
         YpSorrTUyzy3Sk4PdAMa7WNjRSRQe/JxjJ3caUJMGhxdUMeRJ3is96UIDxbvIgeeBLNI
         eslwzdVzi1cAt57Nus1t9SYfrtDUkeAmXHTBU+ETvL1SGNDuBs2/VEzR5E5H/4g38xZr
         4ecsk2fJ621f41GIWNbQ3MS8bh0WTUOVGp4Ubv0VmU99UlnDswmPbO1AUBnnZgEWaxXa
         6FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eB1AAgNDra+drwiQsSOXSivXRKya/ygQQ6wUx/H9LxI=;
        b=oaORMCAowW3ugxiGTNGcJRR3oGhRZscWv21yo3Lp52TV4Ca1UGxd/6ViQc0I1hwBkB
         pLcQnGgbs0ReoZb+yMgU6H72AkxJ6HFisZ3R5sriQBTEMWTb1X/SvvyX6CTv5bQdsM09
         wYNhxokYl0V5N5nnwXaZz3yZ1OMzy61lSSqyE/M8lAJu8A0isQRl63AEidU73rcNUZLk
         bbmEyMWVC1foAkoDShQs6prM+dCcJvEPRpHTGxXWDCkwhTmfDExa+nEe+BeVZjRnJuzd
         ev1IDO2xNY+3RZA+d7T2v6rC8fMaPM7H5w6aOd8+TB0OqyUNMjNnLvur46o8FWHO8sAV
         u0SA==
X-Gm-Message-State: AOAM5329sSYqGKqZJ/TNc77sQO/1ihSCYSKTeyWti+ci72+ImyHAzE7n
	8vnkrgUJNGitDK1mo3wb/0xlfCI247o=
X-Google-Smtp-Source: ABdhPJxNJBpZWivLVZ+rvoD5xTX0GVG22g4/0Lr1ywtHTpIQqyi6S8m5xlS94DIm1xPflblklpz/rg==
X-Received: by 2002:a17:902:ee8b:: with SMTP id a11mr2316579pld.26.1595479445979;
        Wed, 22 Jul 2020 21:44:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id q11sm1293051pgr.69.2020.07.22.21.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 21:44:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] memcached: Upgrade to 1.6.6
Date: Wed, 22 Jul 2020 21:44:03 -0700
Message-Id: <20200723044403.1738181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add patch to not use deprecated sigignore API

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Replace-sigignore-with-signal-API.patch | 74 +++++++++++++++++++
 .../memcached-add-hugetlbfs-check.patch       | 15 ++--
 ...memcached_1.5.20.bb => memcached_1.6.6.bb} |  4 +-
 3 files changed, 81 insertions(+), 12 deletions(-)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.5.20.bb => memcached_1.6.6.bb} (92%)

diff --git a/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch b/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
new file mode 100644
index 0000000000..e4aa8fda32
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/0001-Replace-sigignore-with-signal-API.patch
@@ -0,0 +1,74 @@
+From b9040acdba1245f8cdf5e94384830e3d04fde98a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Jul 2020 21:32:14 -0700
+Subject: [PATCH] Replace sigignore with signal API
+
+sigignore has been deprecated in glibc 2.32+ [1] and eventually it will be
+removed, therefore substitute it
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=02802fafcf6e11ea3f998f685035ffe568dfddeb
+
+Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/702]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac |  1 -
+ memcached.c  | 16 ++--------------
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ffc98b2..4567b30 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -630,7 +630,6 @@ AC_CHECK_FUNCS(mlockall)
+ AC_CHECK_FUNCS(getpagesizes)
+ AC_CHECK_FUNCS(sysconf)
+ AC_CHECK_FUNCS(memcntl)
+-AC_CHECK_FUNCS(sigignore)
+ AC_CHECK_FUNCS(clock_gettime)
+ AC_CHECK_FUNCS(preadv)
+ AC_CHECK_FUNCS(pread)
+diff --git a/memcached.c b/memcached.c
+index 9cb778d..91ced9e 100644
+--- a/memcached.c
++++ b/memcached.c
+@@ -8292,18 +8292,6 @@ static void sig_usrhandler(const int sig) {
+     stop_main_loop = GRACE_STOP;
+ }
+ 
+-#ifndef HAVE_SIGIGNORE
+-static int sigignore(int sig) {
+-    struct sigaction sa = { .sa_handler = SIG_IGN, .sa_flags = 0 };
+-
+-    if (sigemptyset(&sa.sa_mask) == -1 || sigaction(sig, &sa, 0) == -1) {
+-        return -1;
+-    }
+-    return 0;
+-}
+-#endif
+-
+-
+ /*
+  * On systems that supports multiple page sizes we may reduce the
+  * number of TLB-misses by using the biggest available page size
+@@ -9996,7 +9984,7 @@ int main (int argc, char **argv) {
+     /* daemonize if requested */
+     /* if we want to ensure our ability to dump core, don't chdir to / */
+     if (do_daemonize) {
+-        if (sigignore(SIGHUP) == -1) {
++        if (signal(SIGHUP, SIG_IGN) == SIG_ERR) {
+             perror("Failed to ignore SIGHUP");
+         }
+         if (daemonize(maxcore, settings.verbose) == -1) {
+@@ -10146,7 +10134,7 @@ int main (int argc, char **argv) {
+      * ignore SIGPIPE signals; we can use errno == EPIPE if we
+      * need that information
+      */
+-    if (sigignore(SIGPIPE) == -1) {
++    if (signal(SIGPIPE, SIG_IGN) == SIG_ERR) {
+         perror("failed to ignore SIGPIPE; sigaction");
+         exit(EX_OSERR);
+     }
+-- 
+2.27.0
+
diff --git a/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
index 544b840fea..45428ed234 100644
--- a/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
+++ b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
@@ -9,24 +9,19 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  configure.ac | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 7f22f21..21691b9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -314,7 +314,12 @@ fi
- dnl ----------------------------------------------------------------------------
+@@ -488,8 +488,12 @@ if test "x$enable_static" = "xyes"; then
+ fi
  
- AC_SEARCH_LIBS(umem_cache_create, umem)
--AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
+ dnl ----------------------------------------------------------------------------
 +AC_ARG_ENABLE(hugetlbfs,
 +  [AS_HELP_STRING([--enable-hugetlbfs],[Enable hugetlbfs])])
-+
+ 
+-AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
 +if test "x$enable_hugetlbfs" = "xyes"; then
 +  AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
 +fi
  
  AC_HEADER_STDBOOL
  AH_BOTTOM([#if HAVE_STDBOOL_H
--- 
-1.8.3.4
-
diff --git a/meta-networking/recipes-support/memcached/memcached_1.5.20.bb b/meta-networking/recipes-support/memcached/memcached_1.6.6.bb
similarity index 92%
rename from meta-networking/recipes-support/memcached/memcached_1.5.20.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.6.bb
index feb4f3f14c..2eb24db9a8 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.6.bb
@@ -21,9 +21,9 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
+           file://0001-Replace-sigignore-with-signal-API.patch \
            "
-SRC_URI[md5sum] = "4b64296ea0eeccdee9168c035e0488ab"
-SRC_URI[sha256sum] = "cfd7b023a9cefe7ae8a67184f51d841dbbf97994ed0e8a55e31ee092320ea1e4"
+SRC_URI[sha256sum] = "908f0eecfa559129c9e44edc46f02e73afe8faca355b4efc5c86d902fc3e32f7"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
-- 
2.27.0

