Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CACD60670
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 08:49:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB28nJME008977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 00:49:19 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 00:49:18 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 03:49:17 -0500
Message-ID: <1417510157-29679-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] apache2: add PACKAGECONFIG for selinux
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
X-List-Received-Date: Tue, 02 Dec 2014 08:49:22 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for 'selinux', otherwise there would be warnings like
below:

WARN: apache2: apache2 rdepends on libselinux, but it isn't a build dependency?

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |    4 ++
 ...onfigure-allow-to-disable-selinux-support.patch |   40 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index d79d40b..55d507f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://npn-patch-2.4.7.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
+           file://configure-allow-to-disable-selinux-support.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
@@ -58,6 +59,9 @@ EXTRA_OECONF = "--enable-ssl \
     --enable-mpms-shared \
     ac_cv_have_threadsafe_pollset=no"
 
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
     cat ${WORKDIR}/init | \
diff --git a/meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch
new file mode 100644
index 0000000..5b5c297
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch
@@ -0,0 +1,40 @@
+From d23dd33e373340f6fddf11904839d1a118824401 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Mon, 1 Dec 2014 02:08:27 -0500
+Subject: [PATCH] apache2: allow to disable selinux support
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.in |   14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index df94ee5..8c3ab21 100644
+--- a/configure.in
++++ b/configure.in
+@@ -466,10 +466,16 @@ getloadavg
+ dnl confirm that a void pointer is large enough to store a long integer
+ APACHE_CHECK_VOID_PTR_LEN
+ 
+-AC_CHECK_LIB(selinux, is_selinux_enabled, [
+-   AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
+-   APR_ADDTO(AP_LIBS, [-lselinux])
+-])
++# SELinux support
++AC_ARG_ENABLE(selinux,APACHE_HELP_STRING(--enable-selinux,Enable SELinux support [default=auto]),
++    [],[enable_selinux=auto])
++
++if test x$enable_selinux != xno; then
++    AC_CHECK_LIB(selinux, is_selinux_enabled, [
++        AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
++        APR_ADDTO(AP_LIBS, [-lselinux])
++    ])
++fi
+ 
+ AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
+ [AC_TRY_RUN(#define _GNU_SOURCE
+-- 
+1.7.9.5
+
-- 
1.7.9.5


