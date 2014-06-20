Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAB68701DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 09:27:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5K9Ra2r016691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 02:27:36 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 20 Jun 2014 02:27:35 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jun 2014 05:27:34 -0400
Message-ID: <1403256454-4045-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: Use pkg-config for libxml2 dependency
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
X-List-Received-Date: Fri, 20 Jun 2014 09:27:40 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Use pkg-config for the libxml2 dependency, not the -config script.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../use-pkg-config-for-libxml2-dependency.patch    |   44 ++++++++++++++++++++
 .../recipes-support/postgresql/postgresql_9.2.4.bb |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql-9.2.4/use-pkg-config-for-libxml2-dependency.patch

diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.2.4/use-pkg-config-for-libxml2-dependency.patch b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/use-pkg-config-for-libxml2-dependency.patch
new file mode 100644
index 0000000..d26701f
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/use-pkg-config-for-libxml2-dependency.patch
@@ -0,0 +1,44 @@
+From 744bbd99a779deac244cebc30f21db9b77946eab Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 19 Jun 2014 22:34:21 -0400
+Subject: [PATCH] postgresql: Use pkg-config for libxml2 dependency
+
+Use pkg-config for the libxml2 dependency, not the -config script.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.in |   16 ++++------------
+ 1 file changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 3bf9728..d768e9f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -709,18 +709,10 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
+               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
+ 
+ if test "$with_libxml" = yes ; then
+-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
+-  if test -n "$XML2_CONFIG"; then
+-    for pgac_option in `$XML2_CONFIG --cflags`; do
+-      case $pgac_option in
+-        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
+-      esac
+-    done
+-    for pgac_option in `$XML2_CONFIG --libs`; do
+-      case $pgac_option in
+-        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
+-      esac
+-    done
++  PKG_CHECK_MODULES(PKG_XML2, [libxml-2.0],,)
++  if test "x$PKG_XML2_CFLAGS" != "x"; then
++    CPPFLAGS="$CPPFLAGS $PKG_XML2_CFLAGS"
++    LDFLAGS="$LDFLAGS $PKG_XML2_LIBS"
+   fi
+ fi
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
index 49ca53f..e45638d 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
@@ -7,6 +7,7 @@ PR = "${INC_PR}.0"
 SRC_URI += "\
     file://remove.autoconf.version.check.patch \
     file://ecpg-parallel-make-fix.patch \
+    file://use-pkg-config-for-libxml2-dependency.patch \
 "
 
 SRC_URI[md5sum] = "6ee5bb53b97da7c6ad9cb0825d3300dd"
-- 
1.7.9.5


