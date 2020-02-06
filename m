Return-Path: <Yi.Zhao@windriver.com>
X-Greylist: delayed 2279 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 12:00:04 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7950E60849
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 12:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 016BM6NM025265
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Feb 2020 03:22:06 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 6 Feb 2020 03:22:06 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Feb 2020 19:22:03 +0800
Message-ID: <20200206112203.29320-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-networking][PATCH] freeradius: upgrade 3.0.19 -> 3.0.20
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
X-List-Received-Date: Thu, 06 Feb 2020 12:00:04 -0000
Content-Type: text/plain

* Drop backported patch:
  0001-su-to-radiusd-user-group-when-rotating-logs.patch

* Disable python2 module build and add PACKAGECONFIG for python3 module
  build

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...python3-add-PY_INC_DIR-in-search-dir.patch |  58 ++++++++++
 ...adiusd-user-group-when-rotating-logs.patch | 104 ------------------
 ...eradius_3.0.19.bb => freeradius_3.0.20.bb} |  35 +++---
 3 files changed, 77 insertions(+), 120 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.19.bb => freeradius_3.0.20.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
new file mode 100644
index 000000000..d63023162
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
@@ -0,0 +1,58 @@
+From 733330888fff49e4d2b6c2121a6050fdd9f11a87 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 6 Feb 2020 09:32:04 +0800
+Subject: [PATCH] rlm_python3: add PY_INC_DIR in search dir
+
+The configure option --with-rlm-python3-include-dir is used to set
+PY_INC_DIR which is never used and it fails to find Python.h,
+so add it into search dir to fix it.
+
+Also remove SMART_LIBS from mod_flags because it introduces rpath
+to LDFALGS which causes a do_package_qa error:
+
+ERROR: freeradius-3.0.20-r0 do_package_qa: QA Issue: package freeradius-python contains bad RPATH
+/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/recipe-sysroot-native/usr/lib/python3.8/config in file
+/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/packages-split/freeradius-python/usr/lib/rlm_python3.so.0.0.0
+package freeradius-python contains bad RPATH
+/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/recipe-sysroot-native/usr/lib/python3.8/config in file
+/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/packages-split/freeradius-python/usr/lib/rlm_python3.so.0.0.0 [rpaths]
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_python3/configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
+index a00320f..adbdf19 100644
+--- a/src/modules/rlm_python3/configure.ac
++++ b/src/modules/rlm_python3/configure.ac
+@@ -95,7 +95,7 @@ if test x$with_[]modname != xno; then
+ 
+ 		old_CFLAGS=$CFLAGS
+ 		CFLAGS="$CFLAGS $PY_CFLAGS"
+-		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION"
++		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION $PY_INC_DIR"
+ 		FR_SMART_CHECK_INCLUDE(Python.h)
+ 		CFLAGS=$old_CFLAGS
+ 
+@@ -114,13 +114,13 @@ if test x$with_[]modname != xno; then
+ 
+ 		eval t=\${ac_cv_lib_${sm_lib_safe}_${sm_func_safe}}
+ 		if test "x$t" = "xyes"; then
+-			mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS $SMART_LIBS -lm"
++			mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS -lm"
+ 			targetname=modname
+ 		else
+ 			FR_SMART_CHECK_LIB(python${PY_SYS_VERSION}m, Py_Initialize)
+ 			eval t=\${ac_cv_lib_${sm_lib_safe}_${sm_func_safe}}
+ 			if test "x$t" = "xyes"; then
+-				mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS $SMART_LIBS -lm"
++				mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS -lm"
+ 				targetname=modname
+ 			else
+ 				targetname=
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
deleted file mode 100644
index 5859dc7ed..000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 1f233773962bf1a9c2d228a180eacddb9db2d574 Mon Sep 17 00:00:00 2001
-From: Alexander Scheel <ascheel@redhat.com>
-Date: Tue, 7 May 2019 16:04:29 -0400
-Subject: [PATCH] su to radiusd user/group when rotating logs
-
-The su directive to logrotate ensures that log rotation happens under the
-owner of the logs. Otherwise, logrotate runs as root:root, potentially
-enabling privilege escalation if a RCE is discovered against the
-FreeRADIUS daemon.
-
-Signed-off-by: Alexander Scheel <ascheel@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/1f233773962bf1a9c2d228a180eacddb9db2d574]
-
-CVE: CVE-2019-10143
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- debian/freeradius.logrotate  | 3 +++
- redhat/freeradius-logrotate  | 1 +
- scripts/logrotate/freeradius | 3 +++
- suse/radiusd-logrotate       | 1 +
- 4 files changed, 8 insertions(+)
-
-diff --git a/debian/freeradius.logrotate b/debian/freeradius.logrotate
-index 7d837d5..a8d29b7 100644
---- a/debian/freeradius.logrotate
-+++ b/debian/freeradius.logrotate
-@@ -9,6 +9,7 @@
- 	notifempty
- 
- 	copytruncate
-+	su freerad freerad
- }
- 
- # (in order)
-@@ -26,6 +27,7 @@
- 	notifempty
- 
- 	nocreate
-+	su freerad freerad
- }
- 
- # There are different detail-rotating strategies you can use.  One is
-@@ -45,4 +47,5 @@
- 	notifempty
- 
- 	nocreate
-+	su freerad freerad
- }
-diff --git a/redhat/freeradius-logrotate b/redhat/freeradius-logrotate
-index 360765d..bb97ca5 100644
---- a/redhat/freeradius-logrotate
-+++ b/redhat/freeradius-logrotate
-@@ -9,6 +9,7 @@ rotate 4
- missingok
- compress
- delaycompress
-+su radiusd radiusd
- 
- #
- #  The main server log
-diff --git a/scripts/logrotate/freeradius b/scripts/logrotate/freeradius
-index 3de435e..eecf631 100644
---- a/scripts/logrotate/freeradius
-+++ b/scripts/logrotate/freeradius
-@@ -17,6 +17,7 @@
- 	notifempty
- 
- 	copytruncate
-+	su radiusd radiusd
- }
- 
- # (in order)
-@@ -34,6 +35,7 @@
- 	notifempty
- 
- 	nocreate
-+	su radiusd radiusd
- }
- 
- # There are different detail-rotating strategies you can use.  One is
-@@ -53,4 +55,5 @@
- 	notifempty
- 
- 	nocreate
-+	su radiusd radiusd
- }
-diff --git a/suse/radiusd-logrotate b/suse/radiusd-logrotate
-index 24d56be..be5a797 100644
---- a/suse/radiusd-logrotate
-+++ b/suse/radiusd-logrotate
-@@ -11,6 +11,7 @@ missingok
- compress
- delaycompress
- notifempty
-+su radiusd radiusd
- 
- #
- #  The main server log
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
index 888743306..a9c2fad0f 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
@@ -26,12 +26,12 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x; \
     file://freeradius-fix-quoting-for-BUILT_WITH.patch \
     file://freeradius-fix-error-for-expansion-of-macro.patch \
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
-    file://0001-su-to-radiusd-user-group-when-rotating-logs.patch \
+    file://0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
 
-SRCREV = "ab4c767099f263a7cd4109bcdca80ee74210a769"
+SRCREV = "d94c953ab9602a238433ba18533111b845fd8e9e"
 
 PARALLEL_MAKE = ""
 
@@ -61,9 +61,11 @@ EXTRA_OECONF = " --enable-strict-dependencies \
         --without-rlm_sql_iodbc \
         --without-rlm_sql_oracle \
         --without-rlm_sql_sybase \
+        --without-rlm_sql_mongo \
         --without-rlm_sqlhpwippool \
         --without-rlm_securid \
         --without-rlm_unbound \
+        --without-rlm_python \
         ac_cv_path_PERL=${bindir}/perl \
         ax_cv_cc_builtin_choose_expr=no \
         ax_cv_cc_builtin_types_compatible_p=no \
@@ -86,7 +88,7 @@ PACKAGECONFIG[unixodbc] = "--with-rlm_sql_unixodbc,--without-rlm_sql_unixodbc,un
 PACKAGECONFIG[postgresql] = "--with-rlm_sql_postgresql,--without-rlm_sql_postgresql,postgresql"
 PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
 PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --with-rlm_perl,--without-rlm_perl,perl-native perl,perl"
-PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
+PACKAGECONFIG[python3] = "--with-rlm_python3 --with-rlm-python3-bin=${STAGING_BINDIR_NATIVE}/python3-native/python3 --with-rlm-python3-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python3,python3-native python3"
 PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
 PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl"
@@ -145,23 +147,24 @@ do_install() {
     rm -f ${D}/${sbindir}/rc.radiusd
     chmod +x ${D}/${sysconfdir}/init.d/radiusd
     rm -rf ${D}/${localstatedir}/run/
+    rm -rf ${D}/${localstatedir}/log/
     install -m 0644 ${WORKDIR}/volatiles.58_radiusd  ${D}${sysconfdir}/default/volatiles/58_radiusd
 
     chown -R radiusd:radiusd ${D}/${sysconfdir}/raddb/
     chown -R radiusd:radiusd ${D}/${localstatedir}/lib/radiusd
 
     # For systemd
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/radiusd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-           -e 's,@SBINDIR@,${sbindir},g' \
-           -e 's,@STATEDIR@,${localstatedir},g' \
-           -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_unitdir}/system/radiusd.service
-
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/radiusd.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+            -e 's,@SBINDIR@,${sbindir},g' \
+            -e 's,@STATEDIR@,${localstatedir},g' \
+            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_unitdir}/system/radiusd.service
+
         install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/radiusd.conf
     fi
 }
 
@@ -171,7 +174,7 @@ pkg_postinst_${PN} () {
     if [ -z "$D" ]; then
         if command -v systemd-tmpfiles >/dev/null; then
             # create /var/log/radius, /var/run/radiusd
-            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/radiusd-volatiles.conf
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/radiusd.conf
         elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
             ${sysconfdir}/init.d/populate-volatile.sh update
         fi
@@ -210,9 +213,9 @@ FILES_${PN}-perl = "${libdir}/rlm_perl.so* \
     ${sysconfdir}/raddb/mods-available/perl \
 "
 
-FILES_${PN}-python = "${libdir}/rlm_python.so* \
-    ${sysconfdir}/raddb/mods-config/python \
-    ${sysconfdir}/raddb/mods-available/python \
+FILES_${PN}-python = "${libdir}/rlm_python3.so* \
+    ${sysconfdir}/raddb/mods-config/python3 \
+    ${sysconfdir}/raddb/mods-available/python3 \
 "
 
 FILES_${PN}-mysql = "${libdir}/rlm_sql_mysql.so* \
-- 
2.17.1


