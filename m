Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C93FE60BA0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 01:46:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86435403"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 09:46:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D57F50A9990
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:36:05 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 09:46:05 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 09:46:15 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 00:19:56 -0700
Message-ID: <1584429596-2007-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584429596-2007-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584429596-2007-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3D57F50A9990.A2F45
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libtdb: upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 17 Mar 2020 01:46:13 -0000
Content-Type: text/plain

0001-waf-add-support-of-cross_compile.patch
removed since it's not available for 1.4.3

refresh tdb-Add-configure-options-for-packages.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...001-waf-add-support-of-cross_compile.patch | 63 -------------------
 ...b-Add-configure-options-for-packages.patch |  2 +-
 .../{libtdb_1.4.2.bb => libtdb_1.4.3.bb}      |  5 +-
 3 files changed, 3 insertions(+), 67 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.2.bb => libtdb_1.4.3.bb} (90%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
deleted file mode 100644
index e20c9a2c2..000000000
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 15:00:59 +0800
-Subject: [PATCH] waf: add support of cross_compile
-
-After upgrade libtdb from 1.3.16 to 1.3.17, waf build system
-which used by libtdb upgrade from 1.5.19 to 2.0.8
-
-on 1.5.19, for cross_compile, subprocess.Popen is set to be
-samba_cross.cross_Popen, which will not execute testprog on
-host, but only read result from cross-answers.txt which is
-passed by option --cross-answer
-
-part of old code:
-    args = Utils.to_list(kw.get('exec_args', []))
-    proc = Utils.pproc.Popen([lastprog] + args, stdout=Utils.pproc.PIPE, stderr=Utils.pproc.PIPE)
-
-but on 2.0.8, exec_args is not used and cause do_configure
-failed with Exec format error
-
-fixed by append cross anser related args to cmd
-
-Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_requests/211]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
-index 7608215..767cf33 100644
---- a/third_party/waf/waflib/Tools/c_config.py
-+++ b/third_party/waf/waflib/Tools/c_config.py
-@@ -660,20 +660,21 @@ class test_exec(Task.Task):
- 	"""
- 	color = 'PINK'
- 	def run(self):
-+		args = self.generator.bld.kw.get('exec_args', [])
- 		if getattr(self.generator, 'rpath', None):
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
--			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
-+			else: 
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args)
- 		else:
- 			env = self.env.env or {}
- 			env.update(dict(os.environ))
- 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
- 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=env)
- 			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args, env=env)
- 
- @feature('test_exec')
- @after_method('apply_link')
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
index 481fd68a4..c35cab7c2 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -78,7 +78,7 @@ index 1d01e1e..2336dc3 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+-    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
 +    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
similarity index 90%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
index 4973e80ca..c131014ff 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
-           file://0001-waf-add-support-of-cross_compile.patch \
 "
 
-SRC_URI[md5sum] = "b2c05ad68334368d3258a63db709f254"
-SRC_URI[sha256sum] = "9040b2cce4028e392f063f91bbe76b8b28fecc2b7c0c6071c67b5eb3168e004a"
+SRC_URI[md5sum] = "e638e8890f743624a754304b3f994f4d"
+SRC_URI[sha256sum] = "c8058393dfa15f47e11ebd2f1d132693f0b3b3b8bf22d0201bfb305026f88a1b"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.17.1




