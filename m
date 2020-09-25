Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.1037.1601011866041376670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 22:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; 
   d="scan'208";a="99602560"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 13:31:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 786D348990FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 13:31:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 13:31:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] numactl: upgrade 2.0.13 -> 2.0.14
Date: Sat, 26 Sep 2020 01:31:12 +0800
Message-ID: <1601055072-37639-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 786D348990FB.A0FFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

numactl/0001-numademo-fix-error-on-32bit-system.patch
Removed since this is included in 2.0.14

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...1-numademo-fix-error-on-32bit-system.patch | 100 ------------------
 .../recipes-support/numactl/numactl_git.bb    |   5 +-
 2 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch

diff --git a/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch b/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
deleted file mode 100644
index 506101711a..0000000000
--- a/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 68485f8516884377e54c623b0deff73f97321d96 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Thu, 19 Sep 2019 04:32:31 -0400
-Subject: [PATCH] numademo: fix error on 32bit system
-
-Error Info on 32bit:
-root@intel-x86:~# numademo -t -e 1M
-Configured Nodes does not match available memory nodes
-
-That's because sizeof(long)=4Word, but sizeof(long long)=8Word
-on 32bit. So (long long) assigning to (long) maybe cause overflow.
-
-long numa_node_size(int node, long *freep)
-{
-    ...
-    long sz = numa_node_size64_int(node, &f2);
-    ~^^~
-    return sz;
-    ...
-}
-long long numa_node_size64(int node, long long *freep)
-~^^   ^^~
-{
-    ...
-}
-
-Unify the return type of above functions.
-
-Upstream-Status: Accepted [next version is after 2.0.13 or 2.0.14]
-[https://github.com/numactl/numactl/commit/a7c4bc790a191d3e42b63850b409c1a72b75a4e1]
-                 Submitted [https://github.com/numactl/numactl/pull/79]
-[The first patch was merged but has a error, then the second fix it.]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- libnuma.c         | 4 ++--
- numa.h            | 2 +-
- numademo.c        | 2 +-
- test/move_pages.c | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libnuma.c b/libnuma.c
-index cac8851..8b5c6aa 100644
---- a/libnuma.c
-+++ b/libnuma.c
-@@ -791,10 +791,10 @@ long long numa_node_size64(int node, long long *freep)
- 
- make_internal_alias(numa_node_size64);
- 
--long numa_node_size(int node, long *freep)
-+long long numa_node_size(int node, long long *freep)
- {
- 	long long f2;
--	long sz = numa_node_size64_int(node, &f2);
-+	long long sz = numa_node_size64_int(node, &f2);
- 	if (freep)
- 		*freep = f2;
- 	return sz;
-diff --git a/numa.h b/numa.h
-index 3a8c543..268fb1d 100644
---- a/numa.h
-+++ b/numa.h
-@@ -143,7 +143,7 @@ int numa_preferred(void);
- 
- /* Return node size and free memory */
- long long numa_node_size64(int node, long long *freep);
--long numa_node_size(int node, long *freep);
-+long long numa_node_size(int node, long long *freep);
- 
- int numa_pagesize(void);
- 
-diff --git a/numademo.c b/numademo.c
-index a720db0..8c56da8 100644
---- a/numademo.c
-+++ b/numademo.c
-@@ -301,7 +301,7 @@ int max_node, numnodes;
- int get_node_list(void)
- {
-         int a, got_nodes = 0;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
-diff --git a/test/move_pages.c b/test/move_pages.c
-index d1d8436..f8ff25d 100644
---- a/test/move_pages.c
-+++ b/test/move_pages.c
-@@ -26,7 +26,7 @@ int *node_to_use;
- int get_node_list()
- {
-         int a, got_nodes = 0, max_node, numnodes;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index 20b7fed862..75e4435db0 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -10,15 +10,14 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "5d9f16722e3df49dc618a9f361bd482559695db7"
-PV = "2.0.13+git${SRCPV}"
+SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
+PV = "2.0.14+git${SRCPV}"
 
 SRC_URI = "git://github.com/numactl/numactl \
     file://Fix-the-test-output-format.patch \
     file://Makefile \
     file://run-ptest \
     file://0001-define-run-test-target.patch \
-    file://0001-numademo-fix-error-on-32bit-system.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.25.1



