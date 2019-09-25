Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 32DFC7E6F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:58:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id k7so2354624pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wZVwFgKg7iggU7WPdMiN3xmRDTfslzCb1Z1Tj+8IRe0=;
	b=hB1zj+2Jrl2LNCdY2WVbrCObMtpyQ+0d9EWVVUSAQJaSXYaZJlkGwNMz9WXfH/JQJO
	Wh/iPLs2hSpADm+UxUf0qNGm8pZfFRNoMDUqFl8p8AmWOsPyOqTDvFVID3OpiO6Nnu0X
	s77y43Ghuroygk3k3AXlVqx6WDBtr3OHHBdiSk/QSEOTZwq7ODIrLl/xUwhj9wN+76WR
	unfGAVYDnXq4Kwk3dwPnDyJzG1k/+pDXWx5PmZMQPwBsVYzXkU/IeQ4SW9jsv8tPkbS9
	czEtQK0L9qG3fUIlNO4jv8lb0dTOe2NQh8ceAFtI5zUDsuUNquq4TXxME3PJthNWEB3j
	03HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wZVwFgKg7iggU7WPdMiN3xmRDTfslzCb1Z1Tj+8IRe0=;
	b=jQ08plB0cAOPnn0EM/cDuCIKSWN/IfN8deMpdpwg3y7VI7d+UDTUTqH70veSxqp7VK
	iLwCgVoSJYFZiEpO+ZJs/Ot5k7Pex1Ky1mA0kIBwUtGt5eUyluZs9O4UqGBB/gTullc1
	trKhj12J9R/805guba3QfcIW1H0m3Jq8UaXJ7HXKbKa6XYr042OQokLuGlHxoEL1VYv+
	vAdbobxk3j95d3dWtBw3L19AehT7lEffM/R8JPdnxcFhXHuZWa7fb8sDe8/n34i/zwnM
	iWUK9P0ATfyzZhFsk69C2uES+54+TkHwUPHQn7O+FZlDoN0iCBLmBdlBGCF7aVNTMVRE
	VPxA==
X-Gm-Message-State: APjAAAVBSk88cEJ4VURDrc797tapKUULVg9xf80KcjgxFiJMythItD8L
	HkN8486TR8tcoRpd3IQGAI6QR7lqrFA=
X-Google-Smtp-Source: APXvYqyjZfSWKkUnWO0UM5Hoqxkfy9Ho/i2j3SXcF5Tw5m+RiGdutgQOTTfPfdzB/aE7qeQGRiOF2w==
X-Received: by 2002:a17:902:144:: with SMTP id
	62mr10689900plb.283.1569437891410; 
	Wed, 25 Sep 2019 11:58:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p66sm13701085pfg.127.2019.09.25.11.58.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 11:58:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 11:57:55 -0700
Message-Id: <20190925185755.639757-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925185755.639757-1-raj.khem@gmail.com>
References: <20190925185755.639757-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] uim: Fix cross-builds
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
X-List-Received-Date: Wed, 25 Sep 2019 18:58:11 -0000
Content-Transfer-Encoding: 8bit

riscv is not yet supported to exclude it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...it-path-from-configure-option-proper.patch | 29 +++++++++++++++++++
 .../uim/0001-fix-bug-for-cross-compile.patch  | 24 ---------------
 meta-oe/recipes-support/uim/uim_1.8.8.bb      | 10 +++++--
 3 files changed, 36 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
 delete mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch

diff --git a/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch b/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
new file mode 100644
index 0000000000..34a1ea0fa2
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
@@ -0,0 +1,29 @@
+From f828a89cc1e956d56498422ec158d284fc97de3f Mon Sep 17 00:00:00 2001
+From: OBATA Akio <obache@outlook.com>
+Date: Fri, 10 Aug 2018 18:38:18 +0900
+Subject: [PATCH] Fix to set libedit path from configure option properly
+
+Upstream-Status: Backport [https://github.com/uim/uim/pull/134]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 00d1b02..9c0a5ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1311,8 +1311,8 @@ if test "x$with_libedit" != xno; then
+   if test "x$with_libedit" = xyes; then
+     libedit_path=/usr
+   else
+-    with_libedit=yes
+     libedit_path="$with_libedit"
++    with_libedit=yes
+   fi
+ 
+   saved_CPPFLAGS=$CPPFLAGS
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
deleted file mode 100644
index 510a8c8407..0000000000
--- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 08b5e51224ed95b1e76e99873b5f9f59840b0a74 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 21 Aug 2015 15:58:42 +0900
-Subject: [PATCH] fix bug for cross compile
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1317,8 +1317,8 @@ if test "x$with_libedit" != xno; then
- 
-   saved_CPPFLAGS=$CPPFLAGS
-   saved_LDFLAGS=$LDFLAGS
--  CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
--  LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
-+  CPPFLAGS="${CPPFLAGS}"
-+  LDFLAGS="${LDFLAGS}"
-   AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
-     [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
-       AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
index cc28e6e8fd..8948ebf30f 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
@@ -4,11 +4,11 @@ LICENSE = "BSD-3-Clause & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab2826b41ca0ff4030d38cc39791d1c8"
 SECTION = "inputmethods"
 
-SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
-
+SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2 \
+    file://0001-Fix-to-set-libedit-path-from-configure-option-proper.patch \
+"
 SRC_URI_append_class-target = "\
     file://uim-module-manager.patch \
-    file://0001-fix-bug-for-cross-compile.patch \
 "
 SRC_URI[md5sum] = "01c7bd5d0d4f3a9f6f5befe6f57a470b"
 SRC_URI[sha256sum] = "34599bbcc4e5ab87832370763e38be5100984a64237555e9234a1ea225a0fadc"
@@ -22,6 +22,9 @@ RDEPENDS_uim-anthy_append_libc-glibc = " glibc-utils glibc-gconv-euc-jp"
 
 LEAD_SONAME = "libuim.so.1"
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 inherit distro_features_check autotools pkgconfig gettext qemu gtk-immodules-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -29,6 +32,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
 
 EXTRA_OECONF += "--disable-emacs \
+    --with-libedit=${STAGING_EXECPREFIXDIR} \
     --without-scim \
     --without-m17nlib \
     --without-prime \
-- 
2.23.0


