Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD47C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 10:53:57 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.4341.1640084029775116897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 02:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BLArmLu025677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 02:53:48 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Dec 2021 02:53:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 02:53:48 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 21 Dec 2021 02:53:47 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3] php: Upgrade to 8.1.0
Date: Tue, 21 Dec 2021 18:53:46 +0800
Message-ID: <20211221105346.48520-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 10:53:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94465

From: Mingli Yu <mingli.yu@windriver.com>

Rebase one patch to new version and enable openssl PACKAGECONFIG
as OpenSSL 3.0 is now supported in the new version now [1] and
remove one patch [2] as the related support for cross-compile env
is already added in 8.1.0 [3].

[1] https://github.com/php/php-src/commit/7b34db0659dda933b1146a0ff249f25acca1d669
[2] https://git.openembedded.org/meta-openembedded/commit/?id=265bab83c9acbfa97117103dd5c35bbd8a9814d6
[3] https://github.com/php/php-src/commit/f1ad9199eff32dd805bb5b155002bdb6ca69bf01

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ext-opcache-config.m4-enable-opcache.patch | 50 +++++++++++--------
 .../0011-use-qemuwrapper-for-minilua.patch    | 11 ----
 .../php/{php_8.0.12.bb => php_8.1.0.bb}       | 20 ++------
 3 files changed, 34 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
 rename meta-oe/recipes-devtools/php/{php_8.0.12.bb => php_8.1.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index 44534cc06..a967d6412 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -1,6 +1,6 @@
-From 8cabcf1043953a0fe48107204a2212609b8e6516 Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 12:59:15 -0500
+From ca9b419f2c146061f73ee045cb0a069c18b40cd0 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 15 Dec 2021 14:00:08 +0800
 Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile
@@ -17,15 +17,18 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 update patch to version 8.0.12
 fix issue linking with librt
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
+
+update patch to version 8.1.0
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- ext/opcache/config.m4 | 197 ++----------------------------------------
- 1 file changed, 8 insertions(+), 189 deletions(-)
+ ext/opcache/config.m4 | 204 ++----------------------------------------
+ 1 file changed, 8 insertions(+), 196 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 5492fd920c..95158ccfd9 100644
+index 2a83fa2..9471b5d 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -101,202 +101,21 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -108,209 +108,21 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -93,9 +96,10 @@ index 5492fd920c..95158ccfd9 100644
 -  }
 -  return 0;
 -}
--]])],[dnl
+-]])],[have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
+-  if test "$have_shm_ipc" = "yes"; then
 -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
--    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
+-  fi
 +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
 +  have_shm_ipc=yes
    AC_MSG_RESULT([$have_shm_ipc])
@@ -147,9 +151,19 @@ index 5492fd920c..95158ccfd9 100644
 -  }
 -  return 0;
 -}
--]])],[dnl
+-]])],[have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[
+-  case $host_alias in
+-    *linux*)
+-      have_shm_mmap_anon=yes
+-      ;;
+-    *)
+-      have_shm_mmap_anon=no
+-      ;;
+-  esac
+-])
+-  if test "$have_shm_mmap_anon" = "yes"; then
 -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
--    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
+-  fi
 +  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
 +  have_shm_mmap_anon=yes
    AC_MSG_RESULT([$have_shm_mmap_anon])
@@ -219,16 +233,12 @@ index 5492fd920c..95158ccfd9 100644
 -  }
 -  return 0;
 -}
--]])],[dnl
+-]])],[have_shm_mmap_posix=yes],[have_shm_mmap_posix=no],[have_shm_mmap_posix=no])
+-  if test "$have_shm_mmap_posix" = "yes"; then
 -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
--    AC_MSG_RESULT([yes])
--    have_shm_mmap_posix=yes
 -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
--  ],[
--    AC_MSG_RESULT([no])
--  ],[
--    AC_MSG_RESULT([no])
--  ])
+-  fi
+-  AC_MSG_RESULT([$have_shm_mmap_posix])
 +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
 +  AC_MSG_RESULT([yes])
 +  have_shm_mmap_posix=yes
@@ -237,5 +247,5 @@ index 5492fd920c..95158ccfd9 100644
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
-2.25.1
+2.17.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
deleted file mode 100644
index 892a0460c..000000000
--- a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/ext/opcache/jit/Makefile.frag	2021-10-19 06:34:32.000000000 -0400
-+++ b/ext/opcache/jit/Makefile.frag	2021-11-15 15:10:41.437289836 -0500
-@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynas
- 	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
- 
- $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
--	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
-+	$(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
- 
- $(builddir)/jit/zend_jit.lo: \
- 	$(builddir)/jit/zend_jit_x86.c \
diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/php/php_8.0.12.bb
rename to meta-oe/recipes-devtools/php/php_8.1.0.bb
index 38771948f..593eb3955 100644
--- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
@@ -6,7 +6,7 @@ LICENSE = "PHP-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
 
 BBCLASSEXTEND = "native"
-DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native qemu-native"
+DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
 DEPENDS:class-native = "zlib-native libxml2-native"
 
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
@@ -25,7 +25,6 @@ SRC_URI:append:class-target = " \
             file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
             file://0007-sapi-cli-config.m4-fix-build-directory.patch \
             file://0008-ext-imap-config.m4-fix-include-paths.patch \
-            file://0011-use-qemuwrapper-for-minilua.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
@@ -33,10 +32,10 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b4886db1df322dc8fb128d8b34ae7e94f6fc682ecb29ff4f5a591d4de9feadbf"
+SRC_URI[sha256sum] = "0725ed2baea125496a898455d501a77460218b2a0cfad773fa9322f491b82b61"
 
 
-inherit autotools pkgconfig python3native gettext qemu
+inherit autotools pkgconfig python3native gettext
 
 # phpize is not scanned for absolute paths by default (but php-config is).
 #
@@ -77,7 +76,7 @@ EXTRA_OECONF:class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
+PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG:class-native = ""
@@ -128,17 +127,6 @@ do_configure:prepend () {
     find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
 }
 
-do_configure:prepend:class-target () {
-    # Write out a qemu wrapper that will be used by the makefile
-    # so that it can run minilua through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
-    cat > ${S}/qemuwrapper << EOF
-#!/bin/sh
-$qemu_binary "\$@"
-EOF
-    chmod +x ${S}/qemuwrapper
-}
-
 do_configure:append() {
     # No, libtool, we really don't want rpath set...
     sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
-- 
2.17.1


