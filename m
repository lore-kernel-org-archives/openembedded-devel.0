Return-Path: <gary.robertson@linaro.org>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED346AC28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 04:19:34 +0000 (UTC)
Received: by qkhg7 with SMTP id g7so218847084qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 21:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VkRaGu7XpJDNnc3cDvtG0h4KfAuEkpSMWQCLpaxFPFo=;
	b=hzmAbhxvBfu2myyxKP/lFD2u+2xd9GndptQX4X3d05KFeu+7i312AS6Mcco24fXwl9
	5E6qTiLI7pU1a5Ndqu00+42dFtZUwBuJY3dYZnZltTwICbDqZMUEmTNCS01fGsX/a2iR
	JQooN5c0GKM3tLpZlWupt8nxSyQ8xsS8Q1YPCdZI7Dqf7/ijV1S9i6HDeaIIWEAs05Ro
	caVPo6juKNvDbmcNVWKSdAgbyk6MqxCTSDM6LbOFC2HEKLmhVTmq7j4nlaWWEZM0wX7X
	TlZvkME37I65JPLkpY2AR84oVrzKQ/3mD4t1lDXJufOxJMzWSUbSwB73qwr+xfwtC1Yr
	IkAg==
X-Gm-Message-State: ALoCoQnaUIYJRjJ/8aqZa99xWBT2yZK9SCi8fyWi8SqLgBQGIcT2hyZjLwTiSXJzLOoaExUnwy5x
X-Received: by 10.182.34.131 with SMTP id z3mr14889223obi.4.1428985174887;
	Mon, 13 Apr 2015 21:19:34 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114]) by mx.google.com with ESMTPSA id
	l140sm5714238oig.20.2015.04.13.21.19.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 21:19:33 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Apr 2015 23:19:00 -0500
Message-Id: <1428985140-4170-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428985140-4170-1-git-send-email-gary.robertson@linaro.org>
References: <20150413134540.GG2330@jama>
	<1428985140-4170-1-git-send-email-gary.robertson@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] libhugetlbfs: x86 - don't link against host libs
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
X-List-Received-Date: Tue, 14 Apr 2015 04:19:36 -0000

An earlier patch from Chunrong Guo <B40290@freescale.com> fixed the
linker command scripts in ldscripts to comment out hard-coded paths
for the linker search directories.  This allows the command line
to specifiy the proper paths without being overridden.
However, the 32-bit ix86 scripts evidently were added after this
earlier patch was created and were not corrected by it - so here
we simply duplicate the technique in the earlier patch and extend it
to correct the linker scripts for 32-bit ix86 builds.

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...86-avoid-host-library-search-in-cross-dev.patch | 48 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-x86-avoid-host-library-search-in-cross-dev.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-x86-avoid-host-library-search-in-cross-dev.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-x86-avoid-host-library-search-in-cross-dev.patch
new file mode 100644
index 0000000..959574e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-x86-avoid-host-library-search-in-cross-dev.patch
@@ -0,0 +1,48 @@
+From b028ae9f43111677056f2661c800096f1994b687 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Mon, 13 Apr 2015 14:41:15 -0500
+Subject: [PATCH] libhugetlbfs: x86 avoid host library search in cross-dev
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+The ldscripts for 32-bit ix86 architectures were not corrected by the earlier
+patch from Chunrong Guo <B40290@freescale.com>... presumably they were added
+after that patch was created.  Here we extend the same technique to include
+the 32-bit ix86 linker scripts, so the command line variables can set the
+linker search directories rather than using hard-coded paths in the ldscripts.
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ ldscripts/elf_i386.xB   | 2 +-
+ ldscripts/elf_i386.xBDT | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ldscripts/elf_i386.xB b/ldscripts/elf_i386.xB
+index 43fe51c..b852781 100644
+--- a/ldscripts/elf_i386.xB
++++ b/ldscripts/elf_i386.xB
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
+ 	      "elf32-i386")
+ OUTPUT_ARCH(i386)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+diff --git a/ldscripts/elf_i386.xBDT b/ldscripts/elf_i386.xBDT
+index d72aebe..b25e225 100644
+--- a/ldscripts/elf_i386.xBDT
++++ b/ldscripts/elf_i386.xBDT
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
+ 	      "elf32-i386")
+ OUTPUT_ARCH(i386)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 6fe5dce..25f1672 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
     file://0001-Makefile-Recognize-all-ix86-arches.patch \
+    file://0001-x86-avoid-host-library-search-in-cross-dev.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


