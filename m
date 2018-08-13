Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF10874607
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:07 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f1-v6so7184130pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=txYr0xcolQ4vuw6Eore3TsFubDr2DG/pgyWYCFe6YWw=;
	b=pxd+182TCbR9iHlKDl4SU+kCo6kpVtmvlNDqTwjEZRADsr5vs4S1IqKxzxVpGPKMjH
	RtjBhrOz1GRBYWDvY4q0x1QL+emWbCubute4Uzk6zFIFO/p6oQDiOjQEgiWnmavn/W39
	LVYWwiaoiYV/ZMVG73BRcvyVJcMXOzTH5F//MH9ubg5M3KzTM8tXjNqcaBuBn4GOvYBS
	789INkGxc/PGNegGqKq/42IYP6vSWDnU2tVe1lplecrV0qRXYClnOFHBaWmC1/8J7HGD
	M4Obud/x8d0QTil+h6OiBczgVRbecqVT7BBKGbpIipKjEZz4aD9R8FtdqiHrOM1WG+0o
	+dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=txYr0xcolQ4vuw6Eore3TsFubDr2DG/pgyWYCFe6YWw=;
	b=LFyxJcyCYp8Io/NDaytPG9Z6nRcoWTZ463dWpXsxw+perPxfUpoGrTzGqUlGKmz69W
	NzpbfxzOZjq+aNPzDFAolPh+dvpmH4q1A/EsKh9gqoU5+LtSSCz+4vlF4vovCLhBJZ4c
	oAr1VeyU53RtJxE29Eu7EeNQ85cqI+Vuib2mVhvz0VIHc1vHvfBQZ3isV57SYpJ/GqxI
	TBVZ3F5uwQmMiLEf51QjlpDzdxFNWD+/N10tVPuSNhJqEcRUAx9GUuIVTWnBJbUBnTW/
	IWnMAbFubh1t/qYd3vfuiFnveUAhzb/9H7elIplBZJwa6m7YHIHxS0wASvqknQc3eddx
	tNCg==
X-Gm-Message-State: AOUpUlFdYEO2gbAQ+k7kZ1n1Rwl3NXGKU4qhXmDxMRy02yKu7TxwLCaf
	KFIImozerUFHaQ72BuSEwciP6ISX
X-Google-Smtp-Source: AA+uWPwGzhlZN+kNKNiwTBekyj0rZ1wI2kj2jQIGg3MxD+GaNIxgAxvmGHddSyGeHcOqA+ixMLGIhg==
X-Received: by 2002:a62:1016:: with SMTP id
	y22-v6mr17998112pfi.109.1534148288438; 
	Mon, 13 Aug 2018 01:18:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:35 -0700
Message-Id: <20180813081742.6961-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 14/21] f2fs-tools: Upgrade to 1.11.0
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:07 -0000

Fix build with when S != B

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...srcdir-prefix-to-denote-include-path.patch | 29 +++++++++++++++
 .../0002-Fix-mkfs-out-of-tree-builds.patch    | 37 -------------------
 ...fs-tools_1.8.0.bb => f2fs-tools_1.11.0.bb} |  8 ++--
 3 files changed, 34 insertions(+), 40 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch
 delete mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.8.0.bb => f2fs-tools_1.11.0.bb} (63%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch
new file mode 100644
index 0000000000..0a3261b4e7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch
@@ -0,0 +1,29 @@
+From 0fb9d6bc25e903f7831a38468845ea143fb5afd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 18:49:03 -0700
+Subject: [PATCH] f2fs-tools: Use srcdir prefix to denote include path
+
+This helps builds when builddir != srcdir
+
+Upstream-Status: Submitted [https://lkml.org/lkml/2018/8/12/1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/sg_write_buffer/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/sg_write_buffer/Makefile.am b/tools/sg_write_buffer/Makefile.am
+index 922c328..19c438d 100644
+--- a/tools/sg_write_buffer/Makefile.am
++++ b/tools/sg_write_buffer/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Makefile.am
+ 
+ if LINUX
+-AM_CPPFLAGS = -I./include
++AM_CPPFLAGS = -I$(srcdir)/include
+ AM_CFLAGS = -Wall
+ sbin_PROGRAMS = sg_write_buffer
+ sg_write_buffer_SOURCES = sg_write_buffer.c \
+-- 
+2.18.0
+
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
deleted file mode 100644
index 9e561cb111..0000000000
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0731eefd389e01419f78a115e1363ed0c28cfd3a Mon Sep 17 00:00:00 2001
-From: "Yong, Jonathan" <jonathan.yong@intel.com>
-Date: Thu, 30 Mar 2017 08:03:37 +0000
-Subject: [PATCH] Fix mkfs out of tree builds
-
-Libraries are built in builddir, not srcdir, fix Makefile.am
-accordingly.
-
-Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-
-The patch was imported from the f2fs-tools repo
-(git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git)
-commit ID 0731eefd389e01419f78a115e1363ed0c28cfd3a.
-
-Upstream-Status: Accepted, expected to be included in 1.9.0.
-
-Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
-
----
- mkfs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
-index 162a0cf..0ea8b49 100644
---- a/mkfs/Makefile.am
-+++ b/mkfs/Makefile.am
-@@ -10,5 +10,5 @@ lib_LTLIBRARIES = libf2fs_format.la
- libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
- libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
- libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
--libf2fs_format_la_LDFLAGS = -luuid -L$(top_srcdir)/lib -lf2fs \
-+libf2fs_format_la_LDFLAGS = -luuid -L$(top_builddir)/lib -lf2fs \
- 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
--- 
-2.10.2
-
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb
similarity index 63%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb
index 691cb6ea0e..2240049d44 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
+# v1.11.0
+SRCREV = "b98fab3666e498c2e27ad9dcda6874c9b683f06b"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git \
-    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
-    file://0002-Fix-mkfs-out-of-tree-builds.patch"
+           file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
+           file://0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch \
+           "
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
-- 
2.18.0


