Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF4E7487E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RYtR000543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:34 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:22 +0800
Message-ID: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] autofs: upgrade 5.1.2 -> 5.1.4
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:35 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../autofs/autofs-5.1.2-libtirpc-as-need.patch     | 39 ----------------------
 .../recipes-daemons/autofs/autofs/libtirpc.patch   | 35 -------------------
 .../autofs/{autofs_5.1.2.bb => autofs_5.1.4.bb}    |  6 ++--
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.2.bb => autofs_5.1.4.bb} (91%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
deleted file mode 100644
index 18ce193..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b31decac4acb194b020c621d2d11019f636a45e0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 Apr 2017 20:41:25 -0700
-Subject: [PATCH] autofs: Upgrade to 5.1.2 release
-
-Make configure compatible with -Wl,--as-needed following
-https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed#Failure_in_..2Fconfigure
-
-2016-07-05 Martin von Gagern
-
----
- aclocal.m4 | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 0e4a624..2e620cd 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -415,9 +415,9 @@ AC_DEFUN([AF_CHECK_LIBTIRPC],
- [
- # save current flags
- af_check_libtirpc_save_cflags="$CFLAGS"
--af_check_libtirpc_save_ldflags="$LDFLAGS"
-+af_check_libtirpc_save_libs="$LIBS"
- CFLAGS="$CFLAGS -I=/usr/include/tirpc"
--LDFLAGS="$LDFLAGS -ltirpc"
-+LIBS="$LIBS -ltirpc"
- 
- AC_TRY_LINK(
-     [ #include <rpc/rpc.h> ],
-@@ -440,7 +440,7 @@ AC_CHECK_FUNCS([getrpcbyname getservbyname])
- 
- # restore flags
- CFLAGS="$af_check_libtirpc_save_cflags"
--LDFLAGS="$af_check_libtirpc_save_ldflags"
-+LIBS="$af_check_libtirpc_save_libs"
- ])
- 
- AC_DEFUN([AF_WITH_LIBTIRPC],
diff --git a/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
deleted file mode 100644
index 0a2d502..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cb6a4f61adb027f2366318f2c08c8264ebf39218 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Jan 2013 19:53:10 -0800
-
----
- Makefile.rules | 2 +-
- aclocal.m4     | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.rules b/Makefile.rules
-index 6fa3e02..709dd04 100644
---- a/Makefile.rules
-+++ b/Makefile.rules
-@@ -46,7 +46,7 @@ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
- LIBS += -lpthread
- 
- ifdef TIRPCLIB
--CFLAGS += -I/usr/include/tirpc
-+CFLAGS += -I=/usr/include/tirpc
- LIBS += $(TIRPCLIB)
- endif
- 
-diff --git a/aclocal.m4 b/aclocal.m4
-index 2a9a802..0e4a624 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -416,7 +416,7 @@ AC_DEFUN([AF_CHECK_LIBTIRPC],
- # save current flags
- af_check_libtirpc_save_cflags="$CFLAGS"
- af_check_libtirpc_save_ldflags="$LDFLAGS"
--CFLAGS="$CFLAGS -I/usr/include/tirpc"
-+CFLAGS="$CFLAGS -I=/usr/include/tirpc"
- LDFLAGS="$LDFLAGS -ltirpc"
- 
- AC_TRY_LINK(
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
similarity index 91%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
index e279995..187c6fa 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
            file://no-bash.patch \
            file://cross.patch \
-           file://libtirpc.patch \
            file://autofs-5.0.7-do-not-check-for-modprobe.patch \
            file://fix_disable_ldap.patch \
            file://autofs-5.0.7-fix-lib-deps.patch \
@@ -24,12 +23,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://fix-the-YACC-rule-to-fix-a-building-failure.patch \
            file://0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch \
            file://0002-Replace-__S_IEXEC-with-S_IEXEC.patch \
-           file://autofs-5.1.2-libtirpc-as-need.patch \
            file://pkgconfig-libnsl.patch \
            file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
            "
-SRC_URI[md5sum] = "28cf88f99eff553a8500659ba5d45a76"
-SRC_URI[sha256sum] = "0d57e4138c2ec8058ca92164d035546f68ce4af93acb893369993d67c7056a10"
+SRC_URI[md5sum] = "17bc9d371cf39d99f400ebadfc2289bb"
+SRC_URI[sha256sum] = "8d1c9964c8286ccb08262ad47c60bb6343492902def5399fd36d79a0ccb0e718"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
-- 
2.7.4


