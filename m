Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E7F59759D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:01:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97058817"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 17:05:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F8xYio030509
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:59:34 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 17:01:20 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:52:15 +0800
Message-ID: <1434358336-34981-7-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 6/7] libtdb: add new recipe
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
X-List-Received-Date: Mon, 15 Jun 2015 09:01:09 -0000
Content-Type: text/plain

libtdb is required by samba4

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../libtdb/do-not-check-xsltproc-manpages.patch    | 15 +++++++++++
 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb     | 30 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb

diff --git a/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch b/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
new file mode 100644
index 0000000..bcc45c9
--- /dev/null
+++ b/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
@@ -0,0 +1,15 @@
+Don't check manpages for xsltproc.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+--- tdb-1.3.0.orig/wscript	2015-04-22 09:52:32.366000222 +0900
++++ tdb-1.3.0/wscript	2015-04-22 09:51:57.720000205 +0900
+@@ -90,7 +90,7 @@ def configure(conf):
+         not conf.env.disable_tdb_mutex_locking):
+         conf.define('USE_TDB_MUTEX_LOCKING', 1)
+ 
+-    conf.CHECK_XSLTPROC_MANPAGES()
++    conf.find_program('xsltproc', var='XSLTPROC')
+ 
+     if not conf.env.disable_python:
+         # also disable if we don't have the python libs installed
diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
new file mode 100644
index 0000000..b7f3d21
--- /dev/null
+++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "The tdb library"
+SECTION = "libs"
+LICENSE = "LGPL-3.0+ & GPL-3.0+"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+
+SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
+           file://do-not-check-xsltproc-manpages.patch"
+
+SRC_URI[md5sum] = "f18cd6afc4f5670edfe58f72d2665f94"
+SRC_URI[sha256sum] = "04bee48d405ab7815810575a6e0cb364cc0eea6187b54b18c84e9c18a768ba20"
+
+S = "${WORKDIR}/tdb-${PV}"
+
+inherit wafsamba
+
+EXTRA_OECONF += "--disable-rpath \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                "
+
+PACKAGES += "tdb-tools python-tdb python-tdb-dbg"
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_tdb-tools = "${bindir}/*"
+FILES_python-tdb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_python-tdb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug/*"
+RDEPENDS_python-tdb = "python"
-- 
1.8.4.2


