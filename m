Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 49B9760EAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:54:51 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so3603932pad.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=wIhv9yvs/WqCZDdV2ZQ+KVltRbkSdWqqp7vOHTP9lkY=;
	b=xvt7jTtyN/JCfHPNgSi9ksr/bU6uYPYf66hQuMCNAGlHycQEmU1GOlZD5qO1ogx93q
	2jkhGNPjR1wtEb/dINrBym9Nq3lI10gSEvcu30J8X+NiNzK7RIvIxwf9+MK3BYDy23Pm
	zRnHc0G/yWoYKeJU4noB8qGvAMpi8v9vB4v0ohIXw0uIKwTM1P+5LPWBKlDrqwIlogGH
	qIz5E1RLlWF6QeHBsJNMs07G8vnZFs2ACP4obD6takiLFc3Dh6YKjvh0Fvc9fzz6nGTK
	VASDcuSiq+GmXJGK/xUukVIbziOG9wAjYfKs1yQk4agtxujI997wAqjTMU7B3OCSBtq9
	ULkA==
X-Received: by 10.66.144.102 with SMTP id sl6mr574888pab.96.1382054093140;
	Thu, 17 Oct 2013 16:54:53 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	py4sm100395151pbb.33.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 16:54:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 16:54:23 -0700
Message-Id: <1382054063-13088-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-vfs: Fix build error with new autotools
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
X-List-Received-Date: Thu, 17 Oct 2013 23:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't use srcdir with tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...kefile.am-remove-DG_DISABLE_DEPRECATED-to.patch | 61 +++++++++++++++++-----
 .../do-not-use-srcdir-variable.patch               | 22 ++++++++
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |  1 +
 3 files changed, 71 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
index d8f7e40..3833299 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
@@ -13,11 +13,11 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  libgnomevfs/Makefile.am |    1 -
  2 files changed, 0 insertions(+), 2 deletions(-)
 
-diff --git a/daemon/Makefile.am b/daemon/Makefile.am
-index ca57467..040484f 100644
---- a/daemon/Makefile.am
-+++ b/daemon/Makefile.am
-@@ -8,7 +8,6 @@ INCLUDES= \
+Index: gnome-vfs-2.24.4/daemon/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/daemon/Makefile.am	2013-10-17 16:39:39.081024798 -0700
++++ gnome-vfs-2.24.4/daemon/Makefile.am	2013-10-17 16:39:39.213024794 -0700
+@@ -8,7 +8,6 @@
  	-D_LARGEFILE64_SOURCE                   \
  	-D_POSIX_PTHREAD_SEMANTICS		\
  	-D_REENTRANT				\
@@ -25,11 +25,11 @@ index ca57467..040484f 100644
  	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
  	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
  	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
-diff --git a/libgnomevfs/Makefile.am b/libgnomevfs/Makefile.am
-index 69a02e0..5d7d759 100644
---- a/libgnomevfs/Makefile.am
-+++ b/libgnomevfs/Makefile.am
-@@ -19,7 +19,6 @@ INCLUDES =					\
+Index: gnome-vfs-2.24.4/libgnomevfs/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/libgnomevfs/Makefile.am	2013-10-17 16:39:39.081024798 -0700
++++ gnome-vfs-2.24.4/libgnomevfs/Makefile.am	2013-10-17 16:39:39.213024794 -0700
+@@ -19,7 +19,6 @@
  	-D_LARGEFILE64_SOURCE                   \
  	-D_POSIX_PTHREAD_SEMANTICS		\
  	-D_REENTRANT				\
@@ -37,6 +37,41 @@ index 69a02e0..5d7d759 100644
  	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
  	-DGNOME_VFS_BINDIR=\"$(bindir)\"	\
  	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
--- 
-1.7.6.5
-
+Index: gnome-vfs-2.24.4/modules/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/modules/Makefile.am	2013-10-17 16:39:39.081024798 -0700
++++ gnome-vfs-2.24.4/modules/Makefile.am	2013-10-17 16:39:39.213024794 -0700
+@@ -18,7 +18,6 @@
+ 	-D_POSIX_PTHREAD_SEMANTICS		\
+ 	-D_REENTRANT				\
+ 	-DSSH_PROGRAM=\"$(SSH_PROGRAM)\"	\
+-	-DG_DISABLE_DEPRECATED			\
+ 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
+ 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
+ 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
+Index: gnome-vfs-2.24.4/programs/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/programs/Makefile.am	2013-10-17 16:39:39.081024798 -0700
++++ gnome-vfs-2.24.4/programs/Makefile.am	2013-10-17 16:39:39.213024794 -0700
+@@ -4,8 +4,7 @@
+ 	-I$(top_srcdir)				\
+ 	-I$(top_builddir)			\
+ 	$(TEST_CFLAGS)				\
+-	$(VFS_CFLAGS)				\
+-	-DG_DISABLE_DEPRECATED
++	$(VFS_CFLAGS)
+ 
+ libraries =						\
+ 	$(top_builddir)/libgnomevfs/libgnomevfs-2.la	\
+Index: gnome-vfs-2.24.4/test/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/test/Makefile.am	2010-02-09 04:16:14.000000000 -0800
++++ gnome-vfs-2.24.4/test/Makefile.am	2013-10-17 16:42:49.109019172 -0700
+@@ -6,7 +6,6 @@
+ 	-I$(top_builddir)/libgnomevfs           \
+ 	$(TEST_CFLAGS)				\
+ 	$(VFS_CFLAGS)				\
+-	-DG_DISABLE_DEPRECATED			\
+ 	-DMODULES_PATH=\"$(libdir)/vfs/modules\"
+ 
+ if OS_WIN32
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
new file mode 100644
index 0000000..30ca29b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
@@ -0,0 +1,22 @@
+Fixes errors with new autotools
+
+| automake: error: using '$(srcdir)' in TESTS is currently broken: '$(srcdir)/auto-test'
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+
+Upstream-Status: Not Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gnome-vfs-2.24.4/test/Makefile.am
+===================================================================
+--- gnome-vfs-2.24.4.orig/test/Makefile.am	2013-10-17 16:43:36.677017764 -0700
++++ gnome-vfs-2.24.4/test/Makefile.am	2013-10-17 16:48:47.369008566 -0700
+@@ -64,7 +64,7 @@
+ 	test-async-cancel \
+ 	test-escape       \
+ 	test-uri       	  \
+-	$(srcdir)/auto-test	
++	auto-test
+ 
+ libraries =						\
+ 	$(top_builddir)/libgnomevfs/libgnomevfs-2.la	\
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 78110b5..d0b5e3d 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -24,6 +24,7 @@ SRC_URI += " \
     file://gconftool-lossage.patch \
     file://gnome-vfs-no-kerberos.patch;striplevel=0 \
     file://0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch \
+    file://do-not-use-srcdir-variable.patch \
 "
 
 SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
-- 
1.8.3.2


