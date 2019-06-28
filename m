Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2947EA38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:49:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S1ms0r007294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:49:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:48:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:09 +0800
Message-ID: <1561686490-12445-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/6] libtalloc: upgrade 2.1.14 -> 2.2.0
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
X-List-Received-Date: Fri, 28 Jun 2019 01:49:13 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. switch to python3
2. fix cross-compile prolem caused by waf
3. refresh patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 .../{options-2.1.14.patch => options-2.2.0.patch}  | 47 ++++++++--------
 .../{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb}    | 13 +++--
 3 files changed, 95 insertions(+), 27 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.1.14.patch => options-2.2.0.patch} (87%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb} (80%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
new file mode 100644
index 0000000..e58339a
--- /dev/null
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
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
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
similarity index 87%
rename from meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch
rename to meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
index df45d36..3847b01 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
@@ -1,6 +1,6 @@
-From 319a2a1bb46ae35fa9d66878cb08285035f0bd5f Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 19 Jul 2018 15:41:31 +0800
+From c6d76c8ade57b996a8123b1c1a3a28ba4666e9c6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 20 Jun 2019 10:57:06 +0800
 Subject: [PATCH] talloc: Add configure options for packages
 
 Add configure options for the following packages:
@@ -19,22 +19,21 @@ Modified to apply to version 2.1.10.
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
-Modified tp apply to version 2.1.14
+Modified tp apply to version 2.2.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++++++++------------
- wscript             |  7 +++++
- 2 files changed, 77 insertions(+), 20 deletions(-)
+ lib/replace/wscript | 91 ++++++++++++++++++++++++++++++++++++++++-------------
+ wscript             |  7 ++++-
+ 2 files changed, 76 insertions(+), 22 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index fd00a42..a77c058 100644
+index 1d01e1e..7bc7666 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -22,6 +22,41 @@ def set_options(opt):
-     opt.BUILTIN_DEFAULT('NONE')
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
-+   
+ 
 +    opt.add_option('--with-acl',
 +                   help=("Enable use of acl"),
 +                   action="store_true", dest='enable_acl')
@@ -69,10 +68,11 @@ index fd00a42..a77c058 100644
 +    opt.add_option('--without-libcap',
 +                   help=("Disable use of libcap"),
 +                   action="store_false", dest='enable_libcap', default=False)
- 
++
  @Utils.run_once
  def configure(conf):
-@@ -32,12 +67,25 @@ def configure(conf):
+     conf.RECURSE('buildtools/wafsamba')
+@@ -34,12 +69,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -101,20 +101,21 @@ index fd00a42..a77c058 100644
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
-@@ -342,20 +392,20 @@ def configure(conf):
+@@ -380,20 +429,20 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,23 +151,23 @@ index fd00a42..a77c058 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 18f726e..fed8ab9 100644
+index e402069..9976f4c 100644
 --- a/wscript
 +++ b/wscript
-@@ -32,6 +32,13 @@ def set_options(opt):
+@@ -31,7 +31,12 @@ def options(opt):
          opt.add_option('--enable-talloc-compat1',
                         help=("Build talloc 1.x.x compat library [False]"),
                         action="store_true", dest='TALLOC_COMPAT1', default=False)
+-
 +        opt.add_option('--with-valgrind',
 +                       help=("enable use of valgrind"),
 +                       action="store_true", dest='enable_valgrind')
 +        opt.add_option('--without-valgrind',
 +                       help=("disable use of valgrind"),
 +                       action="store_false", dest='enable_valgrind', default=False)
-+
- 
  
  def configure(conf):
+     conf.RECURSE('lib/replace')
 -- 
 2.7.4
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb
similarity index 80%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb
index 9a463a6..88cdd30 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 
 
 SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
-           file://options-2.1.14.patch \
+           file://options-2.2.0.patch \
+           file://0001-waf-add-support-of-cross_compile.patch \
 "
-SRC_URI[md5sum] = "7478da02e309316231a497a9f17a980d"
-SRC_URI[sha256sum] = "b185602756a628bac507fa8af8b9df92ace69d27c0add5dab93190ad7c3367ce"
+SRC_URI[md5sum] = "b60781acc2fb42d7a1e08751e508d3df"
+SRC_URI[sha256sum] = "5c6f6a45ef96b3fd0b28942673a68d0c6af5dcca9d676a2e4d57ce7e86c22ebc"
 
 inherit waf-samba
 
@@ -29,6 +30,10 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr
 
 S = "${WORKDIR}/talloc-${PV}"
 
+#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+#to cross Popen
+export WAF_NO_PREFORK="yes"
+
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
                  --bundled-libraries=NONE \
@@ -46,4 +51,4 @@ FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
                   ${libdir}/libpytalloc-util.so.2.1.1 \
                  "
 FILES_pytalloc-dev = "${libdir}/libpytalloc-util.so"
-RDEPENDS_pytalloc = "python"
+RDEPENDS_pytalloc = "python3"
-- 
2.7.4


