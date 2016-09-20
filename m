Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F61465CB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:59:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8K5xapM004763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:59:37 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Sep 2016 22:59:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 13:42:25 +0800
Message-ID: <8ca1074485dd857c97e91a384184a45ff2cdabca.1474348826.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474348826.git.jackie.huang@windriver.com>
References: <cover.1474348826.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] libldb: fixes for deterministic builds
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
X-List-Received-Date: Tue, 20 Sep 2016 05:59:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add configure option and PACKAGECONFIG for
  the following packages:
  - acl
  - attr
  - libaio
  - libcap
  - valgrind

* They are all optional, so disable by default
  or control them based on DISTRO_FEATURES.

* Remove the direct dependency on libaio

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ldb-Add-configure-options-for-packages.patch   | 124 +++++++++++++++++++++
 .../recipes-support/libldb/libldb_1.1.27.bb        |  13 ++-
 2 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch

diff --git a/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch
new file mode 100644
index 0000000..b628912
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch
@@ -0,0 +1,124 @@
+From 75c66723bf2f76085038f0cb6f6824a5554c6f15 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 14 Sep 2016 16:01:07 +0800
+Subject: [PATCH] ldb: Add configure options for packages
+
+Add configure options for the following packages:
+ - acl
+ - attr
+ - libaio
+ - libcap
+ - valgrind
+
+Upstream-Status: Inappropriate [oe deterministic build specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ lib/replace/system/wscript_configure |  6 ++++-
+ lib/replace/wscript                  | 43 +++++++++++++++++++++++++++++++-----
+ wscript                              |  4 ++++
+ 3 files changed, 46 insertions(+), 7 deletions(-)
+
+diff --git a/lib/replace/system/wscript_configure b/lib/replace/system/wscript_configure
+index 2035474..10f9ae7 100644
+--- a/lib/replace/system/wscript_configure
++++ b/lib/replace/system/wscript_configure
+@@ -1,6 +1,10 @@
+ #!/usr/bin/env python
+ 
+-conf.CHECK_HEADERS('sys/capability.h')
++import Options
++
++if Options.options.enable_libcap:
++    conf.CHECK_HEADERS('sys/capability.h')
++
+ conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
+ 
+ # solaris varients of getXXent_r
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index 145300d..c9e6a45 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -23,6 +23,22 @@ def set_options(opt):
+     opt.PRIVATE_EXTENSION_DEFAULT('')
+     opt.RECURSE('buildtools/wafsamba')
+ 
++    opt.add_option('--with-acl',
++                   help=("Enable use of acl"),
++                   action="store_true", dest='enable_acl', default=False)
++
++    opt.add_option('--with-attr',
++                   help=("Enable use of attr"),
++                   action="store_true", dest='enable_attr', default=False)
++
++    opt.add_option('--with-libaio',
++                   help=("Enable use of libaio"),
++                   action="store_true", dest='enable_libaio', default=False)
++
++    opt.add_option('--with-libcap',
++                   help=("Enable use of libcap"),
++                   action="store_true", dest='enable_libcap', default=False)
++
+ @Utils.run_once
+ def configure(conf):
+     conf.RECURSE('buildtools/wafsamba')
+@@ -32,12 +48,25 @@ def configure(conf):
+     conf.DEFINE('HAVE_LIBREPLACE', 1)
+     conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
+ 
+-    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
+-    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
++    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
+     conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
+-    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+-    conf.CHECK_HEADERS('shadow.h sys/acl.h')
+-    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
++    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
++    conf.CHECK_HEADERS('shadow.h')
++    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
++
++    if Options.options.enable_acl:
++        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
++
++    if Options.options.enable_attr:
++        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
++
++    if Options.options.enable_libaio:
++        conf.CHECK_HEADERS('libaio.h')
++
++    if Options.options.enable_libcap:
++        conf.CHECK_HEADERS('sys/capability.h')
++
+     conf.CHECK_HEADERS('port.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
+@@ -73,7 +102,9 @@ def configure(conf):
+ 
+     conf.CHECK_CODE('', headers='rpc/rpc.h rpcsvc/yp_prot.h', define='HAVE_RPCSVC_YP_PROT_H')
+ 
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++    if Options.options.enable_valgrind:
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++
+     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
+     conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
+     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
+diff --git a/wscript b/wscript
+index 2af8571..92145fd 100755
+--- a/wscript
++++ b/wscript
+@@ -29,6 +29,10 @@ def set_options(opt):
+     opt.RECURSE('lib/replace')
+     opt.tool_options('python') # options for disabling pyc or pyo compilation
+ 
++    opt.add_option('--with-valgrind',
++                   help=("enable use of valgrind"),
++                   action="store_true", dest='enable_valgrind', default=False)
++
+ def configure(conf):
+     conf.RECURSE('lib/tdb')
+     conf.RECURSE('lib/tevent')
+-- 
+2.8.3
+
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
index b92bf22..80c95f9 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
@@ -3,14 +3,25 @@ HOMEPAGE = "http://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
-DEPENDS += "libaio libbsd libtdb libtalloc libtevent popt"
+DEPENDS += "libbsd libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
+           file://ldb-Add-configure-options-for-packages.patch \
           "
 
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
+"
+PACKAGECONFIG[acl] = "--with-acl,,acl"
+PACKAGECONFIG[attr] = "--with-attr,,attr"
 PACKAGECONFIG[ldap] = ",,openldap"
+PACKAGECONFIG[libaio] = "--with-libaio,,libaio,"
+PACKAGECONFIG[libcap] = "--with-libcap,,libcap,"
+PACKAGECONFIG[valgrind] = "--with-valgrind,,valgrind,"
+
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-- 
2.8.3


