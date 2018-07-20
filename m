Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ABB9560290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:29:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42458598"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jul 2018 10:29:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 55EB14B5CF67
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:29:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 20 Jul 2018 10:29:58 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1529967003-49427-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 55EB14B5CF67.AF6AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] ctdb: Has been integrated into samba. So, there is no need to maitain this recipe anymore.
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
Date: Fri, 20 Jul 2018 02:30:00 -0000
X-Original-Date: Mon, 25 Jun 2018 15:50:03 -0700
X-List-Received-Date: Fri, 20 Jul 2018 02:30:00 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../01-support-cross-compile-for-linux-os.patch    | 24 ---------
 .../ctdb/02-link-rep_snprintf-for-ltdbtool.patch   | 17 -------
 ...rvice-ensure-the-PID-directory-is-created.patch | 25 ----------
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb | 57 ----------------------
 4 files changed, 123 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
 delete mode 100644 meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
 delete mode 100644 meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
 delete mode 100644 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb

diff --git a/meta-networking/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch b/meta-networking/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
deleted file mode 100644
index c9195b4..0000000
--- a/meta-networking/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-support cross-compile for linux-os.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp ctdb-2.5.1.orig/configure ctdb-2.5.1/configure
---- ctdb-2.5.1.orig/configure	2015-05-07 16:24:28.545000238 +0900
-+++ ctdb-2.5.1/configure	2015-05-07 16:28:20.894000244 +0900
-@@ -10692,10 +10692,16 @@ if test x"$libreplace_cv_HAVE_GETADDRINF
- 	# see bug 5910, use our replacements if we detect
- 	# a broken system.
- 	if test "$cross_compiling" = yes; then :
-+		case "$target_os" in
-+		*linux*)
-+			;;
-+		*)
-   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
- $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
- as_fn_error $? "cannot run test program while cross compiling
- See \`config.log' for more details" "$LINENO" 5; }
-+			;;
-+		esac
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch b/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
deleted file mode 100644
index 1294fe4..0000000
--- a/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-link rep_snprintf from lib/replace/snprintf.o for ltdbtool
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-Index: ctdb-2.5.6/Makefile.in
-===================================================================
---- ctdb-2.5.6.orig/Makefile.in
-+++ ctdb-2.5.6/Makefile.in
-@@ -176,7 +176,7 @@ bin/ctdb: $(CTDB_CLIENT_OBJ) tools/ctdb.
- 	@echo Linking $@
- 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ tools/ctdb.o tools/ctdb_vacuum.o $(CTDB_CLIENT_OBJ) $(LIB_FLAGS)
- 
--bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ)
-+bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ) lib/replace/snprintf.o
- 	@echo Linking $@
- 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ $+ $(LIB_FLAGS)
- 
diff --git a/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch b/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
deleted file mode 100644
index a7e987b..0000000
--- a/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f02ff7383f1cc0c118732352ccbae476c7b3b3ba Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Tue, 17 Nov 2015 16:17:00 -0500
-Subject: [PATCH] service: ensure the PID directory is created
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- config/ctdb.service | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/config/ctdb.service b/config/ctdb.service
-index ea37c30..8537105 100644
---- a/config/ctdb.service
-+++ b/config/ctdb.service
-@@ -5,6 +5,7 @@ After=network.target
- [Service]
- Type=forking
- LimitCORE=infinity
-+RuntimeDirectory=/run/ctdb
- PIDFile=/run/ctdb/ctdbd.pid
- ExecStart=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid start
- ExecStop=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid stop
--- 
-2.1.4
-
diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
deleted file mode 100644
index df1a19e..0000000
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
-used by Samba and other projects to store temporary data. If an \
-application is already using TDB for temporary data it is very easy \
-to convert that application to be cluster aware and use CTDB instead."
-HOMEPAGE = "https://ctdb.samba.org/"
-LICENSE = "GPL-2.0+ & LGPL-3.0+ & GPL-3.0+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                    "
-
-SRC_URI = "https://ftp.samba.org/pub/${BPN}/${BP}.tar.gz \
-           file://01-support-cross-compile-for-linux-os.patch \
-           file://02-link-rep_snprintf-for-ltdbtool.patch \
-           file://service-ensure-the-PID-directory-is-created.patch \
-          "
-
-SRC_URI[md5sum] = "efc50109f90a4c790124c35e4ba234ad"
-SRC_URI[sha256sum] = "fc1cdd7efcc91afc629f21408281bba5da107b9c17e74bdee2f28a532d14f874"
-
-inherit autotools-brokensep pkgconfig systemd
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
-
-PARALLEL_MAKE = ""
-
-DEPENDS += "popt libtevent libtalloc libldb libtirpc"
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LDFLAGS += "-ltirpc"
-
-# ctdbd_wrapper requires pgrep, hence procps
-RDEPENDS_${PN} += "procps"
-
-do_configure() {
-    gnu-configize --force ${S}
-    oe_runconf
-}
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${S}/config/ctdb.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${D}${systemd_unitdir}/system/ctdb.service
-    sed -i -e 's,\([=\ ]\)/run/,\1${localstatedir}/run/,' ${D}${systemd_unitdir}/system/ctdb.service
-
-    rm -r ${D}/${localstatedir}/run
-}
-
-# The systemd service is disabled by default, as the service will fail to
-# start without /etc/ctdb/nodes. If the user supplies this, they can re-enable
-# the service.
-SYSTEMD_AUTO_ENABLE = "disable"
-SYSTEMD_SERVICE_${PN} = "ctdb.service"
-
-# onnode is a shell script with bashisms and bash #!
-RDEPENDS_${PN} += "bash"
-- 
2.7.4




