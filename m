Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 93585741CF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:58:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97190619"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:02:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H7uXZb016501
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:56:33 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 15:58:20 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:49:09 +0800
Message-ID: <1434527353-47017-4-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2 3/7] libldb: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 07:58:08 -0000
Content-Type: text/plain

libldb is required by samba4

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../do-not-import-target-module-in-configure.patch | 32 +++++++++++++++
 meta-oe/recipes-support/libldb/libldb_1.1.17.bb    | 45 ++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch
 create mode 100644 meta-oe/recipes-support/libldb/libldb_1.1.17.bb

diff --git a/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch
new file mode 100644
index 0000000..b4d522a
--- /dev/null
+++ b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch
@@ -0,0 +1,32 @@
+Some module can be loaded while cross compile, we jst check whether the module exist
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+--- ldb-1.1.17.orig/buildtools/wafsamba/samba_bundled.py	2014-05-05 17:00:41.000000000 +0900
++++ ldb-1.1.17/buildtools/wafsamba/samba_bundled.py	2015-06-15 10:09:50.210000217 +0900
+@@ -1,7 +1,7 @@
+ # functions to support bundled libraries
+ 
+ from Configure import conf
+-import sys, Logs
++import sys, Logs, imp
+ from samba_utils import *
+ 
+ def PRIVATE_NAME(bld, name, private_extension, private_library):
+@@ -222,6 +222,16 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
+         m = __import__(modulename)
+     except ImportError:
+         found = False
++
++        build_arch = os.environ["BUILD_ARCH"]
++        host_arch = os.environ["HOST_ARCH"]
++        if build_arch != host_arch:
++            # Some modules maybe can not be imported while cross compile
++            # We just check whether the module exist
++            stuff = imp.find_module(modulename, [os.environ["PYTHONPATH"]])
++            if stuff != None:
++                Logs.warn('Cross module[%s] has been found, but can not be loaded.' % (stuff[1]))
++                found = True
+     else:
+         try:
+             version = m.__version__
diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
new file mode 100644
index 0000000..17607f7
--- /dev/null
+++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
+HOMEPAGE = "http://ldb.samba.org"
+SECTION = "libs"
+LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
+
+DEPENDS += "libtdb talloc libtevent libtdb"
+RDEPENDS_${PN} += "libtevent popt libtalloc"
+RDEPENDS_pyldb += "python libtdb libtalloc"
+
+SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
+           file://do-not-import-target-module-in-configure.patch"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+
+SRC_URI[md5sum] = "7c2ab4e3f2a4186493aa06eabbc61cc0"
+SRC_URI[sha256sum] = "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bdb6e6"
+
+inherit waf-samba
+
+S = "${WORKDIR}/ldb-${PV}"
+
+EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --with-modulesdir=${libdir}/ldb/modules \
+                 --with-privatelibdir=${libdir}/ldb \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                "
+
+PACKAGES += "pyldb pyldb-dbg pyldb-dev"
+
+FILES_${PN} += "${libdir}/ldb/*"
+FILES_${PN}-dbg += "${libdir}/ldb/.debug/* \
+                    ${libdir}/ldb/modules/ldb/.debug/*"
+
+FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+               ${libdir}/libpyldb-util.so.1 \
+               ${libdir}/libpyldb-util.so.1.1.17 \
+              "
+FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
+                   ${libdir}/.debug/libpyldb-util.so.1.1.17"
+FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
-- 
1.9.1


