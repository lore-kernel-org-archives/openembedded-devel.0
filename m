Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B69D878994
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RjlX000549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:28 +0800
Message-ID: <1532489252-246963-7-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] libldb: upgrade 1.3.1 -> 1.4.1
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libldb/0001-libldb-fix-config-error.patch      | 87 ++++++++++++++++++++++
 .../libldb/avoid-openldap-unless-wanted.patch      | 16 +++-
 ...-import-target-module-while-cross-compile.patch | 19 +++--
 .../libldb-fix-musl-libc-conflict-type-error.patch | 45 +++++++++++
 .../libldb-fix-musl-libc-unkown-type-error.patch   | 31 ++++++++
 .../{options-1.3.1.patch => options-1.4.1.patch}   | 65 +++++++---------
 .../libldb/{libldb_1.3.1.bb => libldb_1.4.1.bb}    | 10 ++-
 7 files changed, 225 insertions(+), 48 deletions(-)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
 mode change 100755 => 100644 meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
 create mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch
 create mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.3.1.patch => options-1.4.1.patch} (82%)
 rename meta-networking/recipes-support/libldb/{libldb_1.3.1.bb => libldb_1.4.1.bb} (85%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch b/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
new file mode 100644
index 0000000..5818d57
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
@@ -0,0 +1,87 @@
+From bc4ff7e37ce120c257e52a81fe3475499dfd2573 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 10:10:24 +0800
+Subject: [PATCH] libldb: fix config error
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ wscript | 58 +++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/wscript b/wscript
+index b0af7b6..8ad9f96 100644
+--- a/wscript
++++ b/wscript
+@@ -115,40 +115,40 @@ def configure(conf):
+                                              onlyif='talloc tdb tevent pyldb-util',
+                                              implied_deps='replace talloc tdb tevent'):
+                 conf.define('USING_SYSTEM_LDB', 1)
++    if not Options.options.without_ldb_lmdb:
++        if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
++                               "HAVE_64_BIT_SIZE_T_FOR_LMDB",
++                               execute=True,
++                               msg='Checking for a 64-bit host to '
++                               'support lmdb'):
++            Logs.warn("--without-ldb-lmdb implied as this "
++                      "host is not 64-bit")
++
++            if not conf.env.standalone_ldb and \
++               not Options.options.without_ad_dc and \
++               conf.CONFIG_GET('ENABLE_SELFTEST'):
++                Logs.warn("NOTE: Some AD DC parts of selftest will fail")
+ 
+-    if not conf.CHECK_CODE('return !(sizeof(size_t) >= 8)',
+-                           "HAVE_64_BIT_SIZE_T_FOR_LMDB",
+-                           execute=True,
+-                           msg='Checking for a 64-bit host to '
+-                           'support lmdb'):
+-        Logs.warn("--without-ldb-lmdb implied as this "
+-                  "host is not 64-bit")
+-
+-        if not conf.env.standalone_ldb and \
+-           not Options.options.without_ad_dc and \
+-           conf.CONFIG_GET('ENABLE_SELFTEST'):
+-            Logs.warn("NOTE: Some AD DC parts of selftest will fail")
+-
+-        conf.env.REQUIRE_LMDB = False
+-    else:
+-        if conf.env.standalone_ldb:
+-            if Options.options.without_ldb_lmdb:
+-                conf.env.REQUIRE_LMDB = False
+-            else:
+-                conf.env.REQUIRE_LMDB = True
+-        elif Options.options.without_ad_dc:
+             conf.env.REQUIRE_LMDB = False
+         else:
+-            if Options.options.without_ldb_lmdb:
+-                if not Options.options.without_ad_dc and \
+-                   conf.CONFIG_GET('ENABLE_SELFTEST'):
+-                    raise Utils.WafError('--without-ldb-lmdb conflicts '
+-                                         'with --enable-selftest while '
+-                                         'building the AD DC')
+-
++            if conf.env.standalone_ldb:
++                if Options.options.without_ldb_lmdb:
++                    conf.env.REQUIRE_LMDB = False
++                else:
++                    conf.env.REQUIRE_LMDB = True
++            elif Options.options.without_ad_dc:
+                 conf.env.REQUIRE_LMDB = False
+             else:
+-                conf.env.REQUIRE_LMDB = True
++                if Options.options.without_ldb_lmdb:
++                    if not Options.options.without_ad_dc and \
++                       conf.CONFIG_GET('ENABLE_SELFTEST'):
++                        raise Utils.WafError('--without-ldb-lmdb conflicts '
++                                             'with --enable-selftest while '
++                                             'building the AD DC')
++
++                    conf.env.REQUIRE_LMDB = False
++                else:
++                    conf.env.REQUIRE_LMDB = True
+ 
+ 
+     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
index 8ab094f..b30afee 100644
--- a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
+++ b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
@@ -1,6 +1,16 @@
---- a/wscript	2015-11-18 12:43:33.000000000 +0100
-+++ b/wscript	2015-11-18 12:46:25.000000000 +0100
-@@ -58,9 +58,7 @@
+From 63570b98ef63c91d8508478fcbe6b89c90c8398f Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <rehsack@gmail.com>
+Date: Thu, 19 Nov 2015 20:45:56 +0100
+
+---
+ wscript | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/wscript b/wscript
+index e7c05d2..1633593 100644
+--- a/wscript
++++ b/wscript
+@@ -161,9 +161,7 @@ def configure(conf):
      if conf.env.standalone_ldb:
          conf.CHECK_XSLTPROC_MANPAGES()
  
diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
old mode 100755
new mode 100644
index fdd312c..ee4936a
--- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
@@ -1,12 +1,21 @@
+From f4cda3a71311e4496b725bc5f46af93413ec7a1c Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Fri, 17 Jul 2015 11:58:49 +0800
+Subject: [PATCH] libldb: add new recipe
+
 Some modules such as dynamic library maybe cann't be imported while cross compile,
 we just check whether does the module exist.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
-Index: ldb-1.1.26/buildtools/wafsamba/samba_bundled.py
-===================================================================
---- ldb-1.1.26.orig/buildtools/wafsamba/samba_bundled.py
-+++ ldb-1.1.26/buildtools/wafsamba/samba_bundled.py
+---
+ buildtools/wafsamba/samba_bundled.py | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
+index 253d604..398cc6a 100644
+--- a/buildtools/wafsamba/samba_bundled.py
++++ b/buildtools/wafsamba/samba_bundled.py
 @@ -2,6 +2,7 @@
  
  import sys
@@ -15,7 +24,7 @@ Index: ldb-1.1.26/buildtools/wafsamba/samba_bundled.py
  from Configure import conf
  from samba_utils import TO_LIST
  
-@@ -230,17 +231,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
+@@ -249,17 +250,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
diff --git a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch
new file mode 100644
index 0000000..444fa3f
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-conflict-type-error.patch
@@ -0,0 +1,45 @@
+From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Jul 2018 09:55:25 +0800
+Subject: [PATCH] libldb: fix musl libc conflicting types error
+
+/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
+            typedef unsigned int uintptr_t;
+                                 ^~~~~~~~~
+use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ third_party/cmocka/cmocka.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
+index 4fd82a9..5443a08 100644
+--- a/third_party/cmocka/cmocka.h
++++ b/third_party/cmocka/cmocka.h
+@@ -110,7 +110,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
++#if !defined(__DEFINED_uintptr_t) 
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -134,9 +134,8 @@ typedef uintmax_t LargestIntegralType;
+ #  endif /* __WORDSIZE */
+ # endif /* _WIN32 */
+ 
+-# define _UINTPTR_T
+-# define _UINTPTR_T_DEFINED
+-#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
++# define __DEFINED_uintptr_t
++#endif /* !defined(__DEFINED_uintptr_t) 
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+ #define cast_to_pointer_integral_type(value) \
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
new file mode 100644
index 0000000..c0e7e89
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
@@ -0,0 +1,31 @@
+From d90534469c5c43bf2a97e5698a5ddb4b7471f92a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 10:53:16 +0800
+Subject: [PATCH] libldb: fix musl libc unkoown type error
+
+tevent.h:1440:8: error: unknown type name 'pid_t'; did you mean 'div_t'?
+        pid_t *pid,
+         ^~~~~
+         div_t
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/tevent/tevent.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/tevent/tevent.h b/lib/tevent/tevent.h
+index aa6fe0d..2572696 100644
+--- a/lib/tevent/tevent.h
++++ b/lib/tevent/tevent.h
+@@ -32,6 +32,8 @@
+ #include <talloc.h>
+ #include <sys/time.h>
+ #include <stdbool.h>
++#include <sys/stat.h>
++#include <sys/types.h>
+ 
+ struct tevent_context;
+ struct tevent_ops;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libldb/libldb/options-1.3.1.patch b/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
similarity index 82%
rename from meta-networking/recipes-support/libldb/libldb/options-1.3.1.patch
rename to meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
index ffe253b..357afbe 100644
--- a/meta-networking/recipes-support/libldb/libldb/options-1.3.1.patch
+++ b/meta-networking/recipes-support/libldb/libldb/options-1.4.1.patch
@@ -1,7 +1,7 @@
-From a4da3ab4d76013aaa731d43d52ccca1ebd37c395 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 21 Sep 2016 10:06:39 +0800
-Subject: [PATCH 1/1] ldb: Add configure options for packages
+From ffffd29bc6303d60b3d77048fbbf6776f6fbbe01 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 19 Jul 2018 16:40:31 +0800
+Subject: [PATCH] ldb: Add configure options for packages
 
 Add configure options for the following packages:
  - acl
@@ -14,30 +14,22 @@ Add configure options for the following packages:
 Upstream-Status: Inappropriate [oe deterministic build specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Update to version 1.4.1, and fix one configure error
+
+Cross answers file cross-answers-i586.txt is incomplete with 
+"Checking for a 64-bit host to support lmdb: UNKNOWN"
+
+we don't support lmdb, so only check when lmdb is support
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/system/wscript_configure |  6 ++-
- lib/replace/wscript                  | 94 +++++++++++++++++++++++++++---------
- wscript                              |  7 +++
- 3 files changed, 83 insertions(+), 24 deletions(-)
+ lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
+ wscript             |  6 ++++
+ 2 files changed, 77 insertions(+), 23 deletions(-)
 
-diff --git a/lib/replace/system/wscript_configure b/lib/replace/system/wscript_configure
-index 2035474..10f9ae7 100644
---- a/lib/replace/system/wscript_configure
-+++ b/lib/replace/system/wscript_configure
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
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 2f94d49..68b2d3a 100644
+index fd00a42..434192e 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set_options(opt):
@@ -113,9 +105,9 @@ index 2f94d49..68b2d3a 100644
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
@@ -124,7 +116,7 @@ index 2f94d49..68b2d3a 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -266,22 +316,20 @@ def configure(conf):
+@@ -340,22 +390,20 @@ def configure(conf):
  
      conf.CHECK_FUNCS('prctl dirname basename')
  
@@ -161,7 +153,7 @@ index 2f94d49..68b2d3a 100644
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-@@ -632,7 +680,7 @@ removeea setea
+@@ -699,7 +747,7 @@ def configure(conf):
      # look for a method of finding the list of network interfaces
      for method in ['HAVE_IFACE_GETIFADDRS', 'HAVE_IFACE_AIX', 'HAVE_IFACE_IFCONF', 'HAVE_IFACE_IFREQ']:
          bsd_for_strlcpy = ''
@@ -171,12 +163,12 @@ index 2f94d49..68b2d3a 100644
          if conf.CHECK_CODE('''
                             #define %s 1
 diff --git a/wscript b/wscript
-index 8ae5be3..a178cc4 100644
+index ad91bc6..2d20fee 100644
 --- a/wscript
 +++ b/wscript
-@@ -31,6 +31,13 @@ def set_options(opt):
-     opt.RECURSE('lib/replace')
-     opt.tool_options('python') # options for disabling pyc or pyo compilation
+@@ -36,6 +36,12 @@ def set_options(opt):
+                    help='disable new LMDB backend for LDB',
+                    action='store_true', dest='without_ldb_lmdb', default=False)
  
 +    opt.add_option('--with-valgrind',
 +                   help=("enable use of valgrind"),
@@ -184,10 +176,9 @@ index 8ae5be3..a178cc4 100644
 +    opt.add_option('--without-valgrind',
 +                   help=("disable use of valgrind"),
 +                   action="store_false", dest='enable_valgrind', default=False)
-+
+ 
  def configure(conf):
      conf.RECURSE('lib/tdb')
-     conf.RECURSE('lib/tevent')
 -- 
-2.16.2
+2.7.4
 
diff --git a/meta-networking/recipes-support/libldb/libldb_1.3.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
similarity index 85%
rename from meta-networking/recipes-support/libldb/libldb_1.3.1.bb
rename to meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index 7e14cde..ca152d9 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.3.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -8,7 +8,10 @@ RDEPENDS_pyldb += "python"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
-           file://options-1.3.1.patch \
+           file://options-1.4.1.patch \
+           file://0001-libldb-fix-config-error.patch \
+           file://libldb-fix-musl-libc-unkown-type-error.patch \
+           file://libldb-fix-musl-libc-conflict-type-error.patch \
           "
 
 PACKAGECONFIG ??= "\
@@ -29,8 +32,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "e5233f202bca27f6ce8474fb8ae65983"
-SRC_URI[sha256sum] = "b19f2c9f55ae0f46aa5ebaea0bf1a47ec1ac135e1d78af0f6318cf50bf62cbd2"
+SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
+SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
 
 inherit waf-samba
 
@@ -43,6 +46,7 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-modulesdir=${libdir}/ldb/modules \
                  --with-privatelibdir=${libdir}/ldb \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                 --without-ldb-lmdb \
                 "
 
 PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
-- 
2.7.4


