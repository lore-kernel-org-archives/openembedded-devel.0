Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF70A7E9A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:48:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S1mgXr014792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:48:42 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:48:41 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:07 +0800
Message-ID: <1561686490-12445-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/6] libtevent: upgrade 0.9.37 -> 0.10.0
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
X-List-Received-Date: Fri, 28 Jun 2019 01:48:40 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. switch to python3
2. fix cross-compile problem caused by waf
3. refresh patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 .../{options-0.9.36.patch => options-0.10.0.patch} | 62 ++++++++++------------
 .../{libtevent_0.9.37.bb => libtevent_0.10.0.bb}   | 26 ++++++---
 3 files changed, 109 insertions(+), 41 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.9.36.patch => options-0.10.0.patch} (82%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.37.bb => libtevent_0.10.0.bb} (60%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
new file mode 100644
index 0000000..a717f1b
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
@@ -0,0 +1,62 @@
+From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 25 Jan 2019 15:00:59 +0800
+Subject: [PATCH] waf: add support of cross_compile
+
+After upgrade, waf also upgraded.
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
diff --git a/meta-networking/recipes-support/libtevent/libtevent/options-0.9.36.patch b/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
similarity index 82%
rename from meta-networking/recipes-support/libtevent/libtevent/options-0.9.36.patch
rename to meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
index 363c586..882af06 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/options-0.9.36.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
@@ -1,7 +1,7 @@
-From c3e2e4f89cf37b27609fd02ad67eb02d0015cc1e Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 21 Sep 2016 09:57:49 +0800
-Subject: [PATCH 1/1] tevent: Add configure options for packages
+From b2b19aa9968258b22cf31db0b9dba6bcf96046cf Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 20 Jun 2019 13:55:44 +0800
+Subject: [PATCH] Add configure options for packages
 
 Add configure options for the following packages:
  - acl
@@ -18,16 +18,19 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Modified to apply to version 0.9.33.
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Update patch to version 0.10.0
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  lib/replace/wscript | 89 ++++++++++++++++++++++++++++++++++++++++-------------
- wscript             |  7 ++++-
- 2 files changed, 73 insertions(+), 23 deletions(-)
+ wscript             |  6 ++++
+ 2 files changed, 74 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 2c638b7..079761d 100644
+index 1d01e1e..5cf444a 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -23,6 +23,41 @@ def set_options(opt):
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -69,7 +72,7 @@ index 2c638b7..079761d 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -32,12 +67,25 @@ def configure(conf):
+@@ -34,12 +69,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -98,24 +101,24 @@ index 2c638b7..079761d 100644
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -101,7 +149,8 @@ def configure(conf):
+@@ -110,8 +158,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
--    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +    if Options.options.enable_valgrind:
-+        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -294,22 +343,18 @@ def configure(conf):
+@@ -380,20 +429,18 @@ def configure(conf):
  
-     conf.CHECK_FUNCS('prctl dirname basename')
+     strlcpy_in_bsd = False
  
--    strlcpy_in_bsd = False
--
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -127,6 +130,9 @@ index 2c638b7..079761d 100644
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS('setproctitle_init'):
 -        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
+-
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
@@ -136,32 +142,20 @@ index 2c638b7..079761d 100644
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
- 
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-@@ -660,7 +705,7 @@ removeea setea
-     # look for a method of finding the list of network interfaces
-     for method in ['HAVE_IFACE_GETIFADDRS', 'HAVE_IFACE_AIX', 'HAVE_IFACE_IFCONF', 'HAVE_IFACE_IFREQ']:
-         bsd_for_strlcpy = ''
--        if strlcpy_in_bsd:
-+        if Options.options.enable_libbsd:
-             bsd_for_strlcpy = ' bsd'
-         if conf.CHECK_CODE('''
-                            #define %s 1
 diff --git a/wscript b/wscript
-index 94d190f..742f779 100644
+index ded182a..824a6dd 100644
 --- a/wscript
 +++ b/wscript
-@@ -22,7 +22,12 @@ def set_options(opt):
-     opt.PRIVATE_EXTENSION_DEFAULT('tevent', noextension='tevent')
+@@ -25,6 +25,12 @@ def options(opt):
      opt.RECURSE('lib/replace')
      opt.RECURSE('lib/talloc')
--
+ 
 +    opt.add_option('--with-valgrind',
 +                   help=("enable use of valgrind"),
 +                   action="store_true", dest='enable_valgrind')
@@ -172,5 +166,5 @@ index 94d190f..742f779 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.16.2
+2.7.4
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
similarity index 60%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
index 4df251c..25ad7c1 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
@@ -4,16 +4,17 @@ SECTION = "libs"
 LICENSE = "LGPLv3+"
 
 DEPENDS += "libtalloc libtirpc"
-RDEPENDS_python-tevent = "python"
+RDEPENDS_python3-tevent = "python3"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
-           file://options-0.9.36.patch \
+           file://options-0.10.0.patch \
            file://0001-libtevent-fix-musl-libc-compile-error.patch \
+           file://0001-waf-add-support-of-cross_compile.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "6859cd4081fdb2a76b1cb4bf1c803a59"
-SRC_URI[sha256sum] = "168345ed65eac03785cf77b95238e7dc66cbb473a42811693a6b0916e5dae7e0"
+SRC_URI[md5sum] = "97ea9861252e52c24adf6c45ab676a60"
+SRC_URI[sha256sum] = "33f39612cd6d1ae6a737245784581494846f5bb07827983d2f41f942446aa4e6"
 
 inherit waf-samba
 
@@ -32,15 +33,26 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr
 
 S = "${WORKDIR}/tevent-${PV}"
 
+#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+#to cross Popen
+export WAF_NO_PREFORK="yes"
+
 EXTRA_OECONF += "--disable-rpath \
                  --bundled-libraries=NONE \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                  --without-gettext \
                 "
+do_install_append() {
+     # add this link for cross check python module existence. eg: on x86-64 host, check python module
+     # under recipe-sysroot which is mips64. 
+     cd ${D}${PYTHON_SITEPACKAGES_DIR}; ln -s _tevent.*.so _tevent.so
+}
+
+PACKAGES += "python3-tevent"
 
-PACKAGES += "python-tevent"
+RPROVIDES_${PN}-dbg += "python3-tevent-dbg"
 
-RPROVIDES_${PN}-dbg += "python-tevent-dbg"
+FILES_python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 
-FILES_python-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+INSANE_SKIP_python3-tevent = "dev-so"
-- 
2.7.4


