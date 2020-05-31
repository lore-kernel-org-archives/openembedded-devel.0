Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.18202.1590941811325715385
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NCvN91mt;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y17so1456553plb.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Iqby+GgltiNv7ojHRPpW3i8uDvb5WTTBUTQgyiQkkeA=;
        b=NCvN91mtoI5t3BGXb3OP5CZCvZDlCFfVizdq+E5cW6Xx/a0f3rLxww88AzYd8ifJQd
         DUOmhOIcOC6n9/tWhWQWshDl8/30g40WMXz+jioAvFG2Ebi4xFB4mYHlfPRDod2JYhVp
         znb1u3Zj8nKXjPjHqucR/jwrX2I7iKdHLC/t6NPyW84eZKBXfpWFHZaAg1WJSuXOI2z1
         IM/yZBF4aPa99PQwyFxv1Yoebo6qU6iL4PXCDlm3WeCUmY6aUPuoA1N8eRKvuZHviHH4
         1BNHFa0aJbTQP5Xfgm6LNQ/Vthq0Ia3gMCkgcrv/bOFXlebQMaH9NL0Xs3Jrj0AxjMwG
         fDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Iqby+GgltiNv7ojHRPpW3i8uDvb5WTTBUTQgyiQkkeA=;
        b=tjGzV85klBxhSAH20yRd2f7o511kLhn6YTwyGXPqcr/BR9XZWYa92SzGIlCL48lNBG
         nSU9X0rLQhEIOHZGdDTx9LYwR/7S0o7ZyLTzgtaSuDxDGihjMCe2uSuYSc7wPEBBuXob
         sQRpsR62+ShIRcxnxypF4a7j0Bx7ZDQj9zhw0EuiPMODSXCjDjaRxO2OTV84Paw5iYun
         Jz3zmRrj9cRwi4eH3C9jFJWFGnF1KVWpBX0cEkFWBn2zfKzCqg9rfu0bPSbw3CMdNqku
         P2p0r0UIVHiKJPL6EhD7BrD2a65KIbMFAmqy52wGOalMBeKfdjbIHRw48ByqzuUy8e18
         j3cw==
X-Gm-Message-State: AOAM530nl5BgDCcwrRuKgH9GzGE2HCRzEz/mN5PqtH5I8KiqDrKKtcRk
	S4WLgXLUlcJihCNC2T0w/WJe0dxh
X-Google-Smtp-Source: ABdhPJySNKnm9S1Lq9oj2k6Hk3Kxb7rGhvn6xndUog9yZdzNw4Ca0EtnM5RVofvtME36iydd4HSNGw==
X-Received: by 2002:a17:90a:c791:: with SMTP id gn17mr19454577pjb.46.1590941810519;
        Sun, 31 May 2020 09:16:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 21/35] dnsmasq: upgrade 2.80 -> 2.81
Date: Sun, 31 May 2020 09:16:08 -0700
Message-Id: <3cd83be02d871c549a815301578b0d29dec1510f.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
-dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 Removed since these are included in 2.81

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 36ece5c83f20f4fc923f1606979ea911ecb93da8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------------
 ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 -------------------
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   | 10 ----
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  8 +++
 4 files changed, 8 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
deleted file mode 100644
index 844a709856..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 52f4b58c14a2788ca08b7d8884d586724d86fc66 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Mon, 19 Aug 2019 14:46:02 +0000
-Subject: [PATCH] dnsmasq: fix build against 5.2 headers
-
-Upstream linux y2038 work has moved some definitions SIOCGSTAMP is
-defined in linux/sockios.h, not asm/sockios.h now. So we need to
-add that include to fix the build.
-
-Upstream-status: backport of http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- a/src/dnsmasq.h                   | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h b/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h
-index f53e9a5be6..d9225ea473 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -138,6 +138,7 @@ typedef unsigned long long u64;
- #endif
- 
- #if defined(HAVE_LINUX_NETWORK)
-+#include <linux/sockios.h>
- #include <linux/capability.h>
- /* There doesn't seem to be a universally-available 
-    userspace header for these. */
--- 
-2.19.1
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
deleted file mode 100644
index ccd6f82ae8..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Wed, 14 Aug 2019 20:44:50 +0100
-Subject: [PATCH] Fix memory leak in helper.c
-
-Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
-
-CVE: CVE-2019-14834
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- src/helper.c |   12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/helper.c b/src/helper.c
-index 33ba120..c392eec 100644
---- a/src/helper.c
-+++ b/src/helper.c
-@@ -82,7 +82,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
-   pid_t pid;
-   int i, pipefd[2];
-   struct sigaction sigact;
--
-+  unsigned char *alloc_buff = NULL;
-+  
-   /* create the pipe through which the main program sends us commands,
-      then fork our process. */
-   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
-@@ -188,11 +189,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
-       struct script_data data;
-       char *p, *action_str, *hostname = NULL, *domain = NULL;
-       unsigned char *buf = (unsigned char *)daemon->namebuff;
--      unsigned char *end, *extradata, *alloc_buff = NULL;
-+      unsigned char *end, *extradata;
-       int is6, err = 0;
-       int pipeout[2];
- 
--      free(alloc_buff);
-+      /* Free rarely-allocated memory from previous iteration. */
-+      if (alloc_buff)
-+	{
-+	  free(alloc_buff);
-+	  alloc_buff = NULL;
-+	}
-       
-       /* we read zero bytes when pipe closed: this is our signal to exit */ 
-       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
--- 
-1.7.10.4
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
deleted file mode 100644
index 827565051d..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.80.md5sum] = "1f071fd11454e1cffea73bdadcf70b21"
-SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"
-SRC_URI += "\
-    file://lua.patch \
-    file://0001-dnsmasq-fix-build-against-5.2-headers.patch \
-    file://0001-dnsmasq-fix-memory-leak-in-helper-c.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
new file mode 100644
index 0000000000..92415386c2
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.81.md5sum] = "e43808177a773014b5892ccba238f7a8"
+SRC_URI[dnsmasq-2.81.sha256sum] = "3c28c68c6c2967c3a96e9b432c0c046a5df17a426d3a43cffe9e693cf05804d0"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.17.1

