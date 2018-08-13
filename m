Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB8D78F81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7DGBuUa027964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:57 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:19 +0800
Message-ID: <615af22799ad9cd96be7cb39c32c68192619345a.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534177115.git.hongxu.jia@windriver.com>
References: <cover.1534177115.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] libblockdev: drop obsolete patch
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:56 -0000
Content-Type: text/plain

Since libblockdev is upgraded to 2.18, the local patch is obsolete.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-configure-and-compile-failures.patch  | 87 ----------------------
 .../libblockdev/libblockdev_2.18.bb                |  1 -
 2 files changed, 88 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
deleted file mode 100644
index 9c050b7..0000000
--- a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 21654e3719e0a289e735918b234f7aae6766e3a1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 18 Jul 2018 11:26:28 +0800
-Subject: [PATCH] fix configure and compile failures
-
-1. Fix do_configure failure
----------------------------
-|Checking header volume_key/libvolume_key.h existence and usability.
-../tmp/6tvtK.c:1:38: fatal error: volume_key/libvolume_key.h:
-No such file or directory
-| #include <volume_key/libvolume_key.h>
----------------------------
-We explictly add volume_key and dmraid to DEPENDS, do not need
-configure to test.
-
-2. Fix config.h not found
-Add it to configure.ac
-
-3. Correct AC_DEFINE
-...
-autoheader: warning: missing template: LIBMOUNT_NEW_ERR_API
-autoheader: Use AC_DEFINE([LIBMOUNT_NEW_ERR_API], [], [Description])
-...
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Checking header dmraid/dmraid.h existence and usability.../tmp/
-ktVJ6.c:1:27: fatal error: dmraid/dmraid.h: No such file or directory
-| #include <dmraid/dmraid.h>
-
-fix this by add --disable-dmraid
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a37f337..a8cfe2f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -9,6 +9,8 @@ AC_DISABLE_STATIC
- AM_INIT_AUTOMAKE([foreign -Wall -Werror -Wno-syntax -Wno-portability])
- AC_CONFIG_MACRO_DIR([m4])
- 
-+AC_CONFIG_HEADERS([config.h])
-+
- AM_PATH_PYTHON
- 
- AM_PROG_AR
-@@ -194,10 +196,9 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])
- AS_IF([test "x$with_crypto" != "xno"],
-       [LIBBLOCKDEV_PKG_CHECK_MODULES([CRYPTSETUP], [libcryptsetup >= 1.6.7])
-       AS_IF([$PKG_CONFIG --atleast-version=2.0 libcryptsetup],
--            [AC_DEFINE([LIBCRYPTSETUP_2])], [])
-+            [AC_DEFINE([LIBCRYPTSETUP_2], [1], [new version of libcryptsetup])])
-       AS_IF([test "x$with_escrow" != "xno"],
--            [LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])
--             LIBBLOCKDEV_CHECK_HEADER([volume_key/libvolume_key.h], [$GLIB_CFLAGS $NSS_CFLAGS], [libvolume_key.h not available])],
-+            [LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])],
-             [])
-       ],
-       [])
-@@ -218,7 +219,8 @@ AS_IF([test "x$with_fs" != "xno"],
-       [LIBBLOCKDEV_PKG_CHECK_MODULES([MOUNT], [mount >= 2.23.0])
-        # new versions of libmount has some new functions we can use
-        AS_IF([$PKG_CONFIG --atleast-version=2.30.0 mount],
--             [AC_DEFINE([LIBMOUNT_NEW_ERR_API])], [])
-+       [AC_DEFINE([LIBMOUNT_NEW_ERR_API], [1], [new versions of libmount has some new functions we can use])],
-+       [])
- 
-        LIBBLOCKDEV_PKG_CHECK_MODULES([BLKID], [blkid >= 2.23.0])
-        # older versions of libblkid don't support BLKID_SUBLKS_BADCSUM so let's just
-@@ -243,7 +245,7 @@ AS_IF([test "x$with_nvdimm" != "xno"],
-        LIBBLOCKDEV_PKG_CHECK_MODULES([NDCTL], [libndctl >= 58.4])
-        # new versions of libndctl new modes
-        AS_IF([$PKG_CONFIG --atleast-version=60 libndctl],
--             [AC_DEFINE([LIBNDCTL_NEW_MODES])], [])]
-+             [AC_DEFINE([LIBNDCTL_NEW_MODES], [1], [new version of libndctl new modes])], [])]
-       [])
- 
- AS_IF([test "x$with_vdo" != "xno"],
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
index 5a8b697..bf33b96 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
@@ -19,7 +19,6 @@ DEPENDS += " \
 SRCREV = "0debeb45562ac3d8f6f43f6f942b238abab55be9"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
-    file://0001-fix-configure-and-compile-failures.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


