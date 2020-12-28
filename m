Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.40970.1609121795045578228
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,453,1599494400"; 
   d="scan'208";a="102972898"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 10:16:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 40FA748990D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 10:16:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 10:16:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH 2/2] libtevent: upgrade 0.10.1 -> 0.10.2
Date: Mon, 28 Dec 2020 10:16:24 +0800
Message-ID: <1609121784-5585-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 40FA748990D2.A443A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
avoid-attr-unless-wanted.patch
options-0.10.0.patch

0001-waf-add-support-of-cross_compile.patch
Removed since this is included in 0.10.2

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...001-waf-add-support-of-cross_compile.patch | 62 -------------------
 .../libtevent/avoid-attr-unless-wanted.patch  | 24 +++++--
 .../libtevent/libtevent/options-0.10.0.patch  | 25 ++++----
 ...ibtevent_0.10.1.bb => libtevent_0.10.2.bb} |  5 +-
 4 files changed, 32 insertions(+), 84 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtevent/{libtevent_0.10.1.bb => libtevent_0.10.2.bb} (90%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
deleted file mode 100644
index a717f1bbb..000000000
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 15:00:59 +0800
-Subject: [PATCH] waf: add support of cross_compile
-
-After upgrade, waf also upgraded.
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
diff --git a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
index 35890335a..b71192b7d 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
@@ -1,8 +1,17 @@
+From 6c4a634cdf70147f773bb1806692c78bbb95c6f2 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 25 Dec 2020 15:10:58 +0900
+Subject: [PATCH] test
+
+---
+ lib/replace/wscript | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 079761d..07e0104 100644
+index e4642e8..163e94d 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -793,8 +793,6 @@ def build(bld):
+@@ -945,8 +945,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -11,12 +20,15 @@ index 079761d..07e0104 100644
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -808,7 +806,7 @@ def build(bld):
+@@ -960,7 +958,7 @@ def build(bld):
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
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch b/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
index 882af0644..42da2468f 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
@@ -1,6 +1,6 @@
-From b2b19aa9968258b22cf31db0b9dba6bcf96046cf Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 20 Jun 2019 13:55:44 +0800
+From c012aa03613e6e74a0598185b222c7b531df1e2d Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 25 Dec 2020 15:03:17 +0900
 Subject: [PATCH] Add configure options for packages
 
 Add configure options for the following packages:
@@ -22,12 +22,12 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Update patch to version 0.10.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 89 ++++++++++++++++++++++++++++++++++++++++-------------
+ lib/replace/wscript | 87 ++++++++++++++++++++++++++++++++++-----------
  wscript             |  6 ++++
- 2 files changed, 74 insertions(+), 21 deletions(-)
+ 2 files changed, 73 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 1d01e1e..5cf444a 100644
+index a2bc604..e4642e8 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -81,13 +81,12 @@ index 1d01e1e..5cf444a 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
-+
++    
 +    if Options.options.enable_acl:
 +        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
 +
@@ -103,7 +102,7 @@ index 1d01e1e..5cf444a 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+@@ -121,8 +169,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -115,7 +114,7 @@ index 1d01e1e..5cf444a 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -380,20 +429,18 @@ def configure(conf):
+@@ -418,20 +467,18 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -149,7 +148,7 @@ index 1d01e1e..5cf444a 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index ded182a..824a6dd 100644
+index 93af416..a0898b1 100644
 --- a/wscript
 +++ b/wscript
 @@ -25,6 +25,12 @@ def options(opt):
@@ -166,5 +165,5 @@ index ded182a..824a6dd 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
similarity index 90%
rename from meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
index f1b170daf..21f83ad35 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
@@ -9,12 +9,11 @@ RDEPENDS_python3-tevent = "python3"
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://options-0.10.0.patch \
            file://0001-libtevent-fix-musl-libc-compile-error.patch \
-           file://0001-waf-add-support-of-cross_compile.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "1060eb69d6994a847eecb73c4d391ced"
-SRC_URI[sha256sum] = "79a4da68b38b86ac71d8ac824ee3605ab22a6a91cfa83033a7db73f3dd6910b6"
+SRC_URI[md5sum] = "105c7a4dbb96f1751eb27dfd05e7fa84"
+SRC_URI[sha256sum] = "f8427822e5b2878fb8b28d6f50d96848734f3f3130612fb574fdd2d2148a6696"
 
 inherit waf-samba
 
-- 
2.25.1



