Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EFA4D759D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:01:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97058812"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 17:05:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F8xVxL030495
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:59:31 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 17:01:17 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:52:12 +0800
Message-ID: <1434358336-34981-4-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 3/7] ctdb: add new recipe
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
X-List-Received-Date: Mon, 15 Jun 2015 09:01:08 -0000
Content-Type: text/plain

ctdb is required by samba4

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../01-support-cross-compile-for-linux-os.patch    | 24 ++++++++++++
 .../ctdb/02-link-rep_snprintf-for-ltdbtool.patch   | 16 ++++++++
 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb         | 43 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb

diff --git a/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch b/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
new file mode 100644
index 0000000..c9195b4
--- /dev/null
+++ b/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
@@ -0,0 +1,24 @@
+support cross-compile for linux-os.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp ctdb-2.5.1.orig/configure ctdb-2.5.1/configure
+--- ctdb-2.5.1.orig/configure	2015-05-07 16:24:28.545000238 +0900
++++ ctdb-2.5.1/configure	2015-05-07 16:28:20.894000244 +0900
+@@ -10692,10 +10692,16 @@ if test x"$libreplace_cv_HAVE_GETADDRINF
+ 	# see bug 5910, use our replacements if we detect
+ 	# a broken system.
+ 	if test "$cross_compiling" = yes; then :
++		case "$target_os" in
++		*linux*)
++			;;
++		*)
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+ as_fn_error $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
++			;;
++		esac
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch b/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
new file mode 100644
index 0000000..1dd9b93
--- /dev/null
+++ b/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
@@ -0,0 +1,16 @@
+link rep_snprintf from lib/replace/snprintf.o for ltdbtool
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp ctdb-2.5.1.orig/Makefile.in ctdb-2.5.1/Makefile.in
+--- ctdb-2.5.1.orig/Makefile.in	2015-05-07 16:43:39.276000236 +0900
++++ ctdb-2.5.1/Makefile.in	2015-05-07 16:44:09.627000237 +0900
+@@ -170,7 +170,7 @@ bin/ctdb: $(CTDB_CLIENT_OBJ) tools/ctdb.
+ 	@echo Linking $@
+ 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ tools/ctdb.o tools/ctdb_vacuum.o $(CTDB_CLIENT_OBJ) $(LIB_FLAGS)
+ 
+-bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ)
++bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ) lib/replace/snprintf.o
+ 	@echo Linking $@
+ 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ $+ $(TDB_LIBS) $(LIB_FLAGS)
+ 
diff --git a/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
new file mode 100644
index 0000000..25d5dc9
--- /dev/null
+++ b/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
+used by Samba and other projects to store temporary data. If an \
+application is already using TDB for temporary data it is very easy \
+to convert that application to be cluster aware and use CTDB instead."
+DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
+used by Samba and other projects to store temporary data. If an \
+application is already using TDB for temporary data it is very easy \
+to convert that application to be cluster aware and use CTDB instead."
+HOMEPAGE = "https://ctdb.samba.org/"
+LICENSE = "GPL-2.0+ & LGPL-3.0+ & GPL-3.0+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    "
+
+SRC_URI = "https://ftp.samba.org/pub/${PN}/${BP}.tar.gz \
+           file://01-support-cross-compile-for-linux-os.patch \
+           file://02-link-rep_snprintf-for-ltdbtool.patch \
+          "
+
+SRC_URI[md5sum] = "d0cd91726ff4ca2229e1b21859c94717"
+SRC_URI[sha256sum] = "d5bf3f674cae986bb6178b1db215a703ac94adc5f75fadfdcff63dcbb5e98ab5"
+
+inherit autotools-brokensep pkgconfig systemd
+
+PARALLEL_MAKE = ""
+
+DEPENDS += "popt libtevent libtalloc"
+
+do_configure() {
+    oe_runconf
+}
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${S}/config/ctdb.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${D}${systemd_unitdir}/system/ctdb.service
+}
+
+SYSTEMD_SERVICE_${PN} = "ctdb.service"
+
+FILES_${PN} += "/run"
-- 
1.8.4.2


