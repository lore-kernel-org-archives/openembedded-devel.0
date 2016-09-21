Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 641577016E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:58:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L5wUHG003130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:58:30 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 22:58:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Sep 2016 13:41:08 +0800
Message-ID: <1d9c91353777d4d173537e69b52b1206a1593210.1474435724.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474435724.git.jackie.huang@windriver.com>
References: <cover.1474435724.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 7/8 v2] libldb: fixes for deterministic builds
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
X-List-Received-Date: Wed, 21 Sep 2016 05:58:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add configure option and PACKAGECONFIG for
  the following packages:
  - acl
  - attr
  - libaio
  - libbsd
  - libcap
  - valgrind

* They are all optional, so disable by default
  or control them based on DISTRO_FEATURES.

* Remove the direct dependency on libaio and libbsd

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ldb-Add-configure-options-for-packages.patch   | 177 +++++++++++++++++++++
 .../recipes-support/libldb/libldb_1.1.27.bb        |  14 +-
 2 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch

diff --git a/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch
new file mode 100644
index 0000000..93bd457
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch
@@ -0,0 +1,177 @@
+From 49dde22e798fd7f39fd59250036c0ae1fe2b9152 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 21 Sep 2016 10:06:39 +0800
+Subject: [PATCH] ldb: Add configure options for packages
+
+Add configure options for the following packages:
+ - acl
+ - attr
+ - libaio
+ - libbsd
+ - libcap
+ - valgrind
+
+Upstream-Status: Inappropriate [oe deterministic build specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ lib/replace/system/wscript_configure |  6 ++-
+ lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
+ wscript                              |  7 +++
+ 3 files changed, 80 insertions(+), 18 deletions(-)
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
+index 145300d..8218fa5 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -23,6 +23,41 @@ def set_options(opt):
+     opt.PRIVATE_EXTENSION_DEFAULT('')
+     opt.RECURSE('buildtools/wafsamba')
+ 
++    opt.add_option('--with-acl',
++                   help=("Enable use of acl"),
++                   action="store_true", dest='enable_acl')
++    opt.add_option('--without-acl',
++                   help=("Disable use of acl"),
++                   action="store_false", dest='enable_acl', default=False)
++
++    opt.add_option('--with-attr',
++                   help=("Enable use of attr"),
++                   action="store_true", dest='enable_attr')
++    opt.add_option('--without-attr',
++                   help=("Disable use of attr"),
++                   action="store_false", dest='enable_attr', default=False)
++
++    opt.add_option('--with-libaio',
++                   help=("Enable use of libaio"),
++                   action="store_true", dest='enable_libaio')
++    opt.add_option('--without-libaio',
++                   help=("Disable use of libaio"),
++                   action="store_false", dest='enable_libaio', default=False)
++
++    opt.add_option('--with-libbsd',
++                   help=("Enable use of libbsd"),
++                   action="store_true", dest='enable_libbsd')
++    opt.add_option('--without-libbsd',
++                   help=("Disable use of libbsd"),
++                   action="store_false", dest='enable_libbsd', default=False)
++
++    opt.add_option('--with-libcap',
++                   help=("Enable use of libcap"),
++                   action="store_true", dest='enable_libcap')
++    opt.add_option('--without-libcap',
++                   help=("Disable use of libcap"),
++                   action="store_false", dest='enable_libcap', default=False)
++
+ @Utils.run_once
+ def configure(conf):
+     conf.RECURSE('buildtools/wafsamba')
+@@ -32,12 +67,25 @@ def configure(conf):
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
+@@ -73,7 +121,9 @@ def configure(conf):
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
+@@ -248,17 +298,18 @@ def configure(conf):
+ 
+     conf.CHECK_FUNCS('prctl dirname basename')
+ 
+-    # libbsd on some platforms provides strlcpy and strlcat
+-    if not conf.CHECK_FUNCS('strlcpy strlcat'):
+-        conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+-                checklibc=True)
+-    if not conf.CHECK_FUNCS('getpeereid'):
+-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
+-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
+-
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++    if Options.options.enable_libbsd:
++        # libbsd on some platforms provides strlcpy and strlcat
++        if not conf.CHECK_FUNCS('strlcpy strlcat'):
++            conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++                    checklibc=True)
++        if not conf.CHECK_FUNCS('getpeereid'):
++            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
++        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
++            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
++
++        if not conf.CHECK_FUNCS('closefrom'):
++            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
+ 
+     conf.CHECK_CODE('''
+                 struct ucred cred;
+diff --git a/wscript b/wscript
+index 2af8571..059408b 100755
+--- a/wscript
++++ b/wscript
+@@ -29,6 +29,13 @@ def set_options(opt):
+     opt.RECURSE('lib/replace')
+     opt.tool_options('python') # options for disabling pyc or pyo compilation
+ 
++    opt.add_option('--with-valgrind',
++                   help=("enable use of valgrind"),
++                   action="store_true", dest='enable_valgrind')
++    opt.add_option('--without-valgrind',
++                   help=("disable use of valgrind"),
++                   action="store_false", dest='enable_valgrind', default=False)
++
+ def configure(conf):
+     conf.RECURSE('lib/tdb')
+     conf.RECURSE('lib/tevent')
+-- 
+2.8.3
+
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
index 7b6e6e3..f4370ef 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
@@ -3,14 +3,26 @@ HOMEPAGE = "http://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
-DEPENDS += "libaio libbsd libtdb libtalloc libtevent popt"
+DEPENDS += "libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
+           file://ldb-Add-configure-options-for-packages.patch \
           "
 
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
+"
+PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
+PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[ldap] = ",,openldap"
+PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
+PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
+PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
+
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
 
 LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
-- 
2.8.3


