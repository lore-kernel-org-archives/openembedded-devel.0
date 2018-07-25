Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8500078994
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6P3Rldv001006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:30 +0800
Message-ID: <1532489252-246963-9-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] libtdb: upgrade 1.3.15 -> 1.3.16
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../tdb-Add-configure-options-for-packages.patch   | 66 +++++++++-------------
 .../libtdb/{libtdb_1.3.15.bb => libtdb_1.3.16.bb}  |  4 +-
 2 files changed, 28 insertions(+), 42 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.15.bb => libtdb_1.3.16.bb} (91%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
index 272921e..365b92d 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -1,10 +1,7 @@
-From 24911f36bcb00412e5dc4cd11fda139e09d58798 Mon Sep 17 00:00:00 2001
-From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
-Date: Tue, 1 Aug 2017 03:12:09 +0900
-Subject: [PATCH] From 10ac5e5fdda44adcc2a159b6f9a2d51a51361057 Mon Sep 17
- 00:00:00 2001 From: Jackie Huang <jackie.huang@windriver.com> Date: Wed, 21
- Sep 2016 10:46:19 +0800 Subject: [PATCH] tdb: Add configure options for
- packages
+From 6de1affddde4003a956523c330ecf24e22e094ac Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 19 Jul 2018 16:20:32 +0800
+Subject: [PATCH] tdb: Add configure options for packages
 
 Add configure options for the following packages:
  - acl
@@ -21,30 +18,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Update for libtdb_1.3.14.
 
 Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+
+Update for libtdb_1.3.16
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/system/wscript_configure |  6 ++-
- lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
- wscript                              |  7 ++-
- 3 files changed, 79 insertions(+), 19 deletions(-)
+ lib/replace/wscript | 89 +++++++++++++++++++++++++++++++++++++++++------------
+ wscript             |  6 ++++
+ 2 files changed, 75 insertions(+), 20 deletions(-)
 
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
-index 7c50e1d..15df5c3 100644
+index fd00a42..2df83cd 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set_options(opt):
@@ -96,7 +79,7 @@ index 7c50e1d..15df5c3 100644
 -    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
 -    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
-+    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
++    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
 -    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
@@ -120,9 +103,9 @@ index 7c50e1d..15df5c3 100644
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
@@ -131,18 +114,21 @@ index 7c50e1d..15df5c3 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -251,17 +301,18 @@ def configure(conf):
+@@ -342,20 +392,19 @@ def configure(conf):
  
-     conf.CHECK_FUNCS('prctl dirname basename')
+     strlcpy_in_bsd = False
  
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
--        conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
--                checklibc=True)
+-        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+-                               checklibc=True):
+-            strlcpy_in_bsd = True
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS('setproctitle_init'):
+-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
@@ -158,18 +144,18 @@ index 7c50e1d..15df5c3 100644
 +
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++    
  
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 1c9655a..8c20d3b 100644
+index 6505648..6608481 100644
 --- a/wscript
 +++ b/wscript
-@@ -62,7 +62,12 @@ def set_options(opt):
-                    help=("Disable the use of pthread robust mutexes"),
+@@ -63,6 +63,12 @@ def set_options(opt):
                     action="store_true", dest='disable_tdb_mutex_locking',
                     default=False)
--
+ 
 +    opt.add_option('--with-valgrind',
 +                   help=("enable use of valgrind"),
 +                   action="store_true", dest='enable_valgrind')
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb
similarity index 91%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb
index 302a306..112e89e 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.16.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
 "
 
-SRC_URI[md5sum] = "60ece3996acc8d85b6f713199da971a6"
-SRC_URI[sha256sum] = "b4a1bf3833601bd9f10aff363cb750860aef9ce5b4617989239923192f946728"
+SRC_URI[md5sum] = "7d06d8709188e07df853d9e91db88927"
+SRC_URI[sha256sum] = "6a3fc2616567f23993984ada3cea97d953a27669ffd1bfbbe961f26e0cf96cc5"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.7.4


