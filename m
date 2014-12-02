Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F52B60030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 08:14:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB28ETG5016121
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 00:14:29 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 00:14:28 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 03:14:27 -0500
Message-ID: <1417508067-8686-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH][meta-oe] ltrace: add PACKAGECONFIG for selinux
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
X-List-Received-Date: Tue, 02 Dec 2014 08:14:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for 'selinux', otherwise there would be warnings like
below:

WARN: ltrace: ltrace rdepends on libselinux, but it isn't a build dependency?

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...onfigure-allow-to-disable-selinux-support.patch |   36 ++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |    3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/configure-allow-to-disable-selinux-support.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/configure-allow-to-disable-selinux-support.patch b/meta-oe/recipes-devtools/ltrace/ltrace/configure-allow-to-disable-selinux-support.patch
new file mode 100644
index 0000000..4f89d8f
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/configure-allow-to-disable-selinux-support.patch
@@ -0,0 +1,36 @@
+From 887a403e38f590ebf1d04ce600d94cb7a351744c Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Mon, 1 Dec 2014 00:57:42 -0500
+Subject: [PATCH] ltrace: allow to enable/disable selinux support
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac |   10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6fe5e3b..189885a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,8 +125,14 @@ AC_SUBST(libstdcxx_LIBS)
+ 
+ 
+ dnl Check security_get_boolean_active availability.
+-AC_CHECK_HEADERS(selinux/selinux.h)
+-AC_CHECK_LIB(selinux, security_get_boolean_active)
++AC_ARG_ENABLE([selinux],
++    AS_HELP_STRING([--enable-selinux],[enable SELinux support [default=auto]]),
++    [], [enable_selinux=auto])
++
++if test x$enable_selinux != xno; then
++    AC_CHECK_HEADERS(selinux/selinux.h)
++    AC_CHECK_LIB(selinux, security_get_boolean_active)
++fi
+ 
+ dnl Whether (and which) elfutils libdw.so to use for unwinding.
+ AC_ARG_WITH(elfutils,
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 507747a..6984848 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -17,12 +17,15 @@ DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git \
            file://ltrace-0.7.2-unused-typedef.patch \
+           file://configure-allow-to-disable-selinux-support.patch \
           "
 S = "${WORKDIR}/git"
 
 inherit autotools
 
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
 do_configure_prepend () {
 	( cd ${S}; ./autogen.sh )
-- 
1.7.9.5


