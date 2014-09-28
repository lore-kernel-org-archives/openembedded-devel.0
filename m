Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2066FE10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 06:10:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S69qlX008943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 27 Sep 2014 23:09:52 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 27 Sep 2014 23:09:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<paul.eggleton@linux.intel.com>, <Liezhi.Yang@windriver.com>
Date: Sun, 28 Sep 2014 02:09:50 -0400
Message-ID: <1411884590-22155-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: drop the anonymous function and use proper install layout
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
X-List-Received-Date: Sun, 28 Sep 2014 06:10:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The anonymous function redefined bindir to bindir_noprefix (and
others), which broke the sstate between build dirs.

The redefined *_noprefix was to used to pass to the INSTALL_*
variables to change the layout as we want, but in fact we can
do this in other ways instead of the pain one:

1) Change the default layout and a little adjustment.
There are 4 install layout: STANDALONE(default), RPM, DEB and SVR4.
And RPM is the one close to what we are using.

2) Don't use prefix and pass full patches to INSTALL_*.
The mariadb's cmake define some of the INSTALL_* relative to
CMAKE_INSTALL_PREFIX, So we can use empty CMAKE_INSTALL_PREFIX,
then we can pass our full paths to INSTALL_* directly.

This patch set the default layout to RPM and pass paths only for:
- INSTALL_DOCDIR: no prefix prepending, so ${datadir} works.
- INSTALL_LIBDIR/INSTALL_PLUGINDIR: use ${baselib}.

The mysql-test is moved from /usr to /usr/share which is more
reasonable, fix the FILES inclusion accordingly.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc | 27 +++++-------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index 9cc2cc9..4460df9 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -35,19 +35,6 @@ SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
-python __anonymous() {
-    # This is a pain but it's the only way to pass these in since
-    # MariaDB's cmake scripts insist on prepending the prefix to the
-    # specified values for INSTALL_*
-    localdata = d.createCopy()
-    localdata.setVar('prefix', '')
-    localdata.setVar('exec_prefix', '')
-    d.setVar('bindir_noprefix', localdata.getVar('bindir', True).lstrip('/'))
-    d.setVar('sbindir_noprefix', localdata.getVar('sbindir', True).lstrip('/'))
-    d.setVar('datadir_noprefix', localdata.getVar('datadir', True).lstrip('/'))
-    d.setVar('libdir_noprefix', localdata.getVar('libdir', True).lstrip('/'))
-}
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
@@ -64,15 +51,11 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DNROFF=FALSE \
                  -DENABLE_DTRACE=FALSE \
                  -DWITH_PIC=ON \
-                 -DINSTALL_DOCDIR:PATH=${datadir_noprefix}/doc/${BPN} \
-                 -DINSTALL_BINDIR:PATH=${bindir_noprefix} \
-                 -DINSTALL_SBINDIR:PATH=${sbindir_noprefix} \
-                 -DINSTALL_SCRIPTDIR:PATH=${bindir_noprefix} \
-                 -DINSTALL_LIBDIR:PATH=${libdir_noprefix} \
-                 -DINSTALL_PLUGINDIR:PATH=${libdir_noprefix}/plugin \
+                 -DINSTALL_LAYOUT=RPM \
+                 -DINSTALL_DOCDIR:PATH=${datadir}/doc/${BPN} \
+                 -DINSTALL_LIBDIR:PATH=${baselib} \
+                 -DINSTALL_PLUGINDIR:PATH=${baselib}/plugin \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir_noprefix}/mysql \
-                 -DINSTALL_SUPPORTFILESDIR:PATH=${datadir_noprefix}/mysql-support-files \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DCMAKE_AR:FILEPATH=${AR}"
@@ -177,7 +160,7 @@ FILES_libmysqlclient-dev = " \
 FILES_libmysqlclient-staticdev = "\
     ${libdir}/*.a"
 FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
-    /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
+    ${datadir}/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
 
 # Avoid warnings about ha_xtradb.so.0.0.0 and ha_innodb_plugin.so.0.0.0
 # which are intentionally non-PIC on 32-bit x86 (see e.g.
-- 
2.0.0


