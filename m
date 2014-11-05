Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F422460557
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 09:00:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA590pqo018026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Nov 2014 01:00:52 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 01:00:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Nov 2014 17:00:46 +0800
Message-ID: <9a453b465a06c1fccad20ed161e8ca1eee2e37e0.1415177915.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415177915.git.hongxu.jia@windriver.com>
References: <cover.1415177915.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mariadb:fix do_compile failed: No rule to make target /path/to/sysroots/x86-kvm-guest/usr/include/krb5.h
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
X-List-Received-Date: Wed, 05 Nov 2014 09:00:56 -0000
Content-Type: text/plain

There is occasionally compile failure while krb5.h removed
from sysroot during maradb compiling.
...
[2014-10-27 17:18:06.998709364-07:00] | make -f storage/maria/CMakeFiles/
 aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
depend
[2014-10-27 17:18:07.458369132-07:00] | make -f storage/maria/CMakeFiles/
aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
build
[2014-10-27 17:18:12.547556095-07:00] | make[2]: *** No rule to make target
`tmp/sysroots/x86-kvm-guest/usr/include/krb5.h', needed by `storage/maria/
CMakeFiles/aria_embedded.dir/ha_maria.cc.o'.  Stop.
...

The ha_maria.cc requires <openssl/ssl.h>, <openssl/ssl.h> requires <openssl/
kssl.h>, and <openssl/kssl.h> conditionally requires <krb5.h>, but CMake
ignore the condition, force to add krb5.h to mariadb's dependencies, it is
the issue of CMake dependency scanner:
http://www.cmake.org/Wiki/CMake_FAQ#CMake_dependency_scanner
http://www.cmake.org/pipermail/cmake/2010-July/038465.html

As the above failure log shows, the dependency scanner was done at 17:18:06,
and the compiling start at 17:18:07, but compiling ha_maria.cc.o failed at
17:18:12, removing krb5.h within that 5 seconds caused the above failure.

So we tweak the compile order, let ha_maria.cc as the first compile object,
it will reduce the risk time of removing krb5.h.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ia-CMakeLists.txt-tweak-source-file-compi.patch | 62 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch b/meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch
new file mode 100644
index 0000000..b498423
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch
@@ -0,0 +1,62 @@
+From 4e99ef5cdffc92da783b04fa4fd07da47485f394 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 5 Nov 2014 16:25:52 +0800
+Subject: [PATCH] storage/maria/CMakeLists.txt: tweak source file compile order
+
+There is occasionally compile failure while krb5.h removed
+from sysroot during maradb compiling.
+...
+[2014-10-27 17:18:06.998709364-07:00] | make -f storage/maria/CMakeFiles/
+ aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
+depend
+[2014-10-27 17:18:07.458369132-07:00] | make -f storage/maria/CMakeFiles/
+aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
+build
+[2014-10-27 17:18:12.547556095-07:00] | make[2]: *** No rule to make target
+`tmp/sysroots/x86-kvm-guest/usr/include/krb5.h', needed by `storage/maria/
+CMakeFiles/aria_embedded.dir/ha_maria.cc.o'.  Stop.
+...
+
+The ha_maria.cc requires <openssl/ssl.h>, <openssl/ssl.h> requires <openssl/
+kssl.h>, and <openssl/kssl.h> conditionally requires <krb5.h>, but CMake
+ignore the condition, force to add krb5.h to mariadb's dependencies, it is
+the issue of CMake dependency scanner:
+http://www.cmake.org/Wiki/CMake_FAQ#CMake_dependency_scanner
+
+As the above failure log shows, the dependency scanner was done at 17:18:06,
+and the compiling start at 17:18:07, but compiling ha_maria.cc.o failed at
+17:18:12, removing krb5.h within that 5 seconds caused the above failure.
+
+So we tweak the compile order, let ha_maria.cc as the first compile object,
+it will reduce the risk time of removing krb5.h.
+
+Upstream-Status: Pending
+---
+ storage/maria/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/storage/maria/CMakeLists.txt b/storage/maria/CMakeLists.txt
+index 0f30f8f..6fcaccf 100644
+--- a/storage/maria/CMakeLists.txt
++++ b/storage/maria/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ 
+ INCLUDE(CMakeDependentOption)
+ 
+-SET(ARIA_SOURCES ma_init.c ma_open.c ma_extra.c ma_info.c ma_rkey.c 
++SET(ARIA_SOURCES ha_maria.cc ma_init.c ma_open.c ma_extra.c ma_info.c ma_rkey.c
+             ma_rnext.c ma_rnext_same.c 
+             ma_search.c ma_page.c ma_key_recover.c ma_key.c 
+             ma_locking.c ma_state.c
+@@ -32,7 +32,7 @@ SET(ARIA_SOURCES ma_init.c ma_open.c ma_extra.c ma_info.c ma_rkey.c
+             ma_keycache.c ma_preload.c ma_ft_parser.c 
+             ma_ft_update.c ma_ft_boolean_search.c 
+             ma_ft_nlq_search.c ft_maria.c ma_sort.c 
+-            ha_maria.cc trnman.c lockman.c
++            trnman.c lockman.c
+             ma_rt_index.c ma_rt_key.c ma_rt_mbr.c ma_rt_split.c 
+             ma_sp_key.c ma_control_file.c ma_loghandler.c 
+             ma_pagecache.c ma_pagecaches.c
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index ae2e92b..42c8f3e 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -8,6 +8,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
+           file://storage-maria-CMakeLists.txt-tweak-source-file-compi.patch \
            file://my.cnf \
            file://mysqld.service \
           "
-- 
1.9.1


