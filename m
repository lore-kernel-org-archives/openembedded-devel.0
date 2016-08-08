Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA5AB76312
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 08:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7884bKQ015518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Aug 2016 01:04:37 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 8 Aug 2016 01:04:36 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 16:04:33 +0800
Message-ID: <1470643473-17129-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: yue.tao@windriver.com
Subject: [meta-networking][PATCH] squid: fix configure host contamination
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
X-List-Received-Date: Mon, 08 Aug 2016 08:04:36 -0000
Content-Type: text/plain

From: Yue Tao <yue.tao@windriver.com>

When configuring squid with --enable-esi option,
the following error was observed:
[snip]
checking libxml/parser.h usability... no
checking libxml/parser.h presence... no
checking for libxml/parser.h... no
configure: Failed to find libxml2 header file libxml/parser.h
[snip]
ERROR: This autoconf log indicates errors, it looked at host include
and/or library paths while determining system capabilities.
[snip]

It tried to search libxml header file in host path. Set the SYSROOT
to avoid this host contamination.

Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../squid/files/set_sysroot_patch.patch            | 26 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.20.bb          |  6 +++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch

diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
new file mode 100644
index 0000000..68733f9
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
@@ -0,0 +1,26 @@
+diff --git a/configure.ac.old b/configure.ac
+index 54eda73..874f48e 100644
+--- a/configure.ac.old
++++ b/configure.ac
+@@ -964,15 +964,15 @@ if test "x$squid_opt_use_esi" = "xyes" -a "x$with_libxml2" != "xno" ; then
+   dnl Find the main header and include path...
+   AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
+     AC_CHECK_HEADERS([libxml/parser.h], [], [
+-      AC_MSG_NOTICE([Testing in /usr/include/libxml2])
++      AC_MSG_NOTICE([Testing in $SYSROOT/usr/include/libxml2])
+       SAVED_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
++      CPPFLAGS="-I$SYSROOT/usr/include/libxml2 $CPPFLAGS"
+       unset ac_cv_header_libxml_parser_h
+-      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
+-        AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
+-        CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
++      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I$SYSROOT/usr/include/libxml2"], [
++        AC_MSG_NOTICE([Testing in $SYSROOT/usr/local/include/libxml2])
++        CPPFLAGS="-I$SYSROOT/usr/local/include/libxml2 $SAVED_CPPFLAGS"
+         unset ac_cv_header_libxml_parser_h
+-        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
++        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I$SYSROOT/usr/local/include/libxml2"], [
+           AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
+         ])
+       ])
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index f26aebe..3ce195a 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
+           file://set_sysroot_patch.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
@@ -48,6 +49,11 @@ EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}'"
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
 
 TESTDIR = "test-suite"
+
+do_configure_prepend() {
+    export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
+}
+
 do_compile_ptest() {
     oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
-- 
2.7.4


