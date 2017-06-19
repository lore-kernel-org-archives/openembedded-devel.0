Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id E8A4A78280
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 01:05:27 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 132so7716211pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 18:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HcHNNEmo2GJzPneSqDzMKOqBaC8468yXhEY2rfX6haM=;
	b=FrWk8fFM/x1Mznhq+90vljXsLLwQNgyi5EbwWFYjnFRnLxRZx72fIts4vaTnDgmNqh
	CegL63uAdFL77C8byZVuNuIEW8NnEhmHeDddGfkgXChiU4FpJrgz4Rl5+6EZomyxu6ct
	rTstPqPU7y7QQlUcB9ZNCVa21pyGqiYMGY8hnapxNVr3beDENpuX65KmdZeuvlTnzz3s
	LnGksz0o0E30ifjrXUAFcrd5fc/rdU9tVr9akge1oG4Tgl26u9fDoWmaStVogNwRtAGD
	gZe9vOclmopxnbXwAa/qDFe3HxTF2rUmKDYHwNf0dmLn5/Ibik7REjRx3n7VXEryOwA1
	lMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HcHNNEmo2GJzPneSqDzMKOqBaC8468yXhEY2rfX6haM=;
	b=PubJryeXz5HwgHICsvGVjKwirUXEOyfWo/UxuJcrFMDCTvdhFuIMSK/di+mH0wqYRi
	VbJEM6uyLs8T9UjAHM5AO2vPprRz5rWljA1d3MFUvXWGRtB8vLvbqf50hTRue8rHmQjX
	sVNrfYEld+u66Moz0Yd67w0cbFX14jHdh8NpkWP8OYkvudUFXOmoeEoGlm+ZVe0UnnHA
	i4HlQup/7ejNKeEKvofJ0+Q/x2uutsv1RQSev8W/9vFH3NRD7kNJRyFPH1s9LA8T1d0/
	YmeU6ZUnrb6Mg7DCA6smCSGmJfeaNM+ITP30OLpFGiFoHn4XpgeCtCNomJEHdRZd6Tgw
	JRPw==
X-Gm-Message-State: AKS2vOyJ4x9Tp9c8lySSp3QtYkU+M0xA+VWmKxHbzSen5/JOA4enaT6t
	MnIbapemXvzKRUmO
X-Received: by 10.98.218.25 with SMTP id c25mr22940734pfh.118.1497834328801;
	Sun, 18 Jun 2017 18:05:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	t128sm15389319pfd.64.2017.06.18.18.05.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jun 2017 18:05:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jun 2017 18:05:15 -0700
Message-Id: <20170619010516.11453-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170619010516.11453-1-raj.khem@gmail.com>
References: <20170619010516.11453-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] sqlite: Fix build with hardening flags
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
X-List-Received-Date: Mon, 19 Jun 2017 01:05:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Fix-format-not-a-string-literal-warning.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb    |  8 ++++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch

diff --git a/meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch b/meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
new file mode 100644
index 000000000..c5d7c0c81
--- /dev/null
+++ b/meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
@@ -0,0 +1,32 @@
+From 443980ddc82fb40e2e1f9544f2be169bd23dd246 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 16:49:24 -0700
+Subject: [PATCH] shell.c:  Fix format not a string literal warning
+
+src/shell.c:695:20: error: format not a string literal and no format arguments [-Werror=format-security]
+|      fprintf(stderr,zHelp);
+|                     ^~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shell.c b/src/shell.c
+index bb46c49..3c6fe0f 100644
+--- a/src/shell.c
++++ b/src/shell.c
+@@ -692,7 +692,7 @@ static int do_meta_command(char *zLine, struct callback_data *p){
+   }else
+ 
+   if( c=='h' && strncmp(azArg[0], "help", n)==0 ){
+-    fprintf(stderr,zHelp);
++    fprintf(stderr, "%s", zHelp);
+   }else
+ 
+   if( c=='i' && strncmp(azArg[0], "indices", n)==0 && nArg>1 ){
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index e6e14c2ad..501c0e3e7 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=10;md5=e98469a8efa024a
 PR = "r7"
 
 SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
-    file://mainmk_build_dynamic.patch \
-    file://mainmk_no_tcl.patch \
-    file://sqlite.pc"
+           file://mainmk_build_dynamic.patch \
+           file://mainmk_no_tcl.patch \
+           file://sqlite.pc \
+           file://0001-shell.c-Fix-format-not-a-string-literal-warning.patch \
+           "
 
 SOURCES = "attach.o auth.o btree.o btree_rb.o build.o copy.o date.o delete.o \
            expr.o func.o hash.o insert.o main.o opcodes.o os.o pager.o \
-- 
2.13.1


