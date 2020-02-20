Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 03A0A6156E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:28:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83594327"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 10:28:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DF17450A9976
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:18:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 10:28:26 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Feb 2020 10:28:33 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Feb 2020 01:40:21 -0800
Message-ID: <1582191622-130680-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582191622-130680-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582191622-130680-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DF17450A9976.A26BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] makedumpfile: upgrade 1.6.6 -> 1.6.7
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
X-List-Received-Date: Thu, 20 Feb 2020 02:28:30 -0000
Content-Type: text/plain

refresh the following patch:
0001-makedumpfile-replace-hardcode-CFLAGS.patch

0003-build-Delete-libebl-from-required-libraries-during-l.patch
removed since it is included in 1.6.7

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...makedumpfile-replace-hardcode-CFLAGS.patch |  6 ++--
 ...ebl-from-required-libraries-during-l.patch | 34 -------------------
 ...umpfile_1.6.6.bb => makedumpfile_1.6.7.bb} |  5 ++-
 3 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.6.bb => makedumpfile_1.6.7.bb} (88%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index c0f82f321..ff093a72b 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -83,7 +83,7 @@ index 1fdb628..5dce589 100644
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
 @@ -52,17 +53,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
- LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
+ LIBS = -ldw -lbz2 -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
 -LIBS := -static $(LIBS)
 +LIBS := $(LIBS)
@@ -102,7 +102,7 @@ index 1fdb628..5dce589 100644
  endif
  
  LIBS := -lpthread $(LIBS)
-@@ -82,14 +83,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -87,14 +88,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -119,7 +119,7 @@ index 1fdb628..5dce589 100644
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -100,7 +101,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -105,7 +106,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch
deleted file mode 100644
index 40956434d..000000000
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 460851c15e807d1a2515dfb985423f8a6624f4aa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 8 Jan 2020 19:14:19 -0800
-Subject: [PATCH 3/3] build: Delete libebl from required libraries during link
-
-This is a static library from elfutils, which is not made available when
-static archives are disabled, this can result in link failures e.g.
-
-aarch64-yoe-linux-musl/9.2.0/ld: cannot find -lebl
-collect2: error: ld returned 1 exit status
-Makefile:93: recipe for target 'makedumpfile' failed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 5dce589..c3a4054 100644
---- a/Makefile
-+++ b/Makefile
-@@ -51,7 +51,7 @@ OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
- SRC_ARCH = arch/arm.c arch/arm64.c arch/x86.c arch/x86_64.c arch/ia64.c arch/ppc64.c arch/s390x.c arch/ppc.c arch/sparc64.c
- OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
- 
--LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
-+LIBS = -ldw -lbz2 -ldl -lelf -lz
- ifneq ($(LINKTYPE), dynamic)
- LIBS := $(LIBS)
- endif
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
similarity index 88%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
index 6924e39d6..8d1676a4c 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
@@ -24,10 +24,9 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
-    file://0003-build-Delete-libebl-from-required-libraries-during-l.patch \
 "
-SRC_URI[md5sum] = "6fd632b97ad78d9a0a3b0f0989094064"
-SRC_URI[sha256sum] = "d007eec05cb14f0155f2d06a0d4dc70d321dbb2aec65fccdce953145c8230324"
+SRC_URI[md5sum] = "808ef840ca49ca6bfde77c097cf429f5"
+SRC_URI[sha256sum] = "e702fbdf62b4cd829a76e46f3e24eb3fc7501918b85ebdcd8baef4f53d6ee2c8"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
 UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1




