Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39D0B72FDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0763218328
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KRLtaDg85k5P
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9697B18306
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AE1C1A169
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E9C11A15F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 027BF20E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SFs87S015195
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SFs87I015194
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2017 16:54:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:54:05 +0100
Message-Id: <20170228155405.15144-2-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170228155405.15144-1-pkj@axis.com>
References: <20170228155405.15144-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] syslog-ng: Update to 3.8.1
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
X-List-Received-Date: Tue, 28 Feb 2017 15:54:13 -0000

* The upstream has changed to github.com.
* Remove patches that are no longer needed:
  - Fix-the-memory-leak-problem-for-mutex.patch
  - configure.patch
  - dbifix.patch
  - fix-a-memory-leak-in-log_driver_free.patch
* Update syslog-ng.service-the-syslog-ng-service.patch
* openssl is no longer optional, so remove its PACKAGECONFIG.
* Add (disabled) PACKAGECONFIGs for the new http and native modules.
* Disable the new python and java modules.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../Fix-the-memory-leak-problem-for-mutex.patch    | 58 ----------------------
 .../syslog-ng/files/configure.patch                | 23 ---------
 .../recipes-support/syslog-ng/files/dbifix.patch   | 20 --------
 .../fix-a-memory-leak-in-log_driver_free.patch     | 33 ------------
 .../syslog-ng.service-the-syslog-ng-service.patch  | 13 +++--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    | 17 ++++---
 .../recipes-support/syslog-ng/syslog-ng_3.6.4.bb   | 15 ------
 .../recipes-support/syslog-ng/syslog-ng_3.8.1.bb   | 11 ++++
 8 files changed, 27 insertions(+), 163 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/configure.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/dbifix.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
deleted file mode 100644
index 89022aa..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Fix the memory leak problem for mutex
-
-Upstream-Status: Pending
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
- lib/logqueue.c               |    1 +
- modules/affile/affile-dest.c |    2 ++
- modules/dbparser/dbparser.c  |    1 +
- 3 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/lib/logqueue.c b/lib/logqueue.c
-index 337a3c1..10edcf0 100644
---- a/lib/logqueue.c
-+++ b/lib/logqueue.c
-@@ -188,6 +188,7 @@ log_queue_init_instance(LogQueue *self, const gchar *persist_name)
- void
- log_queue_free_method(LogQueue *self)
- {
-+  g_static_mutex_free(&self->lock);
-   g_free(self->persist_name);
-   g_free(self);
- }
-diff --git a/modules/affile/affile-dest.c b/modules/affile/affile-dest.c
-index a2bcdad..ce79f6f 100644
---- a/modules/affile/affile-dest.c
-+++ b/modules/affile/affile-dest.c
-@@ -305,6 +305,7 @@ affile_dw_free(LogPipe *s)
- {
-   AFFileDestWriter *self = (AFFileDestWriter *) s;
-   
-+  g_static_mutex_free(&self->lock);
-   log_pipe_unref((LogPipe *) self->writer);
-   self->writer = NULL;
-   g_free(self->filename);
-@@ -687,6 +688,7 @@ affile_dd_free(LogPipe *s)
-   /* NOTE: this must be NULL as deinit has freed it, otherwise we'd have circular references */
-   g_assert(self->single_writer == NULL && self->writer_hash == NULL);
- 
-+  g_static_mutex_free(&self->lock);
-   log_template_unref(self->filename_template);
-   log_writer_options_destroy(&self->writer_options);
-   log_dest_driver_free(s);
-diff --git a/modules/dbparser/dbparser.c b/modules/dbparser/dbparser.c
-index f1248b5..9775701 100644
---- a/modules/dbparser/dbparser.c
-+++ b/modules/dbparser/dbparser.c
-@@ -284,6 +284,7 @@ log_db_parser_free(LogPipe *s)
- {
-   LogDBParser *self = (LogDBParser *) s;
- 
-+  g_static_mutex_free(&self->lock);
-   if (self->db)
-     pattern_db_free(self->db);
- 
--- 
-1.7.1
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.patch b/meta-oe/recipes-support/syslog-ng/files/configure.patch
deleted file mode 100644
index 109f58c..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/configure.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: syslog-ng-3.5.4.1/configure.ac
-===================================================================
---- syslog-ng-3.5.4.1.orig/configure.ac	2014-07-18 13:49:36.794141441 +0000
-+++ syslog-ng-3.5.4.1/configure.ac	2014-07-18 14:23:57.738197606 +0000
-@@ -8,7 +8,8 @@ dnl SNAPSHOT_VERSION   - snapshot version to add to version number
- dnl BINARY_BRANCH      - the value is added to all source/binary packages
- dnl SOURCE_REVISION    - Revision of the source-tree, will added to the version string
- dnl
--AC_INIT(syslog-ng/main.c)
-+AC_INIT(syslog-ng, 3.5.4.1)
-+AC_CONFIG_SRCDIR(syslog-ng/main.c)
- AC_CONFIG_MACRO_DIR([m4])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
-@@ -53,7 +54,7 @@ else
-         CURRDATE=`date +"%a, %d %b %Y %H:%M:%S %Z"`
- fi
- 
--AM_INIT_AUTOMAKE($PACKAGE, $VERSION, [foreign no-define subdir-objects])
-+AM_INIT_AUTOMAKE([foreign no-define subdir-objects])
- _AM_PROG_TAR([ustar])
- if test -n "$SNAPSHOT_VERSION"; then
- 	VERSION=$VERSION+$SNAPSHOT_VERSION
diff --git a/meta-oe/recipes-support/syslog-ng/files/dbifix.patch b/meta-oe/recipes-support/syslog-ng/files/dbifix.patch
deleted file mode 100644
index 15dfb68..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/dbifix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: syslog-ng-3.5.4.1/configure.ac
-===================================================================
---- syslog-ng-3.5.4.1.orig/configure.ac	2014-07-18 14:35:03.134215740 +0000
-+++ syslog-ng-3.5.4.1/configure.ac	2014-07-18 15:31:52.510308653 +0000
-@@ -576,13 +576,14 @@
- dnl ***************************************************************************
- 
- AC_CHECK_LIB(dl, dlsym, DL_LIBS="-ldl")
-+if test "x$enable_sql" != "xno"; then
- PKG_CHECK_MODULES(LIBDBI, dbi >= $LIBDBI_MIN_VERSION, libdbi_pkgconfig_not_found="0", libdbi_pkgconfig_not_found="1")
- 
- if test "$libdbi_pkgconfig_not_found" -eq 1; then
- 	dnl if libdbi has no .pc file, try it without one
- 	AC_CHECK_LIB(dbi, dbi_initialize, LIBDBI_LIBS="-ldbi"; LIBDBI_CFLAGS="-I/usr/include")
- fi
--
-+fi
- if test "x$enable_sql" = "xauto"; then
- 	AC_MSG_CHECKING(whether to enable SQL support)
- 	if test "x$LIBDBI_LIBS" != "x"; then
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch b/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
deleted file mode 100644
index 2603474..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a269669ba3cb6d1c06a3322b4a6a035cb787d085 Mon Sep 17 00:00:00 2001
-From: Gergely Nagy <algernon@balabit.hu>
-Date: Tue, 14 Jan 2014 13:58:05 +0100
-Subject: [PATCH] driver: Fix a memory leak in log_driver_free()
-
-Upstream-Status: Backport
-
-After freeing up the members of self->plugins, free self->plugins itself
-too.
-
-Signed-off-by: Gergely Nagy <algernon@balabit.hu>
----
- lib/driver.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/lib/driver.c b/lib/driver.c
-index d77fe57..a6867b9 100644
---- a/lib/driver.c
-+++ b/lib/driver.c
-@@ -91,6 +91,10 @@ log_driver_free(LogPipe *s)
-     {
-       log_driver_plugin_free((LogDriverPlugin *) l->data);
-     }
-+  if (self->plugins)
-+    {
-+      g_list_free(self->plugins);
-+    }
-   if (self->group)
-     g_free(self->group);
-   if (self->id)
--- 
-1.8.4.1
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index f53c607..6b30c20 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -15,18 +15,17 @@ diff --git a/contrib/systemd/syslog-ng.service b/contrib/systemd/syslog-ng.servi
 index fc16f8d..8e09deb 100644
 --- a/contrib/systemd/syslog-ng.service
 +++ b/contrib/systemd/syslog-ng.service
-@@ -3,9 +3,8 @@ Description=System Logger Daemon
- Documentation=man:syslog-ng(8)
+@@ -4,8 +4,8 @@ Description=System Logger Daemon
  
  [Service]
--Type=notify
--ExecStart=/usr/sbin/syslog-ng -F
+ Type=notify
+-ExecStart=/usr/sbin/syslog-ng -F $SYSLOGNG_OPTS
 -ExecReload=/bin/kill -HUP $MAINPID
-+ExecStart=@SBINDIR@/syslog-ng -F -p @LOCALSTATEDIR@/run/syslogd.pid
++ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS -p @LOCALSTATEDIR@/run/syslogd.pid
 +ExecReload=@BASEBINDIR@/kill -HUP $MAINPID
+ EnvironmentFile=-/etc/default/syslog-ng
+ EnvironmentFile=-/etc/sysconfig/syslog-ng
  StandardOutput=journal
- StandardError=journal
- Restart=on-failure
 -- 
 1.8.4.2
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index a5e1bfe..e13c57b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -10,12 +10,12 @@ ideal for firewalled environments. \
 HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
 
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e0e8658d9be248f01b7933df24dc1408"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex eventlog glib-2.0 util-linux"
+DEPENDS = "libpcre flex eventlog glib-2.0 openssl util-linux"
 
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${BPN}_${PV}.tar.gz \
+SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf \
            file://initscript \
            file://volatiles.03_syslog-ng \
@@ -32,28 +32,31 @@ EXTRA_OECONF = " \
     --sysconfdir=${sysconfdir}/${BPN} \
     --with-module-dir=${libdir}/${BPN} \
     --with-sysroot=${STAGING_DIR_HOST} \
-    --with-libmongo-client=no --disable-mongodb \
+    --without-mongoc --disable-mongodb \
     --with-librabbitmq-client=no \
+    --disable-python \
+    --disable-java --disable-java-modules \
     ${CONFIG_TLS} \
 "
 
 CONFIG_TLS = "--enable-thread-tls"
 CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
 
-PACKAGECONFIG ??= "openssl \
+PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 "
-PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl,openssl,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
 PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
 PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
 PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
+PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
+PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
 
 do_configure_prepend() {
 	olddir=$(pwd)
@@ -90,7 +93,7 @@ PACKAGES =+ "${PN}-libs ${PN}-libs-dev ${PN}-libs-dbg"
 FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
 FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
 FILES_${PN}-libs-dbg = "${libdir}/${BPN}/.debug"
-FILES_${PN}-staticdev = "${libdir}/${BPN}/libtest/*.a"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
 INSANE_SKIP_${PN}-libs = "dev-so"
 RDEPENDS_${PN} += "${PN}-libs"
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
deleted file mode 100644
index 73609af..0000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require syslog-ng.inc
-
-SRC_URI += " \
-    file://fix-a-memory-leak-in-log_driver_free.patch \
-    file://fix-config-libnet.patch \
-    file://fix-invalid-ownership.patch \
-    file://Fix-the-memory-leak-problem-for-mutex.patch \
-    file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
-    file://configure.patch \
-    file://dbifix.patch \
-    file://syslog-ng.service-the-syslog-ng-service.patch \
-"
-
-SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
-SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb
new file mode 100644
index 0000000..91a0e46
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb
@@ -0,0 +1,11 @@
+require syslog-ng.inc
+
+SRC_URI += " \
+    file://fix-config-libnet.patch \
+    file://fix-invalid-ownership.patch \
+    file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
+    file://syslog-ng.service-the-syslog-ng-service.patch \
+"
+
+SRC_URI[md5sum] = "acf14563cf5ce435db8db35486ce66af"
+SRC_URI[sha256sum] = "84b081f6e5f98cbc52052e342bcfdc5de5fe0ebe9f5ec32fe9eaec5759224cc5"
-- 
2.9.0


