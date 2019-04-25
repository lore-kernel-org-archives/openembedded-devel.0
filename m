Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC66D6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 07:15:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3P7FV1V010102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 00:15:31 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 25 Apr 2019 00:15:30 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Apr 2019 15:15:28 +0800
Message-ID: <1556176528-151935-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] apache2: add back patch for set perlbin
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
X-List-Received-Date: Thu, 25 Apr 2019 07:15:32 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Add back this patch. Without this patch, apxs's shebang will use
perl under hosttools, which can be too long for shebang, and cause
error:
bad interpreter: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apache2/apache2/apache-configure_perlbin.patch | 34 ++++++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.39.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
new file mode 100644
index 0000000..61669e3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
@@ -0,0 +1,34 @@
+From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
+From: echo <fei.geng@windriver.com>
+Date: Tue, 28 Apr 2009 03:11:06 +0000
+Subject: [PATCH] Fix perl install directory to /usr/bin
+
+Upstream-Status: Inappropriate [configuration]
+
+Add back this patch. Without this patch, apxs's shebang will use
+perl under hosttools, which can be too long for shebang, and cause
+error:
+bad interpreter: No such file or directory
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ configure.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d828512..be7bd25 100644
+--- a/configure.in
++++ b/configure.in
+@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
+ AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
+ 	[Location of the MIME types config file, relative to the Apache root directory])
+ 
+-perlbin=`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" = "x"; then
+-    perlbin="/replace/with/path/to/perl/interpreter"
+-fi
++perlbin='/usr/bin/perl'
+ AC_SUBST(perlbin)
+ 
+ dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index 2bd21f7..4cdf36c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0005-replace-lynx-to-curl-in-apachectl-script.patch \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
+           file://apache-configure_perlbin.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


