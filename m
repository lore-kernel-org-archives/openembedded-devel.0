Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA2E607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:59:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K5xeZf020385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:59:40 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Sep 2016 22:59:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 13:42:26 +0800
Message-ID: <c8133d456781f58dd3142f443cc08d808615efba.1474348826.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474348826.git.jackie.huang@windriver.com>
References: <cover.1474348826.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] libtdb: fixes for deterministic builds
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
X-List-Received-Date: Tue, 20 Sep 2016 05:59:38 -0000
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
 .../tdb-Add-configure-options-for-packages.patch   | 127 +++++++++++++++++++++
 .../recipes-support/libtdb/libtdb_1.3.10.bb        |  16 ++-
 2 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch

diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
new file mode 100644
index 0000000..6db0f9c
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -0,0 +1,127 @@
+From 7f86be29df07fd6c371e3f4315cb7629c1b49eaa Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 20 Sep 2016 09:04:47 +0800
+Subject: [PATCH] tdb: Add configure options for packages
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
+ mode change 100644 => 100755 wscript
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
+old mode 100644
+new mode 100755
+index 50b2286..eb5f90e
+--- a/wscript
++++ b/wscript
+@@ -66,6 +66,10 @@ def set_options(opt):
+                        action="store_true", dest='disable_python', default=False)
+ 
+ 
++    opt.add_option('--with-valgrind',
++                   help=("enable use of valgrind"),
++                   action="store_true", dest='enable_valgrind', default=False)
++
+ def configure(conf):
+     conf.env.disable_tdb_mutex_locking = getattr(Options.options,
+                                                  'disable_tdb_mutex_locking',
+-- 
+2.8.3
+
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
index 35ae8c0..9ab0811 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
@@ -2,17 +2,27 @@ SUMMARY = "The tdb library"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
-DEPENDS += "libaio"
-
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
 SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
-           file://do-not-check-xsltproc-manpages.patch"
+           file://do-not-check-xsltproc-manpages.patch \
+           file://tdb-Add-configure-options-for-packages.patch \
+"
 
 SRC_URI[md5sum] = "c98f24eb469022b0f1741d3a504cfda5"
 SRC_URI[sha256sum] = "5578fb726bd04835f250bea11fe7d1398fe0bb3a7c9390404241c83cd6b50c1c"
 
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
+"
+PACKAGECONFIG[acl] = "--with-acl,,acl"
+PACKAGECONFIG[attr] = "--with-attr,,attr"
+PACKAGECONFIG[libaio] = "--with-libaio,,libaio,"
+PACKAGECONFIG[libcap] = "--with-libcap,,libcap,"
+PACKAGECONFIG[valgrind] = "--with-valgrind,,valgrind,"
+
 S = "${WORKDIR}/tdb-${PV}"
 
 inherit waf-samba
-- 
2.8.3


