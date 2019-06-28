Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6D557EA38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:49:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S1ms0u007294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:49:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:49:05 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:10 +0800
Message-ID: <1561686490-12445-7-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 6/6] samba: upgrade 4.8.12 -> 4.10.5
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
X-List-Received-Date: Fri, 28 Jun 2019 01:49:29 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. switch to python3, from 4.10.x, samba support both python2 and python3,
   and from 4.11.x, python2 will be dropped.
2. fix cross-compile problem caused by waf
3. disable lmdb
4. refresh patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch | 35 ++++++++++++
 .../0001-samba-fix-musl-lib-without-innetgr.patch  | 42 +++++++++++++++
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 59 +++++++++++---------
 .../21-add-config-option-without-valgrind.patch    | 48 ++++++-----------
 .../samba/samba/glibc_only.patch                   | 29 +++++++---
 .../samba/{samba_4.8.12.bb => samba_4.10.5.bb}     | 42 ++++++++++-----
 7 files changed, 240 insertions(+), 77 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.12.bb => samba_4.10.5.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch b/meta-networking/recipes-connectivity/samba/samba/0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch
new file mode 100644
index 0000000..05a221a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch
@@ -0,0 +1,35 @@
+From dfd1b9a1cd9d695abc4314d711a83373fd1c81e6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 25 Jun 2019 15:12:26 +0800
+Subject: [PATCH] pyldb-util: don't use PYTHON ABI FLAG
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/ldb/wscript | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ldb/wscript b/lib/ldb/wscript
+index b9d2980..f40fca9 100644
+--- a/lib/ldb/wscript
++++ b/lib/ldb/wscript
+@@ -84,7 +84,7 @@ def configure(conf):
+                 conf.define('USING_SYSTEM_LDB', 1)
+         else:
+             using_system_pyldb_util = True
+-            dflt_name = 'pyldb-util' + conf.all_envs['default']['PYTHON_SO_ABI_FLAG']
++            dflt_name = 'pyldb-util'
+             if not conf.CHECK_BUNDLED_SYSTEM_PKG(dflt_name,
+                                                  minversion=VERSION,
+                                                  maxversion=max_ldb_version_dots,
+@@ -95,7 +95,7 @@ def configure(conf):
+             # We need to get a pyldb-util for all the python versions
+             # we are building for
+             if conf.env['EXTRA_PYTHON']:
+-                name = 'pyldb-util' + conf.all_envs['extrapython']['PYTHON_SO_ABI_FLAG']
++                name = 'pyldb-util'
+                 if not conf.CHECK_BUNDLED_SYSTEM_PKG(name,
+                                                      minversion=VERSION,
+                                                      maxversion=max_ldb_version_dots,
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch b/meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch
new file mode 100644
index 0000000..fb12a10
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch
@@ -0,0 +1,42 @@
+From fcb8ecd530b2d151e373974741601483326f7528 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Jun 2019 11:09:47 +0800
+Subject: [PATCH] samba: fix musl lib without innetgr
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/util/access.c | 2 +-
+ source3/auth/user_util.c | 2 +-
+ 2 file changed, 2 insertion(+), 2 deletion(-)
+
+diff --git a/lib/util/access.c b/lib/util/access.c
+index 7da0573..b94949e 100644
+--- a/lib/util/access.c
++++ b/lib/util/access.c
+@@ -112,7 +112,7 @@ static bool string_match(const char *tok,const char *s)
+ 			return true;
+ 		}
+ 	} else if (tok[0] == '@') { /* netgroup: look it up */
+-#ifdef	HAVE_NETGROUP
++#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
+ 		DATA_BLOB tmp;
+ 		char *mydomain = NULL;
+ 		char *hostname = NULL;
+diff --git a/source3/auth/user_util.c b/source3/auth/user_util.c
+index a76b5d4..30f523d 100644
+--- a/source3/auth/user_util.c
++++ b/source3/auth/user_util.c
+@@ -148,7 +148,7 @@ static void store_map_in_gencache(TALLOC_CTX *ctx, const char *from, const char
+ 
+ bool user_in_netgroup(TALLOC_CTX *ctx, const char *user, const char *ngname)
+ {
+-#ifdef HAVE_NETGROUP
++#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
+ 	static char *my_yp_domain = NULL;
+ 	char *lowercase_user = NULL;
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
new file mode 100644
index 0000000..23b35a8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
@@ -0,0 +1,62 @@
+From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 25 Jan 2019 15:00:59 +0800
+Subject: [PATCH] waf: add support of cross_compile
+
+After upgrade, waf also upgraded 
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
diff --git a/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch
index e112b3b..3f2921e 100644
--- a/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch
@@ -1,21 +1,32 @@
-Some modules such as dynamic library maybe cann't be imported while cross compile, 
-we just check whether does the module exist.
+From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 25 Jun 2019 14:25:08 +0800
+Subject: [PATCH] do not import target module while cross compile
+
+Some modules such as dynamic library maybe cann't be imported
+while cross compile, we just check whether does the module exist.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
-Index: samba-4.4.2/buildtools/wafsamba/samba_bundled.py
-===================================================================
---- samba-4.4.2.orig/buildtools/wafsamba/samba_bundled.py
-+++ samba-4.4.2/buildtools/wafsamba/samba_bundled.py
-@@ -2,6 +2,7 @@
- 
- import sys
- import Build, Options, Logs
-+import imp, os
- from Configure import conf
- from samba_utils import TO_LIST
+update to version 4.10.5, and switch to python3
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
+index 60ce7da..5468a36 100644
+--- a/buildtools/wafsamba/samba_bundled.py
++++ b/buildtools/wafsamba/samba_bundled.py
+@@ -4,6 +4,7 @@ import sys
+ from waflib import Build, Options, Logs
+ from waflib.Configure import conf
+ from wafsamba import samba_utils
++import importlib.util, os
  
-@@ -230,17 +231,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
+ def PRIVATE_NAME(bld, name, private_extension, private_library):
+     '''possibly rename a library to include a bundled extension'''
+@@ -249,17 +250,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
@@ -25,34 +36,32 @@ Index: samba-4.4.2/buildtools/wafsamba/samba_bundled.py
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
diff --git a/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
index 6a7f8fa..46a6f06 100644
--- a/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch
@@ -1,54 +1,40 @@
-From 9a2d6315ff206b2a47100dfd85afe3af56576995 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Thu, 10 Dec 2015 04:20:51 -0500
+From 87bc8e7eafc7d12a1d3a143ebb9e43cf5fbafb72 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 20 Jun 2019 14:11:16 +0800
 Subject: [PATCH] Add config option without-valgrind
 
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
+Update patch to version 4.10.5
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 4 +++-
- source3/wscript     | 5 ++++-
+ lib/replace/wscript | 5 +++--
  wscript             | 4 ++++
- 3 files changed, 11 insertions(+), 2 deletions(-)
+ 2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index f0040b1..aca73af 100644
+index a7fd25d..a19ae68 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -101,7 +101,9 @@ def configure(conf):
+@@ -110,8 +110,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
--    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +    if not Options.options.disable_valgrind:
-+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
-+
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-diff --git a/source3/wscript b/source3/wscript
-index bac3dd5..a5c51ea 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -1070,7 +1070,10 @@ syscall(SYS_setgroups32, 0, NULL);
-             Logs.warn("--with-dnsupdate=yes but gssapi support not sufficient")
-         else:
-             conf.DEFINE('WITH_DNS_UPDATES', 1)
--    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
-+
-+    if not Options.options.disable_valgrind:
-+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
-+
-     if Options.options.developer:
-         if conf.CONFIG_SET('HAVE_VALGRIND_H') or conf.CONFIG_SET('HAVE_VALGRIND_VALGRIND_H'):
-             conf.DEFINE('VALGRIND', '1')
 diff --git a/wscript b/wscript
-index 542a60c..22e6116 100644
+index e38a8e9..38b7230 100644
 --- a/wscript
 +++ b/wscript
-@@ -86,6 +86,10 @@ def set_options(opt):
+@@ -105,6 +105,10 @@ def options(opt):
                    help=("Disable RELRO builds"),
                    action="store_false", dest='enable_relro')
  
@@ -58,7 +44,7 @@ index 542a60c..22e6116 100644
 +
      gr = opt.option_group('developer options')
  
-     opt.tool_options('python') # options for disabling pyc or pyo compilation
+     opt.load('python') # options for disabling pyc or pyo compilation
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
index 894bc8b..d07ec0d 100644
--- a/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
@@ -1,15 +1,28 @@
-Index: samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
-===================================================================
---- samba-4.6.2.orig/ctdb/tests/src/test_mutex_raw.c
-+++ samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
-@@ -166,8 +166,10 @@ int main(int argc, const char **argv)
- 			if (ret == 0) {
- 				pthread_mutex_unlock(mutex);
+From 062cf74b498c1d12fd76f9d9bca926ac806e0b99 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 20 Jun 2019 14:15:18 +0800
+Subject: [PATCH] glibc only fix
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ctdb/tests/src/test_mutex_raw.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ctdb/tests/src/test_mutex_raw.c b/ctdb/tests/src/test_mutex_raw.c
+index 926a525..814343f 100644
+--- a/ctdb/tests/src/test_mutex_raw.c
++++ b/ctdb/tests/src/test_mutex_raw.c
+@@ -291,8 +291,10 @@ int main(int argc, const char **argv)
+ 					"failed\n");
+ 				exit (EXIT_FAILURE);
  			}
 +#ifdef __GLIBC__
  		} else if (ret == EBUSY) {
- 			printf("pid=%u\n", mutex->__data.__owner);
+ 			printf("INFO: pid=%u\n", mutex->__data.__owner);
 +#endif
  		} else if (ret == 0) {
  			pthread_mutex_unlock(mutex);
  		}
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.5.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/samba/samba_4.8.12.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.5.bb
index 762a5bc..71b3e96 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.5.bb
@@ -23,26 +23,29 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://dnsserver-4.7.0.patch \
            file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
+           file://0001-waf-add-support-of-cross_compile.patch \
+           file://0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
            file://cmocka-uintptr_t.patch \
+           file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "25de700c8f1148fd13973a49a51c059e"
-SRC_URI[sha256sum] = "c162d519101e15d1a1d76df063bfefe8d1656f57fb74e1ef19fe05d341a65d8f"
+SRC_URI[md5sum] = "7d20c01ae35b08bc850442a0c303bca5"
+SRC_URI[sha256sum] = "6c10266d5e8c44ce1ea17dc993ace67a83607b4d9a830959c75e3188c6af6375"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam libtasn1 jansson"
 
 RCONFLICTS_${PN} = "libldb"
-RCONFLICTS_${PN}-python = "pyldb"
+RCONFLICTS_${PN}-python3 = "pyldb"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
@@ -64,10 +67,14 @@ SYSTEMD_SERVICE_winbind = "winbind.service"
 # https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller
 SYSTEMD_AUTO_ENABLE_${PN}-ad-dc = "disable"
 
+#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+#to cross Popen
+export WAF_NO_PREFORK="yes"
+
 # Use krb5.  Build active domain controller.
 #
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
-                   acl ad-dc cups gnutls ldap mitkrb5 \
+                   acl cups ad-dc gnutls ldap mitkrb5 \
 "
 
 RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
@@ -84,6 +91,8 @@ PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
 PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
 PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libunwind] = ", , libunwind"
+PACKAGECONFIG[gpgme] = ",--without-gpgme,,"
+PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
 
 # Building the AD (Active Directory) DC (Domain Controller) requires GnuTLS,
 # And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 according to:
@@ -118,7 +127,7 @@ SAMBA4_LIBS="heimdal,cmocka,ldb,pyldb-util,NONE"
 # be removed again.
 PACKAGES =+ "${PN}-bundled-ldb ${PN}-bundled-pyldb-util"
 FILES_${PN}-bundled-ldb = "${libdir}/samba/libldb${SOLIBS}"
-FILES_${PN}-bundled-pyldb-util = "${libdir}/samba/libpyldb-util${SOLIBS}"
+FILES_${PN}-bundled-pyldb-util = "${libdir}/samba/libpyldb-util.*${SOLIBS}"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
@@ -179,8 +188,6 @@ do_install_append() {
     install -d ${D}${sysconfdir}/default
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/default/samba
 
-    # install ctdb config file and test cases
-    install -D -m 0644 ${S}/ctdb/tests/onnode/nodes ${D}${sysconfdir}/ctdb/nodes
     # the items are from ctdb/tests/run_tests.sh
     for d in onnode takeover tool eventscripts cunit simple complex; do
         testdir=${D}${datadir}/ctdb-tests/$d
@@ -196,9 +203,17 @@ do_install_append() {
 
     chmod 0750 ${D}${sysconfdir}/sudoers.d
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
+    
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba-gpupdate
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_upgradedns 
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_spnupdate
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_kcc
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_dnsupdate
+    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+    
 }
 
-PACKAGES =+ "${PN}-python ${PN}-pidl \
+PACKAGES =+ "${PN}-python3 ${PN}-pidl \
              ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
              ${PN}-common ${PN}-base ${PN}-ad-dc ${PN}-ctdb-tests \
@@ -227,8 +242,8 @@ python samba_populate_packages() {
 PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
 PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
 
-RDEPENDS_${PN} += "${PN}-base ${PN}-python ${PN}-dsdb-modules"
-RDEPENDS_${PN}-python += "pytalloc python-tdb"
+RDEPENDS_${PN} += "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3"
+RDEPENDS_${PN}-python3 += "pytalloc python3-tdb"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
@@ -261,6 +276,7 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
                 ${libdir}/*.dat \
                 ${libdir}/auth/*.so \
+                ${datadir}/ctdb/events/* \
 "
 
 FILES_${PN}-dsdb-modules = "${libdir}/samba/ldb"
@@ -286,7 +302,7 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${sysconfdir}/init.d/winbind \
                  ${systemd_system_unitdir}/winbind.service"
 
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-python3 = "${PYTHON_SITEPACKAGES_DIR}"
 
 FILES_smbclient = "${bindir}/cifsdd \
                    ${bindir}/rpcclient \
-- 
2.7.4


