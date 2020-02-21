Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 549776174D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:49:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNqY0Q7Bz4c
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318169;
	bh=c+hHVaKPSzD4NtIr35K79xsy+vFym+r9dW8fNqGvl70=;
	h=From:To:Subject:Date:From;
	b=qdHco5WgArLM2FSOcp3UbRzLcCboT1ne2kzKkcRzOeyENH6Th+NqxkYvMAFy9OP1h
	7FZKCFchT/+bwyEhPv6O9+RuwKd1OS7xA6R/fMqYZgieAYBGGKXja6TY+IWYfHJQ2Y
	hKlW9xnM3s2FjvQKTGFxuC9UdiabrSsnG5JWOkM1I0Okv/G0oP62oQ8mDLklkWgh3n
	mBpHyix7kcI3RAsNQyiX0X8e71HbAd6r9LLACYWm4v1vIjDrgxEmBrX50wHX5i+FES
	twgk5rcHZCzBpw81uI8mjNdIjbmR+C0Od8hkEwlN90Vc0eunX3V2gM/+XEJ/o7HiOi
	19iWupQU08WaYDNSKAB6dFEXTZCZHaF490aduwPVPKU3hV+VUKDe3EQsDPbXDdh4EH
	81srlSO3xM8NozKex7inAJHVPkSH0oXyhhPvLxa9aCVPiApebqc7RtsgMKBQQPIKtB
	z7551XbmwHT5prUaq87svnPrv+WP3tOhDyjOQfhpvp6v8ENret68nbrR9z3SgCJBrd
	rJXfHzwRco3aF+M3dviDMq7hfiCTD4Yput04S3G33VZys1PT1bUnSW+tQF7tTOJEl4
	Yql3bo+DaQhvR1hw9ubgNExJUdnDXjnXP/1HM4PvSSjYqUySg26vR4fDrh5lgI7FCy
	rUr+dN5pEX8+PWxstD3PhYGM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:49:26 +0200
Message-Id: <20200221204927.13293-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] dnsmasq: CVE-2019-14834
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
X-List-Received-Date: Fri, 21 Feb 2020 20:49:28 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from the upstream to fix the memory leak.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8ca82feb5d6ceb843aad33dada947b456f7fcac)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
index fdbdefbad..1e5e74bbc 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -4,5 +4,6 @@ SRC_URI[dnsmasq-2.80.md5sum] = "1f071fd11454e1cffea73bdadcf70b21"
 SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"
 SRC_URI += "\
     file://lua.patch \
+    file://0001-dnsmasq-fix-memory-leak-in-helper-c.patch \
 "
 
-- 
2.17.1


