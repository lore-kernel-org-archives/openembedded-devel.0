Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6183.1590114002101485866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 19:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,419,1583164800"; 
   d="scan'208";a="92763899"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 10:19:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C7F9A4BCC8A9
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 10:19:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 10:19:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.80 -> 2.81
Date: Fri, 22 May 2020 19:19:46 +0800
Message-ID: <1590146386-3422-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C7F9A4BCC8A9.A6BD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
-dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 Removed since these are included in 2.81

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
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



