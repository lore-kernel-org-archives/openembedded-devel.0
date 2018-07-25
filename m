Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EECA3789B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RkGi010308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:46 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:29 +0800
Message-ID: <1532489252-246963-8-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] libtalloc: upgrade 2.1.11 -> 2.1.14
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:45 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{options-2.1.10.patch => options-2.1.14.patch} | 92 ++++++++++------------
 .../{libtalloc_2.1.11.bb => libtalloc_2.1.14.bb}   |  6 +-
 2 files changed, 43 insertions(+), 55 deletions(-)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.1.10.patch => options-2.1.14.patch} (79%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.11.bb => libtalloc_2.1.14.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch
similarity index 79%
rename from meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
rename to meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch
index 63f21e7..df45d36 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.14.patch
@@ -1,6 +1,6 @@
-From efc1b02144f23fdf84dbc5ff15307815e0f2a425 Mon Sep 17 00:00:00 2001
+From 319a2a1bb46ae35fa9d66878cb08285035f0bd5f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 14 Sep 2016 11:11:35 +0800
+Date: Thu, 19 Jul 2018 15:41:31 +0800
 Subject: [PATCH] talloc: Add configure options for packages
 
 Add configure options for the following packages:
@@ -19,36 +19,22 @@ Modified to apply to version 2.1.10.
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+Modified tp apply to version 2.1.14
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/system/wscript_configure |  6 ++-
- lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
- wscript                              |  7 ++-
- 3 files changed, 79 insertions(+), 19 deletions(-)
+ lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++++++++------------
+ wscript             |  7 +++++
+ 2 files changed, 77 insertions(+), 20 deletions(-)
 
-Index: talloc-2.1.11/lib/replace/system/wscript_configure
-===================================================================
---- talloc-2.1.11.orig/lib/replace/system/wscript_configure
-+++ talloc-2.1.11/lib/replace/system/wscript_configure
-@@ -1,6 +1,10 @@
- #!/usr/bin/env python
- 
--conf.CHECK_HEADERS('sys/capability.h')
-+import Options
-+
-+if Options.options.enable_libcap:
-+    conf.CHECK_HEADERS('sys/capability.h')
-+
- conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
- 
- # solaris varients of getXXent_r
-Index: talloc-2.1.11/lib/replace/wscript
-===================================================================
---- talloc-2.1.11.orig/lib/replace/wscript
-+++ talloc-2.1.11/lib/replace/wscript
-@@ -23,6 +23,41 @@ def set_options(opt):
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index fd00a42..a77c058 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -22,6 +22,41 @@ def set_options(opt):
+     opt.BUILTIN_DEFAULT('NONE')
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
- 
++   
 +    opt.add_option('--with-acl',
 +                   help=("Enable use of acl"),
 +                   action="store_true", dest='enable_acl')
@@ -83,10 +69,9 @@ Index: talloc-2.1.11/lib/replace/wscript
 +    opt.add_option('--without-libcap',
 +                   help=("Disable use of libcap"),
 +                   action="store_false", dest='enable_libcap', default=False)
-+
+ 
  @Utils.run_once
  def configure(conf):
-     conf.RECURSE('buildtools/wafsamba')
 @@ -32,12 +67,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
@@ -94,7 +79,7 @@ Index: talloc-2.1.11/lib/replace/wscript
 -    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
 -    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
-+    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
++    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
 -    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
@@ -118,9 +103,9 @@ Index: talloc-2.1.11/lib/replace/wscript
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -73,7 +121,9 @@ def configure(conf):
- 
-     conf.CHECK_CODE('', headers='rpc/rpc.h rpcsvc/yp_prot.h', define='HAVE_RPCSVC_YP_PROT_H')
+@@ -108,7 +156,9 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
+     conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
 +    if Options.options.enable_valgrind:
@@ -129,19 +114,14 @@ Index: talloc-2.1.11/lib/replace/wscript
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -267,21 +317,21 @@ def configure(conf):
-     conf.CHECK_FUNCS('prctl dirname basename')
+@@ -342,20 +392,20 @@ def configure(conf):
  
      strlcpy_in_bsd = False
--
+ 
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
-+    if Options.options.enable_libbsd:
-+        # libbsd on some platforms provides strlcpy and strlcat
-+        if not conf.CHECK_FUNCS('strlcpy strlcat'):
-+            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
-                                checklibc=True):
+-                               checklibc=True):
 -            strlcpy_in_bsd = True
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
@@ -149,6 +129,14 @@ Index: talloc-2.1.11/lib/replace/wscript
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS('setproctitle_init'):
 -        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
+-
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++    if Options.options.enable_libbsd:
++        # libbsd on some platforms provides strlcpy and strlcat
++        if not conf.CHECK_FUNCS('strlcpy strlcat'):
++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++                checklibc=True):
 +                strlcpy_in_bsd = True
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
@@ -156,29 +144,29 @@ Index: talloc-2.1.11/lib/replace/wscript
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('setproctitle_init'):
 +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
- 
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-Index: talloc-2.1.11/wscript
-===================================================================
---- talloc-2.1.11.orig/wscript
-+++ talloc-2.1.11/wscript
-@@ -32,7 +32,12 @@ def set_options(opt):
+diff --git a/wscript b/wscript
+index 18f726e..fed8ab9 100644
+--- a/wscript
++++ b/wscript
+@@ -32,6 +32,13 @@ def set_options(opt):
          opt.add_option('--enable-talloc-compat1',
                         help=("Build talloc 1.x.x compat library [False]"),
                         action="store_true", dest='TALLOC_COMPAT1', default=False)
--
 +        opt.add_option('--with-valgrind',
 +                       help=("enable use of valgrind"),
 +                       action="store_true", dest='enable_valgrind')
 +        opt.add_option('--without-valgrind',
 +                       help=("disable use of valgrind"),
 +                       action="store_false", dest='enable_valgrind', default=False)
++
+ 
  
  def configure(conf):
-     conf.RECURSE('lib/replace')
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
index 848cf4d..89aea20 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 
 
 SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
-           file://options-2.1.10.patch \
+           file://options-2.1.14.patch \
 "
-SRC_URI[md5sum] = "452596f904ca2b10322bdaabf147a721"
-SRC_URI[sha256sum] = "639eb35556a0af999123c4d883e79be05ff9f00ab4f9e4ac2e5775f9c5eeeed3"
+SRC_URI[md5sum] = "7478da02e309316231a497a9f17a980d"
+SRC_URI[sha256sum] = "b185602756a628bac507fa8af8b9df92ace69d27c0add5dab93190ad7c3367ce"
 
 inherit waf-samba
 
-- 
2.7.4


