Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 021297FDC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 02:19:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00A2Iugo032115
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Jan 2020 18:19:07 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 9 Jan 2020 18:18:45 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 18:18:45 -0800
Message-ID: <20200110021845.126947-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] dnsmasq: CVE-2019-14834
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
X-List-Received-Date: Fri, 10 Jan 2020 02:19:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport the CVE patch from the upstream to fix the memory leak.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 +++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
new file mode 100644
index 000000000..ccd6f82ae
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
@@ -0,0 +1,49 @@
+From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 14 Aug 2019 20:44:50 +0100
+Subject: [PATCH] Fix memory leak in helper.c
+
+Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
+
+CVE: CVE-2019-14834
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ src/helper.c |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/helper.c b/src/helper.c
+index 33ba120..c392eec 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -82,7 +82,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+   pid_t pid;
+   int i, pipefd[2];
+   struct sigaction sigact;
+-
++  unsigned char *alloc_buff = NULL;
++  
+   /* create the pipe through which the main program sends us commands,
+      then fork our process. */
+   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
+@@ -188,11 +189,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+       struct script_data data;
+       char *p, *action_str, *hostname = NULL, *domain = NULL;
+       unsigned char *buf = (unsigned char *)daemon->namebuff;
+-      unsigned char *end, *extradata, *alloc_buff = NULL;
++      unsigned char *end, *extradata;
+       int is6, err = 0;
+       int pipeout[2];
+ 
+-      free(alloc_buff);
++      /* Free rarely-allocated memory from previous iteration. */
++      if (alloc_buff)
++	{
++	  free(alloc_buff);
++	  alloc_buff = NULL;
++	}
+       
+       /* we read zero bytes when pipe closed: this is our signal to exit */ 
+       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
+-- 
+1.7.10.4
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
index 6f3d5daa6..827565051 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -5,5 +5,6 @@ SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d35
 SRC_URI += "\
     file://lua.patch \
     file://0001-dnsmasq-fix-build-against-5.2-headers.patch \
+    file://0001-dnsmasq-fix-memory-leak-in-helper-c.patch \
 "
 
-- 
2.23.0


