Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF91C77143
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 06:14:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6B6EkLn023536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 23:14:47 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 10 Jul 2018 23:14:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jul 2018 14:24:47 +0800
Message-ID: <1531290287-82549-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531290287-82549-1-git-send-email-liezhi.yang@windriver.com>
References: <1531290287-82549-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] ntop: fix so generation in plugins/Makefile.am
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
X-List-Received-Date: Wed, 11 Jul 2018 06:14:47 -0000
Content-Type: text/plain

Fixed build with automake 1.16.1:
| i586-poky-linux-gcc: error: netflowPlugin.o: No such file or directory
| i586-poky-linux-gcc: error: unrecognized command line option '-flat_namespace'; did you mean '-Wnamespaces'?
| i586-poky-linux-gcc: fatal error: no input files

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ugins-Makefile.am-fix-for-automake-1.16.1.patch | 74 ++++++++++++++++++++++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch

diff --git a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch b/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
new file mode 100644
index 0000000..d6f7eb5
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
@@ -0,0 +1,74 @@
+From d22ddc73f00ed056032a635ee8379305ec83bf81 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 11 Jul 2018 12:02:50 +0800
+Subject: [PATCH] plugins/Makefile.am: fix for automake 1.16.1
+
+Fixed:
+| i586-poky-linux-gcc: error: netflowPlugin.o: No such file or directory
+| i586-poky-linux-gcc: error: unrecognized command line option '-flat_namespace'; did you mean '-Wnamespaces'?
+| i586-poky-linux-gcc: fatal error: no input files
+
+The previous code make things complicated, but we don't have to, let libtool do
+most of the things can fix the problem.
+
+Upstream-Status: Pending [ntop is not longer maintained any more, we need consider moving to ntopng]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ plugins/Makefile.am | 34 ++++++----------------------------
+ 1 file changed, 6 insertions(+), 28 deletions(-)
+
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 64492e0..bcd0c10 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -69,40 +69,18 @@ libsflowPlugin_la_CFLAGS = $(AM_CFLAGS)
+ # by default ntop looks for plugins in the plugins/ subdirectory
+ #
+ 
+-
+-.libs/libnetflowPlugin.so@SO_VERSION_PATCH@:
+-	@if test -f libnetflowPlugin_la-netflowPlugin.o; then \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ libnetflowPlugin_la-netflowPlugin.o; \
+-	else \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ netflowPlugin.o; \
+-	fi
+-
+-netflowPlugin.so$(EXEEXT): .libs/libnetflowPlugin.so@SO_VERSION_PATCH@
+-	@$(LN_S) .libs/libnetflowPlugin.so netflowPlugin.so
++netflowPlugin.so$(EXEEXT): libnetflowPlugin.la
++	@$(LN_S) -f .libs/libnetflowPlugin.so netflowPlugin.so
+ 
+ ###############
+ 
+-.libs/librrdPlugin.so@SO_VERSION_PATCH@:
+-	@if test -f librrdPlugin_la-rrdPlugin.o; then \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ librrdPlugin_la-rrdPlugin.o; \
+-	else \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ rrdPlugin.o; \
+-	fi
+-
+-rrdPlugin.so$(EXEEXT): .libs/librrdPlugin.so@SO_VERSION_PATCH@
+-	@$(LN_S) .libs/librrdPlugin.so rrdPlugin.so
++rrdPlugin.so$(EXEEXT): librrdPlugin.la
++	@$(LN_S) -f .libs/librrdPlugin.so rrdPlugin.so
+ 
+ ###############
+ 
+-.libs/libsflowPlugin.so@SO_VERSION_PATCH@:
+-	@if test -f libsflowPlugin_la-sflowPlugin.o; then \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ libsflowPlugin_la-sflowPlugin.o; \
+-	else \
+-	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ sflowPlugin.o; \
+-	fi
+-
+-sflowPlugin.so$(EXEEXT): .libs/libsflowPlugin.so@SO_VERSION_PATCH@
+-	@$(LN_S) .libs/libsflowPlugin.so sflowPlugin.so
++sflowPlugin.so$(EXEEXT): libsflowPlugin.la
++	@$(LN_S) -f .libs/libsflowPlugin.so sflowPlugin.so
+ 
+ ###############
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 4e0dd1e..2a7a7f2 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
            file://ntop.service \
            file://use-static-inline.patch \
            file://0001-nDPI-Include-sys-types.h.patch \
+           file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch \
           "
 SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
 SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
-- 
2.7.4


