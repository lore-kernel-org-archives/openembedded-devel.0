Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.40970.1609121795045578228
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,453,1599494400"; 
   d="scan'208";a="102972892"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 10:16:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B718D48990D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 10:16:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 10:16:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH 1/2] libtalloc: upgrade 2.3.0 -> 2.3.1
Date: Mon, 28 Dec 2020 10:16:13 +0800
Message-ID: <1609121773-5530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B718D48990D2.A41D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-waf-add-support-of-cross_compile.patch
Removed since this is included in 2.3.1.

Refresh the following patch:
avoid-attr-unless-wanted.patch
options-2.2.0.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...001-waf-add-support-of-cross_compile.patch | 62 -------------------
 .../libtalloc/avoid-attr-unless-wanted.patch  | 15 ++---
 .../libtalloc/libtalloc/options-2.2.0.patch   | 25 ++++----
 ...{libtalloc_2.3.0.bb => libtalloc_2.3.1.bb} |  5 +-
 4 files changed, 22 insertions(+), 85 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.0.bb => libtalloc_2.3.1.bb} (90%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
deleted file mode 100644
index e58339afb..000000000
--- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 15:00:59 +0800
-Subject: [PATCH] waf: add support of cross_compile
-
-After upgrade, waf also upgraded
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
-but on new version, exec_args is not used and cause do_configure
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
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
index db3ddce2c..5b7f69ec0 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
@@ -1,6 +1,6 @@
---- a/lib/replace/wscript	2015-11-13 16:04:04.000000000 +0100
-+++ b/lib/replace/wscript	2015-11-13 16:23:20.000000000 +0100
-@@ -837,8 +837,6 @@ def build(bld):
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -947,8 +947,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -9,12 +9,13 @@
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -852,7 +850,7 @@ def build(bld):
+@@ -962,7 +960,7 @@ def build(bld):
                        # at the moment:
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
--                      deps='crypt dl nsl socket rt attr' + extra_libs)
-+                      deps='crypt dl nsl socket rt ' + extra_libs)
+-                      deps='dl attr' + extra_libs)
++                      deps='dl' + extra_libs)
  
-     replace_test_cflags="-Wno-format-zero-length"
+     replace_test_cflags = ''
      if bld.CONFIG_SET('HAVE_WNO_FORMAT_TRUNCATION'):
+
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
index 3847b013e..46fef1096 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
@@ -1,6 +1,6 @@
-From c6d76c8ade57b996a8123b1c1a3a28ba4666e9c6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 20 Jun 2019 10:57:06 +0800
+From 8a82056ba2f70137714f225d82993aa4b11042da Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 25 Dec 2020 14:14:08 +0900
 Subject: [PATCH] talloc: Add configure options for packages
 
 Add configure options for the following packages:
@@ -22,12 +22,12 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Modified tp apply to version 2.2.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 91 ++++++++++++++++++++++++++++++++++++++++-------------
- wscript             |  7 ++++-
- 2 files changed, 76 insertions(+), 22 deletions(-)
+ lib/replace/wscript | 89 +++++++++++++++++++++++++++++++++++----------
+ wscript             |  7 +++-
+ 2 files changed, 75 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 1d01e1e..7bc7666 100644
+index a2bc604..2e2e7bf 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -81,10 +81,9 @@ index 1d01e1e..7bc7666 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -103,7 +102,7 @@ index 1d01e1e..7bc7666 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+@@ -121,8 +169,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -115,7 +114,7 @@ index 1d01e1e..7bc7666 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -380,20 +429,20 @@ def configure(conf):
+@@ -418,20 +467,20 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -151,7 +150,7 @@ index 1d01e1e..7bc7666 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index e402069..9976f4c 100644
+index b955d21..4ac6e1e 100644
 --- a/wscript
 +++ b/wscript
 @@ -31,7 +31,12 @@ def options(opt):
@@ -169,5 +168,5 @@ index e402069..9976f4c 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb
similarity index 90%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb
index 59deb15b6..07d54b71f 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
-           file://0001-waf-add-support-of-cross_compile.patch \
 "
-SRC_URI[md5sum] = "8416b153547add81cd1a4d24e598c890"
-SRC_URI[sha256sum] = "75d5bcb34482545a82ffb06da8f6c797f963a0da450d0830c669267b14992fc6"
+SRC_URI[md5sum] = "ce40593428c0de6b85946189dcc37b5e"
+SRC_URI[sha256sum] = "ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77"
 
 inherit waf-samba
 
-- 
2.25.1



