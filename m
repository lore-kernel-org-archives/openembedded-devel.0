Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57E366ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 06:56:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9E6uAEJ001312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 23:56:10 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 13 Oct 2014 23:56:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Oct 2014 02:56:08 -0400
Message-ID: <1413269768-13928-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] squid: add new recipe
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
X-List-Received-Date: Tue, 14 Oct 2014 06:56:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

squid is a fully-featured http proxy and web-cache daemon for Linux.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../Add-default-entry-for-cross-compile.patch      | 31 +++++++++++
 ...-ksh-reference-in-krb-ldap-helper-to-bash.patch | 29 ++++++++++
 ...flawed-dynamic-ldb-link-test-in-configure.patch | 43 +++++++++++++++
 .../squid/files/Set-up-for-cross-compilation.patch | 29 ++++++++++
 .../squid/files/Skip-AC_RUN_IFELSE-tests.patch     | 64 ++++++++++++++++++++++
 .../recipes-daemons/squid/files/run-ptest          |  3 +
 ...d-use-serial-tests-config-needed-by-ptest.patch | 31 +++++++++++
 .../recipes-daemons/squid/files/volatiles.03_squid |  2 +
 .../recipes-daemons/squid/squid_3.4.7.bb           | 64 ++++++++++++++++++++++
 9 files changed, 296 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/run-ptest
 create mode 100644 meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/volatiles.03_squid
 create mode 100644 meta-networking/recipes-daemons/squid/squid_3.4.7.bb

diff --git a/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch b/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
new file mode 100644
index 0000000..5f845bb
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
@@ -0,0 +1,31 @@
+From faa212a4e0aaf442ff58fca50770a8fadc1038e3 Mon Sep 17 00:00:00 2001
+Message-Id: <faa212a4e0aaf442ff58fca50770a8fadc1038e3.1382041123.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Thu, 17 Oct 2013 16:17:48 -0400
+Subject: [PATCH 1/1] Add default entry for cross compile
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ acinclude/krb5.m4 |    6 +++++-
+ 1 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
+index 5d9ac36..7a072a2 100644
+--- a/acinclude/krb5.m4
++++ b/acinclude/krb5.m4
+@@ -82,7 +82,11 @@ main(void)
+ 
+         return 0;
+ }
+-]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ])
++]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ],
++[
++  dnl Can't test in cross compiled env - so assume good
++  squid_cv_broken_heimdal_krb5_h=no
++])
+     ],
+     [
+      dnl Can't test in cross compiled env - so assume good
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch b/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
new file mode 100644
index 0000000..6591d5c
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
@@ -0,0 +1,29 @@
+From 37da4010f41d936c2c727fc32adab832bdde9bec Mon Sep 17 00:00:00 2001
+Message-Id: <37da4010f41d936c2c727fc32adab832bdde9bec.1382481765.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Tue, 22 Oct 2013 18:39:39 -0400
+Subject: [PATCH 1/1] Change ksh reference in krb ldap helper to bash
+
+Very simple cert_tool script with no ksh specifics.
+Change it to use bash so a package dependency doesn't
+get created to ksh.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ helpers/external_acl/kerberos_ldap_group/cert_tool |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpers/external_acl/kerberos_ldap_group/cert_tool
+index 9f14959..b61be5d 100644
+--- a/helpers/external_acl/kerberos_ldap_group/cert_tool
++++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
+@@ -1,4 +1,5 @@
+-#!/bin/ksh
++#!/bin/bash
++# The above was originally ksh
+ #
+ #  -----------------------------------------------------------------------------
+ # 
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
new file mode 100644
index 0000000..2304c5f
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
@@ -0,0 +1,43 @@
+From 0d5b337ff5ef7dd48f970f08bd95d6327917cfd1 Mon Sep 17 00:00:00 2001
+Message-Id: <0d5b337ff5ef7dd48f970f08bd95d6327917cfd1.1382375807.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Mon, 21 Oct 2013 12:50:44 -0400
+Subject: [PATCH 1/1] Fix flawed dynamic -ldb link test in configure
+
+The test uses dbopen, but just ignores the fact
+that this function may not exist in the db version
+used.  This leads to the dynamic link test failing
+and the configure script just making assumptions
+about why and setting the need for -ldb incorrectly.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ configure.ac |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 962a748..42e6a93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3051,8 +3051,16 @@ AC_CHECK_DECL(dbopen,,,[
+ #include <db.h>
+ #endif])
+ 
+-dnl 1.85
+-SQUID_CHECK_DBOPEN_NEEDS_LIBDB
++if test "x$ac_cv_have_decl_dbopen" = "xyes"; then
++  dnl 1.85
++  SQUID_CHECK_DBOPEN_NEEDS_LIBDB
++else
++  # dbopen isn't there. So instead of running a compile/link test that
++  # uses it and is thus guaranteed to fail, we just assume that we will
++  # need to link in the db library, rather than fabricate some other
++  # dynamic compile/link test.
++  ac_cv_dbopen_libdb="yes"
++fi
+ if test "x$ac_cv_dbopen_libdb" = "xyes"; then
+     LIB_DB="-ldb"
+ fi
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
new file mode 100644
index 0000000..4ca2744
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -0,0 +1,29 @@
+From 17e5a28667f667859c48bee25e575a072d39ee1b Mon Sep 17 00:00:00 2001
+Message-Id: <17e5a28667f667859c48bee25e575a072d39ee1b.1381956170.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Wed, 16 Oct 2013 16:41:03 -0400
+Subject: [PATCH 1/1] Set up for cross compilation
+
+Set the host compiler to BUILD_CXX so
+proper cross compilation can occur.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ configure.ac |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c2d3033..dda9ed9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,6 +19,7 @@ m4_include([acinclude/lib-checks.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx_0x.m4])
+ m4_include([acinclude/ax_cxx_0x_types.m4])
+ 
++HOSTCXX="$BUILD_CXX"
+ PRESET_CFLAGS="$CFLAGS"
+ PRESET_CXXFLAGS="$CXXFLAGS"
+ PRESET_LDFLAGS="$LDFLAGS"
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
new file mode 100644
index 0000000..7b6dcc8
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -0,0 +1,64 @@
+Subject: [PATCH] Skip AC_RUN_IFELSE tests
+
+Upstream-Status: Inappropriate [cross compiling specific]
+
+Such tests are not supported in a cross compile
+environment.  Choose sane defaults.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ acinclude/krb5.m4       |   10 +++++++++-
+ acinclude/lib-checks.m4 |    8 ++++++--
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
+index 946bea8..7a072a2 100644
+--- a/acinclude/krb5.m4
++++ b/acinclude/krb5.m4
+@@ -82,7 +82,15 @@ main(void)
+ 
+         return 0;
+ }
+-]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ])
++]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ],
++[
++  dnl Can't test in cross compiled env - so assume good
++  squid_cv_broken_heimdal_krb5_h=no
++])
++    ],
++    [
++     dnl Can't test in cross compiled env - so assume good
++     squid_cv_broken_heimdal_krb5_h=no
+     ])
+   ])
+ ]) dnl SQUID_CHECK_KRB5_HEIMDAL_BROKEN_KRB5_H
+diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
+index 2bf98ee..50dba9b 100644
+--- a/acinclude/lib-checks.m4
++++ b/acinclude/lib-checks.m4
+@@ -128,7 +128,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS],[
+    AC_DEFINE(SQUID_SSLGETCERTIFICATE_BUGGY, 1)
+    AC_MSG_RESULT([yes])
+   ],
+-  [])
++  [
++   AC_MSG_RESULT([skipped - can't test in cross-compiled env])
++  ])
+ 
+   AC_MSG_CHECKING(whether the workaround for SSL_get_certificate works)
+   AC_RUN_IFELSE([
+@@ -154,7 +156,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS],[
+   [
+    AC_MSG_RESULT([no])
+   ],
+-[])
++[
++   AC_MSG_RESULT([skipped - can't test in cross-compiled env])
++])
+ 
+ SQUID_STATE_ROLLBACK(check_SSL_get_certificate)
+ ])
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/run-ptest b/meta-networking/recipes-daemons/squid/files/run-ptest
new file mode 100644
index 0000000..de79a29
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+#
+make -C test-suite -k runtest-TESTS
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
new file mode 100644
index 0000000..9e2ceab
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -0,0 +1,31 @@
+From 2192fdbc90b0ff2d5408e8763df200620870deea Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 13 Oct 2014 01:32:37 -0700
+Subject: [PATCH] squid: use serial-tests config needed by ptest
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6f7171f..ab9b93e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_PREREQ(2.61)
+ AC_CONFIG_HEADERS([include/autoconf.h])
+ AC_CONFIG_AUX_DIR(cfgaux)
+ AC_CONFIG_SRCDIR([src/main.cc])
+-AM_INIT_AUTOMAKE([tar-ustar nostdinc])
++AM_INIT_AUTOMAKE([tar-ustar nostdinc serial-tests])
+ AC_REVISION($Revision$)dnl
+ AC_PREFIX_DEFAULT(/usr/local/squid)
+ AM_MAINTAINER_MODE
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-daemons/squid/files/volatiles.03_squid b/meta-networking/recipes-daemons/squid/files/volatiles.03_squid
new file mode 100644
index 0000000..b96865d
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/volatiles.03_squid
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d squid squid 0755 /var/run/squid none
diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
new file mode 100644
index 0000000..37e4bba
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
@@ -0,0 +1,64 @@
+SUMMARY = "A fully-featured http proxy and web-cache daemon for Linux"
+DESCRIPTION = "A fully-featured http proxy and web-cache daemon for Linux. \
+Squid offers a rich access control, authorization and logging environment to \
+develop web proxy and content serving applications. \
+Squid offers a rich set of traffic optimization options, most of which are \
+enabled by default for simpler installation and high performance. \
+"
+HOMEPAGE = "http://www.squid-cache.org"
+SECTION = "network"
+LICENSE = "GPLv2+"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
+MIN_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${PV}.tar.bz2 \
+           file://Set-up-for-cross-compilation.patch \
+           file://Skip-AC_RUN_IFELSE-tests.patch \
+           file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
+           file://Change-ksh-reference-in-krb-ldap-helper-to-bash.patch \
+           file://squid-use-serial-tests-config-needed-by-ptest.patch \
+           file://run-ptest \
+           file://volatiles.03_squid \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
+                    file://COPYRIGHT;md5=2900f50789c498be8e9f1eb23b55cbe9 \
+                   "
+SRC_URI[md5sum] = "9951034b10f7ee0f45a95cfae61c57c2"
+SRC_URI[sha256sum] = "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e268cb7a8c97c61af2b6"
+
+DEPENDS = "libtool krb5 openldap db cyrus-sasl"
+
+inherit autotools useradd ptest
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
+
+EXTRA_OECONF += "--with-default-user=squid"
+
+TESTDIR = "test-suite"
+do_compile_ptest() {
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
+    cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
+
+    # do NOT need to rebuild Makefile itself
+    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/volatiles.03_squid  ${D}${sysconfdir}/default/volatiles/volatiles.03_squid
+	rmdir "${D}${localstatedir}/run/${BPN}"
+	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/run"
+}
+
+FILES_${PN} += "${libdir} ${datadir}/errors ${datadir}/icons"
+FILES_${PN}-dbg += "/usr/src/debug"
+FILES_${PN}-doc += "${datadir}/*.txt"
+
+RDEPENDS_${PN}-ptest += "make"
-- 
2.0.0


