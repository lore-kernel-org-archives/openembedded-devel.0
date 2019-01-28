Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5C2C7C361
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 02:27:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0S2RK8D019681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2019 18:27:20 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Sun, 27 Jan 2019 18:27:07 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jan 2019 10:27:06 +0800
Message-ID: <1548642426-371647-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libtdb: upgrade from 1.3.16 -> 1.3.17
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
X-List-Received-Date: Mon, 28 Jan 2019 02:27:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix 3 problems after upgrade to 1.3.17

1. Disable prefork of process
2. Fix problem of waf cannot be found
3. Fix problem of cross-compile not support well

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...akefile-fix-problem-that-waf-cannot-found.patch | 35 ++++++++++++
 .../0001-waf-add-support-of-cross_compile.patch    | 63 ++++++++++++++++++++++
 .../tdb-Add-configure-options-for-packages.patch   | 43 +++++++++------
 .../libtdb/{libtdb_1.3.16.bb => libtdb_1.3.17.bb}  | 11 +++-
 4 files changed, 133 insertions(+), 19 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.16.bb => libtdb_1.3.17.bb} (78%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
new file mode 100644
index 0000000..10f2ef8
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
@@ -0,0 +1,35 @@
+From 7205761d654636a6c1fad03a3ca40d38e253e192 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 25 Jan 2019 16:01:07 +0800
+Subject: [PATCH] Makefile: fix problem that waf cannot found
+
+tdb is subfolder of samba, but it can also build independently.
+so both path need to be added into PATH
+
+Upsteam-Status: Inappropriate [oe specific]
+
+Fix reject by upstream since upsteam need to support both python2/3,
+so drop add append PATH. refer link:
+https://gitlab.com/samba-team/samba/merge_requests/209
+https://gitlab.com/samba-team/samba/merge_requests/211
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3e70146..64bb393 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ # simple makefile wrapper to run waf
+ 
+-WAF_BINARY=$(PYTHON) ../../buildtools/bin/waf
++WAF_BINARY=PATH=buildtools/bin:../../buildtools/bin:$$PATH waf
+ WAF=PYTHONHASHSEED=1 WAF_MAKE=1 $(WAF_BINARY)
+ 
+ all:
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
new file mode 100644
index 0000000..e20c9a2
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-waf-add-support-of-cross_compile.patch
@@ -0,0 +1,63 @@
+From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 25 Jan 2019 15:00:59 +0800
+Subject: [PATCH] waf: add support of cross_compile
+
+After upgrade libtdb from 1.3.16 to 1.3.17, waf build system
+which used by libtdb upgrade from 1.5.19 to 2.0.8
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
+but on 2.0.8, exec_args is not used and cause do_configure
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
diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
index 365b92d..e6e1023 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -1,6 +1,6 @@
-From 6de1affddde4003a956523c330ecf24e22e094ac Mon Sep 17 00:00:00 2001
+From 13bbc851d9fd7396f087758e614abba60eeb2aad Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 19 Jul 2018 16:20:32 +0800
+Date: Wed, 23 Jan 2019 10:14:05 +0800
 Subject: [PATCH] tdb: Add configure options for packages
 
 Add configure options for the following packages:
@@ -21,16 +21,19 @@ Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 
 Update for libtdb_1.3.16
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Update for libtdb_1.3.17
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 89 +++++++++++++++++++++++++++++++++++++++++------------
+ lib/replace/wscript | 95 ++++++++++++++++++++++++++++++++++++++++-------------
  wscript             |  6 ++++
- 2 files changed, 75 insertions(+), 20 deletions(-)
+ 2 files changed, 79 insertions(+), 22 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index fd00a42..2df83cd 100644
+index 6cbae93..7aeaf46 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -23,6 +23,41 @@ def set_options(opt):
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -72,7 +75,7 @@ index fd00a42..2df83cd 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -32,12 +67,25 @@ def configure(conf):
+@@ -34,12 +69,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -103,21 +106,24 @@ index fd00a42..2df83cd 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -108,7 +156,9 @@ def configure(conf):
+@@ -110,8 +158,10 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
--    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +    if Options.options.enable_valgrind:
-+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -342,20 +392,19 @@ def configure(conf):
+@@ -379,21 +429,22 @@ def configure(conf):
+     conf.CHECK_FUNCS('prctl dirname basename')
  
      strlcpy_in_bsd = False
- 
+-
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -132,27 +138,30 @@ index fd00a42..2df83cd 100644
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++    
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
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
++        if not conf.CHECK_FUNCS('setproctitle_init'):
++            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
 +
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
-+    
  
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 6505648..6608481 100644
+index bc5ee26..9ac10b6 100644
 --- a/wscript
 +++ b/wscript
-@@ -63,6 +63,12 @@ def set_options(opt):
+@@ -69,6 +69,12 @@ def options(opt):
                     action="store_true", dest='disable_tdb_mutex_locking',
                     default=False)
  
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb
similarity index 78%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb
index 0579ed6..4c7755c 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb
@@ -9,15 +9,18 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch \
            file://tdb-Add-configure-options-for-packages.patch \
+           file://0001-waf-add-support-of-cross_compile.patch \
+           file://0001-Makefile-fix-problem-that-waf-cannot-found.patch \
 "
 
-SRC_URI[md5sum] = "7d06d8709188e07df853d9e91db88927"
-SRC_URI[sha256sum] = "6a3fc2616567f23993984ada3cea97d953a27669ffd1bfbbe961f26e0cf96cc5"
+SRC_URI[md5sum] = "519d373ac72a66b0a2739dbb495de127"
+SRC_URI[sha256sum] = "1cb4399394c60a773430ca54848359adcf54fb6f136afdcfcbbe62b5f4245614"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
+
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
@@ -29,6 +32,10 @@ S = "${WORKDIR}/tdb-${PV}"
 
 inherit waf-samba
 
+#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+#to cross Popen
+export WAF_NO_PREFORK="yes"
+
 EXTRA_OECONF += "--disable-rpath \
                  --bundled-libraries=NONE \
                  --builtin-libraries=replace \
-- 
2.7.4


