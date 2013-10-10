Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A226E6CC84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 07:47:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A7lhRA023689
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2013 00:47:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 10 Oct 2013 00:47:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2013 15:47:38 +0800
Message-ID: <92c13ef2b1fa14b691df78914d0baafc3dedf70a.1381391066.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381391066.git.hongxu.jia@windriver.com>
References: <cover.1381391066.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 1/1] mariadb: fix do_configure failed while multilib is used
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
X-List-Received-Date: Thu, 10 Oct 2013 07:47:42 -0000
Content-Type: text/plain

Here is the error log from mariadb's configure test
...
 checking for zlib compression library... configure: error: headers or
binaries were not found in /home/jiahongxu/yocto/build-20131009-mysql/
bitbake_build/tmp/sysroots/qemux86-64/usr/{include,lib}
...

When multilib is used, the baselib is assigned with "lib64", here is
the log from 'bitbake mariadb -e'
...
 4738 # $baselib [3 operations]
 4739 #   set conf/bitbake.conf:10
 4740 #     "${BASELIB}"
 4741 #   set conf/bitbake.conf:11
 4742 #     [vardepvalue] "${baselib}"
 4743 #   set /home/jiahongxu/yocto/build-20131009-mysql/layers/oe-core/meta/conf/multilib.conf:2
 4744 #     "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"
 4745 # computed:
 4746 #   "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"
 4747 baselib="lib64"
...

In this situation, the zlib locates in 'lib64' rather than 'lib'.
But mariadb's confiure test still searches zlib in 'lib'.

Modify mariadb's confiure to let lib dir configurable rather
than hardcode could fix this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../mariadb/zlib-let-libdir-configurable.patch     | 63 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc   |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch b/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
new file mode 100644
index 0000000..880c2a7
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
@@ -0,0 +1,63 @@
+zlib: let lib dir configurable
+
+The zlib were found in $mysql_zlib_dir/lib, and the
+search will fail if zlib in $mysql_zlib_dir/lib64.
+
+Let lib dir configurable rather than hardcode.
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ config/ac-macros/zlib.m4 | 12 ++++++------
+ configure.in             |  8 ++++++++
+ 2 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/config/ac-macros/zlib.m4 b/config/ac-macros/zlib.m4
+--- a/config/ac-macros/zlib.m4
++++ b/config/ac-macros/zlib.m4
+@@ -106,17 +106,17 @@ case $SYSTEM_TYPE in
+         ;;
+       *)
+         # Test for libz using all known library file endings
+-        if test \( -f "$mysql_zlib_dir/lib/libz.a"  -o \
+-                   -f "$mysql_zlib_dir/lib/libz.so" -o \
+-                   -f "$mysql_zlib_dir/lib/libz.sl" -o \
+-                   -f "$mysql_zlib_dir/lib/libz.dylib" \) \
++        if test \( -f "$mysql_zlib_dir/$base_libdir/libz.a"  -o \
++                   -f "$mysql_zlib_dir/$base_libdir/libz.so" -o \
++                   -f "$mysql_zlib_dir/$base_libdir/libz.sl" -o \
++                   -f "$mysql_zlib_dir/$base_libdir/libz.dylib" \) \
+                 -a -f "$mysql_zlib_dir/include/zlib.h"; then
+           ZLIB_INCLUDES="-I$mysql_zlib_dir/include"
+-          ZLIB_LIBS="-L$mysql_zlib_dir/lib -lz"
++          ZLIB_LIBS="-L$mysql_zlib_dir/$base_libdir -lz"
+           MYSQL_CHECK_ZLIB_DIR
+         fi
+         if test "x$mysql_cv_compress" != "xyes"; then 
+-          AC_MSG_ERROR([headers or binaries were not found in $mysql_zlib_dir/{include,lib}])
++          AC_MSG_ERROR([headers or binaries were not found in $mysql_zlib_dir/{include,$base_libdir}])
+         fi
+         ;;
+     esac
+diff --git a/configure.in b/configure.in
+index 2c6c08e..193b59a 100644
+--- a/configure.in
++++ b/configure.in
+@@ -104,6 +104,14 @@ AC_SUBST(SHARED_LIB_MAJOR_VERSION)
+ AC_SUBST(SHARED_LIB_VERSION)
+ AC_SUBST(AVAILABLE_LANGUAGES)
+ 
++AC_ARG_WITH([baselib-dir],
++            AC_HELP_STRING([--baselib-dir=DIR],
++                           [Provide MySQL with a custom location of
++                           baselib dir. Given DIR, such as zlib binary is
++                           assumed to be in $zlib-dir/$DIR.]),
++            [base_libdir=${withval}],
++            [base_libdir="lib"])
++
+ # Check whether a debug mode should be enabled.
+ AC_ARG_WITH([debug],
+     AS_HELP_STRING([--with-debug@<:@=full@:>@],
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index c535a41..ca8090e 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x8
            file://configure-ps-cache-check.patch \
            file://fix-cve-2013-1861-1.patch \
            file://fix-cve-2013-1861-2.patch \
+           file://zlib-let-libdir-configurable.patch \
            file://my.cnf \
            file://mysqld.sh"
 
@@ -51,6 +52,7 @@ EXTRA_OECONF = "--with-atomic-ops=up \
                 --without-man \
                 --without-docs \
                 --with-zlib-dir=${STAGING_EXECPREFIXDIR} \
+                --with-baselib-dir=${base_libdir} \
                 --with-pic \
                 "
 
-- 
1.8.1.2


