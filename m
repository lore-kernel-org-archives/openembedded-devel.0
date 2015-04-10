Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9516ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 10:17:19 +0000 (UTC)
Received: by wizk4 with SMTP id k4so122843631wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xu/5OUO2J7LeqKetohsj6O7VgjNNQshMJyt4i3rPPH0=;
	b=ew3CVk6GuZhQ/rJU/Nc+X1xhGmWx3YzQySwOf89wZorPHgtZ9EXiOQZO8I4I8hSvgK
	2KhuI81b5IAkU5HAElSUJpexhF76iE7ryoCHq9EZNcBZKgu7pikhsZ1mn69gRhZ2MPJK
	gFL5eaYXeIlHZZD8V4bvSDHJ3x0g2Ya7IUAurn6VBqDJrJc9mk4lXkMej05nBRKOEkMs
	Mg2DAw/Pj54JFsVWFy96gWBqZeXrddHCaErApnXN5tYiBDZfOg45pnFuxTAw5KlC6h8B
	3y3rhr0qvlv+SvzUk41v0sxr4YsWMfwCWpP5j0CRZxVGJw/GvCH6TsiOBlLzXSBeibwj
	gLnw==
X-Received: by 10.194.90.15 with SMTP id bs15mr1787736wjb.22.1428661040956;
	Fri, 10 Apr 2015 03:17:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id u6sm2254435wjy.13.2015.04.10.03.17.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 03:17:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Apr 2015 12:17:30 +0200
Message-Id: <1428661050-3931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] ltrace: fix build with -Os
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
X-List-Received-Date: Fri, 10 Apr 2015 10:17:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...n-Linux-backend-initialize-linkmap-struct.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
new file mode 100644
index 0000000..13609c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
@@ -0,0 +1,31 @@
+From efd12cfb10ccd2c612838c0e22069554ce60637c Mon Sep 17 00:00:00 2001
+From: Petr Machata <pmachata@redhat.com>
+Date: Wed, 2 Jan 2013 16:01:43 +0100
+Subject: [PATCH] In Linux backend, initialize linkmap struct
+
+GCC 4.7.2 -m32 -Os gives the following (spurious) warning:
+proc.c: In function 'crawl_linkmap':
+proc.c:544:25: error: 'rlm.l_addr' may be used uninitialized in this
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ sysdeps/linux-gnu/proc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/proc.c b/sysdeps/linux-gnu/proc.c
+index 6e01d28..d69c985 100644
+--- a/sysdeps/linux-gnu/proc.c
++++ b/sysdeps/linux-gnu/proc.c
+@@ -484,7 +484,7 @@ crawl_linkmap(struct process *proc, struct lt_r_debug_64 *dbg)
+ 	arch_addr_t addr = (arch_addr_t)(uintptr_t)dbg->r_map;
+ 
+ 	while (addr != 0) {
+-		struct lt_link_map_64 rlm;
++		struct lt_link_map_64 rlm = {};
+ 		if (lm_fetcher(proc)(proc, addr, &rlm) < 0) {
+ 			debug(2, "Unable to read link map");
+ 			return;
+-- 
+2.3.5
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 6984848..f9f1684 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN} = "elfutils"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git \
            file://ltrace-0.7.2-unused-typedef.patch \
            file://configure-allow-to-disable-selinux-support.patch \
+           file://0001-In-Linux-backend-initialize-linkmap-struct.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.3.5


