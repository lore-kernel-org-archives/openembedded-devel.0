Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 462617EA20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:48:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S1mO3K007278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:48:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:48:14 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:06 +0800
Message-ID: <1561686490-12445-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/6] libldb: upgrade 1.4.1 -> 1.6.3
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
X-List-Received-Date: Fri, 28 Jun 2019 01:48:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. switch to python3
2. add cross-answer for lmdb check, so remove patch 0001-libldb-fix-config-error
3. fix cross-compile problem caused by waf
4. refresh patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../waf-cross-answers/cross-answers-aarch64.txt    |  1 +
 .../waf-cross-answers/cross-answers-aarch64_be.txt |  1 +
 .../files/waf-cross-answers/cross-answers-arm.txt  |  1 +
 .../waf-cross-answers/cross-answers-armeb.txt      |  1 +
 .../files/waf-cross-answers/cross-answers-i586.txt |  1 +
 .../files/waf-cross-answers/cross-answers-i686.txt |  1 +
 .../files/waf-cross-answers/cross-answers-mips.txt |  1 +
 .../waf-cross-answers/cross-answers-mips64.txt     |  1 +
 .../waf-cross-answers/cross-answers-mips64el.txt   |  1 +
 .../waf-cross-answers/cross-answers-mipsel.txt     |  1 +
 .../waf-cross-answers/cross-answers-powerpc.txt    |  1 +
 .../waf-cross-answers/cross-answers-powerpc64.txt  |  1 +
 .../waf-cross-answers/cross-answers-riscv64.txt    |  1 +
 .../waf-cross-answers/cross-answers-x86_64.txt     |  1 +
 .../libldb/0001-libldb-fix-config-error.patch      | 87 ----------------------
 .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 56 +++++++-------
 .../libldb/libldb/options-1.4.1.patch              | 56 ++++++--------
 .../libldb/{libldb_1.4.1.bb => libldb_1.6.3.bb}    | 22 +++---
 19 files changed, 141 insertions(+), 156 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.4.1.bb => libldb_1.6.3.bb} (79%)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index 1023f6a..fc0400d 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
index 1023f6a..fc0400d 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index a5cd998..759afe8 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
index a5cd998..759afe8 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index a5cd998..759afe8 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index a5cd998..759afe8 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index 3e239e7..c989f27 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index 82e694f..215f574 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
index 82e694f..215f574 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index 3e239e7..c989f27 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index 27b9378..f107974 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index 7fd3092..7a443cc 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -38,3 +38,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
index 1023f6a..fc0400d 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index 1023f6a..fc0400d 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -37,3 +37,4 @@ Checking for small off_t: NO
 Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch b/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
deleted file mode 100644
index 5818d57..0000000
--- a/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From bc4ff7e37ce120c257e52a81fe3475499dfd2573 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 10:10:24 +0800
-Subject: [PATCH] libldb: fix config error
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- wscript | 58 +++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/wscript b/wscript
-index b0af7b6..8ad9f96 100644
---- a/wscript
-+++ b/wscript
-@@ -115,40 +115,40 @@ def configure(conf):
-                                              onlyif='talloc tdb tevent pyldb-util',
-                                              implied_deps='replace talloc tdb tevent'):
-                 conf.define('USING_SYSTEM_LDB', 1)
-+    if not Options.options.without_ldb_lmdb:
-+        if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
-+                               "HAVE_64_BIT_SIZE_T_FOR_LMDB",
-+                               execute=True,
-+                               msg='Checking for a 64-bit host to '
-+                               'support lmdb'):
-+            Logs.warn("--without-ldb-lmdb implied as this "
-+                      "host is not 64-bit")
-+
-+            if not conf.env.standalone_ldb and \
-+               not Options.options.without_ad_dc and \
-+               conf.CONFIG_GET('ENABLE_SELFTEST'):
-+                Logs.warn("NOTE: Some AD DC parts of selftest will fail")
- 
--    if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
--                           "HAVE_64_BIT_SIZE_T_FOR_LMDB",
--                           execute=True,
--                           msg='Checking for a 64-bit host to '
--                           'support lmdb'):
--        Logs.warn("--without-ldb-lmdb implied as this "
--                  "host is not 64-bit")
--
--        if not conf.env.standalone_ldb and \
--           not Options.options.without_ad_dc and \
--           conf.CONFIG_GET('ENABLE_SELFTEST'):
--            Logs.warn("NOTE: Some AD DC parts of selftest will fail")
--
--        conf.env.REQUIRE_LMDB = False
--    else:
--        if conf.env.standalone_ldb:
--            if Options.options.without_ldb_lmdb:
--                conf.env.REQUIRE_LMDB = False
--            else:
--                conf.env.REQUIRE_LMDB = True
--        elif Options.options.without_ad_dc:
-             conf.env.REQUIRE_LMDB = False
-         else:
--            if Options.options.without_ldb_lmdb:
--                if not Options.options.without_ad_dc and \
--                   conf.CONFIG_GET('ENABLE_SELFTEST'):
--                    raise Utils.WafError('--without-ldb-lmdb conflicts '
--                                         'with --enable-selftest while '
--                                         'building the AD DC')
--
-+            if conf.env.standalone_ldb:
-+                if Options.options.without_ldb_lmdb:
-+                    conf.env.REQUIRE_LMDB = False
-+                else:
-+                    conf.env.REQUIRE_LMDB = True
-+            elif Options.options.without_ad_dc:
-                 conf.env.REQUIRE_LMDB = False
-             else:
--                conf.env.REQUIRE_LMDB = True
-+                if Options.options.without_ldb_lmdb:
-+                    if not Options.options.without_ad_dc and \
-+                       conf.CONFIG_GET('ENABLE_SELFTEST'):
-+                        raise Utils.WafError('--without-ldb-lmdb conflicts '
-+                                             'with --enable-selftest while '
-+                                             'building the AD DC')
-+
-+                    conf.env.REQUIRE_LMDB = False
-+                else:
-+                    conf.env.REQUIRE_LMDB = True
- 
- 
-     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
new file mode 100644
index 0000000..45c5aca
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
@@ -0,0 +1,62 @@
+From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 25 Jan 2019 15:00:59 +0800
+Subject: [PATCH] waf: add support of cross_compile
+
+After upgrade, waf build system also upgraded.
+
+on 1.5.19, for cross_compile, subprocess.Popen is set to be
+samba_cross.cross_Popen, which will not execute testprog on
+host, but only read result from cross-answers.txt which is
+passed by option --cross-answer
+
+part of old code:
+    args = Utils.to_list(kw.get('exec_args', []))
+    proc = Utils.pproc.Popen([lastprog] + args, stdout=Utils.pproc.PIPE, stderr=Utils.pproc.PIPE)
+
+but on new version, exec_args is not used and cause do_configure
+failed with Exec format error
+
+fixed by append cross anser related args to cmd
+
+Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_requests/211]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
+index 7608215..767cf33 100644
+--- a/third_party/waf/waflib/Tools/c_config.py
++++ b/third_party/waf/waflib/Tools/c_config.py
+@@ -660,20 +660,21 @@ class test_exec(Task.Task):
+ 	"""
+ 	color = 'PINK'
+ 	def run(self):
++		args = self.generator.bld.kw.get('exec_args', [])
+ 		if getattr(self.generator, 'rpath', None):
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
+-			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
++				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
++			else: 
++				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args)
+ 		else:
+ 			env = self.env.env or {}
+ 			env.update(dict(os.environ))
+ 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
+ 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=env)
+ 			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args, env=env)
+ 
+ @feature('test_exec')
+ @after_method('apply_link')
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
index ee4936a..3f2921e 100644
--- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
@@ -1,30 +1,32 @@
-From f4cda3a71311e4496b725bc5f46af93413ec7a1c Mon Sep 17 00:00:00 2001
-From: Bian Naimeng <biannm@cn.fujitsu.com>
-Date: Fri, 17 Jul 2015 11:58:49 +0800
-Subject: [PATCH] libldb: add new recipe
+From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 25 Jun 2019 14:25:08 +0800
+Subject: [PATCH] do not import target module while cross compile
 
-Some modules such as dynamic library maybe cann't be imported while cross compile,
-we just check whether does the module exist.
+Some modules such as dynamic library maybe cann't be imported
+while cross compile, we just check whether does the module exist.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
+update to version 4.10.5, and switch to python3
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- buildtools/wafsamba/samba_bundled.py | 32 ++++++++++++++++++++++++--------
- 1 file changed, 24 insertions(+), 8 deletions(-)
+ buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 253d604..398cc6a 100644
+index 60ce7da..5468a36 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
-@@ -2,6 +2,7 @@
+@@ -4,6 +4,7 @@ import sys
+ from waflib import Build, Options, Logs
+ from waflib.Configure import conf
+ from wafsamba import samba_utils
++import importlib.util, os
  
- import sys
- import Build, Options, Logs
-+import imp, os
- from Configure import conf
- from samba_utils import TO_LIST
- 
-@@ -249,17 +250,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
+ def PRIVATE_NAME(bld, name, private_extension, private_library):
+     '''possibly rename a library to include a bundled extension'''
+@@ -249,17 +250,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
@@ -34,34 +36,32 @@ index 253d604..398cc6a 100644
 -        found = False
 -    else:
 +    # Find module in PYTHONPATH
-+    stuff = imp.find_module(modulename, [os.environ["PYTHONPATH"]])
-+    if stuff:
++    spec = importlib.util._find_spec_from_path(modulename, [os.environ["PYTHONPATH"]])
++    if spec:
          try:
 -            version = m.__version__
 -        except AttributeError:
-+            m = imp.load_module(modulename, stuff[0], stuff[1], stuff[2])
++            module = importlib.util.module_from_spec(spec)
++            spec.loader.load_module(module)
 +        except ImportError:
              found = False
 +
 +            if conf.env.CROSS_COMPILE:
 +                # Some modules such as dynamic library maybe cann't be imported
 +                # while cross compile, we just check whether the module exist
-+                Logs.warn('Cross module[%s] has been found, but can not be loaded.' % (stuff[1]))
++                Logs.warn('Cross module[%s] has been found, but can not be loaded.' % (spec.name))
 +                found = True
          else:
 -            found = tuplize_version(version) >= tuplize_version(minversion)
 +            try:
-+                version = m.__version__
++                version = module.__version__
 +            except AttributeError:
 +                found = False
 +            else:
 +                found = tuplize_version(version) >= tuplize_version(minversion)
-+        finally:
-+            if stuff[0]:
-+                stuff[0].close()
-+    else:
-+        found = False
-+
      if not found and not conf.LIB_MAY_BE_BUNDLED(libname):
          Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
          sys.exit(1)
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch b/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
index 357afbe..eaf7b9b 100644
--- a/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
+++ b/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
@@ -1,6 +1,6 @@
-From ffffd29bc6303d60b3d77048fbbf6776f6fbbe01 Mon Sep 17 00:00:00 2001
+From b021a78758716652734f60209087f8d9dce941d8 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 19 Jul 2018 16:40:31 +0800
+Date: Tue, 25 Jun 2019 17:06:18 +0800
 Subject: [PATCH] ldb: Add configure options for packages
 
 Add configure options for the following packages:
@@ -17,22 +17,22 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 Update to version 1.4.1, and fix one configure error
 
-Cross answers file cross-answers-i586.txt is incomplete with 
+Cross answers file cross-answers-i586.txt is incomplete with
 "Checking for a 64-bit host to support lmdb: UNKNOWN"
 
 we don't support lmdb, so only check when lmdb is support
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
- wscript             |  6 ++++
- 2 files changed, 77 insertions(+), 23 deletions(-)
+ lib/replace/wscript | 92 +++++++++++++++++++++++++++++++++++++++++------------
+ wscript             |  7 +++-
+ 2 files changed, 77 insertions(+), 22 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index fd00a42..434192e 100644
+index 1d01e1e..727c408 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -23,6 +23,41 @@ def set_options(opt):
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -74,7 +74,7 @@ index fd00a42..434192e 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -32,12 +67,25 @@ def configure(conf):
+@@ -34,12 +69,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -103,25 +103,24 @@ index fd00a42..434192e 100644
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -108,7 +156,9 @@ def configure(conf):
+@@ -110,8 +158,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
--    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +    if Options.options.enable_valgrind:
-+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
-+
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -340,22 +390,20 @@ def configure(conf):
+@@ -380,20 +429,21 @@ def configure(conf):
  
-     conf.CHECK_FUNCS('prctl dirname basename')
+     strlcpy_in_bsd = False
  
--    strlcpy_in_bsd = False
--
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -139,8 +138,9 @@ index fd00a42..434192e 100644
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
-+            conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
-+                    checklibc=True)
++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++                                   checklibc=True):
++                strlcpy_in_bsd = True
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
@@ -153,23 +153,15 @@ index fd00a42..434192e 100644
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-@@ -699,7 +747,7 @@ def configure(conf):
-     # look for a method of finding the list of network interfaces
-     for method in ['HAVE_IFACE_GETIFADDRS', 'HAVE_IFACE_AIX', 'HAVE_IFACE_IFCONF', 'HAVE_IFACE_IFREQ']:
-         bsd_for_strlcpy = ''
--        if strlcpy_in_bsd:
-+        if Options.options.enable_libbsd:
-             bsd_for_strlcpy = ' bsd'
-         if conf.CHECK_CODE('''
-                            #define %s 1
 diff --git a/wscript b/wscript
-index ad91bc6..2d20fee 100644
+index 7891693..b272f53 100644
 --- a/wscript
 +++ b/wscript
-@@ -36,6 +36,12 @@ def set_options(opt):
+@@ -37,7 +37,12 @@ def options(opt):
+     opt.add_option('--without-ldb-lmdb',
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
- 
+-
 +    opt.add_option('--with-valgrind',
 +                   help=("enable use of valgrind"),
 +                   action="store_true", dest='enable_valgrind')
diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.6.3.bb
similarity index 79%
rename from meta-networking/recipes-support/libldb/libldb_1.4.1.bb
rename to meta-networking/recipes-support/libldb/libldb_1.6.3.bb
index f3608c6..cea9e1a 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.6.3.bb
@@ -4,16 +4,16 @@ SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
 DEPENDS += "libtdb libtalloc libtevent popt"
-RDEPENDS_pyldb += "python samba"
+RDEPENDS_pyldb += "python3 samba"
 RCONFLICTS_${PN} = "samba"
-RCONFLICTS_pyldb = "samba-python"
+RCONFLICTS_pyldb = "samba-python3"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
            file://options-1.4.1.patch \
-           file://0001-libldb-fix-config-error.patch \
            file://libldb-fix-musl-libc-unkown-type-error.patch \
            file://libldb-fix-musl-libc-conflict-type-error.patch \
+           file://0001-waf-add-support-of-cross_compile.patch \
           "
 
 PACKAGECONFIG ??= "\
@@ -27,6 +27,7 @@ PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
+PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
 
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
 
@@ -34,14 +35,18 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
-SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
+SRC_URI[md5sum] = "155e042125f5e8615e441723236e5d86"
+SRC_URI[sha256sum] = "4a437ed0330d0af30748a1198311d7a3bc9eb1c51f31db4d5de380377cdb9106"
 
 inherit waf-samba distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
 S = "${WORKDIR}/ldb-${PV}"
 
+#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+#to cross Popen
+export WAF_NO_PREFORK="yes"
+
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
                  --bundled-libraries=cmocka \
@@ -49,7 +54,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-modulesdir=${libdir}/ldb/modules \
                  --with-privatelibdir=${libdir}/ldb \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
-                 --without-ldb-lmdb \
                 "
 
 PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
@@ -63,8 +67,8 @@ FILES_${PN}-dbg += "${bindir}/.debug/* \
                     ${libdir}/ldb/modules/ldb/.debug/*"
 
 FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
-               ${libdir}/libpyldb-util.so.* \
+               ${libdir}/libpyldb-util.*.so.* \
               "
 FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
-                   ${libdir}/.debug/libpyldb-util.so.*"
-FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
+                   ${libdir}/.debug/libpyldb-util.*.so.*"
+FILES_pyldb-dev = "${libdir}/libpyldb-util.*.so"
-- 
2.7.4


